class Review < ApplicationRecord
  belongs_to :user
  # bookモデルのisbnカラムを主キーとして設定
  belongs_to :book, primary_key: "isbn"
end
