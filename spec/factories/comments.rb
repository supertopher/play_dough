# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment, :class => 'Comments' do
    user nil
    challenge nil
    karma 1
    body "MyText"
  end
end
