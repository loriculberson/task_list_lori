$(document).ready(function(){

  $(".checkbox").on('click', function(){
    if (this.checked) {
      var status = "Completed"
    } else {
      var status = "Incomplete"
    }
    var checkBox = $(this);
    $.ajax({
      type:'PATCH',
      url: '/lists/'+ checkBox.data('list-id') + '/tasks/' + checkBox.data('task-id'),
      data: { task: { status: status } }
    }).done(function(){
      checkBox.parents('tr').remove();
    })

  })
