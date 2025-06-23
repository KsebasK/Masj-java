package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Usuario")
public class Usuario implements Serializable{

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE)
    @Column(name = "idUsuario")
    private int idUsuario;

    @Column(name = "PrimerNombre", nullable = false)
    private String primerNombre;

    @Column(name = "SegundoNombre")
    private String segundoNombre;

    @Column(name = "PrimerApellido", nullable = false)
    private String primerApellido;

    @Column(name = "SegundoApellido")
    private String segundoApellido;

    @Column(name = "NumeroCelular", nullable = false)
    private String numeroCelular;

    @Column(name = "CorreoElectronico", nullable = false)
    private String correoElectronico;

    @Column(name = "Contrasena", nullable = false)
    private String contrasena;

    @Column(name = "ConjuntoNombre", nullable = false)
    private String conjuntoNombre;

    @Column(name = "FechaNacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;

    @Column(name = "Estado", nullable = false)
    private String estado;

    @Column(name = "Rol", nullable = false)
    private String rol;

    @Column(name = "TipoDocumento", nullable = false)
    private String tipoDocumento;

    @Column(name = "NumDocumento", nullable = false)
    private int numDocumento;

    // Constructor vacío (obligatorio para JPA)
    public Usuario() {}

    // Constructor con todos los campos
    public Usuario(int idUsuario, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido,
                   String numeroCelular, String correoElectronico, String contrasena, String conjuntoNombre,
                   Date fechaNacimiento, String estado, String rol, String tipoDocumento, int numDocumento) {
        this.idUsuario = idUsuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.numeroCelular = numeroCelular;
        this.correoElectronico = correoElectronico;
        this.contrasena = contrasena;
        this.conjuntoNombre = conjuntoNombre;
        this.fechaNacimiento = fechaNacimiento;
        this.estado = estado;
        this.rol = rol;
        this.tipoDocumento = tipoDocumento;
        this.numDocumento = numDocumento;
    }

    // Getters y Setters

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getNumeroCelular() {
        return numeroCelular;
    }

    public void setNumeroCelular(String numeroCelular) {
        this.numeroCelular = numeroCelular;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getConjuntoNombre() {
        return conjuntoNombre;
    }

    public void setConjuntoNombre(String conjuntoNombre) {
        this.conjuntoNombre = conjuntoNombre;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public int getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(int numDocumento) {
        this.numDocumento = numDocumento;
    }
}
