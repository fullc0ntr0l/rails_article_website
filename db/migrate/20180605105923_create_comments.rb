class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.references :article

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
