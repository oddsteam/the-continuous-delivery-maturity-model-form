require "test_helper"

class CdmmControllerTest < ActionDispatch::IntegrationTest
  test "accessing the cdmm without key will create a draft blank form" do
    assert_difference("Evaluation.count") do
      get evaluation_index_path

      ev = Evaluation.last

      assert_redirected_to evaluation_show_path(ev.form_key)
      assert_equal "draft", ev.form_status
    end
  end

  test "get existing evaluation" do
    get evaluation_show_path(:team_a_form_key)

    assert_response :success
  end

  test "get non-exising evaluation" do
    get evaluation_show_path(:no_such_a_form_key)

    assert_response :not_found
  end
end
