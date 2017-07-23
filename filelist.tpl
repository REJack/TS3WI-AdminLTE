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
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{if !empty($smarty.get.cid)}{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']}){else}{$lang['filelist']}{/if}</h3>
			</div>
			<div class="box-body">
				<table class="table">
						<tr>
							<th style="width:25%">{$lang['name']}</th>
							<th style="width:10%">{$lang['size']}</th>
							<th style="width:25%">{$lang['date']}</th>
							<th style="width:25%">{$lang['channel']}</th>
							<th style="width:10%">{$lang['delete']}</th>
						</tr>
					{if $smarty.get.path != "/" AND !empty($smarty.get.path)}
						<tr>
							<td colspan="5"><a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$cid}&amp;path={$newpath}">..</a></td>
						</tr>
					{/if}
				{if !empty($getallfiles)}
					{foreach key=key item=value from=$getallfiles}	
						{if $key !== 'totalsize'}
						<tr>
							<td>
								{if $value['type'] == 0}
									<img src='gfx/images/folder.png' alt="" /><a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>
								{else}
									<img src='gfx/images/file.png' alt="" /> <a href="site/filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>
								{/if}
							</td>
							<td>{$value['size']} Mb</td>
							<td>{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							<td>{$value['cname']}</td>
							<td><a href="index.php?site=filelist&amp;sid={$sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if empty($smarty.get.path)}/{else}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;deletefile=1">{$lang['delete']}</a></td>
						</tr>
						{elseif $key === 'totalsize'}
						<tr>
							<td>{$lang['totalsize']}</td>
							<td colspan="4">{$value} Mb</td>
						</tr>
						{/if}
					{/foreach}
				{else}
					<tr>
						<td colspan="5">
							Keine Dateien gefunden!
						</td>
					</tr>
				{/if}
				</table>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-md-offset-0 col-lg-5 col-lg-offset-1">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['upload']}</h3>
			</div>
			<div class="box-body">
				<form enctype="multipart/form-data" method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
					<table class="table">
					{if empty($smarty.get.cid)}
						<tr>
							<td><label for="newfile_cid">{$lang['channel']}</label></td>
							<td>
								<select id="newfile_cid" class="form-control" name="cid">
								{foreach key=key item=value from=$channellist}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
					{/if}
						<tr>
							<td><label for="newfile_file">{$lang['upload']}:</label></td>
							<td>
								<input type="hidden" name="max_file_size" value="8388603" />
								<input name="thefile" id="newfile_file" type="file" />
							</td>
						</tr>
					</table>
					<input type="submit" class="btn btn-primary btn-flat btn-block" name="upload" value="{$lang['upload']}" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-5">
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['createfolder']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
					<table class="table table-striped">
					{if empty($smarty.get.cid)}
						<tr>
							<td><label for="newfolder_cid">{$lang['channel']}</label></td>
							<td>
								<select id="newfolder_cid" class="form-control" name="cid">
								{foreach key=key item=value from=$channellist}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
					{/if}
						<tr>
							<td><label for="newfolder_name">{$lang['name']}:</label></td>
							<td colspan="2"><input id="newfolder_name" class="form-control" type="text" name="fname" /></td>
						</tr>
					</table>
					<input type="submit" class="btn btn-flat btn-block bg-teal" name="createdir" value="{$lang['createfolder']}" />
				</form>
			</div>
		</div>
	</div>
</section>

