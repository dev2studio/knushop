<?php echo $header; ?>
<div class="container full-width">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

	<div class="row">
		<?php echo $column_left; ?>

		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-md-9 col-sm-8'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>

		<div id="content" class="<?php echo $class; ?>">
		
			<?php echo $content_top; ?>

			<!--<h1 id="page-title"><?php echo $heading_title; ?></h1>-->

			<?php if (($thumb && $category_thumb_status)|| $description) { ?>
			<?php if ($thumb && $category_thumb_status) { ?>
			<img class="category-main-thumb" src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" />
			<?php } ?>
			<?php if ($description && $description != '<p><br></p>') { ?>

			<?php } ?>
			<?php } ?>

			<?php if ($categories && $category_subs_status) { ?>
				<h3 class="lined-title"><span><?php echo $text_refine; ?></span></h3>
				<div class="grid-holder categories grid<?php echo $basel_subs_grid; ?>">
					<?php foreach ($categories as $category) { ?>
						<div class="item">
							<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" /></a>
							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
						</div>
					<?php } ?>
				</div>
			<?php } ?>

			<?php if ($products) { ?>
				<div id="product-view" class="grid">
					<div class="table filter">

					 <!--<div class="table-cell nowrap hidden-sm hidden-md hidden-lg"><a class="filter-trigger-btn"></a></div>-->

					 <!--<div class="table-cell nowrap hidden-xs">-->
						<!--<a id="grid-view" class="view-icon grid" data-toggle="tooltip" data-title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></a>-->
						<!--<a id="list-view" class="view-icon list" data-toggle="tooltip" data-title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></a>-->
						<!--</div>-->

						<!--<div class="table-cell w100">-->
							<!--<a href="<?php echo $compare; ?>" id="compare-total" class="hidden-xs"><?php echo $text_compare; ?></a>-->
							<!--</div>-->

						<h1 id="page-title" style=" font-weight: normal;margin-bottom: 1px;line-height: 1;"><?php echo $heading_title; ?></h1>
						
						<div class="table-cell nowrap text-right">
							<div class="sort-select">
								<span class="hidden-xs"><?php echo $text_sort; ?></span>
								<select id="input-sort" class="form-control input-sm inline" onchange="location = this.value;">
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"> <?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>" ><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>

						<div class="table-cell nowrap text-right hidden-xs hidden-sm">
							<span><?php echo $text_limit; ?></span>
							<select id="input-limit" class="form-control input-sm inline" onchange="location = this.value;">
								<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
								<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>

					<div style="padding: 1px;width: 150px;border-bottom: 2px solid #b80000;font-weight: normal;"></div>
					<div style="padding: 5px;"></div>
						<!--  <div class="category-description"><?php echo $description; ?></div> -->


						<div class="grid-holder product-holder grid<?php echo $basel_prod_grid; ?>">
							<?php foreach ($products as $product) { ?>
							<?php require('catalog/view/theme/basel/template/product/single_product.tpl'); ?>
							<?php } ?>
						</div>
				</div> <!-- #product-view ends -->

				<div class="row pagination-holder">
					<div class="col-sm-6 xs-text-center"><?php echo str_replace(array("&gt;|","|&lt;"),array("&gt;&gt", "&lt;&lt"),$pagination); ?></div>
					<div class="col-sm-6 text-right xs-text-center"><span class="pagination-text"><?php echo $results; ?></span></div>
				</div>

			<?php } ?>

			<?php if (!$categories && !$products) { ?>

				<div id="product-view" class="grid">
					<div class="table filter">
						<h1 id="page-title" style=" font-weight: normal;margin-bottom: 1px;line-height: 1;"><?php echo $heading_title; ?></h1>

					</div>
				</div>

				<div style="padding: 1px;width: 150px;border-bottom: 2px solid #b80000;font-weight: normal;"></div>
				<div style="padding: 5px;"></div>


				<p><?php echo $text_empty; ?><br><br></p>


				<div class="category-description"><?php echo $description; ?></div>
			<?php } ?>


			<div style="padding: 15px;"></div>
			<?php if ($products) { ?>
				<div class="category-description"><?php echo $description; ?></div>
			<?php } ?>
		<?php echo $content_bottom; ?>
		<span class="cart-name1"><?php echo $text_cart; ?></span>
		</div>
	<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>