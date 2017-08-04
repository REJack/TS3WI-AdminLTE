<script type="text/javascript">
	$(function () {
		$('#instanceedit_showonweblist input[type="checkbox"]').on('change', function(){
			$.post({
				url: $('#instanceedit_showonweblist').attr('action'),
				data: $('#instanceedit_showonweblist').serialize(),
			})
		});
	});	
</script>
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1 no-padding">
	{if $hoststatus === false AND $serverhost === true}
		<div class="alert alert-warning">{$lang['nohoster']}</div>
	{else}
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
		<div class="box box-primary" data-name="instanceedit_main">
			<div class="box-header">
				<h3 class="box-title">{$lang['instanceedit']}</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<form class="box-body" method="post" action="index.php?site=instanceedit">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="new_serverinstance_guest_serverquery_group">{$lang['questsquerygroup']}</label>
							<input type="text" class="form-control" id="new_serverinstance_guest_serverquery_group" name="newsettings[serverinstance_guest_serverquery_group]" value="{$instanceinfo['serverinstance_guest_serverquery_group']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_template_serveradmin_group">{$lang['tempsadmingroup']}</label>
							<input type="text" class="form-control" id="new_serverinstance_template_serveradmin_group" name="newsettings[serverinstance_template_serveradmin_group]" value="{$instanceinfo['serverinstance_template_serveradmin_group']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_template_channeladmin_group">{$lang['tempcadmingroup']}</label>
							<input type="text" class="form-control" id="new_serverinstance_template_channeladmin_group" name="newsettings[serverinstance_template_channeladmin_group]" value="{$instanceinfo['serverinstance_template_channeladmin_group']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_template_serverdefault_group">{$lang['tempsdefgroup']}</label>
							<input type="text" class="form-control" id="new_serverinstance_template_serverdefault_group" name="newsettings[serverinstance_template_serverdefault_group]" value="{$instanceinfo['serverinstance_template_serverdefault_group']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_template_channeldefault_group">{$lang['tempcdefgroup']}</label>
							<input type="text" class="form-control" id="new_serverinstance_template_channeldefault_group" name="newsettings[serverinstance_template_channeldefault_group]" value="{$instanceinfo['serverinstance_template_channeldefault_group']}" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="new_serverinstance_filetransfer_port">{$lang['filetransport']}</label>
							<input type="text" class="form-control" id="new_serverinstance_filetransfer_port" name="newsettings[serverinstance_filetransfer_port]" value="{$instanceinfo['serverinstance_filetransfer_port']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_max_download_total_bandwidth">{$lang['maxdownbandwidth']}</label>
							<input type="text" class="form-control" id="new_serverinstance_max_download_total_bandwidth" name="newsettings[serverinstance_max_download_total_bandwidth]" value="{$instanceinfo['serverinstance_max_download_total_bandwidth']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_max_upload_total_bandwidth">{$lang['maxupbandwidth']}</label>
							<input type="text" class="form-control" id="new_serverinstance_max_upload_total_bandwidth" name="newsettings[serverinstance_max_upload_total_bandwidth]" value="{$instanceinfo['serverinstance_max_upload_total_bandwidth']}" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="new_serverinstance_serverquery_flood_commands">{$lang['squeryfloodcmd']}</label>
							<input type="text" class="form-control" id="new_serverinstance_serverquery_flood_commands" name="newsettings[serverinstance_serverquery_flood_commands]" value="{$instanceinfo['serverinstance_serverquery_flood_commands']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_serverquery_flood_time">{$lang['squeryfloodtime']}</label>
							<input type="text" class="form-control" id="new_serverinstance_serverquery_flood_time" name="newsettings[serverinstance_serverquery_flood_time]" value="{$instanceinfo['serverinstance_serverquery_flood_time']}" />
						</div>
						<div class="form-group">
							<label for="new_serverinstance_serverquery_ban_time">{$lang['squerybantime']}</label>
							<input type="text" class="form-control" id="new_serverinstance_serverquery_ban_time" name="newsettings[serverinstance_serverquery_ban_time]" value="{$instanceinfo['serverinstance_serverquery_ban_time']}" />
						</div>
					</div>
				</div>
				<input class="btn btn-primary btn-flat btn-block" type="submit" name="editinstance" value="{$lang['edit']}" />
			</form>
		</div>
		<div class="box box-info" data-name="instanceedit_showonweblist">
			<div class="box-header">
				<h3 class="box-title">{$lang['showonweblist']}</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<form class="box-body" id="instanceedit_showonweblist" method="post" action="index.php?site=instanceedit">
				<input type="hidden" name="editshowlist">
				<table class="table">
					<tr>
						<th class="text-center">{$lang['serverid']}</th>
						<th>{$lang['name']}</th>
						<th class="text-center">{$lang['status']}</th>
						<th width="15%" class="text-right no-padding">
							<a href="javascript::void(0)" class="btn btn-flat btn-info btn-block" onclick="check(1)">{$lang['selectall']}</a>
						</th>
					</tr>
					{if !empty($serverlist)}
						{foreach key=key item=value from=$serverlist}
							<tr>
								<td class="text-center">{$value['virtualserver_id']}</td>
								<td style="vertical-align: middle;">
									{$value['virtualserver_name']}
								</td>
								<td class="text-center no-padding" style="vertical-align: middle;">
								{if $value['virtualserver_status'] == "online"}
									<span class="btn btn-flat btn-xs btn-success disabled">{$lang['online']}</span>
								{elseif $value['virtualserver_status'] == "online virtual"}
									<span class="btn btn-flat btn-xs btn-primary disabled">{$lang['onlinevirtual']}</span>
								{elseif $value['virtualserver_status'] == "offline"}
									<span class="btn btn-flat btn-xs btn-danger disabled">{$lang['offline']}</span>
								{/if}
								</td>
								<td class="text-center no-padding" style="vertical-align: middle;">
									<input type="hidden" name="list[{$value['virtualserver_id']}][0]" value="0" {if $value['virtualserver_status'] == "offline"}disabled{/if} />
									<input type="checkbox" name="list[{$value['virtualserver_id']}][0]" value="1" {if $value['virtualserver_weblist_enabled'] == 1}checked{/if} {if $value['virtualserver_status'] == "offline"}disabled{/if} />
								</td>
							</tr>
						{/foreach}
					{/if}
				</table>
				<input type="submit" class="btn btn-block btn-flat btn-info" value="{$lang['edit']}" />
			</form>
		</div>
	</div>
	{/if}
</section>