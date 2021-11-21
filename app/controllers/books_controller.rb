class BooksController < ApplicationController
  @books = []
  @title = params[:title]

  if @title.present?
    results = RakutenWebServise::Books.search()
  end
end
