class RelationshipNameChange < ActiveRecord::Migration
  def change
    rename_column :Relationship, :editor_id, :wiki_id
  end
end
