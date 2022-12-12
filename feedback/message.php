<?php

$recepient = "sales@knushop.com.ua";
$sender = "mail.ukraine.com.ua";

$name = trim($_POST["name"]);
$mail = trim($_POST["mail"]);
$text = trim($_POST["text"]);
$variants = "";
$message = "Имя: $name \nE-mail: $mail \nТекст сообщения: $text";

$pagetitle = "Сообщение с сайта КНУ-SHOP";
mail($recepient, $pagetitle, $message, "Content-type: text/plain; charset=\"utf-8\"\n From: $sender");



$token = "644058466:AAGCdBsY34DxHtjFyT1rgHRlTRgCduLrF2w";
$chat_id = "-223512330";
$arr = array(
	'Сообщение с сайта' => $variants,
	'Со страницы "контакты" поступило новое сообщение' => $variants,
);

foreach($arr as $key => $value) {
  $txt .= "<b>".$key."</b> ".$value."%0A";
};

$sendToTelegram = fopen("https://api.telegram.org/bot{$token}/sendMessage?chat_id={$chat_id}&parse_mode=html&text={$txt}","r");


?>