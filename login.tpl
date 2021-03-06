{if $loginstatus === true}
<section class="content container-fluid">
{/if}
{if !empty($error)}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if !empty($motd)}
	<div class="alert alert-info">
		<b>{$lang['motd']}</b><br />
		<p>{$motd}</p>
	</div>
{/if}
{if !isset($smarty.post.sendlogin) AND $loginstatus !== true}
	<form method="post" action="index.php?site=login">
		<div class="form-group has-feedback">
		{if count($instances) == 1}
			{foreach key=skey item=sdata from=$instances}
				<select class="form-control" name="skey" disabled>
					<option value="{$skey}" disabled selected>{$sdata['alias']}</option>	
				</select>
				<input type="hidden" name="skey" value="{$skey}" />
			{/foreach}
		{else}
			<select class="form-control" name="skey" required>
			{foreach key=skey item=sdata from=$instances}
				<option value="{$skey}">{$sdata['alias']}</option>	
			{/foreach}
			</select>
		{/if}
		</div>
		<div class="form-group has-feedback">
			<input type="text" class="form-control" name="loginUser" value="serveradmin" title="{$lang['username']}" required>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" class="form-control" name="loginPw" title="{$lang['password']}" required>
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<input type="submit" class="btn btn-primary btn-block btn-flat" name="sendlogin" value="{$lang['login']}" />
	</form>
{/if}
{if $loginstatus === true}
</section>
{/if}