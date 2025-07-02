package logica;

import java.io.Serializable;
import javax.persistence.*;
import logica.AlquilerZonasComunesEntity;


@Entity
@Table(name = "zonacomun")
public class ZonaComun implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idZonaComun")
    private int idZonaComun;

    @Column(name = "TipoZona", nullable = false)
    private String tipoZona;

    @Column(name = "EstadoZona", nullable = false)
    private String estadoZona; // "Disponible" o "Ocupada"

    public ZonaComun() {}

    public int getIdZonaComun() {
        return idZonaComun;
    }

    public void setIdZonaComun(int idZonaComun) {
        this.idZonaComun = idZonaComun;
    }

    public String getTipoZona() {
        return tipoZona;
    }

    public void setTipoZona(String tipoZona) {
        this.tipoZona = tipoZona;
    }

    public String getEstadoZona() {
        return estadoZona;
    }

    public void setEstadoZona(String estadoZona) {
        this.estadoZona = estadoZona;
    }
}
