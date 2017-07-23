{if isset($permoverview['b_virtualserver_channel_list']) AND empty($permoverview['b_virtualserver_channel_list'])}
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
	{if $newserverversion !== true AND !empty($serverinfo['virtualserver_version'])}
		<div class="alert alert-warning">{$lang['serverupdateav']}{$newserverversion}</div>
	{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['channel']}</h3>
			</div>
			<div class="box-body">
				<table class="table">
					<tr> 
						<th class="text-center" width="10%">{$lang['id']}</th>
						<th class="text-center" width="10%">{$lang['pid']}</th>
						<th>{$lang['name']}</th>
						<th width="30%"></th>
					</tr>
				{if !empty($channellist)}
					{foreach key=key item=value from=$channellist}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['cid']}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['pid']}</td>
						<td style="vertical-align: middle;">{$value['channel_name']}</td>
						<td style="vertical-align: middle;" class="no-padding text-right">
							<a class="btn btn-info btn-flat btn-sm no-margin" href="index.php?site=channeleditperm&amp;sid={$sid}&amp;cid={$value['cid']}">{$lang['editperms']}</a>
							<a class="btn btn-warning btn-flat btn-sm no-margin" href="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$value['cid']}">{$lang['channeledit']}</a>
							<a class="btn btn-success btn-flat btn-sm no-margin" href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$value['cid']}">{$lang['channelview']}</a>
							<form method="post" style="display: inline;" action="index.php?site=channel&amp;sid={$sid}">
								<input type="hidden" name="cid" value="{$value['cid']}" />
							{if $value['total_clients'] > 0}
								<input type="hidden" name="force" value="1" />
							{/if}
						{if !isset($permoverview['b_channel_delete_permanent']) AND $value['channel_flag_permanent'] == 1 OR $permoverview['b_channel_delete_permanent'] == 1 AND $value['channel_flag_permanent'] == 1}
							{if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
								<input type="submit" class="btn btn-sm btn-danger btn-flat no-margin" name="delete" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" />
							{/if}
						{/if}
						{if !isset($permoverview['b_channel_delete_semi_permanent']) AND $value['channel_flag_semi_permanent'] == 1 OR $permoverview['b_channel_delete_semi_permanent'] == 1 AND $value['channel_flag_semi_permanent'] == 1}
							{if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
								<input type="submit" class="btn btn-sm btn-danger btn-flat no-margin" name="delete" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" />
							{/if}
						{/if}
						{if !isset($permoverview['b_channel_delete_temporary']) AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0 OR $permoverview['b_channel_delete_temporary'] == 1 AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0}
							{if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
								<input type="submit" class="btn btn-sm btn-danger btn-flat no-margin" name="delete" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" />
							{/if}
						{/if}
							</form>
						</td>
					</tr>
					{/foreach}
				{/if}
				</table>
			</div>
		</div>
	{/if}
	</div>
</section>