module Bsat
  class SidebarNav < ViewHelper

    def back(label, path, link_to_options: {})
      @content << content_tag(:li) do
        link_to path, link_to_options do
          concat(fa_icon('chevron-left'))
          if label.present?
            concat(' ')
            concat(
              content_tag(:span, label)
            )
          end
        end
      end
    end

    def divider
      @content << content_tag(:li, nil, class: 'divider')
    end

    def link(label, path, icon: nil, badge: nil, active: nil, has_sublevel: nil, link_to_options: {})
      @content << content_tag(:li, class: (active?(active) ? 'active' : nil)) do
        link_to path, link_to_options do
          concat(fa_icon(icon)) if icon.present?
          if label.present?
            concat(' ') if icon.present?
            concat(
              content_tag(:span, label)
            )
          end
          concat(
            content_tag(:span, class: 'sublevel-indicator') do
              fa_icon('chevron-right')
            end
          ) if has_sublevel.present?
          concat(content_tag(:span, badge, class: 'badge')) if badge.present?
        end
      end
    end
  end
end
