require 'spec_helper'
describe CategoriesHelper do
  it 'should return categories list block' do
    mock_category = stub_model(Category, :title => 'cat title', :id => '99')

    Category.stub(:all){[mock_category]}
    helper.stub(:user_signed_in?){true}
    
    helper.navigation_categories.should have_selector('div', :class => 'category') do |body|
      body.xpath("a[@title='cat title']")
      body.xpath("div[@class='action']")
    end
  end
end
