module Jekyll
  module Tags
    class SpecialHighlightBlock < Liquid::Block
      include Liquid::StandardFilters

      # The regular expression syntax checker. Start with the language specifier.
      # Follow that by zero or more space separated options that take one of two
      # forms:
      #
      # 1. name
      # 2. name=value
      SYNTAX = /^([a-zA-Z0-9.+#-]+)((\s+\w+(=\w+)?)*)$/

      def initialize(tag_name, markup, tokens)
        super
        if markup.strip =~ SYNTAX
          @lang = $1
          @options = {}
          @collapsible = ""

          if defined?($2) && $2 != ''
            $2.split.each do |opt|
              key, value = opt.split('=')
              if value.nil?
                if key == 'linenos'
                  value = 'inline'
                else
                  value = true
                end
              end
              @options[key] = value
            end
          end

          if defined? @options['collapsible']
            @collapsible = "collapsible"
          end

        else
          raise SyntaxError.new <<-eos
Syntax Error in tag 'highlight' while parsing the following markup:

  #{markup}

Valid syntax: highlight <lang> [linenos collapsible=true]
eos
        end
      end

      def render(context)

        # pygements is not installed on some macs
        #if context.registers[:site].pygments
		    if false
          render_pygments(context, super)
        else
          render_codehighlighter(context, super)
        end
      end

      def render_pygments(context, code)
        require 'pygments'

        @options[:encoding] = 'utf-8'

        classes = Array[@lang]
        if defined? @collapsible
          classes.push "collapsible"
          puts "collapsible"
        end

        output = add_code_tags(
          Pygments.highlight(code, :lexer => @lang, :options => @options),
          classes
        )

        output = context["pygments_prefix"] + output if context["pygments_prefix"]
        output = output + context["pygments_suffix"] if context["pygments_suffix"]
        output
      end

      def render_codehighlighter(context, code)
        #The div is required because RDiscount blows ass

		puts code
        <<-HTML
  <div class='collapsible'>
    <pre><code data-lang="text" class='#{@lang} '>#{h(code).strip}</code></pre>
  </div>
        HTML
      end

      # classes is an array
      def add_code_tags(code, classes)
        # Add nested <code> tags to code blocks
        code = code.sub(/<pre>/,'<pre><code class="' + classes.join(' ') + '">')
        code = code.sub(/<\/pre>/,"</code></pre>")
      end

    end
  end
end

Liquid::Template.register_tag('code', Jekyll::Tags::SpecialHighlightBlock)
