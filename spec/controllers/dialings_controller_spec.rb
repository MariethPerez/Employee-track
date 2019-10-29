require 'rails_helper'
RSpec.describe Api::DialingsController, type: :controller do

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

    @dialing_1 = Dialing.create(
      date: "2019-10-01",
      user_id: @user.id,
      category: "Exit",
      hour: 19 ,
      minute: 15
    )
  end

  # List dialings
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      p response.body
      expect(response.status).to eq 200
    end
    it 'render json with all dialings' do
      get :index
      dialings = JSON.parse(response.body)
      expect(dialings.size).to eq 2
    end
  end

  # Dialing detail
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { user_id: @user.id, id: @dialing  }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct Dialing' do
      get :show, params: { user_id: @user.id, id: @dialing }
      expected_user = JSON.parse(response.body)
      expect(expected_user["id"]).to eq(@dialing.id)
    end

    # it 'returns http status not found' do
    #   get :show, params: { user_id: @user.id, id: 'xxx' }
    #   # expect(response.status).to eq 404
    #   expect(response).to have_http_status(:not_found)
    # end
  end

  describe 'POST create' do
    it 'returns http status created' do
      post :create, params: {
        date: "2019-11-01",
        user_id: @user.id,
        category: "Entry",
        hour: 9 ,
        minute: 10
      }
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
    end

    it 'returns the dialing created' do
      post :create, params: {
        date: "2019-11-02",
        user_id: @user.id,
        category: "Entry",
        hour: 9 ,
        minute: 0
      }
      expected_dialing = JSON.parse(response.body)
      expect(expected_dialing).to have_key("id")
      expect(expected_dialing["category"]).to eq("Entry")
    end
  end

  # Dialing update
  describe "PATCH update" do
    it "returns http status ok" do
      patch :update, params: {
        id: @dialing.id,
        user_id: @user.id,
        minute: 25
      }
      expect(response).to have_http_status(:ok)
    end

    it "returns the updated dialing" do
      patch :update, params: {
        id: @dialing.id,
        user_id: @user.id,
        minute: 28
      }
      expected_dialing = JSON.parse(response.body)
      expect(expected_dialing["minute"]).to eq(28)
    end
  end

  #report
  describe 'GET metrics_late_employees' do
    it 'returns http status ok' do
      get :metrics_late_employees, params: {
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      expect(response.status).to eq 200
    end
    it 'render json with all metrics_late_employees' do
      get :metrics_late_employees, params: {
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      dialings = JSON.parse(response.body)
      expect(dialings.size).to eq 1
    end
  end

  describe 'GET metrics_overtime_employees' do
    it 'returns http status ok' do
      get :metrics_overtime_employees, params: {
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      expect(response.status).to eq 200
    end
    it 'render json with all metrics_overtime_employees' do
      get :metrics_overtime_employees, params: {
        start_date: "2019-10-01",
        end_date: "2019-10-30"
      }
      dialings = JSON.parse(response.body)
      expect(dialings.size).to eq 1
    end
  end

end