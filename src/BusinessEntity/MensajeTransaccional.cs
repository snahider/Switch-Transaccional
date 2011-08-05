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
    
    public partial class MensajeTransaccional
    {
        public MensajeTransaccional()
        {
            this.PasoDinamica = new HashSet<PasoDinamica>();
            this.ReglaMensajeTransaccional = new HashSet<ReglaMensajeTransaccional>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int MensajeId { get; set; }
        public int CondicionMensajeId { get; set; }
    
        public virtual CondicionMensaje CondicionMensaje { get; set; }
        public virtual Mensaje Mensaje { get; set; }
        public virtual ICollection<PasoDinamica> PasoDinamica { get; set; }
        public virtual ICollection<ReglaMensajeTransaccional> ReglaMensajeTransaccional { get; set; }
    }
}
