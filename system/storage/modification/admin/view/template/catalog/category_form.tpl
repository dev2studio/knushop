<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">

			<button onclick="$('#content #apply').attr('value', '1'); $('#' + $('#content form').attr('id')).submit();" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
			
        <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_parent; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_parent; ?>" id="input-parent" class="form-control" />
                  <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
                  <?php if ($error_parent) { ?>
                  <div class="text-danger"><?php echo $error_parent; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="category-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($category_filters as $category_filter) { ?>
                    <div id="category-filter<?php echo $category_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category_filter['name']; ?>
                      <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $category_store)) { ?>
                        <input type="checkbox" name="category_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="category_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $category_store)) { ?>
                        <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_top; ?>"><?php echo $entry_top; ?></span></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <?php if ($top) { ?>
                      <input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
                      <?php } else { ?>
                      <input type="checkbox" name="top" value="1" id="input-top" />
                      <?php } ?>
                      &nbsp; </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-column"><span data-toggle="tooltip" title="<?php echo $help_column; ?>"><?php echo $entry_column; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="column" value="<?php echo $column; ?>" placeholder="<?php echo $entry_column; ?>" id="input-column" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
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
            </div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="category_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="category_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

			<input type="hidden" name="apply" id="apply" value="0">	
			
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
  <script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					category_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'path\']').val(item['label']);
		$('input[name=\'parent_id\']').val(item['value']);
	}
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#category-filter' + item['value']).remove();

		$('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>

<?php if (isset($seo_url_generator_status) && $seo_url_generator_status) { ?><!-- SEO URL Generator.Begin -->
<script type="text/javascript">

  var seo_url_generator_language = <?php echo $seo_url_generator_language; ?>;

  <?php if(stristr($_GET['route'], 'add')) { ?>

  $('#input-name' + seo_url_generator_language).change(function(){ generateUrlOnAdd(); });

  function generateUrlOnAdd() {
    data = {
      name       : $('#input-name' + seo_url_generator_language).val(),
      essence    : 'category',
      essence_id : ''
    };

    getSeoUrl(data);
  }

  <?php } else { ?>
  
  // enque button #generateUrlOnEdit
  var html = '';
  html += '<br><button id="generateUrlOnEdit" class="btn btn-success btn-sm"><i class="fa fa-refresh"></i> <?php echo $sug_button_generate; ?></button>';

  $('#input-keyword').after(html);

  // enque redirects #generateUrlOnEdit
  var html = '';
  html += '<div class="form-group">';
  html += '<label class="col-sm-2 control-label"><?php echo $sug_text_redirects; ?></label>';
  html += '<!-- category-redirects . begin -->';
  html += '<div class="col-sm-10">';
  html += '<div class="alert alert-info alert-sm"><?php echo $sug_help_redirects; ?></div>';
  html += '<div id="seo_url_generator_redirects">';
  <?php $redirect_row = 0; ?>
  <?php foreach ($redirects as $key => $redirect) { ?>
  html += '<div id="redirect-row-<?php echo $redirect_row; ?>" class="row redirect-row" style="margin: 10px 0;"><input type="text" name="seo_url_generator_redirects[<?php echo $key; ?>]" value="<?php echo $redirect; ?>" class="form-control input-sm col-xs-10" style="width: 100%; width: calc(100% - 120px); <?php echo (isset($error_seo_url_generator_redirects[$key])) ?	'border-color: red;' : ''; ?>" /><div class="col-xs-1"><i class="pull-left fa fa-close text-danger deleteRedirect" style="cursor: pointer;" data-toggle="tooltip" title="<?php echo $sug_button_delete_redirect; ?>"></i></div></div>';
  <?php $redirect_row++; ?>
  <?php } ?>	
  html += '</div>';
  html += '<!-- /category-redirects . end -->';
  html += '<button id="addNewRedirect" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i> <?php echo $sug_button_add_redirect; ?></button>';
  html += '</div>';
  html += '</div>';	
  
	<!-- Front works properly mark -->
  html += '<input type="hidden" name="seo_url_generator_front_works" />';
  
  $('#generateUrlOnEdit').parent().parent().after(html);

  $('#generateUrlOnEdit').click(function(e) {
    e.preventDefault();

    data = {
      name       : $('#input-name' + seo_url_generator_language).val(),
      essence    : 'category',
      essence_id : <?php echo $_GET['category_id']; ?>
    };

    getSeoUrl(data);
  });
  
  var redirectRow = <?php echo $redirect_row; ?>;
  
  $('#addNewRedirect').click(function(e) {
    e.preventDefault();
    
    $('#seo_url_generator_redirects').append('<div id="redirect-row-' + redirectRow + '" class="row redirect-row recent" style="margin: 10px 0;"><input type="text" name="seo_url_generator_redirects[]" value="" class="form-control input-sm col-xs-10" style="width: 100%; width: calc(100% - 120px);" /><div class="col-xs-1"><i class="pull-left fa fa-close text-danger deleteRedirect" style="cursor: pointer;" data-toggle="tooltip" title="<?php echo $sug_button_delete_redirect; ?>"></i></div></div>');
    
    redirectRow++;
  });
  
  $('body').on('click', '.deleteRedirect', function(e) {
    e.preventDefault();
		$('#sug-btn-confirm').attr('data-target', '#' + $(this).parent().parent('.redirect-row').attr('id'));		
		$('#sug-confirm').modal('toggle');    
  });
    
  $('body').on('click', '#sug-btn-confirm', function(e) {
    e.preventDefault();		
		$($(this).attr('data-target')).remove();		
		$('#sug-confirm').modal('toggle');
  });

  <?php } ?>

  function getSeoUrl(data) {
    $.ajax({
      url: 'index.php?route=extension/module/seo_url_generator/generateSeoUrlByAjax&token=<?php echo $token; ?>',
      dataType: 'json',
      data: data,
      method : 'POST',
      beforeSend: function() {
      },
      success: function(response, textStatus, jqXHR) {
        // success ajax query
        if(response.result != '') {
          <?php if (isset($_GET['category_id'])) { ?>
          if ('' != $('#input-keyword').val().trim() && $('#input-keyword').val() != response.result) {
            $('#seo_url_generator_redirects').append('<div id="redirect-row-' + redirectRow + '" class="row redirect-row recent" style="margin: 10px 0;"><input type="text" name="seo_url_generator_redirects[]" value="' + $('#input-keyword').val() + '" class="form-control input-sm col-xs-10" style="width: 100%; width: calc(100% - 120px);" /><div class="col-xs-1"><i class="pull-left fa fa-close text-danger deleteRedirect" style="cursor: pointer;" data-toggle="tooltip" title="<?php echo $sug_button_delete_redirect; ?>"></i></div></div>');
            
            redirectRow++;
          }
          <?php } ?>
          
          setTimeout(function() {
            $('#input-keyword').val(response.result);
          }, 100);
          
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        // Error ajax query
        console.log('AJAX query Error: ' + textStatus);
      },
      complete: function() {
      },
    });
  }

	// Prevent incorrect SEO URL!
	var inputBorderColorInitial = false;
	
	$('body').on('change', '.redirect-row input', function(e) {
		if (!inputBorderColorInitial) {
			inputBorderColorInitial = $(this).css('border-color');
		}
		
		// reset previous errors
		$(this).css('border-color', inputBorderColorInitial);
		
		$('#sug-error-body').html('');
		
		let hasError = false;
		
		// Check inputed data		
		if ($(this).val().trim() == '') {
			hasError = true;
			$('#sug-error-body').append('<p class="text-danger"><b><?php echo $sug_redirects_error_empty; ?></b></p>');
		}

		if ($(this).val().includes('/')) {
			hasError = true;
			$('#sug-error-body').append('<p class="text-danger"><b><?php echo $sug_redirects_error_slash; ?></b></p>');
		}
		
		if ($(this).val().includes('http')) {
			hasError = true;
			$('#sug-error-body').append('<p class="text-danger"><b><?php echo $sug_redirects_error_protocol; ?></b></p>');
		}
		
		if ($(this).val().includes('.html')) {
			hasError = true;
			$('#sug-error-body').append('<p class="text-warning"><b><?php echo $sug_redirects_error_html; ?></b></p>');
		}
		
		if (hasError) {
			$(this).css('border-color', 'red');
			
			$('#sug-error-body').append('<p class="alert alert-info"><i class="fa fa-info-circle" style="font-size: 1.5em;">&nbsp;</i>  <?php echo $sug_redirects_error_common; ?></p>');
			
			$('#sug-error').modal('toggle');
		}
		
    console.log('hasError : ' + hasError);
    console.log($(this).val());
		
  });
	
</script>

<!-- Confirm Modal -->
<div class="modal fade" id="sug-confirm" tabindex="-1" role="dialog" aria-labelledby="sug-confirm" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title text-warning" id="sug-confirm-title"><i class="fa fa-exclamation-triangle">&nbsp;</i> <b><?php echo $sug_confirm_title; ?></b></h4>
			</div>
			<div class="modal-body">
				<?php echo $sug_confirm_body; ?>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger sug-btn-confirm" id="sug-btn-confirm" data-target=""><i class="fa fa-trash">&nbsp;</i> <?php echo $sug_confirm_btn_yes; ?></button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $sug_confirm_btn_no; ?></button>
			</div>
		</div>
	</div>
</div>

<!-- Error Modal -->
<div class="modal fade" id="sug-error" tabindex="-1" role="dialog" aria-labelledby="sug-error" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title text-danger" id="sug-error-title"><i class="fa fa-exclamation-triangle">&nbsp;</i> <b><?php echo $sug_redirects_error_title; ?></b></h4>
			</div>
			<div class="modal-body" id="sug-error-body"></div>
		</div>
	</div>
</div> 

<!-- SEO URL Generator.End --><?php } ?>

<?php echo $footer; ?>