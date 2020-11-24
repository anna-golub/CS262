class CustomFile < File
  def initialize; end

  # Метод, превращающий путь к файлу в его абсолютный путь
  def self.absolute_path(file_name)
    super
  end

  # Метод проверяющий, является ли данный файл каталогом
  def self.directory?(file_name)
    super
  end

  # Метод проверяющий существование файла
  def self.exists?(file_name)
    super
  end

  # Метод возвращающий время модификации файла
  def self.last_modification_time(file_name)
    File.mtime(file_name)
  end
end


CustomFile.absolute_path('main.rb')
CustomFile.directory?('main.rb')
CustomFile.exists?('temp.txt')
CustomFile.last_modification_time('CustomFile.rb')