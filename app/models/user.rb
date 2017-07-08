class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews
  
  has_secure_password
  
  
  has_one :author
  
  validates :email,
     presence: { unless: Proc.new { |u| u.dm.blank? } }
  validates :agreement, acceptance: { on: :create }
  validates :email, confirmation: true
end
