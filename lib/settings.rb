require "tools/value_enums"

class Settings
  
  attr_reader :asset_adjustment, :asset_id, :index_id
  enums %w(LOW, MEDIUM, HIGH)
  
  def initialize
    @asset_adjustment = 30
    @asset_id = '1091826' # Tachlit
    @index_id = 'TA25' # TODO
    @medium_vol = 18
    @high_vol   = 28    
  end
  
  def measure(volatility)
    case 
      when volatility < @medium_vol
        Settings::LOW
      when volatility >= @high_vol
        Settings::HIGH
      else
        Settings::MEDIUM
    end
  end
end
