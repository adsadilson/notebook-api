namespace :dev do
  desc "Configuração do ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando contatos..."
    100.times do |i|
      Contacto.create!(
        name: Faker::Name.name,
        email:Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end
    puts "Contatos cadastrado com sucesso!"
  end

end
