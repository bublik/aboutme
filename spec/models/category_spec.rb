require 'spec_helper'

describe Category do
  it 'should not be valid category' do
    category = Category.new()
    category.valid?.should_not be_true
    category.errors[:title].should_not be_blank
  end

  it 'should render cool to_param string' do
    category = Category.new(:title => 'my title')
    category.save
    category.to_param.should match(/\d-\w/)
  end
end
