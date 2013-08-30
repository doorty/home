class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.references :care_circle
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
