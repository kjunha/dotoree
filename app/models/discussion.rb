class Discussion < ApplicationRecord
    belongs_to :square
    has_many :comments
    
    validates :body, presence: true
end
