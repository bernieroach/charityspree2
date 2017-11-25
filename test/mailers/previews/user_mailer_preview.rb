# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def send_signup_email
    user = User.first
    UserMailer.send_signup_email(user)
  end

  def send_donation_receipt
    user = User.first
    donation = Donation.first
    charity = Charity.first
    UserMailer.send_donation_receipt(user,donation,charity)
  end

end
