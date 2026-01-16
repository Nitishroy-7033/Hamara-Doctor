import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final qualificationController = TextEditingController();
  final photoUrlController = TextEditingController();
  final addressController = TextEditingController();

  final isDoctor = false.obs;
  final isLoading = false.obs;

  void register() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill required fields (Name, Email, Password)",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (isDoctor.value) {
      if (phoneController.text.isEmpty ||
          qualificationController.text.isEmpty ||
          addressController.text.isEmpty) {
        Get.snackbar(
          "Error",
          "Please fill all doctor-related fields",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
    }

    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final userData = {
        'uid': userCredential.user!.uid,
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'role': isDoctor.value ? 'doctor' : 'patient',
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (isDoctor.value) {
        userData.addAll({
          'phone': phoneController.text.trim(),
          'qualification': qualificationController.text.trim(),
          'photoUrl': photoUrlController.text.trim(),
          'address': addressController.text.trim(),
          'isVerified': false, // Doctors might need verification
        });
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userData);

      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Registration Failed",
        e.message ?? "Unknown error",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    qualificationController.dispose();
    photoUrlController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
