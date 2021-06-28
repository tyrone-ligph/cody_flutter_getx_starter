/// List of parameters passed by `--dart-define` at runtime.
class DartDefines {
  /// Environment type used in [Env].The acceptable values are:
  ///
  /// - develop
  /// - staging
  /// - production
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'develop',
  );

  // static const String lastCommitHash = String.fromEnvironment(
  //   'GIT_COMMIT_HASH',
  //   defaultValue: '',
  // );
}
