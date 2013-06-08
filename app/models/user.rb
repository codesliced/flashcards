class User < ActiveRecord::Base
    validates :first_name, :last_name, :password, :email, :presence => :true
    validates :email, :uniqueness => :true
    validates :password, :length => { :minimum => 6 }
    has_many :rounds


  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    p @user = User.new(params)
    p @user.password = (params[:password])
    @user.save!
    @user
  end

  def self.get_rounds_by_user_id(user_id)
    self.find(user_id).rounds
  end

end
