$(document).ready(function(){
  var table = $('.tasks').DataTable( {
    { "orderable": false, "targets": [5,6] }
  });
});