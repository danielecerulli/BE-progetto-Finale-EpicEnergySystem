PGDMP                          z            energy    14.1    14.1 ?    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    44059    energy    DATABASE     b   CREATE DATABASE energy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE energy;
                postgres    false            �            1259    92245    cliente    TABLE     �  CREATE TABLE public.cliente (
    id bigint NOT NULL,
    cognome_contatto character varying(255),
    data_inserimento timestamp without time zone,
    data_ultimo_contatto timestamp without time zone,
    email character varying(255),
    email_contatto character varying(255),
    fatturato_annuale numeric(19,2),
    iva character varying(255),
    nome_contatto character varying(255),
    pec character varying(255),
    ragione_sociale character varying(255),
    telefono character varying(255),
    telefono_contatto character varying(255),
    tipo_cliente character varying(255),
    sede_legale_id bigint,
    sede_operativa_id bigint
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    92244    cliente_id_seq    SEQUENCE     w   CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    210            <           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    209            �            1259    92254    comune    TABLE     q   CREATE TABLE public.comune (
    id bigint NOT NULL,
    nome character varying(255),
    provincia_id bigint
);
    DROP TABLE public.comune;
       public         heap    postgres    false            �            1259    92253    comune_id_seq    SEQUENCE     v   CREATE SEQUENCE public.comune_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.comune_id_seq;
       public          postgres    false    212            =           0    0    comune_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.comune_id_seq OWNED BY public.comune.id;
          public          postgres    false    211            �            1259    92261    fattura    TABLE     �   CREATE TABLE public.fattura (
    id bigint NOT NULL,
    anno integer NOT NULL,
    data timestamp without time zone,
    importo numeric(19,2),
    numero_fattura integer NOT NULL,
    stato character varying(255),
    cliente_id bigint
);
    DROP TABLE public.fattura;
       public         heap    postgres    false            �            1259    92260    fattura_id_seq    SEQUENCE     w   CREATE SEQUENCE public.fattura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.fattura_id_seq;
       public          postgres    false    214            >           0    0    fattura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.fattura_id_seq OWNED BY public.fattura.id;
          public          postgres    false    213            �            1259    92268 	   indirizzo    TABLE     �   CREATE TABLE public.indirizzo (
    id bigint NOT NULL,
    cap bigint,
    civico integer NOT NULL,
    localita character varying(255),
    via character varying(255),
    comune_id bigint
);
    DROP TABLE public.indirizzo;
       public         heap    postgres    false            �            1259    92267    indirizzo_id_seq    SEQUENCE     y   CREATE SEQUENCE public.indirizzo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.indirizzo_id_seq;
       public          postgres    false    216            ?           0    0    indirizzo_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.indirizzo_id_seq OWNED BY public.indirizzo.id;
          public          postgres    false    215            �            1259    92277 	   provincia    TABLE     �   CREATE TABLE public.provincia (
    id bigint NOT NULL,
    nome character varying(255),
    regione character varying(255),
    sigla character varying(255)
);
    DROP TABLE public.provincia;
       public         heap    postgres    false            �            1259    92276    provincia_id_seq    SEQUENCE     y   CREATE SEQUENCE public.provincia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public          postgres    false    218            @           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public          postgres    false    217            �            1259    92286    role    TABLE     W   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    92285    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    220            A           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    219            �            1259    92292 	   user_role    TABLE     ]   CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    92298    user_spring    TABLE       CREATE TABLE public.user_spring (
    id bigint NOT NULL,
    cognome character varying(255),
    email character varying(255),
    is_active boolean NOT NULL,
    nome character varying(255),
    password character varying(255),
    user_name character varying(255)
);
    DROP TABLE public.user_spring;
       public         heap    postgres    false            �            1259    92297    user_spring_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_spring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_spring_id_seq;
       public          postgres    false    223            B           0    0    user_spring_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_spring_id_seq OWNED BY public.user_spring.id;
          public          postgres    false    222            ~           2604    92248 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210                       2604    92257 	   comune id    DEFAULT     f   ALTER TABLE ONLY public.comune ALTER COLUMN id SET DEFAULT nextval('public.comune_id_seq'::regclass);
 8   ALTER TABLE public.comune ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    92264 
   fattura id    DEFAULT     h   ALTER TABLE ONLY public.fattura ALTER COLUMN id SET DEFAULT nextval('public.fattura_id_seq'::regclass);
 9   ALTER TABLE public.fattura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    92271    indirizzo id    DEFAULT     l   ALTER TABLE ONLY public.indirizzo ALTER COLUMN id SET DEFAULT nextval('public.indirizzo_id_seq'::regclass);
 ;   ALTER TABLE public.indirizzo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    92280    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    92289    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    92301    user_spring id    DEFAULT     p   ALTER TABLE ONLY public.user_spring ALTER COLUMN id SET DEFAULT nextval('public.user_spring_id_seq'::regclass);
 =   ALTER TABLE public.user_spring ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            (          0    92245    cliente 
   TABLE DATA             COPY public.cliente (id, cognome_contatto, data_inserimento, data_ultimo_contatto, email, email_contatto, fatturato_annuale, iva, nome_contatto, pec, ragione_sociale, telefono, telefono_contatto, tipo_cliente, sede_legale_id, sede_operativa_id) FROM stdin;
    public          postgres    false    210   �G       *          0    92254    comune 
   TABLE DATA           8   COPY public.comune (id, nome, provincia_id) FROM stdin;
    public          postgres    false    212   bH       ,          0    92261    fattura 
   TABLE DATA           ]   COPY public.fattura (id, anno, data, importo, numero_fattura, stato, cliente_id) FROM stdin;
    public          postgres    false    214         .          0    92268 	   indirizzo 
   TABLE DATA           N   COPY public.indirizzo (id, cap, civico, localita, via, comune_id) FROM stdin;
    public          postgres    false    216   U      0          0    92277 	   provincia 
   TABLE DATA           =   COPY public.provincia (id, nome, regione, sigla) FROM stdin;
    public          postgres    false    218   �      2          0    92286    role 
   TABLE DATA           (   COPY public.role (id, name) FROM stdin;
    public          postgres    false    220   �!      3          0    92292 	   user_role 
   TABLE DATA           5   COPY public.user_role (user_id, role_id) FROM stdin;
    public          postgres    false    221   "      5          0    92298    user_spring 
   TABLE DATA           _   COPY public.user_spring (id, cognome, email, is_active, nome, password, user_name) FROM stdin;
    public          postgres    false    223   F"      C           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 6, true);
          public          postgres    false    209            D           0    0    comune_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comune_id_seq', 7142, true);
          public          postgres    false    211            E           0    0    fattura_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.fattura_id_seq', 4, true);
          public          postgres    false    213            F           0    0    indirizzo_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.indirizzo_id_seq', 13, true);
          public          postgres    false    215            G           0    0    provincia_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.provincia_id_seq', 110, true);
          public          postgres    false    217            H           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 2, true);
          public          postgres    false    219            I           0    0    user_spring_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_spring_id_seq', 3, true);
          public          postgres    false    222            �           2606    92252    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    210            �           2606    92259    comune comune_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.comune DROP CONSTRAINT comune_pkey;
       public            postgres    false    212            �           2606    92266    fattura fattura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fattura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fattura_pkey;
       public            postgres    false    214            �           2606    92275    indirizzo indirizzo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT indirizzo_pkey;
       public            postgres    false    216            �           2606    92284    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public            postgres    false    218            �           2606    92291    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    220            �           2606    92296    user_role user_role_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    221    221            �           2606    92305    user_spring user_spring_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_spring
    ADD CONSTRAINT user_spring_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_spring DROP CONSTRAINT user_spring_pkey;
       public            postgres    false    223            �           2606    92331 %   user_role fka68196081fvovjhkek5m97n3y    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fka68196081fvovjhkek5m97n3y;
       public          postgres    false    221    3216    220            �           2606    92321 #   fattura fkf55imyo58nx83x77ufdmoa7e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 M   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1;
       public          postgres    false    214    210    3206            �           2606    92306 #   cliente fkj864ytumjy2bwgtu7jhkvsat1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1 FOREIGN KEY (sede_legale_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1;
       public          postgres    false    3212    216    210            �           2606    92336 %   user_role fkjnbh64dhuo55gh2jd9d21d245    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245 FOREIGN KEY (user_id) REFERENCES public.user_spring(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245;
       public          postgres    false    223    221    3220            �           2606    92311 #   cliente fknfenl2nw16cln6ansxx4ljx3o    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o FOREIGN KEY (sede_operativa_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o;
       public          postgres    false    216    210    3212            �           2606    92316 !   comune fkr2h0j33kqnh79vxndd0xh95n    FK CONSTRAINT     �   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n FOREIGN KEY (provincia_id) REFERENCES public.provincia(id);
 K   ALTER TABLE ONLY public.comune DROP CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n;
       public          postgres    false    212    218    3214            �           2606    92326 %   indirizzo fkt8brbuq41cphbhkgrhn1oukl1    FK CONSTRAINT     �   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1 FOREIGN KEY (comune_id) REFERENCES public.comune(id);
 O   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1;
       public          postgres    false    212    216    3208            (   |   x�E��
�@�뽧�\fW�/UR�����BO��!�$f����Q��-�B�F�T��ȗ55�?�t-�!O4�� ��- .W ���㽦|��8�O�ωP�R��ƠB��DIӳ1��'7      *      x�t�˒�Ȓ-:����ը� 	C�Tҭc�GKڲ��!I$�m �|�����5�����~��Z�= 0��� �{�cy�x��ڿ�kQ��+_�i����A,o��n��};_rV�yl�c����А�6�95�]����|&Q�h�G��f��k^Q��֕ٽQ���kIf�7����zum���7[�^�պZ���A�����������=��q�������i��~h�ѲA�A�+�}�����F���eG��?6��Og�`g��|�x۴G�Xv+�.��1��:�?>��ݗ��ڭ�a=ﻮ9���n?�뛾��ۺ�tYE��׳���Wˡ>���e&�u��夋�����ӷ�n۝v�ˋh����t���/��C:�(@����Һ<\�a���e2�\Y�.C��d�Y����j	��w��V֟����a]�{ӝ�J׋����9ZFuuqUq�&���`�7Ƕӟ*k��׳׸�����@�'{��s�g{س>�%��ǳ^�<���8�W��5:94]�NN������w� �;�ݣ�?<t����aKu��t��t���\t��VR�������l��-V�����6���7Y���R���y�K��>�{�(ɏ9�=���z �u�/wQ3l��Ք͉�s�FǾ6�^Zichl�Գ��6
�8����p֝�d��߹ }�E�/K0��%�!a7��qHeN����m˔�e}����D��dh����l��}aZ1�qk+�7�����������z��j�1�����e7�6�_^DX/���}ý9�J�^�^�iㇶ���*�o��W޲������}��o��n_�iw���Clu���b���QU�Ż���V�j���i�'������:h[���{.b�����6��,�r�>���~eD?�v.�_/���7�в�����U��mq'~M~��X��ET Ni;�L~}�����2�����.&�>4����&�l��y����D���k?ޤڇ��//��m۾$�ɰi[�L�}.�[����&o}nM��q�۝�ç�rv���VX���\��qNm��&��>��{�vy:9]�~���xLi����|�{������&*[	�{#�13X׼���k̙���~���Q�G�f�$T��R&3i��򢵘��z��6`�>��}��������*pڤ8e&�>��&ހ	���wjr�m�ǳo��ɲ�Q�+��?�<�`F�}�&�>�G*lr�k\pg&�>�6��$���v��h�	��6x �ʗ�JS��gU�6�$���E���M-K�l�.v���8� �	2�m�19��y�&��`j�Og�βm�]/����#�XG*2��ݮv���E�ۧ�����7�g"�S���I�O�ωI�O��mr�S�1�g�l	�v��+��}�>�&�>�.x
�$3���:t�g�/>���0P�8�b�/������)���Mh}1�e�����ƟM�ɮ/��>Q�\_l#�)3�e��>����l���u�{���a�԰�j�mM�9v�f�b٘83�|��@��̶Qj_l
ma�}���-�䚑M�ɳ/�vP�k_���9�s�	8�Ovej_Z�D����/�ms�M�}1�,V�ɳ/���W�d_l��Gl��K?����ٗ��7]ـ��͘<���&Ќ>����H3�&5��ܤ����!�TnR�X�=��Z��k��R,7�f��5�&���4��8�4ӓ⦛��֔�]�ee[�~��y��;EnBw�6�QG�M��e�,EA?���L����Dn��+��ߥX|��I�_S�I�����7���17	���ݍ�M�}�q�s3pq�ᛤ����뻩��b���G;��e<����zI�Nn��}�10�kFB��	J�
��V�������t��&�A����$�[�j��n�d��n��d![�&�o�.i���E��kw1�&�y�#dck���pH�V�򸏕���bj4G.�4��JM����#�M/WYjk��h�W��\N��?i�&X�	ݴ���t��WO[�ƛ�J����ٚ~�ء��_�j�'����~z�M;���=4q����y��&�]���۶�^�o}͹8�����~�ވ�|�{���G�{:[kN�9z��,\^\�����`�(7��m;͹�fc��)��vk��o�B�CIn��}�����ڛ����q�gSmb9�?Z��}ݘ|��\���'dg�c�J����9��3`r�;���b�z2}&��L�ֳ3mn�7����N�3&��1�&��S?��M|�u�6���vkN����~�ESoBd�JLh��[T��*���w�	�&��m��/3����y(����	h�&P��o}���zh��Q_v7{�����.��jP�P�������d�2Ym����ڻ����?�&��	�iں��ڏ�I�mX:r�?lS�i�y�&��v4�m�{�l����YI��M���ı%71�W��i�3�����so�,��}6r?D/�s1i2�q,�1������pcgY�c<��O�0�������������s��&Ӎ�M�d����s�f���m?�C��-�b��k�����[����Ƨ;�9p`o��`��.�b�X��i����Ig忹�̯��6=F؎��0¶:���!s���9�%�l������ư��7	찼�;�:{M$�<�Z	a=�V(mt����C+��X1��x�����{��N1K��^���Wo���9Z��5\�s�w	ˑ&�0]u������\#��6�8y�M��6`�C<��b�gW�L��6�&*[�������q|�&���4��Ɨ�`y9��G�X��c�z�8���� ���{�Ϡ7��*�Ǟʇ�v>��ogK�u©l�@�jй�W���v��0+��P-�][(�?�t��+�py�=Cun~1��f��v~�lǁ�<���(Ũ��׽~��f����d/��+p��X�0����ls:_�q��Gt��y"7�K���	ӻ��±�@�A���/-�f�i��б��&}�%��t����>5�]p�ҧ���̺�U�J����b�u�W�S1;�lM�'�D�m���6A
j|��)�@�Zc:[�=L���??�x�o��nџ>��߱��]� O�n7��}cG(K'�T�o}{�\��B�$���)���65�uù�y�����wo�&:`���.:.��`{Ǣȍo���I��#�1
�6n}�F�L^��s����¶2`�lʸ��H6�m��ظ��zIb��8��{���w&�����"�^tj�U����ݶqS���}}sK��Z�*���Am�����}��<+�;<}���toM�Aiխ������T�z���YV��3267���}��h��lm�mO�){Ӂf�\.]��3X�}�(/��²!c��2�nr�v��^9��_������kJ��7���6�r��D���dl����bU��61�!�yr��%l�؝}�� �:��K4��m�^��i�nLx~�_^�_K�ۏ�B`�le�e3�Q��260��1g��i�\A���J���B4���m�89�bZ&/��b��!Rΐo"	�f������;��[9�I��z����S���^��d���Nw3�9Y�&3?w��4I�����Z|�aS�tq9��e�PMl~�$!Qq>7㤮a	<�+��Lc��iUЪv�~�&���)rIc��gZ@\�!c=� �Y�Y�b��P����)����o�L�L؜�iK4��W���o�nNN�$�2�kM�~�7�#gc�{9��q�4���♳٦V;9��|���e������ٜ���ǿq���%���'��M&�m��j2*�i����}�K�&d "�s�~��[���Y��Ŗ~C��2�s�8��i�AW���Q����4 ��J�+�:��b	����b��?�B�	�;�v����Olĝ�t<��-�� ���ƅ�7W �ͮx[`�1��2���	l�6�c-fF�5Ƽ��l ��D��p�#�y�j� cB��Ǹ��W�Ύ_u�/�%�6	���������a� a����$�IN�#D�._�AbKz�ub�J��`�<$
����2����;��    ��Y1Ң��ŔpC�pM�f���a�*�9e�Ύ�� ���ؤ ���K,r\V����*"f�=;'���)�@>�
�bC5k���}.k��b�;\k�]��6�r��!�Y��Z��4h��mV�P����b���a4���4�ΕҖ��I��$�A���O(?�[��/qZ�����p�4��m�Of��X9�����/B���+nUN�8�4��%�^��ew�DP��S,M��N�t(�:�� ��m|��
����5+4�8q��&�FD�$�#;96����4",���QM�I�w�}2����[S�������w>[&7?����E�3���m+N�������8�BM*�ol�Oߠ	���H�T�o�tV�Iđ}>'v�w	E�z
)hw�ǴL4~�v��d�昮6��^��>L&~��pT�+6ƹ��.M�0ع���DX!������ �"u����DF�M>@���M>4���X��kŤ�3'߷�CS&S�M>4W�"I����{4��L">�14���\AX#ol��Ɇ����L(�PH `��[{U(��W���ڈ��>Z�<%YQ��R	��հ�i�d�	�'��.�l����Jq��CU�Z�#~�����B�٩�=��/gM�N�xq�@�-ܠ�`�BR
X]�L:�!����}`�#.�����A��qv������gsqt���k�t�g��G}�W�E���?v�"S�E�����Y
��ߋ�b�s�'���rm`�I�m�}K+L�~���sjB��&P?��K�ޤ�6&#�B��LK�1����>x�gS,y�I�0)��QW���|e�X� sh�y���O�K�^���X"�bC����YD�l�D�h�K�X1��;�B\L�q�Ւ�>�i���b*��V$C,bu�`a'����8_��2PL^�
'��ZV8am���\�������L�!@��S$T�b��]׸VX���5��eH�N�v(��pH�5�v�H3���q��ɽFj�����OC��.��dF�S ��~�xxDȬ_���c�վM&ЌqA̖�B���%�BF�����L�y��[�샆�M'[,ט[ZO�ym�5Ӏ�e,�t}ӌ��Њj���CHvQ��z�M�}�<=�t�j�-��بO���Aqh�0j��w?�����b�騺���P�����1}xn�CjY�YGl����э#����>P %qUlxҦא�Fd�/l#����缺w�YI�.*��k���ݜ|"�<︾y�)mE��i��
C����߶��7S��n���X�&5iuƙ{އ��=yOl	G������?���%�p0|ź��實|�dP�#l�N��a�:�
S�<�[�-�8;gΜ�uiRT�I��6j8�G��E��Ti��(X�&����',ꭋ�Rn�]�*eF�>�W���h)!gM�u�$�[{�]|����&�q5]�/se+<b�wR������fx���t����@U�ˉ�z6a�j��Ͷ����ײz��&x����g6�_���2�c�|nG��4A������,6��4Ai��t:[�9�it�x�5T>���;���j��s���+ԍ�iC!K"�0�����e9c�F������H�?ƻ㠈P�l��#p��$��c�A�¬@͏6�GzZ@��Hw,��C`���(��O��c���4�"��/��u6m�f����?���>2��7��-��F3�^%��3�3;��V6D���7�cܷ��������m��T���y����0V�If�S�Ei�p悑����#�)vb.�\?]OO�C:����<��H~v�-C$����M!ᤅ:�.����D�	���J��O1��N��t��(�M@JAcMF;�B�`�U����?��'z�A��B��4��L�g���$���vZn�������Mp��T�]�d��S�q�
��.~���I�p ���f#W�K<��;�yFU85p�����<���su0t��'8<��V5=҅��������bot���;��|t��9���������2�]��#_'7j��d�m�u�k�:PMVq���Nm�N�]lL�~�_`�!l�Bp����:�cl�R�p�n�b�xk�c��h~��,SP�ء�&~��.�Z�͖�tF�>�M��c���i��2��6���q[���P�k-�Cw�S�
u��7:%3w�����&�/b$�4�|���a�/g*�ؓ|5A���<�=
&�Z�h���ƒ������$�cL>��[� ���q ���ATH��F�_�Ƥ�w�H�ɣy��v��/����!Y�(xjh M�N<�b�����v�Ѯ��t7��gAw���3a�s7	t%:̑��d��oֺ	�7�]ZWPr�l��@�?�{h�g�L��4yo��8k�1O���6�2�K3�v�<7rs��L3G7'G%���!���lj��Kg愻^���#"��/н@!��� �nCC����'
'](���1U"�l�(�Nv�u�o[�$��S��;#&�M�6�[�'����8��3 �PV��G���-���
��B�1�}�Tr�HU��M^_� 
�a棇���W(�)������i�Bv� �\&������{*�a{�Q��kdw���Q��74�i7t$1��H�D�r���0��%s9�x�#S�����]J�~��( �W��t�R���kz��G�Q�����^T�yd���v���Ur1�$�(Z�
����A}��71��j�t6�栺UF�#��y���5��ˬB'==��*ŵ�{����^�&�5�q�f��ϓ��a��
���b�����
��їMu_(�������G�ȗCߵ~1G��A�g�S�\Mp��ta�;�LwmcuVT�:i�'�tf��o_o[���d���A�:e�B៏��uJse`&xH}mN�|H#�����t�xA,�ͽrd�*��`aV/�1�$�3ז?��:h�L�ik}�W9"o���k��t���0��V��jV��$;�c�p�EK�;:�������΄�ǆ��R*�OW&l?�C��7���Ù��M:aw�6is�s/o�]1�����W6����jE�s�JO��jE��c�=Hwl/��*�	ѓ����\7ۈ����h!���.���VU��Ëw�y�TGO��W3L��x �K*����Z�!О\�Tk�d^���M�~�3�!V"kw�\��b��6#�Kkڿ?�Z@����L�~�G���̉I��2.�&_?_koZ��e�������"����IJ��T��������aLΤ��c��5��ṅ(�u�wRf�[�턉PY�ӦR.���X���0��o�S���=���6�4��q^��n�|���A �thvȈ ��(�?2���\w��R�~:�J9��W�Y{>�_TL���o�R�ahm[��n&g�ɵ8��<�s>��*�M��e ��G��� 0��3�͟u �Hx�6�o��FQn��C�3����`;�v�gp`����f���z�`N�{�'��I�ZN)v��sD�]uLp��6���}�V��3ҧo,�3�g#��E���`�u���,�ŇQ��;�=�kv�1N�.���!hnP�59/ފ�3f�f<���F2�¶�P��D�1x��/�How�z�u��E����x,�ߨ��ǰ�,+d�	l��g>,�H�9���v|0=ӷ)c�����#/*B"Ņ���f�R���7V"���d�&a�sf`��*i��K�nkl���Z�y�1Z�7\�[�����̚���v=�5�5У���ex;�0-#HN�QZ�&��SJ�)M��A��`��<\N��A��]�8���Z*�8K"
]x2s֊0AM�Z��{��F��2��r� #^)����l�+�SIMe��/e���2 �&�����֮�Ў�Z"����}'{��5"�����P'��Lk�� ^����X4LZQ��׀%�pq12!`�%9Õkjಘ�o�D�Ƕ�$'r���ճ�Z�7ݶ�cnM�~����    )A ��t��mc���,�6M�R۷���6��r� n��EF�f�.���JM	�����p��˄��Ft�?��x�;�:�IȆ�^�c70�M���Z��L> �l뛛�s�w+���JF�5b�w�u|�m�v4bp�%������>�EŪ�#O�BN�c��E�n0���������''�\���\G���P�8���Q����D��ğ*~5�kgɘ0� bd�?��d����V�O����O
�FD�I�|Y=�4�{�sM��O�ޠ$#D9�-6��Y��@U��urn�%h�&]Bl>��+�<!��[�$O���
���K86�A��Yg���+r�.t���ڦ> x��DFҰ���㳐"j�X.1"��?�崛]��,��L��{�Lcq6B��@�(LC� }����~G�5,pD�0��8NDN��	������޼�X:N��}&���s;v �}�=u�4K����7�����5Zտ�q=*�|�ar9?��/]7����>��-��Mo�NP1�=ȶ,���������Y1�u��˥ݏ���7y�Z�Y$�}kl֔$ʦ"�)�U���p��V)r�V����м�m�����X���0�c��]�e����&Yݦ+�^�+s�d�C3�y���?r�v�'�.`�Ԧ����Ɖ�Y6L;&�4|�0��R>����הGj�΁���Ġl�}t^^R=݃�s�ٸ�g��$�7 \n��_�c���&���R䌒*��H�j������Ω�I�	�wpB��l����d��H�ä�{�+��9��Y��ڝ�����r@�T0���|G�����4���hӋ+����7���C���4d�4C#C��M�	��[.>���(����q�@~篃o��ex5��ٜlJ���}��7H�C�gЕ�˙���?N�I�:�&�̼�ø*M/x@�"����}G&~�-���V�h���A���n{�����T������/�0���ɿ�wmGI�3ع�7I�8�Kg�sH�,��z�^�h�!m���۠��d� P\ݍ��ܩ	 ���7�� o�R�0����晬~
zp�~�
���X1G}��x��Y��aӷب��)���L{�<��߄�œSs�*��7C��>n���XR�i;���sN{ ࣾ�p�� ����ˀ�2�e��.]GkS�L$�W�G�t�p;#4��'��������Ф��ȥE�\"��6���	���_?��K�1E��g��g��bv���iB���5s
�43�����z�� $����l�9}��f�g�1�Uc��4�6���a���rc��O�|h��<�u����[hj[a�Dsg�����WA��hT����t�<�`F#�3�|N�P>/v��ږ��4��i:��d���D6B���C���x����%cE�_2{rϥK[�K���lD"��[�J%">�c���C�����C4�^���'	v�\٣wm��Sw���k< �lbR;�p,5���Ue����Kk�'�Ny������!���j��Hf:dA���ǹ���=�
I7�K���i��pg[�l/�i.�~����?�F�lwO�A��ݦo�$��/��K6�c�ѷ�1�-�PŻ�|7;ۛ���>�.�n�i.���D��n�VP���׸u��{|ҋ8G7��S����Q1Ǯ����"&S��}Z�+>�ȼa�͊jh�?A� tH;D���������d���pP��e��C;;[����/�m�-@@�¸o��8$��u�}0�D;���3��}l����ش���k C�8��PE3>��0��;<�-���?������o�1]����2�u%4�6&&0p����P��><�e��[�㿁�2�>G�V�i�9}��� 
�>N�܌�J��>(�>=�}ڇn�oR���w�������ɷ(�.�c��P"L��L��89tOr� ���w��:,�b�[}t�;tX���e�C�9����_Ҁ��Y٦�.]��aR,�y��)��%=�/�{����,@�>5#�d���]�Y%Eo�M�~�h$LX���Y�j.�m��\���1��V���q�#��������5ij��Ĩ��_�t��/�>�ろK`�:ڊ����dw�z��d�J��5�X�� z�,�tG�n����W��)��Y���o1�ļW�ǷS�lE	�r�W����-�i�Җu�zv�7�@��v�����Q=���致����I4 09���"N�ǤH
@A-=I$�=p0.�:3a��h��u�{�'�4z��%�����G (�SO�1��hly;0��������V<�@�:�0�A�9l!�D3��7��g�=����-�����l�aL�i�PE �Ν�N�|�i�T�"=�p*�&��������x��~j ��a����_p�%���џjA.�U��W+��a�Ŕ�gK9	�U@Ѱ�(����H��	�,�0��D<���0�22�u���I�{����&`�LYz�[�9�h"�1yc��K�D6E����sM�o�7O>[D��E���e^����U��tB�!4�}�4�!H�����A0��q[�(��^	 ���/1��m]����w��t����5��]r�[V8!m�хq�"WPZ����y48�+��b��d�E`6�HN�!:�f��L4�I���8 u�Dg�)\�%���vuQ�W�idq�a���+���T��؍q�"��aB;eϑ��bjf;��J�&Ƈ����#���c���r!�7Cf1b%7Ţw�\��l�mj*��Q$!���!<���s�Ђ�|oJ2ԆГ�w r����%�!��<{�g_�ڄ+��@:�ʮ�.�}��f��������}�;���;����M4�������]�1�Rθ�T�ě��b�0��p�Qt!U#}<E)h��+&-�O��W	���fQޏM�A��}#t)?;�7����er��έb����.�����9Udt�%�I���xJP�i�263�dS�y�u��9���?�o=7O4b⟞��_���Լf���t��	ٔ�JL=��řr��J8Fq R];�t�n��Uz
.����)�bM�4����p�9��c�^��tQ�p1<}���8U�~�~y���l�Q�� ��_X�̛�D?�h��=Qڠ����e�����,������UJ��Tn���O�I�U�＆��K��A"�H�k�u�:u��>]�9�YAz��K�i`[��q%S	q!����9g���m�0=�8��ҧB�+%7~���M����e&q;�7.����8�I,6
n�F��l�b�rzz����|d
���E����P�RF�Kz,�;�A�
M�`2!~�6m%k��,"T�i�i�L�zl^C{�^������x��E�wE��^�0Ʀ�[�s��p�Pg��N7�N�M�TFQ�aژ� ��*�U����gЄ�'l��?Q�f엉�P
f�pEea�������Rk��a��̩�8�2p��{w��G�ZyZ�8��C=�Fkb:^��,X3�	��O�g �7mX%�v��[���vӇ�~������Ԫ/��K���h�N`���9�� �l��Fa�$*���P��ps'$<��ܦ���ןх����(�X����7��^Gx�]��R�Z1�Q�������Yz�#C�nQ�3 O���7V������eYܠ\LD�T2��3�!2��ݶ6�,b�wøЁ+2i���֌K�x��3@5-�HYǆ�85�01�Ո� ��A���w9r_�1D�)��ں��B�Ў*���lĵN� �� ��b�dd[�u�[#������
*N4by�nH�������ظ����Imo�Z�w1�T��TD��;���,�K����C@s�U�9��Ճ�D~6�ZS�h;Գ��l��������PD��o��h��m��j
 U�R����G����6iN!�ޚEJ��    %�TbSɈ/(���^�8P�����6��I�<l�|���H=�A����L��wԍ���S޸�d&@�3�&�8��9h��J��� �F�m�E2�8��dՠ�|Q�hWt~%�Kz��:`�D)x��,H۝�4�iS�Q����%3�YwL!~	6�YOi%N`�K� @�q�"+��5͂$��[ �rQ��<��Z�)��Ô�׋R���&�lQ ��`A��Mi|V!N\ M��x��x�O�d����3?��8�*i�����O{n'눡iL�u$�lF_���x�Iڲ�V/���xJQ�cF"�!ƴ�9V1�>����^�+ ���I��3�l� ��@��Q�EN�pm����y������L;����/����nĒ��^ש�b���e[W��vm�;�ܮm�ƍNyY�X#%�<��򇂶� �1`�s��������|2
����˸W�M��ʩ7�@ۥﵬ��.�!fx���KZ��^�w�X�V�\���?���L��4*�+��sp�ؼLn���\٫��Iy����a]��xC1o�����%}I���9`�ۘ��p7�
ة;��~��ɫVBT7�j-��W�EU���uP�w[��ۥUfB�}�Q!>Iv����^��Q��;2����<��Q�e��\�`�TO�z����wi��� <샰���В��ސ&x��w��5��A6���+k�~s���'V8#W��O`�@�x��Ǣ /�`
q%���CP�K�?#�rH>�� <�tڻ�0YzoP�7
�캋M
�a�ӓ��l�8�B��5�{I6ı���@n���/I��c�K�{�y����)�,e�( �d���v)��*�떳'H>>ic)^`��A�����ۥM�5�������n��S�È�\;vJ�`/�n���{%��ek�P�z���$�0*I���J켟+��t��𵌒��ɝ�� �R��\!N�
B<�����Bi������ٗ���[3Yy:_<��&s��z�}���<��iX=@2���b�"��}z4K9��+w��v��'�"�o��9ּn�&����c9"�4W�(x� S��:+S�rt�]��oE�Q�1���h��^���p�; r�jd/�)^���2U:��U'�x/w�8~'�L���7�K"^�t�E����X��d#��}�=:�@��<hӾ?z���Dʓ"�'[��:����x��� d�.Y�3oӾ����϶{��a5�! ���'���ar��t9 �������ʯuz�ȥfI���J�/[��q��������
�i���`���K�b�O2�ľ���{�8g躀�viC� p�w��qF��=A�]��?����cN�������ܰ@��, ~�;� kk����	kh��<�f"��x~��(r�� l�K��K�������΀1��G W�������b�øWl��س�N��R�G��4���~|`�:�����3��.g�kw���0�� ,�5E'�Ĝ:�Ρ�/�Gk;N�������~jz�aƽ�Y��FI��L��%o�(| +�M�b`��b���ۻ/{>M&���f�4$���9���?�.�1iߓo�co��%(W�Cc����џ����PI��/��6��=@��7 �j"Fo�f��	�����	ZL�,D`?�#U��?�L8HQ82���Q�6��T�f�E�^ Bb�^��z-9���7��Tg:|c:j��pb�V0]��]j7��%�mP3�YKgMb��_!���n�Fn}����	3�Z��R��>lH��h�� }pL���>�i~��shv"d��R��
�Ffn�X\�t�oq1���7�����z�0~� Ld�L�E;����*U�CC��<� @.�)�gА����w5�Mt�ǔmցU�y��;���#S�Ό���Jذ�2,(�+*�!xyJ0��Ql�kw���۩ʠ�!�Y�0K����p�^��0�i�!�=��O�C��0���	�֊����������I+�u�c��W7^�vF<�`j#��_k]�fl@nJ��R�R�3+7_�w�n�Ut5;�i��'��!'�	��ޥ�0`�<yK���p�m��=�N ��><^N۠���ik#�W�s����{����TO����w���P���~����m�������ɎN�%�v>!p3Ǳ�t��,�)��/
&�Y�{7�����.�d�� ��q��K�(���c ���qʎ~�X��*�	M�{����E#p?��e�A�������9:G����%V��Ň�`�#
m�!o��~ק��߮d���K*�j�P�F�ܱ19s�S�}�%���Wjb��5MQEO,�/��\+f.�p_m7�i@������n���1��\s%o3V �C����KM�6쯏:�E߀Hr��0|.]z&?�� V�O��|M~�\�>�}�'�0e�{���SW��N����~?���->f��>�}�\�#�r����"J�]1��İG��'Ò�]�@�  �Z���t��2)���o�_u{N�XN��7�y�p�V����0P�"&r��x�^70a\��>�Z�S��EΚ5��̐1��"1ߪv1���'�x�7��	���q�X��^!�3Al�mnl��� i �	��UE�%��Y��㚦����g�
 �qG41	���>}{U%��t�Ɂ��q�\����R�{��}1��؀���c�цriQ3v�/��z ���@����]H��__G�"֗�ے�́���#�����__��������d�	��,&K�G���jba�B%�b�t�i��'��;��ZV��뿝*<k���D�iX~S��b�$���9��""b�+PK�PmN3�����Ű�]}g���/f���{&"1�?n�~� I�|pQ��3�8�o~τ�E��L7��AH�&�{��t
��B=s��G�.<�c��l�P�>j�%S�ym��%������{�5 ��	���%,a3��}�L��tS�+Z��vO��r��E^�<���E�霦��^Bd�܄�m���%�:tW�������S�,����)�x�6S�6��g�vM[�q��S3�}i&,�A.�<�7v4Gx�ML��a#�:wK�9��8�ڧh�u��F�
��E���M�0k=��_��T�u��q��>�P[�ϗ]�8њ�ݷ�)�R�BH,���q�������P�c���q393aGl�)��pOSB
j/ЁX4h8j�l�sŃ.�_Rw>K�R����0㸋Z�b�Z�r�	�~�x%��#������	��,e ;�64~�٦td�`Q���(����o�,��4Re �G�b�o*\��Z{hq�3�0��3G�"̃�	�gRY-��	��~}���&�,���6UE��k0�rӟ�����xPt�<�{�CZ_�[�	�Ņ�����b�R|�1�<0cS�q��7��B'��S�lbqp\��"���:݂1�רFb2�y}j�;�PV���c�G����w�X'@���$$�Jx9v�Ÿ|��y"�H'�����&3r6��`-R�3p2?�����5Ny/��C�>S��9�Nz��N�~&�N�v.c9�Js��V��{��i�1#y�l>�]o�B �t�Q���Y51�hk�T�QڤI��X�bB�&F]�4x��GR��(n��9���ڠpd=�� e�M���x3�ԥ`l�q�g̟��Ș3��~3e긕"N��!�Bcrn��_�Gl�1r�n���P�{7�h�^y��n��e��>7�)ko��K����ܙ�?�LcT�W���=pXn��Њ�[Oϭ�������n	`�t�2���SZ���α'�`��o��"��5��{8]]Gp�R |nM�l�8����8�w�T�fr(��đ2�0@�9�5�E!{��C��9n^Y
WX@�ь�f�񃚢���u��]1���CLz��,�㼕Jްʈ�ph��8    �����r�M�mw�}�G�,2�x�?B�!�
�����jz��c}��1��]�9�^@³;�p�#QL��@���Ψྭ�=u6��ukt�`Y͊��a�f�������Dd5f����ko��j�|\��N�H�G�>�~�]���eo#�AE�SZrZ��k��[�@��X�AU��3�/���dA	cz����SKDu'#-0��l'��ʟ��[韩�$6>����6C�Z�ۍ<��~i�p�;��+������9�f�}��J SA�x��Q:I�m���ccav:I��9k�z����+��O{�D<O,C�����������?!����t��}�zJ?l!,�T��*_C�T�8���o�`Ͼ(�8����5)C��#�"�M$WA�Q��U��kn^b�������m�PnN�@�����C�Ԥ����?����Y9�t��	:�k���C�,!$��0��H��zO���+�M�U���.8���6�~T� h�(�:�p_!g��@���n�d*ǟq��}@͕�u���1mѩ��P� [�g;� Z&os��CGIo)�驑5��^�N�ra��7aZ�ʌ�c��K6ҧ\{M^pV��=b%:��?<�"O�a�ME<��`x��!n�b���(��ѯ�V$O~2
�Q�(�G����p2z�鄾|1q(z~nd�8��f0�70CԾ�#w5�:Х/�ú>^�LMRC�Q9)�W[�}7N�:�(9h:��i=iJq�j*&Mʲ�e�v��+w�\F�:/���v�F?ּ�P{J����R3^���/�ί�(�;NM�&֚��#��i��%����֫Pá��d&�yZe@�:W�jr��!=q���MվL��t�#���
P�R���z>0��cV���3&fWj.P7IQUb�vLT�l��0cq���H��k=�:v�E�Lwj��r���*��]ӍC 4����ʆ�r��OR�((z���3�K�c�p�!n��F�MV�%���a��Ů���E��z�giq'jw�8��x��ȸo����6�����Tqp`9EB�X�g���;wn	'W� Hq6�m+"]�i)F-<Pp��lYHMMYx�lg�T�/&.z	�r|l���{�Tfs�5��Bs�o�@Z#�T k_�7'.�_lhq�8�L�`��J�//�*���p�y[��r:T�i�K�]�P癥q�,�&�:�g�:آ��EX�^L�c��6�=������]����2a�&�e<��#v��oC��e�;>�)��T��آp��`�D��(��o}o�w&��Y_�pvػw�/g-6-7c`���bcO�=̧=�Qjs��n�W�_?n��d}�(zN�KN�8؊^1XT���֪�3�T��~������f(�8��rY2��@�?� �b+���ڿM@����\��m�c�e�8��m&�}�>(xQ4�]��ͯC�^K��Pv�8,Jӧaѷѝ�����;x��0�ԐM4�O��[/њ/�p��L���6�ް�A���|��VS��ย��	q\�z�F�JƣW{T3�}�C��q��z��)���e�q�3�y�$�vf0O<���B�c���t�`(ԁ��tg�t��7Ł1��&� D9F� ���K��\���Z|�Ӵ�Hہ���P}�U\c\��C�]sM�&H{� ���/Ҫ�c�%KZ��-N�HT��C�C����ff��r
ǆ8qْro�?�'�bp�fh/�M�6��8.1KF@d%��9�7���*�Î!:ߴH f�QU���z�89�_�V��T-G�q{OX�vLp')3TϪN�TmO��A�U�?��X�G~xG��K���AF�*��k\����m.=�fs��M���<7J�jx��>Ǹ��Y	�Io�p߀���A�}�1�֛���juXq��h������D�4�xS��Y��Ng��o�B=!/SU���89&�6�ا '��M#��m����B��r����MK��%η�eڄ^��zY^+.��w�wU\��S�q=��Y�#�%�Ò������vK���B�CY�A1��6�-7]q	�̈gѕ@��Ky;�y��@c��ɰ�#�2�$�ӛRa���l-W#VR����֋Fn��_��[�d�hc�ˍb_o���S��I��#�.N||;��W��G-�����M	x'x2�(7֍��d��~H���w|�"6�߇��$>BX;��5�`(�����"��s�������$>����f|��HM�?@�u�X<�,�)�$��>�Vw�0�rw�O�&�G�1G�El�?"�E��ӈ�����~�k?̱j�Kp=�2�S�,G���b-�Q��8�)a�!Xс�Dg	��:�����Ӑ����y��@�*����tt]Wl8�`��eUe#j��ġ�^D�����D3��v1�!�V�%q��ߌ��ۧ	O>�������aWi�ShM�=�}p��h�؛��So�S*����Ӄl��Unr7���,�p��<fK|j笕b�k�YJ�]���'ϟ�7�K�0�k=�#3y!���M�^��,O�8�t/nؐO��?@�ۖ��� �a�J m\:����&��%�����?_�;(�RT̩Y��ϫF.򩝝�j���|xY6׻�M^��^��v�5d˒(�	B����3o�5{�8.��ԙ�(����K���.;B���&B�'�S�!�W��'�w;!�2�ĥ1�������a���Z!���If)��B��D&���@-�4��x1S@q��nV��a��!n��v��#M3YMd�x�S8��ɺ�ks��2X�gj��դ���M��^� �"g��p�6V��f��KxE7!`�2�:�oBs�"6x��r��dmqd�f�o{��0�&SQ���S_7��y�����v[��#�r�һ ���K#����d�r�ߙ��rtK]ur�Kv7V��@r��)�#���k±��x��u1���`�����Z��6���4�Ȗ�<�+1��@U����wqOD+<_4�$wM"sG�vRp�N� ROH��ɷ=�xR��v��,�S#�8f�U���б
[ȸT����SE���i��=z�_�z�$�X���L��v��x�*񥼻A6eW����W�d6ࢱ��t�n�]F-�ۤ��gƀ�2�:7Y� ��x ^��J0�K�:��ܾ��ZZE� ���؏Y����e[�1P�׏�L�H�b>6�J��U��j&���1��J���һ�$zviJ	8k�6^)�f��@D�����yEW0y��A���'^=������[+�x`�ӎ`�d��_ӄd�]�RnN�qL�[5]j��!Z����,'�.���6���& ��y�X;��{O������ã)kN+����H)����q �6�Y3���UlF��$K;�4��
51/(���,8c�T
�I%ӇG�K&���`[E�i�x��x�SZ����TA��b� 	^����WN���a��/sT����^#d2j������z�	�T=��� P��W@��/Y��֙�o�aE��_���=���B��� ��3pz�cد�5� m�i��pB�f4���7�%V���u����AM���O�/�� ���]F�@M�~�����9�t<���#6c��įe�C��tY����]E��ޫ.������w�pI�Vjjb�Q���d����������q�����>Ϭ������|l�?�`�aτ|���@w�dL���4t�8A2E[�p�fG,��f��z����pyq�zK-�<
��@ĩ%�=�{��3 �=PA̵���)V<��{�h=�����"�h�� ҁ��BRc�ؙ���L ~7ڍ+U�Dk� �����6�E��[�Sp~������~�6i$�*�л�*T�$�]��'ԯHOgd��b�+!��l!Ί����_߳�A����@�����H�.�Z�u�];��c�M�=�ńZ����T^ޮvaR�m�������q�J�ױ����Ň}�iwY�k�5�����E�    ej\�ҋ�Y���Y1��_]L! ��m
}�/�l��܉&f��D*���w\cƀ���lbۓ����ǳo��g�X�K�|�P]��+jlF�57�w3�}{'hF��ʂ�s
ݵ�y�3����5]�P7�TS���c}9Ƌ��o�
���n�{L; ����^*�*I��u������\d�%�bLӊ�xl�{e@���q�KT��eZ1M�_��s(� �=yNr`���]��6�^� ����  � ��f���H�S���}���:2p��.c�6ly�I�WK1�"i�< �"��YQ���xVhU���<���9�]�2���;!g��������P̬F�tZ5�T�[bo�I`��=k�NEcEwm��{/�ps�u����d��y w�b*2��mI��m�	��aՃW���"��(F�����0�V�l���*;�v�Ɓ�O/I�+2z�_��ȽzA�&��@m�����ȭ���i�M��̂�>��6ӗq^L#xh��<�Fu�	I�/i��S�*8ķʩU{�:�c&��n 2�[y�"���=]����'O�;y�=��NrT�܎�j
°���ֳR:u�7����t���s3.zt,�K�0 �a�]��̙s��� R����F͛7_��J�P0S��R*�[=No亞����i��Yݻκ�%ݧʒ�{�Ċ� g����n�T�Y��?��ыԼ�7?\��s�VKE�ua���,g�>ڨP�xHo��������q��^8�X��ctx�xoF�V ��9s{!쑞�z�m䊗��}B�h\����Y�i$b����z�~|4��	�!ҫmo
�����b��}�Rb�5���:N^;P�AMwb�!{�pg.S��4~����n7P�ȉn2g W�3�d <)%ՙ:�N���PT�ƏKs�  h���s�_�}L���=Lo�̛=��IV`1e�c ��T Y�i��4�m{�n�D,�3^��Y��N.��0U����N�1U�ͩ�{!��6�#G�R�e��ո���s􇊍*DW��:���18,#��s�H澶��G�2^�$X�����Ys�<��H{�6ib��(��U稾�9^Z��6C�m����%5iZ.���O�`N�`Ve����J��.�4�PTl=<����b3�@-e߇��7mjP k
�����a(r��\V��o���V��x��݅��1��QP}>ȍ �_=a�/�,�%B�1���P障��lJM/�0�H�m�O��P����k��nW�w�PUn?�+8�8	e���c=�/q�T�A�S�i�%�}UX��O�-�CK����NQɴ_{1��k5ʹ}�����L�~yc1m4!��U�ӛ(
�a�;�q��A:x����ͽ�L�uZ
򋐉����紦7��K>���0��6:S]>�����Q�z���g X
!_�^�^��dImT/�0�`+U�D}�����;J�����<�*Br��kt�\I{�E׈Zθ�N����U!�v�ì�H,bC�ǇU	���m]����'
k�п�yO7u�~��/��:a��.1�s�� p���mN�E��/N���;��%�l&
��� J�˄��d�rF��cV��Mc�R�m����J�����;��M�4�	����;޶Q��#��Ư����w�va��>�=�~ ���B������6�����S"�t+;.���&W�L7��f��A�1��(���#tm��������?�7��C|%�����dA��>�}z/T �G�goh�rt��M0+���X(Db�2���Ϧ�{��� Q��Ǘ�J.��+w�bA#�Д#����A��_�Z&�s�(ҒF�ő8��BWws�(�t��rǾ��n����ɜ-n�2�:�R;#����S�f��<�QaX�h_�rg��}�j����\qx��-��ot�S*������U��T��cN���p�@I���(�<n�9�^�i���%N�>}P�}�Ɋi�Q�n��2�M$�z�*� ��4^�c��Ǵ������4�"_5�_�s�!�XyJ�͵��6=�W�p�j�=�j bB{�)�nVPBM�����e�>`'E|ͫ������f?|�x���h;�f9�8��KP����(z����6��������5�H^�K���vzK��뜉^6�c��-�r0�p�'�"b�]A ���#,���k�����g50fKr�v�W�$���Q�:���s���og�ԑ?��g�o�4��a���sV���1V֜7���D�?���U������G���v��ZsN����^e�<����.8ӈ�B@�]=٨�ǡ�	���g��~�1�z���i�\�+�)꿵]���4;'��e;>+Jx�NhL>}�����)��G���h6����,�,iH�S��sH,V���(�A��Vx�#�69�K���&�p�E�c�۸K6��x��ӌj췪oU}���h��(�Ѧi@��1!�j,�o�������4I�Mk�
!�osL� j
Z�����S��ʴ��cx��W]_�K�3i6�y�ӳQun� qx;�.i�Ykwhfʆ(rJ��5w��S���R`8�.����566�A��ӸY���4�a8A_lw&�1Zy^{����M����y��l�U�0�3�'�`�yϯ:�z�k��o�*�Ɓ�0Y(�Tшߨe�#��<�2zqK��	�:[���4;��5h_^�&0���xyz2��XNPZ�i��甌��۰�.�&�]�8�z7�h�� ?��hN�",�{�hdG)�)H���ݿs�� j+�~��$���{m]�"`����͍*�q|e5��՜�����>��Un��`&S誋�)Q�O�m\�e �n0`��_N�X2��X�i��!��� �.']A~����@�H=��ͽWm�l��l1���@�k������E�C2TM���g�]z���!-��j�Rś-��F�2������uG�'�wRYf�	��`�MP�f"��#�-=|�2PU�ꉃ/�JQ�R�'қ�k5çF&�jӉ�C�4��(I�9�iS�G��٭��:�c���[�C��#&}o��O��Z�>�[-2�*#��P~g�>��O�M�	��~��Q�6� �ˢ+X?�vSB�w�H�~K[	i�]`���5(&3�ˊ��A�ISk�]�5�]�`}��Dn�1��B����G������W߼�������16�N�2v����ǿ�����"��s8�^�s3:�R��%~�X�Qֱao��BAAF%��� ��4���n�+>�d�e���4��ul^�*d�"S�X�M��B�a���v��m��X�y�����8LNl�4��V�xBe.��O�l���_��/1��������o���#��hǐ:5��2�&��4�ѻU�H��t+Oй/����h���RbU���]��5j_��,�:��a'�P�z�d�t&�$��^v���I\��fEa�R8�p�M�}��&�i�����I5m�|�i�[!l��z[�$�����Kt?!!<Ҵ"Ay�s��Q��������p��!�X���g�̉��b0���w�O��x$'�T�߁�'"�cB{�? � +��Y�%��ܥ9]!�JQ0N��)�������"U�=��|=4�ʊ�"�26�nzsv\t�3���	��+�H�S%�\��S�e�P��2y�R��x����Ie|0=='��;GN�Z)eb��g`��l�؏�[������b�|"�VD:^1Gp��5-�)O�(vYO-�j��厨�u����hcN�7�> ~HSрvR; ��+	A�lRӭ_ޒ�AÝU����⴩�%EB�X_�w/�`�4�� �o/��C�q.�m�?�MR�&�X|���g�&��5d�@�� ���3�n�u�D!z��S|	��(<_Mu�Zv��]|y&��8^��9P��B�:E�k�N�-.��/"�kf��؍ߛ�"��Ȁ�p������W�0��/Ay��vz 6~ڱ�(p,�D���E    #��KD�S,p�����!�UU�v!Tѩx�r�⿩~!nw<w9�B��@T1Tu��	0�?�_�7=��G�Իd�^"&��,nH��G��^(��Fm�`�Ϣ���=;
�M\����r��ŘYl�"��x�Bul���v��k
�v��ށ���S���=NKMΟ��&�����!<�#��IUv�B ��h�4:�EZ�g��S�lw�~l<�J���t"�)�7|�`�w*c��.��ۡY���6��V�.Xzr]qY��!8k�Ǹ��霂}�/�,>3\�q��MzF��h� ����`}�K�[o��P�#�\���c"f�Q��;�?��C'v܀�<��s1��D�8��ݶ���p�8��q�m��C���0 n;�ʿwS��>���-��o�o?�l���\U+;��,}2~�����M �����M��t^iC��aG�ٙ�ձ��9���ӋǊ����d�o�g�X�`�S��7�)]����C�8CVIh��ɺ�V���b6�.��o/���� �j�b(ZL��s"����\�]�2P�� �X�&�c)G�u�x�6SʽMF���EEh5��1lq�{P͐n^a�x�ӯ?���DK�вS-<5g�^.�k��^��vC�>��3��#�W�EȸHC'��AF�S�
�U�vx�ӪY�Sqj&�,�%k��]��p�ϪC�d�M;�u�#�],)`*�����&����n'��¦�� ��8#�N�V�S�9�x&��z2閰e��۸DLx@m�:���2^��}�֐"�ɱ��W�*�y���]�6���B�jSS�J�!s���,����H�q{F,����U
���v�+l�%��q��@0��qw��!�}���<�S�|�����dJY1��d�X�\�e\r(qQ�:�.�t��lDڍ ����?� �"�i`�z62Ո�
��:�v��:��dDw�Hd� ��]Ʒʪ0C+n�N����M��Q}	\��� ��-?	=��F��~xn�ŋ*4�LXK��.��H�$~�.vg�@�A}���A�6n� K$���Nf���dܳ
��{�|aP. �K�l��Ov���u;jE���*[�
���SvL��P���+(pY�D�Tp��\��y�5���gs����6H�M��KA��W-�i-	�JF�M�D�s{�S8Mwv�$�T
"���rf�X�j�:=�܀���+��YP�|f�ː��5���̐f7�����L�;k�L���l���H���>�۪)�kj�}Q��ۉ���鹶���3�i\�Qd�/��L�Y��CwU�UTxH�Y��1�O�(��i� %v��ޗ�	6r5�m�Y d���˄�
���A��zH�`���;�����?�~d���\��|$��F�k&�B�`<7N�4 '.��v
���P��y��0򱲞��������A�?^eM�,�фf��xL�	�י�^eh��"ze����v��
�e�0�11o���	�� "�P#ܡ���� �؆H��J����ҧ��]�IԻ�2s�_ �A�	"q|�#@�Ȣ��HB����B�Ƨ�Ǘv���px0Y�qC<��w�~��mv���X޿���</
��Ć��.cc�m����z�Xk@A&C'(��Q.�]p>x��K��|�[�˳Nd��tq?$���;���MA?T�V� �^|T
[�.c	ȣ��O�,A��	�`k`a,"UӀ�m�*���)��C2%҄w}�$����C
�x�t\�jͧV���S�RAQ����x�]��r����p0Q���/g�JR/��B� �J�PH�	��_��,�s
ff�$2�E��?�#[̥�!j�J��R;=Pӷq��D%�PDO���aG�mT�a+Q&�s�Ts庠4�F�H$�j���+43�88P�m�/���ܑ:]�FϚ�ۙ�����!�3>[|}i�Qi�"�N��e�Ķm�MS��R�nP^3�%�YU6WA^��Ŀ.u�+���N��k���j �<+1g�������%-�J�������y0�0H���d�'�������\������(tUK`#s�i;�I�m�kfT�h�Q�[P���%�RD�xWw������H:��e�+P��M,o���4"��Ɣ���bђ�d�G�����@���痰���4�'�h�j/*�ws�[��B�bɅ����Xh��4���G�{%Ё5�Y,��s~3��m�;��Ȳ5j����d��7`j����4GҌ1q4��`H��D���m^�X�����n��2 5Vw��(����IL	W{L������yE`cࢵ�!h`��B!(�o-� N���L�r�����
D	a5ʃ(-�`��x,E���?]VE#�yV���"�J͵���ڇUL�5�I�za9,�x��@4����9B�*��[��}�J1)'W|����*�`T�� ��������Җ��E�M*��r��
E���GFLd|�Ej�?,�X�m�a���S�)��Uk�Q����&�\L.�B�G�y����ό4�S��Q��X>j���J�2 Ju�x*��~b��0��,R��0K�%�"���YZ��ROQ|[h��/E)�6���D�|��c�+�IvظJN���]��Ԑ����M����CóK3������~zAԾ��9R��G��X�ʎ"P?�fU{�����jͺ�(B�����|{"e̶=r�h6CMk`�����JG��!O�>>�x�[�؉Y�x{bIu��f,��#o?�w>��-��֗fڳ�T���͘��N��	ʪpN�WNv�!=@�2Xg5p�1isݚ��hDOK��a# �_�����"�� đ{G����F����Y�`&\nCH
J$̴���̚蔃��>��x�!���k��ILB��<�Ǉ���xx�T;�M�/�Kh�\�9Q�(�!�w<(V�]u+x�C�gV�SPA�C(eQ�&%�ў~_�V��%��Wq�ȹ�;�I�wcqmd���a~ϫS�`lc0�d�v*>�rʋ��V�+5$�%�;c2�a�tBF��NB��5�Xʘ��̠P�lC��j=�����������	n��	�9�\rsR[1�T�w̵�gB	-A��8�%3n\N�1p�,�T�X#�V�R!��{�������W�D�H���pjNT}>|+�;;��{U*���as������T���ysg�C��sOb��&+��M�gJ)���$���|n ��ސ�凳�RP�`�❮)�b=J�F��,w���n����w
����v���\��@�D=�Bdd:��db��nA`\�a�_�H4%
0�͓ʥ��v R�>�U��o��*M��]��ׯ���0�=�~V6/(�%n�K%I�_`��.�ݵ*P@�4>��{�Y�44�Plݑ���6FeR��l'�FT�gV�����Q�,fw/��~<2'���Z�e�i��^���B��v)���`+�G-�%���y/�gk0"����O��۲���#«F��u�����4&�'� �#¤�4	�%��I�F_� ��s��h�ݪQK�UP�����Ju�!j�`jf�������0mQ`�\Bs�.r�ziYM���ީ1nb_!J
�"�q'�)젶*jL���pJnnm�$p�u�O@�^�uN-J��b��P&��~q����`M4�9A"l���~�B���%���iPP���.����F����+k��b?`z��z��B@ңd��Hsې�6=��G h7�Y��ŠTrр�mp72����a{x�UH��ex��Z��u��;0�Kp�ÎHo`���)�|[-���/Fng��mmʉ�C����H��U\@�`�a�X�j�\�����aiFi��z������:�H��q��T� �2���]-9Ǟh�vL�)R(��dn��͖����Hzf2Fp1�� w��'?�$�����)ű$�\!�6�*Kė�Aar�$��~/e�,�    ЍQ	-���R�0Xi��@���P�5m�ƥ��]���=���N��f��d�Y�Rx�s� �.��������ay,K4��D��3�"�7*؟Y�� V��Rܹ3�����؉��k�k���hu��#���Q`��
��,�HH&�鳟��̬%�K�%R�'A�?^�w��ä8��j�y'��xP�rD��; j�j��M�Ƞn���;]]
w��?&�=�8�v���G��I5�� ��a_O����^c��X[Q����^�^Bh�y-�x �O.=%�n��ߝz�(�t�_�8f-L�����c�.V��-�L�|���ɨ���UV��7~�`0����v���vѵX�5�=p2�f�~�(q�p[�.%���f�Qp~lOA?��7D0S �J-�=4��ߊWVK�b����T�������Rb�]{�"dI`#��&R����K����;���r�i|��_C��c���J/p������zZH�(gU�H��" �R���E�5�uV��urDb�?bf�2��?�b���=�_~l�%�8��e^��륋�� � +���{{(Dݙť��u�1\K��ͩ������5bb��3����� �$��~wZ�W6��M��=v�;"�l���C��y +�˨�b�	E�P���oܲ(�5|�S���;�&����ܒ���O�B[���S�=��1F�
a� 	e�_ΔG�Z~3�B)Mv�G�����E��z���jQf�
�߀�-W��ě��nʗE5�ݫ�IoD��j,u v�f�|A�_�Dr1C )-<04
����HU��K�13� ���X�|;dJ(�*Y�Z�uSC��p}؀���Ğ��/`[�;	��qyA$;Z��%�I�{���=BHp; :�/Q}���ʜJ����<�B
k%T�3������A��g�S2Z08�70��~��O8��֫jo%F�0݅#,e��[�����U��tLu���ҧ��<�{W��.^Y���;5����j��5���q�8�����[�U�;���P��c�h��Q7���_�������U�׿�f���Y�f�,���E7C��T����J�5�H�3gQ79���������Rv4�G�Z��-�@䱐�Ub�֦�ib���h3&�X�{�oM�?,�E.��Ό���H�oh��a�vqTC�^W�� �c�_cu�������$�H�/"N�����a9M*���5���e�	��r;,����;5XAG�}aIĘ���{�eR
Xq�%1�t�/_BhD0�E�Y[EB�U�00���h>V�e�/a_ٛ����J�F6�U�3���t(U�y��|8v��X��Q����
�X!hR��9�(#�^�.f�q����C��#�E5�H�h��3�҇�5�|C���X����V�`!�1S F�$2Ij>t0�	��f@�����aZCg�;�������Q7wR Nu����E�{��ls�z#a�'Bɩ�ޟz&�*=<��j���o~�x��)��H���Gl��K������P��k?DUÙ{��%FbB9�)M��s��B�}��^�m���1��0?ݤ~�ż�B�0���G�g�3)�}�D#��> ��8���~=��=]΢��D�%�]�*$����Rn�\|�
�$'�u��=-����J�W��ijрksu����%�:�8��Z��<Dɪ`#]�0�!�\�g��]]���-_GT[�o����kd����5�c�I�����惻I�	����a�_uNc|(�aHaγRC��F�[� g�n���T�B�d"���Y��+F���9������V�U��0=9(SdrjUXO��n�.�`�V�(-!����;9 m�.��	��ӛtģN�}���Ӝxj�kM��==Mm�ZG�hF����H�?;c���L�p�vW���\0[���0͂)0��m>0��S�ڇ���wek�|Z��R�Gո�����)��#S���J�SE��#��)"�¶8�l�|�Ԑ��1�@�>=�$8��Cm��"^?4V���pO��.��/�pww�'y���l2�a��o�U��D��g��e�i�~�&��e>J�d㺌�oYK.�oY���a��_��\2U���6?�%8��j�}-�{��@G��~����'�Ho�!�A�8��Ļ��`y��t�R�A���.�&�ԑ	A%��XR��v5o��gŰ�N���%�P#\q��|.�!m�Cۇ��#\��q:���t	��	��_��
4̗���]�����-v���ZK���G�V��V	��D����TVﾀ:9��x\�^���T���+˚�J;�d�_���c4%���Of�=�0��[���#�)p�MD���"&��[,1���9Q�C]�|��h��0L�;}����[����I��j�S��h��btG$�{�Q2���ջ��q|I�/P-_�'��tY�p�V@k�WD�D�$]Qk��@AԿ(p����sJ �@�%�E����uo��	5j�g�{���Ip�w��U����
�B�����Vk� 
9���
�̣�
 X��K����-)�tF-G!�+K�)y�{U{�\��q�hXB���=���H@c��x�~��b�P1�[�v���+K��_����`�Xl��]��b�4��u�e��&��C�3h�`�c �l��5=��/{����G8a]1�zp��a�f=2@nB����k;C����@�H39�v}|��& �f�Yyl���،B��7?g�[q���=���a��$]E��-vl'Ֆ������
%ȿO����xY�j#��_���fW�@�N붴rҖ����_-�.�>Iod�Љ��#d�;��
��ZO%����䣃�i��U��AѦXy��-��逢��&��r�Ir����#�O̥US�m���Xp����~�jn�^Q��j�me���ߞ�˛?44�qU�u}$�f�����ϴ�-�����ʧٿ;���I���L���;�ǕM> ;s��w�.�"~ֺ���|��@@mx��&|l����t]\=�H����d��L��R��)��O� �ƚŒ��uՌp֕�d;���S/�@>��l���G���̌�UY�它���L}k=8���N�$h-v��˘\�P{o?�Eu"���Y��T�%Z�������f3��_�A1�h�����W�F�q��5zޯf55d�d����7�0�u_vVw�Aإ��ܳ/�����1��~���v�0>�C���:Ȍ���~��Uh��H�-Ub.[����/���c�C�hQ����C<$!x������ެ��j�"l�na��1~���d��b�~��_L�n98(��m%�s�Q�����
�P���4���L�1!�Q��Ѡz�AIm��)��!So�P1���fLY����6�s�iC8��1b����#�K+㙟�\Mſ�Ϳ�OE�~K�#�쇠�N�ϑ�>*@�8���"��D)�[�6���������0��Z�'n۰�M��ҹz���0�]�� � n�Y���D�a������E%�Қ�%�I]�ɂ�-����t\�u�ȜE,���1ji���ƌ��E\�	���w*���&�5�&�?rB٣��Qͺ��f��s���j��Z�a����W	D�'j�K��`��ڳ��U̹d��x��򛡿�g\�����$���Z�2%Q�����Pv#yz?�E���,�:��^ӯ&�ި�H�-�Z�5p���26�K>��TY�~4ʹf~#�(���ɰ�N����f/� 5oN�~�ʂ�gN��m��Qh�>�Z�}x�E"lY����H�*�t�	f��hh�༵i�Z�?a�d�c�\O��#����Z����O��p��`�Aa�}���;,�E)�;�o=M~M�!��Z1vqڌ�d�Si�\=8�03��I����8 0����z͠��3V\N���W�����+�#= iH�x�l�Wqg%UO`�l�-,S\�>�<�����<�СNܞ.5"�R�~6�L�1�d��8    �:yYF?�������
�<.�XW��`R��6Cu���J��]��19<ˎn�HIE�:���^9p"�z�`�5%����X�W � �,Cr�{��Wތ�e4R��Rh�� ����1�?���oR-q�P��r���Y�D$�b�N�I]�Pg`?S[��m��T�h��Ց�9߾��П�-Z������qUT� ��h�`X�C1�XO�3p���9"jD�����)v�ְ�ߠ��ݙ�ɵ<�?>	S��Q��R����z�&s�@$�]�=L�H��ҫ�R��)�#Tj>z��@<8K+���]-��*�a#�誇Ϭ�Ԃqsb,ɩ� y������'c$%�1s���C�`�A��k�H�,n3��ɠ��e1}�.(k�VE�� �X�> ,��E���f�pX�>�7��C�(Y�>6��0��[|��v��M�%/t7���4[R���Z6��/�t�G;�������>Hxov"��ܭF�W�/�b7	f+3>�2�bRي'�vX�?�' ~��Rb��ړ���E6>�FB�z#VF�n�RSb��a�����Vf�b��Z�b��[�8{�,�B�h��GF� �0�\Hm�e�y����1x��c���G)���L=����yU�vE
	�'�N&����ٜ�v��H��c`uK�bt+w������H��]�ɓ�8�v��ԢT��~X�@W�[��>ٵj�v���D��cʹ�o���Zhs[���5sV�^i5���;DZܔ6.�����܈G�,���V�k!��ʤ��Lr��ÎnϹ� ���:9�	���1��z]�UT!�&���E.�������.>{?��[�WjV~p�j��j��1k����&Z$�6�OMp��p�Uf��)�@�H�ot�5��wfc	���ׇ/v�6�A���xc�[+g���r��;Τ�Q��$�Xiy7/�խ`�x��7�U-JY�,�|^d����@��9�hU��4Y��e0��oN���L�BH���$,ݿMO���C�|���us���Hb�gp���R��<p!��[��x�(�ቱD�egb\�i�z�Tv�Ux���ǡv	��!���{A-��_�͑�ה���cKm�3\���-�(�Jޣfb���୽\����j���%\��'�������8��ۊIԶxGӆ�����fp�_�M�e9���u�n+u9эy_[3��Z}��mZ~�
�!k��D^#5fw�)զ���*O;����0_�:ū�XL��b�iD�D�X�p�1�E�d��q�,-(�q��)e�O!�-�ư�*VI�|�>�C+V!�1�ܵe���Ք���j^I����қj��.(���#`�VQ��-3�gK��d���KV�+�-�!���E|�ǰ�|���4�HJEls�`���Q�P�L�:'m`}������B�+�4k�K���@�'ssg�M���bcF��i�?`����0�۪Mq�N���YٙQ��8]��03�<���`�˽�f�x��Ǔ��m\��P�l#������u�4�f������8ƚFN/�0�}�mOc�����BNuw��э_$[9w�q�qZ�7���C(�z�R�@�Wǣ�*�ط�i8Ϙ]�7��!���nR�]8���+�M(����[;j�P&�Ok*H$�Z�7�9��R��.��y��"�����m�U����娔����~��A0]-Y� ����:�<���������2��SX�s;����z��Z� �Q���	�k�H:���'��U
f$��r��>1��M.d�����᱀�"��Q�����r�w`l��E��s	ߎ#t��R�@�{ ��Oos��>={c����EZSf5�fd���H�j�����x���r�Ʈn�*di9T2_��
��[[�2×������(�{��F��0�:�n6z�����.`�k��#�TڋX)Gy��R��c2�-X�(� �盧��@<V��Y`�w}r}W%S�����,��<%-��K�49�-b���<���kuos/�ÝQ�v�P=n�s�T��cKUP4s�Vm�Yj�t�m9-����_PX�a�<{��A�����_� 	���u�3Y��p�����=�8�������h���S���G��\�4�D����h��Uz�������(à�2�r�[p�]�^;����N�B��ʪ�����k�'FA�cPH� yXd$�������D�_�X�����͑��У��4F��G�ĥD2���z���;�-�ʿ�Ი�J����Q�I1۩D�5I[(�>��D�!ź�j� ����q{���7K��9<�	�گ�n�͂r�rmW.D�e:{+WPx8֖�*��/�h�1�aI#�&kC�'u��TZo�V��r;͢ #����'k��)��~�T)���4.1?s��Ŕ�_X����~������j�I��K�d�0a��o�Z[�v�O�*<��ko'C��!
I`���"�"���l��GS����S�L!A\Hǳ�o�,��NI`�Բ���jRhhY#��tW�
��4$j~�;8gi:_눐��辄d@��0��XO�~&�����'�V;
7�l��a���R���K{K�7xb�%D�����k��^tR�W��Ø�xFqw�sPR� ��YB����?*wf����`dcOێR�7Wk��|�'�D�-.���U�F����N�A�A�ܩ�?Mv�[��e|�r5z���h�7���R��)����t\K��j �e�Sw�������`�io�9��>���^�b&q��/�����e�c��i�w�稏��}.�>�r?uq���}��դ4�RsA�(@�������䶤�M���#έ��>�0�����T	���{����XF>	��&��mHj��~�$��lRVQ\��Ai?��_��e�֘�y�"\�z�o��2E�����$٬��DBx��L�_A������Zk	��y��00�}�;���>�a�,"9�&A?����ܚT�������p���ڿ�`�G�l*L ������AU,�~�_>�eD�Q�#�\2,��G�e' ���_���_/�1DN �@lD�1�4�OgX���JE�ڭ4���%)�V�p9��s�O�*%�+��
Cxו�`Ln�K���+�,h�G�dQv$��HJ���>��w�ڷ��U��f�����D����ɟ"+W[��["�@M&�6��xCf���	�N~ڜ�����ɍB�(�wB�}�"�vԦ�k�Y$|x���u��G������\�1����巠�����a��o/��8��ة `UJ �q�� 4iX�LH
j�#���P����2~_IA��d~�B��g�"հt����
|�x�k�VZr�EJ��!�q�U5���	1!#m�dWE��tYw��$)��̥��j1�HE��PΤ���D˱�&(��u���
�����ʯ��q���1�oz��+�:�u��k�C)6
��ڵ�I�'���o�R�q=���D���k�˗�l0�S�vV��YT"BR)�����J$��1�,g>�=]�&�ؽ3��d��B�3�U��W;k[D��v0�Sd�>�������
��2��zDw��`�O�(�x�� ���h����N�xSa]b�W�Q����{��K�i�D}��f��*�,�Q<�6�� �'ؕ�7�DE���p�E��yKtg�qz35�K�U�e�u�S�L��z�:�j���c%�� ij��_���ʧO}�\Ϟ���T,h^��#5b��x��E��Q��R'w�QP);���޽z�ص�1���N�K��,��ˌY`��!�u5��Y�t�L��5���*S��������u-�Y,�w]���}P���1�f����<G���&�u�\h�ʁ1��#���q�} �@�F95���_���ܖdr.=m��^X�U����%PP�ˠJ�F1�N[&?�AP��N��=�^��q�����1=D�x#3,{o�W-��    �68;��?_��h� +U�%�L��$�*����:��J��`���{ӱ�~18e�h��������g'IT���V�ܢ���r℣�	���_%&�دO�؛�����d�\��H~�
�Z|�md���~\��(cA�k�"�8�ی���bNzL�$T�<-��7�~���E\�W�y.�2�Q����ДFK|I<
3�u�f+4��=ٲ���o�S����(�Z�6�����t+��U�x����qs�S-�'�X�Ek3�������ᒿ���m�q�'���:�B,�O�1�S���9e0��(�J����!��C� x4��;���c�:��U/!,�?������f�t���|�QhM��p]�6�c��x�����^��x9��@"U�0Ȏ����4e'��Yzo�v���5@��y?ف���M��}��1<��q����i�w���=�����^y������|�vfn�0�3�P4(�"Í��⡥@�f�8A�������3CY���[�Ӈc��Ԉ_W��0̯�Ɏ[����Z0vs�6����!@�����qy�Ԕ��H 	��E?��rmB:=�3���"�f��\�7k��	qK �@g��ܾ,��]���PН���S1`"K��Vvwb|e�~�_�N��$�L�9�OX�o|�y�(���2i���&��T}k.Un]M2`����~�`;c�i P�v��o;\��y�[�1c���H� ���]�5��/t?��@�Zˇ�[f�����t��J%���@�ج����QW��S����iφD��������[�j��Y�����Om$8lwa����8
@KFtJ���j������h��k;��n�[�����/�h1v�rYY��XL�𓕛p�_�2=|� qc���j�\��0bHs�:�bV4�j�*b��6�g��*�jv�$$5?�*`��637����>7� ]C/\����aet��x\��/~�f�@<�) ��W�bGYV{�/Y'�+!�~��RM��G�cp`Xj�z��1�!�zX�?�-a?"���#k��f{0A:�m�y9�ڀn�j������ͧ�F�d�;*�R͟���^����c2��I�^jO�X`@(K`���c��.��m\:�q������ܭ��BC?��_q�����7��U TZ�)1s^�䠖%=�K|(盕 f�g)�lc�����I�FOÆz�8V�'���l>X�8�3mќ@�vM]�#.a�	����ӈ�CNM�m�%��W��+�hM����8�2���Ë>ϱ����6/I���0x�H�@�ۍ_�Œ<�'�S���2ͷx��i��C�/��ɽ?ubqQ����!��i�����r��\K�%P�c��Nk)d��AŐ�(l�Fyb�g�^��D�{�>o�ڧJ�� �\b�e�%��)v[5�>��
$U�Q<w'����&d�Q b��b}�`��YeQ
m�}���%߱f������������� �3�b@���
�=&�������Ⴆ��{Nۉ[^hŔ��i��&�&1�D�co?�. 9�^� ��*xzr��������*�,a�z��26�jelI@��W�O�k^]���:9���oɗ'�8a�����qF-U�fB}������j_��cc]�����ŧ
w��8�r�пU,@Gp�T�V�V@Mb����}7=�*�e7�Q�U��C���4������_���|Yz>hoY�"^�T���>��|z`���Uj[ge����.�&;|-���f�x�AeXg�xd����]��$&�)��۠)�
��[]��2|������o�����TA�y��E
KQ�<O�D6����X��'�q��ތ�I�3U<�ƨ"�>��(�} ���3�h?3�g��ߜe�)�� s0����ƃF.�&ϿC�&9��m @-DB��!�z�a(A{]ɹ��Md&*:P2�#�#{|8���T��;�������`�r�N�A�7�'#�^�O��ᕬ�ќ	{��h��au������!6�:���+�$ܳ�bO�5��U�������!�)17b�c�z]rہ�ҏ�'C���,�Ўp��r��'�1�Bʭ�c!m��m�� ���#�JA qe-z;F� �_e�գ����%����Ø���%�V`��3�_bڌ�U�$[���P��m1��Z�)�*m|��[��5o-Z[��hv*oO(dQ}��t������9��I:������ݿ��ȃ�^}���o�!��Ɔ->~A��T�K�;��'����x��P�n���c��X��\����dS�`y!P��!Ig��J��%�:��.�U=�?ձ�#G,�Fh�^ql��;�d�/����	f����cZ`dj@8��8��Y.N����g�R��z�����K��{»P��BeRŞ�S��
��q�I�Gϗ;��IW;�� 7��
Jwog2V�l%W���kY�o�h�m����A��W�ᙚ���Qd�9�ES�X@a��g7D)a���MX�?�i�o/,�m�ͅ��#T#;}��L}r���N����pv��T�䚕ܤ�J%�ʶ�&s�؆�d��^ΔĴH���������	��݀����ٔ��T8����g�3��@�q�Zk�XZ�L0��o���Ř�6�)�&� �
��B"�T�d���tɓ��O���hh1����*��[3��i��~�ݯ���*��ްJM�wZhY���4��G/=��lw_�[���p��?X����^zj�q%%\iL�gAy�i�7�ܭ�,���g�ޱ�޽�4
,!!���X��f1�����W��Ό%k��d	�D��?�E8�/َ�9��l���@�4�sw�=~ow���K_P=����"uP�}$#op�>H�m4��{'��BB�>yI�XF����o�<�Y�����U��x�b��^}�v
N��� ��X)�y�͂�͜��%�ku�jkV{�F��]�.A�oBX�&������S���/`rW��nj���W��/T��#lN膍x!"g�R�z�,-T�
̰;Xl$[�!b�r��C��"�ܽ��4J�۷^M Y�l9��k����\�to{yy�!�^�(��{�� ��M\[�F���rTaN���u�R������q��Q��������x)o�vץ%���������d��utz����bjw���Ցz�^���U^m7�Sf�-C�b$�� �����)�Ǐ7�UVmarp�I���0�=��y�b&m�y���O`��}�w@����H�J��Z}B>�ͣ�$�eR2�EEK��5���G�	5]��O,�$�D�k���F�#/R���	��I�[M��Ȥ��W2�u�$������hF��e����D
"��iK#���_G�����AU�H���,��$�g�y����5 ��Л�~�j#��ܚĉP�W� ��8��JRH��2:�2��[����TJJc�/!̨��Q��XmtI�SK�N���-q���V_���������/+���Tvg�8�}Ű�Pe�q�s�~tx���%5��S���&��u� �2(Q��>�t��dg�!�V��*�u�<uZ���"Rg��ݍ�OB+��	�/�j�c������1�q5��������Ql˜z��Ncv������©��d���¿z��� ȋ�PI�8S�g�v� ?	#e���Tj�HP��D��*O��"���1[���H�:���^����+��0�X�WM*�Ê�� yM���;���)�V�@��,�\0��jŗ!��'��?\!���[�:��c@ͫw/�cv��ƺ��TP3�$dV���Nڲ��}������a������j,��r�����6�2A�d�~G[v�8�� �?�Xz̹��b�f~�3��<]���6{`6�R;1�YP}W������:���	y@�5�{Tĝ�!���)N�U�]�_-Kxզ,a�V���3�F~���0,�f��0����&��/���EɊ�!U/��t���7���o�=��&�V@�ԝG����|��    j���Οv7����-���.�
��X�$8AyG�o�8�����2��R7��}ՆX��W�̀���O
���Q1ݽ>�⿡L�G�Ʀ�G\�~x�$0�K,%^�xl���� l�ΝvyBup	���$�X�^K���d�#�;�q'0��617��'��:�t	��B|e5:@�ř�Ứ��E�L��j�n�L'�Q�`�y��Yޛ�K�@��o���)��EcI�»�S�p�4ר�bɳY�p�z���V���*DK�am4��4X]2T*�²7�S�p�OC=&�o]忆W�a���|i/Mلj)���[7tL���̐�8: �9��t��T�'�}���_=<���x��Ý�Y�����g�c���҉�� ��2�l�y�[��e#����p���?"p�Am�_�b}�D9W�Ȼ�'�L����nP�xbV<Ҥ�ucu�Z����C��.� �#"�j�ݸ���siT�}����4��{_e�>v��o~[$+n����tC�U5jq���x�j��|��Zc�1�mz٪R�xê��K�|b?W�n,�s7ЋmE��g-���&.���]��f��I��F���~�/�ޞ�D��߼�<��bb� +��8��y,B*[��9J������&��c{��Y&A*��g(ԃ(ު�]r��=v� ϓ�D$�0�Fb!Oc�?g8X�)�XzA��	�+��!����(�FQ�}���Y�"bA�)�����ӑY0L^7��-[�.��j�.8�i�N�d����I$c �GK��"R��G�մ��k�Fބɾ�����>��l�ߑ%�[#w����Wx`� �O=�v����_�'h��`2y/	<���w���8�"�d����jͰo�:h��x�O�ç�e��j��I�#B�^�"����"]�,$�ϔ�8Yɶ��)��gr�%4YP� � A��"9�g\�n?�8�J����u@ho���RC��q���}�ۈ� o/l�C7�,w��WujﺗՍ=5 ����?�2��B����X`n��-B���H�r��G�'%Z.��6�#��u���t�υ��u�-��v��AO@}e��%������p��%0�
X��_�Uge�f%�BН�V�S�נ3v?��Z��������f�N���Cg9�s?�Z�Z�	���0���q�]w�p���
��2�Y�^��X�=���j�� #7�f��������q&��FRΤ����}�H@b�����B�Ui�D,}�c�P�G���a�fh��
��"�OG~�գ��1~��v�N�������57��o�W��c�tBG�(}�u�'8�4 4�f�z&R��(��ʢ��Xa`��8Z>h�N�dfȅ{�N�}I��xx�p���bX��P����z����=)�E������z&:��@d�꡷۫��yE$ �Z�2�V��%~��R��R�Bx��:�������ֻL�U���!kx�m���0c1sJ �3�B������jJlc(��۠y3����OZ�2#��ξ̶d~��'a/7 �\�#�>�	VBt�y74-ɪ7	���*l@�5ɭ'��X�Pa��k����}S�����^8Q�����[�n)��&% �a�e�G���<��(��o��Ȃ'TEs��h�k_J�w�_��x%� aɶP����~��Ǡ�7<�w�&�0U�/������k	u�����������ݞ&��o��Y0��q)��S�	#Tڇ�4:�o�Ux�D�?c? ��u:_��v�|�)�[X�?_/�髤�W�<�`��A�Ib�����,j$�e�ihS���q0��e�8`s|@7���7�0џmV �e�Fw�$~n��ŬүJ��+�L� ��o3K���M�_�Z���,��M�T�1��������x7��Z�����C��6˪�,���o���۶��i���Uz�\J�W$8��_���Y��B���2���*�h����I�T�5w;߯�RSq�5�SI��i`�ސ�`����t�7IہS���L �������BQ�H�g��'�n�1 �裋M�`U������H)��|��L9h+�?rl�!ڀ���b��[�]/��� �A]�
��	�lD�a���o�M���o�i�X��k�/`�)-�!믦2�*ƨ���������q�m��Y�(ZEx�D*�"�5�:�a�}�M�głG����(f+��RN�~h*+�QH$)��R	}��
��K(���M�T�x����("�`f
��,�^r$� � t�E�[�Y��8��&0')m$&V�PeU����-�B��b�j�F���;��ZU�5��'��L>��w�r���kw��'k�MU�5!��pM��څ�ɢ"9A�O����<ҡ�����=��l������/����@�a��65�	�c�5e��3ͦjcS9�t��+���N��Ǿ���U�p�S|�lB�3}e&3~�)}���7�^I;,L,�v�ƨ�^�Vv��G���9�y��f�������6�5 e�n`�f
�w��[&� �8-�m_& AV��F������Q)�+���P��<6i}��������0��Y�k�vY�QS��BYÆ8f�G�ޞC-~Y%g���;���d�A(!�"��ĂJmkEo�>�5"�����|ߘ�f�V��(��#�k�J,�TN����U�����%"^�Hת��6�-��Z<��]g��-FM���P�Ґ KP��o?��-�T�.����i�e��T��mv��p����nXٝ\����z\�u��Ѓɮ�N�z�9�4 �4��1���8��ҜO�Z񾉕R��<ALb�FL�tP�g�J v� ���u�.Q2��}9�X����,��(_�*��t�#i�M����Q�o�>"q�_�z��RX̀��G �7l�:jF����2"&7�c���$}��r`��~p��K߭z�����r�����y���(y��ǂ�@�����.1h)@�4��'o���<Dݧ"k��خkD�1>�L;��ޥ�!�|��><f��f�[�u�'�c�d���ݍ��[�����҂��4۠�*����ّ֪]���ֵ:�~��n���j�x�o^�kw��L��wb�R
eI��n�b��]��7:8����G�/6!�̍�}żZ�L.��˝vJ�*K��]&PuG�հ� 쎛�G�B�&�g�D���c@H�]F˰9	�Q� W�J�{�7����Bl=ZũoQ>O׶w�vڍ�����b�v?�E��&(�8����9lI�j6����_,ctЋKغ�����r�9��--��2ރ�D@N��Y��O��- <�n��D6� �ΪfL��`y�ښ\x��6�K��mc3K��ߍY�pA�*�Y$��ȕg�
���yA\n֮M��'�*���:���18�ѨT*�B��t��n��l���-�m�s�@��WYjj*��k,P���L.�)h����X�{KkN�	�m�T2���7�z��T�PJj��!�U�GEf:J%"�j��ve���U�dEZ!n�����.W<��tE-��\����4|�rr��tF�~b�c")c]�q*��	�����E
�s�p"w��A$%���s;����T��е�ʚ������W��
�e$,K�+Ϡ�hrS�����_�)]5�����6F���L}W^Z	;7�!3�1*� _��n�\���f|�U,����h����X���j��5����;��1N$(�X$@b��ڼ�\�x���[oP��g |����>��z����=����a�<��{K|��Z�7D,�1՟`�toB�)�w�� �Vr�La�A�z��J �Qa��rm�"��DO��y:vj�6�TTu�Z�Oq�{oF3��r0'��Y��G��A��s����G��# ZH4��RYX��;�H��{qo�0g@�$�����=L��L�� n�d��a��B��XX(!��&z�9Z�0B    �Xj��m��j[��)��4T���&���z��O�tZl��É&��_��M��$c0�r��Ǥ#�>��*P$�踺�
�D~x���ߗ�Nڛy ��(t�e����*�F~"(!j��N����t�㐢߈A���~�C���.J���>Z�eB��I@b,iA1'1�����f��	��:�����zZŉxVw�r)�̧vi�{B� :,�r��G��D�����"�HX[���ўY`a F�uٔm�G��xH���
?��j�	�4u����
��g"L �����f(�bQ
�Z��!�,�q����K���,"f��d"j7j��XlH�<Dm%�,ǆ�Ρ���E[��f��zc8D[�ߒ(��d� ��/kMm�=�'���о�_"�gdv�#/��U�9�{Yv6�$V.��������]WN%攘��IPV�.�  �C~E8
����Q�	#?����3�EV����;� �-��Mm(�z�8�`�a�zD��~s�Y�gx�$[i:�]L�e4��tLV�@�����全Q�!�r����?mn��W_=(NA��]+��?%�ҵ
tRy)d
BԠ��n�aU�����O��	�9_�mcM�Aܤ�Tsa�K/���m��j��M��5a
_�=_�� �	T*r�<Y"d�:��L`p:xj7��ak ٭�8��;D��M�K���4��}���<H,U	:���d��&���^V�w>��,�j���һ�G���4��uT@���8��NS����*+V�廱ɚD��C�n/I�0^�DW?U���N�������S���_X��Q�����bX�Q�z����f�幂3�=�i��� �o�_�*�Qt
	;'R��M��9�b����'�|[}�8���7@�*�[���o�V�㮭0-�u����	Z�1o�Jg����j5�L�a ���D��-��	�dx?~�}���bE$d��4�iP����0�M����w�V�V�y�9���(�-����_�;�]��Rی��W��
ȠV2�P2�.��2�Ͽ�8���N�]mXկv�aq��[���q����?��<j��X��`b,M&�����τfL>��P����h�#1�(<�r�`���nS+�����Y�k&zM�����Մa7�����c$T�ݟ��v\�Cx!p�H��@��B��S=i�^Ր�2�$������1{�ZT������.%7;Kd���ױ
�D-e��t`D��qu�*���b!�p�J���6������ޢ���hLv@I��0!4qz�6�Z6���L+���z�Gn����bkk\\�j.�͋cP͞fx2�P5���"��Џ��0)��N�u$����ᢓ9��w']����w�_zGXG���$������|����j���t5W��U�ej��f]�v=4AD�����B�zw�,�l|�t� =F~b"���g:7r���-�jhe�2¶����#-�H��6�*�Wh�m�p����ƳuG5�z5�GPƜCe	�cHf���M��>yj�>���F���$n���a?tA1�͏
q��OY	
�)�՘m��b�!Oc��p�b�e�V�	�b^a�Y	�xl3�e,$���Ԕ���o�5H��a#���$�flo���Pv�bKc�<ǡUf_�rTd�I*��+�6���t7&,!�[­�������7�I��e�#�Ӏ*�Cy��rҭ)Y�h[�̻����ӟ��1+����R�lU�@��
��4�AH�7��_/�^F�wn[�Md:�Ć+8�(#Q��_g��ҤB�P2\*��������#%���ͷ8����r<wiu���PAa?�p��a�Q��s�u�n<��j�6�߱l��%�9��Df2�X69��5�Q\� R�Jg�a��*`)��#P&6&�	jX��ib���@�X�LJD6I�f�b	G������G���8s1(b����t]�Jj�nr�M��iA
j���sՒX��u�7���pÃ�K�"��X�$cz�ސoh S�zX�`ꘊ�	(m^�2(�bd�'lS�7W�(����F�����r��x,�C���+T�6���4�^�@��K���˥����ԡP{�kF��7�EFgIO�mN'�z�:4��L;b�d�ɚB"�ѱg,���݇e���oA%��NVEhS�uu�b����X��; ��7���-G�d�X�LAr2$"HB¬�-�_���s� 
9cb_TpYӑ�T�xmb*o$@6��{3�-�%�"ş2��˲~YIAi�!:�=�j�6��a��]�Z�������Y�F�:�<�/Jn3����*�(������jЙ?�2����ڪ=��DYP���`�����@�+V��҇�1���\r�Z��&:���db�/�k�\�����oOm�a�}�_��̽�ɘ�	d����B[CN�e��u_MЮ�:#��]��l
�v?���?J��=������J��OҐ[c�j:�@�?����@^�S �7�: �[����6*��� �_Լ� �J�OX3+��J�����F ,��Câ��Q	��j+h��Q`���N�0eH��'|���dD�q� �o�
Ԓ�v@�|/�3�X�΢��\{�6���5�>�t/9Cl�T��nty�t�
:{;ݝG_U�e�&"���y>:n;�t�ь\��[&G���"׃�_��b��@��i��盱`?ګi��P�p���0��
��ed/�b���?�\Z<���o���U����_wX��
�U������D�t��K=���2Б���ߥ�BC�,De��K���Uԉp}������ b}�,�w���\[����gҌ o-�v28��8H3/���Nh<�K��߆!^�J�b���~2KJ� ߌS����Z?�����
�����RЏ�$�e[���%/�CZ-��9\b���Mc��V��������-��t�z1l˷��>�������,�ŭ�޲��g���k�ܹ\��49�y���B���*���2}ۇo������>﮾Jf��F/�o�Clͬ�+|K ݻ��-�O�C��zD=N,������Z�A�f9P)�4�����=|L~�7m>��j8a��ǥ��|Y��zJ6w����3f�M��g$��M���M���f�",���f!�J������w>1��o�A���0�lo9��w�vv��*?^zW����|��e��­S������_��rR��wi	��
>�Ɏr/�Vs$�HDU��(?!��⇶��^�z!Т'V���Y��"!�ߴ�Ϧ �l^��a!;$���W�B���h��F�v�����Tc�R��|б~=����ȼ�gՕ�-?(�Sz�������ڽm_��7�����=�0���2�ރ����b~$��"�mT��p���
���Aok�N*� �ka&�@��'˙!HV����a�hM]eX�xUV���nv�l�v�LB������B`�����Ցl	4���\��i9M� ���MV�i���� j��G��[W��jI=���ɯ��t|́�&F�
Ax�����\��3�T�(r�P�U�s��!�џ&]�VX����J{�ê�M�p������4�S��|�ݯT����[�`O��s�́�����P�X@��0x@����B�(	�B� ����!�+T��q9;�D���(LRZ�CuP&�J�bCx��'�Π* ����j��26�W�����D�-3W��_C_��Xlz��);��fDlt>
K�V-�y���=���&��۩�޻�[h�2���t��Y�V���=C�)3����Y�[��K�Sf��I'(@�Ps~�����J�w+30G�R00д3�j�K.7cR�Ur{i�_�Zk�1�$ב�&*zIP�9�X}v������\Ox{�s�-%�?u~��u�y�l(ոQA��2�FgU0W�_��xA�*�}`�<�#�ʌ'��NO*m'K.8���1�}�J�5�5��Rl�f����eXe��;    vL�gS!'m,u�K���7l��S'�C�8�(վԹ�)�(ү7��	iv�aJ�A�,�6�u¢�s�����?WrGP��󝆫��PCκ�{��%�
�Ia��"d)����cr
�iK����]�ĸ�;�!�GW�Þ�5,Y�ˏ�9Z��xH��8|��`�����yl�Q�/,��L�_�aWR`Y�ty�����H��B���m����Y�nD3`��60�;�A܀��I.��/��I�ŖRRZ�UV�k���RY��j���lM ���$�&�֊g�i��j?[�!�Uc[��}3�wq��ݘ����@�*���P)ʃ�DN��^���">��AlZ�M� 
S��dUs�Ȃ~����`{��_�yx+�5�����d�:��0Z�����}n�f31;��Y³��?$�V�$uC!�b����>T6及c��/ �����#
pX�M
�ov=�]!��ͅ�^Sԯ4�Q����� O�����>ê
;�O�ө��,��e�dDJN{�M���0'��+;%��Q�_p�	�����m(j}5v<d}�.�C��>i"zpo�Z����J���dM.Y� �MX"�p�0���x�b���v[2/|��-�ΩQ~��.AhёrLJ�� �ҟ%{�2?��e]�Ì
��h��U��eԊ�l�_�Mʱ�X:X�VKE.8�����U���~@�����1�U"�r��< �ڞ%,���B'?|/���8T"�Y���)�O~=�������߮,�!�tİ��7\�v�?L$�_�s�?�I��z�ϴ�
��X��0�77T*�wF�{0rU���`		�Q���"��w�W���yrR�i;�ɵ�SrXOy/��-G�dQ"L{"%��� ��S�0�H`c�|��d��Gm�[c��1��o��|s��VO�]r���xa�/3ٳ���
�D�2��_k֜���\K����z��%u709�C�������F�ﭢT��I�qK�F���0K]�A��Л>�{ l2��,�� ��,�^�*����pu���?>���'L�C�'��vs)�_-�m�L��@�n�~�aQ�pk����#w$�` F�ՈT�j3šV��>ve���K|�L�.�`6��PĬ#��eE	C"��L�P>��|<�VR��gf:���;a).&#fc����e�)����-��z߁ID�o�L!��y��e�+�F:������nǍ���W߀�Y��;�S�A(G���[�����A���eN8�.4�O�Q�a���>����[�"Z��������P緃�9dh�D�FU@ LB�6�ra�/�yZ~:6$[yk� ,��&>�4�8��,R��sn%Nq�`��!L�R��{촼o+h���2�=��ϽW� �_�3"���+���n����|�ق��\��lI_��Wj�p���N�9�Sl� :��āo�F�0��9^����p��Ֆa�����������
ߠ��/�K�Ϸn5�YU���f;�maL�	���.�����#L�O�z����r�>�9��CT!�g�̶#�?s�IE5�&A;3)�3�^R
�o��~u,��Aa��B@p������ԅw.C�d#�Q"�����B*��m����
��(5�s�e�������pƣ��7�<`z"�L;P�K�� �{H�H��>���(�,��6�60o:��D|3y��)�#ϟ�d�=B�����*�6�v�b��$���	���K)�y�:�b�����
o���	�FNzPQ��l�	�3�S��%���YW7:[�!d�b/�[!�"���ό�ދ�Y�s��~�w6�=� �	��Se ��[��`�~ii0�����4 �6?u�G�؟���f}a�9�{�N|0��Zb�|�?w�}F�}X�a8�X��e>Z��dE�pD���~���]�����s��NMſ�� �v|?q��a���^�l"��?`ʖ�FTQf�2bi��Y*�>Pa�@��.���
r�� �\`��!V�*E�
(=���ˎs��0���5�1~��|2#�d�\��� �S*,#�X-bn���+�G���=zkq�����۾깠p?8������,e�F�H�ʀ�Ca�]�A�v�{V����^��1�"s�&{Ն1.ai���=���������� �K��;X�$$K*�1��'nv'rR�=RH��mA�s�!�=����$J��N�\�ǃ�W��H�X��w�XHC�?O�n#��E�%/�?jm�NS����a���=(-vi8#��%��q���KoP�kZ5��N�/��U���Fq���	�t�Y2I11O�S��22��c�Qbf55Ґ�w7��j�W;����*�$��$��R�Q�FO�pxͽ��7N�H�A�t΃��
�kpӅ�hDl���s4����g��"Al�Ĵ.9g�-(&��L�\�����w�����f&�K͊����IQ(jK�QC���E����* �Ɣ�Bk��s1�{a�����X �2��)���˻ݗ��  �H�9q�VHloY�@ʜ��ꝙ&�vv�nE=���2�lU\X�)���4�pC�"
�&�}S����*)Nm���_5#�줁�s���-"�cʚ=B���݀�'�i �%V1�F��0�������7�:5���Z���������-��0��T~��-�Y�̛��w�/L�~�\�I���cq4.~�ɝ�i��"���[miU��I�\�a8,b���Hizk���u���w������F"��/���}��LԶ���S��I!�	���1�rl��:��m�7�e���h V�����P� �S����*e��1F$VZ.9aXW�,UB
.dɠ[����'��*�Kw  �v?u�DU�^������d��U��}�!Or"����첿����qA&Ǩ���[K<t�����]�@�aF��q"�\0����&��MPRX'�]kV�/�����:I�q؉�0FAd!�	"�qq,e���YdŐ��IF-;�`���5�i&�.ex;�-,��9cn�2,�s���]�@~���r_:�ٹ>-�e�7�0O�.���}�<�0�C�v�y��W�W���p�	~~x��J�� ��������ِD�l�а�[��?�v�X���d�io= ?A!���3h�ފ�����m^J�6�h�{P�6;:1r*oKה��y�)�͊���a闩�L�u��}�C��b/�l������?e��<<��R�N�:{W�_���ev~�B�����M���w�K$�t|�T���"+��qy�VpKO���;uZ���qr5��ix��P�N���/4%Y�s��a�5���y�}�d�֎�������<�'�>�@�z��8�2���d��Y��hT��u��FAJ
�pw��������z��On�$�o}���-�]J#��L��@?ЖŬj�(Ի���5�߮�y��UM�e`Zc����bQ�||p��m� >�Ѱ�1x'l�X
K`���0��#��:0�$G�k�~
T����*��z����e*�޻)�����^M 吵3�eY���Ɯ*��nA�,3�����&�U��H&�a�+��%6���c�g��l=�������	�J"�'��H��r�G�ӑ�$��=��j���2��b��Ϊ�ٽ��1������$�����
��D#c@h��S�Aj�O��~4b�QRb�[�և�!,�݇�!i��?��z���/�>�eH������켿�r���V�����Ϥ"H�=bY�$�b(@�ݏA�3*�i�Jk ���Y���ӈ���|�J¼;N~ �;��
�d�Q�]wP�����=J��s�ԅ��>#��[+���x�>�)F���P�������*ЊQ�q�5��%(#0��)������;AŮޯ֠�7�x�>��˱��~r���l i�[?���4v5��0$#"��U"��*Anxܳ=,���!�Q�H�0Y�3 ��f� `  ��~9�	���>�
�aaֽh�T���b��U�֜��.�a��>����u}��Ih���J����IF�w���z�����3(�4��� �'=�$^��(���aǍ,��0���h�����$���BeNg�����&��mџ&36;�ж�`����b�"�O6�+�M�H!:�n>�;���*�bVm���dvc�}oW�ϻ����u5ӟ�0e?=�e�2%��F˥^0A����h��Ȩx�P�O/�R���Ca��S�vP|�a�$ժ>��� ��O��
mp3�\cZʰƅ�#2�}{�3`�ar���e&("��)C��&+1h��2((�q} 0L���������
�����@��4��廽��k������M�P�Y��.X�4����hD�Br!��5�b����$,D�@��&��	]�o�F2�$rh�Zᾭ��l�ӧyZz���O:I���y�`�E�����16���f<1��:���ad���X�؏���3ĵ�8��ALV|�$��BU����W��An���$_�\��j�?i~�8�.��-��������{ڰ�M~*)߃����vSr#JI����ʽl���ڷ���_��6.I���ws����-��P�j�7U�[��I��E��A�吿�@����� >(�r�����o�3?��ծ�b�	����	AXc���X`�8�r�R쿡����}�`�b�<=��a-��]�Ě�a��[���&�6nAm�3e��K�pc"�)��b7�c�	lR�O�wWX߇;���!)�$B;����O	sb����f�Q�fA�(1�_�yl��*3����������ɖL>      ,   2   x�3�4202��@d�```F��F �bp8�;�8r�q��qqq X	�      .   d   x�-ˡ�0 P�~E���c@� 1��0�h텛����{�S��o��J�re����i�R�B�GFn!�0���hr��
���7�+�U�v17�RģA��I4      0     x�uVM��8=K��osb�|'ǐ�Z>�I���^Lp��
�8���g�2�3
?)���$ۡ�b�E���RժQ��5��6��D{6 r%���%�[�(mk�
�	S�h�>���E�ȗ��Uz���_��n���dnoo�ҿ9��H���]-)-8���u�f��e���9ǰ�jr��J�i�2q�.Z{�#;sZ��ŲX��8idߋY��2��G����uC��l%��ز�l����q�ŞsWM[}=	s�����
a&�Zl�	i�}���f���Wa��;�5�	l\l6/i���r��;1-��jl1٬d'�ڳ�D
v�8�] %|��'K�u�7=t�M�X�lˮ�`�O��s俓�-�������BP��ݰ�á����dKv,��jܥb7|G߄��l��j*��nDٿJ���:�?ٍ)�?�7;�� �$BL�쁳���f(+�g�{�ʧ�_�A��J�,R�gϣe�>���J���Վ��BF�O�\-�i�P�79Jz�a/���\l��i�f/f �L���X{	���~+ޔ�U����h�;x����Y/�wh��z����5��*˗�]����Kk�묰���ϣ���������>mPT[�-lJ���bV~��G�2g?Պ�Sn+�#�ʺ��-�?�i9��	"ݵi���n8��묦�!mou-�����L-D5�h�q�a���OŰ�s��(�Aҏ�v%l="aNt(E�Yq�N��~��Vgۤ����,����D6�%1�0��)�h%�����8��U��жA�_.8th/���&ۧ��I3�5{D�h�fr��+�>l%�ޣ��0�Cs�Y*	~���!����>F���M�Ǡ̿rk�2$"�	����p�9?����Dˏ9�Ks���z}tk����af�^�I=���#Ϛj��ar�K�|d��y�y猣 ��Y�|�Qh�^�	Zq����������{M����̧���s*���=�R�9v ��,�"�إBbx��s���co0��)c���l}o�b�q �p����8�B��e��:F�Q��5[�h	`����)KN�X��xGN0���Qn8q�QO�Q�xTj{GOۧ<p�S�Bۛ�c�T)'U�Z�n���$� �}h�B�;+��W*��q�
Kh<@�s��_Ŀ��+\��5�U7f�����]�;�T���.���o��.P����o��O�î�%� +sze�v\�ZCm�GCCd�@C�`LGu�3<�,�ʎ�Z�{C��U�w�Qah�􇶎�!Y5b��?0���2�      2   !   x�3���q�v�2��]|=��b���� t��      3      x�3�4�2c#.c ����� _�      5     x�E�Ao�0 ��s���
w$ꦈ�
[�K�+�B*��-cˎ_��}f e�r0h���&\�\֠����1g��v�x����$]�p���҂"ž���.�1��*����%��qjH��Z�ƣ�h~�7���#�9��-����.���Gu�G�K�C܏<v��U����e}oQ�����LBp@IÙ`�4=�OLI�{P��t�x�1K���R�+
jt���3�b�E(��i�ǝ��fl�A���3����a|4 h�     