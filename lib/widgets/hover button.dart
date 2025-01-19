
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final VoidCallback fnBtn; // Function type for onPressed
  final String buttonText; // String to hold the button text

  HoverButton({required this.fnBtn, required this.buttonText, Key? key})
      : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  Color _buttonColor = Colors.grey.withOpacity(0.3); // Default color
  Color _textColor = Colors.grey.withOpacity(0.3); // Default text color

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _buttonColor = AppTheme.primaryBorderColor; // Change to hover color
          _textColor = Colors.white; // Change text color on hover
        });
      },
      onExit: (_) {
        setState(() {
          _buttonColor =
              Colors.grey.withOpacity(0.3); // Revert to original button color
          _textColor =
              Colors.grey.withOpacity(0.9); // Revert to original text color
        });
      },
      child: ElevatedButton(
        onPressed: widget.fnBtn, // Correctly call the function
        child: Text(
          widget.buttonText, // Use the buttonText passed from the constructor
          style: TextStyle(color: _textColor),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey.withOpacity(0.9),
          backgroundColor: _buttonColor, // Use dynamic button color
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          shape: StadiumBorder(),
          elevation: 5,
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
