require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "root access should redirect to cdmm which will create a blank form and redirect to that form path" do
    get root_path

    # redirect from / to /cdmm
    assert_response :redirect
    assert_redirected_to evaluation_index_path
    follow_redirect!
    # redirect from /cdmm to /cdmm/<form-key>
    assert_response :redirect
    redirect_path = response.location
    assert_redirected_to redirect_path
    follow_redirect!
    assert_response :success
  end
end
