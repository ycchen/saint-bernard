class TemplateBinding
  def initialize(data)
    data.each do |k, v|
      instance_eval { class << self; self end }.send(:attr_accessor, k)
      send("#{k}=", v)
    end
  end

  def get_binding
    binding
  end
end
