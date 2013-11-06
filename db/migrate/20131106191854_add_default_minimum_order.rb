class AddDefaultMinimumOrder < ActiveRecord::Migration
  def up
    Spree::UserGroup.where(:minimum_order => nil).update_all(:minimum_order => 0)
    change_column :spree_user_groups, :minimum_order, :integer, :null => false, :default => 0
  end

  def down
    change_column :spree_user_groups, :minimum_order, :integer, :default => nil
  end
end
