$(function(){
  function buildHTML(message){
    let html = `<div class="messages__contents__content__main__box">
    <div class="messages__contents__content__main__box__top">
      <div class="messages__contents__content__main__box__top__image"></div>
      <div class="messages__contents__content__main__box__top__name">${message.user_nickname}</div>
    </div>
    <div class="messages__contents__content__main__box__bottom">${message.text}</div>
  </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }) 
    .done(function(message){
      let html = buildHTML(message);
      $('.messages__contents__content__main').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert("エラー");
    })
  })
})