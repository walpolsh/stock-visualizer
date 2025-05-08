<?php

namespace App\Infrastructure\Doctrine\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class StockEntity
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\Column(type: 'string', length: 10)]
    private string $ticker = '';

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private float $price = 0;

    public function __construct(string $ticker, float $price)
    {
        $this->ticker = $ticker;
        $this->price = $price;
    }
    public function getId(): ?int
    {
        return $this->id;
    }
    public function getTicker(): string
    {
        return $this->ticker;
    }
    public function getPrice(): float
    {
        return $this->price;
    }
    public function setId(int $id): void
    {
        $this->id = $id;
    }
    public function setTicker(string $ticker): void
    {
        $this->ticker = $ticker;
    }
    public function setPrice(float $price): void
    {
        $this->price = $price;
    }
}
