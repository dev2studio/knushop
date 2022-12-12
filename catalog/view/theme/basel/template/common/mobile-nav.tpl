<div class="main-menu-wrapper hidden-md hidden-lg">
    <ul class="mobile-top">
        <li class="mobile-lang-curr"></li>
        <?php if($header_search) { ?>
        <li class="search">
            <div class="search-holder-mobile">
            <input type="text" name="search-mobile" value="" placeholder="" class="form-control" /><a class="fa fa-search"></a>
            </div>
        </li>
        <?php } ?>
    </ul>
    <?php if($primary_menu) { ?>
    <div class="mobile-menu__nav">
        <ul class="categories">
            <?php if($primary_menu == 'oc') { ?>
            <!-- Default menu -->
            <?php require('catalog/view/theme/basel/template/common/menus/default_menu.tpl'); ?>
            <?php } else if (isset($primary_menu)) { ?>
            <!-- Mega menu -->
            <?php foreach($primary_menu_mobile as $key=> $row) { ?>
            <?php require('catalog/view/theme/basel/template/common/menus/mega_menu.tpl'); ?>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <?php } ?>
    <?php if($secondary_menu) { ?>
    <ul class="categories">
        <?php if($secondary_menu == 'oc') { ?>
            <!-- Default menu -->
            <?php require('catalog/view/theme/basel/template/common/menus/default_menu.tpl'); ?>
        <?php } else if (isset($secondary_menu)) { ?> 
            <!-- Mega menu -->
            <?php foreach($secondary_menu_mobile as $key=> $row) { ?>
            	<?php require('catalog/view/theme/basel/template/common/menus/mega_menu.tpl'); ?>
            <?php } ?>
        <?php } ?>
    </ul>
    <?php } ?>
    <div class="mobile-menu__dark">
        <div class="mobile-menu__info">
            <ul class="categories">
                <li class="static-link">
                    <a class="top-nav__link" href="http://www.univ.kiev.ua/" target="_blank" title="<?php echo $text_univer; ?>"><?php echo $text_univer; ?></a>
                </li>
                <?php require('catalog/view/theme/basel/template/common/static_links.tpl'); ?>
            </ul>
        </div>
        <div class="mobile-menu__contacts">
            <div class="mobile-menu__phones">
                <p class="mobile-menu__title"><?php echo $text_makecall; ?></p>
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17" height="17"
                viewBox="300 0 1000 1000" enable-background="new 300 0 1000 1000" xml:space="preserve" class="header-phones__svg">
                <g>
                    <g>
                        <path id="CIRCLE_1_" fill="#FFFFFF" d="M300,499.3c0,275.5,223.8,499.3,499.3,499.3s499.3-223.8,499.3-499.3
                        C1300,223.8,1076.2,0,799.3,0C523.8,0,300,223.8,300,499.3"/>
                    </g>
                    <g>
                        <defs>
                            <path id="CIRCLE_2_" d="M300,499.3c0,275.5,223.8,499.3,499.3,499.3s499.3-223.8,499.3-499.3C1300,223.8,1076.2,0,799.3,0
                            C523.8,0,300,223.8,300,499.3"/>
                        </defs>
                        <clipPath id="CIRCLE_3_">
                            <use xlink:href="#CIRCLE_2_"  overflow="visible"/>
                        </clipPath>
                        <rect x="300" clip-path="url(#CIRCLE_3_)" fill="#FFFFFF" width="1000" height="1000"/>
                    </g>
                </g>
                <path fill="#0E2346" d="M386.1,499.3c0-229.6,185.1-414.6,414.6-414.6s414.6,185.1,414.6,414.6s-185.1,414.6-414.6,414.6
                c-45.9,0-89-7.2-129.1-20.1c30.1-170.7,137.7-309.9,279.8-370.2c17.2,20.1,41.6,31.6,70.3,31.6c50.2,0,91.8-41.6,91.8-91.8
                s-41.6-91.8-91.8-91.8c-50.2,0-91.8,41.6-91.8,91.8c-182.2,54.5-330,182.2-404.6,345.8c-24.4-21.5-44.5-44.5-63.1-71.7
                C466.4,578.2,545.3,439,663,357.2c17.2,18.7,41.6,31.6,68.9,31.6c50.2,0,91.8-41.6,91.8-91.8c0-51.6-41.6-91.8-91.8-91.8
                c-50.2,0-91.8,41.6-91.8,91.8c0,2.9,0,5.7,0,8.6c-109,38.7-199.4,114.8-252.5,212.3C386.1,510.8,386.1,505,386.1,499.3"/>
                </svg>
                <a href="tel:+380934770672" class="mobile-menu__phone">+38 (093) 477-06-72</a><br/>
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17" height="17"
                     viewBox="0 0 141.1 137.6" enable-background="new 0 0 141.1 137.6" xml:space="preserve" class="header-phones__svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M97.8,5.3C85.3,8,75.9,19.2,75.9,32.6c0,0.3,0.1,0.6,0.1,0.9
                        c19.7,4.2,29.7,17.6,29.7,35.3c0,19.8-16.1,35.9-35.8,35.9c-19.7,0-38.1-16.5-38.1-41.1c0-30,25.5-58.1,61.8-58.9
                        c0.7,0,1.7,0,2.8,0.1C88.4,1.7,79.7,0,70.6,0C31.6,0,0,30.8,0,68.8c0,38,31.6,68.8,70.6,68.8c39,0,70.6-30.8,70.6-68.8
                        C141.1,40.2,123.2,15.7,97.8,5.3L97.8,5.3z"/>
                    <g>
                        <polygon fill="none" points="77.1,36.5 417.2,36.5 417.2,348.3 77.1,348.3 77.1,36.5"/>
                        <path fill="none" d="M247.1,192.4"/>
                    </g>
                </svg>
                <a href="tel:+380664770672" class="mobile-menu__phone">+38 (066) 477-06-72</a>
            </div>
            <div class="mobile-menu__mails">
                <p class="mobile-menu__title"><?php echo $text_ourmail; ?></p>
                <i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:sales@knushop.com.ua" class="mobile-menu__mail">sales@knushop.com.ua</a>
            </div>
            <div class="mobile-menu__mess">
                <p class="mobile-menu__title"><?php echo $text_messengers; ?></p>
                <div class="mess-items">
                    <div class="mess-item">
                        <a href="http://m.me/knushopkyiv" class="mess-item__li" target="_blank">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="40px" height="40px"
                            viewBox="300 0 1000 1000" enable-background="new 300 0 1000 1000" xml:space="preserve">
                            <path d="M800,0C523.9,0,300,207.3,300,462.9c0,145.7,72.7,275.6,186.3,360.5V1000l170.3-93.4
                            c45.4,12.6,93.6,19.4,143.4,19.4c276.1,0,500-207.3,500-462.9C1300,207.3,1076.1,0,800,0z M849.7,623.4L722.4,487.6L473.9,623.4
                            l273.3-290.1l130.4,135.8L1123,333.3L849.7,623.4z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="mess-item">
                        <a href="viber://add?number=380934770672" class="mess-item__li" target="_blank">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="40px" height="40px" viewBox="468.9 157.8 662.1 684.4" enable-background="new 468.9 157.8 662.1 684.4" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M1116.3,322.3l-0.2-0.8c-16-64.6-88-133.9-154.1-148.3l-0.7-0.2c-107-20.4-215.4-20.4-322.4,0l-0.8,0.2
                                        c-66.1,14.4-138.1,83.7-154.1,148.3l-0.2,0.8c-19.7,90.2-19.7,181.6,0,271.8l0.2,0.8c15.3,61.8,82,127.9,145.6,146.1v72.1
                                        c0,26.1,31.8,38.9,49.9,20.1l73-75.9c15.8,0.9,31.7,1.4,47.5,1.4c53.8,0,107.7-5.1,161.2-15.3l0.7-0.2
                                        c66.1-14.4,138.2-83.7,154.1-148.3l0.2-0.8C1136,504,1136,412.5,1116.3,322.3z M1058.5,581.1c-10.7,42.1-65.3,94.5-108.8,104.2
                                        c-56.9,10.8-114.2,15.4-171.5,13.9c-1.1,0-2.2,0.4-3,1.2c-8.1,8.3-53.3,54.7-53.3,54.7l-56.7,58.2c-4.1,4.3-11.4,1.4-11.4-4.6
                                        V689.3c0-2-1.4-3.6-3.3-4c0,0,0,0,0,0c-43.4-9.7-98.1-62.1-108.8-104.2c-17.8-81.5-17.8-164.2,0-245.7
                                        c10.7-42.1,65.3-94.5,108.8-104.2c99.3-18.9,200.1-18.9,299.4,0c43.5,9.7,98.1,62.1,108.8,104.2
                                        C1076.3,416.9,1076.3,499.6,1058.5,581.1z"/>
                                    <path d="M894.5,636.2c-6.7-2-13-3.4-19-5.8c-61.3-25.4-117.6-58.2-162.3-108.5c-25.4-28.6-45.3-60.8-62.1-95
                                        c-8-16.2-14.7-33-21.5-49.7c-6.2-15.2,3-31,12.6-42.5c9.1-10.8,20.8-19,33.4-25.1c9.9-4.7,19.6-2,26.8,6.4
                                        c15.6,18.1,29.9,37.1,41.5,58.1c7.1,12.9,5.2,28.7-7.8,37.5c-3.1,2.1-6,4.6-8.9,7.1c-2.6,2.1-5,4.2-6.7,7.1
                                        c-3.2,5.2-3.4,11.4-1.3,17.1c15.9,43.8,42.8,77.9,86.9,96.2c7.1,2.9,14.1,6.4,22.3,5.4c13.6-1.6,18-16.5,27.6-24.3
                                        c9.3-7.6,21.2-7.7,31.3-1.4c10,6.4,19.8,13.2,29.5,20.1c9.5,6.8,19,13.4,27.7,21.1c8.4,7.4,11.3,17.2,6.6,27.2
                                        c-8.7,18.4-21.3,33.8-39.6,43.6C906.5,633.5,900.3,634.4,894.5,636.2C887.8,634.2,900.3,634.4,894.5,636.2z"/>
                                    <path d="M800.2,288.5c80.1,2.2,145.9,55.4,160,134.6c2.4,13.5,3.3,27.3,4.3,41c0.4,5.8-2.8,11.2-9,11.3
                                        c-6.4,0.1-9.3-5.3-9.7-11.1c-0.8-11.4-1.4-22.9-3-34.2c-8.3-59.7-55.9-109.1-115.3-119.7c-8.9-1.6-18.1-2-27.1-3
                                        c-5.7-0.6-13.2-0.9-14.5-8.1c-1.1-6,4-10.7,9.7-11C797.1,288.4,798.6,288.5,800.2,288.5C880.3,290.7,798.6,288.5,800.2,288.5z"/>
                                    <path d="M921.9,446.3c-0.1,1-0.2,3.4-0.8,5.6c-2.1,8-14.3,9.1-17.1,0.9c-0.8-2.4-1-5.1-1-7.7
                                        c0-17-3.7-33.9-12.3-48.7c-8.8-15.2-22.2-27.9-38-35.7c-9.5-4.7-19.8-7.6-30.3-9.3c-4.6-0.8-9.2-1.2-13.8-1.9
                                        c-5.6-0.8-8.5-4.3-8.3-9.8c0.2-5.1,4-8.8,9.6-8.5c18.4,1,36.1,5,52.5,13.7c33.2,17.6,52.2,45.4,57.8,82.5c0.3,1.7,0.7,3.3,0.8,5
                                        C921.4,436.7,921.6,440.8,921.9,446.3C921.8,447.3,921.6,440.8,921.9,446.3z"/>
                                    <path d="M872.1,444.4c-6.7,0.1-10.3-3.6-11-9.7c-0.5-4.3-0.9-8.6-1.9-12.8c-2-8.2-6.4-15.8-13.3-20.9
                                        c-3.3-2.4-7-4.1-10.8-5.2c-4.9-1.4-10-1-14.9-2.2c-5.3-1.3-8.3-5.6-7.4-10.6c0.8-4.5,5.2-8.1,10.2-7.7
                                        c31.1,2.2,53.3,18.3,56.4,54.9c0.2,2.6,0.5,5.3-0.1,7.8C878.3,442.1,875.1,444.2,872.1,444.4C865.4,444.5,875.1,444.2,872.1,444.4
                                        z"/>
                                </g>
                            </g>
                            </svg>
                        </a>
                    </div>
                    <div class="mess-item">
                        <a href="whatsapp://send?phone=+380934770672" class="mess-item__li" target="_blank">
                            <i class="fa fa-whatsapp" aria-hidden="true"></i>
                        </a>
                    </div>
                    <div class="mess-item">
                        <a href="https://telegram.me/@knushop" class="mess-item__li" target="_blank">
                            <svg version="1.1" id="Слой_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="40px" height="40px"
                            viewBox="0 0 587.4 587.6" enable-background="new 0 0 587.4 587.6" xml:space="preserve">
                            <g>
                                <path d="M293.7,0C128.6,0.1,0.4,132,0,292.8c-0.4,162,128.5,293.8,293.7,294.8c165.5-1.1,293.7-132.9,293.7-293.7
                                C587.4,130.1,457.1-0.1,293.7,0z M435.7,212.8c-15.1,71.4-30.3,142.8-45.5,214.3c-0.8,3.5-1.9,7-3.5,10.2
                                c-3.3,6.6-8.8,9.1-15.9,6.9c-3.7-1.2-7.4-3-10.6-5.3c-22.4-16.3-44.7-32.9-67-49.3c-1-0.7-2-1.5-3.4-2.4
                                c-7.8,7.5-15.3,14.8-22.9,22c-4.9,4.7-9.7,9.4-14.7,13.9c-3.4,3-7.3,5.2-12.5,5.1c0.5-7.6,0.9-15,1.4-22.4
                                c1.2-16.3,2.3-32.7,3.6-49c0.1-1.8,1.1-3.9,2.4-5.1c43.6-39.6,87.2-79.1,130.9-118.6c1.4-1.3,2.9-2.5,4-3.9
                                c1.8-2.2,0.9-4.6-1.8-4.2c-3.2,0.4-6.5,1.6-9.3,3.3c-9.3,5.6-18.4,11.5-27.6,17.3c-45.6,28.8-91.3,57.6-137,86.3
                                c-1.5,0.9-3.8,1.4-5.4,0.9c-23-7.1-46-14.3-69-21.5c-2.6-0.8-5.2-1.8-7.6-3.2c-6-3.5-6.9-9.5-1.5-13.8c3.8-3,8.4-5.4,13-7.2
                                c37.3-14.6,74.7-28.9,112.1-43.3c55.6-21.5,111.3-42.9,166.9-64.3c2.1-0.8,4.2-1.5,6.4-2.1c9.4-2.3,17.6,3.4,17.5,13.1
                                C438.6,197.8,437.2,205.3,435.7,212.8z"/>
                            </g>
                        </svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="mobile-menu__call">
                <button class="btn mobile-menu__btn js_callback" data-modal="#callback-modal"><i class="fa fa-phone" aria-hidden="true"></i> <?php echo $text_zvon; ?></button>
            </div>
        </div>
    </div>
</div>
<span class="body-cover menu-closer"></span>