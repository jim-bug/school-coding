<%-- 
  Autore: Ignazio Leonardo Calogero Sperandeo
  Data: 09/02/2025
  Consegna: Realizzare un application server in Java, attraverso tomcat, che dati due parametri dalla URL, mese e anno, restistuica il corrispettivo calendario.
  by jim_bug // :)
--%>


<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Ignazio Leonardo Calogero Sperandeo">
    <meta name="description" content="Calendario dinamico">
    <title>BugCal</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
            margin: auto;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #ccc;
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #f4f4f4;
            color: #333;
        }
        td {
            height: 50px;
        }
        .empty {
            background-color: #f9f9f9;
        }
        .today {
            background-color: #ffeb3b;
        }
    </style>
</head>
<body>
    <%
        String month = (String) request.getAttribute("month");     // ottengo i parametri dalla URL
        int year = (int) request.getAttribute("year");
        int[] monthData = (int[]) request.getAttribute("monthData");
        int dayNumber = (int) request.getAttribute("dayNumber");
        LocalDate today = LocalDate.now();
        String cssClass;
        
        
    %>
    <h1 style="text-align: center;">Calendario di <%= month %> <%= year %></h1>
    <table>
        <thead>
            <tr>
                <th>Lunedì</th>
                <th>Martedì</th>
                <th>Mercoledì</th>
                <th>Giovedì</th>
                <th>Venerdì</th>
                <th>Sabato</th>
                <th>Domenica</th>
            </tr>
        </thead>
        <tbody>
        <%
            out.println("<tr>");
            // Aggiungo caselle vuote fino al giorno di partenza
            for (int i = 1; i < dayNumber; i++) {
                out.println("<td class='empty'></td>");
            }
            
            // Scrivo i numeri dei giorni del mese nelle caselle
            for (int day = 1; day <= monthData[1]; day++) {
                LocalDate currentDate = LocalDate.of(year, monthData[0], day);
                cssClass = currentDate.equals(today) ? "today" : "";
                out.println("<td class='" + cssClass + "'>" + day + "</td>");
                if ((day+dayNumber-1) % 7 == 0) {
                    out.println("</tr><tr>"); // Nuova riga
                }
            }
        %>
        </tbody>
    </table>
    <footer style="text-align: center; padding: 10px; background-color: #f4f4f4; color: #333; border-top: 1px solid #ccc; margin-top: 20px;">
        <p>Scritto da <strong>Ignazio Leonardo Calogero Sperandeo</strong></p>
        <p>Classe: 5C Informatica</p>
        <p>In Data: 09/02/2025</p>
    </footer>
</body>
</html>
<%-- // :) --%>
