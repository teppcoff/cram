class StudentMember < ApplicationRecord
    has_secure_password

    has_many :takes, dependent: :destroy
    has_many :subjects, :through => :takes

    enum gender: { male: 1, female: 2, others: 3 }
    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }
    enum school_year: { first_year: 1, second_year: 2, third_year: 3, fourth_year: 4, fifth_year: 5, sixth_year: 6 }

end
