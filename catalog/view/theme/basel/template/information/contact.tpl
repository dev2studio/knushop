<?php echo $header; ?>

<!-- <?php if ($basel_map_lat & $basel_map_lon && $basel_map_style == "full_width") { ?>
<div id="gmap" class="map-full-width">
    <div class="address-holder col-sm-5 col-md-4 col-lg-3">
    <h3 class="contrast-heading"><?php echo $store; ?></h3>
    <p><?php echo $address; ?></p>
    <a class="uline_link to_form"><?php echo $heading_title; ?></a>
    </div>
</div>
<?php } ?> -->

<!-- <div class="container"> -->
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    </ul>
    <!-- <div class="row"> -->
        <!-- <?php if ($basel_map_lat & $basel_map_lon && $basel_map_style == "inline") { ?>
        <div id="gmap" class="col-sm-12 map-inline"></div>
        <?php } ?> -->


        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-md-9 col-sm-8'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
<div class="container">
    <div class="row">


     <div id="content" class="<?php echo $class; ?>" style="min-height: 400px !important;">
            <h1 id="page-title" style="margin-bottom: 8px;"><?php echo $heading_title; ?></h1>
            <div style="width: 150px;">
                <p style="border-bottom: 2px solid #b80000;font-weight: normal; margin-bottom: 12px;"></p>
            </div>
    <div class="contacts-wrapper">
        <div class="contacts-left">
            <?php echo $content_top; ?>
        </div>
        <div class="contacts-map">
            <div id="map-box" class="map-box">
            </div>
        </div>
        <div class="contacts-right">
            <?php echo $content_bottom; ?>
        </div>
    </div>

    <div class="create-message">
        <button class="btn create-message__btn"><i class="fa fa-envelope" aria-hidden="true"></i><?php echo $text_create_message; ?></button>

        <div class="message-form__box">
            <form id="js_message-form" class="message-form" name="message">
                <div class="message-form__item" id="js_message-form__name_valid">
                    <label for="js_message-form__name"><?php echo $entry_name; ?></label>
                    <input id="js_message-form__name" type="text" pattern="[^0-9]{2,40}" minlength="2" maxlength="40" class="form-control" name="name" placeholder="<?php echo $text_message_form__name; ?>" required>
                </div>

                <div class="message-form__item" id="js_message-form__mail_valid">
                    <label for="js_message-form__mail"><?php echo $entry_email; ?></label>
                    <input id="js_message-form__mail" type="email" class="form-control" name="mail" placeholder="<?php echo $text_message_form__mail; ?>" required>
                </div>

                <div class="message-form__item" id="js_message-form__text_valid">
                    <label for="js_message-form__text"><?php echo $entry_enquiry; ?></label>
                    <div id="counter-block"><span id="js_error_counter">0</span>/500</div>
                    <textarea id="js_message-form__text" class="form-control" minlength="10" maxlength="500" name="text" placeholder="<?php echo $text_message_form__text; ?>" required></textarea>
                </div>

                <p class="message-form__agreement"><?php echo $text_message_form__agreement; ?> <a href="/terms-of-use-and-privacy" class="transition"><?php echo $text_message_form__agreement_link; ?></a></p>

                <button class="btn message-form__submit" type="submit"><?php echo $button_submit; ?></button>
            </form>
        </div>
    </div>
        </div>
    </div>
</div>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrVKTDP8d-2D4alqAh5R3R5OeW9dYINJo&callback=initMap"></script>


<script>
// Add message form after click
$(document).ready(function(){
  $(".create-message__btn").click(function () {
    $(".create-message__btn").fadeOut(300, function () {
      $(".message-form__box").fadeIn(300);
    });
  });
});

// Symbols counter for message form
$(function() {
    $(document).ready(function() {
        var $textarea = '#js_message-form__text'; 
        var $counter = '#js_error_counter';
        $($textarea).on('blur, keyup', function() {
            var $max = 500;
            var $val = $(this).val();
            $(this).attr('maxlength', $max);
            if( $val.length <= 0 ) {
                $($counter).html(0);
            } else {
                if( $max < parseInt( $val.length ) ) {
                    $this.val( $val.substring(0, $max) ); 
                }
                $($counter).html( $(this).val().length );
            }
        });
  });
});


// Message form validation
$(document).ready(function(){
    if($("#js_message-form").length>0) {
        (function() {
            var input = document.getElementById('js_message-form__name');
            var formitem = document.getElementById('js_message-form__name_valid');
            var elem = document.createElement('div');
            elem.id = 'notify';
            elem.style.display = 'none';
            formitem.appendChild(elem);
            input.addEventListener('invalid', function(event){
                event.preventDefault();
                if ( ! event.target.validity.valid ) {
                    input.className = 'form-control invalid swing-validation';
                    elem.textContent = '<?php echo $text_error_name; ?>';
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

        (function() {
            var input = document.getElementById('js_message-form__mail');
            var formitem = document.getElementById('js_message-form__mail_valid');
            var elem = document.createElement('div');
            elem.id = 'notify';
            elem.style.display = 'none';
            formitem.appendChild(elem);
            input.addEventListener('invalid', function(event){
                event.preventDefault();
                if ( ! event.target.validity.valid ) {
                    input.className = 'form-control invalid swing-validation';
                    elem.textContent = '<?php echo $text_error_email; ?>';
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

        (function() {
            var input = document.getElementById('js_message-form__text');
            var formitem = document.getElementById('js_message-form__text_valid');
            var elem = document.createElement('div');
            elem.id = 'notify';
            elem.style.display = 'none';
            formitem.appendChild(elem);
            input.addEventListener('invalid', function(event){
                event.preventDefault();
                if ( ! event.target.validity.valid ) {
                    input.className = 'form-control invalid swing-validation';
                    elem.textContent = '<?php echo $text_error_enquiry; ?>';
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
    }
});
</script>

<!-- <?php if (!empty($basel_map_style)) { ?>
<script>
	$(document).ready(function() {
		new Maplace({
			locations: [
				{
					lat: <?php echo $basel_map_lat; ?>,
					lon: <?php echo $basel_map_lon; ?>,
				}
			],
			controls_on_map: true,
			start: 1,
			map_options: {
				zoom: 15,
				scrollwheel: false}
		}).Load();

		<?php if ($basel_map_lat & $basel_map_lon && $basel_map_style == "full_width") { ?>
		$('body').addClass('full-width-map');
		<?php } ?>

	});
</script>
<?php } ?>

<script>
	$(document).ready(function() {
$(".to_form").click(function() {
    $('html, body').animate({
        scrollTop: ($(".form-vertical").offset().top - 200)
    }, 1000);
});
});
</script> -->

<?php echo $footer; ?>