<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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

 
    <form enctype="multipart/form-data" action="<?=$action;?>" method="POST" style="    width: 100%;
    float: left;
    background: #373737;
    margin-bottom: 25px;
    border-radius: 4px;
    color: white;">
      <div class="col-md-10">
         <div class="form-group">
                <label class="control-label" for="input-price">Файл</label>
                <input type="file" name="userfile" value="" placeholder="Цена" id="input-price" class="form-control">
              </div>
         
      </div>
      <div class="col-md-2" style="padding-top: 35px;"><input type="submit"  class="btn btn-primary" value="Импортировать" /></div>
       
     
</form>
<div style="clear: both;"></div>

<? if(isset($logs)){  ?>
  <div class="clogs" style="padding: 20px;
    border: 1px solid #ccc;
    border-radius: 20px;
    height: 300px;
    overflow: hidden;
    overflow-y: scroll;">
    <? foreach ($logs as $key => $value) { ?>
      <div class="log" style="background: #e2e2e2;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 4px;
    box-shadow: 1px 1px 2px #ccc;font-size: 16px;"><?=$value;?></div>
    <? } ?>
  </div>

<? } ?>

  </div>
</div>
