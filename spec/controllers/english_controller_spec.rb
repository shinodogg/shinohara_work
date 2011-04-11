require 'spec_helper'

describe EnglishController do
fixtures :quizzes
fixtures :users_quizzes
include Devise::TestHelpers

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
    # mock up an authentication in the underlying warden library
    request.env['warden'] = mock(Warden, :authenticate => mock_user,
                                         :authenticate! => mock_user)
  end
  #before (:each) do
  #  @user = Factory.create(:user)
  #  sign_in @user
  #end
  
  describe "GET 'study'" do
    it "should be successful" do
      get 'study'
      response.should be_success
    end
  end

  describe "GET 'answer'" do
    it "should be successful" do
      get 'answer'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end

end
