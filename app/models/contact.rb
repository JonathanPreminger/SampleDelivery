class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate =>true

  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "jonathan.mete101514@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
