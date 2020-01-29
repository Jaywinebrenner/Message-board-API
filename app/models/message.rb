class Message < ApplicationRecord
  belongs_to :group
  scope :author_search, -> (search_parameter) { where("author like ?", "%#{search_parameter}%")}
  scope :content_search, -> (search_parameter) { where("content like ?", "%#{search_parameter}%")}
  scope :specific_time_search, -> (search_parameter) { where("created_at = ?", "%#{search_parameter}%")}
  # scope :author_search, -> (search_parameter) { where("author like ?", "%#{search_parameter}%")}
  # scope :time_search, -> { where("created_at >=?", Time.now.beginning_of_day)}
end
