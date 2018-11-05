require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
     it 'ensures first_name presence' do
       user = User.new(last_name: 'Lazarus', email: 'test@test.com', password_digest: 'papa').save
       expect(user).to eq(false)
     end
     it 'ensures last_name presence' do
       user = User.new(first_name: 'Arthur', email: 'test2@test.com', password_digest: 'maman').save
       expect(user).to eq(false)
     end
     it 'ensures email presence' do
       user = User.new(first_name: 'Arthur', last_name: 'Lazarus', password_digest: 'fils').save
       expect(user).to eq(false)
     end
     it 'ensures password presence' do
       user = User.new(first_name: 'Arthur', last_name: 'Lazarus', email: 'test3@test.com').save
       expect(user).to eq(false)
     end
     it 'ensures first_name is not empty' do
       user = User.new(first_name: '', last_name: 'Lazarus', email: 'test4@test.com', password_digest: 'fille').save
       user2 = User.new(first_name: '     ', last_name: 'Lazarus', email: 'test4@test.com', password_digest: 'fille').save
       expect(user).to eq(false)
       expect(user2).to eq(false)
     end
     it 'ensures last_name is not empty' do
       user = User.new(first_name: 'Arthur', last_name: '', email: 'test5@test.com', password_digest: 'fille').save
       user2 = User.new(first_name: 'Arthur', last_name: '    ', email: 'test5@test.com', password_digest: 'fille').save
       expect(user).to eq(false)
       expect(user2).to eq(false)
     end
     it 'ensures email is not empty' do
       user = User.new(first_name: 'Arthur', last_name: 'Lazarus', email: '', password_digest: 'fille').save
       user2 = User.new(first_name: 'Arthur', last_name: 'Lazarus', email: '   ', password_digest: 'fille').save
       expect(user).to eq(false)
       expect(user2).to eq(false)
     end
     it 'ensures there is not 2 similar emails' do
       user1 = User.new(first_name: 'Arthur', last_name: 'Lazarus', email: 'sameemail@test.com', password_digest: 'fille').save
       user2 = User.new(first_name: 'Bob', last_name: 'fischer', email: 'sameemail@test.com', password_digest: 'garcon').save
       expect(user2).to eq(false)
     end
     it 'should save successfully' do
       user = User.new(first_name: 'Arthur', last_name: 'Lazarus', email: 'test6@test.com', password_digest: 'fille').save
       expect(user).to eq(true)
     end
  end
end
