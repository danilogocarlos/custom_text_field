import 'package:custom_text_field/custom_text_field_page/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldPage extends StatelessWidget {
  final controller = CustomTextFieldController();
  final controller2 = CustomTextFieldController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomTextField(
              title: '01',
              fieldController: controller,
              options: CustomTextFieldOptions(
                suffix: Obx(
                  () {
                    return IconButton(
                      icon: Icon(
                        controller.isTextVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                        color: controller.isTextVisible
                            ? Colors.amber
                            : Colors.grey,
                      ),
                      onPressed: () => controller.toggleTextVisibility(),
                    );
                  },
                ),
              ),
              onChanged: (text) {
                controller.text = text;
                if (text == 'erro') {
                  controller.hasError = true;
                  controller.errorMessage = 'Mensagem de erro';
                } else if (text == 'sucesso')
                  controller.hasError = false;
                else if (text == 'loading')
                  controller.isLoading = true;
                else {
                  controller.isLoading = false;
                  controller.hasError = false;
                  controller.errorMessage = '';
                }
              },
            ),
            CustomTextField(
              title: '02',
              fieldController: controller2,
              options: CustomTextFieldOptions(
                suffix: Obx(
                  () {
                    return IconButton(
                      icon: Icon(
                        Icons.backspace,
                        size: 18,
                        color:
                            controller2.text != '' ? Colors.amber : Colors.grey,
                      ),
                      onPressed: () => controller2.clearText(),
                    );
                  },
                ),
              ),
              onChanged: (text) => controller2.text = text,
            ),
            RaisedButton(
              child: Text('Print'),
              onPressed: () => print(controller.text),
            ),
            RaisedButton(
              child: Text('Print'),
              onPressed: () => print(controller2.text),
            )
          ],
        ),
      ),
    );
  }
}
