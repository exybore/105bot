module Coronagenda
  module Classes
    # Command class
    class Command
      # @return [String] command's name
      attr_reader :name

      # @return [Coronagenda::Commands::Command] object associated with the command
      attr_reader :object

      # @return [String, nil] command's usage, for the help
      attr_reader :usage

      # @return [String, nil] command's description
      attr_reader :description

      # @return [Hash] command's arguments
      attr_reader :args

      # Initialize the Command object
      #
      # @param data [Hash] command data
      def initialize(name, object, usage, description, args)
        @name        = name
        @object      = object
        @usage       = usage
        @description = description
        @args = args
      end

      def to_s
        "**• `#{CONFIG['bot']['prefix']}#@name` : #@description**\nUtilisation : `#@usage`"
      end
    end

    class Waiter
      attr_reader :text

      def initialize(context, text)
        @context = context
        @text = text
        @msg = context.send_embed('', Utils.embed(
          description: text
        ))
      end

      def edit(text)
        @text = text
        @msg.edit('', Utils.embed(
          description: text
        ))
      end
    end
  end
end