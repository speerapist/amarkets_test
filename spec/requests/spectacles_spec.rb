require 'rails_helper'

RSpec.describe SpectaclesController, type: :request do
  describe "Post /create" do
    subject(:spectacle) { post('/spectacles', params: params) }

    context 'when vaild date' do
      let(:params) do 
        {
          spectacle:{
            name: "Romeo",
            start_date: Date.today,
            end_date: Date.today + 3
          }
        }
      end

      it 'successful create' do 
        subject

        expect(response).to have_http_status(:created)
      end
    end

    context 'when date is invalid' do
      let!(:spectacle) { create(:spectacle) }

      let(:params) do 
        {
          spectacle:{
            name: "Romeo",
            start_date: Date.yesterday,
            end_date: Date.today + 3
          }
        }
      end

      it 'failed create' do 
        subject

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("This date is booked, please select another date") 
      end
    end
  end

  describe "Post /destroy" do
    subject(:destroy) { delete("/spectacles/#{id}") }

    let(:spectacle) { create(:spectacle) }
    let(:id) { spectacle.id }


    it 'should be destroyed' do
     subject
     
     expect(response).to have_http_status(:ok)
     expect { spectacle.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "Get /index" do
    subject(:destroy) { get("/spectacles") }

    let!(:spectacle) { create(:spectacle) }
    let!(:second_spectacle) { create(:spectacle, start_date: spectacle.end_date + 1, end_date: spectacle.end_date + 3) }

    it 'should be destroyed' do
     subject

     expect(response).to have_http_status(:ok)
    end
  end
end
