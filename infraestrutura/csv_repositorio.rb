require 'csv'

class CsvRepositorio
  def self.ler(arquivo)
    unless File.exist?(arquivo)
      puts "O arquivo #{arquivo} não existe."
      return nil
    end

    begin
      CSV.read(arquivo, headers: true)
    rescue CSV::MalformedCSVError => e
      puts "Erro ao analisar o arquivo CSV: #{e}"
      nil
    end
  end

  def self.gravar(arquivo, data)
    CSV.open(arquivo, 'w', headers: true) do |csv|
      csv << data.headers if data.headers
      data.each do |row|
        csv << row
      end
    end
  end

  def self.adicionar(arquivo, obj)
    data = ler(arquivo)

    return unless data

    data << obj
    gravar(arquivo, data)
  end
end
