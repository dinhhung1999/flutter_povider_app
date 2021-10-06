
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends FormField<String> {
  final TextEditingController? textEditingController;
  AppTextFormField({
    this.textEditingController,
    Key? key,
    String? title,
    String? initialValue,
    String? hint,
    int? maxLines = 1,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? textInputFormatter,
    Color? backgroundColor,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscureText = true,
    bool enabled = true,
    onTap,
    bool alwaysValidate = false,
    bool myAutoValidate = false,

  }
      ) : super(
    key: key,
    initialValue: initialValue,
    onSaved: onSaved,
    validator: validator,
      enabled: enabled,
      autovalidateMode: alwaysValidate?AutovalidateMode.always:myAutoValidate? AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
      builder: (field) {
      final state = field as AppTextFormFieldState;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          TextField(
            controller: state.textEditingController,
            // padding: const EdgeInsets.symmetric(
            //     vertical: 8, horizontal: 16
            // ),
            obscureText: isPassword ? obscureText : false,
            maxLines: maxLines,
            // placeholder: hint,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            },
            onEditingComplete: () {
              FocusScope.of(field.context).requestFocus(FocusNode());
              if(onEditingComplete != null) {
                onEditingComplete();
              }
            },
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(state.context).inputDecorationTheme)
                .copyWith(
              fillColor: Colors.white,
              hintStyle: Theme.of(state.context).textTheme.bodyText1!
                  .copyWith(color: enabled?Color(0xffd3d9df):Color(0xff111111)),
              hintText: hint ?? '',
              suffixIcon: isPassword
                  ? InkResponse(
                child: Icon(
                    obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color(0xffc4c4c4)),
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  state.setState(() {
                    obscureText = !obscureText;
                  });
                  onTap(obscureText);
                },
              )
                  : null,
              errorText: state.errorText,
              enabled: enabled,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14
            ),
            keyboardType: keyboardType,
            inputFormatters: textInputFormatter,
          ),
          if (field.hasError)
            Text(field.errorText!, style: Theme.of(field.context).inputDecorationTheme.errorStyle,),
        ],
      );
    }
  );

  @override
  AppTextFormFieldState createState() {
    return AppTextFormFieldState();
  }

}

class AppTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = (widget as AppTextFormField).textEditingController ?? TextEditingController(text: widget.initialValue);
  }
}
