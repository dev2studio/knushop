<?php echo $header; ?>
<div class="container">
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

      <div class="empty-cart-wrapper">
        <div class="empty-cart__img">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 500" enable-background="new 0 0 500 500" xml:space="preserve">
            <path fill="#EDEDED" d="M250,0C111.9,0,0,111.9,0,250c0,138.1,111.9,250,250,250c138.1,0,250-111.9,250-250C500,111.9,388.1,0,250,0
            z"/>
            <path fill="#0A2146" d="M95,149.9h310.1v249.9H95.3L95,149.9L95,149.9z"/>
            <g>
              <path fill="#00479B" d="M420,210.1c0,0.1-339.7-0.1-340,0v189.6c0,0,0,15-0.1,33.5C124.5,474.6,184.3,500,250,500
              c65.6,0,125.3-25.3,169.9-66.6c-0.2-18.5-0.3-33.6-0.3-33.6C419.6,321.1,420,210.1,420,210.1L420,210.1z M375.1,170v32.6l30-5.8
              v-46.9L375.1,170z M125,200.1V170l-30-20.1v49.9L125,200.1z"/>
            </g>
            <path fill="#052B59" d="M125,210.1v-40l-45.1,40H125z M375.1,170v40H420L375.1,170z"/>
            <path fill="#052B59" d="M355.3,287.8c0-4.2-3.6-7.9-7.8-7.9c-4.2,0-8.2,3.7-8.2,7.9c0,50.8-38.2,92-89,92c-50.8,0-90-41.2-90-92
            c0-4.2-3.5-7.9-7.7-7.9c-4.2,0-8.3,3.7-8.3,7.9c0,59.7,46.4,108,106,108C309.9,395.8,355.3,347.5,355.3,287.8L355.3,287.8z"/>
            <path fill="#0A2146" d="M152.4,264.9c-6.8,0-12.4,5.5-12.4,12.4c0,6.8,5.5,12.4,12.4,12.4c6.8,0,12.6-5.5,12.6-12.4
            C164.9,270.5,159.2,264.9,152.4,264.9z M347.4,264.9c-6.9,0-12.4,5.5-12.4,12.4c0,6.8,5.5,12.4,12.4,12.4c6.8,0,12.6-5.5,12.6-12.4
            C359.9,270.5,354.2,264.9,347.4,264.9z"/>
            <path fill="#FFFFFF" d="M355.3,282.8c0-4.2-3.6-7.9-7.8-7.9c-4.2,0-8.2,3.7-8.2,7.9c0,50.8-38.2,92-89,92c-50.8,0-90-41.2-90-92
            c0-4.2-3.5-7.9-7.7-7.9c-4.2,0-8.3,3.7-8.3,7.9c0,59.7,46.4,108,106,108C309.9,390.8,355.3,342.5,355.3,282.8L355.3,282.8z"/>
          </svg>
        </div>
        <div class="empty-cart__title"><p><?php echo $text_error; ?></p></div>
        <div class="empty-cart__btn-box">
          <a href="<?php echo $continue; ?>" class="btn empty-cart__btn"><?php echo $button_continue; ?></a>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
    </div>
    <?php echo $footer; ?>