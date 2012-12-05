module DashboardHelper

  require 'bundler'
  
  def bundled_gems
    Bundler.load.specs
  end
end
