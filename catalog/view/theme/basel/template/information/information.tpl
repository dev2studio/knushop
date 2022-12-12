<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
    <?php echo $content_top; ?>
      <h1 id="page-title" style="margin-bottom: 8px;"><?php echo $heading_title; ?></h1>
	 
<div style="width: 150px;">
 <p style="border-bottom: 2px solid #b80000;font-weight: normal; margin-bottom: 12px;"></p></div>


	  
      <?php echo $description; ?>
      <?php echo $content_bottom; ?>
     </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>