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


        Residente r = new Residente();
        r.setIdResidente(idResidente);
        q.setResidente(r);

        Usuario a = new Usuario();
        a.setIdUsuario(idAdmin);
        q.setAdministrador(a);

        jpa.crearQueja(q);
    }
}
    