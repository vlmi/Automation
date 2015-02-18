$global_var = 'asdfasdf'

CONSTANT_NAME = 'war'

class Transport

  @@var_name

  def initialize(options={})
    @speed = options[:speed]
    @size = options[:size]
    @color = options[:color]
    @has_wheels = options[:has_wheels]
  end

attr_reader :size

attr_accessor :color, :speed, :has_wheels


end

class Bicycle < Transport

end

module ModuleName
  class ClassName

  end
end



truck = Transport.new(speed: 50, size: "big", color: 'white', has_wheels: 'true')

