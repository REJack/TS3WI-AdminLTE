<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="de">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/ionicons/1.5.2/css/ionicons.min.css">
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/AdminLTE.min.css">
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/all.css">
		<link rel="stylesheet" href="//cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
		<link href="../templates/{$tmpl}/assets/css/materialdesignicons.css" rel="stylesheet" />
		<link href="../templates/{$tmpl}/assets/css/mdi-customs.css" rel="stylesheet" />
		<link href="../templates/{$tmpl}/assets/css/customs.css" rel="stylesheet" />
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
		<script src="//cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
		<script src="//cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>
		<script src="//cdn.datatables.net/plug-ins/1.10.15/api/processing().js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/js/app.min.js"></script>
		<title>TS3 Webinterface - Interactive</title>
	</head>
<body>
{if !isset($smarty.get.clid)}
	<form class="form-inline" method="post" name="f2" action="interactive.php?sid={$smarty.get.sid}">
		<div class="row">
			<label class="col-md-3">{$lang['select']}:</label>
			<div class="col-md-9">
				<select class="form-control" name="action" onchange="this.form.submit()">
					<option disabled {if $smarty.post.action == ''} selected {/if}>{$lang['select']}</option>
					<option value="kick" {if $smarty.post.action == 'kick'} selected {/if}>{$lang['kick']}</option>
					<option value="ban" {if $smarty.post.action == 'ban'} selected {/if}>{$lang['ban']}</option>
					<option value="move" {if $smarty.post.action == 'move'} selected {/if}>{$lang['move']}</option>
				</select>
			</div>
		</div>
	</form>
	<br />
	{if $smarty.post.action == 'move'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<h4>{$lang['massmover']}</h4>
		<div class="row form-group">
			<div class="col-md-12">
				<div class="checkbox">
					<label>
						<b>
							<input type="checkbox" name="moveall" value="1" /> {$lang['moveallclients']}
						</b>
					</label>
				</div>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['moveclientsbysgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$servergrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="movebysgroup[]" value="{$value['sgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['moveclientsbycgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$channelgrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="movebycgroup[]" value="{$value['cgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_movebycid">{$lang['movefrom']}:</label>
			<div class="col-md-9">
				<select class="form-control" id="new_movebycid" name="movebycid[]" size="3" multiple="multiple">
				{foreach key=key item=value from=$channellist}
					<option value="{$value['cid']}">{$value['channel_name']}</option>
				{/foreach}
				</select>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_cid">{$lang['moveto']}:</label>
			<div class="col-md-9">
				<select class="form-control" id="new_cid" name="cid" size="3">
				{foreach key=key item=value from=$channellist}
					<option value="{$value['cid']}">{$value['channel_name']}</option>
				{/foreach}
				</select>
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-12">
				<input class="btn btn-primary btn-flat btn-block" type="submit" name="sendmassban" value="{$lang['move']}" onclick="parent.closeIFrame();" />
			</div>
		</div>
	</form>
	{/if}
	{if $smarty.post.action == 'kick'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<h4>{$lang['masskicker']}</h4>
		<div class="row form-group">
			<div class="col-md-12">
				<div class="checkbox">
					<label>
						<b>
							<input type="checkbox" name="kickall" value="1" /> {$lang['kickallclients']}
						</b>
					</label>
				</div>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['kickclientsbysgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$servergrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="kickbysgroup[]" value="{$value['sgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['kickclientsbycgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$channelgrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="kickbycgroup[]" value="{$value['cgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_kickbycid">{$lang['kickfrom']}:</label>
			<div class="col-md-9">
				<select class="form-control" id="new_kickbycid" name="kickbycid[]" size="3" multiple="multiple">
				{foreach key=key item=value from=$channellist}
					<option value="{$value['cid']}">{$value['channel_name']}</option>
				{/foreach}
				</select>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_kickmsg">{$lang['kickmsg']}:</label>
			<div class="col-md-9">
				<input type="text" name="kickmsg" id="new_kickmsg" class="form-control">
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-12">
				<input class="btn btn-primary btn-flat btn-block" type="submit" name="sendmasskick" value="{$lang['kick']}" onclick="self.close()" />
			</div>
		</div>
	</form>
	{/if}
	{if $smarty.post.action == 'ban'}
	<form class="form-inline" method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<h4>{$lang['massban']}</h4>
		<div class="row form-group">
			<div class="col-md-12">
				<div class="checkbox">
					<label>
						<b>
							<input type="checkbox" name="banall" value="1" /> {$lang['banallclients']}
						</b>
					</label>
				</div>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['banclientsbysgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$servergrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="banbysgroup[]" value="{$value['sgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3">
				{$lang['banclientsbycgroup']}
			</label>
			<div class="col-md-9">
				{foreach key=key item=value from=$channelgrouplist}
				{if $value['type']!=0}
				<div class="checkbox">
					<label> 
						<input type="checkbox" name="banbysgroup[]" value="{$value['cgid']}" />
						{$value['name']}
					</label>
				</div>
				{/if}
				{/foreach}
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_banbycid">{$lang['banfrom']}:</label>
			<div class="col-md-9">
				<select class="form-control" id="new_banbycid" name="banbycid[]" size="3" multiple="multiple">
				{foreach key=key item=value from=$channellist}
					<option value="{$value['cid']}">{$value['channel_name']}</option>
				{/foreach}
				</select>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_banmsg">{$lang['banmsg']}:</label>
			<div class="col-md-9">
				<input type="text" name="banmsg" id="new_banmsg" class="form-control">
			</div>
		</div>
		<div class="row form-group">
			<label class="col-md-3" for="new_bantime">{$lang['bantime']}:</label>
			<div class="col-md-9">
				<div class="input-group">
					<input type="number" name="bantime" id="new_bantime" class="form-control" min="-1" step="1">
					<div class="input-group-addon">
						{$lang['seconds']}
					</div>
				</div>
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-12">
				<input class="btn btn-primary btn-flat btn-block" type="submit" name="sendmassban" value="{$lang['ban']}" onclick="parent.closeIFrame();" />
			</div>
		</div>
	</form>
	{/if}
{else}
	<form method="post" name="f2" action="interactive.php?sid={$smarty.get.sid}&amp;clid={$smarty.get.clid}&amp;nick={$smarty.get.nick}">
		<table class="table">
			<tr>
				<td class="maincat" colspan="2">{$smarty.get.nick}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['select']}:</td>
				<td class="green1">
					<select name="action" onchange="this.form.submit()">
						<option>{$lang['select']}</option>
						<option value="kick">{$lang['kick']}</option>
						<option value="ban">{$lang['ban']}</option>
						<option value="poke">{$lang['poke']}</option>
						<option value="move">{$lang['move']}</option>
					</select>
				</td>
			</tr>
		</table>
		</form>
		<br />
	{if $smarty.post.action == 'kick'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}" onsubmit="window.close()">
		<table class="border" cellpadding="1" cellspacing="0">
			<tr>
				<td class="maincat" colspan="2">{$lang['kick']} {$smarty.get.nick}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['kickmsg']}:</td>
				<td class="green1"><input type="text" name="kickmsg" /></td>
			</tr>
			<tr>
				<td class="green2">{$lang['option']}:</td>
				<td class="green2">
				<input type="hidden" name="clid" value="{$smarty.get.clid}" />
				<input class="button" type="submit" name="sendkick" value="{$lang['kick']}" onclick="self.close()">
				</td>
			</tr>
		</table>
	</form>
	{/if}

	{if $smarty.post.action == 'ban'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<table class="border" cellpadding="1" cellspacing="0">
			<tr>
				<td class="maincat" colspan="2">{$lang['ban']} {$smarty.get.nick}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['banmsg']}:</td>
				<td class="green1">
				<input type="text" name="banmsg"></td>
			</tr>
			<tr>
				<td class="green2">{$lang['bantime']}:</td>
				<td class="green2">
				<input type="text" name="bantime">{$lang['seconds']}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['option']}:</td>
				<td class="green1">
				<input type="hidden" name="clid" value="{$smarty.get.clid}" />
				<input class="button" type="submit" name="sendban" value="{$lang['ban']}" onclick="self.close()">
				</td>
			</tr>
		</table>
	</form>
	{/if}

	{if $smarty.post.action == 'poke'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<table class="border" cellpadding="1" cellspacing="0">
			<tr>
				<td class="maincat" colspan="2">{$lang['poke']} {$smarty.get.nick}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['pokemsg']}:</td>
				<td class="green1">
				<input type="text" name="pokemsg"></td>
			<tr>
				<td class="green2">{$lang['option']}:</td>
				<td class="green2">
				<input type="hidden" name="clid" value="{$smarty.get.clid}" />
				<input class="button" type="submit" name="sendpoke" value="{$lang['poke']}" onclick="self.close()">
				</td>
			</tr>
		</table>
		</form>
	{/if}
	{if $smarty.post.action=='move'}
	<form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
		<table class="border" cellpadding="1" cellspacing="0">
			<tr>
				<td class="maincat" colspan="2">{$lang['move']} {$_GET['nick']}</td>
			</tr>
			<tr>
				<td class="green1">{$lang['move']}:</td>
				<td class="green1">
				<select name="cid">
				{foreach key=key item=value from=$channellist}
					<option value="{$value['cid']}">{$value['channel_name']}</option>";
				{/foreach}
				</select>
				</td>
			<tr>
				<td class="green2">{$lang['option']}:</td>
				<td class="green2">
				<input type="hidden" name="clid" value="{$smarty.get.clid}" />
				<input class="button" type="submit" name="sendmove" value="{$lang['move']}" onclick="self.close()">
				</td>
			</tr>
		</table>
	</form>
	{/if}
{/if}
</body>
</html>