using Microsoft.EntityFrameworkCore;
using TechnicalTest.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TechnicalTest
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CarBuyer>()
                .HasKey(x => new { x.Id });

            modelBuilder.Entity<CarBuyer>()
                .HasOne(cb => cb.Buyer)
                .WithMany(b => b.CarBuyers)
                .HasForeignKey(cb => cb.BuyerId);

            modelBuilder.Entity<CarBuyer>()
                .HasOne(cb => cb.Car)
                .WithMany(c => c.CarBuyers)
                .HasForeignKey(cb => cb.CarId);

            modelBuilder.Entity<CarBuyerStateHistory>()
                .HasKey(x => new { x.CarBuyerId, x.StateId });

            modelBuilder.Entity<CarBuyerStateHistory>()
                .HasOne(cbs => cbs.CarBuyer)
                .WithMany(cb => cb.CarBuyerStates)
                .HasForeignKey(cbs => cbs.CarBuyerId);

            modelBuilder.Entity<CarBuyerStateHistory>()
                .HasOne(cbs => cbs.State)
                .WithMany()
                .HasForeignKey(cbs => cbs.StateId);

            modelBuilder.Entity<CarBuyerStateHistory>()
                .Property(p => p.CreatedAt)
                .HasColumnType("datetime");

            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Buyer> Buyers { get; set; }
        public DbSet<Car> Cars { get; set; }
        public DbSet<CarBuyer> CarsBuyers { get; set; }
        public DbSet<State> States { get; set; }
        public DbSet<CarBuyerStateHistory> CarBuyerStateHistory { get; set; }


    }
}
