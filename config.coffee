sysPath = require 'path'

startsWith = (string, substring) ->
  string.lastIndexOf(substring, 0) is 0

if process.env.NODE_ENV == 'production'
  emberRegex = /^(bower_components|vendor\/js\/(?!ember.js))/
else
  emberRegex = /^(bower_components|vendor\/js\/(?!ember.min.js))/

exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  plugins:
    coffeelint:
      pattern: /^app\/.*\.coffee$/
      options:
        max_line_length:
          value: 1000
        indentation:
          value: 2
          level: "error"

  appcache:
    staticRoot: '/'
    network: ['*']
    fallback: {}

  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': emberRegex
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        before: [
          'bower_components/jquery/jquery.js',
          'bower_components/jquery-migrate/jquery-migrate.min.js',
          'bower_components/handlebars/handlebars.js',
          'bower_components/ember/ember.js',
          'bower_components/ember/ember.min.js',
          'bower_components/bootstrap/dist/js/bootstrap.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/vendor.css': /^(bower_components|vendor)/
        'stylesheets/app.css': /^app\/styles/
        'test/stylesheets/test.css': /^test/

    templates:
      precompile: true
      root: 'app'
      joinTo: 'javascripts/app.js' : /^app/
      defaultExtension: 'emblem'
      paths:
        # If you don't specify jquery and ember there,
        # raw (non-Emberized) Handlebars templates will be compiled.
        jquery: 'bower_components/jquery/jquery.min.js'
        ember: 'vendor/js/ember.min.js'
        handlebars: 'bower_components/handlebars/handlebars.js'
        emblem: 'emblem.min.js'

  conventions:
    ignored: (path) ->
      isStylusFile = sysPath.extname(path) == ".styl"
      startsWithUnderscore = startsWith sysPath.basename(path), '_'
      return isStylusFile && startsWithUnderscore

