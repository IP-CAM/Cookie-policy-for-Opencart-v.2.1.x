<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-settings" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_settings; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><i class="fa fa-comment"></i> <?php echo $tab_help; ?></a></li>
          </ul>
          <div class="tab-content">
		  <div class="tab-pane active" id="tab-settings">
            <div class="row">
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked">
					  <?php foreach ($modules as $module) { ?>
						<li id="module-<?php echo $module['module_id']; ?>" class="module"><a href="#tab-module-<?php echo $module['module_id']; ?>" data-toggle="tab"><?php echo $module['setting']['name']; ?><span style="display: block; float: right;"><i class="fa fa-remove" onclick="$('#module-<?php echo $module['module_id']; ?>').remove(); $('#tab-module-<?php echo $module['module_id']; ?>').remove(); $('form').append('<input type=\'hidden\' name=\'delete[]\' value=\'<?php echo $module['module_id']; ?>\' />'); $('.nav-stacked .module:first-child a').trigger('click'); return false;" style="color: red;"></i></span></a></li>
					  <?php } ?>
					  <li class="add"><a id="module-add" onclick="addModule();" style="cursor: pointer;"><?php echo $button_add; ?><span style="display: block; float: right;"><i class="fa fa-plus" style="color: green;"></i></span></a></li>
					</ul>
				</div>
				<div class="col-md-10">
					<div class="tab-content">
					  <?php foreach ($modules as $module) { ?>
						<div class="tab-pane" id="tab-module-<?php echo $module['module_id']; ?>">
							<input type="hidden" name="module[<?php echo $module['module_id']; ?>][module_id]" value="<?php echo $module['module_id']; ?>" />
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-name<?php echo $module['module_id']; ?>"><?php echo $entry_name; ?></label>
								<div class="col-sm-10">
									<input type="text" name="module[<?php echo $module['module_id']; ?>][name]" value="<?php echo $module['setting']['name']; ?>" placeholder="" id="input-name<?php echo $module['module_id']; ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-title<?php echo $module['module_id']; ?>"><?php echo $entry_title; ?></label>
								<div class="col-sm-10">
								  <?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
									<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
									<input type="text" name="module[<?php echo $module['module_id']; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $module['setting']['title'][$language['language_id']]; ?>" placeholder="" id="input-title<?php echo $module['module_id']; ?>" class="form-control" />
									</div>
								  <?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-message<?php echo $module['module_id']; ?>"><?php echo $entry_message; ?></label>
								<div class="col-sm-10">
								  <?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
									<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
									<textarea name="module[<?php echo $module['module_id']; ?>][message][<?php echo $language['language_id']; ?>]" rows="3" placeholder="" id="input-message<?php echo $module['module_id']; ?>" class="form-control"><?php echo $module['setting']['message'][$language['language_id']]; ?></textarea>
									</div>
								  <?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-button<?php echo $module['module_id']; ?>"><?php echo $entry_button; ?></label>
								<div class="col-sm-10">
								  <?php foreach ($languages as $language) { ?>
									<div class="input-group pull-left">
									<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
									<input type="text" name="module[<?php echo $module['module_id']; ?>][button][<?php echo $language['language_id']; ?>]" value="<?php echo $module['setting']['button'][$language['language_id']]; ?>" placeholder="" id="input-button<?php echo $module['module_id']; ?>" class="form-control" />
									</div>
								  <?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-text-color<?php echo $module['module_id']; ?>"><?php echo $entry_text_color; ?></label>
								<div class="col-sm-10">
									<input type="text" name="module[<?php echo $module['module_id']; ?>][text_color]" value="<?php echo $module['setting']['text_color']; ?>" placeholder="" id="input-text-color<?php echo $module['module_id']; ?>" class="form-control minicolors-text-<?php echo $module['module_id']; ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-border-color<?php echo $module['module_id']; ?>"><?php echo $entry_border_color; ?></label>
								<div class="col-sm-10">
									<input type="text" name="module[<?php echo $module['module_id']; ?>][border_color]" value="<?php echo $module['setting']['border_color']; ?>" placeholder="" id="input-border-color<?php echo $module['module_id']; ?>" class="form-control minicolors-border-<?php echo $module['module_id']; ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-background-color<?php echo $module['module_id']; ?>"><?php echo $entry_background_color; ?></label>
								<div class="col-sm-10">
									<input type="text" name="module[<?php echo $module['module_id']; ?>][background_color]" value="<?php echo $module['setting']['background_color']; ?>" placeholder="" id="input-background-color<?php echo $module['module_id']; ?>" class="form-control minicolors-background-<?php echo $module['module_id']; ?>" />
								</div>
							</div>
							
							
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-image<?php echo $module['module_id']; ?>"><?php echo $entry_image; ?></label>
								<div class="col-sm-10">
									<a href="" id="thumb-image<?php echo $module['module_id']; ?>" data-toggle="image" class="img-thumbnail" style="max-width: 80%;" ><img src="<?php if (is_file(DIR_IMAGE . $module['setting']['image'])) { ?>../image/<?php echo $module['setting']['image']; ?><?php } else { ?><?php echo $placeholder; ?><?php } ?>" style="height: 100px; max-width: 100%;" alt="" title="" data-placeholder="" /></a>
									<input type="hidden" name="module[<?php echo $module['module_id']; ?>][image]" value="<?php echo $module['setting']['image']; ?>" id="input-image<?php echo $module['module_id']; ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-position<?php echo $module['module_id']; ?>"><?php echo $entry_image_position; ?></label>
								<div class="col-sm-10">
								  <select name="module[<?php echo $module['module_id']; ?>][position]" id="input-position<?php echo $module['module_id']; ?>" class="form-control">
									<option value="<?php echo $text_top_left; ?>" <?php if ($module['setting']['position'] == $text_top_left) { ?>selected="selected"<?php } ?>><?php echo $text_top_left; ?></option>
									<option value="<?php echo $text_top_center; ?>" <?php if ($module['setting']['position'] == $text_top_center) { ?>selected="selected"<?php } ?>><?php echo $text_top_center; ?></option>
									<option value="<?php echo $text_top_right; ?>" <?php if ($module['setting']['position'] == $text_top_right) { ?>selected="selected"<?php } ?>><?php echo $text_top_right; ?></option>
									<option value="<?php echo $text_center_left; ?>" <?php if ($module['setting']['position'] == $text_center_left) { ?>selected="selected"<?php } ?>><?php echo $text_center_left; ?></option>
									<option value="<?php echo $text_center_center; ?>" <?php if ($module['setting']['position'] == $text_center_center) { ?>selected="selected"<?php } ?>><?php echo $text_center_center; ?></option>
									<option value="<?php echo $text_center_right; ?>" <?php if ($module['setting']['position'] == $text_center_right) { ?>selected="selected"<?php } ?>><?php echo $text_center_right; ?></option>
									<option value="<?php echo $text_bottom_left; ?>" <?php if ($module['setting']['position'] == $text_bottom_left) { ?>selected="selected"<?php } ?>><?php echo $text_bottom_left; ?></option>
									<option value="<?php echo $text_bottom_center; ?>" <?php if ($module['setting']['position'] == $text_bottom_center) { ?>selected="selected"<?php } ?>><?php echo $text_bottom_center; ?></option>
									<option value="<?php echo $text_bottom_right; ?>" <?php if ($module['setting']['position'] == $text_bottom_right) { ?>selected="selected"<?php } ?>><?php echo $text_bottom_right; ?></option>
								  </select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-repeat<?php echo $module['module_id']; ?>"><?php echo $entry_repeat; ?></label>
								<div class="col-sm-10">
								  <select name="module[<?php echo $module['module_id']; ?>][repeat]" id="input-repeat<?php echo $module['module_id']; ?>" class="form-control">
									<option value="<?php echo $text_no_repeat; ?>" <?php if ($module['setting']['repeat'] == $text_no_repeat) { ?>selected="selected"<?php } ?>><?php echo $text_no_repeat; ?></option>
									<option value="<?php echo $text_repeat_x; ?>" <?php if ($module['setting']['repeat'] == $text_repeat_x) { ?>selected="selected"<?php } ?>><?php echo $text_repeat_x; ?></option>
									<option value="<?php echo $text_repeat_y; ?>" <?php if ($module['setting']['repeat'] == $text_repeat_y) { ?>selected="selected"<?php } ?>><?php echo $text_repeat_y; ?></option>
									<option value="<?php echo $text_repeat; ?>" <?php if ($module['setting']['repeat'] == $text_repeat) { ?>selected="selected"<?php } ?>><?php echo $text_repeat; ?></option>
								  </select>
								</div>
							</div>
						    <div class="form-group">
								<label class="col-sm-2 control-label" for="input-notice-position<?php echo $module['module_id']; ?>"><?php echo $entry_notice_position; ?></label>
								<div class="col-sm-10">
								  <select name="module[<?php echo $module['module_id']; ?>][notice_position]" id="input-notice-position<?php echo $module['module_id']; ?>" class="form-control">
									<option value="<?php echo $text_notice_top; ?>" <?php if ($module['setting']['notice_position'] == $text_notice_top) { ?>selected="selected"<?php } ?>><?php echo $text_notice_top; ?></option>
									<option value="<?php echo $text_notice_bottom; ?>" <?php if ($module['setting']['notice_position'] == $text_notice_bottom) { ?>selected="selected"<?php } ?>><?php echo $text_notice_bottom; ?></option>
								  </select>
								</div>
							</div>
						    <div class="form-group">
							  <label class="col-sm-2 control-label" for="input-status<?php echo $module['module_id']; ?>"><?php echo $entry_status; ?></label>
							  <div class="col-sm-10">
							    <div class="btn-group" data-toggle="buttons" id="input-status<?php echo $module['module_id']; ?>">
								<?php if ($module['setting']['status'] == 1) { ?>
								<label class="btn btn-info active"><input type="radio" name="module[<?php echo $module['module_id']; ?>][status]" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
								<label class="btn btn-info"><input type="radio" name="module[<?php echo $module['module_id']; ?>][status]" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
								<?php } else { ?>
								<label class="btn btn-info"><input type="radio" name="module[<?php echo $module['module_id']; ?>][status]" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
								<label class="btn btn-info active"><input type="radio" name="module[<?php echo $module['module_id']; ?>][status]" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
								<?php } ?>
							    </div>
							  </div>
						    </div>
						</div>
					  <?php } ?>
					</div>
				</div>
            </div>
		  </div>
          <div class="tab-pane" id="tab-help">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_documentation; ?></label>
              <div class="col-sm-10"><a href="https://github.com/p0v1n0m/opencart_cookie_policy" target="_blank" class="btn">https://github.com/p0v1n0m/opencart_cookie_policy</a></div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_developer; ?></label>
              <div class="col-sm-10"><a href="mailto:p0v1n0m@gmail.com" class="btn">p0v1n0m@gmail.com</a></div>
            </div>
          </div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php if (isset($module_id)) { ?>
$('#module-<?php echo $module_id; ?> a').trigger('click');
<?php } else { ?>
$('.nav-stacked .module:first-child a').trigger('click');
<?php } ?>

$.minicolors.defaults = $.extend($.minicolors.defaults, {
    theme: 'bootstrap'
});

<?php foreach ($modules as $module) { ?>
$('.minicolors-text-<?php echo $module['module_id']; ?>').minicolors();
$('.minicolors-border-<?php echo $module['module_id']; ?>').minicolors();
$('.minicolors-background-<?php echo $module['module_id']; ?>').minicolors();
<?php } ?>

var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div class="tab-pane" id="tab-module-' + module_row + '">';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-name' + module_row + '"><?php echo $entry_name; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="module[' + module_row + '][name]" value="<?php echo $text_tab_module; ?> ' + module_row + '" placeholder="" id="input-name' + module_row + '" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-title' + module_row + '"><?php echo $entry_title; ?></label>';
	html += '		<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group pull-left">';
	html += '				<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>';
	html += '				<input type="text" name="module[' + module_row + '][title][<?php echo $language['language_id']; ?>]" value="" placeholder="" id="input-title' + module_row + '" class="form-control" />';
	html += '			</div>';
	<?php } ?>
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-message' + module_row + '"><?php echo $entry_message; ?></label>';
	html += '		<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group pull-left">';
	html += '				<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>';
	html += '				<textarea name="module[' + module_row + '][message][<?php echo $language['language_id']; ?>]" rows="3" placeholder="" id="input-message' + module_row + '" class="form-control"></textarea>';
	html += '			</div>';
	<?php } ?>
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-button' + module_row + '"><?php echo $entry_button; ?></label>';
	html += '		<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group pull-left">';
	html += '				<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>';
	html += '				<input type="text" name="module[' + module_row + '][button][<?php echo $language['language_id']; ?>]" value="" placeholder="" id="input-button' + module_row + '" class="form-control" />';
	html += '			</div>';
	<?php } ?>
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-text-color' + module_row + '"><?php echo $entry_text_color; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="module[' + module_row + '][text_color]" value="" placeholder="" id="input-text-color' + module_row + '" class="form-control minicolors-text-' + module_row + '" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-border-color' + module_row + '"><?php echo $entry_border_color; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="module[' + module_row + '][border_color]" value="" placeholder="" id="input-border-color' + module_row + '" class="form-control minicolors-border-' + module_row + '" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-background-color' + module_row + '"><?php echo $entry_background_color; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="module[' + module_row + '][background_color]" value="" placeholder="" id="input-background-color' + module_row + '" class="form-control minicolors-background-' + module_row + '" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-image' + module_row + '"><?php echo $entry_image; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<a href="" id="thumb-image' + module_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="" /></a>';
	html += '			<input type="hidden" name="module[' + module_row + '][image]" value="" placeholder="" id="input-image' + module_row + '" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-position' + module_row + '"><?php echo $entry_image_position; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="module[' + module_row + '][position]" id="input-position' + module_row + '" class="form-control">';
	html += '				<option value="<?php echo $text_top_left; ?>"><?php echo $text_top_left; ?></option>';
	html += '				<option value="<?php echo $text_top_center; ?>"><?php echo $text_top_center; ?></option>';
	html += '				<option value="<?php echo $text_top_right; ?>"><?php echo $text_top_right; ?></option>';
	html += '				<option value="<?php echo $text_center_left; ?>"><?php echo $text_center_left; ?></option>';
	html += '				<option value="<?php echo $text_center_center; ?>"><?php echo $text_center_center; ?></option>';
	html += '				<option value="<?php echo $text_center_right; ?>"><?php echo $text_center_right; ?></option>';
	html += '				<option value="<?php echo $text_bottom_left; ?>"><?php echo $text_bottom_left; ?></option>';
	html += '				<option value="<?php echo $text_bottom_center; ?>"><?php echo $text_bottom_center; ?></option>';
	html += '				<option value="<?php echo $text_bottom_right; ?>"><?php echo $text_bottom_right; ?></option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-repeat' + module_row + '"><?php echo $entry_repeat; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="module[' + module_row + '][repeat]" id="input-repeat' + module_row + '" class="form-control">';
	html += '				<option value="<?php echo $text_no_repeat; ?>"><?php echo $text_no_repeat; ?></option>';
	html += '				<option value="<?php echo $text_repeat_x; ?>"><?php echo $text_repeat_x; ?></option>';
	html += '				<option value="<?php echo $text_repeat_y; ?>"><?php echo $text_repeat_y; ?></option>';
	html += '				<option value="<?php echo $text_repeat; ?>"><?php echo $text_repeat; ?></option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-notice-position' + module_row + '"><?php echo $entry_notice_position; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="module[' + module_row + '][notice_position]" id="input-notice-position' + module_row + '" class="form-control">';
	html += '				<option value="<?php echo $text_notice_top; ?>"><?php echo $text_notice_top; ?></option>';
	html += '				<option value="<?php echo $text_notice_bottom; ?>"><?php echo $text_notice_bottom; ?></option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label" for="input-status' + module_row + '"><?php echo $entry_status; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<div class="btn-group" data-toggle="buttons" id="input-status' + module_row + '">';
	html += '				<label class="btn btn-info"><input type="radio" name="module[' + module_row + '][status]" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>';
	html += '				<label class="btn btn-info active"><input type="radio" name="module[' + module_row + '][status]" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>';
	html += '			</div>';
	html += '		</div>';
	html += '	</div>';
	html += '</div>';

	$('.row .tab-content').append(html);

	$('.nav-stacked .add').before('<li id="module-' + module_row + '" class="module"><a href="#tab-module-' + module_row + '" data-toggle="tab"><?php echo $text_tab_module; ?> ' + module_row + '<span style="display: block; float: right;"><i class="fa fa-remove" onclick="$(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); $(\'.nav-stacked .module:first-child a\').trigger(\'click\'); return false;" style="color: red;"></i></span></a></li>');

	$('#module-' + module_row + ' a').trigger('click');

	$('.minicolors-text-' + module_row).minicolors();
	$('.minicolors-border-' + module_row).minicolors();
	$('.minicolors-background-' + module_row).minicolors();

	module_row++;
}
//--></script> 
<?php echo $footer; ?>
