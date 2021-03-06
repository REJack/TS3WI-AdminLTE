<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
	{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
	{/if}
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['filter']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=channeleditperm&amp;cid={$cid}&amp;sid={$sid}">
					<div class="col-lg-10 col-md-10 no-padding">
						<input type="text" name="searchperms" class="form-control" />					
					</div>
					<div class="col-lg-2 col-md-2 no-padding">
						<input type="submit" name="search" class="btn btn-info btn-flat btn-block" value="{$lang['search']}" />				
					</div>
				</form>
				<form method="post" action="index.php?site=channeleditperm&amp;cid={$cid}&amp;sid={$sid}">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="showmyperms" value="1" onchange="submit()" {if $showmyperms == 1}checked{/if} />{$lang['showgrantedonly']}
						</label>
					</div>
				</form>			
			</div>
		</div>
		<form method="post" action="index.php?site=channeleditperm&amp;sid={$sid}&amp;cid={$cid}">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">({$cid}) {$channelname} {$lang['permissionlist']}</h3>
				</div>
				<div class="box-body">
					<table data-spy="affix" data-offset-top="230" style="top: 50px; z-index: 1000;" class="table bg-white" id="TableHeader">
						<tr>
							<th style="width: 5%;">&nbsp;<a href="javascript:colapse_rows(0)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic0"></i></a></th>
							<th style="width: 10%;" class="text-center">{$lang['permid']}</th>
							<th>{$lang['permname']}</th>
							<th style="width: 5%;" class="text-center">{$lang['value']}</th>
							<th style="width: 10%;" class="text-center">{$lang['options']}</th>
							<th style="width: 7%;" class="text-center no-padding"><label for="granttoall">{$lang['grant']}</label><input type="text" class="form-control" id="granttoall" name="granttoall" style="vertical-align: middle;" colspan="2" class="no-padding text-center" maxlength="3" /></th>
						</tr>
					</table>
					<table class="table table-striped" id="TableContent">
					{foreach key=key item=value from=$allperms}
						{if $key == 0}
						<tr>
							<td colspan="6">
							&nbsp;<a href="javascript:colapse_rows(1)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic1"></i></a>&nbsp;{$lang['global']}
							</td>
						</tr>
						{/if}
						{if $key == 1}
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay1">
									<table class="table table-striped">
										<tr>
											<td style='width:5%'>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(2)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic2"></i></a>&nbsp;{$lang['information']}</td>
										</tr>
										<tr>
											<td colspan="6" class="no-padding">
												<div style="display:{$display}" id="Lay2">
													<table class="table table-striped">
											{/if}
											{if $key == 2}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(3)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic3"></i></a>&nbsp;{$lang['virtualservermanagement']}</td></tr>
										<tr>
											<td colspan="6" class="no-padding">
												<div style="display:{$display}" id="Lay3">
													<table class="table table-striped">
											{/if}
											{if $key == 3}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(4)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic4"></i></a>&nbsp;{$lang['administration']}</td>
										</tr>
										<tr>
											<td colspan="6" class="no-padding">
												<div style="display:{$display}" id="Lay4">
													<table class="table table-striped">
											{/if}
											{if $key == 4}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(5)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic5"></i></a>&nbsp;{$lang['settings']}</td>
										</tr>
										<tr>
											<td colspan="6" class="no-padding">
												<div style="display:{$display}" id="Lay5">
													<table class="table table-striped">
											{/if}
											{if $key == 5}
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;<a href="javascript:colapse_rows(6)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic6"></i></a>&nbsp;{$lang['virtualserver']}</td>
						</tr>
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay6">
									<table class="table table-striped">
										<tr>
											<td style='width:5%'>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(7)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic7"></i></a>&nbsp;{$lang['information']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay7">
													<table class="table table-striped">
											{/if}
											{if $key == 7}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(8)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic8"></i></a>&nbsp;{$lang['administration']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay8">
													<table class="table table-striped">
											{/if}
											{if $key == 8}
													</table>
												</div>
											</td>
										</tr>		
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(9)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic9"></i></a>&nbsp;{$lang['settings']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay9">
													<table class="table table-striped">
											{/if}
											{if $key == 9}
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;<a href="javascript:colapse_rows(10)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic10"></i></a>&nbsp;{$lang['channel']}</td>
						</tr>
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay10">
									<table class="table table-striped">
										{/if}
										{if $key == 10}
										<tr>
											<td style='width:51px'>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(11)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic11"></i></a>&nbsp;{$lang['information']}</td>
										</tr>
										<tr>
											<td colspan="6">
											<div style="display:{$display}" id="Lay11">
											<table class="table table-striped">
											{/if}
											{if $key == 11}
											</table>
											</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(12)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic12"></i></a>&nbsp;{$lang['create']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay12">
													<table class="table table-striped">
											{/if}
											{if $key == 12}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(13)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic13"></i></a>&nbsp;{$lang['modify']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay13">
													<table class="table table-striped">
											{/if}
											{if $key == 13}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(14)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic14"></i></a>&nbsp;{$lang['delete']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay14">
													<table class="table table-striped">
											{/if}
											{if $key == 14}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(15)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic15"></i></a>&nbsp;{$lang['access']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay15">
													<table class="table table-striped">
											{/if}
											{if $key == 15}
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;<a href="javascript:colapse_rows(16)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic16"></i></a>&nbsp;{$lang['group']}</td>
						</tr>
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay16">
									<table class="table table-striped">
										{/if}
										{if $key == 16}
										<tr>
											<td style='width:51px'>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(17)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic17"></i></a>&nbsp;{$lang['information']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay17">
													<table class="table table-striped">
											{/if}
											{if $key == 17}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(18)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic18"></i></a>&nbsp;{$lang['create']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay18">
													<table class="table table-striped">
											{/if}
											{if $key == 18}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(19)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic19"></i></a>&nbsp;{$lang['modify']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay19">
													<table class="table table-striped">
											{/if}
											{if $key == 19}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(20)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic20"></i></a>&nbsp;{$lang['delete']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay20">
													<table class="table table-striped">
											{/if}
											{if $key == 20}
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;<a href="javascript:colapse_rows(21)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic21"></i></a>&nbsp;{$lang['client']}</td>
						</tr>
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay21">
									<table class="table table-striped">
										{/if}
										{if $key == 21}
										<tr>
											<td style='width:51px'>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(22)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic22"></i></a>&nbsp;{$lang['information']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay22">
													<table class="table table-striped">
											{/if}
											{if $key == 22}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(23)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic23"></i></a>&nbsp;{$lang['admin']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay23">
													<table class="table table-striped">
											{/if}
											{if $key == 23}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(24)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic24"></i></a>&nbsp;{$lang['basics']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay24">
													<table class="table table-striped">
											{/if}
											{if $key == 24}
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td colspan="5">&nbsp;<a href="javascript:colapse_rows(25)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic25"></i></a>&nbsp;{$lang['modify']}</td>
										</tr>
										<tr>
											<td colspan="6">
												<div style="display:{$display}" id="Lay25">
													<table class="table table-striped">
											{/if}
											{if $key == 25}
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;<a href="javascript:colapse_rows(26)"><i class="mdi mdi-{$disp_pic}-box mdi-lg" title="aus/ein-klappen" id="Pic26"></i></a>&nbsp;{$lang['filetransfer']}</td>
						</tr>
						<tr>
							<td colspan="6" class="no-padding">
								<div style="display:{$display}" id="Lay26">
									<table class="table table-striped">
						{/if}
						{foreach key=key2 item=value2 from=$value.permissions}
							{if $showmyperms == 0 AND empty($searchperms) OR $showmyperms == 1 AND $value2['available'] == 1 OR $showmyperms == 0 AND $value2['permname']|strpos:{$searchperms} !== false OR $showmyperms == 0 AND $value2['permid']|strpos:{$searchperms} !== false}
							<tr>
								<td style="width: 5%">&nbsp;</td>
								<td style="width: 10%; vertical-align: middle;" class="text-center">{$value2['permid']}</td>
								<td >{$value2['permname']} <br />({$value2['permdesc']})</td>
								<td style="width: 10%; vertical-align: middle;" class="text-center no-padding">
								{if $value2['permname']|substr:0:2 != 'i_'}
									<input type='checkbox' {if $value2['permvalue'] == 1}checked{/if} name="perm[{$value2['permid']}][value]" value="1" />
								{else}
									<input class="form-control" {if $value2['permname'] == 'i_icon_id'}id="iconid"{/if} type='text' name="perm[{$value2['permid']}][value]" value="{$value2['permvalue']}" />
									{if $value2['permname'] == 'i_icon_id'}<a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}');">{$lang['set']}</a>{/if}
								{/if}
								</td>
								<td style="width:10%; vertical-align: middle;" class="text-center">
								{if $value2['available'] == 1}
									<input type='hidden' name="perm[{$value2['permid']}][available]" value='1' /> 
									<div class="checkbox">
										<label>
											<input type='checkbox' name="perm[{$value2['permid']}][delperm]" value='1' /> {$lang['delete']}
										</label>
									</div>
								{/if}
								</td>
								<td style="width: 7%; vertical-align: middle;" class="text-center no-padding">
									<input type='text' class="form-control" maxlength="3" name="perm[{$value2['grantpermid']}][value]" value="{$value2['grant']}" />
									<input type='hidden' name="perm[{$value2['grantpermid']}][grant]" value='1' /> 
								{if $value2['grantav'] == 1}
									<input type='hidden' name="perm[{$value2['grantpermid']}][available]" value='1' /> 
									<div class="checkbox">
										<label>
											<input type='checkbox' name="perm[{$value2['grantpermid']}][delperm]" value='1' /> {$lang['delete']}
										</label>
									</div>
								{/if}
								</td>
							</tr>
							{/if}
						{/foreach}
					{/foreach}
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<input type="hidden" name="showmyperms" value="{$showmyperms}" />
								<input type="submit" class="btn btn-block btn-flat btn-primary" name="editall" value="{$lang['edit']}" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
</section>