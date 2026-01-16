import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  final String? id;
  final String name;
  final String qualification;
  final String specialty;
  final String photoUrl;
  final double rating;
  final int reviews;
  final String address;
  final String phone;
  final double distance; // For "Near me" simulation

  DoctorModel({
    this.id,
    required this.name,
    required this.qualification,
    required this.specialty,
    required this.photoUrl,
    required this.rating,
    required this.reviews,
    required this.address,
    required this.phone,
    this.distance = 0.0,
  });

  factory DoctorModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return DoctorModel(
      id: doc.id,
      name: data['name'] ?? '',
      qualification: data['qualification'] ?? '',
      specialty: data['specialty'] ?? 'General Physician',
      photoUrl: data['photoUrl'] ?? 'https://via.placeholder.com/150',
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviews: data['reviews'] ?? 0,
      address: data['address'] ?? '',
      phone: data['phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'qualification': qualification,
      'specialty': specialty,
      'photoUrl': photoUrl,
      'rating': rating,
      'reviews': reviews,
      'address': address,
      'phone': phone,
    };
  }
}
