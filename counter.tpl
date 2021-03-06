{if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
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
<section class="content container-fluid">
	<div class="col-lg-6 col-lg-offset-3">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['clientcounter']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped" cellpadding="1" cellspacing="0">
					<tr>
						<th style="width:50%">{$lang['total']}</th>
						<td style="width:50%">{$totalclients} {$lang['clients']}</td>
					</tr>
					<tr>
						<th>{$lang['online']}</th>
						<td>
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-aqua" style="width: {$perc_online}%" role="progressbar" aria-valuenow="{$perc_online}" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">{$perc_online}%</span>
								</div>
							</div>
							{$count_online} {$lang['clients']} | {$perc_online}%
						</td>
					</tr>
					<tr>
						<th>{$lang['today']}</th>
						<td>
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-aqua" style="width: {$perc_today}%" role="progressbar" aria-valuenow="{$perc_today}" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">{$perc_today}%</span>
								</div>
							</div>
							{$count_today} {$lang['clients']} | {$perc_today}%
						</td>
					</tr>
					<tr>
						<th>{$lang['thisweek']}</th>
						<td>
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-aqua" style="width: {$perc_week}%" role="progressbar" aria-valuenow="{$perc_week}" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">{$perc_week}%</span>
								</div>
							</div>
							{$count_week} {$lang['clients']} | {$perc_week}%
						</td>
					</tr>
					<tr>
						<th>{$lang['thismonth']}</th>
						<td>
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-aqua" style="width: {$perc_month}%" role="progressbar" aria-valuenow="{$perc_month}" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">{$perc_month}%</span>
								</div>
							</div>
							{$count_month} {$lang['clients']} | {$perc_month}%
						</td>
					</tr>
				</table>
			</div>
		</div>
	{/if}
	</div>
</section>