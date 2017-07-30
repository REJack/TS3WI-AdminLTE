{if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
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
<script>
	$(function () {
		var table = $("#clients").DataTable({
            "language": {
                "url": dataTableLang
            },
			"order": [[ 0, "desc" ]],
			"processing": true,
			"columnDefs": [
				{ "orderable": false, "targets": 6 }
			],
			"buttons": [
					{
					text: "{$lang['showmoreentrys']} <span id='more_entry_act_page'>1</span>/<span id='more_entry_max_pages'>{if $pages|string_format:'%d' == 0}1{else}{$pages}{/if}</span>",
					className: "btn btn-primary btn-flat {if $pages|string_format:'%d' == 0}disabled{/if}",
					action: function ( e, dt, node, config ) {
						add_entries();
					}
				}
			]
		});

		table.buttons().container().appendTo( '#clients_wrapper .col-sm-6:eq(0)' );
		$('#clients_processing').css('top', '5%');
		$('.pagination').addClass('pagination-flat');

		var next_page = 0;

		function add_entries(){
			var max_pages = parseInt("{$pages}");
				max_pages = max_pages-1;
			var url = "index.php?site=clients&sid={$sid}&getstart="+((next_page+1)*100);

			table.processing(true);
			$('#more_entry_act_page').parents('a').addClass('disabled');

			if (max_pages != next_page) {
				$.get(url, function(data) {
					data = $.parseHTML(data);
					$.each(data, function(key, itm) {
						if (itm.className == 'wrapper') {
							var base = itm.children[2].children[0].children[0].children[1];
							var elems = base.children[1].children[1].children[1].children;
							var lastID = elems.length - 1;
							$.each(elems, function(uKey, uItm){
								table.row.add( [
									uItm.children[0].innerText,
									uItm.children[1].innerText,
									uItm.children[2].innerText,
									uItm.children[3].innerText,
									uItm.children[4].innerText,
									uItm.children[5].innerHTML,
									uItm.children[6].innerHTML
								] ).draw( false );
								if (uKey == lastID) {
									next_page += 1;

									if (next_page != max_pages){
										$('#more_entry_act_page').parents('a').removeClass('disabled');
									}

									$('#more_entry_act_page').text(next_page+1);
									table.processing( false );
								}
							})
						}
					});
				});
			}
		}
	});
</script>
<section class="content container-fluid">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="box box-info">
			<div class="box-header">
				<h3 class="box-title">{$lang['searchfor']}{$lang['client']}</h3>
			</div>
			<div class="box-body">			
				<form method="post" action="index.php?site=clients&amp;sid={$sid}">
					<div class="row">
						<div class="col-lg-3">
							<select class="form-control" name="searchby">
								<option value="uniqueid">{$lang['uniqueid']}</option>
								<option value="cldbid">{$lang['cldbid']}</option>
								<option value="name">{$lang['name']}</option>
							</select>
						</div>
						<div class="col-lg-6">
							<input type="text" class="form-control" name="search" required />
						</div>
						<div class="col-lg-3">
							<input type="submit" class="btn btn-flat btn-info btn-block" name="sendsearch" value="{$lang['search']}" />					
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">{$lang['clients']}</h3>
			</div>
			<div class="box-body">
				<input type="hidden" name="next_page" id="next_page" value="0">
				<table class="table table-striped" id="clients">
					<thead>				
						<tr>
							<th class="text-center">{$lang['dbid']}</th>
							<th class="text-center">{$lang['uniqueid']}</th>
							<th class="text-center">{$lang['nickname']}</th>
							<th class="text-center">{$lang['created']}</th>
							<th class="text-center">{$lang['lastonline']}</th>
							<th class="text-center">{$lang['status']}</th>
							<th></th>
						</tr>
					</thead>
					{while $showclients <= $duration AND isset($clientdblist[$getstart])}
						<tr>
							<td style="vertical-align: middle;" class="text-center">{$clientdblist[$getstart]['cldbid']}</td>
							<td style="vertical-align: middle;" class="text-center">{$clientdblist[{$getstart}]['client_unique_identifier']}</td>
							<td style="vertical-align: middle;" class="text-center">{$clientdblist[{$getstart}]['client_nickname']}</td>
							<td style="vertical-align: middle;" class="text-center">{$clientdblist[{$getstart}]['client_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							<td style="vertical-align: middle;" class="text-center">{$clientdblist[{$getstart}]['client_lastconnected']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
							<td style="vertical-align: middle;" class="text-center">
							{if isset($clientdblist[{$getstart}]['clid'])}
								<span class="text-green">{$lang['online']}</span>
							{else}
								<span class="text-red">{$lang['offline']}</span>
							{/if}
							</td>
							<td style="vertical-align: middle;" class="text-right no-padding">
								<a class="btn btn-sm btn-flat btn-info no-margin" href="index.php?site=cleditperm&amp;sid={$sid}&amp;cldbid={$clientdblist[{$getstart}]['cldbid']}">{$lang['editperms']}</a>
							{if !isset($permoverview['b_client_delete_dbproperties']) OR $permoverview['b_client_delete_dbproperties'] == 1}
								<form method="post" style="display: inline;" action="index.php?site=clients&amp;sid={$sid}">
									<input type="hidden" name="cldbid" value="{$clientdblist[{$getstart}]['cldbid']}" />
									<input type="submit" class="btn btn-sm btn-flat btn-danger" name="clientdel" value="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgclient']}')" />
								</form>
							{/if}
							</td>
						</tr>
						{assign var=showclients value="`$showclients+1`"}
						{assign var=getstart value="`$getstart+1`"}
					{/while}
				</table>
			</div>
		</div>
	{/if}
	</div>
</section>