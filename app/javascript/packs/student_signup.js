jQuery(function ($) {
    $("#student_member_school_id").on("change", function() {
        var selected_school = $("#student_member_school_id").val();
        
        //学校(school_id)を選択すると、自動的に学年1(school_type)が選択される
        $.ajax({
            url: "/student/signup/set_school/",
            type: "GET",
            data: {school_id: selected_school}
        });
    });

    $(document).ajaxComplete(function () {
        var school_type = $("#student_member_school_type").val();

        //選択された学年1(school_type)に応じて、表示される学年2(school_year)と科目(subject_ids)の選択肢が切り替わる
        //学年２は、学年1(school_type)が小学校なら6年生まで、それ以外なら3年生までの選択肢が表示される
        //"#js-subjects_form"の子要素に科目の選択肢が並んでいる
        //それをsliceで範囲指定して表示・非表示を切り替えている
        if (school_type == "high_school") {
            $("#student_member_school_year").children('[value="fourth_year"], [value="fifth_year"], [value="sixth_year"]').hide();
            $("#js-subjects_form").children().slice(12, 17).show();
            $("#js-subjects_form").children().slice(2, 12).hide();
        } else if (school_type == "junior_high_school") {
            $("#student_member_school_year").children('[value="fourth_year"], [value="fifth_year"], [value="sixth_year"]').hide();
            $("#js-subjects_form").children().slice(7, 12).show();
            $("#js-subjects_form").children().slice(2, 7).hide();
            $("#js-subjects_form").children().slice(12, 17).hide();
        } else if (school_type == "elementary_school") {
            $("#student_member_school_year").children('[value="fourth_year"], [value="fifth_year"], [value="sixth_year"]').show();
            $("#js-subjects_form").children().slice(2, 7).show();
            $("#js-subjects_form").children().slice(7, 17).hide();
        }
    });
})
