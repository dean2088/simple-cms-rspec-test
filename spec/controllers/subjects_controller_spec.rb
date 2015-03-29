require 'rails_helper'

describe SubjectsController do
  
  before :each do
      admin_user = create(:admin_user)
      session[:user_id] = admin_user.id
  end
  
  
  describe 'GET #index' do
    
   it "renders the :index template" do
      subject1 = create(:subject, name: 'subject1')
      subject2 = create(:subject, name: 'subject2')
      get :index
      expect(assigns(:subjects)).to match_array([subject1, subject2])
   end
 
  end

  describe 'GET #show' do
    it "assigns the requested subject to @subject" do
      subject = create(:subject)
      get :show, id: subject
      expect(assigns(:subject)).to eq subject
    end

    it "renders the :show template" do
      subject = create(:subject)
      get :show, id: subject
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new subject to @subject" do
      get :new
      expect(assigns(:subject)).to be_a_new(Subject)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested subject to @subject" do
      subject = create(:subject)
      get :edit, id: subject 
      expect(assigns(:subject)).to eq subject
    end

    it "renders the :edit template" do
      subject = create(:subject)
      get :edit, id: subject 
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before :each do
      
    end

    context "with valid attributes" do
      it "saves the new subject in the database" do
        expect{
          post :create, subject: attributes_for(:subject)
        }.to change(Subject, :count).by(1)

      end

      it "redirects to subjects#index" do        
        post :create, subject: attributes_for(:subject,)       
        expect(response).to redirect_to(:action => 'index')
      end
    end

    context "with invalid attributes" do
      it "does not save the new subject in the database" do
        expect{
        post :create,subject: attributes_for(:invalid_subject)
        }.to_not change(Subject, :count)
      end

      it "re-renders the :new template" do
        post :create,
        subject: attributes_for(:invalid_subject)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
       @subject = create(:subject,
                          name: 'Maths',
                          position: 1,
                          visible: true )
    end

    context "valid attributes" do
      it "locates the requested @subject" do
        patch :update, id: @subject, subject: attributes_for(:subject)
        expect(assigns(:subject)).to eq(@subject)
      end

      it "changes @subject's attributes" do
        patch :update, id: @subject,
        subject: attributes_for(:subject,
                          name: 'Grammar',
                          position: 2,
                          visible: true )
        @subject.reload
        expect(@subject.name).to eq('Grammar')
        expect(@subject.position).to eq(2)
        expect(@subject.visible).to eq(true)
      end

      it "redirects to the updated subject" do
        patch :update, id: @subject, subject: attributes_for(:subject) 
        expect(response).to redirect_to(:action => 'show',:id=>@subject.id)
      end
    end

    context "with invalid attributes" do
      it "does not change the subject's attributes" do
        patch :update, id: @subject,
          subject: attributes_for(:subject,
                          name: nil,
                          position: 2,
                          visible: false ) 
            @subject.reload
            expect(@subject.name).to eq('Maths')
            expect(@subject.position).to_not eq(2)
            expect(@subject.visible).to_not eq(false)
      end

      it "re-renders the edit template" do
        patch :update, id: @subject,
          subject: attributes_for(:invalid_subject)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @subject= create(:subject)
    end

    it "deletes the subject" do
      expect{
      delete :destroy, id: @subject
      }.to change(Subject,:count).by(-1)
    end

    it "redirects to subjects#index" do
      delete :destroy, id: @subject 
      expect(response).to redirect_to(:action => 'index')
    end
  end
end
