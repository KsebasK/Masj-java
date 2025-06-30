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

        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        // Encriptar la contraseña ingresada
        String passEncriptada = Controladora.encriptarSHA256(contrasena);

        // Validar usuario en base de datos
        Usuario usu = control.validarLogin(correo, passEncriptada);

        if (usu != null) {
            String rol = usu.getRol().toString().toLowerCase();

            if (rol.equals("inactivo")) {
                request.setAttribute("error", "Tu cuenta ha sido desactivada.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usu);

            switch (rol) {
                case "administrador":
                    response.sendRedirect("admin.jsp");
                    break;
                case "guardia":
                    response.sendRedirect("guardia.jsp");
                    break;
                case "arrendatario":
                case "propietario": // por compatibilidad si llega alguno con ese texto
                    response.sendRedirect("residente.jsp");
                    break;
                default:
                    request.setAttribute("error", "Rol desconocido.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
            }

        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
