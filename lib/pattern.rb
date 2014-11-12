class Pattern
  attr_reader :first_name, :last_name

  class << self
    def build(name)
      new *name.split(/[.|\s[1]]/)
    end
  end

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end

  def generate
    [first_part, last_part].join('_dot_').to_sym
  end

  def predict(rule)
    %w(first_initial first_name last_initial last_name).inject([]) do |memo, params|
      memo << send(params) if rule.to_s =~ /#{params}/
      memo
    end.join('.')
  end

  private

  def first_initial
    @first_name[0]
  end

  def last_initial
    @last_name[0]
  end

  def first_part
    @first_name.length == 1 ? 'first_initial' : 'first_name'
  end

  def last_part
    @last_name.length == 1 ? 'last_initial' : 'last_name'
  end
end