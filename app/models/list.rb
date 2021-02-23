class List < ApplicationRecord
  has_many :tag_list_relations, dependent: :destroy
  has_many :tags, through: :tag_list_relations
  has_one_attached :image

end
