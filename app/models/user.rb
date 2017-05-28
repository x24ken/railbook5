class User < ApplicationRecord
  validates :email,
     presence: { unless: Proc.new { |u| u.dm.blank? } }
  validates :agreement, acceptance: { on: :create }
  validates :email, confirmation: true
end
