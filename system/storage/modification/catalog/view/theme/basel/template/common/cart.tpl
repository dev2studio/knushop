<ul id="cart-content">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table products">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image">
          <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="main"><a class="product-name main-font" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php echo $product['quantity']; ?> x <span class="price"><?php echo $product['price']; ?></span>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
          </td>
          <td class="remove"><a onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="remove">&times;</a></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td colspan="2" class="text-left"><span class="product-name main-font"><?php echo $voucher['description']; ?></span>
          1 x <span class="price"><?php echo $voucher['amount']; ?></span></td>
          <td class="text-right"><a onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="remove">&times;</a></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table totals">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-left" style="font-size: 12px;"><?php echo $total['title']; ?></td>
            <td class="text-right"style="font-size: 12px;"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="cart-button">
        <a class="btn btn-default btn-block 11" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
        </div>

		<?php if($config_on_off_qo_shopping_cart == '1') { ?>
		<div class="fast-checkout text-center">		
			<button class="btn btn-ordercart" type="button" onclick="fastorder_open_cart();"><i class="<?php echo $icon_open_form_send_order;?> fa-fw"></i><?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?></button>	
		</div>
		<?php } ?>		
		
        <a class="btn btn-contrast btn-block" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <div class="table empty">
      <div class="table-cell"><i class="global-cart"></i></div>
      <div class="table-cell"><?php echo $text_empty; ?></div>
      </div>
    </li>
    <?php } ?>
  </ul>