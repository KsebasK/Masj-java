package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.AlquilerZonasComunes;

@WebServlet(name = "SvReservasResidente", urlPatterns = {"/SvReservasResidente"})
public class SvReservasResidente extends HttpServlet {

    private AlquilerZonasComunes zonasLogic = new AlquilerZonasComunes();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idResidente = Integer.parseInt(request.getParameter("idResidente"));

        List<logica.AlquilerZonasComunes> reservas = zonasLogic.obtenerReservasPorResidente(idResidente);

        request.setAttribute("reservas", reservas);
       request.getRequestDispatcher("ReservasResidente.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
