{if isset($permoverview['b_virtualserver_channelgroup_list']) AND empty($permoverview['b_virtualserver_channelgroup_list'])}
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
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['channelgroups']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th class="text-center">{$lang['id']}</th>
						<th>{$lang['name']}</th>
						<th class="text-center">{$lang['type']}</th>
						<th class="text-center">{$lang['iconid']}</th>
						<th class="text-center">{$lang['savedb']}</th>
						<th></th>
					</tr>
			{if !empty($channelgroups)}
				{foreach key=key item=value from=$channelgroups}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['cgid']}</td>
						<td style="vertical-align: middle;" class="no-padding">
							<form method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}">
								<div class="col-md-8 no-padding">
									<input type="text" name="name" value="{$value['name']}" class="form-control" />
								</div>
								<div class="col-md-4 no-padding">
									<input class="btn btn-primary btn-flat btn-block" type="submit" name="sendname" value="{$lang['rename']}" />
								</div>
							</form>
						</td>
						<td style="vertical-align: middle;" class="text-center">{$value['type']}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['iconid']}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['savedb']}</td>
						<td style="vertical-align: middle;" class="text-right no-padding">
						{if $value['type'] != '0'}
							<a class="btn btn-sm btn-info btn-flat no-margin" href="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$value['cgid']}">{$lang['clients']}</a>
						{/if}
							<a class="btn btn-sm btn-warning btn-flat no-margin" href="index.php?site=cgroupeditperm&amp;sid={$sid}&amp;cgid={$value['cgid']}">{$lang['editperms']}</a>
						{if !isset($permoverview['b_virtualserver_channelgroup_delete']) or $permoverview['b_virtualserver_channelgroup_delete']==1}
							<form style="display: inline;" method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}">
								<input type="submit" class="btn btn-sm btn-danger btn-flat" name="delgroup" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannelgroup']}')" />
							</form>
						{/if}
						</td>
					</tr>
				{/foreach}
			{/if}
				</table>
			</div>
		</div>
	</div>
</section>
{/if}