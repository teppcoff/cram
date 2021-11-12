StudentMember.create!(
    [
        {
            family_name: "田中",
            given_name: "一郎",
            family_name_kana: "タナカ",
            given_name_kana: "イチロウ",
            gender: "male",
            birthday: "2005-11-05",
            password: "password",
            school_type: "high_school",
            school_year: "first_year",
            email: "ichiro@example.com",
            subject_ids: [ 11, 12 ],
            staff_member_id: 1,
            parent_member_id: 1
        },
        {
            family_name: "田中",
            given_name: "二郎",
            family_name_kana: "タナカ",
            given_name_kana: "ジロウ",
            gender: "male",
            birthday: "2006-11-05",
            password: "password",
            school_type: "junior_high_school",
            school_year: "third_year",
            email: "jiiro@example.com",
            subject_ids: [ 7, 8 ],
            staff_member_id: 1,
            parent_member_id: 1
        }
    ]
)