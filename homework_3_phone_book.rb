class User
  def initialize(last_name, first_name, patronim, phone_number, country = '', birthdate = '', organization = '', position = '')
    @last_name = last_name
    @first_name = first_name
    @patronim = patronim
    @phone_number = phone_number
    @country = country
    @birthdate = birthdate
    @organization = organization
    @position = position
  end

  attr_reader :last_name, :first_name, :patronim, :phone_number, :country, :birthdate, :organization, :position

  def validate
    v = Validator.new
    if v.validate(self)
      puts 'Contact added'
    else
      raise 'Contact info invalid'
    end
  end
end

class Validator
  def validate(user)
    if no_digits(user.last_name) && no_digits(user.first_name) && no_digits(user.patronim) && no_letters(user.phone_number) && CountryChecker.check(user.country) && no_digits(user.organization) && no_digits(user.position)
      return true
    end
    false
  end

  def no_letters(str)
    return true if str.nil?
    (0..str.length - 1).each do |i|
      return false if ((str[i] >= 'a') && (str[i] <= 'z')) || ((str[i] >= 'A') && (str[i] <= 'Z'))
    end
    true
  end

  def no_digits(str)
    return true if str.nil?
    (0..str.length - 1).each do |i|
      return false if (str[i] >= '0') && (str[i] <= '9')
    end
    true
  end
end

class CountryChecker
  def self.check(str)
    country_list = ['UK', 'China', 'Spain', 'France', 'India', 'USA', 'Germany', 'Canada', 'Singapore', 'Russia']
    return true if str.nil? || (country_list.include? str)
    false
  end
end

class DBFetcher
  def connect
    return 'DataBase connection established'
  end

  def fetch(_sql_str)
    true
  end
end

class ArrayToStringConverter
  def self.convert(arr)
    res = "INSERT INTO users\nVALUES ("
    (0..arr.length - 1).each do |i|
      res += "\'" + arr[i] + "\',"
    end
    res += "\'" + arr[arr.length - 1] + "\')"
    return res
  end
end

user = User.new(last_name = 'Polina', first_name = 'Ivanova', patronim = 'Sergeyevna', phone_number = '1118883', country = 'Germany')

attr_arr = [user.last_name, user.first_name, user.patronim, user.phone_number, user.country, user.birthdate, user.organization, user.position]

db_fetcher = DBFetcher.new
puts db_fetcher.connect

sql_str = ArrayToStringConverter.convert(attr_arr)
puts sql_str
db_fetcher.fetch(sql_str)
