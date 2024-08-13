using Character.Domain.Entities;
using Character.Domain.Entities.Abstract;
using Character.Domain.Enums;
using Microsoft.EntityFrameworkCore;

namespace Character.Infrastructure.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<ContentBase> Contents { get; set; }
    public DbSet<Personage> Personages { get; set; }
    public DbSet<Feature> Features { get; set; }
    public DbSet<GameGenre> GameGenres { get; set; }
    public DbSet<MovieGenre> MovieGenres { get; set; }
    public DbSet<SerieGenre> SerieGenres { get; set; }
    public DbSet<BookGenre> BooksGenre { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ContentBase>()
            .ToTable("Contents").HasDiscriminator<string>("ContentType")
            .HasValue<Content<MovieGenreEnum>>("Movie")
            .HasValue<Content<BookGenreEnum>>("Book")
            .HasValue<Content<SerieGenreEnum>>("Serie")
            .HasValue<Content<GameGenreEnum>>("Game");

        ContentRelationHasMany<MovieGenreEnum>(modelBuilder);

        ContentRelationHasMany<BookGenreEnum>(modelBuilder);

        ContentRelationHasMany<SerieGenreEnum>(modelBuilder);

        ContentRelationHasMany<GameGenreEnum>(modelBuilder);
     
        base.OnModelCreating(modelBuilder);
    }

    private static void ContentRelationHasMany<TContentGenreEnum>(ModelBuilder modelBuilder)
        where TContentGenreEnum : Enum
    {
        modelBuilder.Entity<Content<TContentGenreEnum>>()
         .HasMany(c => c.ContentGenres)
         .WithOne()
         .HasForeignKey("ContentId")
         .OnDelete(DeleteBehavior.Cascade);
    }
}
