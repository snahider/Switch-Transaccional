﻿namespace Web.Services.Mensajeria
{
    using BusinessEntity;

    using System;
    using System.Linq;
    using System.Data.Entity;

    using Web.Services.Bases;

    public class MensajeService:Service<Mensaje>
    {
        public 

        public override Mensaje Obtener(int id)
        {
            return context.Mensaje.Include(x => x.GrupoMensaje).Where(o => o.Id == id).SingleOrDefault();
        }

        //public  List<Mensaje> obtenerMensajePorCodigoGrupoMensaje(int codigoGrupoMensaje)
        //{
        //    using (Switch context = new Switch())
        //    {
        //        context.Mensaje.MergeOption = MergeOption.NoTracking;
        //        var listaMensajes = from m in context.Mensaje
        //                            where m.GRUPO_Mensaje.GMJ_CODIGO == codigoGrupoMensaje
        //                            orderby m.MEN_NOMBRE ascending
        //                            select m;

        //        return listaMensajes.ToList<Mensaje>();
        //    }
        //}

        //public  List<Mensaje> obtenerMensajePorCodigoGrupoMensajeTodosEnCasoContrario(string codigoGrupoMensaje)
        //{
        //    DbFactory Factoria = DataAccessFactory.ObtenerProveedor();

        //    using (Switch context = new Switch())
        //    {
        //        context.Mensaje.MergeOption = MergeOption.NoTracking;
        //        DbCommand Comando = context.CreateCommand(
        //            "Select MEN_CODIGO,MEN_NOMBRE from Mensaje where GMJ_CODIGO like @codigoGrupo", CommandType.Text);

        //        Comando.Parameters.Add(Factoria.CrearParametro("@codigoGrupo", codigoGrupoMensaje));

        //        List<Mensaje> listaMensaje = Comando.Materialize<Mensaje>().OrderBy(o => o.MEN_NOMBRE).ToList<Mensaje>();

        //        return listaMensaje;
        //    }
        //}

        public override void Eliminar(int id)
        {
            Mensaje mensaje = dataAccess.Get(id);
            if (mensaje.Campos.Count > 0)
                throw new Exception("El Mensaje tiene Campos y no se puede eliminar");
            dataAccess.Remove(mensaje);
        }
    }
}
