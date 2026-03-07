using Microsoft.AspNetCore.Mvc;
using ApiGenericaCsharp.Modelos;
using ApiGenericaCsharp.Servicios;

namespace ApiGenericaCsharp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AliadoController : ControllerBase
    {
        private readonly AliadoServicio _servicio;

        public AliadoController(AliadoServicio servicio)
        {
            _servicio = servicio;
        }

        [HttpGet]
        public async Task<IActionResult> ObtenerTodos()
        {
            var aliados = await _servicio.ObtenerTodos();
            return Ok(aliados);
        }

        [HttpGet("{nit}")]
        public async Task<IActionResult> ObtenerPorNit(long nit)
        {
            var aliado = await _servicio.ObtenerPorNit(nit);

            if (aliado == null)
                return NotFound();

            return Ok(aliado);
        }

        [HttpPost]
        public async Task<IActionResult> Crear(Aliado aliado)
        {
            await _servicio.Crear(aliado);
            return Ok();
        }

        [HttpPut]
        public async Task<IActionResult> Actualizar(Aliado aliado)
        {
            await _servicio.Actualizar(aliado);
            return Ok();
        }

        [HttpDelete("{nit}")]
        public async Task<IActionResult> Eliminar(long nit)
        {
            await _servicio.Eliminar(nit);
            return Ok();
        }
    }
}