﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace BDFerranova;

[Table("venta")]
public partial class Ventum
{
    [Key]
    [Column("idVenta")]
    public int IdVenta { get; set; }

    [Column("idUsuario")]
    public int IdUsuario { get; set; }

    [Column("idCliente")]
    public int IdCliente { get; set; }

    [Column("fechaVenta")]
    [Precision(6)]
    public DateTime? FechaVenta { get; set; }

    [Column("igv", TypeName = "decimal(3, 2)")]
    public decimal? Igv { get; set; }

    [Column("subtotal", TypeName = "money")]
    public decimal? Subtotal { get; set; }

    [Column("costoVenta", TypeName = "money")]
    public decimal? CostoVenta { get; set; }

    [Column("idTipoComprobante")]
    public int IdTipoComprobante { get; set; }

    [Column("idMetodopago")]
    public int IdMetodopago { get; set; }

    [InverseProperty("IdVentaNavigation")]
    public virtual ICollection<DetalleVentum> DetalleVenta { get; set; } = new List<DetalleVentum>();

    [ForeignKey("IdCliente")]
    [InverseProperty("Venta")]
    public virtual Cliente IdClienteNavigation { get; set; } = null!;

    [ForeignKey("IdMetodopago")]
    [InverseProperty("Venta")]
    public virtual MetodoPago IdMetodopagoNavigation { get; set; } = null!;

    [ForeignKey("IdTipoComprobante")]
    [InverseProperty("Venta")]
    public virtual TipoComprobante IdTipoComprobanteNavigation { get; set; } = null!;

    [ForeignKey("IdUsuario")]
    [InverseProperty("Venta")]
    public virtual UsuarioAcceso IdUsuarioNavigation { get; set; } = null!;
}
