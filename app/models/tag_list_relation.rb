class TagListRelation < ApplicationRecord
  belongs_to :list
  belongs_to :tag
end
