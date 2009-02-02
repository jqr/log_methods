# Provides the log_methods macro to log all calls to a certain instance 
# methods.
#
# Note: You have to call log_methods after method defenitions.
# Note: This only works on instance methods currently.
#
#  class Example
#    def blah; 1 + 1; end
#    log_method :blah, :logger => proc { |msg| puts msg }
#
#    def something(number); 42 + number; end
#    log_method :something, :return => true, :logger => :log_it
#
#    def log_it(message); puts message; end }
module LogMethods

  module Mixin
    # Logs values passed to and returned from methods.
    # 
    # Options:
    #  :logger, sets the logging method or procedure, defaults to logger method on
    #    instance object.
    #  :return, shows the return value
    def log_methods(*args)
      options = args.pop if args.last.is_a?(Hash)
      options ||= {}
      logger = options.delete(:logger) || :logger
      
      args.each do |method_name|
        self.send :define_method, "#{method_name}_with_logging" do |*args|
          log_methods_log logger, "\n>> #{self.class.to_s.underscore}.#{method_name}(#{args.collect(&:inspect) * ', '})"
  
          value = nil
          time = Benchmark.realtime do
            method_without_logging = "#{method_name}_without_logging"
            if method(method_without_logging).arity != 0
              value = send(method_without_logging, *args)
            else
              value = send(method_without_logging)
            end
          end
          
          log_methods_log logger, "[#{time} seconds]"
          log_methods_log logger, "=> #{value.inspect.first(100)}..." if options[:return]
          
          value
        end
        self.send :alias_method_chain, method_name, :logging
        
      end
    end
    alias :log_method :log_methods
    
    # Logs a message using logger. Logger can be a symbol or proc to be called
    # with the log message.
    def log_methods_log(logger, message)
      case logger
      when Symbol
        send(logger, message)
      when Proc
        logger.call(message)
      else
        raise "Invalid logger #{logger.inspect}, expected a symbol or proc"
      end
    end

  end

end
