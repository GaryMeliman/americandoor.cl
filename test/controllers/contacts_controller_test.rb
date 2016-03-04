require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  test "succesful post" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post :create, message: {
        name: 'cornholio',
        email: 'cornholio@example.com',
        subject: 'hi',
        content: 'bai'
      }
    end

    assert_redirected_to new_contact_path
    last_email = ActionMailer::Base.deliveries.last

    assert_equal "hi", last_email.subject
    assert_equal 'gary.meliman@outlook.com', last_email.to[0]
    assert_equal 'cornholio@example.com', last_email.from[0]
    assert_match(/bai/, last_email.body.to_s)

    ActionMailer::Base.deliveries.clear
  end
end
