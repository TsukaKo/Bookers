class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: '登録できました'
    else
      flash.now[:alert] = "登録に失敗しました"
      render :index
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

 def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book), notice: '登録できました'
    else
       render :edit
    end
 end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
   params.require(:book).permit(:title,:body)
  end


end
