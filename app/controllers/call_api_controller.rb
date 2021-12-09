class CallApiController < ApplicationController
  include CallApiReqHelper
  before_action :cti_token_filter, only: :call
  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
    @resp = plain_req(params[:api].to_unsafe_h, cookies['cti_token'])
    render 'calls/resp'
  end

end
