class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  belongs_to :contact do # singular (pois é apenas um)
    link(:related) { contact_phones_url(object.contact.id) } # object.contact.id => acessa o id do contato dentro do objeto atual (phones)
  end
end