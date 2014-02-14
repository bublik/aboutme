module CategoriesHelper

  def navigation_categories
    Category.all.collect do |category|
      div_for(category) do
        edit_links =  if user_signed_in? && current_user.admin?
          link_to('', edit_category_path(category), class: 'glyphicon glyphicon-pencil text-success') +
          link_to('', category, :confirm => 'Are you sure?', :method => :delete, class: 'glyphicon glyphicon-remove text-danger')
        else
          ''.html_safe 
        end
        link_to(h(category.title), category_messages_path(category), :title => category.title, class: "pull-left") + edit_links
      end
    end.join('').html_safe
  end

  def new_category_link
    link_to(content_tag(:div, '',
                        :class => 'ui-icon ui-icon-plus',
                        :style => "float: left; margin-right: 0.3em; width: 15px"),
            new_category_path)
  end
end
