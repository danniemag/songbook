class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
