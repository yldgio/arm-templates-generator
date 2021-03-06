# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../arm/module_definition'
require_relative './module_definition'

module Azure::ARM::Cache
    #
    # Model object.
    #
    class RedisPropertiesSku0 < Azure::ARM::TypeBase

      # @return Microsoft.Cache/Redis/sku: determines features and pricing of
      # the cache
      attr_accessor :name

      # @return Microsoft.Cache/Redis/sku: along with capacity, determines
      # capacity of the cache
      attr_accessor :family

      # @return Microsoft.Cache/Redis: along with family, determines capacity
      # of the cache
      attr_accessor :capacity

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(output_object, object)
        Azure::ARM::TypeBase.serialize_object(output_object, object)
        object.validate

        serialized_property = object.name
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:name] = serialized_property unless serialized_property.nil?

        serialized_property = object.family
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:family] = serialized_property unless serialized_property.nil?

        serialized_property = object.capacity
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:capacity] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        RedisPropertiesSku0.serialize_object(hash,self)
        hash
      end

      def self.ds_properties
        result = Array.new 
        result.push :family
        result.push :capacity
        result
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [RedisPropertiesSku0] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?
        conf = Configurator.new
        conf.parent = output_object

        if object.key?(:name)
          conf.name object[:name]
          object.delete :name
        end

        if object.key?(:family)
          conf.family object[:family]
          object.delete :family
        end

        if object.key?(:capacity)
          conf.capacity object[:capacity]
          object.delete :capacity
        end

        output_object
      end

      def get_name_template
        'rps'
        end

      def initialize(parent, init)
        super(parent)
        @name = Standard if @name.nil?
        @family = C if @family.nil?
        @capacity = 1 if @capacity.nil?
        if init.is_a? Hash
          RedisPropertiesSku0.deserialize_object self, init.clone
        end
      end

      # Configuration code
      class Configurator < Azure::ARM::ResourceConfigurator
        attr_accessor :parent
        # @param name
        #        A string, one of 'Basic','Standard','Premium'
        #        Expression
        def name(props)
          if props.is_a? String
            fail ArgumentError, "#{props} is an invalid value for @parent.name" unless ['Basic','Standard','Premium'].index(props)
            @parent.name = props
            return
          end
          if @parent.name.nil? and props.is_a? Azure::ARM::Expression
            @parent.name = props
          end
          @parent.name
        end
        # @param family
        #        A string, one of 'C','P'
        #        Expression
        def family(props)
          if props.is_a? String
            fail ArgumentError, "#{props} is an invalid value for @parent.family" unless ['C','P'].index(props)
            @parent.family = props
            return
          end
          if @parent.family.nil? and props.is_a? Azure::ARM::Expression
            @parent.family = props
          end
          @parent.family
        end
        # @param capacity
        #        Fixnum
        #        Expression
        def capacity(props)
          if props.is_a? Fixnum or props.is_a? Azure::ARM::Expression
            @parent.capacity = props
            return
          end
          if @parent.capacity.nil? and props.is_a? Azure::ARM::Expression
            @parent.capacity = props
          end
          @parent.capacity
        end
        def create(init=nil,&block)
          @parent = RedisPropertiesSku0.new nil, init
          self.instance_exec(@parent,&block) if block
          @parent
        end
      end
      def configure(&block)
        conf = Configurator.new
        conf.parent = self
        conf.instance_exec(self,&block) if block
        self
      end
    end
end
