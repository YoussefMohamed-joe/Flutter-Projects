import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/features/Model/organisations_model/organisations_model.dart';
import 'package:charity_app/features/manager/Organisations/org_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgCubit extends Cubit<OrgStates> {
  OrgCubit() : super(OrgInitialState());
  static late OrganisationsModel newModel;

  getOrg() {
    emit(OrgLoadingState());

    try {
      ApiServices.getOrg().then((value) {
      print('helloaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        newModel = value!;
        emit(OrgSuccessState());        
      });

    } catch (e) {
      emit(OrgErrorState(e.toString()));
    }
  }
}
