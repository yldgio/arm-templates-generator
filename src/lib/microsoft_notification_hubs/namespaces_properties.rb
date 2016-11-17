# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../arm/module_definition'
require_relative './module_definition'

module Azure::ARM::NotificationHubs
    #
    # Model object.
    #
    class NamespacesProperties < Azure::ARM::TypeBase

      # @return [String] Microsoft.NotificationHubs/namespaces: The name of
      # the namespace.
      attr_accessor :name

      # @return Microsoft.NotificationHubs/namespaces: The type of the
      # namespace
      attr_accessor :namespace_type

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
        output_object[:name] = serialized_property unless serialized_property.nil?

        serialized_property = object.namespace_type
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:namespaceType] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        NamespacesProperties.serialize_object(hash,self)
        hash
      end

      def self.ds_properties
        result = Array.new 
        result.push :namespace_type
        result
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [NamespacesProperties] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?
        conf = Configurator.new
        conf.parent = output_object

        if object.key?(:name)
          conf.name object[:name]
          object.delete :name
        end

        if object.key?(:namespace_type)
          conf.namespace_type object[:namespace_type]
          object.delete :namespace_type
        end

        output_object
      end

      def get_name_template
        'np'
        end

      def initialize(parent, init)
        super(parent)
        if init.is_a? Hash
          NamespacesProperties.deserialize_object self, init.clone
        end
      end

      # Configuration code
      class Configurator < Azure::ARM::ResourceConfigurator
        attr_accessor :parent
        # @param name
        #        String
        def name(props)
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            @parent.name = props
            return
          end
          @parent.name
        end
        # @param namespace_type
        #        A string, one of 'NotificationHub'
        #        Expression
        def namespace_type(props)
          if props.is_a? String
            fail ArgumentError, "#{props} is an invalid value for @parent.namespace_type" unless ['NotificationHub'].index(props)
            @parent.namespace_type = props
            return
          end
          if @parent.namespace_type.nil? and props.is_a? Azure::ARM::Expression
            @parent.namespace_type = props
          end
          @parent.namespace_type
        end
        def create(init=nil,&block)
          @parent = NamespacesProperties.new nil, init
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