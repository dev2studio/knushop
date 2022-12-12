<?php

$phone = trim($_POST["phone"]);
$variants = "";

if (!empty($phone)) {
	$token = "644058466:AAGCdBsY34DxHtjFyT1rgHRlTRgCduLrF2w";
	$chat_id = "-223512330";
	$arr = array(
		'Новый заказ в один клик' => $variants,
		'Телефон: ' => $phone,
	);

	foreach($arr as $key => $value) {
		$txt .= "<b>".$key."</b> ".$value."%0A";
	};

	$sendToTelegram = fopen("https://api.telegram.org/bot{$token}/sendMessage?chat_id={$chat_id}&parse_mode=html&text={$txt}","r");

}

?>