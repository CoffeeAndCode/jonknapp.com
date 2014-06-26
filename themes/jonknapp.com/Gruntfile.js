module.exports = function(grunt) {

  grunt.initConfig({
    concat: {
      vendor: {
        options: {
          separator: '\n;'
        },
        src: [
          'bower_components/jquery/dist/jquery.min.js',
          'bower_components/lodash/dist/lodash.min.js',
          'bower_components/backbone/backbone.js',
        ],
        dest: 'source/js/vendor.js'
      }
    }
  });

  require('load-grunt-tasks')(grunt);

  grunt.registerTask('default', ['concat:vendor']);
};
