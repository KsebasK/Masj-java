package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Residente;

@WebServlet(name = "SvResidentesAdmin", urlPatterns = {"/SvResidentesAdmin"})
public class SvResidentesAdmin extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Residente> lista = control.traerResidentesConApartamentos();

        // Log de verificación
        System.out.println("Cantidad de residentes encontrados: " + lista.size());

        request.getSession().setAttribute("listaResidentes", lista);
        response.sendRedirect("mostrarResidentes.jsp");
    }
}
