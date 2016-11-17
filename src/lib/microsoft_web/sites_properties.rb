# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require_relative '../arm/module_definition'
require_relative './module_definition'

module Azure::ARM::Web
    #
    # Model object.
    #
    class SitesProperties < Azure::ARM::TypeBase

      # @return [String] Microsoft.Web/sites: The name of web site.
      attr_accessor :name

      # @return [String] Microsoft.Web/sites: The resource Id of server farm
      # site belongs to.
      attr_accessor :server_farm_id

      # @return Microsoft.Web/sites: An array of strings that contains the
      # public hostnames for the site, including custom domains.
      attr_writer :hostnames
      def hostnames(name=nil)
        if name and @hostnames and @hostnames.is_a? Array
          return @hostnames.find { | p | p.name == name } if name.is_a? String
          return @hostnames[name] if name.is_a? Integer
        end
        @hostnames
      end

      # @return Microsoft.Web/sites: An array of strings that contains enabled
      # hostnames for the site. By default, these are
      # <SiteName>.azurewebsites.net and <SiteName>.scm.azurewebsites.net.
      attr_writer :enabled_hostnames
      def enabled_hostnames(name=nil)
        if name and @enabled_hostnames and @enabled_hostnames.is_a? Array
          return @enabled_hostnames.find { | p | p.name == name } if name.is_a? String
          return @enabled_hostnames[name] if name.is_a? Integer
        end
        @enabled_hostnames
      end

      # @return Microsoft.Web/sites: Container for SSL states.
      attr_writer :host_name_ssl_states
      def host_name_ssl_states(name=nil)
        if name and @host_name_ssl_states and @host_name_ssl_states.is_a? Array
          return @host_name_ssl_states.find { | p | p.name == name } if name.is_a? String
          return @host_name_ssl_states[name] if name.is_a? Integer
        end
        @host_name_ssl_states
      end

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

        serialized_property = object.server_farm_id
        output_object[:serverFarmId] = serialized_property unless serialized_property.nil?

        serialized_property = object.hostnames
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:hostnames] = serialized_property unless serialized_property.nil?

        serialized_property = object.enabled_hostnames
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:enabledHostnames] = serialized_property unless serialized_property.nil?

        serialized_property = object.host_name_ssl_states
        if serialized_property.is_a? Array
          unless serialized_property.nil?
            serializedarray = []
            serialized_property.each do |element2|
              unless element2.nil?
                element2 = element2.to_h
              end
              serializedarray.push(element2)
            end
            serialized_property = serializedarray
          end
        end
        if serialized_property.is_a? Azure::ARM::Expression
          unless serialized_property.nil?
            serialized_property = serialized_property.to_s
          end
        end
        output_object[:hostNameSslStates] = serialized_property unless serialized_property.nil?

        output_object
      end

      def to_h
        hash = {}
        SitesProperties.serialize_object(hash,self)
        hash
      end

      def self.ds_properties
        result = Array.new 
        result.push :server_farm_id
        result.push :hostnames
        result.push :enabled_hostnames
        result.push :host_name_ssl_states
        result
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [SitesProperties] Deserialized object.
      #
      def self.deserialize_object(output_object, object)
        return if object.nil?
        conf = Configurator.new
        conf.parent = output_object

        if object.key?(:name)
          conf.name object[:name]
          object.delete :name
        end

        if object.key?(:server_farm_id)
          conf.server_farm_id object[:server_farm_id]
          object.delete :server_farm_id
        end

        if object.key?(:hostnames)
          conf.hostnames object[:hostnames]
          object.delete :hostnames
        end

        if object.key?(:enabled_hostnames)
          conf.enabled_hostnames object[:enabled_hostnames]
          object.delete :enabled_hostnames
        end

        if object.key?(:host_name_ssl_states)
          conf.host_name_ssl_states object[:host_name_ssl_states]
          object.delete :host_name_ssl_states
        end

        output_object
      end

      def get_name_template
        'sp'
        end

      def initialize(parent, init)
        super(parent)
        if init.is_a? Hash
          SitesProperties.deserialize_object self, init.clone
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
        # @param server_farm_id
        #        String
        def server_farm_id(props)
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            @parent.server_farm_id = props
            return
          end
          @parent.server_farm_id
        end
        # @param hostnames
        #        Array<String>
        #        Expression
        def hostnames(props)
          if props.is_a? Array
            @parent.hostnames = Array.new if @parent.hostnames.nil?
            props.each { |p| @parent.hostnames.push _hostnames_string(p) }
            return @parent.hostnames
          end
          _element = nil
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            _element = props
            return
          end
          unless _element.nil?
            @parent.hostnames = Array.new if @parent.hostnames.nil?
            @parent.hostnames.push _element
          end
          if @parent.hostnames.nil? and props.is_a? Azure::ARM::Expression
            @parent.hostnames = props
          end
          @parent.hostnames
        end
        def _hostnames_string(props)
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            return props
          end
        end
        # @param enabled_hostnames
        #        Array<String>
        #        Expression
        def enabled_hostnames(props)
          if props.is_a? Array
            @parent.enabled_hostnames = Array.new if @parent.enabled_hostnames.nil?
            props.each { |p| @parent.enabled_hostnames.push _enabled_hostnames_string(p) }
            return @parent.enabled_hostnames
          end
          _element = nil
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            _element = props
            return
          end
          unless _element.nil?
            @parent.enabled_hostnames = Array.new if @parent.enabled_hostnames.nil?
            @parent.enabled_hostnames.push _element
          end
          if @parent.enabled_hostnames.nil? and props.is_a? Azure::ARM::Expression
            @parent.enabled_hostnames = props
          end
          @parent.enabled_hostnames
        end
        def _enabled_hostnames_string(props)
          if props.is_a? String or props.is_a? Azure::ARM::Expression
            return props
          end
        end
        # @param host_name_ssl_states
        #        Array<SitesPropertiesHostNameSslStates0Item>
        #        Expression
        def host_name_ssl_states(props)
          if props.is_a? Array
            @parent.host_name_ssl_states = Array.new if @parent.host_name_ssl_states.nil?
            props.each { |p| @parent.host_name_ssl_states.push _host_name_ssl_states_sitespropertieshostnamesslstates0item(p) }
            return @parent.host_name_ssl_states
          end
          _element = nil
          if _element.nil? and props.is_a? SitesPropertiesHostNameSslStates0Item
            _element = props
            _element.parent = @parent
            _element._rsrcpath = 'hostNameSslStates'
          end
          if _element.nil? and (props.is_a? Hash) and (Azure::ARM::TypeBase.matches_type props, SitesPropertiesHostNameSslStates0Item)
            _element = SitesPropertiesHostNameSslStates0Item.new(@parent, props)
            _element._rsrcpath = 'hostNameSslStates'
          end
          unless _element.nil?
            @parent.host_name_ssl_states = Array.new if @parent.host_name_ssl_states.nil?
            @parent.host_name_ssl_states.push _element
          end
          if @parent.host_name_ssl_states.nil? and props.is_a? Azure::ARM::Expression
            @parent.host_name_ssl_states = props
          end
          @parent.host_name_ssl_states
        end
        def _host_name_ssl_states_sitespropertieshostnamesslstates0item(props)
          if props.is_a? SitesPropertiesHostNameSslStates0Item
            props.parent = @parent
            props._rsrcpath = 'hostNameSslStates'
            return props
          end
          if (props.is_a? Hash) and (Azure::ARM::TypeBase.matches_type props, SitesPropertiesHostNameSslStates0Item)
            _properties = SitesPropertiesHostNameSslStates0Item.new(@parent, props)
            _properties._rsrcpath = 'hostNameSslStates'
            return _properties
          end
        end
        def create(init=nil,&block)
          @parent = SitesProperties.new nil, init
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