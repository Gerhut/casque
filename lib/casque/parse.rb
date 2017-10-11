require "parser/current"
class VersionProcessor < AST::Processor
  attr_reader :version
  def on_send(node)
    p node
    @version = node
  end

  def handler_missing(node)
    node.each process
  end
end

module Casque
  def self.parse(contents)

    ast = Parser::CurrentRuby.parse(contents)
    processor = VersionProcessor.new
    processor.process(ast)
    return processor.version
  end
end
