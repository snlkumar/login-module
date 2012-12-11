module DashboardHelper

  require 'bundler'
  def bundled_gems
    Bundler.load.specs
  end
  
  def convert_list_to_ul_block(rdocname)
    # needed to share lists between dashboard and github README
    # convert simple '-' rdoc list to a <ul> block
    filename = Rails.root.join('doc', rdocname)
    if File.exist?(filename) and File.file?(filename)
      html = "<ul>"
      File.read(filename).each_line do |item|
        html += (item.gsub(/^-/,'<li>') + '</li><br />') if item =~ /^-/
      end
      return html + "</ul>"
    end
    ""
  end

end
