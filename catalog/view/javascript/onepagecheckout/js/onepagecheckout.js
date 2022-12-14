// Load Confirmation
function LoadConfirmation(account_type){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/confirm',
		dataType: 'html',
		type: 'post',
		data: 'account_type='+ account_type,
		success: function(html) {
			$('#onepagecheckout .confirm-order-content').html(html);
		}
	});
}

//Load Checkout Page
function LoadCheckoutpage(){
	$.ajax({
		type: 'GET',
		url: 'index.php?route=extension/onepagecheckout/checkout',
		complete: function (data) {
			$('#onepagecheckout').html($("#onepagecheckout", data.responseText).html());
			LoadCart();
			LoadPaymentMethod();
			LoadShippingMethod();
			var account_type = ($('#onepagecheckout input[name=\'account_type\']:checked').val()) ? $('#onepagecheckout input[name=\'account_type\']:checked').val() : '';
			LoadConfirmation(account_type);
		}
	});
}

// Load Payment Method
function LoadPaymentMethod(logged){
	if(!logged){
		var postdata = $('#account input[type=\'text\'], #account input[type=\'checkbox\']:checked, #account input[type=\'radio\']:checked, #account input[type=\'hidden\'], #account select');
		var url = 'index.php?route=extension/onepagecheckout/payment_method&type=personal_details';
	}else{
		var postdata = $('.payment-details-content input[type=\'text\'],.payment-details-content input[type=\'checkbox\']:checked, .payment-details-content input[type=\'radio\']:checked, .payment-details-content input[type=\'hidden\'],.payment-details-content select');
		var url = 'index.php?route=extension/onepagecheckout/payment_method&type=payment_details';
	}
	
	$.ajax({
		url:url,
		type:'post',
		data:postdata,
		dataType: 'html',
		beforeSend: function() {
              $('#onepagecheckout .content-payment-method').addClass('loading');
           },
		success: function(html) {
			setTimeout(function () {
			$('#onepagecheckout .content-payment-method').removeClass('loading');
			$('#onepagecheckout .payment-method-content').html(html);
			}, 400);
		}
	});
}

// Load Delivery Method
function LoadShippingMethod(){
	if($("input[name='personal_details[shipping_address]']:checked").val()){
		var postdata = $('#account input[type=\'text\'], #account input[type=\'checkbox\']:checked, #account input[type=\'radio\']:checked, #account input[type=\'hidden\'], #account select, input[name=\'shipping_method\']:checked');
		var url = 'index.php?route=extension/onepagecheckout/shipping_method&type=personal_details';
	}else{
		var postdata = $('.delivery-details-content input[type=\'text\'],.delivery-details-content input[type=\'checkbox\']:checked, .delivery-details-content input[type=\'radio\']:checked, .delivery-details-content input[type=\'hidden\'],.delivery-details-content select, input[name=\'shipping_method\']:checked');
		var url = 'index.php?route=extension/onepagecheckout/shipping_method&type=delivery_details';
	}

	$.ajax({
		url:url,
		type:'post',
		data:postdata,
		dataType: 'html',
		beforeSend: function() {
              $('#onepagecheckout .content-delivery-method').addClass('loading');
           },
		success: function(html) {
			setTimeout(function () {
			$('#onepagecheckout .content-delivery-method').removeClass('loading');
			$('#onepagecheckout .delivery-method-content').html(html);
			}, 500);
		}
	});
}

// Load Cart
function LoadCart(){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/cart',
		dataType: 'html',
		type: 'post',
		data: $('#onepagecheckout input[name=\'account_type\']:checked'),
		beforeSend: function(){
			$('#onepagecheckout .content-shopping-cart').addClass('loading');
		},
		success: function(html){
			setTimeout(function () {
			$('#onepagecheckout .content-shopping-cart').removeClass('loading');
			$('#onepagecheckout .shopping-cart-content').html(html);
			}, 500);
		}
	});
}

function LoadCartWithoutloader(){
	$.ajax({
		url: 'index.php?route=extension/onepagecheckout/cart',
		dataType: 'html',
		type: 'post',
		data: $('#onepagecheckout input[name=\'account_type\']:checked'),
		success: function(html){
			$('#onepagecheckout .shopping-cart-content').html(html);
		}
	});
}

+function ($) {
  'use strict';

  // ALERT CLASS DEFINITION
  // ======================

  var dismiss = '[data-dismiss="extalert"]'
  var Alert   = function (el) {
    $(el).on('click', dismiss, this.close)
  }

  Alert.VERSION = '3.3.5'

  Alert.TRANSITION_DURATION = 150

  Alert.prototype.close = function (e) {
    var $this    = $(this)
    var selector = $this.attr('data-target')

    if (!selector) {
      selector = $this.attr('href')
      selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') // strip for ie7
    }

    var $parent = $(selector)

    if (e) e.preventDefault()

    if (!$parent.length) {
      $parent = $this.closest('.extalert')
    }

    $parent.trigger(e = $.Event('close.bs.extalert'))

    if (e.isDefaultPrevented()) return

    $parent.removeClass('in')

    function removeElement() {
      // detach from parent, fire event then clean up data
      $parent.detach().trigger('closed.bs.extalert').remove()
    }

    $.support.transition && $parent.hasClass('fade') ?
      $parent
        .one('bsTransitionEnd', removeElement)
        .emulateTransitionEnd(Alert.TRANSITION_DURATION) :
      removeElement()
  }


  // ALERT PLUGIN DEFINITION
  // =======================

  function Plugin(option) {
    return this.each(function () {
      var $this = $(this)
      var data  = $this.data('bs.extalert')

      if (!data) $this.data('bs.extalert', (data = new Alert(this)))
      if (typeof option == 'string') data[option].call($this)
    })
  }

  var old = $.fn.alert

  $.fn.alert             = Plugin
  $.fn.alert.Constructor = Alert


  // ALERT NO CONFLICT
  // =================

  $.fn.alert.noConflict = function () {
    $.fn.alert = old
    return this
  }


  // ALERT DATA-API
  // ==============

  $(document).on('click.bs.extalert.data-api', dismiss, Alert.prototype.close)

}(jQuery);