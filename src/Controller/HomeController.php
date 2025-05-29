<?php

namespace App\Controller;

use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/scan', name: 'scan')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }

    #[Route('/scan/{token}', name: 'scan_token')]
    public function scan(string $token, EntityManagerInterface $em): Response
    {
        $participant = $em->getRepository(Participants::class)->findOneBy(['qrCode' => $token]);

        if (!$participant) {
            return $this->render('home/index.html.twig', [
                'token' => "pas de participant trouvé pour le token : $token",
            ]);
        }

        return $this->render('home/scan_show.html.twig', [
            'participant' => $participant,
        ]);
    }


     #[Route('/tableau', name: 'tableau')]
    public function tab(): Response
    {
        return $this->render('home/tab.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
