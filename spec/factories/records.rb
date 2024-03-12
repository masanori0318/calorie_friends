FactoryBot.define do
  factory :record do
    user
    breakfast { 'Some value' }
    lunch { 'Some lunch value' }
    dinner { 'Some dinner value' }
    snack { 'Some snack value' }
    breakfast_cal { 300 } # breakfast_cal 列に適切な値を設定する
    lunch_cal { 400 }
    dinner_cal { 500 }
    snack_cal { 200 }
  end
end
