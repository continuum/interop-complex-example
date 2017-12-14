require 'test_helper'

class TraceabilityControllerTest < ActionDispatch::IntegrationTest
  
  test "should respond with logs for 2 days" do
    get logs_path, params: {inicio: '2017-12-12', fin: '2018-05-25'}
    debugger
    assert_equal response.status, 200
    assert_equal "application/gzip", response.content_type
  end

  test "should respond with logs for only one day" do
    current_day = Time.zone.parse("2017-12-12")
    travel_to current_day do
      get logs_path, params: {}
      assert_equal response.status, 200
      assert_equal "application/gzip", response.content_type
    end
  end

end
