class RailsGenerator
  def generate_rat spec_data
    # input_spec = {
    #     project: "rails",
    #     route_root: "people#index",
    #     routes: ["root to ",""],
    #     generate: {scaffold: "person name:string"},
    #     rake: "db:migrate",
    #     gems: {"bj"=>"", "nokogiri"=>"", "ratcage"=>""}
    # }

    %Q(
    generate(:scaffold, "person name:string")
    route "root to: 'people#index'"
    rake("db:migrate")
    gem "bj"
    gem "nokogiri"
    gem "ratcage"
    )

    result_string = ""

    spec_data.each do |key, value|
      result_string << convert_row(key, value) if convert_row?(key)
    end

    p "RS: "+result_string
    result_string
  end

  def convert_row key, value

    return "" unless convert_row?(key)

    # create "generate" string
    return "#{key.to_s} (:#{value.keys.first}, #{value.values.first})\n" if key == :generate
    # create "root route" string
    return %Q(route "root to: '#{value}'"\n) if key == :route_root
    # create "routes" string
    if key == :routes
      str = ""
      value.each do |value|
        str += %Q(route "#{value.keys.first} '#{value.values.first.keys.first}' => '#{value.values.first.values.first}'"\n)
      end
      return str
    end

    return %Q(rake "#{value}"\n) if key == :rake

    # ""

  end

  def convert_row? key
    return true if (key == :generate)
    return true if (key == :routes)
    return true if (key == :route_root)
    return true if (key == :rake)
    return true if (key == :gems)

    false
  end


end