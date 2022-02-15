module ControllerHelper
  
  # creates hash from POST request and sets token
  def set_params_and_token(token_type)
    @params = params[:api].to_unsafe_h
    @call_name ||= @params['call_name']
    @params.delete 'call_name'
    cookies["#{token_type}_token"] = 'foo' if Rails.env.development? #todo delete before pushing
    @token = cookies["#{token_type}_token"]
  end

  # gets list of active tokens
  def active_tokens
    @active_tokens = %i[] 
    %i[DATA CTI MONITORING ADMINACCTMGMT ENDUSERACCTMGMT].map(&:downcase).each do |token|
      @active_tokens << token.to_s if cookies["#{token}_token"]
    end
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
               ['AST', 'AST'],
               ['PST', 'PST'],
               ['MST', 'MST'],
               ['PNT', 'PNT'],
               ['CST', 'CST'],
               ['IET', 'IET'],
               ['PRT', 'PRT'],
               ['AGT', 'AGT'],
               ['BET', 'BET'],
               ['GMT', 'GMT'],
               ['UCT', 'UCT'],
               ['CET', 'CET'],
               ['ART', 'ART'],
               ['CAT', 'CAT'],
               ['EAT', 'EAT'],
               %w[NET NET],
               ['PLT', 'PLT'],
               ['BST', 'BST'],
               ['VST', 'VST'],
               ['CTT', 'CTT'],
               ['JST', 'JST'],
               ['ACT', 'ACT'],
               ['AET', 'AET'],
               ['NST', 'NST'],
               ['HAST', 'HAST'],
               ['AKST', 'AKST'],
               ['PDT', 'PDT'],
               ['CDT', 'CDT'],
               ['CNT', 'CNT'],
               ['WET', 'WET'],
               ['WEST', 'WEST'],
               ['CEST', 'CEST'],
               ['EET', 'EET'],
               ['MET', 'MET'],
               ['ICT', 'ICT'],
               ['AWST', 'AWST'],
               ['ACST', 'ACST'],
               ['AEST', 'AEST'],
               ['SST', 'SST'],
               ['NZST', 'NZST'],
               ['EDT', 'EDT']].freeze

end
