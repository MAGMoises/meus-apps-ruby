# esta é uma agenda telefonica
# Adicionar, editar e remover contatos;
# Informações da conta: Nome e telefone;
# Possibilidade de ver todos contatos ou somente um;

@agenda = [
  { nome: "Teste1", telefone: "095990002233" },
  { nome: "teste2", telefone: "095990002222" }
]

# ==== Bloco para mostrar a relação de contatos =======
def todos_contatos
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  puts "========================================="
end

# ==== Bloco para adicionar contatos ========
def adicionar_contato
  print "Nome:"
  nome = gets.chomp
  print "Telefone:"
  telefone = gets.chomp
  @agenda << { nome: nome, telefone: telefone }
end

puts "========================================="

# ==== Bloco para ver contatos ========
def ver_contato
  print "Digite um nome de contato: "
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
  end
  puts "========================================="
end

# ==== Bloco para editar contatos ========
def editar_contato
  print "Qual nome deseja editar? "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      print "Nome para editar (Enter para manter): "
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = nome_salvo if contato[:nome].empty?

      print "Telefone para editar (Enter para manter): "
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telefone] = telefone_salvo if contato[:telefone].empty?
    end
  end
  puts "========================================="
end

# ==== Bloco para remover contatos ========
def remover_contato
  print "Remova um contato: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      indice = @agenda.index(contato)
      @agenda.delete_at(indice)
      break
    end
  end
end

# ==== Loop do código ========
loop do
  puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
  codigo = gets.chomp.to_i

  case
  when codigo == 0
    puts "Até mais"
    break
  when codigo == 1
    todos_contatos
  when codigo == 2
    adicionar_contato
  when codigo == 3
    ver_contato
  when codigo == 4
    editar_contato
  when codigo == 5
    remover_contato
  else
    puts "Escolha um número entre 0 e 5: "
  end
end
