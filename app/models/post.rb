class Post < ApplicationRecord

    validates :title, presence: true, length: { maximum: 20 }
    validates :content, presence: true, length: { maximum: 400 }
    
    belongs_to :staff_member

end
