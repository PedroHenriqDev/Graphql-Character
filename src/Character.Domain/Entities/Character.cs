using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class Character
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description {  get; set; } = string.Empty;
    public double Height { get; set; }
    public double Weight { get; set; }
    public CharacterType Type { get; set; }
    public required ICollection<Feature>? Features { get; set; } = [];
    public required ICollection<Movie> Movies { get; set; } = [];
    public required ICollection<Serie> Series { get; set; } = [];
    public required ICollection<Game> Games { get; set; } = [];
    public required ICollection<Book> Books { get; set; } = [];

}
