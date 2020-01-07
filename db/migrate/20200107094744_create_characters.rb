class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.integer :health
      t.integer :strength
      t.integer :dexterity
      t.integer :magic
      t.integer :charisma
      t.integer :intelligence
      t.string :job
      t.string :race
      t.string :gender
      t.integer :age
      t.string :eye_color
      t.string :hair_color
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
