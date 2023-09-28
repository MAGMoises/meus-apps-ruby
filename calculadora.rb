# esta é uma calculadora
# Boas vindas ao usuário
puts "Essa é sua calculadora feita em Ruby"

loop do
  # Perguntar o primeiro numero
  puts "Primeiro numero: "
  # Salvar a resposta em uma variável
  first_number = gets.chomp.to_f

  # Perguntar o segundo numero
  puts "Segundo numero: "
  # Salvar a resposta em uma variável
  second_number = gets.chomp.to_f

  # Perguntar qual operação ele quer usar [+][-][*][/]
  print "Escolha uma operação! [+][-][*][/]: "
  # Salvar a resposta em uma variável
  operator = gets.chomp

  # Fazer a conta
  result =
    case operator
    when "+"
      first_number + second_number
    when "-"
      first_number - second_number
    when "*"
      first_number * second_number
    when "/"
      second_number == 0 ? "Não é possível dividir por zero." : first_number / second_number
    else
      "Operação inválida! Tente novamente."
    end

  # Mostrar o resultado
  puts "O resultado é: #{result}"

  # Perguntar se deseja continuar
  print "Deseja continuar? 'sim' / 'não' para continuar: "
  continuar = gets.chomp.downcase
  break unless continuar == 'sim' || continuar == 's'
end

puts "Até a próxima!"
