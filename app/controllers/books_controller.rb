# bookers2 books controller

class BooksController < ApplicationController
  #before_action :authenticate_user!
  
  
  def new
    # @book = Book.new
  end
  # 新規投稿機能はindexとshowのページにあるためここには記載不要と思いコメントアウト。
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else 
      flash.now[:notice] 
      render:index
    end 
  end 
  # 成功したらshowページへ、失敗したらindexページへ。

  def index
    @book = Book.new
    # indexページに新規投稿ページがあるのでここにも定義づけを行った。
    
    @books = Book.all
    # @user = User.find(params[:id])→エラーが出るためコメントアウト。userのプロフィール画像とユーザー名をここに呼び出したい。
    
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
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    flash.now[:notice] 
    render edit_book_path
    end 
  end 
  # 成功したらshow、失敗したらeditにそのまま
  
  private
  
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
end 
