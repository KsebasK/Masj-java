package logica;

import java.util.List;
import persistencias.AlquilerZonasComunesJpaController;

public class AlquilerZonasComunes {

    private AlquilerZonasComunesJpaController zonasJpa = new AlquilerZonasComunesJpaController();

    // Cambiado para devolver lista de entidades
    public List<AlquilerZonasComunesEntity> obtenerReservasPorResidente(int idResidente) {
        return zonasJpa.traerReservasPorResidente(idResidente);
    }

    // Cambiado para recibir la entidad directamente
    public void crearReserva(AlquilerZonasComunesEntity reserva) {
        zonasJpa.create(reserva);
    }

    public AlquilerZonasComunes() {
        // Constructor vacío
    }
}
