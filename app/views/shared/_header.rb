class Shared::Header < Minimal::Template
  include do
    def to_html
      div(:id => "masterhead") { render(:partial => '/shared/menu', 
        :locals => {
          :sections => @tools_menu, 
          :menu_name => "tools"})  }
      div(:id => "site-title-container") { site_title } 
      render(:partial => '/shared/menu', 
        :locals => {
          :sections => @main_menu, 
          :menu_name => "primary"})
    end

    def site_title
      link_to(root_url, :id => "logo") do
        image_tag("/images/logo.png", :alt => "Avec la solution Internet de Jouf Design vous maitrisez en toute simplicité tous les contenus de votre site au graphisme professionnel.")
      end
      h2(:id => :'site-title') { capture { link_to(site.title, root_url) } }
      #h4(:id => :'site-subtitle') { site.subtitle } if site.subtitle.present?
      link_to("/nos-packs-metiers", :id => "demo_link") do
        image_tag("/images/demo_btn.png")
      end
    end
  end
end