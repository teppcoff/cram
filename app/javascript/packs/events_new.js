jQuery(function ($) {
    $("#js-show_text").hide();
    $("#js-reservation_type").on("click", function() {
        $("[id=js-hide_form]").hide();
        $("#js-show_text").show();
    })
    $("#js-ordinary_type").on("click", function() {
        $("[id=js-hide_form]").show();
        $("#js-show_text").hide();
    })

    //時限(period)を入力すると、自動的に開始時刻(starts_at)と終了時刻(ends_at)が入力される
    $("#js-period_form").on("change", function() {
        var selected_period = $("#js-period_form").val();

        $.ajax({
            url: "/staff/events/set_period/",
            type: "GET",
            data: {period_id: selected_period}
        });
    })
})
