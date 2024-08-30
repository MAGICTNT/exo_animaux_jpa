<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 30/08/2024
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="titre" type="java.lang.String" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= titre %> </title>
</head>
<body>
<main>
    <jsp:include page="component/nav.jsp"/>


    <form action="affichage" method="post">
        <label for="nom">Nom du chien</label>
        <input type="text" id="nom" name="nom">
        <label for="race">Race</label>
        <input type="text" id="race" name="race">
        <label for="dateDeNaissance">date de naissance </label>
        <input type="date" id="dateDeNaissance" name="dateDeNaissance">
        <button>send</button>

    </form>
</main>
</body>
</html>
