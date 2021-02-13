class Tag < ApplicationRecord
  has_many :tag_list_relations
  has_many :lists, through: :tag_list_relations
  validates :name, uniqueness: true
end
