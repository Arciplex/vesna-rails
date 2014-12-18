class PagesController < ApplicationController

  def contact

  end

  def privacy

  end

  def product

  end

  def md5
     render file: 'public/214783d5702b0c95f5911a6e14b83ceb.txt' 
  end

end
