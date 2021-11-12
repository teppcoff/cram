jQuery(function ($){
    $("#js-period").on('change', function() {
        var selected_period = $("#js-period").val();
        alert(selected_period);
        console.log(selected_period);

        $.ajax({
            url: "/staff/events/set_period",
            type: "GET",
            data: {period_id: selected_period},
            success: function(data) {
                alert("success");
            },
            error: function(data) {
                alert("error");
            }
        });
    });
});