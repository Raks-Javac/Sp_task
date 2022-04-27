import 'package:estate_project/src/core/base/base_view_model/b_vm.dart';
import 'package:estate_project/src/core/utils/constants.dart';
import 'package:estate_project/src/ui/shared/loaders/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({Key? key, required this.vmBuilder, required this.builder})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized && viewModel.isLoading == true
          ? Container(
              color: ColorsTexStyleStore.kTriviaScaffoldBackground,
              child: const Center(child: Loader()))
          : Stack(
              children: [
                widget.builder(context, viewModel),
                Visibility(
                  visible: viewModel.isLoading,
                  child: const Center(
                    child: Center(child: Loader()),
                  ),
                )
              ],
            );
}
