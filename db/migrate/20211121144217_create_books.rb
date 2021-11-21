class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: false do |t|
      t.string :title
      t.string :author
      # isbnをprimary_keyにする
      # idがprimary_keyにならないだけでid自体は作成される
      t.bigint :isbn, null: false, primary_key: true
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
