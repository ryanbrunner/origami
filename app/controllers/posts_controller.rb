class PostsController < InheritedResources::Base
#  load_and_authorize_resource
  respond_to :html, :xml, :json
  actions :all, :except => :show
end