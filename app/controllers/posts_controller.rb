class PostsController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :all, :except => :show
end