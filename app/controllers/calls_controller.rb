class CallsController < ApplicationController
  before_action :set_call, only: %i[show]

  # GET /calls or /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1 or /calls/1.json
  def show; end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_call
    @call = Call.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def call_params
    params.require(:call).permit(:req_body, :req_endpoint, :req_verb, :resp_status, :resp_body)
  end
end
