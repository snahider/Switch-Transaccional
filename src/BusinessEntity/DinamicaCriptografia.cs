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
    
    public partial class DinamicaCriptografia
    {
        public DinamicaCriptografia()
        {
            this.CriptografiaCampo = new HashSet<CriptografiaCampo>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int Tipo { get; set; }
        public int MensajeId { get; set; }
    
        public virtual ICollection<CriptografiaCampo> CriptografiaCampo { get; set; }
        public virtual Mensaje Mensaje { get; set; }
    }
}