// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require marked
//= require_tree .


// Set default options except highlight which has no default
$(document).ready(function() {

  console.log("jquery ready");
  $("#wiki_body").on('keyup', function() {
      console.log("changed");
      $("#markdown_body").html(marked($("#wiki_body").val()));
  });
   console.log("jquery ready");
  $("#wiki_title").on('keyup', function() {
      console.log("changed");
      $("#markdown_title").html(marked($("#wiki_title").val()));

  });

});