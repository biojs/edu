# Example:
# {% alert danger %} 
# text in your red alert box
# {% endalert %}

module Jekyll
    class AlertBlock< Liquid::Block

      def initialize(tag_name, block_name, tokens)
        super
        @block_name = block_name.strip
      end

      def render(context)
        site = context.registers[:site]
        converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))
        output = output.strip()
        # hack: removed the <p>
        if output[0..2] == "<p>"
          output = output[3..-5]
        elsif output[0..4] == "<pre>"
          output = output[5..-7]
        end
        if output[0..5] == "<code>"
          output = output[6..-8]
        end

        strGlyph = '';  
        alertType = '';
        
          
        case @block_name 
            when "warn"
                strGlyph = 'glyphicon-warning-sign';
                alertType = 'alert alert-warning';
            
            when "danger"
                strGlyph = 'glyphicon-warning-sign';
                alertType = 'alert alert-danger';
                
            when "info"
                strGlyph = 'glyphicon-info-sign';
                alertType = 'alert alert-info';
                    
            when "ok"
                strGlyph = 'glyphicon-thumbs-up';
                alertType = 'alert alert-success';
            end
        
        strReturn = '<div class="' + alertType + ' "> <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <span class="glyphicon ' + strGlyph + '" style="font-size:22px"></span> &nbsp; ' + output + '</div>';
        return strReturn;
            
      end
    end
end


Liquid::Template.register_tag('alert', Jekyll::AlertBlock)
