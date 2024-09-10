class AddCascadeDeleteToAdoptionsAnimalId < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :adoptions, :animals
    add_foreign_key :adoptions, :animals, on_delete: :cascade
  end
end
