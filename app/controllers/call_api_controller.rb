class CallApiController < ApplicationController
  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
  end
  # TODO token filter
end
