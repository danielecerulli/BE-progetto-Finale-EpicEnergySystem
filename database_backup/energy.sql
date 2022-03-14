PGDMP                         z            energy    14.1    14.1 ?    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    44059    energy    DATABASE     b   CREATE DATABASE energy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE energy;
                postgres    false            �            1259    87254    cliente    TABLE     �  CREATE TABLE public.cliente (
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
       public         heap    postgres    false            �            1259    87253    cliente_id_seq    SEQUENCE     w   CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    210            <           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    209            �            1259    87263    comune    TABLE     q   CREATE TABLE public.comune (
    id bigint NOT NULL,
    nome character varying(255),
    provincia_id bigint
);
    DROP TABLE public.comune;
       public         heap    postgres    false            �            1259    87262    comune_id_seq    SEQUENCE     v   CREATE SEQUENCE public.comune_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.comune_id_seq;
       public          postgres    false    212            =           0    0    comune_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.comune_id_seq OWNED BY public.comune.id;
          public          postgres    false    211            �            1259    87270    fattura    TABLE     �   CREATE TABLE public.fattura (
    id bigint NOT NULL,
    anno integer NOT NULL,
    data timestamp without time zone,
    importo numeric(19,2),
    numero_fattura integer NOT NULL,
    stato character varying(255),
    cliente_id bigint
);
    DROP TABLE public.fattura;
       public         heap    postgres    false            �            1259    87269    fattura_id_seq    SEQUENCE     w   CREATE SEQUENCE public.fattura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.fattura_id_seq;
       public          postgres    false    214            >           0    0    fattura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.fattura_id_seq OWNED BY public.fattura.id;
          public          postgres    false    213            �            1259    87277 	   indirizzo    TABLE     �   CREATE TABLE public.indirizzo (
    id bigint NOT NULL,
    cap bigint,
    civico integer NOT NULL,
    localita character varying(255),
    via character varying(255),
    comune_id bigint
);
    DROP TABLE public.indirizzo;
       public         heap    postgres    false            �            1259    87276    indirizzo_id_seq    SEQUENCE     y   CREATE SEQUENCE public.indirizzo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.indirizzo_id_seq;
       public          postgres    false    216            ?           0    0    indirizzo_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.indirizzo_id_seq OWNED BY public.indirizzo.id;
          public          postgres    false    215            �            1259    87286 	   provincia    TABLE     �   CREATE TABLE public.provincia (
    id bigint NOT NULL,
    nome character varying(255),
    regione character varying(255),
    sigla character varying(255)
);
    DROP TABLE public.provincia;
       public         heap    postgres    false            �            1259    87285    provincia_id_seq    SEQUENCE     y   CREATE SEQUENCE public.provincia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public          postgres    false    218            @           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public          postgres    false    217            �            1259    87295    role    TABLE     W   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    87294    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    220            A           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    219            �            1259    87301 	   user_role    TABLE     ]   CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    87307    user_spring    TABLE       CREATE TABLE public.user_spring (
    id bigint NOT NULL,
    cognome character varying(255),
    email character varying(255),
    is_active boolean NOT NULL,
    nome character varying(255),
    password character varying(255),
    user_name character varying(255)
);
    DROP TABLE public.user_spring;
       public         heap    postgres    false            �            1259    87306    user_spring_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_spring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_spring_id_seq;
       public          postgres    false    223            B           0    0    user_spring_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_spring_id_seq OWNED BY public.user_spring.id;
          public          postgres    false    222            ~           2604    87257 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210                       2604    87266 	   comune id    DEFAULT     f   ALTER TABLE ONLY public.comune ALTER COLUMN id SET DEFAULT nextval('public.comune_id_seq'::regclass);
 8   ALTER TABLE public.comune ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    87273 
   fattura id    DEFAULT     h   ALTER TABLE ONLY public.fattura ALTER COLUMN id SET DEFAULT nextval('public.fattura_id_seq'::regclass);
 9   ALTER TABLE public.fattura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    87280    indirizzo id    DEFAULT     l   ALTER TABLE ONLY public.indirizzo ALTER COLUMN id SET DEFAULT nextval('public.indirizzo_id_seq'::regclass);
 ;   ALTER TABLE public.indirizzo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    87289    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    87298    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    87310    user_spring id    DEFAULT     p   ALTER TABLE ONLY public.user_spring ALTER COLUMN id SET DEFAULT nextval('public.user_spring_id_seq'::regclass);
 =   ALTER TABLE public.user_spring ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            (          0    87254    cliente 
   TABLE DATA             COPY public.cliente (id, cognome_contatto, data_inserimento, data_ultimo_contatto, email, email_contatto, fatturato_annuale, iva, nome_contatto, pec, ragione_sociale, telefono, telefono_contatto, tipo_cliente, sede_legale_id, sede_operativa_id) FROM stdin;
    public          postgres    false    210   �G       *          0    87263    comune 
   TABLE DATA           8   COPY public.comune (id, nome, provincia_id) FROM stdin;
    public          postgres    false    212   �G       ,          0    87270    fattura 
   TABLE DATA           ]   COPY public.fattura (id, anno, data, importo, numero_fattura, stato, cliente_id) FROM stdin;
    public          postgres    false    214   �      .          0    87277 	   indirizzo 
   TABLE DATA           N   COPY public.indirizzo (id, cap, civico, localita, via, comune_id) FROM stdin;
    public          postgres    false    216   �      0          0    87286 	   provincia 
   TABLE DATA           =   COPY public.provincia (id, nome, regione, sigla) FROM stdin;
    public          postgres    false    218   �      2          0    87295    role 
   TABLE DATA           (   COPY public.role (id, name) FROM stdin;
    public          postgres    false    220   !      3          0    87301 	   user_role 
   TABLE DATA           5   COPY public.user_role (user_id, role_id) FROM stdin;
    public          postgres    false    221   9!      5          0    87307    user_spring 
   TABLE DATA           _   COPY public.user_spring (id, cognome, email, is_active, nome, password, user_name) FROM stdin;
    public          postgres    false    223   `!      C           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);
          public          postgres    false    209            D           0    0    comune_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comune_id_seq', 7142, true);
          public          postgres    false    211            E           0    0    fattura_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.fattura_id_seq', 1, false);
          public          postgres    false    213            F           0    0    indirizzo_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.indirizzo_id_seq', 1, false);
          public          postgres    false    215            G           0    0    provincia_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.provincia_id_seq', 110, true);
          public          postgres    false    217            H           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 2, true);
          public          postgres    false    219            I           0    0    user_spring_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_spring_id_seq', 2, true);
          public          postgres    false    222            �           2606    87261    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    210            �           2606    87268    comune comune_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.comune DROP CONSTRAINT comune_pkey;
       public            postgres    false    212            �           2606    87275    fattura fattura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fattura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fattura_pkey;
       public            postgres    false    214            �           2606    87284    indirizzo indirizzo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT indirizzo_pkey;
       public            postgres    false    216            �           2606    87293    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public            postgres    false    218            �           2606    87300    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    220            �           2606    87305    user_role user_role_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    221    221            �           2606    87314    user_spring user_spring_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_spring
    ADD CONSTRAINT user_spring_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_spring DROP CONSTRAINT user_spring_pkey;
       public            postgres    false    223            �           2606    87340 %   user_role fka68196081fvovjhkek5m97n3y    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fka68196081fvovjhkek5m97n3y;
       public          postgres    false    221    3216    220            �           2606    87330 #   fattura fkf55imyo58nx83x77ufdmoa7e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 M   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1;
       public          postgres    false    214    210    3206            �           2606    87315 #   cliente fkj864ytumjy2bwgtu7jhkvsat1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1 FOREIGN KEY (sede_legale_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1;
       public          postgres    false    3212    216    210            �           2606    87345 %   user_role fkjnbh64dhuo55gh2jd9d21d245    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245 FOREIGN KEY (user_id) REFERENCES public.user_spring(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245;
       public          postgres    false    223    221    3220            �           2606    87320 #   cliente fknfenl2nw16cln6ansxx4ljx3o    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o FOREIGN KEY (sede_operativa_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o;
       public          postgres    false    216    210    3212            �           2606    87325 !   comune fkr2h0j33kqnh79vxndd0xh95n    FK CONSTRAINT     �   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n FOREIGN KEY (provincia_id) REFERENCES public.provincia(id);
 K   ALTER TABLE ONLY public.comune DROP CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n;
       public          postgres    false    212    218    3214            �           2606    87335 %   indirizzo fkt8brbuq41cphbhkgrhn1oukl1    FK CONSTRAINT     �   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1 FOREIGN KEY (comune_id) REFERENCES public.comune(id);
 O   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1;
       public          postgres    false    212    216    3208            (      x������ � �      *      x�t�˒�Ȓ-:����ը� 	C�Tҭc�GKڲ��!I$�m �|�����5�����~��Z�= 0��� �{�cy�x��ڿ�kQ��+_�i����A,o��n��};_rV�yl�c����А�6�95�]����|&Q�h�G��f��k^Q��֕ٽQ���kIf�7����zum���7[�^�պZ���A�����������=��q�������i��~h�ѲA�A�+�}�����F���eG��?6��Og�`g��|�x۴G�Xv+�.��1��:�?>��ݗ��ڭ�a=ﻮ9���n?�뛾��ۺ�tYE��׳���Wˡ>���e&�u��夋�����ӷ�n۝v�ˋh����t���/��C:�(@����Һ<\�a���e2�\Y�.C��d�Y����j	��w��V֟����a]�{ӝ�J׋����9ZFuuqUq�&���`�7Ƕӟ*k��׳׸�����@�'{��s�g{س>�%��ǳ^�<���8�W��5:94]�NN������w� �;�ݣ�?<t����aKu��t��t���\t��VR�������l��-V�����6���7Y���R���y�K��>�{�(ɏ9�=���z �u�/wQ3l��Ք͉�s�FǾ6�^Zichl�Գ��6
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
3�u�f+4��=ٲ���o�S����(�Z�6�����t+��U�x����qs�S-�'�X�Ek3�������ᒿ���m�q�'���:�B,�O�1�S���9e0��(�J����!��C� x4��;���c�:��U/!,�?������f�t���|�QhM��p]�6�c��x�����^��x9��@"U�0Ȏ����4e'��Yzo�v���5@��y?ف���M��}��1<��q����i�w���=�����^y������|�vfn�0�3�P4(�"Í��⡥@�f�8A�������3CY���[�Ӈc��Ԉ_W��0̯�Ɏ[����Z0vs�6����!@�����qy�Ԕ��H 	��E?��rmB:=�3���"�f��\�7k��	qK �@g��\����Y�8�+>����G�D~�Ug�*�݉��a��z��=�S�.��S���O������v�,\b����0�yjs ���纚z��ǖ������Ɛ� �����v8* ��ioU�P��^:��I+aC��3�~�W����o�l-K�n�����d�N*��e��3��G�oN]<�sW>50�Sw��VX!oY�A�g�g�3�u;<�����5��4�k;) e-�)1h(صK����/7"g�bH ��$\��/l�\�B�=���ˤ1��U�e�d�*b1�OVn��~AX����C�u�Q6�[���"Ĉ$ ��Z�:��Ҁ��Z����4����Dk�z��Լ?��E(cC�2���
��x�Sݐ�$}�p��H,O/��҉+�quܙ��ɛuZ�D� D9^}@��e���s�d�,��o�]�L5��)I���a	�뱪�n�x�A�4"������KԷo��ū���� 6���|k���X��F�+�n6��m��K�9�cKxQ�S��xl$1��=yc�y =�-���o4��_���q���A���/�t��
l0�?2m4�+N8��'�&ʽ*����0%f�V���$M5�`�E�|���l�J-՘m����;)��Hk�P���J��������vf�-�(ܮ���%�>�5�zr�zȩ��-�����}c���TX)�'TQ_Z�c����9vU�?��&�Q���It��˹X�'��2�^_����2�{�y�<���N�.jun�0$c719����].��k)�*~lv�i-5�2(��-�(����k�؁H�����R�T���0�K��t��8�nˠ<]ק�� ���5���$΢�_݄�4
O�j���67�7�C�-������$���;V�!�0+��Â��Ӄ��yf�(��R͵Ǆ����p�a�:\������N{ىq^h�D��A�+�����8�x����d-������D�<=��pFm��`Jb`^��b=֌�[U�2�$�gh���'��?�.��f�C�ŷdѓŜ�(�Q���f,B��Ҭ���j_��nc]�����E�
�[�B t7�L�Qj5i�$�˛_�w�ìb[v+�^	��'�'z@M#�M��lY���)̗������(��K�?��8ͧ�:X[��uV�ܘ�m��w��ykVp�w��u��AV�ݵ=Nbr��9@��� :����۽��,�g0�i��ϡ��>m�M���KZ������}@ds�:?�aK�7��ͨ���8S5��h�*�s\�W��Y�;����3Q|����uY��2�27 �i�4m<h�o"��;Dm��@��4�B$�B�1��ו�۞�Da��%C:b;�Ǉ��9H�<��/�H�[n� ��T0TzS|2�N�X�^�J<͙�7��&��Q���`���b3��.}�RM�=+�dNZ�\ux���K��sC �:����%�x,�hx2�}^ϧ	���)'�y2�+��: >��V���6�? P�>r�W֢�c< 21�U�\=�Q��z�Y����?���Y�o�=��%���[UK��ښ
����p(б�2*��������֢����f�����GAշa�_�꛻ș3M������}�/��۽�<,���ǭ��V��hl���To��Ĺ�zҭ���7�J�ƻ� ;��UH�E�.M�H6e������pf*�dm\���O�Y�3�S�=r�bk�6��f���N��KLCP�pa���{9�F��#�_����y���-U�n58���p�sOx�@��R�S�L�a���|*�U��=N<I���ao:�j�q��0XA���L�*���|8�r-�C��Ͱ����_2��G��px��)�v~bєf�PX���QJ��w���aZ����;�X~sa}���N_#$S��r�o�SkDf>3�]2�2��#�f%7��R>�������;��2�"��3%1-���&�+7��"��k�sG7 /�?r6%:5N~y����̮8�o����Z-68L=��eV1&���a��	>ȩ�`���%U$Y7?"]�$����æ,�TL�!�J���2�dZ\��@{��4���J�7�RE��Z�:�!�AC����KϿ�@�ݗ��(0�}����d�񷗞Zv�EI��D��YP��@Z���%w+-�  �Y�w��w/'��KHȯ�>Vs�Y�i�?���U��3�_�Z",Y�3�(�cQ��K�cs��=��gn>�4�9��Gc7��ǝ2>��T����HTe����R�B͢��ɸຐСO^R)������4Ov�,'5zxU�9��X�p�W����r��<H��)VJcz��r3��z	�ZݰښU������x�K��֬��a�!������U����|�"a�կ��%����a#^��ٶT��8KU�3�ɖ��C��\<��P�;�H,w��;�����EH�![N�`횆����3,����C^:b��W �j��A��G<yז�Av=�U�Shb�A]��b�|e�yqCo��6y{�1���l7^ʛ���ui	lC��$��.#"<ep����-���]�}�Au䁃^����d��F+���Yh��	o9�����mtJ�����y��Z����t?.�p��y^���ZmE~l��lv�P?nf6Һ�8�Vߟ��`��5�Ei��nQ��p/���xBM�?�8	,��>�����ȋ�"bwªkR��V�.�42����x4I����$�;!�ѽ6F3G��<����x�҈������B��{P� �)�2Kwx ���n���:?qE���.��_��H�0�&q"��U@&��3�~�R��R���N��q�+v :{���X�K3�;��1V]�Ԓ���jKC�{�#�՗m1���4�������E� -��|a_1,7T�Dj����kF�qI���f��ɩb]�#H�Ja��=��2ٙjD��U��
u7O�gm���ƙ�{w#����n|B�#�������>��}Ll\~��}4E$�!��D�2w����Әp8�C쨬p*�x+Y���^.��  �" T>����F�݁/�O�H�t�6�0d'Q1�
�"qł�󆤺j����7����������
�*L7V�U����?H^S���α�|J���D�?�B15�3���Z�%A�y�I)�W�<k����b��P����/���y9��L#	��ի����l-a2�,ç�z��E�aa����6���q�ͼL�'Y��і0�f#����sc��X����~6O׺�������N�{T���}9z��r�vBDPm̀�q�Fuȷ�t��z�n��W��^A�)CX�������9<<�˧Y��$�:/���	�⋫�yQ�� �AHՋ�(c�����lt��y�2�j �	�&u��?�:5�    ��㴚A�����M,�G�b�?-�����-.V(	NP���?�Ɔ6���j�����ԍ�b_�!�,���|3 ���B��Eo�ALw�O��o(����)��׫^ �L�K�W?�,�.+ ��s�]����E� \�?y5D	+VĪ��R�.&Y�H��`�	�c�M�#�+��0]�:��AY�qqf�_�.�"{�@/��(e����:��	`�)�o�y}��f��1�/�[<7t��r�X���T+��5*�X�lV��'����"������
ђkX͸(�V�� �
���M�T*���ÓA�G���[W����k�)�!_�KS6�Z
�`��S��C�83����vNt�3��o��q� �{�W�z��2���p'�E�nm��������tb�2��{�?�a��2x�H!��8\md��mP��W�X�/Q�U6�n�����/�,@�T9���4)w��X���'�2�P���/H鈈8��o7.&4��\�g_l jn6��#0��W㇏ݼ���Ɋk��"�PfE�G�Z�?")^@��>-:���Xlx�^�*ǟT9ްj����2���UG�K���b[���Y�Ǹq����x�e�Y��)f��Q���u�&����K��')��7�,O���7�J��*��c���4��w������i��v�{@�I����
�� ��jm��"t�]����,	,��X���(G��VAp
1�^P%�FBd�
6�.C���%ʵQ�_D�낈X�n�9�����td���g�V�K�$����t��>Y�6{�j�Ȁ��R ����Q4���7a�����>��O�=[��wd�����>>8�B& ��S�]�+>��W���	��e�L�K���|Dǝ��a|� Y*����Z3�[���;�����{Y�b�a`����׬� �b�H/���3%6NV��zp
��ق�`	M�.�"@P���H�{�׹ۏ'�"=$x�[�="��v�sܡo~_�6"*���[���/�ݥ�U�ڻ�eucO�tr���Li���� �)�ys� ���R8�ܺ��Q�I��Kg��0H�u]�i#��s!r�!AK��]�{�P_��;h	�8�c{�9�x	̭��x,��y�YY�Y	�t����T�5��?�V��?a���ٺ�=���Y�܏��֣Vy�y��" ��}�ǵ�E���] �~��§�̣Cֽ��#Vw��}��tA7�MĳY���9�0���w�	����3iu9a��}���X���y��E�;5��*��r��Z���6}��ӑ{�hAG�}��t�ݮ��7����c͍�����`�>��'Ju�	���Y�އ�����"�P{��(�$V�@ ;?��ڿ,�r�Þ@��}_R-)�D/��$�V�$��4G9e��{�}fOʦE�uq�p{��^���)�z���*�}^	H�֪LF�Uop��`��T?��S�^�:��&�p�~���.Sw�ms�^a��/�X�� �F��`�������Z��
��6h�8d{�L�ֺ�L�l��/�-م�*�I@���9׵���p�U�z�MAK��MBf�
PfMr뉦61TF������7v@��}d���@�}w��E���[
��ɔyXjY�B��8�G)hJ�����;��	U��*�ڗ��݃�h3^�(@X�-T�}x�"�1(�� AA�����*E�� �#|�9��ZBݡ��-�y���(�w��I�hk;���w,}\�*��i����-��[�2����H[p݁�q���%�}������j�*����O7X�m�q�X�jy�)�ɣA;eڔJ�a�<mz����M:2�3L�g�@h٤�*�߆�dd1���R� �
D%�" =����̒���bS��VA�2:�9�F�E,�a̮f�2w��8��-��븁�����Ͳ�"K����.m����j�+�|m�^�$���L���-t�︽P,{!�0u��*ڶ�c-j�#i�m����k���T�{���TRxAlX�7d:X��b9�M�v��b�! ��;�� �A*����_T(���� j�ɟ�a 5��b�:�A��3v�r9R
w>��:S�J;Ǐ[|�6౹�F��6��s�K����� }P���e}�-�xح�5�������[i �(Ě�K ��$EJK�G����L��1*?!��g-w��Bc\}A�cV��V�&�J��pͺbX�_-S@"�Y���>%�=��J����ҳ���
aIJ;�TB�/�;y���a{>�6�����9�#���k2�4�ׁ	!�$]tQ�aGp=�t�	�IJ	��2�GY���f�c��Я�X�����$���N<��VU|0���2S�ϭ2���;c}���]o��rS�DM�,(\S��val�(��@N���6">�t�5����(�h�6�`4��n�#�.��@خ�M�k��XgDMٺ)�L�釚��T�/������/�~�/�+GAo�<��<��L_�Ɍ�D�D�|Ăl�M�WҎ ����1��W���C��g�iN`�����3�i�$s2���@HΤؽ���ݻ'��I<=�_K�Dۗ	H��4��Qhh��������gT
�J#1rѬ)�MZ_���/!"#L�/cV�� D�]�k��_;�l�Pְ!���Q���P�_�G�)q�C!�"YwJ�Ȳ1��R�Z��Oe�Hk:/�B��=�7��Y�U�F`Jn��B{��u�}k�~U� �����)ҵj��M=A���ϛm��1{�Q�!,+�4$�Tz���g�,UC���u�l`{�9��y��g<��6�Vv'�e���a��<���@Z��Ӱ��5 �+~�a��-��4瓷�F�ob��.*B�����6Ԃ�ٻ��2+&wݰK��0t_+���b�_=���!�װ��|��]�H�k�-heoTA�ۥ�H|헩���q�V3`e�H�M۾��Q+bঌ����X9y�I_��Ů���9��w�&s�󴜰&��u^)55J�>���6P�Dh���K�G
#ͽ���zF�Q���<�3��Qp��!���wih+�����Yn�Y�V~]�I�#����jw���Vf��|����`�2�6h@����iA]pFv��j����u�γ����d��Z7��ڝ{?S�a�X��B��G����X�x���������x�M�5s#b_1/�+�%����r������;e�	T�Q{5,4��㑿�	�.�}"��aE�0lN�z.���(�^�M�6�[��_q�[��ӵ���`#�&$*����Of�A2�	J<�姽|[R���'�f�����.����`�\l�hfK/���`%P��pVAF(�m �[�,фA! ���`�#X^��f6�M��rFz���R/�wc�%\Ь
��.r�B. ��,�r���k�i�ɬ��¬�Nnw��E�e4*�ʯЁ�9�6��۽�: �j�|�o��/����U����Ei���4�K�k
�j���7V��Қ�h�(��9�M���.E#&��ħ{c�QC��΄R�ȸ�b"�]{0��C� lY�V���.亿�Om�WQ�8W�535� ����݀Q��X��H�X{�J�q�F& ƹ�x���>���cI	6���N�+d-�*&t���f��`���U�B�B	�����3�1��d��=�WkJWM���������Q��7Sߕ�V���o��n��4�W���0W�a�-�)�6�6�Ɓe<6�E���dw�~�F���z{�I22	����6�/�9^�������<ę0(�����^g��s}Ϲ>yDk�9���Rߢ��'�Kh�A�g�5ݛfJ�����<ȷ�\@&'�d���@gT��\[4�H�5�ӤG�e���ڢ�;�U]����C�ޛ��g��	#i$�)sP���ܰ����A,��#�Ta�N R��^��0�(I��bfc��0<Ӧ%�<��d�m��!|-JH�G��    �+��*�1}[���Vbv�)!�m/�	(���^���?�[��p�I8�׽mS�4�����zF�1��-�
	a:���^�~�������&�C �5�݀dh��������J�څ(���fa4��8��E��7bP�b����0z��%4��kE�Ї$c�ZP�ILc0"c��|h2��ic'`���Vq"��ݱ\�0�]��P=�K?��(���$645�����&֖�w�gXȇQn]6e���i#b�0����~�5!�Aa%���D���Y��@c)��v��� ʽX�¶a�lH"�b\�%�R!}<K����)��ڍ��(�!Q[ɺ ˱�e�s��b�V?��}����$
0(�8�����ZS[v��	1�?�o��H�������.}�uG��^���5��K)g�*���sו��9��`l�ո�+ H9�_@�p�"m�r�ȏx82�u�U4��t�0��cK�uS
��&���u؃�� ф���g���5�V��k�uM�#��8!�hc��{y!jeȴ-���O����W�SPkq�
���Oɲt�]�T^
ل�P5觫[kX'��}���dc�j��x�X�a7)<�F���a=��Ű�/d��{M���zϗ`6$��a��\(O�ٵ�q:� ���,e��Hv�.���QE.c���-�&�mn_.
C-KU����4ٯ�	�����ߝ>*K�"���.���`�:�}���,λ�������ʊ�}�nl�&Ѵ��GD��KA�!�W<��OU�>����cb��Խ,��m(C�>$09ǷVlT����z�qy��LjA���3 ���_�פJz]�B�Ή�=&BSz~��X�:龻�	:��V�$N���Ь��V�}�[����k+L�b�("�z��v̛�ҙ�hy���6+S�c���_�+�x��a��<����yc1�XIH&���@xT4�� �d�G�#d�]���U{^n1�3�fKj�����oWC'���6c�"�Յ�2���;�^����o�.��$���qWV���zX��V��w\#}�����q5����&$#�K����ib�3��O�0��}�2���G<
�Cd��\�X�b���J��u�oV暉^Sm���5��f5a���%��	�D�g�����^4��6�z����TOڼW5䂱,�&��r��F�^�պ54�'�K����!�}�u��"�F:K�d?��q\�
#`u�X�)ܤ�f�i���������(�@����DR13LM�ޠ�����d+ӊ�=��䑛d�t�������m��T���̻&�C���76�c��*LJ����u� $$a��d=ai���I��co�E���×��Q?,/	�y�j�,������h�(�C�Ucm�j�'�Y�]M¢��(c��$����=�">!E����H.����A��.bK�Z���-�v~�H�5zo������3B6\;,���lݑC͸^M��1�PY�B��Gi�{�y�G�O�Zü��&�џ:�3I���,r�]PLj�B�b`NV���B2|5&F[��Xa���/7\8��CY�n½�WXhAV�1��mK�;��,5e���yRlg��),ɠ�[��0�]��Ҙ:�qh���W���u�
���J?��3�g?ݍ	K���p뭿-%ơj�Mn���F����4���P}x��tkJ{/��/�.'�c���'?i�ʷ�<��T![�/P�V@���wR�ͥ���K柗Q��x�N,���+�H����Y'�4�P?����ư2�o�7�HI9=|�-�.�Ţ�]Z]�x>TC���O-�{Xb�e�Gnݸ����*u,�%a�c�1�ـ�#�M���C�e�*���$�_�B�
XJ������	b��x�X�$  |3��M��٠p�X�) c%�т)�!#�\���o@��0]���ڱ�\�E��yZ�Z)-�\�$$t��M�}%�� �Ŷ��1V�>	����7���Vj�:�"J��
�Y�����=���{������~A�����\:1��P�s��U ���|�;)��W'P���`)�r�"/38u(Ԟ8�Ě����~��Y���" q���	�ޠ�i�y ӎ�%�q���at�K��p�a�?(�[PI���U��i]ݰX��}�֣y�ȷA0Ǎ�jl�Q��4�9S�����0k`K������3�B@Θ�\�t���.F��
	�M����esI�H����C粬_V<GP�F���@ϦZ�M�hX{l�V3��/�)>fa����9O�%c>�J(��$����t���-k-��j�* Q�>>9���{�7����d���g7>,����V�g����D&#�D��� W�ð����S�lXt����8s�x2�wY�d��֐��E�q�W�����H��`�%����O>nA�R�*b�(����@���}���4��ثn!���`1?8���� 데� ��,a��J��m�#��խ$@��R���Jö�R��s���� � l�а��qTF���
��~�g�SD�+L���	��_�1Q�C�)��۪�df�� ߋ��(V��h�(מ�7ǟar���9�K�[2��]�/����Nw��WUa���Ȳy~����;��r4#W5����y������Wa�$�}���f,؏��@��*'�4�f�l�y��_xc9kA�K�Xs�:|�>׀,i���t�h� (���j�kU�yx3���+q��RO��,��td���wi��P�Qv��,�su"A�f�27�5@�X�0��]�g���V���2Ǚ4c�[K���1�̋�Ac��R��a���Z~�?n��̒�c�7�����/��O���;���`}���2�d�V?��n$~�����P�V�is�'��d�3���_�}phad�1�2���.��q�E%�|6ˀ{�@qk��,���,��Z1w.�=M�Gn�_��覻
�f�L���[�B�t�'�{�ϻ���Y�����[3k�
�H�.}l�����F��6~l���Vt�YT�:u>jhh��JM�ϼ�jM���q� =�E�����]-����Yq�/��o�F>�v�1E.�Y�K/�YȲ���q5��OLl��jP%z>�,�[�����]��������Dp��1��b���p�h�4��|�g�Ǘq��T5�]ZB(��Od��\A��K���I.Q�(�O�5����G �ƽ��^��U(ft�ƢH��7��)���Ɵ�%yX�N	�*����s{�&5�Q�������b7՘�T�4t�_�7=ä%2o�Y$���o�
�ޣp�#���g�voۗx�bC��uq�/ᡃ�@�Ƽ�`Cbɸ���'�q�{<�����o~d���녓�!��ZX�	!Pg��rf���g~� #ZSWV#^��Ū����?�=��(���h�>D���%���|u$�E�vr0��wZNS,�g�z�bZ=�eë �ڃ{�����U��Z�G����s��%�s`�C��ѺB�z��k���-W4��%�@)��8��sG��oGk��a��Iשֱ�~���{�%����b��,��T�7�e�+ա�{�V�ӹ��s�/ ���1�-�F�:�P/(z���F�J����Pɿ��`��
U�|\���+a"
�ԟ��P���ҷ��q��ɿ3�
 x?g�ګ�����=�����)��տ�א���l �޴r�Nb������ҬUE����h����	`�v����Z��'�9]��_����~��{���`���'��٫x�	� Ёy� Ԝ���?&����
���Q�L 4�L���K�͘Ty=�^Z�����ڣDLF �ud�	��^�qFF� V_����D�~j2W���܅fK	�O�_�rt�6J5nTP%���Y����!�CP��g+O��H�2㉄��ӓJB�����$eL~߳�m1C�(�ہ�ٽA4=aV�    |����T�I����~'����	�?N2J�/u.n
�$
���M!}B��;f�RjP&K�v�����?ii1��ϕ����|��*n.Ԑ����El`I��uR6�Y�'�<��܃�jڒ/�4{�01n�Nz������znK���v���p*�i4߯��~�o~[n�K�%+��;��~ؕX��]^rC�?c�&�<��~�'��0�~|��X� ���c7��u������{Ry�����;A�U;� �FYTV&�*�4[�/�%ɸɰ��f�䄥��Vs�EU�Vsvߌ�]~l7�b�n(о
#�$T��7��,��%z�����,{��l�4��~#�G՜=�����12�^�6��ފe�hf��5���o-�����~h�[��L̎�x��,=�I�;I�P����o��|��M���0�z0����v���ہ�BoWȡss!�;b���kxT��dd;��:�����ϰ������t��>��_�x'��ӞwS88̉(��N��u���qBr}��x�Z_�Y���P�O���[��:�������4Y�KV5j�!\ '���%^��ye�n�ݖ��x�h˲sj�_.�KZt�S�R��8@��g�ƞ��OemY��0����3��iym�gs��?[�j�r�%�֧�R��E$�t�uU�$�xg <wLd���\}(��g	K:t����K�6Cx%��5��Hx�)�b��_���p�����+�sH41l���Fģ�����A��OqҮ���3m��`��"L������������\E`��5XBB�tTA����dƝ�U$�l���~�Gڎ�zr��AÔ�F�K�|�%YԁӞH�m�1>|�$L)ؘA.�2Ym�Q���X�D�x�_}�j!����lׂ�k�/^���L�l��{�B%Q�����ך5'?g#��A�2���coI�M LA�D�����}�x~���{�(�l�m�R�Ѥf&�RP�2�����@����u�,K�-�=|�'�WC��6:�� \]�~��O��ǫ�	S��	��\
�W�b&��5н�����vX�?�ZAa5��	%�Qi5"��Lq��b��]�"���6���%�M�g;1��<�oYEH+&0�Oa)_���/����)=�NX
�˂Ɉ�z1<�Fʫ6��a� ��w�B��[?�FH0}^bpY�
��ίc???����qc�qx��7`r>���Ѧ�閷xqs�a�>?s�������r~��#�O��i1����k�>e��1s4��� `�&QG�Q ���MF�\؇��^�����V��- K+�I�O�,��_�2�����[�S�<2wӱ�|�;-��
��=t��w�n�s�U>���B猈?�q���m�ۨ&l�;g��g%�<[��������/�S~GN��=��=*q�[���!�n��n~a:�<z�e�-�>��D#,(3Ƴz��7���/���R��[�vVUo�َF�_�`@������|3�D�������z𨸜����G� �U���<����O��kGQ�I��L
����B��>���D�pE�yPi��EEd"A���9u��P>��nB��僧�fĨ�
,��x� ��7�/J�� F�"��~�_���7��(��8��$���f, �R/�2���t��;+�G�5���̛�>�Lޤv
���g}�b�?|0�®
#��ݩإ)��o~:h-+�R�w�����s��b������uG���Ӆ^DT&1[���GB��L�T�o��zw~�Ս��.�D���V�ȶ��3���lV�m����Ý��A�0 dB!�T@���.4��_ZL(c�n+� ��O��-���y�Y_�b����)���;,���]|��j�kN>��|��Vy-?YQ'Qlf�_�{W(`5����_a��SS�o�; ��O#AeX���:������%�U�Y��X�!F�J�OT�� u��$G)���,~����x`�զJѫBJ�@�6D��,$���zk��$����&A&����"(��B�
ˈ�)V��}�F��
����qp��Z���x��z.(��(| �1KY��<�A�2 ��Pu�e������%���a�Ȝ��^�a��DX�F�@:tC�"��1�tAr�3�0h��j��%	ɒ
kL�艛�I��Tg���`[GP��oHuO e/��R2�/������wG0��+֤��Ґ,��S����z�s{�K�Z[��"$�{�!��EbJ�]Z �/q	so�����қ�<��Ga���K"Cl��,�Q�vw��*t�LRL�����L�>�ءC��YM�4���j���Վ��g���-	�2I��Th@��ѓ?^so8���>Ry=��x����ta=�n~�c-����,�H[41�KΙ/�@ʅ�r<*W�.�,��p��笙��R�b��pzR��m�|�y�`�r��
��1���Z2�\��^�0��?��́n|�庼��AD��=(�2�N\A$��[V9�2�g�zg��Ź��[C�:�$[i
�;5�7���B�Il�T�|3�J�Sۆi��W�HE6;i�����nK�HmØ�f���+7`�	a��e�U�Ѥ(�齧�*�ŪǍ��FM���(F����x�r�G��2��8�_�rK��5��Bo�]�����;�y�(?B�X���grg�E�$��)f�V[Z��`�%W(E��Xz�>R�^��)�b���`�1�$nk��Ⱥ�K""o�����m!�yzF�T�kR�a�~!e�����0n���r��>��"�=F�;T+ ��Av<��JY�z����KN��)K���Y2�nv~��"����H��O8Q� W0��y���:Y ��iU�yeȓ�H㾴F}���q;\��1*Blc��]~<��uW7s���c܁(��8辣�aA<C�V��s�Ě��;;�*7�NRD`v�3�B�D���~�ȸ�a�AK��%gY1$�BAAk�Q�$=�g��s�ɥK��p�5�mΘ[äL K��|v� ����.�ܗ�vv��C�p�M.�ӱ=g��E_�-O,��г�i��j�����< j��^��08 �l{w��p�m6$��>[/4,�־��݇0��7f�[�OP���ڢ�"=�����m�����5��T�͎N�����5�"A�j�`����nX�e����}]*w�����!�؋+�'�n����O��>O~��ӧ����>#q�{#�����)$eA�zS������I/#�l`��J-a\�����|�C��al}�\M;l^� �h�S'f�MI�����kXy���%�oA�g3Y�������.�h1��ɰ�:���""ΰ�v>&mv/:d�U�h��8�A���2ܝ.,b f'ﯰ�}��[>���[�:/Dw�}���� 0��9��e1�Zǀ.
��x��k|��qUSc�֘�w0�X�F��\n�x�,��O�o4�h�	�&��>�1���H�`���*�Q�Z��������⮞�x�s�
¢�n�}�b)��WH9d�L%B�@�jb�1�
cA�[�<�b�*���a��1�IbX%��>{�)0����YmF �DFO����&��w¨��I�'�rƶ���Q�td���<`O!�ڽ���~�X�¤�jnvo�v@�#射��-�n�(!��=%��������S/���b���Vê�axb�z�abH��f�ϰ��%!���w����)8';ﯰ\q����x���3�Rx�X�!ɰ
�b�cP�L�
{�� �"�i�eV�(�4"c�8�:��0���N/�'�gTu�T�"�<|�R��tua���H;�֊�=k���d�����#.�2�F�
�bA}� �D��t	��g{���%�p��NP���k�5���Ga��/�r,�������8HZ�֏A6t;̓]��5Ɉ�=Ck�H��JG��l��v�w�2�"L��� c  ���"�_�m�4{��eX�u/3�����pG�{��5���y�q��Cl/¬{]`a�g=�Reh�w�Q�?���d0�z)`��/M��c ��IO�	�n,J&$E�A�q#p6�!�0Zs�~54I���P��Y��w�u���=a[��Ɍ�� �m!X,�7�X�����
�c6R�����o7�
��U[��7���~�����n8�vuE]��'(L�OO`�D�L	���r�L���`0��02*^%��Sċ���e �"�PEà��C9�_#E�E�F)I��}<�$������B�L&�X@���2�qab���z��Xc��w��`�	�'~�P��J��

DyF��������*��A'��xqv�6F!!�!`�no����4?�v�5ThVj��)�a.Ag>ѿ�\�=vͤ�#nz�	�'P@1�� hsB�����;�Z@�V�o+1����i���l0��NR"��A;�fQ��l�o�����O0��``qY�,��*6�#j��qm"N>�E���$��n��P������<z�����W�,����O�>�a����p��~y{��B`��6,l��J���")d�ݔ܈RF�f��r������������K�!��Ŝ��i�9&����M���� �Bb|�~9�o�5�?y�u1�J����5q����[���a4�G�k�X`�����fB��)0��\��o�g�gg=غ�6OO��BX�BWx#�f�G�*���=����[P�L;��+ܘxJ'�؍��t��@�����V��Ꭿ>t��E
"��Ďar>�S4r���b�F�Y�G<J�{�������������/SL>      ,      x������ � �      .      x������ � �      0     x�uVM��8=K��os�V��#a�lj�����^�ʺ��YCr�_���0�3���I�~ғl�ҋQ���JU�F	J��R�Ȯ�� ȕ�궗�n٣��u+h'L�/�=���tM#_�_�W��~I��������iJ��R#��Jw�@����Ү֍�媖����ҫ�*N(�˦Q�����h홏��i!\o�b���X��}/f�ʬ2p]*v\Z �������bˎ���GV�-{v|�E\5m��$���kvZ(���j�a'��n��W�ٗB_�].�D��&�qe�ؼ�M�?g���؉iadWc��f%;	p՞U�$R�;�I�(�+�>Yʮ�����l"�*g[v�;}]��#���l��ܜ4X�l.��$�]�47�'[�`�?V�.��;�&��f#NVS�7v#��U�ԑ��nL��!�ف�`'b�d����4CY�8��V>����V�g��={-��y�% �V�\G�v�2�|*�j�^H+���Qҫ{���b��H�5{10�gl>���Khet5��[�4�
��F[��S]n��zɾCkmԛmԭQ/V�X���
>�]Z#\g�=�m�xm�ߥ4����i����}haS��&��<:�9�!p�V|�r[��Vֵoq��M˹��O�M�<�v��^g5u�qh{�k�t|��Eeji ��D��4�}*�ݞ8F��~p��+9`�	s�C)�GȊ��v��U�:�&��g�]�&��-9�i�Q�N��@+A6Ͽ�����6�z���2�r��C{��x6�>�Х=H�ɬ�#�G��6�s�_9��`+����5���RI�|t�8�`&�����0�\�mz?e���X��!9N� 5�O�s��9L�&Z~�ȡ\�����[�5G.�3c�jN�y'�y�T��#_r�##Ѕ���;g�v����B�ZMЊ#�Ԡ���_7V���u��k"��G e>��8�S!.��)�bͱW�ga)�.�CϞ�n�Qd{����O��T<f�{{� W���g�=�!�����G�W��b,@$�$P���[�	`����)KN�X��y�GN$�vÐ�rÉ̈z����ģR�k{�Q��*��^���J9	�B#C��$�%'���CV�F��X=��S!d�[XXB������n��]�=0�[�]uc�*�q�*���P�[|���Y�Vc�_���M�'���?�Y3���{���`eN���܎Bk��ib�`���hS ��Nz�ל�<��RK`}��<t��:*�ѓ�Pб��`����3�      2   !   x�3���q�v�2��]|=��b���� t��      3      x�3�4�2�4bC�=... *      5   �   x�5�I�0 �u{�ā��(n����IK8�����$+$�U!���6O(HG ���2���w}S>Cf>f���ڹj\$�&~`4��-w��`s�<�[f��^�1�Cv��4S���!���B���L�IQ�^��d;��=���}�����Dǧ^��v���W�G�R�A�     