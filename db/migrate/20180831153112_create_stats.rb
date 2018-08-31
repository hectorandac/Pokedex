class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :base_stat

      t.timestamps
    end
  end
end
