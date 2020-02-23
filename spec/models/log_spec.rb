require 'rails_helper'
RSpec.describe Log, type: :model do
  describe '#create' do
    context '保存ができる場合' do
      it '必要な値が全て存在すれば登録できること' do
        expect(build(:log)).to be_valid
      end

      it 'serveが半角数字であれば登録できること' do
        expect(build(:log, serve: "10")).to be_valid
      end

      it 'smashが半角数字であれば登録できること' do
        expect(build(:log, smash: "10")).to be_valid
      end

      it 'volleyが半角数字であれば登録できること' do
        expect(build(:log, volley: "10")).to be_valid
      end

      it 'strokeが半角数字であれば登録できること' do
        expect(build(:log, stroke: "10")).to be_valid
      end

      it 'gameが半角数字であれば登録できること' do
        expect(build(:log, game: "10")).to be_valid
      end

      it 'textが無くても登録できること' do
        expect(build(:log, text: "")).to be_valid
      end

      it 'imageが無くても登録できること' do
        expect(build(:log, image: "")).to be_valid
      end

      it 'textとimageが無くても登録できること' do
        expect(build(:log, text: "", image: "")).to be_valid
      end
    end

    context '保存ができない場合' do
      it '練習日と各項目の練習時間が無ければ登録できないこと' do
        log = build(:log, practice_day: "", serve: "", smash: "", volley: "", stroke: "", game: "")
        log.valid?
        expect(log.errors[:practice_day]).to include("を入力してください")
      end

      it 'practice_dayが無ければ登録できないこと' do
        log = build(:log, practice_day: "")
        log.valid?
        expect(log.errors[:practice_day]).to include("を入力してください")
      end

      it 'serveが無ければ登録できないこと' do
        log = build(:log, serve: "")
        log.valid?
        expect(log.errors[:serve]).to include("を入力してください")
      end

      it 'serveが半角数字でなければ登録できないこと' do
        log = build(:log, serve: "１０")
        log.valid?
        expect(log.errors[:serve]).to include("は数値で入力してください")
      end

      it 'smashが無ければ登録できないこと' do
        log = build(:log, smash: "")
        log.valid?
        expect(log.errors[:smash]).to include("を入力してください")
      end

      it 'smashが半角数字でなければ登録できないこと' do
        log = build(:log, smash: "１０")
        log.valid?
        expect(log.errors[:smash]).to include("は数値で入力してください")
      end

      it 'volleyが無ければ登録できないこと' do
        log = build(:log, volley: "")
        log.valid?
        expect(log.errors[:volley]).to include("を入力してください")
      end

      it 'volleyが半角数字でなければ登録できないこと' do
        log = build(:log, volley: "１０")
        log.valid?
        expect(log.errors[:volley]).to include("は数値で入力してください")
      end

      it 'strokeが無ければ登録できないこと' do
        log = build(:log, stroke: "")
        log.valid?
        expect(log.errors[:stroke]).to include("を入力してください")
      end

      it 'strokeが半角数字でなければ登録できないこと' do
        log = build(:log, stroke: "１０")
        log.valid?
        expect(log.errors[:stroke]).to include("は数値で入力してください")
      end

      it 'gameが無ければ登録できないこと' do
        log = build(:log, game: "")
        log.valid?
        expect(log.errors[:game]).to include("を入力してください")
      end

      it 'gameが半角数字でなければ登録できないこと' do
        log = build(:log, game: "１０")
        log.valid?
        expect(log.errors[:game]).to include("は数値で入力してください")
      end

      it 'user_idが無ければ登録できないこと' do
        log = build(:log, user_id: "")
        log.valid?
        expect(log.errors[:user]).to include("を入力してください")
      end
    end
  end
end
