﻿using BDFerranova;
using RequestResponseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IRepository
{
    public interface IMenuRolRepository : ICRUDRepository<MenuRol>
    {
        IQueryable<MenuRolResponse> Consultar();
    }
}
