require 'json'
require 'pry'
class Flash
  attr_reader :now
  def initialize(req)
    @req = req
    @flash = {}
    @now = {}
  end

  def []=(key, value)
    @flash[key] = value
  end

  def[](key)
    unless @now.empty?
      return @now[key]
    end
    if @req.cookies["_rails_lite_app_flash"].nil?
      flash = @flash
    else
      flash = JSON.parse(@req.cookies["_rails_lite_app_flash"])
    end
    flash[key.to_s] || flash[key]
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", path: '/', value: @flash.to_json)
  end

  # def now[]=(key, value)
  #   @now[key] = value
  # end
  #
  # def now[](key)
  #   @now[key]
  # end

end
