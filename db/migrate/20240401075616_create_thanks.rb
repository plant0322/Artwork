class CreateThanks < ActiveRecord::Migration[6.1]
  def change
    create_table :thanks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
