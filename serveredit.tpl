<section class="content-header">
	<h1>
        {$lang['virtualserver']} #{$serverinfo['virtualserver_id']} {$lang['editor']}
    </h1>
</section>
<section class="content container-fluid">
	<div class="col-lg-8 col-lg-offset-2" style="position: relative;">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}

	{if !isset($permoverview['b_virtualserver_modify_password']) OR $permoverview['b_virtualserver_modify_password'] == 1}
		<div class="box box-border-lime">
			<div class="box-header">
				<h3 class="box-title">{$lang['serverpassword']}</h3>
	          	<div class="box-tools pull-right">
	            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=serveredit&amp;sid={$sid}">
					<table class="table" cellpadding="0" cellspacing="0">
							<tr>
								<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_password">{$lang['newpassword']}:</label></td>
								<td class="col-xs-6 col-md-8 col-lg-9">
									<input type="text" class="form-control" id="new_virtualserver_password" name="newsettings[virtualserver_password]" value=""/>
								</td>
							</tr>
					</table>
					<input class="btn btn-flat btn-block btn-success" type="submit" name="editpw" value="Senden" />
				</form>
			</div>
		</div>
	{/if}
		<form method="post" action="index.php?site=serveredit&amp;sid={$sid}">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">{$lang['basics']}</h3>
		          	<div class="box-tools pull-right">
		            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
					</div>
				</div>
				<div class="box-body">
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_name">{$lang['name']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_name']) AND empty($permoverview['b_virtualserver_modify_name'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_name" name="newsettings[virtualserver_name]" value="{$serverinfo['virtualserver_name']}"/>
							{/if}
							</td>

						</tr>
						<tr>
							<td><label for="new_virtualserver_autostart">{$lang['autostart']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_autostart']) AND empty($permoverview['b_virtualserver_modify_autostart'])}
								 - 
							{else}
								<select id="new_virtualserver_autostart" class="form-control" name="newsettings[virtualserver_autostart]">
									<option value="1" {if $serverinfo['virtualserver_autostart'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
									<option value="0" {if $serverinfo['virtualserver_autostart'] == 0}selected="selected"{/if}>{$lang['no']}</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_port">{$lang['port']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_port']) AND empty($permoverview['b_virtualserver_modify_port'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_port" name="newsettings[virtualserver_port]" value="{$serverinfo['virtualserver_port']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_min_client_version">{$lang['minclientversion']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_min_client_version']) AND empty($permoverview['b_virtualserver_modify_min_client_version'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_min_client_version" name="newsettings[virtualserver_min_client_version]" value="{$serverinfo['virtualserver_min_client_version']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_welcomemessage">{$lang['welcomemsg']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_welcomemessage']) AND empty($permoverview['b_virtualserver_modify_welcomemessage'])}
								 - 
							{else}
								<textarea class="form-control" name="newsettings[virtualserver_welcomemessage]" id="new_virtualserver_welcomemessage" rows="5" cols="30">{$serverinfo['virtualserver_welcomemessage']}</textarea>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_maxclients">{$lang['maxclients']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_maxclients']) AND empty($permoverview['b_virtualserver_modify_maxclients'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_maxclients" name="newsettings[virtualserver_maxclients]" value="{$serverinfo['virtualserver_maxclients']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_reserved_slots">{$lang['maxreservedslots']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_reserved_slots']) AND empty($permoverview['b_virtualserver_modify_reserved_slots'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_reserved_slots" name="newsettings[virtualserver_reserved_slots]" value="{$serverinfo['virtualserver_reserved_slots']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_weblist_enabled">{$lang['showonweblist']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_weblist']) AND empty($permoverview['b_virtualserver_modify_weblist'])}
								 - 
							{else}
								<select class="form-control" name="newsettings[virtualserver_weblist_enabled]" id="new_virtualserver_weblist_enabled">
									<option value="1" {if $serverinfo['virtualserver_weblist_enabled'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
									<option value="0" {if $serverinfo['virtualserver_weblist_enabled'] == 0}selected="selected"{/if}>{$lang['no']}</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="virtualserver_modify_codec_encryption_mode">{$lang['codecencryptionmode']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_codec_encryption_mode']) AND empty($permoverview['b_virtualserver_modify_codec_encryption_mode'])}
								 - 
							{else}
								<select class="form-control" name="newsettings[virtualserver_codec_encryption_mode]" id="virtualserver_modify_codec_encryption_mode">
								<option value="0" {if $serverinfo['virtualserver_codec_encryption_mode'] == 0}selected='selected'{/if}>{$lang['codecencryptionmodeindi']}</option>
								<option value="1" {if $serverinfo['virtualserver_codec_encryption_mode'] == 1}selected='selected'{/if}>{$lang['codecencryptionmodegoff']}</option>
								<option value="2" {if $serverinfo['virtualserver_codec_encryption_mode'] == 2}selected='selected'{/if}>{$lang['codecencryptionmodegon']}</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_password">{$lang['passwordset']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_password']) AND empty($permoverview['b_virtualserver_modify_password'])}
								 - 
							{else}
								{if $serverinfo['virtualserver_flag_password'] == 1}{$lang['yes']}{else} {$lang['no']}{/if}
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_needed_identity_security_level">{$lang['securitylevel']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_needed_identity_security_level']) AND empty($permoverview['b_virtualserver_modify_needed_identity_security_level'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_needed_identity_security_level" name="newsettings[virtualserver_needed_identity_security_level]" value="{$serverinfo['virtualserver_needed_identity_security_level']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_min_clients_in_channel_before_forced_silence">{$lang['minclientschan']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_channel_forced_silence']) AND empty($permoverview['b_virtualserver_modify_channel_forced_silence'])}
								 - 
							{else}
								<input type="text" class="form-control" id="new_virtualserver_min_clients_in_channel_before_forced_silence" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}"/>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_iconid">{$lang['iconid']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_icon_id']) AND empty($permoverview['b_virtualserver_modify_icon_id'])}
								 - 
							{else}
								<input id="new_virtualserver_iconid" class="form-control" type="text" name="newsettings[virtualserver_icon_id]" value="{$serverinfo['virtualserver_icon_id']}" />
								<a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}&amp;port={$serverinfo['virtualserver_port']}');">{$lang['set']}</a>
							{/if}
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="box box-border-olive">
				<div class="box-header">
					<h3 class="box-title">{$lang['standardgroups']}</h3>
		          	<div class="box-tools pull-right">
		            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
					</div>
				</div>
				<div class="box-body">
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_default_server_group">{$lang['servergroup']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_default_servergroup']) AND empty($permoverview['b_virtualserver_modify_default_servergroup'])}
								-
							{else}
								<select class="form-control" id="new_virtualserver_default_server_group" name="newsettings[virtualserver_default_server_group]">
								{foreach key=key item=value from=$servergroups}
									{if $value['type'] == 1}
										<option {if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}selected="selected"{/if} value="{$value['sgid']}">{$value['sgid']} {$value['name']}</option>
									{/if}
								{/foreach}
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_default_channel_group">{$lang['channelgroup']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_default_channelgroup']) AND empty($permoverview['b_virtualserver_modify_default_channelgroup'])}
								-
							{else}
								<select class="form-control" id="new_virtualserver_default_channel_group" name="newsettings[virtualserver_default_channel_group]">
								{foreach key=key item=value from=$channelgroups}
									{if $value['type'] == 1}
										<option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
									{/if}
								{/foreach}
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_default_channel_admin_group">{$lang['chanadmingroup']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_default_channeladmingroup']) AND empty($permoverview['b_virtualserver_modify_default_channeladmingroup'])}
								-
							{else}
								<select class="form-control" id="new_virtualserver_default_channel_admin_group" name="newsettings[virtualserver_default_channel_admin_group]">
								{foreach key=key item=value from=$channelgroups}
									{if $value['type'] == 1}
										<option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
									{/if}
								{/foreach}
								</select>
							{/if}
							</td>
						</tr>
					</table>
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
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_hostmessage">{$lang['hostmessage']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
								-
							{else}
								<textarea class="form-control" id="new_virtualserver_hostmessage" name="newsettings[virtualserver_hostmessage]" rows="5" cols="30">{$serverinfo['virtualserver_hostmessage']}</textarea>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostmessage_mode">{$lang['hostmessageshow']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
								-
							{else}
							<select class="form-control" id="new_virtualserver_hostmessage_mode" name="newsettings[virtualserver_hostmessage_mode]">
								<option value="0" {if $serverinfo['virtualserver_hostmessage_mode'] == 0}selected='selected'{/if}>{$lang['nomessage']}</option>
								<option value="1" {if $serverinfo['virtualserver_hostmessage_mode'] == 1}selected='selected'{/if}>{$lang['showmessagelog']}</option>
								<option value="2" {if $serverinfo['virtualserver_hostmessage_mode'] == 2}selected='selected'{/if}>{$lang['showmodalmessage']}</option>
								<option value="3" {if $serverinfo['virtualserver_hostmessage_mode'] == 3}selected='selected'{/if}>{$lang['modalandexit']}</option>
							</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_url">{$lang['hosturl']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_hostbanner_url" name="newsettings[virtualserver_hostbanner_url]" value="{$serverinfo['virtualserver_hostbanner_url']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_gfx_url">{$lang['hostbannerurl']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
								-
							{else}
								{if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
								<img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
								{/if}
								<input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_url" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$serverinfo['virtualserver_hostbanner_gfx_url']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_gfx_interval">{$lang['hostbannerintval']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_interval" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$serverinfo['virtualserver_hostbanner_gfx_interval']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_tooltip">{$lang['hostbuttontooltip']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_hostbutton_tooltip" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$serverinfo['virtualserver_hostbutton_tooltip']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_gfx_url">{$lang['hostbuttongfx']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_hostbutton_gfx_url" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$serverinfo['virtualserver_hostbutton_gfx_url']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_url">{$lang['hostbuttonurl']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_hostbutton_url" name="newsettings[virtualserver_hostbutton_url]" value="{$serverinfo['virtualserver_hostbutton_url']}" />
							{/if}
							</td>
						</tr>
					</table>
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
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_complain_autoban_count">{$lang['autobancount']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_complain_autoban_count" name="newsettings[virtualserver_complain_autoban_count]" value="{$serverinfo['virtualserver_complain_autoban_count']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_complain_autoban_time">{$lang['autobantime']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_complain_autoban_time" name="newsettings[virtualserver_complain_autoban_time]" value="{$serverinfo['virtualserver_complain_autoban_time']}" />{$lang['seconds']}
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_complain_remove_time">{$lang['removetime']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_complain_remove_time" name="newsettings[virtualserver_complain_remove_time]" value="{$serverinfo['virtualserver_complain_remove_time']}" />{$lang['seconds']}
							{/if}
							</td>
						</tr>
					</table>
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
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_antiflood_points_tick_reduce">{$lang['pointstickreduce']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_tick_reduce" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$serverinfo['virtualserver_antiflood_points_tick_reduce']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_antiflood_points_needed_command_block">{$lang['pointsneededblockcmd']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_command_block" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_command_block']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_antiflood_points_needed_ip_block">{$lang['pointsneededblockip']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_ip_block" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}" />
							{/if}
							</td>
						</tr>
					</table>
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
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="">{$lang['upbandlimit']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							{if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_max_upload_total_bandwidth" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$serverinfo['virtualserver_max_upload_total_bandwidth']}" />Byte/s
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_upload_quota">{$lang['uploadquota']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_upload_quota" name="newsettings[virtualserver_upload_quota]" value="{$serverinfo['virtualserver_upload_quota']}" />MiB
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_max_download_total_bandwidth">{$lang['downbandlimit']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
								-
							{else}
								<input type="text" class="form-control" id="new_virtualserver_max_download_total_bandwidth" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$serverinfo['virtualserver_max_download_total_bandwidth']}" />Byte/s
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_download_quota">{$lang['downloadquota']}:</label></td>
							<td>
							{if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
								-
							{else}	
								<input type="text" class="form-control" id="new_virtualserver_download_quota" name="newsettings[virtualserver_download_quota]" value="{$serverinfo['virtualserver_download_quota']}" />MiB
							{/if}
							</td>
						</tr>

					</table>
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
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td class="col-xs-6 col-md-4 col-lg-3"><label for="new_virtualserver_log_client">{$lang['logclient']}:</label></td>
							<td class="col-xs-6 col-md-8 col-lg-9">
							<select class="form-control" id="new_virtualserver_log_client" name="newsettings[virtualserver_log_client]">
								<option value="1" {if $serverinfo['virtualserver_log_client'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_client'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_query">{$lang['logquery']}:</label></td>
							<td>
							<select class="form-control" id="new_virtualserver_log_query" name="newsettings[virtualserver_log_query]">
								<option value="1" {if $serverinfo['virtualserver_log_query'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_query'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_channel">{$lang['logchannel']}:</label></td>
							<td>
							<select class="form-control" id="new_virtualserver_log_channel" name="newsettings[virtualserver_log_channel]">
								<option value="1" {if $serverinfo['virtualserver_log_channel'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_channel'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_permissions">{$lang['logpermissions']}:</label></td>
							<td>
							<select class="form-control" id="new_virtualserver_log_permissions" name="newsettings[virtualserver_log_permissions]">
								<option value="1" {if $serverinfo['virtualserver_log_permissions'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_permissions'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_server">{$lang['logserver']}:</label></td>
							<td>
							<select class="form-control" id="new_virtualserver_log_server" name="newsettings[virtualserver_log_server]">
								<option value="1" {if $serverinfo['virtualserver_log_server'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_server'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>	
						<tr>
							<td><label for="new_virtualserver_log_filetransfer">{$lang['logfiletransfer']}:</label></td>
							<td>
							<select class="form-control" id="new_virtualserver_log_filetransfer" name="newsettings[virtualserver_log_filetransfer]">
								<option value="1" {if $serverinfo['virtualserver_log_filetransfer'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $serverinfo['virtualserver_log_filetransfer'] == 0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							</td>
						</tr>	
					</table>
				</div>
			</div>

			<input class="btn btn-block btn-flat btn-success" type="submit" name="editserver" value="Edit" />
		</form>
	</div>
</section>