using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class GameGenre : IContentGenre<GameGenreEnum>
{
    public Guid ContentId { get; set; }
    public Content<GameGenreEnum> Content { get; set; }
    public GameGenreEnum Genre { get; set; }
}
