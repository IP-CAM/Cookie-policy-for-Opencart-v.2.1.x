<div id="pvnm-cookie-<?php echo $module_id; ?>" class="pvnm-cookie">
<style>
.pvnm-cookie {
	margin: 0;
	padding: 10px;
	position: fixed;
	width: 100%;
	z-index: 99999;
	-webkit-box-shadow: 0 0 2px 2px rgba(219,219,219,1);
	-moz-box-shadow: 0 0 2px 2px rgba(219,219,219,1);
	box-shadow: 0 0 2px 2px rgba(219,219,219,1);
	left: 0;
	<?php echo $notice_position; ?>: 0;
	<?php if ($text_color) { ?>color: <?php echo $text_color; ?>;<?php } ?>
	<?php if ($border_color) { ?>border: 1px solid <?php echo $border_color; ?>;<?php } ?>
	<?php if ($background_color) { ?>background-color: <?php echo $background_color; ?>;<?php } ?>
	<?php if ($image) { ?>background-image: url(<?php echo $image; ?>);background-position: <?php echo $position; ?>;background-repeat: <?php echo $repeat; ?>;<?php } ?>
}
</style>
<script type="text/javascript"><!--
function pvnm_cookie_add(){
	$.ajax({
		type: 'post',
		url: 'index.php?route=module/pvnm_cookie_policy/add',
		dataType: 'json',
		data: 'cookie=<?php echo $module_id; ?>',
		success: function(json) {
			if (json) {
				$('#pvnm-cookie-<?php echo $module_id; ?>').fadeOut('slow');
			}
		}
	});
}
--></script>
<div class="container">
	<div class="row">
		<div class="col-sm-10">
			<?php if ($heading_title) { ?><h3><?php echo $heading_title; ?></h3><?php } ?>
			<span><?php echo $message; ?></span>
		</div>
		<div class="col-sm-2"><a onclick="pvnm_cookie_add();" class="btn btn-primary"><?php echo $button; ?></a></div>
	</div>
</div>
</div>