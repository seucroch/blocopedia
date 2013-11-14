class AddPremiumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_member, :boolean, default: false
  end
end
