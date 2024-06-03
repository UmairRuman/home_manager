import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/quantity_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_new_item_center_design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewExpenseItemDialog extends ConsumerWidget {
  const AddNewExpenseItemDialog({super.key});
  static const _dialogWidth = 0.85;
  static const _dialogHeight = 0.5;
  static const _dialogBorderRadius = 20.0;
  static const _nameHint = 'Item Name';
  static const _quantityHint = 'Quantity';
  static const _btnText = 'Add Item';
  static const _emptyFieldError = 'Field Cannot Be Empty';
  static const _nameFieldError = 'Only Alphabets!';
  static const _priceAndQuantityFieldError = 'Only Digits!';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final quantityProvider = ref.read(quantitiesProvider.notifier);
    const textStyle = TextStyle(color: Colors.white);
    return Center(
      child: SizedBox(
        width: width * _dialogWidth,
        height: height * _dialogHeight,
        child: Material(
          color: Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(_dialogBorderRadius)),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AddNewItemTextField(
                            fieldSize: 0.5,
                            keyBoardType: TextInputType.name,
                            lableText: _nameHint,
                            controller: quantityProvider.controllerForItemName,
                            validator: (value) {
                              if (quantityProvider
                                  .controllerForItemName.text.isEmpty) {
                                return _emptyFieldError;
                              } else {
                                if (value.isValidString()) {
                                  return null;
                                } else {
                                  return _nameFieldError;
                                }
                              }
                            }),
                      )),
                  Expanded(
                      flex: 2,
                      child: AddNewItemCenterDesign(
                        validator: (value) {
                          if (quantityProvider
                              .controllerForItemPrice.text.isEmpty) {
                            return _emptyFieldError;
                          } else {
                            if (value.isAValidNumber()) {
                              return null;
                            } else {
                              return _priceAndQuantityFieldError;
                            }
                          }
                        },
                      )),
                  Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: AddNewItemTextField(
                            fieldSize: 0.3,
                            keyBoardType: TextInputType.number,
                            lableText: _quantityHint,
                            controller:
                                quantityProvider.controllerForItemQuantity,
                            validator: (value) {
                              if (quantityProvider
                                  .controllerForItemPrice.text.isEmpty) {
                                return _emptyFieldError;
                              } else {
                                if (value.isAValidNumber()) {
                                  return null;
                                } else {
                                  return _priceAndQuantityFieldError;
                                }
                              }
                            }),
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            quantityProvider.resetControllers();
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          _btnText,
                          style: textStyle,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddNewItemTextField extends StatelessWidget {
  const AddNewItemTextField(
      {super.key,
      required this.lableText,
      required this.controller,
      required this.validator,
      required this.keyBoardType,
      required this.fieldSize});
  final String lableText;
  final TextEditingController controller;
  final FormFieldValidator<String?> validator;
  final TextInputType keyBoardType;
  final double fieldSize;

  static const _borders = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
    );
    final Size(:width) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * fieldSize,
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        style: textStyle,
        validator: validator,
        decoration: InputDecoration(
          border: _borders,
          enabledBorder: _borders,
          focusedBorder: _borders,
          helperText: '',
          labelText: lableText,
          labelStyle: textStyle,
        ),
      ),
    );
  }
}

extension Validation on String? {
  bool isValidString() {
    return this!.codeUnits.every((element) => _isAnAlphabet(element));
  }

  bool _isAnAlphabet(int codeUnit) {
    return (codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122);
  }

  bool isAValidNumber() {
    return this!.codeUnits.every((element) => _isADigit(element));
  }

  bool _isADigit(int codeUnit) {
    return codeUnit >= 48 && codeUnit <= 57;
  }
}
