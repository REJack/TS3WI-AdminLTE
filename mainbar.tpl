{if $loginstatus === true}
	<li class="header">{$lang['server']}</li>
{if $hoststatus === true}
	<li><a href="index.php?site=server"><i class="mdi mdi-server mdi-lg"></i> <span>{$lang['serverlist']}</span></a></li>
{/if}
{if !isset($sid) AND $hoststatus === true}
	<li><a href="index.php?site=createserver"><i class="mdi mdi-server-plus mdi-lg"></i> <span>{$lang['createserver']}</span></a></li>
	<li><a href="index.php?site=servertraffic"><i class="mdi mdi-server-network mdi-lg"></i> <span>{$lang['instancetraffic']}</span></a></li>
	<li><a href="index.php?site=instanceedit"><i class="mdi mdi-pencil mdi-lg"></i> <span>{$lang['instanceedit']}</span></a></li>
	<li><a href="index.php?site=logview"><i class="mdi mdi-format-list-bulleted mdi-lg"></i> <span>{$lang['logview']}</span></a></li>
	<li><a href="index.php?site=iserverbackup"><i class="mdi mdi-backup-restore mdi-lg"></i> <span>{$lang['instancebackup']}</span></a></li>
{/if}
{if isset($sid)}
	<li><a href="index.php?site=serverview&amp;sid={$sid}"><i class="mdi mdi-information-variant mdi-lg"></i> <span>{$lang['serverview']}</span></a></li>
	<li><a href="index.php?site=servertraffic&amp;sid={$sid}"><i class="mdi mdi-server-network mdi-lg"></i> <span>{$lang['virtualtraffic']}</span></a></li>
	<li><a href="index.php?site=serveredit&amp;sid={$sid}"><i class="mdi mdi-server-edit mdi-lg"></i> <span>{$lang['serveredit']}</span></a></li>
	<li><a href="index.php?site=temppw&amp;sid={$sid}"><i class="mdi mdi-lock mdi-lg"></i> <span>{$lang['temppw']}</span></a></li>
	<li><a href="index.php?site=fileupload&amp;sid={$sid}"><i class="mdi mdi-upload mdi-lg"></i> <span>{$lang['iconupload']}</span></a></li>
	<li><a href="index.php?site=logview&amp;sid={$sid}"><i class="mdi mdi-format-list-bulleted mdi-lg"></i> <span>{$lang['logview']}</span></a></li>
	<li><a href="index.php?site=filelist&amp;sid={$sid}"><i class="mdi mdi-file-multiple mdi-lg"></i> <span>{$lang['filelist']}</span></a></li>
	<li><a href="javascript:oeffnefenster('site/interactive.php?sid={$sid}&amp;action=action', '{$lang['massaction']}');"><i class="mdi mdi-checkbox-multiple-marked mdi-lg"></i> <span>{$lang['massaction']}</span></a></li>
	<li class="header">{$lang['channel']}</li>
	<li><a href="index.php?site=channel&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-outline mdi-lg"></i> <span>{$lang['channellist']}</span></a></li>
{if isset($cid)}
	<li><a href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$cid}"><i class="mdi mdi-comment-alert-outline mdi-lg"></i> <span>{$lang['channelview']}</span></a></li>
{/if}
{if isset($cid)}
	<li><a href="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}"><i class="mdi mdi-comment-processing-outline mdi-lg"></i> <span>{$lang['channeledit']}</span></a></li>
{/if}
	<li><a href="index.php?site=createchannel&amp;sid={$sid}"><i class="mdi mdi-comment-plus-outline mdi-lg"></i> <span>{$lang['createchannel']}</span></a></li>
	<li class="header">{$lang['clients']}</li>
	<li><a href="index.php?site=counter&amp;sid={$sid}"><i class="mdi mdi-account-multiple-star mdi-lg"></i> <span>{$lang['clientcounter']}</span></a></li>
	<li><a href="index.php?site=clients&amp;sid={$sid}"><i class="mdi mdi-account-multiple mdi-lg"></i> <span>{$lang['clientlist']}</span></a></li>
	<li><a href="index.php?site=complainlist&amp;sid={$sid}"><i class="mdi mdi-account-alert mdi-lg"></i> <span>{$lang['complainlist']}</span></a></li>
	<li><a href="index.php?site=chanclienteditperm&amp;sid={$sid}"><i class="mdi mdi-comment-account-outline mdi-lg"></i> <span>{$lang['chanclientperms']}</span></a></li>
	<li><a href="index.php?site=clientcleaner&amp;sid={$sid}"><i class="mdi mdi-account-multiple-minus mdi-lg"></i> <span>{$lang['clientcleaner']}</span></a></li>
	<li class="header">{$lang['bans']}</li>
	<li><a href="index.php?site=banlist&amp;sid={$sid}"><i class="mdi mdi-account-multiple-off mdi-lg"></i> <span>{$lang['banlist']}</span></a></li>
	<li><a href="index.php?site=banadd&amp;sid={$sid}"><i class="mdi mdi-account-off-plus mdi-lg"></i> <span>{$lang['addban']}</span></a></li>
	<li class="header">{$lang['groups']}</li>
	<li><a href="index.php?site=sgroups&amp;sid={$sid}"><i class="mdi mdi-server-account mdi-lg"></i> <span>{$lang['servergroups']}</span></a></li>
	<li><a href="index.php?site=sgroupadd&amp;sid={$sid}"><i class="mdi mdi-server-account-plus mdi-lg"></i> <span>{$lang['addservergroup']}</span></a></li>
	<li><a href="index.php?site=cgroups&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-account-outline mdi-lg"></i> <span>{$lang['channelgroups']}</span></a></li>
	<li><a href="index.php?site=cgroupadd&amp;sid={$sid}"><i class="mdi mdi-comment-multiple-account-plus-outline mdi-lg"></i> <span>{$lang['addchannelgroup']}</span></a></li>
	<li class="header">{$lang['token']}</li>
	<li><a href="index.php?site=token&amp;sid={$sid}"><i class="mdi mdi-key-variant mdi-lg"></i> <span>{$lang['token']}</span></a></li>
	<li class="header">{$lang['backup']}</li>
	<li><a href="index.php?site=backup&amp;sid={$sid}"><i class="mdi mdi-comment-download-outline mdi-lg"></i> <span>{$lang['chanbackups']}</span></a></li>
	<li><a href="index.php?site=serverbackup&amp;sid={$sid}"><i class="mdi mdi-server-download mdi-lg"></i> <span>{$lang['serverbackups']}</span></a></li>
	<li><a href="index.php?site=permexport&amp;sid={$sid}"><i class="mdi mdi-format-section-download mdi-lg"></i> <span>{$lang['permexport']}</span></a></li>
	<li><a href="index.php?site=clientsexport&amp;sid={$sid}"><i class="mdi mdi-account-multiple-download mdi-lg"></i> <span>{$lang['clientsexport']}</span></a></li>
	<li><a href="index.php?site=bansexport&amp;sid={$sid}"><i class="mdi mdi-account-off-download mdi-lg"></i> <span>{$lang['bansexport']}</span></a></li>
	<li class="header">{$lang['console']}</li>
	<li><a href="index.php?site=console&amp;sid={$sid}"><i class="mdi mdi-console-line mdi-lg"></i> <span>{$lang['queryconsole']}</span></a></li>
{/if}
{/if}