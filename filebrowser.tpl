{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if !empty($noerror)}
	<div class="alert alert-info">{$noerror}</div>
{/if}
	<table class="border" style="width:100%">
		<tr>
			<td colspan="4" class="thead">{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']})</td>
		</tr>
		<tr>
			<td style="width:25%" class="thead">{$lang['name']}</td>
			<td style="width:10%" class="thead">{$lang['size']}</td>
			<td style="width:25%" class="thead">{$lang['date']}</td>
			<td style="width:10%" class="thead">{$lang['delete']}</td>
		</tr>
	{if !empty($flist)}
		{if $smarty.get.path != "/" AND !empty($smarty.get.path)}

			<tr>
				<td class="green1" colspan="4"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}">..</a></td>
			</tr>
		{/if}
		{foreach key=key item=value from=$flist}
			<tr>
				<td class="green1">{if $value['type'] == 0} <img src='../gfx/images/folder.png' alt="" /> <a href="filebrowser.php?&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>{else}<img src='../gfx/images/file.png' alt="" /> <a href="filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>{/if}</td>
				<td class="green1">{$value['size']} Mb</td>
				<td class="green1">{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
				<td class="green1"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={$smarty.get.path}&amp;name={$value['name']}&amp;deletefile=1">{$lang['delete']}</a></td>
			</tr>	
		{/foreach}
	{else}
		{if $smarty.get.path != "/" AND !empty($smarty.get.path)}
			<tr>
				<td class="green1" colspan="4"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}">..</a></td>
			</tr>
		{/if}
		<tr>
			<td colspan="4">
			Keine Dateien gefunden!
			</td>
		</tr>
	{/if}
	</table>
	<br /><br />

<form enctype="multipart/form-data" method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
<table align="center" class="border" style="width:50%">
	<tr>
		<td colspan="2" class="thead">{$lang['upload']}</td>
	</tr>
	<tr>
		<td class="green1">{$lang['upload']}:</td>
		<td class="green1" colspan="2">
		<input type="hidden" name="max_file_size" value="8388603" />
		<input name="thefile" type="file" />
		</td>
	</tr>
	<tr>
		<td class="green2" style="width:75px">{$lang['option']}</td>
		<td class="green2" align="left"><input type="submit" name="upload" value="{$lang['upload']}" /></td>
	</tr>
</table>
</form>
<br /><br />
<form method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.pw}&amp;path={$smarty.get.path}">
<table align="center" class="border" style="width:50%">
	<tr>
		<td colspan="2" class="thead">{$lang['createfolder']}</td>
	</tr>
	<tr>
		<td class="green1">{$lang['name']}:</td>
		<td class="green1" colspan="2"><input type="text" name="fname" value="" /></td>
	</tr>
	<tr>
		<td class="green2" style="width:75px">{$lang['option']}</td>
		<td class="green2" align="left"><input type="submit" name="createdir" value="{$lang['create']}" /></td>
	</tr>
</table>
</form>
</body>
</html>