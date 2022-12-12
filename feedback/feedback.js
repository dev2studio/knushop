// Enable tooltips everywhere
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

// Mask for input id="tel"
window.addEventListener("DOMContentLoaded", function() {
  function setCursorPosition(pos, elem) {
    elem.focus();
    if (elem.setSelectionRange) elem.setSelectionRange(pos, pos);
    else if (elem.createTextRange) {
      var range = elem.createTextRange();
      range.collapse(true);
      range.moveEnd("character", pos);
      range.moveStart("character", pos);
      range.select()
    }
  }

  function mask(event) {
    var matrix = "+38 (0__) ___-__-__",
    i = 0,
    def = matrix.replace(/\D/g, ""),
    val = this.value.replace(/\D/g, "");
    if (def.length >= val.length) val = def;
    this.value = matrix.replace(/./g, function(a) {
      return /[_\d]/.test(a) && i < val.length ? val.charAt(i++) : i >= val.length ? "" : a
    });
    if (event.type == "blur") {
      if (this.value.length == 4) this.value = ""
    } else setCursorPosition(this.value.length, this)
};

if($("#js_callback-form__phone").length>0) {
  var input = document.querySelector("#js_callback-form__phone");
  input.addEventListener("input", mask, false);
  input.addEventListener("focus", mask, false);
  input.addEventListener("blur", mask, false);
}

});

// TimeDropper initialization
$("#js_callback-form__time").timeDropper(); 

// Replace time button of callback modal 
$(document).ready(function(){
  $(".callback-time__btn").click(function () {
    $(".callback-time__btn").fadeOut(300, function () {
      $(".callback-time__show").fadeIn(300);
    });
  });
});

//Modal callback
$(".js_callback").on('click', function(e){
  e.preventDefault();
  e.stopImmediatePropagation;
  var $this = $(this),
  modal = $($this).data("modal");
  $('#callback-modal').show();
  $("html").addClass("no-scroll");
  $(modal).parents(".custom-overlay").addClass("open");
  setTimeout( function(){
    $(modal).addClass("open");
  }, 350);
});

//Close modal_callback
$('.js_callback-modal__close').click(function() {
  $("#callback-modal").removeClass("open");
  setTimeout( function(){
    if ($(".gr__knushop_com_ua").hasClass("mobile-menu-open")) {
    }
    else {
      $("html").removeClass("no-scroll");
    }
    $('.callback-modal').removeClass("open");
    $('#callback-modal').hide();
    $(".callback-time__btn").show();
    $(".callback-time__show").hide();
  }, 350);
});

$(document).on('click', function(e){
  var target = $(e.target);
  if ($(target).hasClass("callback-modal")){
    $(target).find(".custom-modal").each( function(){
      $(this).removeClass("open");
    });
    setTimeout( function(){
      if ($(".gr__knushop_com_ua").hasClass("mobile-menu-open")) {
      }
      else {
        $("html").removeClass("no-scroll");
      }
      $('.callback-modal').removeClass("open");
      $('#callback-modal').hide();
      $(".callback-time__btn").show();
      $(".callback-time__show").hide();
    }, 350);
  }
});
//End close modal_callback

//Close modal_callback_succes
$('.callback-succes__close').click(function() {
 $("#callback-succes").removeClass("open");
 setTimeout( function(){
  if ($(".gr__knushop_com_ua").hasClass("mobile-menu-open")) {
  }
  else {
    $("html").removeClass("no-scroll");
  }
  $('.callback-modal').removeClass("open");
  $('.callback-succes').removeClass("open");
  $('#callback-succes').hide();
}, 350);
});

$(document).on('click', function(e){
  var target = $(e.target);
  if ($(target).hasClass("callback-succes")){
    $(target).find(".custom-modal").each( function(){
      $(this).removeClass("open");
    });
    setTimeout( function(){
      if ($(".gr__knushop_com_ua").hasClass("mobile-menu-open")) {
      }
      else {
        $("html").removeClass("no-scroll");
      }
      $('.callback-modal').removeClass("open");
      $('.callback-succes').removeClass("open");
      $('#callback-succes').hide();
    }, 350);
  }
});
//End close modal_callback_succes

// Ajax submit for modal_callback
$(document).ready(function() {
  $('#js_callback-form').submit(function() {
    if (document.callback.phone.value == '') {
      valid = false;
      return valid;
    }
    $.ajax({
      type: "POST",
      url: "/feedback/feedback.php",
      data: $(this).serialize()
    }).done(function() {
      $("#callback-modal").removeClass("open");
      setTimeout( function(){
        $('#callback-modal').hide();
        $('#callback-succes').show();
        $(".callback-succes").addClass("open");
        $('#callback-succes').addClass("open");
      }, 350);

      $(this).find('input').val('');
      $('#js_callback-form').trigger('reset');
      $(".callback-time__btn").show();
      $(".callback-time__show").hide();

    });
    return false;
  });
});
// End ajax submit for modal_callback

// Ajax submit for message
$(document).ready(function() {
  $('#js_message-form').submit(function() {
    if (document.message.name.value == '' | document.message.mail.value == '' | document.message.text.value == '' ) {
      valid = false;
      return valid;
    }
    $.ajax({
      type: "POST",
      url: "/feedback/message.php",
      data: $(this).serialize()
    }).done(function() {
      $("html").addClass("no-scroll");
      $(".message-succes").addClass("open");
      setTimeout( function(){
        $('#message-succes').show();
        $('#message-succes').addClass("open");
      }, 350);

      $(this).find('input').val('');
      $('#js_message-form').trigger('reset');
      $(".message-form__box").fadeOut(300, function () {
          $(".create-message__btn").fadeIn(300);
        });
    });
    return false;
  });
});
// End ajax submit for message

//Close modal_message_succes
$('.message-succes__close').click(function() {
 $("#message-succes").removeClass("open");
 setTimeout( function(){
  $("html").removeClass("no-scroll");
  $('.message-succes').removeClass("open");
  $('#callback-succes').hide();
}, 350);
});

$(document).on('click', function(e){
  var target = $(e.target);
  if ($(target).hasClass("message-succes")){
    $(target).find(".custom-modal").each( function(){
      $(this).removeClass("open");
    });
    setTimeout( function(){
      $("html").removeClass("no-scroll");
      $('.message-succes').removeClass("open");
      $('#callback-succes').hide();
    }, 350);
  }
});
//End close modal_message_succes

