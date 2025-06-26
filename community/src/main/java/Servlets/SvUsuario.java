package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> listaUsuarios = control.traerUsuarios();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaUsuarios", listaUsuarios);

        response.sendRedirect("mostrarUsuarios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obtener datos del formulario
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String primerApellido = request.getParameter("primerApellido");
        String segundoApellido = request.getParameter("segundoApellido");
        String numeroCelular = request.getParameter("numeroCelular");
        String correo = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String estado = request.getParameter("estado");
        String rol = request.getParameter("rol");
        String tipoDocumento = request.getParameter("tipoDocumento");
        int numDocumento = Integer.parseInt(request.getParameter("numDocumento"));

        Usuario usu = new Usuario();

        usu.setPrimerNombre(primerNombre);
        usu.setSegundoNombre(segundoNombre);
        usu.setPrimerApellido(primerApellido);
        usu.setSegundoApellido(segundoApellido);
        usu.setNumeroCelular(numeroCelular);
        usu.setCorreoElectronico(correo);

        // Encriptar la contraseña
        String passEncriptada = Controladora.encriptarSHA256(contrasena);
        usu.setContrasena(passEncriptada);

        // Convertir y setear la fecha de nacimiento
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = formato.parse(fechaNacimiento);
            usu.setFechaNacimiento(fecha);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Formato de fecha incorrecto");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        usu.setEstado(Usuario.Estado.valueOf(estado));
        usu.setRol(Usuario.Rol.valueOf(rol));
        usu.setTipoDocumento(tipoDocumento);
        usu.setNumDocumento(numDocumento);

        // Guardar en base de datos
        control.crearUsuario(usu);

        // Redirigir al listar
        response.sendRedirect("SvUsuario");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar y listar usuarios";
    }
}
