package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Column(name = "FechaNacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;

    @Enumerated(EnumType.STRING)
    @Column(name = "Estado", nullable = false)
    private Estado estado;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol", nullable = false)
    private Rol rol;

    @Column(name = "TipoDocumento", nullable = false)
    private String tipoDocumento;

    @Column(name = "NumDocumento", nullable = false)
    private int numDocumento;
    
    

    public enum Rol {
        propietario, arrendatario, guardia, administrador;

       @Override
        public String toString() {
         return name().toLowerCase();
    }

    }

    public enum Estado {
        activo, inactivo
    }

    public Usuario() {}

    public Usuario(int idUsuario, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido,
                   String numeroCelular, String correoElectronico, String contrasena,
                   Date fechaNacimiento, Estado estado, Rol rol,
                   String tipoDocumento, int numDocumento) {
        this.idUsuario = idUsuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.numeroCelular = numeroCelular;
        this.correoElectronico = correoElectronico;
        this.contrasena = contrasena;
        this.fechaNacimiento = fechaNacimiento;
        this.estado = estado;
        this.rol = rol;
        this.tipoDocumento = tipoDocumento;
        this.numDocumento = numDocumento;
    }

    // Getters y setters

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

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
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
