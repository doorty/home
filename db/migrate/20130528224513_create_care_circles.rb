class CreateCareCircles < ActiveRecord::Migration
  def change
    create_table :care_circles do |t|

      t.timestamps
    end
  end
end
