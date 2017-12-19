<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding" style="position: relative;">
{if $hoststatus === false AND $serverhost === true}
	<div class="alert alert-warning">{$lang['nohoster']}</div>
{else}
{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if !empty($noerror)}
	<div class="alert alert-info">{$noerror}</div>
{/if}
{if !isset($smarty.post.createserver) OR !empty($error)}
	<form id="createserver" method="post" action="index.php?site=createserver">
		<input type="hidden" name="createserver">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['createnewserver']}<br /><small class="no-br">{$lang['createserverdesc']}</small></h3>
			</div>
			<div class="box-body">
				<div id="smartwizard">
					<ul>
						<li><a href="#step-1">{$lang['basics']}</a></li>
						<li><a href="#step-2">{$lang['autoban']}</a></li>
						<li><a href="#step-3">{$lang['host']}</a></li>
						<li><a href="#step-4">{$lang['antiflood']}</a></li>
						<li><a href="#step-5">{$lang['transfers']}</a></li>
						<li><a href="#step-6">{$lang['logs']}</a></li>
					</ul>
					<div>
						<div id="step-1" class="">
							<div class="form-group">
								<label for="new_virtualserver_name">{$lang['name']}: </label>
								<input type="text" class="form-control" id="new_virtualserver_name" name="newsettings[virtualserver_name]" value="{$screate_tmp['name']}" required />
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_port">{$lang['port']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_port" name="newsettings[virtualserver_port]" value="{$screate_tmp['port']}" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_min_client_version">{$lang['minclientversion']}:</label>
										<input type="number" step="1" min="0" class="form-control" id="new_virtualserver_min_client_version" name="newsettings[virtualserver_min_client_version]" value="{$screate_tmp['minclientversion']}"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_welcomemessage">{$lang['welcomemsg']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_welcomemessage" name="newsettings[virtualserver_welcomemessage]" value="{$screate_tmp['welcomemsg']}"/>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_maxclients">{$lang['maxclients']}:</label>
										<input type="number" step="1" min="1" class="form-control" id="new_virtualserver_maxclients" name="newsettings[virtualserver_maxclients]" value="{$screate_tmp['maxclients']}"/>
									</div>		                	
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_reserved_slots">{$lang['maxreservedslots']}:</label>
										<input type="number" step="1" min="0" class="form-control" id="new_virtualserver_reserved_slots" name="newsettings[virtualserver_reserved_slots]" value="{$screate_tmp['reservedslots']}"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_weblist_enabled">{$lang['showonweblist']}:</label>
										<select class="form-control" name="newsettings[virtualserver_weblist_enabled]" id="new_virtualserver_weblist_enabled">
											<option value="1" {if $serverinfo['virtualserver_weblist_enabled'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
											<option value="0" {if $serverinfo['virtualserver_weblist_enabled'] == 0}selected="selected"{/if}>{$lang['no']}</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_password">{$lang['password']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_password" name="newsettings[virtualserver_password]" value="{$screate_tmp['password']}"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_needed_identity_security_level">{$lang['securitylevel']}:</label>
										<input type="number" step="1" min="1" class="form-control" id="new_virtualserver_needed_identity_security_level" name="newsettings[virtualserver_needed_identity_security_level]" value="{$screate_tmp['securitylvl']}"/>
									</div>		                	
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_min_clients_in_channel_before_forced_silence">{$lang['minclientschan']}:</label>
										<input type="number" step="1" min="1" class="form-control" id="new_virtualserver_min_clients_in_channel_before_forced_silence" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$screate_tmp['forcesilence']}"/>
									</div>
								</div>
							</div>
						</div>
						<div id="step-2" class="">
							<div class="form-group">
								<label for="new_virtualserver_complain_autoban_count">{$lang['autobancount']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_complain_autoban_count" name="newsettings[virtualserver_complain_autoban_count]" value="{$screate_tmp['autobancount']}"/>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_complain_autoban_time">{$lang['autobantime']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_complain_autoban_time" name="newsettings[virtualserver_complain_autoban_time]" value="{$screate_tmp['autobantime']}"/>
									<span class="input-group-addon">{$lang['seconds']}</span>
								</div>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_complain_remove_time">{$lang['removetime']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_complain_remove_time" name="newsettings[virtualserver_complain_remove_time]" value="{$screate_tmp['removetime']}"/>
									<span class="input-group-addon">{$lang['seconds']}</span>
								</div>
							</div>	
						</div>
						<div id="step-3" class="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_hostmessage">{$lang['hostmessage']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostmessage" name="newsettings[virtualserver_hostmessage]" value="{$screate_tmp['hostmsg']}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_hostmessage_mode">{$lang['hostmessageshow']}:</label>
										<select class="form-control" id="new_virtualserver_hostmessage_mode" name="newsettings[virtualserver_hostmessage_mode]">
											<option value="0" {if $serverinfo['virtualserver_hostmessage_mode'] == 0}selected='selected'{/if}>{$lang['nomessage']}</option>
											<option value="1" {if $serverinfo['virtualserver_hostmessage_mode'] == 1}selected='selected'{/if}>{$lang['showmessagelog']}</option>
											<option value="2" {if $serverinfo['virtualserver_hostmessage_mode'] == 2}selected='selected'{/if}>{$lang['showmodalmessage']}</option>
											<option value="3" {if $serverinfo['virtualserver_hostmessage_mode'] == 3}selected='selected'{/if}>{$lang['modalandexit']}</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label for="new_virtualserver_hostbanner_url">{$lang['hosturl']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostbanner_url" name="newsettings[virtualserver_hostbanner_url]" value="{$screate_tmp['hosturl']}"/>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label for="new_virtualserver_hostbanner_gfx_url">{$lang['hostbannerurl']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostbanner_gfx_url" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$screate_tmp['hostbannerurl']}"/>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="new_virtualserver_hostbanner_gfx_interval">{$lang['hostbannerintval']}:</label>
										<input type="number" step="1" min="0" max="60" class="form-control" id="new_virtualserver_hostbanner_gfx_interval" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$screate_tmp['hostbannerint']}"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group no-margin">
										<label for="new_virtualserver_hostbutton_gfx_url">{$lang['hostbuttongfx']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostbutton_gfx_url" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$screate_tmp['hostbuttongfx']}"/>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group no-margin">
										<label for="new_virtualserver_hostbutton_tooltip">{$lang['hostbuttontooltip']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostbutton_tooltip" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$screate_tmp['hostbuttontip']}"/>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group no-margin">
										<label for="new_virtualserver_hostbutton_url">{$lang['hostbuttonurl']}:</label>
										<input type="text" class="form-control" id="new_virtualserver_hostbutton_url" name="newsettings[virtualserver_hostbutton_url]" value="{$screate_tmp['hostbuttonurl']}"/>
									</div>
								</div>
							</div>		                		
						</div>
						<div id="step-4" class="">
							<div class="form-group">
								<label for="new_virtualserver_antiflood_points_tick_reduce">{$lang['pointstickreduce']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_tick_reduce" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$screate_tmp['pointstickreduce']}"/>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_antiflood_points_needed_command_block">{$lang['pointsneededblockcmd']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_command_block" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$screate_tmp['pointsneededblockcmd']}"/>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_antiflood_points_needed_ip_block">{$lang['pointsneededblockip']}:</label>
								<input type="text" class="form-control" id="new_virtualserver_antiflood_points_needed_ip_block" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$screate_tmp['pointsneededblockip']}"/>
							</div>
						</div>
						<div id="step-5" class="">
							<div class="form-group">
								<label for="new_virtualserver_max_upload_total_bandwidth">{$lang['upbandlimit']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_max_upload_total_bandwidth" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$screate_tmp['uploadbandwidthlimit']}"/> 
									<span class="input-group-addon">Byte/s</span>
								</div>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_upload_quota">{$lang['uploadquota']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_upload_quota" name="newsettings[virtualserver_upload_quota]" value="{$screate_tmp['uploadquota']}"/> 
									<span class="input-group-addon">MiB</span>
								</div>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_max_download_total_bandwidth">{$lang['downbandlimit']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_max_download_total_bandwidth" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$screate_tmp['downloadbandwidthlimit']}"/> 
									<span class="input-group-addon">Byte/s</span>
								</div>
							</div>
							<div class="form-group">
								<label for="new_virtualserver_download_quota">{$lang['downloadquota']}:</label>
								<div class="input-group">
									<input type="text" class="form-control" id="new_virtualserver_download_quota" name="newsettings[virtualserver_download_quota]" value="{$screate_tmp['downloadquota']}"/>
									<span class="input-group-addon">MiB</span>
								</div>
							</div>
						</div>
						<div id="step-6" class="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_client">{$lang['logclient']}:</label>
										<input type="checkbox" id="new_virtualserver_log_client" name="newsettings[virtualserver_log_client]" value="1" {if $screate_tmp['virtualserver_log_client'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_query">{$lang['logquery']}:</label>
										<input type="checkbox" id="new_virtualserver_log_query" name="newsettings[virtualserver_log_query]" value="1" {if $screate_tmp['virtualserver_log_query'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_channel">{$lang['logchannel']}:</label>				
										<input type="checkbox" id="new_virtualserver_log_channel" name="newsettings[virtualserver_log_channel]" value="1" {if $screate_tmp['virtualserver_log_channel'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_permissions">{$lang['logpermissions']}:</label>
										<input type="checkbox" id="new_virtualserver_log_permissions" name="newsettings[virtualserver_log_permissions]" value="1" {if $screate_tmp['virtualserver_log_permissions'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_server">{$lang['logserver']}:</label>
										<input type="checkbox" id="new_virtualserver_log_server" name="newsettings[virtualserver_log_server]" value="1" {if $screate_tmp['virtualserver_log_server'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="new_virtualserver_log_filetransfer">{$lang['logfiletransfer']}:</label>
										<input type="checkbox" id="new_virtualserver_log_filetransfer" name="newsettings[virtualserver_log_filetransfer]" value="1" {if $screate_tmp['virtualserver_log_filetransfer'] === '1'}checked{/if} data-toggle="toggle" data-width="100%" data-onstyle="primary" data-offstyle="warning" data-size="small" data-on="{$lang['yes']}" data-off="{$lang['no']}"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
			var btnFinish = $('<inout type="submit"/>').text('{$lang['createserver']}').addClass('btn btn-success btn-flat').on('click', function(e){
					e.preventDefault(); 
					var elmForm = $("#createserver");
					elmForm.validator('validate'); 
					var elmErr = elmForm.find('.has-error');
					if(elmErr && elmErr.length > 0){
						$('.has-error').each(function(key, item){
							var step = $(item).parent('.step-content').attr('id');
							$('a[href="#' +step+ '"]').parent('li').addClass('danger');
						});
						return false;
					}else{
						$('#createserver').submit();
						return false;
					}
				});
				$('#smartwizard').smartWizard({ 
					enableAllSteps: true,
					showStepURLhash: false,
					lang: {
						next:  nextText,
						previous: previousText,
					}
				});
				$('#smartwizard .sw-toolbar-bottom').addClass('no-padding');
				$('#smartwizard .sw-btn-group').append(btnFinish);
				$('#smartwizard .sw-btn-next').addClass('btn-flat');
				$('#smartwizard .sw-btn-prev').addClass('btn-flat'); 

			});   
		</script>  
		</form>
{/if}
{/if}
	</div>
</section>