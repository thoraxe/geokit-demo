require 'test_helper'

class ToiletsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Toilet.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Toilet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Toilet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to toilet_url(assigns(:toilet))
  end
  
  def test_edit
    get :edit, :id => Toilet.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Toilet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Toilet.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Toilet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Toilet.first
    assert_redirected_to toilet_url(assigns(:toilet))
  end
  
  def test_destroy
    toilet = Toilet.first
    delete :destroy, :id => toilet
    assert_redirected_to toilets_url
    assert !Toilet.exists?(toilet.id)
  end
end
