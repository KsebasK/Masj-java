package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.QuejaService;

@WebServlet("/SvEnviarQueja")
public class SvEnviarQueja extends HttpServlet {

    private QuejaService service = new QuejaService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String motivo = req.getParameter("motivoQueja");
            int idResidente = Integer.parseInt(req.getParameter("idResidente"));
            int idAdministrador = Integer.parseInt(req.getParameter("idAdministrador"));

            if (motivo == null || motivo.trim().isEmpty()) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Motivo vacío");
                return;
            }

            service.registrarQueja(motivo, idResidente, idAdministrador);
            resp.sendRedirect("Residente.jsp");

        } catch (NumberFormatException | NullPointerException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros inválidos");
        }
    }
}
