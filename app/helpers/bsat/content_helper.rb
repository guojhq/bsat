module Bsat
  module ContentHelper

    def bsat_brand(title, path: nil, &block)
      content_for(:bsat_brand, block_given? ? capture(&block) : title)
      content_for(:bsat_brand_path, path) if path.present?
    end

    def bsat_content(content = nil, &block)
      content_for(:bsat_content) do
        content_tag(:div, class: 'container-fluid') do
          block_given? ? capture(&block) : content
        end
      end
    end

    def bsat_sidebar_nav
      sidebar_nav = SidebarNav.new(self)
      yield(sidebar_nav) if block_given?
      content_for(:bsat_sidebar_nav_items, sidebar_nav.render)
    end

    def bsat_page_title(title)
      content_for(:bsat_page_title, title)
    end

    def bsat_page_actions
      page_actions = PageActions.new(self)
      yield(page_actions) if block_given?
      content_for(:bsat_page_actions, page_actions.render)
    end

    def bsat_navbar(location)
      navbar_items = Navbar.new(self)
      yield(navbar_items) if block_given?

      location = [:left, :right].find(->{:right}){|l| l == location.try(:to_sym)}
      case location
        when :left  then content_for(:bsat_navbar_left_items, navbar_items.render)
        when :right then content_for(:bsat_navbar_right_items, navbar_items.render)
      end
    end

  end
end
