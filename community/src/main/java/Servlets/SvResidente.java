package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvResidente", urlPatterns = {"/SvResidente"})
public class SvResidente extends HttpServlet {

    private final String url = "jdbc:mysql://localhost:3306/masjcmy";
    private final String user = "root";
    private final String pass = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int idResidente = (int) session.getAttribute("idResidente");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            // Visitantes hoy
            PreparedStatement pstVisitantes = con.prepareStatement(
                    "SELECT COUNT(*) FROM visitante WHERE idResidente=? AND DATE(NOW())=CURDATE()");
            pstVisitantes.setInt(1, idResidente);
            ResultSet rsVisitantes = pstVisitantes.executeQuery();
            int totalVisitantes = 0;
            if (rsVisitantes.next()) {
                totalVisitantes = rsVisitantes.getInt(1);
            }

            // Paquetes recibidos sin reclamar (simulación)
            PreparedStatement pstPaquetes = con.prepareStatement(
                    "SELECT COUNT(*) FROM correspondencia WHERE idResidente=? AND Estado='Sin reclamar'");
            pstPaquetes.setInt(1, idResidente);
            ResultSet rsPaquetes = pstPaquetes.executeQuery();
            int paquetesPendientes = 0;
            if (rsPaquetes.next()) {
                paquetesPendientes = rsPaquetes.getInt(1);
            }

            // Zonas reservadas esta semana
            PreparedStatement pstReservas = con.prepareStatement(
                    "SELECT COUNT(*) FROM alquilerzonascomunes WHERE idResidente=? AND YEARWEEK(FechaAlquiler,1)=YEARWEEK(NOW(),1)");
            pstReservas.setInt(1, idResidente);
            ResultSet rsReservas = pstReservas.executeQuery();
            int reservasSemana = 0;
            if (rsReservas.next()) {
                reservasSemana = rsReservas.getInt(1);
            }

            // Pago actual cuota (simulación)
            PreparedStatement pstPago = con.prepareStatement(
                    "SELECT COALESCE(SUM(TotalPago),0) FROM alquilerzonascomunes WHERE idResidente=?");
            pstPago.setInt(1, idResidente);
            ResultSet rsPago = pstPago.executeQuery();
            int totalPago = 0;
            if (rsPago.next()) {
                totalPago = rsPago.getInt(1);
            }

            // Guardar en atributos
            request.setAttribute("totalVisitantes", totalVisitantes);
            request.setAttribute("paquetesPendientes", paquetesPendientes);
            request.setAttribute("reservasSemana", reservasSemana);
            request.setAttribute("totalPago", totalPago);

            request.getRequestDispatcher("dashboardResidente.jsp").forward(request, response);

            con.close();

        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }
}
