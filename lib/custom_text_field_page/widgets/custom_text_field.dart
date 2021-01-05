import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFieldController extends GetxController {
  final textController = TextEditingController();

  final _text = ''.obs;
  set text(value) => this._text.value = value;
  get text => this._text.value;

  final _isEnabled = true.obs;
  set isEnabled(value) => this._isEnabled.value = value;
  get isEnabled => this._isEnabled.value;

  final _isTextVisible = true.obs;
  set isTextVisible(value) => this._isTextVisible.value = value;
  get isTextVisible => this._isTextVisible.value;

  final _isLoading = false.obs;
  set isLoading(value) => this._isLoading.value = value;
  get isLoading => this._isLoading.value;

  final _hasError = false.obs;
  set hasError(value) => this._hasError.value = value;
  get hasError => this._hasError.value;

  final _errorMessage = ''.obs;
  set errorMessage(value) => this._errorMessage.value = value;
  get errorMessage => this._errorMessage.value;

  toggleTextVisibility() =>
      this._isTextVisible.value = !this._isTextVisible.value;

  toggleFieldEnable() => this._isEnabled.value = !this._isEnabled.value;

  clearText() {
    this._text.value = '';
    textController.text = '';
  }
}

class CustomTextFieldOptions {
  TextStyle textStyle;
  InputBorder border;
  EdgeInsets padding;
  Widget suffix;
  List<TextInputFormatter> inputFormatters;

  CustomTextFieldOptions({
    this.textStyle,
    this.border,
    this.padding,
    this.suffix,
    this.inputFormatters,
  });
}

class CustomTextField extends StatelessWidget {
  final CustomTextFieldOptions options;
  final CustomTextFieldController fieldController;
  final Function(String) onChanged;
  final String title;

  const CustomTextField({
    Key key,
    this.options,
    this.fieldController,
    this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: GetX<CustomTextFieldController>(
            init: fieldController,
            tag: title,
            builder: (controller) => TextField(
              controller: controller.textController,
              onChanged: (text) => onChanged(text),
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (controller.isLoading)
                        ? CircularProgressIndicator()
                        : (controller.hasError)
                            ? Icon(
                                Icons.close,
                                color: Colors.red,
                              )
                            : SizedBox.shrink(),
                    options?.suffix
                  ],
                ),
                contentPadding: EdgeInsets.all(10),
                border: options?.border,
                hintStyle: options?.textStyle,
                errorText:
                    (controller.hasError) ? controller.errorMessage : null,
              ),
              obscureText: !controller.isTextVisible,
              inputFormatters: options?.inputFormatters,
            ),
          ),
        ),
      ],
    );
  }
}
