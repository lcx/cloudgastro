FactoryGirl.define do
  factory :season do
    name "Autumn"
    from_date Date.parse('2015-09-20')
    to_date Date.parse('2015-12-20')
    company_id 1
    vendor_id 1
    color "#d6c951"
  end
end
