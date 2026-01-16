import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/doctor_model.dart';
import 'dart:developer';

class HomeController extends GetxController {
  final topRatedDoctors = <DoctorModel>[].obs;
  final nearbyDoctors = <DoctorModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      isLoading.value = true;

      // Fetching from Firestore 'users' collection where role is 'doctor'
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'doctor')
          .get();

      final List<DoctorModel> doctors = snapshot.docs
          .map((doc) => DoctorModel.fromFirestore(doc))
          .toList();

      // For demonstration, we split or filter
      topRatedDoctors.assignAll(doctors.where((d) => d.rating >= 4.5).toList());

      nearbyDoctors.assignAll(doctors);
    } catch (e) {
      log("Error fetching doctors: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
