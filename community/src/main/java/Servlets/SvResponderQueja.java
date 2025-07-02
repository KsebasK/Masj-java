package Servlets;

import persistencias.QuejasAdminJpaController;
import logica.QuejasAdmin;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SvResponderQueja")
public class SvResponderQueja extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idQueja"));
        String nuevoEstado = request.getParameter("estado");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
        QuejasAdminJpaController controlador = new QuejasAdminJpaController(emf);
        
        try {
            QuejasAdmin queja = controlador.findQuejasAdmin(id);
            queja.setEstadoQueja(nuevoEstado);
            controlador.edit(queja);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("SvQuejasAdmin");
    }
}
