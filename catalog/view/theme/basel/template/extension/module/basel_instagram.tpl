<?php if ($full_width) { ?></div><?php } ?>
<div class="widget"<?php if ($use_margin) echo ' style="margin-bottom:' . $margin . '"'; ?>>
<div class="instagram_wrapper">
<?php if ($block_title) { ?>
<div class="instagram_title<?php if ($title_inline) echo ' floating_title text-center'; ?>">
<div class="table w100 h100"><div class="table-cell">
<div class="widget-title">
    <?php if ($title_preline) { ?><p class="pre-line"><?php echo $title_preline; ?></p><?php } ?>
    <?php if ($title) { ?> 
    <p class="main-title"><span><?php echo $title; ?></span></p>
    <p class="widget-title-separator"><i class="icon-line-cross"></i></p>
    <?php } ?>
    <?php if ($title_subline) { ?>
    <p class="sub-line"><span><?php echo $title_subline; ?></span></p>
    <?php } ?>
</div>
</div></div>
</div>
<?php } ?>
<div class="images_wrap">
<div class="grid-holder lg-grid<?php echo $columns; ?> md-grid<?php echo $columns_md; ?> sm-grid<?php echo $columns_sm; ?>" style="margin:-<?php echo $padding/2; ?>px;">
<?php $i = 0; ?>
<?php foreach ($instafeed as $image) { ?>
<?php $i++; ?>
<a href="<?php echo $image['link']; ?>" class="external item insta-item" style="padding:<?php echo $padding/2; ?>px">
<?php if ($resolution) { ?>
<img src="<?php echo $image['images']['standard_resolution']['url']; ?>" alt="">
<?php } else { ?>
<img src="<?php echo $image['images']['low_resolution']['url']; ?>" alt="">
<?php } ?>
<span class="hover_fill" style="top:<?php echo $padding/2; ?>px;right:<?php echo $padding/2; ?>px;bottom:<?php echo $padding/2; ?>px;left:<?php echo $padding/2; ?>px;"></span>
</a>
<?php if ($i == $limit) break; ?>
<?php } ?>
</div>
</div>
</div> <!-- .instagram_wrapper -->      
</div>
<?php if ($full_width) { ?><div class="container"><?php } ?>