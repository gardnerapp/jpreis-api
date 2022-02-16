class ManagementApiController < ApplicationController
  include ManagementApiReqHelper
  before_action :set_mngmnt, only: :call

  def index
    @managements = ManagementApi.all

  end

  def show
    @management = ManagementApi.find(params[:id])
  end

  def call
    @resp = @management.admin ? admin_req(@params, @token) : send(@method_name)
    render 'calls/resp'
  end

  private

  def set_mngmnt
    @management = ManagementApi.find params[:api][:id]
    if @management.admin
      set_params_and_token('adminacctmgmt')
      adminacctmgmt_token_filter
    else
      set_params_and_token('enduseracctmgmt')
      enduseracctmgmt_token_filter
    end
    @method_name = @management.to_method
    @endpoint = @management.endpoint
    @method = @management.method
  end

end
