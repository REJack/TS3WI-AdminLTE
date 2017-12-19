<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-primary">
			<div class="box-header">
				<label for="new_command">
					<h3 class="box-title">{$lang['queryconsole']} <small>{$lang['inputbox']}</small></h3>
				</label>
			</div>
			<div class="box-body">
				<form method="post" action="index.php?site=console&amp;sid={$sid}">
					<textarea name="command" id="new_command" class="form-control resize-vert" rows="3"></textarea>
					<input class="btn btn-primary btn-flat btn-block" type="submit" name="execute" value="{$lang['execute']}" />
				</form>
			</div>
		</div>
		<div class="box box-default">
			<div class="box-header">
				<label for="output">
					<h3 class="box-title">{$lang['queryconsole']} - {$lang['outputbox']}</h3>
				</label>
			</div>
			<div class="box-body">
				<textarea name="output" id="output" rows="10" class="form-control resize-vert" readonly>{$showOutput}</textarea>	
			</div>
		</div>
	</div>
</section>