class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :access_level
      t.string :timestamps
    end
  end
end
