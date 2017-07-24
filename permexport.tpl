<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		{if !empty($error)}
		<div class="alert alert-danger">{$error}</div>
		{/if}
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['permexport']}</h3>
			</div>
			<div class="box-body">
				<p>{$lang['permexdesc']}</p>
				<form method="post" action="index.php?site=permexport&amp;sid={$sid}">
					<table class="table table-striped">
						<tr>
							<th><label for="new_sourcemode">{$lang['sourcetype']}</label></th>
							<td>
								<select class="form-control" id="new_sourcemode" name="sourcemode">
									<option value="1">{$lang['servergroup']}</option>
									<option value="2">{$lang['channelgroup']}</option>
									<option value="3">{$lang['channel']}</option>
									<option value="4">{$lang['client']}</option>
								</select> 
							</td>
						</tr>
						<tr>
							<th><label for="new_sourceid">{$lang['sourceid']}</label></th>
							<td><input type="text" class="form-control" id="new_sourceid" name="sourceid" /></td>
						</tr>
						<tr>
							<th><label for="new_targetmode">{$lang['targettype']}</label></th>
							<td>
								<select class="form-control" id="new_targetmode" name="targetmode">
									<option value="1">{$lang['servergroup']}</option>
									<option value="2">{$lang['channelgroup']}</option>
									<option value="3">{$lang['channel']}</option>
									<option value="4">{$lang['client']}</option>
								</select> 
							</td>
						</tr>
						<tr>
							<th><label for="new_targetid">{$lang['targetid']}</label></th>
							<td><input type="text" name="targetid" class="form-control" id="new_targetid" value="" /></td>
						</tr>
					</table>
					<input class="btn btn-primary btn-flat btn-block" type="submit" name="showcommands" value="{$lang['view']}" />
					{if isset($smarty.post.showcommands) AND empty($error)}
					<textarea name="showfield" cols="50" rows="10" readonly class="form-control resize-vert">{$permexport}</textarea>
					{/if}
				</form>
			</div>
		</div>
	</div>
</section>