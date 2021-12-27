class ManagementApiController < ApplicationController

  before_action :adminacctmgmt_token_filter, -> { set_params_and_token('adminacctmgmt') }
  before_action :enduseracctmgmt_token_filter, -> {set_params_and_token('enduseracctmgmt') }

  # TODO add admin vs end_user clause callbacks

  def index
    @managements = ManagementApi.all

  end

  def show
    @management = ManagementApi.find(params[:id])
  end

  def call; end

end
