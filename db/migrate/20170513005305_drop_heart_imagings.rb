class DropHeartImagings < ActiveRecord::Migration
  def change
    drop_table :heart_imagings
  end
end
