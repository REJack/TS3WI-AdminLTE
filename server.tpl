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
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['msgtoall']}</h3>
			</div>
			<form class="box-body" method="post" action="index.php?site=server">
				<div class="form-group">
					<textarea type="text" class="form-control resize-vert" name="msgtoall" id="msgtoall"></textarea>
				</div>
				<input class="btn btn-flat bg-teal pull-right" type="submit" name="sendmsg" value="{$lang['send']}" />
			</form>
		</div>

		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['server']}</h3>
			</div>
			<form class="box-body" method="post" name="saction" action="index.php?site=server">
				{if !empty($serverlist)}
				<p>{$serverstats}</p>
				{/if}

				<table class="table table-striped">
					<tr>
						<th class="text-center">
							<a class="headlink" href="index.php?site=server&amp;sortby=id&amp;sorttype={if $sortby == 'virtualserver_id' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['id']}</a>
						</th>
						<th class="text-center">
							<a class="headlink" href="index.php?site=server&amp;sortby=name&amp;sorttype={if $sortby == 'virtualserver_name' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['name']}</a>
						</th>
						<th class="text-center">
							<a class="headlink" href="index.php?site=server&amp;sortby=port&amp;sorttype={if $sortby == 'virtualserver_port' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['port']}</a>
						</th>
						<th class="text-center">
							<a class="headlink" href="index.php?site=server&amp;sortby=status&amp;sorttype={if $sortby == 'virtualserver_status' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['status']}</a>
						</th>
						<th class="text-center">
							<a class="headlink" href="index.php?site=server&amp;sortby=uptime&amp;sorttype={if $sortby == 'virtualserver_uptime' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['runtime']}</a>
						</th>
						<th class="text-center"><a class="headlink" href="index.php?site=server&amp;sortby=clients&amp;sorttype={if $sortby == 'virtualserver_clientsonline' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['clients']}</a>
						</th>
						<th class="text-center">{$lang['autostart']}</th>
						<th class="text-center">{$lang['options']}</th>
					</tr>
					{if !empty($serverlist)}
					<tr>
						<th colspan="7">
						</th>
						<th class="no-padding">
							<input class="btn btn-flat btn-primary btn-block" type="submit" name="massaction" value="{$lang['action']}" onclick="return confirm(confirm_action())" />
						</th>
					</tr>
				{foreach key=key item=value from=$serverlist}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_id']}</td>
						<td style="vertical-align: middle;" class="text-center"><a href="index.php?site=serverview&amp;sid={$value['virtualserver_id']}">{$value['virtualserver_name']}</a></td>
						<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_port']}</td>
						<td style="vertical-align: middle;" class="text-center">
						{if $value['virtualserver_status'] == "online"}
							<span class="text-success">{$lang['online']}</span>
						{elseif $value['virtualserver_status'] == "online virtual"}
						<span class="onvirtual">{$lang['onlinevirtual']}</span>
						{elseif $value['virtualserver_status'] == "offline"}
							<span class="text-danger">{$lang['offline']}</span>
						{/if}
						</td>
						<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_uptime']}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['virtualserver_clientsonline']} / {$value['virtualserver_maxclients']}</td>
						<td style="vertical-align: middle;" class="text-center"><input type="checkbox" name="caction[{$value['virtualserver_id']}][auto]" value="1" {if $value['virtualserver_autostart'] == 1}checked="checked"{/if}/></td>
						<td class="text-right no-padding">
							<select class="form-control" id="caction{$value['virtualserver_id']}" name="caction[{$value['virtualserver_id']}][action]" onchange="confirm_array('{$value['virtualserver_id']}', '{$value['virtualserver_name']|addslashes}', '{$value['virtualserver_port']}', '');">
								<option value="false">{$lang['select']}</option>
								<option value="start">{$lang['start']}</option>
								<option value="stop">{$lang['stop']}</option>
								<option value="del">{$lang['delete']}</option>
							</select>
						</td>
					</tr>
				{/foreach}
					<tr>
						<th colspan="7">
						</th>
						<th class="no-padding">
							<input class="btn btn-flat btn-primary btn-block" type="submit" name="massaction" value="{$lang['action']}" onclick="return confirm(confirm_action())" />
						</th>
					</tr>
					{else}
					<tr><td colspan='8'><p class="lead">{$lang['noserver']}</p></td></tr>
					{/if}
				</table>
			</form>
		</div>
		{/if}
	</div>
</section>