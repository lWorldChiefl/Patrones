using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BusinessLayer;

namespace Proyecto_Final.Models
{
    public class ImagenCompleta
    {
        public Proyecto Producto { get; set; }
        public Imagen Imagen { get; set;}
    }
}