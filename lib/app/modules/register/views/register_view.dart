import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Account'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Join Hamara Doctor",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Fill in the details to get started",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 32),

              // Role Selector
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.isDoctor.value = false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: !controller.isDoctor.value
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: !controller.isDoctor.value
                                  ? [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                "Patient",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: !controller.isDoctor.value
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.isDoctor.value = true,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: controller.isDoctor.value
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: controller.isDoctor.value
                                  ? [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                "Doctor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.isDoctor.value
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              _buildTextField(
                controller: controller.nameController,
                label: "Full Name",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.emailController,
                label: "Email Address",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.passwordController,
                label: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              // Doctor Specific Fields
              Obx(
                () => Visibility(
                  visible: controller.isDoctor.value,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: controller.phoneController,
                        label: "Phone Number",
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: controller.qualificationController,
                        label: "Qualification (e.g. MBBS, MD)",
                        icon: Icons.school_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: controller.photoUrlController,
                        label: "Photo URL",
                        icon: Icons.image_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: controller.addressController,
                        label: "Clinic/Hospital Address",
                        icon: Icons.location_on_outlined,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
      ),
    );
  }
}
