class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :breed
      t.string :size
      t.string :gender
      t.integer :age
      t.boolean :castrated
      t.boolean :vaccinated
      t.boolean :dewormed
      t.string :special_needed
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
