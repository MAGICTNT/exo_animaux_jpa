<%@ page import="entity.Chien" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 30/08/2024
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%
    Chien chien = (Chien) request.getAttribute("chien");
    String titre = (String) request.getAttribute("titre");

    int ageEnAnnees = -1;  // Initialiser avec une valeur par défaut
    if (chien != null && chien.getDateNaissance() != null) {
        // Convertir la date de naissance en LocalDate
        LocalDate dateNaissance = LocalDate.parse(chien.getDateNaissance().toString());

        // Récupérer la date actuelle
        LocalDate dateActuelle = LocalDate.now();

        // Calculer l'âge en années
        Period age = Period.between(dateNaissance, dateActuelle);
        ageEnAnnees = age.getYears();
    }
%>
<%--<jsp:useBean id="titre" type="java.lang.String" scope="request"/>--%>
<%--<jsp:useBean id="chien" type="entity.Chien" scope="request"/>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=titre%> </title>
</head>
<body>
<a href="affichage">affichage</a>
<a href="detaille">detaille</a>
<a href="ajouter">ajouter</a>

<% if (chien != null) { %>
<p>Le nom du loulou est: <%= chien.getNomChien() %></p>
<p>Il est né le: <%= chien.getDateNaissance() %> (<%= ageEnAnnees %> ans)</p>
<p>Et c'est un: <%= chien.getRace() %></p>
<% } else { %>
<p>besoin d'un loulou, aller sur ajouter <button><a href="${pageContext.request.contextPath}/affichage">ajouter</a> </button></p>
<% } %>

</body>
</html>
