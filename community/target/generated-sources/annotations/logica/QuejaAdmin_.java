package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Residente;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-06-29T20:26:09")
@StaticMetamodel(QuejaAdmin.class)
public class QuejaAdmin_ { 

    public static volatile SingularAttribute<QuejaAdmin, Integer> idQueja;
    public static volatile SingularAttribute<QuejaAdmin, Usuario> administrador;
    public static volatile SingularAttribute<QuejaAdmin, String> motivoQueja;
    public static volatile SingularAttribute<QuejaAdmin, String> estadoQueja;
    public static volatile SingularAttribute<QuejaAdmin, Date> fechaQueja;
    public static volatile SingularAttribute<QuejaAdmin, Residente> residente;

}