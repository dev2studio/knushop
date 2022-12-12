<legend>Status</legend>
<div class="form-group">
<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Main setting to Enable/Disable Basel theme.">Theme Status</span></label>
    <div class="col-sm-10 toggle-btn">
    <label><input type="radio" name="settings[theme_default][theme_default_directory]" value="default" <?php if($theme_default_directory == 'default'){echo ' checked="checked"';} ?> /><span>Disabled</span></label>
    <label><input type="radio" name="settings[theme_default][theme_default_directory]" value="basel" <?php if($theme_default_directory == 'basel'){echo ' checked="checked"';} ?> /><span>Enabled</span></label>
    </div>                   
<input type="hidden" name="settings[config][config_theme]" value="theme_default" />
<input type="hidden" name="settings[basel_version][basel_theme_version]" value="1.2" />
</div>