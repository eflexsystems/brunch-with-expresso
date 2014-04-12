sysPath = require 'path'

startsWith = (string, substring) ->
  string.lastIndexOf(substring, 0) is 0

if process.env.NODE_ENV == 'production'
  emberRegex = /^(bower_components|vendor\/js\/(?!ember.js))/
else
  emberRegex = /^(bower_components|vendor\/js\/(?!ember.min.js))/

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
        indentation:
          value: 2
          level: "error"

  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': emberRegex
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        before: [
          'test/vendor/scripts/chai.js',
          'bower_components/jquery/dist/jquery.js',
          'bower_components/handlebars/handlebars.js',
          'bower_components/ember/ember.js',
          'bower_components/ember/ember.min.js',
          'vendor/js/swag.js',
          'bower_components/bootstrap/dist/js/bootstrap.js'
        ]
        after: [
          'test/vendor/scripts/adapter.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/vendor.css': /^(bower_components|vendor)/
        'stylesheets/app.css': /^app/
        'test/stylesheets/test.css': /^test/

      order:
        after: [
          'bower_components/bootstrap/dist/css/bootstrap.css',
          'vendor/css/font-awesome.css'
        ]

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

