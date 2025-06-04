<?php

namespace App\Controller;

use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
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

#[Route('/api/scan/{token}', name: 'api_scan_token')]
public function apiScan(string $token, EntityManagerInterface $em): JsonResponse
{
    $participant = $em->getRepository(Participants::class)->findOneBy(['qrCode' => $token]);

    if (!$participant) {
        return $this->json([
            'status' => 'unknown',
            'message' => "Aucun participant trouvé pour ce QR code.",
        ]);
    }

    if ($participant->isStatut() === true) {
        return $this->json([
            'status' => 'already_used',
            'message' => "Ce QR code a déjà été scanné.",
            'nom' => $participant->getNom(),
            'prenom' => $participant->getPrenom(),
            'classe' => $participant->getClasse(),
        ]);
    }

    // Marquer le participant comme validé
    $participant->setStatut(true);
    $em->flush();

    return $this->json([
        'status' => 'valid',
        'message' => "QR code accepté, accès validé.",
        'nom' => $participant->getNom(),
        'prenom' => $participant->getPrenom(),
        'classe' => $participant->getClasse(),
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