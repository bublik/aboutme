module MessagesHelper
  include ActsAsTaggableOn::TagsHelper

  def message_actions(message)
    return '' if message.user_id != current_user.id && !current_user.admin?
    div_for(message, :class => 'actions') do
      content_tag(:div, '', :class => 'ui-icon ui-icon-wrench', :style => "float: left; margin-right: 0.3em;") +
          link_to(t('edit'), edit_message_path(message)) + " " +
          link_to(t('destroy'), message, :confirm => t('are_you_sure'), :method => :delete)
    end
  end

  def message_created(message)
    created = content_tag(:div, '', :class => 'ui-icon ui-icon-calendar', :style => "float: left; margin-right: 0.3em;") +
        content_tag(:em, I18n.localize(message.created_at, :format => :long)) + ' / ' + content_tag(:strong, message.user.full_name)
    message.user.google_plus_id.blank? ? created : created + ' ' + link_to('Google+', "https://plus.google.com/#{message.user.google_plus_id}?rel=author")
  end

  def message_tags(message)
    return '' if message.tag_list.blank?
    content_tag(:div, :class => 'tags') do
      content_tag(:div, '', :class => 'ui-icon ui-icon-tag', :style => "float: left; margin-right: 0.3em;") +
          message.tag_list.collect { |tag| link_to(tag, msg_tag_path(tag)) }.join(' ').html_safe
    end
  end

end
