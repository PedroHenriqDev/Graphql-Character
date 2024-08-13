using Character.Domain.Entities.Abstract;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class Content<TGenreEnum> : ContentBase
    where TGenreEnum : Enum 
{
    public required ICollection<IContentGenre<TGenreEnum>> ContentGenres { get; set; } = [];
}
