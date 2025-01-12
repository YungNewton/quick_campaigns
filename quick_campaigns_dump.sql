PGDMP                         |            quick_campaigns    14.5    14.15 (Homebrew)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49153    quick_campaigns    DATABASE     d   CREATE DATABASE quick_campaigns WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE quick_campaigns;
                decagon    false                       0    0    DATABASE quick_campaigns    ACL     1   GRANT ALL ON DATABASE quick_campaigns TO dbeast;
                   decagon    false    3600            �            1259    49171 
   ad_account    TABLE     �  CREATE TABLE public.ad_account (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ad_account_id character varying(255),
    pixel_id character varying(255),
    facebook_page_id character varying(255),
    app_id character varying(255),
    app_secret character varying(255),
    access_token character varying(255),
    is_bound boolean,
    default_config text,
    subscription_plan character varying(50),
    subscription_start_date timestamp without time zone,
    subscription_end_date timestamp without time zone,
    is_subscription_active boolean,
    stripe_subscription_id character varying(255),
    name character varying(255) NOT NULL,
    business_manager_id character varying(255)
);
    DROP TABLE public.ad_account;
       public         heap    dbeast    false            �            1259    49170    ad_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ad_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ad_account_id_seq;
       public          dbeast    false    213                       0    0    ad_account_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ad_account_id_seq OWNED BY public.ad_account.id;
          public          dbeast    false    212            �            1259    49154    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    dbeast    false            �            1259    49160    user    TABLE     5  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(150) NOT NULL,
    is_active boolean,
    profile_picture character varying(150),
    subscription_plan character varying(50),
    subscription_start_date timestamp without time zone,
    subscription_end_date timestamp without time zone,
    is_subscription_active boolean,
    has_used_free_trial boolean,
    stripe_subscription_id character varying(255),
    reset_token_used boolean
);
    DROP TABLE public."user";
       public         heap    dbeast    false            �            1259    49159    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          dbeast    false    211                       0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          dbeast    false    210            q           2604    49174    ad_account id    DEFAULT     n   ALTER TABLE ONLY public.ad_account ALTER COLUMN id SET DEFAULT nextval('public.ad_account_id_seq'::regclass);
 <   ALTER TABLE public.ad_account ALTER COLUMN id DROP DEFAULT;
       public          dbeast    false    213    212    213            p           2604    49163    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          dbeast    false    211    210    211            
          0    49171 
   ad_account 
   TABLE DATA           &  COPY public.ad_account (id, user_id, ad_account_id, pixel_id, facebook_page_id, app_id, app_secret, access_token, is_bound, default_config, subscription_plan, subscription_start_date, subscription_end_date, is_subscription_active, stripe_subscription_id, name, business_manager_id) FROM stdin;
    public          dbeast    false    213   �                 0    49154    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          dbeast    false    209   j                 0    49160    user 
   TABLE DATA           �   COPY public."user" (id, username, email, password, is_active, profile_picture, subscription_plan, subscription_start_date, subscription_end_date, is_subscription_active, has_used_free_trial, stripe_subscription_id, reset_token_used) FROM stdin;
    public          dbeast    false    211   �                  0    0    ad_account_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ad_account_id_seq', 10, true);
          public          dbeast    false    212                       0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public          dbeast    false    210            y           2606    49178    ad_account ad_account_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ad_account
    ADD CONSTRAINT ad_account_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ad_account DROP CONSTRAINT ad_account_pkey;
       public            dbeast    false    213            s           2606    49158 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            dbeast    false    209            u           2606    49169    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            dbeast    false    211            w           2606    49167    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            dbeast    false    211            z           2606    49179 "   ad_account ad_account_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ad_account
    ADD CONSTRAINT ad_account_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.ad_account DROP CONSTRAINT ad_account_user_id_fkey;
       public          dbeast    false    3447    213    211            
   �  x����J1����)��I&{[j��-(mQD����.>���t����1C ��q�>o�U�r��]��J���>`.�(��^�h a�t��e��w��7�c��0?_�Bz���pr�6Y��/��;�����i�v��R��yF��HYn��v���)(*��sM=H�L�I�$8����}%Gu�%*Ht�e�^�����$&gE#Ž�ʟ��St�P
rP�𘥶�)�E��Į<}���P��4	)�����})�����p�	�B�\���Bw*Mr�B��Eu]��N���R(*)�t��6�I��RE�Ym����5��@�i�Bg4t)�D�(�6R��
?Z�5��@�bѹBA��l�I�2���2�����LN~Ёq�<�^��?�UC            x�3436HLML�0O1����� ,         �   x�U�9�0 k�iy�����ЦqֶArH<"*��f��|�?�%�)������X-�CK�������N��=�k����D0l�3��xF	"Y�- Dv����a��8*\��/C$VQ��eX�<��j��B: V�USP�'�4(��)�/q�DY�R�n�8     