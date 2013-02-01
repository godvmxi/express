#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # hacked version so scripts and stylesheets get full paths
  def compute_public_path(source, dir, ext)
    source  = "/#{dir}/#{source}" unless source.first == "/" || source.include?(":")
    source << ".#{ext}" unless source.split("/").last.include?(".")
    source << '?' + rails_asset_id(source) if defined?(RAILS_ROOT) && %r{^[-a-z]+://} !~ source
    source  = "#{@controller.request.relative_url_root}#{source}" unless %r{^[-a-z]+://} =~ source
    source = "#{controller.request.protocol}#{controller.request.host_with_port}#{controller.request.relative_url_root.to_s}" + source
    source
  end
end
