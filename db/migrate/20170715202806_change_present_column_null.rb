class ChangePresentColumnNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :diagnoses, :present, true
  end
end
