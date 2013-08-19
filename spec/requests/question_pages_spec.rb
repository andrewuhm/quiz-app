require 'spec_helper'

describe "QuestionPages" do
  
  subject { page }
  
  describe "index" do
    
    let(:admin) { FactoryGirl.create(:admin) }
    
    before do
      sign_in admin
      visit questions_path
    end
    
    it { should have_title('All questions') }
    it { should have_content('All questions') }
    
  end
end
