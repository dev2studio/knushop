<?php echo $header; ?>
<div class="container full-width">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 id="page-title"><?php echo $heading_title; ?></h1>


      <div class="cart-succes__wrapper">
        <div class="cart-succes__img">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 500" enable-background="new 0 0 500 500" xml:space="preserve">
            <path fill="#EDEDED" d="M500,250c0,27.7-4.5,54.4-12.8,79.3C454,428.5,360.3,500,250,500c-17,0-33.7-1.7-49.8-5C86,472,0,371,0,250
            C0,111.9,111.9,0,250,0S500,111.9,500,250z"/>
            <path fill="#FFFFFF" d="M401.6,203.5L230.8,374.2c-4.5,5.6-11.2,7.8-17.9,7.8h-1.1c-7.8,0-14.5-3.4-19-7.8L82.4,263.7
            c-0.5-0.5-0.9-1-1.4-1.5c-2.7-3.1-4.5-6.7-5.4-10.5c-2.1-8.6,0.1-18.2,6.7-24.8l23.4-23.4c10-10,26.8-10,36.8,0l70.3,70.3
            l129.5-130.6c10-10,26.8-10,36.8,0l23.4,23.4c1.1,1.1,2.1,2.3,3,3.6c1.2,1.8,2.2,3.7,2.9,5.7C411.9,185.2,409.7,196.1,401.6,203.5z"
            />
            <g>
              <path fill="#00479B" d="M408.6,176c-0.7-2-1.7-3.9-2.9-5.7c-0.9-1.3-1.9-2.5-3-3.6l-23.4-23.4c-10-10-26.8-10-36.8,0L213,273.8
              l-70.3-70.3c-10-10-26.8-10-36.8,0l-23.4,23.4c-6.6,6.6-8.9,16.2-6.7,24.8c0.9,3.8,2.7,7.4,5.4,10.5c0.4,0.5,0.9,1,1.4,1.5
              l110.5,110.5c4.5,4.5,11.2,7.8,19,7.8h1.1c6.7,0,13.4-2.2,17.9-7.8l170.8-170.8C409.7,196.1,411.9,185.2,408.6,176z M387.1,187.8
              L216.3,358.6c-1.1,1.1-2.2,1.1-2.2,1.1H213c-1.1,0-2.2,0-2.2-1.1L100.3,248.1c-2.2-2.2-2.2-4.5-1.1-5.6l23.4-23.4
              c1.1-1.1,2.2-1.1,2.2-1.1s2.2,0,2.2,1.1l78.1,78.1c4.5,4.5,11.2,4.5,15.6,0l138.4-138.4c2.2-2.2,3.3-2.2,5.6,0l23.4,23.4
              C388.2,183.4,388.2,185.6,387.1,187.8z"/>
            </g>
          </svg>
      </div>
      <div class="cart-succes__content">
        <?php echo $text_message; ?>
      </div>
       
      </div>
  
      <!-- <div class="inline-link"><?php echo $text_message; ?></div> -->
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>