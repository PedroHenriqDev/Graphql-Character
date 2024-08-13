using Character.Domain.Interface;

namespace Character.Domain.Entities.Abstract;

public abstract class ContentBase
{
    public Guid Id { get; set; }
    public Guid CharacterId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public DateTime DatePublication { get; set; }
}
