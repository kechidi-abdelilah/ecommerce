import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    required bool obsu,
    required TextEditingController controller,
    required TextInputType inputType,
    Key? key,
  })  : _hintText = hintText,
        _inputType = inputType,
        _obsu = obsu,
        _controller = controller,
        super(key: key);

  final String _hintText;
  final bool _obsu;
  final TextEditingController _controller;
  final TextInputType _inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
          color: AppColor.placeholderBg, shape: StadiumBorder()),
      child: TextField(
        keyboardType: _inputType,
        controller: _controller,
        obscureText: _obsu,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _hintText,
            hintStyle: TextStyle(color: AppColor.placeholder),
            contentPadding: const EdgeInsets.only(left: 30)),
      ),
    );
  }
}
