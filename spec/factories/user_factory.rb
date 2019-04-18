FactoryBot.define do
  factory: User do
    sequence(:email) { |n| "user#{n}@example.com" }
      email
      password {"qwertyuiop"}
      first_name {"Admin"}
      last_name {"User"}
  end
end
