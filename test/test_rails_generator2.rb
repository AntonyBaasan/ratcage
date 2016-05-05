require 'minitest/autorun'

require 'ratcage'

class TestRailsGenerator2 < Minitest::Test

  def setup
    @rails_generator = RailsGenerator.new
  end

  def test_generate_rat_basic
    skip "Helper methods are not done"

    input_spec = {
        project: "rails",
        route_root: "people#index",
        routes: [{"get" => {"people"=>"people#index"}}],
        generate: {scaffold: "person name:string"},
        rake: "db:migrate",
        gems: {"bj" => "", "nokogiri" => "", "ratcage" => ""}
    }

    result = %Q(
    generate(:scaffold, "person name:string")\n
    route "root to: 'people#index'"\n
    route "get 'people' => 'people#index'"\n
    rake("db:migrate")\n
    gem "bj"\n
    gem "nokogiri"\n
    gem "ratcage"\n
    )

    assert_equal(result, @rails_generator.generate_rat(input_spec))
  end


  def test_converter_row_with_wrong_key
    assert_equal(false, @rails_generator.convert_row?(:dump))
  end

  def test_converter_with_correct_keys
    keys = [:generate,
            :routes,
            :route_root,
            :rake,
            :gems]

    keys.each { |key| assert_equal(true, @rails_generator.convert_row?(key)) }
  end

  def test_convert_row_scaffold
    input_spec = {generate: {scaffold: "person name:string"}}
    assert_equal("generate (:scaffold, " "person name:string" ")\n", @rails_generator.convert_row(input_spec.keys.first, input_spec.values.first))
  end

  def test_convert_row_route_root
    input_spec = {route_root: "people#index"}
    assert_equal(%Q(route "root to: 'people#index'"\n), @rails_generator.convert_row(input_spec.keys.first, input_spec.values.first))
  end

  def test_convert_row_route
    input_spec = {routes: [{"get" => {"people"=>"people#index"}}]}

    assert_equal(%Q(route "get 'people' => 'people#index'"\n), @rails_generator.convert_row(input_spec.keys.first, input_spec.values.first))
  end
  def test_convert_row_route_multi_rows
    input_spec = {routes: [{"get" => {"people"=>"people#index"}}, {"post" => {"people/edit"=>"people#edit"}}]}

    assert_equal(%Q(route "get 'people' => 'people#index'"\nroute "post 'people/edit' => 'people#edit'"\n),
                 @rails_generator.convert_row(input_spec.keys.first, input_spec.values.first))
  end

end