class CreateWorkFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :work_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
