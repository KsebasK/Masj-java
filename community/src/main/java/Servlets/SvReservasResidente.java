package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.AlquilerZonasComunesEntity;
import logica.AlquilerZonasComunesService;
//ESTE SERVLETS ES PARA LA CONSULTA DE LA RESERVA
@WebServlet(name = "SvReservasResidente", urlPatterns = {"/SvReservasResidente"})
public class SvReservasResidente extends HttpServlet {

    private AlquilerZonasComunesService service = new AlquilerZonasComunesService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idResidente = Integer.parseInt(request.getParameter("idResidente"));
        List<AlquilerZonasComunesEntity> reservas = service.obtenerReservas(idResidente);
        request.setAttribute("reservas", reservas);
        request.getRequestDispatcher("ReservasResidente.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
