class AddYearsAgoToReasons < ActiveRecord::Migration[5.0]
  def change
    change_table :hospitalizations do |t|
      t.integer :time_ago
      t.string :time_ago_scale
      t.string :length_of_stay_scale
    end
    change_table :tests do |t|
      t.integer :time_ago
      t.string :time_ago_scale
    end
    change_table :family_members do |t|
      t.integer :born_years_ago
    end
    change_table :symptoms do |t|
      t.integer :time_ago
      t.integer :time_ago_scale
    end
    change_table :dissections do |t|
      t.integer :time_ago
      t.integer :time_ago_scale
    end
    change_column_null :dissections, :when, true
    change_column_null :patients, :phone_1, true
    change_column_null :patients, :email, true
  end
end
