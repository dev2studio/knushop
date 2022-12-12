<?php echo $header; ?>
<div class="container full-width">
<style>
.hvr:hover > h5{
color: #84C225;
}
</style>
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
    
	<div id="content1" class="<?php echo $class; ?>" style="margin-bottom: 10px;"><?php echo $content_top; ?>
    <h1 id="page-title" style="margin-bottom: 2px;"><?php echo $text_my_account; ?></h1>
	<div style="width: 310px;"><p style="border-bottom: 2px solid #b80000;font-weight: normal; margin-bottom: 20px;"></p></div>
	<legend><?php echo $text_my_account; ?></legend>
    <ul class="list-unstyled margin-b30">
    <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $edit; ?>"><img src="/image/account-images/edit.png" alt="Account Details" ><h5><?php echo $text_edit; ?></h5></a></li>
	<li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $password; ?>"><img src="/image/account-images/password.png" alt="Account Password" ><h5><?php echo $text_password; ?></h5></a></li>
	<li class="col-md-3 text-center"><a class="hvr" href="<?php echo $address; ?>"><img src="/image/account-images/address.png" alt="Address Book" ><h5><?php echo $text_address; ?></h5></a></li>
	
	<li class="col-md-3 text-center"><a class="hvr" href="<?php echo $logout; ?>"><img src="/image/account-images/exit.png" alt="Exit Account" ><h5><?php echo $text_logout; ?></h5></a></li>
	
	</ul>
	</div>


	<div id="content1" class="<?php echo $class; ?>" style="margin-bottom: 10px;"><?php if ($credit_cards) { ?>
      <h2><?php echo $text_credit_card; ?></h2>
      <ul class="list-unstyled">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?>
      <legend><?php echo $text_my_orders; ?></legend>
      <ul class="list-unstyled margin-b30">
      <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $order; ?>"><img src="/image/account-images/orders.png" alt="Order History" ><h5><?php echo $text_order; ?></h5></a></li>
	  <?php if ($reward) { ?>
      <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $reward; ?>"><img src="/image/account-images/reward.png" alt="Reward Points" ><h5><?php echo $text_reward; ?></h5></a></li>
      <?php } ?>
	  <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $return; ?>"><img src="/image/account-images/return.png" alt="Your Returns" ><h5><?php echo $text_return; ?></h5></a></li>
	  <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $transaction; ?>"><img src="/image/account-images/trans.png" alt="Transactions" ><h5><?php echo $text_transaction; ?></h5></a></li>
      </ul>
	  </div>


<div id="content1" class="<?php echo $class; ?>" style="margin-bottom: 10px;">
      <legend><?php echo $text_my_newsletter; ?></legend>
      <ul class="list-unstyled margin-b30">
        <li class="col-md-3 text-center" ><a class="hvr" href="<?php echo $newsletter; ?>"><img src="/image/account-images/newsletter.png" alt="Your Newsletter" ><h5><?php echo $text_newsletter; ?></h5></a></li>
      </ul>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>