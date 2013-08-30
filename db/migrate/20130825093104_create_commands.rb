class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :owner
      t.integer :status
      t.references :button, index: true
      t.string :img_path
      t.string :audio_path

      t.timestamps
    end
  end
end
