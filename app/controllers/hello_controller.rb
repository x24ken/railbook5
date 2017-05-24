class HelloController < ApplicationController
  def list
    @books = Book.all
  end
end
