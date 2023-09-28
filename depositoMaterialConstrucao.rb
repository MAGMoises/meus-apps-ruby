# esse é programa para marial de construção
# Pseudo-código
# 1. Imprimir Bem-vindo
puts "Bem vinda ao nosso depósito MAGconstruções"

# 2. Defina sua loja (quais itens estão à venda?)
materiais = %w[cimento tijolos areia barro brita]

# 3. Mostrar os itens com preço para o cliente (compras)
balance = 0
precos = [60.0, 600.0, 250.0, 180.0, 260.0] # preços correspondentes aos materiais
puts "Veja nossos materiais de construção disponíveis: "
materiais.each_with_index do |material, index|
  puts "#{index + 1} - #{material.capitalize} (R$ #{precos[index]})"
end

# 4. Permitir que o cliente escolha os itens desejados
loop do
  puts "Coloque no carrinho o material desejado (1 a #{materiais.length}, ou 0 para Pagamento): "
  user_material_index = gets.chomp.to_i - 1

  break if user_material_index == -1

  if user_material_index.between?(0, materiais.length - 1)
    balance += precos[user_material_index]
    puts "Item adicionado ao carrinho."
  else
    puts "Item não existe, tente outra opção:"
  end
end

# 5. Somar as compras do cliente e mostrar o valor
puts "Valor total da sua compra é: R$ #{balance.round(2)}"

# 6. Solicitar a forma de pagamento
puts "Qual a forma de pagamento? (1 para Crédito! 2 para dinheiro)"
forma_pagamento = gets.chomp.to_i

if forma_pagamento == 1
  # 7. Se for crédito possibilitar parcelar em até 3x
  puts "Deseja parcelar em quantas vezes (1 a 3)? "
  num_parcelas = gets.chomp.to_i

  if num_parcelas.positive? && num_parcelas <= 3
    valor_parcelas = balance / num_parcelas
    puts "Você pagará em #{num_parcelas}x de R$ #{valor_parcelas.round(2)}."
  else
    puts "Opção inválida de parcelamento. Pagamento em 1x à vista."
  end
elsif forma_pagamento == 2
  # 8. Se for dinheiro verificar se tem troco e informar valor do troco
  puts "Informe o valor pago em dinheiro: "
  valor_pago = gets.chomp.to_f

  if valor_pago >= balance
    troco = valor_pago - balance
    puts "Troco: R$ #{troco.round(2)}"
  else
    puts "Valor insuficiente. O pagamento não foi efetuado."
  end
else
  puts "Opção de pagamento inválida."
end
