require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }

  describe 'GET #show' do
     context 'when a user is logged in' do
      before 'sign_in_user' do
        it "loads correct user details" do
          get :show, params: { od:user.id }
          expect(assigns(:user)).to eq (user)
        end
      end
    end
  end
     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end


    let(:user) {User.create!(email: 'second@user.com', password: '111111')}
    describe 'Get #show' do
      context 'when correct user is logged in' do
        it "loads correct user details" do
          get :show, params: {os:user.id}
          expect(assigns(:user)).to be_ok
        end
      end
    end
  end
    context 'when incorrect user is logged in'do
      it "redirect to root_path" do
        get :show, params: {id: user.id }
        expect(response).to redirect_to (root_path)
      end
    end
