class Review < ApplicationRecord
  enum status: { draft: 0, published: 1, deleted: 2 }
  belongs_to :book
  belongs_to :user
  default_scope { order(updated_at: :desc) }
end
