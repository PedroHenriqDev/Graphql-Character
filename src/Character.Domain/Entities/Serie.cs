using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class Serie : IMediaItem<SerieGenre>
{
    public Guid Id { get; set; }
    public Guid CharacterId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public required ICollection<SerieGenre> Genres { get; set; } = [];
    public DateTime DatePublication { get; set; }
}
