{if !isset($smarty.post.createserver) OR !empty($error)}
<section class="content-header">
	<h1>
        {$lang['createnewserver']}
    </h1>
    <p class="lead">{$lang['createserverdesc']}</p>
</section>
{/if}
<section class="content container-fluid">
	<div class="col-lg-8 col-lg-offset-2" style="position: relative;">
{if $hoststatus === false AND $serverhost === true}
	<div class="alert alert-warning">{$lang['nohoster']}</div>
{else}
{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if !empty($noerror)}
	<div class="alert alert-info">{$noerror}</div>
{/if}
{if !isset($smarty.post.createserver) OR !empty($error)}
		<form method="post" action="index.php?site=createserver">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">{$lang['basics']}</h3>
		          	<div class="box-tools pull-right">
		            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
					</div>
				</div>
				<div class="box-body">
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="50%"><label for="new_virtualserver_name">{$lang['name']}:</label></td>
							<td width="50%"><input type="text" class="form-control" id="new_virtualserver_name" name="newsettings[virtualserver_name]" value="{$screate_tmp['name']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_port">{$lang['port']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_port" name="newsettings[virtualserver_port]" value="{$screate_tmp['port']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_min_client_version">{$lang['minclientversion']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_min_client_version" name="newsettings[virtualserver_min_client_version]" value="{$screate_tmp['minclientversion']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_welcomemessage">{$lang['welcomemsg']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_welcomemessage" name="newsettings[virtualserver_welcomemessage]" value="{$screate_tmp['welcomemsg']}"/>
						</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_maxclients">{$lang['maxclients']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_maxclients" name="newsettings[virtualserver_maxclients]" value="{$screate_tmp['maxclients']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_reserved_slots">{$lang['maxreservedslots']}:</label></td>
							<td>
							<input type="text" class="form-control" id="new_virtualserver_reserved_slots" name="newsettings[virtualserver_reserved_slots]" value="{$screate_tmp['reservedslots']}"/>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_weblist_enabled">{$lang['showonweblist']}:</label></td>
							<td>
							<input type="text" class="form-control" id="new_virtualserver_weblist_enabled" name="newsettings[virtualserver_weblist_enabled]" value="{$screate_tmp['showonweblist']}"/>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_password">{$lang['password']}:</label></td>
							<td>
							<input type="text" class="form-control" id="new_virtualserver_password" name="newsettings[virtualserver_password]" value="{$screate_tmp['password']}"/>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_needed_identity_security_level">{$lang['securitylevel']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_needed_identity_security_level" name="newsettings[virtualserver_needed_identity_security_level]" value="{$screate_tmp['securitylvl']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_min_clients_in_channel_before_forced_silence">{$lang['minclientschan']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_min_clients_in_channel_before_forced_silence" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$screate_tmp['forcesilence']}"/></td>
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
							<td width="50%"><label for="new_virtualserver_hostmessage">{$lang['hostmessage']}:</label></td>
							<td width="50%"><input type="text" class="form-control" id="new_virtualserver_hostmessage" name="newsettings[virtualserver_hostmessage]" value="{$screate_tmp['hostmsg']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostmessage_mode">{$lang['hostmessageshow']}:</label></td>
							<td>
								<div class="radio">
									<label>
										<input {if $screate_tmp['hostmsgshow'] === '0'} checked="checked" {/if} type="radio" id="new_virtualserver_hostmessage_mode" name="newsettings[virtualserver_hostmessage_mode]" value="0" />
										{$lang['nomessage']}
									</label>
								</div>
								<div class="radio">
									<label>
										<input {if $screate_tmp['hostmsgshow'] === '1'} checked="checked" {/if} type="radio" id="" name="newsettings[virtualserver_hostmessage_mode]" value="1" />
										{$lang['showmessagelog']} 
									</label>
								</div>
								<div class="radio">
									<label>
										<input {if $screate_tmp['hostmsgshow'] === '2'} checked="checked" {/if} type="radio" id="" name="newsettings[virtualserver_hostmessage_mode]" value="2" />
										{$lang['showmodalmessage']}
									</label>
								</div>					
								<div class="radio">
									<label>
										<input {if $screate_tmp['hostmsgshow'] === '3'} checked="checked" {/if} type="radio" id="" name="newsettings[virtualserver_hostmessage_mode]" value="3" />
										{$lang['modalandexit']} 
									</label>
								</div>					
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_url">{$lang['hosturl']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbanner_url" name="newsettings[virtualserver_hostbanner_url]" value="{$screate_tmp['hosturl']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_gfx_url">{$lang['hostbannerurl']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_url" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$screate_tmp['hostbannerurl']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbanner_gfx_interval">{$lang['hostbannerintval']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_interval" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$screate_tmp['hostbannerint']}"/></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_gfx_url">{$lang['hostbuttongfx']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbutton_gfx_url" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$screate_tmp['hostbuttongfx']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_tooltip">{$lang['hostbuttontooltip']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbutton_tooltip" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$screate_tmp['hostbuttontip']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_hostbutton_url">{$lang['hostbuttonurl']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_hostbutton_url" name="newsettings[virtualserver_hostbutton_url]" value="{$screate_tmp['hostbuttonurl']}"/></td>
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
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="50%"><label for="new_virtualserver_complain_autoban_count">{$lang['autobancount']}:</label></td>
							<td width="50%"><input type="text" class="form-control" id="new_virtualserver_complain_autoban_count" name="newsettings[virtualserver_complain_autoban_count]" value="{$screate_tmp['autobancount']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_complain_autoban_time">{$lang['autobantime']}:</label></td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_complain_autoban_time" name="newsettings[virtualserver_complain_autoban_time]" value="{$screate_tmp['autobantime']}"/>
									<span class="input-group-addon">{$lang['seconds']}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_complain_remove_time">{$lang['removetime']}:</label></td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_complain_remove_time" name="newsettings[virtualserver_complain_remove_time]" value="{$screate_tmp['removetime']}"/>
									<span class="input-group-addon">{$lang['seconds']}</span>
								</div>
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
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="50%"><label for="new_virtualserver_antiflood_points_tick_reduce">{$lang['pointstickreduce']}:</label></td>
							<td width="50%"><input type="text" class="form-control" id="new_virtualserver_antiflood_points_tick_reduce" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$screate_tmp['pointstickreduce']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_antiflood_points_needed_command_bl</label>ock">{$lang['pointsneededblockcmd']}:</td>
							<td><input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_command_block" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$screate_tmp['pointsneededblockcmd']}"/></td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_antiflood_points_needed_ip_block">{$lang['pointsneededblockip']}:</label></td>
							<td><input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_ip_block" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$screate_tmp['pointsneededblockip']}"/></td>
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
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="50%"><label for="new_virtualserver_max_upload_total_bandwidth">{$lang['upbandlimit']}:</label></td>
							<td width="50%">
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_max_upload_total_bandwidth" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$screate_tmp['uploadbandwidthlimit']}"/> 
									<span class="input-group-addon">Byte/s</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_upload_quota">{$lang['uploadquota']}:</label></td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_upload_quota" name="newsettings[virtualserver_upload_quota]" value="{$screate_tmp['uploadquota']}"/> 
									<span class="input-group-addon">MiB</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_max_download_total_bandwidth">{$lang['downbandlimit']}:</label></td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_max_download_total_bandwidth" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$screate_tmp['downloadbandwidthlimit']}"/> 
									<span class="input-group-addon">Byte/s</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_download_quota">{$lang['downloadquota']}:</label></td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_download_quota" name="newsettings[virtualserver_download_quota]" value="{$screate_tmp['downloadquota']}"/>
									<span class="input-group-addon">MiB</span>
								</div>
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
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="50%"><label for="new_virtualserver_log_client">{$lang['logclient']}:</label></td>
							<td width="50%">
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_client" name="newsettings[virtualserver_log_client]" value="1" {if $screate_tmp['virtualserver_log_client'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_client]" value="0" {if $screate_tmp['virtualserver_log_client'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_query">{$lang['logquery']}:</label></td>
							<td>
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_query" name="newsettings[virtualserver_log_query]" value="1" {if $screate_tmp['virtualserver_log_query'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_query]" value="0" {if $screate_tmp['virtualserver_log_query'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_channel">{$lang['logchannel']}:</label></td>
							<td>
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_channel" name="newsettings[virtualserver_log_channel]" value="1" {if $screate_tmp['virtualserver_log_channel'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_channel]" value="0" {if $screate_tmp['virtualserver_log_channel'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_permissions">{$lang['logpermissions']}:</label></td>
							<td>
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_permissions" name="newsettings[virtualserver_log_permissions]" value="1" {if $screate_tmp['virtualserver_log_permissions'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_permissions]" value="0" {if $screate_tmp['virtualserver_log_permissions'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="new_virtualserver_log_server">{$lang['logserver']}:</label></td>
							<td>
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_server" name="newsettings[virtualserver_log_server]" value="1" {if $screate_tmp['virtualserver_log_server'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_server]" value="0" {if $screate_tmp['virtualserver_log_server'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>	
						<tr>
							<td><label for="new_virtualserver_log_filetransfer">{$lang['logfiletransfer']}:</label></td>
							<td>
								<div class="radio-inline">
									<label>
										<input type="radio" id="new_virtualserver_log_filetransfer" name="newsettings[virtualserver_log_filetransfer]" value="1" {if $screate_tmp['virtualserver_log_filetransfer'] === '1'}checked="checked"{/if} />
										{$lang['yes']}
									</label>
								</div>
								<div class="radio-inline">
									<label>
										<input type="radio" id="" name="newsettings[virtualserver_log_filetransfer]" value="0" {if $screate_tmp['virtualserver_log_filetransfer'] === '0'}checked="checked"{/if} />
										{$lang['no']}
									</label>
								</div>
							</td>
						</tr>	
					</table>
				</div>
			</div>
			<input class="btn btn-flat btn-block btn-success" type="submit" name="createserver" value="{$lang['create']}"/>
		</form>
{/if}
{/if}
	</div>
</section>