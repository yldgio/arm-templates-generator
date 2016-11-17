# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../arm/module_definition'
require_relative './module_definition'

module Azure::ARM::Network
    #
    # Model object.
    #
    class FrontendIPConfigurationsProperties < Azure::ARM::TypeBase

      # @return [Id]
      attr_accessor :subnet

      # @return [String]
      attr_accessor :private_ipaddress

      # @return
      attr_accessor :private_ipallocation_method

      # @return [Id]
      attr_accessor :public_ipaddress

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @subnet.validate unless @subnet.nil?
        @public_ipaddress.validate unless @public_ipaddress.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(output_object, object)
        Azure::ARM::TypeBase.serialize_object(output_object, object)
        object.validate

        serialized_property = object.subnet
        unless serialized_property.nil?
          serialized_property = serialized_property.to_h
        end
        output_object[:subnet] = serialized_property unless serialized_property.nil?

        serialized_property = object.private_ipaddress
        output_object[:privateIPAddress] = serialized_property unless serialized_property.nil?

        serialized_property = object.private_ipallocation_method
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:privateIPAllocationMethod] = serialized_property unless serialized_property.nil?

        serialized_property = object.public_ipaddress
        unless serialized_property.nil?
          serialized_property = serialized_property.to_h
        end
        output_object[:publicIPAddress] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        FrontendIPConfigurationsProperties.serialize_object(hash,self)
        hash
      end

      def self.ds_properties
        result = Array.new 
        result.push :subnet
        result.push :private_ipaddress
        result.push :private_ipallocation_method
        result.push :public_ipaddress
        result
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [FrontendIPConfigurationsProperties] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?
        conf = Configurator.new
        conf.parent = output_object

        if object.key?(:subnet)
          conf.subnet object[:subnet]
          object.delete :subnet
        end

        if object.key?(:private_ipaddress)
          conf.private_ipaddress object[:private_ipaddress]
          object.delete :private_ipaddress
        end

        if object.key?(:private_ipallocation_method)
          conf.private_ipallocation_method object[:private_ipallocation_method]
          object.delete :private_ipallocation_method
        end

        if object.key?(:public_ipaddress)
          conf.public_ipaddress object[:public_ipaddress]
          object.delete :public_ipaddress
        end

        output_object
      end

      def get_name_template
        'fipcp'
        end

      def initialize(parent, init)
        super(parent)
        if init.is_a? Hash
          FrontendIPConfigurationsProperties.deserialize_object self, init.clone
        end
      end

      # Configuration code
      class Configurator < Azure::ARM::ResourceConfigurator
        attr_accessor :parent
        # @param subnet
        #        Id
        def subnet(props)
          if @parent.subnet.nil? and props.is_a? Id
            @parent.subnet = props
            @parent.subnet.parent = @parent
            @parent.subnet._rsrcpath = 'subnet'
          end
          if @parent.subnet.nil? and (props.is_a? Hash) and (Azure::ARM::TypeBase.matches_type props, Id)
            @parent.subnet = Id.new(@parent, props)
            @parent.subnet._rsrcpath = 'subnet'
          end
          if @parent.subnet.nil? and (props.respond_to? :to_rsrcid)
            @parent.subnet = Id.new(@parent, id: props.to_rsrcid.to_s)
            if props.is_a? Azure::ARM::TypeBase and !props.containing_resource.nil?
              @parent.containing_resource.add_dependency props.containing_resource
            end
          end
          @parent.subnet
        end
        # @param private_ipaddress
        #        String
        def private_ipaddress(props)
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            @parent.private_ipaddress = props
            return
          end
          @parent.private_ipaddress
        end
        # @param private_ipallocation_method
        #        A string, one of 'Dynamic','Static'
        #        Expression
        def private_ipallocation_method(props)
          if props.is_a? String
            fail ArgumentError, "#{props} is an invalid value for @parent.private_ipallocation_method" unless ['Dynamic','Static'].index(props)
            @parent.private_ipallocation_method = props
            return
          end
          if @parent.private_ipallocation_method.nil? and props.is_a? Azure::ARM::Expression
            @parent.private_ipallocation_method = props
          end
          @parent.private_ipallocation_method
        end
        # @param public_ipaddress
        #        Id
        def public_ipaddress(props)
          if @parent.public_ipaddress.nil? and props.is_a? Id
            @parent.public_ipaddress = props
            @parent.public_ipaddress.parent = @parent
            @parent.public_ipaddress._rsrcpath = 'publicIPAddress'
          end
          if @parent.public_ipaddress.nil? and (props.is_a? Hash) and (Azure::ARM::TypeBase.matches_type props, Id)
            @parent.public_ipaddress = Id.new(@parent, props)
            @parent.public_ipaddress._rsrcpath = 'publicIPAddress'
          end
          if @parent.public_ipaddress.nil? and (props.respond_to? :to_rsrcid)
            @parent.public_ipaddress = Id.new(@parent, id: props.to_rsrcid.to_s)
            if props.is_a? Azure::ARM::TypeBase and !props.containing_resource.nil?
              @parent.containing_resource.add_dependency props.containing_resource
            end
          end
          @parent.public_ipaddress
        end
        def create(init=nil,&block)
          @parent = FrontendIPConfigurationsProperties.new nil, init
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