{if isset($permoverview['b_virtualserver_channelgroup_create']) AND empty($permoverview['b_virtualserver_channelgroup_create'])}
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
				<h3 class="box-title">{$lang['addchannelgroup']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=cgroupadd&amp;sid={$sid}">
					<table class="table table-striped no-margin">
						<tr>
							<th width="35%"><label>{$lang['type']}:</label></th>
							<td>
								<div class="radio">
									<label>
										<input type="radio" name="type" value="0" />
										{$lang['template']}
									</label>
								</div>
								<div class="radio">
									<label>
										<input checked="checked" type="radio" name="type" value="1" />
										{$lang['normal']}
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="new_name">{$lang['name']}</label></th>
							<td class="no-padding">
								<input type="text" class="form-control" id="new_name" name="name" />
							</td>
						</tr>
						<tr>
							<th><label for="new_copyfrom">{$lang['copypermsfrom']}:</label></th>
							<td class="no-padding">
								<select id="new_copyfrom" name="copyfrom" class="form-control">
									<option value="0">-</option>
								{foreach key=key item=value from=$channelgroups}
									<option value="{$value['cgid']}">{$value['name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="new_overwrite">{$lang['overwritegroup']}:</label></th>
							<td class="no-padding">
								<select id="new_overwrite" name="overwrite" class="form-control">
									<option value="0">-</option>
								{foreach key=key item=value from=$channelgroups}
									<option value="{$value['cgid']}">{$value['name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
					</table>
					<input class="btn btn-flat btn-primary btn-block" type="submit" name="addgroup" value="{$lang['add']}" />
				</form>
			</div>
		</div>
	</div>
</section>
{/if}