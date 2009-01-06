require 'test_helper'

class PlansControllerTest < ActionController::TestCase
  should_route :get, '/plans', :controller => :plans, :action => :index
  should_route :get, '/plans/1/edit', :controller => :plans, :action => :edit, :id => 1
  should_route :get, '/plans/1', :controller => :plans, :action => :show, :id => 1
  should_route :post, '/plans', :controller => :plans, :action => :create
  should_route :put, '/plans/1', :controller => :plans, :action => :update, :id => 1
  should_route :delete, '/plans/1', :controller => :plans, :action => :destroy, :id => 1

  context "on GET to :index" do
    5.times { Factory(:step) }
    setup { get :index }
    should_assign_to :plans
    should_respond_with :success
    should_render_template :index
  end

  context "on GET to :show" do
    step = Factory(:step)
    setup { get :show, :id => step.scenario.plan.id }
    should_assign_to :plan
    should_respond_with :success
    should_render_template :show
  end

  context "on POST to :create" do
    Factory(:step)
    setup { post :create }
    should_assign_to :plan
    should_assign_to :plans
    should_respond_with :redirect
  end

  context "on DELETE to :destroy" do
    step = Factory(:step)
    setup { delete :destroy, :id => step.scenario.plan.id }
    should_redirect_to "plans_url"
    should_respond_with :redirect
  end

end
