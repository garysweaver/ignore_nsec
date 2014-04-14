require 'ignore_nsec/version'

class Time
  alias_method '___<=>'.to_sym, :<=>

  def <=>(other)
    other.respond_to?(:nsec) ? to_i <=> other.to_i : send('___<=>'.to_sym, other)
  end
end
