package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.AlquilerZonasComunesService;

@WebServlet("/SvReservarZona")
public class SvReservarZona extends HttpServlet {

    private AlquilerZonasComunesService service = new AlquilerZonasComunesService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Leer y validar todos los parámetros esperados
            int idResidente = Integer.parseInt(req.getParameter("idResidente"));
            int idZona = Integer.parseInt(req.getParameter("idZonaComun"));
            int personas = Integer.parseInt(req.getParameter("cantidadPersonas"));
            double totalPago = Double.parseDouble(req.getParameter("totalPago"));
            String hora = req.getParameter("hora");

            // Validar campos de fecha
            Date fecha;
            try {
                fecha = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("fecha"));
            } catch (Exception e) {
                throw new IllegalArgumentException("Fecha inválida");
            }

            if (hora == null || hora.trim().isEmpty()) {
                throw new IllegalArgumentException("Hora inválida");
            }

            // Llamar al servicio
            service.crearReserva(idResidente, idZona, fecha, hora, personas, totalPago);

            // Redirigir al servlet que lista reservas
            resp.sendRedirect("SvReservasResidente?idResidente=" + idResidente);

        } catch (Exception e) {
            e.printStackTrace(); // Para depurar en consola
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Datos inválidos o incompletos en el formulario");
        }
    }
}
