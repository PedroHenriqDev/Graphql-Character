using Character.Domain.Enums;
using Character.Domain.Interface;

namespace Character.Domain.Entities;

public class BookGenre : IContentGenre<BookGenreEnum>
{
    public Guid ContentId { get; set; }
    public Content<BookGenreEnum> Content { get; set ; }
    public BookGenreEnum Genre { get; set; }
}
