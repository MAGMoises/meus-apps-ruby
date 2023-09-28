# este é um app para corroda de cavalo
# boas vindas
puts "Bem-vindo à corrida de Cavalos"

# Solicitar um depósito inicial de 100 reais
balance = 0
while balance != 100
  puts "Digite o valor do depósito inicial (100 reais): "
  balance = gets.chomp.to_i
  puts "Você deve depositar exatamente 100 reais!" if balance != 100
end

# Mensagem de depósito realizado
puts "Depósito realizado com sucesso! Seu saldo atual é de R$#{balance}."

# Apresentar os cavalos disponíveis
puts "Esses são nossos cavalos disponíveis:"
horses = ["pangaré", "foguete", "ligeirinho", "fumaça"]
horses.each_with_index do |horse, index|
  puts "#{index + 1} - #{horse.capitalize}"
end

# Solicitar que o apostador escolha um cavalo
while balance >= 10
  puts "Digite o número do cavalo que deseja apostar (1 a #{horses.length}): "
  user_horse_index = gets.chomp.to_i - 1

  # Loop da aposta enquanto o apostador tem 10 reais
  if user_horse_index.negative? || user_horse_index >= horses.length
    puts "Escolha inválida. Tente novamente!"
    next
  end

  puts "A sua escolha foi #{horses[user_horse_index]}"

  winner_horse_index = rand(horses.length)
  if user_horse_index == winner_horse_index
    balance += 10
    puts "Parabéns! Você ganhou com #{horses[winner_horse_index]}. Seu saldo aumentou para R$#{balance}."
  else
    balance -= 10
    puts "Você perdeu. Quem ganhou foi #{horses[winner_horse_index]}. Seu saldo diminuiu para R$#{balance}."
  end

  puts "Seu saldo atual é de R$#{balance}."
end

puts "Fim do jogo! Você não tem mais 10 reais para apostar."
