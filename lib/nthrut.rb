#!/usr/bin/env ruby

# file: nthrut.rb

require 'haml'
require 'slim'
require 'tilt'



class NThrut

  def initialize(parent)
    
    @parent = parent
    @templates = {}
    
  end
  
  # jr 140616 not yet used and still needs to be tested
  def transform(xsl, xml)
    Rexslt.new(xsl, xml).to_s
  end

  def haml(name,options={})    
    render name, :haml, options
  end   
  
  def slim(name,options={})
    render name, :slim, options
  end  
  
  def template(name, type=nil, &blk)
    @templates.merge!({name => {content: blk.call, type: type}})
    @templates[name]
  end                  
  
  
  private

  def render(name, type, opt={})
    
    options = {locals: {}}.merge!(opt)
    locals = options.delete :locals
    
    unless @templates[:layout] then
      template(:layout, type) { File.read('views/layout.' + type.to_s) }
    end
    
    layout = Tilt[type.to_s].new(options) {|x| @templates[:layout][:content]}    

    unless @templates[name] then
      template(name, type) { File.read("views/%s.%s" % [name.to_s, type.to_s])}
    end    

    template = Tilt[type.to_s].new(options) {|x| @templates[name][:content]}
    layout.render{ template.render(@parent, locals)}
  end            
  
  def tilt(name, options={})
    
    options = {locals: {}}.merge!(opt)
    locals = options.delete :locals
    layout = Tilt[@templates[:layout][:type].to_s].new(options)\
        {|x| @templates[:layout][:content]}
    template = Tilt[@templates[name][:type].to_s].new(options) \
        {|x| @templates[name][:content]}
    layout.render{ template.render(@parent, locals)}
    
  end    
  
end
