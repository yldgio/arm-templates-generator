# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure end
module Azure::ARM end
module Azure::ARM::Cache end

require_relative 'redis_properties'
require_relative 'redis_properties_sku0'
require_relative 'redis'

class Azure::ARM::Template
  def redis(init=nil,&block)
    conf = Azure::ARM::Cache::Redis::Configurator.new self
    conf.create init
    conf.instance_exec(conf.parent,&block) if block
    conf.parent
  end
end

