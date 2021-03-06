# encoding:utf-8

require 'mechanize'
require 'json'
################################################
##           !USE YOUR CREDENTIALS            ##
################################################
USERNAME = 'aluno' # Use your username!
PASSWORD = '12345'
 # Use your password!
#
# Helper function that saves a HTML file on the html directory.
#
# @param [String] filename the name of the file to be saved.
# @param [String] body the body of the HTML file.
#
def save_html(filename, body)
  File.open("saved_html/#{filename}.html", "w") do |f|
    f.write(body.force_encoding('utf-8'))
  end
end


class Vaga 
  attr_reader :id, :habilitacao, :titulo, :empresa, :atuacao, :descricao, :requisitos, :beneficios, :contatos, :data, :validade, :nvagas
  def initialize(id, habilitacao, titulo, empresa, atuacao, descricao, requisitos, beneficios, contatos, data, validade, nvagas) 
    @id = id 
    @habilitacao = habilitacao
    @titulo = titulo
    @empresa = empresa
    @atuacao = atuacao
    @descricao = descricao
    @requisitos = requisitos
    @beneficios = beneficios
    @contatos = contatos
    @data = data
    @validade = validade
    @nvagas = nvagas
  end 
  def to_s 
    "Vaga: #{@id}--#{@habilitacao} #{@titulo} #{@empresa} #{@atuacao} #{@descricao} #{@requisitos} #{@beneficios} #{@contatos} #{@data} #{@validade} #{@nvagas}" 
  end
  def to_json
    {'id' => @id, 'habilitacao' => @habilitacao,  'titulo' => @titulo, 'empresa' => @empresa, 
     'atuacao' => @atuacao, 'descricao' => @descricao, 'requisitos' => @requisitos, 
     'beneficios' => @beneficios, 'contatos' => @contatos, 'data' => @data, 'validade' => @validade, 'vagas' => @nvagas}.to_json
  end
end

mechanize = Mechanize.new
mechanize.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36"

mechanize.get('http://estagios.pcs.usp.br/')
mechanize.get('http://estagios.pcs.usp.br/semLogin/login.aspx')

save_html('before_login', mechanize.page.body)

form = mechanize.page.forms[0]

headers = {
  'Host' => 'estagios.pcs.usp.br',
  'Connection'      => 'keep-alive',
  'Cache-Control'   => 'max-age=0',
  'Accept'          => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
  'Origin'          => 'http://estagios.pcs.usp.br',
  'Content-Type'    => 'application/x-www-form-urlencoded',
  'Referer'         => 'http://estagios.pcs.usp.br/semLogin/login.aspx',
  'Accept-Encoding' => 'gzip,deflate,sdch',
  'Accept-Language' => 'en-US,en;q=0.8,pt;q=0.6,de;q=0.4'
}

params = {
  '__EVENTTARGET'     => '',
  '__EVENTARGUMENT'   => '',
  '__VIEWSTATE'       => form.field_with(name: '__VIEWSTATE').value,
  '__EVENTVALIDATION' => form.field_with(name: '__EVENTVALIDATION').value,
  'ctl00$ContentPlaceHolder1$Login1$UserName'    => USERNAME,
  'ctl00$ContentPlaceHolder1$Login1$Password'    => PASSWORD,
  'ctl00$ContentPlaceHolder1$Login1$LoginButton' => 'Logar'
}

mechanize.post("http://estagios.pcs.usp.br/semLogin/login.aspx", params, headers)

save_html('after_login', mechanize.page.body)

#############################################################
##         TODO: CONTINUE FROM HERE!               ##########
## Create a JSON file containing the first n job postings ###
## and save it to sites/data                              ###
##                                                        ###
#############################################################
f = File.new("../site/data/estagios",  "w+")
f.print "{\"estagios\":["
vagas = []
n = 50
n.times do |i|
  currentid = 0 + i
  puts currentid
  mechanize.get("http://estagios.pcs.usp.br/aluno/vagas/exibirVaga.aspx?id=#{currentid}")
  #save_html("vagaid#{currentid}", mechanize.page.body)
  doc = mechanize.page.parser
  habilitacao =  doc.css('#ContentPlaceHolder1_lblHabilitacao').text
  titulo =  doc.css('#ContentPlaceHolder1_lblTitulo').text
  empresa =  doc.css('#ContentPlaceHolder1_lblEmpresa').text
  atuacao =  doc.css('#ContentPlaceHolder1_lblArea').text
  descricao =  doc.css('#ContentPlaceHolder1_lblDescricao').text
  requisitos =  doc.css('#ContentPlaceHolder1_lblRequisitos').text
  beneficios =  doc.css('#ContentPlaceHolder1_lblBeneficios').text
  contatos =  doc.css('#ContentPlaceHolder1_lblTContatos').text
  data =  doc.css('#ContentPlaceHolder1_lblDataAnuncio').text
  validade =  doc.css('#ContentPlaceHolder1_lblDataValidade').text
  nvagas =  doc.css('#ContentPlaceHolder1_lblNumeroVagas').text
  vagas[i] = Vaga.new(currentid, habilitacao, titulo, empresa, atuacao, descricao, requisitos, beneficios, contatos, data, validade, nvagas)
  f.print vagas[i].to_json
  f.print ","
end
puts n
mechanize.get("http://estagios.pcs.usp.br/aluno/vagas/exibirVaga.aspx?id=#{n}")
#save_html("vagaid#{currentid}", mechanize.page.body)
doc = mechanize.page.parser
habilitacao =  doc.css('#ContentPlaceHolder1_lblHabilitacao').text
titulo =  doc.css('#ContentPlaceHolder1_lblTitulo').text
empresa =  doc.css('#ContentPlaceHolder1_lblEmpresa').text
atuacao =  doc.css('#ContentPlaceHolder1_lblArea').text
descricao =  doc.css('#ContentPlaceHolder1_lblDescricao').text
requisitos =  doc.css('#ContentPlaceHolder1_lblRequisitos').text
beneficios =  doc.css('#ContentPlaceHolder1_lblBeneficios').text
contatos =  doc.css('#ContentPlaceHolder1_lblTContatos').text
data =  doc.css('#ContentPlaceHolder1_lblDataAnuncio').text
validade =  doc.css('#ContentPlaceHolder1_lblDataValidade').text
nvagas =  doc.css('#ContentPlaceHolder1_lblNumeroVagas').text
vagas[n] = Vaga.new(n, habilitacao, titulo, empresa, atuacao, descricao, requisitos, beneficios, contatos, data, validade, nvagas)
f.print vagas[n].to_json
f.print "]}"

#Create a summary file containing the basic information needed by the site
totaldevagas = vagas.length
vagasembranco = 0
vagasvalidas = 0
vagas.each do |vaga|
  if vaga.habilitacao == "" && vaga.titulo == "" && vaga.empresa == "" && vaga.atuacao == "" && vaga.descricao == "" && vaga.requisitos == "" && vaga.beneficios == "" && vaga.contatos == "" && vaga.data == "" && vaga.validade == "" && vaga.nvagas == ""
    vagasembranco = vagasembranco + 1
  else
    vagasvalidas = vagasvalidas + 1
  end
end
summary = File.new("../site/data/summary",  "w+")
lastupdated = Time.new
summary.puts "lastupdated=" + lastupdated.inspect
summary.puts "totaldevagas=#{totaldevagas}" 
summary.puts "vagasvalidas=#{vagasvalidas}"
summary.puts "vagasembranco=#{vagasembranco}"