class Response < ActiveRecord::Base
  belongs_to :post
  
  validates_associated :post
  validates_uniqueness_of :secret_key, :on => :update
  validates_presence_of :email, :message

  #assigns secret_key (the same thing appears in Post, is there a better place for this?)
  def after_create
    self.secret_key = secret_keygen
    self.save!
  end

  private

  #generates a unique secret_key (the same thing appears in Post, is there a better place for this?)
  def secret_keygen
    ('k' + Digest.hexencode(rand(9).to_s + self.message[0..2]) + self.id.to_s) 
  end
end
