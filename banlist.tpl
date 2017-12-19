{if isset($permoverview['b_client_ban_list']) AND empty($permoverview['b_client_ban_list'])}
<section class="content container-fluid">
	<div class="row">
		<div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
			<div class="box box-danger">
				<div class="box-header"><h3 class="box-title">{$lang['error']}</h3></div>
				<div class="box-body">
					<p class="lead">{$lang['nopermissions']}</p>
				</div>
			</div>
		</div>
	</div>
</section>
{else}
<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['banlist']}</h3>
			</div>
			<div class="box-body">
				<table class="table">
					<tr>
						<th class="text-center">{$lang['banid']}</th>
						<th class="text-center">{$lang['ip']}/{$lang['name']}/{$lang['uniqueid']}</th>
						<th class="text-center">{$lang['created']}</th>
						<th class="text-center">{$lang['invokername']}</th>
						<th class="text-center">{$lang['invokeruid']}</th>
						<th class="text-center">{$lang['reason']}</th>
						<th class="text-center">{$lang['length']}</th>
						<th class="text-center">{$lang['enforcement']}</th>
						<th></th>
					</tr>
					{if !empty($banlist)}
						{foreach key=key item=value from=$banlist}
							<tr>
								<td style="vertical-align: middle;" class="text-center">{$value['banid']}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['ip']}{$value['name']}{$value['uid']}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
								<td style="vertical-align: middle;" class="text-center">{secure($value['invokername'])}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['invokeruid']}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['reason']}</td>
								<td style="vertical-align: middle;" class="text-center">{if isset($value['duration'])} {$value['duration']}{else}0{/if}</td>
								<td style="vertical-align: middle;" class="text-center">{$value['enforcement']}</td>
								<td style="vertical-align: middle;" class="text-center no-padding">
								{if !isset($permoverview['b_client_ban_delete']) OR $permoverview['b_client_ban_delete'] == 1}
								<form method="post" action="index.php?site=banlist&amp;sid={$sid}">
									<input type="hidden" name="banid" value="{$value['banid']}" />
									<input class="btn btn-danger btn-flat" type="submit" name="unban" value="Unban" />
								</form>
								{/if}
								</td>
							</tr>
							{assign var=change_col value="`$change_col+1`"}
						{/foreach}
					{/if}
				</table>
			</div>
		</div>
	</div>
</section>
{/if}