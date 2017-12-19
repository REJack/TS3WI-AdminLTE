module.exports = function(grunt) {

  var colors = ['black', 'black-light', 'blue', 'blue-light', 'green', 'green-light', 'purple', 'purple-light', 'red', 'red-light', 'yellow', 'yellow-light'];
  var copy_output = [];

  colors.forEach(function (element, index){
    copy_output.push({
        [element]: {
          expand: true,
          path: ['BASE/**'],
          dest: 'f_'+element+'/',
        }
    });
  });

  grunt.initConfig({
    move: {
      assets: {
        src: 'assets',
        dest: 'BASE/assets/'
      },
      other: {
        src: ['*.tpl', 'README.md', 'package.json', 'LICENSE'],
        dest: 'BASE/'
      }
    },
    copy: copy_output
  });


  grunt.loadNpmTasks('grunt-move');
  grunt.loadNpmTasks('grunt-contrib-copy');

  grunt.registerTask('default', ['move', 'copy']);
};