require 'rails_helper'
describe CommentsController do
  let(:user) { create(:user) }
  let(:log) { create(:log, user_id: user.id) }
  let(:comment) { create(:comment, log_id: log.id, user_id: user.id) }

  describe '#create' do
    context 'ログイン時' do
      before do
        login user
      end

      context 'セーブが成功した場合' do
        it "コメントが登録されること" do
          expect {
            post :create, params: {
              comment: { text: "a" },
              log_id: log.id,
              user_id: user.id }
          }.to change(Comment, :count).by(1)
        end

        it "リダイレクトすること" do
          post :create, params: {
            comment: { text: "a" },
            log_id: log.id,
            user_id: user.id }
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe '#destroy' do
    context 'ログイン時' do
      before do
        login user
      end

      it "コメントが削除されること" do
        comment = create(:comment, log_id: log.id, user_id: user.id)
        expect {
          delete :destroy, params: {
            id: comment.id,
            log_id: log.id,
            user_id: user.id }
        }.to change(Comment, :count).by(-1)
      end
    end

    context '未ログイン時' do
      it "コメントが削除されないこと" do
        comment = create(:comment, log_id: log.id, user_id: user.id)
        expect {
          delete :destroy, params: {
            id: comment.id,
            log_id: log.id,
            user_id: user.id }
        }.not_to change(Comment, :count)
      end

      it "ログインページに遷移するか" do
        comment = create(:comment, log_id: log.id, user_id: user.id)
        delete :destroy, params: {
          id: comment.id,
          log_id: log.id,
          user_id: user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
