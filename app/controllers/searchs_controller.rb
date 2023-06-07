class SearchsController < ApplicationController
 def top
    if params[:search].present?
        if params[:model] == "user"
          @users =User.search(params[:how],params[:search])
        elsif params[:model] == "book"
          @books =Book.search(params[:how],params[:search])
        end
    end
 end
end
