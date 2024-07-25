<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
    {
        // Donné d'exemple pour créer un utilisateur admin
        // $user = new User();
        // $user->setUsername('louispigons')->setEmail('louispigons@gmail.com')->setFullName('Louis Pigons')->setPassword($hasher->hashPassword($user, 'password'))->setRoles(['ROLE_ADMIN']);
        // $em->persist($user);
        // $em->flush();
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
