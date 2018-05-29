class Admin < ApplicationRecord
  self.table_name = "admins" 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
  
end
