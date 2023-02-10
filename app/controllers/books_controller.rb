class BooksController < ApplicationController
  def index
    # 投稿一覧表示機能
    @books = Book.all
    
    # 新規投稿機能
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
    
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    
  end
  
  
  private
  #　ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
