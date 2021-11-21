class Book < ApplicationRecord
  # 主キーを記述
  self.primary_key = "isbn"
  has_many :reviews, dependent: :destroy
end
