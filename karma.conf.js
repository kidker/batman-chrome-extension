// Karma configuration
// Generated on Mon Jun 03 2013 20:52:01 GMT-0400 (EDT)


// base path, that will be used to resolve files and exclude
basePath = '';


// list of files / patterns to load in the browser
files = [
  QUNIT,
  QUNIT_ADAPTER,

  'vendor/jquery.js',
  'vendor/batman.js',
  'vendor/batman.jquery.js',

  'dist/namespace.js',
  'dist/app/lib/*.js',
  'dist/app/models/*.js',
  'dist/app/controllers/*.js',

  'test/vendor/sinon.js',
  'test/vendor/sinon-qunit.js',
  'test/vendor/test_case.coffee',
  'test/vendor/model_test_case.coffee',

  'test/fixtures/*.coffee',
  'test/**/*.coffee'
];


// preprocessors
preprocessors = {
  '**/*.coffee': 'coffee'
};


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['progress'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['Chrome'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
