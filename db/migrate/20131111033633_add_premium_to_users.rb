class AddPremiumToUser < ActiveRecord::Migration
  def change
    add_column :user, :premium_member, :boolean, default: false
  end
end
