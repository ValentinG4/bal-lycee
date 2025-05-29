<?php
// src/Controller/ScanController.php

namespace App\Controller;

use App\Repository\ParticipantsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ScanController extends AbstractController
{
    // Page HTML
    #[Route('/scan/live', name: 'scan_live')]
    public function scanLive(): Response
    {
        return $this->render('scan/live_status.html.twig');
    }

    // API pour AJAX
    #[Route('/api/participants/status', name: 'api_participants_scan_status')]
    public function apiParticipants(ParticipantsRepository $repo): JsonResponse
    {
        $participants = $repo->findAll();

        $data = array_map(function ($participant) {
            return [
                'nom' => $participant->getNom(),
                'prenom' => $participant->getPrenom(),
                'classe' => $participant->getClasse(),
                'statut' => $participant->getStatut(),
            ];
        }, $participants);

        return new JsonResponse($data);
    }
}
