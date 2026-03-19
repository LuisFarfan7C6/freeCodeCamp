--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type (
    type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.type OWNER TO freecodecamp;

--
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_type_id_seq OWNER TO freecodecamp;

--
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_type_id_seq OWNED BY public.type.type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.type_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 13600, 26000, 1);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 12000, 20200, 1);
INSERT INTO public.galaxy VALUES (3, 'M87', 16000, 50000, 2);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 15700, 40500, 2);
INSERT INTO public.galaxy VALUES (5, 'Baby Moon', 20000, 45000, 3);
INSERT INTO public.galaxy VALUES (6, 'NGC 5866', 30000, 70000, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 4510, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', true, 5000, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 4800, 3);
INSERT INTO public.moon VALUES (4, 'Ganímedes', true, 6000, 5);
INSERT INTO public.moon VALUES (5, 'Calisto', true, 5800, 5);
INSERT INTO public.moon VALUES (6, 'Europa', true, 5900, 5);
INSERT INTO public.moon VALUES (7, 'Io', true, 6500, 5);
INSERT INTO public.moon VALUES (8, 'Titán', true, 6200, 6);
INSERT INTO public.moon VALUES (9, 'Encélado', true, 6300, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, 6550, 6);
INSERT INTO public.moon VALUES (11, 'Jápeto', true, 6450, 6);
INSERT INTO public.moon VALUES (12, 'Rea', true, 6700, 6);
INSERT INTO public.moon VALUES (13, 'Titania', true, 3000, 7);
INSERT INTO public.moon VALUES (14, 'Oberón', true, 3200, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', true, 4000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', true, 80000, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', true, 82000, 7);
INSERT INTO public.moon VALUES (18, 'Tritón', true, 25000, 8);
INSERT INTO public.moon VALUES (19, 'Nereida', true, 30000, 8);
INSERT INTO public.moon VALUES (20, 'Proteo', true, 32000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', true, true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', true, true, 42000000, 2);
INSERT INTO public.planet VALUES (3, 'Marte', true, true, 54600000, 3);
INSERT INTO public.planet VALUES (4, 'Mercurio', true, true, 60000000, 4);
INSERT INTO public.planet VALUES (5, 'Júpiter', false, true, 70000000, 5);
INSERT INTO public.planet VALUES (6, 'Saturno', false, true, 75000000, 6);
INSERT INTO public.planet VALUES (7, 'Urano', false, true, 90000000, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', false, true, 92000000, 2);
INSERT INTO public.planet VALUES (9, '51 Pegasi B', false, true, 100000000, 3);
INSERT INTO public.planet VALUES (10, 'Osiris', false, true, 150000000, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-16b', false, true, 110000000, 5);
INSERT INTO public.planet VALUES (12, 'TOI-2094 b', false, true, 450000000, 6);
INSERT INTO public.planet VALUES (13, 'Kointreau-4 b', false, true, 145000000, 1);
INSERT INTO public.planet VALUES (14, 'LHS 1903 e', false, true, 350000000, 2);
INSERT INTO public.planet VALUES (15, 'V2376 Orionis b', false, true, 730000000, 3);
INSERT INTO public.planet VALUES (16, 'GJ 251 c', false, true, 580000000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Canopus', 50, 310, 1);
INSERT INTO public.star VALUES (2, 'Rigel', 100, 1000, 2);
INSERT INTO public.star VALUES (3, 'Vega', 160, 2000, 3);
INSERT INTO public.star VALUES (4, 'Alfa Centauri', 20, 5000, 4);
INSERT INTO public.star VALUES (5, 'Polaris', 75, 200, 5);
INSERT INTO public.star VALUES (6, 'Alcyone', 10, 500, 6);


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type VALUES (1, 'Espiral', 'Tienen forma de remolino con brazos definidos y una protuberancia central');
INSERT INTO public.type VALUES (2, 'Elípticas', 'Son elípticas, circulares u ovaladas. Están compuestas principalmente por estrellas viejas y tienen muy poco gas y polvo');
INSERT INTO public.type VALUES (3, 'Irregulares', 'Son aquellas que no tienen una forma definida (ni espiral ni elíptica). Suelen ser pequeñas, compuestas por estrellas jóvenes y ricas en gas y polvo');
INSERT INTO public.type VALUES (4, 'Lenticulares', 'Son una forma intermedia entre las elípticas y las espirales. Tienen forma de disco, similar a las espirales, pero carecen de brazos definidos');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_type_id_seq', 4, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: type type_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_type_id_key UNIQUE (type_id);


--
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

