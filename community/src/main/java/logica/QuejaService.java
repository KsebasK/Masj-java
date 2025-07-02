package logica;

import java.util.Date;
import persistencias.QuejaJpaController;

public class QuejaService {

    private QuejaJpaController jpa = new QuejaJpaController();

    public void registrarQueja(String motivo, int idResidente, int idAdmin) {
        QuejaEntity q = new QuejaEntity();
        q.setFechaQueja(new Date());
        q.setMotivoQueja(motivo);
        q.setEstadoQueja("Sin responder");

        // Buscar las entidades completas desde la base de datos
        Residente r = jpa.obtenerResidentePorId(idResidente);
        Usuario a = jpa.obtenerAdministradorPorId(idAdmin);

        q.setResidente(r);
        q.setAdministrador(a);

        jpa.crearQueja(q);
    }
}
