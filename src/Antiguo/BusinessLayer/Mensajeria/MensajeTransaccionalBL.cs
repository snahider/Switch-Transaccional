﻿using System.Collections.Generic;
using System.ComponentModel;
using BusinessEntity;

namespace BusinessLayer.Mensajeria
{
    using System;
    using System.Data;
    using System.Data.Common;
    using System.Data.Objects;

    using DataAccess.Mensajeria;

    [DataObject(true)]
    public sealed class MensajeTransaccionalBL
    {
        public static List<MENSAJE_TRANSACCIONAL> obtenerMensajeTransaccional()
        {
            using (Switch contexto = new Switch())
            {
                contexto.MENSAJE_TRANSACCIONAL.MergeOption = MergeOption.NoTracking;
                return contexto.MENSAJE_TRANSACCIONAL.ToList<MENSAJE_TRANSACCIONAL>();
            }
        }

        public static MENSAJE_TRANSACCIONAL obtenerMensajeTransaccional(int codigoMensajeTransaccional)
        {
            using (Switch contexto = new Switch())
            {
                contexto.MENSAJE_TRANSACCIONAL.MergeOption = MergeOption.NoTracking;
                return contexto.MENSAJE_TRANSACCIONAL.Include("MENSAJE").Include("MENSAJE.GRUPO_MENSAJE")
                    .Where(o => o.MTR_CODIGO == codigoMensajeTransaccional).FirstOrDefault<MENSAJE_TRANSACCIONAL>();
            }
        }

        public static List<MENSAJE_TRANSACCIONAL> obtenerMensajeTransaccionalPorMensaje(int codigoMensaje)
        {
            using (Switch contexto = new Switch())
            {
                contexto.MENSAJE_TRANSACCIONAL.MergeOption = MergeOption.NoTracking;
                return contexto.MENSAJE_TRANSACCIONAL.Include("CONDICION_MENSAJE")
                    .Where(o => o.MENSAJE.MEN_CODIGO == codigoMensaje).ToList<MENSAJE_TRANSACCIONAL>();
            }
        }

        public static MENSAJE_TRANSACCIONAL obtenerMensajeTransaccionalSinMensaje(int codigoMensajeTransaccional)
        {
            using (Switch contexto = new Switch())
            {
                contexto.MENSAJE_TRANSACCIONAL.MergeOption = MergeOption.NoTracking;
                return contexto.MENSAJE_TRANSACCIONAL
                    .Where(o => o.MTR_CODIGO == codigoMensajeTransaccional).FirstOrDefault<MENSAJE_TRANSACCIONAL>();
            }
        }

        public static EstadoOperacion insertarMensajeTransaccional(MENSAJE_TRANSACCIONAL MensajeTransaccional)
        {
            try
            {
                using (Switch contexto = new Switch())
                {
                    using (contexto.CreateConeccionScope())
                    {
                        MensajeTransaccional.MTR_CODIGO = (from c in contexto.MENSAJE_TRANSACCIONAL
                                                                                    orderby c.MTR_CODIGO descending
                                                                                    select c.MTR_CODIGO).FirstOrDefault() + 1;

                        string query =
                            "INSERT INTO MENSAJE_TRANSACCIONAL"+
                            "(MTR_CODIGO"+
                            ",MTR_NOMBRE"+
                            ",MEN_CODIGO"+
                            ",CNM_CODIGO)"+
                            "VALUES"+
                            "(@codigo"+
                            ",@nombre"+
                            ",@mensaje_codigo"+
                            ",@condicionmensaje_codigo)";

                        DbCommand Comando = MensajeTransaccionalDA.crearComando(contexto, MensajeTransaccional, query);

                        if (Comando.ExecuteNonQuery() != 1)
                        {
                            return new EstadoOperacion(false, null, null);
                        }

                        return new EstadoOperacion(true, null, null);
                    }
                }
            }
            catch (Exception e)
            {

                return new EstadoOperacion(false, e.Message, e);
            }
        }

        public static EstadoOperacion modificarMensajeTransaccional(MENSAJE_TRANSACCIONAL MensajeTransaccional)
        {
            try
            {
                using (Switch contexto = new Switch())
                {
                    using (contexto.CreateConeccionScope())
                    {
                        string query =
                            "UPDATE MENSAJE_TRANSACCIONAL" +
                            " SET MTR_NOMBRE = @nombre" +
                            ",CNM_CODIGO = @condicionmensaje_codigo" +
                            " WHERE MTR_CODIGO = @codigo";
                        
                        DbCommand Comando = MensajeTransaccionalDA.crearComando(contexto, MensajeTransaccional, query);

                        if (Comando.ExecuteNonQuery() != 1)
                        {
                            return new EstadoOperacion(false, null, null);
                        }

                        return new EstadoOperacion(true, null, null);
                    }
                }
            }
            catch (Exception e)
            {

                return new EstadoOperacion(false, e.Message, e);
            }
        }

        public static EstadoOperacion eliminarMensajeTransaccional(MENSAJE_TRANSACCIONAL MensajeTransaccional)
        {
            DbFactory Factoria = DataAccessFactory.ObtenerProveedor();
            try
            {
                using (Switch contexto = new Switch())
                {
                    using (contexto.CreateConeccionScope())
                    {
                        string query =
                            "DELETE FROM MENSAJE_TRANSACCIONAL" +
                            " WHERE MTR_CODIGO = @codigo";

                        DbCommand Comando = contexto.CreateCommand(query, CommandType.Text);
                        Comando.Parameters.Add(Factoria.CrearParametro("@codigo", MensajeTransaccional.MTR_CODIGO));

                        if (Comando.ExecuteNonQuery() != 1)
                        {
                            return new EstadoOperacion(false, null, null);
                        }

                        return new EstadoOperacion(true, null, null);
                    }
                }
            }
            catch (Exception e)
            {

                return new EstadoOperacion(false, e.Message, e);
            }
        }
    }
}
