class CreateCaregivers < ActiveRecord::Migration
  def change
    create_table :caregivers do |t|
      t.string :email
      t.string :name
      t.integer :gender # male = 0, female = 1
      t.string :language
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.integer :age
      t.integer :years_of_experience
      t.string :occupation
      t.boolean :insured
      t.boolean :bonded
      t.boolean :reviewed

      t.timestamps
    end
  end
end
