class DropHeartImagings < ActiveRecord::Migration[5.0]
  def change
    drop_table :heart_imagings
  end
end
