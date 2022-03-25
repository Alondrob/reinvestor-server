class User < ApplicationRecord
    has_secure_password
    has_many :reports dependent: :destroy
    has_many :properties dependent: :destroy
end
