=begin

BETTERCAP

Author : Simone 'evilsocket' Margaritelli
Email  : evilsocket@gmail.com
Blog   : http://www.evilsocket.net/

This project is released under the GPL 3 license.

=end
require_relative '../logger'

module Proxy

class Module
  @@modules = []

  def self.modules
    @@modules
  end

  def self.register_modules
    Object.constants.each do |klass|
      const = Kernel.const_get(klass)
      if const.respond_to?(:superclass) and const.superclass == self
        Logger.debug "Registering module #{const}"
        @@modules << const.new
      end
    end
  end
end

end
