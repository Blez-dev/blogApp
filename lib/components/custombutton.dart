import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;



   CustomButton({

    super.key,
     required this.text,
     required this.onPressed,
     required this.color,
     required this.textColor

   });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348 ,
      height: 50,
      child: ElevatedButton(onPressed: onPressed
        ,style: ElevatedButton.styleFrom(
              backgroundColor: color,

            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(68)
            )
          ),
           child: Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.w500,fontFamily: "Poppins",fontSize: 16),)
      ),
    );
  }
}
