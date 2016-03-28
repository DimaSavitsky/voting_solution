require 'yaml'
require 'lib/question'

questions = YAML::load_file('public/questions.yml')

QUESTIONS = questions.map do |text, variants|
  Question.new(text, variants)
end
