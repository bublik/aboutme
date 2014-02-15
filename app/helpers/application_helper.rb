module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  ## Output flash messages
  def render_flash_messages
    content_tag :div, :id => 'flasher' do
      flash.collect do |key,msg|
        content_tag(:div, msg.html_safe, :class => "#{key} ui-state-active" )
      end.join.html_safe
    end unless flash.blank?
  end

  # helper methods
  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords }
  end

  #size 20,40,80,160,200
  def avatar_url(user, size = 48)
    if user.avatar_url.present?
      user.avatar_url
    else
      default_url = "#{root_url}images/me.jpeg"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    end
  end
end
