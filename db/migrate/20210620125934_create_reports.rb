class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.text :recommend
      t.float :violent, null: false
      t.text :violent_reason
      t.float :with_family, null: false
      t.text :with_family_reason
      t.float :preparation, null: false
      t.text :preparation_reason
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
