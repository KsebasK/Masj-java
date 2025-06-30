package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "alquilerzonascomunes")
public class AlquilerZonasComunesEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idAlquilerZonaComun")
    private Integer idAlquilerZonaComun;

    @Temporal(TemporalType.DATE)
    @Column(name = "FechaAlquiler", nullable = false)
    private Date fechaAlquiler;

    @Column(name = "CantidadPersonas", nullable = true)
    private Integer cantidadPersonas;

    @Column(name = "TotalPago", nullable = true)
    private Integer totalPago;

    @Column(name = "HoraLimite", nullable = false)
    private String horaLimite;

    @Column(name = "Estado", nullable = false)
    private String estado; // como "pendiente", "aprobada"

    @ManyToOne
    @JoinColumn(name = "idZonaComun", nullable = false)
    private ZonaComun zonaComun;

    @ManyToOne
    @JoinColumn(name = "idResidente", nullable = false)
    private Residente residente;

    public AlquilerZonasComunesEntity() {}

    // Getters y setters
    public Integer getIdAlquilerZonaComun() {
        return idAlquilerZonaComun;
    }

    public Date getFechaAlquiler() {
        return fechaAlquiler;
    }

    public void setFechaAlquiler(Date fechaAlquiler) {
        this.fechaAlquiler = fechaAlquiler;
    }

    public Integer getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(Integer cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public Integer getTotalPago() {
        return totalPago;
    }

    public void setTotalPago(Integer totalPago) {
        this.totalPago = totalPago;
    }

    public String getHoraLimite() {
        return horaLimite;
    }

    public void setHoraLimite(String horaLimite) {
        this.horaLimite = horaLimite;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public ZonaComun getZonaComun() {
        return zonaComun;
    }

    public void setZonaComun(ZonaComun zonaComun) {
        this.zonaComun = zonaComun;
    }

    public Residente getResidente() {
        return residente;
    }

    public void setResidente(Residente residente) {
        this.residente = residente;
    }
}
