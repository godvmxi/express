#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class EvalTemplate < ActionView::TemplateHandler
  def render(template)
    # Add in the instance variables from the view
    @view.send :evaluate_assigns

    # create get a binding for @view
    bind = @view.send(:binding)

    # and local variables if we're a partial
    template.locals.each do |key, value|
      eval("#{key} = #{value}", bind)
    end

    @view.controller.headers["Content-Type"] ||= 'text/plain'

    # evaluate each line and show the original alongside
    # its value
    template.source.split(/\n/).map do |line|
      begin
        line + " => " + eval(line, bind).to_s
      rescue Exception => err
        line + " => " + err.inspect
      end
    end.join("\n")
  end
end
