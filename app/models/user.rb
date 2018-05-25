class User < ApplicationRecord

  # after_create :confirmation_token1
  after_create :after_confirmation_path_for

  before_save :save_changes 


  def changed_data
    for i in self.changes
        
    end
  end


  def save_changes
    @n = self.changes.count

    puts "Changes Count is : #{@n}"

    @hash = Hash.new { |hash, key| hash[key] = [] }

    # =====
    # example: for add one hash to another
    # hash = Hash.new { |hash, key| hash[key] = [] }

    # raw_data = [ [1, 'a'], [1, 'b'], [1, 'c'],
    #            [2, 'a'], [2, ['b', 'c']],
    #            [3, 'c'] ]
    # raw_data.each { |x,y| hash[x] << y }
    
      #another example
      # Put this in an initializer

      # class Hash
      #   def filter(*args)
      #     return nil if args.try(:empty?)
      #     if args.size == 1
      #       args[0] = args[0].to_s if args[0].is_a?(Symbol)
      #       self.select {|key| key.to_s.match(args.first) }
      #     else
      #       self.select {|key| args.include?(key)}
      #     end
      #   end
      # end
      # Then you can do

      # {a: "1", b: "b", c: "c", d: "d"}.filter(:a, :b) # =>  {a: "1", b: "b"}
    # ======


    self.changes.each do |keys, values|
      if keys.match("first_name" || "last_name" || "username" || "date_of_birth")
        @hash[keys] = values
      end
    end
    puts "=========-------"
    
    puts "#{@hash}"
    
    puts "=========-------"
    #for i in @n.keys
      if @hash == 0
        puts "No Updates"
      else
        UserMailer.signup_confirmation(@hash,self).deliver_now
      end
    #end

  end

  def after_confirmation_path_for
    UserMailer.after_confirmation(changes.keys, self).deliver_now
  end

  

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 
  #validates :username,uniqueness: true

  # def send_welcome_email
  #   @user = first_name
  #   UserMailer.welcome_email(first_name).deliver_now
  # end

  has_many :projects


  #private
    # def ensure_login_has_a_value
    #   if login.nil?
    #     self.login = email unless email.blank?
    #   end
    # end
  
  
  # def before_save
  #   @was_a_new_record = new_record?
  #   return true
  # end

  # def after_save
  #    if @was_a_new_record
  #      return @object.instance_variable_get(:@new_record_after_save)
  #    end
  # end


  # after_update :send_email
  # protected

  # def send_email
  #   if column_name_changed? && !email_sent?
  #     # Send email here
  #     update_attribute :email_sent, true
  #   end
  # end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  private
    # def confirmation_token1
    #   if self.confirm_token.blank?
    #       self.confirm_token = SecureRandom.urlsafe_base64.to_s
    #   end
    # end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  
=begin  def confirmation_required?
    false
    #true
  end
  def email_required?
    false
  end
=end

  # use this instead of email_changed? for rails >= 5.1
  
end

