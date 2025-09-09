class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def new
    @count = Book.count
    @book = Book.new(id: @count + 1)
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save 
      flash[:notice] = "New Book Created Successfully"
      redirect_to books_path
    else
      flash[:warning] = @book.errors.full_messages.to_sentence
      # render('new')
      redirect_to books_path
    end 
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book Updated Successfully"
      #  redirect_to book_path(@book)
       redirect_to books_path
    else 
      # render('edit')
      flash[:warning] = @book.errors.full_messages.to_sentence
      redirect_to books_path
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
     @book = Book.find(params[:id])
     @book.destroy
     flash[:warning] = "Book permanently deleted"
     redirect_to books_path
  end


  private

  def book_params
     params.require(:book).permit(
      :title,
      :author,
      :price,
      :published_date
    )
  end 
end

