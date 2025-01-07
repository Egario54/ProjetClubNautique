--CREATING USERS

CREATE ROLE "ClubNautique_Miesch_Jacquot_Edouard_Bleeker" WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  NOBYPASSRLS;

CREATE ROLE "Moniteur_Miesch_Jacquot_Edouard_Bleeker" WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  NOBYPASSRLS
  PASSWORD 'xxxxxx';

GRANT "ClubNautique_Miesch_Jacquot_Edouard_Bleeker" TO "Moniteur_Miesch_Jacquot_Edouard_Bleeker";

CREATE ROLE "Accueil_Miesch_Jacquot_Edouard_Bleeker" WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';

GRANT "Moniteur_Miesch_Jacquot_Edouard_Bleeker" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

CREATE ROLE "Proprio_Miesch_Jacquot_Edouard_Bleeker" WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';

GRANT "Accueil_Miesch_Jacquot_Edouard_Bleeker" TO "Proprio_Miesch_Jacquot_Edouard_Bleeker";

--CREATING DATABASE

CREATE DATABASE "DB_ClubNautique_Miesch_Jacquot_Edouard_Bleeker"
WITH
    OWNER = "Proprio_Miesch_Jacquot_Edouard_Bleeker"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

GRANT CONNECT ON DATABASE "DB_ClubNautique_Miesch_Jacquot_Edouard_Bleeker" TO "ClubNautique_Miesch_Jacquot_Edouard_Bleeker";

--CREATING TABLES

CREATE TABLE public."Materiel"
(
    "idMateriel" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "caractéristiques" text,
    PRIMARY KEY ("idMateriel")
);

ALTER TABLE IF EXISTS public."Materiel"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public.panne
(
    "idPanne" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idMateriel" integer,
    "typePanne" text,
    "datePanne" date,
    PRIMARY KEY ("idPanne"),
    FOREIGN KEY ("idMateriel")
        REFERENCES public."Materiel" ("idMateriel") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.panne
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";


CREATE TABLE public."histroriquePanne"
(
    "idPanne" integer NOT NULL,
    "idMateriel" integer,
    "typePanne" text,
    "datePanne" date,
    PRIMARY KEY ("idPanne"),
    FOREIGN KEY ("idMateriel")
        REFERENCES public."Materiel" ("idMateriel") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."histroriquePanne"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."ReservationMateriel"
(
    "idReservation" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idMateriel" integer,
    "dateReservation" date,
    "heureDebut" real,
    "heureFin" real,
    PRIMARY KEY ("idReservation"),
    FOREIGN KEY ("idMateriel")
        REFERENCES public."Materiel" ("idMateriel") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."ReservationMateriel"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Cours"
(
    "idCours" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idsReservation" integer[],
    niveau text,
    date date,
    "heureDebut" real,
    "estAnnulé" boolean,
    "nbPlaces" integer,
    PRIMARY KEY ("idCours")
);

ALTER TABLE IF EXISTS public."Cours"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Personne"
(
    "idPersonne" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    nom text,
    "prénom" text,
    "diplôme" text,
    PRIMARY KEY ("idPersonne")
);

ALTER TABLE IF EXISTS public."Personne"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Location"
(
    "idLocation" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idReservation" integer,
    prix real,
    PRIMARY KEY ("idLocation"),
    FOREIGN KEY ("idReservation")
        REFERENCES public."ReservationMateriel" ("idReservation") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Location"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Partenaire"
(
    "idPartenaire" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "nomPartenaire" text,
    reduction real,
    PRIMARY KEY ("idPartenaire")
);

ALTER TABLE IF EXISTS public."Partenaire"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public.client
(
    "idClient" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    adresse text,
    commentaire text,
    PRIMARY KEY ("idClient")
);

ALTER TABLE IF EXISTS public.client
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Forfait"
(
    "idForfait" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type text,
    prix real,
    PRIMARY KEY ("idForfait")
);

ALTER TABLE IF EXISTS public."Forfait"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Commande"
(
    "idCommande" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idCours" integer[],
    "idLocation" integer,
    "idClient" integer,
    PRIMARY KEY ("idCommande"),
    FOREIGN KEY ("idLocation")
        REFERENCES public."Location" ("idLocation") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    FOREIGN KEY ("idClient")
        REFERENCES public.client ("idClient") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
);

ALTER TABLE IF EXISTS public."Commande"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Caution"
(
    "idCaution" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    montant real,
    etat integer,
    "idCommande" integer,
    FOREIGN KEY ("idCommande")
        REFERENCES public."Commande" ("idCommande") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Caution"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

CREATE TABLE public."Paiement"
(
    "idPaiement" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "idCommande" integer,
    "estPayé" boolean,
    PRIMARY KEY ("idPaiement"),
    FOREIGN KEY ("idCommande")
        REFERENCES public."Commande" ("idCommande") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Paiement"
    OWNER to "Proprio_Miesch_Jacquot_Edouard_Bleeker";

--CREATION DES DROITS

GRANT CONNECT ON DATABASE "DB_ClubNautique_Miesch_Jacquot_Edouard_Bleeker" TO "ClubNautique_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public."Commande" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public."Caution" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT SELECT ON TABLE public."Cours" TO "Moniteur_Miesch_Jacquot_Edouard_Bleeker";
GRANT UPDATE("idsReservation") ON public."Cours" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT SELECT ON TABLE public."Forfait" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public."Location" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT SELECT, UPDATE ON TABLE public."Materiel" TO "Moniteur_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public."Paiement" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public."ReservationMateriel" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLE public.client TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE ON TABLE public."histroriquePanne" TO "Moniteur_Miesch_Jacquot_Edouard_Bleeker";

GRANT INSERT, SELECT, UPDATE ON TABLE public.panne TO "Moniteur_Miesch_Jacquot_Edouard_Bleeker";

GRANT SELECT ON TABLE public."Partenaire" TO "Accueil_Miesch_Jacquot_Edouard_Bleeker";