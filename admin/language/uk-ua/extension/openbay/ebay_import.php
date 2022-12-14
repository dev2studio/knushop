<?php
//Переклад: Том'як Олег з любов'ю до Української мови та легкості Opencart
// Heading
$_['heading_title'] 		= 'Імпорт товару';
$_['text_openbay'] 		= 'OpenBay Pro';
$_['text_ebay'] 		= 'eBay';

// Text
$_['text_sync_import_line1'] 	= '<strong> Обережно! </strong> Це імпортує всі ваші товари на eBay і побудує структуру категорій у вашому магазині. Рекомендується видалити всі категорії продуктів, перш ніж запускати цей параметр. <br /> Категорія продуктів береться зі стандартних категорій eBay, a не з вашого магазину (якщо у Вас є магазин eBay). Можна перейменувати, видаляти і редагувати імпортовані категорії, не зачіпаючи ваші eBay товари. ';
$_['text_sync_import_line3'] 	= 'Вам необхідно забезпечити можливість приймати вашим сервером великі обсяги даних. 1000 eBay пунктів становить близько 40 МБ інфрмації, Вам потрібно буде обчислити необхідний обсяг. Якщо ваш запит не вдається, то це, швидше за все, ваші налаштування занадто малі. Ліміт пам`яті PHP повинен бути близько 128 МБ.';
$_['text_sync_server_size'] 	= 'В даний час ваш сервер може приймати:';
$_['text_sync_memory_size'] 	= 'Ліміт пам`яті PHP:';
$_['text_import_confirm'] 	= 'Це імпортує всі ваші категорії на eBay як нові продукти. Ви впевнені? Дія не може бути скасована! Попередньо переконайтеся, що у Вас є резервна копія даних! ';
$_['text_import_notify'] 	= 'Ваш запит імпорту був відправлений для обробки. Імпорт займає близько 1:00 на 1000 одиниць.';
$_['text_import_images_msg1'] 	= 'Зображення знаходяться на розгляді eBay. Оновити цю сторінку, якщо кількість не зменшується.';
$_['text_import_images_msg2'] 	= 'Натисніть тут';
$_['text_import_images_msg3'] 	= 'Очікуйте. Докладніше про те, чому це сталося, можна дізнатися <a href="http://shop.openbaypro.com/index.php?route=information/faq&topic=8_45" target="_blank"> тут </a>';

// Entry
$_['entry_import_item_advanced'] = 'Отримати додаткові дані';
$_['entry_import_categories'] 	= 'Імпорт категорій';
$_['entry_import_description'] 	= 'Імпорт опису елементів';
$_['entry_import'] 		= 'Імпорт елементів eBay';

// Buttons
$_['button_import'] 		= 'Імпортувати';
$_['button_complete'] 		= 'Готово';

// Help
$_['help_import_item_advanced'] = 'Імпортування займе в 10 разів більше часу. Імпорт ваги, розмірів, ISBN та інших доступних даних ';
$_['help_import_categories'] 	= 'Створює структуру категорії у вашому магазині відповідно до категорій eBay';
$_['help_import_description'] 	= 'Це буде імпортувати всі, включаючи HTML, дані відвідування і т.д.';

// Error
$_['error_import'] 		= 'Не вдалося завантажити';
$_['error_maintenance'] 	= 'Ваш магазин знаходиться в режимі обслуговування. Імпорт не вдався!';
$_['error_ajax_load'] 		= 'Не вдалося підключитися до сервера';
$_['error_validation'] 		= 'Вам треба зареєструватися для вашого маркера API і включити модуль.';