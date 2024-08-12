using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class SerieGenre : IContentGenre<SerieGenreEnum>
{
    public Guid ContentId { get; set; }
    public Content<SerieGenreEnum> Content { get; set; }
    public SerieGenreEnum Genre { get; set; }
}
