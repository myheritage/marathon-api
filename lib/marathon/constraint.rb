# This class represents a Marathon Constraint.
# See https://mesosphere.github.io/marathon/docs/constraints.html for full details.
class Marathon::Constraint

  attr_reader :info

  # Create a new constraint object.
  # ++array++: Array returned by API, attribute, operator and parameter.
  def initialize(array)
    raise Marathon::Error::ArgumentError, 'array must be an Array' unless array.is_a?(Array)
    raise Marathon::Error::ArgumentError,
      'array must be [attribute, operator, parameter] where only parameter is optional' \
      unless array.size != 2 or array.size != 3
    @info = array
  end

  def attribute
    @info[0]
  end

  def operator
    @info[1]
  end

  def parameter
    @info[2]
  end

  def to_s
    if parameter
      "Marathon::Constraint { :attribute => #{attribute} :operator => #{operator} :parameter => #{parameter} }"
    else
      "Marathon::Constraint { :attribute => #{attribute} :operator => #{operator} }"
    end
  end

  # Return deployment info as JSON formatted string.
  def to_json
    @info.to_json
  end
end