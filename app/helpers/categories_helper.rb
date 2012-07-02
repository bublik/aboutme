module CategoriesHelper

  def navigation_categories
    Category.all.collect do |category|
      div_for(category) do
        (user_signed_in? && current_user.admin? ?
            content_tag(:div, :class => 'action') {
              link_to(t('edit'), edit_category_path(category)) +
                  link_to(t('destroy'), category, :confirm => 'Are you sure?', :method => :delete) } : ''.html_safe) +
            link_to(h(category.title), category_messages_path(category), :title => category.title)
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
