<?php
// filepath: /Users/paulwalsh/WebDev/stock_visualizer/src/Infrastructure/Persistence/UserRepository.php

namespace App\Infrastructure\Persistence;

use App\Domain\Model\User;
use Doctrine\ORM\EntityManagerInterface;

class UserRepository
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function save(User $user): void
    {
        $this->entityManager->persist($user);
        $this->entityManager->flush();
    }

    public function findByUsername(string $username): ?User
    {
        return $this->entityManager->getRepository(User::class)->findOneBy(['username' => $username]);
    }
}
