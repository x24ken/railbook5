class Book < ApplicationRecord
  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    isbn: { allow_old: true }
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }
  validates :price,
    numericality: { only_integer: true, less_than: 10000 }
  validates :publish,
    inclusion:{ in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソムシ'] }
  #スコープ
  scope :gihyo, -> { where(publish: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :whats_new, ->(pub){
    where(publish: pub).order(published: :desc).limit(5)
  }
end
