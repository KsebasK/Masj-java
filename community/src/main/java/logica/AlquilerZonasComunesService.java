package logica;

import java.util.Date;
import java.util.List;
import persistencias.AlquilerZonasComunesJpaController;
import logica.AlquilerZonasComunesEntity;



public class AlquilerZonasComunesService {
    

    private AlquilerZonasComunesJpaController jpa = new AlquilerZonasComunesJpaController();

    public List<AlquilerZonasComunesEntity> obtenerReservas(int idResidente) {
        return jpa.traerReservasPorResidente(idResidente);
    }

    public void crearReserva(int idResidente, int idZona, Date fecha, String hora, int personas, int pago) {
        AlquilerZonasComunesEntity r = new AlquilerZonasComunesEntity();
        ZonaComun z = new ZonaComun();
        z.setIdZonaComun(idZona);
        Residente res = new Residente();
        res.setIdResidente(idResidente);

        r.setZonaComun(z);
        r.setResidente(res);
        r.setFechaAlquiler(fecha);
        r.setHoraLimite(hora);
        r.setCantidadPersonas(personas);
        r.setTotalPago(pago);
        r.setEstado("pendiente");

        jpa.create(r);
    }
}
