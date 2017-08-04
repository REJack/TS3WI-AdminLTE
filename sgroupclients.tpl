{if isset($permoverview['b_virtualserver_servergroup_client_list']) AND empty($permoverview['b_virtualserver_servergroup_client_list'])}
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1 no-padding">
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
	<div class="col-lg-10 col-lg-offset-1 no-padding">
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
				<form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
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
				<form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
					<table class="table table-striped no-margin">
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
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">({$sgroupid}) {$sgroupname} {$lang['groupmember']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<th class="text-center">{$lang['uniqueid']}</th>
						<th class="text-center">{$lang['dbid']}</th>
						<th class="text-center">{$lang['name']}</th>
						<th class="text-center">{$lang['created']}</th>
						<th class="text-center">{$lang['lastonline']}</th>
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
</section>
{/if}