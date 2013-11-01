class AddPrivacyToWiki < ActiveRecord::Migration
  def change
      add_column :wikis, :public, :boolean, default: true

    end
end
