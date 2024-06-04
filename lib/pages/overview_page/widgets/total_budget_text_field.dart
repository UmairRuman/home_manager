import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBudgetTextField extends ConsumerStatefulWidget {
  const TotalBudgetTextField({super.key});

  @override
  ConsumerState<TotalBudgetTextField> createState(){    
    return _TotalBudgetTextFieldState();
  }
}

class _TotalBudgetTextFieldState extends ConsumerState<TotalBudgetTextField>{

  late TextEditingController controller;
  @override
  void initState() {    
    super.initState();
    controller = TextEditingController()..addListener(_totalBudgetFieldListener);
  }

  void _totalBudgetFieldListener() {
    ref.read(overviewPageProvider.notifier).updateFieldText(controller.text);
  }

  @override
  void dispose() {
    controller..removeListener(_totalBudgetFieldListener)..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);    
    return AppCommonField(
        width: width * 0.8,
        prefixIcon: Icons.attach_money,
        borderRadius: width * 0.04,
        controller: controller,
        inputTextColor: Colors.blue,
        textType: TextInputType.number,
        label: 'Total Budget');
  }  
}
