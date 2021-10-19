class StudentMember < ApplicationRecord
    has_secure_password

    belongs_to :staff_member
    belongs_to :parent_member
    has_many :takes, dependent: :destroy
    has_many :subjects, :through => :takes
    has_many :goal_sheets, dependent: :destroy
    has_many :daily_sheets, dependent: :destroy

    enum gender: { male: 1, female: 2, others: 3 }
    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }
    enum school_year: { first_year: 1, second_year: 2, third_year: 3, fourth_year: 4, fifth_year: 5, sixth_year: 6 }

    def full_name
        self.family_name + " " + self.given_name
    end

    def full_school_year
        self.school_type_i18n + " " + self.school_year_i18n
    end

end
