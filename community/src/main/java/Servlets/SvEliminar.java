package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvEliminar", urlPatterns = {"/SvEliminar"})
public class SvEliminar extends HttpServlet {

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String idParam = request.getParameter("idUsuario");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            Controladora control = new Controladora();
            control.borrarUsuario(id);

            // Actualizar lista y redirigir
            List<Usuario> listaUsuarios = control.traerUsuarios();
            request.getSession().setAttribute("listaUsuarios", listaUsuarios);
            response.sendRedirect("mostrarUsuarios.jsp");

        } catch (NumberFormatException e) {
            response.getWriter().println("⚠️ ID inválido. No es un número.");
        }
    } else {
        response.getWriter().println("⚠️ Debes ingresar un ID válido.");
    }
}
}
