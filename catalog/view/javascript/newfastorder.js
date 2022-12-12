function quickorder_confirm() {
	var success = 'false';
		$('#callback_url').val(window.location.href);
		$.ajax({
			url: 'index.php?route=extension/module/newfastorder',
			type: 'post',
			data: $('#fastorder_data').serialize() + '&action=send',
			dataType: 'json',
			beforeSend: function() {
				$('#fastorder_data').addClass('maskPopupQuickorder');
				$('#fastorder_data').after('<span class="loading_quick_order"><i class="fa fa-circle-o-notch fa-spin fa-2x fa-fw"></i></span>');
			},
			success: function(json) {
				$('#contact-name').removeClass('error_input');
				$('#contact-phone').removeClass('error_input');
				$('#contact-comment').removeClass('error_input');
				$('#contact-email').removeClass('error_input');
				$('.loading_quick_order').remove();
				$('#fastorder_data').removeClass('maskPopupQuickorder');
				$('.text-danger').empty();
				if (json['error']) {
					if (json['error']['name_fastorder']) {
						$('#contact-name').attr('placeholder',json['error']['name_fastorder']);
						$('#contact-name').addClass('error_input');
					}
					if (json['error']['phone']) {
						$('#contact-phone').attr('placeholder',json['error']['phone']);
						$('#contact-phone').addClass('error_input');
					}
					if (json['error']['comment_buyer']) {
						$('#contact-comment').attr('placeholder',json['error']['comment_buyer']);
						$('#contact-comment').addClass('error_input');
					}
					if (json['error']['email_error']) {
						$('#contact-email').attr('placeholder',json['error']['email_error']);
						$('#contact-email').addClass('error_input');
					}
					if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('.option-error-'+ i).html(json['error']['option'][i]);
							}
					}

				}

				if (json['success']){
				$.magnificPopup.close();
				html  = '<div id="modal-addquickorder" class="modal fade">';
				html += '  <div class="modal-dialog quickorder__custom-modal">';
				html += '    <div class="modal-content quickorder__custom-modal__content">';
				html += '    	<div class="pulse-box">';
				html += '    		<span class="pulse">';
				html += '    			<i class="fa fa-check" aria-hidden="true"></i>';
				html += '    		</span>';
				html += '     	</div>';
				html += '      <div class="modal-body quickorder__custom-modal__disc">' + json['success'] + '</div>';
				html += '    <button type="button" class="close quickorder__custom-modal__close" data-dismiss="modal" aria-hidden="true">&times;</button>';
				html += '    </div>';
				html += '  </div>';
				html += '</div>';

				$('body').append(html);

				$('#modal-addquickorder').modal('show');
				}
			}

		});
		$.ajax({
			url: '/feedback/notice.php',
			type: 'post',
			data: $('#fastorder_data').serialize() + '&action=send',
			dataType: 'json',
			beforeSend: function() {
			},
			success: function(json) {
				if (json['error']) {
				}

				if (json['success']){
				}
			}
		});
}

function quickorder_confirm_checkout() {
	$('#quickorder_url').val(window.location.href);
	var success = 'false';
	$.ajax({
		url: 'index.php?route=extension/module/newfastordercart',
		type: 'post',
		data: $('#fastorder_data').serialize() + '&action=send',
		dataType: 'json',
		beforeSend: function() {
			$('#fastorder_data').addClass('maskPopupQuickorder');
			$('#fastorder_data').after('<span class="loading_quick_order"><i class="fa fa-circle-o-notch fa-spin fa-2x fa-fw"></i></span>');
		},
		success: function(json) {
			$('.loading_quick_order').remove();
			$('#fastorder_data').removeClass('maskPopupQuickorder');
			$('#contact-name').removeClass('error_input');
			$('#contact-phone').removeClass('error_input');
			$('#contact-comment').removeClass('error_input');
			$('#contact-email').removeClass('error_input');
			if (json['error']) {
				if (json['error']['name_fastorder']) {
					$('#contact-name').attr('placeholder',json['error']['name_fastorder']);
					$('#contact-name').addClass('error_input');
				}
				if (json['error']['phone']) {
					$('#contact-phone').attr('placeholder',json['error']['phone']);
					$('#contact-phone').addClass('error_input');
				}
				if (json['error']['comment_buyer']) {
					$('#contact-comment').attr('placeholder',json['error']['comment_buyer']);
					$('#contact-comment').addClass('error_input');
				}
				if (json['error']['email_error']) {
					$('#contact-email').attr('placeholder',json['error']['email_error']);
					$('#contact-email').addClass('error_input');
				}
				if (json['error']['comment_buyer']) {
					$('#error_comment_buyer').html(json['error']['comment_buyer']);
				}
			}

			if (json['success']){
				$.magnificPopup.close();
				html  = '<div id="modal-addquickorder" class="modal fade">';
				html += '  <div class="modal-dialog quickorder__custom-modal">';
				html += '    <div class="modal-content quickorder__custom-modal__content">';
				html += '    	<div class="pulse-box">';
				html += '    		<span class="pulse">';
				html += '    			<i class="fa fa-check" aria-hidden="true"></i>';
				html += '    		</span>';
				html += '     	</div>';
				html += '      <div class="modal-body quickorder__custom-modal__disc">' + json['success'] + '</div>';
				html += '    <button type="button" class="close quickorder__custom-modal__close" data-dismiss="modal" aria-hidden="true">&times;</button>';
				html += '    </div>';
				html += '  </div>';
				html += '</div>';

				$('body').append(html);

				$('#modal-addquickorder').modal('show');
			}
		}

	});
	$.ajax({
		url: '/feedback/notice.php',
		type: 'post',
		data: $('#fastorder_data').serialize() + '&action=send',
		dataType: 'json',
		beforeSend: function() {
		},
		success: function(json) {
			if (json['error']) {
			}

			if (json['success']){
			}
		}

	});
}
