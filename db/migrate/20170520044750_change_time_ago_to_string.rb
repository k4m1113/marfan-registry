class ChangeTimeAgoToString < ActiveRecord::Migration[5.0]
  def change
    change_column :hospitalizations, :time_ago, :string
    change_column :medications, :time_ago, :string
    change_column :hospitalizations, :time_ago, :string
    change_column :complications, :time_ago, :string
    change_column :procedures, :time_ago, :string
    change_column :symptoms, :time_ago, :string
    change_column :tests, :time_ago, :string
    change_column :family_members, :time_ago, :string
  end
end
