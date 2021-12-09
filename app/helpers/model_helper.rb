module ModelHelper
  def query_params?
    !queryparameters.nil?
  end

  def xml_params?
    !xmlparameters.nil?
  end

  def xml_params
    xmlparameters.split
  end

  def query_params
    queryparameters.split
  end
end
