<section class="content container-fluid">
	<div class="col-lg-8 col-lg-offset-2">
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
				<h3 class="box-title">Instanz Server Backups</h3>
				<div class="box-body">
					<p>{$lang['servbackdesc']}</p>
					<p>{$lang['snapwarning']}</p>
					<p>{$lang['serverbackups']}</p>
				</div>
				<table class="table table-striped" cellpadding="0" cellspacing="0">
					<tr>
						<th>{$lang['created']}</th>
			{if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
				{if !isset($smarty.post.backupdate)}
						<th colspan="2" class="text-center">{$lang['options']}</th>
				{/if}
			{else}
						<th class="text-center">{$lang['server']}</th>
						<th class="text-center">{$lang['options']}</th>
			{/if}
					</tr>
				{if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
					{if !isset($smarty.post.backupdate)}
						{foreach key=key item=value from=$folder[2]}
					<tr>
						<td class="text-center">{$value}</td>
						<td colspan="2" class="text-center">
						<form method="post" action="index.php?site=iserverbackup">
							<input type="hidden" name="backupdate" value="{$value}" />
							<input type="submit" class="btn btn-flat btn-success" name="chose" value="Ausw&auml;hlen" />
						</form>
						</td>
					</tr>
					{/foreach}
				{else}
					{if	isset($files[0])}
						{foreach key=key item=value from=$files[0]}
					<tr>
						<td class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td class="text-center">{$value['server']}</td>
						<td class="text-center">
						<form method="post" class="no-margin no-padding col-md-9" action="index.php?site=iserverbackup">
							<div class="no-margin no-padding col-md-8">
								<select name="deployon" class="form-control">
									<option value="" disabled selected>-</option>
									{if !empty($serverlist)}
										{foreach key=key2 item=value2 from=$serverlist}
											<option value="{$value2['virtualserver_port']}">{$value2['virtualserver_name']}:{$value2['virtualserver_port']}</option>
										{/foreach}
									{/if}
								</select>
							</div>
							<div class="no-margin no-padding col-md-4">
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
								<input class="btn btn-flat btn-block btn-success" type="submit" name="deploy" value="{$lang['deploy']}" />
							</div>
						</form>
						<form method="post" class="no-margin no-padding col-md-3" action="index.php?site=iserverbackup">
							<input type="hidden" name="backupid" value="{$value['timestamp']}" />
							<input type="hidden" name="fileport" value="{$value['server']}" />
							<input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
							<input class="btn btn-flat btn-block btn-danger" type="submit" name="delete" value="{$lang['delete']}" />
						</form>
						</td>
					</tr>
						{/foreach}	
					{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
					{/if}
				{/if}
			{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
			{/if}
				</table>
			</div>
		</div>
		<br />
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['host']} {$lang['serverbackups']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped" cellpadding="0" cellspacing="0">
					<tr>
						<th class="text-center">{$lang['created']}</th>
			{if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
				{if !isset($smarty.post.backupdate)}
						<th colspan="2" class="text-center">{$lang['options']}</th>
				{/if}
			{else}
						<th class="text-center">{$lang['server']}</th>
						<th class="text-center">{$lang['options']}</th>
			{/if}
					</tr>
			{if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
				{if !isset($smarty.post.backupdate)}
					{foreach key=key item=value from=$folder.1}
						<tr>
							<td class="text-center">{$value}</td>
							<td colspan="2" class="text-center">
							<form method="post" action="index.php?site=iserverbackup">
								<input type="hidden" name="backupdate" value="{$value}" />
								<input class="btn btn-flat btn-success" type="submit" name="chose" value="Ausw&auml;hlen" />
							</form>
							</td>
						</tr>
					{/foreach}
				{else}
					{if	isset($files[1])}
						{foreach key=key item=value from=$files[1]}
					<tr>
						<td class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td class="text-center">{$value['server']}</td>
						<td class="no-padding">
							<form method="post" class="no-margin no-padding col-md-9" action="index.php?site=iserverbackup">
								<div class="no-margin no-padding col-md-8">
									<select name="deployon" class="form-control">
										<option value="" disabled selected>-</option>
								{if !empty($serverlist)}
									{foreach key=key2 item=value2 from=$serverlist}
										<option value="{$value2['virtualserver_port']}">{$value2['virtualserver_name']}:{$value2['virtualserver_port']}</option>
									{/foreach}
								{/if}
									</select>
								</div>
								<div class="no-margin no-padding col-md-4">
									<input type="hidden" name="hostbackup" value="1" />
									<input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
									<input type="hidden" name="backupid" value="{$value['timestamp']}" />
									<input type="hidden" name="fileport" value="{$value['server']}" />
									<input class="btn btn-flat btn-block btn-success pull-right" type="submit" name="deploy" value="{$lang['deploy']}" />
								</div>
							</form>
							<form method="post" class="no-margin no-padding col-md-3" action="index.php?site=iserverbackup">
								<input type="hidden" name="hostbackup" value="1" />
								<input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
								<input type="hidden" name="backupid" value="{$value['timestamp']}" />
								<input type="hidden" name="fileport" value="{$value['server']}" />
								<input class="btn btn-flat btn-block btn-danger" type="submit" name="delete" value="{$lang['delete']}" />
							</form>
						</td>
					</tr>
						{/foreach}
					{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
					{/if}
				{/if}
			{else}
					<tr>
						<td colspan="3" class="text-center">No Backups found!</td>
					</tr>
			{/if}
				</table>
			</div>
		</div>
		<br />
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">{$lang['createserverbackup']}</h3>
				<div class="box-body clearfix">
					<form method="post" class="pull-left" action="index.php?site=iserverbackup">
						<input class="btn btn-flat btn-primary" type="submit" name="create" value="{$lang['create']}" />
					</form>
					<form method="post" class="pull-left" action="index.php?site=iserverbackup">
						<input type="hidden" name="hostbackup" value="1" />
						<input class="btn btn-flat btn-info" type="submit" name="create" value="{$lang['host']} {$lang['create']}" />
					</form>
				</div>
			</div>
		</div>
	{/if}
	</div>
</section>