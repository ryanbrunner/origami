class PostsController < InheritedResources::Base
  skip_authorization_check :only => [:index, :show]
  respond_to :html, :xml, :json
  actions :all, :except => :show
end