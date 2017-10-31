class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :nombres
      t.string :apellidos

      t.timestamps
    end
  end
end
