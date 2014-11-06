class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,#, confirmable
         :omniauthable, :omniauth_providers => [:facebook]


  has_many :bookmarks
end
