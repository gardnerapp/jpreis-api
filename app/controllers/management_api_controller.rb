class ManagementApiController < ApplicationController
  before_action :set_mngmnt, only: :call

  def index
    @managements = ManagementApi.all

  end

  def show
    @management = ManagementApi.find(params[:id])
  end

  def call

  end

  private

  def set_mngmnt
    @management = ManagementApi.find params[:api][:id]
    if @management.admin
      adminacctmgmt_token_filter
      set_params_and_token('adminacctmgmt')
    else
      enduseracctmgmt_token_filter
      set_params_and_token('enduseracctmgmt')
    end
  end

end
