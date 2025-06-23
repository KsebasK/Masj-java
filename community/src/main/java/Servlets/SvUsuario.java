package Servlets;

import java.io.IOException;
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

        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String primerApellido = request.getParameter("primerApellido");
        String segundoApellido = request.getParameter("segundoApellido");
        String numeroCelular = request.getParameter("numeroCelular");
        String correo = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");
        String conjunto = request.getParameter("conjuntoNombre");
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
        usu.setContrasena(contrasena);
        usu.setConjuntoNombre(conjunto);
        usu.setEstado(estado);
        usu.setRol(rol);
        usu.setTipoDocumento(tipoDocumento);
        usu.setNumDocumento(numDocumento);

        // Conversión de fecha
        try {
            java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date fecha = formato.parse(fechaNacimiento);
            usu.setFechaNacimiento(fecha);
        } catch (Exception e) {
            e.printStackTrace();
        }

        control.crearUsuario(usu);
        response.sendRedirect("SvUsuario");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar y listar usuarios";
    }
}
