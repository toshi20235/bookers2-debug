class SearchsController < ApplicationController
  def top
    if params[:search].present?
            if params[:model] == "user"
                if params[:how] == "0"
                    @users =User.where("name LIKE ?", "#{params[:search]}")
                elsif params[:how] == "1"
                    @users =User.where("name LIKE ?", "#{params[:search]}%")
                elsif params[:how] == "2"
                    @users =User.where("name LIKE ?", "%#{params[:search]}")
                else
                    @users = User.where(['name LIKE ?', "%#{params[:search]}%"])
                end
            elsif params[:model] == "book"
                if params[:how] == "0"
                    @books =Book.where("title LIKE ?", "#{params[:search]}")
                elsif params[:how] == "1"
                    @books =Book.where("title LIKE ?", "#{params[:search]}%")
                elsif params[:how] == "2"
                    @books =Book.where("title LIKE ?", "%#{params[:search]}")
                else
                    @books = Book.where(['title LIKE ?', "%#{params[:search]}%"])
                end
            end
        end
  end
end
