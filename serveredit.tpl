<section class="content-header">
	<h1>
		{$lang['virtualserver']} #{$serverinfo['virtualserver_id']} {$lang['editor']}
	</h1>
</section>
<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding" style="position: relative;">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
	{if !isset($permoverview['b_virtualserver_modify_password']) OR $permoverview['b_virtualserver_modify_password'] == 1}
		<div class="col-md-12">
			<div class="box box-border-lime">
				<div class="box-header">
					<h3 class="box-title">{$lang['serverpassword']}</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
					</div>
				</div>
				<div class="box-body">
					<form method="post" action="index.php?site=serveredit&amp;sid={$sid}">
						<div class="row">
							<div class="form-group col-xs-12 col-sm-7 col-md-8 col-lg-9">
								<label for="new_virtualserver_password">{$lang['newpassword']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_password" name="newsettings[virtualserver_password]"/>
							</div>
							<div class="form-group col-xs-12 col-sm-5 col-md-4 col-lg-3">
								<label class="hidden-xs">&nbsp;</label>
								<input class="btn btn-flat bg-lime btn-block" type="submit" name="editpw" value="{$lang['send']}" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	{/if}
		<form method="post" action="index.php?site=serveredit&amp;sid={$sid}">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">{$lang['basics']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_name">{$lang['name']}:</label>
						{if isset($permoverview['b_virtualserver_modify_name']) AND empty($permoverview['b_virtualserver_modify_name'])}
							&nbsp; - 
						{else}
							<input type="text" class="form-control" id="new_virtualserver_name" name="newsettings[virtualserver_name]" value="{$serverinfo['virtualserver_name']}">
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_autostart">{$lang['autostart']}:</label>
						{if isset($permoverview['b_virtualserver_modify_autostart']) AND empty($permoverview['b_virtualserver_modify_autostart'])}
								&nbps; -
						{else}
							<select id="new_virtualserver_autostart" class="form-control" name="newsettings[virtualserver_autostart]">
								<option value="1" {if $serverinfo['virtualserver_autostart'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_autostart'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_port">{$lang['port']}:</label>
						{if isset($permoverview['b_virtualserver_modify_port']) AND empty($permoverview['b_virtualserver_modify_port'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" max="65535" step="1" class="form-control" id="new_virtualserver_port" name="newsettings[virtualserver_port]" value="{$serverinfo['virtualserver_port']}">
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_min_client_version">{$lang['minclientversion']}:</label>
						{if isset($permoverview['b_virtualserver_modify_min_client_version']) AND empty($permoverview['b_virtualserver_modify_min_client_version'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_min_client_version" name="newsettings[virtualserver_min_client_version]" value="{$serverinfo['virtualserver_min_client_version']}">
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_welcomemessage">{$lang['welcomemsg']}:</label>
						{if isset($permoverview['b_virtualserver_modify_welcomemessage']) AND empty($permoverview['b_virtualserver_modify_welcomemessage'])}
							&nbps; -
						{else}
							<textarea class="form-control resize-vert" name="newsettings[virtualserver_welcomemessage]" id="new_virtualserver_welcomemessage" rows="2">{$serverinfo['virtualserver_welcomemessage']}</textarea>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_maxclients">{$lang['maxclients']}:</label>
						{if isset($permoverview['b_virtualserver_modify_maxclients']) AND empty($permoverview['b_virtualserver_modify_maxclients'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" max="1024" step="1" class="form-control" id="new_virtualserver_maxclients" name="newsettings[virtualserver_maxclients]" value="{$serverinfo['virtualserver_maxclients']}">
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_reserved_slots">{$lang['maxreservedslots']}:</label></td>
						{if isset($permoverview['b_virtualserver_modify_reserved_slots']) AND empty($permoverview['b_virtualserver_modify_reserved_slots'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" max="1024" class="form-control" id="new_virtualserver_reserved_slots" name="newsettings[virtualserver_reserved_slots]" value="{$serverinfo['virtualserver_reserved_slots']}">
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_weblist_enabled">{$lang['showonweblist']}:</label>
						{if isset($permoverview['b_virtualserver_modify_weblist']) AND empty($permoverview['b_virtualserver_modify_weblist'])}
							&nbps; -
						{else}
							<select class="form-control" name="newsettings[virtualserver_weblist_enabled]" id="new_virtualserver_weblist_enabled">
								<option value="1" {if $serverinfo['virtualserver_weblist_enabled'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_weblist_enabled'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="virtualserver_modify_codec_encryption_mode">{$lang['codecencryptionmode']}:</label>
						{if isset($permoverview['b_virtualserver_modify_codec_encryption_mode']) AND empty($permoverview['b_virtualserver_modify_codec_encryption_mode'])}
							&nbps; -
						{else}
							<select class="form-control" name="newsettings[virtualserver_codec_encryption_mode]" id="virtualserver_modify_codec_encryption_mode">
								<option value="0" {if $serverinfo['virtualserver_codec_encryption_mode'] == 0}selected='selected'{/if}>{$lang['codecencryptionmodeindi']}</option>
								<option value="1" {if $serverinfo['virtualserver_codec_encryption_mode'] == 1}selected='selected'{/if}>{$lang['codecencryptionmodegoff']}</option>
								<option value="2" {if $serverinfo['virtualserver_codec_encryption_mode'] == 2}selected='selected'{/if}>{$lang['codecencryptionmodegon']}</option>
							</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_password">{$lang['passwordset']}:</label></td>
							<p>
							{if isset($permoverview['b_virtualserver_modify_password']) AND empty($permoverview['b_virtualserver_modify_password'])}
								&nbps; - 
							{else}
								&nbsp;{if $serverinfo['virtualserver_flag_password'] == 1}{$lang['yes']}{else} {$lang['no']}{/if}
							{/if}
							</p>
						</div>
						<div class="form-group">
							<label for="new_virtualserver_needed_identity_security_level">{$lang['securitylevel']}:</label>
						{if isset($permoverview['b_virtualserver_modify_needed_identity_security_level']) AND empty($permoverview['b_virtualserver_modify_needed_identity_security_level'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_needed_identity_security_level" name="newsettings[virtualserver_needed_identity_security_level]" value="{$serverinfo['virtualserver_needed_identity_security_level']}"/>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_min_clients_in_channel_before_forced_silence">{$lang['minclientschan']}:</label>
						{if isset($permoverview['b_virtualserver_modify_channel_forced_silence']) AND empty($permoverview['b_virtualserver_modify_channel_forced_silence'])}
							&nbps; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_min_clients_in_channel_before_forced_silence" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}"/>
						{/if}
						</div>
						<div class="form-group">
							<label for="iconid">{$lang['iconid']}:</label>
						{if isset($permoverview['b_virtualserver_modify_icon_id']) AND empty($permoverview['b_virtualserver_modify_icon_id'])}
							&nbps; - 
						{else}
							<div class="input-group">
								<input id="iconid" class="form-control" type="number" min="0" step="1" name="newsettings[virtualserver_icon_id]" value="{$serverinfo['virtualserver_icon_id']}" />
								<div class="input-group-addon">									
									<a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}&amp;port={$serverinfo['virtualserver_port']}', '{$lang['set']}');">{$lang['set']}</a>
								</div>
							</div>
						{/if}
						</div>
					</div>
				</div>
				<div class="box box-info"> 
					<div class="box-header">
						<h3 class="box-title">{$lang['host']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_hostmessage">{$lang['hostmessage']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
							&nbsp; - 
						{else}
							<textarea class="form-control resize-vert" id="new_virtualserver_hostmessage" name="newsettings[virtualserver_hostmessage]" rows="2">{$serverinfo['virtualserver_hostmessage']}</textarea>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostmessage_mode">{$lang['hostmessageshow']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
							&nbsp; - 
						{else}
						<select class="form-control" id="new_virtualserver_hostmessage_mode" name="newsettings[virtualserver_hostmessage_mode]">
							<option value="0" {if $serverinfo['virtualserver_hostmessage_mode'] == 0}selected='selected'{/if}>{$lang['nomessage']}</option>
							<option value="1" {if $serverinfo['virtualserver_hostmessage_mode'] == 1}selected='selected'{/if}>{$lang['showmessagelog']}</option>
							<option value="2" {if $serverinfo['virtualserver_hostmessage_mode'] == 2}selected='selected'{/if}>{$lang['showmodalmessage']}</option>
							<option value="3" {if $serverinfo['virtualserver_hostmessage_mode'] == 3}selected='selected'{/if}>{$lang['modalandexit']}</option>
						</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbanner_url">{$lang['hosturl']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
							&nbsp; - 
						{else}
							<input type="text" class="form-control" id="new_virtualserver_hostbanner_url" name="newsettings[virtualserver_hostbanner_url]" value="{$serverinfo['virtualserver_hostbanner_url']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbanner_gfx_url">{$lang['hostbannerurl']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
							&nbsp; - 
						{else}
							{if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
							<img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
							{/if}
							<input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_url" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$serverinfo['virtualserver_hostbanner_gfx_url']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbanner_gfx_interval">{$lang['hostbannerintval']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
							&nbsp; - 
						{else}
							<input type="number" max="60" min="0" step="1" class="form-control" id="new_virtualserver_hostbanner_gfx_interval" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$serverinfo['virtualserver_hostbanner_gfx_interval']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbutton_tooltip">{$lang['hostbuttontooltip']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
							&nbsp; - 
						{else}
							<input type="text" class="form-control" id="new_virtualserver_hostbutton_tooltip" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$serverinfo['virtualserver_hostbutton_tooltip']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbutton_gfx_url">{$lang['hostbuttongfx']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
							&nbsp; - 
						{else}
							<input type="text" class="form-control" id="new_virtualserver_hostbutton_gfx_url" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$serverinfo['virtualserver_hostbutton_gfx_url']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_hostbutton_url">{$lang['hostbuttonurl']}:</label>
						{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
							&nbsp; - 
						{else}
							<input type="text" class="form-control" id="new_virtualserver_hostbutton_url" name="newsettings[virtualserver_hostbutton_url]" value="{$serverinfo['virtualserver_hostbutton_url']}" />
						{/if}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-border-olive">
					<div class="box-header">
						<h3 class="box-title">{$lang['standardgroups']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_default_server_group">{$lang['servergroup']}:</label>
						{if isset($permoverview['b_virtualserver_modify_default_servergroup']) AND empty($permoverview['b_virtualserver_modify_default_servergroup'])}
							&nbsp; - 
						{else}
							<select class="form-control" id="new_virtualserver_default_server_group" name="newsettings[virtualserver_default_server_group]">
							{foreach key=key item=value from=$servergroups}
								{if $value['type'] == 1}
									<option {if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}selected="selected"{/if} value="{$value['sgid']}">{$value['sgid']} {$value['name']}</option>
								{/if}
							{/foreach}
							</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_default_channel_group">{$lang['channelgroup']}:</label>
						{if isset($permoverview['b_virtualserver_modify_default_channelgroup']) AND empty($permoverview['b_virtualserver_modify_default_channelgroup'])}
							&nbsp; - 
						{else}
							<select class="form-control" id="new_virtualserver_default_channel_group" name="newsettings[virtualserver_default_channel_group]">
							{foreach key=key item=value from=$channelgroups}
								{if $value['type'] == 1}
									<option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
								{/if}
							{/foreach}
							</select>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_default_channel_admin_group">{$lang['chanadmingroup']}:</label>
						{if isset($permoverview['b_virtualserver_modify_default_channeladmingroup']) AND empty($permoverview['b_virtualserver_modify_default_channeladmingroup'])}
							&nbsp; - 
						{else}
							<select class="form-control" id="new_virtualserver_default_channel_admin_group" name="newsettings[virtualserver_default_channel_admin_group]">
							{foreach key=key item=value from=$channelgroups}
								{if $value['type'] == 1}
									<option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
								{/if}
							{/foreach}
							</select>
						{/if}
						</div>
					</div>
				</div>
				<div class="box box-warning"> 
					<div class="box-header">
						<h3 class="box-title">{$lang['autoban']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_complain_autoban_count">{$lang['autobancount']}:</label>
						{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_complain_autoban_count" name="newsettings[virtualserver_complain_autoban_count]" value="{$serverinfo['virtualserver_complain_autoban_count']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_complain_autoban_time">{$lang['autobantime']}:</label>
						{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_complain_autoban_time" name="newsettings[virtualserver_complain_autoban_time]" value="{$serverinfo['virtualserver_complain_autoban_time']}" />
								<div class="input-group-addon">
									{$lang['seconds']}
								</div>
							</div>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_complain_remove_time">{$lang['removetime']}:</label>
						{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_complain_remove_time" name="newsettings[virtualserver_complain_remove_time]" value="{$serverinfo['virtualserver_complain_remove_time']}" />
								<div class="input-group-addon">
									{$lang['seconds']}
								</div>
							</div>
						{/if}
						</div>
					</div>
				</div>
				<div class="box box-danger"> 
					<div class="box-header">
						<h3 class="box-title">{$lang['antiflood']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_antiflood_points_tick_reduce">{$lang['pointstickreduce']}:</label>
						{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_antiflood_points_tick_reduce" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$serverinfo['virtualserver_antiflood_points_tick_reduce']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_antiflood_points_needed_command_block">{$lang['pointsneededblockcmd']}:</label>
						{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_antiflood_points_needed_command_block" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_command_block']}" />
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_antiflood_points_needed_ip_block">{$lang['pointsneededblockip']}:</label>
						{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
							&nbsp; - 
						{else}
							<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_antiflood_points_needed_ip_block" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}" />
						{/if}
						</div>
					</div>
				</div>
				<div class="box box-success"> 
					<div class="box-header">
						<h3 class="box-title">{$lang['transfers']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_max_upload_total_bandwidth">{$lang['upbandlimit']}:</label>
						{if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="-1" step="1" class="form-control" id="new_virtualserver_max_upload_total_bandwidth" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$serverinfo['virtualserver_max_upload_total_bandwidth']}" />
								<div class="input-group-addon">
									Byte/s
								</div>
							</div>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_upload_quota">{$lang['uploadquota']}:</label>
						{if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_upload_quota" name="newsettings[virtualserver_upload_quota]" value="{$serverinfo['virtualserver_upload_quota']}" />
								<div class="input-group-addon">
									MiB
								</div>
							</div>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_max_download_total_bandwidth">{$lang['downbandlimit']}:</label>
						{if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="-1" step="1" class="form-control" id="new_virtualserver_max_download_total_bandwidth" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$serverinfo['virtualserver_max_download_total_bandwidth']}" />
								<div class="input-group-addon">
									Byte/s
								</div>
							</div>
						{/if}
						</div>
						<div class="form-group">
							<label for="new_virtualserver_download_quota">{$lang['downloadquota']}:</label>
						{if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
							&nbsp; - 
						{else}
							<div class="input-group">
								<input type="number" min="1" step="1" class="form-control" id="new_virtualserver_download_quota" name="newsettings[virtualserver_download_quota]" value="{$serverinfo['virtualserver_download_quota']}" />
								<div class="input-group-addon">
									MiB
								</div>
							</div>
						{/if}
						</div>
					</div>
				</div>
				<div class="box box-default">
					<div class="box-header">
						<h3 class="box-title">{$lang['logs']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="new_virtualserver_log_client">{$lang['logclient']}:</label>
							<input type="checkbox" id="new_virtualserver_log_client" name="newsettings[virtualserver_log_client]" value="1" {if $serverinfo['virtualserver_log_client'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>
						<div class="form-group">
							<label for="new_virtualserver_log_query">{$lang['logquery']}:</label>
							<input type="checkbox" id="new_virtualserver_log_query" name="newsettings[virtualserver_log_query]" value="1" {if $serverinfo['virtualserver_log_query'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>
						<div class="form-group">
							<label for="new_virtualserver_log_channel">{$lang['logchannel']}:</label>
							<input type="checkbox" id="new_virtualserver_log_channel" name="newsettings[virtualserver_log_channel]" value="1" {if $serverinfo['virtualserver_log_channel'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>
						<div class="form-group">
							<label for="new_virtualserver_log_permissions">{$lang['logpermissions']}:</label>
							<input type="checkbox" id="new_virtualserver_log_permissions" name="newsettings[virtualserver_log_permissions]" value="1" {if $serverinfo['virtualserver_log_permissions'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>
						<div class="form-group">
							<label for="new_virtualserver_log_server">{$lang['logserver']}:</label>
							<input type="checkbox" id="new_virtualserver_log_server" name="newsettings[virtualserver_log_server]" value="1" {if $serverinfo['virtualserver_log_server'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>							
						<div class="form-group">
							<label for="new_virtualserver_log_filetransfer">{$lang['logfiletransfer']}:</label>
							<input type="checkbox" id="new_virtualserver_log_filetransfer" name="newsettings[virtualserver_log_filetransfer]" value="1" {if $serverinfo['virtualserver_log_filetransfer'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<input class="btn btn-block btn-flat btn-success" type="submit" name="editserver" value="Edit" />
			</div>
		</form>
	</div>
</section>