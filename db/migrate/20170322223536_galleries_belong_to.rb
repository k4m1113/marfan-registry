class GalleriesBelongTo < ActiveRecord::Migration[5.0]
  def change
    change_table :galleries do |t|
      t.belongs_to :visit
      t.belongs_to :test
      t.belongs_to :symptom
      t.belongs_to :procedure
      t.belongs_to :patient
      t.belongs_to :medication
      t.belongs_to :hospitalization
      t.belongs_to :family_member
      t.belongs_to :diagnosis
    end
  end
end
