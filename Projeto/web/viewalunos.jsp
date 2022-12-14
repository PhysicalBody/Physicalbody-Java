<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Controlar Alunos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/main_controlar.css">
  <link rel="stylesheet" href="css/tabela.css">
  <link rel="stylesheet" href="css/navbarlateral.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
  <script src="scripts/filtrar.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  <link rel="icon" href="images/TCC-logo.png" />
  <!-- PDF -->
        <script src="./scripts/pdf.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.4/jspdf.plugin.autotable.min.js"></script>
</head>
<body>
 <%@ page import="com.crudjspjava.dao.AlunoDao, com.crudjspjava.bean.Aluno, java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
   <nav class="navigation">
       <ul>
      <li class="list active">
        <a href="viewalunos.jsp?page=1">
          <span class="icon">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Controlar Alunos</span>
        </a>
      </li>

      <li class="list">
        <a href="viewprofessores.jsp?page=1">
          <span class="icon">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Controlar Professores</span>
        </a>
      </li>
      
      <li class="list">
        <a href="relatorioProfessor.jsp">
          <span class="icon">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Relatorio</span>
        </a>
      </li>
    </ul>
  </nav>
 
  <div class="content">
    <h1 id="apresentacao">Lista de Aluno</h1>
  <%
  	
  String pageid = request.getParameter("page");
  int id = Integer.parseInt(pageid);
  int total = 10;
  
  	//List<Aluno> list = AlunoDao.getAllAlunos();
  List<Aluno> list = AlunoDao.getRecords(id, total);
  request.setAttribute("list", list);
  %>
            <input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 0)" placeholder="Busca de nomes">
            <input type="text" id="filtraremails" onkeyup="filtrar('filtraremails', 1)" placeholder="Busca de emails">
            <input type="button" value="Download Contrato" onclick="getPDF()">
     <table id="tabela" class="table table-stripe">
		<tr>
                    <th class="text-center">Nome</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Condi????o</th>
                    <th class="text-center">Plano</th>
                    <th class="text-center">Telefone</th>
		</tr>
		<c:forEach items="${list}" var="aluno">
		<tr>
                    <td class="text-center">${aluno.getNome()}</td>
                    <td class="text-center">${aluno.getEmail()}</td>
                    <td class="text-center">${aluno.getCondicao()}</td>
                    <td class="text-center">${aluno.getPlano()}</td>
                    <td class="text-center">${aluno.getTelefone()}</td>
		</tr>
		</c:forEach>
  </table>
  <br>
  <a href="viewalunos.jsp?page=1">1</a>
   <a href="viewalunos.jsp?page=2">2</a>
    <a href="viewalunos.jsp?page=3">3</a>
    
    <div id="content_p">
        
        <h5 style="margin-left: 22rem;">PHYSICAL BODY ACADEMIA</h5>
        
        <p>
       

<b>DADOS DO CLIENTE CONTRATANTE</b><br>
Nome: [NOME_CLIENTE]. CPF:[CPF]. Data de Nascimento: [NASCIMENTO]. Celular: [CELULAR]. E-mail: [EMAIL]. G??nero: [G??NERO].
Servi??o contratado: [CONTRATOS]
Valor total contratado: [VALOR TOTAL]
Data da compra: [DT_VENDA].

<h6>SERVI??OS</h6>
Este contrato tem como objeto o uso da ACADEMIA, pelo CLIENTE, para a pr??tica de atividades f??sicas com a coordena????o e supervis??o de profissionais da Performa, de acordo com as condi????es do plano contratado. Os hor??rios e dias de atendimentopodem sofrer altera????es no decorrer do contrato, de acordo com as necessidades da ACADEMIA. O CLIENTE poder?? frequentar as instala????es da ACADEMIA nos hor??rios pr??-determinados de acordo com a(s) modalidade(s) contratada (s). Caso a ACADEMIA disponibilize novas atividades, CLIENTE seguir?? as mesmas normas que regem este contrato para delas participar e/ou normas espec??ficas da nova modalidade. O CLIENTE, portanto, est?? ciente de que poder??o ser extintas, criadas ou remanejadas aulas e modalidades de atividades, como tamb??m efetuadas mudan??as de hor??rios e de instrutores, sem pr??vio aviso, independentemente do plano de servi??os que o CLIENTE tiver contratado.<br>

<h6>MENORES</h6>
Se o CLIENTE for menor (de 18 anos) ou incapaz para atos civis assinar?? este contrato juntamente com o pai, a m??e ou o respons??vel legal. O adulto respons??vel responder??, solidariamente, por todos os atos, omiss??es ou obriga????es do menor ou incapaz e autoriza-o ?? pr??tica das atividades f??sicas pretendidas.<br>

<h6>ACESSO</h6>
O acesso ??s depend??ncias da ACADEMIA ser?? realizado atrav??s de registro da impress??o digital, que deve ser realizado pelo aluno no ato da matr??cula. Alguns planos com pre??os especiais apresentam restri????es de acesso em determinados hor??rios. N??o ?? permitida a entrada de acompanhantes nos espa??os restritos aos clientes. O aluno titular pode trazer um convidado ?? academia, com inten????o de conhecer, mediante pr??via autoriza????o para a data solicitada, sendo que este ficar?? respons??vel pela conduta de seu convidado enquanto permanecerem nas depend??ncias da academia. Por motivos de seguran??a, ?? proibida a perman??ncia de crian??as nas depend??ncias da academia sem acompanhamento dos pais ou respons??vel. Elas devem permanecer no espa??o kids, somente no hor??rio em que houver recreacionista e enquanto o (s) respons??vel (eis) estiver (em) treinando na academia.<br>

<h6>AULAS</h6>
O CLIENTE est?? submetido ?? disponibilidade de vagas para as modalidades de aulas coletivas e semi-personal. O gerenciamento ser?? feito atrav??s de sistema de reservas online via site ou aplicativo Performa. As reservas podem ser realizadas peloCLIENTE com 24 horas de anteced??ncia at?? o hor??rio de in??cio da atividade. De acordo com o plano contratado pode haver restri????es no acesso a determinadas atividades. Caso n??o possa comparecer, o CLIENTE deve cancelar a aula reservada pelo site ou app com at?? 1h de anteced??ncia. O CLIENTE que por 3 vezes reservar, mas n??o comparecer ??s aulas, dentro de um per??odo de 30 dias, n??o conseguir?? fazer novos agendamentos por 20 dias. A suspens??o ?? para agendamentos online, e n??o para o acesso ?? ACADEMIA. O cliente poder?? participar de qualquer aula com vaga dispon??vel no hor??rio de in??cio. Para agendar avalia????o f??sica e bioimped??ncia, o CLIENTE tamb??m dever?? usar sistema de reservas online via site ou aplicativo Performa. As reservas podem ser realizadas pelo CLIENTE com 7 dias de anteced??ncia at?? o hor??rio de in??cio da atividade. Caso n??o possa comparecer, o CLIENTE deve cancelar a avalia????o e/ou bioimped??ncia reservada com at?? 24h de anteced??ncia. O CLIENTE que reservar e n??o comparecer a avalia????o ter?? que aguardar 45 dias para nova reserva gratuita. O CLIENTE que reservar e n??o comparecer ?? bioimped??ncia ter?? que aguardar 90 dias para nova reserva gratuita. A toler??ncia de atraso para o ingresso do aluno nas salas onde estiverem sendo desenvolvidas as atividades f??sicas com hor??rios pr??-estabelecidos ?? de, no m??ximo, 10 (dez) minutos, podendo a vaga ser liberada para outro cliente presente ap??s este tempo.<br>

<h6>DECLARA????O DE SA??DE</h6>
Para contratar os servi??os e usufruir deles o CLIENTE dever?? preencher o PAR-Q (Question??rio de Aptid??o para Atividade F??sica) e/ou apresentar atestado m??dico espec??fico para a pr??tica da (s) atividade (s) contratada(s) e renov??-lo (s) na periodicidade que vier a ser determinada pela lei aplic??vel, assim como atender a outras exig??ncias da ACADEMIA relacionadas a comprova????o e/ou entendimento das suas condi????es e limita????es para a pr??tica de atividades f??sicas. Em raz??o de exig??ncias legais e/ou para a sua seguran??a, caso o CLIENTE n??o cumpra com o disposto nesta cl??usula a ACADEMIA poder?? n??o permitir o seu acesso a academia e/ou a pr??tica de atividades f??sicas at?? a regulariza????o.<br>

<h6>PRAZO</h6>
Este contrato tem o prazo contratado de [NOME DO PLANO]. O plano mensal e os planos de venda direta no cart??o de cr??dito e boleto n??o se renovam automaticamente. A cada renova????o ser?? aplic??vel o Contrato de Presta????o de Servi??os de Atividades F??sicas que estiver vigente na data respectiva. Na modalidade DCC (D??bito Recorrente no Cart??o de Cr??dito) o plano ?? v??lido por prazo indeterminado. Se o CLIENTE n??o desejar renovar ao final do per??odo m??nimo contratado dever?? cancelar o contrato sem multa conforme regras descritas no item Cancelamento deste Contrato.<br>

<h6>PAGAMENTO</h6>
A ACADEMIA oferece planos mensais, concedendo descontos sobre a mensalidade em fun????o do prazo contratado. Em raz??o dos descontos concedidos, em caso de cancelamento do plano antes de seu t??rmino, fica ressalvado o disposto no item Cancelamento deste Contrato. O CLIENTE somente poder?? frequentar as instala????es da ACADEMIA enquanto estiver em dia com os pagamentos, sendo que estes dever??o ser realizados independentemente da frequ??ncia ??s atividades. Pelos servi??os ora contratados, o CLIENTE pagar?? ?? ACADEMIA, al??m da taxa de matr??cula no momento da contrata????o, o valor mensal de acordo com a tabela de pre??os vigente na data da contrata????o. Nos planos mensal e venda direta no cart??o de cr??dito o valor total do plano comprometer?? o limite do cart??o de cr??dito. No plano DCC (D??bito Recorrente no Cart??o de Cr??dito) o valor total do plano n??o comprometer?? o limite do cart??o de cr??dito, apenas o valor mensal contar?? no limite, estando o CLIENTE sujeito ??s regras de pagamento das administradoras. Aderindo a este contrato DCC, o CLIENTE autoriza a ACADEMIA a debitar, no cart??o de cr??dito indicado, os valores mensais previstos. A autoriza????o aqui concedida ?? irrevog??vel e ter?? validade enquanto existirem valores a serem pagos, ainda que a matr??cula tenha sido cancelada e o contrato rescindido. Na hip??tese de a administradora do cart??o de cr??dito n??o autorizar a libera????o da quantia devida, oCLIENTE dever?? comparecer ?? ACADEMIA imediatamente a fim de quitar o d??bito, podendo ser permitido ao CLIENTE apresentar outra forma de pagamento praticada pela ACADEMIA para quita????o, devendo tamb??m neste momento o CLIENTE ratificar ou indicar um novo cart??o de cr??dito, se for o caso. Para o plano DCC, considerando o prazo indeterminado do plano, o valor dos servi??os ser?? reajustado na periodicidade m??nima admitida em lei, atualmente anual, com base na varia????o.<br>

<h6>INADIMPL??NCIA</h6>
O CLIENTE que estiver inadimplente ter?? o seu acesso ?? ACADEMIA suspenso ap??s 5 dias do vencimento, at?? a quita????o do d??bito, sem direito ?? compensa????o dos dias em que esteve impedido de frequent??-la. Os valores n??o recebidos nas datas de seus vencimentos ser??o atualizados com multa de 2% do valor da mensalidade e 0,5% de juros por dia de atraso.

Havendo atraso da mensalidade, superior a 15 dias do vencimento, a ACADEMIA fica desde j?? autorizada a:

a) Incluir o nome do CLIENTE no SPC/Serasa;
b) Emitir t??tulos de cr??ditos contra o CLIENTE;
c) Ajuizar A????o Morat??ria ou A????o de Execu????o;

Sempre que julgar necess??rio, a ACADEMIA poder?? exigir do CLIENTE a prova de quita????o das mensalidades juntamente com o documento de identifica????o emitido pela mesma.<br>

<h6>CANCELAMENTO</h6>
O CLIENTE poder?? solicitar o cancelamento a qualquer momento pessoalmente e por escrito na recep????o da ACADEMIA, desde que esteja em dia com o pagamento das mensalidades ou outros d??bitos existentes. Em hip??tese alguma ser?? aceito cancelamento deste contrato por telefone ou e-mail. N??o haver?? devolu????o dos valores j?? pagos mesmo que o CLIENTE n??o tenha frequentado a ACADEMIA. Para o cancelamento do contrato antes do t??rmino de seu per??odo de vig??ncia m??nima, por iniciativa do CLIENTE ou em decorr??ncia do descumprimento, pelo CLIENTE, de suas obriga????es contratuais, ser?? devido ?? ACADEMIA o equivalente a 25% (vinte e cinco por cento) do valor das parcelas a vencer, al??m de perder o per??odo de trancamento a que tenha direito, caso este ainda n??o tenha sido usufru??do. O CLIENTE declara-se ciente que, no caso dos planos pagos com cart??o de cr??dito, caso deseje efetuar o cancelamento dever?? faz??-lo pessoalmente na academia com anteced??ncia m??nima de 40 (quarenta) dias da data prevista para a ocorr??ncia do pr??ximo d??bito, sendo certo que, caso o CLIENTE solicite o cancelamento em prazo inferior, a ACADEMIA n??o efetuar?? a devolu????o do (s) valor(es) correspondente(s) aos d??bitos devidos deste prazo de 40 (quarenta) dias. A ACADEMIA poder?? rescindir o contrato de presta????o de servi??os de forma unilateral, caso o CLIENTE atue nas depend??ncias da ACADEMIA de forma indisciplinada ou de forma que denigra a imagem da ACADEMIA.<br>

<h6>TRANCAMENTO</h6>
A ACADEMIA oferece a op????o de trancamento por determinado per??odo (m??nimo de sete dias), devendo o CLIENTE, para usufruir deste direito, comunicar o interesse ?? recep????o da ACADEMIA com anteced??ncia m??nima de um dia, atrav??s de formul??rio espec??fico, sendo que o CLIENTE n??o poder?? frequentar a academia durante este per??odo. 1. Plano Trimestral - interrup????o de 7 dias corridos; (2) Plano Semestral - interrup????o total de 15 dias; (3) Plano Anual - interrup????o total de 30 dias; Plano 18 Meses - interrup????o total de 45 dias.<br>

<h6>CESS??O DE DIREITO DE USO</h6>
O CLIENTE que n??o pretende mais utilizar seu plano pode ceder o direito de utiliza????o dos servi??os e instala????es da ACADEMIA para outra pessoa, mediante requisi????o escrita feita na recep????o da ACADEMIA, e sujeito ?? aprova????o da ACADEMIA. O CLIENTE n??o deixa de ser o respons??vel financeiro pelo plano, sendo que TODOS os pagamentos devidos continuam sob sua responsabilidade. No momento da transfer??ncia, o titular do plano n??o pode ceder o per??odo de trancamento a que tenha direito, caso este ainda n??o tenha sido usufru??do. Na cess??o de uso, a pessoa a quem for cedido o direito far?? jus ?? utiliza????o dos dias vincendos, considerado tal per??odo como a diferen??a entre a quantidade de dias decorridos desde o in??cio da vig??ncia do plano e o per??odo total inicialmente contratado. Caso a pessoa que recebeu o direito de cess??o de uso j?? seja CLIENTE da ACADEMIAdever?? cumprir seu plano at?? o final e somente depois passar?? a usufruir o direito de uso cedido, sendo-lhe creditados os dias vincendos do cedente e vetado efetuar nova cess??o de direito de uso dos dias recebidos. Caso a pessoa que vier a receber o direito de cess??o de uso n??o seja aluno matriculado na ACADEMIA, ficar?? ela obrigada a cumprir todas as normas da ACADEMIA, devendo arcar com as despesas referentes ?? taxa de matr??cula, sendo-lhe vetado efetuar nova cess??o de direito de uso dos dias recebidos. A ACADEMIA n??o interfere e nem intermedia a CESS??O DE DIREITO DE USO e est?? isenta de qualquer responsabilidade no acordo entre as partes.<br>

<h6>NORMAS DE CONDUTA</h6>
?? expressamente proibida qualquer conduta do aluno que n??o esteja de acordo com o objeto deste instrumento, que seja contr??ria ?? moral e aos bons costumes ou que, por qualquer forma, cause perturba????o ao ambiente da ACADEMIA, aos funcion??rios, instrutores, professores ou frequentadores, como, exemplificativamente: (I) uso inadequado ou impr??prio dos equipamentos; (II) atos ou atitudes que perturbem outros clientes e que pelos mesmos sejam repelidas; (III) atitudes agressivas com outros clientes ou com funcion??rios da academia; (IV) a comercializa????o de produtos ou servi??os nas depend??ncias da academia.
Al??m das condutas acima referidas, a ACADEMIA reserva-se ao direito de considerar como inadequadas e proibidas outras condutas que n??o estejam de acordo com o objeto deste instrumento. ?? vetado ao CLIENTE retirar equipamentos ou qualquer outro bem de propriedade da ACADEMIA de suas instala????es. O CLIENTE deve zelar e utilizar adequadamente os equipamentos e bens da ACADEMIA, ficando obrigado a reparar quaisquer danos por ele causados a equipamentos, funcion??rios e/ou terceiros, podendo ter as suas atividades suspensas at?? a efetiva repara????o do dano. OS DANOS DE QUALQUER NATUREZA DECORRENTES DE ATIVIDADES EXECUTADAS SEM A SOLICITA????O DE ORIENTA????O OU COM INOBSERV??NCIA DAS INSTRU????ES DOS PROFESSORES DA ACADEMIA N??O SER??O DE RESPONSABILIDADE DA MESMA E CARACTERIZAR??O CULPA EXCLUSIVA DO CLIENTE. O aluno que cometer qualquer atitude, ofensa, agress??o f??sica e demais atos que infrinjam a lei e/ou que resultem em preju??zo para a academia, dever?? ressarcir a mesma. N??o ?? permitido o uso de qualquer outro cal??ado que n??o seja t??nis para a pr??tica dos exerc??cios, salvo em modalidades espec??ficas. Para que os movimentos sejam executados com exatid??o, ?? vetado se exercitar com roupas jeans, cargo ou social. Os trajes adequados s??o: shorts, cal??as de agasalho ou moletom, camiseta ou regata. A ACADEMIA pode impedir a participa????o de aluno em aula que n??o lhe seja recomendada pela sua avalia????o f??sica, m??dica ou se o aluno n??o estiver devidamente trajado e/ou equipado. A toler??ncia de atraso para o ingresso do aluno nas salas onde s??o realizadas atividades coletivas com hor??rios pr??-estabelecidos ?? de, no m??ximo, dez minutos. ?? vetada a entrada e a circula????o de animais na academia. N??o ?? permitido fumar ou ingerir bebida alco??lica no interior da academia. ?? terminantemente proibido o ingresso de pessoas portando armas de fogo no interior da academia. Somente est??o autorizados a exercer a atividade de personal trainer, os profissionais devidamente cadastrados junto ?? academia, sendo que n??o ser?? permitida, em hip??tese alguma, a atua????o do aluno de forma a caracterizar trabalho como instrutor e/ou personal trainer. N??o ?? permitido filmar ou fotografar o interior da academia e das aulas, salvo mediante autoriza????o expressa da Dire????o.<br>

<h6>DESCUMPRIMENTO DE NORMAS</h6>
O CLIENTE que mantiver conduta em desacordo com o objeto deste contrato, estar?? sujeito ?? advert??ncia verbal e/ou cancelamento de sua matr??cula com rescis??o antecipada do contrato ou a n??o renova????o do mesmo, a crit??rio da ACADEMIA. O CLIENTE que praticar, no interior da academia, atos de agress??o f??sica, amea??a, venda de subst??ncias il??citas, roubo, furto e outros que configurem il??citos penais, bem como atos cuja gravidade justifique tal medida.<br>

<h6>RESPONSABILIDADE POR BENS DO CLIENTE</h6>
A ACADEMIA n??o se responsabiliza pela perda, dano ou extravio de objetos e pertences pessoais ou de valor nas suas depend??ncias. A utiliza????o do guarda-volumes n??o implica em dever de guarda da ACADEMIA, sendo vetado ao CLIENTE deixar seus pertences nos vesti??rios ap??s a sa??da da academia. Para a utiliza????o dos arm??rios no vesti??rio masculino, por quest??es de sua pr??pria seguran??a e inviolabilidade do arm??rio, o CLIENTE deve utilizar cadeado de sua propriedade, ficando a ACADEMIA isenta de qualquer responsabilidade sobre o material deixado no arm??rio. No vesti??rio feminino, a CLIENTE dever?? criar uma senha eletr??nica nova todos os dias, obedecendo ??s normas de seguran??a conforme manual de instru????es afixado no mural do vesti??rio, ficando a ACADEMIA isenta de qualquer responsabilidade caso tal procedimento n??o seja obedecido. A utiliza????o do arm??rio ?? permitida somente durante a perman??ncia do cliente na academia e os arm??rios encontrados fechados ap??s o hor??rio de funcionamento ser??o abertos e os objetos neles contidos ser??o encaminhados ??s autoridades competentes, sem direito a indeniza????o.<br>

<h6>IMAGEM</h6>
O CLIENTE, neste ato, autoriza que a ACADEMIA se utilize dos meios eletr??nicos (e-mail, telefone, mensagens SMS) com o objetivo de enviar not??cias, avisos, dicas, promo????es e outras informa????es relevantes acerca do funcionamento da academia. O presente instrumento constitui autoriza????o de uso da imagem, permitindo a utiliza????o da imagem do
CLIENTE pela ACADEMIA em qualquer suporte material apto a reprodu????o de imagens ou imagens.

<h6>CONTRATA????O ELETR??NICA</h6>
A ades??o ao presente contrato poder?? ocorrer de forma eletr??nica, atrav??s do website, tablets, seu celular, totens ou outros dispositivos eletr??nicos. Ao contratar este servi??o de atividades f??sicas o CLIENTE manifesta sua ci??ncia e concord??ncia com os termos do presente contrato, assim como declara-se ciente e de acordo de que a ACADEMIA no processo de ades??o poder?? efetuar a coleta e armazenamento de seus dados biom??tricos e informa????es pessoais, bem como de registros de suas a????es, necess??rios para a comprova????o de validade desta contrata????o.

<h6>DISPOSI????ES FINAIS</h6>
As normas constantes dos avisos e orienta????es afixados no interior das instala????es da academia, que n??o estiverem contempladas neste contrato, passam a fazer parte integrante do mesmo, sendo certo que o seu n??o cumprimento poder?? acarretar na rescis??o antecipada ou a n??o renova????o do mesmo. Toda e qualquer sugest??o, reclama????o ou altera????o dever?? ser encaminhada, por escrito, ?? dire????o da ACADEMIA, que analisar?? cada caso conforme crit??rios estabelecidos. Os casos omissos neste contrato dever??o ser analisados pela dire????o da ACADEMIA.<br>

Declaro que li integralmente este Contrato de Presta????o de Servi??os de Atividades F??sicas, entendi e concordo com todas as cl??usulas e condi????es.  
          
        </p>
        
    </div>
    
</body>
</html>