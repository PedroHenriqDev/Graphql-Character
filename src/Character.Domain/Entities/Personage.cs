using Character.Domain.Enums;

namespace Character.Domain.Entities;

public class Personage
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description {  get; set; } = string.Empty;
    public double Height { get; set; }
    public double Weight { get; set; }
    public PersonageType Type { get; set; }
    public required ICollection<Feature>? Features { get; set; } = [];
    public ICollection<Content<MovieGenreEnum>>? Movies { get; set; }
    public ICollection<Content<SerieGenreEnum>>? Series { get; set; }
    public ICollection<Content<GameGenreEnum>>? Games { get; set; }
    public ICollection<Content<BookGenreEnum>>? Books { get; set; }
}
