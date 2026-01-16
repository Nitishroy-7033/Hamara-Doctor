import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:developer';

class ProfileController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  final userData = <String, dynamic>{}.obs;
  final isLoading = true.obs;

  // Mock data for appointments and reports since we haven't built those yet
  final completedAppointments = 12.obs;
  final pendingAppointments = 2.obs;
  final reportsCount = 5.obs;
  final savedDocuments = <Map<String, String>>[
    {'title': 'Blood Test Report', 'date': '12 Oct 2025'},
    {'title': 'Prescription - Dr. Smith', 'date': '05 Nov 2025'},
    {'title': 'X-Ray Report', 'date': '20 Dec 2025'},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    if (user == null) return;
    try {
      isLoading.value = true;
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      if (doc.exists) {
        userData.value = doc.data()!;
      }
    } catch (e) {
      log("Error fetching user profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }
}
