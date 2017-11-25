class UserMailer < ApplicationMailer

  default :from => 'do_not_reply@charityspree.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for joining www.charityspree.com' )
  end

  def send_donation_receipt(user, donation, charity)
    @user = user
    @donation = donation
    @charity = charity
    mail( :to => @user.email,
    :subject => "Thanks for your donation to #{@charity.name} at www.charityspree.com" )
  end

end


