jQuery(function ($) {
    $("#student_member_school_id").on("change", function() {
        let selected_school = $("#student_member_school_id").val();
        
        // 学校(school_id)を選択すると、自動的に学年1(school_type)が選択される
        $.ajax({
            url: "/student/signup/set_school/",
            type: "GET",
            data: {school_id: selected_school}
        });
    });

    $(document).ajaxComplete(function () {
        let school_type = $("#student_member_school_type").val();
        let years_of_elementary_school = $("#student_member_school_year").children('[value="fourth_year"], [value="fifth_year"], [value="sixth_year"]');
        let subjects_of_elementary_school = $("#js-subjects_form").children().slice(2, 7);
        let subjects_of_junior_high_school = $("#js-subjects_form").children().slice(7, 12);
        let subjects_of_high_school = $("#js-subjects_form").children().slice(12, 17);

        // 選択された学年1(school_type)に応じて、表示される学年2(school_year)と科目(subject_ids)の選択肢が切り替わる
        // 学年２は、学年1(school_type)が小学校なら6年生まで、それ以外なら3年生までの選択肢が表示される
        // 科目は、"#js-subjects_form"の子要素に選択肢として並んでいる
        // それをsliceで範囲指定して表示・非表示を切り替えている
        switch (school_type) {
            case "high_school" :
                years_of_elementary_school.hide();
                subjects_of_elementary_school.hide();
                subjects_of_junior_high_school.hide();
                subjects_of_high_school.show();
                break;
            case "junior_high_school" :
                years_of_elementary_school.hide();
                subjects_of_elementary_school.hide();
                subjects_of_junior_high_school.show();
                subjects_of_high_school.hide();
                break;
            case "elementary_school" :
                years_of_elementary_school.show();
                subjects_of_elementary_school.show();
                subjects_of_junior_high_school.hide();
                subjects_of_high_school.hide();
                break;
            default :
                years_of_elementary_school.show();
                subjects_of_elementary_school.show();
                subjects_of_junior_high_school.show();
                subjects_of_high_school.show();
                break;
        }
    });
})
