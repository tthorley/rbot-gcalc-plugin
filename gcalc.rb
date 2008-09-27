# Author: Tad Thorley
# Version 1.0

require 'rubygems'
require 'hpricot'
require 'open-uri'

class GcalcPlugin < Plugin

  def help(plugin, topic="")
    "gcalc <statement> => do some conversions/calculations using Google's calculator"
  end

  def retrieve(m)
    request = m.params.gsub(" ", "+")
    doc = Hpricot(open("http://google.com/search?q=#{request}"))
    response = (doc/"h2.r").first.to_plain_text.gsub(/\[|\]/, "")
    m.reply response
  end

  def privmsg(m)
    request = m.params.gsub(" ", "+")
    doc = Hpricot(open("http://google.com/search?q=#{request}"))
    response = (doc/"h2.r").first.to_plain_text.gsub(/\[|\]/, "")
    m.reply response
  end 
end

plugin = GcalcPlugin.new
plugin.map "gcalc *request", :action => 'retrieve'