class Group < ApplicationRecord
  has_many :message, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  scope :search, -> (search_parameter) { where("name like ?", "%#{search_parameter}%")}
  scope :description_search, -> (search_parameter) { where("description like ?", "%#{search_parameter}%")}
end
