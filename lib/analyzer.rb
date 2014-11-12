require 'pattern'

class Analyzer
  attr_reader :dataset

  def initialize
    @dataset = {}
  end

  def process(raw_data)
    raw_data.each_value do |email_address|
      name, email = email_address.split('@')
      pattern = Pattern.build(name)
      rule = pattern.generate
      @dataset[email] ||= []
      @dataset[email] << rule unless @dataset[email].include?(rule)
    end
  end
end