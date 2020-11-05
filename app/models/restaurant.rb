class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  category_list = %w[chinese italian japanese french belgian]

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: category_list }
end
