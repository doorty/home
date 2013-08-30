class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.references :care_circle
      t.string :message

      t.timestamps
    end
  end
end
