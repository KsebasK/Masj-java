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

        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        Usuario usu = control.validarLogin(correo, contrasena);

        if (usu != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usu);

            String rol = usu.getRol().toLowerCase();

            switch (rol) {
                case "administrador":
                    response.sendRedirect("admin.jsp");
                    break;
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
                    request.setAttribute("error", "Rol desconocido.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}