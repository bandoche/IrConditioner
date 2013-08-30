class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :title
      t.string :cmd

      t.timestamps
    end
  end
end
