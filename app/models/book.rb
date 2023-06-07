class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments,dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search(how,value)
    if how == "0"
        @books =Book.where("title LIKE ?", "#{value}")
    elsif how == "1"
        @books =Book.where("title LIKE ?", "#{value}%")
    elsif how == "2"
        @books =Book.where("title LIKE ?", "%#{value}")
    else
        @books = Book.where(['title LIKE ?', "%#{value}%"])
    end
  end

end
