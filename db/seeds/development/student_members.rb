StudentMember.create!(
    [
        {
            family_name: "田中",
            given_name: "一郎",
            family_name_kana: "タナカ",
            given_name_kana: "イチロウ",
            gender: "male",
            birthday: "2006-11-05",
            password: "password",
            password_confirmation: "password",
            school_type: "high_school",
            school_year: "first_year",
            email: "ichiro@example.com",
            subject_ids: [ 11, 12, 13 ],
            staff_member_id: 1,
            parent_member_id: 1,
            school_id: 3
        },
        {
            family_name: "田中",
            given_name: "二郎",
            family_name_kana: "タナカ",
            given_name_kana: "ジロウ",
            gender: "male",
            birthday: "2007-11-05",
            password: "password",
            password_confirmation: "password",
            school_type: "junior_high_school",
            school_year: "third_year",
            email: "jiro@example.com",
            subject_ids: [ 7, 8, 9 ],
            staff_member_id: 1,
            parent_member_id: 1,
            school_id: 2
        },
        {
            family_name: "鈴木",
            given_name: "花子",
            family_name_kana: "スズキ",
            given_name_kana: "ハナコ",
            gender: "female",
            birthday: "2006-11-05",
            password: "password",
            password_confirmation: "password",
            school_type: "high_school",
            school_year: "first_year",
            email: "hanako@example.com",
            subject_ids: [ 11, 12, 13 ],
            staff_member_id: 1,
            parent_member_id: 2,
            school_id: 3
        }
    ]
)