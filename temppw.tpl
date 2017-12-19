<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
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
					<div class="table-responsive">
						<table class="table table-striped table-vert-mid">
							<tr>
								<th>{$lang['nickname']}</th>
								<th>Uid</th>
								<th>{$lang['description']}</th>
								<th>{$lang['password']}</th>
								<th class="text-center">{$lang['start']}</th>
								<th class="text-center">{$lang['stop']}</th>
								<th class="text-center">{$lang['channel']}</th>
								<th></th>
							</tr>
						{if !empty($temppwlist)}
							{foreach key=id item=temppw from=$temppwlist}
							<tr>
								<td>{$temppw.nickname}</td>
								<td>{$temppw.uid}</td>
								<td>{$temppw.desc}</td>
								<td>{$temppw.pw_clear}</td>
								<td class="text-center">{$temppw.start|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
								<td class="text-center">{$temppw.end|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
								<td class="text-center">{$temppw.tcid}</td>
								<td class="no-padding">
									<form method="post" action="index.php?site=temppw&amp;sid={$sid}">
										<input name="pw" value="{$temppw.pw_clear}" type="hidden">
										<input class="btn btn-danger btn-flat btn-block" name="temppwdel" value="{$lang['delete']}" type="submit">
									</form>
								</td>
							</tr>
							{/foreach}
						{/if}
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<div class="box box-info">
				<div class="box-header">
					<h3 class="box-title">{$lang['create']} {$lang['temppw']}</h3>
				</div>
				<div class="box-body">
					<form method="post" action="index.php?site=temppw&amp;sid={$sid}">
						<div class="form-group">
							<label for="newpw_password">{$lang['password']}</label>
							<input class="form-control" type="text" id="newpw_password" name="password" />
						</div>
						<div class="form-group">
							<label for="newpw_duration">{$lang['duration']}</label>
							<input class="form-control" type="text" id="newpw_duration" name="duration" />
						</div>
						<div class="form-group">
							<label for="newpw_description">{$lang['description']}</label>
							<input class="form-control" type="text" id="newpw_description" name="tcid" />
						</div>
						<div class="form-group">
							<label for="newpw_tcid">{$lang['channel']}</label>
							<select id="newpw_tcid" class="form-control" name="description">
							{foreach key=id item=channel from=$channellist}
								<option value="{$channel.cid}">{$channel.channel_name}</option>
							{/foreach}
							</select>
						</div>
						<div class="form-group">
							<input type="submit" name="create" class="btn btn-block btn-flat btn-info" value="{$lang['create']}" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>