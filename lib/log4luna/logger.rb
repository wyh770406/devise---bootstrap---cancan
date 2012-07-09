# encoding: utf-8
require 'logger'
module Log4luna
  module Logger
    def logger_file
      #dir  = File.dirname(__FILE__)
      #if self.class != Object
      #  file = self.class.to_s.split("::")[-1].underscore + ".log"
      #else
      #  file = File.basename($0).sub("_", "_#{SpiderOptions[:name]}_") + ".log"
      #end
      #File.join(dir, '..')

      #"/home/wyh77/luna-server/log/luna.log"
      #"/var/log/luna.log"
      File.join(Rails.root, 'log', 'luna2.log')
    end

    def logger

      @logger ||= begin

        @logger = ::Logger.new(self.logger_file)

        @logger.level = ::Logger::INFO
        @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
        @logger
      end
    end
  end
end