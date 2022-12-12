<?php if(!$redirect){ ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
	<button type="button" class="close" data-dismiss="extalert">&times;</button>
</div>
<?php } ?>
<div class="extcover">
<div class="exttable-responsive">
	<table class="exttable table table-bordered margin-b0">
		<thead>
			<tr>
				<?php $colspan = 0; ?>
				<?php if($show_product_name) { ?>
				<td class="text-left"><?php echo $column_name; ?></td>
				<?php $colspan += 1; ?>
				<?php } ?>
				<?php if($show_product_model) { ?>
				<td class="text-left hidden-xs hidden-sm"><?php echo $column_model; ?></td>
				<?php $colspan += 1; ?>
				<?php } ?>
				<?php if($show_product_quantity) { ?>
				<td class="text-left"><?php echo $column_quantity; ?></td>
				<?php $colspan += 1; ?>
				<?php } ?>
				<?php if($show_product_unit) { ?>
				<td class="text-right hidden-xs hidden-sm"><?php echo $column_price; ?></td>
				<?php $colspan += 1; ?>
				<?php } ?>
				<?php if($show_product_total_price) { ?>
				<td class="text-right w20"><?php echo $column_total; ?></td>
				<?php $colspan += 1; ?>
				<?php } ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($products as $product) { ?>
			<tr>

				<td class="text-left">
                <div class="table">
                <?php if($show_product_image) { ?>
				<?php if ($product['thumb']) { ?>
                <div class="table-cell v-top">
					<a href="<?php echo $product['href']; ?>"><img style="max-width:none;" class="hidden-xs hidden-sm" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
					<?php } ?>
                    </div>
				<?php } ?>
				<?php if($show_product_name) { ?>
                <div class="table-cell">
				<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					<?php if (!$product['stock']) { ?>
					<span class="text-danger">***</span>
					<?php } ?>
					<?php if ($product['option']) { ?>
					<?php foreach ($product['option'] as $option) { ?>
					<br />
					<small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					<?php } ?>
					<?php } ?>
					<?php if ($product['reward']) { ?>
					<br />
					<small><?php echo $product['reward']; ?></small>
					<?php } ?>
					<?php if ($product['recurring']) { ?>
					<br />
					<span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
					<?php } ?>
                    <br />
                    <a onclick="removeOnepageCart('<?php echo $product['cart_id']; ?>');" class="cart-remove"> <?php echo $button_remove; ?></a>
                    </div>
				<?php } ?>
                </div>
                </td>
				<?php if($show_product_model) { ?>
				<td class="text-left hidden-xs hidden-sm"><?php echo $product['model']; ?></td>
				<?php } ?>
				<?php if($show_product_quantity){ ?>
				<td class="text-left">
					<?php if ($qty_update_permission) { ?>
					<div class="qty-block">
                    <a class="extbtn-block minus" onclick="downOnepageCart('<?php echo $product['cart_id']; ?>');">-</a>
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" rel="<?php echo $product['cart_id']; ?>" class="form-control quantitybox" />
                    <a class="extbtn-block plus" onclick="upOnepageCart('<?php echo $product['cart_id']; ?>');">+</a>
					</div>
					<?php } else{ ?>
					<?php echo $product['quantity']; ?>
					<?php } ?>
				</td>
				<?php } ?>
				<?php if($show_product_unit) { ?>
				<td class="text-right hidden-xs hidden-sm"><?php echo $product['price']; ?></td>
				<?php } ?>
				<?php if($show_product_total_price) { ?>
				<td class="text-right"><?php echo $product['total']; ?></td>
				<?php } ?>
			</tr>
			<?php } ?>
			</tbody>
            </table>

            <?php if ($vouchers) { ?>
            <table class="exttable table table-bordered  margin-b0">
            <tbody>
			<?php foreach ($vouchers as $voucher) { ?>
			<tr>
				<td class="text-left"><?php echo $voucher['description']; ?>
                <br />
				<a onclick="removeOnepageCartVoucher('<?php echo $voucher['key']; ?>');" class="cart-remove"><small>  <?php echo $button_remove; ?></small></a>
                </td>
				<td class="text-right"><?php echo $voucher['amount']; ?></td>
			</tr>
			<?php } ?>
            </tbody>
            </table>
            <?php } ?>
            <div class="table-holder">
            <table class="table table-bordered total-list margin-b0">
            <tbody>
			<?php foreach ($totals as $total) { ?>
			<tr>
				<td><strong><?php echo $total['title']; ?>:</strong></td>
				<td class="text-right w45"><?php echo $total['text']; ?></td>
			</tr>
			<?php } ?>
			</tbody>
			</table>
            </div>

</div>

        <?php if ($coupon_module || $voucher_module || $reward_module) { ?>
		<div class="promo-fields">
		<div id="voucher-coupon-reward-error"></div>
		<?php echo $coupon_module; ?>
		<?php echo $voucher_module; ?>
		<?php echo $reward_module; ?>
        </div>
        <?php } ?>

</div>
<script type="text/javascript"><!--
$('#onepagecheckout .quantitybox').keypress(function(event) {
	var keycode = (event.keyCode ? event.keyCode : event.which);
	if(keycode == '13'){
		var key = $(this).attr('rel');
		var quantity = $('#onepagecheckout input[name=\'quantity['+ key +']\']').val();
		updatecart(key,quantity);
	}
});

$('#onepagecheckout .quantitybox').blur(function(){
	var key = $(this).attr('rel');
	var quantity = $('#onepagecheckout input[name=\'quantity['+ key +']\']').val();
	updatecart(key,quantity);
});

$('#onepagecheckout .quantityboxmb').blur(function(){
	var key = $(this).attr('rel');
	var quantity = $('#onepagecheckout input[name=\'quantitymb['+ key +']\']').val();
	updatecart(key,quantity);
});

function upOnepageCart(key){
	$('.tooltip').remove();
	var quantity = parseInt($('#onepagecheckout input[name=\'quantity['+ key +']\']').val())+1;
	updatecart(key,quantity);
}

function downOnepageCart(key){
	$('.tooltip').remove();
	var quantity = parseInt($('#onepagecheckout input[name=\'quantity['+ key +']\']').val())-1;
	if(quantity ==0){
		removeOnepageCart(key);
	}else{
		updatecart(key,quantity);
	}
}

function updatecart(key,quantity){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/cart/edit',
		type: 'post',
		data: 'key=' + key + '&quantity=' + quantity,
		dataType: 'json',
		beforeSend: function(){
			$('#onepagecheckout .content-shopping-cart').addClass('loading');
		},
		success: function(json){
			// Need to set timeout otherwise it wont update the total
			setTimeout(function (){
				$('#onepagecheckout .content-shopping-cart').removeClass('loading');
				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
			}, 400);

			<?php if($shipping){ ?>
			LoadShippingMethod();
			<?php } else { ?>
			LoadCartWithoutloader();
			<?php } ?>
			setTimeout(function(){
				<?php if($logged){ ?>
				LoadPaymentMethod(true);
				<?php }else{ ?>
				LoadPaymentMethod(false);
				<?php } ?>
				var account_type = ($('#onepagecheckout input[name=\'account_type\']:checked').val()) ? $('#onepagecheckout input[name=\'account_type\']:checked').val() : '';
				LoadConfirmation(account_type);
				$('#cart-content').load('index.php?route=common/cart/info #cart-content > *');
				$('.cart-total-items').html( json['total_items'] );
				$('.cart-total-amount').html( json['total_amount'] );
			},400);
		}
	});
}

function removeOnepageCart(key){
	if (confirm("<?php echo $alert_message; ?>") == true) {
	$.ajax({
		url: 'index.php?route=extension/basel/basel_features/remove_from_cart',
		type: 'post',
		data: 'key=' + key,
		dataType: 'json',
		beforeSend: function(){
			$('#onepagecheckout .content-shopping-cart').addClass('loading');
		},
		success: function(json) {
			// Need to set timeout otherwise it wont update the total
			setTimeout(function (){
				$('#onepagecheckout .content-shopping-cart').removeClass('loading');
				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
			}, 400);
			<?php if($shipping){ ?>
			LoadShippingMethod();
			<?php }else{ ?>
			LoadCartWithoutloader();
			<?php } ?>
			setTimeout(function(){
				<?php if($logged){ ?>
				LoadPaymentMethod(true);
				<?php }else{ ?>
				LoadPaymentMethod(false);
				<?php } ?>
				var account_type = ($('#onepagecheckout input[name=\'account_type\']:checked').val()) ? $('#onepagecheckout input[name=\'account_type\']:checked').val() : '';
				LoadConfirmation(account_type);
				$('#cart-content').load('index.php?route=common/cart/info #cart-content > *');
				$('.cart-total-items').html( json['total_items'] );
				$('.cart-total-amount').html( json['total_amount'] );
			},1000);
		}
	});
  }
}

function removeOnepageCartVoucher(key){
	if (confirm("<?php echo $alert_message; ?>") == true) {
		$.ajax({
			url: 'index.php?route=extension/basel/basel_features/remove_from_cart',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function(){
			$('#onepagecheckout .content-shopping-cart').addClass('loading');
		},
		success: function(json) {
			// Need to set timeout otherwise it wont update the total
			setTimeout(function (){
				$('#onepagecheckout .content-shopping-cart').removeClass('loading');
				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
			}, 400);
				<?php if($shipping){ ?>
					LoadShippingMethod();
				<?php }else{ ?>
					LoadCartWithoutloader();
				<?php } ?>
				setTimeout(function(){
					<?php if($logged){ ?>
					LoadPaymentMethod(true);
					<?php }else{ ?>
					LoadPaymentMethod(false);
					<?php } ?>
					var account_type = ($('#onepagecheckout input[name=\'account_type\']:checked').val()) ? $('#onepagecheckout input[name=\'account_type\']:checked').val() : '';
					LoadConfirmation(account_type);
					$('#cart-content').load('index.php?route=common/cart/info #cart-content > *');
				$('.cart-total-items').html( json['total_items'] );
				$('.cart-total-amount').html( json['total_amount'] );
			},500);
			}
		});
	}
}
//--></script>
<?php }else{ ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>