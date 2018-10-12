class ReceiptMailer < ApplicationMailer
  default from: 'no.reply.jungle@gmail.com'


  def receipt_email(user, order)
    @order = order
    mail(to: user.email, subject: "Receipt for order: #{order.id}")
  end
end
