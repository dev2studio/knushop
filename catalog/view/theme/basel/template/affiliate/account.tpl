<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

      <h1 id="page-title"><?php echo $text_my_account; ?></h1>
      <legend><?php echo $text_my_account; ?></legend>
      <ul class="list-unstyled margin-b30">
      
		<li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $edit; ?>"><img src="/image/account-images/edit.png" alt="Account Details" ><h5><?php echo $text_edit; ?></h5></a></li><div class="clearfix"></div>
		
		<li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $password; ?>"><img src="/image/account-images/password.png" alt="Account Password" ><h5><?php echo $text_password; ?></h5></a></li><div class="clearfix"></div>
		
		<li class="col-md-3 text-center" ><a href="<?php echo $payment; ?>"><img src="catalog/view/theme/default/image/account-images/payments.png" alt="Payment Preferences" ><h5><?php echo $text_payment; ?></h5></a></li><div class="clearfix"></div>
       
      </ul>
      <legend><?php echo $text_my_tracking; ?></legend>
      <ul class="list-unstyled margin-b30">
       
	   <li class="col-md-3 text-center" ><a href="<?php echo $tracking; ?>"><img src="catalog/view/theme/default/image/account-images/orders.png" alt="Tracking Code" ><h5><?php echo $text_tracking; ?></h5></a></li><div class="clearfix"></div>
	  
      </ul>
      <legend><?php echo $text_my_transactions; ?></legend>
      <ul class="list-unstyled margin-b30">
        
		<li class="col-md-3 text-center" ><a href="<?php echo $transaction; ?>"><img src="catalog/view/theme/default/image/account-images/trans.png" alt="Transactions" ><p ><?php echo $text_transaction; ?></p></a></li>
      </ul>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>