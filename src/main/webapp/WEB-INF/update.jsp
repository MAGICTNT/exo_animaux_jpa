<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 30/08/2024
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="titre" type="java.lang.String" scope="request"/>
<html>
<head>
    <title><%= titre %> </title>
</head>
<body>
<main>
    <jsp:include page="component/nav.jsp"/>


    <form action="affichage" method="post">
        <label for="nom">Nom du chien</label>
        <input type="text" id="nom" name="nom" required>
        <label for="race">Race</label>
        <input type="text" id="race" name="race" required>
        <label for="dateDeNaissance">date de naissance </label>
        <input type="date" id="dateDeNaissance" name="dateDeNaissance" required>
        <button>send</button>

    </form>
</body>
</html>
