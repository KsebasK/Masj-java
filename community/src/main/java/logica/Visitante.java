/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "visitante")
public class Visitante implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVisitante;

    @Column(name = "NombresVisitante")
    private String nombresVisitante;

    @Column(name = "ApellidosVisitante")
    private String apellidosVisitante;

    @Column(name = "TipoDocumento")
    private String tipoDocumento;

    @Column(name = "NumDocumento")
    private int numDocumento;

    @Column(name = "idResidente")
    private int idResidente;

    @Column(name = "idGuardia")
    private int idGuardia;

    @Column(name = "idApartamento")
    private int idApartamento;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "hora_entrada")
    private Date horaEntrada;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "hora_salida")
    private Date horaSalida;

    // Getters y Setters

    public int getIdVisitante() { return idVisitante; }
    public void setIdVisitante(int idVisitante) { this.idVisitante = idVisitante; }

    public String getNombresVisitante() { return nombresVisitante; }
    public void setNombresVisitante(String nombresVisitante) { this.nombresVisitante = nombresVisitante; }

    public String getApellidosVisitante() { return apellidosVisitante; }
    public void setApellidosVisitante(String apellidosVisitante) { this.apellidosVisitante = apellidosVisitante; }

    public String getTipoDocumento() { return tipoDocumento; }
    public void setTipoDocumento(String tipoDocumento) { this.tipoDocumento = tipoDocumento; }

    public int getNumDocumento() { return numDocumento; }
    public void setNumDocumento(int numDocumento) { this.numDocumento = numDocumento; }

    public int getIdResidente() { return idResidente; }
    public void setIdResidente(int idResidente) { this.idResidente = idResidente; }

    public int getIdGuardia() { return idGuardia; }
    public void setIdGuardia(int idGuardia) { this.idGuardia = idGuardia; }

    public int getIdApartamento() { return idApartamento; }
    public void setIdApartamento(int idApartamento) { this.idApartamento = idApartamento; }

    public Date getHoraEntrada() { return horaEntrada; }
    public void setHoraEntrada(Date horaEntrada) { this.horaEntrada = horaEntrada; }

    public Date getHoraSalida() { return horaSalida; }
    public void setHoraSalida(Date horaSalida) { this.horaSalida = horaSalida; }
}
