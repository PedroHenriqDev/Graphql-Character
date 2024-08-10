using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class Book : IMediaItem<BookGenre>
{
    public Guid Id { get; set; }
    public Guid CharacterId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public required ICollection<BookGenre> Genres { get; set; } = [];
    public DateTime DatePublication { get; set; }
}
