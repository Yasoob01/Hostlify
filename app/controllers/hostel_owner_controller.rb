class HostelOwnerController < ApplicationController
  load_and_authorize_resource :User
  def index
  end

end
