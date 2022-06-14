import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/view_model/view_model.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<FirstScreenViewModel>(
      vmBuilder: (context) => FirstScreenViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, FirstScreenViewModel viewModel) {
    return Scaffold(
        body: Column(
      children: const [],
    ));
  }
}
