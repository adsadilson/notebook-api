namespace :dev do
  desc "Configuração do ambiente de desenvolvimento"
  task setup: :environment do
    
    puts "Resetando o banco de dados..."
    %x(rails db:drop db:create db:migrate)

    puts "Cadastrando os tipos de contato..."
    # %w atalho para não utilizar as aspar
      kinds = %w(Amigos Conhecido Comercial)
      kinds.each do |kind|
        # ! força o erro printar na tela
        Kind.create!(
          description: kind
        )
      end
    puts "Tipos de Contato cadastrado com sucesso!"
    
    puts "Cadastrando contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrado com sucesso!"

    puts "Cadastrando os telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone =  Phone.create!(number: Faker::PhoneNumber.cell_phone, contact: contact)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Telefones cadastrados com sucesso!"

    puts "Cadastrando o endereço..."
    Contact.all.each do |contact|
		  Address.create!(
			  street: Faker::Address.street_address, 
			  city: Faker::Address.city,
			  contact: contact)
    end
	  puts "Endereço cadastados com sucesso!"

  end

end
