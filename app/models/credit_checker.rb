class CreditChecker < ApplicationRecord

  # attr_accessor :credit_checker_fields, :user_fields, :project_fields

  belongs_to :user
  belongs_to :project

  # validate :count
  # validate :history

  # before_save :check_history             #, on: :update#, if: :count_changed? 

  # ========
  # def validate_approval
  #   @hash = Hash.new{ |h,k| h[k] = []}
  #   self.changes.each{ |k,v| @hash[k] << v }
    
  #   if @hash.fetch('approved')[0][1] == true
  #     user.credits += 1
  #     user.save
  #   else
  #     user.credits -= 1
  #     user.save
  #   end
  # end
  # ========

  # def check_history

  #   #self = self.find(:id)
  #   @u = User.find(user_id)
  #   @p = Project.find(project_id)

  #   @hash = Hash.new{ |h,k| h[k] = []}
  #   self.changes.each{ |k,v| @hash[k] << v }
  #   #self.count = 0;
  #   if project.approved == true
  #     puts "calling credit 1......."
  #     self.count = user.credits
  #     if self.history.nil? && user.credits != 0
  #       self.history = "credits for these projects approved : " + project.id.to_s
  #       #self.history.save
  #     else
  #       self.history = "this project is not yet approved : "  + project.id.to_s    
  #       #self.history.save
  #     end
      
  #   else 
  #     puts "calling credit 2......"
  #   end
    
  # end

end