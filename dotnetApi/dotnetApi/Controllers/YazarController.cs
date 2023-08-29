using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using dotnetApi.Models;

namespace dotnetApi.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class YazarController : ControllerBase
    {
        private readonly AppDbContext _context;

        public YazarController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("kitaplar/{yazarAd}")]
        public async Task<IActionResult> GetKitaplar(string yazarAd)
        {
            var yazar = await _context.yazarlar.FirstOrDefaultAsync(y => y.yazar_adi == yazarAd);

            if (yazar == null)
            {
                return NotFound("Yazar bulunamadı");
            }

            var kitaplar = await _context.kitaplar
                                        .Where(k => k.yazar_id == yazar.yazar_id)
                                        .ToListAsync();

            return Ok(kitaplar);
        }

        // Yazarlar için CRUD işlemleri

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<Yazar>>> GetYazarlar()
        {
            return await _context.yazarlar.ToListAsync();
        }

        [HttpGet("Get/{id}")]
        public async Task<ActionResult<Yazar>> GetYazar(int id)
        {
            var yazar = await _context.yazarlar.FindAsync(id);

            if (yazar == null)
            {
                return NotFound();
            }

            return yazar;
        }

        [HttpPost("Add")]
        public async Task<ActionResult<Yazar>> PostYazar(Yazar yazar)
        {
            _context.yazarlar.Add(yazar);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetYazar", new { id = yazar.yazar_id }, yazar);
        }


        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteYazar(int id)
        {
            var yazar = await _context.yazarlar.FindAsync(id);
            if (yazar == null)
            {
                return NotFound();
            }

            _context.yazarlar.Remove(yazar);
            await _context.SaveChangesAsync();

            return NoContent();
        }




    }
}
