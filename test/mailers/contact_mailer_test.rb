require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact me" do
    contact = Contact.new(
      name: 'cornholio',
      email: 'cornholio@example.com',
      subject: 'Hi',
      content: 'Hello from the internet'
    )

    email = ContactMailer.contact_me(contact).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['gary.meliman@outlook.com'], email.to
    assert_equal ['cornholio@example.com'], email.from
    assert_equal 'Hi', email.subject
    assert_equal 'Hello from the internet', email.body.to_s
  end
end
