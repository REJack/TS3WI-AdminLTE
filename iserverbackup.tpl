<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
	{if $hoststatus === false AND $serverhost === true}
		<div class="alert alert-warning">{$lang['nohoster']}</div>
	{else}
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
		<div class="box box-warning">
			<div class="box-body">
				<p>{$lang['snapwarning']}</p>
				<p>{$lang['serverbackups']}</p>
				<p>{$lang['servbackdesc']}</p>
			</div>	
		</div>
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['instancebackup']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th class="text-center">{$lang['created']}</th>
					{if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
						{if isset($smarty.post.backupdate)}
						<th class="text-center">{$lang['server']}</th>
						{/if}
						<th></th>
					{else}
						<th></th>
					{/if}
					</tr>
					{if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
						{if !isset($smarty.post.backupdate)}
							{foreach key=key item=value from=$folder[2]}
					<tr>
						<td style="vertical-align: middle; width: 50%" class="text-center">{$value}</td>
						<td style="vertical-align: middle;" colspan="2" class="no-padding text-center">
							<form method="post" action="index.php?site=iserverbackup">
								<input type="hidden" name="backupdate" value="{$value}" />
								<input class="btn btn-flat btn-sm btn-success" type="submit" name="chose" value="Ausw&auml;hlen" />
							</form>
						</td>
					</tr>
						{/foreach}
					{else}
						{if	isset($files[0])}
							{foreach key=key item=value from=$files[0]}
					<tr>
						<td style="vertical-align: middle; width: 30%;" class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td style="vertical-align: middle; width: 20%;" class="text-center">{$value['server']}</td>
						<td style="vertical-align: middle;" class="no-padding">
							<form method="post" class="no-margin no-padding col-md-9" action="index.php?site=iserverbackup">
								<div class="no-margin no-padding col-md-8">
									<select name="deployon" class="form-control">
										<option disabled selected>-</option>
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
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['host']} {$lang['serverbackups']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th class="text-center">{$lang['created']}</th>
						{if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
							{if isset($smarty.post.backupdate)}
						<th class="text-center">{$lang['server']}</th>
							{/if}
						<th></th>
						{else}
						<th></th>
						{/if}
					</tr>
					{if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
						{if !isset($smarty.post.backupdate)}
							{foreach key=key item=value from=$folder.1}
					<tr>
						<td style="vertical-align: middle; width: 50%;" class="text-center">{$value}</td>
						<td style="vertical-align: middle;" colspan="2" class="no-padding text-center">
							<form method="post" action="index.php?site=iserverbackup">
								<input type="hidden" name="backupdate" value="{$value}" />
								<input class="btn btn-flat btn-sm btn-success" type="submit" name="chose" value="Ausw&auml;hlen" />
							</form>
						</td>
					</tr>
						{/foreach}
					{else}
						{if	isset($files[1])}
							{foreach key=key item=value from=$files[1]}
					<tr>
						<td style="vertical-align: middle; width: 30%;" class="text-center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td style="vertical-align: middle; width: 20%;" class="text-center">{$value['server']}</td>
						<td style="vertical-align: middle;" class="no-padding">
							<form method="post" class="no-margin no-padding col-md-9" action="index.php?site=iserverbackup">
								<div class="no-margin no-padding col-md-8">
									<select name="deployon" class="form-control">
										<option disabled selected>-</option>
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
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">{$lang['createserverbackup']}</h3>
			</div>
			<div class="box-body">
				<br />
				<div class="row">
					<div class="col-md-6">
						<form method="post" action="index.php?site=iserverbackup">
							<input class="btn btn-flat btn-primary btn-block" type="submit" name="create" value="{$lang['create']}" />
						</form>
					</div>
					{if $hoststatus==true}
					<div class="col-md-6">
						<form method="post" action="index.php?site=iserverbackup">
							<input type="hidden" name="hostbackup" value="1" />
							<input class="btn btn-flat btn-info btn-block" type="submit" name="create" value="{$lang['host']} {$lang['create']}" />
						</form>
					</div>
					{/if}
				</div>
			</div>
		</div>
	{/if}
	</div>
</section>