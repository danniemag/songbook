class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false, default: ""
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
