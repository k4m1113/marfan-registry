require 'httparty'

module Doctor

  def self.get_lat_and_long(city, state)
    google_maps_url= "https://maps.googleapis.com/maps/api/geocode/json?address=#{city},+#{state}&key=#{ENV["GOOGLE_MAPS_KEY"]}"
    response = HTTParty.get(google_maps_url)
    return   "#{response.parsed_response['results'][0]['geometry']['location']['lat']}, #{response.parsed_response['results'][0]['geometry']['location']['lng']}"

  end

  def self.find_doctors(name, loc)
    betterdoctor_url="https://api.betterdoctor.com/2016-03-01/doctors?name=#{name}&user_location=#{loc}&skip=0&limit=5&user_key=#{ENV["BETTERDOCTOR_KEY"]}"
    response = HTTParty.get(betterdoctor_url)
    response_practice = response.parsed_response['data'][0]["practices"][0]
    response_doctor = response.parsed_response['data'][0]
    @first_name = response_doctor['profile']['first_name']
    @last_name = response_doctor['profile']['last_name']
    @practice_name = response_practice['name']
    @address_line_1 = response_practice['visit_address']['street']
    @city = response_practice['visit_address']['city']
    @state = response_practice['visit_address']['state']
    @country = "USA"
    @postal_code = response_practice['visit_address']['zip']

    Clinician.create!(
      first_name: @first_name,
      last_name: @last_name,
      practice_name: @practice_name,
      address_line_1: @address_line_1,
      city: @city,
      state: @state,
      country: @country,
      postal_code: @postal_code
    )
  end

end
