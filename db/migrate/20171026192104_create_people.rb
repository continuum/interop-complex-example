class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :names
      t.string :surname

      t.timestamps
    end
  end
end
