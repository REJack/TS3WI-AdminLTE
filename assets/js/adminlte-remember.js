
$(function () {
    "use strict";
    // REMEMBER BOXES
    var boxstates = $.parseJSON(localStorage.getItem('box_state') !== undefined ? localStorage.getItem('box_state') : [])
    $($.AdminLTE.options.boxWidgetOptions.boxWidgetSelectors.collapse).click(function () {
        var box = this.closest('.box'),
            boxname = $(box).data('name');

        if(boxname){
            boxstates.push({'boxname': boxname, 'state': $(box).hasClass('collapsed-box') ? 1 : 0});
            localStorage.setItem('box_state', JSON.stringify(boxstates));
        }
    });
    boxstates.each(function(box) {
        if (box.state == 0)
            $('.box[data-name="'+box.boxname+'"]').addClass('collapsed-box').find('.btn-box-tool[data-widget="collapse"] i').removeClass('fa-minus').addClass('fa-plus');
        else if (box.state == 1)
            $('.box[data-name="'+box.boxname+'"]').removeClass('collapsed-box').find('.btn-box-tool[data-widget="collapse"] i').removeClass('fa-plus').addClass('fa-minus');
    });

    // REMEMBER MAINSIDEBAR
    $("body").on("collapsed.pushMenu", function(){ localStorage.setItem("mainSidebarToggleState", "closed"); });
    $("body").on("expanded.pushMenu", function(){ localStorage.setItem("mainSidebarToggleState", "opened"); });
    if(localStorage.getItem("mainSidebarToggleState") == 'closed')
        $("body").addClass('sidebar-collapse hold-transition').delay(100).queue(function(){ $(this).removeClass('hold-transition'); });
});
