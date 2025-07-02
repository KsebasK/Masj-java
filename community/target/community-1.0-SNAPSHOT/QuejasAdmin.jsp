<%@page import="logica.QuejasAdmin"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%
    // Verifica si el usuario ha iniciado sesión
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=session_expired");
        return;
    }

    List<QuejasAdmin> quejas = (List<QuejasAdmin>) request.getAttribute("quejas");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Quejas - MASJ</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>
<%@include file="common/sidebar.jsp" %>
<%@include file="common/header.jsp" %>

<div class="main-content">
    <div class="content">
        <h1>Lista de Quejas Recibidas</h1>

        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Motivo</th>
                        <th>Fecha</th>
                        <th>Estado</th>
                        <th>Residente</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (quejas != null && !quejas.isEmpty()) {
                        for (QuejasAdmin q : quejas) {
                %>
                    <tr>
                        <td>#<%= q.getIdQueja() %></td>
                        <td><%= q.getMotivoQueja() != null ? q.getMotivoQueja() : "" %></td>
                        <td><%= q.getFechaQueja() != null ? new java.text.SimpleDateFormat("dd/MM/yyyy").format(q.getFechaQueja()) : "" %></td>
                        <td><%= q.getEstadoQueja() != null ? q.getEstadoQueja() : "SIN ESTADO" %></td>
                        <td><%= q.getIdResidente() %></td>
                        <td>
                            <button class="btn btn-primary" onclick="abrirModal(<%= q.getIdQueja() %>)">Responder</button>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center">No hay quejas registradas.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal para responder -->
<div id="modalRespuesta" class="modal" style="display:none;">
    <div class="modal-content">
        <h3>¿Cómo quieres marcar esta queja?</h3>
        <form id="formRespuesta" method="POST" action="SvResponderQueja">
            <input type="hidden" name="idQueja" id="inputIdQueja" />
            <button type="submit" name="estado" value="RESUELTO" class="btn btn-success">✅ Resuelto</button>
            <button type="submit" name="estado" value="PENDIENTE" class="btn btn-danger">❌ No Resuelto</button>
        </form>
        <br>
        <button onclick="cerrarModal()" class="btn btn-secondary">Cancelar</button>
    </div>
</div>

<!-- Estilos para el modal -->
<style>
.modal {
    position: fixed; top: 0; left: 0; width: 100%; height: 100%;
    background: rgba(0,0,0,0.5); display: flex; justify-content: center; align-items: center;
}
.modal-content {
    background: white; padding: 20px; border-radius: 8px; text-align: center;
    width: 300px;
}
</style>

<!-- Script para controlar el modal -->
<script>
function abrirModal(idQueja) {
    document.getElementById("inputIdQueja").value = idQueja;
    document.getElementById("modalRespuesta").style.display = "flex";
}
function cerrarModal() {
    document.getElementById("modalRespuesta").style.display = "none";
}
</script>

<%@include file="common/footer.jsp" %>
</body>
</html>
