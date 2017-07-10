{if !isset($sid)}
	{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
	<meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic" />
	{/if}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['instancetraffic']}</h3>
			</div>
			<div class="box-body">
				<table class="table" cellpadding="0" cellspacing="0">
					<tr>
						<th style="width:33%">{$lang['description']}</th>
						<th style="width:33%" class="text-center">{$lang['incoming']}</th>
						<th style="width:33%" class="text-center">{$lang['outgoing']}</th>
					</tr>
					<tr>
						<td>{$lang['packetstransfered']}</td>
						<td class="text-center">{$hostinfo['connection_packets_received_total']}</td>
						<td class="text-center">{$hostinfo['connection_packets_sent_total']}</td>
					</tr>
					<tr>
						<td>{$lang['bytestransfered']}</td>
						<td class="text-center">{$hostinfo['connection_bytes_received_total']}</td>
						<td class="text-center">{$hostinfo['connection_bytes_sent_total']}</td>
					</tr>
					<tr>
						<td>{$lang['bandwidthlastsecond']}</td>
						<td class="text-center">{$hostinfo['connection_bandwidth_received_last_second_total']} /s</td>
						<td class="text-center">{$hostinfo['connection_bandwidth_sent_last_second_total']} /s</td>
					</tr>
					<tr>
						<td>{$lang['bandwidthlastminute']}</td>
						<td class="text-center">{$hostinfo['connection_bandwidth_received_last_minute_total']} /s</td>
						<td class="text-center">{$hostinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
					</tr>
					<tr>
						<td>{$lang['filetransferbandwidth']}</td>
						<td class="text-center">{$hostinfo['connection_filetransfer_bandwidth_received']} /s</td>
						<td class="text-center">{$hostinfo['connection_filetransfer_bandwidth_sent']} /s</td>
					</tr>
					<tr>
						<td colspan="3">
						{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
							<a href="index.php?site=servertraffic&amp;refresh=off" class="btn btn-danger">{$lang['stoprefresh']}</a>
						{else}
							<a href="index.php?site=servertraffic&amp;refresh=on" class="btn btn-success">{$lang['autorefresh']}</a>
						{/if}
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
{else}
{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	</div>
</section>
{else}
{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
	<meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic&amp;sid={$sid}" />
{/if}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['virtualtraffic']}</h3>
			</div>
			<div class="box-body">
				<table class="table" cellpadding="0" cellspacing="0">
					<tr>
						<th style="width:33%">{$lang['description']}</th>
						<th style="width:33%" class="text-center">{$lang['incoming']}</th>
						<th style="width:33%" class="text-center">{$lang['outgoing']}</th>
					</tr>
					<tr>
						<td>{$lang['packetstransfered']}</td>
						<td class="text-center">{$serverinfo['connection_packets_received_total']}</td>
						<td class="text-center">{$serverinfo['connection_packets_sent_total']}</td>
					</tr>
					<tr>
						<td>{$lang['bytestransfered']}</td>
						<td class="text-center">{$serverinfo['connection_bytes_received_total']}</td>
						<td class="text-center">{$serverinfo['connection_bytes_sent_total']}</td>
					</tr>
					<tr>
						<td>{$lang['bandwidthlastsecond']}</td>
						<td class="text-center">{$serverinfo['connection_bandwidth_received_last_second_total']} /s</td>
						<td class="text-center">{$serverinfo['connection_bandwidth_sent_last_second_total']} /s</td>
					</tr>
					<tr>
						<td>{$lang['bandwidthlastminute']}</td>
						<td class="text-center">{$serverinfo['connection_bandwidth_received_last_minute_total']} /s</td>
						<td class="text-center">{$serverinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
					</tr>
					<tr>
						<td>{$lang['filetransferbandwidth']}</td>
						<td class="text-center">{$serverinfo['connection_filetransfer_bandwidth_received']} /s</td>
						<td class="text-center">{$serverinfo['connection_filetransfer_bandwidth_sent']} /s</td>
					</tr>
					<tr>
						<td colspan="3">
						{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
							<a href="index.php?site=servertraffic&amp;sid={$sid}&amp;refresh=off" class="btn btn-danger">{$lang['stoprefresh']}</a>
						{else}
							<a href="index.php?site=servertraffic&amp;sid={$sid}&amp;refresh=on" class="btn btn-success">{$lang['autorefresh']}</a>
						{/if}
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
{/if}
{/if}