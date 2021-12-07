StaffMember.create!(
    [
        {
            family_name: "山田",
            given_name: "太郎",
            family_name_kana: "ヤマダ",
            given_name_kana: "タロウ",
            gender: "male",
            birthday: "2000-11-05",
            password: "password",
            password_confirmation: "password",
            email: "taro@example.com",
            employment_status: "part_time"     
        },
        {
            family_name: "橋本",
            given_name: "涼太",
            family_name_kana: "ハシモト",
            given_name_kana: "リョウタ",
            gender: "male",
            birthday: "2001-11-05",
            password: "password",
            password_confirmation: "password",
            email: "ryota@example.com",
            employment_status: "part_time"
        }    
    ]
)