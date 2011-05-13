class ThemesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :new, :create, :edit, :update
end