class Square < ApplicationRecord
    has_many :discussions
    belongs_to :user
    
    validates :name, presence: true
    
end
