require_dependency 'layouts/base_public.rb'
class Layouts::Publik < Layouts::BasePublic
  include do
    def html
      content_for :before_stylesheet_libraries do
        stylesheet_link_tag("screen", :cache => "compiled/public")
      end
      super
    end
    
    def build 
      #self << raw('<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fjoufdesign.com&amp;send=false&amp;layout=box_count&amp;width=450&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=lucida+grande&amp;height=90" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:62px; height:90px;" allowTransparency="true"></iframe>')   
      render_header 
      div(:id => "wrapper-wide-categories", :class => "wrapper-wide") do
        block.call(:categories)  
      end
      render_content
      render_footer
    end

    def crumbs
      # no crumbs
    end
    
    def sidebar_location
      'left'
    end
  end
end
