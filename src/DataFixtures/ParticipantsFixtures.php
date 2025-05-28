<?php

namespace App\DataFixtures;

use App\Entity\Participants;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ParticipantsFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        for ($i = 0; $i < 100; $i++) {
            $participant = new Participants();
            $participant->setNom("Nom$i");
            $participant->setPrenom("Prenom$i");
            $participant->setClasse("Terminale A");
            $participant->setMail("emailtest$i" . "@example.com");
            $participant->setStatut("non_passé");
            $participant->setQrCode(""); // temporairement vide
            $manager->persist($participant);
        }
        $manager->flush();
    }
}
