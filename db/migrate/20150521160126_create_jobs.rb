class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :phone
      t.string :contact
      t.string :location
      t.text :notes
      t.timestamps null: false
    end
  end
end
