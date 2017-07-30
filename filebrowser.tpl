<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="de">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/ionicons/1.5.2/css/ionicons.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/AdminLTE.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/skins/_all-skins.min.css">
	<link href="../templates/{$tmpl}/assets/css/materialdesignicons.css" rel="stylesheet" />
	<link href="../templates/{$tmpl}/assets/css/mdi-customs.css" rel="stylesheet" />
	<link href="../templates/{$tmpl}/assets/css/customs.css" rel="stylesheet" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/js/app.min.js"></script>
	<title>TS3Webinterface - File Browser</title>
	<script type="text/javascript">
		var pageTitle = "{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']})";
	</script>
</head>
<body style="background: #ecf0f5;" onload="window.parent.postMessage(pageTitle, '*')" class="no-padding no-margin">
{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if !empty($noerror)}
	<div class="alert alert-info">{$noerror}</div>
{/if}
	<div class="box box-primary">
		<div class="box-body no-padding">
			<table class="table table-striped">
				<tr>
					<th style="width:25%">{$lang['name']}</th>
					<th style="width:10%">{$lang['size']}</th>
					<th style="width:25%">{$lang['date']}</th>
					<th style="width:10%"></th>
				</tr>
				{if !empty($flist)}
					{if $smarty.get.path != "/" AND !empty($smarty.get.path)}
					<tr>
						<td colspan="4" class="no-padding"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}" class="btn btn-link btn-flat">..</a></td>
					</tr>
					{/if}
					{foreach key=key item=value from=$flist}
					<tr>
						<td style="vertical-align: middle;">{if $value['type'] == 0} <i class="mdi mdi-folder mdi-lg"></i> <a href="filebrowser.php?&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>{else} <i class="mdi mdi-file mdi-lg"></i> <a href="filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>{/if}</td>
						<td style="vertical-align: middle;">{$value['size']} Mb</td>
						<td style="vertical-align: middle;">{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
						<td style="vertical-align: middle;" class="no-padding text-right"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={$smarty.get.path}&amp;name={$value['name']}&amp;deletefile=1" class="btn btn-sm btn-flat btn-danger">{$lang['delete']}</a></td>
					</tr>	
					{/foreach}
				{else}
					{if $smarty.get.path != "/" AND !empty($smarty.get.path)}
					<tr>
						<td colspan="4"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}">..</a></td>
					</tr>
					{/if}
				<tr>
					<td colspan="4">
						Keine Dateien gefunden!
					</td>
				</tr>
				{/if}
			</table>
		</div>
	</div>
	<form enctype="multipart/form-data" method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['upload']}</h3>
			</div>
			<div class="box-body">
				<input type="hidden" name="max_file_size" value="8388603" />
				<div class="form-group">
					<input name="thefile" type="file" />
				</div>
				<input type="submit" class="btn btn-info btn-flat btn-block" name="upload" value="{$lang['upload']}" />
			</div>
		</div>
	</form>
	<form method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.pw}&amp;path={$smarty.get.path}">
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['createfolder']}</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<input type="text" class="form-control" name="fname" value="" />
				</div>
				<input type="submit" class="btn bg-teal btn-flat btn-block" name="createdir" value="{$lang['create']}" />
			</div>
		</div>
	</form>
</body>
</html>