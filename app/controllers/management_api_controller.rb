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
    @method_name = @management.to_method
    @endpoint = @management.endpoint
    @method = @management.method
    if @management.admin
      # todo uncomment adminacctmgmt_token_filter
      set_params_and_token('adminacctmgmt')
    else
      #  enduseracctmgmt_token_filter
      set_params_and_token('enduseracctmgmt')
    end
  end

end
