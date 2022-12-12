<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-affiliate" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>	
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-affiliate" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sendpulse_id"><?php echo $entry_sendpulse_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sendpulse_id" value="<?php echo $sendpulse_id; ?>" placeholder="<?php echo $entry_sendpulse_id; ?>" id="input-sendpulse_id" class="form-control" />
              <?php if ($error_sendpulse_id) { ?>
              <div class="text-danger"><?php echo $error_sendpulse_id; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sendpulse_secret"><?php echo $entry_sendpulse_secret; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sendpulse_secret" value="<?php echo $sendpulse_secret; ?>" placeholder="<?php echo $entry_sendpulse_secret; ?>" id="input-sendpulse_secret" class="form-control" />
              <?php if ($error_sendpulse_secret) { ?>
              <div class="text-danger"><?php echo $error_sendpulse_secret; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status-add"><?php echo $entry_status_add; ?></label>
            <div class="col-sm-10">
              <select name="sendpulse_auto_add" id="input-status-add" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>		  
		<?php if ($books) { ?>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-books-default"><?php echo $entry_book_default; ?></label>
			<div class="col-sm-10">
			  <select name="sendpulse_book_default" id="input-book-default" class="form-control">
				<option value=""><?php echo $text_select; ?></option>
				<?php foreach ($books as $book) { ?> 
				<option value="<?php echo $book->id; ?>" <?php echo ($book->id == $sendpulse_book_default?'selected':''); ?>><?php echo $book->name; ?></option>
				<?php } ?>							
			  </select>
			</div>
		  </div>
		<?php } ?>		  
        </form>
      </div>
    </div>
  </div>
  <?php if ($books) { ?>
	<div class="page-header">
		<div class = "container-fluid">
			<div class = "pull-right">
				 <button class = "btn btn-primary"  type="button" id='button_export'><?php echo $button_export; ?></button>
			</div>
			<h1><?php echo $heading_title; ?></h1>
		</div>
	</div>
	<div class="container-fluid" id='container-fluid-export'>
		<div class = "panel panel-default">
			<div class = "panel-heading">
				<h3 class = "panel-title"><?php echo $entry_export; ?></h3>
			</div>
			<div class = "panel-body">
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="input-books"><?php echo $entry_book; ?></label>
					<div class="col-sm-10">
					  <select name="book" id="input-book" class="form-control">
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($books as $book) { ?>
						<option value="<?php echo $book->id; ?>"><?php echo $book->name; ?></option>
						<?php } ?>							
					  </select>
					</div>
				  </div>				
			</div>
		</div>
	</div>
	<?php } ?>	
</div>
<script type="text/javascript"><!--
var change_key = false;
$(document).delegate('#button_export', 'click', function() {
	$('.alert').remove();
	if(change_key) $('#container-fluid-export').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_change; ?> <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
	else {
		var id_book = $('select[name^=\'book\']').val();
		if(id_book != ''){
			$.ajax({
				url: 'index.php?route=extension/module/sendpulse/export&token=<?php echo $token; ?>',
				type: 'post',
				data: 'book=' + id_book,
				dataType: 'json',
				beforeSend: function() {
					$('#button_export').button('loading');
				},
				complete: function() {
					$('#button_export').button('reset');
				},
				success: function(json) {

					if (json['error']) {
						$('#container-fluid-export').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}

					if (json['success']) {
						$('#container-fluid-export').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		} else $('#container-fluid-export').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_select_book; ?> <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
	}
		});

$("input[type='text']").bind("change", function() {
	change_key = true;
});
//--></script> 
<?php echo $footer; ?>