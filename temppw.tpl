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
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['temppw']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th>Nickname</th>
						<th>Uid</th>
						<th>Desc</th>
						<th>Passwort</th>
						<th>Start</th>
						<th>Ende</th>
						<th>Channel</th>
						<th>Option</th>
					</tr>
				{if !empty($temppwlist)}
					{foreach key=id item=temppw from=$temppwlist}
					<tr>
						<td>{$temppw.nickname}</td>
						<td>{$temppw.uid}</td>
						<td>{$temppw.desc}</td>
						<td>{$temppw.pw_clear}</td>
						<td>{$temppw.start}</td>
						<td>{$temppw.end}</td>
						<td>{$temppw.tcid}</td>
						<td>
							<form method="post" action="index.php?site=temppw&amp;sid={$sid}">
								<input name="pw" value="{$temppw.pw_clear}" type="hidden">
								<input class="btn btn-danger btn-flat btn-block" name="temppwdel" value="" title="L&ouml;schen" type="submit">
							</form>
						</td>
					</tr>
					{/foreach}
				{/if}
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-lg-offset-4">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['create']} {$lang['temppw']}</h3>
			</div>
			<div class="box-body">
				<table class="table">
					<tr>
						<td><label for="newpw_password">{$lang['password']}</label></td>
						<td><input class="form-control" type="text" id="newpw_password" name="password" value="" /></td>
					</tr>
					<tr>
						<td><label for="newpw_duration">{$lang['duration']}</label></td>
						<td><input class="form-control" type="text" id="newpw_duration" name="duration" value="" /></td>
					</tr>
					<tr>
						<td><label for="newpw_description">{$lang['description']}</label></td>
						<td><input class="form-control" type="text" id="newpw_description" name="description" value="" /></td>
					</tr>
					<tr>
						<td><label for="newpw_tcid">{$lang['channel']}</label></td>
						<td>
							<select id="newpw_tcid" class="form-control" name="tcid">
							{foreach key=id item=channel from=$channellist}
								<option value="{$channel.cid}">{$channel.channel_name}</option>
							{/foreach}
							</select>
						</td>
					</tr>
						<td colspan="2"><input type="submit" name="create" class="btn btn-block btn-flat btn-info" value="{$lang['create']}" /></td>
					</tr>
				</table>
			</div>
		</div>
<form method="post" action="index.php?site=temppw&amp;sid={$sid}">
</form>
</div>
</section>