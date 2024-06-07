import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileTextFields extends StatefulWidget {
  const EditProfileTextFields(
      {Key? key, required this.textEditingController, required this.labelText, this.validator, this.readonly=false})
      : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String?)? validator;
  final bool readonly;

  @override
  _EditProfileTextFieldsState createState() => _EditProfileTextFieldsState();
}

class _EditProfileTextFieldsState extends State<EditProfileTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readonly,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:widget. validator,
      controller: widget.textEditingController,
      style: TextStyle(fontSize: 12.sp),
      decoration: InputDecoration(
        labelText: widget.labelText,
        isDense: true,
      ),
    );
  }
}
