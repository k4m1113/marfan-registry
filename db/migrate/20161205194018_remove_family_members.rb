class RemoveFamilyMembers < ActiveRecord::Migration
  def up
    drop_table :family_members
  end

  def down
    create_table :family_members
  end
end
