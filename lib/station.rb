class Station

  def zone(station)
    station_list(station)
  end


private

def station_list(key)
  station_zones = {
              "Acton Town" => 3,
              "Aldgate" => 1,
              "Aldgate East" => 1,
              "All Saints" => 2,
              "Alperton" => 4,
              "Amersham" => 9,
              "Angel" => 1,
              "Archway" => "2 & 3",
              "Arnos Grove" => 4,
              "Arsenal" => 2,
              "Baker Street" => 1,
              "Balham" => 3,
              "Bank" => 1,
              "Barbican" => 1,
              "Barking" => 4,
              "Barkingside" => 4,
              "Barons Court" => 2,
              "Bayswater" => 1,
              "Beckton"	=> 3,
              "Beckton Park" => 3,
              "Becontree" => 5,
              "Belsize Park" => 2,
              "Bermondsey" => 2,
              "Bethnal Green" => 2,
              "Blackfriars" => 1,
              "Blackhorse Road" => 3,
              "Blackwall"	=> 2,
            }

  station_zones[key]
end





end
