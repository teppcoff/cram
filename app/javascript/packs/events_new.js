jQuery(function ($) {
    // 通常授業・予約型それぞれの場合にのみ表示されるパーツ
    let for_ordinary_type = $(".for_ordinary_type");
    let for_reservation_type = $(".for_reservation_type");

    for_reservation_type.hide();

    // 予約型を選択すると、対応するフォームが非表示になり、注意書きが表示される
    $("#reservation_type").on("click", function() {
        for_ordinary_type.hide();
        for_reservation_type.show();
    });
    // 通常授業を選択すると対応するフォームが表示され、注意書きが消える
    $("#ordinary_type").on("click", function() {
        for_ordinary_type.show();
        for_reservation_type.hide();
    });

    // 時限(period)を入力すると、自動的に開始時刻(starts_at)と終了時刻(ends_at)が入力される
    $("#event_period_id").on("change", function() {
        let selected_period = $("#event_period_id").val();

        $.ajax({
            url: "/staff/events/set_period/",
            type: "GET",
            data: {period_id: selected_period}
        });
    });

    // 時限(period)を入力すると、概要(title)が自動で入力される
    $("#event_period_id").on("change", function() {
        let selected_subject = $("#event_subject_id option:selected").text();
        let selected_period = $("#event_period_id").val();
        $("#event_title").val(`${selected_period}限${selected_subject}`);
    });
})
