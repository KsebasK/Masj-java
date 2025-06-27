package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Apartamento;
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

        try {
            // Obtener datos del formulario
            String primerNombre = request.getParameter("primerNombre");
            String segundoNombre = request.getParameter("segundoNombre");
            String primerApellido = request.getParameter("primerApellido");
            String segundoApellido = request.getParameter("segundoApellido");
            String numeroCelular = request.getParameter("numeroCelular");
            String correo = request.getParameter("correoElectronico");
            String contrasena = request.getParameter("contrasena");
            String fechaNacimiento = request.getParameter("fechaNacimiento");
            String rol = request.getParameter("rol");
            String tipoDocumento = request.getParameter("tipoDocumento");
            int numDocumento = Integer.parseInt(request.getParameter("numDocumento"));
            
            // Datos del apartamento
            String torre = request.getParameter("torre");
            String numeroApto = request.getParameter("apartamento");

            // Crear nuevo usuario
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
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = formato.parse(fechaNacimiento);
            usu.setFechaNacimiento(fecha);

            // Configurar otros campos
            usu.setEstado(Usuario.Estado.activo);
            usu.setRol(Usuario.Rol.valueOf(rol));
            usu.setTipoDocumento(tipoDocumento);
            usu.setNumDocumento(numDocumento);
            
            // BUSCAR O CREAR EL APARTAMENTO
            Apartamento apartamentos = control.buscarOCrearApartamento(torre, numeroApto);
            usu.setApartamentos(apartamentos);

            // GUARDAR EL USUARIO EN LA BASE DE DATOS
            control.crearUsuario(usu);

            // Mensaje de éxito en la sesión
            HttpSession sesion = request.getSession();
            sesion.setAttribute("mensajeExito", "Usuario registrado exitosamente. Ahora puedes iniciar sesión.");

            // REDIRIGIR AL LOGIN
            response.sendRedirect("login.jsp");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Número de documento inválido");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar usuario: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar y listar usuarios con apartamentos";
    }
}