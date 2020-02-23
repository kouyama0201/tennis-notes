require 'rails_helper'
describe LogsController do
  describe 'GET #new' do
    it "newアクションのページに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@logは正しくアサインされるか" do
      log = create(:log)
      get :edit, params: { id: log }
      expect(assigns(:log)).to eq log
    end

    it "editアクションのページに遷移するか" do
      log = create(:log)
      get :edit, params: { id: log }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@logはcreated_atの降順に正しくアサインされるか" do
      log = create_list(:log, 3)
      get :index
      expect(assigns(:log)).to match(log.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "indexアクションのページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end
