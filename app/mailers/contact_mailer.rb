class ContactMailer < ApplicationMailer
  default from: "admin@example.com"

  def general_message(contact)
    @contact = contact
    mail( :to => "jonathan.mete@hotmail.com", :subject => "SampleDeliveryRecords")
  end
end
