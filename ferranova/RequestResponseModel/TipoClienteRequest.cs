﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RequestResponseModel
{
    public class TipoClienteRequest
    {
        public decimal IdTipoCliente { get; set; }
        [StringLength(50)]
        public string? NombreTipo { get; set; }
    }
}
