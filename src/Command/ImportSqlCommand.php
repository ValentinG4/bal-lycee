<?php

namespace App\Command;

use Doctrine\DBAL\Connection;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

#[AsCommand(name: 'app:import-sql')]
class ImportSqlCommand extends Command
{
    public function __construct(private Connection $connection)
    {
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $file = __DIR__ . '/../../var/bal.sql';

        if (!file_exists($file)) {
            $output->writeln('<error>Fichier SQL non trouvé</error>');
            return Command::FAILURE;
        }

        $sql = file_get_contents($file);

        try {
            $this->connection->executeStatement($sql);
            $output->writeln('<info>Données importées avec succès ✅</info>');
            return Command::SUCCESS;
        } catch (\Throwable $e) {
            $output->writeln('<error>Erreur pendant l’import : ' . $e->getMessage() . '</error>');
            return Command::FAILURE;
        }
    }
}
