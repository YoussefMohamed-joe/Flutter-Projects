import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/manager/Organisations/org_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgView extends StatefulWidget {
  const OrgView({super.key});

  @override
  State<OrgView> createState() => _OrgViewState();
}

class _OrgViewState extends State<OrgView> {
  int index = AppLocalStorage.getData('OrgIndex');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCubit, OrgStates>(
      builder: (context, state) {
        if (state is OrgSuccessState) {
           return Scaffold(
      backgroundColor: AppColors.boneWhite,
      appBar: AppBar(
        backgroundColor: AppColors.boneWhite,
        title: Text(OrgCubit.newModel.data!.organizations![index].name!, style: getheadline(color: AppColors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),);
        }
        else if (state is OrgLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.green),
            ),
          );
        } else if (state is OrgErrorState) {
          return Center(
            child: Text(
              state.error,
              style: getbody(),
            ),
          );
        }
        return const SizedBox();
      },
    );
   
  }
}