class HelloController < ApplicationController
  def list
    @books = Book.all
  end
  
  def view
    @msg = 'こんにちは、世界！'
  end
  

end
