module.exports = function(grunt) {

  var colors = ['black', 'black-light', 'blue', 'blue-light', 'green', 'green-light', 'purple', 'purple-light', 'red', 'red-light', 'yellow', 'yellow-light'];
  var copy_output = {};
  var compress_output = {};

  colors.forEach(function (element, index){
    copy_output[element] = {
      expand: true, 
      cwd: 'BASE/',
      src: ['**'],
      dest: element+'/',
      options: {
        process: function (content, srcpath) {
          return content.replace('skin-blue', 'skin-'+element);
        },
        noProcess: "!BASE/index.tpl"
      },
    };
    
    compress_output[element] = {
      options: {
        archive: function () {
          // The global value git.tag is set by another task
          return "adminlte_"+element + '.zip'
        }
      },
      files: [{
        expand: true,
        cwd: element+"/",
        src: ["**"],
        dest: "adminlte_"+element
      }]
    }
  });

  grunt.initConfig({
    pkg: grunt.file.readJSON( 'package.json' ),
    move: {
      assets: {
        src: 'assets',
        dest: 'BASE/'
      },
      other: {
        src: ['*.tpl', 'README.md', 'LICENSE'],
        dest: 'BASE/'
      }
    },
    copy: copy_output,
    compress: compress_output
  });


  grunt.loadNpmTasks('grunt-move');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-compress');

  grunt.registerTask('default', ['move', 'copy', 'compress']);
};
