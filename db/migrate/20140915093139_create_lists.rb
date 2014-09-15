class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.string :task
    	t.string :description
    	t.string :complete

      t.timestamps
    end
  end
end
