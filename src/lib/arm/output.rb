# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../../arm/expression'
require_relative '../../arm/models/type_base'

module Azure::ARM

    #
    # Set of output parameters
    #
    # noinspection RubyResolve,RubyResolve
    class Output < Azure::ARM::TypeBase
      # @return [String] Type of output value
      attr_accessor :type

      # @return [String] Value assigned for output
      attr_accessor :value

      #
      # Validate the object. Throws ArgumentError if validation fails.
      #
      def validate
        fail ArgumentError, 'property type is nil' if @type.nil?
        fail ArgumentError, 'property value is nil' if @value.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(output_object, object)
        object.validate

        serialized_property = object.type
        output_object[:type] = serialized_property unless serialized_property.nil?

        serialized_property = object.value
        output_object[:value] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        Output.serialize_object(hash,self)
        hash
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [Output] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?

        deserialized_property = object[:type]
        output_object.type = deserialized_property

        deserialized_property = object[:value]
        output_object.value = deserialized_property

        output_object
      end

      def initialize(parent, init)
        super(parent)
        if init.is_a? Hash
          Output.deserialize_object(self, init)
        end
      end
    end

end
