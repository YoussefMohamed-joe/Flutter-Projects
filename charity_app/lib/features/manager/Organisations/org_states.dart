class OrgStates {}

class OrgInitialState extends OrgStates {}

class OrgLoadingState extends OrgStates {}

class OrgSuccessState extends OrgStates {}

class OrgErrorState extends OrgStates {
  final String error;
  OrgErrorState(this.error);
}
