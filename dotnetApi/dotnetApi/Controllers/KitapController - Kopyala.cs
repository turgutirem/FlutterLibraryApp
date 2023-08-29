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
    public class KitapController : ControllerBase
    {
        private readonly AppDbContext _context;

        public KitapController(AppDbContext context)
        {
            _context = context;
        }

        

        // Kitaplar ve KitapYazar için CRUD işlemleri

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<Kitap>>> GetKitaplar()
        {
            return await _context.kitaplar.ToListAsync();
        }

        [HttpGet("GetKitap/{id}")]
        public async Task<ActionResult<Kitap>> GetKitap(int id)
        {
            var kitap = await _context.kitaplar.FindAsync(id);

            if (kitap == null)
            {
                return NotFound();
            }

            return kitap;
        }
        [HttpPost("AddOrEdit")]
        public async Task<IActionResult> AddOrEdit(Kitap kitap)
        {
            if (kitap.kitap_id == 0)
            {
                // Yeni kitap ekleme
                // Yazar adı kontrolü
                var existingYazar = await _context.yazarlar.FirstOrDefaultAsync(y => y.yazar_adi == kitap.yazar_adi);

                if (existingYazar == null)
                {
                    // Yazar daha önce eklenmemişse, yazarı ekleyin
                    var newYazar = new Yazar { yazar_adi = kitap.yazar_adi };
                    _context.yazarlar.Add(newYazar);
                    await _context.SaveChangesAsync();

                    // Yeni yazarın ID'sini alın
                    kitap.yazar_id = newYazar.yazar_id;
                }
                else
                {
                    // Yazar daha önce eklenmişse, yazar ID'sini alın
                    kitap.yazar_id = existingYazar.yazar_id;
                }

                // Kitapı ekleyin
                _context.kitaplar.Add(kitap);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetKitap", new { id = kitap.kitap_id }, kitap);
            }
            else
            {
                // Kitap güncelleme
                var existingKitap = await _context.kitaplar.FirstOrDefaultAsync(y => y.kitap_id == kitap.kitap_id);

                if (existingKitap != null)
                {
                    // Var olan kitap nesnesini güncelleyin
                    existingKitap.kitap_adi = kitap.kitap_adi;
                    existingKitap.isbn = kitap.isbn;
                    existingKitap.kitap_tanimi = kitap.kitap_tanimi;
                    existingKitap.kitap_tur = kitap.kitap_tur;
                    existingKitap.yazar_adi = kitap.yazar_adi;

                    await _context.SaveChangesAsync();
                }
                else
                {
                    return NotFound();
                }

                return Ok();
            }
        }


        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteKitap(int id)
        {
            var kitap = await _context.kitaplar.FindAsync(id);
            if (kitap == null)
            {
                return NotFound();
            }

            _context.kitaplar.Remove(kitap);
            await _context.SaveChangesAsync();

            return NoContent();
        }

       

    
    }
}
