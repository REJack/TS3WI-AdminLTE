<section class="content container-fluid">
	<div class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 no-padding">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['clientsexport']}</h3>
			</div>
			<div class="box-body">
				<p>{$lang['clientsexportdesc']}</p>
				<form method="post" action="site/clientsexport.php" target="_blank">
					<input type="hidden" name="sid" value="{$sid}" />
					<input class="btn btn-primary btn-flat btn-block" type="submit" name="give" value="{$lang['clientsexport']}" />					
				</form>
			</div>
		</div>
	</div>
</section>