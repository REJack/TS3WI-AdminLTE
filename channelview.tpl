{if isset($permoverview['b_virtualserver_channel_list']) AND empty($permoverview['b_virtualserver_channel_list'])}
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
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['channelinfo']}</h3>
			</div>
			<div class="box-body">
				<table class="table table-striped">
					<tr>
						<td width="50%"><b>{$lang['name']}:</b></td>
						<td width="50%">{$channelinfo['channel_name']}</td>
					</tr>
					<tr>
						<td><b>{$lang['topic']}:</b></td>
						<td>{if isset($channelinfo['channel_topic'])}{$channelinfo['channel_topic']}{/if}</td>
					</tr>
					<tr>
						<td><b>{$lang['description']}:</b></td>
						<td>{if isset($channelinfo['channel_description'])}{$channelinfo['channel_description']}{/if}</td>
					</tr>
					<tr>
						<td><b>{$lang['passwordset']}:</b></td>
						<td>
						{if $channelinfo['channel_flag_password'] == '1'}
							{$lang['yes']}
						{else}
							{$lang['no']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['default']}:</b></td>
						<td> 
						{if $channelinfo['channel_flag_default'] == '1'}
							{$lang['yes']}
						{else}
							{$lang['no']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['maxclients']}:</b></td>
						<td>
						{if $channelinfo['channel_maxclients'] == '-1'}
							{$lang['unlimited']}
						{else}
							{$channelinfo['channel_maxclients']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['maxfamilyclients']}:</b></td>
						<td>
						{if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '1'}
							{$lang['inherited']}
						{elseif $channelinfo['channel_flag_maxfamilyclients_unlimited'] == '1'}
							{$lang['unlimited']}
						{else}
							{$channelinfo['channel_maxfamilyclients']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['codec']}:</b></td>
						<td>
						{if $channelinfo['channel_codec'] == '0'}
							{$lang['codec0']}
						{elseif $channelinfo['channel_codec'] == '1'}
							{$lang['codec1']}
						{elseif $channelinfo['channel_codec']=='2'}
							{$lang['codec2']}
						{elseif $channelinfo['channel_codec']=='3'}
							{$lang['codec3']}
						{elseif $channelinfo['channel_codec']=='4'}
							{$lang['codec4']}
						{elseif $channelinfo['channel_codec']=='5'}
							{$lang['codec5']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['codecquality']}:</b></td>
						<td>{$channelinfo['channel_codec_quality']}</td>
					</tr>
					<tr>
						<td><b>{$lang['codecunencrypted']}</b></td>
						<td>
						{if $channelinfo['channel_codec_is_unencrypted']=='1'}
						{$lang['yes']}
						{elseif $channelinfo['channel_codec_is_unencrypted']=='0'}
						{$lang['no']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['neededtalkpower']}:</b></td>
						<td>{$channelinfo['channel_needed_talk_power']}</td>
					</tr>
					<tr>
						<td><b>{$lang['forcedsilence']}:</b></td>
						<td>
						{if $channelinfo['channel_forced_silence'] == '1'}
							{$lang['yes']}
						{else}
							{$lang['no']}
						{/if}
						</td>
					</tr>
					<tr>
						<td><b>{$lang['iconid']}</b></td>
						<td>{$channelinfo['channel_icon_id']}</td>
					</tr>
					<tr>
						<td><b>{$lang['phoneticname']}</b></td>
						<td>{if isset($channelinfo['channel_name_phonetic'])}{$channelinfo['channel_name_phonetic']}{/if}</td>
					</tr>
				</table>
			</div>
		</div>
{/if}
</div>
</section>