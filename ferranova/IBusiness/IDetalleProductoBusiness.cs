﻿using BDFerranova;
using RequestResponseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBusiness
{
    public interface IDetalleProductoBusiness : ICRUDBusiness<DetalleProductoRequest, DetalleProductoResponse>
    {
        DetalleProductoResponse BuscarDetalle(string nameDetalle);
    }
}
