require 'rails_helper'

describe PrototypesController do
  describe 'with user login' do
    login_user
    describe 'GET #index' do
      let(:prototypes){ create_list(:prototype, 1)}
      before do
        get :index, id: prototypes
      end
      it 'assigns the requested prototypes to @prototypes' do
        expect(assigns(:prototypes)).to eq(prototypes)
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        it 'saves the new prototype in the database' do
          prototype = build(:prototype)
          post :create, prototype: attributes_for(:prototype)
          expect{prototype.save}.to change{ Prototype.count }.by(1)
        end

        let(:prototype) {attributes_for(:prototype, user_id:'1')}
        it 'redirects to root_path' do
          post :create, prototype: prototype
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          post :create, prototype: prototype
          expect(flash[:notice]).to eq('投稿完了しました')
        end
      end
    end

    describe 'GET #show' do
      it 'assigns the requested prototype to @prototype' do
        prototype = create(:prototype)
        get :show, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it 'renders the :show template' do
        prototype = create(:prototype)
        get :show, id: prototype
        expect(response).to render_template :show
      end
    end

    describe 'PATCH #update' do
      describe 'with valid attributes' do
        it 'assigns the requested prototype to @prototype' do
          prototype = create(:prototype)
          patch :update, id: prototype, prototype: attributes_for(:prototype)
          expect(assigns(:prototype)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype = create(:prototype)
          patch :update, id: prototype, prototype: attributes_for(:prototype, titile: "updated")
          expect(assigns(:prototype)).to eq prototype
        end

        it 'redirects to ;prototype_path' do
          prototype = create(:prototype)
          patch :update, id: prototype, prototype: attributes_for(:prototype, titile: "updated")
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show update prototype successfully' do
          prototype = create(:prototype)
          patch :update, id: prototype, prototype: attributes_for(:prototype, titile: "updated")
          expect(flash[:notice]).to eq('編集完了しました。')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the prototype' do
        prototype = create(:prototype)
        expect{
          delete :destroy, id: prototype
        }.to change(Prototype, :count).by(0)
      end
    end
  end

  describe 'without user login' do
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'GET #edit' do
      it 'redirects sign_in page' do
        prototype = create(:prototype)
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        prototype = create(:prototype)
        patch :update, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        prototype = create(:prototype)
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
