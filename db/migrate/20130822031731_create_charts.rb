class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.references :care_circle, index: true

      t.timestamps
    end
  end
end
