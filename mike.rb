$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def list_of_directors(source)
  index = 0
  director_list = []
  while index < source.length do
    director_list << source[index][:name]
    index += 1
  end
  director_list
end

def total_gross(source)
  
  key_name = []
  hash_totals = {}
  index = 0
  key_name = list_of_directors(source)
  hash_totals = directors_totals(source)
  
  while index < source.size do
    total += hash_totals[key_name[index]]
    index += 1
  end
  total
end