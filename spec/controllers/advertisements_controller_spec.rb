require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let (:an_ad) { Advertisement.create!(title: "Advertisement Title", copy: "Some Text", price: 5) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [an_ad] to @advertisement" do
      get :index
      expect(assigns(:advertisement)).to eq([an_ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: an_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: an_ad.id}
      expect(response).to render_template :show
    end

    it "assigns an_ad to @advertisement" do
      get :show, {id: an_ad.id}
      expect(assigns(:advertisement)).to eq(an_ad)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "ADVERTISEMENT create" do
    it "increases the number of Advertisement by 1" do
      expect{advertisement :create, advertisement: {title: "Advertisement Title", copy: "Some Text", price: 5}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      advertisement :create, advertisement: {title: "Advertisement Title", copy: "Some Text", price: 5}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      advertisement :create, advertisement: {title: "Advertisement Title", copy: "Some Text", price: 5}
      expect(response).to redirect_to Advertisement.last
    end
  end

#  describe "GET #create" do
#    it "returns http success" do
#      get :create
#      expect(response).to have_http_status(:success)
#    end
#  end

end
