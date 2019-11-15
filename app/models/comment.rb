class Comment < ApplicationRecord
    belongs_to: discussions
    
    validates :body, presence: true
    
end
