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
        strGlyph = '';  
        
          
        case @block_name 
            when "challenge"
                strGlyph = 'glyphicon glyphicon-road';
            
            when "verification"
                strGlyph = 'glyphicon glyphicon-check';
            
            when "stop"
                strGlyph = 'glyphicon glyphicon-minus-sign';
            
            when "question"
                strGlyph = 'glyphicon glyphicon-bell';
            
            when "raise"
                strGlyph = 'glyphicon glyphicon-hand-up';
                
            when "info"
                strGlyph = 'glyphicon glyphicon-info-sign';
                    
            end
          
        strReturn =  '<div style="display:block"><div class="tutorials-highlight" style="display:block;"><span class="' + strGlyph + '" style="float:left;display:block;margin-right:20px"></span><div class="tutorials-highlight-text">'  \
                    + output \
                    + '</div></div></div>';
        return strReturn;
            
      end
    end
end


Liquid::Template.register_tag('hlblock', Jekyll::HighlightBlock)
