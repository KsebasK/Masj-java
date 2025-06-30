package Servlets;

import logica.Controladora;
import logica.Usuario;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "SvExportarExcel", urlPatterns = {"/SvExportarExcel"})
public class SvExportarExcel extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> usuarios = control.traerUsuarios();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Usuarios");

        String[] headers = {
            "ID", "Primer Nombre", "Segundo Nombre", "Primer Apellido", "Segundo Apellido",
            "Correo", "Celular", "Tipo Documento", "N° Documento",
            "Fecha Nacimiento", "Rol", "Torre", "Apartamento"
        };

        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            CellStyle style = workbook.createCellStyle();
            Font font = workbook.createFont();
            font.setBold(true);
            style.setFont(font);
            cell.setCellStyle(style);
        }

        // Llenar filas
        int rowNum = 1;
        for (Usuario u : usuarios) {
            Row row = sheet.createRow(rowNum++);

            row.createCell(0).setCellValue(u.getIdUsuario());
            row.createCell(1).setCellValue(u.getPrimerNombre());
            row.createCell(2).setCellValue(u.getSegundoNombre() != null ? u.getSegundoNombre() : "");
            row.createCell(3).setCellValue(u.getPrimerApellido());
            row.createCell(4).setCellValue(u.getSegundoApellido() != null ? u.getSegundoApellido() : "");
            row.createCell(5).setCellValue(u.getCorreoElectronico());
            row.createCell(6).setCellValue(u.getNumeroCelular());
            row.createCell(7).setCellValue(u.getTipoDocumento());
            row.createCell(8).setCellValue(u.getNumDocumento());
            row.createCell(9).setCellValue(u.getFechaNacimiento().toString());
            row.createCell(10).setCellValue(u.getRol().toString());
            row.createCell(11).setCellValue(u.getTorre() != null ? u.getTorre() : "");
            row.createCell(12).setCellValue(u.getNumeroApartamento() != null ? u.getNumeroApartamento() : "");
        }

        // Autoajustar columnas
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }

        // Configurar respuesta HTTP
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=usuarios.xlsx");

        OutputStream out = response.getOutputStream();
        workbook.write(out);
        out.flush();
        workbook.close();
    }

    @Override
    public String getServletInfo() {
        return "Servlet que exporta los usuarios a un archivo Excel";
    }
}
