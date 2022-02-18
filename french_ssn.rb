require 'date'
require 'yaml'

def french_ssn_info(ssn)
  regex = /^(?<gender>[12])\s(?<year>\d{2})\s(?<birth_month>0[1-9]|1[0-2])\s(?<department>0[1-9]|[1-9][1-9])(\s\d{3}){2}\s(?<key>\d{2})/

  match_data = ssn.match(regex)


  if match_data
    gender_number = match_data[:gender].to_i
    gender_string = gender_number == 1 ? "man" : "woman"
    month_number = match_data[:birth_month].to_i
    month = Date::MONTHNAMES[month_number]
    year = "19#{match_data[:year]}" #=> 1984
    birth_department = department(match_data[:department])

    return "a #{gender_string}, born in #{month}, #{year} in #{birth_department}."
  else
    return "The number is invalid"
  end

  # man, born in December, 1984 in Seine-Maritime.
end

def department(code)
  file = YAML.load_file('data/french_departments.yml')
  file[code]
end

p french_ssn_info("1 84 12 76 451 089 46")