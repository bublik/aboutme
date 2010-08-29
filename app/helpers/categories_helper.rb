module CategoriesHelper

  def navigation_categories
    Category.all.collect do |category|
      div_for(category) do
        link_to(category.title, category_messages_path(category), :title => category.title) +
          (user_signed_in? ?
            content_tag(:div, :class => 'action'){
            link_to(t('edit'), edit_category_path(category)) +
              link_to(t('destroy'), category, :confirm => 'Are you sure?', :method => :delete)} : '')
        
      end
    end
  end

  def new_category_link
    link_to(content_tag(:div, '', :class => 'ui-icon ui-icon-plus', :style => "float: left; margin-right: 0.3em; width: 15px"),
      new_category_path, :class => '')
  end
end
