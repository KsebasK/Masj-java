package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1. Obtener parámetros del formulario
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String primerApellido = request.getParameter("primerApellido");
        String segundoApellido = request.getParameter("segundoApellido");
        String celular = request.getParameter("numeroCelular");
        String correo = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");

        String fechaStr = request.getParameter("fechaNacimiento");
        String rolStr = request.getParameter("rol");
        String tipoDoc = request.getParameter("tipoDocumento");

        // Validar número de documento
        String numDocStr = request.getParameter("numDocumento");
        if (numDocStr == null || numDocStr.isEmpty()) {
            request.setAttribute("error", "El número de documento es obligatorio.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        int numDoc = 0;
        try {
            numDoc = Integer.parseInt(numDocStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "El número de documento debe ser numérico.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // Validar apartamento si es residente
        int idApartamento = 0;
        if ("propietario".equalsIgnoreCase(rolStr) || "arrendatario".equalsIgnoreCase(rolStr)) {
            String torre = request.getParameter("torre");
            String apartamento = request.getParameter("apartamento");

            if (torre == null || torre.isEmpty() || apartamento == null || apartamento.isEmpty()) {
                request.setAttribute("error", "Debe ingresar torre y apartamento.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            idApartamento = control.buscarIdApartamentoPorTorreYApto(torre, apartamento);
            if (idApartamento == 0) {
                request.setAttribute("error", "Apartamento no encontrado.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
        }

        // 2. Convertir enums
        Usuario.Estado estado = Usuario.Estado.activo; // Estado fijo al registrarse
        Usuario.Rol rol;
        try {
            rol = Usuario.Rol.valueOf(rolStr.toLowerCase());
        } catch (IllegalArgumentException | NullPointerException e) {
            request.setAttribute("error", "Rol inválido.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // 3. Convertir fecha
        Date fechaNacimiento = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fechaNacimiento = formato.parse(fechaStr);
        } catch (Exception e) {
            request.setAttribute("error", "Formato de fecha inválido.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // 4. Crear objeto Usuario
        Usuario usu = new Usuario();
        usu.setPrimerNombre(primerNombre);
        usu.setSegundoNombre(segundoNombre);
        usu.setPrimerApellido(primerApellido);
        usu.setSegundoApellido(segundoApellido);
        usu.setNumeroCelular(celular);
        usu.setCorreoElectronico(correo);
        usu.setContrasena(Controladora.encriptarSHA256(contrasena));
        usu.setFechaNacimiento(fechaNacimiento);
        usu.setEstado(estado);
        usu.setRol(rol);
        usu.setTipoDocumento(tipoDoc);
        usu.setNumDocumento(numDoc);

        // 5. Guardar usuario
        try {
            if (rol == Usuario.Rol.propietario || rol == Usuario.Rol.arrendatario) {
                control.crearUsuarioConResidente(usu, idApartamento);
            } else {
                control.crearUsuario(usu);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al guardar el usuario: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // 6. Redirigir al inicio tras éxito
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("listaUsuarios", control.traerUsuarios());
        response.sendRedirect("mostrarUsuarios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet que registra usuarios, incluyendo residentes si aplica.";
    }
}
