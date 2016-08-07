require 'rails_helper'

describe Image do
  describe '#create' do
    it 'has the wrong content format' do
      image = build(:image, image: "")
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end

    describe 'with valid attributes' do
      it 'has a valid factory' do
        image = build(:image)
        expect(image.valid?).to eq(true)
      end
    end

    describe 'without content attribute' do
      let(:image) { build(:image, role: nil) }
      it 'returns error' do
        image.valid?
        expect(image.errors[:role]).to include("can't be blank")
      end
    end

    describe '#with association' do
      let(:prototype) { create(:prototype) }
      let(:image) { create(:image, :main, prototype: prototype) }
      it 'is associated with a prototype' do
        expect(image.prototype).to eq prototype
      end
    end
  end
end

