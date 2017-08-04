<section class="content container-fluid">
	{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
	<div class="alert alert-info">{$noerror}</div>
	{/if}
{if isset($permoverview['b_virtualserver_token_list']) AND empty($permoverview['b_virtualserver_token_list'])}
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	</div>
{else}
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['tokenlist']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=token&amp;sid={$sid}">
					<table class="table table-striped">
						<tr>
							<th>{$lang['token']}</th>
							<th class="text-center">{$lang['type']}</th>
							<th class="text-center">{$lang['id1']}</th>
							<th class="text-center">{$lang['id2']}</th>
							<th class="text-center">{$lang['created']}</th>
							<th class="text-center">{$lang['description']}</th>
							<th class="text-center">
								<div class="checkbox-inline">
									<label>
										<input type="checkbox" name="checkall" value="0" onclick="check(1)" />
										{$lang['selectall']}
									</label>
								</div>

							</th>
						</tr>
				{if !empty($tokenlist)}
					{foreach key=key item=value from=$tokenlist}
						<tr>
							<td>{$value['token']}</td>
							<td class="text-center">
							{if $value['token_type']==0}
								{$lang['servergroup']}
							{elseif $value['token_type'] == 1}
								{$lang['channelgroup']}
							{/if}
							</td>
							<td class="text-center">
							{if $value['token_type'] == 0}
								{foreach key=key2 item=value2 from=$sgrouplist}
									{if $value2['sgid'] == $value['token_id1']}
										{$value2['name']}
									{/if}
								{/foreach}
							{elseif $value['token_type'] == 1}
								{foreach key=key2 item=value2 from=$cgrouplist}
									{if $value2['cgid'] == $value['token_id1']}
										{$value2['name']}
									{/if}
								{/foreach}
							{/if}
							</td>
							<td class="text-center">
							{if $value['token_type']==1}
								{foreach key=key2 item=value2 from=$channellist}
									{if $value2['cid'] == $value['token_id2']}
										{$value2['channel_name']}
									{/if}
								{/foreach}
							{/if}
							</td>
							<td class="text-center">{$value['token_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							<td class="text-center">{$value['token_description']}</td>
							<td class="text-center">
							{if !isset($permoverview['b_virtualserver_token_delete']) OR $permoverview['b_virtualserver_token_delete']==1}
								<input type="checkbox" name="token[]" value="{$value['token']}" />
							{/if}
							</td>
						</tr>
					{/foreach} 
				{/if}
					</table>
				{if !empty($tokenlist)}
					<input type="submit" class="btn btn-flat btn-block btn-danger" name="deltoken" value="{$lang['delete']}" />
				{/if}
				</form>
			</div>
		</div>
	</div>
{/if}
{if isset($permoverview['b_virtualserver_token_add']) AND empty($permoverview['b_virtualserver_token_add'])}
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	</div>
{else}
	<div class="col-lg-6 col-lg-offset-3">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['createtoken']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=token&amp;sid={$sid}">
					<table class="table table-striped no-margin">
						<tr>
							<th width="35%">{$lang['type']}</th>
							<td class="no-padding">
								<select class="form-control" name="tokentype" onchange="hide_select(this.value)">
									<option disabled selected>{$lang['type']}</option>
									<option value="0">(0){$lang['servergroup']}</option>
									<option value="1">(1){$lang['channelgroup']}</option>
								</select>
							</td>
						</tr>
						<tr id="servergroups" style="display:none">
							<th><label for="servergroups">{$lang['groups']}</label></th>
							<td class="no-padding">
								<select class="form-control" name="tokenid1_1">
									<option disabled selected>{$lang['servergroups']}</option>
							{foreach key=key item=value from=$sgrouplist}
								{if $value['type'] != 0}
									<option value="{$value['sgid']}">({$value['sgid']}) {$value['name']}</option>
								{/if}
							{/foreach}
								</select>
							</td>
						</tr>
						<tr id="channelgroups" style="display:none">
							<th><label for="channelgroups">{$lang['groups']}</label></th>
							<td class="no-padding">
								<select class="form-control" name="tokenid1_2">
									<option disabled selected>{$lang['channelgroups']}</option>
							{foreach key=key item=value from=$cgrouplist}
								{if $value['type'] != 0}
									<option value="{$value['cgid']}">({$value['cgid']}) {$value['name']}</option>
								{/if}
							{/foreach}
								</select>
							</td>
						</tr>
						<tr id="channel" style="display:none">
							<th><label for="new_tokenid2">{$lang['channel']}</label></th>
							<td class="no-padding">
								<select id="new_tokenid2" class="form-control" name="tokenid2">
									<option value="0" disabled selected>{$lang['channel']}</option>
								{foreach key=key item=value from=$channellist}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
								{/foreach}
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="new_description">{$lang['description']}</label></th>
							<td class="no-padding">
								<input type="text" class="form-control" id="new_description" name="description" />
							</td>
						</tr>
						<tr>
							<th><label for="new_number">{$lang['number']}</label></th>
							<td class="no-padding">
								<input type="number" class="form-control" id="new_number" name="number" min="1" max="99" step="1" value="1" />
							</td>
						</tr>
					</table>
					<input class="btn btn-block btn-flat btn-flat btn-info" type="submit" name="addtoken" value="{$lang['create']}" />
				</form>
			</div>
		</div>
	</div>
</section>
{/if}