package logica;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "quejas")
public class QuejasAdmin implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idQueja")
    private int idQueja;

    @Column(name = "FechaQueja")
    @Temporal(TemporalType.DATE)
    private Date fechaQueja;

    @Column(name = "MotivoQueja")
    private String motivoQueja;

    @Column(name = "idResidente")
    private int idResidente;

    @Column(name = "EstadoQueja")
    private String estadoQueja;

    @Column(name = "idAdministrador")
    private int idAdministrador;

    // Getters y setters

    public int getIdQueja() {
        return idQueja;
    }

    public void setIdQueja(int idQueja) {
        this.idQueja = idQueja;
    }

    public Date getFechaQueja() {
        return fechaQueja;
    }

    public void setFechaQueja(Date fechaQueja) {
        this.fechaQueja = fechaQueja;
    }

    public String getMotivoQueja() {
        return motivoQueja;
    }

    public void setMotivoQueja(String motivoQueja) {
        this.motivoQueja = motivoQueja;
    }

    public int getIdResidente() {
        return idResidente;
    }

    public void setIdResidente(int idResidente) {
        this.idResidente = idResidente;
    }

    public String getEstadoQueja() {
        return estadoQueja;
    }

    public void setEstadoQueja(String estadoQueja) {
        this.estadoQueja = estadoQueja;
    }

    public int getIdAdministrador() {
        return idAdministrador;
    }

    public void setIdAdministrador(int idAdministrador) {
        this.idAdministrador = idAdministrador;
    }
}
