using Character.Domain.Enums;

namespace Character.Domain.Entities;

public class Feature
{
    public Guid Id { get; set; }
    public Guid CharacterId { get; set; }
    public string Name { get; set; } = string.Empty;
    public Level Level { get; set; }
}
