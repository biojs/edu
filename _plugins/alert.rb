# encoding: utf-8
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
        # remove <p> at front and end
        regex = Regexp.new '^\<p\>(.+)\<\/p\>$'.encode('UTF-8'), Regexp::IGNORECASE | Regexp::MULTILINE
        output = output.gsub(regex, '\1')

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
