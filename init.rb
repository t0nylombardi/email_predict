#
#

APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'lib') )

require 'pry'
require 'pp'
require 'yaml'

require 'analyzer'
require 'predict'

# Instructions to run:
FILENAME = 'email.yaml'
raw = YAML::load(File.open(FILENAME))

# Create a analyzer object and give it a pattern
analyzer = Analyzer.new
# Analyze the given dataset
analyzer.process(raw)
# Create a predictor object and give it a dataset and a pattern
predictor = Predictor.new(dataset: analyzer.dataset)

# Formulate potential patterns for given name and email
pp predictor.formulate(name: 'Criag Silverstein', email: 'google.com')
pp predictor.formulate(name: 'Peter Wong', email: 'alphasights.com')
pp predictor.formulate(name: 'Steve Wozniak', email: 'apple.com')
pp predictor.formulate(name: 'Barack Obama', email: 'whitehouse.gov')


