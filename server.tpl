<script type="text/javascript">
	$(function () {
		var table = $("#server").DataTable({
			"language": {
				"url": dataTableLang
			},
            "autoWidth": false,
			"order": [[ 0, "asc"]],
			"columnDefs": [
				{ targets: 'no-sort', orderable: false },
				{ targets: 'no-search', searchable: false }
			],
			"processing": true,
			initComplete: function() {
				var api = this.api();
				$('#server_processing').css('top', '7%');
				$('.pagination').addClass('pagination-flat');
			}
		});
		$('form').on('submit', function(e){
			$('input:disabled').prop('disabled', false);
		});
		$('#server_saction input[type="checkbox"]').on('change', function(){
			$.post({
				url: $('#server_saction').attr('action'),
				data: $('#server_saction').serialize(),
			})
		});
	});
</script>
<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		{if $hoststatus === false AND $serverhost === true}
		<div class="alert alert-warning">{$lang['nohoster']}</div>
		{else}
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
		<div class="box box-border-teal" data-name="server_msgtoall">
			<div class="box-header">
				<h3 class="box-title">{$lang['msgtoall']}</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
				</div>
			</div>
			<form class="box-body" method="post" action="index.php?site=server">
				<div class="form-group">
					<textarea type="text" class="form-control resize-vert" name="msgtoall" id="msgtoall"></textarea>
				</div>
				<input class="btn btn-flat bg-teal pull-right" type="submit" name="sendmsg" value="{$lang['send']}" />
			</form>
		</div>
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['server']}</h3>
			</div>
			<form class="box-body" method="post" id="server_saction" action="index.php?site=server">
				<input type="hidden" name="massaction" />
				{if !empty($serverlist)}<p>{$serverstats}</p>{/if}
				<table id="server" class="table table-striped table-td-no-padding">
					<thead>
						<tr>
							<th class="text-center">{$lang['id']} </th>
							<th>{$lang['name']}</th>
							<th class="text-center">{$lang['port']} </th>
							<th class="text-center">{$lang['status']} </th>
							<th class="text-center">{$lang['runtime']} </th>
							<th class="no-search text-center">{$lang['clients']} </th>
							<th class="no-search text-center">{$lang['autostart']}</th>
							<th class="no-sort"></th>
						</tr>
					</thead>
					<thead>
						{if !empty($serverlist)}
						<tr>
							<td colspan="7"></td>
							<td class="no-padding">
								<input class="btn btn-flat btn-sm btn-primary btn-block" type="submit" value="{$lang['action']}" onclick="return confirm(confirm_action())" />
							</td>
						</tr>
						{/if}
					</thead>
					<tbody>

						{if !empty($serverlist)}
					{foreach key=key item=value from=$serverlist}
						<tr>
							<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_id']}</td>
							<td style="vertical-align: middle;">
								<a href="index.php?site=serverview&amp;sid={$value['virtualserver_id']}">{$value['virtualserver_name']}</a>
							</td>
							<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_port']}</td>
							<td style="vertical-align: middle;" class="text-center">
							{if $value['virtualserver_status'] == "online"}
								<span class="btn btn-flat btn-xs btn-success disabled">{$lang['online']}</span>
							{elseif $value['virtualserver_status'] == "online virtual"}
								<span class="btn btn-flat btn-xs btn-primary disabled">{$lang['onlinevirtual']}</span>
							{elseif $value['virtualserver_status'] == "offline"}
								<span class="btn btn-flat btn-xs btn-danger disabled">{$lang['offline']}</span>
							{/if}
							</td>
							<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_uptime']}</td>
							<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_clientsonline']} / {$value['virtualserver_maxclients']}</td>
							<td style="vertical-align: middle;" class="text-center"><input type="checkbox" name="caction[{$value['virtualserver_id']}][auto]" value="1" {if $value['virtualserver_autostart'] == 1}checked{/if} {if $value['virtualserver_status'] == "offline"}disabled{/if}/></td>
							<td style="vertical-align: middle;" class="text-right no-padding">
								<select class="form-control" id="caction{$value['virtualserver_id']}" name="caction[{$value['virtualserver_id']}][action]" onchange="confirm_array('{$value['virtualserver_id']}', '{$value['virtualserver_name']|addslashes}', '{$value['virtualserver_port']}', '');" style="width: 100%;">
									<option value="false">{$lang['select']}</option>
									<option value="start">{$lang['start']}</option>
									<option value="stop">{$lang['stop']}</option>
									<option value="del">{$lang['delete']}</option>
								</select>
							</td>
						</tr>
					{/foreach}
						{else}
						<tr><td colspan='8'><p class="lead text-center no-margin">{$lang['noserver']}</p></td></tr>
						{/if}
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7"></td>
							<td class="no-padding">
								<input class="btn btn-flat btn-sm btn-primary btn-block" type="submit" value="{$lang['action']}" onclick="return confirm(confirm_action())" />
							</td>
						</tr>						
					</tfoot>
				</table>
			</form>
		</div>
		{/if}
	</div>
</section>