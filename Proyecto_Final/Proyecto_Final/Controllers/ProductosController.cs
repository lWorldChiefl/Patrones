﻿using BusinessLayer;
using DataLayer;
using Proyecto_Final.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Proyecto_Final.Controllers
{
    public class ProductosController : Controller
    {
        private Proyecto_VerocoEntities db = new Proyecto_VerocoEntities();
        ProductosRepository proRe = new ProductosRepository();

        // GET: Productos
        public ActionResult Productos()
        {
            var productosDatos = proRe.Listar;
            return View(productosDatos);
        }

        public ActionResult Crear()
        {
            ViewBag.tipo_Categoria = new SelectList(db.Categorias, "categoryId", "categoryName", 1);
            return View();
        }

        [HttpPost]
        public ActionResult Crear(ImagenCompleta ImagenCompleta)
        {
            var validImageTypes = new string[]
            {
                "image/gif",
                "image/jpeg",
                "image/pjpeg",
                "image/png",
                "image/jpg"
            };

            if (ImagenCompleta.Imagen.ImageUpload != null && ImagenCompleta.Imagen.ImageUpload.ContentLength > 0)
            {
                var fileName = Path.GetFileName(ImagenCompleta.Imagen.ImageUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                ImagenCompleta.Imagen.ImageUpload.SaveAs(path);
                ImagenCompleta.Producto.proyectImage = "~/Content/image/" + fileName;
            }

            ViewBag.tipo_Categoria = new SelectList(db.Categorias, "categoryId", "categoryName", ImagenCompleta.Producto.categoryId);
            db.Proyectos.Add(ImagenCompleta.Producto);
            db.SaveChanges();
            return RedirectToAction("Productos");
        }

        public ActionResult Editar(int? id)
        {
            ViewBag.tipo_Categoria = new SelectList(db.Categorias, "categoryId", "categoryName", 1);
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyecto producto = db.Proyectos.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            return View(producto);
        }

        [HttpPost]
        public ActionResult Editar(Proyecto producto)
        {
            if (ModelState.IsValid)
            {
                proRe.Actualizar(producto);
                return RedirectToAction("Productos");
            }
            return View();
        }

        public ActionResult Eliminar(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyecto producto = db.Proyectos.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            return View(producto);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult Eliminar(int id)
        {
            Proyecto producto = db.Proyectos.Find(id);
            proRe.Eliminar(producto);
            return RedirectToAction("Productos");
        }
    }
}