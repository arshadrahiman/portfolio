import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'I would love to hear from you! Whether it\'s for collaboration, job opportunities, or anything else, feel free to reach out.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Full Name Field
                _buildTextField(
                  label: 'Full Name',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                  onChanged: (value) => _name = value,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  label: 'Phone',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your Phone Number' : null,
                  onChanged: (value) => _name = value,
                ),
                SizedBox(height: 20),

                // Email Field
                _buildTextField(
                  label: 'Email Address',
                  validator: (value) => value!.isEmpty ||
                          !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)
                      ? 'Please enter a valid email address'
                      : null,
                  onChanged: (value) => _email = value,
                ),
                SizedBox(height: 20),

                // Message Field
                _buildTextField(
                  label: 'Message',
                  maxLines: 5,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your message' : null,
                  onChanged: (value) => _message = value,
                ),
                SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Send Message'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppTheme
                        .primaryBorderColor, // Button color like the dialog
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded button edges
                    ),
                    elevation: 5,
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build text fields with consistent styling
  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white
              .withOpacity(0.8), // Slightly more refined label color
          fontWeight: FontWeight.w500, // Semi-bold label for elegance
        ),
        filled: true,
        fillColor: Colors.grey[850], // Darker, more sophisticated background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              16), // Slightly more rounded for a soft feel
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 24), // More padding for luxury feel
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppTheme
                .moonRaker, // Maintain the teal border on focus for elegance
            width: 2.5, // Slightly thicker border on focus for emphasis
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color:
                Colors.transparent, // Use transparent border when not focused
            width: 1.5,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16, // Slightly larger hint text for better readability
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent, // More vibrant error message
          fontSize: 14,
          fontWeight:
              FontWeight.w500, // Bold error messages for better visibility
        ),
      ),
      style: TextStyle(
        color: Colors.white, // White text color for a clean look
        fontSize: 16, // Slightly larger text for better readability
        fontWeight: FontWeight.w400, // Regular font weight for a premium look
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
