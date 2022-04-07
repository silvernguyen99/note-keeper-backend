-- Table: public.tb_users

-- DROP TABLE IF EXISTS public.tb_users;

CREATE TABLE IF NOT EXISTS public.tb_users
(
    user_id integer NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    username character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password_hash character varying(255) COLLATE pg_catalog."default",
    accesss_token character varying COLLATE pg_catalog."default",
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tb_users__pkey PRIMARY KEY (user_id),
    CONSTRAINT tb_users__email_unique UNIQUE (email)
);


ALTER TABLE IF EXISTS public.tb_users
    OWNER to postgres;

CREATE UNIQUE INDEX tb_users__idx_access_token
ON public.tb_users(accesss_token);


-- Table: public.tb_login_social

-- DROP TABLE IF EXISTS public.tb_login_social;
CREATE TABLE IF NOT EXISTS public.tb_login_social
(
    user_id integer NOT NULL,
    type_provider character varying(255) COLLATE pg_catalog."default" NOT NULL,
    social_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE IF EXISTS public.tb_login_social
    OWNER to postgres;

CREATE UNIQUE INDEX tb_login_social__user_provider_unique ON tb_login_social (user_id,type_provider);
CREATE UNIQUE INDEX tb_login_social__provider_social_unique ON tb_login_social (social_id,type_provider);


-- Table: public.tb_notes

-- DROP TABLE IF EXISTS public.tb_notes;
CREATE TABLE IF NOT EXISTS public.tb_notes
(
    user_id integer NOT NULL,
    note_id integer NOT NULL,
    note_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    content text COLLATE pg_catalog."default",
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX tb_notes__idx_user_id ON tb_notes (user_id);
CREATE INDEX tb_notes__idx_note_id ON tb_notes (note_id);

