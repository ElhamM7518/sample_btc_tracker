abstract class EnvironmentVariables {
  const EnvironmentVariables._();
  static const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.dev,
  );
  static const logLevel = String.fromEnvironment(
    'LOG_LEVEL',
    defaultValue: 'trace',
  );
}

abstract class Environment {
  const Environment._();

  static const dev = 'dev';
  static const staging = 'staging';
  static const test = 'test';
  static const production = 'production';
}
