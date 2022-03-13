PGDMP                         z            energy    14.1    14.1 ?    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    44059    energy    DATABASE     b   CREATE DATABASE energy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE energy;
                postgres    false            �            1259    81765    cliente    TABLE     �  CREATE TABLE public.cliente (
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
       public         heap    postgres    false            �            1259    81764    cliente_id_seq    SEQUENCE     w   CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    210            <           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    209            �            1259    81774    comune    TABLE     q   CREATE TABLE public.comune (
    id bigint NOT NULL,
    nome character varying(255),
    provincia_id bigint
);
    DROP TABLE public.comune;
       public         heap    postgres    false            �            1259    81773    comune_id_seq    SEQUENCE     v   CREATE SEQUENCE public.comune_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.comune_id_seq;
       public          postgres    false    212            =           0    0    comune_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.comune_id_seq OWNED BY public.comune.id;
          public          postgres    false    211            �            1259    81781    fattura    TABLE     �   CREATE TABLE public.fattura (
    id bigint NOT NULL,
    anno integer NOT NULL,
    data timestamp without time zone,
    importo numeric(19,2),
    numero_fattura integer NOT NULL,
    stato character varying(255),
    cliente_id bigint
);
    DROP TABLE public.fattura;
       public         heap    postgres    false            �            1259    81780    fattura_id_seq    SEQUENCE     w   CREATE SEQUENCE public.fattura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.fattura_id_seq;
       public          postgres    false    214            >           0    0    fattura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.fattura_id_seq OWNED BY public.fattura.id;
          public          postgres    false    213            �            1259    81788 	   indirizzo    TABLE     �   CREATE TABLE public.indirizzo (
    id bigint NOT NULL,
    cap bigint,
    civico integer NOT NULL,
    localita character varying(255),
    via character varying(255),
    comune_id bigint
);
    DROP TABLE public.indirizzo;
       public         heap    postgres    false            �            1259    81787    indirizzo_id_seq    SEQUENCE     y   CREATE SEQUENCE public.indirizzo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.indirizzo_id_seq;
       public          postgres    false    216            ?           0    0    indirizzo_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.indirizzo_id_seq OWNED BY public.indirizzo.id;
          public          postgres    false    215            �            1259    81797 	   provincia    TABLE     �   CREATE TABLE public.provincia (
    id bigint NOT NULL,
    nome character varying(255),
    regione character varying(255),
    sigla character varying(255)
);
    DROP TABLE public.provincia;
       public         heap    postgres    false            �            1259    81796    provincia_id_seq    SEQUENCE     y   CREATE SEQUENCE public.provincia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public          postgres    false    218            @           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public          postgres    false    217            �            1259    81806    role    TABLE     W   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    81805    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    220            A           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    219            �            1259    81812 	   user_role    TABLE     ]   CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    81818    user_spring    TABLE       CREATE TABLE public.user_spring (
    id bigint NOT NULL,
    cognome character varying(255),
    email character varying(255),
    is_active boolean NOT NULL,
    nome character varying(255),
    password character varying(255),
    user_name character varying(255)
);
    DROP TABLE public.user_spring;
       public         heap    postgres    false            �            1259    81817    user_spring_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_spring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_spring_id_seq;
       public          postgres    false    223            B           0    0    user_spring_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_spring_id_seq OWNED BY public.user_spring.id;
          public          postgres    false    222            ~           2604    81768 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210                       2604    81777 	   comune id    DEFAULT     f   ALTER TABLE ONLY public.comune ALTER COLUMN id SET DEFAULT nextval('public.comune_id_seq'::regclass);
 8   ALTER TABLE public.comune ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    81784 
   fattura id    DEFAULT     h   ALTER TABLE ONLY public.fattura ALTER COLUMN id SET DEFAULT nextval('public.fattura_id_seq'::regclass);
 9   ALTER TABLE public.fattura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    81791    indirizzo id    DEFAULT     l   ALTER TABLE ONLY public.indirizzo ALTER COLUMN id SET DEFAULT nextval('public.indirizzo_id_seq'::regclass);
 ;   ALTER TABLE public.indirizzo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    81800    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    81809    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    81821    user_spring id    DEFAULT     p   ALTER TABLE ONLY public.user_spring ALTER COLUMN id SET DEFAULT nextval('public.user_spring_id_seq'::regclass);
 =   ALTER TABLE public.user_spring ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            (          0    81765    cliente 
   TABLE DATA             COPY public.cliente (id, cognome_contatto, data_inserimento, data_ultimo_contatto, email, email_contatto, fatturato_annuale, iva, nome_contatto, pec, ragione_sociale, telefono, telefono_contatto, tipo_cliente, sede_legale_id, sede_operativa_id) FROM stdin;
    public          postgres    false    210   �G       *          0    81774    comune 
   TABLE DATA           8   COPY public.comune (id, nome, provincia_id) FROM stdin;
    public          postgres    false    212   �G       ,          0    81781    fattura 
   TABLE DATA           ]   COPY public.fattura (id, anno, data, importo, numero_fattura, stato, cliente_id) FROM stdin;
    public          postgres    false    214   #2      .          0    81788 	   indirizzo 
   TABLE DATA           N   COPY public.indirizzo (id, cap, civico, localita, via, comune_id) FROM stdin;
    public          postgres    false    216   @2      0          0    81797 	   provincia 
   TABLE DATA           =   COPY public.provincia (id, nome, regione, sigla) FROM stdin;
    public          postgres    false    218   ]2      2          0    81806    role 
   TABLE DATA           (   COPY public.role (id, name) FROM stdin;
    public          postgres    false    220   �7      3          0    81812 	   user_role 
   TABLE DATA           5   COPY public.user_role (user_id, role_id) FROM stdin;
    public          postgres    false    221   �7      5          0    81818    user_spring 
   TABLE DATA           _   COPY public.user_spring (id, cognome, email, is_active, nome, password, user_name) FROM stdin;
    public          postgres    false    223   �7      C           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);
          public          postgres    false    209            D           0    0    comune_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comune_id_seq', 7904, true);
          public          postgres    false    211            E           0    0    fattura_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.fattura_id_seq', 1, false);
          public          postgres    false    213            F           0    0    indirizzo_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.indirizzo_id_seq', 1, false);
          public          postgres    false    215            G           0    0    provincia_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.provincia_id_seq', 110, true);
          public          postgres    false    217            H           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 2, true);
          public          postgres    false    219            I           0    0    user_spring_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_spring_id_seq', 2, true);
          public          postgres    false    222            �           2606    81772    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    210            �           2606    81779    comune comune_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.comune DROP CONSTRAINT comune_pkey;
       public            postgres    false    212            �           2606    81786    fattura fattura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fattura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fattura_pkey;
       public            postgres    false    214            �           2606    81795    indirizzo indirizzo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT indirizzo_pkey;
       public            postgres    false    216            �           2606    81804    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public            postgres    false    218            �           2606    81811    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    220            �           2606    81816    user_role user_role_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    221    221            �           2606    81825    user_spring user_spring_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_spring
    ADD CONSTRAINT user_spring_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_spring DROP CONSTRAINT user_spring_pkey;
       public            postgres    false    223            �           2606    81851 %   user_role fka68196081fvovjhkek5m97n3y    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fka68196081fvovjhkek5m97n3y;
       public          postgres    false    221    3216    220            �           2606    81841 #   fattura fkf55imyo58nx83x77ufdmoa7e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 M   ALTER TABLE ONLY public.fattura DROP CONSTRAINT fkf55imyo58nx83x77ufdmoa7e1;
       public          postgres    false    214    210    3206            �           2606    81826 #   cliente fkj864ytumjy2bwgtu7jhkvsat1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1 FOREIGN KEY (sede_legale_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fkj864ytumjy2bwgtu7jhkvsat1;
       public          postgres    false    3212    216    210            �           2606    81856 %   user_role fkjnbh64dhuo55gh2jd9d21d245    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245 FOREIGN KEY (user_id) REFERENCES public.user_spring(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245;
       public          postgres    false    223    221    3220            �           2606    81831 #   cliente fknfenl2nw16cln6ansxx4ljx3o    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o FOREIGN KEY (sede_operativa_id) REFERENCES public.indirizzo(id);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fknfenl2nw16cln6ansxx4ljx3o;
       public          postgres    false    216    210    3212            �           2606    81836 !   comune fkr2h0j33kqnh79vxndd0xh95n    FK CONSTRAINT     �   ALTER TABLE ONLY public.comune
    ADD CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n FOREIGN KEY (provincia_id) REFERENCES public.provincia(id);
 K   ALTER TABLE ONLY public.comune DROP CONSTRAINT fkr2h0j33kqnh79vxndd0xh95n;
       public          postgres    false    212    218    3214            �           2606    81846 %   indirizzo fkt8brbuq41cphbhkgrhn1oukl1    FK CONSTRAINT     �   ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1 FOREIGN KEY (comune_id) REFERENCES public.comune(id);
 O   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT fkt8brbuq41cphbhkgrhn1oukl1;
       public          postgres    false    212    216    3208            (      x������ � �      *      x�|�˒�ʒ-8f}E��Hf�70�cKWe))KҖ���I")\�< A��_s�'}N[��zRc�X�Z�R�jF� ��@ ��˓������Ǧ��%ݼ����mAd��C{��o�����\8};N7��ޟ��B�����w)���ӉD�ߏr=�z�r�uϝR���+�[���$גL6/���Dzu�5KǞ;��5߼j�Y�{h�}gt	z��¸y-�?[G�j��u���[j��w#���Qz+��Ў=;�& w��m�?���%������U׏2��V*]�|8�tzzx觛�n���Cz>C7����i޷W}Mk��v�����8K�/^Rv�-����f�r��_��^$�����M_&ݖ;���g���s/�!KD'?�����D	�yҾd��y�� �>Yү̥o��{c���6��O�g ��`k(��,���t���p�UZl^���Q�(/��b^	q�&Y�|�0o���O�4��ۋ�X�*��V$ ���{�S�'yؓ~�׏�ȅ|�{��8�g������^�N���^·v?N�^����A�?<t����!Ku��Kt�����T须XI%�z<�3��,D>�̝'3~s�w�i��l����Wo\��t���ˊ|�㋇b`g�_�q��e��!#��m��*�;�w��ѱ�]�/��1t�Vڋ�T2
�8���|�;d����\�>�"��*0��'Q����8��g
C�oA�2�fَ7�h��m�־�Z:���+����bl��A=;%��gۗk�� �E�LR�7���~P��??+!�����V�YV���ؘ����v�-���N�n:��W���ʗa��F����s#_��5��E���j�͛y�F}+M���?z��QE���m{�u[Mn��[.b��oS!eԧ+YY����m.�4_w.�-6o'�mh�m)���U��lqG~Mva-,y�J4 �a;KD~�k�経�����."��u����"�d���PFƹ��B��/R�݌�j�WBʶ-_���Ddػ�-'"������9�^�ͭ������(>�����{Ya�>s�d�9�A��L"b����ht	�n���1�0���v�b�wY�l�DT�*�o�8莙�����L�<�������AAȅ:<@6�$��'J�D��Vȳ��D���"ڀl�����ޏ����p��8%"�>���߀��w*r�l���6�Dd�����\��}�H0!N6p�`��U�69�5&�d.6�D$؇Nv�h��2x �ʗ`JS��'U�6�$�0��"f^���-Z���c"by����6��]�k�r� j�cUƒm�ͤ#�G��z2��fךpJJ�G����)"�>r�����8�e-���ds"DaA�\��oL��GY�����'~߽ͰH�O�];ID|}�]陷�Oq��'R��2����6�D��,B�^D�lSWw+�1�"���9|�"��e#p�)�%��>������/u�[���!�Լ�j�ۊ3��mD�	{�e#�L�����v�]l�"��e
ea�}���-G䚐]�ȳ�_vP�k�����K�8�vej�=t"�����^�9�"��E7�U"��^���*��^��E��O��ZD�����Z�KƠoF��i>�n.M��人�4�eR}OHE����5;�R�j�r�IY�����ŤX*RM8akLE���h��8�4ѓ����s/��.ܲ���;��*yj/w�T�n�fl�7QGJE��e�dJA?�8�h�����nv�r�y�'5lM�"�>���^�GF%b*�+9����<� t�M���χ/���4����wQA�E�+/Ȏv��%�D�}^����x�"��L䚐P9q�RVV��V�����g��z��"�@ö��$�+�j���"c����\d![�"���!h���E���w>�"�y�#d'k�npH�V�r��J�j^L�f���5�$��P~kY�z�'���֢-�SkY���?�E���j˭Mt��_�V�ƫu�����I���ء���+m�ƣ�H���}|lE;�y�:�V���{��&]iqkm[J��^p.N��}e��W�:-Rk�yĸ׳UpJNދ��<w�F�F�.����T���J4�"����Ne�h�r�}�v!4p?��"���'���ϓ(J��D;�b�E,;�[/_����_��9�2����>�����v�1��>"���P�-"�W�'RZ�Ydk{q�MER���r#[�k�O�H�TǏ.�S�d�*��)�͚Sn�ݯ]t�Eh�[��omo�j6X�;���=![��eq�e"��A��2��>u�^�%������1�����}����ew�犬�&�j�A��%
u<��"��a���ja�t��d&2��:X�����&'���i�v��[;��"���n�HEP�M�������f�(��e�Ep����*c�3��Ώ-��q���D3��M4d"ϭa�4��$rg;Dg��2i2�qd��h������,�-�s��0
c�/Ώ��-F����t}�� ��L6�	�'OOޚ$��d[��r�V��c(��_���E�j7r^>���Ѿ�ȁ{g-0�D�uA��������V�ڼ<�Y�/���e�σv���4����۔�!s���;�%��6e{9؍a�o5�ay�u�7vA$�<J���z��Py��m��iv�t��*�	��a:)3��m��s��<������\�y�v:�:G]�=�x3X�tB���Y��(i��V���$�,N�e�gl�j�P�CF���+y"�_�0�)�lެ�-���_�H�<��q����C�~���w8���#�SnމN�[��`����t�y��W�>LT>�)�s(-�v
X�F%�;�W�N�>��V�+� k�Yᙆj�qؕ����Iw;˱"���T��7Ѻd֌/��Af1D��a��@���O}ï/�����^�L�_^����D���������xc�'�r��D��W<?����wS�U
ǆ�������݆�^A��]��+���V�s{�Ɲs
է���̆��.UԻ��ʸ�I�����G/�>"J�l�'��RP�}�PS�ֵNt��{�0-dzz���ܗp�eWC��F$�W�+�-��vح�a*B�e�j�j\ =L�m/�I_萤8=��_���nW6�t�u����yD����E�e�̲wl�T���`�$!���Z(�#ظ��2y�
ϑ˖�ʌѳ)ᖮ�@2��o[���{ϭ�$6�sxy�B7�Ad�|�]]�ߋN-�*������o
�T�o�n	7Uo��l�Ԗvol��I��2���
��yk�J��:ɕ�}L�jW��=KJ�匌͍�*x_` ��rR{w��$��z�I�.�������Y��{zaِ�A^D79t��v�� ��.�C�������h��ؾM�ڼ�vp2��a뺲��[���!�uyr��6w�ζ�D���������H�"f������g�WFs�1�/��^-�l�8���AFs��sK1�������D��{x*���x��F�3�qa*��`�"i/V�4D��E$�լDI#0�)����^��$aj=��f�{x�k����czл��\-T�����:ER�?��ͧ��6�e��aȜ����ؼ�$!Q	q:uqRX��J (Æ �8ls�KZ�N�P�g5v*��Xt����@�r�(.-rV~RS1[�P��������o�L�L؜�aK���+M��Y7G�Daڵ"@�������s��_�8r���|���mC���{��`��E��j
q��O����8m�a�~���}�g�NTs�N/DFy7Et�ܚ/0-�GD�����V�����ƒbKC��2�s�8���4��}���[�Ш�Ɋ�d �s�u�I5�:��"go���aOkp�v��t���*q'2��wK�$"@�']�0����usol0�/(3�NN`���V�	�gsi�A��h�y�#�9�u� �p�8�cLJ�+}#ǯ6��K��M`f��- !'�9@��|�o��(����S���� �%��u��5�$��<<$J���e������co�li�.v1    %���:,(�DS0�WE�R���hI
�{��M
"{>��"�d�~�{���c&��q\Z�P���bZ���\4�!�A?��'G����Z\���"�M��:�ؐZ�Z���.�4h<�m�P����b��a4���t�>6�+U[��.��̃J<�7T>i���nmp��i��F��p�0�ʈn�O&�ñ��<'����Eh��l���*����(!����.�� $����}i",Hv�n�@��a��wt���@���P�����+X�3��n�kD�N"zd'G�0���!���3B4������O"<�L��TZ����L7�6["7E���m�����]�#
�jn� ��b_�Hŷ����a�V��$B*p�M:�O$bd�N��x������G=����CX"�a;��)��]7��E����ο����(U�Z8g��)�;����+DgW�@|�����C"�V2�Ix	2��ix��m�*��֊HAc��o��L���0���0E�ͳ���r��x��\4�@��kRZ�y)�N6�gk��1��B! ���Ѷ���X{\j/kÛk0�?�y�������a/"S��PO��]�flh��Jy�+�BU�*.#��䗷el���8ٞW�VM�:��xy�@�-ܠ�`�BPJX]��:� �b|�>��˄��W*��/n�Ƕϓ?8������2�X�nX���p�!_.:�~n��[��F]t�y��`�������Vyϲ�cq`v2Z-��fFΐ���ɶ�R�ꇅ��S��p�������'{�"M?v�1����1Z0=�ǰ��٭��gSf<Ʉg����l]ԕ"!?��,�0�N;/R��ѷ�2C�E����{�/O-�"ʀqO��Nɜ� _˜֡q0����>�i���A)1�]�$C,|u����H�${�-��
�ה�^K�ֶ}��e�c�0A��A� �NW�ʂ1��3��,����v?���@9��F[�8���@9J�*`{�"vr�#y�9j�e	�����l�K+�Q��(�62kW�����m��4a,��R��@��y�;�Є�����	�/O�n�����)���X�>���
���k�u�X����ugO�U[5�4�*��j�A�yy|���[���O��F-\š�fԂ|��~`9���	�vӨ�����P^l]�pL��?U-+��c��.��֓���@�UY�M�!�Z��^X�x�Ž����|���
�w٨�U�4���O�Q�;��/���ɮ��^�`�bC��-B���4������׶HMZ�q��C�6G��S[¨����%�`ϫnaI8D��.�F�kS�j����m#��WX�N��T"O�-�
N��1Kc��)��U��6��p�G��E�G�Jd�P�����OX�{���-w��T	]�{�^U��c|������kI���[l�	���&F��.����\��
�؁�N����~�ʀ^��I���qu���l媾��4_�|��p��Zր��	����̦��>Z�p�N}T8+�/M��
_����J�h��-�d�r��.�t��k�| ��K9��g�yI��9q^���F���TK"�0���o�W�ۘ5b�o6�#A0c$&~Ļ㠈P�d��#�H�F��ݬ@͏6�#=-�J��w�4�Ç�,���W�x�?Z��0��uE�_�9�E�n�f�����û|d����Y����T���1�;	V6x��*�/���[]�tk�����m;�Ss��Σ��\���Fe�v
�(���\0R;��>"�b�������T�?��X8�3�Tig��e����)$��P����A�ɤ^W�H<A��h���y���_�)^V�32c�E�	HU��(���+D�	V���_uU]��cߐ|��CB�M��$iQ��q�J%� �5��r?�=D��,B���ޢ��&�&��Eơ*���0��f����j��Z]����	�����D������O��3��;�y�óO��j�G:C���~ֻ���]���(�yܑs��F��9�}��Էz�i�!�L��yc��ɍZ�Z{��⺽�V���|r�é��Ѿ�Z�G�.7��!9��K1h'q̀[U#�{�!�ckwL��N��J9 ���7p)�:�$c�3"P�C��v�i�!�]��]=�a�[��r���f�攀j\]�������Fl	Y�$+�1�:�t����N��1�$�/BP��1uw����-���K�4��Sǒ�����L$��O>��������8��c���H*�̾�Z��W�H�ɣr�A��<t�R;$��M����4����lwmN�e���<��[5�՘�t��U�+��aFfL�R#Gx��EȾ��m�MAI�SCA������O�3)�^��p
�1����6��K�v�<7rS��D3G7WG%��� ���,j�����3s�-6/��(Ɍ�g�^��e|�Sh�!���G`����.����*�
F�V�d';Mz��zU!Hj��u���1il�x���M�8�c�r�g@~�Y�7Lp��n!���3-4�3A���[���;�T�T���@A7���!d���TYȫ���|Z���oH�!�����#n`��*Ͱ}T�:�;�f��S��Ҍޛ����5I������T�A7�;�1�df�@�W2���������R��u�� [ueڥ��v��t�G�Q�����^4�y$��wK��d�x�&��L�r-�
����Y��dW>�M~�tv��As���G�\��;p���^f�:��׏�Ѹ�����ު��`�Ig��M���n^�
�;�����B���
��h˦�-5�����g�G�ȗ�4�v1#�� D�Ԩi�"8`GZ�.�]{_�M��N:�D:3Cö�W���Fd�~u��E�d��9.��!͕���!��;��!���e�o����X��{�Ȁ��RP��Y{��8��Ϝ{�d��{G#"��L[o��Iy�`�\�f�+o�?e�jWEªv�ʎ�ߘE:xQ�`�p�py�܉����3 �#�R��F��~n�b3�0�iH@٤v��&�afu̽��w����_|~�ٔGۧ��j�W=5�EMN�s`�=Hsl�q��ҫ����5&�����W]k��l1�le����U���:�<S���e�U������ҙ�8(:|�k
:�����@N�_�\d�'9�|�!�v��u[���:r�{�����
�
�F��'y���՜������C��skM���-�擞�._*�k�N��4CӚ*zv����a��?��Lz��jJCuk�|�bY�|'U�y�ם�����T�r�(2r2�6�v��� ���v�?���4̓��ƛn4��6���tF�,��2"@%<J�G&������N�F
��N��󐓸zUua��vQ������R�n�e[��֫���Z�H��y9�_+�M����������]�9�����
����:�,ʈ�4���=�m�1��8��xTv����.���s���p��v"WZpJ�;��:E4�Y�	�W;پ/T�>#��%#zb���H��DE��ce0��{.t�tG�!T���c��ƚ��|�ӬI.a$��5��gk�I��F3��tl!Oa�)�P��H�e�e_����vktC��/
_rK㱚���.l����a'�]מt�nAF��hcr��A�Lۦ�Y\��/�yQ�\���Є�Ԣng���{So�[���91�G�*i��K��V�8r�Z�y��>Z�7,7�������L�����t�(�k|��N.L��SJ�(��&��SJ�S�4��f��6�y9Z~94&���"�KZUA��Qh���X9a����B*��>W���g>
9Յ��x%�o���HW �Q5��.`����ɇ� $����vdY��@;VV�`��{,2���;�,�$�]��%�X����O戺����OWi�5`I \\�"`����-5p��Ʒ!��C�z�9Tq���9��ܛa۷>�"~?,�q0%"�`P��.�    �D�ݼǢ��$�!�}Y��mŰ٬�q�9Y$aT�v��("XS ��ޭ�rx>-�2!~u��:��e�s�3��l�0�?��Am5�t՚�g��˶��=�q��:
� `�W vyם�CeC�����Qѩ�_��߯�/��;�jN����2��u���V�p�9>��	�.ȏen����+4t���0E�&�rV<St�OU~��k/��0a� (��l�3@��t�]�V�M��/��IՈ8�"����M#��|.����)�4�Q~���ԅ�������&@�=�����}��7��T��Ͳ�/slD���$§G9��Ƚ�����/�F��o��}�� � tZ����DQ66t�7����K������P��/VQ�֖FLzʡ
A�7�mb��ύ~��(CwzF^+�t3#?�6�I�|�,���H�51������Ff9��$��e�w��-!�W���Lv��tyE��խfd�aF���Y��2*dc>>z�����`}+�(.�7��o��#42�;��i�1@)��:.se �p�h��rk(2w���í���C��F��1�!ea��V����N�=�Rޝ�B۶����
��t����(�+4��G�~�=�ŀ̗C�)B���ϱ�w��Y�
��2�10��;wH�Ӝ�l���C�k���'�y0�a:���e�������lk�,2!Ŕ)�.{`�!:�h���C��5!�ĳ)�!<�[��#�IID~�M�3�+�2�o>g�d��ߖ0�c�'��S�����@ ���t� �b�;�_a�7@Oe����fPF�ŗS���de@#ִҵ�mb{�Q����!�6��ԋ�~42æ����K+:� ����5�&L@�D���3
y�؞�� ��y2�G#dk��@�ag,���v'$��-<��nCv7���P	�ǰ���ZޅN��;���u�~+�]k���g��"c�o5�]'����(o�^@��7�B?N;c~���u�)|	 �^O��r�L1���&�Jo��s���~h��8�������!\Ro�����;٨;^tŃ)�4"�F�}D �&�� $��(K�}a�O���|ժ���]�k��_?�?��Ul��9���Z��3#�_�i����n"Q��e�&�d&�&�~	�pJ���c�G�w=cp|�R5O�y��8t���0��|\�b���mC��?ۭ߽��Y]@S���_@�`�z������i̦?S��M�z��Ѫ?�i-o��\�M�f�7,7�������I��oZ�U��ޤwy�a�6��{�41�p��4!=���:�}�º"d��x��L��Z�_��ӟ�=��H`�l�}U	L��?���H���I�^ �����o��>�F7���ևS�*.�ŭ������O�knF-]>Y똈Z0�4Z��-g�O�d��hՠ*"Y��|�Mx��Kd���(������{R4�����Rб�ك���`�������.��� �kwT��P����YЅ��f��X&�l`Ϋ �r\��X�Lى~7��mll�Pa���n{P!Kπ4H �A�p5s�4�~�QU*E�q/�Rhě5�o5-Q�e�z�c Z�=�xaj FL^OH���$δ*��z�0������a4���y��`@E������?o�F1&�mMh��2����~Z���m\���~/M�9>R���t2k��¦<��h���)B���~Y(��U�|P�ZoN���ѸG��|��n�u:�a�M�^�`�'�
�*�ް����e��ͫ����J��W�];�����H<���4�W��򡥆oϐ\�`DP)���X8�!D�� z�����XNꪶ���D2x�}p 6��K�my48>Aw���,��8H�����V��HC�CD��%��o-�~��R�2��̢[�c�
v¦�Hm������7��M%���$�W�S�E�
��HvC�@N��z�%���a<�� 0;EK!+Ef�:�?s�|�������bN &���iha<�-j؈����A{�)�����W%�$`;A������<fY[�m�w?{��eP��@:b�a��#?w�} B"� 2RxR��[V��򹏒
(MrP�wA�I8�K
&����cp�n��ER�<�>�6(�B|��m3��d:�Y��h��^	�L�ϫO��ĳE���;;�x���'И�$��R�]�u���ް������i���;ƫ
c����Ԏ��z���gZˌd�)� �h�O��z_DE����l��ua�M!"9^�E�z�U�9(ן=��C�Z�S|m�l�Fs�5���Q F�k^|�V�ַ�����#��f�MMT4��m�)2Ё�v��i`�[����V�`��~/��VŶ��Aۘ��R~���AX�gn/��Lm�G]*c���H��0,v�ݎ�O�
�uG��IM*�����Fa<��Ikp�!3��M����z7}����)x��x)�|��d�MWs7��x���zI ����0!�ѯC���D���	��coT��w���-���R���G#�~%�h$(��=����;@���?�h�y_ɠ���$�p�xsNU�@i e�0$
�B�S������9����$&٨7�����{[��1�d�)ɺ'��7�˟����7`Q9l!|^�a.D�a����a�A%��Ƞn�x�;C��~���dS�}�����m�������|7;{�8C��p��=z@"P�Cc�����M�$�Ǉ���)@F��(�-f���5>��5�$z�?I/|23V�� D���`��n���{��55}
�f"������蟕H�7(�d�X�3p��� ��]���2D���<�amT��:�bY���ꌌe=����4�x��:��a3�dc�馞�Ô�G�p���w��2�[v��?��d�O��;�A~�H�w���H�lF�S�!���C���1q���q���{/���+���0��O��W�D�4"a�S��ʇ��?���K?ɹ㋪?֔C�;��"2�n�޹�֪ҹ0��a��*�D"k(lp�����ɩ��M@�:�jF	x��� �0Zl	��k��A�=a{�50`	�A�߲��M��ä�4�q��6����9�w�4-a�i����(��rҠ�]��xi�x��A�m������V�:}�Q���GU_R���]��F��b��������(���f:��*y����pQNeW����N̔.���1��
硦R���ɳ�/�(<L'�;(W�_!����{5P�m/۲��ӥڲ^�]����-DW�J�Հ��Q}�z�W(�@V �O�F�M�dCWЅ�ZD7�ˆ�e���KXg���C�b�[�'�}x�Ó�4}F��Q
�s� Y[��@I2�u�*�v�@��E#�g-�H�o��=�0�A�),�H����ԋd���"�t�R�AZU�˭�М�݇?È�����N����`���?����?5O٘�S�귮��JQ�d���i�b��YE�2Rlq�r��
�a�]�"J����ooGPiX��+���V�6�0kV�0�ݓ���U�|��ެGƇ"���H2��iY�����'Ɵ��&����[�'�|L� �q@H?ƾy��Bޱ,���Ɗ��>���
��ߌ��C���dݵevu��V�0��T"�b5��B^1�uׯD$�����)���|��hy����.����-K���haB���uD��G�c��Y�˟<+!�W� v��s���B���-�4&+-J�1��6S�2V����Ei��hd1�r�����f�n�Zr	�p����S�e�~'�*�a�]��c)���QT�c��i>���+Q�*�1�͈��'���mh*���
�$!���a0�A����/��ߊ��8zmc\�hw.��������E�=i�ҙ�d    tq;�� �b���L�,7_�9�:P�*$�a������έ�F��P��8R�SF�Qg;��3؎�jKE�x\�߈�9������J�;�*�C]��ft�д�ޗ
�jg�F�0�a�H9�(l�ܪ��ԕ��}`NU2��������I*i��*)�DQ�K(�^�eØ�5;ݺ��l�x펡��j JR����K\hm�Xp6����0!�� �F�1d.Δ�'T
�nQ�\+��sӽCP��qs�j��Dy����2��ps�]�O�C��F�Z�BS)w��R�cTt�S��;�>�]sP��Y�ך݃Y#H�'�6�v���\&��h���=��u����ʭ����4��\˜N7V��؄�����Gu��plCg*z���A��~e9�aM49�4��H\��pM*���C���#U �d����v�q�p_�O8���a�a}BܶjV�C�7�t��}Uu�!Pp�02���`��ɪ���Ow5�n�����n����B� �˯��Y��W����̚���xԼ\-����C�ù���/ó=�&b#��Jg��*�ӥB�g3Ɔ���9�a�Әnc���p�/O����ů��d'���+��rR+�q9�"l?b��DQ�د�J��;l�,�>#������T�����J6H���K3���7K!���[$� "뾝۸�]��(��8�8�5���gQk*Y�5��+�i[eA���Ǵt�?��|��b���C�W�,���[��\� '�ߴ	H}���������>\�o>��.$D��4uNǢLk.��/���P �0�	�"�F��No�j�]���"�sW��zM�;.7�o�J=+o���T����JTV��q���E
�ލf[��, �vs� (�(�*B��%� !��yO�1���\^J�r]n�w�!�x�y7n�����t6iVKKĽ�EQ%�x�F�������!>(`��q`W��ڈ���4{.��r;L��7���"���y� ��`�ЋԶ�j�]���"nM�%2\�g�1l�����5{�rh��-����.\+��m��Z#�є��>k�+6�*[Th`�L[��jT�"�ځ�K��5��!��Z�>��X��&*���A��N_�r��đ�mtS��ʳڒ��� �nf�'�%�S�3!����֎5�h������	9խB����~�J�_�H8'B�C+�(��i���k�+�R�K|T���]Gh������é���6��}e���<323�uF��gg����X�h�K� @�	�J"<O���p�N��\V0��[7ȗ�w��^/B���&������,B�m����6l}�0HmXT*޺�ɡ[M3�Ӏ�w�'<�o�D��o���Z}\G5Cӈ+c��D���ԌN{b��
�G�R����xJ���7�1zk�5�5���s��C�!��
Ϥ�! �y���3��{�����x
�����S���N�v�{����RkM����@`�n�,c�Z�q�`p�6�A��60���6��^w�SL|�l� $��ل�U�٠�?*$ʀ��@�/�<Խg����n����}l��S�����@�3]j��p���s�͐�e����[=5ݼg�1� /��R�&x�o�e�B����mroBqH����! "��&���.��+v�٠>H�Ӑ�����D��>�󮍓'�¦�0Vv��/ ��t�@�m��V����E�X�$ٕ����e䵗��5;��0�Z�,i�)Ϊ�=����(r8��%Z�g�(�[zK����}d��:���H���R��;�׌�:�)��0H����&��7pc#Xѧnl�����[�h�ʢ���-���K��,���\���r����-L���11����I���=>����d~R�W<��N6ľ��l�@��>0�������	�j���V7k��f��8m�;g��V7�/���
Z�-cg� GJ�������W�(k�o��6�\
[����Žx!)2�P�rJug'�Jw7��);U����3������$P�>A����Os�$��$O�d9 �u��s8�C��2���+��}�|�oxj��w �����]ixr�Źnx^ｵ�ϡw�P���5�UI�nw��M N�LUFjNy�����$O�z �B��®[�&kC��>;��R��.
�{�_q`��(N�w6մ��הy�Z�L�y���y��y�K����
��K�G����\:N|ҊU���������P�w�/�l[��������_(8��6��7�ٽ�Y���:�~�E]�(Wg��qKR��N����00��X[}|��	��'�s���).,���j�C@&��>OpGws�E�r��r �;��K����W~n�k��=7��� �No;{��������Ul�. ���_"e�6d��}9u��5�O��. ¾,����j���-^bb�S���ps�0'"N��ַ���C��3'�7��c�f��������L�&��ݿd���0��]|�e�hBAC�9�;���CO� t�{�Ǽ�+JFo<L�0ic(+���: ��<��h*���S1%�.c$�z7�ǂLk�a��`�Z�����A���U؆�ղ����{?ޯ�#��aJ��]xQ�6�md�ł�/
���ş¦P+�����J&w����iy��YА�9�}5����.�,0j��o���~1�1��56��}����iN�_�U���Ӂ��GaNT���C�!,�"��f�Ɉj�r��yX?dԆ���,D`?�H&�X��p2� =1}X���6T�&3��\D`�-S��`�^KN��?�����ߘ5���W<Z��]*7��%ɭmP�X��V���[W�?$3��{c��u3���.0�l
S@��R]�TE{��S���>�Z[�_>h����uL+m�N�A����M̌ѹ�2��q>�fȵZ`�SѶ��Ư& �>��Z���0�~���׃ ���~�,��3�x4���lJ�i�)�2��E����cg39"koL�_\����/n�y�Ni���;�.jM0�أ���ۇ��Z��̐�hE��jX�0ܛ��`�v�!�=��Ϧ�u������Z�=,��B+Xr&90&�<?taP�F8�+23`��X��"�����j� w�v]2J�T�("�1+3_L7�ao#��ِ�HÜ0?��OP���Z�.�w�õ�t�{|�(S8?,G�JP�з�ao{�c�,7o�V�T��}��8^#\��5+��W9 ?�w�ng�d ��vt�)jM�lB�f�c��7^Yr�^4�D�r�~�]��<�]va�"3��V	@�vv�H���i�C�ف���l�7�j�@��VӍj����+�L��
�C��=�V� Gg���
�g_U(S���v�U8 o��~�G����I:'6P�PY�PS(�F����랲f!ZjMM��U�\4X��-����?��N�_Ѵ�&���-.�����4W��XjO-0�ۮ�h��S���H�U
q�}kXtO	�(��2�� ��G��(�n>�a����r��<9'7N�����0�O��C���
�H�������Jv��<a9���[r����d����#J��]��ȰG%3z���1��< ���75]6�A
7�)��H�ԟ�$��Y���7�)l���B���?l yݳěO$`J`��H^���l�+���1�\_��c�2���rd܂��g�v��k�`���6 {�OCǎ⅀�e�����Y��)�`���G��5��/�T�0�H }�k��OS�f�)�$�jy��Lć)|{(i�#��F� }���Y�d� h�" �b��/�!�F��1��z�@�z�H�w_ |������B,0�)�h`Ȏ�dĹ,`����+nMsG�jR�b�Dx�!�X�(*A?c��Oe����'}�Y����[�Kh    �c�ym�`w�]��
ƈ�W�-�a;]�L�\ߵ�8�HF��V���܍~<H��<�T ��G|��gf���Ei��� |&��h���A7��7����nIը�2��^�\�0��j۲i�0I"P��݁�%a�2���X�Np�����jZ���:W��P�f�~��2�i9.�.��}�i�嚦���"�1����E�1<%>�Mj孞��!\T{���k`�\��Bxx0��z菶��3�a w��ľM����Sy����q;�>గ̈́�-�$�q _y�51�cb��2��a ��A���1�Y�e?����� keT<���[y��m�~���q8°+7��}ơ�=���Ӊ�fN�t���0�<�BHY<����T{�1e��1&ԙ����̄eW<��۪p�kB
Z�D�X4h8l�YW�P��E�?�A�d�	�^����B,��&�&T
	3���Wr7,�_JE�D=����d+*�_������R���� )��`7�,��0R�@V��V6=����h��B���~�QT9�uV���� ��u��^*b���Z+�����>-��@�7���A1Wj�����VЁ����x��Te�`|Buw,����O�rb>������N�=�&�flJa\83�TUt��?>��&&��eU_���=�3������g^����fᏨlo���0�!z��=�g�<�9PU�ˑ�(��R���k�e��m=��8�"�����R�f_=������y����!~���j�uxV)�V;�*CN�r.c�7-
lBE[k`�<����ث��3�<=��V6�U��ք�PGi&	>b��
71
����K?�:Gq?����~�/
���!n��܆�l���,ƛ��
cӯ:��("�3��~3ejܪ��<࠿��d�"p?�؈}�ݦ�7<�b��]��*��"0W�[me\B��:3��4����@~=�Lc�ƀ���XYD�ɡ)/[�[�����%�%* ���}7Úe����$��;�}��y���{�^]�V�A�	BB��'�Ї�v2�'w�qR��k���Cy
$����j�j�`k�(dk)-��q��B��������?2p��κz}W��q��`��%��͊��K��#�������΀k��T�h���S҇;Z�W\dC��Q���7��W���o�f�r:���a�Gxv��u�ӯ�Z��>���CX��S�&�{�F�ZUG�ٺ�Z-}�a �����\Ĝ����<�.2�u��o7 !��!�>W$�Φ}fj@l#�Aԡ��1,uZ��k��[ٹ�;ǒ��d���s��:Y�^�̾����ɗHv��lpv�x{eOA�����el�O7AOe>��I p3x�v-����Q�Ї�0�uh�3��D���\A��Bh�F��>�4��Ӎ���@�����
�����t��a��a���Z$+w�GD?W��O��r����Dk`���*_C����������
���9p˿t�9��):��"V�HI�qT?�i��nW/�LC���_t%��m�eN�D�_�>�A�4)������
H30�p��ٷ~���*�xY��@F��W0��P%��Mg��ΰ�����:�s�<(m 4Cfh��ϐ���P���-}�D���'!���ԝ�_G�h�;��J�re�e��x�h�z�;lz���[�M��:�pϡ�B��k̿	��ï̘��;�n���>�Vm`��ht���x!�U��ݴZ=/�0��E��x�)G�~-�"���Feh�>��G�ֆ��O'��+��ޟ:5V��[ױ���ߚ�
���#�5Xׇ���� 5�5	E"l�/d�NC����*�zu ��YS�j
q�ڔ��4�������J�k�*��5�w��G��:��ͻ�R����v��y�`���'*��"x+#������l�ml� ��uL;�p�[��$��d�^3 �_��VW���skFD�$�yY1�xGJ���
P�D���63��bV�<��eL\d\is��U� гV��%}��8D]�{~������Y�j��F8/w��U+�tC�QGȆ�s�+����6MH=<���ÃO�/)'�!�a��Z���7!��*�2fRTv�y�&5۝���C8�V�����j��82.��r���ZQ�4љ�X��Ц�ܲX_����hc}���c�A��)`�18V�t=ť�y��,�ѳ�65�Y��e5Dx*,L\����\����)�z,���"c
*4��Hk�
(x���v|5;��&C�;��e�-5"����)E�����r�9Q(�P9��B�;�wI���k@��Y�W�Y`_l�@`�w�`)߫FZ���%Y�p�o��-�p�q���k�U]�:��osX�խ�S��PY��̱h>ayVWQ�=*J����fG����Ɯq�ػw��/.ZdZ.� �ȗn^-�����˩uD3Je�>��E�*��|��Vg��Ymx� |��	[�S��fd�L�@�����S��Y <k��PT>�LV˥f�'�"�� T� j��c��f����ys�ֱ�?��2k\�x^n&\7��4�]Ż��1{=q7���륤�SBk�°��N��a$��7s��b�Ь4�O��Wd����%7]���{Yn�d�Uww:��[��@8��M(ǔ�yR��\�x�Vn5vP3�}��4A��g���lY�@���<ݥr�e0�=��ngE�QF�����(��P"��Ýi�=���s�a�B�c���YE���YSw�x���)L;�i�xo}@E��׸F�$U�/0�̌�M��J ,j�(x�V}\��NK��(��r*�D���*>I�[f�++��pdu2�m�P�����JG׃����:W�&�aǥ̂QY�ei��rm��a��_S� 0#�J��Y9�7|��.>)O�ĸ�gKԎ	�$�5�|�yN�+`�Yj�u4c�V`K�?������2�V�e^�����U�.=mm.
61B�jsqi�ڵ��}|a#6_>)D�ķX0����p�|�̬��l]C��(X�>w�G&Z�HD��o�|Ee�Nk�~xR��-?{��K+�%ۙ'�Seb�7Y��ߺ��������/g���(-�_�DMZڶ�wS�jm���ud��J���Nז�.�ve4d���cg�1�#�#��s��Y����ZQ��Y�N1��6�-7]�|��JW
���N�u�����Z~c5�:�.��Z�� ��٪ӈ���}���zѩ��/��m}j��}�u���W�	�g�x���H�_��j����X�{�(o�LITa�{oPhl���w|�J����H$>BX;Yy�
Ci������$9���b ɽG$���,9��E
0�;��F囻��,�(�t��s| #(wW����X���$`����"A�i�����)�~}�������k�����"��.+���QRXa�����9<���N7�W:���#VQ�c"�>O�X2Vq�o��s�u��,N#4ќ��@T����FT""�vN�z�Ѳ���5aHtN����n&<��𿦟���aWa�S�EϽ���}Pi��;_�@����b���a��D6�c���|BF��&x̖����4�ȶW@�1K)�3�����rsj"��9�L�K/�[܂O֓zr�Ӭ@��
��Gc��DP�%y%�æTA8z�tm������mOXe�F��`wИJm�bN�^t^�ȧv������^��ԻWM�U~��(����%!�ĸB�Q>%�E�\����c���ԙԨtAk�� ��-;B�k#M��O�)��Cn�\�8�>��	a�9.��r��\�������H�;���j�2^�!r{0�%2��gjɤ����A��4�u7��.�BN�s�u�A����0tFi���o�֒��j](�kw��2X�gj��U����M��.��A�SjF��6S�bOr���%\�M0/�:��B�s�\�1�P��[lSk�!C/�P}�    �~@���Z�ʤ��?�&��u^t�)��î�al�
�ΩEܯ�.��b5��Ѱκ�r �}e����-u֓/H��:��C� 9{���n��H	W}��7N%����u��s��Nm-��-j2��>��#���J�9�bQ�U�����Z4k��� +�!ڕ� O+� �Z1� w�(�VQ7��83����
��r-�Ht� ޱG���"��������V5��sXƐ>t� �T�o��)��uU�l�d�EwXcE�Д�V;eu-c�l�Sc��zܱ��ޡ2*�wM��yZ�fV�8L��,#��f�-R���Zt<x+s�V/4�^�qJ�J�]MbFtJ{vVi���8�Ռ>��,J� �Q��J�F�
�P�)�s�-q���� /s�S}�}�8�#�6������If���6pJ_���s��)j�,�$�.+T���E�W���ڀ��o���I�ٵ�J�f̮���JE��Y��V{�w�Ⱦqv(����Q�rD�"��������멁mY���DV�������|��	7��c��,��͑[7w�s���:hʨ4ۨڣ����lq�*f��Zi6%�t���\K�r���e�Tb��5Z�)��J�o�=�}���i <�4������ز�����A��#}��j���S��DK�%)���5���ѦL�A{K��#+h�-�����Xj���4�?]EU.����.vr\8�����-�Q~��~ՠ���c������F�����e-#kY�D���&�TS�+�����ͻa�ZE� ��6��G{J@� ���|4
����F2��5��G'Ⱥč�qw�1ܧd��?�5��( 1��ϻ���hf:�`rD��/ r�"�\�=�b�)�i5�_|��cOby c�|~���q�7����תO���=-sxB-��y�m�;����5�>�82�'�8*S��&��I���f��6|� ����h��Ƈv��"-�����p g1#	�s�l�1
��=;Ӽ42����'8���e|�]Q�hg{`F��K!��1�o@~�����<�g!��h؜����5dA}L��ך5�/OZ��m���ﺉl}ӹ*�w��4��{hO��_���+�yv�xuk��i��ܺjY��B*Y�q�i���(��/�e�k"�v�abx�64����ˢ`[�ta�4�bP��*C7,Qm����!��܍�ļ�{/X+����}"�O�(٠@�wP7�R�ω~�Qn�1p3�D�^�����T��c8��#்R�.Ѯu��VdN^�����,���2�G�mZށ�:L�^���A����V%�i1}̝U�%����������QN\mF8�{�geT��_�4Jk�J�i��#�܆t���]��
I�]'2 �:,�#Џ�����X���Di֖�4�N9�N�"b-u�X�T[�"m����}�7`�`��Y��|E(1�����jH�h���)$ʧ�bk�(\J�T���$�KP-�e�d���X����x˗���VOe�U["�/�����Y��}i�t��&~+��t
+���m�q )y=i`��c���QH��6Mp�3���٬-sʣk�����L�8b��_��3��z�d$�2����P9�;L�֛@I�Uo����@/9�r����5���Ɏ�ެ�C&k��ㄊ|~Ӣ����B�[B�/�*��R��ޡl۽�j�B۳}&���y�'_;@�{K��������(:��	����h(iV3��"�l�~M�3�)�+�iQ&��潜 �f��A�<k�2�V�}�Q�9�뇣x��F�o�D��_ 
�/G�x�&z���b�5��ķ�G#+�N2�6�/o@s;1c���A5�n�\�{�k,��9�Ǣ�7\
J���E��\kc�`�^���@������
8��zm�4^C����$������|�Vha�����ߍ_�h./x��R"��vh �:�_M�ww�⫧�$�W;(������J �qSi��4���������3��J�1�(��}Wj��c������uW�RghUi�J�;�[¥�6u>�"?/��r�}����y1Q��/r�ayA�gD��qO�M#�?_Ǹ�]��V3�~�m�SM��9�V��(����e��D_Pk9h=q���8/�J5�kU*�����Q����	�'�ױ8me��$>�������|�|��m��`�JC���R�R1x\�0޾j�,R	�ɨTm����lC���=#�&���.�io�_UMU����h������9,�,�.�����	݁�(��z_�����Gg�!h��h=	�틷���k�mh��L�h�"���\�rv�p�C��@2���u;��Wm{��U8����J�Ǥ�iģ�
үǇ}ci�w�<2��d�^ܫ�Vs��l>�x�IS�=���a
E^�<<��x�/'�L��Be�ƼC���B���s�1��}X&�?Zf�6 �z<����C����y��i�~#��]�]D�*g�
���^���D�ʂ�!̉�����kezL�c���E���4ވvͱ]Fq~�1U��:b��β�|�ɀg�.�%�����5:�g^�/TE�yr[�*"J�?�ZJ�3* �2*�pAm��ӏ�|�������G�
�� K��tʺ����g� P�%P����C
V���JrTm��yb^�qJ=2h������b��B��i�9�R�0�S��I�ʤ3z��ĕQN����� G�J�I8�w�A2 �#� _����6k�|�&��%��f��W��wϖ�#��2�] �wu������&����O�n�| �"3���R:�Zd�)�AǢo�L|���aV���EQM����<����1 ^�Y�v��Q<$<]���q�-�h����[e�t�^��Pϭ����)����u4fA�{�&P���8/ �S�(g��: &1���)�Uz�UH!�7��3�0&��� m�t~+O�ׄPlz�Ĉek���G�;{9<�U�d���n�E�%>�w=+U�t�4 ����|Q�������> &	dB�v�k��8yPi@6^�*�v�� 8�8��q���woP1�)4����R*�[=FW��z�5�z��D�lLg�i�%�GtWt����c�*K-��y��-�(;��.���[�9�l�[���t
����_X�20��(]�/C�+*�b������G��Wa��c�����f݌�/��fUsD�Yi��.�D빩��}D	eoL#��mm������󴏏F�1��,��n54�h�b��}x�i�
oظ �Ǭ�<4�d,��	��`.�U��7f������G��������
�W3�����FE�1�Bl����Y(.5�mE��kZ?1G��9�G���a�xT@ߣ����,dY
����*F�҅j��j����6��٩7XGeQ����ƪ�u49NF�bc���/���	谏���Ֆ4�Ks��ۧ'�-��]c��=���)���k�����~�]ƪ::�V+�>r�X�9^��˹K�ES��՗��KWūn�iy��&M�婿�j0�8��t,�8��.�"�ÜBQ���,��̆PK�O4�Z�Dڒ�v�Zeu�P�Owhr3���7KF��z�n
���Bx(�C�(c	4�'�<���óEZ�V*&�{��@)�r1�5��H���w-���g-MND�*z�^���GCug#���;�k#�W�xY�N@��*bJ7��E�x�0X�)����w��Gx^QK	[Y�h�?�Q�YU=��b�(B~K�������!V�S<\��B'�ȳ��lA:��/ �"�_��N��Ȍ����`���� �p�l����E��w��d�[��\�j�~��qI4��!�7>W�gߘR�Ꭺ�!L,40��h����D:�''����E��UC-'��@dr�$�n;��a@�ʆ:�Ƈա�o��8����)�A@H7����B��HB�n�]`P����H�|���ی�M-ȓ5��Sza�ɀn? �����'��,��5L��q���^#&��ì     H�ꌌga�J�W�w*<J�����q��8�����k�Z)�8ǯ ���7�����4�FF���r��ߵ��1�Q����x1�[�q��L6�b$���?`�[mQinQm��(7;�W�r��<@~�����oH����JV/M���{x���殟�{�1?�����g�o�`�pnv��b<�4��lQ��1�S�(�j�㾧�K6��C�j�*G)HTr]���2-�Ėd�,���z��u[i����Oe�F��߰�}�P�)���˚�QO���Ȇ��7䆋GԖϥqwk\����`_���D�B#��9�'�A�%ټ፮#J���~��҂څ����7o;�G3�@E����(�y�)�fxy0�j� ���>�&��4�(Y�	<Jү'�Z��kjp���g���п����`��&�J3�!�X��յU�M_�k��U��zkh莢��ZAͭa�aKw���w�I�^p}C�B���?�[%֞]m�ݴ@Z����4���,f��W�,����oY]���&��v�gM<Ԯ.\!��ˆ �0L�I���̍����5�,T��`X� �__�)b4.�$�W8�~j�_����M<xr�û��M�~����6��K�u����G�d��N>�'Ͱ� ��B��O��e��2w?UR��yVk�-88eꇯtC��ȔI]ǫC#[6�kW��q(��$h��m�_a�V��rC$f�e#�X�>����8;�'��������W������*-h�4��F��|oAX1���}�T�ۨ4$x *=�y���FtP@5k+,�R����#�6�fC�4y�b�� y�����3�
1����^q�0�y�څ}��a�Ğ2�Xk���ۚZNR$6����o3�K*ԇ9���7 ֕w���9�����R+�����V��inóE����I���&��^�E�au���%�/.eǢ2��?���& ֶa܅cM�WK�h����gs&��ZK������$8�0���yg�Ԩ��p�~k8��//a:Vu�����|�iav�q`;�V�(4�4�h������"�U%Q�^��jUgc=�m<�2�U�@��G��6�x&�*WFw���]�48��c�/�A�#��⎉����(3�;$cZ�e">�arb��wgf^���~��TH���ڛ��z)�^��@�TW������h��M�Y�p�lV��uk�n�o�`VSh����*N��n{��ˌr"΀�{����ׇ��[��WD"RF����UW�����2'��u�4V�2n� 6�x��2�y�y��?g ~c���LU��sf��M ��U���N'�x�E�B�j�#�V(�k�d�N W��ëY���I�Hwm�`K����9ة�J�ճ��3�"U�|%��hE	F���	�����V��hn�"���4m�Ӛ�0����&FX�~a�X�� ���pD��WJ
%�ڭ.2r����q� ��}(�/>6��M�v��^P���Q���s��l����3�Y���t�y)���C*��/aѝ�I��	��~讻���ֆ�U�w}a�E�����ׁ�^��ߗoGP8�����@;�s��9��Ɵ���8Ĉ����Z�K�Ya=��9�a� ��4Qֱao��LAA���)�0��>��������#qZc�Va�0��P3��5�f���<�L�m���C�*+�J��Qmr]�Y!�*�~as��M����#`9?��z�R�J��|�{@�8/5(�>��i���h�TN��+�Mش�C zЄ��ï�Ӣ�f��*���ڕ��0��'�ª�0)'�P�v�SR�Ƅ�D9���?��6�������U|l�*�E�d�YO��f��ƚ��ŧM��
!�o7��Ҧ�puE�\��[聦�)��Do<���ښٞ�;�W;��!�>�E����g��1L������Z��x$WN���$�[;&�g�CcU;��� �|0��z�4�F��UڥO�)�y��K�T��(��q�����"�e4fB&Wx�����&$�P���7"UH	��,`H`�Ｆ�7Z��5'�D;��P�BN*����5�F9UH$�_��a��j�  軷v��"�E�^�\��`T����wYrG�EǺ_�m���fUf�U[�vfv��!1Tlӫ)1�Z~���3:�3�;Xk����(�H�A���  ��:�⩁���^m`XY�	���~F-ό&f��A'�q�S�5hWo��+	����6���Z�r�pf��uFޙ��[I�XW½�W���htS�A�^*��!H�#Q�=�$�m"��f�j�7	g�6[�"�����]S�2c#QX�A�1���\<_w�UYx���Ee�G���>O��J�:E���e-.9(b_@Sԥ��Ԅ?�"@JȀ���܍RD��Q�ǎ,m1��/�E㞐gz����t�AQ��9�$�ˋ(�v�x�H�%�p>��|���TUa���vv˴+��ϭ�P;.w�o��,�P�=P9	6u�K��8�����G<����U��'�D`���[J0�����Ưz}��%�`��oP�ޖp�V	�PVc��� ��bb�H���K\TS#�
;��t��w�ޑ���b���,N�M���K*j!��=���z��&9�����Q�E[ħ�_d��Tj�E�v��Gc)U2�/��d������$F`����kҶ��Hr����V���/�B����<|�BJ��~Y�ә��!ڬ�0\�)��~_~ir���ި��o�b;Y�w؋��ɘ��5�sg���XtGW���X�	��(N|g�\��7G�jn�!���M�����5rM~"�\�C�a��fG��T���ȏ̖���ɇ~�kxz�VY��5_ә�u���Ǉ�}����qf��M��?j�F1|��1$ ���=���
�n}` �]֩w�X���uu��5 �N�xv��Mm�j2ˍ��A��vTA������B������N̷�4z�F�b�Y��l��g��"�@1� P��3݇�fOW"���ɨu�Fc:	��i��f��vA�v��6 ����_���w=|d,���k$��;�$���y7�ǋ�8<�D�_E!�">zA�9E�����q:��i��Sq�ӛջhM#Юޝ�x	J �YU_�HX�ߟ�/Jİ�C
n�~ߧ��q����]����� �����:�o���3���;�n�0��M��_����@{r��K�'s:�|Q7��'�(�h�(>���]}�]����
���߱���JR��)�12<cNw�@~��+ ���Eth�S�����@0��qs��ac���D��5^��Eo��ui]��t��5IL�4�Z�iV�@:��)nA9���F5�^ϗ�e��K��s�OgC,�.���7�c;�SG�D&:�Ü�*<=�Њ�����á���7*���a�c���xI�	=Şn��.C�-�RK2h�=�|��!�_1�Sﵥ�,�1�Fpm�&fDG�su��k�=IsV˂���j0�/��?��l�����_���t �y���~6���%;&[P���

�.��7�H���\��{-�5T�l����,1���
�;��0�}q���%�+��PIo�K��QD�6^c��0��q�ʷ�sֲ�݁5}����5/ojA�I����y�]��>�%�H0~v�������G����9�%��?��ҧP�����_g�Z���t�̿w�2�oz����0h�Ǥ"�����g�"v,�t��d9꣧Q�Aݺ!�B�v������@�a;[s(�9d��S<�@�r��@&���c�}^��{�L"�"o�K��`�(s%Y���!����%�#������{��Ⱥ\�z��|���?^eM���ѻ1,�g0��ϔ����X��5���;b�H_yؙ�5�uf��<?D�7#�3�*��@	Cr�a�oAa��b�f"�&T    k4�����n_]�e�w&U�V����Q@">(� I$N� ��3!z�1�H��-��J��׻��j';@��l�0Y��!A��ȍ�����J2c}P���U/�˼p�*l6�}��.[o|b�o����z��̯��h����݌�Ȗ,�8���|�.�P+��xHgN��0Ơ
�"� �Cڟm�$�M��%6d��'�4���	�`	%8��,+��m�"�DQx!�)��!��4��yt����b�9���n8p��u�[Q��֍�����$�J"E|^K2�z�A��|3���S�-�л R�x	�4�Ep��t������@8PW֤5����1?D��:;?4�&��[?�>'&QI���ea���@��d+��t�_�8�ܚ.h�=�`�,u����\�(~E5�W�@ś�������"�����e)�tv�#���R�'����k�4lp'�yeG2q�6N/�a�7�4���C�#b�y����R�?��Ŀ��p5yce�z�9�������X�u�>[s=>��N����k���Yh�\�`(�;a0s3!�cL'�B� /�_��&�E����BWհA��c��0#��l�G��aF[�3���%LP $���H�HF���hH!�G��F�-+�j�*r��_+��F$!fL�XvG-)H�@~� �8��5���_����O����[[�ڛԙ9��-��-$�@Q�H.LO4`�]&��;�~ⲔxbI8��;~�o�>Qpm�ǔ��I�+[��n��P
� !k��\Hq)y�l9�܅��jk�q���xډ�_vڈ�RD�x�����b�<�� hHȣRscU?n�C�a�9��h,�x�?@�h5�e�������ú�J�&,�5���)��Fu?A~�)G�O=��L
iO�R��Q��� }h��d�(:�/>2b"�[�B�1�X�}<q���S����'Uhy&7y�di�=���h�s���Wn����T2�ATb$v���o��R�@k���xj���vb��0��$	)�'���cɿk�_gk�JH==�l����>��p��kI$��=B&�䀍+�/L���Kk5 �XٴaRv�Ǎg�f�Iߍdج�D����#]^p4 ����(]6�ڛ���Ϯ n�_����Z����o��C���vD��f(IgL\
{%�B�hsB6"�i����-<�QX�`�k�T���͊����D�'�ˎ�����noo�T���ތ	���+���
��|�d' E��~а���p�1i�+Da�3�=!,Y~LG�WvІ���Y�gA�#��"�:.d��=��H��)a��6���D�L;����Y���@ }MW@��?nX��`� �����n�/H��΁"��c���V�t�(E�Լi���A�M֋nE%��y篳P�SPA�#���� ����J\+牖
�^��J���χVI�8���v2����0?���`VV�d�v*>R2(/^�*�
��E�L#������{88]F���RƤ>f�zWU�?1�i>��A[����	1���@��}Im��X��x�\��pA�TT��ǻdF�E<��A��3Fԓc���~����엧�Vo�oYG	�3V����O�ba�w��q ��V��(bX��,�$0y?5�_�{^�B�2�<�������Jhr��R
)vA|�ȽO,�e��ƨ7�z��p�[=>��.��Z�3�&XUn�s��oN�a|���h�����`>2�]2�;�t���$$F��M&&���K�Dr�)Q��o�T-������z���	��i��Ui��:�}�^O���o�ĞG�B	�Ư���ǒ���R�d��[�Jiw������fV�M`AgO�4̷�1j�(���f���UT�P��^�wT>��ٝ�sn�������Z�m��,߼}��R>�A	sf��u���؊oQ
�`���4�B��5�ͅ�O��mY���K�:"���N٠��ֻR�'� �#¤�4	��%�٩$i�<ˠ
/I�?�J��l賂O��"$׬�Y7Yv�0��~INF)I=��(�&�L����xcλ��q+�;ԡ�
��a|����ys~2�s<9�AdP��.|�$��(�����^"�t�� #J�&ͷj����*���:%��A�"#����;
>9�����^	#~ʼ�f��E׫0�2S8�0�~�g�=0ckqE`�}0B��N�@�s���k�W��4>N����mM	 A��!��X��<l9�������f
��ɷ?�]<��D���rˤ��91W��_z�W�-�
jt.uT/����,�U�e=E�%M��W�$��)^Dģhg���ź��p�V�F-q q K�I,I~�R�!�m�|6��/X+�;� ���R�&�>B���j���|���D<��&���]'�1�|9�i�e�'�e^&�e�{I,c0�җ宺-Ý��8��3ę`K������;��Q��ӑ�%��S��ҳ|�Ηl ��~��J��š��*��R�oڣ �̞�c��L��W.���hO���(���_"����~�,�Y; ���&�,��0	�(1m���LhRJ<ML`��U�i$%ät2d���lե$��)���x�9����!�����Aar���{��u�����i�DM�k�k��iwC;�!�po�g}��3�梢�=w���6��"[�g�6�2(u/��C�gx��tO�m�����uB���I-9�=�jѠ�i�u�0�"a�30�i��>v"��׸Zy����|�(�q�$:X蚐R��'��U����uP���`HeO"f�S�&g:�our/Ls~�U>[�!���~�d�q����&�-��/WA��稐]5�2�A���'�4�!�k'h	=�;��� w�xu),���SjV-`/�X����6^	>B���'�&Gό�
O@Ś��8�θ��9�&D�'Lr�!2l,�ML��ֱ��=/�ȣG�m�c�v���Rb��=2y�R������)�DȄ+�X���C��4Y��<��! ��������4@Pw���$"ϼ��.'��;�yt>n?�a�X҂A9��A���c�V���ݡn�h>1Y�Y��jq}����Ǻ	��i8�]��t2������7��\	*Bn�D!�l
�V�zv�a;I�_k�4H�A8|�7
vv�_
wiUDK0��M�A �Y7�U�O����&C�] ���{��kOH<�7�&K6�u�-7(��B�ETm�Bd�/9����e:A$7Y��j}7w��a9������(�$�~�[5�M��T�G��x�C
ϓ@,��2��ԣ���Û8oU'�`�V�0B�i%g�MԂB.���5MNS"(�z	����T��m�@#?�M�m���]��7/L���5�0�㾏Wbh(b�<�jJ���%��戸�*gg�͋$u �j~Q�˅O|�Y��FT؝�׽hT�����բaF����羆/�2�c�~I%,�5K�߽=�������'}dDL���h9�H�04�7Fa�d����OK�VoO?�O�'�u���JN�A��LN��L����JG�uX"	�|4��mM
cf�A<���5x=�S���土ZZfq�Ҥ��M�y$�<"	ǂ]a�4�+�=&�l�ʹVe:�c���XSu;���|	�aب�*�;�8%�o�]��^,��6#��KG�\ؖY| #�5W��zA�\��z��u5$5Q��HX؃�D���Su1�Y@P�i�q�C�}�j��f+�5lV��>ljdhA������iZ�!^���wN�����I!ׄP�j�����x���Qi8��4xR�����=

�8���2������ﴁ�زx(W�/V�ᾟ#�G��ʩ��K�5�#,eS����	ˊ�<F�C��5�i�^�`�^�}�_n��`%p�i [_���1Z�Ugz�G��ݭ���<���h���ǉ&�bJbQի�(kE^���{?�]~;��Ͽ���ԅ4����f�C��A+�n��u��L��
�0.�^���f    �XqwF���D���7�GH�,{�sb�O��׫/RNo~ ������9h�-VBK�K9���+�"Ҟ��񫡦�u+"!�����=&�Xz�ak�.k����^�ɓ��@D��o�r6��|:KF=rC�&P��g�2>�q�?+0�:`���4�Ԡ���o��ӟ���l�$�A�%��N7��%dC�m
�%<|TE<?�dF��f�}��Ǫ��m���hR�=��sc��ڒHX��:�]󎃎z?fr�"��_��Zx��628?Д`�u�|�#��ʥ�qGz��U9��w����� M���/i�9�a_�UL W����9���`-h���`��҈����ߧ�~�$AŶg�����N��~�bĲ�5���P�� N��ު>��2:aa����Q y��I`~ݦ����1�ױMV��+���=Ua~���gە���{?��?���%v�[w���������fߟ�4AA�����	�H:�@���}?D�P�/���,�o���\q��!��'F�0���K����1Y�]�@�e����0�����'��m-=Ct�
����a��o�n�KP��_Ñ�7�VTt�M<�^2���bq'k��Zt���6|�[��>�QHTQ�g��~!�Ô�4��P�)U�ݴ�Y�C~v�~���w"q�}��n}��w�vI~b?�\����,!U������
.����C�����O����|&b?�ƛv>�(?�X$��5X��T��H� F	��i`ls�Ir�c)��y�c���utt�Ig<�U[.��e}�W�F�?a��V�����jH�(�n�
�1����o��l� ��&+@ o��/�B��#���[�)&�l?=��X?.w's�:E���͑j���ƒ��5�@6e8hY9a2�QX���6>���sֵ^-Jl���,:	��8t�UtL���`��0�b$d-� ִ��"S~��ʠ���^�ў�a�x���ɲ'X�����,��+�[)i~��@Q��B�]a}��f���"���i]�
:�dа��[s�����<�a���$>'��0���Ԑ�\0k� �9�p4��&���@�ϔ_�3�3�ϟL� ^rkw��YMO5�-�e������_��_�h��(��0u���xxH��s<�6��=TP54�	Dފ���f���
�P3����}#b���Jq-~P&OnVo����9�RS��he"~��i���BV�H{���潶/lt^�,��Z�𖅴�g���x�>[p���~����శ�!z%��ˡ���2C��y��}֤��1�T@�zt�c���O�?��+����JF�-������3B�n���*��z
���7��%6�$�5"#���0�$��a���|��)�I��s	A�R,M�&�Sb*�a��>��XcEu`�����@: ��s��=���@,�V�dxNd7[�Q�Fy�M����o ����'[AT��Kf����:��ʸ��ej��yܐƲ��̿�7�Ns��&��-v��N~Md��9a_�{���p���89�7SU��h��2�b��=�R\����@� kAV�/� ��ƂU�:<9�/	e���1�DA�g�N� �Z�"�$npE}2��-X�����9��	�"Ӏ�ב*π�}ކ����EAb�dy H�%���P�䧃kW��@@P�g�O.�����g����U)<���ݒI'�Һ�t�c"�e�W6l����;���+�����psd#A�Ž�eߋ�BT2���R��ح�mɵ�F:Y�g���K�.m�4���ti��F�x�b\�Ę�EOVvc6~�Ԏ���E�0jC0�Hb�#����{�a�Wo�
|��k;B�\DG,.iǄb"��]�2P��Y[d�ش6�����k+7���4���������E�>�+z��X�0&nL���HJ�V�(����K�S`�;n���V6��*~[��W!������_-*,�4�HȠĢ��Raty?��&���#H�_Ӗ��jMUgo�^�яʯӮXm���O� ����4b��T盎�<�CM�eS\ظQP�H0��6�_�K%\���H1��F��t�۳#jF�CC�8g���#I���q~~���h�4�t3ͣO�s�^��w�<�ֻ�)2w�C~eu�ӡ�kl���[l[jӆA�j��v��ڥY$��l�Q�
��v�ʿ��?�l7�7�M��A����e����_n���x)l���G��<��o��Yp��lN�D��]�uP4X�q�/=+uk����fԓ"7X�N�G#��蛈�8��<�u>�g��Z7����Iwʫas��t��4jm0�rJ��:l�YM�:+�il����|����x��;���p��c�G���V'?6�|����'{�
*�5�D�d��K
U�ZU��a�T��%6�e=�%aP����v��쁡!L�Ͻ�*DB�c1�0�?����CGՖ�[��f�A2.mC�� � {�5kCO�!�`ζ������XQQp��B����ٳ�7���{&/��(o}4�V�m����7@b���%�<�b"<�E|�j���%��soc���e�#Z�~���R]6E�I���Qy
J�'�APf�xz�b�gE�
�S�~S��J�E�n�����Ё�]`�\�'n۰sRN��ҹ'�Sp��+�j�q;/�O$��v��0WB>(�Xɝ�5]�▆�`q�g}�Z��we�������f3�N�~
�$@�-����ω����ȏ\P����c:�(�LB���Q�ݣ�a����7Օ���ಅ�D�R#N&#5bP��d���x��x�O�A�20�ĳ���L������wv#uu?�Eۤ�:�:���<@5���J����`w��������4&6)=�F��$	3��j�0�N��w�4��Ǒ� co��"7�F�x�T�?δ0
e�,����>C�����J�w�9����BA!<+��"
-�4L�џ�e��dVʺf�ܖ���~����b������U�'�ʺ��a�&�,�~�4�oj��{d����A��l�9��=��13��I ���őV7��3P/�(��\N���w�����k�#�!�X]�[�t�	��J�������2��3K�y�z����Bi����Ր2Hc�ɨ��}��-�2$�Y�����&p���nl�V;ɤ�����u��	��w�!,"�,;zoXI�	q%��,y��>@	��)�㪫�5�;Q�# F	lI���x�Aa7�5��m5?3�%2��e\|�j��E��ބ�T<�k�&��`'�DpB-h�gj+�AZ�Jڔ�G-�����#O��Tz[��#A�%���A�� ��h�`X�U�1�xO�����J�ج>�L�$d��a�A����K���������Ż���I�I]�m��ZP���H #�w!�0d��["��� g?��x;�P���X
`�a�5?�1���+b�mcN�0	a4�-��a cd�X�Ð~�N��9Fك��C:��(r�AP��ǰ`p�q�H�l�:`��'`# ���,Oa�R�)���c����K�b���9�Bz�֙�]�ŤD]��pK]��E6Ä�@�]D���^��
�x� ?B� |��lD�h��/jL���`.��&�h���<h� ��Z���vHm���G�@3 �>�M���u�����>܃x@�߀w�}�۔:^9�a�q�0��ŠhN0���'bj�� u��O����o�eIh�؝���Х�~'�L�gEl8��w]^�]l+��zN�ҡ�/b��9�͊ Q�!Ƿ�Y����]�N�컋��u�'¼+* ���{{F5&K�ƛ�5�����k� @�ŢD	�[��I,�ƺD$4Z�×0c3_�-�ʮ��d�� o�]��OV��!���հ���*k��\��0��v�y���K�����Mb #&��"޽�ns�0��Il��ǴCd����v���{ �E���Y{    �࠴QxP�0�abz���j
�ԯ~��=k.	���x���;+��`����P(>�iRQ�'�vX�?�G�0�<3�A��=G�M������5Df�|#�;��T[����	 ��ٯ֮^�bX�Uz��[>.l�`�U��O�w�W���4��]#��W��.���5@Keh'%,�=ʻ�̐�����5�W�RX�/O��E_�I��^ָ�D��Q
�K)�ō�ƛ�}0f��"E��p�o�������h���ը���W�@�z��2�l��>����;X0P��*�p�<-h�z����&Ca�J��r)��B5� m�\X�[�m;Mld���XW|�rj�k�͙�Qm�f�&n61-ԗr���l:�J� �~|�~�{0?���,�ZZ}̚���a�D.��`LjZk�>���s���i ��7������c�ƛ�Z+4l��D̷�8ޤ#���������8��?��7���65�֖]-
�� =A�|�T5��6�o����ݡ�/�R*�^�:�k)}����C'a-�p��P�?�غ��pXs%��̒����v���:�=6� ��WU��T��:�5�+|���`���?"��ȷ��h@t"
�?گƘèqw�����lL��m�������������J-�6�W:�����!���x�M��>!�9;i�(6�Zk�&������8%Ee`cQ�6=0��1�5���۫_-�y=u��@�[�l��0���n����Qb��!Q%���Pf���χ�eL(��))�S��,���_��x���v��sC���2��@�2QJ��<��Q{�?�V�砌!�
X��Z\Xsj���C|_T5����W�H ����R��2��+��a U�)��;?�G��a�t�Og�l�n�_.�n��6	���%���O\��:C׾�M�#j�ެ?��W.�������W�K�%�+�7ר��؛�#,4�>����;Z�o0�9�3j{�-�n/l�o����]�Ĳ j��E�#��Pn��s�����k-�
�#���������-$ʗ���u�ZP��2�	L��E�@��M�5�^�	�'��lV��z�;�F֭C��o:!�g�Յ�}CEo2�ed;�K�׏�A��*��@ޢZZE�NW�u�aD �"9�Ңp#ih��u�s��5nV���*�Lo2 A��4�b�T9X�q�d��֔���
�ۍ�T��<�"1�2I�6���'|1,Oƛ��K��맥��R�V%`�ۂ�:ud�H'7y^כ�^�D��a`Iu��nc*�r�#��g�2C�J�!
�A^� ���J�z��!g��n$U <�v��1V���A�^@0b;sCX)�������bΚ�LBғ߽3'��zt��L;z�K��՗��v���e�3.�x�5k���"�ydr�S=�N�r�K?fz+���� ���T�l��Z����ڬ����ot��.\�����-�t�.�t�~�I�ɢ5%��R��7�����"��T��ƌ�<����<E�bQ�|�W�>|���L~hK �(`�@y�0Hvgd���=�b��T�qDOL�c�4,����l)b\�$(kz�7A* ����]·��.D�/ 'A���W)@������텬imu�g: �m���A*��o�7짗)�(��@��	�Yl���)��9�V1x����!��y�^/m��'���f�G2d����e`p/� �rLb%:����01��dL[��H
��)�&�1��@~��>���0�ɚ$(�Y�v�3/���䘧g��oO�9��p�-��t�S� ���OE�;��a�٧����߆�/Ԁ���r��n�;y���`�B�ہ�Z�t��[���As&<��V��)'�m���-�w�����x�.���($,��^]�϶Q��W��YI8(��)�{GP�IBV��y��ZH��ى�45����Q���Q�d�r3,�8�+�������8	�~J"j�=?��K�m=�6{"��^�L��p�l������/��o��b.���z�{�'E]�Y?�'�����0�*5��H"2� ����q{�2�.��;�஭�j���,V�Q��ʅ�b���'k�p�ݠ���jچl�SEn�)�/�M[&:P�I��z�#�N��$�'�zc9�Qb��:��K�o�y7�g;(�i��~�����l�r>���ɉ��?\Eo������K�^a�X'൰���>�L���'F�j�^�G�:Sƣ���,m癜�����O޿(<f;%�S������ N@E��6�Mi����~0�_|�T�߆�Q!_��W�#@<A��5_$�f>����
�i��k4�)�o%(�ڥ����'I(���ۓ���E��Ζͼ�`! ����۰Ȱ��	N���߳��t)+�&�	Sc�,l;bZ�x��B���$hX���+gD|>��G����C���0>ML��[��\��ך�a���@i����[��X$��1�$#N&a��<�6� pL1���=�~lX˿���͖��U���d��#Ҳ�,��6N��Zd�:톸��8u����;�!Jd2֤��"��>@h<:����}��4Q��8��>�`�v�k�{��������w�b�+�I�#YΆ�@t>".Cb��%h��_�n�����	�X&�h�ŶOÞCd�����ˌ�r��}�ܨү9]��%�^�W�W�y4֜/�P
���.���7,�p��w"���}JL;ayM�A7	����������e����j�%h�3�����Wl�hEi�'�Z������?�����CDղ@����[�dX����FD�@n}z���w����n'	6"ؘ�	M�Mk��m:��s�Y����X���lu
'`%��cX��3�0��2�Y� �jb1��rN�\jD��Gb-C��n����+U�ޯ�ߏ��1�s�����m��)�2�ҨB�5�4ʒj+,�7T�A�$�
!�7^����u��qJ��ʣ2�ʃ
49�)g����q>\�~|�O�����ė��a��[��B����?��W�iFm�T��PCH�R�q��!w:�Z7�Ѕ�9:��(,�����WRoHL7�]�6��3"�Z���r�߂R��kx�k��VZrX7A29�ۑرP��6��l2a��j��*��N�th�3&I����cr��A12_-�V�3ixx?�r,5q��<��@Q+`o��u�b�� ��fur���*�{���)9�LA��]��Jg���2,qj�ڼݦ��._����V����Y�mD:c��(���ڬD
b���:�uX�J�V��꽙�$��}̠Ty�r�"X�1"�� ᇉ���}�����p��Z``�� S0�-��g�D�Ǔ���bJ�+�j( ����_
M�����1�p��$a���"�!��/I%��|�|h����J�����+��`���(�^ż%�3�8��cB%�*�y�2�;u�c�L����kK�FԢ���B�$�ɿr��}/v�ƧOd �X�_�=*�ꗦT�4��wg�����1� #�q��l�F _��'p�+;I ���FZ�[?E/j]]�M�%���᫗�Ƙ=k�n�V���K|��<��K��'l\׺Yl�m	ժ0�8��_��o��a�����+�u�\ ���s�����s�`����Ʉ�oy%��5�b��k�%�����md����谲�2�(�mP%�Z��z�-�
��췎<}�Ἰ�Q�����I�L��m�(0z�&kI*����s�|u ���`A��(.HX�QwC��	�z���4ͨ��ưD��{�c;��3� #y�*�@���A҆���t+5)��)�^�+S(�:��,E��b�=�"�$N��O�l+#���+ j��3���05q��2D��(nhϺ��à._�8�7��bl$ T�<��lh�ЙAt@;]T�c�j7�e]F>�)
�.:����0�wr�]gh{    {�����ʶK������I�1m~~`�`#���x\܍b�.�0�Z��6�h-\�'�"���|$	���ENz��a�'�´q7b��37���b���T�z�<�]Ph�sҸ똴4��^w�K ��o�)��D ����t�6�����B��iRPN�� �8��
�����,��<�q��:��V��}�4`�3>�^�[�>�������gP�}�Nv`���lo<}_.vH%FģX�������c烥��˨�{�PBP_I�T}���!c�u���F�nvO�����A�����2��M�A�%1:}0�SO�b?��c�_=��2����pA�L�$�_�(��*�o����C��lŷM(3��z�D�܄t|�g(�R9��\d7[��hB���U^���{Br�#����K��pd$0K��Aۿ.`�:_SY&x$�(F�#V%�
�O�+R5nyV����k�}��Ծ��s�;ꁫu6ɀ�.,{�w߂ݓ!� Z �����5�ȣ:�� hA@&� E��<k��_����",�?,��n�/
.�G��N*�1�e+ߢ� �׺��]��s�=����ڢ����.bZ�A�gQf�3�J�EB�~��{l��� %g\�Ġ�`.�f>�nD;�eO@K�����LԒ�3����8��W�� ��3�"�X�^�� ��ᛧ:���?�[�j��0�bcȊ�l��(���W�,�U��V3� i�ϣ*ф֌W���Y��O��M\�%�(̢��sm�tK��x\��/~�&'̘Ȍ�x�ݛ���G�+/�%WB�!�!�%�:w�#��180,�?�j���o=����-a�{"e�R����x����b�yJ���d-0�_�%����h���{W�C*�={�գ���{Lp�}�9���Ʀ?z#��\��%p�!:�<�����cǀ���X��b)�y��H����;2 �D&�����	S�g�ـşt�,G�x�#5
5Py��6Vid�����5���u�8��g�ոd�a�c?�X��P�]S�ҡ��τ���D��95�K�w�]���������TQ�#�o����~����S쪠i���KR�R�^�@�ۍ_��H�w����2ͷ�{`�;�x��''�@倳?���_Ð���d��v~vE�l?)���f���<(d���䣍H9�K����~ �f��%�G?	���$��t<O��J�I��2�`+�T�F�<��׏�&J�c�h�������}�����g?��*NH�X_�pG��[<���b���l9@��Y1���Bk�	�a�<�g�4%xg�|����Z1%"tƦ��h��F�bb�#�Dv����Qd���K\�FX�����V�c�*\`S�VƖ�a��@p�}���S���g��4�_|O~X���fG`��A3�?���Fcv��D�����8��+����a��T�3�gUy����� �n���&*�訉�lؒ��ì��~���p�����#=�B�ǈrS pv�m�W��%�|�ޱ��|[*����i>>0���*�幅jpc�˶�_���m��[d�xep�� X�Yz�_� �ч-�}��n��*-2aO%�\���|���TA�A�II
KQ���k�\5������p��;��S��L� ���� &�>�4�����>���伌ؖX�>�j����������� "��`�����&��IN�f�DQ�rH=Ұu��_3yc{~�&��%C:b{�|�x�"(�C�u���V��
���z�O�����-��+Y�0�db9�>�A~����DX��{�w��B&��f��{�M�r�R�oڬJL̦U���"�:�ha>`r���َf��6��,[ӎp��r�iv��R.�i�X-� �w�GnEAZ>o�
 y���.2���n�-w��S:4��9K�����%ύDrH��
S��mM��Oo�<#ju즒����/n��ּ�hma���3�j*�l��w���r~q	����ʩ�1�����G d��d�U��+VBUFP�0|�s'�q�3Q�5�Lj��.�	�����f��¥B�,0?C"�NL����KF;��'�D�c�G�Xl��ƽ��	2w���_b��a��٩�
lG9��{�q�s���/�3m�jv��H�a�1w��4����P���D���T��[{�t���v,���~Sn�%��w3M^���|8�6Z��-�ax��¢9��P�|%<<S����F��4#,����?�C�:�+�݄e�c�֯���5����P���]�~��)��;�~��~��Z?��#�f�\)�RI�������;��2�#��3%1-�*y�q:�pسwU�l���{�w�$ہɩ!�p����P�eW�X_����Z%K�	����Z��b̓��)�&x�*q��bI)�u?�b��~�xش���j�zŜmxkY]C�a���L痗qGӚ�J��<-����`m��t5�ɝ��ۃlX�+�+����^zc�q%%\��Y~�mPM�:�5(���n�e�d=�՗Z��{91P ��|տ�����A-B����;Ε�;²z�H��)�G�d�7��#�#�3hS�c���np��+����"uPE%#op�>H�m4��Sp�u��C�<� 0?Ǘ��N�dW-7,^��gk��n�����m(qđ*Ѫ�E�	n��T�P����d{���V�[R51<l�<�������"3�w����+iG��;^q�p	�1��F���ybm����YZ�HkͰ{��H��X�Gİ�6g��s����(-o�{�Y����B6Vn�Օ��w�T|L@ɀ��!�	���b?�A�ś��܍1 �e��B�
������+h����Uih��G���|�o�����C�&Z	Ed �����S��4����?�q�(���ɻ�鲼4�n�d�sy'����@_Q��;%�����ʪ-Lο肺V2��y޾�I[mE�����,v�ж���T�4Y���'�3X<:(����c�z%O��N&���y�'�t��8�`���'���:��0�bC�;a�5�ax�i�Dd���+��:h���_���N����;$c�]�'R����҈c���3R�Rk��*A$SP%�a���)����(L\Q�h�71�j#��l�DN�I�Wkԝ	p��:,����etB%���X�y�o�2���!>�:��O�t֒'Vז����Gh�/�61���4�����F����vg�8�}E2` �Dj5E8G?:<�<AݢԬ�MaF;��X�aj:�:E�ocO�2ٙjD���S
���O]gm������p#w����n|B�F
5�1�Ԩߎ1�1�})��
$�!�C"fs"X'Z�e�1;`������K��[)K���u��V�ߩ����3�~��j����0R�!oM�&-�Av�� <"�#=-��I�ո��q�7R��?����c�e��)�e�T)0��T3au��,���)UV�DS���b4�Պ�R�2�R��^��`�[�Z#�%ƀ�7�_���x�u��RP3�I�$�Ζ�Aڲ��}����O-����а�S��b��[f�m�t�<.���wd%�cʡ����g~����s��E�f��g��y��m�-��l��vbܳ��������:���i=u���QwjT�� ��]1V2���MZ��<�6ea�h~x;�idW�w�ҧ�ʄ�u^�<T�/���EɊ�!5=��t�'#߉q_�f���	�0�¤�t�O	%	�����	��nb�<�[�)�.�
��X�$8A9c�o�x�5���7�)p��K�X.�U2b�R���o\WR��荊�����Y�7�נ0_��͊��� ��*�H,%^�xl��J	���i�.OHCâ_��GR\.T�	�S@�K���/$��|������617��'��:�t	��B�jR���3��Ứ��E�7Q�5q�u"��6�����3v���-^:�    p�h,	I%U}���c�P�<����3��O��!X��ͬscrk�� ���p
�R!��i*n�x�d,�C���]X��Û��W�&5���lB����c8L���Đ�W��g:�w�V�PɸO��}��g͟4QҘq���Q>.m���V����Y�x%e��v��n�{R�G5cU���mP������%ɭ���q mC|��TY�	�[K0i�:��:w-f�4��b�m�/H鈈C����pN&4��\��d6 57���8�ޯ��}��wn�qc����YQ�Q��H��ɦOˇk�5�R�4�-z���̌z���*_�?��'�k���ƒuw�����{w�Z�q�|��o�.�<��3Iw�؈:>���$���|��$"�@�fa]���Y�~�����lA��h|�?m�g���4|l;�-�"�5İ~�B}p ,X{�픃���n��Z����X"Xp#�������3���b,��JЍ���l�]����K�[-O?�{�D�kD�X�n�9OFR�9>�'���l�V�K�,�������>Z�R{�j�Ȁ��R �h��Vq5����~y����H�/6]n�o�Sl_g���Yr�5rG���A/���	���8"n� 슏����<Aӽ$���K�U���;����:�o�*����Z�طZ�O�P7�����4�j0	~D(��[V V1^d�?���%6NV������<[�,�]B�����O�� x�u�����-F��/FJ{�y��,5��cܡ/ίV�^}��4�_B7�dwG_ձ��^�]�.����f'X�4YH�`��y���mz(T|v��G��/��6�`��rM���y�-��>���'`��Z�{no������\��ߠ�ö<\笳�b�b!����T�5�ë�����/X;�xo��O,�w�C����к�*/0Z]��>.�Z�"�Ī���/| T�Դ�萼�*tDv�`?؎�l6��H�٬�����0���w�	��H����]����'�@:��|{:�`�~�!���|�
���A~ c���黫m��0�v|���s����v��i����٫N���;�O't����G]Gz�3�`H8�,V������Qaz7�V;���B ��G��ڿ,�r�Þ@��}_R-)�D/\~��n��Ut�C�p�	�}fOʦE�2�p{�Xmd�
DƯ�F��Vy�WDR��*��/�.�,���j ��]gt�$��o��0w���Hl�C֬�>�<�|��S ���:��^3�/;�J�1��]мp��F�'�u���zg_f[�
�*�	 �?�s>J\;��� !:���K��+Cf��sP�H�iW���O���5χtm��}d����G �v�yw�"�c�-�u�(a�Z�6�P�>��4%����'��	U��*�ڗ���A��`^?�PCU����C�=e��x
ˀe�da(�|p���х��v��5��֎r~w{����ߠW8Z01�9���.��B��;���J���tX'݁��v�� A�9��]P�^I�o��tk�2.�3�׋%�J�PP�N��6%Xj3O�^f�6�;t��f��O6+�вI�;
T�<�&;`�J�+��F��dB P`��}�Y��PEs��Ǫ,�TFg�0g�hҠ��:��l�Z�n <��ws�Z�u��z�Ѽ�v?|��"���!~۶z�v6����&�J�.���|G��yyFi�eA.�Z�e���U�Ѷ$C���H�`[s����*k���˩D�D���P��<y����$mN)�)� 8�������B�`�)�:PsO�l�X����}t�i샠j��~�!a�?�:S�J?Ǐ[|�6౹��c��[�]/�����A��
��	�iD�a����M����i�X��k~\�5��Hi)`���jZS�b��/H��U˕<���o#h �*`E��(<��"�o�-�v�vo�:1ΊH}J�{יz�])�'?t*+�QH$)��R	}��
��K5�|N�T�x����$�{��l2�4�ׁ	 F�.���0�#��g��nHJ	��2�G����	����#
�ʊ��i1�K"V4�|�[P�/#�����bC��!)�Y��c}��:\o��6������YP��|g���dQ��� �'LxD|�Э����(�h�6G���e���#��a��66nr��XgDM�)�L�i��f�Fe@�!��~���ǈ}�7X9
z����/�ͳ	a������1pHD���G,��J�`ab�����0*�����蓝
��3������3?�)�d�L���w��l���L������$�篥 [���t�J:��(44��{��o��s��<*�͛6�I���ѿZ�"2��2fE�	@t�%�FM�u@X�b��-[ɱj�Kz���7�8r*���*����^V�V��^e���tJ�B�=�7��Y�fYV�Ĵ�0�!�Uf��6b������ݲ,�g��\5^tX,$���Z�g��yv��b�t�
�-	��^���ӳ囪����e� ���ȩƯ۬���HǷ��6��2�p��eX�F�c ���iX�Ě��?�����ߘ��[K#�7�RJ�!�IC�Ȃ	A�j���]� �!�]7�)�(a\�m����`!B0D�nï��zY��4�&[��֨�>���H|�TO��8Cƀ��$ī�6�x�V��M����ɃwH���8s�� ����3_�!�a2?O�5Iu7��J��Q��>ۮ�)�\"4٭-���M�in�_�78=cA��C�}
�����2�ğ-���V>y[}���5�n�k�'�c�d��j6������>0 �lT�������'dGZ�v1ߠ�
(2k�wݺ��d|�Z7��:�F�R���HQ
A��]������c�]��:8��0ա`v��&䂹���A��Ʌ��o~t��NI�U�<�.���j�����E�#aL?n/E���【�Qd0-C~���(\�+2�(�^�C�6�[��_q�[�/ӵ��v#�&$*�$�ߏE��&��8�g��9h)�m�����X����u��������*0�{�u ���8{p d�?�H* <�n��D5�$uVMn���ޛ�8J�6�K�k���f(�z��,�fUP�H.W�+�2�(]�yA\nrצ�ړY��fuur��'�bp.�Q�T~����q��n���R�[|��'��z���,55Ii��l��4�K�kj�j���7V��њOA�M�j��7�ɥh��Bj��!�U�GEf:J%"�j��ve��9>�`;Ⱥ�B�6�u!����G��@�Cpe��YS�Tssr/��)J�3+x�v��jI"��621��ՏPK`���Gr�DR��>����
YK�ń�*k��fʻ����HHK�7+Ϡ�hrS����8^��=fM�����颭�Q��7�m2��ؒ��:3�1*� _��n��އ�;fXE��<?�6�Ɓ4;ˢ^~^���vy�-�7f��{�HJ�<f� ���j��r�~���x&j{�|&�⟪�zs�γ���~�\�~Dk�9��F�[�Z�7D��15���5mW ���nv48��w��2��$�8�&O� :��&��ڢ9D/���&�*<O����hx�CU]����S��D6�{3��d?�a9���f��L�����J��h!�0RKea��"Ek�%�Ü���ɤ�T�l�a�ϴi�o����m��	B�Z,,��J��?S��̧+��X�ܦ+��������JHCuۋo���/R����ɖ�N4	'���m��&��Qҭ�$�� ��PU�H�>�h�x�Z���Nڛ% �ے݀.4|^�؈��y������ wZ܌ ������F�T��F�pQ���f��b�$�� D�&���Ŝ�4�YAh�ɒ&`-�9m��0�*Nĳ��Kf>�K��	Ճ��cȉ    ��=LR`AG�t>\�ll"am��{G{f����~�[�M���ȴ	�cZ��r^�@NSgPX	n��,�opV!´�X�+�]"(�H����E!�ȲW9���H�`�_%����&�v�&+�łd�C@�V�.H:6�p��R,��7�/�c�)j�~G� ����o��j+vPU�b�_�/��H�93;C���]�*뎜�^���a�&�2�r���?wW9��Sb
�&AY��!S�H�J����䎑~8����"�h�Ծ� �-��Mm(�z�8�`���zD2�~s�Y�'x�$[i:�]L�ek��d%Nt�Xh�N/��kQ���[K�ƻ��up��~�̓��Zܵ«z�K�,]�@!���@6� �A�ivk����/7}�jd5���X�a���|#�9�BX�ߍ�cX��t~�����籚���%�R���!��>Ng���S��1L#�U��a��8 ��elZ^��n�����g@l��Ab�J��J�}����S/+�8�ҨD�?rbR�"�	��e��먀5,���;eL?������wc�5����>"��^
�a�Ⅾ~�z���v���&6���Kv-�!j:���[+6�T���z�q�F�����4��g ŷ���*�Qt
	;'R��M��9�b����'�|[}I���7@�*�[���o�V�㮭0-�u������7y�3U���i���V&�cx���?��D�Q�	�dx?��}���bE$�A=i�Ӡ��τ0�M��IȆ���U{N7���E�%5�����-8<��	+���XoIqu!m��5�J�J�e�,����}Z�O]��ڰ�_�����ǐ�W��F��	���l����X��`g,MY�w�7Ċ�	]3�tCῸL�	�x����8Df�u.�%.��M!��z���f5`���5զ:�Z���d�m܈��I�H��'zuՎ�+�*�t�K��@��B��S=i�޴��2�$������1{�ZT�����.%7+Kd�ԇX�E"��2w��rkV1�W�*���b!�p�J���B�����Nޢ���hL~@$3Ä���z?�>wdc�!F+$ӊ�=��䑛d�t�X��KP��99��i�G�	�P�.�!�;��I�!��u=�AHH�p��z�茗�N�q{#,��/H���(XG}�^r��l,��^ZQ-�u��檱�j�L���hC� ���Q�B�]��{	D6>|:B�#?1����':7r���-E6�Jja[���쑖k��BG�k(#�a��èk<[wTP3�WSy��s�,a!��Gi�{�y�G�O�Zü��&�џ�3I�z�$9�.(&�<I�b�SV���B�|5vF[��Xb5�4��k�C}(��M��
-�J����[K5�;��*5e���yRlg���%���⿅�8l�bc�<šլ-���MPa�Y'�0;O��#�<���ݘ��|o	����Rb�6��&��k����O�;�G�� 'ݚ�d�E[�2�r�?L����|K�3J�U����
��4����o.�W_/�^�
�\����tb�W<p^In���w�4�P?����ư����Vzn葒6��ͷ8�����_�+��X�*�!L���-,1j��r�#7,����-ec6,��i�$�sL �=�ـ�G,����5�Q\�R�JW�a��*`)9l�#P&6&�	jX��ib"a� ��I��&��,�qX�)`�J�g���8s1(b����隮Jj���a����V�
ꥴ�#o� ��o*�7<�D�- ai�X�$cz�ސoh S�FX�`ꘊ�	(m^�2(�bd�',S���Q��?0TMxgw��6�4�����X܇��W.�m��3�"�^�@���t K���!x���C���!%֜n ��:KFz_tns�9aׯ�CCqP2툑_�'k
�FǞ��Jw������tj;Y�E�����w��J�˰C��9nLWS
� ����d
��!�������O�U~D!`Ø�\�t���]<�61�7 �X�Y��r���2��e���:����*r���wz6ղ^����v�j5X���c�f�:� �1��}Qr��d�'W	Eq���W7V�������T[�G�)j����3���j`�U��+����.9��دɉLF21����5@�~�a�}7��>ٰ�/�8s��hL�ֱ���B[Æ,/� �뾚�]�tBR'�/��q�q�
T{D9���L�oOR�	E�N�{@�?��|�@^�c �7�: �[����6*��� �_Լ� �J�/X3+[�J�����C ,��Câ�ǳ2���xT�K�u8�>Ҕ!	~����LF���g
�}�U�Z23�vH��{F��I�_�k�܆��0���cNw��&u��¶�YA��-���Sت*lmk"�l����C�Nw��f�F_����I��
K��i����?ߖ% ���Oah�ȫ#�4;��Z������YZ���.�57���q�sh���v��	��D�@�a���
�U���ש��\��7��.ٽ�{GF���+�`� *î_�E|fQ'��i�/s�[4���Y����\[����gҖ o=�~1�%�A�%������?U����*��b�y9������z�␰��dj�<�l�n-!���٧I�-�����F�H��Aulm.1NN�ݢ1f��2ڐf�s(1��ۘ�^/�m��.k�q�E��|6ˀ{�@qk��,��L[Uw��;ӏ֞&�#���/� Xt�]�S�Y�o��#|!~9O��X��W_%��y����.����;|K ݻ��ms��H�|D=N,������Z�A�f9P)�44����=|L~�7->��j8a�;ƥ��|Y��zJ6w����3f�M�ķ$��M���M���f�",���b!k������w>1��o�A���0���r��v~�N����j"�����q�lUY�w
4p�Y�&�3�׷s���5�զ�PB��dG�����R�9�\$�*�^�����m=4��D:h��P\�Y<�"!����Ϧ �lO/V)yX�N
Uzy��S��&5�Q��_���ߔ�JUb�A���,�בa�������B�ӷtB!���� d�ޯP���/~�`�{7la��_�C���bN��i�g�;U����{|��	ܽS��#�{�N*� �+� B��4���$+����0F���2�F�*+f��g7��[�I��7u� �vXil�些���W�@���A2<��)^fS$�3W��
1en��* B����y�<�5�V���s}~���z�+A����P@ib�����n�7�`�Ֆ+����%�@)��8��sG���c�~>��4E�Z�ck�'+!�yYߛ.�t�c��3����7_��W��p���h��s�5��@_@n��c�L�F�z8x@����B�(	�B� ��C�U��OW�ހȕ0�I�/�v�����-6�g<����T ���X��P����=�����%�����/C_��XlF��);��fDl>jK�V-;=����^|��q;?Gw~-�Ɇ��������H��7^D8?%a�@L5�=��J'+�>\!|':FaG��pX���^Q<֐�,6vCBo_�V�.� ���.)�`,�"��D�ܰ_f�a�ߤ7�9<?�����o4�Hf�2BI)"��Ǹg�6*�s<nC���(���bE�Ic3��HKfvF�D:i��;"��,�-��0�H�<��=����_@�ʪ���;?��[X�Q�!�KX�����#�g�i���P� ����Y=kPMKF�oU�`��C������%�RniJ���grakb��3d�7x#�4�1!0O�����s1�Uܭ��+3O~(v��#�����u���<��A#���{~����V����Cv��G67�>�v�Z��?��^��U�ޅ����~��X-uZ�R�;5Eg�'�����i@OV8._�i
8�DK@|�����g�wL�u�YN"�>��?     C ڬ����}f��1QM�:�u�po۳?�W�S�p��R��p9n�wǪ~��f'��we��d,rG��m���b���b~+٫�r~��/��=��L�/��i�����}:Í��к������2�?��]���:f��L.���1.�������_���G���7?a�)�ߕ�j��v��+�8b�/��ƃ���Gi�:i7�����2�̏�n	�`-�����Q�J >MT�B��Tڀ�.�-�#W���x������kD�M% �����=�H0��E/�C.V��X�+�v�9��m=� ��'f��Е�
�d9�y�����mR#��W��f%Ã�T���=ʰ�O3i[%��j���ُ2�}�RHj-<����gf�
`>��g�A,���ڦ��ʀ>A�!�P/
��:�A�,�l���mE� =��hh���~�~wr��D]컭��nGG�cWe���'z��~q�������1p6N@l3��;u?� 6�,{��)i�.#��>�	��?
���'�����@X��M�_��|��?#� ����,A-�������? �=XH ��.st�:��WrՑuo��z�ڶނ�.�3��������t�duǰ����|��@��+C�Z�y��)b����NgOd
a�:��:���`��p�[\ ��0<��*�dRiE���Jc�c�n�ݣ�^�����^�t����ǥ,n{sW�b��w���/na;-,Wo������l�t�:�󸡚��%�_��9 ��Ƀ*���#�Ih�2LY ?�; �,,%}T
�\�#�f�RX��	BaפȀ��ݞ��G�aSŘ��z����>|��灞<T��#G�LV]e��ZE<6t�y�������a?��
M��:��o�S���l�T�N�����j�)��D�@����c�����j��R/���L�'iQPY�(C�Ip4ӫ:�ZŊ�#��3���G�����^ѝd$F�
�Y��5����o��yO�~H�僱�Є'�Űl�
�Y��Z�6-{��X�q� ���Y��s�t,��t��#U�*�	1I�ܚq�bH&B�U�8	�6��8�x6ڪ�L�l���K9Iqٲ�,G�P8�'ZSa�}d�_?���� *����i�#�
?[�Nx^Hl��}����n�a^'���ō材���&R��]��BL��A;��
��'�:sa�7��8i���c|l�A����yx'�b�����dF?�s�>|����o�2F�_K��J��*��BJ2k�����f��*Ec��M9����`[+�$۔�zx���i�ut�6ܟ�"jo Ȕs&��cܕ *��
�+�J������sQ�=����iK��'�9l{��/�$�0��amB:}����ֵ,���5�+���7D��c��r��Xjy��DSp��� ѡ��ҋ���1�9'� ��3ģ^��̓�5t?ϝ��7]�4+bs=�|qGj�R$�ۓ�O��s�pЄ/5i%Lj����k�4���ˆ�un(��X`��,�Ɗ���%������y?����*O�Ȩ٤���&���L�@�0�\.W ���_��BqN�JOާ��Y����Iq���C
�3+�{w$�,�e����tx5���m��ߏ��6]�ɏ[����6 ��Txj�{L�Y�Nd!��T�����Y^o@��G;Ob�˴)(�F�F7��u#7�������;*�l6���� ���ߜ�I��W,��\Y�^4��]`-a.�e��N��dl�f���~���e:`F���	���8;��� ����S���7�EƄ���O��23���>��;�"�H+�<��!�(�-�Gt�#�+�ϴk~O��E��I��x�7���9@�O8�������2c�ƚ/���c��g1���PU���y�s&2�f��9�HM���N�!O�%g�~���?���yr�"��_� ���F���(�׃+=�v��x�c�J$�^�o%�G����飇a�j&�?� B��ȧ��垁cA����҂Q`L7C0pZ��E���D�2���C,�
>�qLob���8Bj��@��������pn��m�r�q�%N.�E��9�f��<�W�7��:=<��6i�TN��X��[b�!0�?0r�����쭳m�><P̉���;�3c����Hr�����\��>� ��Ѡ��������.�^������~�a_�/�A88+s8�E�q���݄��F`���/���t�nb�/�����.�����cl {�ҟl;���L���xgn�#�
N��Ow���
q��noJZ��m��і
M�ڛk�S4�����y.��U5]D��������q'��4񽽼u(/�+"�-1�o>=[6��s��<���4c�,���𝾴��O��}3�v����P��>�'F�:#g&�1�BQNX"��m�k�z@$��''�1��F=����F�ʙH*��z�Q�E��L;s����"��o�4>B�������4��Q&Eh��������ؘ+�d�m*<�P�����t���޶׎؀���+�5��f��D���{;��~���br(���N)�����IR	�����~A�y�e��!��<�D����Uj��<��,&��tE��̪`��*e���v%�0u�p�
$(�L�;��6Z?�; g����&[ C�'���*�oɃ{��;ft]�[��14ψ '����G�(s,��U��}�7돝>�|#L�q��1��C�`42�_?�t���~]w^d ��#f�=��|a����[T!_{x�Z^E�~h�x�a��`m:�\*�y?Zd����Q��63�ӏ�
��,v��O�'�n]Q�c ������Kt1x �O�h�[��t�4��e�_�
[CtF��%Py�Ґ~�A!�����2s۴�lͱL�e�J1>������Ws�f�4�&c�Ml���M�	�f��
�%ٟ��I9J,���@�b�T�I	T�b+w�)b���T����s��M�d�}�YE�E�Ԙk�L�r�Y`��{�r�Q#��@��$�Ĥ|����f7[�F1�;�D]��e���L0�݉?��F�~u|��F<B�7)V0݄�.N���׊�0B� H˻a�׀�)��9U�%]��y?��㉐�O@C��^�a�}���mpiU�~|j��NW�88&C����ȸ���.ɞ#|ɬ�� ���vl�7���5_� �j0A'��HB +H���d�9Hʗ#��I����Sh}��ah!y�5u����j������q:�{�����r�&�捂l���C���m��_��o	�y��(q��ߨ�x�et7���b{�T��L�h�Y$�b�=C�A�B8��,�.����r�j~O µ��ݢ���ǃ⹽M�¸�/���Y��Sc��$5g(����RyB���d�eN�%ɅsR���X#��>)����HSt�1�&Կ���E*��������c��$�������|uJ��S�[�5��"j;�����[~�j�K��& �kU��9?lN)���%�w�j�7G)"(��%{O̟���k�]�R�un�QދE��<(�SSx�j!��ᬈ�UǄ�'.n���@����+"�2�I4��6�xw�y�#y*��v͋�аE�$�z�,�Vkz��1A�@��8��fy���N񷬠��=10�Θ"��Uݘ%a�K4���c�:���MH1l���{P��-h`�|�T�R5�Y� �L~�Fz���69��³ !S+S.-*�flc<k#O^�9"�'^���x��[
~1���~��3X�Ao� `4ǡAu��3�|̸/Lyۍ��d1h�I��G�יΥq?�"����M|.�_,�^�֒��H�vWe	���Q���Iv��o辽Ө2	MP����Z'�����%8; 	���=〯�� �)ŧS�y��8��I��+tN�;V���!9)�3lQ��y8�&V� M����LH�	{�m�b؋Nf��["}�^�*h��qw�% �	  F�H�&�pn�������*M��,��m�.��.V�?^��4(&%�	�:�+Ko�aj�h:O��kb_���������ͅ����M{m� �Lؒ��08��$��m7>!�)�;��2^�#M�~B�2���D�L�h+���
�z�-��B���a����j2�9AmV���O�:E���(W�m"Ԉg��	���!g��s���X�����(��)D�F��T�>�0e�$a�O�3J�ދ EGztLD �7��t�Cɔ���<*�na�����%nA�����_Y�$I��!��s�zs�G���E����&,E�D�hsx��E�H�D^מ��*���A�n�X��_ '�N�O$p��H?�]b�v2S/�&��/��D��w��V߆��n�m����\�n��ޘ��`,P����f2]�^��J�(r��cf�ʊiK��)�"���[S
�j2S��0l6l�ɩݍ��K���`���P��$����Qp�Ɲ�Ĝ�Ս;��-g۫i�yrC9��f�&%��diR�$�-{�;��Q�����nA��H"�<�������y4D+�? ODU�m���gLYd�x�!`S��]�kFF?��V��,�w�wS�!{H�u�(�%
��)����ȽU��vJ|�y}Ͻ_�rd(���������B2[}3*r����֓S��0�]��c�7 �M�*��p59Yy��?�Pf��q�Xæ$�bH@�=���9����u����e=���f`:+�}����6��*gu�Z�����	�ϦD�P� �hݒL�j��31E���
�?٤�g��Q9`�{1����4��	�ſU�F�$Q�kL����,D��~��ۼ�'��?����I�t|����"i'_60ހ�W���1X�� ����u�ިd$�m�q��6��Lݷ�ȑ��\25�)�L�yҼ�E�F�����An]َ�2u�n2盵�T&!;k����c��	w�3��6U8M��kw���Ib0X1�0��)��k7�4&�1�Nk�s+���o����d��$W��|�la�&3��;IiZ<�mq ,����N�����+OM�����N�o�xJ�H.��O�/v<���v��ڟ����]bٖ}8 ��298[:-�N!&�́:�e;�8���\R�!E����ك5��%��X�$��;)yE�SWoC��������8fr��6P�$�፳�3�4mB�S�!���P�Z�Xs�'5� MV$м��,�	��=ꙸ �m��m٢�[����p^\��9N!qv�A�����M�y���$��Y�0�h�6(��g/�%N%�6 ��I�Y4R�{�A�tf�>1&�lGW�1vK���8/V�I�i�{(���Eb��tb'�Y������V���� c�������ǧ�"�d�dy�՗�j�H+�K�=_-,h�ñ=��J��u������j�yҴ�4����@|z��@�^��<�~8M��z�U.�;F��S�L�8�S{*�Ҍł8�o7�:��@ �
�"�#nX�6�+`�Mu����SZ����y���〼=-y@n4�͋��q���I=^l6٧Ƴ `L߿oaL��ZB� �7��B���W<~ob�G��i8��Q��s�w7��O�*�:�U��p3�1��~jnLN�$oŋ q�t�M	I<}t�I����cL�
�73DB;��|���;�4��J5N�&&�P�"0�ng�jRf��
��:���z;<N���(Y��V�ȍ�<U�d}�a�t�d����1�o�M��u�ţ.qrtN�,��)��'?�8^������O��şm��]�-���������I�����ƅq?3z�"�t����EF	0��.�Ѩ��F��س�E��'>�_�SL �t��'��)�e�9]lP����"]�ྃ���4��] ZK�����`���}M�y�NMn|J�n����T�6z/CHx�I�#N���9o�7��!�J��Kc8SS�1���1L;8��3�~�,�h����(��cL^��ШNg���M�6 .�<���4���`2�5TR�]��qd����~�c��Fi�xOH4�?��+��L�BqF�z��/�J�6�b��:�V��ڤDc�2��WXb�3Y�����~�ӳ-s{����%65nn��T��x���ֱ��;�tbtiG}�S��*��!�U1j�n�U)���c�@��rd��dk�6��pk����fks8x�;���"�7�+���1Q Q��W/�l	H)0��Iڥ`�5S4!�y�9�F}eR���j�7�Spvft����	0O�|��#���B���8,�h��D�3t��Ө&(W�SZπx�W�[u��&�@��G��M�b��5%���y�}yGѤG�"�L��TO�U3�dG��\�w!~�t5��ɭ�x(�,E�7�D��qt�� (��|�x�����������O?��_�d'�      ,      x������ � �      .      x������ � �      0     x�uVM��8=K��os�V��#a�lj�����^�ʺ��YCr�_���0�3���I�~ғl�ҋQ���JU�F	J��R�Ȯ�� ȕ�궗�n٣��u+h'L�/�=���tM#_�_�W��~I��������iJ��R#��Jw�@����Ү֍�媖����ҫ�*N(�˦Q�����h홏��i!\o�b���X��}/f�ʬ2p]*v\Z �������bˎ���GV�-{v|�E\5m��$���kvZ(���j�a'��n��W�ٗB_�].�D��&�qe�ؼ�M�?g���؉iadWc��f%;	p՞U�$R�;�I�(�+�>Yʮ�����l"�*g[v�;}]��#���l��ܜ4X�l.��$�]�47�'[�`�?V�.��;�&��f#NVS�7v#��U�ԑ��nL��!�ف�`'b�d����4CY�8��V>����V�g��={-��y�% �V�\G�v�2�|*�j�^H+���Qҫ{���b��H�5{10�gl>���Khet5��[�4�
��F[��S]n��zɾCkmԛmԭQ/V�X���
>�]Z#\g�=�m�xm�ߥ4����i����}haS��&��<:�9�!p�V|�r[��Vֵoq��M˹��O�M�<�v��^g5u�qh{�k�t|��Eeji ��D��4�}*�ݞ8F��~p��+9`�	s�C)�GȊ��v��U�:�&��g�]�&��-9�i�Q�N��@+A6Ͽ�����6�z���2�r��C{��x6�>�Х=H�ɬ�#�G��6�s�_9��`+����5���RI�|t�8�`&�����0�\�mz?e���X��!9N� 5�O�s��9L�&Z~�ȡ\�����[�5G.�3c�jN�y'�y�T��#_r�##Ѕ���;g�v����B�ZMЊ#�Ԡ���_7V���u��k"��G e>��8�S!.��)�bͱW�ga)�.�CϞ�n�Qd{����O��T<f�{{� W���g�=�!�����G�W��b,@$�$P���[�	`����)KN�X��y�GN$�vÐ�rÉ̈z����ģR�k{�Q��*��^���J9	�B#C��$�%'���CV�F��X=��S!d�[XXB������n��]�=0�[�]uc�*�q�*���P�[|���Y�Vc�_���M�'���?�Y3���{���`eN���܎Bk��ib�`���hS ��Nz�ל�<��RK`}��<t��:*�ѓ�Pб��`����3�      2   !   x�3���q�v�2��]|=��b���� t��      3      x�3�4�2�4�2�=... !
      5   �   x�5�I�0 @�u{�v�(�
�qS-B�����k����7�0Z�	g�V��h��kʁ aa,
��g4[viozӦ���t$�^���[���r*J�f-������
%��5��k�z^���O�:Zп��k�Y=s��e}7	䳾Os�L��ۚO�>z,C��"�e�'< �G>�     