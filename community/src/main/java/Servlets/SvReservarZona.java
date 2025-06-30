package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.AlquilerZonasComunesService;

// ESTE SERVLET ES PARA SOLICITAR UNA RESERVA O HACERLA
@WebServlet("/SvReservarZona")
public class SvReservarZona extends HttpServlet {

    private AlquilerZonasComunesService service = new AlquilerZonasComunesService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int idResidente = Integer.parseInt(req.getParameter("idResidente"));
            int idZona = Integer.parseInt(req.getParameter("idZonaComun"));
            int personas = Integer.parseInt(req.getParameter("cantidadPersonas"));
            java.util.Date fecha;
            try {
                fecha = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("fecha"));
            } catch (Exception e) {
                fecha = new java.util.Date();
            }
            String hora = req.getParameter("hora");

            // Enviar reserva sin campo totalPago
            service.crearReserva(idResidente, idZona, fecha, hora, personas);

            resp.sendRedirect("SvReservasResidente?idResidente=" + idResidente);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Datos inválidos o incompletos en el formulario");
        }
    }
}
