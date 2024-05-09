class RegStates {}

class RegInitialState extends RegStates {}

class RegLoadingState extends RegStates {}

class RegSuccessState extends RegStates {}

class RegErrorState extends RegStates {
  final String error;
  RegErrorState({required this.error});
}

class LogStates {}

class LogInitialState extends LogStates {}

class LogLoadingState extends LogStates {}

class LogSuccessState extends LogStates {}

class LogErrorState extends LogStates {
  final String error;
  LogErrorState({required this.error});
}
