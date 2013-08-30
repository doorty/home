class CreateMedicationReminders < ActiveRecord::Migration
  def change
    create_table :medication_reminders do |t|
      t.references :medication, index: true
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.datetime :time

      t.timestamps
    end
  end
end
