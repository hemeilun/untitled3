import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/view_model/common/login_view_model.dart';

import '../../../utils/color_util.dart';
import '../../widgets/custom_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          body: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(LoginViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
