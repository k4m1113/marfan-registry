class CleanUpVisitAttributes < ActiveRecord::Migration[5.1]
  def up
    change_table :visits do |t|
      t.remove :z_score
      t.remove :upper_segment
      t.remove :lower_segment
      t.remove :arm_span
      t.remove :height
      t.remove :weight
    end
  end
  
  def down
    change_table :visits do |t|
      t.float :z_score
      t.float :weight
      t.float :height
      t.float :upper_segment
      t.float :lower_segment
      t.float :arm_span
    end
  end
end
