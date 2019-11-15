class User < ApplicationRecord
    has_secure_password
    has_many :squares
    validates :email, format: { with: /@/, message: "@ must include"}, uniqueness: true
    validates :name, presence: true;
end
