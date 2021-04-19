require 'rails_helper'

describe ApplicationHelper do 

    # describe '#current_user' do
    #     it 'returns the current user' do
    #         assign(:current_user, 'Fake Student')
    #         helper.current_user.should eql('Fake Student')
    #     end
    # end

    # describe '#require_login' do
    #     it 'redirects to the home page if user is not logged in' do
    #         # delete :destroy
    #         # get :edit, params: {id: 1}
    #         # expect(flash[:notice]).to match(/Please login to view this page/)
    #         expect(helper.require_login).to redirect_to(home_path)
    #     end
    # end

    describe 'is_admin' do
        it 'redirects to the home page if user is not admin' do
            delete :destroy
            get :edit, params: {id: 1}
            expect(flash[:notice]).to match(/Please login to view this page/)
            expect(helper.require_login).to redirect_to(home_path)
        end
    end

    describe '#is_admin' do
        it "should redirect to homepage if not logged in" do
            session[:student_id].should be_nil
            get :admin
            expect(flash[:success]).to match(/Please login to view this page/)
        end
    end

end