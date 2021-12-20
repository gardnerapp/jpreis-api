class ReferenceApiController < ApplicationController
  include ReferenceApiReqHelper
  
  def show; end
  
  def create
    @resp = make_request(params.to_unsafe_h)
    render 'calls/resp'
  end
end
