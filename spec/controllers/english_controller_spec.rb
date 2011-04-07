require 'spec_helper'

describe EnglishController do

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
