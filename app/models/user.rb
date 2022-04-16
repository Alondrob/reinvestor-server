class User < ApplicationRecord
    has_secure_password

    # validates :user_name, presence: true
    # validates :email, uniqueness: true, presence: true

    # has_many :reports dependent: :destroy
    # has_many :properties dependent: :destroy
end
