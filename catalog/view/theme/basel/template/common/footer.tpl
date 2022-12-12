    <div class="container full-width">
    <?php echo $position_bottom_half; ?>
    </div>

    <div class="container">
    <?php echo $position_bottom; ?>
    </div>

    <div id="footer">
        <div class="container">
            <?php echo $footer_block_2; ?>
        </div>  <!-- .container end -->

        <?php if (isset($basel_copyright)) { ?>
        <div class="footer-copyright"><?php echo $basel_copyright; ?></div>
        <?php } ?>
    </div>


    

    </div><!-- <div class="outer-contain"></div>er ends -->

    <a class="scroll-to-top primary-bg-color hidden-sm hidden-xs" onclick="$('html, body').animate({scrollTop:0});"><i class="icon-arrow-right"></i></a>
    <div id="featherlight-holder"></div>


    <!-- Callback modal -->
    <div class="custom-overlay callback-modal">
      <div class="custom-modal" id="callback-modal">
        <div class="custom-modal__content">
          <p class="custom-modal__title"><?php echo $text_custom_modal__title; ?></p>
          <div class="custom-modal__line"></div>
          <p class="custom-modal__disc"><?php echo $text_custom_modal__disc; ?></p>
          <form id="js_callback-form" class="callback-form" name="callback">
            <div class="callback-form__item" id="js_callback-form__phone_valid">
              <input id="js_callback-form__phone" type="tel" pattern="\+38\s?[\(]{0,1}0[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" class="form-control" name="phone" placeholder="<?php echo $text_callback_form__phone; ?>" required>
            </div>
            <div class="callback-time">
              <div class="btn callback-time__btn" data-toggle="tooltip" data-placement="bottom" data-html="true" data-original-title="<?php echo $text_callback_time__btn_tooltip; ?>"><?php echo $text_callback_time__btn; ?> <i class="fa fa-clock-o" aria-hidden="true"></i></div>
              <div class="callback-time__show">
                <div class="callback-form__item" id="callback-time">
                  <input type="text" class="form-control" name="time" id="js_callback-form__time" placeholder="12:24"/>
                  &nbsp;&nbsp;<i class="fa fa-info-circle" aria-hidden="true" data-toggle="tooltip" data-placement="right" data-html="true" data-original-title="<?php echo $text_callback_time__worktime; ?>"></i>
                </div>
              </div>
            </div>
            <p class="callback-form__agreement"><?php echo $text_callback_form__agreement; ?> <a href="/terms-of-use-and-privacy" class="transition"><?php echo $text_callback_form__agreement_link; ?></a></p>
            <button class="btn callback-form__submit" type="submit"><?php echo $text_callback_form__submit; ?></button>
          </form>
        </div>
        <div class="custom-modal__close js_callback-modal__close">
          <span aria-hidden="true"><i class="icon-close"></i></span>
        </div>
      </div>
    </div>
    <!-- Callback succes modal -->
    <div class="custom-overlay callback-succes">
      <div class="custom-modal" id="callback-succes">
        <div class="custom-modal__content">
          <p class="custom-modal__title"><?php echo $text_succes_custom_modal__title; ?></p>
          <div class="pulse-box">
            <span class="pulse">
              <i class="fa fa-check" aria-hidden="true"></i>
            </span>
          </div>
          <p class="custom-modal__disc"><?php echo $text_succes_custom_modal__disc; ?></p>
          <button class="btn callback-succes__close"><?php echo $text_succes_custom_modal__ok; ?></button>
        </div>
      </div>
    </div>
    <!--Message succes modal -->
    <div class="custom-overlay message-succes">
      <div class="custom-modal" id="message-succes">
        <div class="custom-modal__content">
          <p class="custom-modal__title"><?php echo $text_message_succes_custom_modal__title; ?></p>
          <div class="pulse-box">
            <span class="pulse">
              <i class="fa fa-check" aria-hidden="true"></i>
            </span>
          </div>
          <p class="custom-modal__disc"><?php echo $text_message_succes_custom_modal__disc; ?></p>
          <button class="btn message-succes__close"><?php echo $text_succes_custom_modal__ok; ?></button>
        </div>
      </div>
    </div>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <script src="catalog/view/theme/basel/js/jquery.matchHeight.min.js"></script>
    <script src="catalog/view/theme/basel/js/countdown.js"></script>
    <script src="catalog/view/theme/basel/js/live_search.js"></script>
    <script src="catalog/view/theme/basel/js/featherlight.js"></script>
    <script src="/catalog/view/javascript/timedropper/timedropper.js"></script>
    <script src="/feedback/feedback.js"></script>
    <script src="/catalog/view/javascript/smooth.scroll.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Forms validation -->
    <script>
$(document).ready(function() {
    $('#shipping_address_oblast').select2();
    $('#shipping_address_gorod_novaya').select2();
    $('#shipping_address_otdeleniya').select2();
      
});

if($('div').is('.oe_cod')){

  setInterval(function(){
    kwe();

    if($('div').is('.row-customer_field26')){
       $('#simplecheckout_comment').append('<div class="jekOPE"><div class="jekOPE2"><input type="hidden" name="customer[field26][Неперезванивать]" value="0"><input type="checkbox" name="customer[field26][Неперезванивать]" id="customer_field26_0" onchange="kkew()" data-ej="0" value="1" data-reload-payment-form="true" class="custom-checkbox" ><label for="customer_field26_0">Так</label> <span>'+$('.row-customer_field26 .control-label').html()+'</span></div></div>');
      $('.simplecheckout-block-content .row-customer_field26').remove();
    }

     
  },200);
 


    //  $('.oe_cod').css('display','none');


kwe();
     function kwe(){
 
      setTimeout(function(){

         var owe = $('#shipping_method_currentas').val();
          owe = owe.split('.');
          owe = owe[0];

          if(owe == 'flat'){
           $('.oe_xpayment').css('display','block');
          	$('.oe_cod').css('display','none');
          }else{
          	$('.oe_xpayment').css('display','none');
          	$('.oe_cod').css('display','block');
          }


          if($('.sdkweewe').attr('data-ej')=='1'){
            $('#customer_field26_0').prop('checked',true);
           }else{
             $('#customer_field26_0').prop('checked',false);
          }


      },600);

      

     }
}


function kkew(){
  var come = $('#comment').val();
  $('#comment').trigger('click');
     // this will contain a reference to the checkbox   
    if ($("#customer_field26_0").prop('checked') == true) {
  
        $('#comment').val(come+"\n"+$('.jekOPE2 span').html());
      
        $.get('https://knushop.com.ua/index.php?route=checkout/simplecheckout/abandoned');
        $.get('https://knushop.com.ua/index.php?route=common/simple_connector/human');
        $('.sdkweewe').attr('data-ej',1);
        $('#simplecheckout_button_cart').trigger('click');
    }else{
      var come = $('#comment').val();
      var eke = come.replace($('.jekOPE2 span').html(),'');
      $('#comment').val(eke);
      $.get('https://knushop.com.ua/index.php?route=checkout/simplecheckout/abandoned');
      $.get('https://knushop.com.ua/index.php?route=common/simple_connector/human');
      $('.sdkweewe').attr('data-ej',0);
      $('#simplecheckout_button_cart').trigger('click');

    } 

     
    
}

  $('#simplecheckout_comment').append('<div class="jekOPE"><div class="jekOPE2"><input type="hidden" name="customer[field26][Неперезванивать]" value="0"><input type="checkbox" name="customer[field26][Неперезванивать]" id="customer_field26_0" onchange="kkew()" value="1" data-ej="0"  data-reload-payment-form="true" class="custom-checkbox" ><label for="customer_field26_0">Так</label> <span>'+$('.row-customer_field26 .control-label').html()+'</span></div></div>');
       $('.simplecheckout-block-content .row-customer_field26').remove();
      // Callback form validation
      (function() {
        var input = document.getElementById('js_callback-form__phone');
        var formitem = document.getElementById('js_callback-form__phone_valid');
        var elem = document.createElement('div');
        elem.id = 'notify';
        elem.style.display = 'none';
        formitem.appendChild(elem);
        input.addEventListener('invalid', function(event){
          event.preventDefault();
          if ( ! event.target.validity.valid ) {
            input.className = 'form-control invalid swing-validation';
            elem.textContent = '<?php echo $callback_form__phone_valid; ?>: +38 (0XX) XXX-XX-XX';
            elem.className = 'notify-error';
            elem.style.display = 'block';
          }
        });
        input.addEventListener('input', function(event){
          if ( 'block' === elem.style.display ) {
            input.className = 'form-control';
            elem.style.display = 'none';
          }
        });
      })();
    </script>
    
    <!-- hide search modal after click -->
    <script>
      $(document).mouseup(function (e) {
        var container = $(".top-search");
        if (container.has(e.target).length === 0){
            $(".top-search").removeClass("opened");
        }
    });
    </script>

    <!-- Show subscribe form -->
    <script>
        $('.s-sub__btn').click(function () {
            $('.s-sub__btn').fadeOut(300, function () {
              $(".s-sub__form").fadeIn(300);
          });
        })
    </script>

    <!-- FB -->
    
<!-- Load Facebook SDK for JavaScript -->
      <div id="fb-root"></div>
      <script>
         window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v7.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_GB/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <!-- Your customer chat code -->
      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="1824764277537276"
  theme_color="#002147"
greeting_dialog_display=hide
  logged_in_greeting="Привіт! Чим я можу Вам допомогти?"
  logged_out_greeting="Привіт! Чим я можу Вам допомогти?">
      </div>
<!-- FB -->


    <?php if ($sticky_columns) { ?>
    <!-- Sticky columns -->
    <script>

    if ($(window).width() > 767) {
    $('#column-left, #column-right').theiaStickySidebar({containerSelector:$(this).closest('.row'),additionalMarginTop:<?php echo $sticky_columns_offset; ?>});
    }

      $( ".cart-name232" ).load("https://knushop.com.ua/black-knu-sticker span.cart-name1");
    </script>
    <?php } ?>

    <?php if ($view_cookie_bar) { ?>
    <!-- Cookie bar -->
    <div class="basel_cookie_bar">
        <div class="table">
            <div class="table-cell w100"><?php echo $basel_cookie_info; ?></div>
            <div class="table-cell button-cell">
                <a class="btn btn-tiny btn-light-outline" onclick="$(this).parent().parent().parent().fadeOut(400);"><?php echo $basel_cookie_btn_close; ?></a>
                <?php if (!empty($href_more_info)) { ?>
                <a class="more-info anim-underline light" href="<?php echo $href_more_info; ?>"><?php echo $basel_cookie_btn_more_info; ?></a>
                <?php } ?>
            </div>
        </div>
    </div>
    <?php } ?>
    
  


</body>
</html>