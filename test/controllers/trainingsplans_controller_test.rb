require 'test_helper'

class TrainingsplansControllerTest < ActionController::TestCase
  setup do
    @trainingsplan = trainingsplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainingsplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainingsplan" do
    assert_difference('Trainingsplan.count') do
      post :create, trainingsplan: { abgeschlossen: @trainingsplan.abgeschlossen, saetze: @trainingsplan.saetze, uebung: @trainingsplan.uebung, wiederholungen: @trainingsplan.wiederholungen }
    end

    assert_redirected_to trainingsplan_path(assigns(:trainingsplan))
  end

  test "should show trainingsplan" do
    get :show, id: @trainingsplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trainingsplan
    assert_response :success
  end

  test "should update trainingsplan" do
    patch :update, id: @trainingsplan, trainingsplan: { abgeschlossen: @trainingsplan.abgeschlossen, saetze: @trainingsplan.saetze, uebung: @trainingsplan.uebung, wiederholungen: @trainingsplan.wiederholungen }
    assert_redirected_to trainingsplan_path(assigns(:trainingsplan))
  end

  test "should destroy trainingsplan" do
    assert_difference('Trainingsplan.count', -1) do
      delete :destroy, id: @trainingsplan
    end

    assert_redirected_to trainingsplans_path
  end
end
