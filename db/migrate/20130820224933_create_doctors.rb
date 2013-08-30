class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.references :care_circle, index: true
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
