require 'rails_helper'
RSpec.describe Api::UsersController, type: :controller do

  before do
    @user = User.create(
      name: 'Emilyghen',
      email: 'emilyghen@example.com',
      role: 'admin',
      password: '123456',
      password_confirmation: '123456'
    )
    @dialing = Dialing.create(
      date: "2019-10-01",
      user_id: @user.id,
      category: "Entry",
      hour: 9 ,
      minute: 15
    )
    sign_in_as(@user)
  end


  # List users
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      p response.body
      expect(response.status).to eq 200
    end
    it 'render json with all users' do
      get :index
      users = JSON.parse(response.body)
      expect(users.size).to eq 1
    end
  end

  #User detail
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @user }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct user' do
      get :show, params: { id: @user }
      expected_user = JSON.parse(response.body)
      expect(expected_user["id"]).to eq(@user.id)
    end

    it 'returns http status not found' do
      get :show, params: { id: 80 }
      # expect(response.status).to eq 404
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST create' do
    it 'returns http status created' do
      post :create, params: {
        name: 'Juan',
        email: 'juan@example.com',
        role: 'empleado',
        password: '123456',
        password_confirmation: '123456'
      }
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
    end

    it 'returns the user created' do
      post :create, params: {
        name: 'Maria',
        email: 'maria@example.com',
        role: 'empleado',
        password: '123456',
        password_confirmation: '123456'
      }
      expected_user = JSON.parse(response.body)
      expect(expected_user).to have_key("id")
      expect(expected_user["name"]).to eq("Maria")
    end
  end

  describe 'GET metrics_entry_exit' do
    it 'returns http status ok' do
      get :metrics_entry_exit, params: {
        id: @user.id,
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      expect(response.status).to eq 200
    end
    it 'render json with all metrics_entry_exit' do
      get :metrics_entry_exit, params: {
        id: @user.id,
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      dialings = JSON.parse(response.body)
      expect(dialings.size).to eq 1
    end
  end


end