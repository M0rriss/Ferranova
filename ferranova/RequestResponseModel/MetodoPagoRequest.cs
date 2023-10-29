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
    public class MetodoPagoRequest
    {
        public int IdMetodopago { get; set; }
        [StringLength(50)]
        public string? NombreMetodoPago { get; set; }
    }
}
