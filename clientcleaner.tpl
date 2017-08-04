<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1 no-padding">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		{if !empty($noerror)}
		<div class="alert alert-info">{$noerror}</div>
		{/if}
		{if isset($deleted)}
		<div class="alert alert-success">{$deleted}</div>
		{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['clientcleaner']}</h3>
			</div>
			<div class="box-body">
				<form method="post" class="form-inline" action="index.php?site=clientcleaner&amp;sid={$sid}">
					<table class="table">
						<tr>
							<td><label>{$lang['deleteallclientsoffline']}<input class="form-control" type="text" name="number" value="30"<td style="vertical-align: middle;" colspan="2" class="no-padding text-center">/>{$lang['deleteallclientsoffline2']}</label></td>
						</tr>
						<tr>
							<td>{$lang['checkgroupsprotected']}</td>
						</tr>
						<tr>
							<td>
								{foreach key=key item=value from=$sgrouplist}
								<div class="checkbox">
									<label>
										<input type="checkbox" name="sgroups[]" value="{$value.sgid}" />
										{$value.name}
									</label>
								</div>
								<br />
								{/foreach}
							</td>
						</tr>
						<tr>
							<td><input type="submit" class="btn btn-primary btn-flat btn-block" name="cleanit" value="{$lang['clean']}" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>