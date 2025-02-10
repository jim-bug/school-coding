/*
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * Data: 09/02/2025
 * Consegna: Realizzare un application server in Java, attraverso tomcat, che dati due parametri dalla URL, mese e anno, restistuica il corrispettivo calendario.
 * by jim_bug // :)
*/
package it.java.cal;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.time.LocalDate;
import java.time.DayOfWeek;
import java.util.Set;

@WebServlet(name = "Servelet", urlPatterns = {"/show"})
public class Servelet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String month = request.getParameter("month");     // Ottengo i parametri dalla URL
        int year = 0;
        String errMsg = "";
        boolean error = false;

        HashMap<String, int[]> months = new HashMap<>();
        months.put("gennaio", new int[] {1, 31});
        months.put("febbraio", new int[] {2, 28});
        months.put("marzo", new int[] {3, 31});
        months.put("aprile", new int[] {4, 30});
        months.put("maggio", new int[] {5, 31});
        months.put("giugno", new int[] {6, 30});
        months.put("luglio", new int[] {7, 31});
        months.put("agosto", new int[] {8, 31});
        months.put("settembre", new int[] {9, 30});
        months.put("ottobre", new int[] {10, 31});
        months.put("novembre", new int[] {11, 30});
        months.put("dicembre", new int[] {12, 31});

        // effettuo un controllo sul mese e anno dati come parametri.
        if (!checkMonth(month, months.keySet())) {
            errMsg = "Error: The month is either missing or invalid!";
            request.setAttribute("errMsg", errMsg);
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        try {
            year = Integer.parseInt(request.getParameter("year"));
            if (year < 1 || year > 9999) {
                throw new Exception();
            }
        } catch (Exception e) {
            errMsg = "Error: The year is either missing or invalid (it must be greater than 0).";
            request.setAttribute("errMsg", errMsg);
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        
        if (isLeap(year)) {
            months.put("febbraio", new int[] {2, 29});
        }

        // Inizializzazione degli attributi da passare al .jsp
        int[] monthData = months.get(month);
        DayOfWeek firstDay = LocalDate.of(year, monthData[0], 1).getDayOfWeek();
        int dayNumber = firstDay.getValue();

        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.setAttribute("monthData", monthData);
        request.setAttribute("dayNumber", dayNumber);

        request.getRequestDispatcher("redirect.jsp").forward(request, response);
    }
    
    private boolean isLeap(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    private boolean checkMonth(String month, Set<String> months) {
        return months.contains(month);
    }
}
// :)
