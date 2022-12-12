<div class="input-group">
		<input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
		<span class="input-group-btn">
			<button type="button" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary"><?php echo $button_coupon; ?></button>
		</span>
	</div>

<script type="text/javascript"><!--
$('#onepagecheckout input[name=\'coupon\']').keypress(function(event) {
	var keycode = (event.keyCode ? event.keyCode : event.which);
	if(keycode == '13') {
		$('#button-coupon').trigger('click');
	}
});

$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();
			$('.text-danger').remove();

			if (json['error']){
				$('#voucher-coupon-reward-error').html('<p class="text-danger"> ' + json['error'] + '</p>');
			}

			if (json['redirect']) {
				// Load Cart
				LoadCart();
			}
		}
	});
});
//--></script>