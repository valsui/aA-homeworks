class CreatePeopleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people_tables do |t|
      t.string :name, null: false
      t.integer :house_id, null:false
      t.timestamp
    end
  end
end
