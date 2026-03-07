using ApiGenericaCsharp.Modelos;

namespace ApiGenericaCsharp.Repositorios.Abstracciones
{
    public interface IAliadoRepositorio
    {
        Task<IEnumerable<Aliado>> ObtenerTodos();
        Task<Aliado> ObtenerPorNit(long nit);
        Task Crear(Aliado aliado);
        Task Actualizar(Aliado aliado);
        Task Eliminar(long nit);
    }
}