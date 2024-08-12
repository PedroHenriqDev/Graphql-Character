using Character.Domain.Entities;

namespace Character.Domain.Interface;

public interface IContentGenre<TGenreEnum> where TGenreEnum : Enum
{
    Guid ContentId { get; set; }
    Content<TGenreEnum> Content { get; set; }
    TGenreEnum Genre {  get; set; }
}
