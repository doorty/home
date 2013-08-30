class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.references :care_circle, index: true
      t.string :name
      t.string :strength
      t.string :dosage
      t.references :doctor

      t.timestamps
    end
  end
end
