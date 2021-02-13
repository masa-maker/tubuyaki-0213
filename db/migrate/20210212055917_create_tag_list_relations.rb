class CreateTagListRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_list_relations do |t|
      t.references :list, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
