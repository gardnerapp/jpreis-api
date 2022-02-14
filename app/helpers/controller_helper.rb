module ControllerHelper
  
  # creates hash from POST request and sets token
  def set_params_and_token(token_type)
    @params = params[:api].to_unsafe_h
    @token = cookies["#{token_type}_token"]
  end

  # Form Ip Addresses
  IP_ADDRESSES = [
    %w[127.0.0.1 127.0.0.1],
    %w[127.0.10.1 127.0.10.1],
    %w[198.35.66.0 198.35.66.0]
  ].freeze

  # form timezones
  TIMEZONES = [%w[EST EST],
               %w[IST IST],
               %w[MIT MIT],
               %w[HST HST],
               ["AST", "AST"],
               ["PST", "PST"],
               ["MST", "MST"],
               ["PNT", "PNT"],
               ["CST", "CST"],
               ["IET", "IET"],
               ["PRT", "PRT"],
               ["AGT", "AGT"],
               ["BET", "BET"],
               ["GMT", "GMT"],
               ["UCT", "UCT"],
               ["CET", "CET"],
               ["ART", "ART"],
               ["CAT", "CAT"],
               ["EAT", "EAT"],
               %w[NET NET],
               ["PLT", "PLT"],
               ["BST", "BST"],
               ["VST", "VST"],
               ["CTT", "CTT"],
               ["JST", "JST"],
               ["ACT", "ACT"],
               ["AET", "AET"],
               ["NST", "NST"],
               ["HAST", "HAST"],
               ["AKST", "AKST"],
               ["PDT", "PDT"],
               ["CDT", "CDT"],
               ["CNT", "CNT"],
               ["WET", "WET"],
               ["WEST", "WEST"],
               ["CEST", "CEST"],
               ["EET", "EET"],
               ["MET", "MET"],
               ["ICT", "ICT"],
               ["AWST", "AWST"],
               ["ACST", "ACST"],
               ["AEST", "AEST"],
               ["SST", "SST"],
               ["NZST", "NZST"],
               ["EDT", "EDT"]].freeze

end
