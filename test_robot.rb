require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @my_robot = Robot.new
    @my_robot.needs_repairs = false
    @my_robot.foreign_model = false
    @my_robot.vintage_model = false
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    @my_robot.needs_repairs = true
    @my_robot.foreign_model = true
    # act
    return_value = @my_robot.station

    # assert
    assert_equal(1, return_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    @my_robot.needs_repairs = true
    @my_robot.vintage_model = true

    # act
    return_value = @my_robot.station

    # assert
    assert_equal(2, return_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    @my_robot.needs_repairs = true
    # act
    return_value = @my_robot.station

    # assert
    assert_equal(3, return_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    # act
    return_value = @my_robot.station

    # assert
    assert_equal(4, return_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    # act
    return_value = @my_robot.prioritize_tasks

    # assert
    assert_equal(-1, return_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robots_todos = [5,3,9,2]
    @my_robot.todos = robots_todos
    # act
    return_value = @my_robot.prioritize_tasks

    # assert
    assert_equal(9, return_value)
  end

  def test_workday_on_day_off_returns_false
    skip
    # arrange

    # act

    # assert
  end

  def test_workday_not_day_off_returns_true
    skip
    # arrange

    # act

    # assert
  end

end
