package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Apartamento;
import logica.Usuario.Estado;
import logica.Usuario.Rol;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-06-30T02:30:47")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> numeroCelular;
    public static volatile SingularAttribute<Usuario, Integer> numDocumento;
    public static volatile SingularAttribute<Usuario, String> segundoNombre;
    public static volatile SingularAttribute<Usuario, Estado> estado;
    public static volatile SingularAttribute<Usuario, String> primerNombre;
    public static volatile SingularAttribute<Usuario, String> primerApellido;
    public static volatile SingularAttribute<Usuario, Date> fechaNacimiento;
    public static volatile SingularAttribute<Usuario, Integer> idUsuario;
    public static volatile SingularAttribute<Usuario, String> segundoApellido;
    public static volatile SingularAttribute<Usuario, Rol> rol;
    public static volatile SingularAttribute<Usuario, String> tipoDocumento;
    public static volatile SingularAttribute<Usuario, String> contrasena;
    public static volatile SingularAttribute<Usuario, Apartamento> apartamentos;
    public static volatile SingularAttribute<Usuario, String> correoElectronico;

}