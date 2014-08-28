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
            # task for the students
            when "task"
                strGlyph = 'glyphicon glyphicon-road';
            
            # ask the student questions
            when "question"
                strGlyph = 'glyphicon glyphicon-bell';

            # check point and verification
            when "check"
                strGlyph = 'glyphicon glyphicon-check';
            
            # use this block before you show a solution.
            when "stop"
                strGlyph = 'glyphicon glyphicon-minus-sign';
            
            # additional info, and references
            when "info"
                strGlyph = 'glyphicon glyphicon-info-sign';

            # tips, help
            when "help"
                strGlyph = 'glyphicon glyphicon-gift';
                    
            # never used, only in the icon intro
            when "raise"
                strGlyph = 'glyphicon glyphicon-hand-up';

            end
          
        strReturn =  '<div style="display:block"><div class="tutorials-highlight" style="display:block;"><span class="' + strGlyph + '" style="float:left;display:block;margin-right:20px"></span><div class="tutorials-highlight-text">'  \
                    + output \
                    + '</div></div></div>';
        return strReturn;
            
      end
    end
end


Liquid::Template.register_tag('hlblock', Jekyll::HighlightBlock)
