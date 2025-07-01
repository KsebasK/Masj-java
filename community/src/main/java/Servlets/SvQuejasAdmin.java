package Servlets;

import logica.QuejasAdmin;
import persistencias.QuejasAdminJpaController;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.persistence.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SvQuejasAdmin")
public class SvQuejasAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("🔍 [SvQuejasAdmin] Iniciando...");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
        QuejasAdminJpaController controlador = new QuejasAdminJpaController(emf);

        List<QuejasAdmin> lista = controlador.findQuejasAdminEntities();
        System.out.println("📄 Cantidad de quejas encontradas: " + lista.size());

        for (QuejasAdmin q : lista) {
            System.out.println("➡️ Queja ID: " + q.getIdQueja() + " - Motivo: " + q.getMotivoQueja());
        }

        request.setAttribute("quejas", lista);
        request.getRequestDispatcher("QuejasAdmin.jsp").forward(request, response);
}

}
