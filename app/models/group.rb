class Group < ApplicationRecord
  has_many :message, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  scope :search, -> (search) { where("name ilike :search", search: "%#{search}%")}
end
