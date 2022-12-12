<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?><meta name="description" content="<?php echo $description; ?>" /><?php } ?>
<?php if ($keywords) { ?><meta name="keywords" content= "<?php echo $keywords; ?>" /><?php } ?>
<!-- Load essential resources -->
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/basel/js/slick.min.js"></script>
<script src="catalog/view/theme/basel/js/basel_common.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>
<link rel="stylesheet" href="/catalog/view/javascript/jquery/magnific/magnific-popup.css" />
<script src="https://use.fontawesome.com/d548a57fa3.js"></script>

 
	
<!-- Main stylesheet -->
<link href="catalog/view/theme/basel/stylesheet/stylesheet.css" rel="stylesheet">
<!-- Mandatory Theme Settings CSS -->
<style type="text/css" id="basel-mandatory-css"><?php echo $basel_mandatory_css; ?>;</style>
<!-- Plugin Stylesheet(s) -->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- Pluing scripts(s) -->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<!-- Page specific meta information -->
<?php foreach ($links as $link) { ?>
<?php if ($link['rel'] == 'image') { ?>
<meta property="og:image" content="<?php echo $link['href']; ?>" />
<?php } else { ?>
<link rel="apple-touch-icon" sizes="57x57" href="catalog/view/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="catalog/view/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="catalog/view/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="catalog/view/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="catalog/view/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="catalog/view/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="catalog/view/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="catalog/view/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="catalog/view/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="https://knushop.com.ua/catalog/view/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://knushop.com.ua/catalog/view/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="https://knushop.com.ua/catalog/view/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://knushop.com.uacatalog/view/favicon/favicon-16x16.png">
<link rel="manifest" href="https://knushop.com.uacatalog/view/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="https://knushop.com.ua/catalog/view/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<?php } ?>
<?php } ?>
<!-- Analytic tools -->
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php if (isset($basel_styles_status)) { ?>
<!-- Custom Color Scheme -->
<style type="text/css" id="basel-color-scheme"><?php echo $basel_styles_cache; ?>;</style>
<?php } ?>
<?php if (isset($basel_typo_status)) { ?>
<!-- Custom Fonts -->
<style type="text/css" id="basel-fonts"><?php echo $basel_fonts_cache; ?>;</style>
<?php } ?>
<?php if ($basel_custom_css_status) { ?>
<!-- Custom CSS -->
<style type="text/css" id="basel-custom-css">
<?php echo $basel_custom_css; ?>;
</style>
<?php } ?>
<?php if ($basel_custom_js_status) { ?>
<!-- Custom Javascript -->
<script type="text/javascript">
<?php echo $basel_custom_js; ?>
</script>
<?php } ?>

<!-- Hotjar Tracking Code for knushop.com.ua -->
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:2180329,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>



<!-- Facebook Pixel Codesss -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '530280790874937');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=530280790874937&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Codes -->
</head>
<body class="<?php echo $class; ?><?php echo $basel_body_class; ?>">
<?php require_once('catalog/view/theme/basel/template/common/mobile-nav.tpl'); ?>
<div class="outer-container main-wrapper">
<?php if ($notification_status) { ?>
<div class="top_notificaiton">
  <div class="container<?php if ($top_promo_close) echo ' has-close'; ?> <?php echo $top_promo_width; ?> <?php echo $top_promo_align; ?>">
    <div class="table">
    <div class="table-cell w100"><div class="ellipsis-wrap"><?php echo $top_promo_text; ?></div></div>
    <?php if ($top_promo_close) { ?>
    <div class="table-cell text-right">
    <a onClick="addCookie('basel_top_promo', 1, 30);$(this).closest('.top_notificaiton').slideUp();" class="top_promo_close">&times;</a>
    </div>
    <?php } ?>
    </div>
  </div>
</div>
<?php } ?>
<?php require_once('catalog/view/theme/basel/template/common/headers/' . $basel_header . '.tpl'); ?>
<!-- breadcrumb -->
<div class="breadcrumb-holder">
<div class="container full-width">
<span id="title-holder">&nbsp;</span>
<div class="links-holder">
<a class="basel-back-btn" onClick="history.go(-1); return false;"><i></i></a><span>&nbsp;</span>
</div>
</div>
</div>
<div class="container full-width">
<?php echo $position_top; ?>
</div>

<div class="cart-name232">
     
  </div>