class CreateMessengers < ActiveRecord::Migration[5.0]
  def change
    create_table :messengers do |t|
      t.string :message
      t.integer :home_id
      t.integer :destination_id
      t.timestamps
    end
  end
end
