import 'package:flutter/material.dart';
import '../../AccountManagement/View/forgotPassword.dart';

class ForgotPasswordButton extends StatefulWidget {
  final Function onTap;
  final Function onAnimatinoEnd;
  final double elementsOpacity;
  const ForgotPasswordButton(
      {super.key,
        required this.onTap,
        required this.onAnimatinoEnd,
        required this.elementsOpacity});

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButton();
}

class _ForgotPasswordButton extends State<ForgotPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300),
      tween: Tween(begin: 1, end: widget.elementsOpacity),
      onEnd: () async {
        widget.onAnimatinoEnd();
      },
      builder: (_, value, __) => GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Opacity(
          opacity: value,
          child: Container(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgotPassword()),
                );},
                  child: Text("Forgot Password?",
                    style:TextStyle(fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}