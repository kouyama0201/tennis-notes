require 'rails_helper'
describe LogsController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'ログイン時' do
      before do
        login user
      end

      it "indexアクションのページに遷移するか" do
        get :index
        expect(response).to render_template :index
      end

      it "正常なレスポンスか" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスが返ってきているか" do
        get :index
        expect(response).to have_http_status "200"
      end

      it "@logはcreated_atの降順に正しくアサインされるか" do
        log = create_list(:log, 3)
        get :index
        expect(assigns(:log)).to match(log.sort { |a, b| b.created_at <=> a.created_at })
      end
    end

    context '未ログイン時' do
      it "indexアクションのページに遷移するか" do
        get :index
        expect(response).to render_template :index
      end

      it "正常なレスポンスか" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスが返ってきているか" do
        get :index
        expect(response).to have_http_status "200"
      end

      it "@logはcreated_atの降順に正しくアサインされるか" do
        log = create_list(:log, 3)
        get :index
        expect(assigns(:log)).to match(log.sort { |a, b| b.created_at <=> a.created_at })
      end
    end
  end

  describe 'GET #new' do
    context 'ログイン時' do
      before do
        login user
      end

      it "newアクションのページに遷移するか" do
        get :new
        expect(response).to render_template :new
      end
    end

    context '未ログイン時' do
      it "ログインページに遷移するか" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'ログイン時' do
      before do
        login user
      end

      context 'セーブが成功した場合' do
        it '練習記録が登録されること' do
          log = { log: attributes_for(:log) }
          expect {
            post :create, params: log
          }.to change(Log, :count).by(1)
        end

        it 'トップページにリダイレクトすること' do
          log = { log: attributes_for(:log) }
          post :create, params: log
          expect(response).to redirect_to root_path
        end
      end

      context 'セーブが失敗した場合' do
        it '練習記録が登録されないこと' do
          log = { log: attributes_for(:log, practice_day: "") }
          expect {
            post :create, params: log
          }.not_to change(Log, :count)
        end

        it 'レンダリング先に遷移するかどうか' do
          log = { log: attributes_for(:log, practice_day: "") }
          post :create, params: log
          expect(response).to render_template :new
        end
      end
    end

    context '未ログイン時' do
      it "練習記録が登録されないこと" do
        log = { log: attributes_for(:log) }
        expect {
          post :create, params: log
        }.not_to change(Log, :count)
      end

      it "ログインページに遷移するか" do
        log = { log: attributes_for(:log) }
        post :create, params: log
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン時' do
      before do
        login user
      end

      it "練習記録が削除されること" do
        log = create(:log, user_id: user.id)
        expect {
          delete :destroy, params: { id: log.id }
        }.to change(Log, :count).by(-1)
      end

      it "トップページにリダイレクトすること" do
        log = create(:log, user_id: user.id)
        delete :destroy, params: { id: log.id }
        expect(response).to redirect_to root_path
      end

      context 'ユーザーが異なる場合' do
        it "練習記録が削除されないこと" do
          log = create(:log)
          expect {
            delete :destroy, params: { id: log.id }
          }.not_to change(Log, :count)
        end

        it "トップページにリダイレクトすること" do
          log = create(:log)
          delete :destroy, params: { id: log.id }
          expect(response).to redirect_to root_path
        end
      end
    end

    context '未ログイン時' do
      it "練習記録が削除されないこと" do
        log = create(:log, user_id: user.id)
        expect {
          delete :destroy, params: { id: log.id }
        }.not_to change(Log, :count)
      end

      it "ログインページに遷移するか" do
        log = create(:log, user_id: user.id)
        delete :destroy, params: { id: log.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン時' do
      before do
        login user
      end

      it "editアクションのページに遷移するか" do
        log = create(:log)
        get :edit, params: { id: log }
        expect(response).to render_template :edit
      end

      it "@logは正しくアサインされるか" do
        log = create(:log)
        get :edit, params: { id: log }
        expect(assigns(:log)).to eq log
      end
    end

    context '未ログイン時' do
      it "ログインページに遷移するか" do
        log = create(:log)
        get :edit, params: { id: log }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'ログイン時' do
      before do
        login user
      end

      context '更新に成功した場合' do
        it "練習記録が更新されること" do
          log = create(:log)
          expect {
            patch :update, params: {
              id: log.id, serve: 20
            }
          }.to change(Log, :count).by(0)
        end

        it "トップページにリダイレクトすること" do
          log = create(:log)
          patch :update, params: {
            id: log.id, serve: 20
          }
          expect(response).to redirect_to root_path
        end
      end

      context '更新に失敗した場合' do
        it "練習記録が更新されないこと" do
          log = create(:log)
          expect {
            patch :update, params: {
              id: log.id, serve: ""
            }
          }.not_to change(Log, :count)
        end

        it "トップページにリダイレクトすること" do
          log = create(:log)
          patch :update, params: {
            id: log.id, serve: ""
          }
          expect(response).to redirect_to root_path
        end
      end
    end

    context '未ログイン時' do
      it "ログインページに遷移するか" do
        log = create(:log)
        patch :update, params: { id: log.id, serve: 20 }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #show' do
    context 'ログイン時' do
      before do
        login user
      end

      it "showアクションのページに遷移するか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to render_template :show
      end

      it "正常なレスポンスか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to be_success
      end

      it "200レスポンスが返ってきているか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to have_http_status "200"
      end

      it "@logは正しくアサインされるか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(assigns(:log)).to eq log
      end
    end

    context '未ログイン時' do
      it "showアクションのページに遷移するか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to render_template :show
      end

      it "正常なレスポンスか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to be_success
      end

      it "200レスポンスが返ってきているか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(response).to have_http_status "200"
      end

      it "@logは正しくアサインされるか" do
        log = create(:log)
        get :show, params: { id: log }
        expect(assigns(:log)).to eq log
      end
    end
  end
end
