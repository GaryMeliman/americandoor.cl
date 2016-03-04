require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test 'responds to name, email, subject and content' do
    contact = Contact.new
    [:name, :email, :subject, :content].each do |attr|
      assert contact.respond_to? attr
    end
  end
  test 'should accept valid attributes' do
    valid_attrs = {
      name: 'stephen',
      email: 'stephen@example.com',
      subject: 'hi',
      content: 'kthnxbai'
    }

    contact = Contact.new valid_attrs

    assert contact.valid?
  end
  test 'attributes can not be blank' do
    contact = Contact.new
    refute contact.valid?
  end
  test "failed post" do
    post :create, message: {\
      name: '',
      email: '',
      subject: '',
      content: ''
    }

    [:name, :email, :subject, :content].each do |attr|
      assert_select 'li', "#{attr.capitalize} can't be blank"
    end
  end
end
