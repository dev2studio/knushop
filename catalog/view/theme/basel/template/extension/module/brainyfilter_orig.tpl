<?php
/**
 * Brainy Filter Ultimate 5.1.1 OC2.3, September 22, 2016 / brainyfilter.com 
 * Copyright 2015-2016 Giant Leap Lab / www.giantleaplab.com 
 * License: Commercial. Reselling of this software or its derivatives is not allowed. You may use this software for one website ONLY including all its subdomains if the top level domain belongs to you and all subdomains are parts of the same OpenCart store. 
 * Support: http://support.giantleaplab.com
 */
//$isHorizontal = $layout_position === 'content_top' or layout_position === 'content_bottom';
$isHorizontal = false;
$isResponsive = (bool) $settings.style.responsive.enabled;
$responsivePos = $settings.style.responsive.position === 'right' ? 'bf-right' : 'bf-left';

if (!function_exists('totalsDecorator')) {
    function totalsDecorator($groupId, $val, $totals = array(), $selected = array()) {
        if (!isset($totals[$groupId][$val]) && !isset($selected[$groupId])) {
            return '';
        }

        $total = isset($totals[$groupId][$val]) ? $totals[$groupId][$val] : 0;
        $addPlusSign = isset($selected[$groupId]);

        return '<span class="bf-count ' . (!$total ? 'bf-empty' : '') . '">' . ($addPlusSign ? '+' : '') . $total . '</span>';
    }
}
if (!function_exists('isEmptyStock')) {
    function isEmptyStock($groupId, $val, $postponedCount, $totals = array(), $selected = array()) {
        $inStock = $postponedCount || (isset($totals[$groupId][$val]) and totals[$groupId][$val]);
        $inSelected = isset($selected[$groupId]) && in_array($val, $selected[$groupId]);
        return !$inStock && !$inSelected;
    }
}

?>

<?php if (count($filters)) : ?>

<div class="filter-container">

<div class="bf-panel-wrapper{% if isResponsive) : ?> bf-responsive<?php endif }} {{ responsivePos }} bf-layout-id-{{ layout_id;?>">
    <div class="bf-btn-show"></div>
    <a class="bf-btn-reset" onclick="BrainyFilter.reset();"></a>
    
    
    
    
    <div class="widget bf-check-position {% if isHorizontal) : ?>bf-horizontal<?php endif }}">
        <!--
        <div class="widget-title box-heading">
        <p class="main-title"><span>{{ lang_block_title }}</span></p>
        {% if isHorizontal) : ?><a class="bf-toggle-filter-arrow"></a><input type="reset" class="bf-buttonclear" onclick="BrainyFilter.reset();" value="{{ reset }}" /><?php endif }}
        <p class="widget-title-separator"><i class="icon-line-cross"></i></p>
        </div>
        -->
        
        <div class="brainyfilter-panel {% if settings.submission.hide_panel) : ?>bf-hide-panel<?php endif }}">
            <form class="bf-form 
                    {% if settings.behaviour.product_count) : ?> bf-with-counts<?php endif }} 
                    {% if settings.behaviour.rounded_img) : ?> bf-rounded-img<?php endif }} 
                    {% if settings.behaviour.attribute_groups) : ?> bf-show-attribute-titles<?php endif }} 
                    
                    {% if sliding) : ?> bf-with-sliding<?php endif }}
                    {% if settings.submission.submit_type === 'button' and settings.submission.submit_button_type === 'float') : ?> bf-with-float-btn<?php endif }}
                    {% if limit_height) : ?> bf-with-height-limit<?php endif }}"
                  data-height-limit="{{ limit_height_opts }}"
                  data-visible-items="{{ slidingOpts }}"
                  data-hide-items="{{ slidingMin }}"
                  data-submit-type="{{ settings.submission.submit_type }}" 
                  data-submit-typekeeper="{{ settings.submission.submit_type }}"
                  data-submit-delay="<?php echo (int)$settings.submission.submit_delay_time }}"
                  data-resp-max-width="<?php echo (int)$settings.style.responsive.max_width }}"
                  data-resp-collapse="<?php echo (int)$settings.style.responsive.collapsed }}"
                  data-resp-max-scr-width ="<?php echo (int)$settings.style.responsive.max_screen_width }}"
                  method="get" action="index.php">
                {% if currentRoute === 'product/search') : ?>
                <input type="hidden" name="route" value="product/search" />
                <?php else : ?>
                <input type="hidden" name="route" value="product/category" />
                <?php endif }}
                {% if currentPath) : ?>
                <input type="hidden" name="path" value="{{ currentPath }}" />
                <?php endif }}
                {% if manufacturerId) : ?>
                <input type="hidden" name="manufacturer_id" value="{{ manufacturerId }}" />
                <?php endif }}
				
                <div class="filters-holder">
                
                {% for filters in i => $section) : ?>
                        
                    {% if section.type == 'price') : ?>
                        <?php $sliderType = $section.control === 'slider_lbl_inp' ? 3 : ($section.control === 'slider_lbl' ? 2 : 1) }}
                        <?php $inputType  = in_array($sliderType, array(1, 3)) ? 'text' : 'hidden' }}
                        <div class="bf-attr-block bf-price-filter {% if isHorizontal && isset($filters[$i + 1]) and filters[$i + 1].type === 'search') : ?>bf-left-half<?php endif }}">
                        <div class="bf-attr-header{% if section.collapsed) : ?> bf-collapse<?php endif }}<?php if (!$i) : ?> bf-w-line<?php endif }}">
                            {{ lang_price }}<span class="bf-arrow"></span>
                        </div>
                        <div class="bf-attr-block-cont">
                            <div class="bf-price-container box-content bf-attr-filter">
                                
                                <div class="bf-price-slider-container {% if sliderType === 2 or sliderType === 3): ?>bf-slider-with-labels<?php endif }}">
                                    <div class="bf-slider-range" data-slider-type="{{ sliderType }}"></div>
                                </div>
                                <?php if (in_array($sliderType, array(1, 3))) : ?>
                                <div class="bf-cur-symb">
                                    <input type="hidden" class="bf-range-min" name="bfp_price_min" value="{{ lowerlimit }}" size="4" />
                                    <input type="hidden" class="bf-range-max" name="bfp_price_max" value="{{ upperlimit }}" size="4" /> 
                                {{ lang_text_price }} 
                                <b>{{ currency_symbol }}<span id="bf-price-min">{{ lowerlimit }}</span></b> —
                                <b>{{ currency_symbol }}<span id="bf-price-max">{{ upperlimit }}</span></b>
                                </div>
                                <?php else : ?>
                                <input type="hidden" class="bf-range-min" name="bfp_price_min" value="{{ lowerlimit }}" />
                                <input type="hidden" class="bf-range-max" name="bfp_price_max" value="{{ upperlimit }}" /> 
                                <?php endif }}
                                
                            </div>
                        </div>
                        </div>
                
                    <?php elseif ($section.type == 'search') : ?>
                
                        <div class="bf-attr-block bf-keywords-filter {% if isHorizontal && isset($filters[$i + 1]) and filters[$i + 1].type === 'price') : ?>bf-left-half<?php endif }}">
                        <div class="bf-attr-header{% if section.collapsed) : ?> bf-collapse<?php endif }}<?php if (!$i) : ?> bf-w-line<?php endif }}">
                            {{ lang_search }}<span class="bf-arrow"></span>
                        </div>
                        <div class="bf-attr-block-cont">
                            <div class="bf-search-container bf-attr-filter">
                                <div>
                                    <input type="text" class="bf-search" placeholder="{{ lang_search_placeholder }}" name="bfp_search" value="{{ bfSearch }}" /> 
                                </div>
                            </div>
                        </div>
                        </div>
                        
                    <?php elseif ($section.type == 'category') : ?>
                        
                        <div class="bf-attr-block">
                        <div class="bf-attr-header{% if section.collapsed) : ?> bf-collapse<?php endif }}<?php if (!$i) : ?> bf-w-line<?php endif }}">
                            {{ lang_categories }}<span class="bf-arrow"></span>
                        </div>
                        <div class="bf-attr-block-cont">
                            <?php $groupUID = 'c0' }}

                            {% if section.control == 'select') : ?>
                            <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row">
                                <div class="bf-cell">
                                    <select name="<?php echo "bfp_{$groupUID}" }}">
                                        <option value="" class="bf-default">{{ default_value_select }}</option>
                                        {% for section.values in cat) : $catId = $cat.id ?>
                                            <?php $isSelected = isset($selected[$groupUID]) && in_array($catId, $selected[$groupUID]) }}
                                            <option value="{{ catId }}" class="bf-attr-val" {% if isSelected) : ?>selected="true"<?php endif }}>
                                                <?php echo str_repeat('-', $cat.level) . ' ' . $cat.name }}
                                            </option>
                                        <?php endforeach }}
                                    </select>
                                </div>
                            </div>
                            <?php else : ?>
                                {% for section.values in cat) : $catId = $cat.id }}
                                <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row {% if totals) && isEmptyStock($groupUID, $catId, $postponedCount, $totals, $selected) and settings.behaviour.hide_empty): ?>bf-disabled<?php endif }}">
                                    <span class="bf-cell bf-c-1">
                                        <input id="bf-attr-{{ groupUID . '_' . $catId . '_' . $layout_id }}"
                                               data-filterid="bf-attr-{{ groupUID . '_' . $catId }}"
                                               type="{{ section.control }}" 
                                               name="<?php echo "bfp_{$groupUID}" }}{% if section.control === 'checkbox') { echo "_{$catId}"; } ?>"
                                               value="{{ catId }}" 
                                               {% if selected[$groupUID]) && in_array($catId, $selected[$groupUID])) : ?>checked="true"<?php endif }} />
                                               <label for="bf-attr-{{ groupUID . '_' . $catId . '_' . $layout_id }}"></label>
                                    </span>
                                    <span class="bf-cell bf-c-2 bf-cascade-{{ cat.level }}">
                                        <span class="bf-hidden bf-attr-val">{{ catId }}</span>
                                        <label for="bf-attr-{{ groupUID . '_' . $catId . '_' . $layout_id }}" class="bf-attr-{{ groupUID . '_' . $catId }}">
                                            {{ cat.name }}
                                        </label>
                                    </span>
                                    <span class="bf-cell bf-c-3">{% if totals)) echo totalsDecorator($groupUID, $catId, $totals, $selected) }}</span>
                                </div>
                                <?php endforeach }}
                            <?php endif }}
                        </div>
                        </div>
                
                    <?php else : ?>
                        
                        <?php $curGroupId = null }}
                        {% for section.array in groupId => $group) : ?>
                            {% if group.group_id) and settings.behaviour.attribute_groups) : ?>
                                {% if curGroupId != $group.group_id) : ?>
                                    <div class="bf-attr-group-header">{{ group.group }}</div>
                                    <?php $curGroupId = $group.group_id }}
                                <?php endif }}
                                
                            <?php endif }}
                            
                            
                            <?php $groupUID = substr($section.type, 0, 1) . $groupId }}
                            <div class="bf-attr-block<?php if (in_array($group.type, array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?> bf-slider<?php endif }}">
                            <div class="bf-attr-header{% if group.group_id)) echo ' spec' }}{% if section.collapsed) : ?> bf-collapse<?php endif }}<?php if (!$i) : ?> bf-w-line<?php endif }}">
                                {{ group.name }}<span class="bf-arrow"></span>
                            </div>
                            <div class="bf-attr-block-cont">
                                <?php $group.type = isset($group.type) ? $group.type : 'checkbox' }}
                                
                                {% if group.type == 'select') : ?>
                                
                                    <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row">
                                        <div class="bf-cell">
                                            <select name="<?php echo "bfp_{$groupUID}" }}">
                                                <option value="" class="bf-default">{{ default_value_select }}</option>
                                                {% for group.values in value) : ?>
                                                    <?php $isSelected = isset($selected[$groupUID]) && in_array($value.id, $selected[$groupUID]) }}
                                                    <option value="{{ value.id }}" class="bf-attr-val" {% if isSelected) : ?>selected="true"<?php endif }}
                                                        <?php if(!isset($totals[$groupUID][$value.id]) && !$isSelected): ?>
                                                            disabled="disabled"
                                                        <?php endif }}
                                                        {% if totals[$groupUID][$value.id]) && !$isSelected) : ?>
                                                            data-totals="<?php echo (isset($totals[$groupUID][$value.id]) ? $totals[$groupUID][$value.id] : 0) }}"
                                                        <?php endif }}>
                                                        {{ value.name }}
                                                    </option>
                                                <?php endforeach }}
                                            </select>
                                        </div>
                                    </div>
                                
                                <?php elseif (in_array($group.type, array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?>
                                
                                <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row">
                                    <div class="bf-cell">
                                        <div class="bf-slider-inputs">
                                            <?php $isMinSet = isset($selected[$groupUID].min) }}
                                            <?php $isMaxSet = isset($selected[$groupUID].max) }}
                                            <?php $sliderType = $group.type === 'slider_lbl_inp' ? 3 : ($group.type === 'slider_lbl' ? 2 : 1) }}
                                            <input type="hidden" name="bfp_min_{{ groupUID }}" value="{{ isMinSet ? $selected[$groupUID].min : 'na' }}" class="bf-attr-min-{{ groupUID }}" data-min-limit="{{ group.min.s }}" />
                                            <input type="hidden" name="bfp_max_{{ groupUID }}" value="{{ isMaxSet ? $selected[$groupUID].max : 'na' }}" class="bf-attr-max-{{ groupUID }}" data-max-limit="{{ group.max.s }}" /> 
                                            {% if group.type !== 'slider_lbl') : ?>
                                            <?php $minLbl = ''; $maxLbl = '';
                                                if ($isMinSet) {
                                                    foreach ($group.values in v) {
                                                        if ($v.s == $selected[$groupUID].min) {
                                                            $minLbl = $v.n;
                                                            break;
                                                        }
                                                    } 
                                                }
                                                if ($isMaxSet) {
                                                    foreach ($group.values in v) {
                                                        if ($v.s == $selected[$groupUID].max) {
                                                            $maxLbl = $v.n;
                                                            break;
                                                        }
                                                    } 
                                                }
                                            ?>
                                            <input type="text" name="" class="bf-slider-text-inp-min bf-slider-input" value="{{ minLbl }}" placeholder="{{ lang_empty_slider }}" />
                                            <span class="ndash">&#8211;</span>
                                            <input type="text" name="" class="bf-slider-text-inp-max bf-slider-input" value="{{ maxLbl }}" placeholder="{{ lang_empty_slider }}" />
                                            <?php endif }}
                                        </div>
                                        <div class="bf-slider-container-wrapper {% if sliderType === 2 or sliderType === 3): ?>bf-slider-with-labels<?php endif }}">
                                            <div class="bf-slider-container" data-slider-group="{{ groupUID }}" data-slider-type="{{ sliderType }}"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <?php elseif ($group.type === 'grid') : ?>
                                
                                <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row">
                                    <div class="bf-grid">
                                        {% for group.values in value) : ?>
                                        <?php $valueId  = $value.id }}
                                        
                                        <div class="bf-grid-item">
                                            <input id="bf-attr-{{ groupUID . '_' . $valueId . '_' . $layout_id }}" class="bf-hidden"
                                                    data-filterid="bf-attr-{{ groupUID . '_' . $valueId }}"
                                                    type="checkbox" 
                                                    name="<?php echo "bfp_{$groupUID}" }}"
                                                    value="{{ valueId }}" 
                                                    {% if selected[$groupUID]) && in_array($valueId, $selected[$groupUID])) : ?>checked="checked"<?php endif }} />
                                            <label for="bf-attr-{{ groupUID . '_' . $valueId . '_' . $layout_id }}" class="bf-attr-{{ groupUID . '_' . $valueId }}"><div class="img_wrap"><img src="image/{{ value.image;?>" data-toggle="tooltip" data-title="{{ value.name }}" /></div>
                                            </label>
                                            <span class="bf-hidden bf-attr-val">{{ valueId }}</span>
                                        </div>
                                        
                                        <?php endforeach }}
                                    </div>
                                </div>
                                
                                <?php else : ?>
                                
                                    {% for group.values in value) : ?>
                                    <?php $valueId  = $value.id }}
                                    <div class="bf-attr-filter bf-attr-{{ groupUID }} bf-row <?php 
                                    if (isset($totals) && isEmptyStock($groupUID, $valueId, $postponedCount, $totals, $selected) and settings.behaviour.hide_empty):
                                        ?>bf-disabled<?php endif }}">
                                        <span class="bf-cell bf-c-1">
                                            <input id="bf-attr-{{ groupUID . '_' . $valueId . '_' . $layout_id }}"
                                                   data-filterid="bf-attr-{{ groupUID . '_' . $valueId }}"
                                                   type="{{ group.type }}" 
                                                   name="<?php echo "bfp_{$groupUID}" }}{% if group.type === 'checkbox') { echo "_{$valueId}"; } ?>"
                                                   value="{{ valueId }}" 
                                                   {% if selected[$groupUID]) && in_array($valueId, $selected[$groupUID])) : ?>checked="true"<?php endif }} />
                                                   <label for="bf-attr-{{ groupUID . '_' . $valueId . '_' . $layout_id }}"></label>                                        </span>
                                        <span class="bf-cell bf-c-2 {% if section.type == 'rating') echo 'bf-rating-' . $valueId }}">
                                            <span class="bf-hidden bf-attr-val">{{ valueId }}</span>
                                            <label for="bf-attr-{{ groupUID . '_' . $valueId . '_' . $layout_id }}" 
                                            class="bf-attr-{{ groupUID . '_' . $valueId }} 
                                            {% if selected[$groupUID]) && in_array($valueId, $selected[$groupUID])) : ?> is-selected<?php endif }}">
                                                {% if section.type === 'option') : ?>
                                                    {% if group.mode === 'img' or group.mode === 'img_label') : ?>
                                                    <div class="img_wrap"><img src="image/{{ value.image;?>" alt="{{ value.name }}" /></div>
                                                    <?php endif }}
                                                    {% if group.mode === 'label' or group.mode === 'img_label') : ?>
                                                        {{ value.name }}
                                                    <?php endif }}
                                                <?php else : ?>
                                                    {{ value.name }}
                                                <?php endif }}
                                            </label>
                                        </span>
                                        <span class="bf-cell bf-c-3">{% if totals)) echo totalsDecorator($groupUID, $valueId, $totals, $selected) }}</span>
                                    </div>
                                    <?php endforeach }}
                                <?php endif }}
                            </div>
                            </div>
                        <?php endforeach }}
                    <?php endif }}
                    
                <?php endforeach }}
                <?php if (!$isHorizontal or settings.submission.submit_type == 'button') : ?>
                <div class="bf-buttonclear-box hidden-xs"{% if isHorizontal and settings.submission.submit_button_type == 'float') : ?>style="display:none;"<?php endif }}>
                <input type="button" value="{{ lang_submit }}" class="btn btn-primary bf-buttonsubmit" onclick="BrainyFilter.sendRequest(jQuery(this));BrainyFilter.loadingAnimation();return false;" {% if settings.submission.submit_button_type != 'fix' and settings.submission.submit_type != 'button' )  : ?>style="display:none;" <?php endif }} />
                   <?php if (!$isHorizontal) : ?><input type="reset" class="btn btn-primary bf-buttonclear" onclick="BrainyFilter.reset();return false;" value="{{ reset }}" /><?php endif }}  
                </div><?php endif }}
                <!-- Basel -->
                </div>
                <div class="fixed-filter-btn-holder hidden-sm hidden-md hidden-lg">
                <a class="bf-btn-submit btn btn-contrast" onclick="BrainyFilter.sendRequest();">{{ lang_submit }}</a>
                <a class="btn btn-default bf-buttonclear" onclick="BrainyFilter.reset();return false;">{{ reset }}</a>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
// Basel
$(document).ready(function() {
$('.filter-trigger-btn').addClass('active').html('<i class="icon-line-menu icon"></i> <b>{{ lang_filter_trigger }}</b>');
});
</script>
<script>
var bfLang = {
    show_more : '{{ lang_show_more }}',
    show_less : '{{ lang_show_less }}',
    empty_list : '{{ lang_empty_list }}'
};
BrainyFilter.requestCount = BrainyFilter.requestCount || {{ settings.behaviour.product_count ? 'true' : 'false' }};
BrainyFilter.requestPrice = BrainyFilter.requestPrice || {{ settings.behaviour.sections.price.enabled ? 'true' : 'false' }};
BrainyFilter.separateCountRequest = BrainyFilter.separateCountRequest || {{ postponedCount ? 'true' : 'false' }};
BrainyFilter.min = BrainyFilter.min || {{ priceMin }};
BrainyFilter.max = BrainyFilter.max || {{ priceMax }};
BrainyFilter.lowerValue = BrainyFilter.lowerValue || {{ lowerlimit }}; 
BrainyFilter.higherValue = BrainyFilter.higherValue || {{ upperlimit }};
BrainyFilter.currencySymb = BrainyFilter.currencySymb || '{{ currency_symbol }}';
BrainyFilter.hideEmpty = BrainyFilter.hideEmpty || <?php echo (int)$settings.behaviour.hide_empty }};
BrainyFilter.baseUrl = BrainyFilter.baseUrl || "{{ base }}";
BrainyFilter.currentRoute = BrainyFilter.currentRoute || "{{ currentRoute }}";
BrainyFilter.selectors = BrainyFilter.selectors || {
    'container' : '{{ settings.behaviour.containerSelector }}',
    'paginator' : '{{ settings.behaviour.paginatorSelector }}'
};
{% if redirectToUrl) : ?>
BrainyFilter.redirectTo = BrainyFilter.redirectTo || "{{ redirectToUrl }}";
<?php endif }}
jQuery(function() {
    if (! BrainyFilter.isInitialized) {  
        BrainyFilter.isInitialized = true;
        var def = jQuery.Deferred();
        def.then(function() {
            if('ontouchend' in document && jQuery.ui) {
                jQuery('head').append('<script src="catalog/view/javascript/jquery.ui.touch-punch.min.js"></script' + '>');
            }
        });
        if (typeof jQuery.fn.slider === 'undefined') {
            jQuery.getScript('catalog/view/javascript/jquery-ui.slider.min.js', function(){
                def.resolve();
                jQuery('head').append('<link rel="stylesheet" href="catalog/view/theme/basel/stylesheet/jquery-ui.slider.min.css" type="text/css" />');
                BrainyFilter.init();
            });
        } else {
            def.resolve();
            BrainyFilter.init();
        }
    }
});
BrainyFilter.sliderValues = BrainyFilter.sliderValues || {};
<?php if (count($filters)) : ?>
{% for filters in i => $section) : ?>
{% if section.array) && count($section.array)) : ?>
{% for section.array in groupId => $group) : ?>
<?php $groupUID = substr($section.type, 0, 1) . $groupId }}
<?php if (in_array($group.type, array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?>
BrainyFilter.sliderValues.{{ groupUID }} = <?php echo json_encode($group.values) }};
<?php endif }}
<?php endforeach }}
<?php endif }}
<?php endforeach }}
<?php endif }}
</script>
<?php endif; 