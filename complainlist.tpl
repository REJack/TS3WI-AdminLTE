{if isset($permoverview['b_client_complain_list']) AND empty($permoverview['b_client_complain_list'])}
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
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['complainlist']}</h3>
			</div>
			<table class="table" cellpadding="1" cellspacing="0">
				<tr>
					<th style="width: 20%">{$lang['targetnick']}</th>
					<th style="width: 20%">{$lang['sourcenick']}</th>
					<th>{$lang['reason']}</th>
					<th style="width: 15%"></th>
				</tr>
					{assign var=i value="1"}
					{foreach key=key item=value from=$newcomplainlist}
						{foreach key=key2 item=value2 from=$value}
							<tr>
								<td>
									<a href="javascript:Klappen('{$i}')"><i class="mdi mdi-plus-box mdi-lg" title="aus/ein-klappen" id="Pic{$i}"></i></a>
									{$key2}
								</td>
								<td> &nbsp;</td>
								<td> {sprintf($lang['countcomplain'], count($value2))}</td>
								<td> 
								{if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
									<form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
										<input type="hidden" name="tcldbid" value="{$key}" />
										<input class="btn btn-flat btn-block btn-danger" type="submit" name="delall" value="{$lang['delall']}" />
									</form>
								{/if}
								</td>
							</tr>
							<tr>
								<td colspan="4" class="no-padding">
									<table class="table" id="Lay{$i}" style="display:none;">
									{foreach key=key3 item=value3 from=$value2}
										<tr>
											<td style="width: 20%;">&nbsp;{date("d.m.Y - H:i", $value3['timestamp'])}</td>
											<td style="width: 20%;">{secure($value3['fname'])}</td>
											<td >{secure($value3['message'])}</td>
											<td style="width: 15%;">
											{if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
												<form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
													<input type="hidden" name="tcldbid" value="{$key}" />
													<input type="hidden" name="fcldbid" value="{$key3}" />
													<input class="btn btn-flat btn-block btn-danger" type="submit" name="delete" value="{$lang['delete']}" />
												</form>
											{/if}
											</td>
										</tr>
									{/foreach}
									</table>
								</td>
							</tr>
						{/foreach}
						{assign var=i value="`$i+1`"}
					{/foreach}
			</table>
		</div>
	{/if}
	</div>
</section>