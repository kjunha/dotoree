class Square < ApplicationRecord
    has_many :discussions
    
    validates :name, presence: true
    
end
