class Settings
  
  attr_reader :asset_adjustment, :asset_id, :index_id
  
  def initialize
    @asset_adjustment = 30
    @asset_id = '1091826' # Tachlit
    @index_id = 'TA25' # TODO
  end
  
end
