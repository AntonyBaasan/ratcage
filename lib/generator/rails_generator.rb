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

    %w(
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


    return "#{key.to_s} (:#{value.keys.first}, #{value[value.keys.first]})\n" if key == :generate

    ""

  end

  def convert_row? key
    return true if (key == :generate)
    return true if (key == :route)
    return true if (key == :route_root)
    return true if (key == :rake)
    return true if (key == :gems)

    false
  end


end