require 'test_helper'

class NextStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @next_step = next_steps(:one)
  end

  test "should get index" do
    get next_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_next_step_url
    assert_response :success
  end

  test "should create next_step" do
    assert_difference('NextStep.count') do
      post next_steps_url, params: { next_step: { completed: @next_step.completed, due_date: @next_step.due_date, goal_id: @next_step.goal_id, next_step: @next_step.next_step, responsible_party: @next_step.responsible_party } }
    end

    assert_redirected_to next_step_url(NextStep.last)
  end

  test "should show next_step" do
    get next_step_url(@next_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_next_step_url(@next_step)
    assert_response :success
  end

  test "should update next_step" do
    patch next_step_url(@next_step), params: { next_step: { completed: @next_step.completed, due_date: @next_step.due_date, goal_id: @next_step.goal_id, next_step: @next_step.next_step, responsible_party: @next_step.responsible_party } }
    assert_redirected_to next_step_url(@next_step)
  end

  test "should destroy next_step" do
    assert_difference('NextStep.count', -1) do
      delete next_step_url(@next_step)
    end

    assert_redirected_to next_steps_url
  end
end
