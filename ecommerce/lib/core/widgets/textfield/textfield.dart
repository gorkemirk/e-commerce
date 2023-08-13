import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class TextFieldCustomWidget extends ConsumerStatefulWidget {
  String label;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextFieldCustomWidget(
      {super.key, required this.label, required this.onSaved, this.validator});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends ConsumerState<TextFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextFormField(
          validator: widget.validator,
          onSaved: widget.onSaved,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            labelText: widget.label,
          ),
        ),
      ),
    );
  }
}
