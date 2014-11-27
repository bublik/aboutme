module MessagesHelper
  include ActsAsTaggableOn::TagsHelper

  def author(user)
    name_with_image = image_tag(avatar_url(user, 100), :class => 'pull-left img-responsive img-circle',:alt => user.full_name ) + ' ' +
        content_tag(:h2, user.full_name)
    user.google_plus_id.blank? ? name_with_image : name_with_image + ' ' + link_to('Google+', "https://plus.google.com/#{user.google_plus_id}?rel=author")
  end

  def message_created(message)
    content_tag(:time,
                I18n.localize(message.created_at, format: :long),
                date: message.created_at.strftime('%Y-%M-%d'))
  end

  def message_tags(message)
    message.tag_list.collect { |tag| link_to(tag, msg_tag_path(tag), class: 'label label-default') }.join(' ').html_safe
  end

end
