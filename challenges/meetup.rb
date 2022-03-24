require 'date'

class Meetup
  CONDITIONS = { 'first' => 0,
                 'second' => 1,
                 'third' => 2,
                 'fourth' => 3,
                 'fifth' => 4,
                 'last' => nil
                 }
  WEEKDAYS = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(wday, condition)
    if CONDITIONS.keys.include?(condition.downcase)
      one_to_five(wday.downcase, condition.downcase)
    else
      teenth(wday.downcase)
    end
  end

  def one_to_five(wday, str)
    selected = []
    (1..31).select do |day|
      begin
        selected << day if WEEKDAYS[Date.new(year, month, day).wday] == wday
      rescue Date::Error
        break
      end
    end
    return Date.new(year, month, selected.last) if str == 'last'
    return nil if selected[CONDITIONS[str]].nil?
    Date.new(year, month, selected[CONDITIONS[str]])
  end

  def teenth(wday)
    13.upto(19) do |day|
      day_obj = Date.new(year, month, day)
      return day_obj if WEEKDAYS[day_obj.wday] == wday
    end
  end

  private

  attr_reader :year, :month
end