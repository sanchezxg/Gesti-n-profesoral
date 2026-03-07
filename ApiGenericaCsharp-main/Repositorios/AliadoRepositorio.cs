using Dapper;
using ApiGenericaCsharp.Modelos;
using System.Data;
using Microsoft.Data.SqlClient;

namespace ApiGenericaCsharp.Repositorios.Abstracciones
{
    public class AliadoRepositorio : IAliadoRepositorio
    {
        private readonly IConfiguration _configuration;

        public AliadoRepositorio(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        private IDbConnection Conexion()
        {
            return new SqlConnection(_configuration.GetConnectionString("SqlServer"));
        }

        public async Task<IEnumerable<Aliado>> ObtenerTodos()
        {
            using var db = Conexion();

            string sql = @"SELECT 
                            nit AS Nit,
                            razon_social AS Razon_Social,
                            nombre_contacto AS Nombre_Contacto,
                            correo AS Correo,
                            telefono AS Telefono,
                            ciudad AS Ciudad
                           FROM aliado";

            return await db.QueryAsync<Aliado>(sql);
        }

        public async Task<Aliado> ObtenerPorNit(long nit)
        {
            using var db = Conexion();

            string sql = @"SELECT 
                            nit AS Nit,
                            razon_social AS Razon_Social,
                            nombre_contacto AS Nombre_Contacto,
                            correo AS Correo,
                            telefono AS Telefono,
                            ciudad AS Ciudad
                           FROM aliado
                           WHERE nit = @nit";

#pragma warning disable CS8603 // Possible null reference return.
            return await db.QueryFirstOrDefaultAsync<Aliado>(sql, new { nit });
#pragma warning restore CS8603 // Possible null reference return.
        }

        public async Task Crear(Aliado aliado)
        {
            using var db = Conexion();

            string sql = @"INSERT INTO aliado
                          (nit, razon_social, nombre_contacto, correo, telefono, ciudad)
                          VALUES
                          (@Nit, @Razon_Social, @Nombre_Contacto, @Correo, @Telefono, @Ciudad)";

            await db.ExecuteAsync(sql, aliado);
        }

        public async Task Actualizar(Aliado aliado)
        {
            using var db = Conexion();

            string sql = @"UPDATE aliado SET
                          razon_social = @Razon_Social,
                          nombre_contacto = @Nombre_Contacto,
                          correo = @Correo,
                          telefono = @Telefono,
                          ciudad = @Ciudad
                          WHERE nit = @Nit";

            await db.ExecuteAsync(sql, aliado);
        }

        public async Task Eliminar(long nit)
        {
            using var db = Conexion();

            string sql = "DELETE FROM aliado WHERE nit = @nit";

            await db.ExecuteAsync(sql, new { nit });
        }
    }
}