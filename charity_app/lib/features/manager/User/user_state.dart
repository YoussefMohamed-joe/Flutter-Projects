

class RegStates {}

class RegInitialState extends RegStates {}

class RegLoadingState extends RegStates {}

class RegSuccessState extends RegStates {}

class RegErrorState extends RegStates {
  final String error;
  RegErrorState({required this.error});
}