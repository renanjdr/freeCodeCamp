--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    diameter_in_ly integer,
    description text,
    distance_from_earth_in_ly integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    class character varying(15)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km numeric(6,1),
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', 220000, 'A spiral galaxy loacted approximately 2.5 million light-years away from Earth', 2500000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 50000, 'A spiral galaxy located approximately 3 million light-years away from Earth', 3000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700, 'Milky way is where the solar systems is located', 0);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 50000, 'An unbarred spiral galaxy loacted approximately 28 million light-years away from Earth', 280000000);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', 37000, 'A grand design spiral galaxy located approximately 23 million light-years away from Earth', 23000000);
INSERT INTO public.galaxy VALUES (9, 'Pinwheel Galaxy', 170000, 'A face-on spiral galaxy located approximately 21 million light-years away  from Earth', 21000000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.8, 'Earths natural satelite', true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.2, 'Phobos is the largest moon of Mars', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.4, 'Deimos is the second largest moon of Mars', true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3630.6, 'Io is the fourth largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.6, 'Europa is the sixth largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262.4, 'Ganymede is the largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.6, 'Callisto is the third largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 168.9, 'Amalthea is the fifth largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 185.2, 'Himalia is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 117.8, 'Elara is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (11, 'Lysithea', 34.4, 'Lysithea is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (12, 'Dia', 15.2, 'Dia is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (13, 'Iocaste', 18.2, 'Iocaste is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (14, 'Thebe', 66.8, 'Thebe is the eleventh largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (15, 'Adrastea', 16.1, 'Adrastea is the fourteenth largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (16, 'Metis', 20.2, 'Metis is the thirteenth largest moon of Jupiter', true, 5);
INSERT INTO public.moon VALUES (17, 'Eurydome', 15.2, 'Eurydome is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (18, 'Euanthe', 12.2, 'Euanthe is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (19, 'Themisto', 10.2, 'Themisto is a irregular moon of Jupiter', false, 5);
INSERT INTO public.moon VALUES (20, 'New Moon', 25.6, 'New Moon is a newly discovered moon', true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 'It is called the blue Planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 4879, 'The smallest and closest planet to the Sun', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 'The hottest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 'The fourth planet from the Sun', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, 'The largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 'The planet with the most extensive ring system', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 'The coldest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (8, 'Arcturus I', 14000, 'A terrestrial planet with a thick atmosphere and a rocky surface', false, 6);
INSERT INTO public.planet VALUES (9, 'Arcturus II', 18000, 'A gas giant planet with a strong magnetic field', false, 6);
INSERT INTO public.planet VALUES (10, 'Arcturus III', 12000, 'A planet with a frozen surface and a subsurface ocean', false, 6);
INSERT INTO public.planet VALUES (11, 'Arcturus IV', 10000, 'A planet that orbits close to its star and has a hot surface', false, 6);
INSERT INTO public.planet VALUES (12, 'Neptune', 49244, 'The fourth largest planet in the Solar System', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392700, 'The Sun is the central star from the solar system', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A & B', 1230000, 'A binary star system that is the closest star system to Earth', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1500, 'A red dwarf and the closest known star to the Solar System', 1);
INSERT INTO public.star VALUES (4, 'Sirius A & B', 1720000, 'A binary star system that is the brightest star in the Earth s night sky', 1);
INSERT INTO public.star VALUES (5, 'Canopus', 1420000, 'A bright giant star that is the second brightest star in the Earth s night sky', 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 25500, 'An orange giant and the fourth brightest star in the Earth s night sky', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: galaxy_types unique_name_galaxy_types; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_name_galaxy_types UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


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

