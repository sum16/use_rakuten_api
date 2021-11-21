class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: false do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false

      t.timestamps
    end
    # book_idをbooksテーブルのisbn(主キー)と接続
    add_foreign_key :reviews, :books, column: :book_id , primary_key: :isbn
  end
end
