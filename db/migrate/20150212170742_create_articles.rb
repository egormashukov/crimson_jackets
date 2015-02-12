class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.string :author
      t.integer :rate

      t.timestamps
    end
  end

  def down
    drop_table :atricles
  end
end
