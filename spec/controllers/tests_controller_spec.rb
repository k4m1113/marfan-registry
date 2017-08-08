# require 'rails_helper'
#
# RSpec.describe TestsController, type: :controller do
#   let(:valid_attributes) do
#     FactoryGirl.attributes_for :test
#   end
#
#   let(:invalid_attributes) do
#     FactoryGirl.attributes_for :test,
#                                test_amount: nil,
#                                test_unit_of_meas: nil,
#                                topic_id: nil
#   end
#
#   let(:valid_session) { {} }
#
#   describe 'GET #index' do
#     let(:test) { FactoryGirl.create :test }
#
#     it 'assigns all tests as @tests' do
#       get :index, {}
#       expect(assigns(:tests)).to eq [test]
#     end
#   end
#
#   describe 'GET #show' do
#     let(:test) { FactoryGirl.create :test }
#
#     it 'assigns the requested test as @test' do
#       get :show, params: { id: test.to_param }
#       expect(assigns(:test)).to eq test
#     end
#   end
#
#   describe 'GET #new' do
#     it 'assigns a new test as @test' do
#       get :new, {}
#       expect(assigns(:test)).to be_a_new Test
#     end
#   end
#
#   describe 'GET #edit' do
#     let(:test) { FactoryGirl.create :test }
#
#     it 'assigns the requested test as @test' do
#       get :edit, params: { id: test.to_param }
#       expect(assigns(:test)).to eq test
#     end
#   end
#
#   describe 'POST #create' do
#     context 'with valid params' do
#       it 'creates a new Test' do
#         expect {
#           post :create, params: { test: valid_attributes }
#         }.to change(Test, :count).by 1
#       end
#
#       it 'assigns a newly created test as @test' do
#         post :create, params: { test: valid_attributes }
#         expect(assigns(:test)).to be_a Test
#         expect(assigns(:test)).to be_persisted
#       end
#
#       it 'redirects to the created test' do
#         post :create, params: { test: valid_attributes }
#         expect(response).to redirect_to Test.last
#       end
#     end
#
#     context 'with invalid params' do
#       it 'assigns a newly created but unsaved test as @test' do
#         post :create, params: { test: invalid_attributes }
#         expect(assigns(:test)).to be_a_new(Test)
#       end
#
#       it 're-renders the \'new\' template' do
#         post :create, params: { test: invalid_attributes }
#         expect(response).to render_template 'new'
#       end
#     end
#   end
#
#   describe 'PUT #update' do
#     context 'with valid params' do
#       let(:test) { FactoryGirl.create :test }
#
#       it 'updates the requested test' do
#         put :update, params: { id: test.to_param, test: new_attributes }
#         test.reload
#         skip('Add assertions for updated state')
#       end
#
#       it 'assigns the requested test as @test' do
#         put :update, params: { id: test.to_param, test: valid_attributes }
#         expect(assigns(:test)).to eq test
#       end
#
#       it 'redirects to the test' do
#         put :update, params: { id: test.to_param, test: valid_attributes }
#         expect(response).to redirect_to test
#       end
#     end
#
#     context 'with invalid params' do
#       let(:test) do
#         FactoryGirl.create :test,
#                            patient: nil
#       end
#
#       it 'assigns the test as @test' do
#         put :update, params: { id: test.to_param, test: test }
#         expect(assigns(:test)).to eq test
#       end
#
#       it 're-renders the \'edit\' template' do
#         put :update, params: { id: test.to_param, test: test}
#         expect(response).to render_template 'edit'
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     let(:test) { FactoryGirl.create :test }
#
#     it 'destroys the requested test' do
#       expect {
#         delete :destroy, params: { id: test.to_param }
#       }.to change(Test, :count).by(-1)
#     end
#
#     it 'redirects to the tests list' do
#       delete :destroy, params: { id: test.to_param }
#       expect(response).to redirect_to(tests_url)
#     end
#   end
# end
