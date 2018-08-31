class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.references :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
