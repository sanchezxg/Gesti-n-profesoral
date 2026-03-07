using ApiGenericaCsharp.Modelos;
using ApiGenericaCsharp.Repositorios.Abstracciones;

namespace ApiGenericaCsharp.Servicios
{
    public class AliadoServicio
    {
        private readonly IAliadoRepositorio _repo;

        public AliadoServicio(IAliadoRepositorio repo)
        {
            _repo = repo;
        }

        public Task<IEnumerable<Aliado>> ObtenerTodos()
        {
            return _repo.ObtenerTodos();
        }

        public Task<Aliado> ObtenerPorNit(long nit)
        {
            return _repo.ObtenerPorNit(nit);
        }

        public Task Crear(Aliado aliado)
        {
            return _repo.Crear(aliado);
        }

        public Task Actualizar(Aliado aliado)
        {
            return _repo.Actualizar(aliado);
        }

        public Task Eliminar(long nit)
        {
            return _repo.Eliminar(nit);
        }
    }
}