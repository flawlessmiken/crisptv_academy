/// A value mapping the View UI to the state in the Model.
enum ViewState {
  /// When nothing is happening or just initialized

  idle,

  /// Typically shows a loading indicator of some sorts
  busy,

  /// Indicates that there's data available on the view
  dataFetched,

  /// Indicates that data was fetched successfully but nothing is available
  noDataAvailable,

  /// Indicates there's an error on the view
  error,

  /// Successful action occurred
  success,

  /// The starting state that a form view is in
  waitingForInput
}
