class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, :care_circle, :relationship_type
      t.timestamps
    end
  end
end
