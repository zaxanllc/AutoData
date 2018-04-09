class User < ApplicationRecord
  
  # Restrict which attributes can be changed through mass-assignment
  # (for example, from an HTML form).  The password and
  # password_confirmation attributes are created below when we call
  # `has_secure_password`.
  attr_accessor(:first_name, :last_name, :email, 
                  :password, :password_confirmation)

  validates(:first_name, :presence => true)
  validates(:last_name,  :presence => true)
  validates(:email,      :presence => true)
  has_secure_password
  
  ##############################################################################
  # Tell ActiveRecord how this model relates to other models.
  has_many(:cars)
  
  ##############################################################################
  # Help keep email addresses in a consistent format so we can look
  # them up in the database we can find them regardless of the case
  # and spacing the user entered in a form.
  def self.clean_email (email)
    email.to_s.strip.downcase
  end
  
  ##############################################################################
  # Add a class method that helps us find and authenticate a user
  # based on their email address.  This isn't strictly necessary but
  # it's advisable to keep the majority of your logic in a model or
  # library file.
  def self.authenticate (email, clear_text_password)
    find_by_email(clean_email(email)).try(:authenticate, clear_text_password)
  end
  
  ##############################################################################
  private
  
  ##############################################################################
  # One of the many callbacks you can define on a model.  This one
  # gets called before a user object is validated.
  before_validation do
    # Standardize the email attribute
    self.email = self.class.clean_email(email)
    
    # Why self.email?  This is a parsing ambiguity in Ruby.  If you
    # just use `email = 'foo'` Ruby will create a local variable
    # instead of calling the attribute setter method `email=`.  You
    # only need to use the form `self.something` when doing an
    # assignment through a setter method.
  end

end
