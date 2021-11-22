class BooksController < ApplicationController
  # ファイル名とモジュール名を揃えないと読み込めない
  include RakutenBooksSearch

  def search
    # 共通化した処理
    componentization
  end
end
