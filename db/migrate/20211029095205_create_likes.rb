class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|

      t.timestamps
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true
    end
  end
end
