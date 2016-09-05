class Job < ApplicationRecord
  validates :title, :location, :category_id, :description, presence: true
  belongs_to :company
  belongs_to :category
end
