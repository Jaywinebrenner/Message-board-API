class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  scope :search, -> (search_parameter) { where("name like ?", "%#{search_parameter}%")}
  scope :description_search, -> (search_parameter) { where("description like ?", "%#{search_parameter}%")}
  end




  #
  # scope :most_reviewed, -> {(
  #   select("groups.id, groups.name, groups.description, count(messages.id) as reviews_count").joins(:reviews)
  #   .group("groups.id")
  #   .order("messages_count DESC")
  #   .limit(10)
  #   )}
