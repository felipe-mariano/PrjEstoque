<%@page import="org.senai.ctrlEstoque.modelo.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Estoque</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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


<h1 style="text-align:center;color:black"><b>Boutique de Carnes</b></h1>
<h2 style="text-align:center;color:black">Estoque</h2>


	<table class="table table-striped">
		<thead>
			<tr>
				<th style="color:black;width="10%">Codigo</th>
				<th style="color:black;width="30%">Produto</th>
				<th style="color:black;width="20%">Tipo de Carne</th>
				<th style="color:black;width="10%">Prazo de validade</th>
				<th style="color:black;width="10%">Quantidade</th>
				<th style="color:black;width="10%">Valor de compra</th>
				<th style="color:black;width="15%">Valor de Venda</th>
			</tr>
		</thead>
		<tbody>
			<script>
				function prepararEditar(cod){
					//alert("editar" +cod);
					window.location.replace('gerenciarItem.jsp?cod='+cod);
				}	
			
			</script>
			
			<% 
			Item item = new Item();
			for (Item p : item.getLista()) {
				out.print("<tr onclick='prepararEditar("+p.getCod()+")'>");
				out.print("<td>" + p.getCod()+"</td>");
				out.print("<td>"+p.getNomeItem()+ "</td>");
				out.print("<td class='"+p.getCorFornecedor()+ "'>"+ p.getFornecedor() + "</td>");
				out.print("<td>"+p.getValidade()+ "</td>");
				out.print("<td>"+p.getQuantidade()+ "</td>");
				out.print("<td>"+p.getCompra()+ "</td>");
				out.print("<td>"+p.getVenda()+ "</td>");
				out.print("</tr>");
			}
			
			%>
		</tbody>
	</table>
	<center>
	<br><br>
	<img align="middle" height="150" width="150"
		src="http://download.seaicons.com/icons/icons8/windows-8/512/Cultures-Bull-icon.png">
	<img width="150"
		src="https://hanatemplate.com/images/pig-head-vector-2.png">
	<img height="150" width="150"
		src="https://cdn.pixabay.com/photo/2012/04/12/22/14/rooster-30871_960_720.png">
	
		
		</center>
		
		<div class="jumbotron text-center bg-dark"  style="margin-bottom:0 ; margin-top:50px ; ">
  			
		</div>
</body>
</html>