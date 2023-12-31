﻿using BDFerranova;
using IRepository;
using RequestResponseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class ClienteRepository : CRUDRepository<Cliente>, IClienteRepository
    {
        public GenericFilterResponse<Cliente> GetByFilter(GenericFilterRequest request)
        {
            throw new NotImplementedException();
        }

        public List<Cliente> InsertMultiple(List<Cliente> clientes)
        {
            throw new NotImplementedException();
        }

        public Vcliente ObtenerVistaCliente(string nombre)
        {
            Vcliente VCliente = db.Vclientes.Where(x => x.Nombre.ToLower() == nombre.ToLower()).FirstOrDefault();
            return VCliente;

        }
    }
}
