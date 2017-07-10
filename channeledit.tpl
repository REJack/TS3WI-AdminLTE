<section class="content-header">
	<h1>
		{$lang['channel']} {$lang['editor']} &quot;{$channelinfo['channel_name']}&quot;
    </h1>
</section>
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
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
				<h3 class="box-title">{$lang['name']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td style="width:50%"><label for="newname_channelname">{$lang['name']}:</label></td>
							<td style="width:50%">
								{if isset($permoverview['b_channel_modify_name']) AND empty($permoverview['b_channel_modify_name'])}
									-
								{else}
									<input type="text" class="form-control" id="newname_channelname" class="form-control" name="newsettings[channel_name]" value="{$channelinfo['channel_name']}" />
								{/if}
							</td>
						</tr>
					</table>
					<input class="btn btn-flat btn-info btn-block" type="submit" name="editchannelname" value="{$lang['rename']}" />
				</form>
			</div>
		</div>
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['basics']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
					<table class="table table-striped" cellpadding="1" cellspacing="0">
						<tr>
							<td style="width:50%"><label for="new_channel_topic">{$lang['topic']}:</label></td>
							<td style="width:50%">
							{if isset($permoverview['b_channel_modify_topic']) AND empty($permoverview['b_channel_modify_topic'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_topic" name="newsettings[channel_topic]" value="{if isset($channelinfo['channel_topic'])}{$channelinfo['channel_topic']}{/if}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_description">{$lang['description']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_description']) AND empty($permoverview['b_channel_modify_description'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_description" name="newsettings[channel_description]" value="{if isset($channelinfo['channel_description'])}{$channelinfo['channel_description']}{/if}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_codec">{$lang['codec']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_codec']) AND empty($permoverview['b_channel_modify_codec'])}
								-
							{else}
								<select class="form-control" id="new_channel_codec" name="newsettings[channel_codec]">
								<option value="0" {if $channelinfo['channel_codec'] == '0'}selected="selected"{/if}>{$lang['codec0']}</option>
								<option value="1" {if $channelinfo['channel_codec'] == '1'}selected="selected"{/if}>{$lang['codec1']}</option>
								<option value="2" {if $channelinfo['channel_codec'] == '2'}selected="selected"{/if}>{$lang['codec2']}</option>
								<option value="3" {if $channelinfo['channel_codec'] == '3'}selected="selected"{/if}>{$lang['codec3']}</option>
								<option value="4" {if $channelinfo['channel_codec'] == '4'}selected="selected"{/if}>{$lang['codec4']}</option>
								<option value="5" {if $channelinfo['channel_codec'] == '5'}selected="selected"{/if}>{$lang['codec5']}</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_codec_quality">{$lang['codecquality']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_codec_quality']) AND empty($permoverview['b_channel_modify_codec_quality'])}
								-
							{else}
								<select class="form-control" id="new_channel_codec_quality" name="newsettings[channel_codec_quality]">
								<option value="0" {if $channelinfo['channel_codec_quality'] == '0'}selected="selected"{/if}>0</option>
								<option value="1" {if $channelinfo['channel_codec_quality'] == '1'}selected="selected"{/if}>1</option>
								<option value="2" {if $channelinfo['channel_codec_quality'] == '2'}selected="selected"{/if}>2</option>
								<option value="3" {if $channelinfo['channel_codec_quality'] == '3'}selected="selected"{/if}>3</option>
								<option value="4" {if $channelinfo['channel_codec_quality'] == '4'}selected="selected"{/if}>4</option>
								<option value="5" {if $channelinfo['channel_codec_quality'] == '5'}selected="selected"{/if}>5</option>
								<option value="6" {if $channelinfo['channel_codec_quality'] == '6'}selected="selected"{/if}>6</option>
								<option value="7" {if $channelinfo['channel_codec_quality'] == '7'}selected="selected"{/if}>7</option>
								<option value="8" {if $channelinfo['channel_codec_quality'] == '8'}selected="selected"{/if}>8</option>
								<option value="9" {if $channelinfo['channel_codec_quality'] == '9'}selected="selected"{/if}>9</option>
								<option value="10" {if $channelinfo['channel_codec_quality'] == '10'}selected="selected"{/if}>10</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_codec_is_unencrypted">{$lang['codecunencrypted']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_maxclients']) AND empty($permoverview['b_channel_modify_maxclients'])}
								-
							{else}
							<select class="form-control" id="new_channel_codec_is_unencrypted" name="newsettings[channel_codec_is_unencrypted]">
								<option value="1" {if $channelinfo['channel_codec_is_unencrypted']==1}selected="selected"{/if}>{$lang['yes']}</option>
								<option value="0" {if $channelinfo['channel_codec_is_unencrypted']==0}selected="selected"{/if}>{$lang['no']}</option>
							</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_maxclients">{$lang['maxclients']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_maxclients']) AND empty($permoverview['b_channel_modify_maxclients'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_maxclients" name="newsettings[channel_maxclients]" value="{$channelinfo['channel_maxclients']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_maxfamilyclients">{$lang['maxfamilyclients']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_maxfamilyclients']) AND empty($permoverview['b_channel_modify_maxfamilyclients'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_maxfamilyclients" name="newsettings[channel_maxfamilyclients]" value="{$channelinfo['channel_maxfamilyclients']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="">{$lang['type']}:</label></td>
							<td>
							{if !isset($permoverview['b_channel_modify_make_temporary']) or $permoverview['b_channel_modify_make_temporary'] == 1}
								<div class="radio">
									<label>	
										<input type="radio" name="chantyp" value="0" {if $channelinfo['channel_flag_permanent'] == 0 AND $channelinfo['channel_flag_semi_permanent'] == 0}checked="checked"{/if} />
										{$lang['temporary']}
									</label>
								</div>
							{/if}
							{if !isset($permoverview['b_channel_modify_make_semi_permanent']) or $permoverview['b_channel_modify_make_semi_permanent'] == 1}
								<div class="radio">
									<label>	
										<input type="radio" name="chantyp" value="1" {if $channelinfo['channel_flag_semi_permanent'] == 1}checked="checked"{/if} />
										{$lang['semipermanent']}
									</label>
								</div>
							{/if}
							{if !isset($permoverview['b_channel_modify_make_permanent']) or $permoverview['b_channel_modify_make_permanent'] == 1}
								<div class="radio">
									<label>	
										<input type="radio" name="chantyp" value="2" {if $channelinfo['channel_flag_permanent'] == 1 AND $channelinfo['channel_flag_default']==0}checked="checked"{/if} />
										{$lang['permanent']}
									</label>
								</div>
							{/if}
							{if !isset($permoverview['b_channel_modify_make_default']) or $permoverview['b_channel_modify_make_default'] == 1}
								<div class="radio">
									<label>	
										<input type="radio" name="chantyp" value="3" {if $channelinfo['channel_flag_default'] == 1}checked="checked"{/if} />
										{$lang['default']}
									</label>
								</div>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_flag_maxfamilyclients_inherited">{$lang['maxfamilyclientsinherited']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_maxfamilyclients']) AND empty($permoverview['b_channel_modify_maxfamilyclients'])}
								-
							{else}
								<select class="form-control" id="new_channel_flag_maxfamilyclients_inherited" name="newsettings[channel_flag_maxfamilyclients_inherited]">
								<option value="0" {if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '0'}selected="selected"{/if}>0</option>
								<option value="1" {if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '1'}selected="selected"{/if}>1</option>
								</select>
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_needed_talk_power">{$lang['neededtalkpower']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_needed_talk_power']) AND empty($permoverview['b_channel_modify_needed_talk_power'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_needed_talk_power" name="newsettings[channel_needed_talk_power]" value="{$channelinfo['channel_needed_talk_power']}" />
							{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_name_phonetic">{$lang['phoneticname']}:</label></td>
							<td>
							{if isset($permoverview['b_channel_modify_name']) AND empty($permoverview['b_channel_modify_name'])}
								-
							{else}
								<input type="text" class="form-control" id="new_channel_name_phonetic" name="newsettings[channel_name_phonetic]" value="{if isset($channelinfo['channel_name_phonetic'])}{$channelinfo['channel_name_phonetic']}{/if}" />
							{/if}
							</td>
						</tr>
					</table>
					<input class="btn btn-primary btn-block btn-flat" type="submit" name="editchannel" value="{$lang['edit']}" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-5 ">
	{if !isset($permoverview['b_channel_modify_password']) OR $permoverview['b_channel_modify_password'] == 1}
		<div class="box box-border-teal">
			<div class="box-header">
				<h3 class="box-title">{$lang['channelpassword']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="30%"><b>{$lang['passwordset']}:</b></td>
							<td>
								{if $channelinfo['channel_flag_password'] == 1}
									{$lang['yes']}
								{else}
									{$lang['no']}
								{/if}
							</td>
						</tr>
						<tr>
							<td><label for="new_channel_password">{$lang['newpassword']}:</label></td>
							<td>
								{if $channelinfo['channel_flag_default'] == 1}
									{$lang['defaultnopw']}
								{else}
									<input type="text" class="form-control" id="new_channel_password" name="newsettings[channel_password]" value="" />
								{/if}
							</td>
						</tr>
					</table>
					{if $channelinfo['channel_flag_default'] == 0}
						<input class="btn btn-block btn-flat bg-teal" type="submit" name="editpw" value="{$lang['send']}" />
					{/if}
				</form>
			</div>
		</div>
	{/if}
	{if !isset($permoverview['b_channel_modify_parent']) OR $permoverview['b_channel_modify_parent'] == 1}
		<div class="box box-warning">
			<div class="box-header">
				<h3 class="box-title">{$lang['channelmove']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
					<table class="table" cellpadding="1" cellspacing="0">
						<tr>
							<td width="30%"><label for="move_channel">{$lang['moveto']}:</label></td>
							<td>
							<select id="move_channel" class="form-control" name="move">
							<option value="0">{$lang['mainchannel']}</option>
							{foreach key=key item=value from=$channellist}
								{if $value['cid'] != $cid}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
								{/if}
							{/foreach}
							</select>
							</td>
						</tr>
					</table>
					<input class="btn btn-block btn-flat btn-warning" type="submit" name="movechan" value="{$lang['move']}" />
				</form>				
			</div>
		</div>
	{/if}


	</div>
</section>