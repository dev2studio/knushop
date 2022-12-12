<?php

$recepient = "sales@knushop.com.ua";
$sender = "mail.ukraine.com.ua";

$phone = trim($_POST["phone"]);
$link = trim($_POST["link"]);
$variants = $_POST['size'];
$message = "\nТелефон: $phone \nРазмер: $variants \nСсылка на товар: $link";

$pagetitle = "Бронь размера КНУ-SHOP";
mail($recepient, $pagetitle, $message, "Content-type: text/plain; charset=\"utf-8\"\n From: $sender");



$token = "644058466:AAGCdBsY34DxHtjFyT1rgHRlTRgCduLrF2w";
$chat_id = "-223512330";
$arr = array(
	'Бронь размера' => $variants,
	'Телефон: ' => $phone,
 	'Ссылка на товар: ' => $link,
);
$txt = '';

foreach($arr as $key => $value) {
  $txt .= "<b>".$key.":</b> ".$value."%0A";
};

$sendToTelegram = fopen("https://api.telegram.org/bot{$token}/sendMessage?chat_id={$chat_id}&parse_mode=html&text={$txt}","r");


?>