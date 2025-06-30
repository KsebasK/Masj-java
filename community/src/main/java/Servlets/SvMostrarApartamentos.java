/*package Servlets;

import logica.Controladora;
import logica.Apartamento;
import logica.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "SvMostrarApartamentos", urlPatterns = {"/SvMostrarApartamentos"})
public class SvMostrarApartamentos extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Apartamento> listaApartamentos = control.traerApartamentos();

        // Creamos un mapa para asociar apartamentos con sus arrendatarios
        Map<Apartamento, Usuario> mapa = new LinkedHashMap<>();
        for (Apartamento apto : listaApartamentos) {
         //   Usuario arrendatario = control.obtenerArrendatarioPorApartamento(apto);
            mapa.put(apto, arrendatario);
        }

        request.setAttribute("mapaApartamentos", mapa);
        request.getRequestDispatcher("mostrarApartamentos.jsp").forward(request, response);
    }
}
*/