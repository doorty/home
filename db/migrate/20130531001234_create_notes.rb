class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :care_circle, index: true
      t.string :content

      t.timestamps
    end
  end
end
