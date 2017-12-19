{if !isset($sid)}
	{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
	<meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic" />
	{/if}
<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">{$lang['instancetraffic']}</h3>
					<div class="box-tools-extra pull-right">{$sid}
						{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
							<a href="index.php?site=servertraffic&amp;refresh=off" class="btn btn-flat btn-sm btn-danger">{$lang['stoprefresh']}</a>
						{else}
							<a href="index.php?site=servertraffic&amp;refresh=on" class="btn btn-flat btn-sm btn-success">{$lang['autorefresh']}</a>
						{/if}
					</div>
				</div>
				<div class="box-body">
					<table class="table table-striped table-vert-mid">
						<tr>
							<th></th>
							<th style="width:35%" class="text-center">{$lang['incoming']}</th>
							<th style="width:35%" class="text-center">{$lang['outgoing']}</th>
						</tr>
						<tr>
							<th>{$lang['packetstransfered']}</th>
							<td class="text-center">{$hostinfo['connection_packets_received_total']}</td>
							<td class="text-center">{$hostinfo['connection_packets_sent_total']}</td>
						</tr>
						<tr>
							<th>{$lang['bytestransfered']}</th>
							<td class="text-center">{$hostinfo['connection_bytes_received_total']}</td>
							<td class="text-center">{$hostinfo['connection_bytes_sent_total']}</td>
						</tr>
						<tr>
							<th>{$lang['bandwidthlastsecond']}</th>
							<td class="text-center">{$hostinfo['connection_bandwidth_received_last_second_total']}/s</td>
							<td class="text-center">{$hostinfo['connection_bandwidth_sent_last_second_total']}/s</td>
						</tr>
						<tr>
							<th>{$lang['bandwidthlastminute']}</th>
							<td class="text-center">{$hostinfo['connection_bandwidth_received_last_minute_total']}/s</td>
							<td class="text-center">{$hostinfo['connection_bandwidth_sent_last_minute_total']}/s</td>
						</tr>
						<tr>
							<th>{$lang['filetransferbandwidth']}</th>
							<td class="text-center">{$hostinfo['connection_filetransfer_bandwidth_received']}/s</td>
							<td class="text-center">{$hostinfo['connection_filetransfer_bandwidth_sent']}/s</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
{else}
{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<div class="box box-danger">
				<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
				<div class="box-body">
					<p class="lead">{$lang['nopermissions']}</p>
				</div>
			</div>
		</div>
	</div>
</section>
{else}
{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
	<meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic&amp;sid={$sid}" />
{/if}
<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">{$lang['virtualtraffic']}</h3>
					<div class="box-tools-extra pull-right">
						{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
							<a href="index.php?site=servertraffic&amp;refresh=off&amp;sid={$sid}" class="btn btn-flat btn-sm btn-danger">{$lang['stoprefresh']}</a>
						{else}
							<a href="index.php?site=servertraffic&amp;refresh=on&amp;sid={$sid}" class="btn btn-flat btn-sm btn-success">{$lang['autorefresh']}</a>
						{/if}
					</div>
				</div>
				<div class="box-body">
					<table class="table table-striped table-vert-mid">
						<tr>
							<th></th>
							<th style="width:35%" class="text-center">{$lang['incoming']}</th>
							<th style="width:35%" class="text-center">{$lang['outgoing']}</th>
						</tr>
						<tr>
							<th>{$lang['packetstransfered']}</th>
							<td class="text-center">{$serverinfo['connection_packets_received_total']}</td>
							<td class="text-center">{$serverinfo['connection_packets_sent_total']}</td>
						</tr>
						<tr>
							<th>{$lang['bytestransfered']}</th>
							<td class="text-center">{$serverinfo['connection_bytes_received_total']}</td>
							<td class="text-center">{$serverinfo['connection_bytes_sent_total']}</td>
						</tr>
						<tr>
							<th>{$lang['bandwidthlastsecond']}</th>
							<td class="text-center">{$serverinfo['connection_bandwidth_received_last_second_total']}/s</td>
							<td class="text-center">{$serverinfo['connection_bandwidth_sent_last_second_total']}/s</td>
						</tr>
						<tr>
							<th>{$lang['bandwidthlastminute']}</th>
							<td class="text-center">{$serverinfo['connection_bandwidth_received_last_minute_total']}/s</td>
							<td class="text-center">{$serverinfo['connection_bandwidth_sent_last_minute_total']}/s</td>
						</tr>
						<tr>
							<th>{$lang['filetransferbandwidth']}</th>
							<td class="text-center">{$serverinfo['connection_filetransfer_bandwidth_received']}/s</td>
							<td class="text-center">{$serverinfo['connection_filetransfer_bandwidth_sent']}/s</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
{/if}
{/if}