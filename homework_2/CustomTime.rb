class CustomTime < Time
  # Метод, возвращающий текущее время
  def self.now
    super
  end

  # Метод, проверяющий пятница ли сегодня
  def self.friday?
    self.now.friday?
  end

  # Метод, возвращающий строку с названием часового пояса
  def self.timezone_code(timestamp)
    timestamp.zone
  end
end

puts CustomTime.now
puts CustomTime.friday?
puts CustomTime.timezone_code(CustomTime.now)