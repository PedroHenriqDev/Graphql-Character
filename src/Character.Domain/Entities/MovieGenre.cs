using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class MovieGenre : IContentGenre<MovieGenreEnum>
{
    public Guid ContentId { get; set; }
    public Content<MovieGenreEnum> Content { get; set; }
    public MovieGenreEnum Genre { get; set; }
}
