{if isset($permoverview['b_virtualserver_servergroup_list']) AND empty($permoverview['b_virtualserver_servergroup_list'])}
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
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}

		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['servergroups']}</h3>
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
			{if !empty($servergroups)}
				{foreach key=key item=value from=$servergroups}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['sgid']}</td>
						<td style="vertical-align: middle;" class="no-padding">
							<form method="post" action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}">
								<div class="col-md-8 no-padding">
									<input type="text" class="form-control" name="name" value="{$value['name']}" />
								</div>
								<div class="col-md-4 no-padding">
									<input class="btn btn-flat btn-primary btn-block" type="submit" name="sendname" value="{$lang['rename']}" />
								</div>
							</form>
						</td>
						<td style="vertical-align: middle;" class="text-center">{$value['type']}</td>
						<td style="vertical-align: middle;" class="text-center">{sprintf('%u', $value['iconid'] & 0xffffffff)}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['savedb']}</td>
						<td style="vertical-align: middle;" class="text-right no-padding">
						{if $value['type'] != '0'}
							<a href="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$value['sgid']}" class="btn btn-sm btn-flat btn-info no-margin">{$lang['clients']}</a>
						{/if}
							<a href="index.php?site=sgroupeditperm&amp;sid={$sid}&amp;sgid={$value['sgid']}" class="btn btn-sm btn-flat btn-warning no-margin">{$lang['editperms']}</a>
						{if !isset($permoverview['b_virtualserver_servergroup_delete']) or $permoverview['b_virtualserver_servergroup_delete'] == 1}
							<form style="display: inline;" method="post" action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}">
								<input type="submit" class="btn btn-sm btn-flat btn-danger" name="delgroup" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgservergroup']}')" />
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