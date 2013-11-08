class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :editor_id
      t.integer :collaborator_id

      t.timestamps
    end
    add_index :relationships, :editor_id
    add_index :relationships, :collaborator_id
    add_index :relationships, [:editor_id, :collaborator_id], unique: true
  end
end
