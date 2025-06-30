package logica;

import java.util.List;
import persistencias.AlquilerZonasComunesJpaController;

public class AlquilerZonasComunes {

    private AlquilerZonasComunesJpaController zonasJpa = new AlquilerZonasComunesJpaController();

    public List<logica.AlquilerZonasComunes> obtenerReservasPorResidente(int idResidente) {
        return zonasJpa.traerReservasPorResidente(idResidente);
    }

    public AlquilerZonasComunes() {
        // Constructor vacío necesario para Apache
    }
}
