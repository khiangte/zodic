class AddMasterUser < ActiveRecord::Migration
  def self.up
  	execute("insert into contributors (email,encrypted_password,password_salt)values('admin@zodic.in','60f958b14e6d4d3058fe4290e8ab7dd595d92512','EyZnKwSUVUEsCptRSMWD');")
  	execute("insert into users (email,admin)values('admin@zodic.in',true);")

  end

  def self.down
    execute("DELETE FROM contributors WHERE email = 'admin@zodic.in';")
    execute("DELETE FROM users WHERE email = 'admin@zodic.in';")
  end
end
