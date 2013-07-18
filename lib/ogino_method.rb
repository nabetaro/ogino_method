# coding: utf-8
# Author::    KURASAWA Nozomu (nabetaro)
# Copyright:: Copyright (c) 2013 Caldron
# License::   Distributes under the same terms as Ruby

require "ogino_method/version"
require "date"


# == The calculation of fertilable by Kyusaku Ogino
class OginoMethod
  HIGH = 3
  MIDDLE = 2
  LOW = 1

  # === Initialize
  # _onset_: Date of menthes onset.
  # _cycle_ : cycle of menstruation (day).
  def initialize(onset = Date.today, cycle = 28)
    @onset = onset
    @cycle = cycle
  end

  attr_accessor :onset, :cycle

  # === The possibility of fertile.
  # _date_ : Date class
  def fertility(date)
    d = @cycle - ((date - @onset).to_i % @cycle)
    if (d<=16) and (d>=12)
      return HIGH
    elsif (d<=19) and (d>=11)
      return MIDDLE
    else
      return LOW
    end
  end


end
