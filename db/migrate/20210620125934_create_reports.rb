class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.text :recommend
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
