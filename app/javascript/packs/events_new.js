jQuery(function ($) {
    $("#js-period_form").on("change", function() {
        var selected_period = $("#js-period_form").val();
        console.log(selected_period);

        $.ajax({
            url: "/staff/events/set_period",
            type: "GET",
            data: {period_id: selected_period}
        });
    })
});
