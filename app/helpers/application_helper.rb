module ApplicationHelper

  ## Output flash messages
  def render_flash_messages
    content_tag :div, :id => 'flasher' do
      flash.collect do |key,msg|
        content_tag(:div, msg.html_safe, :class => "#{key} ui-state-active" )
      end.join.html_safe
    end unless flash.blank?
  end


  def title(page_title)
    content_for(:title) { page_title }
  end
end
