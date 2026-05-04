import 'package:arshad_dev/module/contact/controller/contact_controller.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ContactSection extends GetView<ContactController> {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 80),
      decoration: const BoxDecoration(
        color: Color(0xFF080808),
        image: DecorationImage(
          image: AssetImage('assets/images/noise.png'),
          fit: BoxFit.cover,
          opacity: 0.03,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: isMobile ? screenWidth * 0.95 : 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Glowing icon above title
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppTheme.primaryBorderColor,
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'get_in_touch'.tr,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'contact_desc'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[400],
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 50),
              
              // Glassmorphism Form Container
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.all(isMobile ? 24 : 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          if (!isMobile)
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    label: 'label_name'.tr,
                                    icon: Icons.person_outline,
                                    validator: (value) =>
                                        value!.isEmpty ? 'err_name'.tr : null,
                                    onChanged: (value) => controller.name.value = value,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: _buildTextField(
                                    label: 'label_phone'.tr,
                                    icon: Icons.phone_outlined,
                                    validator: (value) => value!.isEmpty
                                        ? 'err_phone'.tr
                                        : null,
                                    onChanged: (value) => controller.phone.value = value,
                                  ),
                                ),
                              ],
                            )
                          else ...[
                            _buildTextField(
                              label: 'label_name'.tr,
                              icon: Icons.person_outline,
                              validator: (value) =>
                                  value!.isEmpty ? 'err_name'.tr : null,
                              onChanged: (value) => controller.name.value = value,
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              label: 'label_phone'.tr,
                              icon: Icons.phone_outlined,
                              validator: (value) => value!.isEmpty
                                  ? 'err_phone'.tr
                                  : null,
                              onChanged: (value) => controller.phone.value = value,
                            ),
                          ],
                          const SizedBox(height: 20),
                          _buildTextField(
                            label: 'label_email'.tr,
                            icon: Icons.email_outlined,
                            validator: (value) => value!.isEmpty ||
                                    !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                        .hasMatch(value)
                                ? 'err_email'.tr
                                : null,
                            onChanged: (value) => controller.email.value = value,
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            label: 'label_message'.tr,
                            icon: Icons.message_outlined,
                            maxLines: 5,
                            validator: (value) =>
                                value!.isEmpty ? 'err_message'.tr : null,
                            onChanged: (value) => controller.message.value = value,
                          ),
                          const SizedBox(height: 40),
                          
                          // Custom Submit Button
                          _SubmitButton(onPressed: controller.submitForm),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    int maxLines = 1,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: maxLines == 1 ? Icon(icon, color: Colors.white.withValues(alpha: 0.4), size: 20) : null,
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: maxLines > 1 ? 20 : 16, 
          horizontal: maxLines > 1 ? 24 : 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppTheme.primaryBorderColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 13,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(
        () => InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isHovered.value 
                  ? [AppTheme.primaryBorderColor, AppTheme.primaryBorderColor.withValues(alpha: 0.8)]
                  : [AppTheme.primaryBorderColor.withValues(alpha: 0.8), AppTheme.primaryBorderColor.withValues(alpha: 0.6)],
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: isHovered.value
                  ? [
                      BoxShadow(
                        color: AppTheme.primaryBorderColor.withValues(alpha: 0.4),
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'btn_send'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
