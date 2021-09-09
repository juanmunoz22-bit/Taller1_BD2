PGDMP                         y            Taller1    13.4    13.4 =               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16494    Taller1    DATABASE     h   CREATE DATABASE "Taller1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Taller1";
                postgres    false                        3079    16495 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            	           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16505    funcionario_alcaldia    TABLE     y   CREATE TABLE public.funcionario_alcaldia (
    id_funcionario_alcaldia integer NOT NULL,
    nombre character varying
);
 (   DROP TABLE public.funcionario_alcaldia;
       public         heap    postgres    false            �            1259    16511    funcionario_registra_vet    TABLE     �   CREATE TABLE public.funcionario_registra_vet (
    id_registro integer NOT NULL,
    id_funcionario integer,
    id_veterinaria integer
);
 ,   DROP TABLE public.funcionario_registra_vet;
       public         heap    postgres    false            �            1259    16514    veterinaria    TABLE     M  CREATE TABLE public.veterinaria (
    id_veterinaria integer NOT NULL,
    direccion character varying,
    telefono character varying,
    razon_social character varying,
    correo character varying,
    aprobado character varying,
    contrasena character varying,
    localidad character varying,
    barrio character varying
);
    DROP TABLE public.veterinaria;
       public         heap    postgres    false            �            1259    16520    VistaFuncionarioVeterinaria    VIEW     �  CREATE VIEW public."VistaFuncionarioVeterinaria" AS
 SELECT fa.id_funcionario_alcaldia AS idfuncionario,
    fa.nombre AS nombrefuncionario,
    v.razon_social AS veterinaria,
    v.correo AS correoveterinaria,
    v.telefono AS telefonoveterinaria
   FROM ((public.funcionario_alcaldia fa
     LEFT JOIN public.funcionario_registra_vet fr ON ((fr.id_funcionario = fa.id_funcionario_alcaldia)))
     LEFT JOIN public.veterinaria v ON ((v.id_veterinaria = fr.id_veterinaria)));
 0   DROP VIEW public."VistaFuncionarioVeterinaria";
       public          postgres    false    201    201    202    202    203    203    203    203            �            1259    16524    mascotas    TABLE     U  CREATE TABLE public.mascotas (
    id_mascota integer NOT NULL,
    fotografia character varying,
    edad character varying,
    nombre character varying,
    tamano character varying,
    sexo character varying,
    microchip character varying,
    especie character varying,
    peligroso character varying,
    id_propietario integer
);
    DROP TABLE public.mascotas;
       public         heap    postgres    false            �            1259    16530    propietario    TABLE     ?  CREATE TABLE public.propietario (
    id_propietario integer NOT NULL,
    direccion character varying,
    localidad character varying,
    barrio character varying,
    nombre character varying,
    telefono character varying,
    correo character varying,
    contrasena character varying,
    id_mascota integer
);
    DROP TABLE public.propietario;
       public         heap    postgres    false            �            1259    16536    propietario_visita_veterinaria    TABLE     �   CREATE TABLE public.propietario_visita_veterinaria (
    id_visita integer NOT NULL,
    id_propietario integer,
    id_veterinaria integer,
    tipo_visita character varying(250)
);
 2   DROP TABLE public.propietario_visita_veterinaria;
       public         heap    postgres    false            �            1259    16539    VistaVeterinarioMascota    VIEW     U  CREATE VIEW public."VistaVeterinarioMascota" AS
 SELECT p.id_propietario,
    p.nombre AS nombrepropietario,
    m.nombre AS nombremascota,
    m.sexo AS generomascota,
    m.edad AS edadmascota,
    m.microchip,
    v.razon_social AS veterinaria,
    pvv.tipo_visita AS tipovisita
   FROM (((public.propietario p
     LEFT JOIN public.mascotas m ON ((m.id_propietario = p.id_propietario)))
     LEFT JOIN public.propietario_visita_veterinaria pvv ON ((pvv.id_propietario = p.id_propietario)))
     LEFT JOIN public.veterinaria v ON ((v.id_veterinaria = pvv.id_veterinaria)))
  ORDER BY p.nombre;
 ,   DROP VIEW public."VistaVeterinarioMascota";
       public          postgres    false    203    203    206    207    207    207    205    205    205    205    205    206            �            1259    16544 0   funcionario_alcaldia_id_funcionario_alcaldia_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_alcaldia_id_funcionario_alcaldia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.funcionario_alcaldia_id_funcionario_alcaldia_seq;
       public          postgres    false    201            
           0    0 0   funcionario_alcaldia_id_funcionario_alcaldia_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.funcionario_alcaldia_id_funcionario_alcaldia_seq OWNED BY public.funcionario_alcaldia.id_funcionario_alcaldia;
          public          postgres    false    209            �            1259    16546    mascotas_id_mascota_seq    SEQUENCE     �   CREATE SEQUENCE public.mascotas_id_mascota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.mascotas_id_mascota_seq;
       public          postgres    false    205                       0    0    mascotas_id_mascota_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.mascotas_id_mascota_seq OWNED BY public.mascotas.id_mascota;
          public          postgres    false    210            �            1259    16608    myTable    TABLE     �   CREATE TABLE public."myTable" (
    id integer NOT NULL,
    id_funcionario_alcaldia integer,
    nombre character varying(255) DEFAULT NULL::character varying
);
    DROP TABLE public."myTable";
       public         heap    postgres    false            �            1259    16606    myTable_id_seq    SEQUENCE     �   CREATE SEQUENCE public."myTable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."myTable_id_seq";
       public          postgres    false    215                       0    0    myTable_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."myTable_id_seq" OWNED BY public."myTable".id;
          public          postgres    false    214            �            1259    16548    propietario_crea_caso    TABLE     �   CREATE TABLE public.propietario_crea_caso (
    id_caso integer NOT NULL,
    estado character varying(100) NOT NULL,
    id_propietario integer
);
 )   DROP TABLE public.propietario_crea_caso;
       public         heap    postgres    false            �            1259    16551    propietario_id_propietario_seq    SEQUENCE     �   CREATE SEQUENCE public.propietario_id_propietario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.propietario_id_propietario_seq;
       public          postgres    false    206                       0    0    propietario_id_propietario_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.propietario_id_propietario_seq OWNED BY public.propietario.id_propietario;
          public          postgres    false    212            �            1259    16553    veterinaria_id_veterinaria_seq    SEQUENCE     �   CREATE SEQUENCE public.veterinaria_id_veterinaria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.veterinaria_id_veterinaria_seq;
       public          postgres    false    203                       0    0    veterinaria_id_veterinaria_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.veterinaria_id_veterinaria_seq OWNED BY public.veterinaria.id_veterinaria;
          public          postgres    false    213            S           2604    16555 ,   funcionario_alcaldia id_funcionario_alcaldia    DEFAULT     �   ALTER TABLE ONLY public.funcionario_alcaldia ALTER COLUMN id_funcionario_alcaldia SET DEFAULT nextval('public.funcionario_alcaldia_id_funcionario_alcaldia_seq'::regclass);
 [   ALTER TABLE public.funcionario_alcaldia ALTER COLUMN id_funcionario_alcaldia DROP DEFAULT;
       public          postgres    false    209    201            U           2604    16556    mascotas id_mascota    DEFAULT     z   ALTER TABLE ONLY public.mascotas ALTER COLUMN id_mascota SET DEFAULT nextval('public.mascotas_id_mascota_seq'::regclass);
 B   ALTER TABLE public.mascotas ALTER COLUMN id_mascota DROP DEFAULT;
       public          postgres    false    210    205            W           2604    16611 
   myTable id    DEFAULT     l   ALTER TABLE ONLY public."myTable" ALTER COLUMN id SET DEFAULT nextval('public."myTable_id_seq"'::regclass);
 ;   ALTER TABLE public."myTable" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            V           2604    16557    propietario id_propietario    DEFAULT     �   ALTER TABLE ONLY public.propietario ALTER COLUMN id_propietario SET DEFAULT nextval('public.propietario_id_propietario_seq'::regclass);
 I   ALTER TABLE public.propietario ALTER COLUMN id_propietario DROP DEFAULT;
       public          postgres    false    212    206            T           2604    16558    veterinaria id_veterinaria    DEFAULT     �   ALTER TABLE ONLY public.veterinaria ALTER COLUMN id_veterinaria SET DEFAULT nextval('public.veterinaria_id_veterinaria_seq'::regclass);
 I   ALTER TABLE public.veterinaria ALTER COLUMN id_veterinaria DROP DEFAULT;
       public          postgres    false    213    203            �          0    16505    funcionario_alcaldia 
   TABLE DATA           O   COPY public.funcionario_alcaldia (id_funcionario_alcaldia, nombre) FROM stdin;
    public          postgres    false    201   UP       �          0    16511    funcionario_registra_vet 
   TABLE DATA           _   COPY public.funcionario_registra_vet (id_registro, id_funcionario, id_veterinaria) FROM stdin;
    public          postgres    false    202   
S       �          0    16524    mascotas 
   TABLE DATA           �   COPY public.mascotas (id_mascota, fotografia, edad, nombre, tamano, sexo, microchip, especie, peligroso, id_propietario) FROM stdin;
    public          postgres    false    205   ?S                 0    16608    myTable 
   TABLE DATA           H   COPY public."myTable" (id, id_funcionario_alcaldia, nombre) FROM stdin;
    public          postgres    false    215   "Z       �          0    16530    propietario 
   TABLE DATA           �   COPY public.propietario (id_propietario, direccion, localidad, barrio, nombre, telefono, correo, contrasena, id_mascota) FROM stdin;
    public          postgres    false    206   /]       �          0    16548    propietario_crea_caso 
   TABLE DATA           P   COPY public.propietario_crea_caso (id_caso, estado, id_propietario) FROM stdin;
    public          postgres    false    211   v       �          0    16536    propietario_visita_veterinaria 
   TABLE DATA           p   COPY public.propietario_visita_veterinaria (id_visita, id_propietario, id_veterinaria, tipo_visita) FROM stdin;
    public          postgres    false    207   5v       �          0    16514    veterinaria 
   TABLE DATA           �   COPY public.veterinaria (id_veterinaria, direccion, telefono, razon_social, correo, aprobado, contrasena, localidad, barrio) FROM stdin;
    public          postgres    false    203   xv                  0    0 0   funcionario_alcaldia_id_funcionario_alcaldia_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.funcionario_alcaldia_id_funcionario_alcaldia_seq', 1, false);
          public          postgres    false    209                       0    0    mascotas_id_mascota_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.mascotas_id_mascota_seq', 1, false);
          public          postgres    false    210                       0    0    myTable_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."myTable_id_seq"', 100, true);
          public          postgres    false    214                       0    0    propietario_id_propietario_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.propietario_id_propietario_seq', 1, false);
          public          postgres    false    212                       0    0    veterinaria_id_veterinaria_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.veterinaria_id_veterinaria_seq', 1, false);
          public          postgres    false    213            \           2606    16560 4   funcionario_registra_vet FuncionarioRegistraVet_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.funcionario_registra_vet
    ADD CONSTRAINT "FuncionarioRegistraVet_pkey" PRIMARY KEY (id_registro);
 `   ALTER TABLE ONLY public.funcionario_registra_vet DROP CONSTRAINT "FuncionarioRegistraVet_pkey";
       public            postgres    false    202            k           2606    16614    myTable myTable_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."myTable"
    ADD CONSTRAINT "myTable_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."myTable" DROP CONSTRAINT "myTable_pkey";
       public            postgres    false    215            Z           2606    16562 ,   funcionario_alcaldia pk_funcionario_alcaldia 
   CONSTRAINT        ALTER TABLE ONLY public.funcionario_alcaldia
    ADD CONSTRAINT pk_funcionario_alcaldia PRIMARY KEY (id_funcionario_alcaldia);
 V   ALTER TABLE ONLY public.funcionario_alcaldia DROP CONSTRAINT pk_funcionario_alcaldia;
       public            postgres    false    201            b           2606    16564    mascotas pk_id_mascotas 
   CONSTRAINT     ]   ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT pk_id_mascotas PRIMARY KEY (id_mascota);
 A   ALTER TABLE ONLY public.mascotas DROP CONSTRAINT pk_id_mascotas;
       public            postgres    false    205            d           2606    16566    propietario pk_id_propietario 
   CONSTRAINT     g   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT pk_id_propietario PRIMARY KEY (id_propietario);
 G   ALTER TABLE ONLY public.propietario DROP CONSTRAINT pk_id_propietario;
       public            postgres    false    206            ^           2606    16568    veterinaria pk_id_veterinaria 
   CONSTRAINT     g   ALTER TABLE ONLY public.veterinaria
    ADD CONSTRAINT pk_id_veterinaria PRIMARY KEY (id_veterinaria);
 G   ALTER TABLE ONLY public.veterinaria DROP CONSTRAINT pk_id_veterinaria;
       public            postgres    false    203            i           2606    16570 0   propietario_crea_caso propietario_crea_caso_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.propietario_crea_caso
    ADD CONSTRAINT propietario_crea_caso_pkey PRIMARY KEY (id_caso);
 Z   ALTER TABLE ONLY public.propietario_crea_caso DROP CONSTRAINT propietario_crea_caso_pkey;
       public            postgres    false    211            g           2606    16572 B   propietario_visita_veterinaria propietario_visita_veterinaria_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.propietario_visita_veterinaria
    ADD CONSTRAINT propietario_visita_veterinaria_pkey PRIMARY KEY (id_visita);
 l   ALTER TABLE ONLY public.propietario_visita_veterinaria DROP CONSTRAINT propietario_visita_veterinaria_pkey;
       public            postgres    false    207            _           1259    16605    mascotas_edad_index    INDEX     H   CREATE INDEX mascotas_edad_index ON public.mascotas USING btree (edad);
 '   DROP INDEX public.mascotas_edad_index;
       public            postgres    false    205            `           1259    16604    mascotas_index    INDEX     I   CREATE INDEX mascotas_index ON public.mascotas USING btree (id_mascota);
 "   DROP INDEX public.mascotas_index;
       public            postgres    false    205            e           1259    16603    propietario_index    INDEX     S   CREATE INDEX propietario_index ON public.propietario USING btree (id_propietario);
 %   DROP INDEX public.propietario_index;
       public            postgres    false    206            l           2606    16573 ,   funcionario_registra_vet fk_id_funcionario_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario_registra_vet
    ADD CONSTRAINT fk_id_funcionario_2 FOREIGN KEY (id_funcionario) REFERENCES public.funcionario_alcaldia(id_funcionario_alcaldia);
 V   ALTER TABLE ONLY public.funcionario_registra_vet DROP CONSTRAINT fk_id_funcionario_2;
       public          postgres    false    202    201    2906            m           2606    16578 *   funcionario_registra_vet fk_id_veterinaria    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionario_registra_vet
    ADD CONSTRAINT fk_id_veterinaria FOREIGN KEY (id_veterinaria) REFERENCES public.veterinaria(id_veterinaria);
 T   ALTER TABLE ONLY public.funcionario_registra_vet DROP CONSTRAINT fk_id_veterinaria;
       public          postgres    false    202    2910    203            n           2606    16583    mascotas fk_propietario    FK CONSTRAINT     �   ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT fk_propietario FOREIGN KEY (id_propietario) REFERENCES public.propietario(id_propietario) NOT VALID;
 A   ALTER TABLE ONLY public.mascotas DROP CONSTRAINT fk_propietario;
       public          postgres    false    206    2916    205            q           2606    16588 $   propietario_crea_caso fk_propietario    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario_crea_caso
    ADD CONSTRAINT fk_propietario FOREIGN KEY (id_propietario) REFERENCES public.propietario(id_propietario);
 N   ALTER TABLE ONLY public.propietario_crea_caso DROP CONSTRAINT fk_propietario;
       public          postgres    false    211    2916    206            o           2606    16593 -   propietario_visita_veterinaria fk_propietario    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario_visita_veterinaria
    ADD CONSTRAINT fk_propietario FOREIGN KEY (id_propietario) REFERENCES public.propietario(id_propietario);
 W   ALTER TABLE ONLY public.propietario_visita_veterinaria DROP CONSTRAINT fk_propietario;
       public          postgres    false    206    207    2916            p           2606    16598 -   propietario_visita_veterinaria fk_veterinaria    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario_visita_veterinaria
    ADD CONSTRAINT fk_veterinaria FOREIGN KEY (id_veterinaria) REFERENCES public.veterinaria(id_veterinaria);
 W   ALTER TABLE ONLY public.propietario_visita_veterinaria DROP CONSTRAINT fk_veterinaria;
       public          postgres    false    207    2910    203            �   �  x�ES�R�0<�|Lj-��#��!@A�r��j�*d��6�|}Z�J��)k����*(�$�	+$�[R'���Ū����jE�v�vAY�Z��[���,�嚮��%���;�����.zϚ��.6t�@Ѓ��rQ�}o�6&Ԋ�e�b⢤�8������y��t����ECOb=-ݹ}�SȊ4p't��e�QV�C��&V��T(Eҽ�*3.�qr7jZ���UC�Ѳj�5'+M_G������#�+Z��Y�,hm}*Ձe�OKz5l�����A�p���A<�-��q�RӍ�:�HZ<W+:���T��+E�섫#.�TU��l~M�.o�j��u}���j�"p+Mǽ= h�v��
��`���.%�<}� z	Xc�f�	�5���)n��a��� �ˠ\c������h�n��Ѕ�䎛�z�!;��d��d��E�o�/��L�rQу������vC'�{HiZ:6`i��>�h}�w����ء�-苍�]�>Z�u�Lh�f�=��p[c7���mC�Nr�Xn5=���Ѝ{�>X�|��"� �Zѳ�6���CF5�]س�!$Y�n��P�ns�~�ֻ�_��f;�a��커�͊n�Y�\����v�aʗL��4l�<i��WMWֿ!\c$q{6�j�s٣l���ayxu������� wg#�      �   %   x�3�4�4�2�4��@҈˄��6�F\1z\\\ K8&      �   �  x�mW�r9}&�"_�����h�#�b9.;5���Zb�^��T_�(����?� Hɲ'��Rh��G��J��?�0$��P��揋ۯG��ٷ��ڼZ��h�E�59� �������8
���[?��NH���u�6c��f�y7����b@Z�
�_�0���n¼ib��:|%��~���%{9$
 ���n~��,��u��q��a�ǖ�_B|Iô�u�Ĩ�����;E_��S��n�5?v�F�ȥ�j�X,ǡg%����Ou�`�uOOax"�9���9n|�a��4��j�B�l�2��a@��3�#GSPkL���4�4�~���_s�� �8�������u��{�6P[l�g{����az�B�b�hH�b�2V��y5����8a���~�y�;h*Au�֛��Q
'=l*h$��q�	��iDt���F\�?���ȔC�RC��B/�F\���|h���A�ü����L�s?bb���Cg�MCcТӸ}�g��@cѡ%�L]�诿�rc�isN_pF�-ş�_�6D~��ơ�w>N>�B�U7��C7����
{`���݄��z��%i��L���������+	���pX����ߘ�sb{��I/�~Sr.tP(��q9�Cfe�ρQ
��MJ}�p�[ڧ��4(B]�i^�R�k�V�?���%����q�7�	�\t�ⷠ�).B���T��{��M@2R�'q�Y���-�ĝm�nBQ�,qCKЄd-���Y{~��A7���y��FU*%����y�/~ �O��KZ��r-����X�֠)'.�ّkA8[}�6����\R%�����(+�a?�Q,���g��t�N�nA;��߭w>�&�p�^t`��Z,0�>L����wO�AS��YC�>�{�Q�S��܏�;
:�Oן����bE�]܎�Q�ӀQ�nKs��I�3ۖ�g�2
��dl�?���`L����Uu�cYD�w�D|�8�ނi�{-(ޏ��L�Cɩ�(	��#	�x6oxn�KB)�a�U3�~��K�����������J�$bV���H�d����]� 5X�y�#�[�\����6?������ʤ,�x����Ш 8G�5���s��e��`V�{�Ȱ/,8lX�10��ڗ-s��ւ�;A�����f��h[�D��S�=�b��q�-�؊K?D��;el+h�*Bz�{e��CߎG+�%pY��i�v��5�� �܄��'Y��׆�mh:8�1�t87e���@v-��g���E���К���=G�?��5��,�7��g�a�K�Z��j�9�"�VZ��Z-��V��i��L�o<���$n��Yhw8I�a7�4�5�N�W3�j��fS 8߅�w뢫���j<.�5�S].Ӗ����}��8V���<JH����ƒ'�jp&0_�1�B�W^9�Ү��ڏ�»à���f�C�����ف���x�ߤ�e�
�N=�΁�*V�E�d����r�hE�.�m��v~�cv��Rs��S���(+$���U�W�T�*�#�K�.�t�*y��uvR�D3���7Q�X?_�f3��P1�<��{@#:X�q�lK7��F#:�<_��E�7�����Y^��}q8�� ygIlh��p���v�����o��/��p��]�4����+�8� ���Bq�g���� ��t�vv���d{��� ���L         �  x�E��n�6���Б/]gw�8IӍ�i�ތm�&B�)%g�}���(�]HE��%c�C�B�[7�H�����Q4�\tpҢ�}��'���^'���*�iC�=���q��&�*e����IY��g1��u�c��=���l@w������?�4�guA���O�FF]����|Â�u9�T�O.IU��4Mge�?��_��A��;U��2�~�-h3��2����@��� U�mR�KeA�鍩��ƧsZ�6.��
��8�e�w�'F�R7�s���V�%��A���k�&�{Ѓ�W[Е�%HS�>�"M	ZM�%n*е.G��mu	�|�"79�i�oA[���1�{�?��Z7聡F�����}�iAkn'm��ap�,m	���r:�
���Ȏ���.����)<�ز�x�y���>&mz\»c�I��q��|jA7�I�b
Ч����g1%L�{r�M����2��ar8)_7�o~�;Ӵ�}�~l|�+#6h5���A�s��XЯ��q��@�k��BW���x<&�AW�n��	e>��_�����Dv-h�q��t������q�"P���v���X_��(�y߾���+Ћn�*}�b�o@O~<I߂��4�/����N�������O9�=V�Åz��wM���u�ChKЭ�#��V�up�缇�ascΗAlb�҉ZН�k@��$��.9��]���Y��g��B������	��E�      �      x�ez�v�H��:�8��1y� �q�y�xz�����t�N��Em����w#@���p:�#1p�o�������`߾�oqRd)s]�G��)�2��Z\�P`~h�m��G\����pGڻK�'���7e�%TQ}��2c����X7�>✹���P�;tY�ʣ��|���r��f��Q���-)ˤ�W�Kt�����S�z�g�W���<c�o���4{�r���>7ٸJ�;e�(�F��+�&����F�x�	y����J>��z�.Y�L����.6��17�\���q�7���2N�2y���$N����&������AC��B��y�OeU�NYZ��Ⲋ�XU���\��h����(8v�+-W��u~�r��q�"�M�^�m�W�u��|�� /�aR4Hv�2Jz��yvO�����,�O:铒���[L��,7�
�6x���Й��O���$����\.1G��Eܗ���XtI��p�5zK�f�*P�+>�L��������C,�0?�\{ZQ.�u��l�fI}c�8���v}Aq7<_��A+D-�짬Y}g������\��w,�2%�ow�Eצӧ�$)[G_#$���5�P��P�D��2ϒ���p*�t9�sw���c�Α눆t���#�����n�u��_24�:1EG��F�W"��j�yT��O8b5�Jw���F�s����3����L�0y{��0n�1k_��9����@�0A�â�����Gtŗ�Y����xˣ�9�,���t���P����{l�\4�N���\������i�u���$�Hʄ=��D8M�a#pL����s�=N�y�'%�s�.qQEg��щJ?ݭ��N�ƈ{�G�9��W��I�f�?G�͌�7T��s���m���@�I��DG��D��9�L��ւO���Q�&Z+�*��r�<z7�Nl��,�~�q�����y��~�~B?A詆��|��EٜW�YOU�t#��8�~��	s�eq��LɃ/v�+aϲƮ���D���<��?���t��5p#��� %G5$:?<��|��[F%�5�����&�E?ð��r5ۅ[�.-�>��w���e���k�����=Ί����Ya/��=J
�l�O��o���L3">'��RG�������i�qe�	�c�B�ޕ_�i&~�+e���L�a(������=F���Fͯ�)A����"13>ߴ%;���xh	���=��/��� u(�0��R}��w��L�XD�)Q*1� �k���h�Q�VŭZ�-�m_�z;wy`±�˄���ӿh�jgl�}���mn�s
��9�ii��&e�75���k��ҾU(����q��x�v�L��0�|��)?��oqi l���#��(����xϳsRR�"��~C8��Jd�LZQ�&�MU|`<���5�{8o�^;�%�#�[���F�{�g�QD���%8����&�\ؗ��L���8/^)�y��$�M�r]�s��dpJ��v冇鋷�2!,�Q��ƀgZ�l�E�i�5�/�F\6���k�J6���!��!U���f7� H�N�~���K��zm&<K�:�>J����3�B�����z�Εど"�Kum���������N�ܟ���qX"�̣�h��o�Ohp������ .*�#��}��
��t��@�V��2�n�4:��#�%$<Ƿ	�n����ũ��v�%w�+��Sr�Ҳ��_��+�d7���Rֈ�|G��zPt�lQ�1�A�'L/�2�ȞR���]� �u�ƌAo��v���{�(��]���������U�.ۼGij$���q$�	�^� �h8㔀�j��m�!�N������An��=K4D-pR�d�eg��;�&W}��z�]O�LG�9��X��Qw�Noǡ/<��\�:܅j:%:�U��'��sd=|�%n�;�R���~H#��Μ���륯z��<���ZGC��r0�O�����1ݘD<�KV�#<<dm��s����u���$Y���QH-^�J>����y��nɉ���y�i����'�.�����6�U>�4p D+h��2`�9r�[ɗ.��=H����p=�n�Nյ �שC��t���-�v���C�x��S��X�ІbZ�"��r�c�gydL\�>.k�>���R}�{S��2$<�����%y�Po���|�z?��"�No����-/����5
j�+f�8+��#3�`$�%�+^���Z�G!C��|��ы���xϼ��$Ӈ,~�8�͖S�9-�#��q|����T��zj����Dx.*�l1�����̓�g@�%�t9j���)�Fz���Z�m{P,������݅M	��&���ߘ���l�|��|�Y�i�y���Ϯp��bCz�h���Q��uQ"�Өx%��D�;"p���>�޹w�8>Aw�	�v^hA0�܁�X�q���	1�jN�j���g#D(A��	\t�	�v��0��7������Z"$	����+�Nt㢇^�e�f{TD���pAz	�Ik{7tƭmע�9?*�~�-�]�ťG���@���L��S�����e�F�nE4��isC;I\��5��+X������_g=a>���{�ѓ-z'�X��8I�N�W���=I��y��bW����v=] T�F�$cF|�Z�]op������=�<�W+
�/��|� ������!�P��>�c���,�_A�@Dx�:��n��hw�5�=��kWe ��T�W���k��gW�K ����hsL��x����oQ����@{ñ���^n��-�AX�	)�c�η�Y����b�J�"�����kUzɮZ��|c�xJ�G-H��Xݻ"8W�Ú��';O1\2?�|� �=�3��K�;�?�RddNѻ6naC�B�q/0j)������ܙ;��I˯��z��^We~������#hD�Y���A@�P�k��X�GD
�et�5�K�^ð���p��T�oZǃR�b�k,��q�A �M������}J2}���M@������sؗ���� ��^85+��z�Tb�����8��(�>��d�Y(�Y�����Lv�SX��I%h5x�����hd[P��v���}�c�.�O���C�J 5��/h���i���'�:bv܆�\+�>7l�sG�?$���Dj�C��d�S��	�݀HV6��"w]>Ql~c�q����y[�`�r �Ȕ��ķ�ۀpN� ��ù� �
�J\)5i�c$�q�:j�]x�	��]��·{UҼY�n��N�%N��D����W�c�"�i�ym�)��,-���g8��~5�g=Hw+��.���H.�;W��K���dU�n��@ן����	.ߧ���Ѥ��L��P��T��d�ty�enQG�
�fA�R��(t�����r���o�,M��X
�Ư8�C+����q[����t}Pb?]��Lk�I���Q�i[X�$��F���2���v�;��V\�fwB��c��-T��Z�BW���j���� �#H+Pz;!7�5mު����	z��kyI!���T�t�EB�WPoz���@MtX<Ci�� ;PVPc�ɔ��K�`n9�F$��s��_�/���^�G�>��d1�fg�et���cǟOvb�
-�`o8q��+n�n�}#�iD؃�MO *����M0��:C�\o�4���\;+�;`ұ��Ɇ��z-ڻ��5pa}8\J(���8�]���>�"��F����ͦ�0dҵ�����QKx����m��ߢ?�8��֕P�pN豄��9A��3f�;wĪwp7{&�%����}ijuk�vZ��QdpPV��/l��M"B��@�9�O(���e�m�>٭|��|v6m4�%=Cw�ʁ@oh�H����u�S�C�	�5�����{���*�2&���R��I����J=-��,�3 4����~�9��!��-{Ø����0Z�����|q�㱻/��/Y����l��#&}K�I@�1�T �  5�Akdd��DO�����'�4�%}�_�Z�7���$����+��;o�C,��q!m{��6;���Я`���c%8<�T��H�f}AѺ&�^�=M&�3����Iiɇ��PFJ)�vGF���5����it]�-}
v��\rn���:@�����0�y�#�ʒ���-�\���b�E������P��\(l>ZȖq�	��zo^�dh���/�Ӟ��-�t	�Хɛ^����1�
].t=p��nowJ�$2�9�]��U���^6�`�eʱ���6�bt֨(�O��V�N�������t� e�'W�qU�Q�l�W`�����`:aʵ�Y�zZN�3ú\��r�s݄è,�{f����Z9�Τ��"�Q�zga�"ݝ�N/β���  z�~�VA����;'�}��7?��{t�)!��a����u,'s�!�fK���(��0�+7��.⁺��8Mu����X���o���j�PpfZڬBZ��h1t�nK3o���!xyB5,�3WG��tF�ov@����+�_H�'���&p�c�n�&��[+:�/��F�Y3{����K�Wk>eʷ����k�@b�{,���ϯ��,�q����1����ڥ]Y����yn�a��<�4���{��lUD���KT�>���LtO\_1z����iSk�{��/�fsg���b<t��'���8%Q�گ�YYoA�7��S�[YK͇[���o�`JY�q�]8w{J��]�#�c]t�\�J��3̲�\U�Gm��-vg��2܌�
��A2(�����۪zzs�0BW�AA�
N}�XS*�B��"��N���g?l��~�B�
1��#���i�1�f�`^b��
6L��oi��P$��0���I�����Q��2�xAg�Q�1��^J�_�nK @o	�|m�+t��]���4~B
}�gFŘ,���)u�a7�çv�.Xȭ�a���hd�n�j�D�q���JY@8�i|��N�b ��;��8�=�WJB]l�^��h�{NX�~	���˴2*�
��o�� RtW'��;F��Rŕ�,t^\�~��Ξ���,�ȵ���6`9oN�)]� ���5>gl�'����K��ȟ��T˂���R��z�����4&%�V��ˀ��b�>�N+�j�& ������=���ȝ����[�'�I�Ksa��ros��Պ����4�FԼ��������5�K�}�?�v�K�:̣�ߡ��OF�m�M��[�݀{�a��,�Vh��WPkP�sR�&��&�yL~��ڑVP�L��-bo#LZ{�u��t+�sT�
C&�^�5�z9B�ދ��Z�s��7}�7-��\:���;;�0� ��i�����B�������5*�<9e��t����CW��[�e�[=���>pv���3�`�����6��CFl����c'�&�������K5�d��𛏋��D;�{�i {��r��Cg��Y.��FZ�2��C��EҺy���2qI0�8 �+���/��4+�V� w���� P�uOt(H����Ӿ��wZ�7U~��(���>��%2��%�zH��k�d̑��d��݉��T�S��.ma�4����E�;p������'��4N$u��˅�����C:���e������X���>������r�@�`T�� mB��	�L�ek�.7�\_��z��I^Wz1��v8p;<��gj�Gŗ���e�����B�b�!�9�	3P	o(|���m�����\�Y�����pd�#%`����^�m6Hr-��<��/�0׾#�th�l^碷|� �kA�-�j��m���p��	���Ҟ�����ˆ��?���y�@¯?���Q��ۦ�B�7��2�:�.P8 ||!����~!�,�ѓ�����U���� ���u���H�����o�{��]o����a��ʥ{^]Rh�͒����n[�~��m�"5 ���C�-�L6���<n�c%�����N�I�-�` �r���������o��F�w �?p���Z#�"|�~^��hi��q�0�*�5��#CB�|������)һ�j�S�����{>g�-#c�K���$]���߮)��Л���p��G� ](֯��t�w}�Q������;$I7��2�+���	����d�n�����7�F�1w��g �u�G�_���Ǥn~�4���#;���TdK@݆�	����׺�í��G��v���z��4-��?r��      �      x������ � �      �   3   x�3�4 �0W��0G.#N##.c ߈3��9�����ߏ+F��� ^g�      �      x��Zˎ�Hv]��������`0;��R�̄7L���.�̡Ț���f��?P�0��"��/��2[�P��y�KJ�ۮ�	����v��n�]��MgC(��q�]��Y�|?�?~��fx>�z�Q��ϱ�9���.k�R��r�h	G�ddy\�=�^�s��(n��3������A����8�p�z���|v��Y��( ���q�V7���E=|[ױ�yzǉ��a��8����Oy�r���v^���s��`�!���r|��`<��9���5�/d���%y�a��kx��$T0i/��r��-����>{�sp�(�����ʯ� ��st�q�9i��p���E��Ӂ���8�؜���O(�-�*e���g�֗R���y-�u|2����rM��ֹ����K���LBM�N�dH������yz��*"��;�ޅ�l<�enKP�E]�x�'��YG�+|����7X�ƾZ���iK�?>��N^�s���{l1���Om����V���K�}��7�%:��ZB�c�Cìd��K��2��X���Ϸ#2�9Fa�Dx���ٛ<��)�=��]�ť����ai�
i�%����O�j�l3޹��2�������Bm?��*��͘CA�>�]�-����Oi_��։PW����8l�;�7�թy�nb�ҭr^\E_O�*����G1u��~-��Zl\���ӂ�8����I�k1�p�oQ�Q�1H#�{1�뉖�X<��Kd���i�Nt�9�!�Մ���Q��d���G����
����u��IG	���z���L�8R���=��ݴc������5�:y�ëp�6'��G�eE�8�������b^#7�~���I{x��er<)ZҴ�+�M/�u)�o!ڥ�缼�kw��˺�GC�K���M�b�x���΍����A1��Y��2�Y��-ZdQ�A��20=Zw�a�ؾ���!.�Ybo���!��{�P|)����ZLzu�����͜�٠����Ii�!=:��J&OGG��>ܓq�Cǯ\-���Q�taSi����&�'r�Z>�ӑN�A�9:�:��c��oQ�������;w: �������alq�x��^�5_^�-(��w�x�ߣKЎ��ݤ��(�����}^��!��g�}~���(���F��e��T����h��*kR���t�/\Q�`w��e"��2�%/�N6�y�N�aFQx������QL��-��,��k�}��[��$ �/6���0-ۃJ��+�ݫɪ����A� �i�2۸g��O�NA�������u�b���o�u[����H�/@�M��	Dk)��~}$1n�6����MS�xY\�x<R��.����K��-� ��-�B��it����}[���/�N���vſӐE�{���r�$�$~�vf�@8zГ���1 ����K�D�����D���N��������O֤��r_1b{Iέm����|���H���E�"<���
�4������\�}G�´�?�HM���#�?@�Eq@F�}E�����tA�
��.nU>^��]�@�M�*��)�j��pŜ��3?L�G��u�ڿؾ���'�.Ւ�#�F��U��r����{´���r��7P��.�sB2����L��A�:%�I`	g����\��}�#4ؽ�������=������{E����VK-�!.�ʞjQR�*�4�+�n�An KS��se��d�����,�ѻ��˥�vU/�_i?|-�L��pW�qhC]���w  �V��p��r���م��Ƨ8&��D���V-��+�r�fP9^C�}h�O��Jk�]~�㋾�#��^������ɂ�h�;�2����#�_��
ߗ�����D�(�u�]wr�����ѥԢ_��5�z=L�|��=�с�~�F���yl�.Q�"�\�H��C�98d�P��<"��n?����5LM{4�Z&�߮}��zEv��{�-2���-����Cx����X��c�b���m�MtȋJ��J����rR����^����m�����ЗnC��.4�`Ե�I�= �Un�w\0=�Kkt1b�]��v���%���O�K_�g�������Q ����d�s����?jI<�ZT��˗�XT�6i���[�6� �J:����'Ώ�#�����<�u��P��Y.�����݂c+��B�5��=���ѽ}-���;[�Ixs~ܑ�#��;����5�g��L&�:ї8�A�lJ�nş�bڅT�5BTm���OM��'�lJ{]��=!OhV�p5��ؒ#��)�02 :)� �[iF_ѝZ{޳�޹D�`�{T�O�����do�`�>����Ȣm	J��P�ԁ��+cȠ��ovͭ�J�����8#
*S�۹�ix���M�A���i�?����3�����Lt����<�D����=DĔ,����A�e��8�i1Z3oux/s2<>��{�HJO��jŅ��d��U�u�GZ*��t4ius8��{x�����9�Y,�*�g�h��w�lQ؁T���:��5�ߣ k�ڝ0�n��o�~�MB����Gt�ΦOM$>�'au�F�d0�R����+Th�3&�w B����p�w�ϥ7�X�/.�5t���.��S�!t
��s�v=��-ؙ��e�O;�V�ۛ�}�� �rKȆa�ߗ�H��0���|Zao l�l7-��Fk�3�����z�)�(�{�\���O�O��L[�Kh��w���m�!*ȜA궮.��W��X�|�E�:E�j?�$e�Q�x�����L,!$��,�u�h-�#�\#�CUUh��
c.�>�χ(�&Ie��v.���u��d�D{�<��d|��@Atk�R��̳OX�)�j�`��-��(��ϋTT�^������X��P~?�o�4؀��B�ڣ�W��.
P���A�vCZƲ�2��}��pC4��tד�x9�h�E�]wnyMk�M���d��4*pY(ڠ63��4N%�t�q6��ݎ�fDYDVS�k�#��������hB��F� ���e� Ӿ����$�L6kԝxj�<���AE 9(͒����q!
<��=��.�	���ŊQ�J1�(��'"�sތN�lWl���ɢ��<A��*�^ ���8m k�N����(��EeN�;�{:�S_SvDvҕK��i	{�F"�u����֪�L�L�降�T̎'�%�P��o���'��:�E͙1PYp>�C���1x
���	:��
(_���ퟦnw_�}�Ѧ�)L
Uf��5x#��Ï謋~^�`���pt����¬,������pt�(aP�=��phߣ$����}j*ކ����G�]���ӷ��>���(�W
��5�pffr�G���~���].��N�@���{xG����nI�(�Q`�,r�0��
US?�S���Q�P�Iw�T������)�paI�M��Y��ބ�Cs��ݩ]d��G���G%��8��'wЇ%����QZ��8�����n�w�Ɨ膤��L�i�wTw�q{K2M52e���Gr��m,�ˁpT���k1����!�hh�Z����Ib�U_Q�&�U/�'}�˾xݖEt��;���c�epA��I�� �kYG]=��R#Z#�z �vxY�i�թ��Z�ݔ��h��'�Cʥ4���'_Rhj/B_38�.�K|��l$w0b���_?�,��r�� �x���^FRl6#6���Df������ 	֋!�� T�_�E��P�ƹ���X.;~}q�Q�-͈�����r��)��B{9�V��J�C6)�-!|�;^��GEY��/KW.�gb�g8�%�&�gHzCK����Nm���倈I=��{��@��R���t�����[M�,L���)����P�)���R)aHC�5�2�V!ࢳv}�K��Og��c6[C��_`]х6R���|Ǵ���p�2{k�E5�xx��$m\b�g��v�۸��Z�Ԛ�-���L �ߒ }{��w�o�k����1{���W[L�   C�ד�&��f%Ye���7���c�tsm��ZhP+�����7��DU+A	�͵��5zұ�vslM�ץǷ��v�J.��4�:��lH���P��Oj ��wa`���t��/��+��4z�Yw�-���|~����B����ZH
���u!(*O!t� ��[�:�f~\�p?�I6�/xoK^�����!�L,�a����R@Í���z ^*����A)&�%W�ል�d�D^�Q16�Ks�o�))�RtV�]�k�ܩƼ� �6���:#t��@E�ݍ�LV'�ۑ��[�^���'������zœ XQ��r���a
פ.���_��E���v����w�q�Ѱt�����9���`z��`�B���.�E�N�s�ٽ��d�=�[͒�����b�¨���c7z��X ���ue�����B�����4����Z��j-����5����dL�V2�SĄ�� z�{N�R��hc�W|��2�>'�m�!2��Pi��~���r�b�����O�]|��ܘꥷ�n�,}4
����5%�p@ �\���|?[���Z���4��Dih)�����Z'Vo�u����P�����Rܾ<�i8t0驗Z�d�Y��pqq�0��\M�5=���5f����vcl�y,�4��Nc)O�>]��*�K�E�,�H�=<C��jY��=��a�P���l�)�HA��ѐ������� �����I%�NJU�k�0�rq�'�H� Kt�P�Af��\������Sϻ�<� �NvSVG9ؐڃBW��P��]XfX�抷���l^6�_<��� ���G[z�ZJ!�o��4a��r�'��h�{j���	J,��v���b1`�YE�bz����]����T�� ��9�^gՕ���zx�)������7۾<;�8߈�A����zi��'<3:���;����X�1Vᮞ.I�x���q	t ��UWJ1@�������:��9_��	��l�ɾ۵�S����هz`(DK�� ��F@��/5mm*�^����U�j!4�)o0Zz��Y���|��o���2@57n��P\PQy�J2�!�B�glQ�x��2�1�����E����W3B��Z/��i�0��S��alB16���7-ߑ�9V1���}�ŵ����~�{�u���r`�T���#�1M�#��CO�]�w)Z���փ�8�j��ۿ����bl���W����i��v��)�+��'M�=W��e�yg�o� ��>d���S(Ԋ0����W۱�: �B '�kSl��K0�+삶��f��0���2�H7���i贿v��d�tO�1��G�9�`����`©S������x�t��;�n�`���5��ٳ�3�]�5L�Ю����x�[��4v��AM�_*�bS�{�a���v�Uo?�W�r����	�C8qU/)��T�o�p ��(�`�>Z�ކ�tH��{�ݐvh���_Q�B�x�}�X�U�Ƽc�gqMS�g�w����kF��^����4 ��oa9�|âנ\$�5����*y�i��qYu1�����|�Ѹ������ܛ�.�q��"�^���v���Tj6����lF�$�� ����>�+@�jGb,go���tޥ�����n�Ǒ��������p̀V�����m���;MS�f�'5ߗ�:�cy�Mh1�\{OPA�~U��m�Ac�����h�G�J�<+z��܏���P���jgR��%�������:�����rC�죛��r2&���M'�aja�m˲�W�-     