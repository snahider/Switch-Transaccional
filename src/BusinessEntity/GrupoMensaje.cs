
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>


namespace BusinessEntity
{
    using System.Collections.Generic;

    public class GrupoMensaje : Entity
    {
        public GrupoMensaje()
        {
            this.CampoPlantilla = new HashSet<CampoPlantilla>();
            this.Mensaje = new HashSet<Mensaje>();
        }

        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int TipoMensajeId { get; set; }

        public virtual ICollection<CampoPlantilla> CampoPlantilla { get; set; }
        public virtual TipoMensaje TipoMensaje { get; set; }
        public virtual ICollection<Mensaje> Mensaje { get; set; }
    }
}
