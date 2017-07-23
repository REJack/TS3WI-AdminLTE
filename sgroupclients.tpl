{if isset($permoverview['b_virtualserver_servergroup_client_list']) AND empty($permoverview['b_virtualserver_servergroup_client_list'])}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	</div>
</section>
{else}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['searchfor']}{$lang['client']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<td colspan="6">
							<form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
								<select name="searchby">
									<option value="cldbid">{$lang['cldbid']}</option>
									<option value="name">{$lang['name']}</option>
								</select>
								<input type="text" name="search" value="" />
								<input type="submit" name="sendsearch" value="{$lang['search']}" />
							</form>
						</td>
					</tr>
					<tr>
						<th colspan="6">({$sgroupid}) {$sgroupname} {$lang['groupmember']}</th>
					</tr>
					<tr>
						<th>{$lang['uniqueid']}</th>
						<th>{$lang['dbid']}</th>
						<th>{$lang['name']}</th>
						<th>{$lang['created']}</th>
						<th>{$lang['lastonline']}</th>
						<th></th>
					</tr>
					{if !empty($groupclients)}
						{foreach key=key item=value from=$groupclients}
							<tr>
								<td style="vertical-align: middle;" class="text-center">{$value['client_unique_identifier']}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['cldbid']}</td>
								<td style="vertical-align: middle;" class="text-center">{secure($value['client_nickname'])}</td>
								<td style="vertical-align: middle;" class="text-center">{date("d.m.Y", $value['client_created'])}</td>
								<td style="vertical-align: middle;" class="text-center">{date("d.m.Y", $value['client_lastconnected'])}</td>
								<td class="text-right no-padding">
									<form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
										<input type="hidden" name="cldbid" value="{$value['cldbid']}" />
										<input type="submit" class="btn btn-flat btn-block btn-danger" name="kickclient" value="kick"/>
									</form>
								</td>
							</tr> 
						{/foreach}
					{/if}
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-lg-offset-3">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['addclient']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
					<table class="table">
						<tr>
							<th width="30%"><label for="new_cldbid">{$lang['cldbid']}</label></th>
							<td><input type="text" class="form-control" id="new_cldbid" name="cldbid" value="" /></td>
						</tr>
					</table>
					<input type="submit" class="btn btn-flat btn-info btn-block" name="addclient" value="{$lang['add']}" />
				</form>				
			</div>
		</div>
	</div>
</section>
{/if}