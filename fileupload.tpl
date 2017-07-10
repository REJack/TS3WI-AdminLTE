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
	</div>
	<div class="col-lg-4 col-lg-offset-4">
		<form enctype="multipart/form-data" action="index.php?site=fileupload&amp;sid={$sid}" method="post">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">{$lang['iconupload']}</h3>
				</div>
				<div class="box-body">	
					<p >{$lang['iconupinfo']}</p>
					<table class="table" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2">
								<input type="hidden" name="max_file_size" value="81920" />
								<input name="thefile" type="file" class="" />
							</td>
						</tr>
					</table>
				</div>
				<div class="box-footer">
					<input type="submit" class="btn btn-flat btn-block btn-primary" name="upload" value="{$lang['iconupload']}" />
				</div>
			</div>
		</form>		
	</div>
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-info">
			<div class="box-body">
				<form method="post" action="index.php?site=fileupload&amp;sid={$sid}">
					<table class="table table-striped" cellpadding="0" cellspacing="0">
						<tr>
							<th class="text-center">{$lang['icon']}</th>
							<th class="text-center">{$lang['name']}</th>
							<th class="text-center">{$lang['id']}</th>
							<th class="text-center">Ma&szlig;e</th>
							<th class="text-center">Type</th>
							<th width="30%" class="text-center">
								<div class="checkbox-inline">
									<input type="checkbox" name="checkall" value="0" onclick="check(2)" />
									<b>{$lang['delete']} {$lang['selectall']}</b>
								</div>
							</th>
						</tr>
						{foreach key=key item=value from=$allicons}
						<tr>
							<td class="text-center"><img style="border:0" src="site/showfile.php?name=icon_{$value.name}&amp;port={$port}" alt="" /></td>
							<td class="text-center">{$key}</td>
							<td class="text-center">{$value.id}</td>
							<td class="text-center">{$value.info.0}*{$value.info.1}</td>
							<td class="text-center">
							{if $value.info.2 == 1}
								.gif
							{elseif $value.info.2 == 2}
								.jpg
							{elseif $value.info.2 == 3}
								.png
							{/if}
							</td>
							<td class="text-center">
								<input type="checkbox" id="list{$value['virtualserver_id']}" name="delicons[]" value="/{$key}" />
							</td>
						</tr>
						{/foreach}
						<tr>
							<td colspan="6"><input type="submit" name="delaction" class="btn btn-danger btn-flat pull-right" value="{$lang['delete']}" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>