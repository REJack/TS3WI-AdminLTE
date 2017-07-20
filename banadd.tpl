{if isset($permoverview['b_client_ban_create']) AND empty($permoverview['b_client_ban_create'])}
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
				<h3 class="box-title">{$lang['addban']}</h3>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=banadd&amp;sid={$sid}">
					<table class="table">
						<tr>
							<th><label for="new_banip">{$lang['ip']}</label></th>
							<td><input type="text" id="new_banip" class="form-control" name="banip" value="" /></td>
						</tr>
						<tr>
							<th><label for="new_banname">{$lang['name']}</label></th>
							<td><input type="text" id="new_banname" class="form-control" name="banname" value="" /></td>
						</tr>
						<tr>
							<th><label for="new_banuid">{$lang['uniqueid']}</label></th>
							<td><input type="text" id="new_banuid" class="form-control" name="banuid" value="" /></td>
						</tr>
						<tr>
							<th><label for="new_reason">{$lang['reason']}</label></th>
							<td><input type="text" id="new_reason" class="form-control" name="reason" value="" /></td>
						</tr>
						<tr>
							<th><label for="new_bantime">{$lang['bantime']}</label></th>
							<td>
								<div class="input-group">
									<input type="text" id="new_bantime" class="form-control" name="bantime" value="" required />
									<span class="input-group-addon">{$lang['seconds']}</span>
								</div>

							</td>
						</tr>
					</table>
					<input class="btn btn-primary btn-block btn-flat" type="submit" name="addban" value="{$lang['ban']}" />
				</form>
			</div>
		</div>
	</div>
</section>
{/if}