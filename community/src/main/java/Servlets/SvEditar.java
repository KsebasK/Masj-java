package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
public class SvEditar extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idEditar = Integer.parseInt(request.getParameter("idUsuarioEdit"));

        Usuario usu = control.traerUsuario(idEditar); // Corregido método correcto

        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuEditar", usu);

        response.sendRedirect("editar.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obtener parámetros del formulario
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String primerApellido = request.getParameter("primerApellido");
        String segundoApellido = request.getParameter("segundoApellido");
        String numeroCelular = request.getParameter("numeroCelular");
        String correo = request.getParameter("correoElectronico");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String estado = request.getParameter("estado");
        String rol = request.getParameter("rol");
        String tipoDocumento = request.getParameter("tipoDocumento");
        int numDocumento = Integer.parseInt(request.getParameter("numDocumento"));

        // Buscar el usuario original
        Usuario usu = control.traerUsuario(idUsuario);

        // Setear nuevos valores
        usu.setPrimerNombre(primerNombre);
        usu.setSegundoNombre(segundoNombre);
        usu.setPrimerApellido(primerApellido);
        usu.setSegundoApellido(segundoApellido);
        usu.setNumeroCelular(numeroCelular);
        usu.setCorreoElectronico(correo);
        usu.setEstado(Usuario.Estado.valueOf(estado));
        usu.setRol(Usuario.Rol.valueOf(rol));
        usu.setTipoDocumento(tipoDocumento);
        usu.setNumDocumento(numDocumento);

        try {
            java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date fecha = formato.parse(fechaNacimiento);
            usu.setFechaNacimiento(fecha);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Editar en base de datos
        control.editarUsuario(usu);

        // Redirigir con lista actualizada
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaUsuarios", control.traerUsuarios());
        response.sendRedirect("mostrarUsuarios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para editar usuario";
    }
}
