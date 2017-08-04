{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	</div>
</section>
{else}
<section class="content-header">
	<h1>
		{$lang['virtualserver']} #{$serverinfo['virtualserver_id']}
	</h1>
</section>
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1 no-padding">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
	{if $newserverversion !== true AND !empty($serverinfo['virtualserver_version'])}
		<div class="alert alert-warning">{$lang['serverupdateav']}{$newserverversion}</div>
	{/if}
		<div class="box box-border-teal" data-name="serverview_msgtoall">
			<div class="box-header">
				<h3 class="box-title">{$lang['msgtoserver']}</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<form class="box-body" method="post" action="index.php?site=serverview&amp;sid={$sid}">
				<div class="form-group">
					<textarea type="text" class="form-control resize-vert" name="msgtoall" id="msgtoall"></textarea>
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
				<div class="box box-primary" data-name="serverview_basics">
					<div class="box-header">
						<h3 class="box-title">{$lang['basics']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['autostart']}:</th>
								<td>
								{if $serverinfo['virtualserver_autostart'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['serveraddress']}:</th>
								<td>{$smarty.session.server_ip}:{$serverinfo['virtualserver_port']}</td>
							</tr>
							<tr>
								<th>{$lang['minclientversion']}:</th>
								<td>{$serverinfo['virtualserver_min_client_version']}</td>
							</tr>
							<tr>
								<th>{$lang['uniqueid']}:</th>
								<td>{$serverinfo['virtualserver_unique_identifier']}</td>
							</tr>
							<tr>
								<th>{$lang['name']}:</th>
								<td>{$serverinfo['virtualserver_name']}</td>
							</tr>
							<tr>
								<th>{$lang['welcomemsg']}:</th>
								<td>{$serverinfo['virtualserver_welcomemessage']}</td>
							</tr>
							<tr>
								<th>{$lang['version']}:</th>
								<td>{$serverinfo['virtualserver_version']}</td>
							</tr>
							<tr>
								<th>{$lang['platform']}:</th>
								<td>{$serverinfo['virtualserver_platform']}</td>
							</tr>
							<tr>
								<th>{$lang['created']}:</th>
								<td>{$serverinfo['virtualserver_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							</tr>
							<tr>
								<th>{$lang['status']}:</th>
								<td>
									{if $serverinfo['virtualserver_status'] == "online"}
										<span class="btn btn-flat btn-xs btn-success disabled">{$lang['online']}</span>
									{elseif $serverinfo['virtualserver_status'] == "online virtual"}
										<span class="btn btn-flat btn-xs btn-primary disabled">{$lang['onlinevirtual']}</span>
									{elseif $serverinfo['virtualserver_status'] == "offline"}
										<span class="btn btn-flat btn-xs btn-danger disabled">{$lang['offline']}</span>
									{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['runtime']}:</th>
								<td>{$serverinfo['virtualserver_uptime']}
								</td>
							</tr>
							<tr>
								<th>{$lang['clients']}:</th>
								<td>{$serverinfo['virtualserver_clientsonline']-$serverinfo['virtualserver_queryclientsonline']} / {$serverinfo['virtualserver_maxclients']}</td>
							</tr>
							<tr>
								<th>{$lang['queryclients']}:</th>
								<td>{$serverinfo['virtualserver_queryclientsonline']}</td>
							</tr>
							<tr>
								<th>{$lang['maxreservedslots']}:</th>
								<td>{$serverinfo['virtualserver_reserved_slots']}</td>
							</tr>
							<tr>
								<th>{$lang['showonweblist']}:</th>
								<td>
								{if $serverinfo['virtualserver_weblist_enabled'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}				
								</td>
							</tr>
							<tr>
								<th>{$lang['codecencryptionmode']}:</th>
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
								<th>{$lang['channel']}:</th>
								<td>{$serverinfo['virtualserver_channelsonline']}</td>
							</tr>
							<tr>
								<th>{$lang['minclientschan']}:</th>
								<td>{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}</td>
							</tr>
							<tr>
								<th>{$lang['clientsdimm']}:</th>
								<td>{$serverinfo['virtualserver_priority_speaker_dimm_modificator']}</td>
							</tr>
							<tr>
								<th>{$lang['passwordset']}:</th>
								<td>
								{if $serverinfo['virtualserver_flag_password'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['securitylevel']}:</th>
								<td>{$serverinfo['virtualserver_needed_identity_security_level']}</td>
							</tr>
							<tr>
								<th>{$lang['iconid']}:</th>
								<td>{$serverinfo['virtualserver_icon_id']}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="box box-border-olive" data-name="serverview_standardgroups">
					<div class="box-header">
						<h3 class="box-title">{$lang['standardgroups']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['servergroup']}:</th>
								<td>
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
								<th>{$lang['channelgroup']}:</th>
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
								<th>{$lang['chanadmingroup']}:</th>
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
				<div class="box box-info" data-name="serverview_host">
					<div class="box-header">
						<h3 class="box-title">{$lang['host']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['hostmessage']}:</td>
								<td>{$serverinfo['virtualserver_hostmessage']}</td>
							</tr>
							<tr>
								<th>{$lang['hostmessageshow']}:</th>
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
								<th>{$lang['hosturl']}:</th>
								<td>{$serverinfo['virtualserver_hostbanner_url']}</td>
							</tr>
							<tr>
								<th>{$lang['hostbannerurl']}:</th>
								<td>
								{if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
								<img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
								{/if}
								{$serverinfo['virtualserver_hostbanner_gfx_url']}</td>
							</tr>
							<tr>
								<th>{$lang['hostbannerintval']}:</th>
								<td>{$serverinfo['virtualserver_hostbanner_gfx_interval']}</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<th>{$lang['hostbuttongfx']}:</th>
								<td>{$serverinfo['virtualserver_hostbutton_gfx_url']}</td>
							</tr>
							<tr>
								<th>{$lang['hostbuttontooltip']}:</th>
								<td>{$serverinfo['virtualserver_hostbutton_tooltip']}</td>
							</tr>
							<tr>
								<th>{$lang['hostbuttonurl']}:</th>
								<td>{$serverinfo['virtualserver_hostbutton_url']}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="box box-warning" data-name="serverview_autoban">
					<div class="box-header">
						<h3 class="box-title">{$lang['autoban']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['autobancount']}:</td>
								<td>{$serverinfo['virtualserver_complain_autoban_count']}</td>
							</tr>
							<tr>
								<th>{$lang['autobantime']}:</th>
								<td>{$serverinfo['virtualserver_complain_autoban_time']}</td>
							</tr>
							<tr>
								<th>{$lang['removetime']}:</th>
								<td>{$serverinfo['virtualserver_complain_remove_time']}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="box box-danger" data-name="serverview_antiflood">
					<div class="box-header">
						<h3 class="box-title">{$lang['antiflood']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['pointstickreduce']}:</td>
								<td>{$serverinfo['virtualserver_antiflood_points_tick_reduce']}</td>
							</tr>
							<tr>
								<th>{$lang['pointsneededblockcmd']}:</th>
								<td>{$serverinfo['virtualserver_antiflood_points_needed_command_block']}</td>
							</tr>
							<tr>
								<th>{$lang['pointsneededblockip']}:</th>
								<td>{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="box box-success" data-name="serverview_transfers">
					<div class="box-header">
						<h3 class="box-title">{$lang['transfers']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['upbandlimit']}:</td>
								<td>{$serverinfo['virtualserver_max_upload_total_bandwidth']} Byte/s</td>
							</tr>
							<tr>
								<th>{$lang['uploadquota']}:</th>
								<td>{$serverinfo['virtualserver_upload_quota']} MiB</td>
							</tr>
							<tr>
								<th>{$lang['downbandlimit']}:</th>
								<td>{$serverinfo['virtualserver_max_download_total_bandwidth']} Byte/s</td>
							</tr>
							<tr>
								<th>{$lang['downloadquota']}:</th>
								<td>{$serverinfo['virtualserver_download_quota']} MiB</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="box box-default" data-name="serverview_logs">
					<div class="box-header">
						<h3 class="box-title">{$lang['logs']}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<table class="table table-striped table-td-no-padding table-vert-mid">
							<tr>
								<th width="50%">{$lang['logclient']}:</td>
								<td>
								{if $serverinfo['virtualserver_log_client'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['logquery']}:</th>
								<td>
								{if $serverinfo['virtualserver_log_query'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['logchannel']}:</th>
								<td>
								{if $serverinfo['virtualserver_log_channel'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['logpermissions']}:</th>
								<td>
								{if $serverinfo['virtualserver_log_permissions'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
								</td>
							</tr>
							<tr>
								<th>{$lang['logserver']}:</th>
								<td>
								{if $serverinfo['virtualserver_log_server'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}	
								</td>
							</tr>
							<tr>
								<th>{$lang['logfiletransfer']}:</th>
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
				<div class="box box-border-maroon" data-name="serverview_ts3viewer">
					<div class="box-header">
						<h3 class="box-title">TS3-Viewer</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						{$tree}
					</div>
					<div class="box-footer">						
						{$lang['tsviewpubhtml']}
						<textarea rows="5" class="form-control resize-vert" readonly>{$pubtsview}</textarea>
					</div>
				</div>
			</div>
		</div>
		{/if}
	</div>
</section>