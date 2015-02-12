$('.flash_messages').html('<%= j render "application/messages" %>')
$('.flash_messages').show()
$('#new_article input[type=text]').val('')
setTimeout(function(){
    $('.flash_messages').hide()
}, 3000)
