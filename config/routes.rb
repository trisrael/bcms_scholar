ActionController::Routing::Routes.draw do |map|
    map.namespace('cms') {|cms| cms.content_blocks :updates }

    map.namespace('cms') {|cms| cms.content_blocks :testimonials }

    map.resources :photos

    map.namespace('cms') {|cms| cms.content_blocks :students }

    map.namespace('cms') {|cms| cms.content_blocks :faculty_bios }

    #customize browserCMS, so that Sections get sent to SectionsController with their predefined            #template.
    def setup_section_routing
        yield if Section.table_exists?
    end

    map.namespace('cms') {|cms| cms.content_blocks :page_links }

    map.namespace('cms') {|cms| cms.content_blocks :important_infos }

    map.namespace('cms') {|cms| cms.content_blocks :carousel_pages }
    
    #map.namespace(:cms) {|cms| cms.content_blocks :thumbnailed_images}
    map.routes_for_bcms_lb_photo_gallery
    
    setup_section_routing do
        Section.all(:conditions => {:hidden => false}).each do |section|
            section_path = section.path[1...section.path.size]
            map.connect section_path, :controller => 'ddc/new_sections'
            map.connect section_path + '/:tab', :controller => 'ddc/new_sections'
            map.namespace('cms') do |cms|
                cms.connect section_path, :controller => 'ddc/new_sections'
                cms.connect section_path + '/:tab', :controller => 'ddc/new_sections'
            end
        end
    end
    
    

    map.routes_for_browser_cms
    
    
    

    # The priority is based upon order of creation: first created -> highest priority.

    # Sample of regular route:
    #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
    # Keep in mind you can assign values other than :controller and :action

    # Sample of named route:
    #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
    # This route can be invoked with purchase_url(:id => product.id)

    # Sample resource route (maps HTTP verbs to controller actions automatically):
    #   map.resources :products

    # Sample resource route with options:
    #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

    # Sample resource route with sub-resources:
    #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

    # Sample resource route with more complex sub-resources
    #   map.resources :products do |products|
    #     products.resources :comments
    #     products.resources :sales, :collection => { :recent => :get }
    #   end

    # Sample resource route within a namespace:
    #   map.namespace :admin do |admin|
    #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
    #     admin.resources :products
    #   end

    # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
    # map.root :controller => "welcome"

    # See how all your routes lay out with "rake routes"

    # Install the default routes as the lowest priority.
    # Note: These default routes make all actions in every controller accessible via GET requests. You should
    # consider removing or commenting them out if you're using named routes and resources.
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'

end
