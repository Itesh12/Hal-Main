import 'package:flutter/material.dart';

class AppDialog {
  final String title;
  final String subtitle;
  final String commonBtnText;
  final String leftBtnText;
  final String rightBtnText;
  final Color leftBtnColor;
  final Color rightBtnColor;
  final VoidCallback? commonBtnTap;
  final VoidCallback? leftBtnTap;
  final VoidCallback? rightBtnTap;
  final bool dismissible;

  AppDialog({
    required this.subtitle,
    this.title = 'Alert',
    this.dismissible = true,
    this.commonBtnTap,
    this.leftBtnTap,
    this.rightBtnTap,
    this.commonBtnText = 'Close',
    this.leftBtnText = 'Ok',
    this.rightBtnText = 'Close',
    this.leftBtnColor = Colors.green,
    this.rightBtnColor = Colors.red,
  });

  void showAlert(BuildContext context) {
    final Dialog dialogWithImage = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: commonBtnTap ?? () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40)),
              child: Text(commonBtnText),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) => dialogWithImage,
    );
  }

  void showOptionAlert(BuildContext context) {
    final Dialog dialogWithImage = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(subtitle)),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: leftBtnTap ?? () => Navigator.pop(context),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: Center(child: Text(leftBtnText)),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 0.5,
                  color: Colors.grey[300],
                ),
                Flexible(
                  child: InkWell(
                    onTap: rightBtnTap ?? () => Navigator.pop(context),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: Center(child: Text(rightBtnText)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) => dialogWithImage,
    );
  }
}
