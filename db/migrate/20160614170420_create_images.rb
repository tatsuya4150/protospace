class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text    :image
      t.integer :role, default: 1
      t.integer :prototype_id
      t.timestamps
    end
  end
end
