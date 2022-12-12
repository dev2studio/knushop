<div class="header-wrapper header3 fixed-header-possible">
    <?php if ($top_line_style) { ?>
    <div class="top_line">
        <div class="container <?php echo $top_line_width; ?>">
            <div class="top_line__flex">
                <div class="top_line__phone-box">
                    <a href="tel:+380934770672" class="top_line__phone"><i class="fa fa-phone" aria-hidden="true"></i>+38 (093) 477-06-72</a>
                </div>
                <div class="links top-nav" style="text-align: center;">
                    <ul>
                        <li class="static-link">
                            <a class="top-nav__link" href="http://www.univ.kiev.ua/" target="_blank" title="<?php echo $text_univer; ?>"><?php echo $text_univer; ?></a>
                        </li>
                        <?php require('catalog/view/theme/basel/template/common/static_links.tpl'); ?>
                    </ul>
                </div>              
                <div class="links top_functional" style="text-align: right;">
                    <?php if ($lang_curr_title) { ?>
                    <div class="setting-ul">
                        <div class="setting-li dropdown-wrapper from-left lang-curr-trigger nowrap">
                            <span><?php echo $text_lang_title; ?></span>
                            <div class="dropdown-content dropdown-right lang-curr-wrapper">
                                <?php echo $language; ?>
                                <?php echo $currency; ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <div class="top_login">
                        <a class="anim-underline" href="<?php echo $account; ?>"><i class="table-cell links fa fa-user" aria-hidden="true"></i> </a>
                        <span class="hidden-xs"> <a class="anim-underline" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    
    <!-- Don't delete this element -->
    <span class="table header-main sticky-header-placeholder">&nbsp;</span>

    <!-- sticky-header -->
    <div class="outer-container sticky-header">
        <!-- header main -->
        <div class="header-style">
            <div class="container <?php echo $main_header_width; ?>">
                <div class="header-main">

                    <div class="menu-cell header-logo">
                        <a class="header-logo__link" href="http://knushop.com.ua/">
                            <div class="logo-box">
                                <?php if ($logo) { ?>
                                <div id="logo">
            	                   <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                                </div>
                                <?php } ?>
                                 <?php echo $promo_message2; ?>
                                <div class="logo-box__text menu-cell hidden-sx hidden-sm hidden-xs" >
                                    <h2><?php echo $text_titl1; ?><br/><?php echo $text_titl2; ?></h2>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="header-info">
                        <?php if ($header_login) { ?>

	                    <!-- <div class=" shortcut-wrapper search-trigger from-top clicker shortcut-wrapper hidden-sx hidden-sm hidden-xs"> -->
                        <div class="header-phones">
                            <div class="header-phones__content">
                                <a href="https://www.instagram.com/knushopkyiv/" target="_blank" class="insta"><img src="https://knushop.com.ua/catalog/view/theme/basel/image/insta-im.svg" alt=""></a>
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17" height="17"
                                viewBox="300 0 1000 1000" enable-background="new 300 0 1000 1000" xml:space="preserve" class="header-phones__svg">
                                <g>
                                    <g>
                                        <path id="SVGID_1_" fill="#0E2346" d="M300,499.3c0,275.5,223.8,499.3,499.3,499.3s499.3-223.8,499.3-499.3
                                        C1300,223.8,1076.2,0,799.3,0C523.8,0,300,223.8,300,499.3"/>
                                    </g>
                                    <g>
                                        <defs>
                                            <path id="SVGID_2_" d="M300,499.3c0,275.5,223.8,499.3,499.3,499.3s499.3-223.8,499.3-499.3C1300,223.8,1076.2,0,799.3,0
                                            C523.8,0,300,223.8,300,499.3"/>
                                        </defs>
                                        <clipPath id="SVGID_3_">
                                            <use xlink:href="#SVGID_2_"  overflow="visible"/>
                                        </clipPath>
                                        <rect x="300" clip-path="url(#SVGID_3_)" fill="#0E2346" width="1000" height="1000"/>
                                    </g>
                                </g>
                                <path fill="#FFFFFF" d="M386.1,499.3c0-229.6,185.1-414.6,414.6-414.6s414.6,185.1,414.6,414.6s-185.1,414.6-414.6,414.6
                                c-45.9,0-89-7.2-129.1-20.1c30.1-170.7,137.7-309.9,279.8-370.2c17.2,20.1,41.6,31.6,70.3,31.6c50.2,0,91.8-41.6,91.8-91.8
                                s-41.6-91.8-91.8-91.8c-50.2,0-91.8,41.6-91.8,91.8c-182.2,54.5-330,182.2-404.6,345.8c-24.4-21.5-44.5-44.5-63.1-71.7
                                C466.4,578.2,545.3,439,663,357.2c17.2,18.7,41.6,31.6,68.9,31.6c50.2,0,91.8-41.6,91.8-91.8c0-51.6-41.6-91.8-91.8-91.8
                                c-50.2,0-91.8,41.6-91.8,91.8c0,2.9,0,5.7,0,8.6c-109,38.7-199.4,114.8-252.5,212.3C386.1,510.8,386.1,505,386.1,499.3"/>
                                </svg>
                                <a href="tel:+380934770672" class="header-phones__link">+38 (093) 477-06-72</a><br/>
                                <a href="https://www.facebook.com/knushopkyiv/" target="_blank" class="facebook"><img src="https://knushop.com.ua/catalog/view/theme/basel/image/fb-im.svg" alt=""></a>
                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17" height="17"
                                     viewBox="0 0 141.1 137.6" enable-background="new 0 0 141.1 137.6" xml:space="preserve" class="header-phones__svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" fill="#0E2346" d="M97.8,5.3C85.3,8,75.9,19.2,75.9,32.6c0,0.3,0.1,0.6,0.1,0.9
                                        c19.7,4.2,29.7,17.6,29.7,35.3c0,19.8-16.1,35.9-35.8,35.9c-19.7,0-38.1-16.5-38.1-41.1c0-30,25.5-58.1,61.8-58.9
                                        c0.7,0,1.7,0,2.8,0.1C88.4,1.7,79.7,0,70.6,0C31.6,0,0,30.8,0,68.8c0,38,31.6,68.8,70.6,68.8c39,0,70.6-30.8,70.6-68.8
                                        C141.1,40.2,123.2,15.7,97.8,5.3L97.8,5.3z"/>
                                    <g>
                                        <polygon fill="none" points="77.1,36.5 417.2,36.5 417.2,348.3 77.1,348.3 77.1,36.5"/>
                                        <path fill="none" d="M247.1,192.4"/>
                                    </g>
                                </svg>
                                <a href="tel:+380664770672" class="header-phones__link">+38 (066) 477-06-72</a>
                            </div>
                        </div>
                        <div class="header-feedback">
                            <button class="btn-feedback js_callback" data-modal="#callback-modal"><?php echo $text_zvon; ?></button>
                        </div>
                        <?php } ?>
                    
            <!--<?php if ($logged) { ?>-->
            <!--<a class="anim-underline" href="<?php echo $account; ?>"><?php echo $text_account; ?></a> &nbsp;/&nbsp;-->
            <!--<a class="anim-underline" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>-->
            <!--<?php } else { ?>-->
            <!--<a class="anim-underline" href="<?php echo $login; ?>"><?php echo $text_login; ?> / <?php echo $text_register; ?></a>-->
            <!--<?php } ?>-->


                    <!-- Search -->
                        <?php if ($header_search) { ?>
                        <div class="icon-element">
                            <div class="top-search dropdown-wrapper-click from-top hidden-sx hidden-sm hidden-xs " style="padding: 0 25px;">
                                <a class="shortcut-wrapper search-trigger from-top clicker">
                                    <i class="icon-magnifier icon"></i>
                                </a>
                                <div class="dropdown-content dropdown-right" style="position: fixed;">
                                    <div class="search-dropdown-holder">
                                        <div class="search-holder">
                                            <?php echo $basel_search; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        <!-- Search end -->
                        <div class="mobile-social">
                            <a href="https://www.instagram.com/knushopkyiv/" target="_blank" class="insta"><img src="https://knushop.com.ua/catalog/view/theme/basel/image/insta-im.svg" alt=""></a>
                            <a href="https://www.facebook.com/knushopkyiv/" target="_blank" class="facebook"><img src="https://knushop.com.ua/catalog/view/theme/basel/image/fb-im.svg" alt=""></a>
                        </div>
                        <!-- cart -->
                        <div class="icon-element catalog_hide">
                            <div id="cart" class="dropdown-wrapper from-top">
                                <a href="<?php echo $shopping_cart; ?>" class="shortcut-wrapper cart">
                                    <i id="cart-icon" class="global-cart icon"></i> <span id="cart-total" class="nowrap">
                                    <span class="counter cart-total-items"><?php echo $cart_items; ?></span>
                                    <span class="slash hidden-md hidden-sm hidden-xs">/</span>&nbsp;<b class="cart-total-amount hidden-sm hidden-xs"><?php echo $cart_amount; ?></b></span>
                                </a>
                                <div class="dropdown-content dropdown-right hidden-sm hidden-xs">
                                    <?php echo $cart; ?>
                                </div>
                            </div>
                        </div><!-- cart and -->
                        <!-- burger menu -->
                        <div class="icon-element">
                            <a class="shortcut-wrapper menu-trigger hidden-md hidden-lg">
                                <i class="icon-line-menu icon"></i>
                            </a>
                        </div> <!-- burger menu end -->
                    </div> <!-- header-info end -->
                </div> <!-- .table.header_main ends -->
            </div> <!-- .container ends -->
        </div>



        <!-- Header nav -->
        <?php if($primary_menu) { ?>
        <div class="outer-container menu-style menu-style-contrast hidden-xs hidden-sm">
            <div class="container">
                <div class="main-menu text-center">
                    <ul class="categories">
                      <?php if($primary_menu == 'oc') { ?>
                      <!-- Default menu -->
                      <?php require('catalog/view/theme/basel/template/common/menus/default_menu.tpl'); ?>
                      <?php } else if (isset($primary_menu)) { ?>
                      <!-- Mega menu -->
                      <?php foreach($primary_menu_desktop as $key=> $row) { ?>
                      <?php require('catalog/view/theme/basel/template/common/menus/mega_menu.tpl'); ?>
                      <?php } ?>
                      <?php } ?>
                    </ul>
                </div>
            </div>
        </div> <!-- Header nav end -->
    <?php } ?>
    </div> <!-- Sticky-header end -->

</div> <!-- .header_wrapper ends -->