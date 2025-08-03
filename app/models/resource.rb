class Resource < ApplicationRecord
  has_one_attached :image
  STATUSES = %w[available borrowed pending]

  validates :title, :author, :category, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
end