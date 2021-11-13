jQuery(function ($) {
    $("#js-period_form").on("change", function() {
        var selected_period = $("#js-period_form").val();

        $.ajax({
            url: "/staff/events/set_period/",
            type: "GET",
            data: {period_id: selected_period}
        });
    })
});
