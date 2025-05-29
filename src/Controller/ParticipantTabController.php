<?php

namespace App\Controller;

use App\Entity\Participants;
use App\Repository\ParticipantsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

    // src/Controller/ParticipantController.php

use Symfony\Component\HttpFoundation\JsonResponse;

final class ParticipantTabController extends AbstractController
{

// ...

    #[Route('/participants', name: 'participants_index')]
    public function index(): Response
    {
        return $this->render('participant_tab/index.html.twig');
    }

    #[Route('/participants/list', name: 'participants_list')]
    public function list(EntityManagerInterface $em): JsonResponse
    {
        $participants = $em->getRepository(Participants::class)->findAll();

        $data = [];

        foreach ($participants as $p) {
            $data[] = [
                'id' => $p->getId(),
                'nom' => $p->getNom(),
                'prenom' => $p->getPrenom(),
                'classe' => $p->getClasse(),
                'statut' => $p->getStatut(),
            ];
        }

        return $this->json($data);
    }

    #[Route('/participants/toggle/{id}', name: 'participants_toggle', methods: ['POST'])]
    public function toggle(int $id, EntityManagerInterface $em): JsonResponse
    {
        $participant = $em->getRepository(Participants::class)->find($id);

        if (!$participant) {
            return $this->json(['error' => 'Participant non trouvé'], 404);
        }

        $participant->setStatut($participant->getStatut() === 'passé' ? 'non_passé' : 'passé');

        $em->flush();

        return $this->json(['success' => true]);
    }

}
