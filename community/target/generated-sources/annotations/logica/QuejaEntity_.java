package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Residente;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T21:52:54")
@StaticMetamodel(QuejaEntity.class)
public class QuejaEntity_ { 

    public static volatile SingularAttribute<QuejaEntity, Integer> idQueja;
    public static volatile SingularAttribute<QuejaEntity, Usuario> administrador;
    public static volatile SingularAttribute<QuejaEntity, String> motivoQueja;
    public static volatile SingularAttribute<QuejaEntity, String> estadoQueja;
    public static volatile SingularAttribute<QuejaEntity, Date> fechaQueja;
    public static volatile SingularAttribute<QuejaEntity, Residente> residente;

}