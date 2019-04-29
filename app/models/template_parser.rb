class TemplateParser
  attr_reader :path, :template, :binding

  def initialize(path, template, data)
    @path = path
    @template = template
    @binding = TemplateBinding.new(data).get_binding
  end

  def template_html(path, template)
    File.read("#{path}/#{template}")
  end

  def matches(html)
    html.scan(/{{(.*?)}}/).collect(&:first)
  end

  def date_or_time_call(value)
    if value == 'date'
      'strftime("%B %e, %Y")'
    elsif value == 'time'
      'strftime("%l:%M %P").strip'
    else
      raise "Not implemented: #{value}"
    end
  end

  def item_send(element)
    element.strip!
    if element.include?('.')
      symbol_name, date_or_time = element.split('.')
      call_name = date_or_time_call(date_or_time)
      "\#{item.send(:#{symbol_name}).#{call_name}}"
    else
      "\#{item.send(:#{element})}"
    end
  end

  def items_to_send(elements)
    elements.split(',').collect(&method(:item_send)).join(' ')
  end

  def collected_items(str)
    collection, elements = str.split('>')
    "#{collection.strip}.collect { |item| \"#{items_to_send(elements)}\" }"
  end

  def piped_eval(match)
    parts = match.split('|')

    value = ''
    replacements = []

    parts.each do |str|
      str.strip!

      if str.include?('>')
        code = collected_items(str)
        replacements = eval(code, @binding)
      else
        value = send(str, replacements)
      end
    end

    value
  end

  def evaluate_match(match)
    if match.include?('|')
      piped_eval(match)
    else
      eval(match, @binding)
    end
  end

  def to_s
    html = template_html(@path, @template)

    matches(html).each do |match|
      value = evaluate_match(match)
      html = html.sub("{{#{match}}}", value)
    end

    html.html_safe
  end

  def space_join(array)
    array.join(' ')
  end

  def to_sentence(array)
    array.join(' ')
  end
end