<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
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
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<form enctype="multipart/form-data" action="index.php?site=fileupload&amp;sid={$sid}" method="post">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">{$lang['iconupload']}</h3>
					</div>
					<div class="box-body">	
						<p>{$lang['iconupinfo']}</p>
						<div class="form-group">
							<input type="hidden" name="max_file_size" value="81920" />
							<input name="thefile" type="file" class="" />						
						</div>
						<div class="form-group no-margin">
							<input type="submit" class="btn btn-flat btn-block btn-primary" name="upload" value="{$lang['iconupload']}" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
			<div class="box box-info">
				<div class="box-body">
					<form method="post" action="index.php?site=fileupload&amp;sid={$sid}">
						<div class="table-responsive">
							<table class="table table-striped table-vert-mid">
								<tr>
									<th width="5%"></th>
									<th>{$lang['name']}</th>
									<th class="text-center">{$lang['id']}</th>
									<th class="text-center">Ma&szlig;e</th>
									<th class="text-center">Type</th>
									<th width="25%" class="text-center">
										<div class="checkbox-inline">
											<label>
												<input type="checkbox" name="checkall" value="0" onclick="check(2)" />
												<b>{$lang['delete']} {$lang['selectall']}</b>
											</label>
										</div>
									</th>
								</tr>
								{foreach key=key item=value from=$allicons}
								<tr>
									<td class="no-padding text-center"><img width="16" height="16" src="site/showfile.php?name=icon_{$value.name}&amp;port={$port}" alt="{$key}" /></td>
									<td>{$key}</td>
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
									<td colspan="5"></td>
									<td>
										<input type="submit" name="delaction" class="btn btn-danger btn-flat btn-block" value="{$lang['delete']}" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>