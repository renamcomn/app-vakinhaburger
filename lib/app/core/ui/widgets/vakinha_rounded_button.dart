import 'package:flutter/material.dart';

class VakinhaRoundedButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  const VakinhaRoundedButton({ Key? key, required this.label, required this.onPressed }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(label, style: TextStyle(color: Colors.grey, fontSize: 20)),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white
      ),
    );
  }
}