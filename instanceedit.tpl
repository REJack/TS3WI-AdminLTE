<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
	{if $hoststatus === false AND $serverhost === true}
		<div class="alert alert-warning">{$lang['nohoster']}</div>
	{else}
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['instanceedit']}</h3>
			</div>
			<form class="box-body" method="post" action="index.php?site=instanceedit">
				<table class="table" cellpadding="0" cellspacing="0">
					<tr>
						<th><label for="new_serverinstance_guest_serverquery_group">{$lang['questsquerygroup']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_guest_serverquery_group" name="newsettings[serverinstance_guest_serverquery_group]" value="{$instanceinfo['serverinstance_guest_serverquery_group']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_template_serveradmin_group">{$lang['tempsadmingroup']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_template_serveradmin_group" name="newsettings[serverinstance_template_serveradmin_group]" value="{$instanceinfo['serverinstance_template_serveradmin_group']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_template_channeladmin_group">{$lang['tempcadmingroup']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_template_channeladmin_group" name="newsettings[serverinstance_template_channeladmin_group]" value="{$instanceinfo['serverinstance_template_channeladmin_group']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_template_serverdefault_group">{$lang['tempsdefgroup']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_template_serverdefault_group" name="newsettings[serverinstance_template_serverdefault_group]" value="{$instanceinfo['serverinstance_template_serverdefault_group']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_template_channeldefault_group">{$lang['tempcdefgroup']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_template_channeldefault_group" name="newsettings[serverinstance_template_channeldefault_group]" value="{$instanceinfo['serverinstance_template_channeldefault_group']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_filetransfer_port">{$lang['filetransport']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_filetransfer_port" name="newsettings[serverinstance_filetransfer_port]" value="{$instanceinfo['serverinstance_filetransfer_port']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_max_download_total_bandwidth">{$lang['maxdownbandwidth']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_max_download_total_bandwidth" name="newsettings[serverinstance_max_download_total_bandwidth]" value="{$instanceinfo['serverinstance_max_download_total_bandwidth']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_max_upload_total_bandwidth">{$lang['maxupbandwidth']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_max_upload_total_bandwidth" name="newsettings[serverinstance_max_upload_total_bandwidth]" value="{$instanceinfo['serverinstance_max_upload_total_bandwidth']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_serverquery_flood_commands">{$lang['squeryfloodcmd']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_serverquery_flood_commands" name="newsettings[serverinstance_serverquery_flood_commands]" value="{$instanceinfo['serverinstance_serverquery_flood_commands']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_serverquery_flood_time">{$lang['squeryfloodtime']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_serverquery_flood_time" name="newsettings[serverinstance_serverquery_flood_time]" value="{$instanceinfo['serverinstance_serverquery_flood_time']}" /></td>
					</tr>
					<tr>
						<th><label for="new_serverinstance_serverquery_ban_time">{$lang['squerybantime']}</label></th>
						<td><input type="text" class="form-control" id="new_serverinstance_serverquery_ban_time" name="newsettings[serverinstance_serverquery_ban_time]" value="{$instanceinfo['serverinstance_serverquery_ban_time']}" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input class="btn btn-success btn-flat" type="submit" name="editinstance" value="{$lang['edit']}" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['showonweblist']}</h3>
			</div>
			<form class="box-body" method="post" action="index.php?site=instanceedit">
				<table class="table" cellpadding="0" cellspacing="0">
					<tr>
						<th>{$lang['serverid']}</th>
						<th>{$lang['name']}</th>
						<th class="text-right">
							<div class="checkbox-inline">
								<a href="javascript::void(0)" class="btn btn-flat btn-primary btn-xs" onclick="check(1)">
									{$lang['selectall']}
								</a>
							</div>
						</th>
					</tr>
					{if !empty($serverlist)}
						{foreach key=key item=value from=$serverlist}
							<tr>
								<td>{$value['virtualserver_id']}</td>
								<td>{$value['virtualserver_name']}</td>
								<td align="right">
									<input type="hidden" name="list[{$value['virtualserver_id']}][0]" value="0" />
									<input {if $value['virtualserver_weblist_enabled'] == 1}checked="checked"{/if} type="checkbox" id="list{$value['virtualserver_id']}" name="list[{$value['virtualserver_id']}][0]" value="1"/>
								</td>
							</tr>
						{/foreach}
					{/if}
					<tr>
						<td class="text-center" colspan="3"><input type="submit" class="btn btn-flat btn-success" name="editshowlist" value="{$lang['edit']}" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	{/if}
</section>