<?php if($button_type != 'confirm'){ ?>
<?php if($comment_status){ ?>
		<?php if($comment_label){ ?>
		<label><?php echo $comment_label; ?></label>
		<?php } ?>
		<textarea name="comment" class="form-control margin-b10" placeholder="<?php echo $comment_placeholder; ?>"><?php echo $comment; ?></textarea>
<?php } ?>
	<?php if($text_agree){ ?>
    <div class="margin-b10">
		<?php if ($agree) { ?>
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" <?php echo $checkout_terms; ?> name="agree" value="1" />
		<?php } ?>
		<?php echo $text_agree; ?>
	<?php  } ?>
    </div>
<?php } ?>

        <?php if($button_type == 'register') { ?>
		<div class="confirm-btn-holder">
        <button <?php if($button_type != 'confirm' && !$shopping_button_status){ ?> style="width:100%";  <?php } ?> <?php if (!empty($redirect)) { ?> disabled="disabled" <?php } ?> class="btn btn-contrast btn-block" rel="register" id="button-register"><?php echo $button_checkout_order; ?></button>

		<?php } else if($button_type == 'guest') { ?>
        <div class="confirm-btn-holder">
        <button <?php if($button_type != 'confirm' && !$shopping_button_status){ ?> style="width:100%";  <?php } ?> <?php if (!empty($redirect)) { ?> disabled="disabled" <?php } ?> class="btn btn-contrast btn-block" rel="guest" id="button-guest"><?php echo $button_checkout_order; ?></button>

		<?php } else if($button_type == 'login') { ?>
		<div class="confirm-btn-holder">
        <button <?php if($button_type != 'confirm' && !$shopping_button_status){ ?> style="width:100%";  <?php } ?> <?php if (!empty($redirect)) { ?> disabled="disabled" <?php } ?> class="btn btn-contrast btn-block button-login" rel="login" id="button-checkout-order"><?php echo $button_checkout_order; ?></button>

		<?php } else if($button_type == 'logged'){ ?>
        <div class="confirm-btn-holder">
		<button <?php if($button_type != 'confirm' && !$shopping_button_status){ ?> style="width:100%";  <?php } ?>  <?php if (!empty($redirect)) { ?> disabled="disabled" <?php } ?> class="btn btn-contrast btn-block btn-lg" rel="loggedorder" id="button-loggedorder"><?php echo $button_checkout_order; ?></button>

		<?php } else if($button_type == 'confirm') { ?>
		<?php if (empty($redirect)) { ?>
			<?php echo $payment; ?>
			<script type="text/javascript"><!--
				<?php if($button_type == 'confirm') { ?>
					<?php if($autotrigger){ ?>
					$('<?php echo $payment_trigger_button; ?>').trigger('click');
					<?php }else{ ?>
					<?php if($selectedtriggers == 'cod'){ ?>
					$('<?php echo $payment_trigger_button; ?>').trigger('click');
					<?php } ?>
					<?php } ?>
				<?php } ?>
			//--></script>
		<?php }else{ ?>
		<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
		<?php } ?>
		<?php } ?>

        <?php if($button_type != 'confirm' && $shopping_button_status){ ?>
		<a href="<?php echo $continue; ?>" class="btn btn-primary btn-block" style="margin-top:10px;background-color: #30222200;border-color: #b80000;color: #b80000;""><?php echo $button_shopping; ?></a>
		<?php } ?>
		</div><!--confirm-btn-holder ends -->

<script><!--
$('#onepagecheckout textarea[name="comment"]').on('keyup',function(){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/confirm/comment',
		dataType: 'json',
		type: 'post',
		data: $('#onepagecheckout textarea[name="comment"]'),
		success: function(json){

		}
	});
});
$('#onepagecheckout input[name="agree"]').on('click',function(){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/confirm/ordertrem',
		dataType: 'json',
		type: 'post',
		data: $('#onepagecheckout input[name="agree"]:checked'),
		success: function(json){

		}
	});
});
//--></script>