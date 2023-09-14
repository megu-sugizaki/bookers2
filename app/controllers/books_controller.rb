class BooksController < ApplicationController
  def new
    # @book = Book.new
  end
  # 新規投稿機能はindexとshowのページにあるためここには記載不要と思いコメントアウト。
  
  def create
    @book = Book.find(params[:id])
    @book.user_id = current_user_id
    if @book.save
      redirect_to book_path
    else 
      render:index
    end 
  end 
  # 成功したらshowページへ、失敗したらindexページへ。

  def index
    @book = Book.new
    # indexページに新規投稿ページがあるのでここにも定義づけを行った。
    @books = Book.find(params[:id])
  end
  # ページネーション機能の実装は特に要件にないのでこのまま。

  def show
    @book = Book.new
    # showページに新規投稿ページがあるのでここにも定義づけを行った。
    @book = Book.find(params[:id])
  end
  # コメント機能はなし。
  
  def destroy
    book = Book.find(params[:id])
    book = book.destroy
    redirect_to books_path
  end 
    # リダイレクト先はindex

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.user_id = current_user_id
    
    if book.update(book_params)
    redirect_to book_path
    else
    redirect_to edit_book_path
    end 
  end 
  # 成功したらshow、失敗したらeditにそのまま
  
  private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end 
end 
