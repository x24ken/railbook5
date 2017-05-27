class RecordController < ApplicationController
  def find
    @books = Book.find([2, 5, 10])
    render 'hello/list'
  end
  
  def find_by
    @book = Book.find_by(publish: '技術評論社')
    render 'books/show'
  end
  
  def find_by2
    @book = Book.find_by(publish: '技術評論社', price: 2980)
    render 'books/show'
  end
  
  def where
    @books = Book.where(publish: ['技術評論社', '翔泳社'])
    render 'hello/list'
  end
  
  def keyword
  end
  
  # def ph1
  #   @books = Book.where('publish = ? AND price >= ?',
  #   params[:publish], params[:price])
  #   render 'hello/list'
  # end
  
  def ph1
    @books = Book.where('publish = :publish AND price >= :price',
              publish: params[:publish], price: params[:price])
    render "hello/list"
  end
end
