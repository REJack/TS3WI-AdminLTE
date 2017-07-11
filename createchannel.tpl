<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
	{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
	{/if}
	{if isset($permoverview['b_channel_create_permanent']) AND isset($permoverview['b_channel_create_semi_permanent']) AND isset($permoverview['b_channel_create_temporary']) AND empty($permoverview['b_channel_create_permanent']) AND empty($permoverview['b_channel_create_semi_permanent']) AND empty($permoverview['b_channel_create_temporary'])}
		<div class="box box-danger">
			<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
			<div class="box-body">
				<p class="lead">{$lang['nopermissions']}</p>
			</div>
		</div>
	{else}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['createachannel']}</h3>
			</div>
			<div class="box-body">			
				<form method="post" action="index.php?site=createchannel&amp;sid={$sid}">
					<table class="table table-striped" cellspacing="0">
							<tr>
								<td width="50%"><label for="new_cpid">{$lang['pid']}:</label></td>
								<td width="50%">
								<select class="form-control" id="new_cpid" name="settings[cpid]">
									<option value="0">{$lang['mainchannel']}</option>
									{foreach key=key item=value from=$channellist}
									<option value="{$value['cid']}">{$value['channel_name']}</option>
									{/foreach}
								</select>
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_name">{$lang['name']}:</label></td>
								<td><input type="text" class="form-control" id="new_channel_name" name="settings[channel_name]" value="" /></td>
							</tr>
							<tr>
								<td><label for="new_channel_topic">{$lang['topic']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_topic']) AND empty($permoverview['b_channel_create_with_topic'])}
									-
								{else}
									<input type="text" class="form-control" id="new_channel_topic" name="settings[channel_topic]" value="" />
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_description">{$lang['description']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_description']) AND empty($permoverview['b_channel_create_with_description'])}
									-
								{else}
									<input type="text" class="form-control" id="new_channel_description" name="settings[channel_description]" value="" />
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_codec">{$lang['codec']}:</label></td>
								<td>
									<select class="form-control" id="new_channel_codec" name="settings[channel_codec]">
									{if !isset($permoverview['b_channel_create_modify_with_codec_speex8']) OR $permoverview['b_channel_create_modify_with_codec_speex8']==1}
										<option value="0">{$lang['codec0']}</option>
									{/if}
									{if !isset($permoverview['b_channel_create_modify_with_codec_speex16']) OR $permoverview['b_channel_create_modify_with_codec_speex16']==1}
										<option value="1">{$lang['codec1']}</option>
									{/if}
									{if !isset($permoverview['b_channel_create_modify_with_codec_speex32']) OR $permoverview['b_channel_create_modify_with_codec_speex32']==1}
									<option value="2">{$lang['codec2']}</option>
									{/if}
									{if !isset($permoverview['b_channel_create_modify_with_codec_celtmono48']) OR $permoverview['b_channel_create_modify_with_codec_celtmono48']==1}
										<option value="3">{$lang['codec3']}</option>
									{/if}
									{if !isset($permoverview['b_channel_create_modify_with_codec_opusvoice']) OR $permoverview['b_channel_create_modify_with_codec_opusvoice']==1}
										<option value="3">{$lang['codec4']}</option>
									{/if}
									{if !isset($permoverview['b_channel_create_modify_with_codec_opusmusic']) OR $permoverview['b_channel_create_modify_with_codec_opusmusic']==1}
										<option value="3">{$lang['codec5']}</option>
									{/if}
									</select>
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_codec_quality">{$lang['codecquality']}:</label></td>
								<td>
								{if isset($permoverview['i_channel_create_modify_with_codec_maxquality']) AND empty($permoverview['i_channel_create_modify_with_codec_maxquality'])}
									-
								{else}
									<select id="new_channel_codec_quality" class="form-control" name="settings[channel_codec_quality]">
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_maxclients">{$lang['maxclients']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
									-
								{else}
									<input type="text" class="form-control" id="new_channel_maxclients" name="settings[channel_maxclients]" value="-1" />
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_maxfamilyclients">{$lang['maxfamilyclients']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_maxfamilyclients']) AND empty($permoverview['b_channel_create_with_maxfamilyclients'])}
									-
								{else}
									<input type="text" class="form-control" id="new_channel_maxfamilyclients" name="settings[channel_maxfamilyclients]" value="-1" />
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_chantyp_2">{$lang['type']}:</label></td>
								<td>
								{if !isset($permoverview['b_channel_create_semi_permanent']) OR $permoverview['b_channel_create_semi_permanent']==1}
									<div class="radio">
										<label>
											<input type="radio" name="chantyp" value="1" checked="checked" />
											{$lang['semipermanent']}
										</label>
									</div>
								{/if}
								{if !isset($permoverview['b_channel_create_permanent']) OR $permoverview['b_channel_create_permanent']==1}
									<div class="radio">
										<label>
											<input type="radio" id="new_chantyp_2" name="chantyp" value="2" />
											{$lang['permanent']}
										</label>
									</div>
								{/if}
								{if !isset($permoverview['b_channel_create_with_default']) OR $permoverview['b_channel_create_with_default']==1}
									<div class="radio">
										<label>
											<input type="radio" name="chantyp" value="3" />
											{$lang['default']}
										</label>
									</div>
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_flag_maxfamilyclients_inherited">{$lang['maxfamilyclientsinherited']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
									-
								{else}
									<select id="new_channel_flag_maxfamilyclients_inherited" class="form-control" name="settings[channel_flag_maxfamilyclients_inherited]">
									<option value="0">0</option>
									<option value="1">1</option>
									</select>
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_needed_talk_power">{$lang['neededtalkpower']}:</label></td>
								<td>
								{if isset($permoverview['b_channel_create_with_needed_talk_power']) AND empty($permoverview['b_channel_create_with_needed_talk_power'])}
									-
								{else}
									<input type="text" class="form-control" id="new_channel_needed_talk_power" name="settings[channel_needed_talk_power]" value="0" />
								{/if}
								</td>
							</tr>
							<tr>
								<td><label for="new_channel_name_phonetic">{$lang['phoneticname']}:</label></td>
								<td><input type="text" class="form-control" id="new_channel_name_phonetic" name="settings[channel_name_phonetic]" value="" /></td>
							</tr>
						</table>
					<input type="submit" name="createchannel" class="btn btn-flat btn-primary btn-block" value="{$lang['create']}" />
				</form>
			</div>
		</div>

	</div>
</section>
{/if}