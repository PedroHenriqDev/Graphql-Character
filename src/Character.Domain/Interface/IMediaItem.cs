namespace Character.Domain.Interface;

public interface IMediaItem<TGenre> where TGenre : Enum
{
    Guid Id { get; set; }
    Guid CharacterId { get; set; }
    string Name { get; set; }
    string Description { get; set; }
    ICollection<TGenre> Genres { get; set; }
    DateTime DatePublication { get; set; }
}
