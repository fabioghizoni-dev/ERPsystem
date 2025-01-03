--
-- PostgreSQL database cluster dump
--

-- Started on 2025-01-03 11:44:00

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-03 11:44:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-01-03 11:44:01

--
-- PostgreSQL database dump complete
--

--
-- Database "ATIVIDADE" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-03 11:44:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4907 (class 1262 OID 16957)
-- Name: ATIVIDADE; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ATIVIDADE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "ATIVIDADE" OWNER TO postgres;

\connect "ATIVIDADE"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16958)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    nome character varying(200),
    codigo character varying(3),
    cpf character varying(11),
    telefone character varying(12),
    datacadastro date,
    observacoes character varying(30),
    inativo boolean,
    id integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16961)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 218
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 219 (class 1259 OID 16962)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    codigo character varying(3),
    descricao character varying(100),
    unidademedida character(2),
    valor numeric(12,2),
    custo numeric(12,2),
    datacadastro date,
    inativo boolean,
    tipo character varying(50),
    qtdestoque double precision
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16965)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 220
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 4747 (class 2604 OID 16966)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16967)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 16958)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (nome, codigo, cpf, telefone, datacadastro, observacoes, inativo, id) FROM stdin;
Maria Silva	C01	12345678910	43 34721122	2021-12-01	Cliente Bom	f	1
João Santos	C02	98765432100	43 34723020	2021-12-01	Cliente Bom	f	2
Ana Costa	C03	45678912345	43 34721152	2022-01-14	Cliente Inadimplente	f	3
Pedro Souza	C04	32165498711	43 34721011	2022-01-14	Cliente Regular	f	4
Julia Oliveira	C06	36925814722	43 34722310	2021-06-06	Cliente Excelente	t	6
\.


--
-- TOC entry 4900 (class 0 OID 16962)
-- Dependencies: 219
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (id, codigo, descricao, unidademedida, valor, custo, datacadastro, inativo, tipo, qtdestoque) FROM stdin;
1	P01	Refrigerante 2L	UN	5.99	4.00	2022-01-10	f	BEBIDAS	400
2	P02	Alface	KG	0.99	0.70	2022-01-10	f	FARINACEOS	80.5
3	P03	Arroz 5KG	UN	19.99	18.59	2022-01-10	f	FEIRA	875
4	P04	Feijão 1KG	UN	5.99	4.99	2022-01-10	f	FEIRA	380
5	P05	Cerveja 600ML	UN	2.99	2.49	2022-02-12	f	BEBIDAS	4555
6	P06	Amendoim 500G	UN	2.50	2.00	2022-02-12	f	FARINACEOS	100
7	P07	Pipoca 200G	UN	4.00	3.00	2022-02-12	f	FARINACEOS	199
8	P08	Pacote Bala 1KG	UN	7.89	6.50	2021-12-24	f	DOCES	75
9	P09	Uva	KG	4.50	3.00	2021-12-24	f	FEIRA	20.1
10	P10	Abacaxi	KG	1.99	1.50	2021-12-24	f	FEIRA	35.9
11	P11	Pipoca Doce 200G	UN	1.50	4.50	2024-04-02	f	FARINACEOS	150
12	P12	Sucrilhos 500G	UN	6.00	8.99	2024-04-02	f	FARINACEOS	80
\.


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 218
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 6, true);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 220
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 12, true);


--
-- TOC entry 4750 (class 2606 OID 16969)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 16971)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


-- Completed on 2025-01-03 11:44:01

--
-- PostgreSQL database dump complete
--

--
-- Database "Aula_08" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-03 11:44:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4971 (class 1262 OID 16972)
-- Name: Aula_08; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Aula_08" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "Aula_08" OWNER TO postgres;

\connect "Aula_08"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 233 (class 1255 OID 16973)
-- Name: verifica_piso(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.verifica_piso() RETURNS TABLE(nome character varying, funcao character varying, salario numeric, pisofuncao numeric, analise character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.Nome, 
        c.Funcao, 
        c.Salario, 
        c.PisoFuncao,
        CASE 
            WHEN c.Salario > c.PisoFuncao THEN 'Salário acima do piso em: ' || TO_CHAR(c.Salario - c.PisoFuncao, '999G999D99')
            WHEN c.Salario = c.PisoFuncao THEN 'Salário de acordo com o piso: ' || TO_CHAR(c.Salario - c.PisoFuncao, '999G999D99')
            ELSE 'Salário abaixo do piso em: ' || TO_CHAR(c.PisoFuncao - c.Salario, '999G999D99')
        END AS Analise
    FROM Colaborador c;
END;
$$;


ALTER FUNCTION public.verifica_piso() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16974)
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    idcurso integer NOT NULL,
    ra character varying NOT NULL,
    nome character varying NOT NULL,
    datacadastro date NOT NULL,
    email character varying,
    telefone character varying,
    endereco character varying,
    iniciocurso date,
    conclusaocurso date,
    status character varying(1) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16979)
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 218
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- TOC entry 219 (class 1259 OID 16980)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    nome character varying(200),
    codigo character varying(3),
    cpf character varying(11),
    telefone character varying(12),
    datacadastro date,
    observacoes character varying(30),
    inativo boolean
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16983)
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    funcao character varying(30),
    salario numeric(10,2) NOT NULL,
    pisofuncao numeric(10,2)
);


ALTER TABLE public.colaborador OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16986)
-- Name: colaborador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.colaborador_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 221
-- Name: colaborador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_id_seq OWNED BY public.colaborador.id;


--
-- TOC entry 222 (class 1259 OID 16987)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id integer NOT NULL,
    idprofessor integer NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL,
    descricao character varying NOT NULL,
    cargahoraria integer NOT NULL,
    modalidade character varying,
    nivel character varying
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16992)
-- Name: cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 223
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_seq OWNED BY public.cursos.id;


--
-- TOC entry 224 (class 1259 OID 16993)
-- Name: cursos_professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_professores (
    idprofessor integer NOT NULL,
    idcurso integer NOT NULL
);


ALTER TABLE public.cursos_professores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16996)
-- Name: cursos_professores_idcurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_professores_idcurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_professores_idcurso_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 225
-- Name: cursos_professores_idcurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_professores_idcurso_seq OWNED BY public.cursos_professores.idcurso;


--
-- TOC entry 226 (class 1259 OID 16997)
-- Name: cursos_professores_idprofessor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_professores_idprofessor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_professores_idprofessor_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 226
-- Name: cursos_professores_idprofessor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_professores_idprofessor_seq OWNED BY public.cursos_professores.idprofessor;


--
-- TOC entry 227 (class 1259 OID 16998)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id integer NOT NULL,
    nome character varying NOT NULL,
    codigo character varying NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17003)
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 228
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- TOC entry 229 (class 1259 OID 17004)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    codigo character varying(3),
    descricao character varying(100),
    unidademedida character(2),
    valor numeric(12,2),
    custo numeric(12,2),
    datacadastro date,
    inativo boolean,
    tipo character varying(50),
    qtdestoque double precision,
    lucro money,
    imposto numeric(10,2),
    custo_real numeric(10,2),
    lucro_real numeric(10,2)
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17007)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 230
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 231 (class 1259 OID 17008)
-- Name: professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professores (
    id integer NOT NULL,
    iddepartamento integer NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL,
    datanascimento date,
    email character varying,
    datacadastro date,
    coordenador boolean,
    desligamento boolean,
    datadesligamento date
);


ALTER TABLE public.professores OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17013)
-- Name: professores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professores_id_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 232
-- Name: professores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professores_id_seq OWNED BY public.professores.id;


--
-- TOC entry 4778 (class 2604 OID 17014)
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 17015)
-- Name: colaborador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN id SET DEFAULT nextval('public.colaborador_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 17016)
-- Name: cursos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id SET DEFAULT nextval('public.cursos_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 17017)
-- Name: cursos_professores idprofessor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores ALTER COLUMN idprofessor SET DEFAULT nextval('public.cursos_professores_idprofessor_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 17018)
-- Name: cursos_professores idcurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores ALTER COLUMN idcurso SET DEFAULT nextval('public.cursos_professores_idcurso_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 17019)
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 17020)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 17021)
-- Name: professores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores ALTER COLUMN id SET DEFAULT nextval('public.professores_id_seq'::regclass);


--
-- TOC entry 4950 (class 0 OID 16974)
-- Dependencies: 217
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, idcurso, ra, nome, datacadastro, email, telefone, endereco, iniciocurso, conclusaocurso, status) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 16980)
-- Dependencies: 219
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (nome, codigo, cpf, telefone, datacadastro, observacoes, inativo) FROM stdin;
Maria Silva	C01	12345678910	43 34721122	2021-12-01	Cliente Bom	f
João Santos	C02	98765432100	43 34723020	2021-12-01	Cliente Bom	f
Ana Costa	C03	45678912345	43 34721152	2022-01-14	Cliente Inadimplente	f
Pedro Souza	C04	32165498711	43 34721011	2022-01-14	Cliente Regular	f
Lucas Ferreira	C05	74185296300	43 34728085	2022-01-14	Cliente Regular	f
Julia Oliveira	C06	36925814722	43 34722310	2021-06-06	Cliente Excelente	f
\.


--
-- TOC entry 4953 (class 0 OID 16983)
-- Dependencies: 220
-- Data for Name: colaborador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaborador (id, nome, funcao, salario, pisofuncao) FROM stdin;
3	Pedro Oliveira	Vendedor Externo	3000.00	2200.00
4	Ana Costa	Vendedor Externo	3100.00	2200.00
5	Carlos Pereira	Gerente de Loja	4500.00	4000.00
6	Juliana Lima	Administrativo	2800.00	2500.00
7	Rafaela Sousa	Administrativo	2900.00	2500.00
1	João Costa da Silva	Gerente de Loja	4000.00	2000.00
2	Maria Santos	Vendedor	2000.00	2000.00
9	Anderson Silva	Vendedor	2000.00	2000.00
\.


--
-- TOC entry 4955 (class 0 OID 16987)
-- Dependencies: 222
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id, idprofessor, codigo, nome, descricao, cargahoraria, modalidade, nivel) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 16993)
-- Dependencies: 224
-- Data for Name: cursos_professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos_professores (idprofessor, idcurso) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 16998)
-- Dependencies: 227
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id, nome, codigo) FROM stdin;
\.


--
-- TOC entry 4962 (class 0 OID 17004)
-- Dependencies: 229
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (id, codigo, descricao, unidademedida, valor, custo, datacadastro, inativo, tipo, qtdestoque, lucro, imposto, custo_real, lucro_real) FROM stdin;
5	P05	Cerveja 600ML	UN	2.99	2.49	2022-02-12	f	BEBIDAS	4555	\N	0.00	2.49	0.50
6	P06	Amendoim 500G	UN	2.50	2.00	2022-02-12	f	FARINACEOS	100	\N	0.00	2.00	0.50
7	P07	Pipoca 200G	UN	4.00	3.00	2022-02-12	f	FARINACEOS	199	\N	0.00	3.00	1.00
8	P08	Pacote Bala 1KG	UN	7.89	6.50	2021-12-24	f	DOCES	75	\N	0.00	6.50	1.39
9	P09	Uva	KG	4.50	3.00	2021-12-24	f	FEIRA	20.1	\N	0.00	3.00	1.50
10	P10	Abacaxi	KG	1.99	1.50	2021-12-24	f	FEIRA	35.9	\N	0.00	1.50	0.49
1	P01	Refrigerante 2L	UN	5.99	4.00	2024-04-25	f	BEBIDAS	400	\N	0.00	4.00	1.99
2	P02	Alface	KG	0.99	0.70	2024-04-25	f	FARINACEOS	80.5	\N	0.00	0.70	0.29
3	P03	Arroz 5KG	UN	19.99	18.59	2024-04-25	f	FEIRA	875	\N	0.00	18.59	1.40
4	P04	Feijão 1KG	UN	5.99	4.99	2024-04-25	f	FEIRA	380	\N	0.00	4.99	1.00
12	P12	Anão	UN	2.00	1.50	2022-01-10	f	\N	500	\N	0.00	1.50	0.50
11	P11	Cartão Clonado	UN	10.00	7.50	2022-01-10	f	\N	1000	\N	0.00	7.50	2.50
\.


--
-- TOC entry 4964 (class 0 OID 17008)
-- Dependencies: 231
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professores (id, iddepartamento, codigo, nome, datanascimento, email, datacadastro, coordenador, desligamento, datadesligamento) FROM stdin;
\.


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 218
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 221
-- Name: colaborador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_id_seq', 9, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 223
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_seq', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 225
-- Name: cursos_professores_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_professores_idcurso_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 226
-- Name: cursos_professores_idprofessor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_professores_idprofessor_seq', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 228
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 230
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 12, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 232
-- Name: professores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professores_id_seq', 1, false);


--
-- TOC entry 4787 (class 2606 OID 17023)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 17025)
-- Name: colaborador colaborador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 17027)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 17029)
-- Name: cursos_professores cursos_professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_pkey PRIMARY KEY (idprofessor, idcurso);


--
-- TOC entry 4795 (class 2606 OID 17031)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 17033)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 17035)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 17036)
-- Name: alunos alunos_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(id);


--
-- TOC entry 4801 (class 2606 OID 17041)
-- Name: cursos cursos_idprofessor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_idprofessor_fkey FOREIGN KEY (idprofessor) REFERENCES public.professores(id);


--
-- TOC entry 4802 (class 2606 OID 17046)
-- Name: cursos_professores cursos_professores_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(id);


--
-- TOC entry 4803 (class 2606 OID 17051)
-- Name: cursos_professores cursos_professores_idprofessor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_idprofessor_fkey FOREIGN KEY (idprofessor) REFERENCES public.professores(id);


--
-- TOC entry 4804 (class 2606 OID 17056)
-- Name: professores professores_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamentos(id);


-- Completed on 2025-01-03 11:44:02

--
-- PostgreSQL database dump complete
--

--
-- Database "BancoTarefas" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-03 11:44:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4902 (class 1262 OID 17061)
-- Name: BancoTarefas; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "BancoTarefas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "BancoTarefas" OWNER TO postgres;

\connect "BancoTarefas"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17062)
-- Name: conta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta (
    id integer NOT NULL,
    nome character(20),
    email character varying(80),
    senha character varying(30)
);


ALTER TABLE public.conta OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17065)
-- Name: conta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conta_id_seq OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 218
-- Name: conta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_id_seq OWNED BY public.conta.id;


--
-- TOC entry 219 (class 1259 OID 17066)
-- Name: tarefas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefas (
    nomegrupo character varying(50),
    tarefas character varying(250),
    tarefapendente character varying(250),
    tarefaconcluida character varying(250)
);


ALTER TABLE public.tarefas OWNER TO postgres;

--
-- TOC entry 4746 (class 2604 OID 17071)
-- Name: conta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta ALTER COLUMN id SET DEFAULT nextval('public.conta_id_seq'::regclass);


--
-- TOC entry 4894 (class 0 OID 17062)
-- Dependencies: 217
-- Data for Name: conta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conta (id, nome, email, senha) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 17066)
-- Dependencies: 219
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarefas (nomegrupo, tarefas, tarefapendente, tarefaconcluida) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 218
-- Name: conta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conta_id_seq', 1, false);


--
-- TOC entry 4748 (class 2606 OID 17073)
-- Name: conta conta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (id);


-- Completed on 2025-01-03 11:44:02

--
-- PostgreSQL database dump complete
--

--
-- Database "dberp" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-03 11:44:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4926 (class 1262 OID 16956)
-- Name: dberp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dberp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE dberp OWNER TO postgres;

\connect dberp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17074)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome_cliente character varying,
    cpf_cliente character varying NOT NULL,
    celular_cliente character varying,
    data_adicionado date
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE clientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientes IS 'Tabela de Clientes';


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN clientes.id_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.id_cliente IS 'ID Único do Cliente';


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN clientes.nome_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.nome_cliente IS 'Nome do Cliente';


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN clientes.cpf_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.cpf_cliente IS 'CPF do Cliente';


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN clientes.celular_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.celular_cliente IS 'Número Celular do Cliente';


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN clientes.data_adicionado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.data_adicionado IS 'Data de Adição do Cliente';


--
-- TOC entry 218 (class 1259 OID 17079)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 219 (class 1259 OID 17080)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    nome_cliente_identify integer NOT NULL,
    pais_cliente character varying,
    estado_cliente character varying,
    cidade_cliente character varying,
    bairro_cliente character varying
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE endereco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.endereco IS 'Tabela de Endereços dos Clientes';


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN endereco.nome_cliente_identify; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.nome_cliente_identify IS 'ID que Liga Endereço ao Cliente';


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN endereco.pais_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.pais_cliente IS 'País do Cliente';


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN endereco.estado_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.estado_cliente IS 'Estado do Cliente';


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN endereco.cidade_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.cidade_cliente IS 'Cidade do Cliente';


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN endereco.bairro_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.bairro_cliente IS 'Bairro do Cliente';


--
-- TOC entry 220 (class 1259 OID 17085)
-- Name: endereco_nome_cliente_identify_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_nome_cliente_identify_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.endereco_nome_cliente_identify_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 220
-- Name: endereco_nome_cliente_identify_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_nome_cliente_identify_seq OWNED BY public.endereco.nome_cliente_identify;


--
-- TOC entry 221 (class 1259 OID 17086)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    nome_produto character varying,
    preco_unitario money,
    qntd_estoque integer
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN produtos.id_produto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.id_produto IS 'ID Único do Produto';


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN produtos.nome_produto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.nome_produto IS 'Nome ou título do Produto';


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN produtos.preco_unitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.preco_unitario IS 'Preço Únitario';


--
-- TOC entry 222 (class 1259 OID 17091)
-- Name: produtos_id_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_produto_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 222
-- Name: produtos_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;


--
-- TOC entry 223 (class 1259 OID 17092)
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    nome_vendedor character varying,
    nome_prod_vendido character varying,
    id_prod_vendido integer,
    data_venda date,
    qntd_total_vendida integer,
    preco_prod money
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE vendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vendas IS 'Tabela de Vendas';


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.nome_vendedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.nome_vendedor IS 'Nome do Vendedor';


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.nome_prod_vendido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.nome_prod_vendido IS 'Nome do Produto Vendido';


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.id_prod_vendido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.id_prod_vendido IS 'ID do Produto Vendido';


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.data_venda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.data_venda IS 'Data da Venda';


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.qntd_total_vendida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.qntd_total_vendida IS 'Quantidade de Vendas';


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.preco_prod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.preco_prod IS 'Preço do Produto';


--
-- TOC entry 4756 (class 2604 OID 17097)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 17098)
-- Name: endereco nome_cliente_identify; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN nome_cliente_identify SET DEFAULT nextval('public.endereco_nome_cliente_identify_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 17099)
-- Name: produtos id_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);


--
-- TOC entry 4914 (class 0 OID 17074)
-- Dependencies: 217
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nome_cliente, cpf_cliente, celular_cliente, data_adicionado) FROM stdin;
2	:pNome			2025-01-03
\.


--
-- TOC entry 4916 (class 0 OID 17080)
-- Dependencies: 219
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (nome_cliente_identify, pais_cliente, estado_cliente, cidade_cliente, bairro_cliente) FROM stdin;
\.


--
-- TOC entry 4918 (class 0 OID 17086)
-- Dependencies: 221
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id_produto, nome_produto, preco_unitario, qntd_estoque) FROM stdin;
1	Coca 2L	R$ 12,00	2000
2	Fanta 2L	R$ 10,00	3000
3	Coca Lata	R$ 5,00	5000
4	Fanta Lata	R$ 5,00	5000
5	Salgadinho Fandangos	R$ 8,00	100
6	Salgadinho Baconzitos	R$ 10,00	50
\.


--
-- TOC entry 4920 (class 0 OID 17092)
-- Dependencies: 223
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (nome_vendedor, nome_prod_vendido, id_prod_vendido, data_venda, qntd_total_vendida, preco_prod) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 2, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 220
-- Name: endereco_nome_cliente_identify_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_nome_cliente_identify_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 222
-- Name: produtos_id_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_produto_seq', 6, true);


--
-- TOC entry 4760 (class 2606 OID 17101)
-- Name: clientes clientes_pk_id_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk_id_cliente PRIMARY KEY (id_cliente);


--
-- TOC entry 4762 (class 2606 OID 17103)
-- Name: clientes clientes_unique_cpf_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_unique_cpf_cliente UNIQUE (cpf_cliente);


--
-- TOC entry 4764 (class 2606 OID 17105)
-- Name: endereco endereco_unique_id_end; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_unique_id_end UNIQUE (nome_cliente_identify);


--
-- TOC entry 4766 (class 2606 OID 17107)
-- Name: produtos produtos_unique_id_prod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_unique_id_prod UNIQUE (id_produto);


--
-- TOC entry 4768 (class 2606 OID 17111)
-- Name: vendas vendas_unique_id_prod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_unique_id_prod UNIQUE (id_prod_vendido);


-- Completed on 2025-01-03 11:44:02

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-01-03 11:44:02

--
-- PostgreSQL database cluster dump complete
--

