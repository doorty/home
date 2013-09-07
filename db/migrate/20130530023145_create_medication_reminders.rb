class CreateMedicationReminders < ActiveRecord::Migration
  def change
    create_table :medication_reminders do |t|
      t.references :medication, index: true
      t.string :days
      t.datetime :time

      t.timestamps
    end
  end
end
