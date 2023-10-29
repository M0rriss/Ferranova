﻿using BDFerranova;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RequestResponseModel
{
    public class TipoComprobanteResponse
    {
        public int IdTipoComprobante { get; set; }

        [StringLength(50)]
        public string? NombreTipoComprobante { get; set; }

    }
}
