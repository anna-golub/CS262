class CustomHash
  def initialize(hash_data)
    @data = hash_data
  end

  attr_reader :data

  # Метод, принимающий блок и удаляющий пару, если условие внутри блока вычисляется в true
  def delete_if(block)
    @data.delete_if { |_key, _value| block }
  end

  # Метод, проверяющий пуст ли хэш
  def empty?
    @data.empty?
  end
end

ch = CustomHash.new({ 'a' => 1, 'b' => 2, 'c' => 3 })
puts ch.empty?
ch.delete_if 3 == 4
puts ch.empty?
ch.delete_if 3 == 3
puts ch.empty?
