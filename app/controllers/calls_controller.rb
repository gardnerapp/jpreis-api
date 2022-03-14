class CallsController < ApplicationController
  before_action :set_call, :make_call, only: %i[show]

  # GET /calls or /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1 or /calls/1.json
  def show; end

  private

  def make_call
    @call.send :finalize_req unless @call.req
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_call
    @call = Call.find(params[:id])
  end
end
