//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusinessEntity
{
    using System;
    using System.Collections.Generic;
    
    public partial class TipoComunicacion
    {
        public TipoComunicacion()
        {
            this.Protocolo = new HashSet<Protocolo>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
    
        public virtual ICollection<Protocolo> Protocolo { get; set; }
    }
}