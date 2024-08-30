<%@ page import="entity.Chien" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 30/08/2024
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%--<jsp:useBean id="chiens" type="java.util.List<entity.Chien>" scope="request"/>--%>
<%
    List<Chien> chiens = (List<Chien>) request.getAttribute("chiens");
    String titre = (String) request.getAttribute("titre");
%>

<%--<jsp:useBean id="titre" type="java.lang.String" scope="request"/>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= titre %> </title>
</head>
<body>
<div>
    <button>
        <a href="${pageContext.request.contextPath}/affichage">affichage</a>
    </button>
    <button>
        <a href="${pageContext.request.contextPath}/detaille">detaille</a>
    </button>
    <button>
        <a href="${pageContext.request.contextPath}/ajouter">ajouter</a>
    </button>
</div>
<br/>

<% if (chiens == null || chiens.size() <= 0) { %>
<p>Aucun chien trouvé</p>
<% } else { %>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Race</th>
        <th>Date de Naissance</th>
        <th>plus d'information</th>
    </tr>
    </thead>
    <tbody>
    <% for (Chien chien : chiens) { %>
    <tr>
        <td><%= chien.getIdChien() %></td>
        <td><%= chien.getNomChien() %></td>
        <td><%= chien.getRace() %></td>
        <td><%= chien.getDateNaissance().toString() %></td>
        <td>
            <a href="${pageContext.request.contextPath}/detaille?idChien=<%= chien.getIdChien() %>">plus d'info</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } %>

</body>
</html>
