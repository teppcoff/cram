class StudentMember < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX, message: :invalid_email }
    validates :family_name, presence: true
    validates :given_name, presence: true
    validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: :invalid_kana }
    validates :given_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: :invalid_kana }
    validates :school_type, presence: true
    validates :school_year, presence: true
    validates :gender, presence: true
    validates :password, presence: true, length: { minimum: 8, maximum: 16 }, on: :create
    validates :password_confirmation, presence: true, on: :create

    has_secure_password

    belongs_to :staff_member
    belongs_to :parent_member
    belongs_to :school
    has_many :takes, dependent: :destroy
    has_many :subjects, :through => :takes
    has_many :goal_sheets, dependent: :destroy
    has_many :daily_sheets, dependent: :destroy
    has_many :events, dependent: :destroy
    has_many :score_sheets, dependent: :destroy

    enum gender: { male: 1, female: 2, others: 3 }
    enum school_type: { elementary_school: 1, junior_high_school: 2, high_school: 3 }
    enum school_year: { first_year: 1, second_year: 2, third_year: 3, fourth_year: 4, fifth_year: 5, sixth_year: 6 }

    def full_name
        self.family_name + " " + self.given_name
    end

    def full_school_year
        self.school_type_i18n + " " + self.school_year_i18n
    end

    scope :search, -> (search_params) do
        return if search_params.blank?

        family_name_is(search_params[:family_name])
            .given_name_is(search_params[:given_name])
            .family_name_kana_is(search_params[:family_name_kana])
            .given_name_kana_is(search_params[:given_name_kana])
            .school_type_is(search_params[:school_type])
            .school_year_is(search_params[:school_year])
    end

        scope :family_name_is, -> (family_name) { where(family_name: family_name) if family_name.present? }
        scope :given_name_is, -> (given_name) { where(given_name: given_name) if given_name.present? }
        scope :family_name_kana_is, -> (family_name_kana) { where(family_name_kana: family_name_kana) if family_name_kana.present? }
        scope :given_name_kana_is, -> (given_name_kana) { where(given_name_kana: given_name_kana) if given_name_kana.present? }
        scope :school_type_is, -> (school_type) { where(school_type: school_type) if school_type.present? }
        scope :school_year_is, -> (school_year) { where(school_year: school_year) if school_year.present? }
end
