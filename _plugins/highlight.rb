# Example:
# {% blockhighlight challenge %} 
# foo
# {% endblockhighlight %}

module Jekyll
    class HighlightBlock< Liquid::Block

      def initialize(tag_name, block_name, tokens)
        super
        @block_name = block_name.strip
      end

      def render(context)
        site = context.registers[:site]
        converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))
        return '<div class="tutorials-highlight"><div class="tutorials-highlight-child tutorials-highlight-' + @block_name + '"></div><div class="tutorials-highlight-text">'  \
          + output \
          + '</div></div>' 
      end
    end
end


Liquid::Template.register_tag('highlightblock', Jekyll::HighlightBlock)
