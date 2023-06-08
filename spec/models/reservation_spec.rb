require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.create(full_name: 'Paul', email: 'solarmails2@luxurycarslending.com', password: 'password')
    @car = Car.create(name: 'Lexus', brand: 'Toyota', image: 'http://image_url.jpg', description: 'Car description',
                      lending_fee: 100)
    @reservation = Reservation.new(reservation_date: '2020-01-01', user_id: @user.id, car_id: @car.id)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      @reservation.save
      expect(@reservation).to be_valid
    end

    it 'is not valid without a reservation_date' do
      @reservation.reservation_date = nil
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @reservation.user_id = nil
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'is not valid without a car_id' do
      @reservation.car_id = nil
      @reservation.save
      expect(@reservation).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to user' do
      assoc = Reservation.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to car' do
      assoc = Reservation.reflect_on_association(:car)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'has_many reservations' do
      assoc = User.reflect_on_association(:reservations)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many houses through reservations' do
      assoc = User.reflect_on_association(:cars)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many users through reservations' do
      assoc = Car.reflect_on_association(:users)
      expect(assoc.macro).to eq :has_many
    end

    it 'has many reservations' do
      assoc = Car.reflect_on_association(:reservations)
      expect(assoc.macro).to eq :has_many
    end
  end
end
