jQuery(function ($) {
    $("#show_caution").hide();
    $("#js-reservation_type_form").on("click", function() {
        if ($(this).prop("checked")) {
            $("[id=js-hide_form]").hide();
            $("#show_caution").show();
        } else {
            $("[id=js-hide_form]").show();
            $("#show_caution").hide();
        }
    })
})

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
