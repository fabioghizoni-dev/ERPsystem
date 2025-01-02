--
-- PostgreSQL database cluster dump
--

-- Started on 2025-01-02 04:24:53

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

-- Started on 2025-01-02 04:24:53

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

-- Completed on 2025-01-02 04:24:54

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

-- Started on 2025-01-02 04:24:54

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
-- TOC entry 4806 (class 1262 OID 16567)
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
-- TOC entry 217 (class 1259 OID 16568)
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
-- TOC entry 218 (class 1259 OID 16571)
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
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 218
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 219 (class 1259 OID 16572)
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
-- TOC entry 220 (class 1259 OID 16575)
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
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 220
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 4646 (class 2604 OID 16576)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 16577)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 4797 (class 0 OID 16568)
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
-- TOC entry 4799 (class 0 OID 16572)
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
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 218
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 6, true);


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 220
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 12, true);


--
-- TOC entry 4649 (class 2606 OID 16579)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 16581)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


-- Completed on 2025-01-02 04:24:55

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

-- Started on 2025-01-02 04:24:55

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
-- TOC entry 4870 (class 1262 OID 16582)
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
-- TOC entry 233 (class 1255 OID 16584)
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
-- TOC entry 217 (class 1259 OID 16585)
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
-- TOC entry 218 (class 1259 OID 16590)
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
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 218
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- TOC entry 219 (class 1259 OID 16591)
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
-- TOC entry 220 (class 1259 OID 16594)
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
-- TOC entry 221 (class 1259 OID 16597)
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
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 221
-- Name: colaborador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_id_seq OWNED BY public.colaborador.id;


--
-- TOC entry 222 (class 1259 OID 16598)
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
-- TOC entry 223 (class 1259 OID 16603)
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
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 223
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_seq OWNED BY public.cursos.id;


--
-- TOC entry 224 (class 1259 OID 16604)
-- Name: cursos_professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_professores (
    idprofessor integer NOT NULL,
    idcurso integer NOT NULL
);


ALTER TABLE public.cursos_professores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16607)
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
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 225
-- Name: cursos_professores_idcurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_professores_idcurso_seq OWNED BY public.cursos_professores.idcurso;


--
-- TOC entry 226 (class 1259 OID 16608)
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
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 226
-- Name: cursos_professores_idprofessor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_professores_idprofessor_seq OWNED BY public.cursos_professores.idprofessor;


--
-- TOC entry 227 (class 1259 OID 16609)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id integer NOT NULL,
    nome character varying NOT NULL,
    codigo character varying NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16614)
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
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 228
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- TOC entry 229 (class 1259 OID 16615)
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
-- TOC entry 230 (class 1259 OID 16618)
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
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 230
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 231 (class 1259 OID 16619)
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
-- TOC entry 232 (class 1259 OID 16624)
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
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 232
-- Name: professores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professores_id_seq OWNED BY public.professores.id;


--
-- TOC entry 4677 (class 2604 OID 16625)
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16626)
-- Name: colaborador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN id SET DEFAULT nextval('public.colaborador_id_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 16627)
-- Name: cursos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id SET DEFAULT nextval('public.cursos_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 16628)
-- Name: cursos_professores idprofessor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores ALTER COLUMN idprofessor SET DEFAULT nextval('public.cursos_professores_idprofessor_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16629)
-- Name: cursos_professores idcurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores ALTER COLUMN idcurso SET DEFAULT nextval('public.cursos_professores_idcurso_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 16630)
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 16631)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 16632)
-- Name: professores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores ALTER COLUMN id SET DEFAULT nextval('public.professores_id_seq'::regclass);


--
-- TOC entry 4849 (class 0 OID 16585)
-- Dependencies: 217
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, idcurso, ra, nome, datacadastro, email, telefone, endereco, iniciocurso, conclusaocurso, status) FROM stdin;
\.


--
-- TOC entry 4851 (class 0 OID 16591)
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
-- TOC entry 4852 (class 0 OID 16594)
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
-- TOC entry 4854 (class 0 OID 16598)
-- Dependencies: 222
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id, idprofessor, codigo, nome, descricao, cargahoraria, modalidade, nivel) FROM stdin;
\.


--
-- TOC entry 4856 (class 0 OID 16604)
-- Dependencies: 224
-- Data for Name: cursos_professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos_professores (idprofessor, idcurso) FROM stdin;
\.


--
-- TOC entry 4859 (class 0 OID 16609)
-- Dependencies: 227
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id, nome, codigo) FROM stdin;
\.


--
-- TOC entry 4861 (class 0 OID 16615)
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
-- TOC entry 4863 (class 0 OID 16619)
-- Dependencies: 231
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professores (id, iddepartamento, codigo, nome, datanascimento, email, datacadastro, coordenador, desligamento, datadesligamento) FROM stdin;
\.


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 218
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 1, false);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 221
-- Name: colaborador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_id_seq', 9, true);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 223
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_seq', 1, false);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 225
-- Name: cursos_professores_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_professores_idcurso_seq', 1, false);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 226
-- Name: cursos_professores_idprofessor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_professores_idprofessor_seq', 1, false);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 228
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 1, false);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 230
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 12, true);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 232
-- Name: professores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professores_id_seq', 1, false);


--
-- TOC entry 4686 (class 2606 OID 16634)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 16636)
-- Name: colaborador colaborador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 16638)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 16640)
-- Name: cursos_professores cursos_professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_pkey PRIMARY KEY (idprofessor, idcurso);


--
-- TOC entry 4694 (class 2606 OID 16642)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16644)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16646)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 16647)
-- Name: alunos alunos_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(id);


--
-- TOC entry 4700 (class 2606 OID 16652)
-- Name: cursos cursos_idprofessor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_idprofessor_fkey FOREIGN KEY (idprofessor) REFERENCES public.professores(id);


--
-- TOC entry 4701 (class 2606 OID 16657)
-- Name: cursos_professores cursos_professores_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(id);


--
-- TOC entry 4702 (class 2606 OID 16662)
-- Name: cursos_professores cursos_professores_idprofessor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_professores
    ADD CONSTRAINT cursos_professores_idprofessor_fkey FOREIGN KEY (idprofessor) REFERENCES public.professores(id);


--
-- TOC entry 4703 (class 2606 OID 16667)
-- Name: professores professores_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamentos(id);


-- Completed on 2025-01-02 04:24:56

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

-- Started on 2025-01-02 04:24:56

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
-- TOC entry 4801 (class 1262 OID 16583)
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
-- TOC entry 217 (class 1259 OID 16672)
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
-- TOC entry 218 (class 1259 OID 16675)
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
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 218
-- Name: conta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_id_seq OWNED BY public.conta.id;


--
-- TOC entry 219 (class 1259 OID 16676)
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
-- TOC entry 4645 (class 2604 OID 16681)
-- Name: conta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta ALTER COLUMN id SET DEFAULT nextval('public.conta_id_seq'::regclass);


--
-- TOC entry 4793 (class 0 OID 16672)
-- Dependencies: 217
-- Data for Name: conta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conta (id, nome, email, senha) FROM stdin;
\.


--
-- TOC entry 4795 (class 0 OID 16676)
-- Dependencies: 219
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarefas (nomegrupo, tarefas, tarefapendente, tarefaconcluida) FROM stdin;
\.


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 218
-- Name: conta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conta_id_seq', 1, false);


--
-- TOC entry 4647 (class 2606 OID 16683)
-- Name: conta conta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (id);


-- Completed on 2025-01-02 04:24:57

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

-- Started on 2025-01-02 04:24:57

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
-- TOC entry 4823 (class 1262 OID 16768)
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
-- TOC entry 218 (class 1259 OID 16770)
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
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE clientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientes IS 'Tabela de Clientes';


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN clientes.id_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.id_cliente IS 'ID Único do Cliente';


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN clientes.nome_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.nome_cliente IS 'Nome do Cliente';


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN clientes.cpf_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.cpf_cliente IS 'CPF do Cliente';


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN clientes.celular_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.celular_cliente IS 'Número Celular do Cliente';


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN clientes.data_adicionado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.data_adicionado IS 'Data de Adição do Cliente';


--
-- TOC entry 217 (class 1259 OID 16769)
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
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 220 (class 1259 OID 16781)
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
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE endereco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.endereco IS 'Tabela de Endereços dos Clientes';


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN endereco.nome_cliente_identify; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.nome_cliente_identify IS 'ID que Liga Endereço ao Cliente';


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN endereco.pais_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.pais_cliente IS 'País do Cliente';


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN endereco.estado_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.estado_cliente IS 'Estado do Cliente';


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN endereco.cidade_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.cidade_cliente IS 'Cidade do Cliente';


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN endereco.bairro_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.endereco.bairro_cliente IS 'Bairro do Cliente';


--
-- TOC entry 219 (class 1259 OID 16780)
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
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 219
-- Name: endereco_nome_cliente_identify_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_nome_cliente_identify_seq OWNED BY public.endereco.nome_cliente_identify;


--
-- TOC entry 222 (class 1259 OID 16790)
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
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN produtos.id_produto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.id_produto IS 'ID Único do Produto';


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN produtos.nome_produto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.nome_produto IS 'Nome ou título do Produto';


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN produtos.preco_unitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.preco_unitario IS 'Preço Únitario';


--
-- TOC entry 221 (class 1259 OID 16789)
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
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 221
-- Name: produtos_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;


--
-- TOC entry 223 (class 1259 OID 16816)
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    nome_vendedor character varying,
    nome_prod_vendido character varying,
    id_prod_vendido integer,
    data_venda date,
    qntd_total_vendida integer
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE vendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vendas IS 'Tabela de Vendas';


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.nome_vendedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.nome_vendedor IS 'Nome do Vendedor';


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.nome_prod_vendido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.nome_prod_vendido IS 'Nome do Produto Vendido';


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.id_prod_vendido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.id_prod_vendido IS 'ID do Produto Vendido';


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.data_venda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.data_venda IS 'Data da Venda';


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN vendas.qntd_total_vendida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendas.qntd_total_vendida IS 'Quantidade de Vendas';


--
-- TOC entry 4655 (class 2604 OID 16773)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 16784)
-- Name: endereco nome_cliente_identify; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN nome_cliente_identify SET DEFAULT nextval('public.endereco_nome_cliente_identify_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16793)
-- Name: produtos id_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);


--
-- TOC entry 4812 (class 0 OID 16770)
-- Dependencies: 218
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nome_cliente, cpf_cliente, celular_cliente, data_adicionado) FROM stdin;
\.


--
-- TOC entry 4814 (class 0 OID 16781)
-- Dependencies: 220
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (nome_cliente_identify, pais_cliente, estado_cliente, cidade_cliente, bairro_cliente) FROM stdin;
\.


--
-- TOC entry 4816 (class 0 OID 16790)
-- Dependencies: 222
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id_produto, nome_produto, preco_unitario, qntd_estoque) FROM stdin;
\.


--
-- TOC entry 4817 (class 0 OID 16816)
-- Dependencies: 223
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (nome_vendedor, nome_prod_vendido, id_prod_vendido, data_venda, qntd_total_vendida) FROM stdin;
\.


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, false);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 219
-- Name: endereco_nome_cliente_identify_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_nome_cliente_identify_seq', 1, false);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 221
-- Name: produtos_id_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_produto_seq', 1, false);


--
-- TOC entry 4659 (class 2606 OID 16777)
-- Name: clientes clientes_pk_id_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk_id_cliente PRIMARY KEY (id_cliente);


--
-- TOC entry 4661 (class 2606 OID 16779)
-- Name: clientes clientes_unique_cpf_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_unique_cpf_cliente UNIQUE (cpf_cliente);


--
-- TOC entry 4663 (class 2606 OID 16788)
-- Name: endereco endereco_unique_id_end; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_unique_id_end UNIQUE (nome_cliente_identify);


--
-- TOC entry 4665 (class 2606 OID 16797)
-- Name: produtos produtos_unique_id_prod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_unique_id_prod UNIQUE (id_produto);


-- Completed on 2025-01-02 04:24:57

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-01-02 04:24:57

--
-- PostgreSQL database cluster dump complete
--

