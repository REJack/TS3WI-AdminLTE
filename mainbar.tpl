{if $loginstatus === true}
	<li class="header">{$lang['server']}</li>
{if $hoststatus === true}
	<li><a href="index.php?site=server"><i class="mdi mdi-server mdi-lg"></i> <span>{$lang['serverlist']}</span></a></li>
{/if}
{if !isset($sid) AND $hoststatus === true}
	<li><a href="index.php?site=createserver"><i class="mdi mdi-server-plus mdi-lg"></i> {$lang['createserver']}</a></li>
	<li><a href="index.php?site=servertraffic"><i class="mdi mdi-server-network mdi-lg"></i> {$lang['instancetraffic']}</a></li>
	<li><a href="index.php?site=instanceedit"><i class="mdi mdi-pencil mdi-lg"></i> {$lang['instanceedit']}</a></li>
	<li><a href="index.php?site=logview"><i class="mdi mdi-format-list-bulleted mdi-lg"></i> {$lang['logview']}</a></li>
	<li><a href="index.php?site=iserverbackup"><i class="mdi mdi-backup-restore mdi-lg"></i> {$lang['instancebackup']}</a></li>
{/if}
{if isset($sid)}
	<li><a href="index.php?site=serverview&amp;sid={$sid}"><i class="mdi mdi-information-variant mdi-lg"></i> {$lang['serverview']}</a></li>
	<li><a href="index.php?site=servertraffic&amp;sid={$sid}"><i class="mdi mdi-server-network mdi-lg"></i> {$lang['virtualtraffic']}</a></li>
	<li><a href="index.php?site=serveredit&amp;sid={$sid}"><i class="mdi mdi-server-edit mdi-lg"></i> {$lang['serveredit']}</a></li>
	<li><a href="index.php?site=temppw&amp;sid={$sid}"><i class="mdi mdi-lock mdi-lg"></i> {$lang['temppw']}</a></li>
	<li><a href="index.php?site=fileupload&amp;sid={$sid}"><i class="mdi mdi-upload mdi-lg"></i>{$lang['iconupload']}</a></li>
	<li><a href="index.php?site=logview&amp;sid={$sid}"><i class="mdi mdi-format-list-bulleted mdi-lg"></i>{$lang['logview']}</a></li>
	<li><a href="index.php?site=filelist&amp;sid={$sid}"><i class="mdi mdi-file-multiple mdi-lg"></i> {$lang['filelist']}</a></li>
	<li><a href="javascript:oeffnefenster('site/interactive.php?sid={$sid}&amp;action=action');"><i class="mdi mdi-checkbox-multiple-marked mdi-lg"></i> {$lang['massaction']}</a></li>
	<li class="header">{$lang['channel']}</li>
	<li><a href="index.php?site=channel&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-outline mdi-lg"></i> {$lang['channellist']}</a></li>
{if isset($cid)}
	<li><a href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$cid}"><i class="mdi mdi-comment-alert-outline mdi-lg"></i> {$lang['channelview']}</a></li>
{/if}
{if isset($cid)}
	<li><a href="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}"><i class="mdi mdi-comment-processing-outline mdi-lg"></i> {$lang['channeledit']}</a></li>
{/if}
	<li><a href="index.php?site=createchannel&amp;sid={$sid}"><i class="mdi mdi-comment-plus-outline mdi-lg"></i> {$lang['createchannel']}</a></li>
	<li class="header">{$lang['clients']}</li>
	<li><a href="index.php?site=counter&amp;sid={$sid}"><i class="mdi mdi-account-multiple-star mdi-lg"></i> {$lang['clientcounter']}</a></li>
	<li><a href="index.php?site=clients&amp;sid={$sid}"><i class="mdi mdi-account-multiple mdi-lg"></i> {$lang['clientlist']}</a></li>
	<li><a href="index.php?site=complainlist&amp;sid={$sid}"><i class="mdi mdi-account-alert mdi-lg"></i> {$lang['complainlist']}</a></li>
	<li><a href="index.php?site=chanclienteditperm&amp;sid={$sid}"><i class="mdi mdi-comment-account-outline mdi-lg"></i> {$lang['chanclientperms']}</a></li>
	<li><a href="index.php?site=clientcleaner&amp;sid={$sid}"><i class="mdi mdi-account-multiple-minus mdi-lg"></i> {$lang['clientcleaner']}</a></li>
	<li class="header">{$lang['bans']}</li>
	<li><a href="index.php?site=banlist&amp;sid={$sid}"><i class="mdi mdi-account-multiple-off mdi-lg"></i> {$lang['banlist']}</a></li>
	<li><a href="index.php?site=banadd&amp;sid={$sid}"><i class="mdi mdi-account-off-plus mdi-lg"></i> {$lang['addban']}</a></li>
	<li class="header">{$lang['groups']}</li>
	<li><a href="index.php?site=sgroups&amp;sid={$sid}"><i class="mdi mdi-server-account mdi-lg"></i> {$lang['servergroups']}</a></li>
	<li><a href="index.php?site=sgroupadd&amp;sid={$sid}"><i class="mdi mdi-server-account-plus mdi-lg"></i> {$lang['addservergroup']}</a></li>
	<li><a href="index.php?site=cgroups&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-account-outline mdi-lg"></i>{$lang['channelgroups']}</a></li>
	<li><a href="index.php?site=cgroupadd&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-account-plus-outline mdi-lg"></i> {$lang['addchannelgroup']}</a></li>
	<li class="header">{$lang['token']}</li>
	<li><a href="index.php?site=token&amp;sid={$sid}"><i class="mdi mdi-key-variant mdi-lg"></i> {$lang['token']}</a></li>
	<li class="header">{$lang['backup']}</li>
	<li><a href="index.php?site=backup&amp;sid={$sid}"><i class="mdi mdi-comment-download-outline mdi-lg"></i> {$lang['chanbackups']}</a></li>
	<li><a href="index.php?site=serverbackup&amp;sid={$sid}"><i class="mdi mdi-server-download  mdi-lg"></i> {$lang['serverbackups']}</a></li>
	<li><a href="index.php?site=permexport&amp;sid={$sid}"><i class="mdi mdi-format-section-download mdi-lg"></i> {$lang['permexport']}</a></li>
	<li><a href="index.php?site=clientsexport&amp;sid={$sid}"><i class="mdi mdi-account-multiple-download mdi-lg"></i> {$lang['clientsexport']}</a></li>
	<li><a href="index.php?site=bansexport&amp;sid={$sid}"><i class="mdi mdi-account-off-download mdi-lg"></i> {$lang['bansexport']}</a></li>
	<li class="header">{$lang['console']}</li>
	<li><a href="index.php?site=console&amp;sid={$sid}"><i class="mdi mdi-console-line mdi-lg"></i> {$lang['queryconsole']}</a></li>
{/if}
{/if}