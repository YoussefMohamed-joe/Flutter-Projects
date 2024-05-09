
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_states.dart';
import 'package:charity_app/features/presentaion/views/organizations/org_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  late List<String> searchItems = List.generate(OrgCubit.newModel.results!, (index) {
    return OrgCubit.newModel.data!.organizations![index].name!;
  }).toList();
  String? search;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCubit, OrgStates>(
      builder: (context, state) {
        if (state is OrgSuccessState) {
          return Scaffold(
            backgroundColor: AppColors.boneWhite,
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Gap(40),
                  Text('إحسان', style: getehsan(color: AppColors.black)),
                  const Gap(20),
                 
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(
                                Icons.menu,
                                size: 22,
                                color: AppColors.dgrey,
                              ),
                              const Gap(15),
                              Expanded(
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.dgrey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: searchItems
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: search,
                          onChanged: (String? value) {
                            for(int i =0; i<OrgCubit.newModel.results!;i++){
                              if(OrgCubit.newModel.data!.organizations![i].name == value){
                                AppLocalStorage.cashData('OrgIndex', i);
                                navigateTo(context, const OrgView());
                              }
                            }
                            setState(() {
                              search = value;
                            });
                          },
                          iconStyleData: IconStyleData(
                            icon: const Icon(
                              Icons.search,
                            ),
                            iconSize: 25,
                            iconEnabledColor: AppColors.dgrey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.boneWhite,
                            ),
                          ),
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 70,
                            width: 335,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/pp.png'),
                      )
                    ],
                  ),
                  const Gap(10),
                  Expanded(
                    child: GridView.builder(
                      
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 130,
                    ), itemCount: OrgCubit.newModel.results,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppLocalStorage.cashData('OrgIndex', index);
                          navigateTo(context, const OrgView());
                        },
                        child: Container(
                          height: 130,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network('${OrgCubit.newModel.data!.organizations![index].coverImage}'),
                        ),
                      );
                    },),
                  )
                  
                  
                ],
              ),
            )),
          );
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
