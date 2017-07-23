{if $loginstatus === false AND $site === login}
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Teamspeak 3 - Webinterface</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/AdminLTE.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/square/blue.css">
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="/"><b>TS3</b>Webinterface</a>
            </div>
            <div class="login-box-body">
				{include file="{$tmpl}/showupdate.tpl"}
				{include file="{$tmpl}/{$site}.tpl"}
            </div>
        </div>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script>
          $(function () {
            var options = $('[name="skey"] option');
            if (options.length == 2) {
                options.eq(0).remove();
            }
          });
        </script>
    </body>
</html>
{else}
<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Teamspeak 3 - Webinterface</title>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/AdminLTE.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/all.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
        <link href="templates/{$tmpl}/assets/css/materialdesignicons.css" rel="stylesheet" />
        <link href="templates/{$tmpl}/assets/css/mdi-customs.css" rel="stylesheet" />
        <link href="templates/{$tmpl}/assets/css/customs.css" rel="stylesheet" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <script src="//cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>
        <script src="//cdn.datatables.net/plug-ins/1.10.15/api/processing().js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/js/app.min.js"></script>
		<script type="text/javascript">
			var checkflag = false;
			var conf_arr = new Array();

			function Klappen(selected_id) 
			{
				if(selected_id == 0)
				{
					var i = 1;
					var openAll;

					if ($('#Pic0').hasClass('mdi-plus-box'))
					{
						$('#Pic0').removeClass('mdi-plus-box').addClass('mdi-minus-box');
						openAll = 1;
					}
					else
					{
						$('#Pic0').removeClass('mdi-minus-box').addClass('mdi-plus-box');
						openAll = 0;
					}

					while (i < 100)
					{
						if ($('#Pic'+i) != null)
						{
							var KlappText = $('#Lay'+i);
							var KlappBild = $('#Pic'+i);
							if (openAll == 1) 
							{
								KlappText.fadeIn(1000);
								KlappBild.removeClass('mdi-plus-box').addClass('mdi-minus-box');
							} 
							else 
							{
								KlappText.fadeOut(1000);
								KlappBild.removeClass('mdi-minus-box').addClass('mdi-plus-box');
							}
							i++;
						}
						else
						{
							break;
						}
					}
				} else {
					var KlappTextID = $('#Lay'+selected_id);
					var KlappBildID = $('#Pic'+selected_id);

					if (KlappTextID.is(':visible')) 
					{
						KlappTextID.fadeOut(1000);
						KlappBildID.removeClass('mdi-minus-box').addClass('mdi-plus-box');
					} 
					else 
					{
						KlappTextID.fadeIn(1000);
						KlappBildID.removeClass('mdi-plus-box').addClass('mdi-minus-box');
					}
				}
			}
				
			function oeffnefenster (url)
			{
				fenster = window.open(url, "fenster1", "width=350,height=150,status=no,scrollbars=yes,resizable=no");
				fenster.opener.name="opener";
				fenster.focus();
			}

			function hide_select(selected_value)
			{
				if ($('#groups').is(':hidden'))
				{
					$('#groups').fadeIn(1000);
					if (selected_value == 0)
					{
						$('#servergroups').show();
						$('#channel').hide();
						$('#channelgroups').hide();
					}
					else if (selected_value == 1)
					{
						$('#servergroups').hide();
						$('#channel').show();
						$('#channelgroups').show();
					}
				} else {
					if (selected_value == 0)
					{
						$('#servergroups').fadeIn(1000);
						$('#channel').fadeOut(1000);
						$('#channelgroups').fadeOut(1000);
					}
					else if (selected_value == 1)
					{
						$('#servergroups').fadeOut(1000);
						$('#channel').fadeIn(1000);
						$('#channelgroups').fadeIn(1000);
					}
				}
			}

			function check(form) 
			{
				if (checkflag == false) 
				{
					$('form input[type="checkbox"]').prop('checked', true);
					checkflag = true;
				}
				else 
				{
					$('form input[type="checkbox"]').prop('checked', false);
					checkflag = false;
				}
				return checkflag;
			}
		
			function confirmArray(sid, name, port, action)
			{
				conf_arr[sid] = new Object();
				conf_arr[sid]['name'] = name;
				conf_arr[sid]['port'] = port;

				if($("#caction" + sid + ' option:selected').val() == 'false')
				{
					conf_arr[sid]['action'] = '';
				}
				else
				{
					conf_arr[sid]['action'] = $("#caction" + sid + ' option:selected').val();
				}
			}

			function confirmAction()
			{
				var text = "Möchtest du folgende Aktion wirklich ausführen?\n\n";
				for(var i in conf_arr)
				{
					if(conf_arr[i]['action'] == 'start')
					{
						text += "***Starten*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
					}
					else if(conf_arr[i]['action'] == 'stop')
					{
						text += "***Stoppen*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
					}
					else if(conf_arr[i]['action'] == 'del')
					{
						text += "***Löschen*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
					}
				}
				return text;
			}

			function resizeTable()
			{
				var ContentWidth = $('#TableContent').width();
				$('#TableHeader').width(ContentWidth);
			}

			$(function ()
			{
				if ($('#TableHeader'))
				{				
					$(window).on('resize', function(){
						resizeTable();
					});
				
					resizeTable();
				} 
			});
		</script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
          <header class="main-header">
            <a href="/" class="logo">
              <span class="logo-mini"><b>TS3</b>WI</span>
              <span class="logo-lg"><b>TS3</b>WebInterface</span>
            </a>
            <nav class="navbar navbar-static-top">
              <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </a>
              <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
				{if $fastswitch == true AND $hoststatus === true}
                  <li>
					<form class="navbar-form" method="get" action="index.php?site=serverview">
					{if strpos($site, 'edit') == false OR $site == serveredit}
					<input type="hidden" name="site" value="{$site}" />
					{else}
					<input type="hidden" name="site" value="serverview" />
					{/if}
					<select name="sid" class="form-control" onchange="submit()">
					{foreach key=key item=server from=$serverlist}
						{if $sid == $server['virtualserver_id']}
						<option selected="selected" value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
						{else}
						<option value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
						{/if}
					{/foreach}
					</select>
                    </form>
                  </li>
                {/if}
                  <li>
    	         	<a><b>{$smarty.session.loginuser}</b></a>
                  </li>
                  <li>
                    <a href="index.php?site=logout">
						{$lang['logout']}
                    </a>
                  </li>
                </ul>
              </div>
            </nav>
          </header>
          <aside class="main-sidebar">
            <section class="sidebar">
              <ul class="sidebar-menu">
				{include file="{$tmpl}/mainbar.tpl"}
              </ul>
            </section>
          </aside>
          <div class="content-wrapper container-fluid">
				{include file="{$tmpl}/showupdate.tpl"}
				{include file="{$tmpl}/{$site}.tpl"}				
          </div>
          <footer class="main-footer">
            <div class="pull-right hidden-xs">
            	<b>Template Version:</b> 1.0.0-rc0 &nbsp;&nbsp;
            </div>
            <strong>
            	{$footer}. 
            	&nbsp;<a href='http://www.psychoscripts.de/donate.php'><img alt="" border="0" src="https://www.paypalobjects.com/de_DE/DE/i/btn/btn_donate_SM.gif" width="86" height="20" style="margin-top: -3px;"></a> 
            	&nbsp;&ndash; <em>This interface contains images from <a href='http://www.teamspeak.com'>www.teamspeak.com</a>.</em>
            </strong>
          </footer>
        </div>
    </body>
</html>
{/if}