class User < ApplicationRecord
  validates :agreement, acceptance: true
  validates :email, confirmation: true
end
