<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
		<div class="box box-warning">
			<div class="box-body">
				<p>{$lang['chanbackdesc']}</p>
			</div>	
		</div>
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['chanbackups']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th width="30%" class="text-center">{$lang['created']}</th>
						<th width="30%" class="text-center">{$lang['server']}</th>
						<th></th>
					</tr>
					{if isset($files[0]) AND !empty($files[0])}
						{foreach key=key item=value from=$files[0]}
							{if $serverhost === true AND $hoststatus === false AND $value['server'] == $getserverip OR $serverhost === false OR $hoststatus === true}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['server']}</td>
						<td style="vertical-align: middle;" class="text-center no-padding">
							<a href="#" class="btn btn-info btn-sm btn-flat" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}');">{$lang['view']}</a>
							<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input class="btn btn-flat btn-sm btn-success" type="submit" name="deploy" value="{$lang['deploy']}" />
							</form>
							<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input class="btn btn-flat btn-sm btn-danger" type="submit" name="delete" value="{$lang['delete']}" />
							</form>
						</td>
					</tr>
							{/if}
						{/foreach}
					{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
					{/if}
				</table>
			</div>
		</div>
{if $serverhost == true AND $hoststatus == true OR $serverhost == false}
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['host']} {$lang['chanbackups']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th width="30%" class="text-center">{$lang['created']}</th>
						<th width="30%" class="text-center">{$lang['server']}</th>
						<th></th>
					</tr>
					{if isset($files[1]) AND !empty($files[1])}
						{foreach key=key item=value from=$files[1]}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['server']}</td>
						<td style="vertical-align: middle;" class="text-center no-padding">
							<a href="#" class="btn btn-flat btn-sm btn-info" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}&amp;hostbackup=1');">{$lang['view']}</a>
							<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
								<input type="hidden" name="hostbackup" value="1" />
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input class="btn btn-flat btn-sm btn-success" type="submit" name="deploy" value="{$lang['deploy']}" />
							</form>
							<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
								<input type="hidden" name="hostbackup" value="1" />
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input class="btn btn-flat btn-sm btn-danger" type="submit" name="delete" value="{$lang['delete']}" />
							</form>
						</td>
					</tr>
						{/foreach}
					{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
					{/if}
				</table>
			</div>
		</div>
{/if}
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">{$lang['createchanbackup']}</h3>
			</div>
			<div class="box-body">
				<br />
				<div class="row">
					<div class="col-md-6">
						<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
							<input class="btn btn-flat btn-block btn-primary" type="submit" name="create" value="{$lang['create']}" />
						</form>
					</div>
					<div class="col-md-6">
					{if $serverhost == true AND $hoststatus == true OR $serverhost == false}
						<form style="display: inline;" method="post" action="index.php?site=backup&amp;sid={$sid}">
							<input type="hidden" name="hostbackup" value="1" />
							<input class="btn btn-flat btn-block btn-info" type="submit" name="create" value="{$lang['host']} {$lang['create']}" />
						</form>
					{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>