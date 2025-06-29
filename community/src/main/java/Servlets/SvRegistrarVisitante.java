package Servlets;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.Controladora;
import logica.Apartamento;
import logica.Usuario;
import logica.Visitante;

@WebServlet(name = "SvRegistrarVisitante", urlPatterns = {"/SvRegistrarVisitante"})
public class SvRegistrarVisitante extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obtener datos del formulario
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String tipoDoc = request.getParameter("tipoDoc");
        int numDoc = Integer.parseInt(request.getParameter("numDoc"));
        String torre = request.getParameter("torre");
        String numeroApto = request.getParameter("numeroApto");
        int idGuardia = Integer.parseInt(request.getParameter("idGuardia"));

        // Buscar el apartamento por torre y apto
        Apartamento apto = control.obtenerApartamentoPorTorreYApto(torre, numeroApto);

        if (apto == null) {
            request.setAttribute("error", "El apartamento " + torre + " - " + numeroApto + " no existe.");
            request.getRequestDispatcher("registrarVisitante.jsp").forward(request, response);
            return;
        }

        // Validar que el guardia exista
        Usuario guardia = control.traerUsuario(idGuardia);
        if (guardia == null || !"guardia".equalsIgnoreCase(guardia.getRol().name())) {
            request.setAttribute("error", "El ID de guardia es inválido.");
            request.getRequestDispatcher("registrarVisitante.jsp").forward(request, response);
            return;
        }

        // Crear el visitante
        Visitante visitante = new Visitante();
        visitante.setNombresVisitante(nombres);
        visitante.setApellidosVisitante(apellidos);
        visitante.setTipoDocumento(tipoDoc);
        visitante.setNumDocumento(numDoc);
        visitante.setIdGuardia(idGuardia);
        visitante.setIdApartamento(apto.getIdApartamento());
        visitante.setHoraEntrada(new Date());

        // Registrar visitante
        control.registrarVisitante(visitante);

        // Enviar mensaje de éxito
        request.setAttribute("exito", "¡Visitante registrado con éxito!");
        request.getRequestDispatcher("registrarVisitante.jsp").forward(request, response);
    }
}


