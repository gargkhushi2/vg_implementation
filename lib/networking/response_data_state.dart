// This Dart file manages different states that can happen when app's view fetches data.
// ResponseDataState Class: Handles the actual data and state information.
// It can be in one of the ViewState states and includes:

// responseData: The actual data fetched.
// errorMessage: Message if there's an error.
// emptyDataMessage: Message if there's no data.
// viewState: Current state of view(loading, error, empty, or success).

enum ViewState {
  loading,
  error,
  empty,
  success,
}

class ResponseDataState<T> {
  final T? responseData;
  final String? errorMessage;
  final String? emptyDataMessage;
  final ViewState viewState;

  ResponseDataState(
      {this.responseData,
      this.errorMessage,
      this.emptyDataMessage,
      this.viewState = ViewState.loading});

  factory ResponseDataState.loading() => ResponseDataState(
        viewState: ViewState.loading,
      );

  factory ResponseDataState.success({required T? responseData}) =>
      ResponseDataState(
        responseData: responseData,
        viewState: ViewState.success,
      );

  factory ResponseDataState.error({required String? errorMessage}) =>
      ResponseDataState.error(
        errorMessage: errorMessage,
      );

  factory ResponseDataState.empty({required String? emptyDataMessage}) =>
      ResponseDataState.empty(
        emptyDataMessage: emptyDataMessage,
      );
}
