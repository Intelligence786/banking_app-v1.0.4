import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/data_manager.dart';
import 'package:flutter/material.dart';

import '../../data/models/wallet_model.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/income_bloc.dart';
import 'widgets/incomegrid_item_widget.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {

  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider<IncomeBloc>(
        create: (context) => IncomeBloc(IncomeState(
          incomeModelObj: DataManager.data.categories,
        ))
          ..add(IncomeInitialEvent()),
        child: Container(
          padding: EdgeInsets.only(
            right: 16.h,
            left: 16.h,
          ),
          child: _buildIncomeGrid(context),
        ),
      ),

    );

    // bottomNavigationBar: _buildTabBar(context),
  }

  /// Section Widget
  Widget _buildIncomeGrid(BuildContext context) {
    return BlocSelector<IncomeBloc, IncomeState, List<IncomeModel>?>(
      selector: (state) => state.incomeModelObj,
      builder: (context, incomeModelObj) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 176.v,
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: incomeModelObj?.length ?? 0,
          itemBuilder: (context, index) {
            IncomeModel model = incomeModelObj?[index] ??
                IncomeModel(id: 0, name: '', icon: '', incomeHistory: []);
            return IncomegridItemWidget(
              model,
            );
          },
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_income".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
