<%-- 
  Autore: Ignazio Leonardo Calogero Sperandeo
  Data: 09/02/2025
  Consegna: Realizzare un application server in Java, attraverso tomcat, che dati due parametri dalla URL, mese e anno, restistuica il corrispettivo calendario.
  by jim_bug // :)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help BugCal</title>
    </head>
    <body>
        <% 
            String err = (String) request.getAttribute("errMsg");
        %>
        <h1 align='center'>Benvenuto nell'Help di BugCal! <h1>
        <h5> Error: <%= err %> </h5>
        
        <p> To use BugCal, you must provide the following URL parameters: </p>
        <ul>
            <li>?month={monthValue}&year={yearValue}</li>
        </ul>
        <p> The monthValue must be one of the following: </p>
        <ul>
            <li> gennaio </li>
            <li> febbraio </li>
            <li> marzo </li>
            <li> aprile </li>
            <li> maggio </li>
            <li> giugno </li>
            <li> luglio </li>
            <li> agosto </li>
            <li> settembre </li>
            <li> ottobre </li>
            <li> novembre </li>
            <li> dicembre </li>
        </ul>
        <p>The yearValue must be between 1 and 9999.</p>
        <p> <strong> Example usage: http://localhost:8084/cal/show?month=gennaio&year=2024 </strong></p>
    </body>
</html>

<%-- // :) --%>
