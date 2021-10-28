class ParentMember < ApplicationRecord
    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
    validates :given_name_kana, presence: true, format: { with: VALID_KANA_REGEX }

    has_secure_password
    has_many :student_members
    has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

    enum gender: { male: 1, female: 2, others: 3 }

    def full_name
        self.family_name + " " + self.given_name
    end
    
end
