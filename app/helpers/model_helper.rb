module ModelHelper

  # determines if call has url params
  def query_params?
    !queryparameters.nil?
  end

  # determines if call has xml body params
  def xml_params?
    !xmlparameters.nil?
  end

  # returns list of query params
  def query_params
    queryparameters.split
  end

  # returns list of xml params
  def xml_params
    xmlparameters.split
  end

  # takes call name and turns it into string to be passed to sent
  def to_method
    name.downcase.split.join '_'
  end
end
