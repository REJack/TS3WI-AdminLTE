<section class="content-header">
	<h1>
		{$lang['virtualserver']} #{$serverinfo['virtualserver_id']}
    </h1>
</section>
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
	{if $newserverversion !== true AND !empty($serverinfo['virtualserver_version'])}
		<div class="alert alert-warning">{$lang['serverupdateav']}{$newserverversion}</div>
	{/if}

	{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	{else}
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['msgtoserver']}</h3>
	          	<div class="box-tools pull-right">
	            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<form class="box-body" method="post" action="index.php?site=serverview&amp;sid={$sid}">
				<div class="form-group">
					<textarea type="text" class="form-control" name="msgtoall" id="msgtoall"></textarea>
				</div>
				<input class="btn btn-flat bg-teal pull-right" type="submit" name="sendmsg" value="{$lang['send']}" />
			</form>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-6">
				<form method="post" action="index.php?site=serverview&amp;sid={$sid}">
					<input type="hidden" name="sid" value="{$serverinfo['virtualserver_id']}" />
					<input class="btn btn-success btn-flat btn-block" type="submit" name="start" value="{$lang['start']}" />
				</form>
			</div>
			<div class="col-xs-12 col-md-6">
				<form method="post" action="index.php?site=serverview&amp;sid={$sid}">
					<input type="hidden" name="sid" value="{$serverinfo['virtualserver_id']}" />
					<input class="btn btn-danger btn-flat btn-block" type="submit" name="stop" value="{$lang['stop']}" onclick="return confirm('{$lang['stopservermsg']}')" />
				</form>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">{$lang['basics']}</h3>
			          	<div class="box-tools pull-right">
			            	<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['autostart']}:</b></td>
								<td width="50%">
								{if $serverinfo['virtualserver_autostart'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['serveraddress']}:</b></td>
								<td>{$smarty.session.server_ip}:{$serverinfo['virtualserver_port']}</td>
							</tr>
							<tr>
								<td style="width:50%"><b>{$lang['minclientversion']}:</b></td>
								<td style="width:50%">{$serverinfo['virtualserver_min_client_version']}</td>
							</tr>
							<tr>
								<td><b>{$lang['uniqueid']}:</b></td>
								<td>{$serverinfo['virtualserver_unique_identifier']}</td>
							</tr>
							<tr>
								<td><b>{$lang['name']}:</b></td>
								<td>{$serverinfo['virtualserver_name']}</td>
							</tr>
							<tr>
								<td><b>{$lang['welcomemsg']}:</b></td>
								<td>{$serverinfo['virtualserver_welcomemessage']}</td>
							</tr>
							<tr>
								<td><b>{$lang['version']}:</b></td>
								<td>{$serverinfo['virtualserver_version']}</td>
							</tr>
							<tr>
								<td><b>{$lang['platform']}:</b></td>
								<td>{$serverinfo['virtualserver_platform']}</td>
							</tr>
							<tr>
								<td><b>{$lang['created']}:</b></td>
								<td>{$serverinfo['virtualserver_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							</tr>
							<tr>
								<td><b>{$lang['status']}:</b></td>
								<td>{$serverinfo['virtualserver_status']}</td>
							</tr>
							<tr>
								<td><b>{$lang['runtime']}:</b></td>
								<td>{$serverinfo['virtualserver_uptime']}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['clients']}:</b></td>
								<td>{$serverinfo['virtualserver_clientsonline']-$serverinfo['virtualserver_queryclientsonline']} / {$serverinfo['virtualserver_maxclients']}</td>
							</tr>
							<tr>
								<td><b>{$lang['queryclients']}:</b></td>
								<td>{$serverinfo['virtualserver_queryclientsonline']}</td>
							</tr>
							<tr>
								<td><b>{$lang['maxreservedslots']}:</b></td>
								<td>{$serverinfo['virtualserver_reserved_slots']}</td>
							</tr>
							<tr>
								<td><b>{$lang['showonweblist']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_weblist_enabled'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}				
								</td>
							</tr>
							<tr>
								<td><b>{$lang['codecencryptionmode']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_codec_encryption_mode']==0}
								{$lang['codecencryptionmodeindi']}
								{elseif $serverinfo['virtualserver_codec_encryption_mode']==1}
								{$lang['codecencryptionmodegoff']}
								{elseif $serverinfo['virtualserver_codec_encryption_mode']==2}
								{$lang['codecencryptionmodegon']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['channel']}:</b></td>
								<td>{$serverinfo['virtualserver_channelsonline']}</td>
							</tr>
							<tr>
								<td><b>{$lang['minclientschan']}:</b></td>
								<td>{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}</td>
							</tr>
							<tr>
								<td><b>{$lang['clientsdimm']}:</b></td>
								<td>{$serverinfo['virtualserver_priority_speaker_dimm_modificator']}</td>
							</tr>
							<tr>
								<td><b>{$lang['passwordset']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_flag_password'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['securitylevel']}:</b></td>
								<td>{$serverinfo['virtualserver_needed_identity_security_level']}</td>
							</tr>
							<tr>
								<td><b>{$lang['iconid']}:</b></td>
								<td>{$serverinfo['virtualserver_icon_id']}</td>
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['servergroup']}:</b></td>
								<td width="50%">
								{if !empty($servergroups)}
									{foreach key=key item=value from=$servergroups}
										{if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}
											({$value['sgid']}){$value['name']}
										{/if}
									{/foreach}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['channelgroup']}:</b></td>
								<td>
								{if !empty($channelgroups)}
									{foreach key=key item=value from=$channelgroups}
										{if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}
											({$value['cgid']}){$value['name']}
										{/if}
									{/foreach}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['chanadmingroup']}:</b></td>
								<td>
								{if !empty($channelgroups)}
									{foreach key=key item=value from=$channelgroups}
										{if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}
											({$value['cgid']}){$value['name']}
										{/if}
									{/foreach}
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['hostmessage']}:</b></td>
								<td width="50%">{$serverinfo['virtualserver_hostmessage']}</td>
							</tr>
							<tr>
								<td><b>{$lang['hostmessageshow']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_hostmessage_mode'] == '0'}
									{$lang['nomessage']}
									{elseif $serverinfo['virtualserver_hostmessage_mode'] == '1'}
									{$lang['showmessagelog']}
									{elseif $serverinfo['virtualserver_hostmessage_mode'] == '2'}
									{$lang['showmodalmessage']}
									{elseif $serverinfo['virtualserver_hostmessage_mode'] == '3'}
									{$lang['modalandexit']}
								{/if}
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td><b>{$lang['hosturl']}:</b></td>
								<td>{$serverinfo['virtualserver_hostbanner_url']}</td>
							</tr>
							<tr>
								<td><b>{$lang['hostbannerurl']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
								<img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
								{/if}
								{$serverinfo['virtualserver_hostbanner_gfx_url']}</td>
							</tr>
							<tr>
								<td><b>{$lang['hostbannerintval']}:</b></td>
								<td>{$serverinfo['virtualserver_hostbanner_gfx_interval']}</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td><b>{$lang['hostbuttongfx']}:</b></td>
								<td>{$serverinfo['virtualserver_hostbutton_gfx_url']}</td>
							</tr>
							<tr>
								<td><b>{$lang['hostbuttontooltip']}:</b></td>
								<td>{$serverinfo['virtualserver_hostbutton_tooltip']}</td>
							</tr>
							<tr>
								<td><b>{$lang['hostbuttonurl']}:</b></td>
								<td>{$serverinfo['virtualserver_hostbutton_url']}</td>
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['autobancount']}:</b></td>
								<td width="50%">{$serverinfo['virtualserver_complain_autoban_count']}</td>
							</tr>
							<tr>
								<td><b>{$lang['autobantime']}:</b></td>
								<td>{$serverinfo['virtualserver_complain_autoban_time']}</td>
							</tr>
							<tr>
								<td><b>{$lang['removetime']}:</b></td>
								<td>{$serverinfo['virtualserver_complain_remove_time']}</td>
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['pointstickreduce']}:</b></td>
								<td width="50%">{$serverinfo['virtualserver_antiflood_points_tick_reduce']}</td>
							</tr>
							<tr>
								<td><b>{$lang['pointsneededblockcmd']}:</b></td>
								<td>{$serverinfo['virtualserver_antiflood_points_needed_command_block']}</td>
							</tr>
							<tr>
								<td><b>{$lang['pointsneededblockip']}:</b></td>
								<td>{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}</td>
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['upbandlimit']}:</b></td>
								<td width="50%">{$serverinfo['virtualserver_max_upload_total_bandwidth']} Byte/s</td>
							</tr>
							<tr>
								<td><b>{$lang['uploadquota']}:</b></td>
								<td>{$serverinfo['virtualserver_upload_quota']} MiB</td>
							</tr>
							<tr>
								<td><b>{$lang['downbandlimit']}:</b></td>
								<td>{$serverinfo['virtualserver_max_download_total_bandwidth']} Byte/s</td>
							</tr>
							<tr>
								<td><b>{$lang['downloadquota']}:</b></td>
								<td>{$serverinfo['virtualserver_download_quota']} MiB</td>
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
						<table class="table table-striped">
							<tr>
								<td width="50%"><b>{$lang['logclient']}:</b></td>
								<td width="50%">
								{if $serverinfo['virtualserver_log_client'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['logquery']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_log_query'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['logchannel']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_log_channel'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['logpermissions']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_log_permissions'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<td><b>{$lang['logserver']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_log_server'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}	
								</td>
							</tr>
							<tr>
								<td><b>{$lang['logfiletransfer']}:</b></td>
								<td>
								{if $serverinfo['virtualserver_log_filetransfer'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}	
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-border-maroon">
					<div class="box-body">
						{$tree}
					</div>
					<div class="box-footer">						
						{$lang['tsviewpubhtml']}
						<textarea rows="5" class="form-control" readonly>{$pubtsview}</textarea>
					</div>
				</div>
			</div>
		</div>
		{/if}
	</div>
</section>