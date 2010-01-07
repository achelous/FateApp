require 'digest'

class Post < ActiveRecord::Base

  has_many :responses 

  validates_presence_of :name, :location_text, :description, :iam, :youare, :upfor
  validates_uniqueness_of :secret_key, :on => :update
  
  # This hash can be extended, but existing mappings must not be altered in production. 
  IdentityOptions = Hash[0 => 'Guy',
                         1 => 'Girl',
                         2 => 'Butch',
                         3 => 'Femme',
                         4 => 'Twink',
                         5 => 'Bear',
                         6 => 'Queer',
                         7 => 'Other',
                         8 => 'Unsure']

  # This hash can be extended, but existing mappings must not be altered in production. 
  UpforOptions = Hash[0 => 'a cup of coffee?',
                      1 => 'dinner and a movie?',
                      2 => 'romance?',
                      3 => 'something innocent?',
                      4 => 'something not so innocent?',
                      5 => 'nice boots...']
 
  #assigns secret_key  (the same thing appears in Response, is there a better place for this?)
  def after_create
    self.secret_key = secret_keygen
    self.save!
  end

  def respond(response)
    responses << response
  end

  private
 
  #generates a unique secret_key (the same thing appears in Response, is there a better place for this?)
  def secret_keygen
    ('k' + Digest.hexencode(rand(9).to_s + self.description[0..2]) + self.id.to_s) 
  end

end
