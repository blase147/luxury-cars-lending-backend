require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  path '/api/v1/cars' do
    get('list cars') do
      tags 'list all of the cars'
      produces 'application/json'
      response '200', 'successful' do
        before do
          @cars = Car.create([
                               {
                                 name: 'Lexus',
                                 brand: 'Toyota',
                                 image: 'www.sample-image.com',
                                 lending_fee: 100.0,
                                 description: 'A nice car'
                               },
                               {
                                 name: 'Hilux',
                                 brand: 'Jac',
                                 image: 'www.sample-image.com',
                                 lending_fee: 100.0,
                                 description: 'A strong car'
                               }
                             ])
        end
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   brand: { type: :string },
                   image: { type: :string },
                   lending_fee: { type: :float },
                   description: { type: :string }
                 },
                 required: %w[id name brand image lending_fee description]
               }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'Car id'

    get('show Car') do
      tags 'get single Car detail'
      produces 'application/json'

      response(200, 'successful') do
        before do
          @cars = Car.create([
                               {
                                 name: 'Beatle',
                                 brand: 'Peogeot',
                                 image: 'www.sample-image.com',
                                 lending_fee: 100.0,
                                 description: 'A fast car'
                               },
                               {
                                 name: 'GLK',
                                 brand: 'Benz',
                                 image: 'www.sample-image.com',
                                 lending_fee: 100.0,
                                 description: 'A great car'
                               }
                             ])
        end
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   brand: { type: :string },
                   image: { type: :string },
                   lending_fee: { type: :integer },
                   description: { type: :string }
                 },
                 required: %w[id name brand image lending_fee description]
               }
        let(:id) { @cars.first.id }
        run_test!
      end
    end
  end
end
