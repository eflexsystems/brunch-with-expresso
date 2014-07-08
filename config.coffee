sysPath = require 'path'

startsWith = (string, substring) ->
  string.lastIndexOf(substring, 0) is 0

if process.env.BRUNCH_ENV == 'production'
  noMatch         = /\b\B/
  testRegex       = noMatch
  vendorTestRegex = noMatch
  testCssRegex    = noMatch
  vendorJsRegex   = /^(bower_components|vendor\/js\/(?!ember.js|ember-data.js))/
else
  testRegex       = /^test[\\/](?!vendor)/
  vendorTestRegex = /^test[\\/](?=vendor)/
  testCssRegex    = /^test/
  vendorJsRegex   = /^(bower_components|vendor\/js\/(?!ember.min.js|ember-data.min.js))/

exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  server:
    path: 'server.coffee'

  plugins:
    coffeelint:
      pattern: /^app\/.*\.coffee$/
      options:
        max_line_length:
          value: 100
        no_interpolation_in_single_quotes:
          level: "error"
        no_stand_alone_at:
          level: "error"
        space_operators:
          level: "error"
        cyclomatic_complexity:
          value: 12
          level: "error"

  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': vendorJsRegex
        'test/javascripts/test.js': testRegex
        'test/javascripts/test-vendor.js': vendorTestRegex
      order:
        before: [
          'test/vendor/scripts/chai.js',
          'bower_components/jquery/dist/jquery.js',
          'bower_components/handlebars/handlebars.js',
          'vendor/js/ember.js',
          'vendor/js/ember.min.js'
        ]
        after: [
          'vendor/js/ember-data.js',
          'vendor/js/ember-data.min.js'
          'test/vendor/scripts/adapter.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/vendor.css': /^(bower_components|vendor)/
        'stylesheets/app.css': /^app/
        'test/stylesheets/test.css': testCssRegex

    templates:
      precompile: true
      root: 'app'
      joinTo: 'javascripts/app.js' : /^app/
      defaultExtension: 'emblem'
      paths:
        # If you don't specify jquery and ember there,
        # raw (non-Emberized) Handlebars templates will be compiled.
        jquery: 'bower_components/jquery/dist/jquery.min.js'
        ember: 'vendor/js/ember.min.js'
        handlebars: 'bower_components/handlebars/handlebars.js'
        emblem: 'node_modules/emblem/dist/emblem.js'

  conventions:
    ignored: (path) ->
      isStylusFile = sysPath.extname(path) == ".styl"
      startsWithUnderscore = startsWith sysPath.basename(path), '_'
      return isStylusFile && startsWithUnderscore

  overrides:
    production:
      plugins:
        autoReload: enabled: false

