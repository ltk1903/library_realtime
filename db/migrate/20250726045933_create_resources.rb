class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
