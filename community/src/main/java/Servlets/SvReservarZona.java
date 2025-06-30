package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.AlquilerZonasComunesService;

@WebServlet("/SvReservarZona")
public class SvReservarZona extends HttpServlet {

    private AlquilerZonasComunesService service = new AlquilerZonasComunesService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idResidente = Integer.parseInt(req.getParameter("idResidente"));
        int idZona = Integer.parseInt(req.getParameter("idZonaComun"));
        int personas = Integer.parseInt(req.getParameter("cantidadPersonas"));
        int pago = 0; // calcula según tu lógica
        java.util.Date fecha;
        try {
            fecha = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("fecha"));
        } catch (Exception e) { fecha = new java.util.Date(); }
        String hora = req.getParameter("hora");

        service.crearReserva(idResidente, idZona, fecha, hora, personas, pago);
        resp.sendRedirect("SvReservasResidente?idResidente=" + idResidente);
    }
}
