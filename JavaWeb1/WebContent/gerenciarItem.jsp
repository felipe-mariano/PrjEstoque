<!DOCTYPE html>
<%@page import="org.senai.ctrlEstoque.modelo.Item"%>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciar</title>
</head>
<body>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

</head>
<body>

	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">
    <img src="img/Boutique_de_Carne.jpg" alt="logo" width="40px" />
  </a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="gerenciarItem.jsp">Gerenciar Estoque</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="estoque.jsp">Estoque</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="index.html">Pagina Incial</a>
    </li>
  </ul>
</nav>
	

	<script type="text/javascript">
		function dadosForm() {
			var dados = "";
			dados += "cod="+document.getElementById("cod").value;
			dados += "&nomeItem=" + document.getElementById("nomeItem").value;
			dados += "&fornecedor="+ document.getElementById("fornecedor").value;
			dados += "&validade=" + document.getElementById("validade").value;
			dados += "&quatidade=" + document.getElementById("quatidade").value;
			dados += "&compra=" + document.getElementById("compra").value;
			dados += "&venda=" + document.getElementById("venda").value;

			return dados;
		}
		
		function apagar(){
			if(confirm ("Realmente deseja apagar esse registro?")){
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(){
					if (this.readyState == 4 && this.status ==200){
						var msg = xhttp.responseText;
						
						if(msg =="Gravado com sucesso"){
							document.getElementById("msg").className = "alert alert-info";
							document.getElementById("msg").innerHTML = "Informação Apagada";
							document.getElementById("formulario").reset();
						} else {
							document.getElementById("msg").className = "alert alert-danger";
							document.getElementById("msg").innerHTML = "Erro ao apagar";
						}
						
					}
				
				};
				xhttp.open("GET", "servletEstoque?"+dadosForm()+"&apagar",true);
				xhttp.send();
			}
		}
		
		
		function novo(){
			window.location.replace('gerenciarItem.jsp');
			
		}

		function gravar() {

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {

					// pega um retorno lá do servlet 
					var msg = xhttp.responseText;

					document.getElementById("msg").innerHTML = msg;
					if (msg == "Gravado com sucesso") {
						document.getElementById("msg").className = "alert alert-info";
					} else {
						document.getElementById("msg").className = "alert alert-danger";
					}

				}
			};
			alert(dadosForm());
			xhttp.open("GET", "servletEstoque?" + dadosForm(), true);
			xhttp.send();

		}
	</script>
	<%
		// meu java rolar
		Item item = new Item();
		
		if(request.getParameter("cod") != null){
			int cod = Integer.parseInt(request.getParameter("cod"));
			item = item.getItem(cod);
		}
	%>

	<div class="container">
		<h1 style="text-align:center;color:black"><b>Cadastrar produto</b></h1>
		<form action="/action_page.php">
			<div id="msg"></div>
			<div class="form-row">
				<div class="form-group col-md-3">
				<input type="hidden" id="cod" value="<% out.print(item.getCod()); %>" >
					<label for="nome">Produto</label> <input type="text"
					value="<% out.print(item.getNomeItem()); %>"
						class="form-control" id="nomeItem" name="nome">
				</div>

				<div class="form-group col-md-3">
					<label for="status">Tipo de Carne:</label> <select
						class="form-control" id="fornecedor">
						<option>Bovino</option>
						<option>Suino</option>
						<option>Frango</option>
						
					</select>
					<script>
						document.getElementById("fornecedor").value = 
							"<% out.print(item.getFornecedor()); %>";
					</script>
				</div>

				<div class="form-group col-md-3">
					<label for="local">Prazo de validade:</label> <input type="date"
						class="form-control" id="validade" value="<% out.print(item.getValidade()); %>">
				</div>
				<div class="form-group col-md-3">
					<label for="local">Quantidade:</label> <input type="text"
						class="form-control" id="quatidade" placeholder="Kg" value="<% out.print(item.getQuantidade()); %>">
				</div>
				<div class="form-group col-md-3">
					<label for="local">Valor de compra:</label> <input type="text"
						class="form-control" id="compra" placeholder="R$" value="<% out.print(item.getCompra()); %>">
				</div>
				<div class="form-group col-md-3">
					<label for="local">Valor de venda:</label> <input type="text"
						class="form-control" id="venda"  placeholder="R$" value="<% out.print(item.getVenda()); %>">
				</div>
			</div>
			<button type="button" class="btn btn-secondary" onclick="novo()">Novo</button>
			<button type="button" class="btn btn-primary" onclick="gravar()">Gravar</button>
			<button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
		</form>
	</div>
	<br><br>
		<center>
	<img align="middle" height="200" width="200"
		src="http://download.seaicons.com/icons/icons8/windows-8/512/Cultures-Bull-icon.png">
	<img height="200" width="200"src="https://hanatemplate.com/images/pig-head-vector-2.png">
	<img height="200" width="200" src="https://cdn.pixabay.com/photo/2012/04/12/22/14/rooster-30871_960_720.png">
		</center>
		
		
		<div class="jumbotron text-center bg-dark"  style="margin-bottom:0 ; margin-top:50px ; ">
  			
		</div>
</body>
	

</body>
</html>
