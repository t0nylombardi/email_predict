require 'pattern' 

class Predictor
  attr_reader :dataset

  def initialize(attributes)
    @dataset = attributes[:dataset]
  end

  def formulate(attributes)
    name = attributes[:name].downcase
    email = attributes[:email]

    return "There is no matching in dataset for #{attributes[:name]} working for #{email}" if @dataset[email].nil?

    dataset[email].map do |rule|
      pattern = Pattern.build(name)
      pattern.predict(rule) + "@#{email}"
    end
  end
end

