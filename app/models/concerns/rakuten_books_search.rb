require 'active_support'

module RakutenBooksSearch
  extend ActiveSupport::Concern

  # 共通処理を記述
  def componentization
    @books = []
    @title = params[:title]

    if @title.present?
      # resultsに楽天APIから取得したjsonデータを格納
      # 書籍のタイトルを検索して、一致するデータを格納するように設定
      results = RakutenWebService::Books::Book.search({title: @title})
        
      # @booksに格納
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
    
    #すでに保存済の本は除外するためにunlessで切り分け
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
  end

  def read(result)
    title = result["title"]
    author = result["author"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    book_genre_id = result["booksGenreId"]
    item_caption = result["itemCaption"]
    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      image_url: image_url
    }
  end
end

# gsubメソッドは特定の文字を別の文字へ置換するだけでなく、正規表現を用いて該当する箇所を置換したり削除できるメソッド

# 正規表現を使わない場合
# 文字列.gsub(置換したい文字列, 置換後の文字列)

# 正規表現を使う場合
# 文字列.gsub(/正規表現/, 正規表現に該当した箇所を置換した後の文字列)
