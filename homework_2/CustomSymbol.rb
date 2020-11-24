class CustomSymbol
  def initialize(data)
    @data = data
  end

  attr_reader :data

  # Метод, возвращающий массив всех определённых символов в памяти на данный момент
  def self.all_symbols
    Symbol.all_symbols
  end

  # Метод, проверяющий находится ли заданное имя символа между двумя другими заданными именами символов
  def between_symbols(a, b)
    return a <= @data && @data <= b
  end
end


cs = CustomSymbol.new('abc')
cs.between_symbols('1', 'v')
CustomSymbol.all_symbols