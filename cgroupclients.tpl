{if isset($permoverview['b_virtualserver_channelgroup_client_list']) AND empty($permoverview['b_virtualserver_channelgroup_client_list'])}
<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<div class="box box-danger">
				<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
				<div class="box-body">
					<p class="lead">{$lang['nopermissions']}</p>
				</div>
			</div>
		</div>
	</div>
</section>
{else}
<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
	</div>
	<div class="col-lg-5 col-lg-offset-1">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['searchfor']}{$lang['client']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
					<div class="row">
						<div class="col-md-4">
							<select name="searchby" class="form-control">
								<option value="cldbid">{$lang['cldbid']}</option>
								<option value="name">{$lang['name']}</option>
							</select>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="search" />
						</div>
					</div>
					<input type="submit" class="btn btn-info btn-flat btn-block" name="sendsearch" value="{$lang['search']}" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-5">
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['addclient']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
					<table class="table table-striped no-margin">
						<tr>
							<td width="30%" class="no-padding" style="vertical-align: middle;"><label for="new_cid">{$lang['channel']}:</label></td>
							<td class="no-padding">
								<select id="new_cid" name="cid" class="form-control">
								{foreach key=key item=value from=$channellist}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
						<tr>
							<td class="no-padding" style="vertical-align: middle;"><label for="new_cldbid">{$lang['cldbid']}:</label></td>
							<td class="no-padding"><input type="text" class="form-control" id="new_cldbid" name="cldbid" /></td>
						</tr>
					</table>
					<input type="submit" class="btn btn-flat btn-block bg-teal" name="addclient" value="{$lang['add']}" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">({$cgroupid}) {$cgroupname} {$lang['groupmember']}<</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th class="text-center">{$lang['channelid']}</th>
						<th class="text-center">{$lang['channelname']}</th>
						<th class="text-center">{$lang['clientdbid']}</th>
						<th class="text-center">{$lang['clientname']}</th>
						<th class="text-center">{$lang['created']}</th>
						<th class="text-center">{$lang['lastonline']}</th>
						<th></th>
					</tr>
			{if !empty($groupclients)}
				{foreach key=key item=value from=$groupclients}
					<tr>
						<td style="vertical-align: middle;" class="text-center">{$value['cid']}</td>
						<td style="vertical-align: middle;" class="text-center">{secure($value['channel_name'])}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['cldbid']}</td>
						<td style="vertical-align: middle;" class="text-center">{secure($value['client_nickname'])}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['client_created']}</td>
						<td style="vertical-align: middle;" class="text-center">{$value['client_lastconnected']}</td>
						<td>
							<form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
								<div class="col-md-8 no-padding">
									<select name="cgid" class="form-control">
									{foreach key=key2 item=value2 from=$channelgroups}
										{if $value2['cgid'] != $cgroupid AND $value2['type'] != '0'}
										<option value="{$value2['cgid']}">({$value2['cgid']}){$value2['name']}</option>
										{/if}
									{/foreach}
									</select>
								</div>
								<div class="col-md-4 no-padding">
									<input type="hidden" name="cid" value="{$value['cid']}" />
									<input type="hidden" name="cldbid" value="{$value['cldbid']}" />
									<input type="submit" class="btn btn-flat btn-block btn-primary" name="switchgroup" value="{$lang['switch']}" />
								</div>
							</form>
						</td>
						
					</tr>
				{/foreach}
			{/if}
				</table>
			</div>
		</div>
	</div>
</section>
{/if}