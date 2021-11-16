class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true
    
    belongs_to :staff_member

end
