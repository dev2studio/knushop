<?php

// Heading
$_['heading_title'] = '<img width="24" height="24" src="view/image/neoseo.png" style="float: left;"><p style="margin:0;line-height: 24px;">NeoSeo Импорт из YML</p>';
$_['heading_title_raw'] = 'NeoSeo Импорт из YML';

//Tab
$_['tab_general'] = 'Общие';
$_['tab_import'] = 'Импорты';
$_['tab_support'] = 'Поддержка';
$_['tab_logs'] = 'Логи';
$_['tab_license'] = 'Лицензия';

//Button
$_['button_save'] = 'Сохранить';
$_['button_save_and_close'] = 'Сохранить и Закрыть';
$_['button_close'] = 'Закрыть';
$_['button_recheck'] = 'Проверить еще раз';
$_['button_clear_log'] = 'Очистить логи';
$_['button_imports'] = 'Выполнить импорты';
$_['button_import'] = 'Выполнить импорт';
$_['button_clear_database'] = 'Очистить базу';
// Text
$_['text_module_version'] = '';
$_['text_edit'] = 'Параметры';
$_['text_success'] = 'Настройки модуля успешно обновлены!';
$_['text_success_clear'] = 'Логи успешно удалены';
$_['text_module'] = 'Модули';
$_['text_success_database_clear'] = 'База данных успешно очищена';
$_['text_success_clear'] = 'Логи успешно очищены';
$_['text_success_import'] = 'Импорт успешно выполнен';
$_['text_error_import'] = 'Импорт не может быть выполнен. Отсутствуют импорты!';
$_['text_success_imports'] = 'Импорты успешно выполнены';
$_['text_error_imports'] = 'Импорты не могут быть выполнены. Отсутствуют импорты!';
$_['text_success_delete'] = 'Импорт успешно удален!';
$_['text_new_import'] = 'Новый импорт';
$_['text_del_import'] = 'Удалить импорт';
$_['text_only_empty'] = 'Если пустое поле';

$_['text_generate_common'] = 'Системная';
$_['text_generate_field'] = 'Из тега импорта URL';

// Entry
$_['entry_status'] = 'Статус:';
$_['entry_debug'] = 'Отладочный режим:';
$_['entry_import_url'] = 'Ссылка на YML';
$_['entry_cron'] = 'Задача для планировщика';
$_['entry_update_name'] = 'Обновлять название';
$_['entry_update_description'] = 'Обновлять описание';
$_['entry_update_price'] = 'Обновлять цену';
$_['entry_update_image'] = 'Обновлять изображения';
$_['entry_update_manufacturer'] = 'Обновлять производителя';
$_['entry_update_attribute'] = 'Обновлять атрибуты';
$_['entry_import_name'] = 'Название импорта';
$_['entry_import_name_desc'] = 'Название импорта, будет отображаться во вкладке экспортов';
$_['entry_import_status'] = 'Статус импорта';
$_['entry_import_categories'] = 'Категории';
$_['entry_update_category'] = 'Обновлять категории';
$_['entry_import_categories_desc'] = 'Укажите категории которые необходимо исключить, товары входящие в данную категорию загружаться не будут. Каждое наименование категории с новой строки';
$_['entry_update_category_skip'] = 'Пропустить категории если не имеют связей';
$_['entry_update_category_skip_desc'] = 'Если на источнике присутвуют не правильные связи с родительскими категориями или отсутвуют родительские категории - такие пропускаем, товары будут добавлены';
$_['entry_update_model'] = 'Обновлять модель';
$_['entry_add_category'] = 'Не импортировать категории';
$_['entry_update_meta_tag'] = 'Обновлять мета-теги';
$_['entry_top_category_level'] = 'Без родительской категории';
$_['entry_parent_category'] = 'Родительская категория';
$_['entry_price_charge'] = 'Наценка на товар (%)';
$_['entry_price_gradation'] = 'Наценка в виде градации';
$_['entry_price_gradation_desc'] = 'ПРИМЕР: 500:0;2000:1.5;5000:1.25 - означает, что товары с ценой до 500 не загружать, от 500 до 2000 умножать цену на 1.5, от 2000 до 5000 умножать на 1.25, свыше 5000 цена не изменяется. <br>Поддерживается вложенная формула: 2000:<b>-100|1.25|0</b>; - означает, что для товаров с ценой до 2000 вычесть 100, затем умножить на 1.25 и прибавить 0';
$_['entry_generate_url'] = 'Генерация ЧПУ ссылок для продуктов';
$_['entry_import_currency'] = 'Валюта импорта';
$_['entry_import_convert_currency'] = 'Конвертировать валюту';
$_['entry_import_convert_currency_desc'] = 'Если валюта предложения будет соответствовать одной из списка, то она будет автоматиески сконвертирована по курсу валют в магазине. Слева - валюта в импорте, справа - валюта магазина. <br><b>Пример</b> списка соответствий:<br>Руб:RUB,Дол:USD';
$_['entry_no_currency'] = 'Валюта не определена, коэф. 1';
$_['entry_stock_status_true'] = 'Статус товара "в наличии"';
$_['entry_stock_status_false'] = 'Статус товара "нет в наличии"';
$_['entry_exclude_by_name'] = 'Исключить товары по наименованию';
$_['entry_exclude_by_name_desc'] = 'Каждое наименование товара с новой строки';
$_['entry_only_update_product'] = 'Товары только обновлять';
$_['entry_only_update_product_desc'] = 'Новые товары не будут добавляться';
$_['entry_create_discount_price'] = 'Создавать акционные цены';
$_['entry_create_discount_price_desc'] = 'Цена из импорта будет записана как акционная, а основания цена будет сформирована по правилу Акционнаяцена*Процент%';
$_['entry_discount_price_percent'] = 'Процент для создания акционной цены';
$_['entry_available_control'] = 'Контроль наличия товара';
$_['entry_available_control_desc'] = 'Если необходимо отслеживать отсутствие товара в прайсе, включите данную опции. Если товар отсутсвует - будет отключен в магазине.';
$_['entry_use_quantity'] = 'Использовать остаток при добавлении и обновлении товара';
$_['entry_use_quantity_desc'] = 'Если оставить 0, остаток товара будет браться из тега quantity, если он также отсуствует - будет указан остаток 999';
$_['entry_sku_tag'] = 'Укажите тег артикула:';
$_['entry_sku_tag_desc'] = 'Укажите тег который будет в выгрузке отвечать за поле артикул (sku). Данное поле будет использоваться для поиска товаров в магазине, если не будет найден такой товар, создастся новый товар. <br> Если тег не будет найден, тег offer id будет использоваться как артикул.';
$_['entry_set_miss_quantity'] = 'Установить количество 0 отсутсвующим товарам';
$_['entry_set_miss_quantity_desc'] = 'Установить товарам, кторых нет в файле импорта количество 0. Будет применено только к товарам которые были созданы / обновлены в результате импорта текущего источника.';
$_['entry_price_tag'] = 'Укажите тег для цены';
$_['entry_price_tag_desc'] = 'Если оставить пустым для цены будет использоваться стандартный тег price';
$_['entry_fill_parent_categories'] = 'Отображать товар в родительских категориях';
$_['entry_fill_parent_categories_desc'] = 'Если, к примеру, товар попадает в категорию Плееры -> mp3 то он будет отображаться и в категории "Плееры"';
$_['entry_name_tag'] = 'Укажите тег откуда брать наименования';
$_['entry_name_tag_desc'] = 'Если поле оставить пустым наименование товара будет браться по стандарту - name';
$_['entry_description_tag'] = 'Укажите тег откуда брать описание';
$_['entry_description_tag_desc'] = 'Если поле оставить пустым описание товара будет браться по стандарту - description';
$_['entry_sql_before'] = 'SQL до обработки импортов:';
$_['entry_sql_before_desc'] = 'Если у вас есть какая-то специфическая логика обновления базы перед импортом данных из YML - вы можете реализовать ее с помощью серии SQL запросов, разделенных точкой с запятой - ";"';
$_['entry_sql_after'] = 'SQL после обработки импортов:';
$_['entry_sql_after_desc'] = 'Если у вас есть какая-то специфическая логика обновления базы после импорта данных из YML - вы можете реализовать ее с помощью серии SQL запросов, разделенных точкой с запятой - ";"';
$_['entry_switch_category'] = 'Переключить режим фильтра категорий';
$_['entry_switch_category_desc'] = 'Если включено - категории будут загружаться только те что указаны в списке выше, если отключено - такие категории будут исключены из загрузки. Товары входящие в данные категории будут так же исключены';
$_['entry_ignore_attributes'] = 'Игнорирование атрибутов';
$_['entry_ignore_attributes_desc'] = "Список атрибутов для исключения. Каждый атрибут на отдельной строке";
$_['entry_route_attributes'] = 'Перенаправление атрибутов';
$_['entry_route_attributes_desc'] = "Если надо какое-то свойство записать именно в товар, а не в список свойств, то укажите название свойства и поле таблицы товара через знак равенства.<br><b>Пример</b> списка соответствий:<br>Вес=weight<br>Артикул=modelе";
$_['entry_sku_prefix'] = 'Префикс для артикула';
$_['entry_sku_prefix_desc'] = 'Данный префикс будет добавлен в товаре в магазине. Если у Вас есть несколько поставщиков с одинаковыми артикулами используйте префикс чтоб это были два разных товара';
$_['entry_update_additions'] = 'Обновлять доп. поля';
$_['entry_update_additions_desc'] = 'Отключите параметр если Вам не нужно обновлять данные с тего weight,barcode. Если такие теги присутствуют в импорте они обновятся в карточке товара ';
$_['entry_import_ftp_server'] = 'FTP Адрес сервера';
$_['entry_import_ftp_server_desc'] = 'Если Вы используете FTP сервер в качестве источника прайса, поле "Ссылка на YML" игнорируется';
$_['entry_import_ftp_login'] = 'FTP Логин сервера';
$_['entry_import_ftp_password'] = 'FTP пароль сервера';
$_['entry_import_ftp_path'] = 'FTP путь к файлу импорта';
$_['entry_import_ftp_path_desc'] = 'Необходимо указать полностью путь, наименование и расширение файла.<br> Например /download/import.xml';
$_['entry_create_price_action'] = 'Акционная цена по тегу';
$_['entry_create_price_action_desc'] = 'Укажите название тега с которого требуется забирать цену для акции, данное поле будет сравниваться с основной и если он меньше будет назначаться к группе по умолчанию бесрочной акцией, если равна акция и основная - все акции чистятся';
$_['entry_available_status_via_stock'] = 'Соответствие названия тега для статуса товара со статусом в магазине';
$_['entry_available_status_via_stock_desc'] = 'Укажите соответствие названия тега для статуса товара со статусом в магазине, а также зависимость остатка если требуется. Кажое правило с новой строки. Формула [Название тега]=[его значение]:[название статуса в магазине]:остаток товара <br> Пример:<br> available=на складе:В наличии:500 <br> available=закончился:Нет в наличии:0 <br> available=Уточняйте:Предзаказ:0';
$_['entry_reload_image'] = 'Принудительно обновлять изображени, даже если оно уже скачано';
$_['entry_main_tag'] = 'Основной тег импорта';
$_['entry_main_tag_desc'] = 'Укажите название тега который является главным в файле импорта, например offers. Так же поддерживается вложенность через символ "/". Напрмиер: ПакетПредложений/Предложения';
$_['entry_item_tag'] = 'Тег товара в файле импорт';
$_['entry_item_tag_desc'] = 'Укажите название тега который является элементом товара в файле импорта, например offer';
$_['entry_use_quantity_tag'] = 'Укажите тег для получения остатка';
$_['entry_use_quantity_tag_desc'] = 'Если оставить пустым берется стандартное поле quantity или указывается указанное значение выше';
$_['entry_inner_tag'] = 'Все данные внутри тега';
$_['entry_inner_tag_desc'] = 'Включите данную настройку если в файле импорта все теги являются параметрами для одного тега. Например <good sku="Артикль" price="цена"></good>>';

// Error
$_['error_permission'] = 'У Вас недостаточно прав для управления этим модулем!';
$_['error_ioncube_missing'] = "";
$_['error_license_missing'] = "";
$_['mail_support'] = "";
$_['module_licence'] = "";
$_['text_module_version']='47';
$_['error_license_missing']='<h3 style = "color: red"> Missing file with key! </h3>

<p> To obtain a file with a key, contact NeoSeo by email <a href="mailto:license@neoseo.com.ua"> license@neoseo.com.ua </a>, with the following: </p>

<ul>
	<li> the name of the site where you purchased the module, for example, https://neoseo.com.ua </li>
	<li> the name of the module that you purchased, for example: NeoSeo Sharing with 1C: Enterprise </li>
	<li> your username (nickname) on this site, for example, NeoSeo</li>
	<li> order number on this site, e.g. 355446</li>
	<li> the main domain of the site for which the key file will be activated, for example, https://neoseo.ua</li>
</ul>

<p>Put the resulting key file at the root of the site, that is, next to the robots.txt file and click the "Check again" button.</p>';
$_['error_ioncube_missing']='<h3 style="color: red">No IonCube Loader! </h3>

<p>To use our module, you need to install the IonCube Loader.</p>

<p>For installation please contact your hosting TS</p>

<p>If you can not install IonCube Loader yourself, you can also ask for help from our specialists at <a href="mailto:info@neoseo.com.ua"> info@neoseo.com.ua </a> </p>';
$_['module_licence']='<h2>NeoSeo Software License Terms</h2>
<p>Thank you for purchasing our web studio software.</p>
<p>Below are the legal terms that apply to anyone who visits our site and uses our software products or services. These Terms and Conditions are intended to protect your interests and interests of LLC NEOSEO and its affiliated entities and individuals (hereinafter referred to as "we", "NeoSeo") acting in the agreements on its behalf.</p>
<p><strong>1. Introduction</strong></p>
<p>These Terms of Use of NeoSeo (the "Terms of Use"), along with additional terms that apply to a number of specific services or software products developed and presented on the NeoSeo website (s), contain terms and conditions that apply to each and every one of them. the visitor or user ("User", "You" or "Buyer") of the NeoSeo website, applications, add-ons and components offered by us along with the provision of services and the website, unless otherwise noted (all services and software, software Modules offered through the NeoSeo website or auxiliary servers Isa, web services, etc. Applications on behalf NeoSeo collectively referred to as - "NeoSeo Service" or "Services").</p>
<p>NeoSeo Terms are a binding contract between NeoSeo and you - so please carefully read them.</p>
<p>You may visit and/or use the NeoSeo Services only if you fully agree to the NeoSeo Terms: By using and/or signing up to any of the NeoSeo Services, you express and agree to these Terms of Use and other NeoSeo terms, for example, provide programming services in the context of typical and non-typical tasks that are outlined here: <a href = "https://neoseo.com.ua/vse-chto-nujno-znat-klienty "target ="_blank" class ="external"> https://neoseo.com.ua/vse-chto-nujno-znat-klienty </a>, (hereinafter the NeoSeo Terms).</p>
<p>If you are unable to read or agree to the NeoSeo Terms, you must immediately leave the NeoSeo Website and not use the NeoSeo Services.</p>
<p>By using our Software products, Services, and Services, you acknowledge that you have read our Privacy Policy at <a href = "https://neoseo.com.ua/policy-konfidencialnosti "target ="_blank " class ="external"> https://neoseo.com.ua/politika-konfidencialnosti </a> (" Privacy Policy ")</p>
<p>This document is a license agreement between you and NeoSeo.</p>
<p>By agreeing to this agreement or using the software, you agree to all these terms.</p>
<p>This agreement applies to the NeoSeo software, any fonts, icons, images or sound files provided as part of the software, as well as to all NeoSeo software updates, add-ons or services, if not applicable to them. miscellaneous. This also applies to NeoSeo apps and add-ons for the SEO-Store, which extend its functionality.</p>
<p>Prior to your use of some of the application features, additional NeoSeo and third party terms may apply. For the correct operation of some applications, additional agreements are required with separate terms and conditions of privacy, for example, with services that provide SMS-notification services.</p>
<p>Software is not sold, but licensed.</p>
<p>NeoSeo retains all rights (for example, the rights provided by intellectual property laws) that are not explicitly granted under this agreement. For example, this license does not entitle you to:</p>
<li> <span> </span> <span> </span> separately use or virtualize software components; </li>
<li> publish or duplicate (with the exception of a permitted backup) software, provide software for rental, lease or temporary use; </li>
<li> transfer the software (except as provided in this agreement); </li>
<li> Try to circumvent the technical limitations of the software; </li>
<li> study technology, decompile or disassemble the software, and make appropriate attempts, other than those to the extent and in cases where (a) it provides for the right; (b) authorized by the terms of the license to use the components of the open source code that may be part of this software; (c) necessary to make changes to any libraries licensed under the small GNU General Public License, which are part of the software and related; </li>
<p> You have the right to use this software only if you have the appropriate license and the software was properly activated using the genuine product key or in another permissible manner.
</p>
<p> The cost of the SEO-Shop license does not include installation services, settings, and more of its stylization, as well as other paid/free add-ons. These services are optional, the cost depends on the number of hours required for the implementation of the hours, here: <a href = "https://neoseo. com.ua/vse-chto-nujno-znat-klienty "target =" _ blank "class =" external "> https://neoseo.com.ua/vse-chto-nujno-znat-klienty </a>
</p>
<p> The complete version of the document can be found here:
</p>
<p> <a href="https://neoseo.com.ua/usloviya-licenzionnogo-soglasheniya" target="_blank" class="external"> https://neoseo.com.ua/usloviya-licenzionnogo-soglasheniya </a>
</p>';
$_['mail_support']='<h2>Terms of free and paid information and technical support in <a class="external" href="https://neoseo.com.ua/" target="_blank"> NeoSeo</a>.</h2>

<p>Since we are confident that any quality work must be paid, all consultations requiring preliminary preparation of the answer, pay, including and case studies: &quot; look, and why your module is not working here? &quot;</p>

<p>If the answer to your question is already ready, you will receive it for free. But if you need to spend time answering the question, studying files, finding a bug and analyzing it, then we&#39;ll ask you to make a payment before you can answer.</p>

<p>We are <strong>helping to install</strong> and <strong> fix bugs when installing </strong>our modules in our order.</p>

<p>For any questions, please contact www.opencartmasters.com.</p>

<p>See the full version of the license agreement here:<strong> </strong><a class="external" href="https://neoseo.com.ua/usloviya-licenzionnogo-soglasheniya" target="_blank"> https://neoseo.com .ua/usloviya-licenzionnogo-soglasheniya</a></p>

<p><strong>Special offer: write review - get an add-on as a gift :)</strong></p>

<p>Dear Customers of web studio NeoSeo,</p>

<p>Tell us, what could be better for the development of the company than public reviews? This is a great way to hear your Client and make your products and service even better.</p>

<p>Please, leave a review about cooperation with our web studio or about our software solutions (add-ons) on our Facebook, Google, pages, Google, Yandex and OpenCartForum.com. pages.</p>

<p>Write as it is, it is important for us to hear an honest and objective assessment, and as a sign of gratitude for the time spent writing reviews, we have prepared a nice bonus. Detailed conditions are here: <a href="https://neoseo.com.ua/akciya-modul-v-podarok " target="_blank">https://neoseo.com.ua/akciya-modul-v-podarok </a></p>

<p>Once again, thank you very much for being with us!</p>

<p>The NeoSeo Team</p>';
