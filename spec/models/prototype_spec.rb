require 'rails_helper'

describe Prototype do
  describe 'associations' do
    let(:user) { create(:user) }
    let(:prototype) { create(:prototype) }

    describe 'with comments' do
      it "deletes the comments when prototype is deleted" do
        comment = create(:comment, prototype: prototype)
        expect { prototype.destroy }.to change{ Comment.count }.by(-1)
      end
    end

    describe 'with likes' do
      let!(:prototype) { create(:prototype, :with_likes) }
      it "deletes the likes when Prototype is deleted" do
        expect { prototype.destroy }.to change{ Like.count }.by(-5)
      end
    end
  end

  describe 'validations' do
    describe 'with valid attributes' do
      it 'has a valid factory' do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is missing a title' do
        prototype = build(:prototype, title: "")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it 'is missing a catch_copy' do
        prototype = build(:prototype, catch_copy: "")
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it 'is missing a concept' do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#posted_date' do
    it 'returns dates in a specified format' do
      prototype = build(:prototype, created_at: Date.today)
      expect(prototype.created_at).to eq("2016-08-07")
    end
  end

  describe '#liked_by?(user)' do
    describe 'when liked by a user' do
      it 'returns true' do
        prototype = create(:prototype)
        prototype.likes.create
        expect(prototype).to be_valid
      end
    end

    describe 'when not liked by a user' do
      it 'returns nill' do
      user = create(:user, name: 'aaa')
      like = create(:like, user_id: '')
      expect(Like.find_by(user_id: user.id)).to be_falsey
    end
  end

  describe '#not_liked_by(user)' do
    it 'when not liked by a user' do
      user = create(:user, name: 'aaa')
      like = create(:like, user_id: '')
      expect(Like.find_by(user_id: user.id)).to be_falsey
    end
  end
  describe '#reject_sub_images(attributed)' do
    let(:prototype) { create(:prototype) }
    it "doesn't save a record with nil content" do
      image   = prototype.images.create(role: 'main', image: nil)
      expect(image.errors[:image]).to include("can't be blank")
    end
  end
end

