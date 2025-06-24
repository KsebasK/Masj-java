package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String correo = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");

        Usuario usuarioEncontrado = control.validarUsuario(correo, contrasena);

        if (usuarioEncontrado != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", usuarioEncontrado);

            String rol = usuarioEncontrado.getRol().toLowerCase();

            switch (rol) {
                case "administrador":
                    response.sendRedirect("admin.jsp");
                    break;
                case "residente":
                case "propietario":
                    response.sendRedirect("residente.jsp");
                    break;
                case "guardia":
                    response.sendRedirect("guardia.jsp");
                    break;
                case "arrendatario":
                    response.sendRedirect("arrendatario.jsp");
                    break;
                default:
                    // Rol desconocido
                    response.sendRedirect("login.jsp?error=rol");
                    break;
            }
        } else {
            // Usuario no encontrado o datos incorrectos
            response.sendRedirect("login.jsp?error=datos");
        }
    }
}
