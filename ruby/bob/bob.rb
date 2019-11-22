# frozen_string_literal: true

# fake documentation
class Bob
  def self.hey(phrase)
    new(phrase).reply
  end

  def initialize(phrase)
    @phrase = phrase.strip
  end

  def reply
    return 'Fine. Be that way!' if silence?
    return "Calm down, I know what I'm doing!" if shouting_question?
    return 'Whoa, chill out!' if shouting?
    return 'Sure.' if question?

    'Whatever.'
  end

  private

  attr_reader :phrase

  def silence?
    phrase == ''
  end

  def shouting_question?
    shouting? && question?
  end

  def shouting?
    phrase.upcase == phrase && phrase.match(/[A-Z]/)
  end

  def question?
    phrase.end_with?('?')
  end
end
