require 'test_helper'

class VisitorsControllerTest < ActionController::TestCase
  setup do
    @visitor = visitors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor" do
    assert_difference('Visitor.count') do
      post :create, visitor: { company: @visitor.company, contact_number: @visitor.contact_number, designation: @visitor.designation, email: @visitor.email, name: @visitor.name, notes: @visitor.notes }
    end

    assert_redirected_to visitor_path(assigns(:visitor))
  end

  test "should show visitor" do
    get :show, id: @visitor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitor
    assert_response :success
  end

  test "should update visitor" do
    patch :update, id: @visitor, visitor: { company: @visitor.company, contact_number: @visitor.contact_number, designation: @visitor.designation, email: @visitor.email, name: @visitor.name, notes: @visitor.notes }
    assert_redirected_to visitor_path(assigns(:visitor))
  end

  test "should destroy visitor" do
    assert_difference('Visitor.count', -1) do
      delete :destroy, id: @visitor
    end

    assert_redirected_to visitors_path
  end
end