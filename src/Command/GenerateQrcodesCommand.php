<?php

namespace App\Command;

use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Uid\Uuid;

use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Builder\Builder;

#[AsCommand(
    name: 'app:generate-qrcodes',
    description: 'Génère un QR code unique pour chaque participant',
)]
class GenerateQrcodesCommand extends Command
{
    private EntityManagerInterface $em;

    public function __construct(EntityManagerInterface $em)
    {
        parent::__construct();
        $this->em = $em;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $repo = $this->em->getRepository(Participants::class);
        $participants = $repo->findAll();

        $qrDir = 'public/qrcodes/';
        (new Filesystem())->mkdir($qrDir);

        $updated = 0;

        foreach ($participants as $participant) {
            // décommenter la ligne suivante si vous souhaitez ignorer les participants qui ont déjà un QR code
            // if ($participant->getQrCode()) {
            //     continue;
            // }

            $token = Uuid::v4()->toRfc4122();
            $url = '/scan/' . $token;
            $qrPath = $qrDir . $token . '.png';

            $builder = Builder::create()
                ->writer(new PngWriter())
                ->data($url)
                ->encoding(new Encoding('UTF-8'))
                ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
                ->size(300)
                ->margin(10)
                ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
                ->build();

            $builder->saveToFile($qrPath);

            $participant->setQrCode($token);
            $updated++;
        }

        $this->em->flush();

        $io->success("$updated QR codes générés avec succès.");

        return Command::SUCCESS;
    }
}
