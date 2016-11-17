# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../arm/module_definition'
require_relative './module_definition'

module Azure::ARM::Compute
    #
    # Model object.
    #
    class LinuxConfiguration < Azure::ARM::TypeBase

      # @return
      attr_accessor :disable_password_authentication

      # @return [Ssh]
      attr_accessor :ssh

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @ssh.validate unless @ssh.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(output_object, object)
        Azure::ARM::TypeBase.serialize_object(output_object, object)
        object.validate

        serialized_property = object.disable_password_authentication
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:disablePasswordAuthentication] = serialized_property unless serialized_property.nil?

        serialized_property = object.ssh
        unless serialized_property.nil?
          serialized_property = serialized_property.to_h
        end
        output_object[:ssh] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        LinuxConfiguration.serialize_object(hash,self)
        hash
      end

      def self.ds_properties
        result = Array.new 
        result.push :disable_password_authentication
        result.push :ssh
        result
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [LinuxConfiguration] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?
        conf = Configurator.new
        conf.parent = output_object

        if object.key?(:disable_password_authentication)
          conf.disable_password_authentication object[:disable_password_authentication]
          object.delete :disable_password_authentication
        end

        if object.key?(:ssh)
          conf.ssh object[:ssh]
          object.delete :ssh
        end

        output_object
      end

      def get_name_template
        'lc'
        end

      def initialize(parent, init)
        super(parent)
        if init.is_a? Hash
          LinuxConfiguration.deserialize_object self, init.clone
        end
      end

      # Configuration code
      class Configurator < Azure::ARM::ResourceConfigurator
        attr_accessor :parent
        # @param disable_password_authentication
        #        Expression
        #        Boolean
        def disable_password_authentication(props)
          if @parent.disable_password_authentication.nil? and props.is_a? Azure::ARM::Expression
            @parent.disable_password_authentication = props
          end
          if props.is_a? TrueClass or props.is_a? FalseClass or props.is_a? Azure::ARM::Expression
            @parent.disable_password_authentication = props
            return
          end
          @parent.disable_password_authentication
        end
        # @param ssh
        #        Ssh
        def ssh(props)
          if @parent.ssh.nil? and props.is_a? Ssh
            @parent.ssh = props
            @parent.ssh.parent = @parent
            @parent.ssh._rsrcpath = 'ssh'
          end
          if @parent.ssh.nil? and (props.is_a? Hash) and (Azure::ARM::TypeBase.matches_type props, Ssh)
            @parent.ssh = Ssh.new(@parent, props)
            @parent.ssh._rsrcpath = 'ssh'
          end
          @parent.ssh
        end
        def create(init=nil,&block)
          @parent = LinuxConfiguration.new nil, init
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