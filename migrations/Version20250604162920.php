<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250604162920 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE "user" (id SERIAL NOT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY(id))
        SQL);
        $this->addSql(<<<'SQL'
            CREATE UNIQUE INDEX UNIQ_IDENTIFIER_USERNAME ON "user" (username)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE participants ALTER id TYPE INT
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE participants ALTER statut TYPE BOOLEAN USING (false)
        SQL);
        $this->addSql(<<<'SQL'
            CREATE SEQUENCE messenger_messages_id_seq
        SQL);
        $this->addSql(<<<'SQL'
            SELECT setval('messenger_messages_id_seq', (SELECT MAX(id) FROM messenger_messages))
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER id SET DEFAULT nextval('messenger_messages_id_seq')
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER created_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER available_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER delivered_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER delivered_at DROP NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.created_at IS '(DC2Type:datetime_immutable)'
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.available_at IS '(DC2Type:datetime_immutable)'
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)'
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE SCHEMA public
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE "user"
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER id DROP DEFAULT
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER created_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER available_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER delivered_at TYPE TIMESTAMP(0) WITHOUT TIME ZONE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE messenger_messages ALTER delivered_at SET NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.created_at IS NULL
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.available_at IS NULL
        SQL);
        $this->addSql(<<<'SQL'
            COMMENT ON COLUMN messenger_messages.delivered_at IS NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE participants ALTER id TYPE BIGINT
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE participants ALTER statut TYPE VARCHAR(255)
        SQL);
    }
}
