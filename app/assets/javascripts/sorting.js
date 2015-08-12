$(document).ready(function(){
  var table = $('.tasks').DataTable( {
      "columnDefs": [
        { "orderable": false, "targets": [5,6] }
      ]
  });
});