module ApplicationHelper

  ## Output flash messages
  def render_flash_messages
    content_tag :div, :id => 'flasher' do
      flash.collect do |key,msg|
        content_tag(:div, content_tag(:p, msg.html_safe), :class => key)
      end.join.html_safe
    end unless flash.blank?
  end

end
