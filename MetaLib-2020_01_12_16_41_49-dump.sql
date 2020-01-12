--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.authors OWNER TO mymmrac;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO mymmrac;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.books (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    year integer NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    genre_id integer NOT NULL,
    author_id integer NOT NULL,
    cover character varying(1024) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.books OWNER TO mymmrac;

--
-- Name: books_author_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.books_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_author_id_seq OWNER TO mymmrac;

--
-- Name: books_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.books_author_id_seq OWNED BY public.books.author_id;


--
-- Name: books_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.books_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_genre_id_seq OWNER TO mymmrac;

--
-- Name: books_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.books_genre_id_seq OWNED BY public.books.genre_id;


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO mymmrac;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.cities OWNER TO mymmrac;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO mymmrac;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.genres OWNER TO mymmrac;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO mymmrac;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genres.id;


--
-- Name: libraries; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.libraries (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.libraries OWNER TO mymmrac;

--
-- Name: libraries_city_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.libraries_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libraries_city_id_seq OWNER TO mymmrac;

--
-- Name: libraries_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.libraries_city_id_seq OWNED BY public.libraries.city_id;


--
-- Name: libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.libraries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libraries_id_seq OWNER TO mymmrac;

--
-- Name: libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.libraries_id_seq OWNED BY public.libraries.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    rating integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO mymmrac;

--
-- Name: ratings_book_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.ratings_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_book_id_seq OWNER TO mymmrac;

--
-- Name: ratings_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.ratings_book_id_seq OWNED BY public.ratings.book_id;


--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO mymmrac;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: ratings_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.ratings_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_user_id_seq OWNER TO mymmrac;

--
-- Name: ratings_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.ratings_user_id_seq OWNED BY public.ratings.user_id;


--
-- Name: user_books; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.user_books (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_books OWNER TO mymmrac;

--
-- Name: user_books_author_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.user_books_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_books_author_id_seq OWNER TO mymmrac;

--
-- Name: user_books_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.user_books_author_id_seq OWNED BY public.user_books.user_id;


--
-- Name: user_books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.user_books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_books_book_id_seq OWNER TO mymmrac;

--
-- Name: user_books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.user_books_book_id_seq OWNED BY public.user_books.book_id;


--
-- Name: user_books_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.user_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_books_id_seq OWNER TO mymmrac;

--
-- Name: user_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.user_books_id_seq OWNED BY public.user_books.id;


--
-- Name: user_tops; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.user_tops (
    id bigint,
    user_id bigint,
    book_id bigint,
    pos bigint
);


ALTER TABLE public.user_tops OWNER TO mymmrac;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mymmrac
--

CREATE TABLE public.users (
    id integer NOT NULL,
    uid character varying(128) NOT NULL,
    username character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO mymmrac;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mymmrac
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mymmrac;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mymmrac
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: books genre_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books ALTER COLUMN genre_id SET DEFAULT nextval('public.books_genre_id_seq'::regclass);


--
-- Name: books author_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books ALTER COLUMN author_id SET DEFAULT nextval('public.books_author_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- Name: libraries id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.libraries ALTER COLUMN id SET DEFAULT nextval('public.libraries_id_seq'::regclass);


--
-- Name: libraries city_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.libraries ALTER COLUMN city_id SET DEFAULT nextval('public.libraries_city_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: ratings book_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings ALTER COLUMN book_id SET DEFAULT nextval('public.ratings_book_id_seq'::regclass);


--
-- Name: ratings user_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings ALTER COLUMN user_id SET DEFAULT nextval('public.ratings_user_id_seq'::regclass);


--
-- Name: user_books id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books ALTER COLUMN id SET DEFAULT nextval('public.user_books_id_seq'::regclass);


--
-- Name: user_books book_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books ALTER COLUMN book_id SET DEFAULT nextval('public.user_books_book_id_seq'::regclass);


--
-- Name: user_books user_id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books ALTER COLUMN user_id SET DEFAULT nextval('public.user_books_author_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.authors (id, name) FROM stdin;
1	Jeaniene Frost
2	Gary Jennings
3	Ronie Kendig
4	Neil Gaiman
5	K. Bannerman
6	Bernard Cornwell
7	Suzanne Woods Fisher
8	Robert M. Sapolsky
9	Mandi Beck
10	Christiane Northrup
11	Joan Marshall Grant
12	Roger Rheinheimer
13	Michele G. Miller
14	Laurell K. Hamilton
15	John Gwynne
16	Richard Wurmbrand
17	Martin Lings
18	Christopher Sykes
19	Thomas Merton
20	C.S. Lewis
21	Frank Sheed
22	John             Lewis
23	Javan
24	Wanda E. Brunstetter
25	Andy Hunt
26	Jane Goodall
27	Ina May Gaskin
28	Frances J. Roberts
29	Frank E. Peretti
30	Erin Hunter
31	Ibn Kathir
32	L.A. Banks
33	Gary Larson
34	Al Dempster
35	Ann Fairbairn
36	Erik Quisling
37	Neal Shusterman
38	Lois McMaster Bujold
39	Tara Maya
40	Alfred Lansing
41	Patricia C. Wrede
42	Fernando Pessoa
43	Janet Kagan
44	Alejandra Pizarnik
45	Viktor E. Frankl
46	Susan May Warren
47	Gerald N. Lund
48	Julie Reece Deaver
49	Cherise Sinclair
50	Mercer Mayer
51	Autumn Jones Lake
52	Rohinton Mistry
53	Ruth Bell Graham
54	Rebecca Zanetti
55	Julie  Hall
56	Malcolm X
57	Will Wight
58	Joan Steiner
59	Jamie Simons
60	Leah Bendavid-Val
61	Joseph Smith Jr.
62	Jeff Fields
63	Noam Chomsky
64	Stephen E. Ambrose
65	Roxann Season
66	Celeste De Blasis
67	Franz Kafka
68	Tui T. Sutherland
69	Carl Sagan
70	Ian Kershaw
71	Kevin McIlvoy
72	Anne Mercier
73	Paul Pitchford
74	Eckhart Tolle
75	Sandra Shrewsbury
76	John       O'Brien
77	Lorraine Anderson
78	Killarney Traynor
79	ReShonda Tate Billingsley
80	Ray Monk
81	Charles de Lint
82	Cherríe L. Moraga
83	Ray Hendershot
84	P.G. Wodehouse
85	James Baldwin
86	Scott Hahn
87	Pet Torres
88	Dan Abnett
89	R.J. Palacio
90	Pat Barker
91	Lylah James
92	Thomas Keneally
93	E.K. Blair
94	Maya Banks
95	Sherrilyn Kenyon
96	John Steinbeck
97	Nien Cheng
98	Gabrielle Estres
99	Marie Lu
100	Pamela Clare
101	Guy Sajer
102	Tananarive Due
103	Michael   Newton
104	José Mauro de Vasconcelos
105	Lili St. Germain
106	Robin Jones Gunn
107	T.J. Klune
108	Rolf Gates
109	Jerry Bridges
110	Ruth Beebe Hill
111	Eduardo Galeano
112	Michael  Grant
113	Anton Chekhov
114	Kimberla Lawson Roby
115	Ashley Antoinette
116	Cyma Rubin
117	Robert A. Caro
118	Lester Sumrall
119	A.C. Bhaktivedanta Swami Prabhupāda
120	Sidney D. Kirkpatrick
121	Dennis  Smith
122	Joyce Meyer
123	Nicholas Wolterstorff
124	James Hudson Taylor
125	Ul De Rico
126	Jaymin Eve
127	The Beatles
128	Aaron B. Powell
129	Pierce Brown
130	Joann I. Martin Sowles
131	Fyodor Dostoyevsky
132	Laurens van der Post
133	Sharon Lee
134	Jennifer Raygoza
135	Annabelle Anders
136	Idries Shah
137	Peter Menzel
138	Ais
139	Harry Crews
140	Kazu Kibuishi
141	NR Nada
142	Elie Wiesel
143	Paul Gallico
144	Winston S. Churchill
145	Shaun Tan
146	Judith McNaught
147	Randy Shilts
148	Wendell Berry
149	David Halberstam
150	Terry C. Johnston
151	Barbara Cooney
152	Spencer W. Kimball
153	Elisabeth Elliot
154	Anonymous
155	Robert R. McCammon
156	Smith Wigglesworth
157	Primo Levi
158	Corrie ten Boom
159	Peg Kehret
160	Coleen Lovitt
161	Lynda Barry
162	J.M. Northup
163	Helen Hardt
164	Stephen Levine
165	Julie  Morgan
166	Michael Shaara
167	Larry Collins
168	Bill Watterson
169	William Shakespeare
170	Derrick A. Bell
171	Kallypso Masters
172	David  O'Sullivan
173	James Herriot
174	W. Clement Stone
175	Robert Fisk
176	George Sheehan
177	Carolina Andújar
178	Caroline Alexander
179	Ben Elton
180	Anson Scott
181	Joseph Campbell
182	Terri Crisp
183	Orson Scott Card
184	Louise Penny
185	Brandon Sanderson
186	John McPhee
187	Christine Feehan
188	Francis de Sales
189	Mick Foley
190	Martin Luther King Jr.
191	Dietrich Bonhoeffer
192	Randy Alcorn
193	Osho
194	Tiffany Reisz
195	Pam Muñoz Ryan
196	Roald Dahl
197	Larry McMurtry
198	Audrey Wood
199	Tove Jansson
200	Lisa Ann Marsoli
201	Don Ferguson
202	E.E. Cummings
203	Patricia Briggs
204	Diana  Sweeney
205	Ernest Holmes
206	Neil D. Ostroff
207	Devney Perry
208	Ryszard Kapuściński
209	Napoleon Hill
210	K'wan
211	Marie-Louise von Franz
212	Gordon B. Hinckley
213	Cheree Alsop
214	Eric R. Kandel
215	A.L. Jackson
216	Terri Blackstock
217	Shelley Peterson
218	Clement C. Moore
219	Jocelynn Drake
220	Tricia Mingerink
221	Angela Marsons
222	C.A. Knutsen
223	Cinda Williams Chima
224	C. Terry Warner
225	Sam McBratney
226	Jenny B. Jones
227	Patricia Polacco
228	Eugene B. Sledge
229	James S. Freemantle
230	Patrick F. McManus
231	Vince Flynn
232	J.C. Ryle
233	Chris Carter
234	Meredith Wild
235	Charlie Higson
236	Mikhail Bulgakov
237	Juan Díaz Canales
238	Benny Hinn
239	Charles Sheehan-Miles
240	Jack L. Pyke
241	J.J. McAvoy
242	Claude Brown
243	Bruce Catton
244	Beverly Jenkins
245	Raymond E. Feist
246	James E. Talmage
247	Tyffani Clark Kemp
248	Stephen King
249	William W. Johnstone
250	Sister Souljah
251	Alcoholics Anonymous
252	Kristen Ashley
253	Rumi
254	Claire Monette
255	Carter G. Woodson
256	Douglas Adams
257	W. Phillip Keller
258	Herman Wouk
259	Sarah Mlynowski
260	Martín Espada
261	Andrew Klavan
262	Amie Knight
263	Eiji Yoshikawa
264	Elizabeth Goudge
265	David James Duncan
266	Yaşar Kemal
267	Johanna Rae
268	Jack London
269	Ryan Graudin
270	Frank O'Hara
271	Donald Goines
272	D.H. Sidebottom
273	Samuel Beckett
274	Dee Henderson
275	Irene Hannon
276	Dani Pettrey
277	James Robert Baker
278	Julie Garwood
279	Patrick O'Brian
280	Jan Karon
281	Zenna Henderson
282	Henri J.M. Nouwen
283	Jamie Magee
284	Paul  Hollis
285	Patti Larsen
286	Lao Tzu
287	Marissa Meyer
288	Berkeley Breathed
289	Brian W. Kernighan
290	Maya Angelou
291	Angela Carter
292	Jacob Grimm
293	Paul Scherz
294	Edward R. Tufte
295	Bruce Olson
296	Derek Landy
297	Lee Carroll
298	Vernor Vinge
299	J.H. Prynne
300	Reader's Digest Association
301	Yaa Gyasi
302	Jay McLean
303	Whittaker Chambers
304	Isaac Asimov
305	A.J. Brewster
306	Ernest Thompson Seton
307	Richard Ben Cramer
308	Steven Pressfield
309	Lauren Klever
310	Justine Korman Fontes
311	Stella Price
312	Lillian Watson
313	Sylvia Townsend Warner
314	Lucia St. Clair Robson
315	Shannon Messenger
316	Eve Newton
317	Lindsay Buroker
318	Julian Cope
319	Mary B. Morrison
320	Aaron Becker
321	Meg Collett
322	Thérèse de Lisieux
323	Nelson Mandela
324	Frédéric Bastiat
325	J.K. Rowling
326	Tamora Pierce
327	Patrick D. Smith
328	Michelle Paver
329	Blanche Fisher Wright
330	Noah Gordon
331	Kate L. Mary
332	Bridgitte Lesley
333	George G.M. James
334	Bob Dylan
335	Jillian Dodd
336	Douglas Wood
337	Omar Rivabella
338	John Paul II
339	Michael A. Nielsen
340	Dee Ready
341	Rainer Maria Rilke
342	David Simon
343	Shel Silverstein
344	Dan Gutman
345	Michael Phillip Cash
346	R.K. Lilley
347	S.F. Mazhar
348	S.B. Alexander
349	Michael D. O'Brien
350	James Clavell
351	Bahá'u'lláh
352	J.D. Robb
353	John  Ross
354	Adèle Geras
355	Trina Paulus
356	Crystal Linn
357	S.A. Bergen
358	Frans de Waal
359	Randi Cooley Wilson
360	C.J. Sansom
361	Steve Kluger
362	Dr. Seuss
363	Jean Marzollo
364	Mercedes Keyes
365	Ferrol Sams
366	Teresa of Ávila
367	Eugene H. Peterson
368	Bryce Courtenay
369	George Lucius Salton
370	D. Martyn Lloyd-Jones
371	Cameron Crowe
372	Victor Villaseñor
373	Theodore Dreiser
374	Patrick O'Scheen
375	Deja King
376	A.A. Milne
377	Audrey Penn
378	Thich Nhat Hanh
379	Wilton Barnhardt
380	Roger Zelazny
381	Jane Jacobs
382	Pablo Neruda
383	E.F. Benson
384	Dorothy Parker
385	T.M. Frazier
386	Erich Maria Remarque
387	Octavia E. Butler
388	Amy Harmon
389	Colleen McCullough
390	Richard Rhodes
391	Jonahmae Pacala
392	Martine Jardin
393	Phyllis Green
394	Robert Munsch
395	Anne Carson
396	JoAnn Durgin
397	Tony Abbott
398	June Rae Wood
399	Cherie Bennett
400	Jim Harrison
401	Susan Howatch
402	Jiddu Krishnamurti
403	Aral Bereux
404	Martina Cole
405	Paul Hattaway
406	Yotam Ottolenghi
407	Mark Helprin
408	J.R. Ward
409	Richelle Mead
410	Mīrābāī
411	Erynn Mangum
412	Jorge Luis Borges
413	Edgar Allan Poe
414	Marcel Proust
415	Kim Harrison
416	Robert Burns
417	John     Fitzgerald
418	Ellen Hopkins
419	Aleta L. Williams
420	Ryan Schow
421	Alan Moore
422	Madeleine L'Engle
423	Constantinos P. Cavafis
424	Founding Fathers
425	Jennifer L. Armentrout
426	Jennifer Lynn Barnes
427	Paullina Simons
428	Brian Froud
429	Mary  Stewart
430	Karen Marie Moning
431	Jennifer Donnelly
432	Rachel Caine
433	Karen Kingsbury
434	Diane Story
435	Mario Puzo
436	Alice McLerran
437	Lori L. Otto
438	Loung Ung
439	Emilie Barnes
440	Robin Benway
441	Peter F. Hamilton
442	Heather Vogel Frederick
443	Mark Walden
444	Jennings Michael Burch
445	Chingiz Aitmatov
446	Nadine Brandes
447	Lisa Tawn Bergren
448	Max Lucado
449	Loren Eiseley
450	Jim Butcher
451	Patricia MacLachlan
452	C.M. Owens
453	Edward Gorey
454	Sean Flynn
455	Sara Donati
456	Ilona Andrews
457	Susan Wise Bauer
458	Robert Frost
459	James Alexander Thom
460	Daniel Ladinsky
461	John F. MacArthur Jr.
462	Kristin Hannah
463	Quinn Loftis
464	Dorothy Dunnett
465	Nikki Turner
466	Leonardo da Vinci
467	J. California Cooper
468	Lesley Pearse
469	Max Ehrmann
470	J.R.R. Tolkien
471	Isaac Bashevis Singer
472	Arthur Conan Doyle
473	Munro Leaf
474	Jim Stockdale
475	Stormie Omartian
476	Emily Rodda
477	Katja Millay
478	Lucy Score
479	C.D. Wright
480	Brother Andrew
481	Sharon Kay Penman
482	Goldie Browning
483	Kimberley Chambers
484	Quino
485	Albert Einstein
486	Anne Baker
487	David Allen Sibley
488	Oriana Fallaci
489	Kathryn Otoshi
490	N.K. Jemisin
491	Astrid Lindgren
492	Billy Graham
493	Diana Gabaldon
494	Tetsuko Kuroyanagi
495	Charles M. Schulz
496	Roger Fouts
497	Phoebe Gilman
498	Sapan Saxena
499	Francine Rivers
500	Michael J. Sullivan
501	Terry Pratchett
502	Enid Blyton
503	Catherine Burns
504	Susan  Kay
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.books (id, name, year, rating, genre_id, author_id, cover, description) FROM stdin;
339	The Complete Dramatic Works	1990	8	35	273	https://images.gr-assets.com/books/1387750582l/12286.jpg	A volume containing the English texts of all the plays of Samuel Beckett, including "Waiting For Godot", "Krapp's Last Tape", "Endgame" and "Not I".
2	The Journeyer	1985	8	56	2	https://images.gr-assets.com/books/1388231815l/79155.jpg	Marco Polo was nicknamed "Marco of the millions" because his Venetian countrymen took the grandiose stories of his travels to be exaggerated, if not outright lies. As he lay dying, his priest, family, and friends offered him a last chance to confess his mendacity, and Marco, it is said, replied "I have not told the half of what I saw and did." Now Gary Jennings has imagined the half that Marco left unsaid as even more elaborate and adventurous than the tall tales thought to be lies. From the palazzi and back streets of medieval Venice to the sumptuous court of Kublai Khan, from the perfumed sexuality of the Levant to the dangers and rigors of travel along the Silk Road, Marco meets all manner of people, survives all manner of danger, and, insatiably curious, becomes an almost compulsive collector of customs, languages and women.In more than two decades of travel, Marco was variously a merchant, a warrior, a lover, a spy, even a tax collector - but always a journeyer, unflagging in his appetite for new experiences, regretting only what he missed. Here - recreated and reimagined with all the splendor, the love of adventure, the zest for the rare and curious that are Jennings's hallmarks - is the epic account, at once magnificent and delightful, of the greatest real-life adventurer in human history.
3	Conspiracy of Silence	1989	10	3	3	https://images.gr-assets.com/books/1479674069l/33020060.jpg	Four years after a tragic mission decimated his career and his team, Cole “Tox” Russell is persona non grata to the United States. And that’s fine—he just wants to be left alone. But when a dormant, centuries-old disease is unleashed at an archaeological dig where three Bronze-era censers are found, Tox is lured back into action. Partnered with an archaeologist and an FBI agent who’s an expert in deception, Tox and his team are pitted against a secret society, a plague dubbed the New Black Death, and a revered codex—which may hold the key to stopping the deadly outbreak.
4	Hawk	1999	8	3	3	https://images.gr-assets.com/books/1401317060l/22074622.jpg	Raptor's communications expert, Staff Sergeant Brian "Hawk" Bledsoe is struggling with his inner demons, leaving him on the verge of an "other than honorable" discharge. Plagued with corrupted intel, Raptor team continues to track down the terrorist playing chess with their lives. Afghan pilot Fekiria Haidary is devastated when a systems glitch on her aircraft forces a weapons launch on a safe target. And when the deadly bombing separates Brian from the team, he must make an impossible choice: save his brothers-in-arms, or save the woman and children depending on him to survive a brutal snowstorm.
5	Wolfsbane	1987	8	3	3	https://images.gr-assets.com/books/1328743539l/10082035.jpg	A 2012 Christy Award Winner.  Embark upon a danger-laden mission within the pages of Ronie Kendig’s riveting Wolfsbane. Demolitions expert Danielle Roark thought escaping from a brutal Venezuelan general was a challenge. Now she’s charged with espionage and returned to the jungle where a new nightmare begins. Will Dani survive or become just another political pawn destined to be lost forever? Former Green Beret Canyon Metcalfe is disgusted with the suits on Capitol Hill. Still wrestling with the memories of a mission gone bad, he and Nightshade launch a mission to find Dani. Can Canyon rescue Dani, armed with nothing but raw courage?
7	The Tattooed Wolf	2002	9	58	5	https://images.gr-assets.com/books/1397083173l/21876976.jpg	Caufield muttered as he slouched back in his seat and crossed his hands over his belly, smirking. “You’ve got my attention, Dan; I’ll humour you. Tell me, from the very beginning, how you got into this whole bloody mess.”Morris Caufield thought he’d seen it all…Until the moment Dan Sullivan walked into his office. Dan needs a divorce lawyer he can trust, and he thinks Morris is the man for the job. The thing is, Dan wants Morris to represent his wife. Who tried to kill him. Twice. And as if that wasn’t enough, Dan expects Morris to buy some crazy story about werewolves…As Dan reveals the truth about his life and his marriage, Morris listens to a captivating tale of lycanthropy, love and betrayal. It’s lunacy, he’s sure of that, but there’s something about Dan Sullivan that makes it all very easy to believe.
8	Excalibur	1995	8	56	6	https://images.gr-assets.com/books/1458853190l/3026004.jpg	'Excalibur' é o último volume da trilogia 'As crônicas de Artur', do escritor inglês Bernard Cornwell sobre o lendário guerreiro Artur, que passou para a história com o título de rei, embora nunca tenha usado uma coroa. Neste terceiro volume da série, iniciada com 'O rei do inverno' e 'O inimigo de Deus', o escritor imerge o leitor em uma Britânia cercada pela escuridão. E apresenta os últimos esforços de Artur pra combater os saxões e triunfar sobre um casamento e sonhos desfeitos. O livro mostra, ainda, o desespero de Merlin, o maior de todos os druidas, ao perceber a deserção dos antigos deuses bretões. Sem seu poder, Merlin acha impossível combater os cristãos, mais perigosos para a velha ilha do que uma horda de famintos guerreiros saxões. O livro traz vívidas descrições de lutas de espada e estratégias de guerra, misturadas com descrições da vida comum naqueles dias.
15	All That Remains	1994	10	23	13	https://images.gr-assets.com/books/1412716905l/23124475.jpg	Fear, guilt, and jealousy all rear their ugly heads as Jules and West strive to figure out what they want now that they've emerged from the wreckage of the storm.A year has passed since the night Jules Blacklin and West Rutledge were thrown together by a tornado.Now college freshmen, they’ve worked hard to overcome the tragedies of their pasts to start anew.As they embark on their future, there is one last obstacle standing in the way of them finding complete happiness: themselves.
9	The Keeper	1993	9	28	7	https://images.gr-assets.com/books/1327930196l/11547875.jpg	A family. A farm. A heart. All in need of repair.Life on Windmill Farm hasn't been the same since Julia Lapp's father has had trouble with his heart. But that doesn't stop Julia from hoping for a bright future. She has planned on marrying Paul Fisher since she was a girl. Now twenty-one, she looks forward to their wedding with giddy anticipation. But when Paul tells her he wants to postpone the wedding--again--she is determined to change his mind. She knows who is to blame for Paul's sudden reluctance to wed: the Bee Man.Roman Troyer, the Bee Man, travels through the Amish communities of Ohio and Pennsylvania with his hives full of bees, renting them out to farmers in need of pollinators. A mysterious man who relishes his nomadic life, Roman especially enjoys bringing his bees to Stoney Ridge each year. But with Julia seriously at odds with him, Windmill Farm is looking decidedly less appealing.Can Julia secure the future she's always dreamed of? Or does God have something else in mind?
10	A Primate's Memoir: A Neuroscientist's Unconventional Life Among the Baboons	2002	8	1	8	https://images.gr-assets.com/books/1388201196l/32289.jpg	In the tradition of Jane Goodall and Dian Fossey, Robert Sapolsky, a foremost science writer and recipient of a MacArthur Genius Grant, tells the mesmerizing story of his twenty-one years in remote Kenya with a troop of Savannah baboons.“I had never planned to become a savanna baboon when I grew up; instead, I had always assumed I would become a mountain gorilla,” writes Robert Sapolsky in this witty and riveting chronicle of a scientist’s coming-of-age in remote Africa. An exhilarating account of Sapolsky&amp’s twenty-one-year study of a troop of rambunctious baboons in Kenya, A Primate’s Memoir interweaves serious scientific observations with wry commentary about the challenges and pleasures of living in the wilds of the Serengeti — for man and beast alike. Over two decades, Sapolsky survives culinary atrocities, gunpoint encounters, and a surreal kidnapping, while witnessing the encroachment of the tourist mentality on the farthest vestiges of unspoiled Africa. As he conducts unprecedented physiological research on wild primates, he becomes evermore enamored of his subjects — unique and compelling characters in their own right — and he returns to them summer after summer, until tragedy finally prevents him.By turns hilarious and poignant, A Primate’s Memoir is a magnum opus from one of our foremost science writers.
11	Sugar	2000	8	23	9	https://images.gr-assets.com/books/1504787942l/36196689.jpg	***SUGAR IS A FULL LENGTH STANDALONE ROMANCE*** Country’s hottest bad boy. That’s what they call me. My label ate it up until I became “too bad” for the good folks of country music. That’s when Hard Candy Records picked me up and took a chance on me. Probably not their smartest move, but I won’t tell them that. Especially when they’ve assigned me a babysitter to try and keep my ass out of trouble. One smart-mouthed, unimpressed, sexy as homegrown sin, Addy Mae Masterson. She likes to pretend that she doesn’t like me and I like to let her. I may have a past that haunts me and she may have a habit of getting attached, but damn if I don’t want to show her just how good this bad boy can be.
12	Women's Bodies, Women's Wisdom: Creating Physical and Emotional Health and Healing	1994	7	52	10	https://images.gr-assets.com/books/1320512401l/131830.jpg	When it was first published in 1994, Women’s Bodies, Women’s Wisdom quickly became an international bestseller, and for the past fifteen years it has remained the veritable bible of women’s health. Now, in this revised and updated edition, world-renowned and much-beloved women’s health expert Dr. Christiane Northrup shares with us the latest developments and advances that will maximize our potential for living well in our bodies today. Inside you will discover • new material on sexuality—and how to have a more fulfilling sex life• the spiritual and scientific principles behind healing from terminal illnesses, and how you can utilize these principles for your own health and the health of others• vital information about how to truly dissolve PMS and ease menstrual cramps• extraordinary facts on Vitamin D—and why it is crucial for breast, cardiovascular, and immune system health• the importance of the preconception diet and how to greatly decrease your risk of birth defects• how to birth naturally, despite the current induction and C-section epidemic• all you need to know about thyroid function, including proper blood tests• life-saving facts about cellular inflammation—the root cause of all chronic degenerative diseases—and how to prevent this condition• the essentials on the “fountain of youth molecule”—and how to enhance your levels of it for vibrant health Living a healthy life in a woman’s body can be downright fun—even ecstatic! And that’s good news for everyone—women, men, and their children. 
32	Piercing the Darkness	1989	7	3	29	https://images.gr-assets.com/books/1308796365l/17303.jpg	The light shines in the darkness, and the darkness has not overcome it.John 1:5 (ESV)It all begins in Bacon's Corner, a tiny farming community far from the interstate . . . An attempted murder, a case of mistaken-or is it covered up?-identity, and a ruthless lawsuit against a struggling Christian school. Sally Beth Roe, a young loner, a burnout, a kind of "leftover hippie,"finds herself caught in the middle of these bizarre events, fleeing for her life while trying to recall her dark past.Across a vast panorama of heart-stopping action, Sally Roe's journey is a penetrating portrayal of our times, a reflection of our wanderings, and a vivid reminder of the redemptive power of the Cross. A companion volume to This Present Darkness, readers have purchased over two million copies of Piercing the Darkness since its publication in 1989.
13	Lord of the Horizon	1989	8	41	11	https://images.gr-assets.com/books/1471229410l/744401.jpg	The fourth of Joan Grant's "Far Memory" novels, Lord of the Horizon, set in Egypt at the close of the dark XIth Dynasty, is a profound commentary on the power of fear and the unlimited ability of light to shatter it. It is the sequel to Eyes of Horus.Lord of the Horizon is the story, told in the first person, of Ra-ab, heir to the Nomarch of the Oryx. Ra-ab is twenty-one as the story begins. The dawn for which Ra-ab and the Watchers of the Horizon fought in Eyes of Horus has come, but to 'Send Fear into Exile', as the Watchers' password promised, proves difficult. The new Pharaoh, Amenemhet, marries the daughter of the Pharaoh he deposed, thereby enabling her mother, a Babylonian by birth, to retain influence. Like a spider, she spins a web of intrigue and manipulation which threatens to plunge Egypt back into darkness. Her prize is Amenemhet's son Senusert, who will one day be Pharaoh himself. Finally, Pharaoh realizes what has occurred, and calls on his friend Ra-ab Hotep, hero of the revolution, to take Senusert to his home in the Oryx and help him grow up properly, so he will be ready to fulfill his duties as Pharaoh. But the Babylonian is not yet defeated. She continues to challenge Amenemhet's rule and authority, leading inexorably to the final showdown.As a child growing up in Edwardian England, Joan Grant became aware of an astonishing ability to remember previous lifetimes, and as an author professed her seven novels to be based on her personal recollections of other incarnations, male and female, in ancient civilisations."Ra'ab, the Warrior, heir of the Peace of God... speaks with a voice that those who today are seeking illumination may welcome as the voice of a friend." TLS
14	Follow Your Heart	1995	0	3	12	https://images.gr-assets.com/books/1356230595l/16089117.jpg	Ava finds herself in the Wal-Mart parking lot with both Zeke and Michael. Making a split-second decision she leaves and goes to the Bontrager’s where she has a meltdown and then learns the truth about Rachael, her aunt. At the same time, Zeke finds himself on a long drive where he does some major soul-searching. Then Isaac receives word that Helen’s father, one of the church elders, wants to have an early morning talk with him before the two-hour church service begins.
16	Club Vampyre	1997	7	9	14	https://images.gr-assets.com/books/1388235550l/190378.jpg	Club Vampyre brings together the first three Anita Blake novels, this collection looks at the adventures of the woman vampires call The Executioner.I'm Anita Blake, expert on creatures of the night. Vampires call me The Executioner. What I call them isn't repeatable. Ever since the Supreme Court granted the undead equal rights, most people think vampires are just ordinary folks with fangs. I know better. I carry the scars. . . In my job -- I'm an animator; I raise the dead -- I've seen just about everything. I've dined with shapeshifters, danced with werewolves and been wooed, but not won, by Jean-Claude, the most powerful bloodsucker in St. Louis. When a serial killer started murdering vampires, it was Jean-Claude who wanted me to find the killer. Later a rogue vamp named Alejandro hit town and wanted to make me his human servant. A war of the undead had begun. Over me. I'd have been flattered, if my life weren't at stake.Books in this collection:* Guilty Pleasures (Anita Blake, Vampire Hunter, Bk 1)* The Laughing Corpse (Anita Blake, Vampire Hunter, Bk 2)* Circus of the Damned (Anita Blake, Vampire Hunter, Bk 3)
17	Valor	1989	8	9	15	https://images.gr-assets.com/books/1404588116l/18513718.jpg	War has erupted in the Banished Lands as the race for power intensifies.\n\n\n\n\n\n\n\n Corban flees his homeland searching for peace, but he soon discovers that there is no haven in the west as the agents of Rhin and roaming bands of giants hound his every step.\n\n Veradis leaves the battleground and rushes to his King's side. But he has witnessed both combat and betrayal and his duty weighs heavily upon him.\n\n Maquin seeks only revenge, but pirate slavers and the brutal world of pit-fighting stand in his way.\n\n Nathair becomes embroiled in the wars of the west as Queen Rhin marches against King Owain. The need to find the cauldron of the giants drives him on.\n\n \n\nSides are chosen and oaths will be fulfilled or broken in a land where hell has broken loose.
18	Tortured for Christ	1998	0	17	16	https://images.gr-assets.com/books/1419182359l/78629.jpg	One Man Who Dared to Stand UpMonths of solitary confinement, years of periodic physical torture, constant suffering from hunger and cold, the anguish of brainwashing and mental cruelty--these are the experiences of a Romanian pastor during his 14 years in Communist prisons.His crime, like that of thousands of others, was his fervant belief in Jesus Christ and his public witness concerning that faith.Meeting in homes, in basements, and in woods--sometimes daring to preach in public on street corners--these faithful souls persisted in their Christian witness knowing full well the ultimate cost of their actions.This is their story--a classic account of courage, tenacious faith, and unbelievable endurance. This history of the Underground Church reflects the continuing struggle in many parts of the world today.
19	Muhammad: His Life Based on the Earliest Sources	1987	7	8	17	https://images.gr-assets.com/books/1391978670l/144925.jpg	Martin Lings’ biography of Muhammad is an internationally acclaimed, comprehensive, and authoritative account of the life of the prophet. Based on the sira, the eighth- and ninth-century Arabic biographies that recount numerous events in the prophet’s life, it contains original English translations of many important passages that reveal the words of men and women who heard Muhammad speak and witnessed the events of his life.Scrupulous and exhaustive in its fidelity to its sources, Muhammad: His Life Based on the Earliest Sources is presented in a narrative style that is easily comprehensible, yet authentic and inspiring in its use of language, reflecting both the simplicity and grandeur of the story it tells. This revised edition includes new sections detailing the prophet’s expanding influence and his spreading of the message of Islam into Syria and its neighboring states. It represents the final updates made to the text before the author’s death in 2005. The book has been published in 12 languages and has received numerous awards, including acknowledgment as best biography of the prophet in English at the National Seerate Conference in Islamabad.
20	No Ordinary Genius: The Illustrated Richard Feynman	1995	9	55	18	https://images.gr-assets.com/books/1348078388l/6996.jpg	With a unique combination of dazzling intellect and touching simplicity, Feynman had a passion for physics that was merely the Nobel Prize-winning part of an immense love of life and everything it could offer. He was hugely irreverent and always completely honest—with himself, with his colleagues, and with nature.No Ordinary Genius traces Feynman's remarkable adventures inside and outside science, in words and more than one-hundred photographs, many of them supplied by his family and close friends. The words are often his own and those of family, friends, and colleagues such as his sister, Joan Feynman; his children, Carl and Michelle; Freeman Dyson; Hans Bethe; Daniel Hillis; Marvin Minsky; and John Archibald Wheeler. The book gives vivid insight into the mind of a great creative scientist at work and at play, and it challenges the popular myth of the scientist as a cold reductionist dedicated to stripping romance and mystery from the natural world. Feynman's wonderfully infectious enthusiasm shines through in his photographs and in his tales.
21	New Seeds of Contemplation	1972	0	13	19	https://images.gr-assets.com/books/1436409761l/727578.jpg	A much-enlarged and revised version of Seeds of Contemplation--one of the late Father Merton's most widely-read and best-loved works--New Seeds of Contemplation seeks to awaken the dormant inner depths of the spirit so long neglected by Western man and to nurture a deeply contemplative and mystical dimension in our spiritual lives.
22	Mere Christianity	2001	10	1	20	https://images.gr-assets.com/books/1468102872l/11138.jpg	In the classic Mere Christianity, C.S. Lewis, the most important writer of the 20th century, explores the common ground upon which all of those of Christian faith stand together. Bringing together Lewis’ legendary broadcast talks during World War Two from his three previous books The Case for Christianity, Christian Behavior, and Beyond Personality, Mere Christianity provides an unequaled opportunity for believers and nonbelievers alike to hear this powerful apologetic for the Christian faith.
45	A Civil Campaign	2000	8	53	38	https://images.gr-assets.com/books/1386924032l/61899.jpg	Miles Vorkosigan has a problem: unrequited love for the beautiful widow Ekaterin Vorsoisson, violently allergic to marriage after her first exposure. If a frontal assault won't do, Miles thinks, try subterfuge. He has a cunning plan... Lord Mark Vorkosigan, Miles' brother, also has a problem: his love has just become unrequited again. But he has a cunning plan... Lord Ivan Vorpatril, Mile's cousin, has a problem: unrequited love in general. But he too has a cunning plan... A complex story, as the various members of Miles' family attempt to find their one true love, and a measure of destiny. This against a background of domestic political squabbles and an earnest attempt at capitalist enterprise.
23	Theology for Beginners	1982	9	15	21	https://images.gr-assets.com/books/1344666024l/540187.jpg	…a brilliant book of immense practical usefulness. —Our Sunday Visitor  A Modern Classic  "The joy and excitement of theological knowledge is like the joy and excitement of any other love." —From Chapter One  Clear, precise and inspiring, Theology for Beginners has been acclaimed as one of the outstanding modern introductions to theology. More than a compendium of the central doctrines of Catholicism, however, the book is designed to equip you with the information you need to understand key doctrines and to explain them to others. Along the way, you will find yourself falling more deeply in love with your faith and more confident of your ability to bring healing and hope to what Frank Sheed called "a society that is losing contact with God." Theology for Beginners will help bring the truth to life in your soul.  Doctrines discussed: The Trinity • Creation • The Nature of Man • The Fall • Sin • Redemption • The Incarnation • Grace • Christ's Death • The Resurrection • The Kingdom • Mary • The Holy Spirit • The Sacraments • The Eucharist • Baptism • The Second Coming Theology for Beginners has been acclaimed as one of the outstanding modern introductions to theology. It is a clear, precise, and inspiring compendium of the central doctrines of the Christian faith. Frank Sheed makes the profound truths of theology not only understandable but exciting reading for the Catholic layman. A Servant Book.
24	Walking with the Wind: A Memoir of the Movement	1999	9	1	22	https://images.gr-assets.com/books/1403186088l/27550.jpg	An eloquent, epic firsthand account of the civil rights movement by a man who lived it-an American hero whose courage, vision, and dedication helped change history. The son of an Alabama sharecropper, and now a sixth-term United States Congressman, John Lewis has led an extraordinary life, one that found him at the epicenter of the civil rights movement in the late '50s and '60s. As Chairman of the Student Nonviolent Coordinating Committee (SNCC), Lewis was present at all the major battlefields of the movement. Arrested more than forty times and severely beaten on several occasions, he was one of the youngest yet most courageous leaders. Written with charm, warmth, and honesty, Walking with the Wind offers rare insight into the movement and the personalities of all the civil rights leaders-what was happening behind the scenes, the infighting, struggles, and triumphs. Lewis takes us from the Nashville lunch counter sit-ins to the Edmund Pettus Bridge in Selma, Alabama, where he led more than five hundred marchers on what became known as "Bloody Sunday." While there have been exceptional books on the movement, there has never been a front-line account by a man like John Lewis. A true American hero, his story is "destined to become a classic in civil rights literature." (Los Angeles Times)
25	Something to Someone	1984	8	50	23	https://images.gr-assets.com/books/1348442976l/122136.jpg	Anyone wishing to know someone special while seeking the greater challenge of knowing themselves will find inspiration in the poetry of "Something to Someone." 0-935906-03-7$5.00 / Javan Press
26	A Heart Full of Love	1990	9	50	23	https://images.gr-assets.com/books/1348441973l/122138.jpg	Printed in an attractive script font on beautiful parchment like paper, "A Heart Full of Love" was written for those willing to pay the price to learn the meaning of life and to know the joy of love. 0-935906-02-9$5.00 / Javan Press
27	The Bishop's Daughter	1990	9	28	24	https://images.gr-assets.com/books/1400337356l/136963.jpg	Leona is Bishop Jacob Weaver's daughter and a dedicated teacher in a one-room Amish schoolhouse. After her father's tragic accident, Leona's faith wavers. How could God allow something like this to happen to one of His servants? Outlander Jimmy Scott comes to Pennsylvania in search of his real family. When he is hired to paint an Amish schoolhouse, Jimmy and Leona find themselves irresistibly drawn to each other. Can anything good come from the love between an Amish woman and an English man? What secrets will be revealed and what miracles await God's people in Lancaster County? The Bishop's Daughter is book 3 in the Daughters of Lancaster County series. Other books in the series include The Storekeeper's Daughter: Book 1 and The Quilter's Daughter: Book 2.
28	The Pragmatic Programmer: From Journeyman to Master	1999	9	26	25	https://images.gr-assets.com/books/1401432508l/4099.jpg	-- Ward Cunningham Straight from the programming trenches, The Pragmatic Programmer cuts through the increasing specialization and technicalities of modern software development to examine the core process--taking a requirement and producing working, maintainable code that delights its users. It covers topics ranging from personal responsibility and career development to architectural techniques for keeping your code flexible and easy to adapt and reuse. Read this book, and youll learn how to *Fight software rot; *Avoid the trap of duplicating knowledge; *Write flexible, dynamic, and adaptable code; *Avoid programming by coincidence; *Bullet-proof your code with contracts, assertions, and exceptions; *Capture real requirements; *Test ruthlessly and effectively; *Delight your users; *Build teams of pragmatic programmers; and *Make your developments more precise with automation. Written as a series of self-contained sections and filled with entertaining anecdotes, thoughtful examples, and interesting analogies, The Pragmatic Programmer illustrates the best practices and major pitfalls of many different aspects of software development. Whether youre a new coder, an experienced programm
29	In the Shadow of Man	2000	0	1	26	https://images.gr-assets.com/books/1442180357l/135486.jpg	This best-selling classic tells the story of one of world's greatest scientific adventuresses. Jane Goodall was a young secretarial school graduate when the legendary Louis Leakey chose her to undertake a landmark study of chimpanzees in the world. This paperback edition contains 80 photographs and in introduction by Stephen Jay Gould.
30	Spiritual Midwifery	1990	8	1	27	https://images.gr-assets.com/books/1388179013l/32129.jpg	Here is the 4th edition of the classic book on home birth that introduced a whole generation of women to the concept of natural childbirth. Back again are even more amazing birthing tales, including those from women who were babies in earlier editions and stories about Old Order Amish women attended by the Farm midwives.Also new is information about the safety of techniques routinely used in hospitals during and after birth, information on postpartum depression and maternal death, and recent statistics on births managed by The Farm Midwives.From the amazing birthing tales to care of the newborn, Spiritual Midwifery is still one of the best books an expectant mother could own. Includes resources for doulas, childbirth educators, birth centers, and other organizations and alliances dedicated to improving maternity care at home and in hospitals.
31	Come Away My Beloved	1970	9	11	28	https://images.gr-assets.com/books/1439597253l/6615179.jpg	Come Away, My Beloved was forged in the crucible of life. In the midst of each days joys and trials has come the ministering spirit of the Heavenly Father and the Lord Jesus Christ, bringing words of encouragement, hope, comfort and conviction.
33	Moonrise	1998	10	9	30	https://images.gr-assets.com/books/1399845893l/296942.jpg	Moons have passed since six cats set out on a journey to save their Clans. Now they are traveling home again, but on their way through the mountains, they meet a tribe of wild cats with a secret . . . and their own mysterious prophecy to fulfill. Stormfur can't understand their strange fascination with him, but he knows the danger they face is real.Meanwhile, back in the forest, Firestar and Leafpaw watch ThunderClan's world crumbling around them. Will the questing cats make it back in time to save the Clans, or will they be too late?
34	Night Whispers	1998	8	14	30	https://images.gr-assets.com/books/1348307249l/7217724.jpg	After the sharp-eyed Jay and the roaring Lion, peace will come on Dove's gentle wing.The deadly battle between ThunderClan and ShadowClan is over, but the aftermath still echoes around all four Clans. As Dovepaw grapples with the knowledge that there are realms--and cats--her senses cannot reach, Jayfeather and Lionblaze are determined to figure out how StarClan could have allowed this fight to happen. Jayfeather soon finds the answer in the darkest of places, and he and Lionblaze prepare to do whatever they can to staunch the flow of evil into ThunderClan.The ties that bind the Clans are slowly breaking in the face of the greatest threat that the warriors--and the warrior code--have ever known. As leaf-bare closes its grip upon the territories, Jayfeather, Lionblaze, and Dovepaw realize just how close the battle is, and how far they are from being able to succeed. And before the prey can run again, one more cat will be lost to the fight.
35	Early Days	1999	10	8	31	https://images.gr-assets.com/books/1379394016l/18513789.jpg	Darussalam is proud to present the abridged English translation of the classic work. The book starts by describing the beginning of creation - from the Throne and the Kursi, the Universe and all that is in it, such as the angels, the Jinn and humans. The book also recounts stories from the lives of the Prophets and their nations, up to the times of the Children of Isra'eel and the Days of Ignorance, which ended with the advent of the final Prophet, Muhammad (peace and blessings be upon him).Al-Bidayah wan Nihayah (The Beginning and The End) by the renowned scholar Abu Al-Fida, 'Imad ad-Deen Isma'eel bin 'Umar bin Katheer (Ibn Katheer), is considered one of the most authoritative sources on Islamic history. A unique feature of the book is that it not only deals with past events, but also talks about future events mentioned by Prophet Muhammad (peace and blessings be upon him) until the Day of Judgment.
36	The Forsaken	1982	9	42	32	https://images.gr-assets.com/books/1389218148l/39304.jpg	The Chairman of the Vampire Council is dead, and Lilith, the consort of the Unnamed One, and the Unnamed One himself are out for revenge against Damali Richards, the Vampire Huntress, and her lover, Carlos Rivera. A ruthless and carefully planned strategy---one that not even Damali will anticipate---has been developed. There is only one entity who can best Damali, send Carlos packing, and put the Guardian team at mortal risk. This powerful being was once banished into a forsaken land and possesses everything that would bring a Neteru to his or her knees. This time the fight is not so clear-cut, and it is not only Damali's soul in the balance but her body and heart as well.
37	The Cursed	1996	8	42	32	https://images.gr-assets.com/books/1317064824l/538379.jpg	The Chairman has been killed and now Lilith, Satan’s Consort, sits on the vampire throne as the Vampire Council’s new Chairwoman. She raises all the dark covens, calling every major dark witch and warlock to do her bidding. Her goal is to distract the team members while the unborn heir to the Dark Realms awaits his own birth. All Lilith needs now is Damali’s newly discovered angelic powers. That will allow her evil progeny to walk through the veil between worlds and take his throne as the true Antichrist.Damali and her crew race to stop Lilith. However, raising not only the dark covens but all vampires that had not been slain by Damali, puts the world out of balance and kicks off the Armageddon.
38	The Far Side	1982	9	37	33	https://images.gr-assets.com/books/1347655344l/121173.jpg	1982 FarWorks, Inc. All Rights Reserved.The Far Side and the Larson signature are registered trademarks of FarWorks, Inc.
39	The Far Side Gallery 4	1993	0	37	33	https://images.gr-assets.com/books/1389239021l/233692.jpg	1993 FarWorks, Inc. All Rights Reserved.The Far Side and the Larson signature are registered trademarks of FarWorks, Inc.
40	Mother Goose	1983	9	32	34	https://images.gr-assets.com/books/1320561871l/1734663.jpg	Vintage artwork and the classic Disney characters add a world of charm to these perennial Mother Goose nursery rhyme favorites–from “Peter Pumpkin Eater,” “Hey, Diddle, Diddle,” and “Little Miss Muffet” to “Jack Sprat,” “Simple Simon,” “Old King Cole,” and more. This Little Golden Book from the 1940s is a must-have addition to every Little Golden Book collector’s library.
41	Five Smooth Stones	1985	10	58	35	https://images.gr-assets.com/books/1173310355l/271685.jpg	David Champlin is a black man born into poverty in Depression-era New Orleans who achieves great success and then sacrifices everything to lead his people in the difficult, day-by-day struggle of the civil rights movement. Sara Kent is the beloved and vital white girl who loved David from the moment she first saw him, but they struggle over David's belief that a marriage for them would not be right in the violent world he had to confront. First published in 1966, this epic has become one of the most loved American bestsellers.
42	The Angry Clam	1998	10	58	36	https://images.gr-assets.com/books/1387743025l/619873.jpg	Treating such topics as ambition, self-definition, and parent-child relationships, this fable for the Generation X reader follows a clam on a qu for his rightful place in the world.
43	Thunderhead	1988	9	46	37	https://images.gr-assets.com/books/1505658534l/33555224.jpg	Rowan has gone rogue, and has taken it upon himself to put the Scythedom through a trial by fire. Literally. In the year since Winter Conclave, he has gone off-grid, and has been striking out against corrupt scythes—not only in MidMerica, but across the entire continent. He is a dark folk hero now—“Scythe Lucifer”—a vigilante taking down corrupt scythes in flames.Citra, now a junior scythe under Scythe Curie, sees the corruption and wants to help change it from the inside out, but is thwarted at every turn, and threatened by the “new order” scythes. Realizing she cannot do this alone—or even with the help of Scythe Curie and Faraday, she does the unthinkable, and risks being “deadish” so she can communicate with the Thunderhead—the only being on earth wise enough to solve the dire problems of a perfect world. But will it help solve those problems, or simply watch as perfection goes into decline?
68	Disney's Lady and the Tramp: Classic Storybook	1997	10	32	59	https://images.gr-assets.com/books/1182582571l/1298218.jpg	Relive the movies one book at a time.To a child, every day is filled with adventure and fantasy. So is a Classic Storybook from Mouse Works. With 96 pages of enchanting story and action-packed illustrations, each book captures the movie magic and places it right into a chid's hands. The Classic Storybook Collection from Mouse Works - the books your child will laugh, learn, and live with every day.
385	Gates of Fire: An Epic Novel of the Battle of Thermopylae	1999	9	58	308	https://images.gr-assets.com/books/1386924869l/1305.jpg	In 480 B.C., two million Persian invaders come to the mountain pass of Thermopylae in eastern Greece, where they are met by 300 of Sparta's finest warriors. The Greek loyalists battle for six days in a prelude to their ultimate victory.
44	Mirror Dance	1995	7	53	38	https://images.gr-assets.com/books/1297831387l/61909.jpg	The dwarfish, fetally-damaged yet brilliant Miles Vorkosigan has more than his share of troubles. Having recently escaped an assassination plot whose tool was a brainwashed clone of himself, Miles has set the clone, Mark, free for a new chance at life. But when he decides to let his clone brother assume his secret identity and lead the Dendarii Free Mercenary on an unauthorized mission to liberate other clones from the outlaw planet of Jackson's Whole, things start to get really messy. The mission goes awry, Miles's rescue attempt goes even more wrong, and Miles ends up killed and placed in cryogenic suspension for future resuscitation. Then, as if that weren't bad enough, the cryo-container is lost! Now it is up to the confused, disturbed Mark to either take Miles's place as heir of the Vorkosigan line or redeem himself by finding and saving Miles.
46	Blood	2000	9	9	39	https://images.gr-assets.com/books/1394261781l/17385264.jpg	From Amazon:Dindi and Umbral have an uneasy truce, forced to work together to defeat a greater enemy: the Bone Whistler. The Bone Whistler’s scheme to sacrifice humanity and resurrect the Aelfae will culminate during an eclipse on the spring equinox…in three days.Their fragile alliance may not withstand the terrors they face. Dindi hides as a clown, but even disguised, her dancing draws the eye of the Bone Whistler himself. She will have to defy him alone, for Umbral has his own troubles. Finnadro, who has hunted Umbral for a year, finally catches up with him… determined to punish Umbral for all his black deeds.Life and death, spring and autumn, human and faery, are all reeling out of balance, and the next three days will determine the fate of all Faearth.
47	Endurance: Shackleton's Incredible Voyage	1994	6	1	40	https://images.gr-assets.com/books/1400337660l/22130605.jpg	Bound for Antarctica, where polar explorer Ernest Shackleton planned to cross on foot the last uncharted continent, the Endurance set sail from England in August 1914. In January 1915, after battling its way for six weeks through a thousand miles of pack ice and only a day’s sail short of its destination, the Endurance became locked in an island of ice. For ten months the ice-moored Endurance drifted northwest before it was finally crushed. But for Shackleton and his crew of twenty-seven men, the ordeal had barely begun. It would end only after a miraculous journey through more than 850 miles of the South Atlantic’s heaviest seas to the closest outpost of civilization.In Endurance, the definitive account of Shackleton’s fateful trip, Alfred Lansing brilliantly narrates the harrowing voyage that has defined heroism for the last century.
48	The Enchanted Forest Chronicles	1995	9	9	41	https://images.gr-assets.com/books/1439545607l/86238.jpg	Collected together for the first time are Patricia C. Wrede's hilarious adventure stories about Cimorene, the princess who refuses to be proper. Every one of Cimorene's adventures is included in its paperback edition--"Dealing with Dragons, Searching for Dragons, Calling on Dragons, " and "Talking to Dragons"--in one handsome package that's perfect for gift giving.
49	The Book of Disquiet	2001	9	58	42	https://images.gr-assets.com/books/1382871857l/45974.jpg	Fernando Pessoa was many writers in one. He attributed his prolific writings to a wide range of alternate selves, each of which had a distinct biography, ideology. and horoscope. When he died in 1935, Pessoa left behind a trunk filled with unfinished and unpublished writings, among which were the remarkable pages that make up his posthumous masterpiece, The Book of Disquiet, an astonishing work that, in George Steiner's words, "gives to Lisbon the haunting spell of Joyce's Dublin or Kafka's Prague."Published for the first time some fifty years after his death, this unique collection of short, aphoristic paragraphs comprises the "autobiography" of Bernardo Soares, one of Pessoa's alternate selves. Part intimate diary, part prose poetry, part descriptive narrative, captivatingly translated by Richard Zenith, The Book of Disquiet is one of the greatest works of the twentieth century.
50	Mirabile	1991	7	53	43	https://images.gr-assets.com/books/1286095184l/1141442.jpg	On the distant planet of Mirabile, a settlement of human colonists from Earth is jeopardized by genetic mutants of Earth plants and animals, and it is up to ecological troubleshooter Mama Jason to destroy the menacing mutants. Reprint.Contents:The Loch Moose Monster (1989)The Return of the Kangaroo Rex (1989)The Flowering Inferno (1990)Getting the Bugs Out (1990)Raising Cane (1991)Frankenswine (1991)
51	Poesía completa	2000	8	50	44	https://images.gr-assets.com/books/1369199656l/401060.jpg	Publicamos ahora en una colección de poesía la obra poética completa —libros de poemas editados en vida de la autora y poemas inéditos compilados a partir de manuscritos— de Alejandra Pizarnik, una de las figuras más emblemáticas de las literaturas iberoamericanas, controvertida, polémica, que se convirtió en un mito entre los jóvenes de las décadas de 1980 y 1990. Su poesía se caracteriza por un hondo intimismo y una severa sensualidad. En palabras de Octavio Paz, la obra de Pizarnik lleva a cabo una “cristalización verbal por amalgama de insomnio pasional y lucidez meridiana en un disolución de realidad sometida a las más altas temperaturas” y Pieyre de Mandiargues le escribió, con motivos de la publicación de Extracción de la piedra de locura: “Tengo amor a tus poemas: querría que hicieras muchos y que tus poemas difundieran por todas partes el amor y el terror”.
52	Man's Search for Meaning	1982	9	1	45	https://images.gr-assets.com/books/1535419394l/4069.jpg	Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Based on his own experience and the stories of his patients, Frankl argues that we cannot avoid suffering but we can choose how to cope with it, find meaning in it, and move forward with renewed purpose. At the heart of his theory, known as logotherapy, is a conviction that the primary human drive is not pleasure but the pursuit of what we find meaningful. Man's Search for Meaning has become one of the most influential books in America; it continues to inspire us all to find significance in the very act of living.
407	The Law	1998	9	59	324	https://images.gr-assets.com/books/1185827392l/1609224.jpg	How is it that the law enforcer itself does not have to keep the law? How is it that the law permits the state to lawfully engage in actions which, if undertaken by individuals, would land them in jail? These are among the most intriguing issues in political and economic philosophy. More specifically, the problem of law that itself violates law is an insurmountable conundrum of all statist philosophies. The problem has never been discussed so profoundly and passionately as in this essay by Frederic Bastiat from 1850. The essay might have been written today. It applies in ever way to our own time, which is precisely why so many people credit this one essay for showing them the light of liberty. Bastiat's essay here is timeless because applies whenever and wherever the state assumes unto itself different rules and different laws from that by which it expects other people to live. And so we have this legendary essay, written in a white heat against the leaders of 19th century France, the reading of which has shocked millions out of their toleration of despotism. This new edition from the Mises Institute revives a glorious translation that has been out of print for a hundred years, one that circulated in Britain in the generation that followed Bastiat's death. This newly available translation provides new insight into Bastiat's argument. It is a more sophisticated, more substantial, and more precise rendering than any in print. The question that Bastiat deals with: how to tell when a law is unjust or when the law maker has become a source of law breaking? When the law becomes a means of plunder it has lost its character of genuine law. When the law enforcer is permitted to do with others' lives and property what would be illegal if the citizens did them, the law becomes perverted. Bastiat doesn't avoid the difficult issues, such as why should we think that a democratic mandate can convert injustice to justice. He deals directly with the issue of the expanse of legislation: It is not true that the mission of the law is to regulate our consciences, our ideas, our will, our education, our sentiments, our sentiments, our exchanges, our gifts, our enjoyments. Its mission is to prevent the rights of one from interfering with those of another, in any one of these things. Law, because it has force for its necessary sanction, can only have the domain of force, which is justice. More from Bastiat's The Law: Socialism, like the old policy from which it emanates, confounds Government and society. And so, every time we object to a thing being done by Government, it concludes that we object to its being done at all. We disapprove of education by the State - then we are against education altogether. We object to a State religion - then we would have no religion at all. We object to an equality which is brought about by the State then we are against equality, etc., etc. They might as well accuse us of wishing men not to eat, because we object to the cultivation of corn by the State. How is it that the strange idea of making the law produce what it does not contain - prosperity, in a positive sense, wealth, science, religion - should ever have gained ground in the political world? The modern politicians, particularly those of the Socialist school, found their different theories upon one common hypothesis; and surely a more strange, a more presumptuous notion, could never have entered a human brain. They divide mankind into two parts. Men in general, except one, form the first; the politician himself forms the second, which is by far the most important. Whether you buy one or one hundred, you can look forward to one of the most penetrating and powerful essays written in the history of political economy.
53	When I Fall in Love	1999	9	3	46	https://images.gr-assets.com/books/1386631058l/19320758.jpg	Hawaii was the last place Grace Christiansen ever imagined she’d vacation, much less fall in love. But when her family surprises her with a cooking retreat in paradise, she is pulled—or maybe yanked—away from her predictable, safe life and thrown headfirst into the adventure of a lifetime.Maxwell Sharpe may make his living on the ice as a pro hockey player, but he feels most at home in the kitchen. Which is why he lives for the three-week culinary vacation he takes each year in Hawaii. Upon being paired with Grace for a cooking competition, Max finds himself drawn to her passion, confidence, and perseverance. But just when Grace dares to dream of a future beyond her hometown, Max pulls away.Wrestling with personal demons, Max fights against opening his heart to a love he knows he should never hope for. And as his secrets unfold, Grace is torn between the safe path in front of her and what her heart truly desires. If love means sacrificing her ideal happily ever after, Grace’s faith will face its toughest test yet.
61	A Fine Balance	2001	9	58	52	https://images.gr-assets.com/books/1386925449l/5211.jpg	With a compassionate realism and narrative sweep that recall the work of Charles Dickens, this magnificent novel captures all the cruelty and corruption, dignity and heroism, of India. The time is 1975. The place is an unnamed city by the sea. The government has just declared a State of Emergency, in whose upheavals four strangers--a spirited widow, a young student uprooted from his idyllic hill station, and two tailors who have fled the caste violence of their native village--will be thrust together, forced to share one cramped apartment and an uncertain future. As the characters move from distrust to friendship and from friendship to love, A Fine Balance creates an enduring panorama of the human spirit in an inhuman state.
54	All Is Well	1991	8	56	47	https://images.gr-assets.com/books/1266601542l/625559.jpg	All Is Well, the powerful and moving ninth volume of the series The Work and the Glory, brings to a close the Restoration-era portion of this epic story. It follows the fictional Steed family from June 1846 to October 1847 as they participate in some of the most pivotal and dramatically charged events in Church history, including the migration of the Saints from the banks of the Missouri River to the Valley of the Great Salt Lake.As this volume opens, the Steeds have been scattered — and the family is only split up further as the story unfolds. Will and Alice's voyage aboard the Brooklyn nears its end as the ship approaches the California shore. Peter and Kathryn continue their journey westward in the Donner-Reed party. In Nauvoo, Melissa and Carl find their situation growing increasingly dangerous and their marriage more and more strained. Other Steed family members are temporarily encamped at the Missouri River, where the Saints will set up winter quarters. When the United States government, at war with Mexico, calls for five hundred Mormon volunteers to form a battalion, some of the Steeds march with that battalion in its history-making trek across the continents. Meanwhile, other family members become part of the pioneer companies that, at last, establish in the West a place of refuge for the Saints.As with the previous books in the series, this volume is populated with a host of interesting characters, both fictional and historical. And even though throughout most of the story the Steeds are separated from one another, hope remains that somehow all of them will be reunited, and with the rest of the Saints they will make the chorus swell: “All is well! All is well!”
57	Lean on Me	1996	0	27	49	https://images.gr-assets.com/books/1450560898l/7230431.jpg	"From beginning to end a sinfully delicious story of one woman's struggle to trust who she is inside and accept herself as well as the love of the man that she loves with all her heart." ~ Book JunkieAndrea wants to submit, but not to just any so-called Dom. He has to be tougher than the slum-bred bullies she grew up with. She’d given up finding a true Dom when her friend finagles her a place as a trainee in an exclusive BDSM club with the powerful Shadowlands Masters. Andrea’s thrilled…and terrified.Forced to accept an unknown submissive into his carefully run trainee program, Master Cullen is furious. Not only is the young woman new to BDSM, but she’s unsuited to her role--armoured in leather like a Domme, she’s more liable to punch a Dom than kneel. He decides to push her right back out the door. But as he ruthlessly intimidates her, punishes her, then cuddles her, his glimpses of the woman inside the emotional armour intrigue him and her utter surrender captures his heart.Although Master Cullen is famous for his unfettered lifestyle, Andrea believes he might be interested in her, until she discovers he’s not just a bartender--he’s a cop. Maybe he’d overlook her past brush with the law, but when another trainee accuses her of stealing money, Andrea knows she’s lost the Master she wanted with all her heart.
55	Praise to the Man	1997	9	56	47	https://images.gr-assets.com/books/1197090757l/625649.jpg	Written with a dramatic intensity and an eye for historical detail that thousands of readers have come to appreciate in previous volumes, Praise to the Man — volume 6 in the series The Work and the Glory — follows the story of the restored Church and of the ficitonal Steed family from the summer of 1841 to the summer of 1844. Several momentous events take place during this period in Church history: Nauvoo becomes a well-established city; the Relief Society is founded; the endowment is administered for the first time in this dispensation; Joseph Smith becomes a candidate for president of the United States; he delivers his monumental King Follett Discourse. Meanwhile, however, dark forces outside as well as inside the Church are at work to destroy Joseph and the Restoration cause. Before the story ends, the powers of evil will have swept across the Church, taking out some in very high places, making numerous others waver, and taking Joseph and his brother Hyrum to their date with destiny in a town called Carthage. Woven throughout these events are the lives of the Steeds. As Joshua sees the Mormons gaining more influence with his wife and children, his patience finally reaches the breaking point. Will must resolve his feelings for Jenny Pottsworth and his desire to know if the Church is true. New hope is born in Jessica's life when she is offered a new teaching position. Mary Ann and other Steed women participate in the beginnings of the Relief Society. But before long, whisperings reach the ears of some of the Steeds about curious teachings and practices going on in Nauvoo — specifically it is rumored that God may have restored the ancient practice of plural marriage. How will they respond when they find out that at least some of the rumors are true? The issue becomes a trial of faith that shakes the Steed family to its very roots. At the center of this volume are the final days of the life and mission of the Prophet Joseph Smith. Though heart-wrenching in its depiction of the Prophet's last hours on earth, this book inspires admiration and affection for “the man who communed with Jehovah” and will fill readers with anticipation for that glorious time when, in the words of the hymn, “millions shall know 'Brother Joseph' again.”
656	Hope for Each Day: Words of Wisdom and Faith	2002	8	11	492	https://images.gr-assets.com/books/1348077021l/173307.jpg	In keeping with the spirit of Max Lucado's Grace for the Moment, Charles Swindoll's Wisdom for the Way, and John MacArthur's Truth for Today comes the latest edition into the Daily Devotional series. In Hope for Each Day, Billy Graham offers spiritual comfort to guide us through our daily lives. Rev. Graham is a national treasure and has counseled numerous political leaders and provided comfort in times of public crisis.
65	By Any Means Necessary	1992	9	1	56	https://images.gr-assets.com/books/1377262959l/187220.jpg	Speeches tracing the evolution of Malcolm X's views on political alliances, women's rights, intermarriage, capitalism and socialism, and more.
56	Say Goodnight, Gracie	1989	10	46	48	https://images.gr-assets.com/books/1347235436l/431178.jpg	There are friends we can't imagine living without.Morgan and Jimmy were kids together, whirling around the porch on hot summer days. They've been friends forever, and by now they know each other inside out. They do everything together--from cutting high school to go into the city to coaching each other at dance auditions and acting workshops. They even argue well. A perfect friendship. Best friends. For life.So how could life be so right and then be so wrong? After a terrible accident, Morgan suddenly has to face life alone. Without Jimmy around, though, it's like the best part of her has died. How could he do this to her? And why is love so hard?1989 Recommended Books for Reluctant Young Adult Readers (ALA)1988 Young Adult Editors' Choices (BL)Young Adult Choices for 1990 (IRA)Children's Books of 1988 (Library of Congress)1988 Books for the Teen Age (NY Public Library)
95	Right Ho, Jeeves	1975	10	58	84	https://images.gr-assets.com/books/1166855734l/18035.jpg	Follow the adventures of Bertie Wooster and his gentleman’s gentleman, Jeeves, in this stunning new edition of one of the greatest comic novels in the English language. Bertie must deal with the Market Snodsbury Grammar School prize giving, the broken engagement of his cousin Angela, the wooing of Madeline Bassett by Gussie Fink-Nottle, and the resignation of Anatole, the genius chef. Will he prevail? Only with the aid of Jeeves!
58	If Only	1997	8	27	49	https://images.gr-assets.com/books/1382471840l/15755242.jpg	After the last fiasco, Sally gives up. She’ll never find a Dom of her own. Instead the computer whizz is job hunting in between bending the law—just a bit—to unearth the bastards who’d enslaved her friends. The clueless cops and Feds obviously need help.FBI special agents, Galen and Vance, have waited to play with Sally for a long time. When the mischievous submissive returns to the exclusive Shadowlands BDSM club after an ugly relationship, the experienced co-tops are pleased. Realizing she’s suppressing her emotions, the powerful Doms push her—only to find that her sassiness conceals a scarred and vulnerable heart.Shaken by the unexpected emotional exposure, Sally flees the demanding Masters and the Shadowlands.Both Galen and Vance have reasons not to seek a long-term submissive, but when a brutal attack by her ex-Dom sends Sally into their home, the two agents are driven to protect her. To help her. To take her under command. Falling in love isn’t in the plans.But as the little imp brings light into their lives, they begin to want more…until they discover she’s hacked into an organization that delights in burning people alive.Word Count = 135,576
59	Liza Lou and the Yeller Belly Swamp	1976	9	32	50	https://images.gr-assets.com/books/1281449786l/257070.jpg	Gruesome creatures galore lurk in Yeller Belly Swamp, but they aren't going to stop plucky Liza Lou from getting her mother's sweet potatoes over to Gramma's place. "This has a kick-up-your heels quality -- there's never any doubt about who's going to have the last laugh". -- Booklist.
60	White Heat	2004	9	23	51	https://images.gr-assets.com/books/1449485109l/25968411.jpg	MC President, Rochlan “Rock” North finally has everything he’s ever wanted. Hope as his ol’ lady and his MC earning money while staying out of trouble. The only thing left is to make Hope his wife. But as their wedding day nears, an old adversary threatens Rock’s freedom, the wedding, and throws the Lost Kings MC into chaos.While the club waits for Rock's fate to be decided, Wrath has to balance solidifying his new relationship with Trinity and fulfilling his president's orders.
554	Walking on Water: Reflections on Faith and Art	1995	8	1	422	https://images.gr-assets.com/books/1320404692l/136814.jpg	In this classic book, Madeleine L'Engle addresses the questions, What makes art Christian? What does it mean to be a Christian artist? What is the relationship between faith and art? Through L'Engle's beautiful and insightful essay, readers will find themselves called to what the author views as the prime tasks of an artist: to listen, to remain aware, and to respond to creation through one's own art.
62	Footprints Of A Pilgrim	2001	9	1	53	https://images.gr-assets.com/books/1174980717l/464916.jpg	Footprints Of A Pilgrim is Ruth Bell Graham's life story told in her own words (weaving together her prose and poetry) with added tidbits and anecdotes from her family (husband Billy and her children Gigi, Anne, Franklin, Ruth and Ned) and many of her friends (including Barbara Bush, Lady Bird Johnson, Jan Karon, Patricia Cornwell and others). With snatches of insight and glimpses of grace, Footprints Of A Pilgrim tells the story of a life (a very full and special life) complete with memories of joy, pain, brokenness, and healing. Also included are many never before published pictures which illustrate the remarkable journey of Ruth Bell Graham, as a child of a missionaries in Quingjiang, China in 1920, until today at her home in Little Piney Cove, Montreat, North Carolina.
63	Total Surrender	1990	9	23	54	https://images.gr-assets.com/books/1428527952l/21855601.jpg	A fight he must win...Piper Oliver knows she can't trust him. They warned her that the tall, dark, and sexy black-ops soldier Jory Dean would try to win her over with his steel-gray eyes and deadly charm, but she won't be conned by this man they call a traitor. All she has to do is figure out the science necessary to save his life, and she's done. Something isn't adding up, though, and she won't rest until she uncovers the truth-even if it's buried in his deep, dangerous kiss.A passion she can't resist...Jory will do anything to reunite with and save his brothers—even kidnap the gorgeous woman who's working to deactivate the deadly chip in their spines. But the forces determined to destroy his family won't let them go so easily. Keeping Piper alive is more than he bargained for—and so is his burning desire for her. But with every second bringing him closer to certain death, can he afford to lose himself in her hot and willing embrace?
64	Dominion	1996	10	46	55	https://images.gr-assets.com/books/1517941335l/38390771.jpg	Nothing comes without a cost.  After defeating the red dragon’s legion of bloodthirsty demons, Audrey can finally settle into the afterlife with the knowledge her family is safe. But her quest for a perfect existence shatters the moment Logan is kidnapped in an attempt to bend her to Satan’s will. Audrey must now travel to the one place no hunter has ever ventured to save the man she loves . . . Hell. Savage demons, desiccated corpses, life sucking zombie trees, and a land of death and rot await Audrey and her friends as they battle through the fiery realm. But Logan’s freedom comes with a price . . . the destruction of Audrey’s happily ever after. As Satan schemes for dominion over all the realms, Audrey learns that some acts may be beyond redemption. Fans of The Mortal Instruments, Buffy, and Supernatural won't want to miss out on all the twists and turns in the conclusion of this YA Fantasy journey. The LIFE AFTER SERIES is now complete . . . binge the entire series today!  - Book 1: Huntress (4x award winner) - Book 2: Warfare - Book 2.5: Logan (A Companion Story) - Book 3: Dominion Genre: Teen and Young Adult Christian Fantasy and Paranormal
66	Soulsmith	1991	10	9	57	https://images.gr-assets.com/books/1474963120l/32283608.jpg	Outside Sacred Valley, ancient ruins rise from the earth, drawing sacred artists from miles around to fight for the treasures within. Lindon has reached Copper, taking the first step on the road to power, but the warriors of the outside world are still far beyond him. To advance, he turns to the arcane skills of the Soulsmiths, who craft weapons from the stuff of souls. With new powers come new enemies, and Lindon soon finds himself facing an entire sect of Golds.
67	Look-Alikes Jr. : Find More Than 700 Hidden Everyday Objects	1999	9	32	58	https://images.gr-assets.com/books/1387665206l/839503.jpg	Simple verses challenge readers to identify the everyday objects used to construct eleven three-dimensional scenes, including a house, kitchen, bedroom, school bus, train, farm, and rocket.
69	National Geographic: The Photographs	1994	10	48	60	https://images.gr-assets.com/books/1320517999l/5405887.jpg	This stunning volume was the gift book of the year when it first published, and the images that grace its pages remain iconic. From the famous Afghan girl whose haunting green eyes stare out from the book’s cover, and her poignant story that captured the world’s interest, to award-winning photography culled from the Society’s vast archives, The Photographs offers readers an inside look at National Geographic and a sharp-eyed view of the world. The book showcases the skill and imagination of such notable Geographic photographers as David Doubilet, William Albert Allard, Sam Abell, Jim Stanfield, Jodi Cobb, Jim Brandenburg, David Alan Harvey, and many more. They share their techniques, as well as personal and colorful anecdotes about individual images and their adventures in the field—sometimes humorous, sometimes terrifying, always vividly compelling. Author Leah Bendavid-Val writes about the photographers’ achievements from technical, journalistic, and artistic perspectives.Five chapters cover core National Geographic themes—wildlife on land and water; cultures in the United States and around the world; and science, from astronomy to archaeology to the human senses. The photographs in each chapter capture rare moments in nature and the lives of animals, along with defining events in the lives of people everywhere. This exquisite collection is as elegant as it is timeless.
70	Teachings of the Prophet Joseph Smith	1977	8	8	61	https://images.gr-assets.com/books/1409024254l/574361.jpg	Sermons and writings of Joseph Smith, the Prophet, as compiled by Joseph Fielding Smith.
71	A Cry of Angels	1979	7	58	62	https://images.gr-assets.com/books/1328807932l/727281.jpg	It is the mid-1950s in Quarrytown, Georgia. In the slum known as the Ape Yard, hope's last refuge is a boardinghouse where a handful of residents dream of a better life. Earl Whitaker, who is white, and Tio Grant, who is black, are both teenagers, both orphans, and best friends. In the same house live two of the most important adults in the boys' lives: Em Jojohn, the gigantic Lumbee Indian handyman, is notorious for his binges, his rat-catching prowess, and his mysterious departures from town. Jayell Crooms, a gifted but rebellious architect, is stuck in a loveless marriage to a conventional woman intent on climbing the social ladder.Crooms's vision of a new Ape Yard, rebuilt by its own residents, unites the four-and puts them on a collision course with Doc Bobo, a smalltown Machiavelli who rules the community like a feudal lord. Jeff Fields's exuberantly defined characters and his firmly rooted sense of place have earned A Cry of Angels an intensely loyal following. Its republication, more than three decades since it first appeared, is cause for celebration.
138	The Trophy Wife	2001	10	51	115	https://images.gr-assets.com/books/1337907592l/2628667.jpg	Ashley & Jaquavis introduce the reader to London, a beautiful immigrant from Trinidad. She was given to her husband by her father in order to settle a debt. Standing by her husband's side, making him the envy of his associates is a day in the life, but behind closed doors their relationship becomes cold and the abuse she encounters has her looking for a way out. When she meets a young thug named Kalil he opens her up to a world she never knew. Afraid of the repercussions of her actions, she avoids Kalil at all costs, but his relentless pursuit made their love inevitable. This story keeps you guessing until the very final page and the outcome will leave you breathless. Enter the world of The Trophy Wife.
72	Understanding Power: The Indispensable Chomsky	2002	10	59	63	https://images.gr-assets.com/books/1386924655l/194805.jpg	A major new collection from "arguably the most important intellectual alive" (The New York Times). Noam Chomsky is universally accepted as one of the preeminent public intellectuals of the modern era. Over the past thirty years, broadly diverse audiences have gathered to attend his sold-out lectures. Now, in Understanding Power, Peter Mitchell and John Schoeffel have assembled the best of Chomsky's recent talks on the past, present, and future of the politics of power. In a series of enlightening and wide-ranging discussions, all published here for the first time, Chomsky radically reinterprets the events of the past three decades, covering topics from foreign policy during Vietnam to the decline of welfare under the Clinton administration. And as he elucidates the connection between America's imperialistic foreign policy and the decline of domestic social services, Chomsky also discerns the necessary steps to take toward social change. With an eye to political activism and the media's role in popular struggle, as well as U.S. foreign and domestic policy, Understanding Power offers a sweeping critique of the world around us and is definitive Chomsky. Characterized by Chomsky's accessible and informative style, this is the ideal book for those new to his work as well as for those who have been listening for years.
73	Band of Brothers: E Company, 506th Regiment, 101st Airborne from Normandy to Hitler's Eagle's Nest	1992	7	34	64	https://images.gr-assets.com/books/1388247701l/42389.jpg	As good a rifle company as any, Easy Company, 506th Airborne Division, US Army, kept getting tough assignments--responsible for everything from parachuting into France early DDay morning to the capture of Hitler's Eagle's Nest at Berchtesgaden. In "Band of Brothers," Ambrose tells of the men in this brave unit who fought, went hungry, froze & died, a company that took 150% casualties & considered the Purple Heart a badge of office. Drawing on hours of interviews with survivors as well as the soldiers' journals & letters, Stephen Ambrose recounts the stories, often in the men's own words, of these American heroes.Foreword"We wanted those wings"; Camp Toccoa, 7-12/42"Stand up & hook up"; Benning, Mackall, Bragg, Shanks, 12/42-9/43"Duties of the latrine orderly"; Aldbourne, 9/43-3/44"Look out, Hitler! Here we come!"; Slapton Sands, Uppottery, 4/1-6/5/44"Follow me"; Normandy, 6/6/44"Move out!"; Carentan, 6/7-7/12/44Healing wounds & scrubbed missions; Aldbourne, 7/13-9/16/44"Hell's highway"; Holland, 9/17-10/1/44Island; Holland, 10/2-11/25/44Resting, recovering & refitting: Mourmelon-le-Grand, 11/26-12/18/44"They got us surrounded-the poor bastards"; Bastogne, 12/19-31/44Breaking point; Bastogne, 1/1-13/45 Attack; Noville, 1/14-17/45Patrol: Haguenau, 1/18-2/23/45"Best feeling in the world": Mourmelon, 2/25-4/2/45Getting to know the enemy: Germany, 4/2-30/45Drinking Hitler's champagne; Berchtesgaden, 5/1-8/45Soldier's dream life; Austria, 5/8-7/31/45Postwar careers; 1945-91Acknowledgments & SourcesIndex
75	Wild Swan	1984	10	56	66	https://images.gr-assets.com/books/1389514818l/9764.jpg	Sweeping from England's West Country during the Napoleonic wars when smuggling flourished, to Maryland's lush horse country-a golden land shadowed by slavery and soon to be ravaged by civil war-this is the story of unforgettable Alexandria Thaine and the generations of two families interwoven by fortune and fate. Across an ocean, through decades of danger and desire, this is Alexandria's life-the life of an indomitable woman who gives her tormented heart to two bold men, who travels to distant America in search of a dream and in flight from a love that would follow her to the end of her days, and who creates a dynasty in the years preceding the Civil War.
96	Joy in the Morning	1976	7	58	84	https://images.gr-assets.com/books/1381744220l/9928818.jpg	Follow the adventures of Bertie Wooster and his gentleman’s gentleman, Jeeves, in this stunning new edition of one of the greatest comic novels in the English language. Steeple Bumphleigh is a very picturesque place. But for Bertie Wooster, it is a place to be avoided, containing not only the appalling Aunt Agatha but also her husband, the terrifying Lord Worplesdon. So when a certain amount of familial arm-twisting is applied, Bertie heads for the sticks in fear and trepidation despite the support of the irreplaceable Jeeves.
77	Moon Rising	2000	9	9	68	https://images.gr-assets.com/books/1421370732l/22323659.jpg	The New York Times-bestselling series soars to even greater heights with a new prophecy and five new dragonets ready to claim their destiny! Peace has come to Pyrrhia . . . for now. The war between the tribes is finally over, and now the dragonets of the prophecy have a plan for lasting peace: Jade Mountain Academy, a school that will gather dragonets from all the tribes and teach them to live together, perhaps even as friends. Moonwatcher isn’t sure how she feels about school, however. Hidden in the rainforest for most of her life, the young NightWing has an awful secret. She can read minds, and even see the future. Living in a cave with dozens of other dragons is noisy, exhausting--and dangerous. In just a few days, Moon finds herself overwhelmed by her secret powers and bombarded by strange thoughts, including those of a mysterious dragon who might be a terrible enemy. And when someone starts attacking dragons within the academy, Moon has a choice to make: Stay hidden and safe? Or risk everything to save her new friends?
78	Pale Blue Dot: A Vision of the Human Future in Space	1994	8	55	69	https://images.gr-assets.com/books/1500191671l/61663.jpg	Pulitzer Prize-winning author Carl Sagan traces our exploration of space and suggests that our very survival may depend on the wise use of other worlds. This stirring book reveals how scientific discovery has altered our perception of who we are and where we stand, and challenges us to weigh what we will do with that knowledge. Photos, many in color.
79	Cosmos	1993	7	55	69	https://images.gr-assets.com/books/1438707803l/370789.jpg	Cosmos is one of the bestselling science books of all time. In clear-eyed prose, Sagan reveals a jewel-like blue world inhabited by a life form that is just beginning to discover its own identity and to venture into the vast ocean of space. There is a new Introduction by Sagan’s collaborator, Ann Druyan, full color illustrations, and a new Foreword by astrophysicist Neil deGrasse Tyson, Cosmos retraces the fourteen billion years of cosmic evolution that have transformed matter into consciousness, exploring such topics as the origin of life, the human brain, Egyptian hieroglyphics, spacecraft missions, the death of the Sun, the evolution of galaxies, and the forces and individuals who helped to shape modern science.
80	Hitler: 1889-1936 Hubris	2000	9	34	70	https://images.gr-assets.com/books/1389660286l/93996.jpg	From his illegitimate birth in a small Austrian village to his fiery death in a bunker under the Reich chancellery in Berlin, Adolf Hitler left a murky trail, strewn with contradictory tales & overgrown with self-created myths. One truth prevails: the sheer scale of the evils that he unleashed on the world has made him a demonic figure without equal in this century. Kershaw's Hitler brings us closer than ever before to the character of the bizarre misfit in his 30-year ascent from a Viennese shelter for the indigent to uncontested rule over the German nation that had tried & rejected democracy in the crippling aftermath of WWI. With extraordinary vividness, Kershaw recreates the settings that made Hitler's rise possible: the virulent anti-Semitism of prewar Vienna, the crucible of a war with immense casualties, the toxic nationalism that gripped Bavaria in the 20s, the undermining of the Weimar Republic by extremists of the Right & the Left, the hysteria that accompanied Hitler's seizure of power in 1933 & then mounted in brutal attacks by his storm troopers on Jews & others condemned as enemies of the Aryan race. In an account drawing on many previously untapped sources, Hitler metamorphoses from an obscure fantasist, a drummer sounding an insistent beat of hatred in Munich beer halls, to the instigator of an infamous failed putsch &, ultimately, to the leadership of a ragtag alliance of right-wing parties fused into a movement that enthralled the German people. This volume, 1st of two, ends with the promulgation of the infamous Nuremberg laws that pushed German Jews to the outer fringes of society, & with the march of the German army into the Rhineland, Hitler's initial move toward the abyss of war.
84	Stillness Speaks	2003	0	1	74	https://images.gr-assets.com/books/1349064986l/67864.jpg	Eckhart Tolle shows you how to become your true self by embracing stillness and silence. When we are no longer limited by our thinking mind, suffering and pain disappears and we are able to move forward towards a new understanding of our relationships, of nature and of the profound wisdom that is to be found in stillness.
81	Hyssop	1999	9	57	71	https://images.gr-assets.com/books/1172939478l/231768.jpg	Kevin McIlvoy's Hyssop is a remarkable novel filled with kindness, truth, and magic--a story that celebrates friendship and love while exploring the complexities of a simple faith that enriches materially impoverished lives. It is a gorgeous patchwork of memory lovingly sewn together by Red Greetaltruistic petty thief and guileless grifter-who has spent many days of his eighty-seven years behind bars in Las Almas, New Mexico. Twice married-the second time, while in jail, to his lifelong love Recita Holguin-Red has sampled pleasures available only to those capable of embracing life and its temptations without shame or fear. But his sins have been as memorable as his adventures-transgressions he shares freely with Bishop Francisco Velasco, Red's lifelong best friend and confessor, and his one-time rival for the affections of his first wife, Cecilia. In telling how he has loved and been loved, in confessing how he has sinned and inspired others to sin, Red Greet seeks hyssop, the substance that might wash his soul clean. 
82	Blush	1996	9	23	72	https://images.gr-assets.com/books/1436394195l/23155757.jpg	You know how people say they woke up in Vegas married and you're like, how the hell could that possibly happen? Who does that? Well, us apparently… and the press is having a field day. Let's not even get started on the topic of my mother. Then there's my grandpa wanting to meet my new husband--that's not scary at all. On top of that, we're heading out on tour and I'm a nervous wreck--factor in the fact that Jesse's newly changed marital status doesn't seem to be an issue for the groupies. Nothing deters them. Not even the fact that I'm standing right there when they proposition him. I can handle the press, my mom, and even my grandpa. But the women who are ruining my current mood of "happy", well, they've got another thing coming. It's time to put these women in their place because nobody messes with my happily ever after. Disclaimer: This is not a dark romance. There will be minimal angst or drama. There will be lots of laughs, frequent dropping of the F-bomb, and crazy monkey sex.
83	Healing With Whole Foods: Asian Traditions and Modern Nutrition	2003	9	52	73	https://images.gr-assets.com/books/1388191502l/10464.jpg	Used as a reference by students of acupuncture, this is a hefty, truly comprehensive guide to the theory and healing power of Chinese medicine. It's also a primer on nutrition--including facts about green foods, such as spirulina and blue-green algae, and the "regeneration diets" used by cancer patients and arthritics--along with an inspiring cookbook with more than 300 mostly vegetarian, nutrient-packed recipes.The information on Chinese medicine is useful for helping to diagnose health imbalances, especially nascent illnesses. It's smartly paired with the whole-foods program because the Chinese have attributed various health-balancing properties to foods, so you can tailor your diet to help alleviate symptoms of illness. For example, Chinese medicine dictates that someone with low energy and a pale complexion (a yin deficiency) would benefit from avoiding bitter foods and increasing "sweet" foods such as soy, black sesame seeds, parsnips, rice, and oats. (Note that the Chinese definition of sweet foods is much different from the American one!)Pitchford says in his dedication that he hopes the reader finds "healing, awareness, and peace" from following his program. The diet is certainly acetic by American standards (no alcohol, caffeine, white flour, fried foods, or sugar, and a minimum of eggs and dairy) but the reasons he gives for avoiding these "negative energy" foods are compelling. From the adrenal damage imparted by coffee to immune dysfunction brought on by excess refined sugar, Pitchford spurs you to rethink every dietary choice and its ultimate influence on your health. Without being alarmist, he adds dietary tips for protecting yourself against the dangers of modern life, including neutralizing damage from water fluoridation (thyroid and immune-system problems may result; fluoride is a carcinogen). There's further reading on food combining, female health, heart disease, pregnancy, fasting, and weight loss. Overall, this is a wonderful book for anyone who's serious about strengthening his or her body from the inside out.
85	Midnight Desire	1985	10	23	75	https://images.gr-assets.com/books/1412696504l/23236376.jpg	Destiny Hayworth has everything money can buy, but there is one thing she is missing from her life.The love of a good man, she has built her business from the ground up and spends most of her time running it.Until Brad, a friend of three years starts to have feeling for her. Will they take the chance and fall in love or will their friendship stop them?
90	Ludwig Wittgenstein: The Duty of Genius	1991	0	41	80	https://images.gr-assets.com/books/1388333858l/12079.jpg	"Great philosophical biographies can be counted on one hand. Monk's life of Wittgenstein is such a one."--"The Christian Science Monitor."
107	The Regeneration Trilogy	1998	7	56	90	https://images.gr-assets.com/books/1443440647l/5877.jpg	A trilogy of novels set during World War I which mingle real and fictional characters. The Ghost Road won the 1995 Booker Prize.
86	Takedown	1990	7	16	76	https://images.gr-assets.com/books/1367472328l/17877542.jpg	The Dice Are Cast... Death Watches and WaitsThe sanctuary walls were breached and through them poured screaming hordes of night runners. About to be overrun, the survivors formed a last stand against the thousands that threatened to end their existence. Inexplicably, the night runners, who were on the verge of taking one of the last vestiges of humanity, departed, carrying the limp body of Lynn with them.Communications with the compound failed as Jack was out searching for additional survivors, leaving him unaware of what was happening at home. A tragedy sends him rushing back where he learns about the attack and Lynn being taken. Not knowing if she's alive or dead, he sets off in search for her.A mysterious image is sent setting forth a confrontation with Sandra, the female night runner responsible for the attack on the sanctuary. Is Lynn alive or is this some elaborate trap? Jack will put everything on the line in order to find out.When logical reasoning fails... Insanity must be expected
87	Sisters of the Earth: Women's Prose and Poetry About Nature	1991	9	50	77	https://images.gr-assets.com/books/1390075779l/208531.jpg	Sisters of the Earth is a stirring collection of women’s writing on nature: Nature as healer. Nature as delight. Nature as mother and sister. Nature as victim. Nature as companion and reminder of what is wild in us all. Here, among more than a hundred poets and prose writers, are Diane Ackerman on the opium of sunsets; Ursula K. Le Guin envisioning an alternative world in which human beings are not estranged from their planet; and Julia Butterfly Hill on weathering a fierce storm in the redwood tree where she lived for more than two years. Here, too, are poems, essays, stories, and journal entries by Emily Dickinson, Alice Walker, Terry Tempest Williams, Willa Cather, Gretel Erlich, Adrienne Rich, and others—each offering a vivid, eloquent response to the natural world.This second edition of Sisters of the Earth is fully revised and updated with a new preface and nearly fifty new pieces, including new contributions by Louise Erdrich, Pam Houston, Zora Neale Hurston, Starhawk, Joy Williams, Kathleen Norris, Rita Dove, and Barbara Kingsolver.
201	The Killer Angels	1996	9	56	166	https://images.gr-assets.com/books/1355371689l/682804.jpg	In the four most bloody and courageous days of our nation's history, two armies fought for two dreams. One dreamed of freedom, the other of a way of life. Far more than rifles and bullets were carried into battle. There were memories. There were promises. There was love. And far more than men fell on those Pennsylvania fields. Shattered futures, forgotten innocence, and crippled beauty were also the casualties of war. The Killer Angels is unique, sweeping, unforgettable—a dramatic re-creation of the battleground for America's destiny.
88	Summer Shadows	1988	8	24	78	https://images.gr-assets.com/books/1437899693l/23853376.jpg	Mystery. Romance. Danger. Murder. Not the typical family vacation. When Julia Lamontaigne arrives in Franklin, New Hampshire, she's looking for an escape from the tragedies that have taken over her life. Haunted by the legacy of her beloved sister, and entrusted with her sister's three orphaned children, Julia hopes for a summer of peaceful healing... And hopefully, bonding. At first, the small New Hampshire town seems to be the perfect location. They quickly settle in and make friends with their eccentric neighbors, then begin work on their summer house – while Julia is drawn into a relationship with Robert Wilde, the handsome cop next door. But Franklin is haunted, too - by the decades-old murder of a beautiful young artist, killed in the house at the end of Julia's street. Even though everyone says that the case is solved, Julia can't escape the feeling that there's more to the story than she’s being told. She's right. Someone doesn’t want the murder case re-opened. And they’re willing to kill again to stop it. The house at the end of the street hasn’t begun to give up its secrets.
89	Let the Church Say Amen	2004	9	3	79	https://images.gr-assets.com/books/1391335939l/1223460.jpg	Reverend Simon Jackson has always felt destined to lead, and he's done a good job of it -- having transformed his small Houston church into one of the most respected and renowned in the region. But while the good Reverend's been busy tending his flock, his family's gone astray. His nineteen-year-old daughter, Rachel, gives new meaning to "baby mama drama." David, the oldest at twenty-seven, has been spiraling into a life of crime ever since his promising football career came to an end. Blessedly, Jonathan, Simon's beloved middle child, is in control of his life and is poised to take his side as associate pastor -- or so everybody thinks.  At the heart of the Jackson family is Loretta, the Reverend's wife. She has always been devoted to her husband, but she's beginning to realize that enabling him to give more to the church than to their children was her biggest mistake. As things continue to fall apart and secrets are revealed, will Loretta be able to help her husband reunite their tattered family...before it's too late?
91	Someplace to Be Flying	1998	9	9	81	https://images.gr-assets.com/books/1316636933l/186427.jpg	Lily is a photojournalist in search of the "animal people" who supposedly haunt the city's darkest slums. Hank is a slumdweller who knows the bad streets all too well. One night, in a brutal incident, their two lives collide--uptown Lily and downtown Hank, each with a quest and a role to play in the secret drama of the city's oldest inhabitants.For the animal people walk among us. Native Americans call them the First People, but they have never left, and they claim the city for their own.Not only have Hank and Lily stumbled onto a secret, they've stumbled into a war. And in this battle for the city's soul, nothing is quite as it appears.
92	This Bridge Called My Back: Writings by Radical Women of Color	1981	10	18	82	https://images.gr-assets.com/books/1387745604l/313110.jpg	This groundbreaking collection reflects an uncompromised definition of feminism by women of color. Through personal essays, criticism, interviews, testimonials, poetry, and visual art, the collection explores, as coeditor Cherríe Moraga writes, “the complex confluence of identities—race, class, gender, and sexuality—systemic to women of color oppression and liberation.”
93	Texture Techniques for Winning Watercolors	1999	6	48	83	https://images.gr-assets.com/books/1267050366l/4952870.jpg	Ray Hendershot shows artists how to have fun and use inventive texture techniques to turn acceptable watercolor paintings into outstanding ones. Dozens of hands-on exercises and step-by-step demonstrations show exciting ways to suggest detail (such as trees, bricks and crockery) and set the mood in paintings. A self-taught watercolorist, Hendershot developed his techniques through trial and error, uninhibited by the 'accepted rules' of the medium. In addition to traditional texture techniques such as spattering and spritzing, this book includes more unconventional 'tricks' using special brushes and other media.
94	Leave It to Psmith	1975	9	58	84	https://images.gr-assets.com/books/1342025763l/13707720.jpg	Ronald Psmith (“the ‘p’ is silent, as in pshrimp”) is always willing to help a damsel in distress. So when he sees Eve Halliday without an umbrella during a downpour, he nobly offers her an umbrella, even though it’s one he picks out of the Drone Club’s umbrella rack. Psmith is so besotted with Eve that, when Lord Emsworth, her new boss, mistakes him for Ralston McTodd, a poet, Psmith pretends to be him so he can make his way to Blandings Castle and woo her. And so the farce begins: criminals disguised as poets with a plan to steal a priceless diamond necklace, a secretary who throws flower pots through windows, and a nighttime heist that ends in gunplay. How will everything be sorted out? Leave it to Psmith!
97	Very Good, Jeeves!	2000	9	58	84	https://images.gr-assets.com/books/1402442427l/9862342.jpg	Whatever the cause of Bertie Wooster's consternation — Bobbie Wickham gives away fierce Aunt Agatha's dog; again in the bad books of Sir Roderick Glossop; Tuppy crushes on robust opera singer — Jeeves can untangle the most ferocious muddle. 1 Jeeves and the Impending Doom2 The Inferiority Complex of Old Sippy3 Jeeves and the Yule-Tide Spirit4 Jeeves and the Song of Songs5 Episode of the Dog McIntosh6 The Spot of Art7 Jeeves and the Kid Clementina8 The Love that Purifies9 Jeeves and the Old School Chum10 Indian Summer of an Uncle11 The Ordeal of Young Tuppy
98	The Code of the Woosters	1975	8	58	84	https://images.gr-assets.com/books/1302053718l/9858081.jpg	Take Gussie Fink-Nottle, Madeline Bassett, old Pop Bassett, the unscrupulous Stiffy Byng, the Rev., an 18th-century cow-creamer, a small brown leather covered notebook and mix with a dose of the aged aunt Dahlia and one has a dangerous brew which spells toil and trouble for Bertie and Jeeves.
99	Going to Meet the Man	1995	10	43	85	https://images.gr-assets.com/books/1327883570l/38469.jpg	"There's no way not to suffer. But you try all kinds of ways to keep from drowning in it." The men and women in these eight short fictions grasp this truth on an elemental level, and their stories, as told by James Baldwin, detail the ingenious and often desperate ways in which they try to keep their head above water. It may be the heroin that a down-and-out jazz pianist uses to face the terror of pouring his life into an inanimate instrument. It may be the brittle piety of a father who can never forgive his son for his illegitimacy. Or it may be the screen of bigotry that a redneck deputy has raised to blunt the awful childhood memory of the day his parents took him to watch a black man being murdered by a gleeful mob.By turns haunting, heartbreaking, and horrifying--and informed throughout by Baldwin's uncanny knowledge of the wounds racism has left in both its victims and its perpetrators--Going to Meet the Man is a major work by one of our most important writers.
100	Notes of a Native Son	1990	7	1	85	https://images.gr-assets.com/books/1348169754l/410810.jpg	Since its original publication in 1955, this first nonfiction collection of essays by James Baldwin remains an American classic. His impassioned essays on life in Harlem, the protest novel, movies, and African Americans abroad are as powerful today as when they were first written.--back cover
101	Just Above My Head	1980	7	58	85	https://images.gr-assets.com/books/1348774429l/743817.jpg	'This is the work of a born storyteller at the height of his powers' Edmund White, Washington PostWhen Arthur Montana, world-renowned 'Emperor of Soul', is found dead in a London pub, his grief-stricken brother looks back over thirty years in the lives of their group of friends: from their childhood spent preaching and singing in Harlem churches, to their struggles with war and poverty, and their encounters with wealth, love and fame.Set against a vividly drawn background of the civil rights movement of the sixties, Baldwin's last novel is a monumental saga that ranges from New York to Paris, Korea to Africa to portray how profoundly racial politics can shape life, especially in the private business of love.'Warm, melancholy . . . Hall Montana's voice is the conduit for Baldwin's most distinctive quality as a writer, his abundant tenderness' The New York Times
408	Harry Potter and the Chamber of Secrets	2000	9	9	325	https://images.gr-assets.com/books/1172857591l/224912.jpg	Alternate Cover Edition ISBN 0747538484 (ISBN13: 9780747538486)Harry Potter is a wizard. He is in his second year at Hogwarts School of Witchcraft and Wizardry. Little does he know that this year will be just as eventful as the last...(back cover)
109	Schindler's List	1994	0	34	92	https://images.gr-assets.com/books/1348163457l/375013.jpg	In the shadow of Auschwitz, a flamboyant German industrialist grew into a living legend to the Jews of Cracow. He was a womaniser, a heavy drinker and a bon viveur, but to them he became a saviour. This is the extraordinary story of Oskar Schindler, who risked his life to protect Jews in Nazi-occupied Poland and who was transformed by the war into a man with a mission, a compassionate angel of mercy.
102	The Fire Next Time	1993	9	1	85	https://images.gr-assets.com/books/1488825618l/464260.jpg	A national bestseller when it first appeared in 1963, The Fire Next Time galvanized the nation and gave passionate voice to the emerging civil rights movement. At once a powerful evocation of James Baldwin's early life in Harlem and a disturbing examination of the consequences of racial injustice, the book is an intensely personal and provocative document. It consists of two "letters," written on the occasion of the centennial of the Emancipation Proclamation, that exhort Americans, both black and white, to attack the terrible legacy of racism. Described by The New York Times Book Review as "sermon, ultimatum, confession, deposition, testament, and chronicle...all presented in searing, brilliant prose," The Fire Next Time stands as a classic of our literature.
103	The Lamb's Supper: The Mass as Heaven on Earth	1999	9	15	86	https://images.gr-assets.com/books/1438209748l/28883.jpg	The Lamb's Supper reveals a long-lost secret of the Church: the early Christian's key to understanding the mysteries of the Mass was the New Testament's Book of Revelation. With its bizarre imagery, its mystic visions of Heaven, and its end-of-time prophecies, Revelation mirrors the sacrifice and celebration of the Eucharist. Beautifully written in clear, direct language, this new book by bestselling Catholic author Scott Hahn will help readers see the Mass with new eyes, pray the liturgy with a renewed heart, and enter into the Mass more fully, enthusiastically, intelligently, and powerfully than ever before. Dr. Scott Hahn is currently Professor of Theology and Scripture at Franciscan University of Steubenville, Ohio. He is also the founder and Director of the Institute of Applied Biblical Studies, and serves as President for the Missionaries of Faith Foundation. He is married to Kimberly. They have six children.   Contents Part One: The Gift of the Mass Introduction: Christ Stands at the Door – The Mass Revealed Ch. 1. In Heaven Right Now: What I Found at My First Mass Ch. 2. Given for You: The Story of Sacrifice Ch. 3: From the Beginning: The Mass of the First Christians Ch. 4: Taste and See (and Hear and Touch) the Gospel: Understanding the Parts of the Mass Part Two: The Revelation of Heaven Ch. 1. “I Turned to See”: The Sense Amid the Strangeness Ch. 2. Who's Who in Heaven: Revelation's Cast of Thousands Ch. 3. Apocalypse Then! The Battles of Revelation and the Ultimate Weapon Ch. 4. Judgment Day: His Mercy is Scary Part Three: Revelation for the Masses Ch. 1. Lifting the Veil: How to See the Invisible Ch. 2. Worship is Warfare: Which Will You Choose: Fight or Flight? Ch. 3. Parish the Thought: Revelation as Family Portrait Ch. 4. Rite Makes Might: The Difference Mass Makes
105	The Lost	2001	8	53	88	https://images.gr-assets.com/books/1348804979l/6866818.jpg	'The Lost' gathers together four novels - 'Traitor General', 'His Last Command', 'The Armour of Contempt', and 'Only In Death'.
106	Wonder	1993	9	46	89	https://images.gr-assets.com/books/1374224152l/17612945.jpg	'My name is August. I won't describe to you what I look like. Whatever you're thinking, it's probably worse.'Ten-year-old August Pullman wants to be ordinary. He does ordinary things. He eats ice-cream. He plays on his Xbox. He feels ordinary - inside. But Auggie is far from ordinary.Born with a terrible facial abnormality, he has been home-schooled by his parents his entire life, in an attempt to protect him from the cruelty of the outside world. Now, Auggie's parents are sending him to a real school. Can he convince his new classmates that he's just like them, underneath it all?Narrated by Auggie and the people around him whose lives he touches, Wonder is a frank, funny, astonishingly moving debut to be read in one sitting, pass on to others, and remember long after the final page.Source: penguinrandomhouse.co.za
108	Blood and Roses	1994	10	44	91	https://images.gr-assets.com/books/1518320411l/38192926.jpg	MariaI was trapped. There was nothing left of me. Then he came and wanted to make me his.He saved me. He gave me a home, a family. He made sweet love to me. I was his Angel. He was my everything. I thought we would live happily ever after, but there are no happy endings in the mafia life.I found this out the hard way, as the blood flowed, red as roses…LyovAngel. The word meant nothing until I saw her. I found her in a place worse than hell. She calls me her savior. But I didn’t save her. I captured the pretty angel and made her mine. Life was perfect. I had everything I wanted.I was her salvation. She was my redemption.Until I lost her. Angels deserve happy endings, but monsters like me don’t.My darkness became hers, and our happily-ever-after became tainted.
110	Falling	1991	10	10	93	https://images.gr-assets.com/books/1384749454l/17874546.jpg	Sometimes it takes someone else to show us what we are truly capable of becoming.Suffering from years of violent abuse, Ryan Campbell has learned how to keep people from getting too close. But when you shut yourself off, people get hurt along the way. Never caring much about others, Ryan creates a world in which he doesn’t have to feel. When Ryan meets Candace Parker, all of his walls slowly begin to crumble. Not sure of the truth of who she is, he feels his mind is playing tricks on him. Unable to force out the thoughts that consume him, Ryan is haunted by visions that torment him every time he looks at her. He finds himself swallowed by guilt and blame, but he’s unwilling to turn his back on the one person that could possibly save him.You’ve heard Candace’s story in Fading, now hear Ryan’s.
202	Freedom at Midnight	1983	10	34	167	https://images.gr-assets.com/books/1365170106l/204123.jpg	A famous, major work on Gandhi, Jinnah, Nehru, Admiral Lord Mountbatten, and the partition of India.
203	Calvin and Hobbes	1987	9	37	168	https://images.gr-assets.com/books/1441227694l/77727.jpg	This is the first collection of the popular comic strip that features Calvin, a rambunctious 6-year-old boy, and his stuffed tiger, Hobbes, who comes charmingly to life.
111	Whispers in the Dark	2001	8	23	94	https://images.gr-assets.com/books/1304091601l/10675183.jpg	She came to him when he needed her the mostShe came to him at his lowest point. The voice of an angel, a whisper in the dark. She’s the only thing that gets Nathan Kelly through his captivity, the endless days of torture and the fear that he’ll never return to his family. With her help, he’s able to escape. But he isn’t truly free, because now she’s disappeared and he’s left with an all-consuming emptiness as he struggles to pick up the pieces of his life. Did he imagine his angel? Or is she out there, needing his help as he’d once needed hers?Now he rushes to save her before it’s too lateShea has been on the run from people who will stop at nothing to exploit her unique abilities. She never wanted to drag Nathan, who’d already suffered so much, into danger, but she doesn’t have a choice so she reaches out to him for help. Finally face-to-face after having already formed a soul-deep bond in hell, their emotional connection is even more powerful than their telepathic one. Nathan refuses to consider ever letting her go again, but she worries they can never have a life free of the dangers that dog her every step. He’ll protect her with his every breath, but can he convince her that they are meant to face these threats together?
112	Seize the Night	1998	9	23	95	https://images.gr-assets.com/books/1348418164l/84144.jpg	Dark-Hunter: an immortal warrior who has traded his soul to Artemis for one moment of vengeance on his enemies. In return, they swear to spend eternity protecting mankind from the daimons and vampires that prey on them. Valerius isn't a popular Dark-Hunter - he's a Roman, which means that the largely Greek Hunters have a major grudge against him and his civilization for superceding them. To make things worse, he's very conscious of his aristocratic background and breeding. So it serves him right when he runs into Tabitha Devereaux. She's sassy, sexy, and completely unwilling to take him seriously. (Not to mention Tabitha is also the sister-in-law of Kyrian, a former Dark-Hunter and Val's mortal enemy.) What Tabitha does take seriously is hunting and killing vampires-and soon she and Val have to grapple with the deadliest of all Daimons - one who's managed to come back from the dead, and one who holds a serious grudge against both of them. To win against evil, Val will have to loosen up, learn to trust, and put everything on the line to protect a man he hates and a woman who drives him nuts.
113	Dance with the Devil	1991	8	23	95	https://images.gr-assets.com/books/1388703603l/84145.jpg	Zarek's Point of View:Dark-Hunter: A soulless guardian who stands between mankind and those who would see mankind destroyed. Yeah, right. The only part of that Code of Honor I got was eternity and solitude. Insanity: A condition many say I suffer from after being alone for so long. But I don't suffer from my insanity-I enjoy every minute of it. Trust: I can't trust anyone...not even myself. The only thing I trust in is my ability to do the wrong thing in any situation and to hurt anyone who gets in my way.Truth: I endured a lifetime as a Roman slave, and 900 years as an exiled Dark-Hunter. Now I'm tired of enduring. I want the truth about what happened the night I was exiled-I have nothing to lose and everything to gain.Astrid (Greek, meaning star): An exceptional woman who can see straight to the truth. Brave and strong, she is a point of light in the darkness. She touches me and I tremble. She smiles and my cold heart shatters.Zarek: They say even the most damned man can be forgiven. I never believed that until the night Astrid opened her door to me and made this feral beast want to be human again. Made me want to love and be loved. But how can an ex-slave whose soul is owned by a Greek goddess ever dream of touching, let alone holding, a fiery star?http://us.macmillan.com/dancewiththed...
114	East of Eden	1984	10	22	96	https://images.gr-assets.com/books/1462160774l/28251243.jpg	Part of the Penguin Orange Collection, a limited-run series of twelve influential and beloved American classics in a bold series design offering a modern take on the iconic Penguin paperbackFor the seventieth anniversary of Penguin Classics, the Penguin Orange Collection celebrates the heritage of Penguin’s iconic book design with twelve influential American literary classics representing the breadth and diversity of the Penguin Classics library. These collectible editions are dressed in the iconic orange and white tri-band cover design, first created in 1935, while french flaps, high-quality paper, and striking cover illustrations provide the cutting-edge design treatment that is the signature of Penguin Classics Deluxe Editions today.\n\nEast of Eden\n\nThe masterpiece of Steinbeck’s later years, East of Eden is a sprawling epic in which Steinbeck created his most mesmerizing characters and explored his most enduring themes: the mystery of identity, the inexplicability of love, and the murderous consequences of love’s absence.
119	Breaking Point	1996	0	23	100	https://images.gr-assets.com/books/1377473720l/9314304.jpg	While investigating border violence in Ciudad Juárez, Mexico, Denver journalist Natalie Benoit is caught in a bloody ambush and taken captive. Alone in the hands of ruthless killers, she will need every ounce of courage she possesses to survive. Betrayed by another operative, Deputy U.S. Marshal Zach McBride has endured a week of torture and interrogation at the hands of a bloodthirsty Mexican drug cartel. Ready to give his life if he must, he remains unbroken—until he hears the cries of an American woman. Although Natalie is only a voice in the darkness of their shared prison, her plight brings renewed strength to Zach's battered body. With her help, he overpowers their captors, and they flee through the desert toward the border, the attraction between them flaring hotter than the Sonoran sun. But past loss and tragedy leave both of them reluctant to follow their hearts, even when the passion between them reaches its breaking point. Faced with feelings neither expected, they fight to stay ahead of the danger that hunts them as forces more powerful than they can imagine conspire to destroy them both…
115	Life and Death in Shanghai	1987	10	20	97	https://images.gr-assets.com/books/1348908435l/537404.jpg	In August 1966 a group of Red Guards ransacked the home of Nien Cheng. Her background made her an obvious target for the fanatics of the Cultural Revolution: educated in London, the widow of an official of Chiang Kai-Shek's regime, and an employee of Shell Oil, Nien Cheng enjoyed comforts that few of her compatriots could afford. When she refused to confess that any of this made her an enemy of the state, she was placed in solitary confinement, where she would remain for more than six years. "Life and Death in Shanghai" is the powerful story of Nien Cheng's imprisonment, of the deprivation she endured, of her heroic resistance, and of her quest for justice when she was released. It is the story, too, of a country torn apart by the savage fight for power Mao Tse-tung launched in his campaign to topple party moderates. An incisive, rare personal account of a terrifying chapter in twentieth-century history, "Life and Death in Shanghai" is also an astounding portrait of one woman's courage.
116	Captive	1996	9	23	98	https://images.gr-assets.com/books/1511182025l/36629470.jpg	“A captivating tale of love, power and betrayal.“ When Katherine, an unworldly, innocent maid, is sold as a slave to the prince of Wallachia, she is terrified of the man who is whispered to be a sorcerer, a monster or even the devil himself.Imprisoned in his castle, Katherine is shocked by the realization that she is drawn to this enigmatic man and despite his terrifying nature, finds she is desperate to get close to him. The prince, intrigued by Katherine's beauty, courage and independent spirit, finds himself in an uncomfortable predicament - falling in love with the women he must kill to save his kingdom.A Wattpad published novel by @gabrielleestres
125	Coming Attractions	1988	10	3	106	https://images.gr-assets.com/books/1266532230l/6056530.jpg	Are you serious?As graduation approaches, Katie Weldon is pretty sure she’s ready for the word “engaged” to describe her relationship with Rick. But Eli seems to always be right there when she needs support. Rick is everything Katie’s ever dreamed of, offering her stability and love. Eli, on the other hand, brings adventure, spontaneity, and a wild love for God.Katie wonders if she’s ready to be serious with any guy. Maybe God wants her to seriously commit to Him first, whether her future is all planned out or as spontaneous as her impromptu life has been so far. One thing she knows for sure: With God alongside her, the coming attractions are bound to be a surprise.Coming Attractions  is the third book in the Katie Weldon Series.
117	Champion	1995	7	53	99	https://images.gr-assets.com/books/1406506893l/21413814.jpg	The explosive finale to Marie Lu’s New York Times bestselling LEGEND trilogy—perfect for fans of THE HUNGER GAMES and DIVERGENT! He is a Legend. She is a Prodigy. Who will be Champion?     June and Day have sacrificed so much for the people of the Republic—and each other—and now their country is on the brink of a new existence. June is back in the good graces of the Republic, working within the government’s elite circles as Princeps Elect while Day has been assigned a high level military position. But neither could have predicted the circumstances that will reunite them once again. Just when a peace treaty is imminent, a plague outbreak causes panic in the Colonies, and war threatens the Republic’s border cities. This new strain of plague is deadlier than ever, and June is the only one who knows the key to her country’s defense. But saving the lives of thousands will mean asking the one she loves to give up everything he has. With heart-pounding action and suspense, Marie Lu’s bestselling trilogy draws to a stunning conclusion.New York Times bestseller YALSA BFYA ALA Top 10 nominee Chicago Public Library Best Book VOYA YA Perfect Ten List Bank Street Best Book Featured on Entertainment Weekly’s Must-List   From ENTERTAINMENT WEEKLY: �Fine writing and excellent execution. Sequel, please!” From THE NEW YORK TIMES: �Legend doesn’t merely survive the hype, it deserves it.”   From USA TODAY: �Marie Lu’s dystopian novel is a �Legend’ in the making.”
118	Defiant	1988	8	23	100	https://images.gr-assets.com/books/1311221817l/11725779.jpg	Charged with a crime they didn't commit, the MacKinnon brothers faced a death sentence until they agreed to serve the British Crown in the colonies and take up arms against the French. Allied with the Indian tribes who lived beside them in the wilderness, the Scottish Highland warriors forged a new breed of soldier...MacKinnon's RangersMajor Connor MacKinnon despises his commander, Lord William Wentworth, beyond all other men. Ordered to rescue Wentworth's niece after the Shawnee take her captive, he expects Lady Sarah Woodville to be every bit as arrogant and contemptible as her uncle. Instead, he finds a brave and beautiful lass in desperate peril. But the only way to free Sarah is for Connor to defeat the Shawnee warrior who kidnapped her—and claim her himself.Torn by tragedy from her sheltered life in London, Lady Sarah is unprepared for the harshness of the frontier—or for the attraction she feels toward Connor as he guides her first through the consummation of their forced union and then through the dangers of the wilderness. When they reach civilization, however, it is she who must protect him. For if her uncle knew all that Connor had done to save her, he would surely kill him.But the flames of passion, once kindled, are difficult to deny. As desire transforms into love, Connor will have to defy an empire to keep Sarah at his side.
120	The Forgotten Soldier	2001	9	34	101	https://images.gr-assets.com/books/1347798004l/102305.jpg	Forgotten Soldier recounts the horror of World War II on the eastern front, as seen through the eyes of a teenaged German soldier. At first an exciting adventure, young Guy Sajer’s war becomes, as the German invasion falters in the icy vastness of the Ukraine, a simple, desperate struggle for survival against cold, hunger, and above all the terrifying Soviet artillery. As a member of the elite Gross Deutschland Division, he fought in all the great battles from Kursk to Kharkov. Sajer's German footsoldier’s perspective makes The Forgotten Soldier a unique war memoir, the book that the Christian Science Monitor said "may well be the book about World War II which has been so long awaited." Now it has been handsomely republished containing fifty rare German combat photos of life and death at the eastern front. The photos of troops battling through snow, mud, burned villages, and rubble-strewn cities depict the hardships and destructiveness of war. Many are originally from the private collections of German soldiers and have never been published before. This volume is a deluxe edition of a true classic.
128	Wolfsong	1996	0	9	107	https://images.gr-assets.com/books/1475708142l/32473819.jpg	Listening Length: 18 hours and 40 minutesOx was twelve when his daddy taught him a very valuable lesson. He said that Ox wasn’t worth anything and people would never understand him. Then he left.Ox was sixteen when he met the boy on the road. The little boy who talked and talked and talked. Ox found out later the little boy hadn’t spoken in almost two years before that day, and that the little boy belonged to a family who had moved into the house at the end of the lane.Ox was seventeen when he found out the little boy’s secret and it painted the world around him in colors of red and orange and violet, of Alpha and Beta and Omega.Ox was twenty-three when murder came to town and tore a hole in his head and heart. The boy chased after the monster with revenge in his bloodred eyes, leaving Ox behind to pick up the pieces.It’s been three years since that fateful day—and the boy is back. Except now he’s a man, and Ox can no longer ignore the song that howls between them.
129	Meditations from the Mat: Daily Reflections on the Path of Yoga	2002	0	1	108	https://images.gr-assets.com/books/1320518579l/295016.jpg	AN ANCHOR BOOKS ORIGINALAs more and more people in the West pursue yoga in its various forms, whether at traditional centers, in the high-powered atmosphere of sports clubs, or on their own, they begin to realize that far from being just another exercise routine, yoga is a discipline of the body and the mind. The 365 meditations incluided in this book offer a way to integrate the mindfulness that yoga teaches into everyday life. Whether used in the morning to set the tone for the day, during yoga exercise itself, or at the end of the day, during evening reflection, Meditations from the Mat will support and enhance anyone’s yoga journey.
208	Faces at the Bottom of the Well: The Permanence of Racism	1992	10	39	170	https://images.gr-assets.com/books/1348798022l/466460.jpg	The noted civil rights activist uses allegory and historical example to present a radical vision of the persistence of racism in America. These essays shed light on some of the most perplexing and vexing issues of our day: affirmative action, the disparity between civil rights law and reality, the “racist outbursts” of some black leaders, the temptation toward violent retaliation, and much more.
132	Hanta Yo: An American Saga	1981	0	56	110	https://images.gr-assets.com/books/1353763863l/389881.jpg	A multigenerational saga that depicts the lives of two families of Teton Sioux from the late 1700s to the 1830s, before the arrival of the white man.
121	The Living Blood	2002	7	16	102	https://images.gr-assets.com/books/1393772394l/41538.jpg	Jessica Jacobs-Wolde's life was destroyed when her husband, David Wolde killed both their daughter Kira and Jessica herself--and revived Jessica with his healing blood. David was a Life Brother, member of an ancient, secret, and immortal African clan. Now Jessica, hiding with her surviving daughter in rural Botswana, attempts to make sense of her new existence, and of Fana's growing abilities. Jessica's only hope of teaching Fana to control her dangerous talents is to travel to Ethiopia and find the Life Brothers' hidden colony. --Cynthia Ward
122	Journey of Souls: Case Studies of Life Between Lives	1994	8	13	103	https://images.gr-assets.com/books/1348257965l/104979.jpg	This remarkable book uncovers--for the first time--the mystery of life in the spirit world after death on earth. Dr. Michael Newton, a hypnotherapist in private practice, has developed his own hypnosis technique to reach his subjects' hidden memories of the hereafter. The resulting narrative acts as a progressive "travel log" of the accounts of twenty-nine people who were placed in a state of superconsciousness. While in deep hypnosis, these subjects movingly describe what has happened to them between their former reincarnations on earth. They reveal graphic details about how it feels to die, who meets us right after death, what the spirit world is really like, where we go and what we do as souls, and why we choose to come back in certain bodies.
135	Light	1989	0	46	112	https://images.gr-assets.com/books/1331533067l/8811139.jpg	It's been over a year since all the adults disappeared. Gone.In the time since every person over the age of fourteen disappeared from the town of Perdido Beach, California, countless battles have been fought: battles against hunger and lies and plague, and epic battles of good against evil. Light, Michael Grant's sixth and final book in the New York Times bestselling Gone series creates a masterful, arresting conclusion to life in the FAYZ.And now, the gaiaphage has been reborn as Diana's malicious mutant daughter, Gaia. Gaia is endlessly hungry for destruction. She yearns to conquer her nemesis, Little Pete, and then bend the entire world to her warped will. As long-standing enemies become allies, secrets are revealed and unexpected sacrifices are made. Will their attempts to save themselves and one another matter in the end, or will the kids of Perdido Beach perish in this final power struggle?
123	My Sweet Orange Tree	1971	7	22	104	https://images.gr-assets.com/books/1319973122l/46571.jpg	Five-year-old Zezé lives in Rio de Janeiro, in a forgotten slump in great poverty. But Zezé is not alone. In this world of scolding and beating, he has discovered a magical universe where he spends most of his time: the realm of imagination. There rules a sweet orange tree called Minguinho, and he is a tree like no other: he can talk.First published in 1968, this autobiographical novel is one of the most important Brazilian classics.
126	The Art of Breathing	1986	9	23	107	https://images.gr-assets.com/books/1402931670l/22487669.jpg	Sequel to Who We Are Tyson Thompson graduated high school at sixteen and left the town of Seafare, Oregon, bound for what he assumed would be bigger and better things. He soon found out the real world has teeth, and he returns to the coast with four years of failure, addiction, and a diagnosis of panic disorder trailing behind him. His brother, Bear, and his brother's husband, Otter, believe coming home is exactly what Tyson needs to find himself again. Surrounded by family in the Green Monstrosity, Tyson attempts to put the pieces of his broken life back together. But shortly after he arrives home, Tyson comes face to face with inevitability in the form of his childhood friend and first love, Dominic Miller, who he hasn't seen since the day he left Seafare. As their paths cross, old wounds reopen, new secrets are revealed, and Tyson discovers there is more to his own story than he was told all those years ago. In a sea of familiar faces, new friends, and the memories of a mother's devastating choice, Tyson will learn that in order to have any hope for a future, he must fight the ghosts of his past.
127	Until You	1995	9	23	107	https://images.gr-assets.com/books/1486593693l/34202766.jpg	Together with their families and friends, Paul Auster and Vincent Taylor request the honor of your company at the celebration of their marriage. Paul Auster and Vince Taylor just want to have a simple wedding. Really, is that too much to ask?As the big day approaches, they struggle to keep everything from spiraling out of control. From meddling friends and intrusive family, to a certain drag queen's idea as to what constitutes a normal bachelor party, Paul and Vince have their work cut out for them.
130	The Discipline of Grace: God's Role and Our Role in the Pursuit of Holiness	1994	9	11	109	https://images.gr-assets.com/books/1386924311l/246849.jpg	The Discipline of Grace offers a clear and and thorough explanation of the gospel and what it means to be a believer.Written by Navigator author Jerry Bridges, this book explores how the same grace that brings us to faith in Christ also disciplines us in Christ. In learning more about grace, you also will learn about God's character, His forgiveness, and the Holy Spirit.
131	The Practice of Godliness	1996	10	11	109	https://images.gr-assets.com/books/1388353111l/349283.jpg	Scripture tells us that God has given us "everything we need for life and godliness." But what makes a Christian godly? In this book, Navigator author Jerry Bridges examines what it means to grow in Christian character. Learn more about the character of God as you grow a deeper relationship with Him. Establish the foundation upon which godly character is built and continue by developing maturity and pursuing holiness. A Discussion Guide is also available separately (ISBN 9780891094982).
145	Report from Engine Co. 82	1999	9	1	121	https://images.gr-assets.com/books/1344269076l/944211.jpg	From his bawdy and brave fellow firefighters to the hopeful, hateful, beautiful and beleaguered residents of the poverty-stricken district where he works, Dennis Smith tells the story of a brutalising yet rewarding profession.
133	Genesis	2000	7	34	111	https://images.gr-assets.com/books/1388547039l/264891.jpg	"From pre-Columbian creation myths and the first European voyages of discovery and conquest to the Age of Reagan, here is 'nothing less than a unified history of the Western Hemisphere... recounted in vivid prose.'"--The New YorkerA unique and epic history, Eduardo Galeano's Memory of Fire trilogy is an outstanding Latin American eye view of the making of the New World. From its first English language publication in 1985 it has been recognized as a classic of political engagement, original research, and literary form.“Memory of Fire is devastating, triumphant... sure to scorch the sensibility of English-language readers.” (New York Times)“An epic work of literary creation... there could be no greater vindication of the wonders of the lands and people of Latin America than Memory of Fire.” (Washington Post)“[Memory of Fire] will reveal to you the meaning of the New World as it was, and of the world as we have it now.” (Boston Globe)“A book as fascinating as the history it relates.... Galeano is a satirist, realist, and historian, and... deserves mention alongside John Dos Passos, Bernard DeVoto, and Gabriel Garcia Marquez.” (Los Angeles Times)
142	Gifts and Ministries of the Holy Spirit	1977	0	11	118	https://images.gr-assets.com/books/1348547487l/1481056.jpg	You Can Have the Power of the Holy Spirit  The gifts of the Spirit can destroy any force the devil might use against Christians. You are a candidate for the gifts of revelation, power, and inspiration. They will function anywhere—right where you are now! Dr. Sumrall discusses subjects including:The charismatic renewalThe weapons of our warfareHow you can receive the giftsThe devil's counterfeitThe purpose of ministry giftsYou can be included in the great outpouring of God's Spirit!  
134	Upside Down: A Primer for the Looking-Glass World	2000	7	1	111	https://images.gr-assets.com/books/1388279703l/264894.jpg	In a series of mock lesson plans and a "program of study" Galeano provides an eloquent, passionate, funny and shocking exposé of First World privileges and assumptions. From a master class in "The Impunity of Power" to a seminar on "The Sacred Car"—with tips along the way on "How to Resist Useless Vices" and a declaration of the "The Right to Rave"—he surveys a world unevenly divided between abundance and deprivation, carnival and torture, power and helplessness.We have accepted a "reality" we should reject, he writes, one where poverty kills, people are hungry, machines are more precious than humans, and children work from dark to dark. In the North, we are fed on a diet of artificial need and all made the same by things we own; the South is the galley slave enabling our greed.
136	Cuentos	2002	9	22	113	https://images.gr-assets.com/books/1209060857l/2008298.jpg	Este volumen reúne sesenta cuentos de Chéjov cuidadosamente seleccionados y traducidos por Víctor Gallego con la intención de que el lector español disponga de una antología extensa y representativa de la narrativa breve del gran escritor ruso. Prescindiendo de las novelas cortas, ofrece una panóramica amplia -y en muchas o casiones inédita en nuestra lengua- del cuento chejoviano, desde las implacables piezas humorísticas de sus primeros años hasta las complejas composiciones de su última época, en un arco cronológico que abarca de 1883 a 1902.
137	Casting the First Stone	2001	10	58	114	https://images.gr-assets.com/books/1391398741l/246084.jpg	Tanya Black has everything a woman could want: a fulfilling career, a beautiful daughter, an elegant home, and a handsome, charismatic husband who is pastor at a prominent Baptist church. And yet, none of it can hide the growing turbulence in her marriage, which suddenly has Tanya doubting what she once cherished.Then Curtis goes too far, and Tanya's confronted with the worst betrayal a woman can face. Plunged into a bittersweet journey of discovery, she suddenly finds herself learning painful new lessons about love, loyalty, and sensual temptation. . ..and discovering the wisdom to celebrate the victories that are hers alone.Casting The First Stone listens in on the heart of a woman torn between loving who her husband was and hating who he has become. Roby weaves a fast-paced story about faith's challenges in a world made up of material desires and other physical temptations. Taken right from the headlines, Roby's cautionary tale looks at the other side of church politics and the emotional toll it takes.
204	The Calvin and Hobbes Tenth Anniversary Book	1995	9	37	168	https://images.gr-assets.com/books/1429324469l/24813.jpg	Many moons ago, the magic of Calvin and Hobbes first appeared on the funny pages and the world was introduced to a wondrous pair of friends -- a boy and his tiger, who brought new life to the comics page. To celebrate the tenth anniversary of this distinguished partnership, Bill Watterson prepared this special book, sharing his thoughts on cartooning and creating Calvin and Hobbes, illustrated throughout with favorite black-and-white and color cartoons.
139	Capture the Moment: The Pulitzer Prize Photographs	2003	8	48	116	https://images.gr-assets.com/books/1388246924l/256522.jpg	Collected here are the Pulitzer Prize-winning photographs (updated to include winners through 2001)—pictures that influenced our thinking in times of crisis and sometimes stirred us to action. Among them are Joe Rosenthal's World War II photograph of the raising of the flag over Mount Suribachi on Iwo Jima, commemorating the more than 6,000 marines who died in the battle for that small Pacific island, and Robert Jackson's photograph of Jack Ruby killing Lee Harvey Oswald, recalling the anguish of the assassination of President John F. Kennedy. The pictures document that we have lived in a violent age, showing the brutalities of war, racism, and despotism. But the Pulitzer photojournalists also recorded tender and compassionate moments, as in Brian Lanker's pictures of joyous parents at the birth of their child, or Scott Shaw's photographs of the rescue of a little girl trapped in a well. In coming centuries, these indelible images will inevitably be used to illustrate the triumphs and tragedies of our era.
140	The Path to Power	1995	7	17	117	https://images.gr-assets.com/books/1349023045l/86524.jpg	This is the story of the rise to national power of a desperately poor young man from the Texas Hill Country. The Path to Power reveals in extraordinary detail the genesis of the almost superhuman drive, energy, and ambition that set LBJ apart. It follows him from the Hill Country to New Deal Washington, from his boyhood through the years of the Depression to his debut as Congressman, his heartbreaking defeat in his first race for the Senate, and his attainment, nonetheless, at age 31, of the national power for which he hungered. In this book, we are brought as close as we have ever been to a true perception of political genius and the American political process.Means of Ascent, Book Two of The Years of Lyndon Johnson, was a number one national best seller and, like The Path to Power, received the National Book Critics Circle Award.
141	The Power Broker: Robert Moses and the Fall of New York	1975	9	34	117	https://images.gr-assets.com/books/1403194611l/1111.jpg	One of the most acclaimed books of our time, winner of both the Pulitzer and the Francis Parkman prizes, The Power Broker tells the hidden story behind the shaping (and mis-shaping) of twentieth-century New York (city and state) and makes public what few have known: that Robert Moses was, for almost half a century, the single most powerful man of our time in New York, the shaper not only of the city's politics but of its physical structure and the problems of urban decline that plague us today.In revealing how Moses did it--how he developed his public authorities into a political machine that was virtually a fourth branch of government, one that could bring to their knees Governors and Mayors (from La Guardia to Lindsay) by mobilizing banks, contractors, labor unions, insurance firms, even the press and the Church, into an irresistible economic force--Robert Caro reveals how power works in all the cities of the United States. Moses built an empire and lived like an emperor. He personally conceived and completed public works costing 27 billion dollars--the greatest builder America (and probably the world) has ever known. Without ever having been elected to office, he dominated the men who were--even his most bitter enemy, Franklin D. Roosevelt, could not control him--until he finally encountered, in Nelson Rockefeller, the only man whose power (and ruthlessness in wielding it) equalled his own.
143	Raja-Vidya: The King of Knowledge	1973	10	13	119	https://images.gr-assets.com/books/1174759786l/436061.jpg	We may be proud of our academic education," writes the author of Raja-vidya, A. C. Bhaktivedanta Swami Prabhupada, "but if asked what we are, we are not able to say. Everyone is under the conception that the body is the self, but we learn from Vedic sources that this is not so. Only after realizing that we are not these bodies can we enter into real knowledge and understand what we actually are.
144	Edgar Cayce: An American Prophet	2000	9	17	120	https://images.gr-assets.com/books/1309287472l/104392.jpg	With unprecedented access to Edgar Cayce's private letters and trance readings, Sidney Kirkpatrick delivers the definitive biography of the renowned psychic, religious seeker, and father of alternative medicine. Born in rural Kentucky in 1877, Edgar Cayce became known as "the sleeping prophet," and went on to lead an extraordinary life, helping and healing thousands. This is Cayce's fascinating story as it's never been told before.
146	Battlefield of the Mind: Winning the Battle in Your Mind	2002	7	11	122	https://images.gr-assets.com/books/1442547598l/13360.jpg	In celebration of selling 3 million copies, FaithWords published a special updated edition of BATTLEFIELD OF THE MIND. Worry, doubt, confusion, depression, anger and feelings of condemnation: all these are attacks on the mind. If readers suffer from negative thoughts, they can take heart! Joyce Meyer has helped millions win these all-important battles. In her most popular bestseller ever, the beloved author and minister shows readers how to change their lives by changing their minds. She teaches how to deal with thousands of thoughts that people think every day and how to focus the mind the way God thinks. And she shares the trials, tragedies, and ultimate victories from her own marriage, family, and ministry that led her to wondrous, life-transforming truth--and reveals her thoughts and feelings every step of the way.This special updated edition includes an additional introduction and updated content throughout the book.
147	Lament for a Son	1987	9	8	123	https://images.gr-assets.com/books/1347809865l/148208.jpg	This book was written more than twelve years ago to honor the author's son Eric, who died in a mountain-climbing accident in Austria in his twenty-fifth year, and to voice Wolterstorff's grief. Though it is intensely personal, he decided to publish it in the hope that some of those who sit on the mourning bench for children would find his words giving voice to their own honoring and grieving. What he learned, to his surprise, is that in its particularity there is universality. Many who have lost children have written him. But many who have lost other relatives have done so as well, along with many who have experienced loss in forms other than the death of relatives or friends. The sharply particular words of Lament, so he has learned, give voice to the pain of many forms of loss. This book, Lament For A Son, has become a love-song. Every lament, after all, is a love-song. Will love-songs one day no longer be laments?
149	The Rainbow Goblins	1994	9	32	125	https://images.gr-assets.com/books/1388289209l/31488.jpg	Since its first publication more than 15 years ago, the fantastic colors, amazing detail, and sweeping scope of The Rainbow Goblins have irresistibly invited tens of thousands of children to plunge their imaginations into its vivid world. This charming allegorical tale is once again available in a new edition. 18 color illustrations.
150	Earth	1991	10	9	126	https://images.gr-assets.com/books/1442599236l/26228483.jpg	A young adult paranormal romance series. An epic journey. If the Seventine are released, will anyone survive? With Brace back by her side and the melding bond again secure, Abigail should be happier than ever. Right? Well, there’s still that little rodent problem of hers. The Seventine. Six of the evil energy sucking entities are free and with the convergence fast approaching, there is no doubt that the final battle will be fought soon. All that stands between the Seventine and the end of the First World star-system is Abigail, the other half-Walker females and a gathering of races from across the worlds. Abigail has never had so much to lose, but when everything is on the line, you fight with everything you have. She will never give up. But in the end, will she be able to save everyone?
151	The Beatles Anthology	2000	9	7	127	https://images.gr-assets.com/books/1387720608l/676555.jpg	This extraordinary project has been made possible because Paul McCartney, George Harrison and Ringo Starr have agreed to tell their combined story especially for this book. Together with Yoko Ono Lennon, they have also made available the full transcripts (including all the outtakes) of the television and video series The Beatles Anthology. Through painstaking compilation of sources worldwide, John Lennon's words are equally represented in this remarkable volume. Furthermore, The Beatles have opened their personal and management archives specifically for this project, allowing the unprecedented release of photographs which they took along their ride to fame, as well as fascinating documents and memorabilia from their homes and offices. What a book The Beatles Anthology is! Each page is brimming with personal stories and rare vintage images. Snapshots from their family collections take us back to the days when John Lennon, Paul McCartney, George Harrison and Richard Starkey were just boys growing up in Liverpool. They talk in turn about those early years and how they came to join the band that would make them known around the world as John, Paul, George and Ringo. Then, weaving back and forth, they tell the astonishing story of life as The Beatles: the first rough gigs, the phenomenon of their rise to fame, the musical and social change of their heyday, all the way through to their breakup. From the time Ringo tried to take this drum kit home on the bus to their much anticipated audience with Elvis, from the making of the Sgt. Pepper album to their last photo session together at John's house, The Beatles Anthology is a once-in-a-lifetime collection of The Beatles' own memories.Interwoven with these are the recollections of such associates as road manager Neil Aspinall, producer George Martin and spokesman Derek Taylor. And included in the vast array of photographs are materials from both Apple and EMI, who also opened their archives for this project. This, indeed, is the inside story, providing a wealth of previously unpublished material in both word and image.Created with their full cooperation, The Beatles Anthology is, in effect, The Beatles' autobiography. Like their music has been a part of so many of our lives, it's warm, frank, funny, poignant and bold. At last, here is The Beatles' own story.
152	Priority	2001	9	41	128	https://images.gr-assets.com/books/1364430629l/17697959.jpg	As mankind inches closer to self-destruction—corruption, greed, religious zealotry and intemperance—Patrick Mitchell struggles to find purpose and order amidst the growing chaos he’s witnessed in the world. As a former Marine serving in the Middle East, then as a college student, Patrick sees the mounting ignorance of mankind. He is distraught by the moral deficiencies and surrendering of principles he has observed. Patrick ignores the temptation of blissful ignorance, instead choosing to pursue wisdom, feeling that a life without examination is not a life worth living. Reflecting on his personal tribulations, Patrick Mitchell considers the future of mankind and has determined one thing alone to be his priority.
153	Morning Star	2003	10	53	129	https://images.gr-assets.com/books/1423327433l/24685115.jpg	Red Rising thrilled readers and announced the presence of a talented new author. Golden Son changed the game and took the story of Darrow to the next level. Now comes the exhilarating conclusion to the Red Rising Trilogy: Morning Star.Darrow would have lived in peace, but his enemies brought him war. The Gold overlords demanded his obedience, hanged his wife, and enslaved his people. But Darrow is determined to fight back. Risking everything to transform himself and breach Gold society, Darrow has battled to survive the cutthroat rivalries that breed Society’s mightiest warriors, climbed the ranks, and waited patiently to unleash the revolution that will tear the hierarchy apart from within.Finally, the time has come.But devotion to honor and hunger for vengeance run deep on both sides. Darrow and his comrades-in-arms face powerful enemies without scruple or mercy. Among them are some Darrow once considered friends. To win, Darrow will need to inspire those shackled in darkness to break their chains, unmake the world their cruel masters have built, and claim a destiny too long denied—and too glorious to surrender.
154	Tainted Blood	2003	9	42	130	https://images.gr-assets.com/books/1357596052l/17226000.jpg	Vampires, Werewolves, and…Angels? Oh, my!Laney’s life is suddenly tangled by deceit and, as she tries to pull her past, present and future together, she finds herself and her friends fighting for their lives. Thrown into the midst of a conflict that has been brewing for centuries—a conflict that no mere human should be anywhere near—Laney and her friends will discover that the mythical creatures of lore are not so mythical after all.As Carter and Kiera’s relationship moves forward, Laney and Oliver’s becomes strained…confusing…dangerous.Laney would have never thought Oliver was capable of causing such pain, such heartache, such fear. When he becomes a danger to everyone they know, especially her, Laney must make the choice to save herself, or those she loves.As if this weren’t enough, a visit from Oliver’s brother could bring Laney’s life to a tragic end.
155	The Brothers Karamazov	2002	9	22	131	https://images.gr-assets.com/books/1320549915l/138502.jpg	The Brothers Karamazov, Dostoevsky’s last and greatest novel, published just before his death in 1881, chronicles the bitter love-hate struggle between the outsized Fyodor Karamazov and his three very different sons. It is above all the story of a murder, told with hair-raising intellectual clarity and a feeling for the human condition unsurpassed in world literature.Dostoevsky’s towering reputation as one of the handful of thinkers who forged the modern sensibility has sometimes obscured the purely novelistic virtues–brilliant characterizations, flair for suspense and melodrama, instinctive theatricality–that made his work so immensely popular in nineteenth-century Russia. \n\nThis award-winning translation by Richard Pevear and Larissa Volokhonsky–the definitive version in English–magnificently captures the rich and subtle energies of Dostoevsky’s masterpiece.(Book Jacket Status: Jacketed)
156	A Story Like the Wind	1978	7	58	132	https://images.gr-assets.com/books/1382945755l/113387.jpg	Van der Post’s incomparable knowledge of Africa illuminates this epic novel, set near the Kalahari Desert, about a boy on the verge of manhood, his experiences with the wonder and mystery of a still-primitive land, and his secret friendship with the Bushman whose life he saves. The narrative of A Story like the Wind continues in A Far-Off Place.
157	Plan B	2001	9	53	133	https://images.gr-assets.com/books/1309202837l/288766.jpg	"A real page-turner" (ANNE MCCAFFREY) in the Liaden Universe(r) series.Fugitive Val Con yos'Phelium plans a desperate gamble by forming an alliance with Clan Erob. But his cousin, Shan yos'Galen can't wait. With enemy agents closing in, he invokes Plan B-setting in motion a series of events that will have dire consequences-for all of Liad.
657	Dragonfly in Amber	2001	10	56	493	https://images.gr-assets.com/books/1456114344l/5364.jpg	From the author of Outlander... a magnificent epic that once again sweeps us back in time to the drama and passion of 18th-century Scotland...For twenty years Claire Randall has kept her secrets. But now she is returning with her grown daughter to Scotland's majestic mist-shrouded hills. Here Claire plans to reveal a truth as stunning as the events that gave it birth: about the mystery of an ancient circle of standing stones ...about a love that transcends the boundaries of time ...and about James Fraser, a Scottish warrior whose gallantry once drew a young Claire from the security of her century to the dangers of his ....Now a legacy of blood and desire will test her beautiful copper-haired daughter, Brianna, as Claire's spellbinding journey of self-discovery continues in the intrigue-ridden Paris court of Charles Stuart ...in a race to thwart a doomed Highlands uprising ...and in a desperate fight to save both the child and the man she loves....
158	The Revelation	1999	6	42	134	https://images.gr-assets.com/books/1381508738l/18661755.jpg	It's been three years since I have turned, and I am not sure who I am anymore. I don't even know if I want to be what I have become. Is love enough to keep me alive inside even if I am dead? How can I find peace within myself when everything around me screams war and death? How will things end when one man holds my eternal love and another wants me dead? There is no end as far as I can see. It’s just the beginning because I can feel the darkness approaching. It wants me. It calls for me by name. I will keep on fighting until it arrives. The problem is, if I don’t learn to shut off my emotions I may just become my own worst enemy. Is it all too much, or not enough? These are the things a vampire queen, new mother and woman fighting with her past human morals must ask herself. I have one more important question to answer that could change everything. IS THIS REALLY WHAT I WANT?The red jeweled necklace the coven called The Eye of the Queen sat right at my cleavage. I ran one finger over my pale skin and red lips as I looked at my reflection in the mirror. Queen was my title, but I knew different. I was just a beautiful killer.
159	Hell Hath No Fury	1992	9	23	135	https://images.gr-assets.com/books/1497035599l/35231017.jpg	To keep the money, he has to keep her as well…Cecily Nottingham has made a huge mistake. The marriage bed was still warm when the earl she thought she loved crawled out of it and announced that he loved someone else. Loves. Someone else.All he saw in Cecily was her dowry. But he’s in for the shock of his life, because in order to keep the money, he has to keep her. With nothing to lose, Cecily sets out to seduce her husband’s cousin, Stephen Nottingham, in an attempt to goad the earl into divorcing her. Little does she realize that Stephen would turn out to be everything her husband was not: Honorable, loyal, trustworthy…Handsome as sin.Stephen only returned to England for one reason—save his cousin’s estate from financial ruin. Instead, he finds himself face to face with his cousins beautiful and scorned wife. Only now that he's home, he isn’t sure what to do first, strangle his cousin, or kiss his wife. His honor is about to be questioned, right along with his self-control. Amid snakes, duels and a good catfight, Cecily realizes the game she’s playing has high stakes indeed.  There are only a few ways for a marriage to end in Regency England and none of them come without a high price. Is she willing to pay it? Is Stephen? A ‘Happily Ever After’ hangs in the balance, because, yes, love can conquer all, but sometimes it needs a little bit of help.
160	The Pleasantries of the Incredible Mulla Nasrudin	1993	10	8	136	https://images.gr-assets.com/books/1348021570l/530425.jpg	Today we find him in a high-level physics report, illustrating phenomena that can't be described in ordinary technical terms. He appears in psychology textbooks, illuminating the workings of the mind in a way no straightforward explanation can. In three definitive volumes (The Exploits of the Incomparable Mulla Nasrudin, The Pleasantries of the Incredible Mulla Nasrudin and The Subtleties of the Inimitable Mulla Nasrudin) Idries Shah takes us to the very heart of this mysterious mentor, the Mulla Nasrudin. Skillful contemporary retellings of hundreds of collected stories and sayings bring the unmistakable--often backhanded--wisdom, wit and charm of the timeless jokester to life. The Mulla and his stories appear in literature and oral traditions from the Middle East to Greece, Russia, France--even China. Many nations claim Nasrudin as a native son, but nobody really knows who he was or where he came from. According to a legend dating from at least the 13th century, Nasrudin was snatched as a schoolboy from the clutches of the "Old Villain"--the crude system of thought that ensnares man--to carry through the ages the message of how to escape. He was chosen because he could make people laugh, and humor has a way of slipping through the cracks of the most rigid thinking habits. Acclaimed as humorous masterpieces, as collections of the finest jokes, as priceless gift books, and for hundreds "enchanted tales," this folklore figure's antics have also been divined as "mirroring the antics of the mind." The jokes are, as Idries Shah notes, "perfectly designed models for isolating and holding distortions of the mind which so often pass for reasonable behavior." Therefore they have a double use: when the jokes have been enjoyed, their psychological significance starts to sink in. In fact, for many centuries they have been studied in Sufi circles for their hidden wisdom. They are used as teaching exercises, in part to momentarily "freeze" situations in which states of mind can be recognized. The key to the philosophic significance of the Nasrudin jokes is given in Idries Shah's book The Sufis and a complete system of mystical training based upon them was described in the Hibbert Journal. In these delightful volumes, Shah not only gives the Mulla a proper vehicle for our times, he proves that the centuries-old stories and quips of Nasrudin are still some of the funniest jokes in the world.
161	Reflections	1987	8	41	136	https://images.gr-assets.com/books/1347235874l/224517.jpg	Small in size, but with a powerful punch, Idries Shah's Reflections is a collection of fables, aphorisms, and statements that challenge the conditioned mind. The book confronts the reader with unaccustomed perspectives and ideas, in an attempt to set the mind free, to see how things really are. As the book's foreword states, 'Do you imagine that fables exist only to amuse or to instruct, and are based upon fiction? The best ones are delineations of what happens in real life, in the community and in the individual's mental processes'.
162	The Elephant in the Dark	1988	9	13	136	https://images.gr-assets.com/books/1387722355l/415032.jpg	As our world continues to shrink, we are being brought headlong into often explosive contact with other cultures and religions. Islam continues to be for many a mysterious and misunderstood force, alien to our own cultural values. Yet, in more ways than expected, Christianity and Islam share common ground. For centuries, Sufi thinkers have been linked to both religions in certain important ideas. But, like the elephant in the dark in Jalaludin Rumi's classic fable, these ideas are not grasped in full by seizing parts of the whole and arguing for or against their supposed Christian or Islamic derivation. From a series of lectures given by Idries Shah as a Visiting Professor at Geneva University, Switzerland, The Elephant in the Dark shifts focus to more fruitful ground, tracing documented episodes of co-operation and understanding between Christians and Moslems over the past 1,400 years
163	The Commanding Self	1994	9	41	136	https://images.gr-assets.com/books/1388379913l/181271.jpg	The commanding self in Sufi terminology is that mixture of primitive and conditioned responses, common to everyone, which inhibits and distorts human progress and understanding. The book serves to illustrate and amplify Idries Shah's preceding (over 20) books on the Sufi Way.
164	Material World: A Global Family Portrait	1994	9	1	137	https://images.gr-assets.com/books/1328774747l/486749.jpg	In an unprecedented effort, sixteen of the world’s foremost photographers traveled to thirty nations around the globe to live for a week with families that were statistically average for that nation. At the end of each visit, photographer and family collaborated on a remarkable portrait of the family members outside their home, surrounded by all of their possessions—a few jars and jugs for some, an explosion of electronic gadgetry for others. Vividly portraying the look and feel of the human condition everywhere on Earth, this internationally acclaimed bestseller puts a human face on the issues of population, environment, social justice, and consumption as it illuminates the crucial question facing our species today: Can all six billion of us have all the things we want?
188	Jonah	1999	10	1	154	https://images.gr-assets.com/books/1360351909l/17341752.jpg	Book 32 of the Old Testament
165	Afterimage	1992	7	23	138	https://images.gr-assets.com/books/1344218923l/8164593.jpg	In the Company of Shadows is a series about two people who are thrown together as partners in a secret agency; their mission is to disband rebels who have propagated in a post-war future, but they have to deal with everything that comes with an unlikely partnership as well.Miscommunication, periods of distance, fleeting smiles and learning to trust someone when a person can't even trust himself, these are what they struggle with while still trying to do their jobs. One is a psychopath, called a murderer and monster and generally deemed subhuman by nearly everyone who knows of him; the other is an introvert, cold and emotionless and so lost in thoughts that he would agree that he can be called a monster of inhumanity. But what makes a person human; is it humanity, compassion, or is it simply the ability to reason? Can a monster be human, and general humanity breed monsters?While they learn about each other, they learn about themselves; where their loyalty and morality lies, and how learning to trust another person can be incredibly difficult, bittersweet, and rewarding all at the same time. Join Hsin Liu Vega (aka "Sin") and Boyd Beaulieu as they struggle to find where they fit in a world slowly recovering from war.Status: Complete
166	A Childhood: The Biography of a Place	1995	9	45	139	https://images.gr-assets.com/books/1388584870l/24849.jpg	A Childhood is the unforgettable memoir of Harry Crews' earliest years, a sharply remembered portrait of the people, locales, and circumstances that shaped him--and destined him to be a storyteller. Crews was born in the middle of the Great Depression, in a one-room sharecropper's cabin at the end of a dirt road in rural South Georgia. If Bacon County was a place of grinding poverty, poor soil, and blood feuds, it was also a deeply mystical place, where snakes talked, birds could possess a small boy by spitting in his mouth, and faith healers and conjure women kept ghosts and devils at bay.At once shocking and elegiac, heartrending and comical, A Childhood not only recalls the transforming events of Crews's youth but conveys his growing sense of self in a world "in which survival depended on raw courage, a courage born out of desperation and sustained by a lack of alternatives."Amid portraits of relatives and neighbors, Bacon County lore, and details of farm life, Crews tells of his father's death; his friendship with Willalee Bookatee, the son of a black hired hand; his bout with polio; his mother and stepfather's failing marriage; his near-fatal scalding at a hog-killing; and a five-month sojourn in Jacksonville, Florida. These and other memories define, with reverence and affection, Harry Crews's childhood world: "its people and its customs and all its loveliness and all its ugliness." Imaginative and gripping, A Childhood re-creates in detail one writer's search for past and self, a search for a time and place lost forever except in memory.
167	Firelight	1997	9	37	140	https://images.gr-assets.com/books/1438641851l/25943106.jpg	Emily, Trellis, and Vigo visit Algos Island, where they can access and enter lost memories. They're hoping to uncover the events of Trellis's mysterious childhood -- knowledge they can use against the Elf King. What they discover is a dark secret that changes everything. Meanwhile, the Voice of Emily's Amulet is getting stronger, and threatens to overtake her completely.
168	Dreamweaver	1984	9	9	141	https://images.gr-assets.com/books/1445048170l/17252254.jpg	Against all odds, Weaver and his friends have found a way to stop the Dream Eater from laying waste to the Shield’s northern outpost. Despite the days of peace that follow, in his heart, Weaver’s certain that all is not well; that a destructive force, so great in its efficiency, could not have been silenced so easily. When the storm clouds, at last, begin to brew, and waves of chaos begin to break upon the Shield, Weaver and his friends are thrust into a plight unlike any they could’ve ever imagined.
169	Night	1991	8	1	142	https://images.gr-assets.com/books/1473495285l/1617.jpg	Born in the town of Sighet, Transylvania, Elie Wiesel was a teenager when he and his family were taken from their home in 1944 to Auschwitz concentration camp, and then to Buchenwald. Night is the terrifying record of Elie Wiesel's memories of the death of his family, the death of his own innocence, and his despair as a deeply observant Jew confronting the absolute evil of man. This new translation by his wife and most frequent translator, Marion Wiesel, corrects important details and presents the most accurate rendering in English of Elie Wiesel's testimony to what happened in the camps and of his unforgettable message that this horror must never be allowed to happen again.
170	Jennie	1994	7	58	143	https://images.gr-assets.com/books/1387664459l/610718.jpg	This is the story of a young boy called Peter, who is knocked down by a car. To his considerable astonishment, when he recovers, he is not a young boy, but a cat! Fortunately, he meets Jennie, a cat who had been abandoned by her family when they moved away, who educates him in the wiles of the feline world. Will he stay a cat with Jennie, or return to being a human boy?
171	Memoirs of the Second World War	1991	9	34	144	https://images.gr-assets.com/books/1402978987l/25589.jpg	The quintessential account of the Second World War as seen by Winston Churchill, its greatest leaderAs Prime Minister of Great Britain from 1940 to 1945, Winston Churchill was not only the most powerful player in World War II, but also the free world's most eloquent voice of defiance in the face of Nazi tyranny. Churchill's epic accounts of those times, remarkable for their grand sweep and incisive firsthand observations, are distilled here in a single essential volume. Memoirs of the Second World War is a vital and illuminating work that retains the drama, eyewitness details, and magisterial prose of his classic six-volume history and offers an invaluable view of pivotal events of the twentieth century.
172	The Second World War	1989	8	34	144	https://images.gr-assets.com/books/1388208680l/25587.jpg	The definitive, Nobel Prize–winning history of World War II, universally acknowledged as a magnificent historical reconstruction and an enduring work of literature From Britain's darkest and finest hour to the great alliance and ultimate victory, the Second World War remains the most pivotal event of the twentieth century. Winston Churchill was not only the war's greatest leader, he was the free world's singularly eloquent voice of defiance in the face of Nazi tyranny, and it's that voice that animates this six-volume history. Remarkable both for its sweep and for its sense of personal involvement, it begins with The Gathering Storm; moves on to Their Finest Hour, The Grand Alliance, The Hinge of Fate, and Closing the Ring; and concludes with Triumph and Tragedy.
180	The Children	1982	0	34	149	https://images.gr-assets.com/books/1320488567l/715192.jpg	The Children is Halberstam's moving evocation of the early days of the civil rights movement, as seen thru the story of the young people--the Children--who met in the 60s & went on to lead the revolution. Magisterial in scope, with a strong you-are-there quality, The Children is a story one of America's preeminent journalists has waited years to write, a powerful book about one of the most dramatic movements in American history. They came together as part of Rev. James Lawson's workshops on nonviolence, eight idealistic black students whose families had sacrificed much so that they could go to college. They risked it all, & their lives besides, when they joined the growing civil rights movement. Halberstam shows how Martin Luther King Jr recruited Lawson to come to Nashville to train students in Gandhian techniques of nonviolence. We see the strength of the families the Children came from, moving portraits of several generations of the black experience in America. We feel Diane Nash's fear before the first sit-in to protest segregation of Nashville lunch counters. Then we see how Diane Nash & others--John Lewis, Gloria Johnson, Bernard Lafayette, Marion Barry, Curtis Murphy, James Bevel, Rodney Powell--persevered until they ultimately accomplished that goal. After the sit-ins, when the Freedom Rides to desegregate interstate buses were in danger of being stopped because of violence, it was these same young people who led the bitter battle into the Deep South. Halberstam takes us into those buses, lets us witness the violence the students encountered in Montgomery, Birmingham, Selma. He shows what has happened to the Children since the 60s, as they have gone on with their lives.
186	Holy Bible, King James Version	1999	9	8	154	https://images.gr-assets.com/books/1375311666l/9111908.jpg	The King James Version from Zondervan is now available in an easily readable pew Bible. Perfect for personal use as well as for use in churches, the King James Version Large Print Pew Bible comes in a sturdy binding at an attractive price point.
173	The Arrival	2000	9	37	145	https://images.gr-assets.com/books/1312827620l/920607.jpg	In a heartbreaking parting, a man gives his wife and daughter a last kiss and boards a steamship to cross the ocean. He's embarking on the most painful yet important journey of his life- he's leaving home to build a better future for his family.Shaun Tan evokes universal aspects of an immigrant's experience through a singular work of the imagination. He does so using brilliantly clear and mesmerizing images. Because the main character can't communicate in words, the book forgoes them too. But while the reader experiences the main character's isolation, he also shares his ultimate joy.
174	Something Wonderful	1991	9	23	146	https://images.gr-assets.com/books/1435634530l/129616.jpg	Bestselling author Judith McNaught masterfully portrays a remarkable heroine, and an unforgettable passion, in this powerfully moving love story -- one of her most beloved novels of all time!  The tempestuous marriage of Alexandra Lawrence, an innocent country girl, and Jordan Townsende, the rich and powerful Duke of Hawthorne, is about to face its ultimate test of tender loyalty. Swept into the endlessly fascinating world of London society, free-spirited Alexandra becomes ensnared in a tangled web of jealousy and revenge, stormy pride and overwhelming passion. But behind her husband's cold, arrogant mask, there lives a tender, vital, sensual man...the man Alexandra married. Now, she will fight for his very life...and the rapturous bond they alone can share.
175	Almost Heaven	1999	10	23	146	https://images.gr-assets.com/books/1175609719l/534564.jpg	ELIZABETH CAMERONThe Countess of Havenhurst possessed a rare gentleness and fierce courage to match her exquisite beauty. But her reputation is shattered when she is discovered in the arms of Ian Thornton, a notorious gambler and social outcast.IAN THORNTONA dangerously handsome man of secret wealth and mysterious lineage, his voyage to Elizabeth's heart is fraught with intrigue, scandal, and a venomous revenge.Destined for each other, yet wary of each other's motives, Elizabeth and Ian engage in a dance of suspicion and passion that tests the very soul of their star-crossed love. As a twisting path of secrets takes them from London's drawing rooms to the mysterious Scottish Highlands, Elizabeth must learn the truth: is Ian merely a ruthless fortune hunter at heart?
176	And the Band Played On: Politics, People, and the AIDS Epidemic	2000	9	1	147	https://images.gr-assets.com/books/1386924077l/28212.jpg	By the time Rock Hudson's death in 1985 alerted all America to the danger of the AIDS epidemic, the disease had spread across the nation, killing thousands of people and emerging as the greatest health crisis of the 20th century. America faced a troubling question: What happened? How was this epidemic allowed to spread so far before it was taken seriously? In answering these questions, Shilts weaves the disparate threads into a coherent story, pinning down every evasion and contradiction at the highest levels of the medical, political, and media establishments. Shilts shows that the epidemic spread wildly because the federal government put budget ahead of the nation's welfare; health authorities placed political expediency before the public health; and scientists were often more concerned with international prestige than saving lives. Against this backdrop, Shilts tells the heroic stories of individuals in science and politics, public health and the gay community, who struggled to alert the nation to the enormity of the danger it faced. And the Band Played On is both a tribute to these heroic people and a stinging indictment of the institutions that failed the nation so badly.
177	Jayber Crow	2001	10	58	148	https://images.gr-assets.com/books/1433600577l/57460.jpg	"This is a book about Heaven," says Jayber Crow, "but I must say too that . . . I have wondered sometimes if it would not finally turn out to be a book about Hell." It is 1932 and he has returned to his native Port William to become the town's barber.Orphaned at age ten, Jayber Crow's acquaintance with loneliness and want have made him a patient observer of the human animal, in both its goodness and frailty.He began his search as a "pre-ministerial student" at Pigeonville College. There, freedom met with new burdens and a young man needed more than a mirror to find himself. But the beginning of that finding was a short conversation with "Old Grit," his profound professor of New Testament Greek. "You have been given questions to which you cannot be given answers. You will have to live them out--perhaps a little at a time." "And how long is that going to take?" "I don't know. As long as you live, perhaps." "That could be a long time." "I will tell you a further mystery," he said. "It may take longer."Wendell Berry's clear-sighted depiction of humanity's gifts--love and loss, joy and despair--is seen though his intimate knowledge of the Port William Membership.
193	Small Steps: The Year I Got Polio	1996	8	1	159	https://images.gr-assets.com/books/1348218290l/226425.jpg	Ten years ago, in a riveting story of courage and hope, Peg Kehret wrote of the months she spent in a hospital when she was 12. The book deeply touched readers of all ages and received many awards and honors. This anniversary edition includes an updated and extended Epilogue, 12 pages of new photos, and a new section about polio.
178	The Unsettling of America: Culture and Agriculture	1996	10	25	148	https://images.gr-assets.com/books/1363657372l/146191.jpg	Since its publication by Sierra Club Books in 1977, The Unsettling of America has been recognized as a classic of American letters. In it, Wendell Berry argues that good farming is a cultural development and spiritual discipline. Today’s agribusiness, however, takes farming out of its cultural context and away from families. As a result, we as a nation are more estranged from the land—from the intimate knowledge, love, and care of it. Sadly, as Berry notes in his Afterword to this third edition, his arguments and observations are more relevant than ever. We continue to suffer loss of community, the devaluation of human work, and the destruction of nature under an economic system dedicated to the mechanistic pursuit of products and profits. Although “this book has not had the happy fate of being proved wrong,” Berry writes, there are good people working “to make something comely and enduring of our life on this earth.” Wendell Berry is one of those people, writing and working, as ever, with passion, eloquence, and conviction.
191	The Drowned and the Saved	1989	0	1	157	https://images.gr-assets.com/books/1390361633l/6176.jpg	The author tries to understand the rationale behind Auschwitz, Treblinka, Bergen-Belsen. Dismissing stereotyped images of brutal Nazi torturers and helpless victims, Levi draws extensively on his own experiences to delve into the minds and motives of oppressors and oppressed alike. Describing the difficulty and shame of remembering, the limited forms of collaboration between inmates and SS goalers, the exploitation of useless violence and the plight of the intellectual, Levi writes about the issue of power, mercy and guilt, and their effects on the lives of the ordinary people who suffered so incomprehendingly.
179	The Collected Poems, 1957-1982	1987	8	50	148	https://images.gr-assets.com/books/1312055779l/76729.jpg	A longtime spokesman for conservation, common sense, and sustainable agriculture, Wendell Berry writes eloquently in several styles and methods. Among other literary forms, he is a poet of great clarity and sureness. His love of language and his care for its music are matched only by his fidelity to the subjects he has written of during his first twenty-five years of work: land and nature, the family and community, tradition as the groundwork for life and culture. His graceful elegies sit easily alongside lyrics of humor and biting satire. Husbandman and husband, philosopher and Mad Farmer, he writes of values that endure, of earthy truths and universal imagery. His vision is one of hope and memory, of determination and faithfulness. For this far-reaching yet portable volume, Berry has chosen nearly two hundred poems from his previous eight collections.
187	Holy Bible: King James Version	2002	8	8	154	https://images.gr-assets.com/books/1313518530l/1923820.jpg	Great for all ages! All the majesty of the Authorized King James Version in a beautiful Black Leatherflex (Imitation Leather) Binding. The words of Christ are printed in red and names are written in a self-pronouncing way. This edition features an easy-to-use illustrated Bible dictionary and concordance, which adds to your understanding of the Scriptures. Full-color endpaper maps illuminate the Bible text. This edition is ideal for gift-giving since the front Presentation Page lets you record the occasion. The durable and practical black leatherflex binding will withstand regular use for years.
194	Michael Jordan	1995	0	60	160	https://images.gr-assets.com/books/1328843758l/165582.jpg	Completely revised and updated, this inspiring biography covers the whole of Jordan's amazing career -- from his boyhood and NCAA years to his 1999 retirement from the game.
205	Yukon Ho!	1989	9	37	168	https://images.gr-assets.com/books/1349005407l/70491.jpg	The spirit of childhood leaps to life again with boundless energy and magic in Yukon Ho!, a collection of adventures featuring rambunctious six-year-old Calvin and his co-conspirator tiger-chum, Hobbes. Picking up where The Essential Calvin and Hobbes left off, Yukon Ho! is a delight!
181	Carry the Wind	1986	10	56	150	https://images.gr-assets.com/books/1388544986l/202130.jpg	Young Josiah Paddock, on the run from his past in St. Louis, didn't have much hope of survival.  Winter was coming to the Rockies, and if the cold cutting through his city clothes didn't kill him, grizzlies or Indians would.  Then his luck tumed.  He stumbled across the trail of Ol' Scratch, a solitary mountain man eager enough for company to take the brash youngster under his wing.  Pure chance brought Paddock to the old trapper's camp, but it was skill with a gun and a knife that kept them both alive as they rode deep into the majestic land of Blackfeet and Crow, bible-spouting pioneers and sensual woman where only the best and braves survived . . . and only the luckiest rode back again. Carry The Wind is a gripping historical saga set in the Grand Tetons during a time when the horizon never ended and a nation was being born.
182	Miss Rumphius	1982	10	32	151	https://images.gr-assets.com/books/1281468926l/334818.jpg	A beloved classic—written by a beloved Caldecott winner—is lovelier than ever!Barbara Cooney's story of Alice Rumphius, who longed to travel the world, live in a house by the sea, and do something to make the world more beautiful, has a timeless quality that resonates with each new generation. The countless lupines that bloom along the coast of Maine are the legacy of the real Miss Rumphius, the Lupine Lady, who scattered lupine seeds everywhere she went. Miss Rumphius received the American Book Award in the year of publication.To celebrate the thirtieth anniversary of two-time Caldecott winner Barbara Cooney's best-loved book, the illustrations have been reoriginated, going back to the original art to ensure state-of-the-art reproduction of Cooney's exquisite artwork. The art for Miss Rumphius has a permanent home in the Bowdoin College Museum of Art.
183	The Miracle of Forgiveness	2002	7	8	152	https://images.gr-assets.com/books/1180562350l/1055617.jpg	During his earthly ministry, Jesus performed many miracles, including healing numerous diseased and disabled bodies. But perhaps his greatest miracle was the healing of people's souls, - the forgiveness of sin. Jesus offers us that same miracle on the same terms- sincere repentance. In The Miracle of Forgiveness, President Spencer W Kimball gives a penetrating explanation of repentance and forgiveness and clarifies their implications for Church members. His in-depth approach shows that the need for forgiveness is universal; portrays the various facets of repentance, and emphasizes some of the more serious errors, particularly sexual ones, which afflict both modern society and Church members. Most important, he illuminates his message with the brightness of hope that even those who have gone grievously astray may find the way back to peace and security. Never before has any book brought this vital and moving subject into so sharp a focus. This classic book is a major work of substance and power. After, all who does not need the miracle of forgiveness.
184	Through Gates of Splendor	1981	10	17	153	https://images.gr-assets.com/books/1406510855l/56634.jpg	In 1956, five young men, including Elliot's husband, Jim, traveled into the jungles of Ecuador to establish communication with the fierce Huaorani Tribe, a people whose only previous response to the outside world has been to attack all strangers. The men's mission combined modern technology with innate ingenuity, sparked by a passionate determination to get the gospel to those without Christ. In a nearby village, their wives waited to hear from them. The news they received - all five missionaries had been murdered - changed lives around the world forever. Written while she was still a missionary in South America and at the request of the men's families, Through Gates of Splendor was Elisabeth Elliot's personal account of the final mission of these five courageous men. Filled with quotations from letters, material from personal journals, a wealth of photographs, and an epilogue update, this reprint of the original hardcover edition tells a lasting story of God's grace, unconditional love, and great courage. This story inspired the 2006 box office hit End of the Spear and is sure to inspire the next generation of servant believers.
185	A Path Through Suffering: Discovering the Relationship Between God's Mercy and Our Pain	1992	9	11	153	https://images.gr-assets.com/books/1328779406l/126184.jpg	Must we stumble through sorrow and tragedy witout understanding or is there a lighted way-a path-through suffering? Elisabeth Elliot plots the treacherous passage through pain, grief and loss a journey most of us will make many times in our life. Through it all, she says there is only one reliable path, and if you walk it, you will see the transformation of all your losses, heartbreaks and tragedies into something strong and purposeful. In this powerful moving book, Elisabeth Elliot does not hesitate to ask hard questions to examine tenderly the hurts we suffer and to explore boldy the nature of God whose sovereign care for us is so intimate and perfect that he confounds our finite understanding. "A Path through Suffering" is a book for anyone searching for faith, comfort and assurance.
189	Boy's Life	1999	9	16	155	https://images.gr-assets.com/books/1314302694l/11553.jpg	In me are the memories of a boy's life, spent in that realm of enchantments. These are the things I want to tell you.... Robert McCammon delivers "a tour de force of storytelling" (BookPage) in his award-winning masterpiece, a novel of Southern boyhood, growing up in the 1960s, that reaches far beyond that evocative landscape to touch readers universally. Boy's Life is a richly imagined, spellbinding portrait of the magical worldview of the young -- and of innocence lost. Zephyr, Alabama, is an idyllic hometown for eleven-year-old Cory Mackenson -- a place where monsters swim the river deep and friends are forever. Then, one cold spring morning, Cory and his father witness a car plunge into a lake -- and a desperate rescue attempt brings his father face-to-face with a terrible, haunting vision of death. As Cory struggles to understand his father's pain, his eyes are slowly opened to the forces of good and evil that surround him. From an ancient mystic who can hear the dead and bewitch the living, to a violent clan of moonshiners, Cory must confront the secrets that hide in the shadows of his hometown -- for his father's sanity and his own life hang in the balance....
190	Ever Increasing Faith	2001	8	11	156	https://images.gr-assets.com/books/1348517844l/333071.jpg	Adventures in Faith For author Smith Wigglesworth, life was a continual adventure. Always trusting God, even in the most hopeless situations, he had total confidence in the power of Christ. Join this late evangelist in the great adventure called “faith,” where miracles were daily events. Witness the many accounts of deliverance from diabetes, tuberculosis, demon possession, and even death. Prepare to be overwhelmed as the seed of faith begins to expand and grow in your heart. Watch as God moves, touching lives with healing and deliverance—miracles that follow as signs of the power of faith. Your faith, great or small, can multiply ever increasingly as it overflows into the lives around you, bringing glory to God and blessings to the world!  
192	Tramp for the Lord	1974	9	11	158	https://images.gr-assets.com/books/1349106628l/906560.jpg	For the past twenty years Corrie ten Boom has crisscrossed the globe, slept in more than a thousand different beds, and lived out of suitcases...all to fulfill her God-given mission to tell people everywhere that Jesus Christ is reality, that He Lives, that He is Victor.This remarkable woman of eighty-one years served time in a German concentration camp during World War II for the "crime" of hiding persecuted Jews and survived to tell the story in her best selling book, The Hiding Place. Her brush with death lent a new meaning to her life. In her own words: "My life had been given back as a gift...for a purpose."After her release from the concentration camp, Corrie ten Boom set out to become what she calls a "tramp for the Lord," traveling around the world at the direction of God, proclaiming His message everywhere. And through her lifelong experiences, she has learned a few lessons in God's great classroom which she shares with the readers of Tramp For the Lord.So deeply has she touched the hearts of men and women during her years of ministry that she is known as the venerable "Double-old Grandmother" and "Tante" Corrie to them. And she , in turn, has been touched and taught by them.Let her introduce you to...-her former prison guard who asks her for forgiveness...a forgiveness that come hard and with much pain...-the war-crippled lawyer with a soul that was as twisted and deformed as his limbs...-an African who truly followed Christ's exhortation to forgive your neighbor seventy times seven (Matt. 18:22)...-the travel agent who learned that her ultimate destination could not be found on any map...-a missionary mother whose unwanted babe ended up saving her life...All these touchingly human vignettes from her life and travels are intertwined with the unique teaching trouch that has sustained Corrie throughout her days.
195	The Greatest of Marlys	2000	9	37	161	https://images.gr-assets.com/books/1388689099l/29012.jpg	Lynda Barry had a bona fide hit with Cruddy, and her fans are now calling for her older comic strips, all out of print. This book answers the call as it delivers the life and times of Marlys Mullen, the most beloved character in Barry's nationally syndicated comic strip, "Ernie Pook's Comeek." This is a Lynda Barry double-tall: the long-awaited collection of the best strips from her syndicated comics. Way back in the mid-1980s, comic illustrator and writer Lynda Barry introduced the character of Marlys Mullen, her crazy groovy teenage sister Maybonne, her sensitive and strange little brother Freddie, a mother like no other, and an array of cousins and friends from the 'hood. This oversized book presents the long strange journey through puberty and life that Marlys and company have experienced. Marlys's universe and galaxy are funny, rude, disturbing, tearful . . . in short, very, very Lynda Barry.
196	Soul Searching	2000	10	42	162	https://images.gr-assets.com/books/1410698241l/23209889.jpg	The poetry of Soul Searching asks profound questions while exploring the human emotion of love gone wrong, struggles of today, and hopes for tomorrow. Included in this novella of poetry is the short story Emergence - erotic romance with a dose of science fiction blended in: Though she has never met him before, Isla knows who this strange and compelling man is. As resistance turns into submission, the origins of the human race, and Isla herself, are revealed. Drawn to the mysterious man with an undeniable magnetism, the emergence of the truth changes Isla forever. The book contains adult material and is not suitable for those under the age of 18.
212	All Creatures Great and Small	1985	0	1	173	https://images.gr-assets.com/books/1393644607l/32085.jpg	The classic multimillion copy bestsellerDelve into the magical, unforgettable world of James Herriot, the world's most beloved veterinarian, and his menagerie of heartwarming, funny, and tragic animal patients.For over forty years, generations of readers have thrilled to Herriot's marvelous tales, deep love of life, and extraordinary storytelling abilities. For decades, Herriot roamed the remote, beautiful Yorkshire Dales, treating every patient that came his way from smallest to largest, and observing animals and humans alike with his keen, loving eye.In All Creatures Great and Small, we meet the young Herriot as he takes up his calling and discovers that the realities of veterinary practice in rural Yorkshire are very different from the sterile setting of veterinary school. Some visits are heart-wrenchingly difficult, such as one to an old man in the village whose very ill dog is his only friend and companion, some are lighthearted and fun, such as Herriot's periodic visits to the overfed and pampered Pekinese Tricki Woo who throws parties and has his own stationery, and yet others are inspirational and enlightening, such as Herriot's recollections of poor farmers who will scrape their meager earnings together to be able to get proper care for their working animals. From seeing to his patients in the depths of winter on the remotest homesteads to dealing with uncooperative owners and critically ill animals, Herriot discovers the wondrous variety and never-ending challenges of veterinary practice as his humor, compassion, and love of the animal world shine forth.James Herriot's memoirs have sold 80 million copies worldwide, and continue to delight and entertain readers of all ages
197	Obsession	1993	7	23	163	https://images.gr-assets.com/books/1461535450l/27819475.jpg	Jade Roberts is in love with Talon Steel but no longer welcome in his home. While she resolves to move on, she still longs for the passion she and Talon shared and when her boss asks her to dig up information on the Steels, she s only too happy to comply. Talon and his brothers are hiding something, and Jade is determined to find out what it is.  The moment Talon saw Jade he wanted her, ached for her, craved her and now his desire has become his obsession. He knows she deserves better than his broken soul, but he can t stay away from her, and he finally confesses his love. If he and Jade are to have a future, he knows he must make peace with the dark shadows and horrors of his past.  But as Talon begins his journey of healing, Jade uncovers some startling secrets "
214	All Things Wise and Wonderful	1977	0	1	173	https://images.gr-assets.com/books/1434476309l/42909.jpg	The third volume in the multimillion copy bestselling seriesReaders adored James Herriot's tales of his life as a Yorkshire animal doctor in All Creatures Great and Small and All Things Bright and Beautiful. Now here's a third delightful volume of memoirs rich with Herriot's own brand of humor, insight, and wisdom.In the midst of World War II, James is training for the Royal Air Force, while going home to Yorkshire whenever possible to see his very pregnant wife, Helen. Musing on past adventures through the dales, visiting with old friends, and introducing scores of new and amusing character--animal and human alike--Herriot enthralls with his uncanny ability to spin a most engaging and heartfelt yarn.Millions of readers have delighted in the wonderful storytelling and everyday miracles of James Herriot in the over thirty years since his delightful animal stories were first introduced to the world.
198	Possession	2002	8	23	163	https://images.gr-assets.com/books/1470034760l/29332967.jpg	Jade Roberts' love for Talon Steel is the real deal, and she is more determined than ever to help him come to grips with whatever is haunting him. To that end, she continues her investigation of the Steels and unknowingly attracts some dangerous foes from their shrouded history.  Talon loves Jade deeply and longs to possess her forever, so he faces his worst fears and exposes his rawest wounds in an attempt to heal. The road is icy and treacherous, but if he perseveres and comes out whole on the other side, he'll finally be worthy of Jade's love.  The untamed passion between the two still blazes, but as the horrors of Talon's past resurface, Jade and Talon aren't safe.
199	A Gradual Awakening	1989	8	13	164	https://images.gr-assets.com/books/1320421518l/402994.jpg	In this intelligent, accessible work, acclaimed poet and meditation teacher Stephen Levine introduces readers to meditation. Filled with practical guidance and advice--as well as extensive personal recollections--A Gradual Awakening explains the value of meditation as a means of attaining awareness, and provides readers with extensive advice on how establish a practice. Drawing on his own personal experiences with and insights into vipassana meditation, Levine has crafted an inspiring book for anyone interested in deep personal growth.
294	The End	1978	0	16	235	https://images.gr-assets.com/books/1441746218l/20550280.jpg	The end is coming.The sickness struck everyone sixteen and older. First it twisted their minds; next it ravaged their bodies. Now the sickos—crazed and hungry for young flesh—are gathered in the center of London, lying in wait.It’s time for all of the survivors—kids spread out across the city—to unite. They must come up with a plan of attack to end the grown-ups’ reign of terror before it is too late.One thing is certain: surprises abound in the bloody conclusion to Charlie Higson’s Enemy saga.
200	City Lights	1994	10	23	165	https://images.gr-assets.com/books/1413930660l/23432705.jpg	Music brought them together. A gamble with love could break them apart. Blaine has reached rock and roll stardom. After surviving an overdose, Blaine was forced into a decision; change and be a better person, or continue down the dangerous path and lose everything he has worked for. Making the decision to change, he turns his focus and attention to writing and producing music in an effort to keep the bright lights of live performances and potential drugs at an arms distance. Bassist to the band Blaine is producing, Penelope knows all too well who he is. He’s the sexy as hell, but also drug addicted singer of the mega band, Deep Ember. As excited as she is to get her band signed, she’s none too thrilled to find out her producer is Blaine. Leaving her boyfriend back home to follow her dreams, Penelope will find herself in uncomfortable situations with Blaine. He’s expressed a genuine interest in her and she feels drawn toward him in return. Unfortunately, knowing who he is and what he’s done puts up an invisible wall between them. Emotions will be on the line and chords will be played… but can Blaine win over the heart of a woman who’s made it clear she wants nothing to do with him? Will Penelope be able to trust her emotions and will Blaine be able to prove he is not what his reputation says he is?
206	Homicidal Psycho Jungle Cat	1994	8	37	168	https://images.gr-assets.com/books/1448818381l/24816.jpg	Homicidal Psycho Jungle Cat chronicles the multifarious adventures of this wild child and his faithful, but skeptical, friend. If the best cartoons compel readers to identify themselves within the funny frames, then all who enjoy Calvin and Hobbes are creative, imaginative, and ... bad, bad, bad! Calvin, the irascible little boy with the stuffed tiger who comes to life are a pair bound for trouble. Boring school lessons become occasions for death-defying alien air battles, speeding snow sled descents elicit philosophical discussions on the meaning of life, and Hobbe's natural inclination to pounce on his little friend wreaks havoc on Calvin's sense of security. Calvin's the kid we all wish we"d been. Sassy, imaginative, far more verbal than his parents can manage, Calvin is the quintessential bad boy--and the boy we love to see. He terrorizes little Susie, offers "Candid Opinions" from a neighborhood stand, and questions his parents" authority. "What assurance do I have that your parenting isn't screwing me up?" he demands. Calvin and Hobbes manages to say what needs to be said about childhood and life: "Eww, mud," says Calvin. "Look at this gooshy, dirty, slimy, thick, wet mud... Bleecch... Talk about a kid magnet!"
207	The Riverside Shakespeare	1997	8	22	169	https://images.gr-assets.com/books/1388178402l/1414.jpg	The Second Edition of this complete collection of Shakespeare's plays and poems features two essays on recent criticism and productions, fully updated textual notes, a photographic insert of recent productions, and two works recently attributed to Shakespeare. The authors of the essays on recent criticism and productions are Heather DuBrow, University of Wisconsin at Madison, and William Liston, Ball State University, respectively.
210	The Bomber	2001	10	58	172	https://images.gr-assets.com/books/1423661247l/24910237.jpg	Joseph Starling has returned from war and is trying his best to resettle into civilian life. In the midst of his struggles, anti war protests spring up around him, and in this violence he is once again forced to face his internal conflicts.When Joseph discovers his best friend has been murdered he is offered a chance for revenge, and that revenge comes in the form of high explosive. He doesn’t feel guilty, though, he only dialed a number. Right?The Bomber is a journey of retribution and loss, set to the ticking of a very important countdown clock.
221	The Endurance: Shackleton's Legendary Antarctic Expedition	1998	0	34	178	https://images.gr-assets.com/books/1320487170l/537375.jpg	In August 1914, days before the outbreak of the First World War, the renowned explorer Ernest Shackleton and a crew of twenty-seven set sail for the South Atlantic in pursuit of the last unclaimed prize in the history of exploration: the first crossing on foot of the Antarctic continent. Weaving a treacherous path through the freezing Weddell Sea, they had come within eighty-five miles of their destination when their ship, Endurance, was trapped fast in the ice pack. Soon the ship was crushed like matchwood, leaving the crew stranded on the floes. Their ordeal would last for twenty months, and they would make two near-fatal attempts to escape by open boat before their final rescue.Drawing upon previously unavailable sources, Caroline Alexander gives us a riveting account of Shackleton's expedition--one of history's greatest epics of survival. And she presents the astonishing work of Frank Hurley, the Australian photographer whose visual record of the adventure has never before been published comprehensively. Together, text and image re-create the terrible beauty of Antarctica, the awful destruction of the ship, and the crew's heroic daily struggle to stay alive, a miracle achieved largely through Shackleton's inspiring leadership. The survival of Hurley's remarkable images is scarcely less miraculous: The original glass plate negatives, from which most of the book's illustrations are superbly reproduced, were stored in hermetically sealed cannisters that survived months on the ice floes, a week in an open boat on the polar seas, and several more months buried in the snows of a rocky outcrop called Elephant Island. Finally Hurley was forced to abandon his professional equipment; he captured some of the most unforgettable images of the struggle with a pocket camera and three rolls of Kodak film.Published in conjunction with the American Museum of Natural History's landmark exhibition on Shackleton's journey, The Endurance thrillingly recounts one of the last great adventures in the Heroic Age of exploration--perhaps the greatest of them all.
211	All Things Bright and Beautiful	1992	8	1	173	https://images.gr-assets.com/books/1388197805l/38743.jpg	"A very warm, very engaging read. . . . The reader falls totally under his spell." --Associated Press The second volume in the multimillion copy bestselling seriesMillions of readers have delighted in the wonderful storytelling and everyday miracles of James Herriot in the over thirty years since his delightful animal stories were first introduced to the world.Now in a new edition for the first time in a decade, All Things Bright and Beautiful is the beloved sequel to Herriot's first collection, All Creatures Great and Small, and picks up as Herriot, now newly married, journeys among the remote hillside farms and valley towns of the Yorkshire Dales, caring for their inhabitants---both two- and four-legged. Throughout, Herriot's deep compassion, humor, and love of life shine out as we laugh, cry, and delight in his portraits of his many, varied animal patients and their equally varied owners."Humor, realism, sensitivity, earthiness; animals comic and tragic; and people droll, pathetic, courageous, eccentric---all of whom he views with the same gentle compassion and a lively sense of the sad, the ridiculous, and the admirable." --Columbus Dispatch
213	James Herriot's Dog Stories	1986	10	14	173	https://images.gr-assets.com/books/1390266507l/38736.jpg	James Herriot is one of the most beloved storytellers of our time. The warm and joyful memoirs of his life as a country vet in Yorkshire have endeared him to countless readers around the world, and many of his most memorable tales featured man's best friend.Here are the complete dog stories from his much-beloved memoirs: a handsome collection of tales, available for the first time in trade paperback, that will warm the hearts of dog lovers around the world. Featuring a special introduction by the author and his own accompanying notes to each specially illustrated story, this tribute from man to dog is a volume no Herriot fan will want to be without.
215	The Lord God Made Them All	1981	7	1	173	https://images.gr-assets.com/books/1388210936l/38739.jpg	With each book more embraceable than the last, James Herriot once again brings us the magical beauty of Yorkshire through his heartwarming experiences as a country veterinarian. These new stories provide a grand finale to the wonderful books that began with all Creatures Great and Small.It is just after World War II, and James has returned from the R.A.F. to do battle with the diseases and injuries that befall the farm animals and pets of Skeldale and the surrounding moors. Four-year-old Jimmy Herriot, Humphrey Cobb and his little beagle Myrtle, Norman the book-loving veterinary assistant, and many more new faces join old favorites among the green hills of Yorkshire, as James takes an unforgettable voyage to Russia on a freighter with 383 pedigreed sheep. Touching our hearts with laughter and wisdom, lifting our spirits with compassion and goodness, James Herriot never fails to delight.
216	Every Living Thing	1988	7	1	173	https://images.gr-assets.com/books/1356140199l/278261.jpg	For more than twenty years, James Herriot has captivated millions of readers and television viewers with tales of the triumphs, disasters, pride and sometimes heartache that filled his life as a vet in the Yorkshire Dales.Every Living Thing shines with the storytelling magic that has made him a favourite the world over. It also reveals more of the real James Herriot than ever before.Here is a book for all those who find laughter and joy in animals, and who know and understand the magic of wild places and beautiful countryside.
217	Success Through a Positive Mental Attitude	1991	9	33	174	https://images.gr-assets.com/books/1347582335l/948213.jpg	The bestselling self-help classic that has helped millions—promoting positive mental attitude as a key to personal success.Your mind has a secret invisible talisman. On one side is emblazoned the letters PMA (positive mental attitude) and on the other the letters NMA (negative mental attitude). A positive attitude will naturally attract the good and the beautiful. The negative attitude will rob you of all that makes life worth living. Your success, health, happiness, and wealth depend on how you make up your mind! When motivational pioneer Napoleon Hill and millionaire CEO W. Clement Stone teamed up to form one of the most remarkable partnerships of all time, the result was Success Through a Positive Mental Attitude, the phenomenon that proposed to the world that with the right attitude, anyone can achieve his or her dreams. Now this remarkable book is available for the twenty-first century. You, too, can take advantage of the program that has brought success to generations of people seeking -- and finding -- a better way to live.
218	Pity the Nation: The Abduction of Lebanon	2002	10	34	175	https://images.gr-assets.com/books/1348192822l/99826.jpg	With the Israeli-Palestinian crisis reaching wartime levels, where is the latest confrontation between these two old foes leading? Robert Fisk's explosive Pity the Nation recounts Sharon and Arafat's first deadly encounter in Lebanon in the early 1980s and explains why the Israel–Palestine relationship seems so intractable. A remarkable combination of war reporting and analysis by an author who has witnessed the carnage of Beirut for twenty-five years, Fisk, the first journalist to whom bin Laden announced his jihad against the U.S., is one of the world's most fearless and honored foreign correspondents. He spares no one in this saga of the civil war and subsequent Israeli invasion: the PLO, whose thuggish behavior alienated most Lebanese; the various Lebanese factions, whose appalling brutality spared no one; the Syrians, who supported first the Christians and then the Muslims in their attempt to control Lebanon; and the Israelis, who tried to install their own puppets and, with their 1982 invasion, committed massive war crimes of their own. It includes a moving finale that recounts the travails of Fisk's friend Terry Anderson who was kidnapped by Hezbollah and spent 2,454 days in captivity. Fully updated to include the Israeli withdrawl from south Lebanon and Ariel Sharon's electoral victory over Ehud Barak, this edition has sixty pages of new material and a new preface. "Robert Fisk's enormous book about Lebanon's desperate travails is one of the most distinguished in recent times."—Edward Said
219	Personal Best: The Foremost Philosopher of Fitness Shares Techniques and Tactics for Success and Self-Liberation	1992	8	52	176	https://images.gr-assets.com/books/1266922962l/3785843.jpg	Runner's guru and general all-around fitness expert George Sheehan draws on seventy years of living for pungent and personal commentary on ways to live better, more happily, and more productively.
220	Vampyr	1981	10	42	177	https://images.gr-assets.com/books/1347433737l/6917863.jpg	Vampyr resucita los atributos de la novela gótica de misterio, intriga, amor y venganza. Su ritmo vertiginoso hará latir tu corazón a toda prisa mientras te sumerges en la atmósfera oscura y envolvente que caracteriza las historias de vampiros más inquietantes. Sus personajes te llevarán a un apasionante recorrido por la Europa del siglo XIX en su afán por descubrir los secretos de los despiadados enemigos que han despertado su sed de venganza. VAMPYR está lleno de peligros, aventuras e intrigas que te encantará desenredar al tiempo que vives su sorprendente historia de amor.
222	Two Brothers	2000	9	56	179	https://images.gr-assets.com/books/1345148674l/13573400.jpg	The new novel from this well-loved, bestselling author. Two Brothers is a heartrending story of two boys growing up under the darkening shadow of the Nazis. Born in Berlin in 1920 and raised by the same parents, one boy is Jewish, his adopted brother is Aryan. At first, their origins are irrelevant. But as the political landscape changes they are forced to make decisions with horrifying consequences.
223	Borderland	1986	9	24	180	https://images.gr-assets.com/books/1363219424l/17611261.jpg	When the Cartel violence plaguing Mexico spills across the border and takes the life of Jake Martin’s estranged, money-laundering father, the airline pilot and Navy veteran finds himself back in the town he thought he had left for good. Led by clues from the grave and pursued by a crooked lawyer, his sexy assistant and the DEA, Jake unwittingly embarks on a quest for millions in hidden cash. Destined for the narcos but intended for something much darker than drugs, the money has also attracted the attention of Ricardo “Tuco” Medrano, an American-born, violence-weary Cartel enforcer who is looking for a way out. Unknowingly tied by more than the treasure in the desert, Jake and Tuco are drawn together in a deadly contest that will play itself out in the mountains west of El Paso…
224	Thou Art That: Transforming Religious Metaphor	2001	10	9	181	https://images.gr-assets.com/books/1458920235l/324205.jpg	Thou Art That is a compilation of previously uncollected essays and lectures by Joseph Campbell that focus on the Judeo-Christian tradition. Here Campbell explores common religious symbols, reexamining and reinterpreting them in the context of his remarkable knowledge of world mythology. According to Campbell, society often confuses the literal and metaphorical interpretations of religious stories and symbols. In this collection, he eloquently reestablishes these metaphors as a means to enhance spiritual understanding and mystical revelation. With characteristic verve, he ranges from rich storytelling to insightful comparative scholarship. Included is editor Eugene Kennedy’s classic interview with Campbell in The New York Times Magazine, which brought the scholar to the public’s attention for the first time.
233	Dark Legend	2002	9	23	187	https://images.gr-assets.com/books/1330425833l/252999.jpg	'Every Carpathian male is drawn to his life mate, a Carpathian or human female able to provide the light to his darkness. Without her, the beast within slowly consumes the man until turning vampire is the only option.'Gabriel wakes deep within the ground, and the first sensation he feels is an overwhelming hunger for blood. But as he hunts the dark streets of Paris for prey, a voice calls to him, soothing, calming, giving him the strength to control his craving.Francesca Del Ponce is a healer, a woman who radiates goodness as powerfully as the sun does light. Though Gabriel can only imagine what she will feel like in his arms, he knows the taste of her will be addictive. And yet he fears for her life and his soul if he gives in to his desire...
310	The Green Mile	2000	8	16	248	https://images.gr-assets.com/books/1348176179l/4599610.jpg	At Cold Mountain Penitentiary killers such as Billy the Kid Wharton and Eduard Delacroix await death in Old Sparky. But no-one is prepared for the arrival of the evil new prisoner, John Coffey.
234	Dark Guardian	2002	8	23	187	https://images.gr-assets.com/books/1327896501l/94813.jpg	They were masters of the darkness, searching through eternity for a mistress of the light....He ran with the wolves...materialized from the mists...hijacked the very heavens to his whims.He was the dark guardian of his people. So how, after centuries of a bleak, soulless existence had he, Lucian Daratrazanoff, suddenly come to crave petite, curvy, colorful lady cop Jaxon Montgomery, who foolishly made it her life's work to protect others from harm?Fiercely daring, Jaxx would sacrifice anything to shield others-- particularly since a deadly menace dogged her every footstep, threatening all who got close to her. And strangely seductive, piercingly erotic Lucian was no exception. Lucian was powerfully, perilously mesmerizing--oddly gentle yet clearly a born predator. He had vowed to possess her, to guard her for all time. Yet with his every thirsty kiss, was he drawing Jaxon more deeply into danger . . . and his dark, mysterious desires?
349	The Surgeon's Mate	1992	9	56	279	https://images.gr-assets.com/books/1386924500l/77433.jpg	Jack Aubrey and Stephen Maturin are ordered home by dispatch vessel to bring the news of their latest victory to the government. But Maturin is a marked man for the havoc he has wrought in the French intelligence network in the New World, and the attention of two privateers soon becomes menacing. The chase that follows through the fogs and shallows of the Grand Banks is as tense, and as unexpected in its culmination, as anything Patrick O'Brian has written.
225	Emergency Animal Rescue Stories: True Stories About People Dedicated to Saving Animals from Disasters	2000	10	14	182	https://images.gr-assets.com/books/1183985316l/1474141.jpg	For those who love animals comes this riveting account of an extraordinary, dedicated team of more than 3,500 trained volunteers. EARS (Emergency Animal Rescue Service) takes on the task that the Red Cross and other human-focused organizations simply can't: helping animals survive natural and man-made disasters. You will be moved by the courageous, poignant, and at times humorous stories, including:• The desperate search by a 14-year-old girl to locate her missing cats• Libby, the dog who was rescued from Texas oil fields and is now the official taste-tester at a dog bakery in California• How a hoist saved a cow from raging Texas floodwaters• The resourceful skunk who found his safe haven in a portable toilet• How Bumpus, the fantastic, fearless feline, survived disfiguring burns and became a hero• Plus many more!The wrath of nature in the form of fire, flood, hurricane, or earthquake takes an enormous toll on animals as well as people. But, while there has long been help to save humans, there wasn't anyone who focused on helping the animals. This is why EARS—Emergency Animal Rescue Service—came into being. Inside are the real-life stories of EARS volunteers, and how their efforts have saved countless animals from certain death. You will read about the touching reunions of pet owners with the cherished pets they feared were dead. You will appreciate the wonderful service that EARS and its thousands of volunteers provide to all of us with their rescue efforts. Most of all these stories will make you laugh, cry, and marvel at the deep connection humans and animals share.These and other stories are sure to inspire and thrill as well as make you appreciate the wonderful bond that exists between animals and the special people who care enough to save them.
226	Ender's Shadow	2000	10	53	183	https://images.gr-assets.com/books/1424904668l/9532.jpg	Welcome to Battleschool.Growing up is never easy. But try living on the mean streets as a child begging for food and fighting like a dog with ruthless gangs of starving kids who wouldn't hesitate to pound your skull into pulp for a scrap of apple. If Bean has learned anything on the streets, it's how to survive. And not with fists—He is way too small for that—But with brains.Bean is a genius with a magician's ability to zero in on his enemy and exploit his weakness.What better quality for a future general to lead the Earth in a final climactic battle against a hostile alien race, known as Buggers. At Battleschool Bean meets and befriends another future commander—Ender Wiggins—perhaps his only true rival.Only one problem: for Bean and Ender, the future is now.
227	Glass Houses	1992	9	24	184	https://images.gr-assets.com/books/1493058503l/33602101.jpg	When a mysterious figure appears in Three Pines one cold November day, Armand Gamache and the rest of the villagers are at first curious. Then wary. Through rain and sleet, the figure stands unmoving, staring ahead.From the moment its shadow falls over the village, Gamache, now Chief Superintendent of the Surete du Quebec, suspects the creature has deep roots and a dark purpose. Yet he does nothing. What can he do? Only watch and wait. And hope his mounting fears are not realized.But when the figure vanishes overnight and a body is discovered, it falls to Gamache to discover if a debt has been paid or levied.Months later, on a steamy July day as the trial for the accused begins in Montreal, Chief Superintendent Gamache continues to struggle with actions he set in motion that bitter November, from which there is no going back. More than the accused is on trial. Gamache's own conscience is standing in judgment.In Glass Houses, her latest utterly gripping book, number-one New York Times bestselling author Louise Penny shatters the conventions of the crime novel to explore what Gandhi called the court of conscience. A court that supersedes all others.
241	Safely Home	2003	0	58	192	https://images.gr-assets.com/books/1406506307l/290369.jpg	2002 Gold Medallion Award winner! Fans of Randy Alcorn will applaud this soul-stirring story of two college friends who reconnect after twenty years. One is living life apart from God in comfortable corporate America while the other is living for Christ under intense persecution in China. This stunning page-turner will convict the hearts of readers to live in the light of eternity. Royalties from sales of this book will be donated to support the persecuted Church.
252	100 Selected Poems	1959	0	50	202	https://images.gr-assets.com/books/1388179993l/76889.jpg	E.E. Cummings is without question one of the major poets of this century, and this volume, first published in 1959, is indispensable for every lover of modern lyrical verse. It contains one hundred of Cummings’s wittiest and most profound poems, harvested from thirty-five of the most radically creative years in contemporary American poetry. These poems exhibit all the extraordinary lyricism, playfulness, technical ingenuity, and compassion for which Cummings is famous. They demonstrate beautifully his extrapolations from traditional poetic structures and his departures from them, as well as the unique synthesis of lavish imagery and acute artistic precision that has won him the adulation and respect of critics and poetry lovers everywhere.
249	Moominland Midwinter	1983	10	9	199	https://images.gr-assets.com/books/1443655520l/443103.jpg	This children's story is one of a series of books about the Moomins that blend magic, humour and adventure in the setting of the small, but ever-changing Moominvalley.
228	Secret History	1993	7	9	185	https://images.gr-assets.com/books/1453756231l/28698036.jpg	Mistborn: Secret History is a companion story to the original Mistborn trilogy. As such, it contains HUGE SPOILERS for the books Mistborn (The Final Empire), The Well of Ascension, and The Hero of Ages. It also contains very minor spoilers for the book The Bands of Mourning. Mistborn: Secret History builds upon the characterization, events, and worldbuilding of the original trilogy. Reading it without that background will be a confusing process at best. In short, this isn’t the place to start your journey into Mistborn. (Though if you have read the trilogy—but it has been a while—you should be just fine, so long as you remember the characters and the general plot of the books.) Saying anything more here risks revealing too much. Even knowledge of this story’s existence is, in a way, a spoiler. There’s always another secret.
229	Annals of the Former World	2000	9	55	186	https://images.gr-assets.com/books/1386924382l/78.jpg	The Pulitzer Prize-winning view of the continent, across the fortieth parallel and down through 4.6 billion yearsTwenty years ago, when John McPhee began his journeys back and forth across the United States, he planned to describe a cross section of North America at about the fortieth parallel and, in the process, come to an understanding not only of the science but of the style of the geologists he traveled with. The structure of the book never changed, but its breadth caused him to complete it in stages, under the overall title Annals of the Former World.Like the terrain it covers, Annals of the Former World tells a multilayered tale, and the reader may choose one of many paths through it. As clearly and succinctly written as it is profoundly informed, this is our finest popular survey of geology and a masterpiece of modern nonfiction.Annals of the Former World is the winner of the 1999 Pulitzer Prize for Nonfiction.
230	Night Game	1996	9	23	187	https://images.gr-assets.com/books/1435236547l/313259.jpg	Gator Fontenot of the Special Forces paranormal squad must reel in the elusive Iris "Flame" Johnson, a victim of the same horrific experiments that warped Gator--and a red-haired weapon of unimaginable destructive powers bent on revenge in the sultry bayous of New Orleans. But can two people haunted by violent betrayals trust the passion that soon ignites between them? Or is one of them just playing another seductive and deadly night game?
231	Safe Harbor	2004	10	9	187	https://images.gr-assets.com/books/1367976485l/287630.jpg	One of seven daughters in a line of extraordinary women, Hannah Drake has been the elusive object of affection for Jonas Harrington for as long as the rugged sheriff can remember. If only the stunning supermodel was driven by a passion other than her career. But Jonas isn t the only one with desires for Hannah.From the shadows has emerged a vengeful figure who stalks the beauty with one terrifying purpose: to strip her of all she is and destroy her. Only one man was destined as her protector. Now, out of a storm of danger, Jonas must guide the woman he loves from a sinister darkness that threatens not only Hannah, but the entire Drake family.
247	Heckedy Peg	1992	0	32	198	https://images.gr-assets.com/books/1348586621l/285672.jpg	In this story, seven sweet children are transformed by an evil witch into specific types of food. “The inherent drama of the story, combined with the haunting images the art provides, gives the picture book a timeless quality.”--Booklist
248	Moominvalley in November	2003	0	9	199	https://images.gr-assets.com/books/1312008049l/79547.jpg	Tove Jansson's Moomin characters and books are admired the world over. In the United States the series beginning with Finn Family Moomintroll (first published in English in 1945) has accumulated generations of fans. Since Farrar, Straus and Giroux began reissuing the books in 1989, grateful readers old and new have been thrilled to have the stories available again. At last the final installment is being published – oddly, the only book that features none of the Moomin family themselves, though it does take place at their house. There familiar characters converge – Snufkin, the Hemulen, Fillyjonk, and others – seeking out the Moomins' welcoming company, only to find them absent. All remain at the house, all have very different personalities that clash often, but something about their homey cohabitation during the icy winter changes each visitor in a gratifying way. As The Times Literary Supplement put it, Moominvalley in November is "possibly the cleverest of the Moomin books."
232	Ruthless Game	2001	8	9	187	https://images.gr-assets.com/books/1282694512l/8335119.jpg	GhostWalker Kane Cannon's mission plunges him into a hot zone more personal than he anticipated: the hiding place of Rose Patterson-hunted fugitive, ex-lover, and a fellow GhostWalker desperate to save the life of her unborn child. Kane's Child.
235	Philothea, or an Introduction to the Devout Life	1994	10	15	188	https://images.gr-assets.com/books/1348297225l/604918.jpg	Since its first publication in 1609 this book has never gone out of print. It has always occupied a privileged position in the Church: no guide ever written provides so complete, so balanced and so practical an approach to the spiritual life. Written for the layman surrounded by worldliness, this is a masterpiece of mystical and devotional literature, by a great and much loved Doctor of the Church. This book does what many similar books fail to do, teach the reader to grow in holiness, step by simple step.
236	Have a Nice Day!: A Tale of Blood and Sweatsocks	2000	10	1	189	https://images.gr-assets.com/books/1434377269l/340587.jpg	Mick Foley is a nice man, a family man who loves amusement parks and eating ice cream in bed. So how to explain those Japanese death matches in rings with explosives, golden thumbtacks and barbed wire instead of rope? The second-degree burn tissue? And the missing ear that was ripped off during a bout-in which he kept fighting? Here is an intimate glimpse into Mick Foley's mind, his history, his work and what some might call his pathology. Now with a bonus chapter summarizing the past 15 months-from his experience as a bestselling author through his parting thoughts before his final match. A tale of blood, sweat, tears and more blood-all in his own words-straight from the twisted genius behind Cactus Jack, Dude Love, and Mankind.
237	The Autobiography of Martin Luther King, Jr.	1998	8	17	190	https://images.gr-assets.com/books/1386926572l/42547.jpg	Using Stanford University's voluminous collection of archival material, including previously unpublished writings, interviews, recordings, and correspondence, King scholar Clayborne Carson has constructed a remarkable first-person account of Dr. King's extraordinary life. Beginning with his boyhood, the book portrays King's education as a minister, his ascendancy as a leader of the Montgomery bus boycott, his pivotal role in the civil rights demonstrations in Washington, D.C., and his complex relationship with the Kennedy brothers, LBJ, Malcolm X, and numerous other leading figures of the day.
238	Why We Can't Wait	1991	9	1	190	https://images.gr-assets.com/books/1348700217l/160939.jpg	Letter from Birmingham Jail, April 16, 1963“Perhaps it is easy for those who have never felt the stinging darts of segregation to say, ‘Wait.’ But when you have seen vicious mobs lynch your mothers and fathers at will and drown your sisters and brothers at whim…when you see the vast majority of twenty million Negro brothers smothering in an airtight cage of poverty in the midst of an affluent society; when you suddenly find your tongue twisted and your speech stammering as you seek to explain to your six-year-old daughter why she can’t go to the public amusement park that has just been advertised on television, and see tears welling up in her eyes when she is told that Funtown is closed to colored children, and see ominous clouds of inferiority beginning to form in her little mental sky…when you take a cross-country drive and find it necessary to sleep night after night in the uncomfortable corners of your automobile because no motel will accept you…when…your wife and mother are never given the respected title ‘Mrs.’…when you are forever fighting a degenerating sense of ‘nobodiness’—then you will understand why we find it difficult to wait. There comes a time when the cup of endurance runs over, and men are no longer willing to be plunged into the abyss of despair.” \n\nWhy We Can’t Wait \n\nMartin Luther King’s Classic Exploration of the events and forces behind the Civil Rights Movement
239	Strength to Love	1981	9	1	190	https://images.gr-assets.com/books/1388620769l/52101.jpg	A collection of sermons by this martyred Black American leader which explains his convictions in terms of the conditions and problems of contemporary society.
240	The Cost of Discipleship	1995	10	8	191	https://images.gr-assets.com/books/1348281510l/174834.jpg	One of the most important theologians of the twentieth century illuminates the relationship between ourselves and the teachings of Jesus in this classic text on ethics, humanism, and civic duty.What can the call to discipleship, the adherence to the word of Jesus, mean today to the businessman, the soldier, the laborer, or the aristocrat? What did Jesus mean to say to us? What is his will for us today? Drawing on the Sermon on the Mount, Dietrich Bonhoeffer answers these timeless questions by providing a seminal reading of the dichotomy between "cheap grace" and "costly grace." "Cheap grace," Bonhoeffer wrote, "is the grace we bestow on ourselves...grace without discipleship....Costly grace is the gospel which must be sought again and again, the girl which must be asked for, the door at which a man must know....It is costly because it costs a man his life, and it is grace because it gives a man the only true life."The Cost of Discipleship is a compelling statement of the demands of sacrifice and ethical consistency from a man whose life and thought were exemplary articulations of a new type of leadership inspired by the Gospel, and imbued with the spirit of Christian humanism and a creative sense of civic duty.
242	Awareness: The Key to Living in Balance	2001	10	13	193	https://images.gr-assets.com/books/1316130459l/97010.jpg	Underlying all meditation techniques, including martial arts-and in fact underlying all great athletic performances-is a quality of being awake and present to the moment, a quality that Osho calls awareness. Once we can identify and understand what this quality of awareness is, we have the key to self-mastery in virtually every area of our lives.According to great masters like Lao Tzu or Buddha, most of us move through our lives like sleepwalkers. Never really present in what we are doing, never fully alert to our environment, and not even aware of what motivates us to do and say the things we do.At the same time, all of us have experienced moments of awareness-or awakening, to use another-in extraordinary circumstances. On the road, in a sudden and unexpected accident, time seems to stop and one is suddenly aware of every movement, every sound, every thought. Or in moments that touch us deeply-welcoming a new baby into the world for the first time, or being with someone at the moment of death.Awareness, says Osho, is the key to being self-directed, centered, and free in every aspect of our lives. In this book, Osho teaches how to live life more attentively, mindfully, and meditatively, with love, caring and consciousness.OSHO challenges readers to examine and break free of the conditioned belief systems and prejudices that limit their capacity to life in all its richness. He has been described by the Sunday Times of London as one of the "1000 Makers of the 20th Century" and by Sunday Mid-Day (India) as one of the ten people-along with Gandhi, Nehru, and Buddha-who have changed the destiny of India. More than a decade after his death in 1990, the influence of his teachings continues to expand, reaching seekers of all ages in virtually every country of the world.
243	The Mistress	2000	9	40	194	https://images.gr-assets.com/books/1358807432l/17251444.jpg	The final book in The Original Sinners Series - The Red Years.There's punishment-and then there's vengeance.Nora Sutherlin is being held, bound and naked. Under different circumstances, she would enjoy the situation immensely, but her captor isn't interested in play. Or pity.As the reality of her impending peril unfolds, Nora becomes Scheherazade, buying each hour of her life with stories-sensual tales of Søren, Kingsley and Wesley, each of whom has tempted and tested and tortured her in his own way. This, Nora realizes, is her life: nothing so simple, so vanilla, as a mere love triangle for her. It's a knot in a silken cord, a tangled mass of longings of the body and the heart and the mind. And it may unravel at any moment.But in Nora's world, no one is ever truly powerless-a cadre of her friends, protectors and lovers stands ready to do anything to save her, even when the only certainty seems to be sacrifice and heartbreak....
244	Echo	2002	8	56	195	https://images.gr-assets.com/books/1460587774l/22749539.jpg	Lost and alone in a forbidden forest, Otto meets three mysterious sisters and suddenly finds himself entwined in a puzzling quest involving a prophecy, a promise, and a harmonica.   Decades later, Friedrich in Germany, Mike in Pennsylvania, and Ivy in California each, in turn, become interwoven when the very same harmonica lands in their lives. All the children face daunting challenges: rescuing a father, protecting a brother, holding a family together. And ultimately, pulled by the invisible thread of destiny, their solo stories converge in an orchestral crescendo.
245	The Best of Roald Dahl	1990	9	58	196	https://images.gr-assets.com/books/1388199583l/6330.jpg	The Best of Roald Dahl is a collection of 25 of Roald Dahl's short stories. This collection brings together Dahl’s finest work, illustrating his genius for the horrific and grotesque which is unparalleled.Contents- Madame Rosette- Man from the South- The Sound Machine- Taste- Dip in the Pool- Skin- Edward the Conqueror- Lamb to the Slaughter- Galloping Foxley- The Way Up to Heaven- Parson's Pleasure- The Landlady- William and Mary- Mrs. Bixby and the Colonel's Coat- Royal Jelly- Georgy Porgy- Genesis and Catastrophe- Pig- The Visitor- Claud's Dog (The Ratcatcher, Rummins, Mr. Hoddy, Mr. Feasy, Champion of the World)- The Great Switcheroo- The Boy Who Talked with Animals- The Hitchhiker- The Wonderful Story of Henry Sugar- The Bookseller
246	Lonesome Dove	1988	8	58	197	https://images.gr-assets.com/books/1378573063l/256008.jpg	A love story, an adventure, and an epic of the frontier, Larry McMurtry’s Pulitzer Prize— winning classic, Lonesome Dove, the third book in the Lonesome Dove tetralogy, is the grandest novel ever written about the last defiant wilderness of America.Journey to the dusty little Texas town of Lonesome Dove and meet an unforgettable assortment of heroes and outlaws, whores and ladies, Indians and settlers. Richly authentic, beautifully written, always dramatic, Lonesome Dove is a book to make us laugh, weep, dream, and remember.Series in order of publication:Lonesome Dove (1985)Streets of Laredo (1993)Dead Man's Walk (1995)Comanche Moon (1997)Series in order of internal chronology:Dead Man's Walk – set in the early 1840sComanche Moon – set in the 1850–60sLonesome Dove – set in mid-to-late 1870sStreets of Laredo – set in the early 1890s
250	Disney's Mulan Classic Storybook (The Mouse Works Classics Collection)	1998	9	32	200	https://images.gr-assets.com/books/1387743897l/644990.jpg	Based on a Chinese folktale, a young girl dresses up like a boy and goes off to battle in order to keep her elderly father safe at home. Along the way she meets a cast of unforgettable characters who teach her all about acceptance and self-respect. Full color.
251	Disney's the Lion King	1994	10	32	201	https://images.gr-assets.com/books/1387751618l/1693617.jpg	Relive Walt Disney's 32nd full-length animated feature in this beautiful, hardcover, 96-page classic storybook that accurately captures the movie magic and places it right into a child's hands. With every turn of a page, adventure unfolds to create memories that will last a lifetime.
253	Fair Game	1996	10	9	203	https://images.gr-assets.com/books/1327472384l/7942786.jpg	Patricia Briggs, the #1 "New York Times" bestselling author of the Mercy Thompson novels, "always enchants her readers." (Lynn Viehl, "New York Times" bestselling author) Now her Alpha and Omega series-set in a world of shifting shapes, loyalty, and passion- brings werewolves out of the darkness and into a society where fear and prejudice could make the hunters prey...They say opposites attract. And in the case of werewolves Anna Latham and Charles Cornick, they mate. The son-and enforcer-of the leader of the North American werewolves, Charles is a dominant alpha. While Anna, an omega, has the rare ability to calm others of her kind.Now that the werewolves have revealed themselves to humans, they can't afford any bad publicity. Infractions that could have been overlooked in the past must now be punished, and the strain of doing his father's dirty work is taking a toll on Charles.Nevertheless, Charles and Anna are sent to Boston, when the FBI requests the pack's help on a local serial killer case. They quickly realize that not only the last two victims were werewolves-all of them were. Someone is targeting their kind. And now Anna and Charles have put themselves right in the killer's sights...
266	Night Light	1986	0	3	216	https://images.gr-assets.com/books/1433648319l/183092.jpg	An era unlike any in modern civilization is descending without lights, electronics, running water, or automobiles. As a global blackout lengthens into months, the neighbors of Oak Hollow grapple with a chilling realization: the power may never return.Survival has become a lifestyle. When two young thieves break into the Brannings' home and clean out the food in their pantry, Jeff Branning tracks them to a filthy apartment and discovers a family of children living alone, stealing to stay alive. Where is their mother? The search for answers uncovers a trail of desperation and murder . . . and for the Brannings, a powerful new purpose that can transform their entire community - and above all, themselves.
254	The Black Rose	2000	8	46	204	https://images.gr-assets.com/books/1370568610l/18044418.jpg	Princess Wilhelmina Diamante, by birthright, should be the next queen of Aridale, but instead her younger sister, Edolie, has been chosen as queen for reasons unknown to anyone but the king and queen. When Edolie's engagement to Prince Jerome of a neighboring kingdom is announced, Wilhelmina soon finds herself in a mist of secrets and lies. Things only get more complicated when Wilhelmina finds out that she is part of a curse and the only way to end it may cost her life.
255	The Science of Mind	1998	8	13	205	https://images.gr-assets.com/books/1349012687l/149197.jpg	Ernest Holmes (1887-1960) founded Religous Science, part of the New Thought movement. Schooled in Christian Science, he moved to Los Angeles in 1912. Holmes published his first book, Creative Mind in 1919, and followed it up with The Science of Mind in 1926. Holmes had an immense influence on New Age beliefs, particularly his core philosophy that we create our own reality. This is the text of the first edition of The Science of Mind. A revised edition of this book was published in 1938.
256	Dream Traveler	2003	9	29	206	https://images.gr-assets.com/books/1328213129l/13122386.jpg	When high school student Jamie Richards falls asleep she’s bounced through time into the future. This future shows a horrifying conclusion. 300,000 years from today, advanced spirits called Phelastians are finally making peace with ape-like creatures called Dwellers. Formality requires a twenty-first century human be present as witness to the signing of the treaty. They recruit Jamie. When a Dweller overlord sabotages the celestial link connecting Jamie to her real time, she vanishes from the signing, crumbles the negotiations, and flies off on a series of mind-bending, alternate-reality journeys. She has one chance to make things right, a desperate gamble that will either save the universe or destroy everything going forward from the beginning of time. Book #1 – The Imagination Series ~ SILENT INVASION Book #2 – The Imagination Series ~ INSECTLANDBook #3 – The Imagination Series ~ DREAM TRAVELER
291	Hard Love	2001	8	23	234	https://images.gr-assets.com/books/1430249942l/23374189.jpg	Days after their wedding, Blake and Erica Landon embark on their honeymoon-a journey that deepens their bond and promises to fade the scars of their past.Just when their troubles seem safely behind them, scandal surrounding would-be Governor Daniel Fitzgerald's election threatens their newfound peace. Back home, Blake finds himself at the center of the controversy, haunted by the transgressions of his hacker past that he has no wish to relive.With Blake's freedom at stake and their future in peril, Erica will stop at nothing to clear his name. But when Blake defies the authorities and refuses to seek the truth, their world gradually begins to crumble. Will he let his past win? Or can Erica convince him that their life together is worth fighting for-now more than ever...
275	Bonds That Make Us Free: Healing Our Relationships, Coming to Ourselves	2001	8	1	224	https://images.gr-assets.com/books/1414559852l/310194.jpg	Life can be sweet. Our relationships with friends, spouses, colleagues, and family members can be wonderfully rewarding. They can also bring heartache, frustration, anxiety, and anger. We all know the difference between times when we feel open, generous and at ease with people versus times when we are guarded, defensive, and on edge. Why do we get trapped in negative emotions when it's clear that life is so much fuller and richer when we are free of them?Bonds That Make Us Free is a ground-breaking book that suggests the remedy for our troubling emotions by addressing their root causes. You'll learn how, in ways we scarcely suspect, we are responsible for feelings like anger, envy, and insecurity that we have blamed on others. (How many times have you said, "You're making me mad?") Even though we fear to admit this, it is good news. If we produce these emotions, it falls within our power to stop them. But we have to understand our part in them far better than we do, and that is what this remarkable book teaches. Because the key is seeing truthfully, the book itself is therapeutic. As you read and identify with the many true stories of people who have seen a transformation in their lives, you will find yourself reflecting with fresh honesty upon your relationships. This will bond you to others in love and respect and lift you out of the negative thoughts and feelings that have held you captive. You will feel your heart changing even as you read. "It would not be accurate to describe this book as supplying the truths upon which we must build our lives," writes author C. Terry Warner. "Instead it shows how we can put ourselves in that receptive, honest, and discerning condition that will enable us, any of us, to find these truths on our own." Finding these truths is the key to healing our relationships and coming to ourselves, and Bonds That Make Us Free starts us on that great journey.
257	The Outpost	2001	10	23	207	https://images.gr-assets.com/books/1506912798l/36307982.jpg	Trapped in his tiny mountain cabin, she didn't expect to fall for his big heart.Exposing a prominent criminal family with an investigative news report didn’t exactly work out the way Sabrina had hoped. Instead of basking in the glory of her article’s success, she’s on the run from a powerful man who wants her dead. To stay safe, she’s forced to trade one bad situation for another. Stuck in the Montana wilderness, she’s secluded from anything resembling civilization or the modern-day world. The only good thing about her situation is the gorgeous mountain man assigned to protect her. Too bad he isn’t the slightest bit interested in a city girl like her.Beau likes his life quiet and simple. Give him a peaceful day hiking in the woods with his dog, and he’s a happy man. He has no use for large crowds, noisy cities or dramatic women. So when a hotshot reporter rolls into town, dragging her big-time problems with her, he should have run for the hills. Instead, he volunteered to keep her safe. Bringing her into his world won’t be easy, but if he can convince her that Montana isn’t as terrifying as she believes, they might just be the perfect match.
258	Imperium	1994	9	1	208	https://images.gr-assets.com/books/1170533405l/59659.jpg	Imperium is the story of an empire: the constellation of states that was submerged under a single identity for most of the twentieth century - the Union of Soviet Socialist Republics. This is Kapuscinski's vivid, compelling and personal report on the life and death of the Soviet superpower, from the entrance of Soviet troops into his hometown in Poland in 1939, through his journey across desolate Siberia and the republics of Central Asia in the 1950s and 60s, to his wanderings over the vast Soviet lands - from Poland to the Pacific, the Arctic Circle to Afghanistan - in the years of the USSR's decline and final disintegration in 1991.
259	Law of Success	1989	8	33	209	https://images.gr-assets.com/books/1312050412l/105232.jpg	Teaching, for the First Time in the History of the World, the True Philosophy upon which all Personal Success is Built.“You Can Do It if You Believe You Can!”THIS is a course on the fundamentals of Success.Success is very largely a matter of adjusting one’s self to the ever-varying and changing environments of life, in a spirit of harmony and poise.
260	Street Dreams	2003	10	51	210	https://images.gr-assets.com/books/1316131416l/564058.jpg	Love, Betrayal and Loyalty on the Streets of Harlem\n\nDaruis, a.k.a. Rio, the only child of a singer turned alcoholic, feels he has nothing to hold on to except the idea of escaping the ghetto. Years ago, he took a gun charge for a friend and did some prison time. Unable to find a job when he gets out, Rio turns to hustling as a way out. In the meantime, Rio finds escape in the arms of his soulmate, Trinity.When Trinity's mother died, her abusive father looks to her to play the role of house wife and bedmate. Trinity finds strength to endure in Rio's arms. Together they vow to do whatever it takes to make it out of the ghetto. But soon they find their backs against the wall when the streets come to claim their due.
261	Psychotherapy	2001	8	49	211	https://images.gr-assets.com/books/1320545738l/566082.jpg	In twelve essays—eight of which appear here in English for the first time—the internationally known analyst Marie-Louise von Franz explores important aspects of psychotherapy from a Jungian perspective. She draws on her many years of practical experience in psychotherapy, her intimate knowledge of Jung's methods and theories, and her wide-ranging interests in fields such as mythology, alchemy, science, and religion to illumine these varied topics:    •  Projection   •  Transference   •  Dream interpretation    •  Self-realization   •  Group psychology    •  Personality types    •  Active imagination    •  The therapeutic use of hallucinogenic drugs    •  The choice of psychotherapy as a profession    •  The role of religious experience in psychological healing
262	Standing for Something: 10 Neglected Virtues That Will Heal Our Hearts and Homes	2001	9	8	212	https://images.gr-assets.com/books/1388192142l/596259.jpg	In this national bestseller, the president of The Church of Jesus Christ of Latter-day Saints, Gordon B. Hinckley, has created a classic look at the values that can change our world--and how to stand up for them. Drawing on anecdotes from his much-admired life of faith and service, as well as examples from American culture today, he examines ten virtues that have always illuminated the path to a better world: love, honesty, morality, civility, learning, forgiveness and mercy, thrift and industry, gratitude, optimism, and faith. He then shows how the two guardians of virtue--marriage and the family--can keep us on that path, even in difficult times. Standing for Something is an inspiring blueprint for what we all can do--as individuals, as a nation, and as a world community--to rediscover the values and virtues that have historically made us strong and that will lead us to a brighter future.
263	Shadows	1996	8	9	213	https://images.gr-assets.com/books/1333769509l/13581249.jpg	Duskies are born in a dangerous world as servants of the lords of light and shadow, but when creatures known as the Sathen threaten all the races, a Duskie named Nexa finds herself caught in the middle of a perilous journey to save her people and unite the races as one. Facing dangerous odds, prejudice, and violence, Nexa finds strength in those around her and, ultimately, love.
264	Principles of Neural Science	2000	10	54	214	https://images.gr-assets.com/books/1348620084l/826396.jpg	This text studies the brain, its structure, function and development. It discusses neuroanatomy, cell and molecular mechanisms and signaling through a cognitive approach to behaviour. It features an expanded treatment of the nervous system, neurological and psychiatric diseases and perception.
265	Stand	1980	7	23	215	https://images.gr-assets.com/books/1492698478l/26124453.jpg	A Bleeding Stars Standalone Novel"PURE BEAUTY IN WORDS. Stand shatters and SINGS to the SOUL, making the heart both soar and bleed." ~Karen, Bookalicious Babes BlogZachary Kennedy has never been known as a fighter, but he’ll never regret fighting for her…I’m Zee Kennedy.Quiet. Reserved. Predictable.When my brother died, everyone thought I was just the good guy who stepped up to take his place in the band.No one knew what I was hiding. The one thing I’ve been fighting for.For seven years, I’ve never lost focus.Not until one chance encounter with Alexis Kensington.Now she’s become my greatest temptation.I knew better than to touch her, but now that I’ve had a taste, I can’t get enough.Her kiss becomes my air. Her body my salvation.She needed a savior and somehow she became mine.Taking her was a betrayal. But keeping her means risking everything.One look at Alexis Kensington, and I know she’s worth the fight.Will my past continue to keep me down or will I finally find the strength to pull myself up and Stand…
282	A Fine and Pleasant Misery	1999	8	6	230	https://images.gr-assets.com/books/1388284636l/47841.jpg	A Fine and Pleasant MiseryMore witty cautionary tales of outdoor life, by everybody's favorite expert on the subject, Patrick F. McManus.
365	Goodnight Opus	1993	7	6	288	https://images.gr-assets.com/books/1344270569l/397277.jpg	Opus the penguin decides to leave routine behind and launches into a night-time adventure. Opus has always listened quietly while Grandma reads him his favourite bedtime story. But this time Opus decides to finish the story his way.
267	Sundancer	1982	8	14	217	https://images.gr-assets.com/books/1388350179l/1585431.jpg	From the outside, 13-year-old Alberta -- Bird -- looks like a typical teenager. She spends her days attending school, riding horses, and helping out on the farm where she lives with her Aunt Hannah. But Bird is anything but typical. For one, she hears things that no one else hears, like the thoughts of the various animals she befriends. For another, she doesn't talk. Although it causes some problems at school, and with the kids who come to the farm to train, Bird's unwillingness to speak isn't a big issue for her aunt. In fact, when a new "problem" horse arrives at the farm, Hannah realizes that the strange and silent Bird is the only one who can break through his defenses. But when Bird's mother Eva decides to pay a visit -- with a new boyfriend and Bird's younger sister in tow -- old wounds are opened and everything changes. Shelley Peterson's "Sundancer" is a remarkable story about the damage that people can do to each other -- and to the creatures that live with us -- and the many ways that we can heal.
268	The Night Before Christmas	1996	10	5	218	https://images.gr-assets.com/books/1388370094l/196970.jpg	Who's that peeking out of the sleigh? As St. Nick and eight tiny reindeer descend through a brilliant night sky onto the roof of a Victorian house in a snowy New England village, the famous Christmas poem begins. The father of the family narrates the words just as Clement Moore wrote them, and artist Jan Brett captures the spirit in brilliant illustrations that reflect this memorable night. Visually she extends this favorite Christmas story for children, who will delight in watching the two mischievous stowaways from the North Pole enthusiastically exploring the sacks of gifts on the roof while St. Nick, unaware, journeys down the chimney... until the toys spill down onto the lawn and he turns with a jerk!Antique toys and exquisite ornaments frame the borders in which sometimes the father, St. Nick, or the family cat and dog look on, as the story unfolds.A unique and beautiful edition to be cherished for years to come by all the family, especially the youngest, who find the night before Christmas perhaps the most exciting night of the year.
269	Shatter	1986	9	23	219	https://images.gr-assets.com/books/1455899300l/28801469.jpg	Maverick trauma surgeon Ashton “Snow” Frost keeps the world at a distance, relying only on his three closest friends to keep him connected. But when a ghost from their past returns to Cincinnati, Snow stands to lose everyone he loves. Framed for murder and reeling from attacks on his friends, Snow is pushed to his breaking point.Jude Torres won’t let the doc shatter. The paramedic has been attracted to the doctor since he first laid eyes on him at the hospital, even if the arrogant, solitary man doesn’t fit into any of his plans. One hot, reckless kiss shows that Snow isn’t who he appears to be. And one night together will never be enough. Jude will fight for the doc.Fight to keep him whole. Fight to keep him safe. Fight to simply keep him.
270	Dare	1965	8	9	220	https://images.gr-assets.com/books/1431450449l/25527157.jpg	Courage could cost him everything. Third Blade Leith Torren never questions his orders or his loyalty to King Respen until an arrow wound and a prairie blizzard drive him to the doorstep of the girls whose family he once destroyed.Their forbidden faith and ties to the Resistance could devastate their family a second time. Survival depends on obedience, but freedom beckons. How far does he dare go to resist the king and his Blades?No matter what Leith chooses, one thing is certain.Someone will die.
271	Lost Girls	2001	10	24	221	https://images.gr-assets.com/books/1441079814l/26123233.jpg	Two girls go missing. Only one will return.  The couple that offers the highest amount will see their daughter again. The losing couple will not. Make no mistake. One child will die. When nine-year-old best friends Charlie and Amy disappear, two families are plunged into a living nightmare. A text message confirms the unthinkable; that the girls are the victims of a terrifying kidnapping. And when a second text message pits the two families against each other for the life of their children, the clock starts ticking for D.I. Kim Stone and the squad. Seemingly outwitted at every turn, as they uncover a trail of bodies, Stone realises that these ruthless killers might be the most deadly she has ever faced. And that their chances of bringing the girls home alive, are getting smaller by the hour… Untangling a dark web of secrets from the families’ past might hold the key to solving this case. But can Kim stay alive long enough to do so? Or will someone’s child pay the ultimate price?
272	Blood Lines	1999	8	24	221	https://images.gr-assets.com/books/1472766635l/31820148.jpg	How do you catch a killer who leaves no trace?A victim killed with a single, precise stab to the heart appears at first glance to be a robbery gone wrong. A caring, upstanding social worker lost to a senseless act of violence. But for Detective Kim Stone, something doesn’t add up. When a local drug addict is found murdered with an identical wound, Kim knows instinctively that she is dealing with the same killer. But with nothing to link the two victims except the cold, calculated nature of their death, this could be her most difficult case yet. Desperate to catch the twisted individual, Kim’s focus on the case is threatened when she receives a chilling letter from Dr Alex Thorne, the sociopath who Kim put behind bars. And this time, Alex is determined to hit where it hurts most, bringing Kim face-to-face with the woman responsible for the death of Kim’s little brother – her own mother. As the body count increases, Kim and her team unravel a web of dark secrets, bringing them closer to the killer. But one of their own could be in mortal danger. Only this time, Kim might not be strong enough to save them…
287	Protect and Defend	1992	10	58	231	https://images.gr-assets.com/books/1429284131l/504420.jpg	"New York Times" bestselling author Vince Flynn returns with his most explosive political thriller yet. A tour de force of action-packed suspense, "Protect and Defend" delivers an all-too-realistic and utterly compelling vision of nations navigating the minefield of international intrigue. A true "heavyweight in the political thriller arena" ("Minneapolis Star Tribune"), Vince Flynn has created a flesh-and-blood hero that readers can cheer for and a "finger-blistering page-turner" they won't dare put down.In "Protect and Defend, " the action begins in the heart of Iran, where billions of dollars are being spent on the development of a nuclear program. No longer willing to wait for the international community to stop its neighboring enemy, Israel launches one of the most creative and daring espionage operations ever conceived. The attack leaves a radioactive tomb and environmental disaster in the middle of Iran's second largest city. An outraged Iranian government publicly blames both Israel and the United States for the attack and demands retribution. Privately, Iran's bombastic president wants much more. He wants America and Israel to pay for their aggression with blood.Enter Mitch Rapp, America's top counterterrorism operative. Used to employing deception, Rapp sees an opportunity where others see only Iranian reprisals that could leave thousands of Americans dead. Rapp convinces President Josh Alexander to sign off on a risky operation that will further embarrass the Iranian government and push their country to the brink of revolution. As part of the plan, CIA director Irene Kennedy is dispatched to the region for a clandestine meeting with Azad Ashani, her Iranian counterpart.But Rapp isn't the only one hatching plans. Iran's President Amatullah has recruited Hezbollah master terrorist Imad Mukhtar to do his dirty work. For decades Mukhtar has acted as a surrogate for Iran, blazing a trail of death and destruction across the Middle East and beyond. When Kennedy's meeting with Ashani goes disastrously wrong, Rapp and Mukhtar are set on a collision course that threatens to engulf the entire region in war. With the clock ticking, Rapp is given twenty-four hours, no questions asked, to do whatever it takes to stop Mukhtar, and avert an unthinkable catastrophe.
286	Executive Power	2004	0	58	231	https://images.gr-assets.com/books/1442431876l/777211.jpg	CIA superagent Mitch Rapp battles global terrorism in a high-octane follow-up to The New York Times bestselling Separation of Power -- another chillingly authentic adventure from the master of the political thriller. Mitch Rapp's cover has been blown. After leading a team of commandos deep into Iraq to prevent Saddam Hussein from joining the nuclear arms race, he was publicly hailed by the president as the single most important person in the fight against terrorism. But after years of working covertly behind the scenes, Rapp now lives in the glare of the public spotlight, lauded by the nation and an easy target for virtually every terrorist from Jakarta to London.As special advisor on counterterrorism to CIA director Dr. Irene Kennedy, Rapp is ready to fight the war on terrorism from CIA headquarters rather than the front line. That is, until a platoon of Navy SEALs, sent to the Philippines to save an American family kidnapped by radical Islamic terrorists, is caught in a deadly ambush. The mission had been top secret -- so who told the enemy? All evidence points to the State Department and the Philippine embassy. But a greater threat still lurks. An unknown assassin working closely with the highest powers in the Middle East is bent on igniting war. Now, with the world watching his every move, will Rapp be able to overcome this anonymous foe and once again keep the flames of war from raging?Transporting us into an intriguing geopolitical puzzle full of deadly motives, covert operatives, and all the true-to-life insider detail we've come to expect from Vince Flynn, "Executive Power" is a high-flying story that delivers shattering suspense with the velocity of a 9mmbullet.
273	Emergence	1990	9	53	222	https://images.gr-assets.com/books/1469268747l/31201651.jpg	Chanticleer Cygnus Award winner 2015“…Knutsen’s book is a compelling read for those who like a dash of science fiction in their whodunits…. A fast paced mystery with a unique and startling premise. This thought-provoking and intriguing novel crosses genres to create a great read that takes place in the Pacific Northwest. Highly Recommended.” Chanticleer Book ReviewsJim Post, the wealthy leader of Compass Enterprises has always been a man of mystery. The remains of a body are found in the ashes of Post’s home in rural southwest Washington State. Whose body is it? Was it murder? Jeff Pierce, Jim’s closest associate, aided by an Artificial Intelligence program, can only disclose part of what he knows about Jim and Compass as the police try to sort out what has happened. Are the motives behind this tragedy greed and power, or are there secrets at Compass that could change everyone’s lives forever?
292	The Sacrifice	1999	7	16	235	https://images.gr-assets.com/books/1340818231l/13539941.jpg	The sickness destroyed everyone over the age of fourteen. All across London diseased adults are waiting, hungry predators with rotten flesh and ravaged minds.Small Sam and his unlikely ally, The Kid, have survived. They’re safe with Ed and his friends at the Tower of London, but Sam is desperate to find his sister.Their search for Ella means Sam and The Kid must cross the forbidden zone. And what awaits them there is more terrifying than any of the horror they’ve suffered so far . . .
274	The Crimson Crown	1990	9	9	223	https://images.gr-assets.com/books/1398141199l/17428641.jpg	A thousand years ago, two young lovers were betrayed-Alger Waterlow to his death, and Hanalea, Queen of the Fells, to a life without love. Now, once again, the Queendom of the Fells seems likely to shatter apart. For young queen Raisa ana'Marianna, maintaining peace even within her own castle walls is nearly impossible; tension between wizards and Clan has reached a fevered pitch. With surrounding kingdoms seeking to prey on the Fells' inner turmoil, Raisa's best hope is to unite her people against a common enemy. But that enemy might be the person with whom she's falling in love.Through a complicated web of lies and unholy alliances, former streetlord Han Alister has become a member of the Wizard Council of the Fells. Navigating the cut-throat world of blue blood politics has never been more dangerous, and Han seems to inspire hostility among Clan and wizards alike. His only ally is the queen, and despite the perils involved, Han finds it impossible to ignore his feelings for Raisa. Before long, Han finds himself in possession of a secret believed to be lost to history, a discovery powerful enough to unite the people of the Fells. But will the secret die with him before he can use it? A simple, devastating truth concealed by a thousand-year-old lie at last comes to light in this stunning conclusion to the Seven Realms series.
276	Guess How Much I Love You	1996	10	32	225	https://images.gr-assets.com/books/1320457007l/301736.jpg	"Guess how much I love you," says Little Nutbrown Hare. Little Nutbrown Hare shows his daddy how much he loves him: as wide as he can reach and as far as he can hop. But Big Nutbrown Hare, who can reach farther and hop higher, loves him back just as much. Well then Little Nutbrown Hare loves him right up to the moon, but that's just halfway to Big Nutbrown Hare's love for him.
277	A Charmed Life	2000	9	46	226	https://images.gr-assets.com/books/1356163106l/16600108.jpg	New York s social darling just woke up in a nightmare: Oklahoma. Problem is, it s right where God wants her.Bella Kirkwood had it all A-list friends, Broadway in her backyard, Daddy s credit card. Then her father decided to trade in her mother for a newer model. After that, her mom fell in love with a man she met on the Internet and moved the family to Truman, Oklahoma. To a farm no less!But that s just the beginning of Bella s problems. Her semi-pro-wrestler stepdad signs up the family for a reality TV show. As if having a camera crew follow her around isn t bad enough, Bella discovers a conspiracy against the Truman High prom queen candidates.And that s before the arrival of the Fritz Family Carnival with its creepy clown.Bella is one skinny-mocha frappe away from a total meltdown. How can a girl go on when her charmed life is gone and God appears to be giving her the total smack down?"
278	Thunder Cake	1997	9	32	227	https://images.gr-assets.com/books/1348409463l/443633.jpg	A loud clap of thunder booms, and rattles the windows of Grandma's old farmhouse. "This is Thunder Cake baking weather," calls Grandma, as she and her granddaughter hurry to gather the ingredients around the farm. A real Thunder Cake must reach the oven before the storm arrives. But the list of ingredients is long and not easy to find . . . and the storm is coming closer all the time!Reaching once again into her rich childhood experience, Patricia Polacco tells the memorable story of how her grandma--her Babushka--helped her overcome her fear of thunder when she was a little girl. Ms. Polacco's vivid memories of her grandmother's endearing answer to a child's fear, accompanied by her bright folk-art illustrations, turn a frightening thunderstorm into an adventure and ultimately . . . a celebration!Whether the first clap of thunder finds you buried under the bedcovers or happily anticipating the coming storm, Thunder Cake is a story that will bring new meaning and possibility to the excitement of a thunderstorm.
279	Thank You, Mr. Falker	1998	7	32	227	https://images.gr-assets.com/books/1438482485l/216048.jpg	The real-life, classic story of a dyslexic girl and the teacher who would not let her fail. A perfect gift for teachers and for reading students of any age.Patricia Polacco is now one of America's most loved children's book creators, but once upon a time, she was a little girl named Trisha starting school. Trisha could paint and draw beautifully, but when she looked at words on a page, all she could see was jumble. It took a very special teacher to recognize little Trisha's dyslexia: Mr. Falker, who encouraged her to overcome her reading disability. Patricia Polacco will never forget him, and neither will we.This inspiring story is available in a deluxe slipcased edition, complete with a personal letter to readers from Patricia Polacco herself. Thank You, Mr. Falker will make a beautiful gift for the special child who needs encouragement&150or any special teacher who has made a difference in the child's life.
280	With the Old Breed: At Peleliu and Okinawa	1990	9	34	228	https://images.gr-assets.com/books/1328301261l/8123400.jpg	In The Wall Street Journal, Victor Davis Hanson named With the Old Breed one of the top five books on epic twentieth-century battles. Studs Terkel interviewed the author for his definitive oral history, The Good War. Now E. B. Sledge’s acclaimed first-person account of fighting at Peleliu and Okinawa returns to thrill, edify, and inspire a new generation.An Alabama boy steeped in American history and enamored of such heroes as George Washington and Daniel Boone, Eugene B. Sledge became part of the war’s famous 1st Marine Division–3d Battalion, 5th Marines. Even after intense training, he was shocked to be thrown into the battle of Peleliu, where “the world was a nightmare of flashes, explosions, and snapping bullets.” By the time Sledge hit the hell of Okinawa, he was a combat vet, still filled with fear but no longer with panic.Based on notes Sledge secretly kept in a copy of the New Testament, With the Old Breed captures with utter simplicity and searing honesty the experience of a soldier in the fierce Pacific Theater. Here is what saved, threatened, and changed his life. Here, too, is the story of how he learned to hate and kill–and came to love–his fellow man.
290	One by One	1996	9	19	233	https://images.gr-assets.com/books/1371882729l/17164393.jpg	'I need your help, Detective. Fire or water?' Detective Robert Hunter of the LAPD's Homicide Special Section receives an anonymous call asking him to go to a specific web address - a private broadcast. Hunter logs on and a show devised for his eyes only immediately begins. But the caller doesn't want Detective Hunter to just watch, he wants him to participate, and refusal is simply not an option. Forced to make a sickening choice, Hunter must sit and watch as an unidentified victim is tortured and murdered live over the Internet. The LAPD, together with the FBI, use everything at their disposal to electronically trace the transmission down, but this killer is no amateur, and he has covered his tracks from start to finish. And before Hunter and his partner Garcia are even able to get their investigation going, Hunter receives a new phone call. A new website address. A new victim. But this time the killer has upgraded his game into a live murder reality show, where anyone can cast the deciding vote.
311	Law of the Mountain Man	2000	9	21	249	https://images.gr-assets.com/books/1338055145l/417344.jpg	Smoke Jensen had just ridden into the middle of the fiercest range war in years. He had to either choose sides or return home on the back of a horse. Jud Vale's cutthroats tried to push him around - but Smoke had never taken kindly to being bullied.
281	The Psalms of David	2001	9	11	229	https://images.gr-assets.com/books/1347878503l/393466.jpg	The Psalms of DavidJames S. FreemantleForeword by Stephen FreemantleBack in print, The Psalms of David is a unique, beautifully illustrated edition of the revered religious work, also known as the Book of Psalms.The lifework of a little known genius, this facsimile edition of a magnificent hand-painted illumination of the Psalms of David is a stunning tribute to love and spiritual devotion.Born in India, James Freemantle traveled through the Middle East during his years in the British Army. Shortly after his second marriage, he began this hand-lettered, illustrated volume for his beloved bride, Clara. For the next thirty years, he periodically worked to transfer the psalms into a book that would physically match the lyrical beauty of the poetry.Throughout the book one finds the brilliantly colored blooms of India: the jacaranda, the flame-of-the-forest, huge yellow laburnums, brilliant poinsettias, and highly scented mimosa. The pages are alive with kingfishers and larks, drummers and hoppie butterflies, storks and pheasants. There are pictures of the lake near Freemantle's home, the nearby Brahmin temple, and the view from the train as he went up to school in the hills. Scenes from his travels in the army, Middle Eastern harbors and villages, and copies of illustrations from Victorian travel books reveal his draftsman's training in the accuracy of every detail.A labor of love, a work of art, a volume to treasure, this illuminated edition of the King James version of the Psalms of David is the perfect gift for all seasons.
283	Extreme Measures	2002	10	58	231	https://images.gr-assets.com/books/1349014258l/3313418.jpg	The latest pulse-pounding thriller by #1 "New York Times" bestselling phenomenon Vince Flynn explodes onto the scene with a deadly and charismatic hero fans will cheer for all the way to the last riveting page.Vince Flynn's thrillers, featuring counterterrorism operative Mitch Rapp, have dominated the imagination of readers everywhere. Time and again, Flynn has captured the secretive world of the fearless men and women, who, bound by duty, risk their lives in a covert war they must hide from even their own political leaders.Now, with Rapp away on assignment in Pakistan, CIA Director Irene Kennedy turns to his protegee Mike Nash. Nash has served his government honorably for sixteen years -- first as an officer in the Marine Corps and then as an operative in an elite counterterrorism team run by none other than Mitch Rapp. He has met violence with extreme violence and has never wavered in his fight against the jihads and their culture of death.Nash has fought the war on terrorism in secret without accolades or acknowledgement of his personal sacrifice. He has been forced to lie to virtually every single person he cares about, including his wife and children, but he has soldiered on with the knowledge that his hard work and lethal tactics has saved thousands of lives. But the one thing he never saw coming was that his own government was about to turn on him.In "Extreme Measures," Flynn introduces a modern-day patriot -- a hero who loves his country, even when it betrays itself. Using his insider knowledge of intelligence agencies and the military, Flynn once again delivers an all-too-real portrayal of a war that is that is waged every day by a handful of brave, devoted souls.Smart, fast-paced, and jaw-droppingly realistic, "Extreme Measures" is "the" political thriller of our time.
284	Transfer of Power	2003	7	58	231	https://images.gr-assets.com/books/1442152192l/184655.jpg	On a busy Washington morning, amid the shuffle of tourists and the brisk rush of government officials, the stately calm of the White House is shattered in a hail of gunfire. A group of terrorists has descended on the Executive Mansion, and gained access by means of a violent massacre that has left dozens of innocent bystanders murdered. Through the quick actions of the Secret Service, the president is evacuated to his underground bunker, but not before almost one hundred hostages are taken. While the politicians and the military leaders argue over how to negotiate with the terrorists, one man is sent in to break through the barrage of panicked responses and political agendas surrounding the chaotic crisis. Mitch Rapp, the CIA's top counterterrorism operative, makes his way into the White House and soon discovers that the president is not as safe as Washington's power elite had thought. Moving stealthily among the corridors and secret passageways of the White House, stepping terrifyingly close to the enemy, Rapp scrambles to save the hostages before the terrorists can extract the president from the safety of his bunker. In a race against time, Rapp makes a chilling discovery that could rock Washington to its core: someone within his own government is maneuvering in hopes that his rescue attempt will fail.
285	Separation of Power	2002	9	58	231	https://images.gr-assets.com/books/1314830847l/937249.jpg	CIA superagent Mitch Rapp is back in action in Vince Flynn's high-velocity New York Times bestseller.\n\n\n\nNewly appointed CIA director Dr. Irene Kennedy is the target of an inside plot to destroy her and prematurely end the American President's term. To make matters worse, Saddam Hussein is close to entering the nuclear arms race -- something Israel has vowed to stop. With the haunting specter of World War III looming, the President calls on his secret weapon: top counterterrorism operative Mitch Rapp. But with only two weeks to take out the nukes, Rapp is up against a ticking clock -- and impossible odds.
288	Holiness	1990	9	8	232	https://images.gr-assets.com/books/1430663316l/25473578.jpg	The twenty papers contained in this volume are a humble contribution to a cause which is exciting much interest in the present day,--I mean the cause of Scriptural holiness* It is a cause which everyone who loves Christ, and desires to advance His kingdom in the world, should endeavour to help forward. Everyone can do something, and I wish to add my mite. The reader will find little that is directly controversial in these papers. I have carefully abstained from naming modern teachers and modern books. I have been content to give the result of my own study of the Bible, my own private meditations, my own prayers for light, and my own reading of old divines. If in anything I am still in error, I hope I shall be shown it before I leave the world. We all see in part, and have a treasure in earthen vessels. I trust I am willing to learn.
289	The Caller	1979	9	19	233	https://images.gr-assets.com/books/1479306270l/29499458.jpg	The terrifying new thriller from the Sunday Times bestselling author of I AM DEATH. After a tough week, Tanya Kaitlin is looking forward to a relaxing night in, but as she steps out of her shower, she hears her phone ring.  The video call request comes from her best friend, Karen Ward.  Tanya takes the call and the nightmare begins. Karen is gagged and bound to a chair in her own living room.  If Tanya disconnects from the call, if she looks away from the camera, he will come after her next, the deep, raspy, demonic voice at the other end of the line promises her. As Hunter and Garcia investigate the threats, they are thrown into a rollercoaster of evil, chasing a predator who scouts the streets and social media networks for victims, taunting them with secret messages and feeding on their fear. 
293	The Fallen	2002	10	16	235	https://images.gr-assets.com/books/1369299670l/17402901.jpg	First the sickness rotted the adults' minds. Then their bodies. Now they stalk the streets, hunting human flesh.The Holloway crew are survivors. They've fought their way across London and made it to the Natural History Museum alive - just. But the fight will never end while the Enemy lives, unless there's another way. . .The kids at the museum are looking for a cure. All they need are medical supplies. To get them means a journey down unknown roads. Roads where not only crazed, hungry sickos hide in the shadows.SUDDENLY IT'S NOT SO CLEAR WHO - OR WHAT - THEY'RE FIGHTING.
295	The Master and Margarita	1987	9	58	236	https://images.gr-assets.com/books/1327867963l/117833.jpg	THE FIRST COMPLETE, ANNOTATED ENGLISH TRANSLATION OF MIKHAIL BULGAKOV'S COMIC MASTERPIECEAn audacious revision of the stories of Faust and Pontius Pilate, The Master and Margarita is recognized as one of the essential classics of modern Russian literature. the novel's vision of Soviet life in the 1930s is so ferociously accurate that it could not be published during its author's lifetime and appeared only in a censored edition in the 1960s. Its truths are so enduring that its language has become part of the common Russian speech.One hot spring, the devil arrives in Moscow, accompanied by a retinue that includes a beautiful naked witch and an immens talking black cat with a fondness for chess and vodka. The visitors quickly wreak havoc in a city that refuses to believe in either God or Satan. But they also bring peace to two unhappy Muscovites: one is the Master, a writer pilloried for daring to write a novel about Christ and Pontius Pilate; the other is Margarita, who loves the Master so deeply that she is willing literally to go to hell for him. What ensues is a novel of in exhaustible energy, humor, and philosophical depth, a work whose nuances emerge for the first time in Diana Burgin's and Katherine Tiernan O'Connor's splendid English version.(back cover)
309	Different Seasons	1994	0	16	248	https://images.gr-assets.com/books/1329662611l/39662.jpg	A "hypnotic" (The New York Times Book Review) collection of four novellas from Stephen King bound together by the changing of seasons, each taking on the theme of a journey with strikingly different tones and characters."The wondrous readability of his work, as well as the instant sense of communication with his characters, are what make Stephen King the consummate storyteller that he is," hailed the Houston Chronicle about Different Seasons.This gripping collection begins with "Rita Hayworth and the Shawshank Redemption," in which an unjustly imprisoned convict seeks a strange and startling revenge—the basis for the Best Picture Academy Award-nominee The Shawshank Redemption. Next is "Apt Pupil," the inspiration for the film of the same name about top high school student Todd Bowden and his obsession with the dark and deadly past of an older man in town. In "The Body," four rambunctious young boys plunge through the façade of a small town and come face-to-face with life, death, and intimations of their own mortality. This novella became the movie Stand By Me. Finally, a disgraced woman is determined to triumph over death in "The Breathing Method."
296	Blacksad	2003	10	37	237	https://images.gr-assets.com/books/1403207759l/7342071.jpg	Private investigator John Blacksad is up to his feline ears in mystery, digging into the backstories behind murders, child abductions, and nuclear secrets. Guarnido's sumptuously painted pages and rich cinematic style bring the world of 1950s America to vibrant life, with Canales weaving in fascinating tales of conspiracy, racial tension, and the "red scare" Communist witch hunts of the time. Guarnido reinvents anthropomorphism in these pages, and industry colleagues no less than Will Eisner, Jim Steranko, and Tim Sale are fans!Whether John Blacksad is falling for dangerous women or getting beaten to within an inch of his life, his stories are, simply put, unforgettable.* Dark Horse is very proud to present the first three Blacksad stories in a beautiful hardcover collection, completely relettered to the artist's specifications and with the latest album, Red Soul, in English for the very first time.* This internationally acclaimed series has won nearly a dozen prestigious awards &mdash; including the Angoulême Comics Festival prizes for Best Series and Best Artwork-and is a three-time Eisner Award nominee.
297	Good Morning, Holy Spirit	1997	9	11	238	https://images.gr-assets.com/books/1387732734l/259319.jpg	The story of Benny Hinn's personal encounter with the Holy Spirit and how that experience dramatically changed his life is a story God has used hundreds of thousands of times around the world to touch the lives of others.
298	The Last Hour	1981	9	23	239	https://images.gr-assets.com/books/1364454731l/17156406.jpg	Twenty-seven year old Carrie Thompson-Sherman has the life she always wanted: her PhD, a prestigious fellowship, and an amazing husband. Her life begins to unravel as a jealous colleague puts her fellowship in jeopardy and a haunting secret Ray Sherman carried home from Afghanistan comes to light. Hounded by a federal investigation and the ensuing media feeding frenzy, Carrie and Ray desperately lean on each other, until a disastrous accident puts both Ray and her sister's lives at risk. In the last hour, Carrie and Ray will each find themselves faced with a choice.A choice that will change everything.
299	Backlash	1991	7	23	240	https://images.gr-assets.com/books/1447381668l/27418455.jpg	Novel (126,000 words)Genres: Thriller, Gay, Romance, BDSMIn the aftermath of Jack Harrison’s release from the psychiatric unit, Gray Raoul’s first instinct is to take brutal revenge on the one responsible for financing Jack’s and Jan’s torturous psychological reconditioning. However, that person is a plays the game dangerously well, knows exactly how to manipulate everyone in Gray’s life. To help negotiate this delicate situation, Gray contacts Trace and his ex-Diadem Dom, Gabriel Hunter. But the more Gray seems to regain control, the clearer it becomes that there’s something not quite right about Jan Richards. Jan quickly unravels, taking Jack and Gray with him, and bringing out one particularly deadly player, Gray’s left with one last defence: break Jack down in order to partner up with his alter ego, Martin. But once freed, Martin has plans of his own, and he wants to make it personal with Gray. Complete trust between Master and sub, between Gray and Jack, will be tested to the absolute limit. (M/M - See publisher's website for content labels.)
300	Breakdown	1977	8	23	240	https://images.gr-assets.com/books/1399029261l/22031920.jpg	Novel (90,000 words)Genre(s): Contemporary, Gay, BDSM, Thriller, EroticaThe evidence is there in his hands: the DVD and notepad convincing Jack that Gray is responsible for his kidnapping and torture, tearing Jack and Jan brutally apart. But with Jack trapped in his own mind, lost to blackouts and self-harming, getting away from Gray must take a back seat to getting away from himself.While locked away in a secret facility run by the Masters' Circle, a new beast is unearthed from the depths of Jack'stormented past. Martin only comes out to play when Jack needs to hide, a psychopath as capable of ruining Jack's life as he is of defending him. Martin is the repository for Jack's most horrifying memories, protecting him from the bloody tasks Jack can't handle. Martin's purpose is to drive everyone Jack fears - or loves - away, before they get the chance to hurt Jack again.Now Jack hurts more than he ever has before, Martin is back, and Jack has to figure out what Martin knows that Jack forgot, before it's too late. (M/M - For content labels and excerpt, see details on publisher's site.)
301	The Untouchables	1987	10	23	241	https://images.gr-assets.com/books/1415175375l/22237428.jpg	One Secret. Multiple Casualties.Everything Melody Callahan has ever been told about her past is a lie. Her father lied. Her husband lied. But like all secrets…they come out. Not only is her mother, Aviela, alive but she won’t stop until she tears down everything Liam and Melody have spent the past year building. With a new target on their back and the media now focused on their family as the Presidential election approaches, Liam and Melody must fight on two battlefronts. Melody is torn between being in love with Liam and wanting to kill him for lying to her. Being in love and showing love are two different things in her world. Liam wants to do anything to protect his family even if that means hurting the people he loves. Family is everything… but what happens when they’re out for your blood? Everything they have been through is nothing compared to what is coming...\n\nWarning:\n\n This book contains adult language and subject matter including graphic violence and explict sex that may be disturbing for some readers. This book is not intended for readers under the age of 18.
302	Manchild in the Promised Land	1982	9	1	242	https://images.gr-assets.com/books/1348123717l/289114.jpg	Manchild in the Promised Land is indeed one of the most remarkable autobiographies of our time. This thinly fictionalized account of Claude Brown's childhood as a hardened, streetwise criminal trying to survive the toughest streets of Harlem has been heralded as the definitive account of everyday life for the first generation of African Americans raised in the Northern ghettos of the 1940s and 1950s. When the book was first published in 1965, it was praised for its realistic portrayal of Harlem -- the children, young people, hardworking parents; the hustlers, drug dealers, prostitutes, and numbers runners; the police; the violence, sex, and humor. The book continues to resonate generations later, not only because of its fierce and dignified anger, not only because the struggles of urban youth are as deeply felt today as they were in Brown's time, but also because the book is affirmative and inspiring. Here is the story about the one who "made it," the boy who kept landing on his feet and became a man.
303	A Stillness at Appomattox	1992	7	34	243	https://images.gr-assets.com/books/1320404573l/891922.jpg	When first published in 1953, Bruce Catton, our foremost Civil War historian was awarded both the Pulitzer Prize and the National Book Award for excellence in nonfiction.  This final volume of The Army of the Potomac trilogy relates the final year of the Civil War.
304	Indigo	1993	10	23	244	https://images.gr-assets.com/books/1539072697l/347339.jpg	As a child Hester Wyatt escaped slavery, but now the dark skinned beauty is a dedicated member of Michigan's Underground railroad, offering other runaways a chance at the freedom she has learned to love. When one of her fellow conductors brings her an injured man to hide, Hester doesn't hesitate even after she is told about the price on his head. The man in question is the great conductor known as the "Black Daniel" a vital member of the north's Underground railroad network, but Hester finds him so rude and arrogant, she begins to question her vow to hide him.When the injured and beaten Galen Vachon, aka, the Black Daniel awakens in Hester's cellar, he is unprepared for the feisty young conductor providing his care. As a member of one of the wealthiest free Black families in New Orleans, Galen has turned his back on the lavish living he is accustomed to in order to provide freedom to those enslaved in the south. However, as he heals he cannot turn his back on Hester Wyatt. Her innocence fills him like a breath of fresh air and he is determined to make her his, but traitors have to be found, slave catchers have to be routed and Hester's refusal to trust her own heart have to be overcome before she and Galen can find the freedom only love can bring.(back cover)
305	Magician	1984	10	9	245	https://images.gr-assets.com/books/1391464462l/43916.jpg	Raymond E. Feist's classic fantasy epic, Magician, has enchanted readers for over twenty years. The revised edition was prepared to celebrate the tenth anniversary of its publication, and incorporates over 15,000 words of text omitted from previous editions.At Crydee, a frontier outpost in the tranquil Kingdom of the Isles, an orphan boy, Pug, is apprenticed to a master magician – and the destinies of two worlds are changed forever.Suddenly the peace of the Kingdom is destroyed as mysterious alien invaders swarm the land. Pug is swept up into the conflict but for him and his warrior friend, Tomas, an odyssey into the unknown has only just begun.Tomas will inherit a legacy of savage power from an ancient civilization. Pug’s destiny is to lead him through a rift in the fabric of space and time to the mastery of the unimaginable powers of a strange new magic. Reviews'Epic scope… fast moving action…vivid imagination'WASHINGTON POST'tons of intrigue and action'PUBLISHERS WEEKLY
306	Jesus the Christ	2001	10	8	246	https://images.gr-assets.com/books/1202623375l/481749.jpg	First published in 1915, Jesus the Christ is the classic Latter-day Saint presentation of the life and ministry of the Savior. Elder Marion G. Romney said, "One who gets the understanding, the vision, and the spirit of the resurrected Lord through a careful study of the text Jesus the Christ by Elder James E. Talmage will find that he has greatly increased his moving faith in our glorified Redeemer." This special edition has been completely retypeset for added readability, and for the first time the chapter endnotes have been included with the footnotes for ready reference.
307	Bittersweet	1999	7	9	247	https://images.gr-assets.com/books/1439809848l/25977218.jpg	She'd reconciled her life without him. His return would be Bittersweet.Welcome to Mother Cora’s, where the offspring of the Kaveesh learn to coexist with humans.One hundred and twenty years ago, the Kaveesh came to Earth to save the dying planet from a disease that gorged itself on anything in its wake. Buildings crumbled to dust. Soil and plant life were consumed. Two-thirds of the Earth’s population perished.The only thing the Kaveesh asked in return was to help save their dying race. Breeding programs began and the half-breeds were born.Lirabel is a half-breed and an overachiever. Despite a few setbacks, she’s scheduled to graduate early from Mother Cora’s and become the Half-breed Ambassador to the Humans.Enter Jonas. They were best friends until he broke her heart and disappeared five years ago. Now, he’s back, but Lirabel couldn’t care less. There are more important things to worry about…Like finishing her last year of school and becoming ambassador. Or the half-bred students losing control of their Kaveesh strengths who are being sent into quarantine. Or how the breeding programs are still up and running.And somehow, Jonas’ bittersweet return is connected to it all.***Now available http://amzn.to/2dx7YgR***
308	The Stand	1978	9	16	248	https://images.gr-assets.com/books/1463497282l/18655405.jpg	This is the way the world ends: with a nanosecond of computer error in a Defense Department laboratory and a million casual contacts that form the links in a chain letter of death. And here is the bleak new world of the day after: a world stripped of its institutions and emptied of 99 percent of its people. A world in which a handful of panicky survivors choose sides -- or are chosen.
312	The Coldest Winter Ever	1999	10	58	250	https://images.gr-assets.com/books/1347600573l/106393.jpg	Nominated as one of America’s best-loved novels by PBS’s The Great American Read.The stunning national bestseller now features an illuminating discussion with Sister Souljah -- her secret thoughts on creating the story that has sold more than one million copies worldwide and introduced readers everywhere to the real ghetto experience. Here are answers to the questions fans everywhere have been asking; the meanings and inspirations behind such memorable characters as Winter, Midnight, and Santiaga; and insights into why and how Souljah conceived of one of the most powerful novels of our time.
313	Twelve Steps and Twelve Traditions	1989	7	33	251	https://images.gr-assets.com/books/1440890940l/3059.jpg	Librarian's Note: This is an alternate-cover edition for ISBN 0916856011 / 9780916856014 Originally published in 1952, this classic book is used by A.A. members and groups around the world. Bill W.'s 24 essays on the Steps and the Traditions discuss the principles by which A.A. members recover and by which the fellowship functions. The basic text clarifies the Steps which constitute the A.A. way of life and the Traditions, by which A.A. maintains its unity.
314	Sweet Dreams	1992	9	23	252	https://images.gr-assets.com/books/1327912890l/11227040.jpg	She's ready for the ride of her life . . . Lauren Grahame is looking to reinvent herself. After leaving her cheating husband, Lauren moves to Carnal, Colorado, and gets a job as a waitress in a biker bar called Bubba's. It's a nothing job in a nowhere joint . . . until Tatum Jackson walks in. Lauren has never seen a man with such good looks, muscles, and attitude. But when he insults her, Lauren doesn't want anything to do with him. Too bad for Lauren he's also the bar's part owner and bartender.When the rough-around-the-edges Tate meets the high-class Lauren, he thinks she won't fit in at Bubba's. Yet there's more to Lauren than meets the eye, and Tate soon sets his mind on claiming her as his own. Before long, the desire burning between them is heating up the cold mountain air. But when violence strikes the town, Tate must reveal a dark secret to Lauren-one that may put an end to their sweet dreams.
315	The Love Poems of Rumi	1998	10	50	253	https://images.gr-assets.com/books/1373473645l/67377.jpg	Born Jalal ad-Din Mohammed Balkhi in Persia early in the thirteenth century, the poet known as Rumi expressed the deepest feelings of the heart through his poetry. This volume consists of new translations edited by Deepak Chopra to evoke the rich mood and music of Rumi's love poems. Exalted yearning, ravishing ecstasy, and consuming desire emerge from these poems as powerfully today as they did on their creation more than 700 years ago.'These poems reflect the deepest longings of the human heart as it searches for the divine. They celebrate love. Each poetic whisper is urgent, expressing the desire that penetrates human relationships and inspires intimacy with the self, silently nurturing an affinity for the Beloved. Both Fereydoun Kia, the translator, and I hope that you will share the experience of ravishing ecstasy that the poems of Rumi evoked in us. In this volume we have sought to capture in English the dreams, wishes, hopes, desires, and feelings of a Persian poet who continues to amaze, bewilder, confound, and teach, one thousand years after he walked on this earth' - Deepak Chopra
316	The Soul of Rumi: A New Collection of Ecstatic Poems	2001	9	50	253	https://images.gr-assets.com/books/1388218803l/67375.jpg	Inside A Lover's Heart There's Another World, And Yet Another Rumi's masterpieces have inspired countless people throughout the centuries, and Coleman Barks's exquisite renderings of the thirteenth-century Persian mystic are widely considered the definitive versions for our time. Barks's translations capture the inward exploration and intensity that characterize Rumi's poetry, making this unique voice of mysticism and desire contemporary while remaining true to the original poems. In this volume readers will encounter the essence of Sufism's insights into the experience of divine love, wisdom, and the nature of both humanity and God.While Barks's stamp on this collection is clear, it is Rumi's voice that leaps off these pages with a rapturous power that leaves readers breathless. These poems express our deepest yearning for the transcendent connection with the source of the divine: there are passionate outbursts about the torment of longing for the beloved and the sweet delight that comes from union; stories of sexual adventures and of loss; poems of love and fury, sadness and joy; and quiet truths about the beauty and variety of human emotion. For Rumi, soul and body and emotion are not separate but are rather part of the great mystery of mortal life, a riddle whose solution is love. Above all else, Rumi's poetry exposes us to the delight that comes from being fully alive, urging us always to put aside our fears and take the risk of discovering our core self:No one knows what makes the soul wake up so happy! Maybe a dawn breeze has blown the veil from the face of God. These fresh, original translations magnificently convey Rumi's insights into the human heart and its longings with his signature passion and daring, focusing on the ecstatic experience of the inseparability of human and divine love. The match between Rumi's sublime poetry and Coleman Barks's poetic art are unequaled, and here this artistic union is raised to new heights.
317	The Wedding	2000	8	36	254	https://images.gr-assets.com/books/1444852367l/27204343.jpg	“Are you ready to spend the rest of our lives together?” “I wouldn’t want to spend it with anyone else.” The bad boy and his girl are finally tying the knot. They’ve put a lot of effort into making sure their big day will be as perfect as possible. But as the time for their “I do’s” draws closer, problems arise and it becomes clear that fate has other plans for them. Will this couple really get the happy ending they deserve? Or will a nauseated groom, a paranoid bride, and an overly solicitous maid-of-honor get in the way? Find out in this final chapter to the story of the new girl and her bully.
318	The Mis-Education of the Negro	2000	9	1	255	https://images.gr-assets.com/books/1389467391l/242936.jpg	The Mis-Education of the Negro is one of the most important books on education ever written. Carter G. Woodson shows us the weakness of Euro-centric based curriculums that fail to include African American history and culture. This system mis-educates the African American student, failing to prepare them for success and to give them an adequate sense of who they are within the system that they must live. Woodson provides many strong solutions to the problems he identifies. A must-read for anyone working in the education field.
334	Blood for Blood	2003	0	56	269	https://images.gr-assets.com/books/1454518446l/26864835.jpg	There would be blood. Blood for blood. Blood to pay. An entire world of it.For the resistance in the Third Reich, the war may be over, but the fight has just begun. Death camp survivor Yael, who has the power to skinshift, is on the run: the world has just seen her shoot and kill Hitler. But the truth of what happened is far more complicated, and its consequences are deadly. Yael and her unlikely comrades dive into enemy territory to try to turn the tide against Hitler’s army, and there is no alternative but to see their mission through to the end, whatever the cost.But in the midst of the chaos, Yael’s past and future collide when she comes face to face with a ghost from her past, and a spark with a fellow rider begins to grow into something more. Dark secrets reveal dark truths and one question hangs over them all—how far can you go for the ones you love?
319	Last Chance to See	1991	9	1	256	https://images.gr-assets.com/books/1327867839l/8696.jpg	"Very funny and moving...The glimpses of rare fauna seem to have enlarged [Adams'] thinking, enlivened his world; and so might the animals do for us all, if we were to help them live."THE WASHINGTON POST BOOK WORLDJoin bestselling author Douglas Adams and zooligist Mark Carwardine as they take off around the world in search of exotic, endangered creatures. Hilarious and poignant--as only Douglas Adams can be--LAST CHANCE TO SEE is an entertaining and arresting odyssey through the Earth's magnificent wildlife galaxy.
346	The Mauritius Command	1991	9	56	279	https://images.gr-assets.com/books/1455373531l/77431.jpg	"O'Brian's Aubrey-Maturin volumes actually constitute a single 6,443-page novel, one that should have been on those lists of the greatest novels of the 20th-century." —George Will, Washington PostCaptain Jack Aubrey is ashore on half pay without a command—until Stephen Maturin arrives with secret orders for Aubrey to take a frigate to the Cape of Good Hope under a commodore's pennant, there to mount an expedition against the French-held islands of Mauritius and La Réunion. But the difficulties of carrying out his orders are compounded by two of his own captains—Lord Clonfert, a pleasure-seeking dilettante, and Captain Corbett, whose severity pushes his crew to the verge of mutiny.
330	The Brothers K	1996	10	58	265	https://images.gr-assets.com/books/1403176622l/19534.jpg	Duncan took almost 10 years to follow up the publication of his much-praised first novel, The River Why, but this massive second effort is well worth the wait. It is a stunning work: a complex tapestry of family tensions, baseball, politics and religion, by turns hilariously funny and agonizingly sad. Highly inventive formally, the novel is mainly narrated by Kincaid Chance, the youngest son in a family of four boys and identical twin girls, the children of Hugh Chance, a discouraged minor-league ballplayer whose once-promising career was curtained by an industrial accident, and his wife Laura, an increasingly fanatical Seventh-Day Adventist. The plot traces the working-out of the family's fate from the beginning of the Eisenhower years through the traumas of Vietnam.
320	The Ultimate Hitchhiker's Guide to the Galaxy	2002	8	53	256	https://images.gr-assets.com/books/1404613595l/13.jpg	At last in paperback in one complete volume, here are the five novels from Douglas Adams's Hitchhiker series. "The Hitchhiker's Guide to the Galaxy"Seconds before the Earth is demolished for a galactic freeway, Arthur Dent is saved by Ford Prefect, a researcher for the revised Guide. Together they stick out their thumbs to the stars and begin a wild journey through time and space."The Restaurant at the End of the Universe"Facing annihilation at the hands of warmongers is a curious time to crave tea. It could only happen to the cosmically displaced Arthur Dent and his comrades as they hurtle across the galaxy in a desperate search for a place to eat."Life, the Universe and Everything"The unhappy inhabitants of planet Krikkit are sick of looking at the night sky- so they plan to destroy it. The universe, that is. Now only five individuals can avert Armageddon: mild-mannered Arthur Dent and his stalwart crew."So Long, and Thanks for All the Fish"Back on Earth, Arthur Dent is ready to believe that the past eight years were all just a figment of his stressed-out imagination. But a gift-wrapped fishbowl with a cryptic inscription conspires to thrust him back to reality. So to speak."Mostly Harmless"Just when Arthur Dent makes the terrible mistake of starting to enjoy life, all hell breaks loose. Can he save the Earth from total obliteration? Can he save the Guide from a hostile alien takeover? Can he save his daughter from herself?Also includes the short story "Young Zaphod Plays It Safe".
321	A Shepherd Looks at Psalm 23	1994	9	11	257	https://images.gr-assets.com/books/1348191341l/122981.jpg	“The Lord is my shepherd, I shall not be in want…”Travel the shepherd’s path to the green pastures and cool, refreshing waters of Psalm 23.As a shepherd, Phillip Keller shares his insights into the life and character of sheep— and of the Good Shepherd who loves and cares for them. This beloved classic will give new meaning to the ageless Shepherd Psalm, enriching your trust in and love for the Lord who watches closely over you.
322	The Winds of War	2002	10	56	258	https://images.gr-assets.com/books/1442187661l/21484.jpg	Like no other masterpiece of historical fiction, Herman Wouk's sweeping epic of World War II is the great novel of America's Greatest Generation.Wouk's spellbinding narrative captures the tide of global events, as well as all the drama, romance, heroism, and tragedy of World War II, as it immerses us in the lives of a single American family drawn into the very center of the war's maelstrom.The Winds of War and its sequel War and Remembrance stand as the crowning achievement of one of America's most celebrated storytellers.
323	War and Remembrance	1978	8	56	258	https://images.gr-assets.com/books/1422331351l/42986.jpg	These two classic works capture the tide of world events even as they unfold the compelling tale of a single American family drawn into the very center of the war's maelstrom.The multimillion-copy bestsellers that capture all the drama, romance, heroism, and tragedy of the Second World War -- and that constitute Wouk's crowning achievement -- are available for the first time in trade paperback.
324	Beauty Queen	1977	9	9	259	https://images.gr-assets.com/books/1417653492l/23399228.jpg	The magical seventh installment in this NEW YORK TIMES bestselling series!This time, the magic mirror sucks Abby and Jonah into the story of Beauty and the Beast. When Jonah angers the Beast by picking flowers from his garden, he becomes the Beast's prisoner! Abby has to save her brother by finding Beauty, whom the Beast will surely fall in love with, right? NOPE. The Beast doesn't like Beauty, so it's up to Abby and her brother to match-make this reluctant pair and fix this fractured fairy tale before things get pretty ugly!
325	A Mayan Astronomer in Hell's Kitchen: Poems	2000	9	50	260	https://images.gr-assets.com/books/1390070995l/271457.jpg	In his sixth collection, American Book Award winner Martín Espada has created a poetic mural. There are conquerors, slaves, and rebels from Caribbean history; the "Mayan astronomer" calmly smoking a cigarette in the middle of a New York tenement fire; a nun staging a White House vigil to protest her torture; a man on death row mourning the loss of his books; and even Carmen Miranda.
326	The Final Hour	2003	9	46	261	https://images.gr-assets.com/books/1441478747l/9655178.jpg	"You're not alone. You're never alone."Charlie West has held on to that belief, but now he's starting to wonder. He went to bed one night an ordinary high-school kid. When he woke up, he was wanted for murder and hunted by a ruthless band of terrorists. He's been on the run ever since. Now he's stuck in prison, abandoned by his allies, trying desperately to stay a step ahead of vicious prison gangs and brutal guards. And a flash of returning memory tells him another terrorist strike is coming soon. A million people will die unless he does something. But what? He's stuck in a concrete cage with no way out and no one who can help. Charlie has never felt so alone and yet he knows he can't give in or give up . . . not with the final hour ticking away.A thriller that reads like a teenage version of 24 . . . an adrenaline-pumping adventure. TheDailyBeast.com (review of The Last Thing I Remember)"
327	The Line	1996	9	23	262	https://images.gr-assets.com/books/1497007906l/34836596.jpg	I was a thief. The invisible girl only he could see. The woman who wanted to be more. He was the mark. The extraordinary cowboy who stole my sixteen-year-old heart. The damaged man who still owned it, even four years later.The Line was where we began.Where fates collided. Where truths derailed.The place where our love story ends.
328	Musashi	1995	10	58	263	https://images.gr-assets.com/books/1327942522l/102030.jpg	The classic samurai novel about the real exploits of the most famous swordsman. Musashi is a novel in the best tradition of Japanese story telling. It is a living story, subtle and imaginative, teeming with memorable characters, many of them historical. Interweaving themes of unrequited love, misguided revenge, filial piety and absolute dedication to the Way of the Samurai, it depicts vividly a world Westerners know only vaguely.
329	Pilgrim's Inn	1948	9	58	264	https://images.gr-assets.com/books/1259311516l/205621.jpg	After WW II, Lucilla's soldier son George and his beautiful wife Nadine lived with their five children. They acquired an ancient pilgrim's inn on the river. Sally had never seen this face before, but as she studied the unfinished portrait of David Eliot, her untried heart knew the meaning of love. She would always know this face... the finely shaped head, the obstinate jaw, the hint of bitterness about the mouth. But David was tied, tied to a married woman who could not let him go. Theirs is an unforgettable story, one that will hold you spellbound as you enter the portals of Pilgrim's Inn...
398	Secrets	1992	9	42	316	https://images.gr-assets.com/books/1391066610l/19308365.jpg	Secrets are revealed as we explore the minds of the other characters and discover unexpected twists. Liv takes a trip to another world, finding out more about where she came from, but is her duty to her new family really something that she wants to be a part of? After suffering through a distressing ordeal, she is given a gift from her mother which changes everything for her. Finally learning the truth about the mysterious Remiel, she is forced to make a choice when a member of her team finds themselves in trouble... but will she make the right one?
331	Memed, My Hawk	1993	10	58	266	https://images.gr-assets.com/books/1425293055l/175545.jpg	A tale of high adventure and lyrical celebration, tenderness and violence, generosity and ruthlessness, Memed, My Hawk is the defining achievement of one of the greatest and most beloved of living writers, Yashar Kemal. It is reissued here with a new introduction by the author on the fiftieth anniversary of its first publication.Memed, a high-spirited, kindhearted boy, grows up in a desperately poor mountain village whose inhabitants are kept in virtual slavery by the local landlord. Determined to escape from the life of toil and humiliation to which he has been born, he flees but is caught, tortured, and nearly killed. When at last he does get away, it is to set up as a roving brigand, celebrated in song, who could be a liberator to his people—unless, like the thistles that cover the mountain slopes of his native region, his character has taken an irremediably harsh and unforgiving form.
332	The Mercenary	2003	8	9	267	https://images.gr-assets.com/books/1346754429l/15987008.jpg	When twenty-three-year-old Jodie Fletcher realizes shape-shifters are real—and that they’re trying to kill her—she finds herself thrust into a life of danger and unimaginable intrigue. With her parents away and her alcoholic and newly single brother, Luke, camped in her spare bedroom, Jodie feels like she’s drowning in a world she doesn’t understand. The only thing she can count on is the leopard who has apparently taken it upon himself to protect her. She cannot ignore the raw emotion he awakens in her, and she longs for more. The leopard becomes not only her savior, but her escape. Mysterious and unpredictable, leopard shifter Danny Archer hides behind his dimpled smile and pretty boy façade. What’s more, he has a second job the human population doesn’t know about—the one that leads him to Jodie and Luke. Archer feels an instant connection with Jodie, and he must find a way to balance his volatile lifestyle to include her. Luke Fletcher became an alcoholic long before his wife left him. Now he faces the brutal reality that his past has caught up with him. He made a series of bad choices while under the influence, and these choices have placed him, his sister, and his two young daughters in danger. Luke must try to find the man he used to be if he is to survive the chaos he’s inflicted; he knows he won’t be able to live with himself if anything happens to his family.
333	Martin Eden	1986	6	22	268	https://images.gr-assets.com/books/1344411175l/929782.jpg	The semiautobiographical Martin Eden is the most vital and original character Jack London ever created. Set in San Francisco, this is the story of Martin Eden, an impoverished seaman who pursues, obsessively and aggressively, dreams of education and literary fame. London, dissatisfied with the rewards of his own success, intended Martin Eden as an attack on individualism and a criticism of ambition; however, much of its status as a classic has been conferred by admirers of its ambitious protagonist.Andrew Sinclair's wide-ranging introduction discusses the conflict between London's support of socialism and his powerful self-will. Sinclair also explores the parallels and divergences between the life of Martin Eden and that of his creator, focusing on London's mental depressions and how they affected his depiction of Eden.
335	The Collected Poems of Frank O'Hara	1995	8	50	270	https://images.gr-assets.com/books/1347596130l/139864.jpg	Available for the first time in paperback, The Collected Poems of Frank O'Hara reflects the poet's growth as an artist from the earliest dazzling, experimental verses that he began writing in the late 1940s to the years before his accidental death at forty, when his poems became increasingly individual and reflective.
336	Black Girl Lost	1999	9	58	271	https://images.gr-assets.com/books/1349080281l/804698.jpg	In this shocking novel of a young girl alone on the streets, Goines delves into yet another facet of the ghetto experience-the dark, despair-ridden world of a black girl s soul! Sandra took to the streets when she was eight years old and tried to fight off the hunger pangs by shoplifting and moving into the profits of drug pushing. The she met Chink and discovered love and affection...and rape and murder!
337	Dopefiend	1991	8	58	271	https://images.gr-assets.com/books/1349012658l/292365.jpg	For twenty-three years of his life Donald Goines lived in the dark, despair-ridden world of the junkie. It started while he was doing military service in Korea and ended with his murder at the age of thirty nine. He had worked up to a hundred dollars a day habit and out of the agonizing hell came Dopefiend. It is the shocking nightmare story of a black heroin addict. Trapped in the festering sore of a major American ghetto, a young man and his girlfriend- both handsome, talented, and full of promise- are inexorably pulled into death of the hardcore junkie!
353	The Nutmeg of Consolation	1993	0	56	279	https://images.gr-assets.com/books/1392325121l/835638.jpg	Alternate Cover Edition can be found here. Shipwrecked on a remote island in the Dutch East Indies, Captain Aubrey, surgeon and secret intelligence agent Stephen Maturin, and the crew of the Diane fashion a schooner from the wreck. A vicious attack by Malay pirates is repulsed, but the makeshift vessel burns, and they are truly marooned. Their escape from this predicament is one that only the whimsy and ingenuity of Patrick O'Brian—or Stephen Maturin—could devise.In command now of a new ship, the Nutmeg, Aubrey pursues his interrupted mission. The dreadful penal colony in New South Wales, harrowingly described, is the backdrop to a diplomatic crisis provoked by Maturin's Irish temper, and to a near-fatal encounter with the wildlife of the Australian outback.
379	Coast	2001	9	10	302	https://images.gr-assets.com/books/1464191657l/30192405.jpg	One life-changing summer. One boy.The boy.The boy who offered me safe touches and heart-stopping smiles - smiles he shared with his son.We filled our days with porch-step kisses, filled our ears with laughter, filled our hearts with love. Deep, soul-aching, desperate love.But love is misleading.It's an invisible, fleeting moment.Somewhere between false adoration and pure hatred comes an emotion, a vulnerable need, a single desire.It lives within the ones who miss it, who crave it, who know better than to expect it.Love is relentless.Even when that love turns to hate, turns to loathing, turns to pain. Love should heal you. But it can also break you. Believe me, I know...Because I'm Becca Owens - a broken girl......And he's Josh Warden - the boy who broke me.
338	Fortitude	1994	9	23	272	https://images.gr-assets.com/books/1399333570l/22042963.jpg	Sometimes, love is just that little bit too unhealthy. It’s time to put demons to rest and say goodbye… once and for all. Mason My wife isn’t just fighting for her family anymore, or even for her beliefs and what she judges to be right concerning her family. She’s fighting to survive. After everything; after years of battles and heartache, after decades of conflicts and struggles, after moments of torture and pain, life now throws her a new war to combat. Cancer. Her biggest fight ever, the hardest battle that she will ever face, and the one thing that can finally destroy her. Destroy me. Cancer. My wife is no longer my little warrior. She’s is the most epic fighter out there. She’s the most courageous of soldiers. And she’s the epitome of strength. My little warrior has become my monster of fortitude. Ava I’m no longer fighting to keep my family safe, or even to protect them. I’m no longer battling against the forces of Mason’s past or even mine. I’m fighting to maintain their future. After everything; after years of trying to survive, after decades of struggling to touch the light at the end of the tunnel, after moments of utter heartache, life now hands me a new scar to heal. Cancer. My biggest fight ever, the hardest battle that I will ever face, and the one thing that can finally, destroy me. Destroy him. Cancer. I am no longer his little warrior. I can’t fight that battle for him anymore. I can’t be the pillar of strength he needs me to be. And I can’t be the wife and lover he needs. Fortitude has taken his little warrior and morphed her into a monster. This book contains explicit sex scenes including M/M and F/M/M/F, strong language and intense violence… oh, and one hell of an alpha male and one hell of a hard woman.
340	Danger in the Shadows	2002	7	3	274	https://images.gr-assets.com/books/1406507237l/359463.jpg	Sara is terrified. She's doing the one thing she cannot afford to do: fall in love with former pro-football player Adam Black, a man everyone knows. Sara's been hidden away in the witness protection program, her safety dependent on staying invisible--and loving Adam could get her killed! Introducing the O'Malleys, an inspirational group of seven, all abandoned or orphaned as teens, who have made the choice to become a loyal and committed family. They have chosen their own surname, O'Malley, and have stood by each other through moments of joy and heartache. Their stories are told in CBA best-selling, inspirational romantic suspense novels that rock your heart and restore strength and hope to your spirit.
341	Deadly Pursuit	1995	7	3	275	https://images.gr-assets.com/books/1431386985l/10593071.jpg	As a social worker, Alison Taylor has a passion for protecting children and seeing that justice is served on their behalf. But when she starts getting harassing phone calls and bizarre "gifts," it seems she may be the one in need of protection. When her tormentor's attentions take a violent turn, her brother Cole comes to her aid, along with his new partner, an ex-Navy SEAL, Detective Mitch Morgan. As her relentless stalker turns up the heat, Mitch takes a personal interest in the case. Protecting Alison has become more than just a job--because his own happiness now depends on keeping her safe.Chock full of nail-biting suspense and heart-melting romance, Deadly Pursuit is Irene Hannon's storytelling at its very best. Fans old and new will not want to miss the next story in this series starring siblings fighting for justice.
342	Silenced	1984	9	3	276	https://images.gr-assets.com/books/1381252815l/18651854.jpg	Romantic Suspense's Rising Star Returns with an Electric New ThrillerA relaxing day of rock climbing takes a disturbing turn when Kayden McKenna's route leads her face to face with a dead climber. Is it a terrible accident or something sinister? When the case is handed to the overburdened sheriff, he turns to Jake Westin. With Jake's past now revealed, he's ready to use his talent for investigation again--but he could never prepare for where the case will take him.Kayden and Jake soon realize that the death was no accident. And worse, it seems the killer is on to them. When strange things begin happening in Yancey, Jake is terrified that once again his world may put someone he loves in danger. But the truth is far worse than he could ever imagine.
343	Blind Spot	1997	8	3	276	https://images.gr-assets.com/books/1488337794l/34020169.jpg	Each of Pettrey's Novels Has Been a Multi-Month BestsellerFBI agent Declan Grey is in the chase of his life--but isn't sure exactly what he's chasing after. Threatened by a terrorist that "the wrath is coming," Grey fears something horrible is about to be unleashed on American soil. When his investigation leads him to a closed immigrant community, he turns to Tanner Shaw to help him. She's sought justice for refugees and the hurting around the world, and if there's anyone who can help him, it's Tanner.Tanner Shaw has joined the FBI as a crisis counselor . . . meaning she now has more opportunity to butt heads with Declan. But that tension also includes a spark she can't deny, and she's pretty sure Declan feels the same. But before anything can develop between them, they discover evidence of a terror cell--and soon are in a race against the clock to stop the coming "wrath" that could cost thousands their lives.
345	Ransom	2003	9	23	278	https://images.gr-assets.com/books/1429128307l/107776.jpg	Overflowing with all of the majesty and intrigue of medieval glory days, this magnificent New York Times bestseller is a page-turner of passion and loyalty, justice and honor. Beloved storyteller Julie Garwood steps back to the silver-shrouded Highlands of her classic tale The Secret--and hails the return of two unforgettable warriors: Ramsey Sinclair and Brodick Buchanan. In the dark days after the death of Richard the Lionhearted, lives and lands would fall into upheaval at the hands of a power-hungry British ruler and his violent minions. One victim of the scourge is innocent Gillian, who is a mere child when the cruel and ambitious Baron Alford slaughters her father and tears her family apart. Alford, determined to recover a jeweled box for the despotic King John, is furious when the precious treasure slips through his fingers--only to be lost for more than a decade.Now a beautiful young woman, Gillian finds the key to resolving her past in handsome Scottish chieftains Ramsey Sinclair and Brodick Buchanan. With the cunning and courage of the daring Scotsmen, and with the friendship of a new ally, Bridgid KirkConnell, Gillian at last fights the unscrupulous Baron Alford, laying claim to her home, her family, and her father's reputation. But in the presence of the mighty warriors, Gillian and Bridgid discover that desire can be a weapon of conquest...betrayal can slay trust in a heartbeat...and the greatest risk of all is surrender--to the deep emotions of unexpected love.
442	The Missing Piece Meets the Big O	1981	0	32	343	https://images.gr-assets.com/books/1437926898l/30125.jpg	The missing piece sat alone waiting for someone to come along and take it somewhere.... The different ones it encounters - and what it discovers in its helplessness - are portrayed with simplicity and compassion in the words and drawings of Shel Silverstein.
347	The Truelove	1993	9	56	279	https://images.gr-assets.com/books/1388358972l/24525.jpg	A British whaler has been captured by an ambitious chief in the sandwich islands at French instigation, and Captain Aubrey, R. N., Is dispatched with the Surprise to restore order. But stowed away in the cable-tier is an escaped female convict. To the officers, Clarissa Harvill is an object of awkward courtliness and dangerous jealousies. Aubrey himself is won over and indeed strongly attracted to this woman who will not speak of her past. But only Aubrey's friend, Dr. Stephen Maturin, can fathom Clarissa's secrets: her crime, her personality, and a clue identifying a highly placed English spy in the pay of Napoleon's intelligence service.In a thrilling finale, Patrick O'Brian delivers all the excitement his many readers expect: Aubrey and the crew of the Surprise impose a brutal pax Britannica upon the islanders in a pitched battle against a band of headhunting cannibals.
348	Blue at the Mizzen	2000	10	56	279	https://images.gr-assets.com/books/1388208753l/24526.jpg	Napoleon has been defeated at Waterloo, and the ensuing peace brings with it both the desertion of nearly half of Captain Aubrey's crew and the sudden dimming of Aubrey's career prospects in a peacetime navy. When the Surprise is nearly sunk on her way to South America—where Aubrey and Stephen Maturin are to help Chile assert her independence from Spain—the delay occasioned by repairs reaps a harvest of strange consequences. The South American expedition is a desperate affair; and in the end Jack's bold initiative to strike at the vastly superior Spanish fleet precipitates a spectacular naval action that will determine both Chile's fate and his own. 
350	The Wine-Dark Sea	1994	10	56	279	https://images.gr-assets.com/books/1388358971l/938791.jpg	At the outset of this adventure filled with disaster and delight, Jack Aubrey and Stephen Maturin pursue an American privateer through the Great South Sea. The strange color of the ocean reminds Stephen of Homer's famous description, and portends an underwater volcanic eruption that will create a new island overnight and leave an indelible impression on the reader's imagination.Their ship, the Surprise, is now also a privateer, the better to escape diplomatic complications from Stephen's mission, which is to ignite the revolutionary tinder of South America. Jack will survive a desperate open boat journey and come face to face with his illegitimate black son; Stephen, caught up in the aftermath of his failed coup, will flee for his life into the high, frozen wastes of the Andes; and Patrick O'Brian's brilliantly detailed narrative will reunite them at last in a breathtaking chase through stormy seas and icebergs south of Cape Horn, where the hunters suddenly become the hunted.
351	The Fortune of War	1991	9	56	279	https://images.gr-assets.com/books/1453834480l/77426.jpg	An essential of the truly gripping book for the narrative addict is the creation of a whole, solidly living world for the imagination to inhabit, and O'Brian does this with prodigal specificity and generosity." —A.S. ByattCaptain Jack Aubrey, R. N., arrives in the Dutch East Indies to find himself appointed to the command of the fastest and best-armed frigate in the Navy. He and his friend Stephen Maturin take passage for England in a dispatch vessel. But the War of 1812 breaks out while they are en route. Bloody actions precipitate them both into new and unexpected scenes where Stephen's past activities as a secret agent return on him with a vengeance.
352	The Thirteen-Gun Salute	1992	8	56	279	https://images.gr-assets.com/books/1388513303l/761623.jpg	"In length the series is unique; in quality—and there is not a weak link in the chain—it cannot but be ranked with the best of twentieth century historical novels."—T. J. Binyon, IndependentCaptain Jack Aubrey sets sail for the South China Sea with a new lease on life. Following his dismissal from the Royal Navy (a false accusation), he has earned reinstatement through his daring exploits as a privateer, brilliantly chronicled in The Letter of Marque. Now he is to shepherd Stephen Maturin—his friend, ship's surgeon, and sometimes intelligence agent—on a diplomatic mission to prevent links between Bonaparte and the Malay princes which would put English merchant shipping at risk.The journey of the Diane encompasses a great and satisfying diversity of adventures. Maturin climbs the Thousand Steps of the sacred crater of the orangutans; a killer typhoon catches Aubrey and his crew trying to work the Diane off a reef; and in the barbaric court of Pulo Prabang a classic duel of intelligence agents unfolds: the French envoys, well entrenched in the Sultan's good graces, against the savage cunning of Stephen Maturin.
354	The Reverse of the Medal	1992	7	56	279	https://images.gr-assets.com/books/1388358969l/529830.jpg	Captain Jack Aubrey, R. N., ashore after a successful cruise, is persuaded by a casual acquaintance to make certain investments in the City. This innocent decision ensnares him in the London criminal underground and in government espionage—the province of his friend Stephen Maturin. Is Aubrey's humiliation and the threatened ruin of his career a deliberate plot? This dark tale is a fitting backdrop to the brilliant characterization and sparkling dialogue which O'Brian's readers have come to expect.
380	Witness	2001	9	34	303	https://images.gr-assets.com/books/1411447524l/950143.jpg	First published in 1952, Witness was at once a literary effort, a philosophical treatise, and a bestseller. Whittaker Chambers had just participated in America's trial of the century in which Chambers claimed that Alger Hiss, a full-standing member of the political establishment, was a spy for the Soviet Union. This poetic autobiography recounts the famous case, but also reveals much more. Chambers' worldview--e.g. "man without mysticism is a monster"--went on to help make political conservatism a national force.
355	The Commodore	1995	9	56	279	https://images.gr-assets.com/books/1388358971l/938874.jpg	Having survived a long and desperate adventure in the Great South Sea, Captain Jack Aubrey and Stephen Maturin return to England to very different circumstances. For Jack it is a happy homecoming, at least initially, but for Stephen it is disastrous: his little daughter appears to be autistic, incapable of speech or contact, while his wife, Diana, unable to bear this situation, has disappeared, her house being looked after by the widowed Clarissa Oakes.Much of The Commodore takes place on land, in sitting rooms and in drafty castles, but the roar of the great guns is never far from our hearing. Aubrey and Maturin are sent on a bizarre decoy mission to the fever-ridden lagoons of the Gulf of Guinea to suppress the slave trade. But their ultimate destination is Ireland, where the French are mounting an invasion that will test Aubrey's seamanship and Maturin's resourcefulness as a secret intelligence agent.
356	The Letter of Marque	1992	9	56	279	https://images.gr-assets.com/books/1441465292l/916914.jpg	Captain Jack Aubrey, a brilliant and experienced officer, has been struck off the list of post-captains for a crime he did not commit. His old friend Stephen Maturin, usually cast as a ship's surgeon to mask his discreet activities on behalf of British Intelligence, has bought for Aubrey his former ship the Surprise to command as a privateer, more politely termed a letter of marque. Together they sail on a desperate mission against the French, which, if successful, may redeem Aubrey from the private hell of his disgrace.
358	Holding Wonder	1972	9	53	281	https://images.gr-assets.com/books/1453894595l/491888.jpg	In this many-dimensioned new collection of speculative fiction, Zena Henderson introduces us to a boy who "calls" his mother, despite the fact that the nearest phone is miles away.--and reads the distress call from an orbiting astronaut's mind; to the amazing cures of Aunt Sophronia--pills for the living dead; and to Loo Ree, the imaginary friend of a first grader -- who tuns out to be all too real...Contents:The Indelible Kind (1968)J-Line to Nowhere (1969)You Know What, Teacher? (1954)The Effectives (1965)Loo Ree (1953)The Closest School (1960)Three-Cornered and Secure (1971)The Taste of Aunt Sophronia (1971)The Believing Child (1970)Through a Glass - Darkly (1970)As Simple as That (1971)Swept and Garnished (1971)One of Them (1971)Sharing Time (1971)Ad Astra (1971)Incident After (1971)The Walls (1971)Crowning Glory (1971)Boona on Scancia (1971)Love Every Third Stir (1971)
359	The Return of the Prodigal Son: A Story of Homecoming	1994	10	11	282	https://images.gr-assets.com/books/1327010857l/175113.jpg	A chance encounter with a reproduction of Rembrandt's painting, The Return of the Prodigal Son, catapulted Henri Nouwen into a long spiritual adventure. In his highly-acclaimed book of the same title, he shares the deeply personal meditation that led him to discover the place within which God has chosen to dwell. This Lent course, which has been adapted from the book, helps us to reflect on the meaning of the parable for our own lives. Divided into five sessions, the course moves through the parable exploring our reaction to the story: the younger son's leaving and return, the father's restoration of sonship, the elder son's resentment and the father's compassion. All of us who have experienced loneliness, dejection, jealousy or anger will respond to the persistent themes of homecoming, affirmation and reconciliation.
360	Image	1980	7	9	283	https://images.gr-assets.com/books/1320179178l/12828506.jpg	There is an ominous darkness; one that is so dense and mind-numbing that you can feel the chills race across your skin as the energy of its hatred hovers near you. They thought that it was over… that he was dead… they never imagined that he was more powerful dead than he ever was alive. The dark dimension Esterious is on the brink of war, the victory Willow had a few days ago is nothing more than a vague memory. With each thought she has, she fights the images of Drake’s dark eyes and his words… his promises. Doubt seeps into her soul as she faces what could be the hardest battle she has faced so far. Venus is meant to be the planet of love and peace… but when it falls into retrograde its influence changes. Matters of past relationships will surface, choices will be made with the mind and not the heart and gateways to an evil that cannot be fathomed will open. Willow and Landen’s only defense is to hide their family away, and lock themselves in the palace that was once ruled by Donalt. The energy is heavy and dark within its walls…there is a presence that lingers and strikes at will. Cruel illusions are placed before Willow, but that is not even the hardest part… what is hard is standing in a room with Drake and Landen and listening to others tell you of lives that you cannot recall… for them to tell you when and how you are going to die. Every prediction and theory is about to be proven wrong… and the choice before Willow’s heart holds the lives of millions at stake. The question is: will she be able to see through the illusions before her and make a choice… she can live with?
361	The Hollow Man	1993	8	58	284	https://images.gr-assets.com/books/1401144853l/22337223.jpg	A terrorist’s plot, the assassination of a prime minister, holds the key to an apocalyptic plot to destroy Europe’s economy. It’s impossible to stop, but one man doesn’t know enough to think the world can’t be saved. He’s no hero; not clever or capable, talented or tested. The Hollow Man is just trying to survive in an uncertain climate where terrorism is changing the rules of how we live.The Hollow Man is a field analyst assigned to learn the new tactics of terror while trying to keep disaster from U.S. borders. If he fails and lets that happen, he lets down a world of people who didn’t even know he exists. Confronting his own demons along with soldiers of this new world, he is young, untrained and ill-prepared for what he finds.Based on true events, a young man running from Vietnam finds himself in another kind of war. A new war of terror is spreading across Europe. As a naive field analyst for a U.S. government agency, he is assigned to babysit the unpopular Prime Minister of Spain, Luis Carrero Blanco. It’s easy duty for a young unskilled analyst. But the quick assassination of Blanco by the ruthless terrorist, Chaban, sets off a chase across Spain and France to stop him before he can complete his plan to destroy the economy of Europe.Haunted by one of Chaban’s previous murder victims, a twelve year old girl, the analyst battles ruthless assassins and his own personal demons in a vicious struggle to save 5,000 innocent lives from becoming collateral damage in the terrorist’s psychotic plot. Disowned by the American government, no one can help him except Zita, MI6 agent and lover. They follow the trail from Madrid to Paris always a step behind.
362	Freak Show	1992	8	9	285	https://images.gr-assets.com/books/1400621973l/22236956.jpg	When transsexual starlet Aisling is murdered, Detective Geraldine Meyers is assigned the case. With help from medical examiner Dr. Rachel Hunter, Gerri realizes this is no ordinary killing. While she might not want to call in over-eager anthropologist Dr. Kinsey DanAllart, the detective is forced to trust her friend's expertise in symbology, even though doing so means admitting "weird" things might be happening in Silver City. As the three friends unravel the mystery of the dancer's death, one thing is made absolutely apparent--something isn't right in their new hometown. And someone is doing everything they can to make sure the truth doesn't come out.In Silver City, sometimes friendship can be murder.Welcome to the first Nightshade Case, a series of twenty-one episodes in twenty-one weeks. Please note: this episodic series is based on the television show model, with screenwriting notations and shorter formats. There will be a complete mystery each week, with cliffhangers only occurring in the full season story line.
397	The Ties That Bind	1986	0	42	316	https://images.gr-assets.com/books/1370499827l/18042658.jpg	Book 5 in The Forever series. Carrying on directly from where Choices left off, Devon makes a decision that sets off a chain of events and changes the plans for Liv and her ever growing group.Learning more about the mystery that is Sebastian, discovering more about the Demon family that is desperate to adopt her, and a surprising proposal by Cade the Hunter, leave Liv with more life altering decisions than ever. Good or Bad... All that is discovered and decided upon cause a new chapter of Liv’s life to begin and some shocking new powers to arise. How will this affect her future and that of her friends and loved ones?
363	Tao Te Ching	1999	7	41	286	https://images.gr-assets.com/books/1333578861l/67896.jpg	For nearly two generations, Gia-fu Feng and Jane English's translation of the Tao Te Ching has been the standard for those seeking access to the wisdom of Taoist thought. Now Jane English and her long-time editor, Toinette Lippe, have revised and refreshed the translation so that it more faithfully reflects the Classical Chinese in which it was first written, taking into account changes in our own language and eliminating any lingering infelicities. They have retained the simple clarity of the original rendering of a sometimes seemingly obtuse spiritual text, a clarity that has made this version a classic in itself, selling over a million copies. Written most probably in the sixth century B.C. by Lao Tsu, this esoteric but infintely practical book has been translated into English more frequently than any other work except the Bible. Gia-fu Feng and Jane English's superb translation—the most accessible and authoritative modern English translation—offers the essence of each word and makes Lao Tsu's teaching immediate and alive. This edition includes an introduction and notes by the well-known writer and scholar of philosophy and comparative religion, Jacob Needleman.
364	Winter	1988	9	46	287	https://images.gr-assets.com/books/1470057036l/13206900.jpg	Princess Winter is admired by the Lunar people for her grace and kindness, and despite the scars that mark her face, her beauty is said to be even more breathtaking than that of her stepmother, Queen Levana.Winter despises her stepmother, and knows Levana won't approve of her feelings for her childhood friend--the handsome palace guard, Jacin. But Winter isn't as weak as Levana believes her to be and she's been undermining her stepmother's wishes for years. Together with the cyborg mechanic, Cinder, and her allies, Winter might even have the power to launch a revolution and win a war that's been raging for far too long.Can Cinder, Scarlet, Cress, and Winter defeat Levana and find their happily ever afters? Fans will not want to miss this thrilling conclusion to Marissa Meyer's national bestselling Lunar Chronicles series.
366	The C Programming Language	1978	9	26	289	https://images.gr-assets.com/books/1391032531l/515601.jpg	This book is meant to help the reader learn how to program in C. It is the definitive reference guide, now in a second edition. Although the first edition was written in 1978, it continues to be a worldwide best-seller. This second edition brings the classic original up to date to include the ANSI standard.  From the Preface:  We have tried to retain the brevity of the first edition. C is not a big language, and it is not well served by a big book. We have improved the exposition of critical features, such as pointers, that are central to C programming. We have refined the original examples, and have added new examples in several chapters. For instance, the treatment of complicated declarations is augmented by programs that convert declarations into words and vice versa. As before, all examples have been tested directly from the text, which is in machine-readable form.   As we said in the first preface to the first edition, C "wears well as one's experience with it grows." With a decade more experience, we still feel that way. We hope that this book will help you to learn C and use it well.
367	Phenomenal Woman: Four Poems Celebrating Women	1995	8	50	290	https://images.gr-assets.com/books/1403166978l/13208.jpg	A collection of beloved poems about women from the iconic Maya AngelouThese four poems, "Phenomenal Woman," "Still I Rise," "Weekend Glory," and "Our Grandmothers," are among the most remembered and acclaimed of Maya Angelou's poems. They celebrate women with a majesty that has inspired and touched the hearts of millions.These memorable poems have been reset and bound in a beautiful edition--a gift to keep and to give.
368	Burning Your Boats: The Collected Short Stories	1996	8	43	291	https://images.gr-assets.com/books/1348325516l/763471.jpg	One of our most imaginative and accomplished writers, Angela Carter left behind a dazzling array of work: essays, citicism, and fiction. But it is in her short stories that her extraordinary talents—as a fabulist, feminist, social critic, and weaver of tales—are most penetratingly evident. This volume presents Carter's considerable legacy of short fiction gathered from published books, and includes early and previously unpublished stories. From reflections on jazz and Japan, through vigorous refashionings of classic folklore and fairy tales, to stunning snapshots of modern life in all its tawdry glory, we are able to chart the evolution of Carter's marvelous, magical vision.
369	The Complete Grimm's Fairy Tales	1972	8	22	292	https://images.gr-assets.com/books/1369540060l/22917.jpg	For almost two centuries, the stories of magic and myth gathered by the Brothers Grimm have been part of the way children — and adults — learn about the vagaries of the real world. Cinderella, Rapunzel, Snow-White, Hänsel and Gretel, Little Red-Cap (a.k.a. Little Red Riding Hood), and Briar-Rose (a.k.a. Sleeping Beauty) are only a few of more than 200 enchanting characters included here. Lyrically translated and beautifully illustrated, the tales are presented just as Jacob and Wilhelm Grimm originally set them down: bold, primal, just frightening enough, and endlessly engaging.
370	Practical Electronics for Inventors	2000	8	4	293	https://images.gr-assets.com/books/1347790390l/687619.jpg	This intuitive, applications-driven guide to electronics for hobbyists, engineers, and students doesn't overload readers with technical detail. Instead, it tells you-and shows you-what basic and advanced electronics parts and components do, and how they work. Chock-full of illustrations, Practical Electronics for Inventors offers over 750 hand-drawn images that provide clear, detailed instructions that can help turn theoretical ideas into real-life inventions and gadgets.
371	The Visual Display of Quantitative Information	2001	8	38	294	https://images.gr-assets.com/books/1490961555l/17744.jpg	The classic book on statistical graphics, charts, tables. Theory and practice in the design of data graphics, 250 illustrations of the best (and a few of the worst) statistical graphics, with detailed analysis of how to display data for precise, effective, quick analysis. Design of the high-resolution displays, small multiples. Editing and improving graphics. The data-ink ratio. Time-series, relational graphics, data maps, multivariate designs. Detection of graphical deception: design variation vs. data variation. Sources of deception. Aesthetics and data graphical displays. This is the second edition of The Visual Display of Quantitative Information. Recently published, this new edition provides excellent color reproductions of the many graphics of William Playfair, adds color to other images, and includes all the changes and corrections accumulated during 17 printings of the first edition.
372	Bruchko	1977	9	17	295	https://images.gr-assets.com/books/1178210652l/770873.jpg	The Astonishing True Story Of A Nineteen-Year-Old's Capture By The Stone-Age Motilone Indians And The Impact He Had Living Out The Gospel Among Them (International Adventures)What happens when a nineteen-year-old boy and heads into the jungles to evangelize a murderous tribe of South American Indians? For Bruce Olson it meant capture and torture, but what he discovered revolutionized the world of missions.
373	Dark Days	2004	9	9	296	https://images.gr-assets.com/books/1348429914l/7261549.jpg	Skulduggery Pleasant is lost on the other side of a portal, with only some evil gods for company. Can he possibly survive? (Yes, all right, he's already dead. But still.) Meet Skulduggery Pleasant: detective, sorcerer, warrior.Oh yes. And dead.Skulduggery Pleasant is gone, sucked into a parallel dimension overrun by the Faceless Ones. If his bones haven’t already been turned to dust, chances are he’s insane, driven out of his mind by the horror of the ancient gods. There is no official, Sanctuary-approved rescue mission. There is no official plan to save him.But Valkyrie's never had much time for plans.The problem is, even if she can get Skulduggery back, there might not be much left for him to return to. There’s a gang of villains bent on destroying the Sanctuary, there are some very powerful people who want Valkyrie dead, and as if all that wasn’t enough it looks very likely that a sorcerer named Darquesse is going to kill the world and everyone on it.Skulduggery is gone. All our hopes rest with Valkyrie. The world’s weight is on her shoulders, and its fate is in her hands.These are dark days indeed.
374	The Journey Home	1998	10	13	297	https://images.gr-assets.com/books/1348361719l/389210.jpg	This parable is filled with penetrating insights about how readers can returnto their true selves.
384	What It Takes: The Way to the White House	1992	10	59	307	https://images.gr-assets.com/books/1439417065l/380057.jpg	An American Iliad in the guise of contemporary political reportage, What It Takes penetrates the mystery at the heart of all presidential campaigns: How do presumably ordinary people acquire that mixture of ambition, stamina, and pure shamelessness that makes a true candidate? As he recounts the frenzied course of the 1988 presidential race -- and scours the psyches of contenders from George Bush and Robert Dole to Michael Dukakis and Gary Hart -- Pulitzer Prize-winning journalist Richard Ben Cramer comes up with the answers, in a book that is vast, exhaustively researched, exhilarating, and sometimes appalling in its revelations.
375	A Deepness in the Sky	1999	8	53	298	https://images.gr-assets.com/books/1217218691l/226004.jpg	Alternative Cover Edition can be found here. After thousands of years searching, humans stand on the verge of first contact with an alien race. Two human groups: the Qeng Ho, a culture of free traders, and the Emergents, a ruthless society based on the technological enslavement of minds.The group that opens trade with the aliens will reap unimaginable riches. But first, both groups must wait at the aliens' very doorstep for their strange star to relight and for their planet to reawaken, as it does every two hundred and fifty years....Then, following terrible treachery, the Qeng Ho must fight for their freedom and for the lives of the unsuspecting innocents on the planet below, while the aliens themselves play a role unsuspected by the Qeng Ho and Emergents alike.More than just a great science fiction adventure, A Deepness in the Sky is a universal drama of courage, self-discovery, and the redemptive power of love. A Deepness in the Sky is a 1999 Nebula Award Nominee for Best Novel and the winner of the 2000 Hugo Award for Best Novel.
376	Poems	1983	9	50	299	https://images.gr-assets.com/books/1348553737l/1945842.jpg	J.H. Prynne is Britain's leading late Modernist poet. His austere yet playful poetry challenges our sense of the world, not by any direct address to the reader but by showing everything in a different light, enacting slips and changes of meaning through shifting language. When his Poems was first published in 1999, it was immediately acclaimed as a landmark in modern poetry. This expanded edition includes four later collections only previously available in limited editions.
377	Great Mysteries of the Past: Experts Unravel Fact and Fallacy Behind the Headlines of History	1994	10	34	300	https://images.gr-assets.com/books/1335772923l/1437380.jpg	An entertaining collection of true stories about ordinary people and events that mark the milestones of history and affect our lives today. Great Mysteries of the Past features nearly 100 accounts arranged in seven thematic sections that raise provocative questions about the nature of history, and about human nature. 400 photos and illustrations.
378	Homegoing	1990	9	56	301	https://images.gr-assets.com/books/1448108591l/27071490.jpg	A novel of breathtaking sweep and emotional power that traces three hundred years in Ghana and along the way also becomes a truly great American novel. Extraordinary for its exquisite language, its implacable sorrow, its soaring beauty, and for its monumental portrait of the forces that shape families and nations, Homegoing heralds the arrival of a major new voice in contemporary fiction.Two half-sisters, Effia and Esi, are born into different villages in eighteenth-century Ghana. Effia is married off to an Englishman and lives in comfort in the palatial rooms of Cape Coast Castle. Unbeknownst to Effia, her sister, Esi, is imprisoned beneath her in the castle's dungeons, sold with thousands of others into the Gold Coast's booming slave trade, and shipped off to America, where her children and grandchildren will be raised in slavery. One thread of Homegoing follows Effia's descendants through centuries of warfare in Ghana, as the Fante and Asante nations wrestle with the slave trade and British colonization. The other thread follows Esi and her children into America. From the plantations of the South to the Civil War and the Great Migration, from the coal mines of Pratt City, Alabama, to the jazz clubs and dope houses of twentieth-century Harlem, right up through the present day, Homegoing makes history visceral, and captures, with singular and stunning immediacy, how the memory of captivity came to be inscribed in the soul of a nation. Generation after generation, Yaa Gyasi's magisterial first novel sets the fate of the individual against the obliterating movements of time, delivering unforgettable characters whose lives were shaped by historical forces beyond their control. Homegoing is a tremendous reading experience, not to be missed, by an astonishingly gifted young writer.
640	Steal Away: Selected and New Poems	2002	10	50	479	https://images.gr-assets.com/books/1328758015l/139880.jpg	Now in paperback, Steal Away presents C.D. Wright’s best lyrics, narratives, prose poems, and odes with new "retablos" and a bracing vigil on incarceration. Long admired as a fearless poet writing authentically erotic verse, Wright—with her Southern accent and cinematic eye—couples strangeness with uncanny accuracy to create poems that "offer a once-and-for-all thing, opaque and revelatory, ceaselessly burning."from "Our Dust"You didn’t know my weariness, error, incapacity,I was the poetof shadow work and towns with quarter-inchphone books, of failedroadside zoos. The poet of yard eggs andsharpening shops,jobs at the weapons plant and the Maybellinefactory on the penitentiary road."Wright has found a way to wed fragments of an iconic America to a luminously strange idiom, eerie as a tin whistle."—The New Yorker"Wright shrinks back from nothing."—Voice Literary Supplement"C.D. Wright is a devastating visionary. She writes in light. She sets language on fire."—American LettersC.D. Wright has published nine collections of poetry and earned many awards, including the Lannan Literary Award and a Guggenheim Fellowship. She teaches at Brown University and in 1994 was named State Poet of Rhode Island. With her husband, Forrest Gander, she edits Lost Roads Publishers.
381	The Complete Robot	1983	10	53	304	https://images.gr-assets.com/books/1405467461l/50091.jpg	THE COMPLETE ROBOT is the definitive anthology of Asimov's stunning visions of a robotic future… In these stories, Isaac Asimov creates the Three Laws of Robotics and ushers in the Robot Age: when Earth is ruled by master-machines and when robots are more human than mankind.Contents 9 • Introduction (The Complete Robot) • (1982) • essay by Isaac Asimov 15 • A Boy's Best Friend • (1975) • short story by Isaac Asimov 19 • Sally • (1953) • short story by Isaac Asimov 41 • Someday • (1956) • short story by Isaac Asimov 55 • Point of View • [Multivac] • (1975) • short story by Isaac Asimov 59 • Think! • (1977) • short story by Isaac Asimov 70 • True Love • (1977) • short story by Isaac Asimov 77 • Robot AL-76 Goes Astray • (1942) • short story by Isaac Asimov 93 • Victory Unintentional • (1942) • short story by Isaac Asimov 117 • Stranger in Paradise • (1974) • novelette by Isaac Asimov 151 • Light Verse • (1973) • short story by Isaac Asimov 157 • Segregationist • (1967) • short story by Isaac Asimov 164 • Robbie • (1940) • short story by Isaac Asimov (variant of Strange Playfellow) 191 • Let's Get Together • (1957) • short story by Isaac Asimov 211 • Mirror Image • [Elijah Bailey / R. Daneel Olivaw] • (1972) • short story by Isaac Asimov 231 • The Tercentenary Incident • (1976) • short story by Isaac Asimov 253 • First Law • [Mike Donovan] • (1956) • short story by Isaac Asimov 257 • Runaround • [Mike Donovan] • (1942) • novelette by Isaac Asimov 280 • Reason • [Mike Donovan] • (1941) • short story by Isaac Asimov 302 • Catch That Rabbit • [Mike Donovan] • (1944) • short story by Isaac Asimov 329 • Liar! • [Susan Calvin] • (1941) • short story by Isaac Asimov 350 • Satisfaction Guaranteed • [Susan Calvin] • (1951) • short story by Isaac Asimov 368 • Lenny • [Susan Calvin] • (1958) • short story by Isaac Asimov 385 • Galley Slave • [Susan Calvin] • (1957) • novelette by Isaac Asimov 427 • Little Lost Robot • [Susan Calvin] • (1947) • novelette by Isaac Asimov 459 • Risk • [Susan Calvin] • (1955) • novelette by Isaac Asimov 490 • Escape! • [Susan Calvin] • (1945) • short story by Isaac Asimov 518 • Evidence • [Susan Calvin] • (1946) • novelette by Isaac Asimov 546 • The Evitable Conflict • [Susan Calvin] • (1950) • novelette by Isaac Asimov 575 • Feminine Intuition • [Susan Calvin] • (1969) • novelette by Isaac Asimov 605 • ... That Thou Art Mindful of Him • (1974) • novelette by Isaac Asimov (variant of —That Thou Art Mindful of Him!) 635 • The Bicentennial Man • (1976) • novelette by Isaac Asimov 683 • A Last Word • (1982) • essay by Isaac Asimov  THE COMPLETE ROBOT is the ultimate collection of timeless, amazing and amusing robot stories from the greatest science fiction writer of all time, offering golden insights into robot thought processes. Asimov's Three Laws of Robotics were programmed into real computers thirty years ago at the Massachusetts Institute of Technology - with surprising results. Readers of today still have many surprises in store...
382	By Any Other Name	2001	9	24	305	https://images.gr-assets.com/books/1355661472l/17032324.jpg	Detective Harris was put on the case because he was the best man for the job, but with five unconnected bloody corpses on his hands and no witnesses he was beginning to wonder whether they were ever going to catch the maniac that was loose in the Rosehill area of Ipswich. Life had been good for Emma since she moved to Ipswich. She had a new home, good friends and great job but all that was about to change starting with the first of many phone calls. Roses are white, Blood is red, Look like her, And you'll be dead!
401	Head-On/Repossessed	2000	0	7	318	https://images.gr-assets.com/books/1356443256l/801878.jpg	Julian Cope's highly acclaimed autobiography and its long-awaited sequel in one extraordinary volume. Contents: Julian Cope shot to fame with eighties band 'Teardrop Explodes' during the Punk era. Hailed as a visionary by those people who recognise his genius and a madman by those who find him perplexing, he has become a cult figure in the music world. Head-On has previously only been available via 'Head Heritage' Julian's own company. Repossesed picks up in 1983 where Head On ends and continues up until 1989. Written in Cope's inimitable style it is set to provoke the same kind of media excitement.
383	Two Little Savages	1950	8	58	306	https://images.gr-assets.com/books/1328865394l/1282886.jpg	This work has been selected by scholars as being culturally important, and is part of the knowledge base of civilization as we know it. This work was reproduced from the original artifact, and remains as true to the original work as possible. Therefore, you will see the original copyright references, library stamps (as most of these works have been housed in our most important libraries around the world), and other notations in the work. This work is in the public domain in the United States of America, and possibly other nations. Within the United States, you may freely copy and distribute this work, as no entity (individual or corporate) has a copyright on the body of the work.As a reproduction of a historical artifact, this work may contain missing or blurred pages, poor pictures, errant marks, etc. Scholars believe, and we concur, that this work is important enough to be preserved, reproduced, and made generally available to the public. We appreciate your support of the preservation process, and thank you for being an important part of keeping this knowledge alive and relevant.
386	Visions	1989	9	9	309	https://images.gr-assets.com/books/1348342734l/13583266.jpg	Welcome to the world of Owen Ryer and The Secret Watchers. What would you do if you suddenly discovered that you could not only sense dark energy but individuals with evil in their hearts? What if you were given hints about horrible things that had already happened and you had no choice but to fix them? What if these things you were driven to do were not only dangerous but had to be concealed? Who could you trust with this perilous secret? How would you handle homework and chores when you felt like the weight of the world rested on your shoulders? Owen feels he has no choice... What would you do? Would you have the courage to try? In Visions (The Secret Watchers, Book One) fourteen-year-old Owen Ryer hates school and his life in general, but dreams that there must be something more... until he is irrevocably drawn to a watch in an old pawnshop that unlocks his amazing and unexpected gift. Now it’s a race to see if Owen can master his special ability before the dark watchers destroy or turn him to the side of evil and chaos.  You will experience Owen’s confusion, frustration and compassion as he discovers that it is demanding enough just to be a teenager, let alone have a secret as big as the one he is burdened with. Who should he trust? Who can help him? Typically watchers work alone but Owen is the next generation - should he be the one to challenge the rules? Everyone needs a hero and sometimes the best ones are the unintentional ones. Owen is that kind of guy as he searches for purpose, acceptance and morality. He isn’t perfect, he doesn’t always do things right, but he has the greater good at heart – always.  You are invited to follow Owen as he journeys through the darkest walk he has ever taken; where he captures glimpses of the underbelly of society, a place he never knew existed and didn’t want to see. After you read Visions, will you be looking under your bed and double checking your closet? Please enter the Secret Watchers universe if you dare but beware – you may be sucked right into the good versus evil suspense of jaw-clenching action and never want to leave.
404	The Only One	2003	0	42	321	https://images.gr-assets.com/books/1401652716l/21793828.jpg	In the final installment to the popular End of Days series, Heaven still belongs to a mad tyrant, and Michaela is losing her battle to save the dying world. But the tides are turning. With Gabriel’s fallen army, Michaela can finally start a war with the holy angels, which means she has to take care of the Watchers once and for all. Michaela doesn’t realize her best friend has his own vengeful plan for the Watchers.Even amidst a war, Michaela and Gabriel bask in a sliver of happiness. With every touch and kiss, Michaela discovers a new home in Gabriel’s arms. Yet happiness is ever fleeting, and Michaela learns of a vision that foretells of the greatest sacrifice she’ll ever make for Heaven. But what is sacrifice in the face of tyranny and madness? It’s a lesson Michaela may not live long enough to fully understand.
387	101 Dalmatians	1982	7	32	310	https://images.gr-assets.com/books/1342554257l/1223007.jpg	There are more than 101 things to love about Disney’s 101 Dalmatians! The animated classic from 1961 is being released in a Platinum Edition DVD, so a whole new generation of children will come to love Perdita and Pongo, Cruella DeVil, and all those adorable puppies. This Little Golden Book retells all the tail-wagging excitement of the film.
642	Falls the Shadow	1988	8	56	481	https://images.gr-assets.com/books/1448657270l/77448.jpg	This is Simon de Montfort's story—and the story of King Henry III, as weak and changeable as Montfort was brash and unbending. It is a saga of two opposing wills that would later clash in a storm of violence and betrayal, a story straight from the pages of history that brings the world of the thirteenth century completely, provocatively, and magnificently alive. Above all, this is a story of conflict and treachery, of human frailty and broken legends, a tale of pageantry and grandeur that is as unforgettable as it is real....
495	The House at Pooh Corner	1988	8	32	376	https://images.gr-assets.com/books/1370036373l/7889401.jpg	Winnie-the-Pooh, the Best Bear in All the World, has long been adored by readers young and old. In this beautiful full-color gift edition of "The House at Pooh Corner, " Ernest H. Shepard's classic illustrations have been painstakingly hand-colored. An exquisite volume and the perfect gift for any occasion, this book is as vivid and charming as the beloved characters from the Hundred Acre Wood.
388	Surrender in Moonlight	1988	8	23	311	https://images.gr-assets.com/books/1267351592l/7795393.jpg	Book two in the Knossos West SeriesThe plan was to steal his bike and ride outta town. She didn't count of him stealing her freedom, or her heart.Reece Evans, the nest bad boy and only male Anaconda in the NY nest, is NOT looking for a mate, but he is looking for a wild ride. When he goes to Dry Ice one night, he meets Carmen - a viper and a rogue - and the attraction is beyond hot.When she steals his motorcycle from under his nose and then calls him to bail her out, Reece sees his opportunity for a very satisfying tryst still within his grasp. He agrees, on the condition that she stays with him a month, and becomes his sexy plaything.Little does he know he's sealed his fate, Carmen is exactly the snake he never knew he couldn't live without.Reader Advisory: This book contains scenes of masturbation.
389	Light From Many Lamps	1988	8	1	312	https://images.gr-assets.com/books/1347739312l/1270698.jpg	A classic treasury of inspiration featuring hundreds of passages and quotations—selected from the wisdom of the ages—offering invaluable insight and guidance on the challenges of daily life.Here are not only the best of the world’s most inspiring thoughts and ideas, but the stories behind them: how they came to be written and what their impact has been on others. A storehouse of inspired and inspiring reading, it is a collection of brief, stimulating biographies as well. There are selections from John Burroughs, Alfred Tennyson, Robert Browning, Elizabeth Barrett Browning, Abraham Lincoln, Franklin D. Roosevelt, William Cullen Bryant, Ralph Waldo Emerson, William Shakespeare, Hippocrates, Confucius, and many others. A distillation of the greatest thoughts, ideas, and philosophies that have been handed down to us through the ages, this is a book to turn to over and over again—a book of moral, spiritual, and ethical guidance—an unfailing source of comfort and inspiration for all.
390	The Element of Lavishness: Letters of William Maxwell and Sylvia Townsend Warner, 1938-1978	2000	9	1	313	https://images.gr-assets.com/books/1385245257l/219845.jpg	An instant classic in the literature of friendship: the witty, affectionate 40-year correspondence between a great story-writer and her New Yorker editor. For forty years, until her death in 1978, Sylvia Townsend Warner (poet, novelist, and short-story writer) and her New Yorker editor William Maxwell (himself a fiction writer of great distinction) exchanged more than 1,300 letters. Their formal relationship quickly grew into a real, unshakable love, and their letters back and forth became the most significant and longest-lasting correspondence of their lives. As Maxwell told the editor of these letters, "Sylvia needed to write for an audience, a specific person, in order to bring out her pleasure in enchanting," and Maxwell was that person, both as editor and as correspondent. Warner brought out the best in Maxwell too. "I suspect that of all the writers I edited, I was most influenced by Sylvia...I think that what you are infinitely charmed by you can't help unconsciously imitating. " In these letters they wrote about everything that amused, moved, and perplexed them-the physical world, personal relationships, the New York City blackout, the Cuban missile crisis, their ceaseless reading, the coming of old age. Gratitude and love are on every page. Not to mention pleasure and delight.
391	Ride the Wind	1985	9	56	314	https://images.gr-assets.com/books/1320493238l/165446.jpg	In 1836, when she was nine years old, Cynthia Ann Parker was kidnapped by Comanche Indians. This is the story of how she grew up with them, mastered their ways, married one of their leaders, and became, in every way, a Comanche woman. It is also the story of a proud and innocent people whose lives pulsed with the very heartbeat of the land. It is the story of a way of life that is gone forever....
392	Exile	1995	9	9	315	https://images.gr-assets.com/books/1365178949l/13260670.jpg	Sophie Foster thought she was safe. Settled into her home at Havenfield, surrounded by friends, and using her unique telepathic abilities to train Silveny--the first female alicorn ever seen in the Lost Cities--her life finally seems to be coming together. But Sophie's kidnappers are still out there. And when Sophie discovers new messages and clues from the mysterious Black Swan group, she’s forced to take a terrifying risk—one that puts everyone in incredible danger. As long buried secrets rise to the surface, it’s once again up to Sophie to uncover hidden memories—before someone close to her is lost forever. In this second book in the Keeper of the Lost Cities series, Sophie must journey to the darkest corners of her luminous world in a sequel that will leave you breathless for more.
393	Nightfall	1990	9	9	315	https://images.gr-assets.com/books/1488996054l/32762917.jpg	Sophie Foster is struggling. Grieving. Scrambling. But she knows one thing: she will not be defeated.The Neverseen have had their victories—but the battle is far from over. It’s time to change tactics. Make sacrifices. Reexamine everything. Maybe even time for Sophie to trust her enemies.All paths lead to Nightfall—an ominous door to an even more ominous place—and Sophie and her friends strike a dangerous bargain to get there. But nothing can prepare them for what they discover. The problems they’re facing stretch deep into their history. And with time running out, and mistakes catching up with them, Sophie and her allies must join forces in ways they never have before.
394	Choices	1985	8	42	316	https://images.gr-assets.com/books/1369569319l/17978278.jpg	Book 4 in The Forever series. Six months after the events at Castle Black, everything has changed for Liv O’Dell. The people in her life, her home, her job, nothing is the same. The only constant is her beloved Louboutins. She struggles to get back the life she wanted and was so close to having, but in this pursuit she is alone. If that were not enough, the mysterious Hunter and her energy sapping powers just keep making things worse.Then along comes the fun loving Sebastian. He is enough to turn her head but is there more to him than meets the eye? To Liv he is forbidden fruit, but that just makes him more appealing. With her husband living in a different city, her charge abandoning her, a sire who can’t get over her betrayal, and an Alpha mate to deal with all Liv wants is a bit of a time out.But with the appearance of yet another of her loyal subjects, Liv and her men travel to learn more about her heritage. Forced to endure a confusing and shocking event that may change her forever, how will Liv and her men get out of this one intact?
416	The Song of the Lioness Quartet	2003	0	9	326	https://images.gr-assets.com/books/1391833339l/492490.jpg	The Barnes & Noble ReviewFans of Tamora Pierce's stellar saga about Alanna of Trebond can now get all four books one boxed set!Packaged together for the first time, the Song of the Lioness quartet is the adventurous story of one girl's journey to overcome the obstacles facing her, become a valiant knight, and save Tortall from conquest. Alanna douses her female identity to begin her training in Alanna: The First Adventure, and when she gains squire status in In the Hand of the Goddess, her growing abilities make her a few friends -- and many enemies. Books 3 and 4 complete Alanna's adventure and secure her legend, with the new knight errant taking on desert tribesmen in The Woman Who Rides like a Man and seeking out the powerful Dominion Jewel in Lioness Rampant.A must-read for Pierce's loyal followers and a perfect starting point for readers not yet familiar with her work, this boxed set is fantasy writing at its best. Pierce's gifted writing -- and her knack for creating heroines unafraid to challenge the status quo -- shines brightly in this Lioness set, taking it to the highest ranks, just like Alanna herself. Shana Taylor
395	Trials	1998	10	42	316	https://images.gr-assets.com/books/1372056547l/18113200.jpg	Book 6 in The Forever series. Delve deeper into the dark life of Liv as a mysterious power sets its sights on her. Succumbing to time shifts and the manifestations that haunt her, Liv struggles to understand Cole’s turn towards the dark side and CK’s plea. Help to defeat this evil power comes from a surprising and not very pleasant source. But forced to do things she would normally avoid, she learns even more about her true heritage and what the future holds for her. Neither are what she expected, and when she suddenly finds herself trapped and unable to get home, control slips out of her grasp. Can Liv continue to endure when all appears lost?
396	Revelation	1998	10	42	316	https://images.gr-assets.com/books/1370499615l/18042652.jpg	Book 3 in the Forever Series. Liv is gaining control of her true powers, a change that begins to alter her sense of identity. Revelations she has pushed for, come to pass, but Liv realizes that learning of her past has only made it catch up with her.As she learns more about the mysterious stranger, the man that terrifies her the most comes back into her life, but she is determined to finish him once and for all. As new developments arise, Liv and the three men she loves work together to bring the future they desire to reality as a declaration is made that will forever change their lives. Old enemies and new friends all make for an exciting new chapter in Liv’s life but does she have the strength to see it through?
399	Deadly Games	2003	9	9	317	https://images.gr-assets.com/books/1328030795l/13044650.jpg	When you’ve been accused of kidnapping an emperor, and every enforcer in the city wants your head, it’s hard to prove yourself an honorable person and even harder to earn an imperial pardon.That doesn’t keep Amaranthe Lokdon and her team of outlaws from trying. When athletes start disappearing from the Imperial Games, they may finally have an opportunity to show the emperor that they’re on his side. If she and her comrades can get to the bottom of such a public mystery, they’re sure to get the credit.But plans go awry when Amaranthe’s own men start plotting against each other, the new ally she’d hoped to acquire tries to turn her in, and her best fighter—and closest friend—disappears. Maybe getting involved wasn’t such a good idea after all…Deadly Games is approximately 110,000 words. It is the third book in The Emperor's Edge series.
400	Conspiracy	2001	9	9	317	https://images.gr-assets.com/books/1334534633l/13603792.jpg	When you’re an outlaw hoping for a pardon, and the emperor personally sends a note requesting that your team kidnap him, you make plans to comply…Even if it’ll involve infiltrating a train full of soldiers, bodyguards, and spies loyal to a nefarious business coalition that has numerous reasons to hate you.Even if it means leaving the city right after you’ve uncovered a secret weapons shipment that might be meant to start a war.Even if it's a trap...
402	Soulmates Dissipate	2002	9	20	319	https://images.gr-assets.com/books/1388200256l/59748.jpg	A soulful, sexy tale of true love tested, this bestselling debut novel began an exciting series that continues to explore life's most intense relationships. . .Fashion photographer Jada Diamond Tanner may have her pick of fine men, but no one has captured her heart like gorgeous financial advisor Wellington Jones. From their first embrace, Jada knows he is the soulmate she has waited for. But while the love she shares with Wellington is exhilarating, Jada faces challenges she never imagined--from a beautiful rival, hungry for love, and from Wellington's overbearing socialite mother, who believes Jada will never fit into her circle. Forced to make difficult choices, Jada learns painful lessons about trust and commitment. . .and discovers the courage to celebrate each day, with or without the man she loves.
403	Quest	1988	9	32	320	https://images.gr-assets.com/books/1400890167l/20708773.jpg	Aaron Becker, creator of Journey, a Caldecott Honor book, presents the next chapter in his stunning wordless fantasy.A king emerges from a hidden door in a city park, startling two children sheltering from the rain. No sooner does he push a map and some strange objects into their hands than he is captured by hostile forces that whisk him back through the enchanted door. Just like that, the children are caught up in a quest to rescue the king and his kingdom from darkness, while illuminating the farthest reaches of their imagination. Colored markers in hand, they make their own way through the portal, under the sea, through a tropical paradise, over a perilous bridge, and high in the air with the help of a winged friend. Journey lovers will be thrilled to follow its characters on a new adventure threaded with familiar elements, while new fans will be swept into a visually captivating story that is even richer and more exhilarating than the first.
405	Story of a Soul: The Autobiography of St. Therese of Lisieux	1976	7	17	322	https://images.gr-assets.com/books/1178067537l/754771.jpg	This book, first published in 1898 in a highly edited version, quickly became a modern spiritual classic, read by millions and translated into over fifty-five languages. John Clarke's acclaimed translation, first published in 1975, is now accepted as the standard throughout the English-speaking world.
643	The Sunne in Splendour	1990	9	56	481	https://images.gr-assets.com/books/1361649213l/119829.jpg	A glorious novel of the controversial Richard III - a monarch betrayed in life by his allies and betrayed in death by history.In this beautifully rendered modern classic, Sharon Kay Penman redeems Richard III - vilified as the bitter, twisted, scheming hunchback who murdered his nephews, the princes in the Tower - from his maligned place in history with a dazzling combination of research and storytelling. Born into the treacherous courts of fifteenth-century England, in the midst of what history has called The War of the Roses, Richard was raised in the shadow of his charismatic brother, King Edward IV. Loyal to his friends and passionately in love with the one woman who was denied him, Richard emerges as a gifted man far more sinned against than sinning. This magnificent retelling of his life is filled with all of the sights and sounds of battle, the customs and lore of the fifteenth century, the rigors of court politics, and the passions and prejudices of royalty.
424	Stolen Legacy: Greek Philosophy is Stolen Egyptian Philosophy	1992	9	34	333	https://images.gr-assets.com/books/1266817529l/1496002.jpg	The Teachings of the Egyptian Mysteries Reached Other Lands Many Centuries Before It Reached Athens..."
406	Long Walk to Freedom: Autobiography of Nelson Mandela	1994	9	17	323	https://images.gr-assets.com/books/1391135538l/9018.jpg	Read by Danny Glover, with an introduction by Kofi Annan.  Nelson Mandela is one of the great moral and political leaders of our time: an international hero whose lifelong dedication to the fight against racial oppression in South Africa won him the Nobel Peace Prize and the presidency of his country. Since his triumphant release in 1990 from more than a quarter-century of imprisonment, Mandela has been at the center of the most compelling and inspiring political drama in the world. As president of the African National Congress and head of South Africa's antiapartheid movement, he was instrumental in moving the nation toward multiracial government and majority rule. He is revered everywhere as a vital force in the fight for human rights and racial equality. LONG WALK TO FREEDOM is his moving and exhilarating autobiography, destined to take its place among the finest memoirs of history's greatest figures. Here for the first time, Nelson Rolihlahla Mandela tells the extraordinary story of his life--an epic of struggle, setback, renewed hope, and ultimate triumph.
409	Harry Potter y la cámara secreta	1999	9	9	325	https://images.gr-assets.com/books/1410279516l/357545.jpg	Tras derrotar una vez más a lord Voldemort, su siniestro enemigo en Harry Potter y la piedra filosofal, Harry espera impacientemente en casa de sus insoportables tíos el inicio del segundo curso del Colegio Hogwarts de Magia y Hechicería. Sin embargo, la espera dura poco, pues un elfo aparece en su habitación y le advierte que una amenaza mortal se cierne sobre la escuela. Así pues, Harry no se lo piensa dos veces y, acompañado de Ron, su mejor amigo, se dirige a Hogwarts en un coche volador. Pero ¿puede un aprendiz de mago defender la escuela de los malvados que pretenden destruirla? Sin saber que alguien ha abierto la Cámara de los Secretos, dejando escapar una serie de monstruos peligrosos, Harry y sus amigos Ron y Hermione tendrán que enfrentarse con arañas gigantes, serpientes encantadas, fantasmas enfurecidos y, sobre todo, con la mismísima reencarnación de su más temible adversario.
410	Harry Potter Schoolbooks Box Set: Two Classic Books from the Library of Hogwarts School of Witchcraft and Wizardry	2001	9	9	325	https://images.gr-assets.com/books/1479775271l/2002.jpg	There is an alternate cover edition for this ISBN13 here.Fans of Harry Potter will love the chance to really get inside the Hogwarts School of Witchcraft and Wizardry. Now, straight from the Hogwarts School Library, come two textbooks used by Harry and all his fellow wizards-in-training. Written by J. K. Rowling under two delightful pseudonyms, Quidditch Through the Ages and Fantastic Beasts & Where to Find Them come packaged in a fabulous box set.Did you know that in 1938 the wizard Zacharias Mumps set down the first full description of the game of Quidditch? Written by a renowned Quidditch expert (and "the author of many Quidditch-related works"), Quidditch Through the Ages reveals everything readers need to know about the most important sport in the wizarding world. From the evolution of the flying broomstick and the rules for playing Quidditch to the changes in the sport since the 14th century (up until today) and details about all the Quidditch teams of Britain and Ireland, this book is a must-have for Quidditch fans old and new. Well researched and filled with diagrams, definitions, and more, Quidditch Through the Ages is what every wizard-in-training needs to be a pro. Fantastic Beasts & Where to Find Them offers a complete listing of all the fantastic beasts that exist in Harry Potter's world. From the Acromantula ("a monstrous eight-eyed spider capable of human speech") to the Yeti ("also known as Bigfoot, the Abominable Snowman"), here's well-researched information on where they come from, what they look like, what they eat, and, most important, what to do if you ever meet one face-to-face. This indispensible textbook also includes insight into Muggle awareness of fantastic beasts, information on why Magizoology matters, and much more. Adding to the fun and authenticity, Fantastic Beasts & Where to Find Them features scribbled comments in the margins from Harry Potter, the previous owner of this book, as well as his friends Ron and Hermione.
411	Harry Potter and the Sorcerer's Stone	1999	10	9	325	https://images.gr-assets.com/books/1474154022l/3.jpg	Harry Potter's life is miserable. His parents are dead and he's stuck with his heartless relatives, who force him to live in a tiny closet under the stairs. But his fortune changes when he receives a letter that tells him the truth about himself: he's a wizard. A mysterious visitor rescues him from his relatives and takes him to his new home, Hogwarts School of Witchcraft and Wizardry.After a lifetime of bottling up his magical powers, Harry finally feels like a normal kid. But even within the Wizarding community, he is special. He is the boy who lived: the only person to have ever survived a killing curse inflicted by the evil Lord Voldemort, who launched a brutal takeover of the Wizarding world, only to vanish after failing to kill Harry.Though Harry's first year at Hogwarts is the best of his life, not everything is perfect. There is a dangerous secret object hidden within the castle walls, and Harry believes it's his responsibility to prevent it from falling into evil hands. But doing so will bring him into contact with forces more terrifying than he ever could have imagined.Full of sympathetic characters, wildly imaginative situations, and countless exciting details, the first installment in the series assembles an unforgettable magical world and sets the stage for many high-stakes adventures to come.
412	Harry Potter and the Goblet of Fire	2002	9	9	325	https://images.gr-assets.com/books/1361482611l/6.jpg	Harry Potter is midway through his training as a wizard and his coming of age. Harry wants to get away from the pernicious Dursleys and go to the International Quidditch Cup. He wants to find out about the mysterious event that's supposed to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasn't happened for a hundred years. He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, he's not normal - even by wizarding standards. And in his case, different can be deadly. --back cover
413	Harry Potter and the Prisoner of Azkaban	2000	9	9	325	https://images.gr-assets.com/books/1499277281l/5.jpg	Harry Potter's third year at Hogwarts is full of new dangers. A convicted murderer, Sirius Black, has broken out of Azkaban prison, and it seems he's after Harry. Now Hogwarts is being patrolled by the dementors, the Azkaban guards who are hunting Sirius. But Harry can't imagine that Sirius or, for that matter, the evil Lord Voldemort could be more frightening than the dementors themselves, who have the terrible power to fill anyone they come across with aching loneliness and despair. Meanwhile, life continues as usual at Hogwarts. A top-of-the-line broom takes Harry's success at Quidditch, the sport of the Wizarding world, to new heights. A cute fourth-year student catches his eye. And he becomes close with the new Defense of the Dark Arts teacher, who was a childhood friend of his father. Yet despite the relative safety of life at Hogwarts and the best efforts of the dementors, the threat of Sirius Black grows ever closer. But if Harry has learned anything from his education in wizardry, it is that things are often not what they seem. Tragic revelations, heartwarming surprises, and high-stakes magical adventures await the boy wizard in this funny and poignant third installment of the beloved series.--scholastic.com
415	The Immortals	1997	9	9	326	https://images.gr-assets.com/books/1378735988l/153797.jpg	The Immortals by Tamora Pierce, is the story of Sarrasri (known as Daine), a parentless girl with an extraordinary talent. Daine finds a job that takes her and her pet Cloud from her home country of Galla to the kingdom of Tortall where she finds a new life and a new family, and learns that she has the magical ability known as "Wild Magic," which enables her to speak to animals, heal them, and take their shape as well as bend them to her will. She makes new friends with creatures, including the black-robe mage Numair Salmalin, a young dragon named Skysong (nicknamed Kitten), the lioness, Alanna of Trebond, King Jonathan, and Queen Thayet of Tortall. (powerofdreams)
417	A Land Remembered	1986	9	56	327	https://images.gr-assets.com/books/1388247432l/362002.jpg	A Land Remembered has been ranked #1 Best Florida Book eight times in annual polls conducted by Florida Monthly Magazine.In this best-selling novel, Patrick Smith tells the story of three generations of the MacIveys, a Florida family who battle the hardships of the frontier to rise from a dirt-poor Cracker life to the wealth and standing of real estate tycoons. The story opens in 1858, when Tobias MacIvey arrives in the Florida wilderness to start a new life with his wife and infant son, and ends two generations later in 1968 with Solomon MacIvey, who realizes that the land has been exploited far beyond human need. The sweeping story that emerges is a rich, rugged Florida history featuring a memorable cast of crusty, indomitable Crackers battling wild animals, rustlers, Confederate deserters, mosquitoes, starvation, hurricanes, and freezes to carve a kingdom out of the swamp. But their most formidable adversary turns out to be greed, including finally their own. Love and tenderness are here too: the hopes and passions of each new generation, friendships with the persecuted blacks and Indians, and respect for the land and its wildlife.A Land Remembered was winner of the Florida Historical Society's Tebeau Prize as the Most Outstanding Florida Historical Novel. Now in its 14th hardcover printing, it has been in print since 1984 and is also available in trade paperback.
418	Ghost Hunter	1985	8	9	328	https://images.gr-assets.com/books/1415589501l/4326206.jpg	Her cry rips the souls from your marrow. With her spear she snares them. She devours them. Eostra truly is an eater of souls.Winter is coming. Souls' Night draws near. Eostra, the Eagle Owl Mage, holds the clans in the grip of terror. Torak must leave the Forest and seek her lair in the Mountain of Ghosts, while Renn faces an agonizing decision. Wolf, their faithful pack-brother, must overcome wrenching grief. And in the final battle against the forces of darkness, Torak will make the most shattering choice of all.Ghost Hunter, the final book in the Chronicles of Ancient Darkness series, draws the reader for the last time into the shadowy world of the deep past and brings Torak to the end of his incredible journey.
419	The Real Mother Goose	1994	7	32	329	https://images.gr-assets.com/books/1439507704l/1001896.jpg	For nearly a century, The Real Mother Goose® has delighted young children!For more than seventy-five years THE REAL MOTHER GOOSE has been delighting millions of children, and today the magic is as strong as ever. Heralded as the "standard" Mother Goose by parents, grandparents, teachers, and librarians, this wonderful book with Blanche Fisher Wright's lively, colorful pictures makes an enchanting introduction for the very young.Mother Goose rhymes are a vital part of childhood. And this collection of essential rhymes have been reproduced exactly as they have been repeated from generation to generation.
420	The Physician	1991	10	56	330	https://images.gr-assets.com/books/1389582565l/4692.jpg	In the 11th century, Rob Cole left poor, disease-ridden London to make his way across the land, hustling, juggling, peddling cures to the sick—and discovering the mystical ways of healing. It was on his travels that he found his own very real gift for healing—a gift that urged him on to become a doctor. So all consuming was his dream, that he made the perilous, unheard-of journey to Persia, to its Arab universities where he would undertake a transformation that would shape his destiny forever.
421	Lost World	1997	8	16	331	https://images.gr-assets.com/books/1418410217l/23206449.jpg	Lost World, the fourth book in the Broken World series, continues following a group of survivors after a super-virus has destroyed the world and the dead have come back to claim it as their own...  With their shelter destroyed and their sense of security shattered, Vivian, Axl and the group set off in search of a safe place. But the group’s morale is at an all-time low, and they now know it’s not just the dead they have to fear. Weeks of wandering brings sickness, death and loss to the survivors, and Vivian soon finds herself losing hope of ever discovering a safe place to live. To make matters worse, two members of the group go missing, leaving the others to wonder not only what happened to them, but if they will ever see their friends alive again. After what happened in Vegas, Hadley feels like a stranger in her own body. When she and Jon get separated from the rest of the group, she finds herself confronted not only with the scars left behind by her ordeal, but facing the possibility of a new beginning with Jon at her side. In a twist of fate, Vivian and Axl stumble upon a place that could be the group’s salvation, only to have hope slip through their fingers once again when they are met with the most devastating blow yet…
422	New World	1996	10	16	331	https://images.gr-assets.com/books/1441844029l/25780673.jpg	New World, book five in the Broken World series, continues following a group of survivors after a super-virus has decimated the human race and the dead have come back to claim it as their own...After weeks on the road and devastating losses, the survivors have finally found safety. But as winter falls on Colorado, it brings with it both new challenges, and new hope.Axl and VivianWith supplies running low and animals scarce, not even the freezing zombies do much to make the future look bright for Axl’s group. As the snow grows deeper, Vivian’s concern for Hadley and Jon only becomes more intense. Each day seems to bring more challenges, and every week that passes with no sign of their friends makes it more difficult for the group to believe life can ever return to normal.Jon and GinnyHope Springs is an opportunity to start over for Ginny and Jon. Even though their worries for their lost friends are never completely gone, the couple throws themselves into building a new world for their baby. But as Jon works to clean out the city, Ginny struggles to find herself and embrace the second chance she’s been given. But with the ever-present threat of both man and the undead surrounding them, optimism is a difficult thing to hold onto...
423	Taking Charge	1977	9	23	332	https://images.gr-assets.com/books/1394265251l/21276354.jpg	Joy moved in to town to take up her position at the school as the Principal. She was sure she was going to have a lot of uphill from the townsfolk. There were many changes that would have to be made at the school. Would she be able to win the parents and pupils over? As far as her looks, Joy knew she was totally different to what everyone expected. She was young and full of life, outgoing, an extrovert, and a go getter. Would the parents accept her as the new Principal? The first day that Joy was in town she met Jordan. She hadn’t planned on falling in love but it happened so fast. The way Jordan sang to her and looked at her sent Joy’s pulse racing. Jordan was drawn to Joy. There was something about her that grabbed his attention. Everything was about to change for both Jordan and Joy. Her presence made a huge impact on the townsfolk. It was the little things that she did that made a huge difference. Not only did the pupils benefit but so did every single person in town.
426	Kiss Me	1997	8	23	335	https://images.gr-assets.com/books/1351772341l/16073993.jpg	From USA Today,  bestselling author Jillian Dodd comes the second book in the addictive Keatyn Chronicles series. Discover a breathless fairy-tale romance with swoon-worthy characters, suspense, and a glittering celebrity world. Fans of Gossip Girl, Pretty Little Liars, and reality TV will devour this pulse-pounding, sexy teen drama set against the backdrop of Hollywood and an East Coast boarding school. Keatyn’s always written scripts for her perfect life, but there’s no way she could have ever scripted this. Her life is so far from perfect, it’s not even funny—all because of a stalker. Now she’s at a boarding school, where she has to lie about who she is. She can’t see her family. She’s tutoring a hottie god that tortures her with his smile. The most popular girl already hates her. But there’s this boy. This hot, sweet, sexy boy. So she decides to stop scripting her life and just live it.Because who knows how long she has left.
427	Love Me	2003	9	23	335	https://images.gr-assets.com/books/1356676100l/16401102.jpg	From USA Today,  bestselling author Jillian Dodd comes the fourth book in the addictive Keatyn Chronicles series. Discover a breathless fairy-tale romance with swoon-worthy characters, suspense, and a glittering celebrity world. Fans of Gossip Girl, Pretty Little Liars, and reality TV will devour this pulse-pounding, sexy teen drama set against the backdrop of Hollywood and an East Coast boarding school. Keatyn’s mom says that you can’t love someone until you learn to love yourself. So even though Vincent is getting more and more scary and doing a nationwide search for her, Keatyn vows to try to love herself and worry a little less about boys. But there are so many cute ones . . . Dawson - The gorgeous boy who made a mistake, but whose molten lava kisses and steaminess she can’t freaking resist. Aiden - The God of all Hotties, who is practically infused with love potion. Who she thought liked her, but now says he wants to be her friend. Brooklyn - The boy who first stole her heart and has always loved her—well, until the whole cabana incident. And what about Cooper Steele? The new soccer coaching, health teaching, tattooed hottie who was sent to guard her body. What’s a girl to do?
428	Old Turtle	2001	6	32	336	https://images.gr-assets.com/books/1441292029l/228879.jpg	Who is God?Is He a wind that is never still?Is He a rock that never moves?Is He high above or here among us?Venerable Old Turtle answers quietly: God is all of these things.Old Turtle first burst upon the publishing scene in 1992, and it was instantly recognized as a classic fable about ecology, peace, and the interconnectedness of all beings. Simple yet profound, it has since brought hope and inspiration to children and adults around the world.
429	Requiem for a Woman's Soul	1986	8	58	337	https://images.gr-assets.com/books/1326838671l/3943998.jpg	In a town in an unnamed Latin American country, a Catholic priest--racked by moral doubt regarding the Church's social role--discovers the torn papers of a diary belonging to a woman arrested and brutally tortured for no apparent reason
430	Catechism of the Catholic Church	1994	9	8	338	https://images.gr-assets.com/books/1320474441l/110795.jpg	Here it is -- the first new Catechism of the Catholic Church in more than 400 years, a complete summary of what Catholic throughout the world believe in common. This book is the catechism (the word means "instruction") that will serve as the standarad for all future catechisms.The Catechism draws on the Bible, the Mass, the Sacraments, Church tradition and teaching, and the lives of saints. It comes with a complete index, footnotes and cross-references for a fuller understanding of every subject. Using the tradition of explaining what the Church believes (the Creed), what she celebrates (the Sacraments), what she lives (the Commandments), and what she prays (the Lord's Prayer), the Catechism of the Catholic Church offers challenges for believers and answers for all those interested in learning about the mystery of the Catholic faith. Here is a positive, coherent and contemporary map for our spiritual journey toward transformation.The Catechism of the Catholic Church is, as Pope John Paul II calls it, "a special gift."
431	Quantum Computation and Quantum Information	2000	8	55	339	https://images.gr-assets.com/books/1348285880l/153910.jpg	In this first comprehensive introduction to the main ideas and techniques of quantum computation and information, Michael Nielsen and Isaac Chuang ask the question: What are the ultimate physical limits to computation and communication? They detail such remarkable effects as fast quantum algorithms, quantum teleportation, quantum cryptography and quantum error correction. A wealth of accompanying figures and exercises illustrate and develop the material in more depth. They describe what a quantum computer is, how it can be used to solve problems faster than familiar "classical" computers, and the real-world implementation of quantum computers. Their book concludes with an explanation of how quantum states can be used to perform remarkable feats of communication, and of how it is possible to protect quantum states against the effects of noise.
432	A Cat's Life: Dulcy's Story	1992	9	14	340	https://images.gr-assets.com/books/1348822058l/1294874.jpg	On a late winter's day in 1972, a kitten soon to be named Dulcy found a woman worthy to be her human. For the next 17 years, Dulcy and her human learned to communicate on a level deeper than language and to comfort one another with affectionate routines that softened the shocks of an inconstant world.
433	Letters to a Young Poet	2000	9	50	341	https://images.gr-assets.com/books/1321994947l/46199.jpg	In 1903, a student at a military academy sent some of his verses to a well-known Austrian poet, requesting an assessment of their value. The older artist, Rainer Maria Rilke (1875–1926), replied to the novice in this series of letters — an amazing archive of remarkable insights into the ideas behind Rilke's greatest poetry. The ten letters reproduced here were written during an important stage in Rilke's artistic development, and they contain many of the themes that later appeared in his best works. The poet himself afterwards stated that his letters contained part of his creative genius, making this volume essential reading for scholars, poetry lovers, and anyone with an interest in Rilke, German poetry, or the creative impulse.
434	The Selected Poetry of Rainer Maria Rilke	1989	10	50	341	https://images.gr-assets.com/books/1343101334l/46201.jpg	Parallel German text and English translation.The influence and popularity of Rilke’s poetry in America have never been greater than they are today, more than fifty years after his death. Rilke is unquestionably the most significant and compelling poet of romantic transformation, of spiritual quest, that the twentieth century has known. His poems of ecstatic identification with the world exert a seemingly endless fascination for contemporary readers.In Stephen Mitchell’s versions, many readers feel that they have discovered an English rendering that captures the lyric intensity, fluency, and reach of Rilke’s poetry more accurately and convincingly than has ever been done before.Mr. Mitchell is impeccable in his adherence to Rilke’s text, to his formal music, and to the complexity of his thought; at the same time, his work has authority and power as poetry in its own right. Few translators of any poet have arrived at the delicate balance of fidelity and originality that Mr. Mitchell has brought off with seeming effortlessness.Originally published: New York : Random House, 1982.
436	Duino Elegies	1992	9	50	341	https://images.gr-assets.com/books/1388391152l/53111.jpg	We have a marvelous, almost legendary image of the circumstances in which the composition of this great poem began. Rainer Maria Rilke was staying at Duino Castle, on a rocky headland of the Adriatic sea near Trieste. One morning he walked out onto the battlements and climbed down to where the cliffs dropped sharply to the sea. From out of the fierce wind, Rilke seemed to hear a voice: Wer, wenn ich schriee, horte mich denn aus der Engel Ordnungen? (If I cried out, who would hear me up there, among the angelic orders?). He wrote these words, the opening of the first Duino Elegy, in his notebook, then went inside to continue what was to be his major opus—completely only after another ten, tormented years of effort—and one of the literary masterpieces of the century. Duino Elegies speaks in a voice that is both intimate and majestic on the mysteries of human life and our attempt, in the words of the translator David Young, “to use our self-consciousness to some advantage: to transcend, through art and the imagination, our self-deception and our fear.”
437	Rilke's Book of Hours: Love Poems to God	1997	10	50	341	https://images.gr-assets.com/books/1363218207l/467164.jpg	At the beginning of this century, a young German poet returned from a journey to Russia, where he had immersed himself in the spirituality he discovered there. He "received" a series of poems about which he did not speak for a long time - he considered them sacred, and different from anything else he ever had done and ever would do again. This poet saw the coming darkness of the century, and saw the struggle we would have in our relationship to the divine. The poet was Rainer Maria Rilke, and these love poems to God make up his Book of Hours.
438	Duino Elegies and The Sonnets to Orpheus	1997	10	50	341	https://images.gr-assets.com/books/1441376624l/53109.jpg	Rilke is one of the most widely read poets of the 20th century. In his poetry, Rilke addresses the problems of death, God, and "destructive time," and attempts to overcome and transform these problems into an indestructive inner world.
455	Loyalty in Death	2004	0	24	352	https://images.gr-assets.com/books/1458243301l/268598.jpg	#1 New York Times bestselling author J. D. Robb's phenomenal series has captivated readers with it tantalizing blend of romance, suspense, and futuristic police procedural. Now, New York cop Eve Dallas returns to face her most ingenious foe -- a "secret admirer" who taunts her with letters...and kills without mercy.LOYALTY IN DEATHAn unknown bomber is stalking New York City. He is sending Eve Dallas taunting letters promising to wreak mass terror and destruction among the "corrupt masses." And when his cruel web of deceit and destruction threatens those she cares for most, Eve fights back. It's her city...it's her job...and it's hitting too close to home. Now, in a race against a ticking clock, Eve must make the pieces fit before the city falls.
439	Homicide: A Year on the Killing Streets	1992	10	1	342	https://images.gr-assets.com/books/1432402772l/18956.jpg	From the creator of HBO's The Wire, the classic book about homicide investigation that became the basis for the hit television show.The scene is Baltimore. Twice every three days another citizen is shot, stabbed, or bludgeoned to death. At the center of this hurricane of crime is the city's homicide unit, a small brotherhood of hard men who fight for whatever justice is possible in a deadly world.David Simon was the first reporter ever to gain unlimited access to a homicide unit, and this electrifying book tells the true story of a year on the violent streets of an American city. The narrative follows Donald Worden, a veteran investigator; Harry Edgerton, a black detective in a mostly white unit; and Tom Pellegrini, an earnest rookie who takes on the year's most difficult case, the brutal rape and murder of an eleven-year-old girl.Originally published fifteen years ago, Homicide became the basis for the acclaimed television show of the same name. This new edition--which includes a new introduction, an afterword, and photographs--revives this classic, riveting tale about the men who work on the dark side of the American experience.
440	The Corner: A Year in the Life of an Inner-City Neighborhood	1997	7	1	342	https://images.gr-assets.com/books/1388202800l/18957.jpg	The crime-infested intersection of West Fayette and Monroe Streets is well-known--and cautiously avoided--by most of Baltimore. But this notorious corner's 24-hour open-air drug market provides the economic fuel for a dying neighborhood. David Simon, an award-winning author and crime reporter, and Edward Burns, a 20-year veteran of the urban drug war, tell the chilling story of this desolate crossroad.Through the eyes of one broken family--two drug-addicted adults and their smart, vulnerable 15-year-old son, DeAndre McCollough, Simon and Burns examine the sinister realities of inner cities across the country and unflinchingly assess why law enforcement policies, moral crusades, and the welfare system have accomplished so little. This extraordinary book is a crucial look at the price of the drug culture and the poignant scenes of hope, caring, and love that astonishingly rise in the midst of a place America has abandoned.
441	Falling Up	2003	8	32	343	https://images.gr-assets.com/books/1327871908l/30120.jpg	Millie McDeevit screamed a screamSo loud it made her eyebrows steam.She screamed so loudHer jawbone broke,Her tongue caught fire,Her nostrils smoked...\n\n\n\nPoor Screamin' Millie is just one of the unforgettable characters in this wondrous new book of poems and drawings by the creator of Where the Sidewalk Ends and A Light in the Attic. Here you will also meet Allison Beals and her twenty-five eels; Danny O'Dare, the dancin' bear; the Human Balloon; and Headphone Harold.So come, wander through the Nose Garden, ride the Little Hoarse, eat in the Strange Restaurant, and let the magic of Shel Silverstein open your eyes and tickle your mind.
443	A Light in the Attic	1981	8	50	343	https://images.gr-assets.com/books/1427169918l/30118.jpg	Last night while I lay thinking here Some Whatifs crawled inside my ear And pranced and partied all night long And sang their same old Whatif song: Whatif I flunk that test?Whatif green hair grows on my chest?Whatif nobody likes me?Whatif a bolt of lightning strikes me?...This 20th anniversary of Shel Silverstein's A Light in the Attic includes a CD of highlights from his Grammy Award-winning album.Here in the attic of Shel Silverstein you will find Backward Bill, Sour Face Ann, the Meehoo with an Exactlywatt, and the Polar Bear in the Frigidaire. You will talk with Broiled Face, and find out what happens when Somebody steals your knees, you get caught by the Quick-Digesting Gink, a Mountain snores, and They Put a Brassiere on the Camel.From the creator of the beloved poetry collections Where the Sidewalk Ends and Falling Up, here is another wondrous book of poems and drawings.
461	Vengeance in Death	1999	0	24	352	https://images.gr-assets.com/books/1314315865l/132778.jpg	He is an expert with the latest technology...a madman with the mind of a genius and the heart of a killer. He quietly stalks his prey. Then he haunts the police with cryptic riddles about the crimes he is about to commit--always solved moments too late to save his victims' lives.Police lieutenant Eve Dallas found the first victim butchered in his own home. The second lost his life in a vacant luxury apartment. The two men had little in common. Both suffered unspeakable torture before their deaths. And both had ties to an ugly secret of ten years past--a secret shared by none other than Eve's new husband, Roarke.
444	The Giving Tree	1964	9	32	343	https://images.gr-assets.com/books/1174210942l/370493.jpg	"Once there was a tree...and she loved a little boy."So begins a story of unforgettable perception, beautifully written and illustrated by the gifted and versatile Shel Silverstein.Every day the boy would come to the tree to eat her apples, swing from her branches, or slide down her trunk...and the tree was happy. But as the boy grew older he began to want more from the tree, and the tree gave and gave and gave.This is a tender story, touched with sadness, aglow with consolation. Shel Silverstein has created a moving parable for readers of all ages that offers an affecting interpretation of the gift of giving and a serene acceptance of another's capacity to love in return.
445	License to Thrill	2003	9	30	344	https://images.gr-assets.com/books/1404962554l/22206699.jpg	The wackiest road trip in history has reached its final destination...But Coke and Pepsi McDonald aren't in the clear just yet! Before they reach the finish line, the twins will be abducted by aliens, trapped with a venomous snake, pushed through a deadly turbine, and thrown into a volcano.Craziest of all, their parents might finally believe them!Will the twins make it back home to California in one piece, or will they fall off the top of the Golden Gate Bridge? It's all coming to an end with this fifth book in the Genius Files series. You'll have to read it to believe it!
446	Risen	2004	8	53	345	https://images.gr-assets.com/books/1404478351l/22568295.jpg	Imprisoned on the dead moon of Bina, trapped at the bottom of the cold Hixom Sea, locked in a cell in the flooded Desa and blinded & defeated in the Eastern Provinces, the ruling class of Darracia is defeated without hope.In the stunning conclusion of the Darracia saga, V’sair, Tulani, Zayden and Reminda must dig deep and find both strength and faith to rise from the depths of the impossible and restore order to their home planet from Lothen, Staf Nuen and the evil armies of Geva.
447	Bad Things	2002	9	23	346	https://images.gr-assets.com/books/1364053596l/17377032.jpg	Librarian's note: An alternate cover edition can be found hereDanika hasn’t had an easy life. Being insanely attracted to bad boys has never helped make it easier. One look at Tristan, and every brain cell she possessed went up in smoke. This man was trouble with a capital T. It was a given.She knew better. Bad boys were bad. Especially for her. Considering her history, it was crazy to think otherwise. So why did crazy have to feel so damn fine?For as long as she could remember, Danika had been focused on the future with single-minded purpose. Tristan came along and taught her everything there was to know about letting go, and living in the present. She fell, hard and deep. Of course, that only made her impact with the ground that much more devastating.Bad Things is about Tristan and Danika, and their train wreck of a love story. This series can be read as a standalone, or with the Up in the Air series.Bad Things is a full length novel, at roughly 105,000 words.This book is intended for ages 18 and up.
448	The Elementals	1993	10	9	347	https://images.gr-assets.com/books/1439580027l/26098978.jpg	Eighteen years before the events of Run to Earth, the Elementals lived in harmony together in the City of Marwa. But the youngest of the Elementals, Alex Adams, has a secret. One he’s had to keep from his own brother, Christopher, because he knows Chris would never tolerate it.But with Alex soon coming into his full powers, he knows time’s running out to tell Chris the truth before it’s revealed at his coming-of-age ceremony. With the brotherhood of the Elementals already under strain, will Alex’s secret cost them their unity?
449	Playing With Fire	1990	10	9	347	https://images.gr-assets.com/books/1433452373l/25665301.jpg	Hunters have gathered.Battle lines are drawn.War is about to begin.The realm of mages is in chaos. With his powers now unlocked, Hadrian the vamage is preparing to take the realm as his own. The only ones who can stand in his way are the Elementals, armed with the mighty Blades of Aric. Fourteen years old, Aaron Adams discovers that he is one of the four Elementals who can use these powerful weapons. But when family secrets are finally revealed, Aaron finds himself caught between doing what his parents ask of him and what the mages expect from him.Aaron faces a choice: pick up his sword and join the fight, or stand back and pray the world doesn’t burn to the ground around him. Book 2 in the Power of Four series.
450	Dare to Dream	1989	8	60	348	https://images.gr-assets.com/books/1433510436l/25669866.jpg	Bad boy Kade Maxwell knows all too well the pain and loss of the death of a loved one after his sister’s death tore his family—especially his mother—to pieces. He longs for the day his mother can heal from the mental anguish and return home to live with her family again. He prays every day that God will keep his brothers safe and that his father will one day be reunited with his wife. He doesn’t dream of his future. In fact, he had nightmarish glimpses of what his life would’ve been like as an adult until he met Lacey. She’s a light that cuts through his darkness. Her beauty, her determination, and her dedication in overcoming her own tragedy energizes his belief that maybe—just maybe—he can dream again.Lacey Robinson has suffered tragedy at the hands of a killer who took away her sister and mother. After a change of scenery and a new life, her PTSD is on the mend. With the love and strength from Kade Maxwell and the help of her psychiatrist, she’s been able to work on the triggers that cause her panic attacks and blackouts. With a clear head and a clear road to the future, Lacey dreams of three things: She longs to find the person who killed her family. She wants to play baseball for ASU so bad she can taste it. And she wants a future with Kade Maxwell. But with several roadblocks thrown in her way, she may not get everything she wants. A trip to California opens a door that could expose the killer. Aaron Seever is up to his psychotic, bullying antics, and Kade has his own path for the future, one Lacey isn’t sure includes her.Kade vows to love and protect Lacey even if that means his life for hers. Lacey vows to push through her demons and show Kade and her family that she has what it takes to rise above tragedy, even if she has to run into the arms of a killer to save a loved one.Strong language. Sexual content. Violence. Intended for audiences 18 years and older.
435	The Book of Images	1991	9	50	341	https://images.gr-assets.com/books/1421345385l/251838.jpg	Now substantially revised by Edward Snow, whom Denise Levertov once called "far and away Rilke's best translator," this bilingual edition of The Book of Images contains a number of the great poet's previously untranslated pieces. Also included are several of Rilke's best-loved lyrics, such as "Autumn," "Childhood," "Lament," "Evening," and "Entrance."
496	Now We Are Six	1992	9	50	376	https://images.gr-assets.com/books/1348199373l/821000.jpg	When We Were Very Young and Now We Are Six complete the four-volume set of deluxe editions of the Milne and Shepard classic works. Like their companions, the Winnie-the-Pooh 80th Anniversary Edition and The House At Pooh Corner, these beautiful books feature full-color artwork on cream-colored stock. The imaginative charm that has made Pooh the world’s most famous bear pervades the pages of Milne’s poetry, and Ernest H. Shepard’s witty and loving illustrations enhance these truly delightful gift editions.
470	Hope for the Flowers	1973	0	58	355	https://images.gr-assets.com/books/1438459030l/96629.jpg	This classic story is celebrating its 40th anniversary beginning in September of 2012. "Hope for the Flowers" is an inspiring allegory about the realization of one's true destiny as told through the lives of caterpillars Stripe and Yellow, who struggle to "climb to the top" before understanding that they are meant to fly.
451	Dare to Love	1981	8	10	348	https://images.gr-assets.com/books/1452113360l/28471914.jpg	Sexy, confident, college playboy, Kelton Maxwell has his future right in the palm of his hands. Women want him. Guys want to be him. And he’s got one foot in the door at Harvard Law. All he needs now is just one prestigious internship at a highfalutin law firm to seal the deal. Nothing can stand in his way.Until…A blast from the past smacks him right in the face, bringing back memories he tried to forget. Kelton swore he’d never go back — never put himself through that again. He’d rather pledge his allegiance to the devil himself before he drops to his knees to worship a woman — especially her. He won’t dare to get close.Won’t dare to let her in.Can’t dare to love.
452	Father Elijah: An Apocalypse	1996	10	58	349	https://images.gr-assets.com/books/1348603347l/550996.jpg	Michael O'Brien presents a thrilling apocalyptic novel about the condition of the Roman Catholic Church at the end of time. It explores the state of the modern world, and the strengths and weaknesses of the contemporary religious scene, by taking his central character, Father Elijah Schafer, a Carmelite priest, on a secret mission for the Vatican which embroils him in a series of crises and subterfuges affecting the ultimate destiny of the Church. The Pope and the Cardinal Secretary of State call him out of obscurity and give him a task of the highest sensitivity: to penetrate into the inner circles of a man whom they believe may be the Antichrist. Their purpose: to call the Man of Sin to repentance, and thus to postpone the great tribulation long enough to preach the Gospel to the whole world.
454	The Kitab-i-Aqdas: The Most Holy Book	1993	10	8	351	https://images.gr-assets.com/books/1215578647l/254660.jpg	In 1953 Shoghi Effendi, the Guardian of the Baha’i Faith, included as one of the goals of his Ten Year Plan the preparation of a Synopsis and Codification of the Laws and Ordinances of the Kitab-i-Aqdas as an essential prelude to its translation. He himself worked on the codification, but had not finished it when he died in 1957. The task was continued on the basis of his work, and the resulting volume was released in 1973. That publication included, in addition to the Synopsis and Codification itself and explanatory notes, a compilation of the passages from the Kitab-i-Aqdas which had already been translated by Shoghi Effendi and published in various books. The Synopsis and Codification covered the text of both the Kitab-i-Aqdas and the Questions and Answers which constitutes an appendix to the Aqdas. In 1986 the Universal House of Justice decided that the time had come when the preparation of an English translation of the complete text of the Most Holy Book was both possible and essential and made its accomplishment a goal of the Six Year Plan 1986-1992. Its publication in English will be followed by translations in other languages. It has been recognized that the Kitab-i-Aqdas, being Sacred Scripture, should be presented in a form which can be read with ease and inspiration, uncluttered with the footnotes and index numbers that are common in scholarly texts. Nonetheless, to assist the reader in following the flow of the text and its changing themes, paragraph divisions have been added—such divisions not being common in works of Arabic literature—and these paragraphs have then been numbered for ease of access and indexing, as well as for uniformity of reference in all the languages in which the work will be published.Following the text of the Aqdas is a brief compilation of Writings of Baha’u’llah which are supplementary to the Most Holy Book, and a translation of the Questions and Answers published here for the first time.About the Author
456	Holiday in Death	1998	9	24	352	https://images.gr-assets.com/books/1389932347l/238125.jpg	No one likes to be alone during the holidays. For New York's most posh dating service, Personally Yours, it is the season to bring lonely hearts together. But Lieutenant Eve Dallas, on the trail of a ritualistic serial killer, has made a disturbing discovery: all of the victims have been traced to Personally Yours. As the murders continue, Eve enters into an elite world of people searching for their one true love--and a killer searching for his next victim. A world where the power of love leads men and women into the ultimate act of betrayal...
457	Betrayal in Death	2001	8	24	352	https://images.gr-assets.com/books/1388255545l/762064.jpg	At the luxurious Roarke Palace Hotel, a maid walks into suite 4602 for the nightly turndown - and steps into her worst nightmare. A killer leaves her dead, strangled by a thin silver wire. He's Sly Yost, a virtuoso of music and murder. A hit man for the elite. Lieutenant Eve Dallas knows him well. But in this twisted case, knowing the killer doesn't help solve the crime. Because there's someone else involved. Someone with a more personal motive. And Eve must face a terrifying possibility - that the real target may, in fact, be her husband Roarke...
458	Seduction in Death	2001	8	24	352	https://images.gr-assets.com/books/1305123885l/238127.jpg	Dante had been courting his victim in cyberspace for weeks before meeting her in person. A few sips of wine and a few hours later, she was dead. The murder weapon: a rare, usually undetectable date-rape drug with a street value of a quarter million dollars. Lieutenant Eve Dallas is playing and replaying the clues in her mind. The candlelight, the music, the rose petals strewn across the bed - a seduction meant for his benefit, not hers. He hadn't intended to kill her. But now that he has, he is left with only two choices: to either hole up in fear and guilt or start hunting again. . .
459	Divided in Death	2004	10	24	352	https://images.gr-assets.com/books/1389938707l/129523.jpg	Reva Ewing, a former member of the Secret Service and a security specialist for Roarke Enterprises, is a prime suspect in a double homicide. She had every reason to want to kill her husband, the renowned artist Blair Bissel. Not only was he having an affair, he was having it with her best friend.But Lieutenant Eve Dallas, who's on the case, believes Reva is innocent. Eve's instincts tell her that the murder scene looks too perfectly staged, the apparent answers too obvious. And when she digs for more, she discovers that at nearly the exact time a kitchen knife was jammed into the victim's ribs, the passcode to his art studio was changed - and all of the data on his computer deliberately corrupted.To Roarke, it's the computer attack that poses the real threat. Signs show that this is the nightmare his company has secretly been preparing for. He and Reva have been under a code-red government contract to develop a program that would shield against a new breed of hackers, the Doomsday Group. These techno-terrorists with brilliant minds and plenty of financial backing hack into systems, steal data, and corrupt computer units on a large scale - and kill anyone who gets too close.Eve and Roarke must infiltrate an extraordinarily secretive government agency to expose the corruption at its core, before the virus spreads from one office to a corporation to the entire country.
460	Judgment in Death	2004	9	24	352	https://images.gr-assets.com/books/1390135645l/89160.jpg	'She stood in Purgatory and studied death. The blood and the gore of it, the ferocity of its glee. It had come to this place with the wilful temper of a child, full of heat and passion and careless brutality.' In an uptown strip joint a cop is found bludgeoned to death. The weapon's a baseball bat. The motive is a mystery. It's a case of serious overkill that pushes Eve Dallas straight into overdrive. Her investigation uncovers a private club that's more than a hot spot. Purgatory's a last chance for atonement where everyone is judged. Where your ultimate fate depends on your most intimate sins. And where one cop's hidden secrets are about to plunge innocent souls into vice-ridden damnation...
462	Reunion in Death	2002	8	24	352	https://images.gr-assets.com/books/1305123931l/238140.jpg	A birthday bash sets the scene for a frightening reunion with a killer from Eve Dallas's past. At exactly 7:30 p.m., Walter Pettibone arrived home to over a hundred friends and family shouting, surprise! It was his birthday. Although he had known about the planned event for weeks, the real surprise was yet to come. At 8:45 p.m., a woman with emerald eyes and red hair handed him a glass of champagne. One sip of birthday bubbly, and he was dead. The woman's name is Julie Dockport. No one at the party knew who she was. But Detective Eve Dallas remembers her all too well. Eve was personally responsible for her incarceration nearly ten years ago. And now, let out on good behavior, she still has nothing but bad intentions. It appears she wants to meet Dallas again -- in a reunion neither will forget.
463	Purity in Death	2002	10	24	352	https://images.gr-assets.com/books/1305124004l/238137.jpg	Louie Cogburn had spent three days holed up in his apartment, staring at his computer screen. His pounding headache was unbearable - it felt like spikes drilling into his brain. And it was getting worse. Finally, when someone knocked at his door, Louie picked up a baseball bat, opened up the door, and started swinging....The first cop on the scene fired his stunner twice. Louie died instantly. Detective Eve Dallas has taken over the investigation, but there's nothing to explain the man's sudden rage or death. The only clue is a bizarre message left on his computer screen: ABSOLUTE PURITY ACHIEVEDAnd when a second man dies under near-identical circumstances, Eve starts racking her brain for answers and the courage to face the impossible...that this might be a computer virus able to spread from machine to man....
464	Visions in Death	2004	9	24	352	https://images.gr-assets.com/books/1390188401l/238142.jpg	On one of the city's hottest nights, New York Police Lieutenant Eve Dallas is sent to Central Park - and into a hellish new investigation. The victim is found on the rocks, just above the still, dark water of The Lake in Central Park. Around her neck is a single red ribbon. Her hands are posed, as if in prayer. But it is the eyes - removed with such precision, as if done by the careful hand of a surgeon - that have Dallas most alarmed. As more bodies turn up, each with the same defining scars, Eve is frantic for answers. Against her instincts, she accepts help from a psychic who offers one vision after another - each with shockingly accurate details of the murders. And when partner and friend Peabody is badly injured after escaping an attack, the stakes are raised. Are the eyes a symbol? A twisted religious ritual? A souvenir? With help from her husband, Roarke, Dallas must uncover the killer's motivation before another vision becomes another nightmare...
484	The Way of Perfection	1991	0	13	366	https://images.gr-assets.com/books/1320501245l/968250.jpg	Of all of Teresa of Avila's works, The Way of Perfection is the most easily understood. Written at the height of the controversy surrounding the reforms Teresa instituted in the Carmelite order, it instructed the nuns in the practice of prayer. Teresa discusses the three essentials of a prayer-filled life -- fraternal love, detachment from material things, and true humility. Her counsels on these are the fruit of her practical experience. The book develops these ideas and takes up directly the matters of prayer and contemplation. Teresa gives various maxims for the practice of prayer and concludes the book with her masterful and impassioned version of the Lord's Prayer. "How is it that Thou canst give us so much with Thy first word?" she says of the "Our" at the beginning of that prayer. The simple and practical nature of this mystical classic will appeal to all who seek a life of wholeness.
465	Conspiracy in Death	2003	9	24	352	https://images.gr-assets.com/books/1305124508l/172691.jpg	Streetwise cop Eve Dallas and her trusty sidekick Peabody face a methodical killer in this latest addition to the In Death series by J.D. Robb, better known as the bestselling author Nora Roberts. In the late 21st century, on the streets of New York City, a street sleeper is found murdered, his diseased heart removed with surgical precision. His death would typically drop to the bottom of a list of senseless and inexplicable killings, but Lieutenant Dallas, who "would stand for the dead and the living," is not about to let that happen. When her research uncovers similar crimes in several cities that were dropped under mysterious circumstances, Dallas knows she's facing a killer cruel enough to prey on the weakest in society and powerful enough to conspire an extensive coverup. To complicate matters further, Dallas faces an equally troubling threat to her career when she's linked to the death of a fellow cop. Now she must fight to restore her good name as well as track down the killer. In Conspiracy in Death, Roberts creates a futuristic world of evil that Eve Dallas negotiates through tough talk and brute force. While Robb crafts the crimes with great care, she assumes a familiarity with the characters that new readers will lack. But fans of the In Death series and newcomers alike will enjoy the thrill of the chase as Eve Dallas sets out to get her man.
466	Imitation in Death	2003	8	24	352	https://images.gr-assets.com/books/1305124047l/238139.jpg	Summer, 2059. A man wearing a cape and a top hat approaches a prostitute on a dark, New York City street. Minutes later, the woman is dead. Left at the scene is a letter addressed to Lieutenant Eve Dallas, inviting her to play his game and unveil his identity. He signs it, "Jack." Now Dallas is in pursuit of a murderer who knows as much about the history of serial killers as she does. He has studied the most notorious and the most vicious slayings in modern times. But he also wants to make his own mark. He has chosen his victim: Eve Dallas. And all Eve knows is that he plans to mimic the most infamous murderers of all starting with Jack the Ripper... "Robb's energetic prose and hard-edged dialogue will keep readers engrossed." Publishers Weekly "Edgy and raw." Booklist
467	Portrait in Death	2003	10	24	352	https://images.gr-assets.com/books/1173290759l/268604.jpg	After a tip from a reporter, Eve Dallas finds the body of a young woman in a Delancey street dumpster. Just hours before, the news station had mysteriously received a portfolio of professional portraits of the woman. The photos seemed to be nothing out of the ordinary for any pretty young woman starting a modeling career. Except that she wasn't a model. And that these photos were taken after she had been murdered. Now Dallas is on the trail of a killer who's a perfectionist and an artist. He carefully observes and records his victim's every move. And he has a mission: to own every beautiful young woman's innocence, to capture her youth and vitality—in one fateful shot... 
468	Unintended Consequences	1996	9	58	353	https://images.gr-assets.com/books/1386745615l/78082.jpg	Unintended Consequences is a novel by John Ross, first published in 1996 by Accurate Press. The story chronicles the history of the gun culture, gun rights, and gun control in the United States from the early 1900s through the late 1990s. Although clearly a work of fiction, the story is heavily laced with historical information, including real-life historical figures who play minor supporting roles. The novel also features unusually detailed and intricate facts, figures and explanations of many firearms-related topics. The cover has a picture of Lady Justice being assaulted by an ATF agent. The book was listed by The New York Times' Sunday Book Review as one of the most sought after out-of-print books of 2013.
469	Apricots at Midnight: And Other Stories from a Patchwork Quilt	1982	8	32	354	https://images.gr-assets.com/books/1184042209l/1481255.jpg	Aunt Pinny tells the story behind each of the squares on her wonderful quilt. The red velvet patch recalls a fancy dress ball and a midnight feast with a highwayman; the green brocade carries memories of Captain Tramlemousse, the prirate. Gradually, a magical lost world is built up.
471	New Beginnings	1993	9	3	356	https://images.gr-assets.com/books/1388625760l/20414011.jpg	Ava Mathias, beautiful, newlywed, and Amish, receives an unexpected visit from her Englisch friend Bliss, and a handsome stranger riding with her. Ava’s wayward brother, Abram, makes some serious decisions, and her oldest brother, Isaac, returns home after a mysterious trip. Clara and Louis Pierre, good Englisch friends to the Amish community, fight with each other about the Amish. Ava worries over her husband Zeke, Ezekiel, and his friend Samuel, as they leave on a long journey.
472	Siren's Song	1996	8	23	357	https://images.gr-assets.com/books/1409031999l/23044108.jpg	Flex Sefiroth is an angel. A fallen angel to be specific. Extremely tall and intelligent and always in control. Flex suddenly finds himself in uncharted waters when he hears the most beautiful voice while in Paris France for some much needed R and R. Obsessed with finding its source he searches desperately until the sound leads him to a small old fashioned bookshop where he finds the most enchanting redhead, Evette la Fontaine. She is the most exquisite thing he has ever seen in all his countless centuries of existence. But he soon discovers that over a century and a half of her being shunned by every male she ever encountered, both human and immortal alike, have taken its toll on the lovely Evette. Flex must have her and pulls out all stops to woo her. But will the timid little bookworm succumb to his charms? Could another's need for redemption destroy what could be?
473	Bonobo: The Forgotten Ape	1997	10	55	358	https://images.gr-assets.com/books/1328244282l/880684.jpg	This remarkable primate with the curious name is challenging established views on human evolution. The bonobo, least known of the great apes, is a female-centered, egalitarian species that has been dubbed the "make-love-not-war" primate by specialists. In bonobo society, females form alliances to intimidate males, sexual behavior (in virtually every partner combination) replaces aggression and serves many social functions, and unrelated groups mingle instead of fighting. The species's most striking achievement is not tool use or warfare but sensitivity to others.In the first book to combine and compare data from captivity and the field, Frans de Waal, a world-renowned primatologist, and Frans Lanting, an internationally acclaimed wildlife photographer, present the most up-to-date perspective available on the bonobo. Focusing on social organization, de Waal compares the bonobo with its better-known relative, the chimpanzee. The bonobo's relatively nonviolent behavior and the tendency for females to dominate males confront the evolutionary models derived from observing the chimpanzee's male power politics, cooperative hunting, and intergroup warfare. Further, the bonobo's frequent, imaginative sexual contacts, along with its low reproduction rate, belie any notion that the sole natural purpose of sex is procreation. Humans share over 98 percent of their genetic material with the bonobo and the chimpanzee. Is it possible that the peaceable bonobo has retained traits of our common ancestor that we find hard to recognize in ourselves?Eight superb full-color photo essays offer a rare view of the bonobo in its native habitat in the rain forests of Zaire as well as in zoos and research facilities. Additional photographs and highlighted interviews with leading bonobo experts complement the text. This book points the way to viable alternatives to male-based models of human evolution and will add considerably to debates on the origin of our species. Anyone interested in primates, gender issues, evolutionary psychology, and exceptional wildlife photography will find a fascinating companion in Bonobo: The Forgotten Ape.
597	White Night	1994	9	9	450	https://images.gr-assets.com/books/1309552288l/91475.jpg	The inspiration for the Sci Fi channel television series  In Chicago, someone has been killing practitioners of magic, those incapable of becoming full-fledged wizards. Shockingly, all the evidence points to Harry Dresden's half-brother, Thomas, as the murderer. Determined to clear his sibling's name, Harry uncovers a conspiracy within the White Council of Wizards that threatens not only him, but his nearest and dearest, too...
474	Restoration	2002	9	9	359	https://images.gr-assets.com/books/1442800145l/24173870.jpg	Would You RunWould You FightWould You Fall To FateIf your heart was full of love, could you give it all up?Eve Collins will do anything to save those she loves, especially her gargoyle protector and mate, Asher St. Michael. With the world crumbling down around them, Eve and Asher must face the final battle between darkness and light. One that will end in great sacrifice.When the skies darken and love in it’s truest form is tested, would you run? When death becomes silence and battle lines are drawn, would you fight? If you had to sacrifice, to save the one you loved, would you fall to fate? Would you dare to let it go?The End, Begins.Restoration is the highly anticipated finale in the Revelation Series, a mesmerizing epic romantic journey filled with dark themes, beautifully melancholic musings, divine secrets, sacrifice and forbidden love.
475	Heartstone	2001	9	56	360	https://images.gr-assets.com/books/1272182205l/7027569.jpg	Summer, 1545. England is at war. Henry VIII's invasion of France has gone badly wrong. Meanwhile Matthew Shardlake is given an intriguing legal case by an old servant of Queen Catherine Parr. He is asked to investigate claims of 'monstrous wrongs' committed against a young ward of the court, which have already involved one mysterious death.
476	Last Days of Summer	1999	9	58	361	https://images.gr-assets.com/books/1298443838l/113773.jpg	A contemporary American classic—a poignant and hilarious tale of baseball, hero worship, eccentric behavior, and unlikely friendshipLast Days of Summer is the story of Joey Margolis, neighborhood punching bag, growing up goofy and mostly fatherless in Brooklyn in the early 1940s. A boy looking for a hero, Joey decides to latch on to Charlie Banks, the all-star third basemen for the New York Giants. But Joey's chosen champion doesn't exactly welcome the extreme attention of a persistent young fan with an overactive imagination. Then again, this strange, needy kid might be exactly what Banks needs.
505	Make Way for Lucia	1988	8	58	383	https://images.gr-assets.com/books/1331570992l/625836.jpg	All the Lucia novels in one volume.
477	The Sneetches and Other Stories	1961	9	32	362	https://images.gr-assets.com/books/1389388191l/105549.jpg	Illus. in full color. "Four funny easy-to-read stories all with subtly planted moral lessons."--Publishers Weekly.  THE SNEETCHES"Now, the Star-Belly Sneetches / Had bellies with stars. / The Plain-Belly Sneetches / Had none upon thars." This collection of four of Dr. Seuss's most winning stories begins with that unforgettable tale of the unfortunate Sneetches, bamboozled by one Sylvester McMonkey McBean ("the Fix-it-up Chappie"), who teaches them that pointless prejudice can be costly.THE ZAXFollowing the Sneetches, a South-Going Zax and a North-Going Zax seem determined to butt heads on the prairie of Prax.TOO MANY DAVESThen there's the tongue-twisting story of Mrs. McCave--you know, the one who had 23 sons and named them all Dave. (She realizes that she'd be far less confused had she given them different names, like Marvin O'Gravel Balloon Face or Zanzibar Buck-Buck McFate.)WHAT WAS I SCARED OF?A slightly spooky adventure involving a pair of haunted trousers--"What was I scared of?"--closes out the collection. Sneetches and Other Stories is Seuss at his best, with distinctively wacky illustrations and ingeniously weird prose. (Ages 4 to 8) --Paul Hughes
478	The Lorax	1971	8	32	362	https://images.gr-assets.com/books/1327879938l/7784.jpg	"UNLESS someone like you...cares a whole awful lot...nothing is going to get better...It's not." Long before saving the earth became a global concern, Dr. Seuss, speaking through his character the Lorax, warned against mindless progress and the danger it posed to the earth's natural beauty. His classic cautionary tale is now available in an irresistible mini-edition, perfect for backpack or briefcase, for Arbor Day, Earth Day, and every day.
479	How the Grinch Stole Christmas!	1957	9	32	362	https://images.gr-assets.com/books/1327958149l/113946.jpg	"The Grinch hated Christmas! The whole Christmas season!Now, please don't ask why. No one quite knows the reason."Dr. Seuss's small-hearted Grinch ranks right up there with Scrooge when it comes to the crankiest, scowling holiday grumps of all time. For 53 years, the Grinch has lived in a cave on the side of a mountain, looming above the Whos in Whoville. The noisy holiday preparations and infernal singing of the happy little citizens below annoy him to no end. The Grinch decides this frivolous merriment must stop. His "wonderful, awful" idea is to don a Santa outfit, strap heavy antlers on his poor, quivering dog Max, construct a makeshift sleigh, head down to Whoville, and strip the chafingly cheerful Whos of their Yuletide glee once and for all.Looking quite out of place and very disturbing in his makeshift Santa get-up, the Grinch slithers down chimneys with empty bags and stealing the Whos' presents, their food, even the logs from their humble Who-fires. He takes the ramshackle sleigh to Mt. Crumpit to dump it and waits to hear the sobs of the Whos when they wake up and discover the trappings of Christmas have disappeared. Imagine the Whos' dismay when they discover the evil-doings of Grinch in his anti-Santa guise. But what is that sound? It's not sobbing, but singing! Children simultaneously adore and fear this triumphant, twisted Seussian testimonial to the undaunted cheerfulness of the Whos, the transcendent nature of joy, and of course, the growth potential of a heart that's two sizes too small. This holiday classic is perfect for reading aloud to your favorite little Whos.
480	Six by Seuss	1995	10	32	362	https://images.gr-assets.com/books/1347564558l/105550.jpg	Dr. Seuss's magic elixir may--or may not--prolong life, but it is a fact that it makes you feel a whole lot better! Here in one glorious volume are six of the good doctor's best prescriptions. Not a word or a picture has been omitted or changed. Ranging from his very first book, And to Thing That I Saw It on Mulberry Street, to his prophetic The Lorax, Six by Seuss is the perfect collection to share with the entire family and to pass from generation to generation.
481	I Spy: A Book of Picture Riddles	1992	10	32	363	https://images.gr-assets.com/books/1360057601l/710750.jpg	With 24 million copies sold, the bestselling I Spy series is being relaunched with new designs and foil covers.This bestselling book features riddles that send readers searching through 13 photographs to find hidden objects.
482	Family Reunion	2001	8	23	364	https://images.gr-assets.com/books/1350989709l/4428698.jpg	Family Reunion is the third and final entry to the Webster Fields saga, that began with Princess Ces'alena, continued on with Gold Raven, and now - the reunion. The family comes full circle together, succeeding in the greatest find of all, lover, children, friends and daughter! Now finally, their dream is realized as Manny fulfills his promise to Lena, taking her back to Makia Island; back to her home, back to her father. But, only for a visit! Problem, her father has other plans. Come join us in the concluding leg of their journey, into a story that many have said, they cannot, will not, forget!
649	The Meaning of Relativity	1966	9	55	485	https://images.gr-assets.com/books/1175887692l/571211.jpg	In 1921, five years after the appearance of his comprehensive paper on general relativity and twelve years before he left Europe permanently to join the Institute for Advanced Study, Albert Einstein visited Princeton University, where he delivered the Stafford Little Lectures for that year. These four lectures constituted an overview of his then controversial theory of relativity.
483	When All the World Was Young	1991	9	58	365	https://images.gr-assets.com/books/1355902966l/112277.jpg	The year is 1942 and Porter Osborne, Jr., is safely ensconced in medical school. He is physically safe, although taunted by the beckoning finger of Uncle Sam. Haunted by the family motto, "Remember who you are, " Porter wrestles with a flood of conflicting emotions. A year later, the conflicts still unresolved, he is an elisted man in the U.S. Army. In the face of incomprehensible delays and inefficiency, he wonders how America will ever prevail in the world war. Surgical Technician PFC Porter Osborne finally lands at Omaha Beach and joins the Allied fight against Germany. The final novel in the trilogy that began with "Run with the Horsemen" and "The Whisper of the River," "When all the World Was Young" continues the story of young Porter Osborne with the supreme wit and wisdom that readers have come to expect from the intimitable Ferrol Sams.
485	The Message: The New Testament in Contemporary Language	1994	8	11	367	https://images.gr-assets.com/books/1358993204l/989140.jpg	The Message New Testament lets today's contemporary readers dive into the Scripture. Eugene H. Peterson has presented God's Word in the everyday language it was first written in.Trim size: 4 3/16 x 6 7/8
486	The Power of One	1999	10	58	368	https://images.gr-assets.com/books/1388184360l/122.jpg	In 1939, as Hitler casts his enormous, cruel shadow across the world, the seeds of apartheid take root in South Africa. There, a boy called Peekay is born. His childhood is marked by humiliation and abandonment, yet he vows to survive and conceives heroic dreams, which are nothing compared to what life actually has in store for him. He embarks on an epic journey through a land of tribal superstition and modern prejudice where he will learn the power of words, the power to transform lives and the power of one.
497	The Kissing Hand	1993	10	32	377	https://images.gr-assets.com/books/1348776209l/18419.jpg	School is starting in the forest, but Chester Raccoon does not want to go. To help ease Chester's fears, Mrs. Raccoon shares a family secret called the Kissing Hand to give him the reassurance of her love any time his world feels a little scary. Since its first publication in 1993, this heartwarming book has become a children's classic that has touched the lives of millions of children and their parents, especially at times of separation, whether starting school, entering daycare, or going to camp. It is widely used by kindergarten teachers on the first day of school. Stickers at the back will help children and their parents keep their Kissing Hand alive.
508	A Time to Love and a Time to Die	1998	8	22	386	https://images.gr-assets.com/books/1387736914l/132749.jpg	After two years at the Russian front, Ernst Graeber finally receives three weeks’ leave. But since leaves have been canceled before, he decides not to write his parents, fearing he would just raise their hopes.Then, when Graeber arrives home, he finds his house bombed to ruin and his parents nowhere in sight. Nobody knows if they are dead or alive. As his leave draws to a close, Graeber reaches out to Elisabeth, a childhood friend. Like him, she is imprisoned in a world she did not create. But in a time of war, love seems a world away. And sometimes, temporary comfort can lead to something unexpected and redeeming.
487	The 23rd Psalm: A Holocaust Memoir	2002	8	47	369	https://images.gr-assets.com/books/1349065349l/549227.jpg	In September, 1939, George Lucius Salton's boyhood in Tyczyn, Poland, was shattered by escalating violence and terror under German occupation. His father, a lawyer, was forbidden to work, but eleven-year-old George dug potatoes, split wood, and resourcefully helped his family. They suffered hunger and deprivation, a forced march to the Rzeszow ghetto, then eternal separation when fourteen-year-old George and his brother were left behind to labor in work camps while their parents were deported in boxcars to die in Belzec. For the next three years, George slaved and barely survived in ten concentration camps, including Rzeszow, Plaszow, Flossenburg, Colmar, Sachsenhausen, Braunschweig, Ravensbruck, and Wobbelin. Cattle cars filled with skeletal men emptied into a train yard in Colmar, France. George and the other prisoners marched under the whips and fists of SS guards. But here, unlike the taunts and rocks from villagers in Poland and Germany, there was applause. "I could clearly hear the people calling: "Shame! Shame!" . . . Suddenly, I realized that the people of Colmar were applauding us! They were condemning the inhumanity of the Germans!" Of the 500 prisoners of the Nazis who marched through the streets of Colmar in the spring of 1944, just fifty were alive one year later when the U.S. Army 82nd Airborne Division liberated the Wobbelin concentration camp on the afternoon of May 2, 1945. "I felt something stir deep within my soul. It was my true self, the one who had stayed deep within and had not forgotten how to love and how to cry, the one who had chosen life and was still standing when the last roll call ended."
488	Spiritual Depression: Its Causes and Cure	1965	9	11	370	https://images.gr-assets.com/books/1388200882l/272211.jpg	This enduring collection of twenty-one sermons by D. Martyn Lloyd-Jones, each originally delivered at Westminster Chapel in London, carefully and compassionately analyzes an undeniable feature of modern society from which Christians have not escaped -- spiritual depression."Christian people," writes Lloyd-Jones, "too often seem to be perpetually in the doldrums and too often give this appearance of unhappiness and of lack of freedom and absence of joy. There is no question at all but that this is the main reason why large numbers of people have ceased to be interested in Christianity."Believing the Christian joy was one of the most potent factors in the spread of Christianity in the early centuries, Lloyd-Jones not only lays bare the causes that have robbed many Christians of spiritual vitality but also points the way to the cure that is found through the mind and spirit of Christ.
500	Gospel	1993	7	58	379	https://images.gr-assets.com/books/1436835973l/371269.jpg	Gospel concerns the search for a lost first-century gospel of the Bible, a document that could shake the foundations of Christianity. Wilton Barnhardt's narrative races through three continents, nine countries, and dozens of colorful locales, as two character--shy theological student Lucy Dantan and hard-drinking, disillusioned ex-Jesuit Patrick O'Hanrahan--pursue rumors and clues about the gospel's whereabouts and contents. In the end, what they discover will challenge and forever change the nature of faith.An intellectual detective story with the erudition of Umberto Eco and the grand swirling entertainment of a nineteenth-century novel, Gospel is exciting, profound, reverent, and terrifically funny.
501	The Chronicles of Amber	1979	9	9	380	https://images.gr-assets.com/books/1415558522l/316876.jpg	Amber is the one real world, casting infinite reflections of itself - shadow worlds, which can be manipulated by those of royal Amberite blood. But the royal family is torn apart by jealousies and suspicion; the disappearance of the patriarch Oberon has intensified the internal conflict by leaving the throne apparently for grabs; and amnesia has robbed Corwin, Crown Prince of Amber his memory - even the fact that he is rightful heir to the throne.The Chronicles of Amber is Zelazny's finest fantasy, a grand imaginative vision of alternate worlds, magic, swordplay, and murderous rivalries.1. Nine Princes in Amber 1-1562. The Guns of Avalon 157-3383. Sign of the Unicorn 338-4904. The Hand of Oberon 491-6405. The Courts of Chaos 641-772
541	Ficciones	1997	0	58	412	https://images.gr-assets.com/books/1357529016l/17213967.jpg	Ficciones es quizás el libro más reconocido de Jorge Luis Borges. Entre los cuentos que se reúnen aquí hay algunos de corte policial, como "La muerte y la brújula" otros sobre libros imaginarios, como "Tlön,Uqbar, Orbis Tertius", y muchos pertenecen al género fantástico, como "Las ruinas circulares" o "El Sur", acaso el mejor relato, en palabras del mismo autor. Está compuesto por los libros 'El jardín de los senderos que se bifurcan' (1941) y 'Artificios'(1944), considerados piezas fundamentales del universo borgeano.
518	Wild Violets	1987	0	32	393	https://images.gr-assets.com/books/1386515988l/798148.jpg	Cornelia is the most important person in the forth grade. Ruthie is probably the least important. Cornelia lives in a nice house, has a nice mother, and brings her lunch to school in a real lunch box. Ruthie is so poor that she seldom has any lunch at all. She lives with her father in a barn, as her mother often gets bored and leaves them for months at a time.Everybody loves Cornelia and wants to be just like her, and nobody more so than Ruthie. Cornelia hardly knows Ruthie is alive, but she tries to be kind sometimes.And then things begin to change. "Rich" Cornelia's father gets sick and cannot work, and Cornelia's mother has to sell the house and take a job. World War II starts, and suddenly Ruthie's father sells a once-worthless field for a fine sum of money, and her mother comes home to share in it. The two girls, once so unequal, are pretty much in the same boat now, and they become friends.Then the war, which had unexpectedly given Ruthie so much, threatens to take away the one thing she wants most of all. Not even Cornelia's coveted friendship is enough to make up for it, and the heartsick girl runs away. Alone in the woods, Ruthie, who has never had much, learns to accept the loss of everything, and long before her story is over, readers will discover that this wistful heroine has won a place in their hearts, much as she wins solutions to her most pressing problems.
489	Conversations with Wilder	2001	7	12	371	https://images.gr-assets.com/books/1437413045l/82899.jpg	In Conversations with Wilder, Hollywood's legendary and famously elusive director Billy Wilder agrees for the first time to talk extensively about his life and work.Here, in an extraordinary book with more than 650 black-and-white photographs -- including film posters, stills, grabs, and never-before-seen pictures from Wilder's own collection -- the ninety-three-year-old icon talks to Cameron Crowe, one of today's best-known writer-directors, about thirty years at the very heart of Hollywood, and about screenwriting and camera work, set design and stars, his peers and their movies, the studio system and films today. In his distinct voice we hear Wilder's inside view on his collaborations with such stars as Barbara Stanwyck, Gary Cooper, Marilyn Monroe, Jack Lemmon, Tony Curtis, William Holden, Audrey Hepburn, and Greta Garbo (he was a writer at MGM during the making of Ninotchka. Here are Wilder's sharp and funny behind-the-scenes stories about the making of A Foreign Affair, Double Indemnity, Sunset Boulevard, Love in the Afternoon, Some Like It Hot, The Apartment, and Ace in the Hole, among many others. Wilder is ever mysterious, but Crowe gets him to speak candidly on Stanwyck: "She knew the script, everybody's lines, never a fault, never a mistake"; on Cary Grant: "I had Cary Grant in mind for four of my pictures . . . slipped through my net every time"; on the "Lubitsch Touch": "It was the elegant use of the super-joke." Wilder also remembers his early years in Vienna, working as a journalist in Berlin, rooming with Peter Lorre at the Chateau Marmont -- always with the same dry wit, tough-minded romanticism, and elegance that are the hallmarks of Wilder's films. This book is a classic of Hollywood history and lore.
490	Rain of Gold	1992	10	58	372	https://images.gr-assets.com/books/1320554857l/14345.jpg	In Rain of Gold, Victor Villasenor weaves the parallel stories of two families and two countries…bringing us the timeless romance between the volatile bootlegger who would become his father and the beautiful Lupe, his mother–men and women in whose lives the real and the fantastical exist side by side…and in whose hearts the spirit to survive is fueled by a family’s unconditional love.
491	The Titan	1986	8	22	373	https://images.gr-assets.com/books/1348842184l/396734.jpg	The Titan is a novel by Theodore Dreiser and the sequel to The Financier. Frank Cowperwood has moved to Chicago with new wife Aileen. His plan is to take over the street-railway system in the process bankrupting opponents with political allies. The Titan follows Cowperwood through the trials of realizing his dream, marital upheavals and social banishment. Theodore Dreiser was an American novelist and journalist who the naturalist school and is known for portraying characters whose value lies not in their moral code, but in their persistence against all obstacles, and literary situations that more closely resemble studies of nature than tales of choice and agency.
492	Dreamer	2000	10	9	374	https://images.gr-assets.com/books/1359666105l/17311105.jpg	We all have a little Dragon inside of us, something that struggles to find solace.….Dreamer is the first book in a series that portrays life as a mixture of fantasy and reality. The main character, Magic, flows between the worlds, often preferring one more than the other. Both of his lives are fraught with their own dangers. He must struggle with illness and alternatively with the life of a Great Red Dragon.
493	Bitch	1990	9	58	375	https://images.gr-assets.com/books/1386920431l/214261.jpg	Precious Cummings came from nothing but was determined to have it all. Using her most deadly weapons - undeniable beauty, body and street savvy brains, Precious sets out to change the cards that she'd been dealt. After meeting Nico Carter, a man who can help her achieve her goals, virtually overnight she is on her way. Precious quickly transforms from Project Chick to Hood Queen and is determined to hold on to her position even if it means crossing the man who made it possible. Set on revenge, Precious gambles it all in her quest to gain everything. Just when she believes the dice have rolled in her favor, Precious has to answer for the web of deceit that she has set in motion.
494	When We Were Very Young	1992	9	50	376	https://images.gr-assets.com/books/1347499408l/1483359.jpg	When We Were Very Young and Now We Are Six complete the four-volume set of deluxe editions of the Milne and Shepard classic works. Like their companions, the Winnie-the-Pooh 80th Anniversary Edition and The House At Pooh Corner, these beautiful books feature full-color artwork on cream-colored stock. The imaginative charm that has made Pooh the world’s most famous bear pervades the pages of Milne’s poetry, and Ernest H. Shepard’s witty and loving illustrations enhance these truly delightful gift editions.
644	The Reckoning	1992	9	56	481	https://images.gr-assets.com/books/1448657502l/119825.jpg	"Penman's characters are so shrewdly imagined, so full of resonant human feeling that they seem to be on the page....Most compelling is the portrait of the Welsh as wild and rugged as their landscape."SAN FRANCISCO CHRONICLEHere, alive from the pages of history, is the compelling tale of a Celtic society ruled by Llewelyn, Prince of Wales, on a collison course with a feudal realm of Edward I. WIth this last book in the extraordinary trilogy that began with HERE BE DRAGONS and continued in FALLS THE SHADOW, Sharon Kay Penman has written a beautiful and moving conclusion to her medieval saga. For everyone who has read the earlier books in this incomparable series or ever wanted to experience the rich tapestry of British history and lore, this bold and romantic adventure must be read.
498	Peace Is Every Step: The Path of Mindfulness in Everyday Life	1992	8	1	378	https://images.gr-assets.com/books/1320544155l/14572.jpg	In the rush of modern life, we tend to lose touch with the peace that is available in each moment. World-renowned Zen master, spiritual leader, and author Thich Nhat Hanh shows us how to make positive use of the very situations that usually pressure and antagonize us. For him a ringing telephone can be a signal to call us back to our true selves. Dirty dishes, red lights, and traffic jams are spiritual friends on the path to "mindfulness"—the process of keeping our consciousness alive to our present experience and reality. The most profound satisfactions, the deepest feelings of joy and completeness lie as close at hand as our next aware breath and the smile we can form right now.Lucidly and beautifully written, Peace Is Every Step contains commentaries and meditations, personal anecdotes and stories from Nhat Hanh's experiences as a peace activist, teacher, and community leader. It begins where the reader already is—in the kitchen, office, driving a car, walking a part—and shows how deep meditative presence is available now. Nhat Hanh provides exercises to increase our awareness of our own body and mind through conscious breathing, which can bring immediate joy and peace. Nhat Hanh also shows how to be aware of relationships with others and of the world around us, its beauty and also its pollution and injustices. the deceptively simple practices of Peace Is Every Step encourage the reader to work for peace in the world as he or she continues to work on sustaining inner peace by turning the "mindless" into the mindFUL.
499	Being Peace	1987	9	8	378	https://images.gr-assets.com/books/1223675555l/331344.jpg	Since its publication in 1987, "Being Peace" has become a classic of contemporary religious literature. In his simple and readable style, Thich Nhat Hanh shows how our state of mind and body can make the world a peaceful place. We learn to transform the very situations that pressure and antagonize us into opportunities for practicing mindfulness.
652	A Man	1981	9	58	488	https://images.gr-assets.com/books/1388426472l/82895.jpg	"What's the point anyway — Of suffering, dying? It teaches us to live, boy. A man who does not struggle does not live, he survives." (quote from the book)The book is a pseudo-biography about Alexandros Panagoulis written in the form of a novel. Fallaci had an intense romantic relationship with Panagoulis. She uses the novel to put forth her view that Panagoulis was assassinated by a vast conspiracy, a view widely shared by many Greeks.
502	The Death and Life of Great American Cities	1963	9	1	381	https://images.gr-assets.com/books/1168135326l/30833.jpg	A direct and fundamentally optimistic indictment of the short-sightedness and intellectual arrogance that has characterized much of urban planning in this century, The Death and Life of Great American Cities has, since its first publication in 1961, become the standard against which all endeavors in that field are measured. In prose of outstanding immediacy, Jane Jacobs writes about what makes streets safe or unsafe; about what constitutes a neighborhood, and what function it serves within the larger organism of the city; about why some neighborhoods remain impoverished while others regenerate themselves. She writes about the salutary role of funeral parlors and tenement windows, the dangers of too much development money and too little diversity. Compassionate, bracingly indignant, and always keenly detailed, Jane Jacobs's monumental work provides an essential framework for assessing the vitality of all cities.
503	The Poetry of Pablo Neruda	2003	10	50	382	https://images.gr-assets.com/books/1417605511l/5936.jpg	The most comprehensive English-language collection of work ever by "the greatest poet of the twentieth century - in any language" - Gabriel García Márquez"In his work a continent awakens to consciousness." So wrote the Swedish Academy in awarding the Nobel Prize to Pablo Neruda, the author of more than thirty-five books of poetry and one of Latin America's most revered writers, lionized during his lifetime as "the people's poet." This selection of Neruda's poetry, the most comprehensive single volume available in English, presents nearly six hundred poems, scores of them in new and sometimes multiple translations, and many accompanied by the Spanish original. In his introduction, Ilan Stavans situates Neruda in his native milieu as well as in a contemporary English-language one, and a group of new translations by leading poets testifies to Neruda's enduring, vibrant legacy among English-speaking writers and readers today.
504	Love	2003	8	50	382	https://images.gr-assets.com/books/1388472624l/5937.jpg	Poems from the Film Il Postino. The poems collected in this book are at the heart of the film Il Postino, a cinematic fantasy spun from an apocryphal incident in the life of the Chilean poet and Nobel laureate, Pablo Neruda. Together they show why many consider Neruda to be the finest love poet of the century. Few writers of any age have described the pleasures and torments of erotic love with such un-sentimental directness and sensual precision. Here, too, we find Neruda at his most accessible, the language of his odes and lyrics refined to the point at which it achieves, in critic Jean Franco's words, "the naturalness of song". This short selection draws on work from throughout his writing life, from the famous early collection Twenty Love Songs & a Song of Despair (1924) to the key works of his maturity, Residence on Earth (1935), Elemental Odes (1954) and the autobiographical Memorial de Isla Negra (1964). It offers an enticing glimpse of one of modern poetry's greatest masters.
506	The Poetry and Short Stories of Dorothy Parker (Modern Library)	1994	10	50	384	https://images.gr-assets.com/books/1388256365l/44456.jpg	Product Details Hardcover: 457 pages Publisher: Modern Library; 1994 Modern Library ed edition (August 30, 1994) Language: English
532	The Heavenly Man: The Remarkable True Story of Chinese Christian Brother Yun	2003	0	17	405	https://images.gr-assets.com/books/1388287262l/79421.jpg	The dramatic autobiography of one of China's dedicated, courageous, and intensely persecuted house church leaders. This is the gripping story of how God took a young, half-starved boy from a poor village in Henan province and placed him on the front line for Jesus, in the face of impossible odds. Instead of focusing on the many miracles or experiences of suffering, however, Yun prefers to focus on the character and beauty of Jesus. Interspersed with his personal account are contributions from his wife, Deling, made mostly during her husband's frequent periods of imprisonment. You will remember where you were the first time you read this life story. It's a watershed book that will turn the reader to prayer and praise. It deserves comparison with past classics such as Tortured for Christ by Richard Wurmbrand, or the Life of Watchman Nee.
507	Lawless	2003	10	23	385	https://images.gr-assets.com/books/1441396911l/25756072.jpg	Thia is prim and proper.Bear is leather and lawless.It will never work between them.It's a lie they almost believe...It is necessary to first read King and Tyrant to fully enjoy Lawless.
509	Three Comrades	1998	8	22	386	https://images.gr-assets.com/books/1515771860l/91203.jpg	The year is 1928. On the outskirts of a large German city, three young men are earning a thin and precarious living. Fully armed young storm troopers swagger in the streets. Restlessness, poverty, and violence are everywhere. For these three, friendship is the only refuge from the chaos around them. Then the youngest of them falls in love, and brings into the group a young woman who will become a comrade as well, as they are all tested in ways they can never have imagined. . . .Written with the same overwhelming simplicity and directness that made All Quiet on the Western Front a classic, Three Comrades portrays the greatness of the human spirit, manifested through characters who must find the inner resources to live in a world they did not make, but must endure.
510	Lilith's Brood	2000	7	53	387	https://images.gr-assets.com/books/1439247785l/60926.jpg	Lilith Iyapo is in the Andes, mourning the death of her family, when war destroys Earth. Centuries later, she is resurrected -- by miraculously powerful unearthly beings, the Oankali. Driven by an irresistible need to heal others, the Oankali are rescuing our dying planet by merging genetically with mankind. But Lilith and all humanity must now share the world with uncanny, unimaginably alien creatures: their own children. This is their story...
511	Making Faces	1997	9	23	388	https://images.gr-assets.com/books/1378983590l/18301124.jpg	Ambrose Young was beautiful. He was tall and muscular, with hair that touched his shoulders and eyes that burned right through you. The kind of beautiful that graced the covers of romance novels, and Fern Taylor would know. She'd been reading them since she was thirteen. But maybe because he was so beautiful he was never someone Fern thought she could have...until he wasn't beautiful anymore.\tMaking Faces is the story of a small town where five young men go off to war, and only one comes back. It is the story of loss. Collective loss, individual loss, loss of beauty, loss of life, loss of identity. It is the tale of one girl's love for a broken boy, and a wounded warrior's love for an unremarkable girl. This is a story of friendship that overcomes heartache, heroism that defies the common definitions, and a modern tale of Beauty and the Beast, where we discover that there is a little beauty and a little beast in all of us.
512	Fortune's Favorites	1993	7	56	389	https://images.gr-assets.com/books/1299311205l/182430.jpg	They were blessed by the gods at birth with wealth and privilege. In a time of cataclysmic upheaval, a bold new generation of Romans vied for greatness amid the disintegrating remnants of their beloved Republic. But there was one who towered above them all -- a brilliant and beautiful boy whose ambition was unequaled, whose love was legend and whose glory was Rome's. A boy they would one day call "Caesar."
513	Caesar	2003	9	56	389	https://images.gr-assets.com/books/1294874127l/3416.jpg	It's 54 BCE. Gaius Julius Caesar is sweeping thru Gaul, crushing the fierce, long-haired warrior-kings who stand in his way. His victories in the name of Rome are epic, but the leaders of the Republic are not pleased. They're terrified. Where will the boundless ambition of Rome's most brilliant soldier stop? He must be destroyed before he can overthrow the government & install himself as Dictator.
653	One	1989	9	32	489	https://images.gr-assets.com/books/1328765629l/3118349.jpg	Blue is a quiet color. Red’s a hothead who likes to pick on Blue. Yellow, Orange, Green, and Purple don’t like what they see, but what can they do? When no one speaks up, things get out of hand — until One comes along and shows all the colors how to stand up, stand together, and count. As budding young readers learn about numbers, counting, and primary and secondary colors, they also learn about accepting each other's differences and how it sometimes just takes one voice to make everyone count.
539	The Aleph and Other Stories	2004	0	43	412	https://images.gr-assets.com/books/1440785365l/5787.jpg	Full of philosophical puzzles and supernatural surprises, these stories contain some of Borges’s most fully realized human characters. With uncanny insight he takes us inside the minds of an unrepentant Nazi, an imprisoned Mayan priest, fanatical Christian theologians, a woman plotting vengeance on her father’s “killer,” and a man awaiting his assassin in a Buenos Aires guest house.  This volume also contains the hauntingly brief vignettes about literary imagination and personal identity collected in The Maker, which Borges wrote as failing eyesight and public fame began to undermine his sense of self.For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.
514	The Making of the Atomic Bomb	1987	8	34	390	https://images.gr-assets.com/books/1440621221l/16884.jpg	Here for the first time, in rich, human, political, and scientific detail, is the complete story of how the bomb was developed, from the turn-of-the-century discovery of the vast energy locked inside the atom to the dropping of the first bombs on Japan.Few great discoveries have evolved so swiftly -- or have been so misunderstood. From the theoretical discussions of nuclear energy to the bright glare of Trinity there was a span of hardly more than twenty-five years. What began as merely an interesting speculative problem in physics grew into the Manhattan Project, and then into the Bomb with frightening rapidity, while scientists known only to their peers -- Szilard, Teller, Oppenheimer, Bohr, Meitner, Fermi, Lawrence, and yon Neumann -- stepped from their ivory towers into the limelight.Richard Rhodes takes us on that journey step by step, minute by minute, and gives us the definitive story of man's most awesome discovery and invention.
515	Heartless	2001	8	23	391	https://images.gr-assets.com/books/1421665031l/24576840.jpg	Coreen Samantha Aquino has been in love with Noah Elizalde all her life. She's his number one fan, though he hardly pays attention to her. So when Noah's equally gorgeous brother Rozen Elizalde, offered her a deal to become close to Noah, Coreen thought twice. She was dealing with Rozen after all, the shrewd and notorious playboy among the Elizalde brothers. Pero tinanggap ni Coreen ang offer, thinking she could outwit Rozen and win over Noah. But should she be wary of trusting Rozen? Or would her own heart betray her?
516	Until Forever	1995	9	23	391	https://images.gr-assets.com/books/1403500539l/22568460.jpg	Elijah Montefalco never liked this particular girl cousin. Naramdaman niyang ayaw sa kanya ng pinsan niyang ito at hindi naman siya 'yong tipong ipagpipilitan ang kanyang sarili sa taong ayaw sa kanya. They were family so he needed to deal with her sometimes. Mabuti na nga lang at marami naman sila kaya hindi na napapansin ng iba na ayaw nila sa isa't-isa. But there was a reason why he never liked her… Pero bakit nga ba? Ano ang nangyari at bakit nagkaganito? Paano sila napunta dito? And after all the sacrifices, would they still make it through? Kaya nga kaya ng pagmamahalan nila na lagpasan lahat? Paano kung hindi pa nga naayos ay unti unting mawawasak ulit? Is their love really a curse? Can't they live happily even just for a moment? Is their forever too much to ask for?
517	Shadowed Love	1977	9	23	392	https://images.gr-assets.com/books/1347546299l/6728378.jpg	Romance is like a burning jewel, it either sparks and flames brightly, or it is shadowed by the world's cruel intervention. Shadowed Love is the story of a love between a black man and a white woman. Their love is like a flawless pearl, perfect, unblemished, except for the cruelty of humanity determined to destroy it. Young Bonnie Winters and her mother Noelene have left Australia to begin a new life in South Africa. Bonnie's attraction to Abraham Mogale, a black man working the printing press at her private school, soon ignites into a passion that cannot be ignored. Despite the considerable risks, the lovers vow to be together even if it means leaving the country. However, their ultimate goal faces several challenges that will test the endurance of their spirits and their love for each other.
520	Autobiography of Red: A Novel in Verse	1998	7	50	395	https://images.gr-assets.com/books/1387738932l/1406018.jpg	In her first novel in verse, Anne Carson bridges the gap between classicism and the modern, poetry and prose, with a volcanic journey into the soul of a winged red monster named Geryon.There is a strong mixture of whimsy and sadness in Geryon's story. He is tormented as a boy by his brother, escapes to a parallel world of photography, and falls in love with Herakles--a golden young man who leaves Geryon at the peak of infatuation. Geryon retreats ever further into the world created by his camera, until that glass house is suddenly and irrevocably shattered by Herakles' return. Running throughout is Geryon's fascination with his wings, the color red, and the fantastic accident of who he is.Autobiography of Red is a deceptively simple narrative layered with currents of meaning, emotion, and the truth about what it's like to be red. It is a powerful and unsettling story that moves, disturbs, and delights.
521	Autobiography of Red	1999	8	50	395	https://images.gr-assets.com/books/1403176248l/61049.jpg	The award-winning poet Anne Carson reinvents a genre in Autobiography of Red, a stunning work that is both a novel and a poem, both an unconventional re-creation of an ancient Greek myth and a wholly original coming-of-age story set in the present.Geryon, a young boy who is also a winged red monster, reveals the volcanic terrain of his fragile, tormented soul in an autobiography he begins at the age of five. As he grows older, Geryon escapes his abusive brother and affectionate but ineffectual mother, finding solace behind the lens of his camera and in the arms of a young man named Herakles, a cavalier drifter who leaves him at the peak of infatuation. When Herakles reappears years later, Geryon confronts again the pain of his desire and embarks on a journey that will unleash his creative imagination to its fullest extent. By turns whimsical and haunting, erudite and accessible, richly layered and deceptively simple, Autobiography of Red is a profoundly moving portrait of an artist coming to terms with the fantastic accident of who he is."A profound love story . . . sensuous and funny, poignant, musical and tender."--The New York Times Book Review"A deeply odd and immensely engaging book. . . . [Carson] exposes with passionate force the mythic underlying the explosive everyday."  --The Village VoiceA NEW YORK TIMES NOTABLE BOOK OF THE YEARNational book Critics Circle Award Finalist
530	The Uprising	1994	8	9	403	https://images.gr-assets.com/books/1373190153l/18166527.jpg	Julianna Rae has a secret. One she refuses to tell... It could lead to the downfall of them all. Julianna has barely survived her first battle with the Militia Commander. Now she must follow her new mentor, Master watcher Caden Madison deeper into a world she desperately doesn’t want. In the throes of war, hidden in the caves of Devils Canyon, Caden Madison must find a way to return his defeated Rebel camp and Julianna—his new apprentice Seer, safely to the city sectors, where they can regroup against the Militia. A single hope of escape lies within a secret refuge, but escape has many meanings and rules are quickly broken in the seclusion of the farmhouse shelter they harbor in. Secrets are divulged, and only Isis’ communication can save their fragile camp from collapse. However their captors are closing in. The New World Order eagerly awaits the arrival of their Seer and the Militia Commander intends on delivering her at any cost necessary. How far will Caden Madison go to protect his apprentice?
522	Second Time Around	1998	7	23	396	https://images.gr-assets.com/books/1347715303l/12662207.jpg	The follow-up novel to the popular Awakening and second in The Lewis Legacy Series, Second Time Around proves that God's time is the right time. Marc Thompson is on top of the world-a newlywed with a beautiful wife, the owner of a thriving Boston sports advertising agency, and a century-old home they're renovating in the suburbs. Then the unthinkable happens. Two months after the wedding, Marc sits in a hospital emergency waiting room after Natalie suffers a horrible fall. One shock follows another. Not only does his wife remember nothing of their life together, but now he has a personal timeline to reconnect with her-seven months. Marc's gold wedding band mocks him, a glaring reminder of a promise broken by a rotting basement stair and his own negligence. His renowned psychologist advises him to court his wife again-a daunting task the first time around. Then Marc's pastor suggests he call Sam and Lexa Lewis of TeamWork Missions, a ministry dear to Natalie's heart. Determined to help her reclaim her life, the young groom makes great strides until a ghost from the past surfaces, opening fresh wounds and threatening to destroy it all. With Natalie's trust shattered and Marc's faith wavering, they head to Milestone Ranch outside Helena, Montana, with TeamWork for a two-week work camp. But instead of romancing his wife in the freezing November temperatures with warm fires and shared sweet moments, he's out in the cold and back at square one. Even if Natalie recovers her lost memories, will she forgive him? If not, can Marc come to terms with his deepest fear-the failure of his marriage? You'll root for Marc and Natalie as they fight against the odds and discover that surrendering all at the throne of grace doesn't mean failure. It's simply called faith. And it might be the only way to finding their way back to one another . . . the second time around.
523	Final Quest	1983	8	9	397	https://images.gr-assets.com/books/1328838902l/8468743.jpg	The secret is out--DROON is the series that kids, parents, and teachers are talking about! There are more than 9 million DROON books in print.An immortal dragon. A long hidden secret. The kingdom of Droon is at the brink of war. . .The situation in Droon has never been more desperate. The wizard Galen is missing. Eric has been forced undercover with Gethwing, the all-powerful Moon Dragon. And millions of beasts are assembling outside Jaffa City, ready to attack Droon's capital.Eric, Keeah, Neal, and Julie will do whatever it takes to save their beloved kingdom. But to defeat the Moon Dragon, they'll need to uncover the greatest secret in all of Droon. . . .
645	Night Journey	1999	9	9	482	https://images.gr-assets.com/books/1321063151l/13044955.jpg	Zan and Emma’s romantic weekend at a haunted hotel goes horribly wrong when a bizarre accident leaves Emma in a coma. Her soul is catapulted backward in time to 1938, where she meets Ivy and Harry—a Depression Era Romeo and Juliet—who will someday become Zan’s grandparents. Night Journey is an eerie tale of ghosts who weave in and out of life, past and present, from fact to fiction.
556	The Constitution of the United States of America	1995	10	34	424	https://images.gr-assets.com/books/1328756752l/89959.jpg	The complete text of the United States Constitution, including all of the amendments.
524	The Man Who Loved Clowns	1995	7	46	398	https://images.gr-assets.com/books/1388345437l/69092.jpg	Delrita likes being invisible. If no one notices her, then no one willnotice her uncle Punky either. Punky is a grown man with a child's mind. Delrita loves him dearly and can't stand people making fun of his Down Syndrome. But when tragedy strikes, Delrita's quiet life and Punky's are disrupted forever. Can she finally learn to trust others, for her own sake and Punky's? This story captures the joy and sorrow that come when we open our hearts to love. Author Biography: June Rae Wood lives near Windsor, Missouri.
525	Searching for David's Heart: A Christmas Story	1998	8	46	399	https://images.gr-assets.com/books/1387711225l/747399.jpg	When her older brother, David, dies in an accident, Darcy feels responsible for his death. Then she meets the boy who received David's heart in an organ transplant, and learns that life truly does go on.A journey of faith, hope, and love.Life at Darcy's house isn't always easy. Money is tight, and her parents argue a lot. Darcy's shy and quiet with most people, but it's not like that with her brother, David. He and Darcy are soul mates. Until David gets a girlfriend, that is, and starts to treat Darcy as if she were a pest. Darcy is hurt and humiliated, and one day after a huge fight, Darcy runs off. David chases after her and is killed in a shocking accident. Darcy is sure his death is her fault.Then Darcy's parents decide to donate David's heart for transplant. Darcy believes that if she can find David's heart, even if it's beating in someone else's body, she will have found her brother, and in some way he will still be alive. And so the search for David's heart begins.
527	Absolute Truths	1996	10	58	401	https://images.gr-assets.com/books/1355060633l/11262.jpg	It is 1965, and Charles Ashworth has attained the plum position of bishop of Starbridge, an honor that keeps him in a heady whirl of activity that would exhaust the most seasoned corporate executive. With the invaluable support of his minions and his attractive, unsinkable wife, Ashworth stands against the amorality and decadence of the age—"Anti-Sex Ashworth." He slays his opponents by being a tough, efficient, confident churchman, the torments of his past long since dead and buried.And then the unexpected, the unthinkable, strikes.Suddenly Ashworth finds himself staring into the chasm of all the lies hes been telling himself for years: about his marriage, his children, even his views on the Church. And as he suspects his old nemesis and dean, Neville Aysgarth, of drinking too much, of financial chicanery, of—God forbid—having an affair, Ashworth discovers to his horror that he is tempted to commit the very acts that he has so publicly denounced....
528	Freedom from the Known	1975	10	41	402	https://images.gr-assets.com/books/1410132490l/143877.jpg	Krishnamurti shows how people can free themselves radically and immediately from the tyranny of the expected, no matter what their age--opening the door to transforming society and their relationships.
529	Total Freedom: The Essential Krishnamurti	1996	7	41	402	https://images.gr-assets.com/books/1391275629l/143878.jpg	Counted among his admirers are Jonas Salk, Aldous Huxley, David Hockney, and Van Morrison, along with countless other philosophers, artist, writers and students of the spiritual path. Now the trustees of Krishnamurti’s work have gathered his very best and most illuminating writings and talks to present in one volume the truly essential ideas of this great spiritual thinker.Total Freedom includes selections from Krishnamurti’s early works, his ‘Commentaries on Living’, and his discourses on life, the self, meditation, sex and love. These writings reveal Krishnamuri’s core teachings in their full eloquence and power: the nature of personal freedom; the mysteries of life and death; and the ‘pathless land’, the personal search for truth and peace. Warning readers away from blind obedience to creeds or teachers – including himself – Krishnamurti celebrated the individual quest for truth, and thus became on of the most influential guides for independent-minded seekers of the twentieth century – and beyond.
531	Dangerous Lady	1992	9	24	404	https://images.gr-assets.com/books/1343669093l/936611.jpg	No one thinks a seventeen-year-old girl can take on the hard men of London's gangland, but it's a mistake to underestimate Maura Ryan: she's tough, clever and beautiful —and she's determined that nothing will stand in her way. Which makes her one very dangerous lady.Together, she and her brother Michael are unbeatable: the Queen and King of organised crime, they run the pubs and clubs, the prostitutes and pimps of the West End. With Maura masterminding it, they pull off an audicious gold bullion robbery and have much of the Establishment in their pockets.But notoriety has its price. The police are determined to put Maura away once and for all —and not everyone in the family thinks that's such a bad idea. When it comes to the crunch, Maura has to face the pain of lost love in her past —and the dangerous lady discovers her heart is not made entirely of stone.
577	The Godfather	2004	7	58	435	https://images.gr-assets.com/books/1394988109l/22034.jpg	The Godfather—the epic tale of crime and betrayal that became a global phenomenon.Almost fifty years ago, a classic was born. A searing portrayal of the Mafia underworld, The Godfather introduced readers to the first family of American crime fiction, the Corleones, and their powerful legacy of tradition, blood, and honor. The seduction of power, the pitfalls of greed, and the allegiance to family—these are the themes that have resonated with millions of readers around the world and made The Godfather the definitive novel of the violent subculture that, steeped in intrigue and controversy, remains indelibly etched in our collective consciousness.~penguin.com
533	Plenty	1978	10	25	406	https://images.gr-assets.com/books/1327921381l/8086216.jpg	With his fabulous restaurants and bestselling Ottolenghi Cookbook, Yotam Ottolenghi has established himself as one of the most exciting talents in the world of cookery and food writing. This exclusive collection of vegetarian recipes is drawn from his column 'The New Vegetarian' for the Guardian's Weekend magazine, and features both brand-new recipes and dishes first devised for that column.Yotam's food inspiration comes from his strong Mediterranean background and his unapologetic love of ingredients. Not a vegetarian himself, his approach to vegetable dishes is wholly original and innovative, based on strong flavours and stunning, fresh combinations. With sections devoted to cooking greens, aubergines, brassicas, rice and cereals, pasta and couscous, pulses, roots, squashes, onions, fruit, mushrooms and tomatoes, the breadth of colours, tastes and textures is extraordinary.Featuring vibrant, evocative food photography from acclaimed photographer Jonathan Lovekin, and with Yotam's voice and personality shining through, Plenty is a must-have for meat-eaters and vegetarians alike.
563	Mary Stewart's Merlin Trilogy	1980	0	9	429	https://images.gr-assets.com/books/1348004460l/27689.jpg	The prophetic voice of Merlin, the mysterious enchanter of Arthurian legend, has completed his story. Written over a period of ten years, Mary Stewart's three best-selling novels now stand together in one volume - the finest work of her distinguished career.Hers is the most extended portrait in all literature in this compelling figure of Dark Age myth and history. Merlin, the protector and tutor of Arthur, has usually been portrayed as an old man. But The Crystal Cave begins the trilogy with the story of his perilous childhood as the bastard son of a Welsh king's daughter and the secret discovery of the magic arts that will set him apart from other men.With the birth of Arthur, Merlin's guardianship began and the ancient legend continues in The Hollow Hills with the dramatic immediacy that is Mary Stewart's special gift.
534	A Soldier of the Great War	1992	9	58	407	https://images.gr-assets.com/books/1328874912l/87985.jpg	From acclaimed novelist Mark Helprin, a lush, literary epic about love, beauty, and the world at war.Alessandro Giuliani, the young son of a prosperous Roman lawyer, enjoys an idyllic life full of privilege: he races horses across the country to the sea, he climbs mountains in the Alps, and, while a student of painting at the ancient university in Bologna, he falls in love. Then the Great War intervenes. Half a century later, in August of 1964, Alessandro, a white-haired professor, tall and proud, meets an illiterate young factory worker on the road. As they walk toward Monte Prato, a village seventy kilometers away, the old man—a soldier and a hero who became a prisoner and then a deserter, wandering in the hell that claimed Europe—tells him how he tragically lost one family and gained another. The boy, envying the richness and drama of Alessandro's experiences, realizes that this magnificent tale is not merely a story: it's a recapitulation of his life, his reckoning with mortality, and above all, a love song for his family.
535	The King	2002	10	9	408	https://images.gr-assets.com/books/1378144254l/18427989.jpg	In the darkest corners of the night in Caldwell, New York, a conflict like no other rages. The city is home to a band of brothers born to defend their race: the warrior vampires of the Black Dagger Brotherhood . . .Wrath and the Brotherhood are locked in an epic battle over his throne and the very future of the vampire race.
566	The Immortal Highlander	2004	0	23	430	https://images.gr-assets.com/books/1436985405l/112752.jpg	BEWARE:LETHALLY SEDUCTIVE ALPHA MALE OF IMMENSE STRENGTH AND DARK EROTICISM. DO NOT LOOK AT HIM. DO NOT TOUCH HIM. DO NOT BE TEMPTED. DO NOT BE SEDUCED....With his long, black hair and dark, mesmerising eyes, Adam Black is Trouble with a capital T. Immortal, arrogant, and intensly sensual, he is free to roam across time and continents in pursuit of his insatiable desires. That is, until a curse strips him of his immortality and makes him invisible, a cruel fate for so irresistible a man. Now Adam's only hope for survival is in the hands of the one woman who can actually see him.Enter law student Gabrielle O'Callaghan. For Gabrielle, cursed with the ability to see both worlds, Mortal and Faery, it is the beginning of a long, dangerous seduction. But as Adam's quest to regain his immortality plunges them into a world of timeless magic, the price of surrender could be their very lives. Unless they can thwart the cosnpiracy that threatens both Mortal and Faery realms...and give them a shot at a destiny few mortals ever know: glorious, wondrous, endless love...
536	Silver Shadows	1993	9	46	409	https://images.gr-assets.com/books/1389304070l/8709524.jpg	Sydney Sage is an Alchemist, one of a group of humans who dabble in magic and serve to bridge the worlds of humans and vampires. They protect vampire secrets—and human lives.In The Fiery Heart, Sydney risked everything to follow her gut, walking a dangerous line to keep her feelings hidden from the Alchemists.Now in the aftermath of an event that ripped their world apart, Sydney and Adrian struggle to pick up the pieces and find their way back to each other. But first, they have to survive. For Sydney, trapped and surrounded by adversaries, life becomes a daily struggle to hold on to her identity and the memories of those she loves. Meanwhile, Adrian clings to hope in the face of those who tell him Sydney is a lost cause, but the battle proves daunting as old demons and new temptations begin to seize hold of him. . . .Their worst fears now a chilling reality, Sydney and Adrian face their darkest hour in this heart-pounding fifth installment in the New York Times bestselling Bloodlines series, where all bets are off.
537	FOR LOVE OF THE DARK ONE (Shambhala Centaur Editions)	1993	9	50	410	https://images.gr-assets.com/books/1343075581l/6552717.jpg	Mirabai is probably the best-known poet in India today, even though she lived 400 years ago (1498-1593). Her poems of ecstatic praise to Krishna, whom she lovingly calls "The Dark One", are set to music and sung by schoolchildren, and are frequently heard as background tracks in contemporary films.As alive today as it was in the 16th century, Mirabai's poetry is about freedom, breaking with traditional stereotypes, and trusting completely in the benediction of God. It is also some of the most exalted mystical poetry in all of world literature, expressing her complete surrender to the divine, her longing, and her madness in love.This book is a revised edition of a Shambhala Centaur book that was published in 1994 and sold 10,000 copies in the two years following its release. The new edition contains the original 80 poems, a completely revised introduction, updated glossary, bibliography and discography, and additional Sanskrit notations.
538	Double Shot	2004	8	3	411	https://images.gr-assets.com/books/1274144398l/8151358.jpg	Now that Maya is engaged to Jack, the love of her life, everything should be perfect, but actually, it's the opposite. Maya must trust that God is in control even when things seem to be a disastrous mess. This fiction novel uses the power of story and humor to challenge teens to discover the relevance of faith in their lives. This fun, lighthearted read promotes trust in God.
553	Watchmen	1987	8	37	421	https://images.gr-assets.com/books/1442239711l/472331.jpg	This Hugo Award-winning graphic novel chronicles the fall from grace of a group of super-heroes plagued by all-too-human failings. Along the way, the concept of the super-hero is dissected as the heroes are stalked by an unknown assassin.One of the most influential graphic novels of all time and a perennial best-seller, Watchmen has been studied on college campuses across the nation and is considered a gateway title, leading readers to other graphic novels such as V for Vendetta, Batman: The Dark Knight Returns and The Sandman series.
570	Sunrise	1984	0	3	433	https://images.gr-assets.com/books/1388190736l/289643.jpg	In preparation for their long-awaited wedding day, Dayne and Katy are determined to keep the ceremony a secret from the paparazzi. Their relationship grows closer and stronger as they plan together, but in the end it takes the help of the Baxter family and many of the CKT kids so that they'll even have a chance at a private wedding. John Baxter is thrilled that his oldest son will be settling down a few miles away, but he isn't sure how any of his kids will handle a situation he can no longer run from—the feelings he is having for his friend Elaine. In the meantime, the Flanigan family is struggling with their young boarder, Cody Coleman, Jim Flanigan's star receiver. After an alcohol overdose, Cody fights for his life. Only God's grace and a miracle can bring him back from the brink of death—physically and spiritually.
571	One Tuesday Morning	2003	0	11	433	https://images.gr-assets.com/books/1436486968l/97862.jpg	I’m a firefighter, God, so I know I’ve been in some tough places before. But this . . . this not knowing the people I love . . . this is the hardest thing I can imagine. The last thing Jake Bryan knew was the roar of the World Trade Center collapsing on top of him and his fellow firefighters. The man in the hospital bed remembers nothing. Not rushing with his teammates up the stairway of the south tower to help trapped victims. Not being blasted from the building. And not the woman sitting by his bedside who says she is his wife. Jamie Bryan will do anything to help her beloved husband regain his memory, and with it their storybook family life with their small daughter, Sierra. But that means helping Jake rediscover the one thing Jamie has never shared with him: his deep faith in God. Jake’s fondest prayer for his wife is about to have an impact beyond anything he could possibly have conceived. One Tuesday Morning is a love story like none you have ever read: tender, poignant, commemorating the tragedy and heroism of September 11 and portraying the far-reaching power of God’s faithfulness and a good man’s love.
540	Selected Non-Fictions	2000	8	1	412	https://images.gr-assets.com/books/1328156743l/16566.jpg	It will come as a surprise to some readers that the greater part of Jorge Luis Borges's extraordinary writing was not in the genres of fiction or poetry, but in the various forms of non-fiction prose. His thousands of pages of essays, reviews, prologues, lectures, and notes on politics and culture—though revered in Latin America and Europe as among his finest work—have scarcely been translated into English.For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.
542	Collected Fictions	1999	9	58	412	https://images.gr-assets.com/books/1386924676l/17961.jpg	Jorge Luis Borges has been called the greatest Spanish-language writer of our century. Now for the first time in English, all of Borges' dazzling fictions are gathered into a single volume, brilliantly translated by Andrew Hurley. From his 1935 debut with The Universal History of Iniquity, through his immensely influential collections Ficciones and The Aleph, these enigmatic, elaborate, imaginative inventions display Borges' talent for turning fiction on its head by playing with form and genre and toying with language. Together these incomparable works comprise the perfect one-volume compendium for all those who have long loved Borges, and a superb introduction to the master's work for those who have yet to discover this singular genius.
543	The Unabridged Edgar Allan Poe	1983	10	58	413	https://images.gr-assets.com/books/1174965899l/463423.jpg	Under-appreciated in his own time, Poe's unique genius for exploring the darker corridors of the human imagination raised nightmares to the level of art. This collection includes poetry and prose, including "The Conqueror Worm", "The Fall of the House of Usher", "The Murders in the Rue Morgue", and "The Pit and the Pendulum". 1,186 pp.
544	In Search of Lost Time	2002	9	22	414	https://images.gr-assets.com/books/1352231701l/18796.jpg	For this complete, authoritative English-language edition, D. J. Enright has revised the late Terence Kilmartin's acclaimed reworking of C. K. Scott Moncrieff's translation to take into account the new definitive French editions of 'À la recherche du temps perdu' (the final volume of these new editions was published by the Bibliothèque de la Pléiade in 1989).
545	Ever After	1997	10	9	415	https://images.gr-assets.com/books/1345396768l/13241659.jpg	The ever after, the demonic realm that parallels the human world, is shrinking. If it disappears completely, so does all magic. It's up to witch-turned-daywalking-demon Rachel Morgan to avert catastrophe and keep life from changing... for the worse.While saving the world is important, it isn't Rachel's only motivation. There's also the small fact that she caused the ley line to rip in the first place, setting off a chain reaction of unfortunate events. That little mistake has made her life forfeit unless she can fix it. It's also made her more than a few enemies, including the most powerful demon in the ever after—a terrifying entity who eats souls and now has an insatiable appetite for her. He's already kidnapped her friend and goddaughter to lure her out, and if Rachel doesn't give herself up soon, they'll die.But Rachel has more than a few impressive and frightening skills of her own, and she isn't going to hand over her soul and her life without one hell of a fight. She's also got a surprise: elven tycoon Trent Kalamack. With this unlikely ally beside her—a prospect both thrilling and unnerving—she's going to return to the ever after, kick some demon butt, rescue her loved ones... and prevent an apocalypse before it's too late. Or, at least that's the plan...
546	Poems of Robert Burns	1994	10	50	416	https://images.gr-assets.com/books/1414432533l/7894437.jpg	Selected works of the Scottish poet whose immortality was assured at thirty-seven with such compositions as, "Auld Lang Syne", "Comin' thro' the Rye", and "A Red, Red Rose."
547	The Mind	1988	10	50	417	https://images.gr-assets.com/books/1377904013l/14058995.jpg	The Mind is JOHN FITZGERALD’s third poetry collection and continues and expands on his insight into the myriad aspects of human emotion. The poems are philosophical; emotions are set against the ‘objective’ consciousness of the mind. The result is a deep exploration of what it means to be human.
548	Smoke	1995	7	46	418	https://images.gr-assets.com/books/1362070902l/17137808.jpg	Pattyn Von Stratten’s father is dead, and Pattyn is on the run. After far too many years of abuse at the hands of her father, and after the tragic loss of her beloved Ethan and their unborn child, Pattyn is desperate for peace. Only her sister Jackie knows what happened that night, but she is stuck at home with their mother, who clings to normalcy by allowing the truth to be covered up by their domineering community leaders. Her father might be finally gone, but without Pattyn, Jackie is desperately isolated. Alone and in disguise, Pattyn starts a new life, but is it even possible to rebuild a life when everything you’ve known has burned to ash and lies seem far safer than the truth?
578	Roxaboxen	2004	0	32	436	https://images.gr-assets.com/books/1388271543l/334809.jpg	From two-time Caldecott Medal-winning illustrator Barbara Cooney and celebrated children’s book author Alice McLerran comes Roxaboxen, a treasured story about the magic of a child’s imagination.Marian called it Roxboxen. There across the road, it looked like any rocky hill—nothing but sand and rocks, and some old wooden boxes. But it was a special place. And all children needed to go there was a long stick and a soaring imagination.“A celebration of the transforming magic of the imagination. An original.” —ALA Booklist
549	Perfect	1994	8	46	418	https://images.gr-assets.com/books/1296179689l/9917945.jpg	Everyone has something, someone, somewhere else that they’d rather be. For four high-school seniors, their goals of perfection are just as different as the paths they take to get there.Cara’s parents’ unrealistic expectations have already sent her twin brother Conner spiraling toward suicide. For her, perfect means rejecting their ideals to take a chance on a new kind of love. Kendra covets the perfect face and body—no matter what surgeries and drugs she needs to get there. To score his perfect home run—on the field and off—Sean will sacrifice more than he can ever win back. And Andre realizes that to follow his heart and achieve his perfect performance, he’ll be living a life his ancestors would never understand.Everyone wants to be perfect, but when perfection loses its meaning, how far will you go? What would you give up to be perfect?
550	Why Me?	2001	10	51	419	https://images.gr-assets.com/books/1363453877l/17619550.jpg	THE HOT NEW NOVELLA FROM THE AUTHOR OF 'SALTY'!!!Popsicle is a whore from Cali who doesn't give a damn about her only child Monica. She blames her for the lost of the only person she's ever loved; her pimp Cobra. Popsicle feels that Monica owes her her happiness and her body. Monica respects Popsicle's hustle, but there is no way that she'd willingly sell her body for a living. Monica has plans to move down south with the love of her life and become a fashion designer. Popsicle isn't having that. She thinks it's time for Monica to pay her dues. Either she was going to do it willingly, or by force. Why Me is a novella of pure evil, revenge and undying love
552	Clone	2000	10	9	420	https://images.gr-assets.com/books/1478101693l/32858959.jpg	If that which makes you beautiful becomes society’s undoing, would you steal a fake child to save the future?\n\n\n\nThe Virginia Corp. is reeling from major losses, and after the brutal double murder in Prague, Monarch Enterprises isn’t sure if Savannah is even alive. With her kill contract still open and assets now hunting her on Astor’s campus, Monarch prepares the hyper-skilled young assassin, Delta 1A, to execute her on sight. Savannah is gone, though. Disappeared.\n\nIn her stead, the love-struck Abby Swann remains obsessed not only with Jake and Damien, but with morality issues surrounding Gerhard’s miracle transformations. When she attacks the staff at Gerhard’s San Francisco lab and kidnaps a clone, a gorgeous teenage red head, Abby unleashes a firestorm of events that should have her dead several times over. Her survival seems impossible, though, and this has her wondering, has she become another one of Gerhard’s twisted experiments?\n\nComplicating matters, the worst of tragedies strikes her inner circle. How will the new and improved Abby Swann cope with her need to right yet another catastrophic wrong? With the enigmatic and ever evolving Brayden James helping her mete out her own brand of justice, of course! The problem is, Abby is an itty-bitty fish in shark-infested waters spanning back through the ages, and she’s about to cross two men, both psychotic monsters of their own sort, both men the likes of which she has never encountered. Her chances of survival? Damn near zero.\n\n\n\nDue to mature content, Clone is recommended for ages 15 and up.\n\n\n\n\n\nINTERVIEW WITH THE AUTHOR\n\n\n\n \n\nQ – How do I get \n\n\n\nVannie, \n\n\n\nThe Swann series prequel, when it’s not listed on Amazon?\n\nA – Inside Clone or at the author’s website, you’ll find a link to download the FREE prequel. Vannie is an engaging read, a 47 page novella that can be enjoyed no matter where you’re at in the series, although you’ll probably enjoy the series even more if you start with Vannie.\n\n \n\nQ – What makes the Swann series special?\n\nA – I remember devouring the Harry Potter books thinking there was always something thrilling about each new adventure. The kinds of literary highs these stories inspire produce a feeling like no other! We’ve seen vampires, werewolves, angels, demons and tales from the dystopian future; I desperately wanted to tap into the next evolution of the young adult fiction genre! From this mindset, the Swann series was born…\n\n \n\nQ – What order should I read the books in?\n\nA – The books are meant to be read in the following order:\n\n  Vannie \n\n   Swann \n\n   Monarch \n\n   Clone \n\n   Masochist \n\n   Weapon \n\n   Raven \n\n   Abomination \n\n  \n\n   \n\nQ – Why should readers give the series a try?\n\nA – With an obsessive, almost unrivaled devotion, I set out to fill some of the larger holes left behind by
555	C. P. Cavafy: Collected Poems	1992	8	50	423	https://images.gr-assets.com/books/1348339384l/604117.jpg	C.P. Cavafy (1863-1933) lived in relative obscurity in Alexandria, and a collected edition of his poems was not published until after his death. Now, however, he is regarded as the most important figure in twentieth-century Greek poetry, and his poems are considered among the most powerful in modern european literature. Here is an extensively revised edition of the acclaimed translations of Edmund Keeley and Philip Sherrard, which capture Cavafy's mixture of formal and idiomatic use of language and preserve the immediacy of his frank treatment of homosexual themes, his brilliant re-creation of history, and his astute political ironies. The resetting of this entire edition has permitted the translators to review each poem and to make alterations where appropriate. George Savidis has revised and amplified the notes in keeping with his latest edition of the Greek text of Cavafy.
557	Onyx	2001	9	46	425	https://images.gr-assets.com/books/1329408511l/13047090.jpg	Being connected to Daemon Black sucks…Thanks to his alien mojo, Daemon’s determined to prove what he feels for me is more than a product of our bizarro connection. So I’ve sworn him off, even though he’s running more hot than cold these days. But we’ve got bigger problems.Something worse than the Arum has come to town…The Department of Defense are here. If they ever find out what Daemon can do and that we're linked, I’m a goner. So is he. And there's this new boy in school who’s got a secret of his own. He knows what’s happened to me and he can help, but to do so, I have to lie to Daemon and stay away from him. Like that's possible. Against all common sense, I'm falling for Daemon. Hard.But then everything changes…I’ve seen someone who shouldn’t be alive. And I have to tell Daemon, even though I know he’s never going to stop searching until he gets the truth. What happened to his brother? Who betrayed him? And what does the DOD want from them—from me?No one is who they seem. And not everyone will survive the lies…
558	Pure	2000	8	46	425	https://images.gr-assets.com/books/1296780419l/9761771.jpg	There is need. And then there is Fate... Being destined to become some kind of supernatural electrical outlet isn’t exactly awesome—especially when Alexandria’s "other half" is everywhere she goes. Seth’s in her training room, outside her classes, and keeps showing up in her bedroom—so not cool. Their connection does have some benefits, like staving off her nightmares of the tragic showdown with her mother, but it has no effect on what Alex feels for the forbidden, pure-blooded Aiden. Or what he will do—and sacrifice—for her. When daimons infiltrate the Covenants and attack students, the gods send furies—lesser gods determined to eradicate any threat to the Covenants and to the gods, and that includes the Apollyon... and Alex. And if that and hordes of aether-sucking monsters didn’t blow bad enough, a mysterious threat seems willing to do anything to neutralize Seth, even if that means forcing Alex into servitude... or killing her. When the gods are involved, some decisions can never, ever be undone
559	Sentinel	1982	10	46	425	https://images.gr-assets.com/books/1365509138l/13605723.jpg	It's a beautiful day for a war.As the mortal world slowly slips into chaos of the godly kind, Alexandria Andros must overcome a stunning defeat that has left her shaken and in doubt of their ability to end this war once and for all.And with all the obstacles between Alex and her happily-ever-after with the swoonworthy Aiden St. Delphi, they must now trust a deadly foe as they travel deep into the Underworld to release one of the most dangerous gods of all time.In the stunning, action-packed climax to the bestselling Covenant series, Alex must face a terrible choice: the destruction of everything and everyone she holds dear… or the end of herself.
560	Killer Instinct	1992	9	24	426	https://images.gr-assets.com/books/1391636942l/20409231.jpg	Seventeen-year-old Cassie Hobbes has a gift for profiling people. Her talent has landed her a spot in an elite FBI program for teens with innate crime-solving abilities, and into some harrowing situations. After barely escaping a confrontation with an unbalanced killer obsessed with her mother’s murder, Cassie hopes she and the rest of the team can stick to solving cold cases from a distance.But when victims of a brutal new serial killer start turning up, the Naturals are pulled into an active case that strikes too close to home: the killer is a perfect copycat of Dean’s incarcerated father—a man he’d do anything to forget. Forced deeper into a murderer’s psyche than ever before, will the Naturals be able to outsmart the enigmatic killer’s brutal mind games before this copycat twists them into his web for good?With her trademark wit, brilliant plotting, and twists that no one will see coming, Jennifer Lynn Barnes will keep readers on the edge of their seats (and looking over their shoulders) as they race through the pages of this thrilling novel.
561	The Bronze Horseman	2002	10	56	427	https://images.gr-assets.com/books/1395063002l/6323104.jpg	The golden skies, the translucent twilight, the white nights, all hold the promise of youth, of love, of eternal renewal. The war has not yet touched this city of fallen grandeur, or the lives of two sisters, Tatiana and Dasha Metanova, who share a single room in a cramped apartment with their brother and parents. Their world is turned upside down when Hitler's armies attack Russia and begin their unstoppable blitz to Leningrad.Yet there is light in the darkness. Tatiana meets Alexander, a brave young officer in the Red Army. Strong and self-confident, yet guarding a mysterious and troubled past, he is drawn to Tatiana—and she to him. Starvation, desperation, and fear soon grip their city during the terrible winter of the merciless German siege. Tatiana and Alexander's impossible love threatens to tear the Metanova family apart and expose the dangerous secret Alexander so carefully protects—a secret as devastating as the war itself—as the lovers are swept up in the brutal tides that will change the world and their lives forever.
587	Deadlock	1994	0	53	443	https://images.gr-assets.com/books/1370552258l/16100368.jpg	Otto and Raven are desperate to rescue their friends from the clutches of Anastasia Furan, head of the evil Disciples organisation. First they must track down the location of the Glasshouse, the prison where Furan trains children to become ruthless assassins. But Otto is also being hunted. The three months that Otto has spent following his ‘expulsion’ from H.I.V.E. have given the Artemis Section – an elite division of the American intelligence services that specialises in capturing the toughest targets and reports only to the President – an opportunity to locate him.Deadlock – the eighth book in the breathtaking H.I.V.E. series – continues the high-octane adventures of the supremely talented criminal team, with central characters forced to question everything that Nero has taught them and to confront the consequences of life as a villain, set against the backdrop of a daring high-tech prison break where nothing is quite as it seems.
562	The Faeries' Oracle	2000	8	9	428	https://images.gr-assets.com/books/1434636490l/47708.jpg	Bring the insight, wisdom, and joy of the faeries into your life.Using the enchanted art of Brian Froud as your guide, enter into the wise and wonderful world of the faeries. The Faeries' Oracle calls on sylphs, pans, gnomes -- and, of course, faeries -- to lead you on a delightful journey of adventure, discovery, and enlightenment that will illuminate the future and heal the heart and soul. This beautifully designed divination set contains everything you will need to explore this mysterious realm, including:-A complete deck of 66 radiant cards by Brian Froud featuring goblins, moon dancers, pixies, boggarts, and other faery folk we first met in Good Faeries/Bad Faeries-208-page illustrated book with text by Jessica Macbeth, which will show you how to read the cards of The Faeries' Oracle, with particular instruction on personally connecting to and communicating with the faeries
564	Kiss of the Highlander	2001	10	23	430	https://images.gr-assets.com/books/1400966202l/112754.jpg	A laird trapped between centuries...Enchanted by a powerful spell, Highland laird Drustan MacKeltar slumbered for nearly five centuries hidden deep in a cave, until an unlikely savior awakened him. The enticing lass who dressed and spoke like no woman he’d ever known was from his distant future, where crumbled ruins were all that remained of his vanished world. Drustan knew he had to return to his own century if he was to save his people from a terrible fate. And he needed the bewitching woman by his side....A woman changed forever in his arms...Gwen Cassidy had come to Scotland to shake up her humdrum life and, just maybe, meet a man. How could she have known that a tumble down a Highland ravine would send her plunging into an underground cavern — to land atop the most devastatingly seductive man she’d ever seen? Or that once he’d kissed her, he wouldn’t let her go? Bound to Drustan by a passion stronger than time, Gwen is swept back to sixteenth-century Scotland, where a treacherous enemy plots against them... and where a warrior with the power to change history will defy time itself for the woman he loves....
646	The Victim	1983	10	24	483	https://images.gr-assets.com/books/1328347060l/11835768.jpg	Life is looking bleak for Frankie Mitchell - not only has she lost custody of her two children to their sadistic, gypsy-bred father, Jed O'Hara, she is also pregnant and banged up in Holloway awaiting trial for attempted murder.\n\nIn Frankie's absence, her father, underworld boss Eddie Mitchell, is determined to get his own back. He wants revenge not only for his daughter's imprisonment, but also for the death of his beloved wife, Jessica. Determined to get his grandchildren back home where they belong, Eddie plans the O'Haras demise slowly and precisely. But then he finds out a secret and learns the real reason why his daughter is in the slammer and all hell breaks loose.\n\nEssex had never seen anything like the bloodbath that followed, but were either family actually capable of winning this long running feud, or would they all become the victims of their own past mistakes?
593	No Wonder They Call Him the Savior: Chronicles of the Cross	1995	0	11	448	https://images.gr-assets.com/books/1439924929l/4198363.jpg	Its tragedy summons all sufferers. Its hope lures all searchers. No one can ignore the cross. In this compelling quest for the Messiah, Lucado invites listeners to meet the blue-collar Jew whose claim altered a world and whose promise has never been equaled. No Wonder They Call Him the Savior! "Do you know Him?" Lucado asks his listeners. Really know Him? They will when Lucado brings them full circle to the foot of the cross-even if they've been there before. Because now they can see how it all comes down to this one place. To this one death. To this one Life.
594	The Crippled Lamb	1994	0	5	448	https://images.gr-assets.com/books/1347230663l/987587.jpg	Because Joshua the Lamb was different, he often felt left out-like on the wintry night when he was left behind in a Bethlehem stable. This touching tale helps kids see that even if they're different, God has a unique plan for their lives.
595	All the Strange Hours: The Excavation of a Life	2000	0	45	449	https://images.gr-assets.com/books/1328819200l/515290.jpg	A native of Lincoln, Nebraska, Loren Eiseley began his lifelong exploration of nature in the salt flats and ponds around his hometown and in the mammoth bone collection hoarded in the old red brick museum at the University of Nebraska, where he conducted his studies in anthropology. It was in pursuit of this interest, and in the expression of his natural curiosity and wonder, that Eiseley sprang to national fame with the publication of such works as The Immense Journey and The Firmament of Time. In All the Strange Hours, Eiseley turns his considerable powers of reflection and discovery on his own life to weave a compelling story, related with the modesty, grace, and keen eye for a telling anecdote that distinguish his work. His story begins with his childhood experiences as a sickly afterthought, weighed down by the loveless union of his parents. From there he traces the odyssey that led to his search for early postglacial man—and into inspiriting philosophical territory—culminating in his uneasy achievement of world renown. Eiseley crafts an absorbing self-portrait of a man who has thought deeply about his place in society as well as humanity’s place in the natural world.
565	The Dark Highlander	2002	10	23	430	https://images.gr-assets.com/books/1521970950l/112755.jpg	Journey to a world of ancient magic, breathtaking sensuality, thrilling time-travel.... Journey to the world of The Dark Highlander. Crisscrossing the continents and the centuries, here is a novel as gripping as it is sensual—an electrifying adventure that will leave you breathless....I am Dageus MacKeltar, a man with one good conscience and thirteen bad ones, driven to sate my darkest desires…From his penthouse lair high above Manhattan, Dageus looks out over a glittering city that calls to the darkness within him. A sixteenth-century Scot trapped between worlds, he is fighting a losing battle with the thirteen Druids who possess his soul, dooming him to an eternity of sexual pursuit. When Chloe Zanders, student of antiquities, is drawn into his world, she finds the insatiable alpha male an irresistible lure.Before long, she is caught up in an ancient prophecy that will sweep her back into time to medieval Scotland. Plunged into a world of timeless magic and dark seduction, she will soon face the challenge of a lifetime: fighting thirteen evil spirits for the heart of one irresistible man....
567	Dark Tide	1993	9	9	431	https://images.gr-assets.com/books/1446341545l/27402843.jpg	Serafina, once a lost and uncertain princess, is now a confident leader of the Black Fins, a ragtag group of soldiers trying to sabotage her traitorous uncle and his death riders. While Vallerio and his wife plot their takeover of all the mer realms, Sera works on enlisting allies for battle. Meanwhile, her friends, Neela, Ling, Becca, Ava and Astrid face challenges of their own. Time is running out in their search for the four talismans that still must be found if they are to defeat the ancient evil that destroyed Atlantis.
568	Last Breath	2003	9	42	432	https://images.gr-assets.com/books/1327900044l/10549501.jpg	With her boss preoccupied researching the Founder Houses in Morganville, student Claire Danvers is left to her own devices when she learns that three vampires have vanished without a trace. She soon discovers that the last person seen with one of the missing vampires is someone new to town-a mysterious individual named Magnus. After an uneasy encounter with Morganville's latest resident, Claire is certain Magnus isn't merely human. But is he a vampire-or something else entirely?
569	When Joy Came to Stay	2000	8	3	433	https://images.gr-assets.com/books/1320459440l/169836.jpg	Maggie Stovall is trapped inside a person she’s spent years carefully crafting. Now the truth about who she is—and what she’s done—is bursting to the surface and sending Maggie into a spiral of despair. Will she walk away from everything, or can Maggie allow God to take her to a place of ultimate honesty—before it’s too late? Maggie Stovall. One of the golden people. She has it all together. At least on the surface… Ben Stovall. Godly husband. Successful attorney. Has no idea of the darkness about to overtake his life… Amanda Joy. Child of society. Abused, broken, thrown away. But her trust in God is still alive… When Joy Came to Stay is the heart-wrenching story of one woman’s descent into the shadows of depression, her husband’s search for understanding, and a precious child’s unwavering faith. "Kingsbury’s poignant tale of a lost and broken family and how they experience God’s miraculous healing is a sure guarantee to bring hope and joy to her readers." \n\n\n—Melody Carlson, bestselling author, Diary of a Teenage Girl series \n\n\n"A thought-provoking account of the battle of depression in a believer’s life. It leaves no doubt that God is loving, merciful, and faithful." \n\n\n—Nancy Moser, author, The Mustard Seed series\n\n\nStory Behind the Book“Each of my novels is a piece of my heart. Where Yesterday Lives was my first-ever novel, and as such it is somewhat autobiographical. The childhood story of Ellen Barrett, her love for her parents and siblings, is my story—though her current story and struggles are fictional. On Every Side sheds light on the struggle for religious freedom in today’s climate; something I am passionate about. Finally, When Joy Came to Stay is the story of one woman’s battle against depression and the secrets of her past.” —Karen Kingsbury
572	Family	1994	9	3	433	https://images.gr-assets.com/books/1388190739l/11426.jpg	A Sensational TrialWhen Katy Hart travels to Los Angeles to testify against the knife-wielding fan who tried to kill her, she is hunted by paparazzi who quickly realize she is the mystery woman photographed with movie star Dayne Matthews. Tension and pressure build to a dangerous level as Katy and Dayne seek private moments amidst the frenzy. In the end, Dayne’s celebrity life makes Katy certain that a future with him is all but impossible.A Life-Changing DecisionAs the trial comes to a close, Dayne searches for answers. Not until he talks to his childhood friend does he realize his desperate need for wisdom and direction. Ultimately, his journey leads him to an isolated beach where God makes Dayne’s future as clear as the waters of Cancún. But can he live with the decision God places before him?A Stunning DiscoveryLandon and Ashley Blake are celebrating the happiest days of their lives, enjoying Cole and their newborn son. But Ashley cannot find peace until she finds her older brother—the firstborn Baxter sibling. Her constant questions to her father, John Baxter, have netted nothing. Now she receives news that rocks her world and threatens to end her search in heartbreaking finality.
573	Someday	1991	8	3	433	https://images.gr-assets.com/books/1348693993l/1816825.jpg	Pressures of the celebrity lifestyle weigh heavily on Dayne and Katy Matthews as they take on separate movie projects. Tabloid rumors talk of trouble and unfaithfulness between the two, but finally something drastic catches Dayne's attention and makes him realize the destruction they're playing with. But will it be too late? The Flanigan family recognizes the deep loss of the Christian Kids Theater program, and they lead a final effort to keep the theater from being torn down. Meanwhile, John Baxter takes the next step in his growing relationship with Elaine, giving him a season to contemplate selling the Baxter house and, along with it, losing a lifetime of memories made there. As the rest of the family considers the future and what may lie ahead, they must pull together like never before. Only their undying love for each other can help the Baxters get past the trials of today for a life they know is possible . . . someday.
574	Remember	1997	10	3	433	https://images.gr-assets.com/books/1406506306l/35332.jpg	The Redemption series won "Christian Retailing"’s 2005 Retailer’s Choice Award for Best Series! Convinced she could make it on her own, Ashley Baxter has kept the most important people in her life at a distance—her family, the man who loves her, and the God she is sure can never forgive her. Now, just as she begins to open her heart, the events of September 11 rip into Ashley’s world and she is led to heartbreaking and hope-filled decisions that will forever change her life. This story vividly illustrates that we must value others more than ourselves, and it drives home one of Gary Smalley’s key messages: Honor one another. "Remember" is second in the five-book Redemption series by Gary Smalley and Karen Kingsbury that centers around the Baxter family. As readers follow the hopes and struggles of the family, they will explore key relationship themes as well as the larger theme of redemption, both in characters’ spiritual lives and in their relationships. Each book includes study questions for individual and small-group use as well as a “teaser” chapter of the next book in the series.
575	Return	2000	6	3	433	https://images.gr-assets.com/books/1406513762l/11430.jpg	The Redemption series won "Christian Retailing"’s 2005 Retailer’s Choice Award for Best Series! This touching novel reunites readers with the Baxter family and focuses on the only Baxter son, Luke. He is determined to leave his faith and his past behind and embrace a new, free-thinking future. But what he doesn’t realize is that his past holds a secret even he doesn’t know. When Luke finds out, his comfortable new life is turned upside down, and he must turn back to his roots.
576	Desperate Hearts	1996	9	23	434	https://images.gr-assets.com/books/1284407695l/9058924.jpg	Chantel Aubuchon is Mayor of Elkhorn. Taking on the job handed down to her from her father, she manages her position with pride as she attempts to keep her town afloat. But when gold is discovered on the Powder River she soon finds her small town threatened by the approaching mines. Destruction of the land surrounding her town is slowly turning Elkhorn into a ghost town. Searching for a way to insure her town’s survival she resorts to desperate measures. Harper Barnes is the source of Elkhorn’s problem. Owning nearly all the mines along the river, he is the only one that can stop the destruction before it reaches her town. In her desperation, Chantel finds herself hidden underneath a bandana and behind a pistol. Little does she know that by robbing the man responsible for her town’s demise she will set off a series of events that will not only prove to her that first impressions should never be trusted, but that love can oftentimes be found where we least expect it.
579	Never Look Back	1993	8	23	437	https://images.gr-assets.com/books/1337134899l/13706918.jpg	Jack Holland finally has everything a man could want. After a lengthy courtship that has required persistence and self-restraint, Emi Hennigan– the woman Jack has been fantasizing about since college– has fallen in love with him. Together, the couple sets out to create their own happily-ever-after.It’s only when Emi delivers some unwelcome news that Jack begins to question everything about the woman he loves. It will take a considerable amount of understanding and sacrifice for Jack to accept the future Emi can offer him– a future he never imagined for himself.This romantic drama is the final book in the Emi Lost & Found series.Librarian's Note: this is an alternate edition to ISBN 1453755446.
580	First They Killed My Father: A Daughter of Cambodia Remembers	2001	9	1	438	https://images.gr-assets.com/books/1407105580l/4373.jpg	From a childhood survivor of the Camdodian genocide under the regime of Pol Pot, this is a riveting narrative of war crimes and desperate actions, the unnerving strength of a small girl and her family, and their triumph of spirit.One of seven children of a high-ranking government official, Loung Ung lived a privileged life in the Cambodian capital of Phnom Penh until the age of five. Then, in April 1975, Pol Pot's Khmer Rouge army stormed into the city, forcing Ung's family to flee and, eventually, to disperse. Loung was trained as a child soldier in a work camp for orphans, her siblings were sent to labor camps, and those who survived the horrors would not be reunited until the Khmer Rouge was destroyed.Harrowing yet hopeful, Loung's powerful story is an unforgettable account of a family shaken and shattered, yet miraculously sustained by courage and love in the face of unspeakable brutality.
581	Minute Meditations for Busy Moms	2002	9	31	439	https://images.gr-assets.com/books/1348823832l/1027342.jpg	Time-challenged moms get encouragement and direction for reflecting Christ in their homes and beyond. Short prayers and action steps help readers put challenging notions into motion. A prayerful pick-me-up for mothers on the go.
582	Far from the Tree	2000	9	46	440	https://images.gr-assets.com/books/1501680687l/33830437.jpg	A contemporary novel about three adopted siblings who find each other at just the right moment.Being the middle child has its ups and downs.But for Grace, an only child who was adopted at birth, discovering that she is a middle child is a different ride altogether. After putting her own baby up for adoption, she goes looking for her biological family, including—Maya, her loudmouthed younger bio sister, who has a lot to say about their newfound family ties. Having grown up the snarky brunette in a house full of chipper redheads, she’s quick to search for traces of herself among these not-quite-strangers. And when her adopted family’s long-buried problems begin to explode to the surface, Maya can’t help but wonder where exactly it is that she belongs.And Joaquin, their stoic older bio brother, who has no interest in bonding over their shared biological mother. After seventeen years in the foster care system, he’s learned that there are no heroes, and secrets and fears are best kept close to the vest, where they can’t hurt anyone but him.
583	A Night Without Stars	1993	8	53	441	https://images.gr-assets.com/books/1482869041l/33151799.jpg	The planet Bienvenido is in crisis. It has finally escaped the Void, emerging into regular space. But it's millions of light-years from Commonwealth assistance, and humans are battling the Fallers for control of their world. This rapacious adversary, evolved to destroy all sentient life, has infiltrated every level of human society - hijacking unwilling bodies so its citizens fear their leaders, friends and family.A mysterious figure known as the Warrior Angel leads a desperate resistance. She's helped by forbidden Commonwealth technology, which gives her a crucial edge. But the government obstructs the Angel's efforts at every turn, blinded by prejudice and technophobia. As Fallers also prepare to attack from the skies, she might need to incite rebellion to fight this invasion. But the odds seem impossible.Then astronaut Ry Evine uncovers one last hope. On a mission against the enemy, his spacecraft damages an unidentified vessel. This crash-lands on the planet carrying unexpected cargo: a baby. This extraordinary Commonwealth child possesses knowledge that could save them all. But if the Fallers catch her, the people of Bienvenido will not survive.
584	Home for the Holidays	2001	8	58	442	https://images.gr-assets.com/books/1300759355l/10799807.jpg	This Christmas season, join the girls of the mother-daughter book club for a variety of holiday-themed adventures! Becca, Megan, Emma, Cassidy and Jess have plenty of reading material to bring on their trips, too, because the book club is tackling the Betsy-Tacy series before their next meeting on New Year’s Eve. But unfortunately, nothing goes quite as planned for any of the girls. On a Christmas cruise with their families, Megan and Becca fight over the dashing son of the ship's captain. Cassidy and her family fly back to California to visit Cassidy's sister Courtney... but when the West Coast causes homesickness for their former life in Laguna Beach, the family begins to question what state they should call home. And a disastrous sledding accident causes both Emma and Jess to completely change their holiday plans. Between squabbles, injuries, and blizzards, everything seems to be going wrong. Will the girls be able to find their holiday spirit in time for Christmas?
648	Toda Mafalda	2004	10	37	484	https://images.gr-assets.com/books/1412031764l/54741.jpg	Este libro contiene de la primera a la última tira + Mafalda inédita + Al fin solos + Y digo yo + ¿A dónde vamos a parar? + Mafaldas (casi) privadas + Mafaldas públicas + Mafaldas ineditísimas = Toda, pero toda toda Mafalda(HASTA EL CIERRE DE ESTA EDICIÓN)
617	Gemini	1986	9	56	464	https://images.gr-assets.com/books/1391479953l/270537.jpg	Scotland, 1477: Nicholas de Fleury, former banker and merchant, has re-appeared in the land that, four years earlier, he had brought very close to ruin in the course of an intense commercial and personal war with secret enemies--and, indeed, with his clever wife Gelis.Now the opportunity for redemption is at hand, but Nicholas soon finds himself pursuing his objectives amid a complex, corrosive power struggle centering on the Scottish royal family but closely involving the powerful merchants of Edinburgh, the gentry, the clergy, the English (ever seeking an excuse to pounce on their neighbor to the north), the French, the Burgundians. His presence soon draws Gelis and their son Jodi to Scotland, as well as Nicholas's companions and subordinates in many a past endeavor--Dr. Tobias and his wife Cl&eacute;mence, Mick Crackbene, John le Grant, and Andro Wodman among them. Here, too, Nicholas meets again with others who have had an influence, for good or evil, in his life: King James III of Scotland and his rebellious siblings; the St. Pols: Jordan, Simon, and young Henry; Mistress Bel of Cuthilgurdy and David de Salmeton; Anselm Adorne and Kathi his niece. Caught up in, and sometimes molding, the course of great events, Nicholas exhibits by turns the fierce silence with which he masks his secrets, and the explosive, willful gaiety that binds men, women, and children to him. And as the secrets of his birth and heritage come to light, Nicholas has to decide whether he desires to establish a future in Scotland for himself and his family, and a home for his descendants.Gemini brings to a dazzling conclusion Dorothy Dunnett's House of Niccol&ograve; series (synopsized in this volume), in which this peerless novelist has vividly re-created the dramatic, flamboyant world of the early Renaissance in historical writing of scrupulous authenticity and in the entrancing portrait of her visionary hero. Now, in a book infused with wit and poetry, emotion and humor, action and mystery, she brings Nicholas de Fleury at last to choose his heart's home, where he can exercise all his skills as an advisor to kings and statesmen, as a husband, a father, and a leader of men--and where, perhaps, we will discern a connection between him and that other remarkable personality, Francis Crawford, whose exploits Lady Dunnett recorded so memorably in The Lymond Chronicles.
585	Aftershock	2000	9	53	443	https://images.gr-assets.com/books/1329390030l/10412949.jpg	Scheming, extorting, menacing and general evilness are nothing new in the world of villainy - indeed it's expected. But there are codes of conduct. Until now. In an attempt to purge the Global League of Villainous Enterprises of its more destructive elements, Dr Nero has underestimated the cunning and resources of those who oppose him.Meanwhile, Otto and the rest of the Alpha stream have been sent to begin their most feared exercise: The Hunt, in the icy wastes of Siberia. But there is a traitor in their midst. The first strike against Nero will be a strike against the Alpha stream.Villain-kind is on the brink of CIVIL WAR.
618	The Ringed Castle	1984	8	56	464	https://images.gr-assets.com/books/1399601686l/351198.jpg	For the first time Dunnett's Lymond Chronicles are available in the United States in quality paperback editions.Fifth in the legendary Lymond Chronicles, The Ringed Castle leaps from Mary Tudor's England to the barbaric Russia of Ivan the Terrible. Francis Crawford of Lymond moves to Muscovy, where he becomes advisor and general to the half-mad tsar. Yet even as Lymond tries to civilize a court that is still frozen in the attitudes of the Middle Ages, forces in England conspire to enlist this infinitely useful man in their own schemes.
586	Zero Hour	2003	7	53	443	https://images.gr-assets.com/books/1327888987l/8431746.jpg	Overlord is reborn, and has developed the chilling ability to move from body to body, erasing the host`s personality and ultimately killing them, forcing him to hop from victim to victim. He must find Otto, the only host designed to contain him, and for that he needs the location of H.I.V.E. He also plans to take control of a secret US Army facility that is home to the Autonomous Weapon Programme, a computer-controlled system uniquely vulnerable to his control. Nero is forced to activate Zero Hour, a plan designed to deal with any member of G.L.O.V.E. on the brink of true global domination. Nero also knows that Otto must not be allowed to fall into Overlord`s hands, and a desperate race across the globe begins. The stage is set for a final battle with Overlord. Little do they know that he has a final weapon in his arsenal, on a scale unlike anything they have ever seen before.
588	They Cage the Animals at Night	1988	6	1	444	https://images.gr-assets.com/books/1388702609l/19412.jpg	Burch was left at an orphanage and never stayed at any one foster home long enough to make any friends. This is the story of how he grew up and gained the courage to reach out for love.
589	The Day Lasts More Than a Hundred Years	1988	10	58	445	https://images.gr-assets.com/books/1348252987l/366889.jpg	..". a rewarding book." --Times Literary SupplementSet in the vast windswept Central Asian steppes and the infinite reaches of galactic space, this powerful novel offers a vivid view of the culture and values of the Soviet Union's Central Asian peoples.
590	A Time to Die	1990	9	53	446	https://images.gr-assets.com/books/1400097364l/21795840.jpg	How would you live if you knew the day you'd die?Parvin Blackwater has wasted her life. At only seventeen, she has one year left according to the Clock by her bedside. In a last-ditch effort to make a difference, she tries to rescue Radicals from the crooked justice system. But when the authorities find out about her illegal activity, they cast her through the Wall -- her people's death sentence. What she finds on the other side about the world, about eternity, and about herself changes Parvin forever and might just save her people. But her Clock is running out.
591	Deluge	1978	9	53	447	https://images.gr-assets.com/books/1405351457l/20931089.jpg	The Bettarinis and Forellis have found rich fulfillment together in medieval Italia. But after fighting off countless enemies, they now must face the worst foe of all. As the Black Death closes in upon them, threatening everything and everyone they hold dear, Lia and Gabi–and the knights they love–must dig deep within to decide how they might remain safe…and if they need to risk it all in order to truly live as they’re called.
592	When God Whispers Your Name	1994	9	11	448	https://images.gr-assets.com/books/1390870863l/173325.jpg	Are you ready to hope again? Are you ready to let go of doubt and sorrow? Just listen carefully. God is whispering your name.Somewhere, between the pages of this book and the pages of your heart, God is speaking. And He is calling you by name.Maybe that's hard to believe. Maybe you just can't imagine that the One who made it all thinks of you that personally -- that He keeps your name on His heart and lips.But it's true. In the Bible and in the circumstances of your life, He whispers your name lovingly. Tenderly. Patiently but persistently. Let these stories remind you of the God who knows your name.Some of the stories are from the Bible. Some are drawn from everyday life. Most are about people who are lost ... or weary ... or discouraged -- just like you may be. If you let them, they will tell the story of your life. And the story of a God who speaks into your situation.So listen closely as you turn these pages. Listen for the Father's gentle whisper that can erase your doubt, your sorrow, your weariness, your despair.It really is your name that you hear, and the Voice that calls is more loving that your ever dared dream. Listen. And learn to hope again.
596	Blood Rites	1994	10	9	450	https://images.gr-assets.com/books/1345557965l/99383.jpg	For Harry Dresden, Chicago's only professional wizard, there have been worse assignments than going undercover on the set of an adult film. Dodging flaming monkey poo, for instance. Or going toe-to-leaf with a walking plant monster. Still, there is something more troubling than usual about his newest case. The film's producer believes he's the target of a sinister entropy curse, but it's the women around him who are dying, in increasingly spectacular ways.Harry is doubly frustrated because he got involved with this bizarre mystery only as a favor to Thomas, his flirtatious, self-absorbed vampire acquaintance of dubious integrity. Thomas has a personal stake in the case Harry can't quite figure out, until his investigation leads him straight to Thomas' oversexed vampire family. Harry is about to discover that Thomas' family tree has been hiding a shocking secret; a revelation that will change Harry's life forever.
598	Dead Beat	1999	10	9	450	https://images.gr-assets.com/books/1345667776l/17683.jpg	Paranormal investigations are Harry Dresden’s business and Chicago is his beat, as he tries to bring law and order to a world of wizards and monsters that exists alongside everyday life. And though most inhabitants of the Windy City don’t believe in magic, the Special Investigations Department of the Chicago PD knows better. Karrin Murphy is the head of S. I. and Harry’s good friend. So when a killer vampire threatens to destroy Murphy’s reputation unless Harry does her bidding, he has no choice. The vampire wants the Word of Kemmler (whatever that is) and all the power that comes with it. Now, Harry is in a race against time—and six merciless necromancers—to find the Word before Chicago experiences a Halloween night to wake the dead...
599	Changes	1999	10	9	450	https://images.gr-assets.com/books/1304027244l/6585201.jpg	Long ago, Susan Rodriguez was Harry Dresden's lover-until she was attacked by his enemies, leaving her torn between her own humanity and the bloodlust of the vampiric Red Court. Susan then disappeared to South America, where she could fight both her savage gift and those who cursed her with it. Now Arianna Ortega, Duchess of the Red Court, has discovered a secret Susan has long kept, and she plans to use it-against Harry. To prevail this time, he may have no choice but to embrace the raging fury of his own untapped dark power. Because Harry's not fighting to save the world... He's fighting to save his child.
600	All the Places to Love	1994	8	32	451	https://images.gr-assets.com/books/1437773412l/273718.jpg	A picture book celebration of love by the Newbery Medal–winning author, Patricia MacLachlan, with luminous paintings by Mike Wimmer.Within the sanctuary of a loving family, baby Eli is born and, as he grows, learns to cherish the people and places around him, eventually passing on what he has discovered to his new baby sister, Sylvie: “All the places to love are here . . . no matter where you may live.” This stunning picture book is the perfect gift for parents of a new baby.“This loving book will be something to treasure."' –Booklist"The quiet narrative is so intensely felt it commands attention. . . . a lyrical celebration." –Kirkus Reviews
601	Breaking Even	2002	9	23	452	https://images.gr-assets.com/books/1421355393l/24285685.jpg	What happens when one neighbor pisses off the other? They end up in a brutal prank war, of course. But neither of them expects what happens when they can’t break even. Rye Clanton I told myself a long time ago that I wouldn’t—couldn’t—fall in love. I’ve seen what happens, the things they don’t tell you in fairytales. But I never saw Brin Waters coming until she had thoroughly invaded my life. Until her, I never laughed, joked, or even knew how to have a good time. Until her, I just existed. If my secrets weren’t so dark… But they are. Brin Waters How the hell do you go from hating someone to loving them? I don’t know, but Rye Clanton is good at it. However, he’s a walking contradiction that I can’t figure out, an enigma that has stumped me more times than I can count. But he’s the first person that’s ever made me feel alive—free. How do you give something like that up? Is loving him worth the risk of being destroyed?
603	Amphigorey Also	1993	9	48	453	https://images.gr-assets.com/books/1327933610l/51245.jpg	Contents: The Utter Zoo, The Blue Aspic, The Epiplectic Bicycle, The Sopping Thursday, The Grand Passion, Les Passementeries Horribles, The Eclectic Abecedarium, L'Heure bleue, The Broken Spoke, The Awdrey-Gore Legacy, The Glorious Nosebleed, The Loathsome Couple, The Green Beads, Les Urnes Utiles, The Stupid Joke, The Prune People, and The Tuning Fork
604	3000 Degrees: The True Story of a Deadly Fire and the Men Who Fought It	2002	9	1	454	https://images.gr-assets.com/books/1440902247l/932634.jpg	In the fading industrial city of Worcester, Massachusetts, there are men whose jobs are to brave danger, endure long shifts, and trust other men with their lives. Like their counterparts in cities and small towns everywhere, they are firefighters, and like firefighters everywhere, they take enormous pride in their brotherhood and their calling. On December 3, 1999, as the men of Central Street and other Worcester stations lived their daily lives, worked second jobs, and raised their children, they did not know an inferno unlike anything they had ever seen was about to put them to the ultimate test.The fire at Worcester Cold Storage was ignited by two vagrants' Christmas candle. When the first firefighters arrived on the scene, the building-a hulking, abandoned, windowless warehouse-was waiting to explode. As men fought to contain the flames with hoses, they were suddenly surrounded by confusing, suffocating darkness and searing steam. Worcester Cold Storage-with its mazelike layout and rooms so insulated that they prevented men from hearing each other's alarms-was turning into a furious beast, disorienting those inside it, seemingly determined to kill as many men as it could.3000 DEGREES stands with the best works of American reportage. Sean Flynn takes us into the private lives of men heading inexorably into one sudden shared, overwhelming battle. He captures the agony of working wives and mothers hearing the news with mounting terror and a community being hurtled toward unbearable loss. Most of all, he vividly depicts the moments of truth, when ordinary men know that their brothers are going to die, and that to live with themselves, to take another single breath, they too must be prepared to lay down their lives.
605	Lake in the Clouds	2002	7	56	455	https://images.gr-assets.com/books/1367533032l/72855.jpg	Lake in the CloudsIn her extraordinary novels Into the Wilderness and Dawn on a Distant Shore, award-winning author Sara Donati deftly captured the vast, untamed wilds of late-eighteenth-century New York and the trials and triumphs of the spirited Bonner family. Now she takes on a new chapter in the life of Elizabeth and Nathaniel Bonner--as their brave and beautiful oldest daughter comes of age with a challenge that will change her forever. . . .It is the spring of 1802 and the village of Paradise is still reeling from the typhoid epidemic of the previous summer. But despite a devastating personal loss, the Bonners persevere, with Hannah, Nathaniel's half-Indian daughter, working as a doctor in training. A gifted healer, this striking young woman of two worlds finds herself in peril when a dangerously ill runaway slave is discovered near the family home and Hannah insists on nursing the outlaw. Her determination places both her family and her heart in jeopardy, for a bounty hunter is afoot--and he is none other than Hannah's childhood friend and first love. So begins a journey that will test the strength of the Bonners' love for one another--and bring Hannah to face the decision she has always dreaded: will she make a life for herself in a white world, or among her mother's people?
606	Queen of Swords	1997	8	56	455	https://images.gr-assets.com/books/1386922801l/72848.jpg	It is the late summer of 1814, and Hannah Bonner and her half brother Luke have spent more than a year searching the islands of the Caribbean for Luke's wife and the man who abducted her. But Jennet's rescue, so long in coming, is not the resolution they'd hoped for. In the spring she had given birth to Luke's son, and in the summer Jennet had found herself compelled to surrender the infant to a stranger in the hope of keeping him safe.To claim the child, Hannah, Luke, and Jennet must journey first to Pensacola. There they learn a great deal about the family that has the baby. The Poiterins are a very rich, very powerful Creole family, totally without scruple. The matriarch of the family has left Pensacola for New Orleans and taken the child she now claims as her great-grandson with her.New Orleans is a city on the brink of war, a city where prejudice thrives and where Hannah, half Mohawk, must tread softly. Careful plans are made as the Bonners set out to find and reclaim young Nathaniel Bonner. Plans that go terribly awry, isolating them from each other in a dangerous city at the worst of times.Sure that all is lost, and sick unto death, Hannah finds herself in the care of a family and a friend from her past, Dr. Paul de Guise Savard dit Saint-dâ-Uzet. It is Dr. Savard and his wife who save Hannah's life, but Dr. Savard's half brother who offers her real hope. Jean-Benoit Savard, the great-grandson of French settlers, slaves, and Choctaw and Seminole Indians, is the one man who knows the city well enough to engineer the miracle that will reunite the Bonners and send them home to Lake in the Clouds. With Ben Savard's guidance, allies are drawn from every segment of New Orleans's population and from Andrew Jackson's army, now pouring into the city in preparation for what will be the last major battle of the War of 1812.
633	In Love and War	2001	8	17	474	https://images.gr-assets.com/books/1371935109l/276582.jpg	A unique American chronicle of a navy family's life during the Vietnam war years, this widely acclaimed memoir has been updated to include an outspoken account of the Stockdale's experiences in the seventeen years since Jim's release from a Hanoi prison.
607	White Hot	1998	10	9	456	https://images.gr-assets.com/books/1477567905l/22303684.jpg	Nevada Baylor has a unique and secret skill—she knows when people are lying—and she's used that magic (along with plain, hard work) to keep her colorful and close-knit family's detective agency afloat. But her new case pits her against the shadowy forces that almost destroyed the city of Houston once before, bringing Nevada back into contact with Connor "Mad" Rogan.Rogan is a billionaire Prime—the highest rank of magic user—and as unreadable as ever, despite Nevada’s “talent.” But there’s no hiding the sparks between them. Now that the stakes are even higher, both professionally and personally, and their foes are unimaginably powerful, Rogan and Nevada will find that nothing burns like ice …
608	Wildfire	1999	8	9	456	https://images.gr-assets.com/books/1483656553l/27422533.jpg	Just when Nevada Baylor has finally come to accept the depths of her magical powers, she also realizes she’s fallen in love. Connor “Mad” Rogan is in many ways her equal when it comes to magic, but she’s completely out of her elements when it comes to her feelings for him. To make matters more complicated, an old flame comes back into Rogan’s life…Rogan knows there’s nothing between him and his ex-fiance, Rynda Sherwood. But as Nevada begins to learn more about her past, her power, and her potential future, he knows she will be faced with choices she never dreamed of and the promise of a life spent without him.As Nevada and Rogan race to discover the whereabouts of Rynda’s kidnapped husband and are forced to confront Nevada’s grandmother, who may or may not have evil motives, these two people must decide if they can trust in each other or allow everything to go up in smoke.
631	The Complete Sherlock Holmes	2002	0	22	472	https://images.gr-assets.com/books/1320400337l/964677.jpg	Here, collected in one volume, are all four full-length novels and 56 short stories chronicling the colorful adventures of Sherlock Holmes--every word Sir Arthur Conan Doyle ever wrote about Baker Street's most famous resident.
609	The Well-Trained Mind: A Guide to Classical Education at Home	1999	10	2	457	https://images.gr-assets.com/books/1348995302l/115572.jpg	This book will instruct you, step by step, on how to give your child an academically rigorous, comprehensive education from preschool through high school. Two veteran home educators outline the classical pattern of education—the trivium—which organizes learning around the maturing capacity of the child's mind: the elementary school "grammar stage," the middle school "logic stage," and the high school "rhetoric stage." Using the trivium as your model, you'll be able to instruct your child in all levels of reading, writing, history, geography, mathematics, science, foreign languages, rhetoric, logic, art, and music, regardless of your own aptitude in those subjects.Newly revised and updated, The Well-Trained Mind includes detailed book lists with complete ordering information; up-to-date listings of resources, publications, and Internet links; and useful contacts.An excellent resource for any family with a desire to incorporate a classical education in their home, whether as a curriculum or as a reference. (Educational Freedom Press)
610	Stopping by Woods on a Snowy Evening	2001	7	50	458	https://images.gr-assets.com/books/1441050662l/12201.jpg	Ever since it was published in 1978, the picture-book presentation of Robert Frost's poem "Stopping by Woods on a Snowy Evening" has been an enduring favorite. For this special edition with a new design, trim size, and three new spreads, Susan Jeffers has added more detail and subtle color to her sweeping backgrounds of frosty New England scenes. There are more animals to find among the trees, and the kindly figure with his "promises to keep" exudes warmth as he stops to appreciate the quiet delights of winter. The handsome new vellum jacket will attract new and old fans as it evokes a frost-covered windowpane. This celebration of a season makes an ideal holiday gift for a child, a teacher, or a host. Robert Frost (1874-1963) is one of America's most celebrated poets and a four-time winner of the Pulitzer Prize.Susan Jeffers is the illustrator of such distinguished picture books as Three Jovial Huntsmen, a Caldecott Honor Book; Rachel Field's Hitty; and the ABBY Award-winning Brother Eagle, Sister Sky, which was also a New York Times best-seller.
611	Tecumseh	1982	9	34	459	https://images.gr-assets.com/books/1342390328l/15753732.jpg	Tecumseh was in de 18e eeuw een van de grootste Indiaanse oorlogsleiders. Hij leidde zijn eigen volk de Shawnee en hun bondgenoten in de strijd om hun woongebied in het Noordoosten van de V.S. De schrijver heeft veel onderzoek gedaan naar de historische toedracht van deze strijd maar nog meer naar de mentaliteit en gedachtenwereld van die Indiaanse volken. Het boek is boeiend geschreven en vertelt op een eenvoudige manier een stuk van de Amerikaanse geschiedenis. Vergelijk: 'Mary, geliefde vrouw van de Creeks' door Dee Brown (a.i. 81-01-052-4) dat over dezelfde periode handelt.
612	Love Poems from God: Twelve Sacred Voices from the East and West	2002	9	50	460	https://images.gr-assets.com/books/1364848386l/128436.jpg	Sacred poetry from twelve mystics and saints, rendered brilliantly by Daniel Ladinsky, beloved interpreter of verses by the fourteenth-century Persian poet Hafiz In this luminous collection, Daniel Ladinsky—best known for his gifted and bestselling interpretations of the great Sufi poet Hafiz—brings together the timeless work of twelve of the world's finest spiritual writers, six from the East and six from the West. Once again Ladinsky reveals his talent for creating profound and playful renditions of classic poems for a modern audience. Rumi's joyous, ecstatic love poems; St. Francis's loving observations of nature through the eyes of Catholicism; Kabir's wild, freeing humor that synthesizes Hindu, Muslim, and Christian beliefs; St. Teresa's sensual verse; and the mystical, healing words of Sufi poet Hafiz—these along with inspiring works by Rabia, Meister Eckhart, St. Thomas Aquinas, Mira, St. Catherine of Siena, St. Teresa of Avila, St. John of the Cross, and Tukaram are all “love poems by God,” from writers considered to be "conduits of the divine." A spiritual treasure to cherish always.
636	Deltora Quest	2000	0	9	476	https://images.gr-assets.com/books/1388198115l/3100159.jpg	For the first time, the eight books of the internationally bestselling fantasy series are brought together in one action-packed volume!For centuries, the evil Shadow Lord has been plotting to invade Deltora and enslave its people. All that stands in his way is the magic Belt of Deltora with its seven gems of great and mysterious power. Now, Leif, Barda, and Jasmine must unite to find the seven gems and save Deltora from an eternity of darkness.For the first time, all eight books of this epic series are presented in a single deluxe hardcover volume.
613	The Parables of Jesus	1987	10	11	461	https://images.gr-assets.com/books/1442846337l/19532341.jpg	Pastor-teacher John MacArthur helps readers understand Jesus’ parables and how they relate to the whole of His message.\n\nJesus was a master storyteller, and the parables He told were ingeniously simple word pictures with profound spiritual lessons. Understanding the parables is a crucial matter for followers of Jesus. Jesus told parables so His people might comprehend His message about the kingdom of God clearly. Master expositor and Bible commentator John MacArthur has spent a lifetime explaining the Word of God in clear and comprehensible terms. In Parables he helps Christians understand the essential lessons contained in the most famous and influential short stories the world has ever known.
614	The Great Alone	1986	7	58	462	https://images.gr-assets.com/books/1521954798l/34927828.jpg	Alaska, 1974.Unpredictable. Unforgiving. Untamed.For a family in crisis, the ultimate test of survival.Ernt Allbright, a former POW, comes home from the Vietnam war a changed and volatile man. When he loses yet another job, he makes an impulsive decision: he will move his family north, to Alaska, where they will live off the grid in America’s last true frontier.Thirteen-year-old Leni, a girl coming of age in a tumultuous time, caught in the riptide of her parents’ passionate, stormy relationship, dares to hope that a new land will lead to a better future for her family. She is desperate for a place to belong. Her mother, Cora, will do anything and go anywhere for the man she loves, even if it means following him into the unknown.At first, Alaska seems to be the answer to their prayers. In a wild, remote corner of the state, they find a fiercely independent community of strong men and even stronger women. The long, sunlit days and the generosity of the locals make up for the Allbrights’ lack of preparation and dwindling resources.But as winter approaches and darkness descends on Alaska, Ernt’s fragile mental state deteriorates and the family begins to fracture. Soon the perils outside pale in comparison to threats from within. In their small cabin, covered in snow, blanketed in eighteen hours of night, Leni and her mother learn the terrible truth: they are on their own. In the wild, there is no one to save them but themselves.In this unforgettable portrait of human frailty and resilience, Kristin Hannah reveals the indomitable character of the modern American pioneer and the spirit of a vanishing Alaska―a place of incomparable beauty and danger. The Great Alone is a daring, beautiful, stay-up-all-night story about love and loss, the fight for survival, and the wildness that lives in both man and nature.
615	The Nightingale	1991	7	56	462	https://images.gr-assets.com/books/1447093717l/22320450.jpg	17 hours, 20 minutesIn love we find out who we want to be.In war we find out who we are.FRANCE, 1939In the quiet village of Carriveau, Vianne Mauriac says goodbye to her husband, Antoine, as he heads for the Front. She doesn't believe that the Nazis will invade France...but invade they do, in droves of marching soldiers, in caravans of trucks and tanks, in planes that fill the skies and drop bombs upon the innocent. When a German captain requisitions Vianne's home, she and her daughter must live with the enemy or lose everything. Without food or money or hope, as danger escalates all around them, she is forced to make one impossible choice after another to keep her family alive.Vianne's sister, Isabelle, is a rebellious eighteen-year-old girl, searching for purpose with all the reckless passion of youth. While thousands of Parisians march into the unknown terrors of war, she meets Gäetan, a partisan who believes the French can fight the Nazis from within France, and she falls in love as only the young can...completely. But when he betrays her, Isabelle joins the Resistance and never looks back, risking her life time and again to save others.With courage, grace and powerful insight, bestselling author Kristin Hannah captures the epic panorama of WWII and illuminates an intimate part of history seldom seen: the women's war. The Nightingale tells the stories of two sisters, separated by years and experience, by ideals, passion and circumstance, each embarking on her own dangerous path toward survival, love, and freedom in German-occupied, war-torn France--a heartbreakingly beautiful novel that celebrates the resilience of the human spirit and the durability of women. It is a novel for everyone, a novel for a lifetime.
641	God's Smuggler	2001	0	11	480	https://images.gr-assets.com/books/1347829238l/824062.jpg	As a boy he dreamed of being a spy undercover behind enemy lines. As a man he found himself undercover for God. Brother Andrew was his name and for decades his life story, recounted in God's Smuggler, has awed and inspired millions. The bestseller tells of the young Dutch factory worker's incredible efforts to transport Bibles across closed borders-and the miraculous ways in which God provided for him every step of the way. Revell and Chosen now reintroduce this powerful story with two new releases: a 35th anniversary edition and The Narrow Road, an expanded youth edition. Both contain a new foreword and afterword. The youth edition also features information about ministry to the persecuted church today, including country profiles, quotes from Christians in underground churches, "what if" scenarios based on real-life threats they face, and stories from others who have participated in Brother Andrew's Bible-smuggling work. Brother Andrew's story remains as inspiring today as it was thirty-five years ago, and with these new releases it will motivate a whole new generation to risk everything to follow God's call.
616	Call Me Crazy	2001	10	23	463	https://images.gr-assets.com/books/1367124872l/17856655.jpg	“I’m looking out from inside the chaos. It must be a one-way mirror because no one seems to be able to see back inside to where I am. The looks on their faces, the judgment in their eyes, tells me everything I need to know. The most frustrating part about the whole messed up situation is that even though I’m the one that they stare at in shock, I am just as shocked as they are. I know no more than they do of why I lose control. What they don’t know is that I am more scared of myself than they could ever be.” ~ Tally Baker After a devastating turn of events, seventeen year old Tally Baker is admitted to Mercy Psychiatric Facility where she is diagnosed with Bipolar Disorder. She has come to a place where she honestly believes that her life is over. Her mind tells her that she will never smile or laugh again, that she will never be normal again. It is in this unlikely place that she meets two people, different in every way, yet both critical to helping her realize that she has so much more living to do. Candy, a cantankerous sixty year old Mercy Psychiatric patient, is hell bent on driving everyone as crazy as she is. Candy shows Tally that, regardless of her diagnosis, the ability to push on and live her life to the fullest is her choice and hers alone. In the midst of Tally’s oftentimes humorous, sometimes heart-wrenching, escapades with Candy, a new patient is admitted to Mercy—a Native American woman named Lolotea. Along with this new patient comes a daily visitor, her son, Trey Swift. At first glance, it is obvious to Tally that he is incredibly handsome and unbelievably caring. But what she learns through her second glance, and many thereafter, is that there is much more to Trey than he ever lets on. It is during these daily visits that Trey and Tally build a friendship far deeper than either of them truly realize. With Trey, Tally feels for the first time since being admitted that someone is looking at her as a person and not as a disease. Trey begins to make it clear that he wants more than friendship, but she knows that she can never give him more. How can she, when she won’t even give him the truth? Tally doesn’t tell Trey that she is a patient at Mercy, and she doesn’t ever plan to. Her plans go up in flames when she finds out that Trey is a new student at her school, the school where her brokenness was found out in the floor of the girl’s bathroom in a pool of her own blood.
619	Checkmate	1997	9	56	464	https://images.gr-assets.com/books/1369492229l/112074.jpg	For the first time Dunnett's Lymond Chronicles are available in the United States in quality paperback editions.Sixth in the legendary Lymond Chronicles, Checkmate takes place in 1557, where Francis Crawford of Lymond is once again in France, leading an army against England. But even as the Scots adventurer succeeds brilliantly on the battlefield, his haunted past becomes a subject of intense interest to forces on both sides.
620	A Hustler's Wife	2003	9	51	465	https://images.gr-assets.com/books/1355115860l/289627.jpg	This novel portrays the life of Yarni, a sweet and innocent girl from a well-to-do family. By chance she meets Richmond Virginia's notorious drug kingpin, Des. Immediately they develop an astronomical love, which separates her from her family and friends. But when Des is sentenced to life in prison, Yarni will learn being A Hustler's Wife isn't easy with her sole provider behind bars.
621	The Complete Works	1964	7	48	466	https://images.gr-assets.com/books/1348209153l/797688.jpg	Leonardo Da Vinci is considered to be one of the greatest painters of all time and perhaps the most diversely talented person ever to have lived, responsible for the Mona Lisa, The Last Supper, The Madonna of the Carnation and Vitruvian Man. Leonardo was an Italian Renaissance polymath: painter, sculptor, architect, musician, scientist, mathematician, engineer, inventor, anatomist, geologist, cartographer, botanist, and writer, and this captivating book provides the reader with a unique insight into the life and work of one of history's most intriguing figures. All of Leonardo Da Vinci's work is presented in this compact volume - from his paintings and frescos, to detailed reproductions of his remarkable encrypted notebooks. As well as featuring each individual artwork, sections of each are shown in isolation to reveal incredible details - for example, the different levels of perspective between the background sections of the Mona Lisa, and the disembodied hand in The Last Supper. 640 pages of colour artworks and photographs of Da Vinci's original notebooks, accompanied by fascinating biographical and historical details are here.
647	The Traitor	1987	0	24	483	https://images.gr-assets.com/books/1328326724l/11055784.jpg	Sequel to the gangland thriller, The Feud - perfect for fans of Martina Cole and Jessie Keane\n\n\n\nWith her mother dead and her father currently in prison awaiting trial for her murder, a pregnant Frankie is blamed for the tragedy and forced to live with her wideboy fiance, Jed O'Hara, in a trailer on his parents' land. Frankie struggles to adapt to their gypsy way of life, but when her daughter, Georgie, is born, things go from bad to worse. Jed's mother is a loud, brazen, domineering woman, who has always yearned for a daughter herself, and she begins to take over her baby granddaughter. Meanwhile Frankie's family and friends know that Jed is cheating on her, but blinded by love and a sucker for his charm, Frankie refuses to believe them. \n\nThen one day the unthinkable happens. Sick to the stomach at her discovery, Frankie for once sees Jed for what he really is. She realises that the man she loves is not only heartless, but also violent and dangerous. Petrified for the safety of herself and her family, Frankie plots the ultimate revenge. But can she actually go through with it?
622	The Wake of the Wind	1999	9	58	467	https://images.gr-assets.com/books/1389205411l/188242.jpg	A dramatic and thought-provoking novel of one family's triumph in the face of the hardships and challenges of the post-Civil War South.The Wake of the Wind, J. California Cooper's third novel, is her most penetrating look yet at the challenges that generations of African Americans have had to overcome in order to carve out a home for themselves and their families. Set in Texas in the waning years of the Civil War, the novel tells the dramatic story of a remarkable heroine, Lifee, and her husband, Mor. When Emancipation finally comes to Texas, Mor, Lifee, and the extended family they create from other slaves who are also looking for a home and a future, set out in search of a piece of land they can call their own. In the face of constant threats, they manage not only to survive but to succeed--their crops grow, their children thrive, they educate themselves and others. Lifee and Mor pass their intelligence, determination, and talents along to their children, the next generation to surge forward. At once tragic and triumphant, this is an epic story that captures with extraordinary authenticity the most important struggle of the last hundred years.
623	Trust Me	2001	9	58	468	https://images.gr-assets.com/books/1179829492l/960713.jpg	Does family always come first?Two young sisters sent far, far from home ...When tragedy deprives little Dulcie Taylor and her sister May of their parents, they are sent first to an orphanage and then shipped off to begin a new life in Australia. But the 'better life' the sisters are promised in this new and exciting country turns out to be a lie.It seems everyone who ever stood up for them, who ever said 'trust me', somehow betrays that trust: their parents, teachers and the sisters at the convent. But then Dulcie meets Ross, another orphanage survivor, and finds a kindred spirit. Can Dulcie ever get over the pain of the past and learn to trust again? And does she have the strength to fight for her own happiness as well as that of her sister?
624	Desiderata: Words For Life	2003	8	50	469	https://images.gr-assets.com/books/1391638110l/653048.jpg	A timeless and beautiful picture book--the perfect gift for every stage and season of life.The inspirational words of Max Ehrmann's timeless poem "Desiderata" have touched millions of readers throughout the world since it was first written in 1927. Now, more than 75 years later, the poem's simplicity and affirmation of life resonate more than ever, offering us--as only the truest words can--wisdom for how to live our lives with dignity, compassion, and faith.Marc Tauss's lyrical photographs, by turns surprising, thought provoking, and beautiful, are a visual poem in themselves.
625	The Fellowship of the Ring	1977	10	9	470	https://images.gr-assets.com/books/1298411339l/34.jpg	Alternate Cover Edition ISBN 0618260269 (copyright page ISBN is 0618346252 - different from back cover)One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkeness bind themIn ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, The Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in The Hobbit.In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.--back cover
654	The Fifth Season	2000	0	9	490	https://images.gr-assets.com/books/1386803701l/19161852.jpg	This is the way the world ends. Again.Three terrible things happen in a single day. Essun, a woman living an ordinary life in a small town, comes home to find that her husband has brutally murdered their son and kidnapped their daughter. Meanwhile, mighty Sanze -- the world-spanning empire whose innovations have been civilization's bedrock for a thousand years -- collapses as most of its citizens are murdered to serve a madman's vengeance. And worst of all, across the heart of the vast continent known as the Stillness, a great red rift has been been torn into the heart of the earth, spewing ash enough to darken the sky for years. Or centuries.Now Essun must pursue the wreckage of her family through a deadly, dying land. Without sunlight, clean water, or arable land, and with limited stockpiles of supplies, there will be war all across the Stillness: a battle royale of nations not for power or territory, but simply for the basic resources necessary to get through the long dark night. Essun does not care if the world falls apart around her. She'll break it herself, if she must, to save her daughter.
655	The Brothers Lionheart	2004	0	9	491	https://images.gr-assets.com/books/1388269738l/19312.jpg	The Brothers Lionheart (Swedish: Bröderna Lejonhjärta) is a children's fantasy novel written by Astrid Lindgren. It was published in the autumn of 1973 and has been translated into 46 languages. Many of its themes are unusually dark and heavy for the children's book genre. Disease, death, tyranny, betrayal and rebellion are some of the dark themes that permeate the story. The lighter themes of the book involve platonic love, loyalty, hope, courage and pacifism.The two main characters are two brothers; the older Jonatan and the younger Karl. The two brothers' surname was originally Lion, but they are generally known as Lionheart. Karl's nickname is Skorpan (Rusky) since Jonatan likes these typical Swedish toasts or crusts.In Nangijala, a land in "the campfires and storytelling days", the brothers experience adventures. Together with a resistance group they lead the struggle against the evil Tengil, who rules with the aid of the fearsome fire-breathing dragon, Katla.
626	The Lord of the Rings	1988	9	9	470	https://images.gr-assets.com/books/1388810940l/15354.jpg	Continuing the story of The Hobbit, this seven-volume paperback boxed set of Tolkien's epic masterpiece, The Lord of the Rings is a collection to treasure. Sauron, the Dark Lord, has gathered to him all the Rings of Power; the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring -- the ring that rules them all -- which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as the Ring is entrusted to his care. He must leave his home and make a perilous journey across the realms of Middle-earth to the Crack of Doom, deep inside the territories of the Dark Lord. There he must destroy the Ring forever and foil the Dark Lord in his evil purpose. Discover the incredible epic journey of Frodo in a celebratory seven-volume boxed set of fantasy classic, The Lord of the Rings.
627	The Return of the King	1976	9	9	470	https://images.gr-assets.com/books/1327917539l/2075441.jpg	The third part of J.R.R. Tolkien’s epic adventure The Lord of the Rings, illustrated in colour by Alan LeeThe armies of the Dark Lord are massing as his evil shadow spreads ever wider. Men, Dwarves, Elves and Ents unite forces to do battle against the Dark. Meanwhile, Frodo and Sam struggle further into Mordor in their heroic quest to destroy the One Ring.
628	The Collected Stories of Isaac Bashevis Singer	1982	10	43	471	https://images.gr-assets.com/books/1386924225l/25737.jpg	The forty-seven stories in this collection, selected by Singer himself out of nearly one hundred and fifty, range from the publication of his now-classic first collection, Gimpel the Fool, in 1957, until 1981. They include supernatural tales, slices of life from Warsaw and the shtetls of Eastern Europe, and stories of the Jews displaced from that world to the New World, from the East Side of New York to California and Miami.
629	The Return of Sherlock Holmes	2001	8	24	472	https://images.gr-assets.com/books/1529973503l/194366.jpg	'Holmes,' I cried. 'Is it really you? Can it indeed be that you are alive? Is it possible that you succeeded in climbing out of that awful abyss?'Missing, presumed dead, for three years, Sherlock Holmes returns triumphantly to his dear companion Dr Watson. And not before time! London has never been in more need of his extraordinary services: a murderous individual with an air gun stalks the city.Among thirteen further brilliant tales of mystery, detection and deduction, Sherlock Holmes investigates the problem of the Norwood Builder, deciphers the message of the Dancing Men, and cracks the case of the Six Napoleons.
660	Totto-Chan: The Little Girl at the Window	1984	0	32	494	https://images.gr-assets.com/books/1386306189l/19226441.jpg	This engaging series of childhood recollections tells about an ideal school in Tokyo during World War II that combined learning with fun, freedom, and love. This unusual school had old railroad cars for classrooms, and it was run by an extraordinary man-its founder and headmaster, Sosaku Kobayashi-who was a firm believer in freedom of expression and activity.In real life, the Totto-chan of the book has become one of Japan's most popular television personalities-Tetsuko Kuroyanagi. She attributes her success in life to this wonderful school and its headmaster.The charm of this account has won the hearts of millions of people of all ages and made this book a runaway bestseller in Japan, with sales hitting the 4.5 million mark in its first year.
630	The Memoirs of Sherlock Holmes	2004	8	24	472	https://images.gr-assets.com/books/1529973409l/194373.jpg	'If I were assured of your eventual destruction I would, in the interests of the public, cheerfully accept my own.'In The Memoirs of Sherlock Holmes, the consulting detective's notoriety as the arch-despoiler of the schemes concocted by the criminal underworld at last gets the better of him.Though Holmes and his faithful sidekick Dr Watson solve what will become some of their most bizarre and extraordinary cases - the disappearance of the race horse Silver Blaze, the horrific circumstances of the Greek Interpreter and the curious mystery of the Musgrave Ritual among them - a criminal mastermind is plotting the downfall of the great detective.Half-devil, half-genius, Professor Moriarty leads Holmes and Watson on a grisly cat-and-mouse chase through London and across Europe, culminating in a frightful struggle which will turn the legendary Reichenbach Falls into a water double-grave . . .
632	The Story of Ferdinand	1936	9	32	473	https://images.gr-assets.com/books/1348133512l/773951.jpg	A true classic with a timeless message, The Story of Ferdinand has enchanted readers since it was first published in 1936. All the other bulls would run and jump and butt their heads together. But Ferdinand would rather sit and smell the flowers. And he does just that, until the day a bumblebee and some men from the Madrid bullfights give gentle Ferdinand a chance to be the most ferocious star of the corrida—and the most unexpected comic hero. This cherished hardcover is perfect for those who love Ferdinand, and those who have yet to meet him.
662	Next of Kin: My Conversations with Chimpanzees	1998	0	1	496	https://images.gr-assets.com/books/1348810069l/325779.jpg	For 30 years Roger Fouts has pioneered communication with chimpanzees through sign language--beginning with a mischievous baby chimp named Washoe. This remarkable book describes Fout's odyssey from novice researcher to celebrity scientist to impassioned crusader for the rights of animals. Living and conversing with these sensitive creatures has given him a profound appreciation of what they can teach us about ourselves. It has also made Fouts an outspoken opponent of biomedical experimentation on chimpanzees. A voyage of scientific discovery and interspecies communication, this is a stirring tale of friendship, courage, and compassion that will change forever the way we view our biological--and spritual--next of kin.Fouts is a professor of Psychology.
634	The Power of a Praying Wife	2001	8	11	475	https://images.gr-assets.com/books/1178755854l/833253.jpg	Worrying about your marriage changes nothing... Praying about it can change everything. Today's challenges and pressures can make a fulfilling marriage seem like an impossible dream. Yet God delights in doing the impossible if only we would ask! Stormie Omartian shares how God has strengthened her own marriage since she began to pray for her husband concerning key areas in his life, including...-his spiritual walk-his emotions-his roles as a father, leader, and decision maker-his security in work and finances-his health and physical protection-his faith and his futureEvery woman who desires a closer relationship with her husband will appreciate this refreshing look at the power of prayer in marriage. Along with real-life illustrations, Stormie also includes sample prayers and "power tools"--verses that inspire and encourage--to help wives rest in the assurance of God's wonderful promises of restoration, renewal, and growth in marriage.
635	The Power of a Praying Woman	2002	10	11	475	https://images.gr-assets.com/books/1178808089l/838917.jpg	The author of The Power of a Praying Wife draws upon her knowledge of Scripture, personal struggles, and breakthroughs in prayer to provide reassuring guidance for women wanting more of God in their lives, sharing sample prayers that cover every area of a woman's life. Original.
637	The Sea of Tranquility	1996	8	46	477	https://images.gr-assets.com/books/1465919812l/16151178.jpg	I live in a world without magic or miracles. A place where there are no clairvoyants or shapeshifters, no angels or superhuman boys to save you. A place where people die and music disintegrates and things suck. I am pressed so hard against the earth by the weight of reality that some days I wonder how I am still able to lift my feet to walk.Former piano prodigy Nastya Kashnikov wants two things: to get through high school without anyone learning about her past and to make the boy who took everything from her—her identity, her spirit, her will to live—pay.Josh Bennett’s story is no secret: every person he loves has been taken from his life until, at seventeen years old, there is no one left. Now all he wants is be left alone and people allow it because when your name is synonymous with death, everyone tends to give you your space.Everyone except Nastya, the mysterious new girl at school who starts showing up and won’t go away until she’s insinuated herself into every aspect of his life. But the more he gets to know her, the more of an enigma she becomes. As their relationship intensifies and the unanswered questions begin to pile up, he starts to wonder if he will ever learn the secrets she’s been hiding—or if he even wants to.The Sea of Tranquility is a rich, intense, and brilliantly imagined story about a lonely boy, an emotionally fragile girl, and the miracle of second chances.
638	No More Secrets	2000	10	23	478	https://images.gr-assets.com/books/1453739360l/28695658.jpg	An alternate cover for this ASIN can be found here and here.A small town love story...\n\n“I can’t wait anymore.” His mouth claimed hers in a storm of heat and power.\n\n Carter Pierce is a man who believes in signs. He just doesn't know what to do with this one. In the small town of Blue Moon Bend, where everybody is a matchmaker, Carter wants to be left alone to tend the family farm. After returning from Afghanistan with scars, his only goal is recovery. He doesn't need any distractions, and definitely not one with silver-blonde hair and lips that beg to be kissed. Summer Lentz is a journalist from the city sent to interview Carter and his family. She's out of place in the small town, with her designer wardrobe and workaholic lifestyle. She asks too many questions and doesn't take no for an answer, threatening to destroy the peace and balance that Carter has been working towards. She thwarts every attempt Carter makes to retreat back inside himself, somehow bringing him closer to being whole again. Summer has secrets of her own, but she never planned to open up to anyone - let alone the scowling, secretive farm owner whose story she's after. But as she gets drawn into the community, she starts to realize that she can't stay closed off forever. And what's more, she doesn't want to. As Carter and Summer grow closer, will they be able to push past the secrets that are holding both of them back?
650	Merseyside Girls	2002	7	56	486	https://images.gr-assets.com/books/1347334627l/5083549.jpg	Nancy, Amy and Katie Siddons are three of the prettiest nurses south of the Mersey. They've been brought up to respect their elders and uphold family honour at all times. Then sweet, na�ve Katie falls pregnant, bringing shame upon the family's name. Alec Siddons, a local police constable, cannot and will not forgive his daughter for her immoral behaviour. But Katie isn't the only one with troubles ahead. Amy is in love with her cousin Paul, but owing to a family feud the mere mention of his name is forbidden in her father's presence; and Nancy is eager to wed her fianc� Stan before the Second World War takes him away. With the outbreak of war, the three sisters offer each other comfort and support. Their mother, meanwhile, is battling with painful memories of the past, and their father lives in dread that his own dark secrets will be revealed. As the war takes its toll on the Merseyside girls they learn that few things in life are more precious than honesty, love and forgiveness.
651	The Sibley Guide to Birds	2000	10	4	487	https://images.gr-assets.com/books/1442624249l/15832.jpg	The entire birding world, from expert ornithologists to backyard enthusiasts, has been waiting for Sibley's work to be made available in a field-usable form. Containing the renowned artist's superbly lucid and comprehensive text, this guide features more than 6,500 of his detailed paintings. Full color.
671	The Folk of the Faraway Tree	1992	8	32	502	https://images.gr-assets.com/books/1175048298l/473623.jpg	"A land at the top of a tree!" said Connie. "I don't believe a word of it."Jo, Bessie and Fanny are fed up when Connie comes to stay - she's so stuck-up and bossy. But they don't let her stop them having fun with their tree-friends, Silky, Moon-Face and the Saucepan Man. Together they climb through the cloud at the top of the Faraway Tree and visit the wonderful places there, the Land of Secrets and the Land of Treats - and Connie learns to behave herself!Cover illustration by Bob Harvey(from back cover of book)
1	One Foot in the Grave	1980	10	42	1	https://images.gr-assets.com/books/1373857981l/2168860.jpg	You can run from the grave, but you can’t hide…Half-vampire Cat Crawfield is now Special Agent Cat Crawfield, working for the government to rid the world of the rogue undead. She’s still using everything Bones, her sexy and dangerous ex, taught her, but when Cat is targeted for assassination, the only man who can help her is the vampire she left behind.Being around Bones awakens all her emotions, from the adrenaline rush of slaying vamps side by side to the reckless passion that consumed them. But a price on her head—wanted: dead or half-alive—means her survival depends on teaming up with Bones. And no matter how hard Cat tries to keep things professional between them, she’ll find that desire lasts forever…and Bones won’t let her get away again.
673	Phantom	1991	0	58	504	https://images.gr-assets.com/books/1390117001l/190507.jpg	This incredible portrait of Erik--the Phantom--recreates his entire life, from his survival as a child in a carnival freak show to his creative genius behind the Paris Opera House--and its labyrinthine world below--to his discovery of love.
6	The Kindly Ones	2000	9	37	4	https://images.gr-assets.com/books/1339922887l/71252.jpg	The Penultimate volume to the phenomenal Sandman series: distraught by the kidnapping and presumed death of her son, and believing Morpheus to be responsible, Lyta Hall calls the ancient wrath of the Furies down upon him. A former superheroine blames Morpheus for the death of her child and summons an ancient curse of vengeance against the Lord of Dream. The "kindly ones" enter his realm and force a sacrifice that will change the Dreaming forever. collecting The Sandman #57–69 and Vertigo Jam #1
74	Unexpected	2003	10	23	65	https://images.gr-assets.com/books/1426040552l/25117552.jpg	She is the Chosen One. He is Gabriel Gavino, il prossimo Mafioso Don - the next in line. Before she saves anyone they're going to save each other.
76	The Complete Stories	1998	10	58	67	https://images.gr-assets.com/books/1223588017l/22904.jpg	The Complete Stories brings together all of Kafka’s stories, from the classic tales such as “The Metamorphosis,” “In the Penal Colony,” and “A Hunger Artist” to shorter pieces and fragments that Max Brod, Kafka’s literary executor, released after Kafka’s death. With the exception of his three novels, the whole of Kafka’s narrative work is included in this volume. --penguinrandomhouse.comTwo Introductory parables: Before the law --Imperial message --Longer stories: Description of a struggle --Wedding preparations in the country --Judgment --Metamorphosis --In the penal colony --Village schoolmaster (The giant mole) --Blumfeld, and elderly bachelor --Warden of the tomb --Country doctor --Hunter Gracchus --Hunter Gracchus: A fragment --Great Wall of China --News of the building of the wall: A fragment --Report to an academy --Report to an academy: Two fragments --Refusal --Hunger artist --Investigations of a dog --Little woman --The burrow --Josephine the singer, or the mouse folk --Children on a country road --The trees --Clothes --Excursion into the mountains --Rejection --The street window --The tradesman --Absent-minded window-gazing --The way home --Passers-by --On the tram --Reflections for gentlemen-jockeys --The wish to be a red Indian --Unhappiness --Bachelor's ill luck --Unmasking a confidence trickster --The sudden walk --Resolutions --A dream --Up in the gallery --A fratricide --The next village --A visit to a mine --Jackals and Arabs --The bridge --The bucket rider --The new advocate --An old manuscript --The knock at the manor gate --Eleven sons --My neighbor --A crossbreed (A sport) --The cares of a family man --A common confusion --The truth about Sancho Panza --The silence of the sirens --Prometheus --The city coat of arms --Poseidon --Fellowship --At night --The problem of our laws --The conscripton of troops --The test --The vulture --The helmsman --The top --A little fable --Home-coming --First sorrow --The departure --Advocates --The married couple --Give it up! --On parables.
104	Omega	2003	10	42	87	https://images.gr-assets.com/books/1363387966l/17618215.jpg	SynopsisNine months after, son of Enna and Deron is born.Apollo kidnaps the child and he proposes a duel between Deron and him.And that will be the end of the dispute among the vampires from Vangoth family.
124	One Love	1998	7	44	105	https://images.gr-assets.com/books/1405611736l/22736757.jpg	*The final book in the #1 iBooks bestselling Gypsy Brothers series*Will Julz complete her mission for vengeance against the Gypsy Brothers? Or is Dornan still one step ahead?More shocking secrets will come to light and lives will be lost in this final, devastating instalment of the Gypsy Brothers series.
209	Nobody's Perfect	1989	9	27	171	https://images.gr-assets.com/books/1335273006l/13421636.jpg	Why would someone choose the BDSM lifestyle of consensual bondage, discipline, dominance, submission, sado-masochism as a means to heal from a traumatic and abusive past? DESCRIPTION: NOBODY'S PERFECT is the continuing story of Savannah Gentry (now Savi Baker) and Damian Orlando from MASTERS AT ARMS & NOBODY’S ANGEL (Rescue Me Saga #1) and NOBODY'S HERO (#2). Savannah/Savi escaped eleven years of abuse at the hands of her father and finally made a safe life for herself and her daughter. But when her father once again threatens her peace of mind—and her daughter’s safety—Savi runs to Damian Orlando for protection. Eight years earlier as Savannah, she shared one perfect day with Damian that changed both their young lives and resulted in a secret she no longer can hide. But being with Damian reawakens repressed memories and feelings she wants to keep buried. After witnessing a scene with Damian on Savi's first night at his private club, however, she begins to wonder if he could help her regain control of her life and reclaim her sexuality and identity. Damian, a wounded warrior, has had his own dragons to fight in life, but has never forgotten Savannah. He will lay down his life to protect her and her daughter, but doesn’t believe he can offer more than that. She deserves a whole man, something he can never be after a firefight in Iraq. Damian has turned to SM to regain control of his life and emotions and fulfills the role of Service Top to “bottoms” at the club. However, he could never deliver those services to Savi, who needs someone gentle and loving, not the man he has become. Will two wounded survivors find love and healing in each other’s arms? ABOUT THE RESCUE ME SAGA: The books in the ongoing Rescue Me Saga are not stand-alone stories and should be read in order. Characters will recur in later books to deal with further issues in their lives as the saga continues and each book builds upon all previous ones. Sometimes main characters even need another book to help resolve major issues affecting their relationships. BONUS MATERIAL in this version: Kallypso Masters has added the PLAYLIST of music that inspired her as she wrote about the first three couples mentioned in this combined volume, as well as a GLOSSARY OF TERMS and a CAST OF CHARACTERS in these books in the saga. CONTENT WARNING: Intended for mature adult readers not offended by profanity and graphic (but never gratuitous!) sex scenes. Due to the emotional way in which the author presents the subject matter (past and present), the books might cause triggers while reading. Please read the Author's Notes at the beginning.
148	Hudson Taylor	1987	10	17	124	https://images.gr-assets.com/books/1349031806l/1227457.jpg	Previously titled To China With Love, this book is now reissued and recounts the thrilling story of the beginnings of the China Inland Mission.
344	Boy Wonder	1989	8	58	277	https://images.gr-assets.com/books/1482157760l/110519.jpg	In a turbo-charged romp through the Hollywood of everyone's wildest dreams, Boy Wonder follows the career of Shark Trager--rebel filmmaker and megasuccessful producer--from his birth in 1950 at a drive-in movie theater and his meteoric rise to the pinnacle of Hollywood power, to his equally spectacular descent into obscurity.
357	In This Mountain	2002	8	58	280	https://images.gr-assets.com/books/1388629068l/71787.jpg	The seventh novel of Karon's beloved series is now available in paperback. Father Tim and Cynthia are back home in Mitford, where they find change in the air: a haircut price war that takes no prisoners and a risky new menu item at the Grill.
414	Wild Magic	1991	9	9	326	https://images.gr-assets.com/books/1166573613l/13836.jpg	Young Daine's knack with horses gets her a job helping the royal horsemistress drive a herd of ponies to Tortall. Soon it becomes clear that Daine's talent, as much as she struggles to hide it, is downright magical. Horses and other animals not only obey, but listen to her words. Daine, though, will have to learn to trust humans before she can come to terms with her powers, her past, and herself.
425	Lyrics, 1962-1985	1985	9	7	334	https://images.gr-assets.com/books/1435799281l/132053.jpg	The complete collection includes all of Dylan's writings and drawings plus 120 new writings. Index of song titles.
453	Shogun	1986	9	56	350	https://images.gr-assets.com/books/1423468568l/103045.jpg	A bold English adventurer. An invincible Japanese warlord. A beautiful woman torn between two ways of life, two ways of love. All brought together in an extraordinary saga of a time and a place aflame with conflict, passion, ambition, lust, and the struggle for power...
519	Love You Forever	1995	10	32	394	https://images.gr-assets.com/books/1348832754l/310259.jpg	An extraordinarily different story by Robert Munsch is a gentle affirmation of the love a parent feels for their child--forever. Sheila McGraw's soft and colorful pastels perfectly complement the sentiment of the book--one that will be read repeatedly for years.
526	The Road Home	1998	10	58	400	https://images.gr-assets.com/books/1356444464l/199854.jpg	Continuing the story of Dalva and her peculiar and remarkable family, The Road Home encompasses the voices of Dalva's grandfather, John Northridge; Naomi, the widow of his favourite son; Paul, the first Northridge son; and Nelse, Dalva's son.
551	Weapon	1990	9	9	420	https://images.gr-assets.com/books/1483746721l/33809003.jpg	In the world of the living and the dead, only the dead survive…\n\n\n\nThe way carbon atoms need intense heat and pressure to change structure and become a diamond is the same way some girls need mind mapping and genetic modification to become unstoppable weapons. As in love, nothing comes easy. And nothing in life will ever be the same again. Such is the nature of cause and effect in genetics. \n\nIn the wake of an horrific, inevitable tragedy, everyone is forced to be someone they’re not. Brayden sinks into the Vegas nightlife learning hard lessons in love and sex; Georgia struggles to cope with the mutant changes taking place in her, specifically the death of her emotions; Dr. Holland must correct his own genetic cocktail lest he descend into a madness more reminiscent of his earlier, more homicidal days; and Margaret and Christian must face their own dire truths, not only about who they are becoming as a couple, but if they will even have a family once the truth about Abby comes out.\n\nWeapon is very much a book of love and humanity, the will to endure the unthinkable, the necessity of friendship in the darkest of times and what it means to prepare yourself for the backlash of a reckless life. When love is a choice, and life is a choice, but madness and torture head toward secrecy and conspiracy, what you have is a riveting tale that begs the question: can normalcy and paranormal power co-exist? Especially if that power is otherworldly and indomitable, something most humans could never comprehend? With some slight of hand, a rash of deception, and some life-threatening choices that seem impossible in retrospect, the heart-stopping fifth novel in the ground-breaking Swann Series begins. \n\nNote to Reader: Before you purchase this book, read the short author interview below. Due to mature content, Weapon is recommended for ages 15 and up.\n\n\n\nINTERVIEW WITH THE AUTHOR\n\n\n\n \n\nQ – The events in Masochist flip the script, so to speak. Can we expect to see Abby again?\n\nA – If I’ve learned one thing from reading over a thousand books, it’s that you want to keep your audience on edge. You want to be unpredictable, do the unthinkable. Nothing for my characters is easy. Weapon is no different. As the series progresses, the stakes intensify; if the characters can’t keep up, failure overwhelms them. Failure sometimes equals death. Weapon continues the Swann Series tradition by being a story of ascension. Over the last three books, this series has delicately embraced the paranormal, the genetically complex, the downright insane. So will we see Abby again? Maybe more than you think, or perhaps not at all. I can promise you this, what lie ahead…you will never see it coming.\n\n\n\nQ – You use Dulce Air Force Base as a background for Weapon. What inspired this setting?\n\nA – There’s so much conspiracy surrounding Dulce AFB, especially in 1979 when a war broke out between the military and, well…something else. Sixty-seven military personnel died; three survived. Phil Schneider, grievously wounded, survived. His wounds were consistent with his story, but his story was impossible to the logical mind. Schneider was told the only way to avoid being suicided was to tell the truth to as many people as he could, a common safety measure for whistle-blowers. Schneider was later found dead in his apartment after thirteen murder attempts.
602	The Epiplectic Bicycle	1998	9	58	453	https://images.gr-assets.com/books/1347593469l/91499.jpg	While Embley and Yewbert are hitting one another with croquet mallets one day, an untenanted bicycle rolls into their garden. This book chronicles their adventures across turnip fields, through barns and into bushes.
663	Jillian Jiggs	1988	9	32	497	https://images.gr-assets.com/books/1390664958l/201041.jpg	Jillian Jiggs-- who spends most of her time making up games and playing dress-up-- is much too busy to clean her room!
639	Breaking the Rules	1988	10	23	478	https://images.gr-assets.com/books/1480293652l/33139765.jpg	From #1 Amazon bestselling writer of Pretend You’re Mine, Lucy Score delivers once again with the conclusion to the Sinner & Saint story. In this suspenseful sequel to Crossing the Line, movie star Waverly Sinner has a gunshot wound and a missing fake boyfriend and the only man who can help her now is the one who broke her heart five years ago, Xavier Saint. When charming leading man Dante Wrede offered Waverly a new way to use her acting talents, she jumped at the chance. Undercover work is exciting and challenging. But when their assignment is cut short by a hail of gunfire, Waverly is left bleeding and alone with a cover story that could ruin her career. It’s been five years since Waverly almost died because of a mistake he made. But when Xavier Saint catches the latest mess the actress has gotten herself into, he faces facts. He’s never stopped loving her and she still obviously needs his protection. But when he tracks her down in secluded paradise, it’s clear she’s not working on her issues in rehab as the media reported. And she’s definitely not happy to see him or willing to trust him with anything more than half-truths. They have an attraction that won’t die, but without trust there’s no hope for a future together. The only shot Xavier has at winning her back is helping her find Dante Wrede, the man he thinks she loves. When a plot to frame her for kidnapping and murder materializes, their rag tag team of conspirators need to work fast and play dirty to clear her name. He’s got just one shot at proving her innocence and winning her back forever. Author’s Note: This is the conclusion of Waverly and Xavier’s story that began with Crossing the Line. It takes place five years after the end of Crossing the Line.
658	Drums of Autumn	1997	8	56	493	https://images.gr-assets.com/books/1357921836l/864695.jpg	In this breathtaking novel—rich in history and adventure—The New York Times bestselling author Diana Gabaldon continues the story of Claire Randall and Jamie Fraser that began with the now-classic novel Outlander and continued in Dragonfly in Amber and Voyager. Once again spanning continents and centuries, Diana Gabaldon has created a work of sheer passion and brilliance.... It began at an ancient Scottish stone circle. There, a doorway, open to a select few, leads into the past—or the grave. Dr. Claire Randall survived the extraordinary passage, not once but twice.Her first trip swept her into the arms of Jamie Fraser, an eighteenth-century Scot whose love for her became a legend—a tale of tragic passion that ended with her return to the present to bear his child. Her second journey, two decades later, brought them together again in the American colonies. But Claire had left someone behind in the twentieth century—their daughter, Brianna....Now Brianna has made a disturbing discovery that sends her to the circle of stones and a terrifying leap into the unknown. In search of her mother and the father she has never met, she is risking her own future to try to change history ... and to save their lives. But as Brianna plunges into an uncharted wilderness, a heartbreaking encounter may strand her forever in the past ... or root her in the place she should be, where her heart and soul belong....
659	Voyager	1994	9	56	493	https://images.gr-assets.com/books/1483278195l/10987.jpg	From the author of the breathtaking bestsellers Outlander and Dragonfly in Amber, the extraordinary saga continues.Their passionate encounter happened long ago by whatever measurement Claire Randall took. Two decades before, she had traveled back in time and into the arms of a gallant eighteenth-century Scot named Jamie Fraser. Then she returned to her own century to bear his child, believing him dead in the tragic battle of Culloden. Yet his memory has never lessened its hold on her... and her body still cries out for him in her dreams.Then Claire discovers that Jamie survived. Torn between returning to him and staying with their daughter in her own era, Claire must choose her destiny. And as time and space come full circle, she must find the courage to face the passion and pain awaiting her...the deadly intrigues raging in a divided Scotland... and the daring voyage into the dark unknown that can reunite or forever doom her timeless love.
661	A Charlie Brown Christmas	2001	7	5	495	https://images.gr-assets.com/books/1182437635l/1275105.jpg	It's Christmas! Everyone is getting into the Christmas spirit -- except for Charlie Brown. It seems like everybody has forgotten what Christmas is truly about. But Lucy, Linus, and the whole Peanuts gang have some holiday surprises that will make even Charlie Brown feel merry!
664	Finders, Keepers	1991	8	19	498	https://images.gr-assets.com/books/1417023099l/23614726.jpg	Finders, Keepers. Losers, Weepers Two men are murdered in settings which speak volumes of involvement of some sacred cynicism. A psycho-killer on the loose? Or is this the beginning of something much more grave and dangerous?This is the tale of how Deputy Director, I.B., Shoumik Haldar and celebrated author Ishan Vajpayee exercise all their tools of conventional and unconventional deduction to solve the puzzles thrown across by the enemy, yet unrevealed.Intertwined intensely with the opulent mythological tales and specimens attributing to the rich cultural heritage of India, the story depicts the resurgence of a dormant historical sect, which attacks the very foundations of one of the most powerful and secreted organizations of all times.Spread across the length and breadth of the entire Indian subcontinent, read the mystery as it unravels with the duo travelling from one corner of the country to another searching for the signs.
665	Redeeming Love	1991	8	3	499	https://images.gr-assets.com/books/1166475085l/11422.jpg	California's gold country, 1850. A time when men sold their souls for a bag of gold and women sold their bodies for a place to sleep.Angel expects nothing from men but betrayal. Sold into prostitution as a child she survives by keeping her hatred alive. And what she hates most are the men who use her, leaving her empty and dead inside.Then she meets Michael Hosea. A man who seeks his Father's heart in everything, Michael obeys God's call to marry Angel and to love her unconditionally. Slowly, day by day, he defies Angel's every bitter expectation, until despite her resistance, her frozen heart begins to thaw.But with her unexpected softening come overwhelming feelings of unworthiness and fear. And so Angel runs. Back to the darkness, away from her husband's pursuing love, terrified of the truth she no longer can deny: Her final healing must come from the One who loves her even more than Michael does ... the One who will never let her go.
666	Wintertide	2001	10	9	500	https://images.gr-assets.com/books/1280765503l/8697584.jpg	A FORCED WEDDING. A DOUBLE EXECUTION. TWO THIEVES HAVE OTHER PLANS.The New Empire intends to celebrate its victory over the Nationalists with a day that will never be forgotten. On the high holiday of Wintertide, they plan to execute two traitors (Degan Gaunt and the Witch of Melengar) as well as force the Empress into a marriage of their own design. But they didn’t account for Royce and Hadrian finally locating the Heir of Novron—or the pair’s desire to wreak havoc on the New Empire’s carefully crafted scheme.
667	Guards! Guards!	1991	10	9	501	https://images.gr-assets.com/books/1431127356l/64216.jpg	Here there be dragons . . . and the denizens of Ankh-Morpork wish one huge firebreather would return from whence it came. Long believed extinct, a superb specimen of draco nobilis ("noble dragon" for those who don't understand italics) has appeared in Discworld's greatest city. Not only does this unwelcome visitor have a nasty habit of charbroiling everything in its path, in rather short order it is crowned King (it is a noble dragon, after all . . .).Meanwhile, back at Unseen University, an ancient and long-forgotten volume--The Summoning of Dragons--is missing from the Library's shelves. To the rescue come Captain Vimes, Constable Carrot, and the rest of the Night Watch who, along with other brave citizens, risk everything, including a good roasting, to dethrone the flying monarch and restore order to Ankh-Morpork (before it's burned to a crisp). A rare tale, well done as only Terry Pratchett can.
668	Going Postal	1997	9	9	501	https://images.gr-assets.com/books/1388236899l/64222.jpg	Arch-swindler Moist Van Lipwig never believed his confidence crimes were hanging offenses - until he found himself with a noose tightly around his neck, dropping through a trapdoor, and falling into...a government job?By all rights, Moist should have met his maker. Instead, it's Lord Vetinari, supreme ruler of Ankh-Morpork, who promptly offers him a job as Postmaster. Since his only other option is a nonliving one, Moist accepts the position - and the hulking golem watchdog who comes along with it, just in case Moist was considering abandoning his responsibilities prematurely. Getting the moribund Postal Service up and running again, however, may be a near-impossible task, what with literally mountains of decades-old undelivered mail clogging every nook and cranny of the broken-down post office building; and with only a few creaky old postmen and one rather unstable, pin-obsessed youth available to deliver it. Worse still, Moist could swear the mail is talking to him. Worst of all, it means taking on the gargantuan, money-hungry Grand Trunk clacks communication monopoly and its bloodthirsty piratical head, Mr. Reacher Gilt.But it says on the building Neither Rain Nor Snow Nor Glom of Nit...Inspiring words (admittedly, some of the bronze letters have been stolen), and for once in his wretched life Moist is going to fight. And if the bold and impossible are what's called for, he'll do it - in order to move the mail, continue breathing, get the girl, and specially deliver that invaluable commodity that every human being (not to mention troll, dwarf, and, yes, even golem) requires: hope.
669	Men at Arms	1979	7	9	501	https://images.gr-assets.com/books/1323540143l/833425.jpg	'Be a MAN in the City Watch! The City Watch needs MEN!'But what it's got includes Corporal Carrot (technically a dwarf), Lance-constable Cuddy (really a dwarf), Lance constable Detritus (a troll), Lance constable Angua (a woman... most of the time) and Corporal Nobbs (disqualified from the human race for shoving).And they need all the help they can get. Because they've only got twenty-four hours to clean up the town and this is Ankh-Morpork we're talking about...
670	Night Watch	2002	8	9	501	https://images.gr-assets.com/books/1320518310l/47989.jpg	'Don't put your trust in revolutions. They always come round again. That's why they're called revolutions. People die, and nothing changes.'For a policeman, there can be few things worse than a serial killer at loose in your city. Except, perhaps, a serial killer who targets coppers, and a city on the brink of bloody revolution. The people have found their voice at last, the flags and barricades are rising...And the question for a policeman, an officer of the law, a defender of the peace, is:Are you with them, or are you against them?
672	The Moth	1987	8	1	503	https://images.gr-assets.com/books/1372686820l/17468561.jpg	For the first time in print, celebrated storytelling phenomenon The Moth presents fifty spellbinding, soul-bearing stories selected from their extensive archive (fifteen-plus years and 10,000-plus stories strong). Inspired by friends telling stories on a porch, The Moth was born in small-town Georgia, garnered a cult following in New York City, and then rose to national acclaim with the wildly popular podcast and Peabody Award-winning weekly public radio show The Moth Radio Hour.Stories include: writer Malcolm Gladwell's wedding toast gone horribly awry; legendary rapper Darryl "DMC" McDaniels' obsession with a Sarah McLachlan song; poker champion Annie Duke's two-million-dollar hand; and A. E. Hotchner's death-defying stint in a bullring . . . with his friend Ernest Hemingway. Read about the panic of former Clinton Press Secretary Joe Lockhart when he misses Air Force One after a hard night of drinking in Moscow, and Dr. George Lombardi's fight to save Mother Teresa's life.This will be a beloved read for existing Moth enthusiasts, fans of the featured storytellers, and all who savor well-told, hilarious, and heartbreaking stories.
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.cities (id, name) FROM stdin;
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.genres (id, name) FROM stdin;
1	Nonfiction
2	Education
3	Christian Fiction
4	Reference
5	Holiday
6	Humor
7	Music
8	Religion
9	Fantasy
10	New Adult
11	Christian
12	Culture
13	Spirituality
14	Animals
15	Christianity
16	Horror
17	Biography
18	Feminism
19	Thriller
20	Cultural
21	Westerns
22	Classics
23	Romance
24	Mystery
25	Food and Drink
26	Computer Science
27	Erotica
28	Amish
29	Science Fiction Fantasy
30	Adventure
31	Family
32	Childrens
33	Self Help
34	History
35	Plays
36	Novels
37	Sequential Art
38	Design
39	Race
40	Adult Fiction
41	Philosophy
42	Paranormal
43	Short Stories
44	Dark
45	Autobiography
46	Young Adult
47	World War II
48	Art
49	Psychology
50	Poetry
51	Urban
52	Health
53	Science Fiction
54	Biology
55	Science
56	Historical
57	Literature
58	Fiction
59	Politics
60	Sports and Games
\.


--
-- Data for Name: libraries; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.libraries (id, name, city_id) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.ratings (id, book_id, user_id, rating) FROM stdin;
1	188	1	10
2	295	1	10
3	201	1	7
4	322	1	10
5	183	1	7
6	534	1	7
7	32	1	7
8	240	1	10
9	345	1	10
10	510	1	6
11	202	1	10
12	494	1	10
13	652	1	8
14	498	1	7
15	222	1	9
16	206	1	8
17	575	1	6
18	434	1	10
19	651	1	10
20	493	1	8
21	186	1	10
22	431	1	7
23	487	1	8
24	432	1	8
25	167	1	10
26	136	1	9
27	297	1	7
28	156	1	9
29	552	1	10
30	65	1	9
31	561	1	10
32	553	1	7
33	63	1	10
34	390	1	7
35	131	1	10
36	523	1	8
37	49	1	10
38	429	1	7
39	288	1	9
40	421	1	9
41	639	1	10
42	219	1	8
43	205	1	10
44	283	1	10
45	567	1	8
46	127	1	7
47	364	1	9
48	166	1	10
49	162	1	7
50	349	1	7
51	387	1	7
52	451	1	8
53	551	2	7
54	378	2	10
55	83	2	9
56	209	2	10
57	412	2	10
58	413	2	8
59	295	2	10
60	52	2	9
61	61	2	8
62	665	2	9
63	1	2	9
64	668	2	7
65	211	2	9
66	364	2	8
67	544	2	10
68	262	2	8
69	536	2	7
70	386	2	7
71	314	2	10
72	447	2	7
73	45	2	9
74	33	2	10
75	501	2	10
76	496	2	10
77	545	2	10
78	560	2	7
79	91	2	7
80	340	2	7
81	573	2	8
82	496	2	7
83	223	2	7
84	427	2	9
85	121	2	7
86	278	2	10
87	54	2	7
88	4	2	8
89	118	2	7
90	327	2	9
91	651	2	9
92	37	2	9
93	230	2	7
94	500	2	6
95	89	2	8
96	114	2	9
97	370	2	9
98	296	2	10
99	324	2	10
100	300	2	8
101	505	2	7
102	59	2	10
103	167	2	8
104	273	2	9
105	27	2	10
106	279	2	7
107	200	2	10
108	402	2	9
109	159	2	9
110	100	2	7
111	288	2	7
112	495	2	7
113	144	2	10
114	354	2	7
115	356	2	9
116	562	2	8
117	164	2	8
118	127	2	10
119	383	2	7
120	269	2	9
121	67	2	9
122	436	2	9
123	464	2	9
124	355	2	9
125	105	3	8
126	577	3	8
127	519	3	9
128	637	3	7
129	536	3	9
130	534	3	10
131	391	3	9
132	274	3	9
133	568	3	10
134	375	3	9
135	312	3	10
136	120	3	9
137	285	3	10
138	102	3	10
139	176	3	10
140	184	3	10
141	133	3	6
142	605	3	7
143	454	3	9
144	149	3	10
145	293	3	10
146	439	3	9
147	172	3	7
148	278	3	10
149	37	3	7
150	7	3	7
151	196	3	10
152	170	3	7
153	505	3	7
154	406	3	10
155	136	3	7
156	75	3	10
157	279	3	8
158	395	3	10
159	104	3	10
160	92	3	9
161	335	3	7
162	81	3	10
163	390	3	10
164	79	3	6
165	157	3	8
166	17	3	8
167	31	3	8
168	429	3	8
169	639	3	10
170	626	3	10
171	144	3	7
172	585	3	10
173	613	3	10
174	600	3	7
175	58	3	9
176	163	3	10
177	272	3	10
178	435	3	9
179	238	3	8
180	555	3	8
181	250	3	10
182	615	3	7
183	23	3	9
184	556	4	9
185	444	4	10
186	412	4	8
187	246	4	8
188	553	4	10
189	61	4	10
190	670	4	8
191	637	4	10
192	262	4	10
193	509	4	8
194	619	4	10
195	564	4	10
196	408	4	8
197	501	4	7
198	224	4	10
199	560	4	10
200	317	4	7
201	590	4	8
202	648	4	10
203	111	4	8
204	452	4	10
205	222	4	10
206	634	4	7
207	506	4	10
208	301	4	10
209	290	4	9
210	192	4	10
211	327	4	10
212	365	4	7
213	465	4	8
214	66	4	10
215	86	4	7
216	370	4	7
217	296	4	9
218	645	4	10
219	51	4	7
220	579	4	10
221	106	4	10
222	122	4	6
223	134	4	7
224	517	4	10
225	200	4	10
226	22	4	9
227	137	4	10
228	152	4	9
229	150	4	10
230	390	4	7
231	131	4	10
232	669	4	8
233	42	4	10
234	17	4	6
235	31	4	10
236	270	4	8
237	43	4	9
238	429	4	8
239	495	4	9
240	586	4	7
241	653	4	10
242	342	4	10
243	581	4	7
244	435	4	8
245	343	4	7
246	35	4	9
247	548	4	7
248	533	4	10
249	30	4	7
250	551	5	10
251	378	5	10
252	444	5	10
253	308	5	10
254	441	5	7
255	113	5	7
256	262	5	10
257	495	5	8
258	559	5	10
259	314	5	7
260	319	5	9
261	392	5	7
262	568	5	7
263	33	5	10
264	48	5	9
265	415	5	10
266	179	5	8
267	514	5	6
268	302	5	9
269	220	5	10
270	606	5	9
271	497	5	10
272	400	5	10
273	399	5	7
274	147	5	10
275	383	5	8
276	70	5	8
277	96	5	8
278	357	5	7
279	610	5	7
280	217	5	9
281	192	5	10
282	118	5	9
283	589	5	10
284	500	5	7
285	446	5	10
286	554	5	6
287	622	5	9
288	196	5	9
289	280	5	7
290	645	5	8
291	377	5	10
292	88	5	7
293	136	5	9
294	602	5	8
295	537	5	10
296	106	5	7
297	389	5	9
298	395	5	8
299	409	5	8
300	488	5	8
301	529	5	7
302	64	5	10
303	338	5	7
304	489	5	7
305	429	5	9
306	422	5	10
307	110	5	10
308	40	5	10
309	164	5	10
310	653	5	7
311	163	5	9
312	17	5	6
313	364	5	10
314	271	5	10
315	480	5	10
316	471	5	9
317	649	5	10
318	238	5	10
319	225	5	10
320	466	5	7
321	76	5	10
322	378	6	9
323	105	6	7
324	411	6	10
325	557	6	8
326	668	6	10
327	558	6	8
328	477	6	10
329	630	6	6
330	580	6	10
331	433	6	7
332	375	6	10
333	642	6	9
334	345	6	9
335	521	6	9
336	629	6	10
337	496	6	10
338	456	6	10
339	430	6	8
340	234	6	10
341	285	6	9
342	317	6	8
343	498	6	8
344	19	6	7
345	383	6	8
346	410	6	9
347	584	6	8
348	223	6	10
349	417	6	9
350	140	6	7
351	383	6	10
352	357	6	8
353	506	6	10
354	633	6	9
355	172	6	7
356	502	6	10
357	467	6	10
358	365	6	6
359	282	6	9
360	108	6	10
361	185	6	9
362	82	6	9
363	85	6	10
364	453	6	10
365	280	6	10
366	583	6	8
367	487	6	8
368	645	6	7
369	291	6	8
370	289	6	8
371	423	6	8
372	88	6	8
373	602	6	10
374	362	6	7
375	101	6	7
376	159	6	8
377	669	6	8
378	620	6	10
379	325	6	7
380	383	6	5
381	352	6	8
382	87	6	10
383	219	6	8
384	40	6	8
385	383	6	10
386	272	6	7
387	459	6	10
388	46	6	9
389	546	6	10
390	466	6	10
391	351	6	10
392	569	6	7
393	614	7	7
394	209	7	10
395	535	7	9
396	38	7	10
397	412	7	10
398	553	7	6
399	658	7	10
400	637	7	7
401	189	7	10
402	495	7	7
403	328	7	9
404	314	7	9
405	619	7	7
406	312	7	10
407	671	7	8
408	415	7	7
409	243	7	7
410	618	7	8
411	171	7	9
412	193	7	7
413	400	7	8
414	259	7	9
415	231	7	10
416	336	7	10
417	292	7	7
418	5	7	10
419	502	7	9
420	463	7	10
421	635	7	9
422	208	7	10
423	457	7	9
424	458	7	8
425	37	7	7
426	589	7	9
427	230	7	7
428	158	7	6
429	468	7	7
430	554	7	9
431	449	7	10
432	661	7	7
433	291	7	7
434	432	7	8
435	210	7	10
436	448	7	10
437	361	7	8
438	529	7	6
439	561	7	9
440	257	7	10
441	646	7	10
442	139	7	8
443	104	7	10
444	383	7	9
445	152	7	10
446	311	7	10
447	159	7	10
448	157	7	10
449	383	7	6
450	258	7	10
451	164	7	10
452	516	7	7
453	272	7	7
454	581	7	10
455	343	7	7
456	68	7	9
457	466	7	6
458	462	7	7
459	30	7	7
460	329	7	10
461	407	7	9
462	522	8	6
463	672	8	7
464	535	8	10
465	38	8	7
466	444	8	10
467	364	8	8
468	643	8	10
469	113	8	7
470	511	8	7
471	276	8	9
472	240	8	10
473	306	8	10
474	274	8	10
475	112	8	10
476	596	8	10
477	508	8	7
478	545	8	10
479	94	8	10
480	236	8	10
481	514	8	10
482	456	8	9
483	528	8	10
484	255	8	9
485	176	8	8
486	302	8	10
487	419	8	7
488	573	8	7
489	55	8	10
490	233	8	10
491	383	8	10
492	531	8	9
493	304	8	10
494	497	8	9
495	399	8	10
496	440	8	7
497	393	8	9
498	292	8	8
499	206	8	10
500	172	8	9
501	182	8	10
502	458	8	10
503	50	8	7
504	554	8	9
505	85	8	9
506	3	8	10
507	645	8	10
508	324	8	7
509	358	8	9
510	264	8	10
511	505	8	8
512	372	8	10
513	59	8	7
514	374	8	10
515	448	8	9
516	579	8	6
517	106	8	10
518	552	8	10
519	361	8	7
520	488	8	9
521	604	8	9
522	99	8	10
523	376	8	9
524	540	8	7
525	620	8	10
526	130	8	9
527	523	8	6
528	445	8	7
529	49	8	7
530	154	8	8
531	354	8	7
532	638	8	10
533	383	8	6
534	213	8	10
535	630	8	10
536	162	8	10
537	308	8	6
538	351	8	8
539	218	8	10
540	30	8	10
541	425	9	7
542	378	9	9
543	444	9	10
544	519	9	10
545	287	9	10
546	542	9	7
547	637	9	7
548	22	9	10
549	113	9	10
550	536	9	8
551	276	9	10
552	328	9	10
553	598	9	10
554	534	9	10
555	240	9	10
556	245	9	10
557	580	9	10
558	146	9	7
559	234	9	7
560	572	9	9
561	133	9	7
562	34	9	9
563	359	9	10
564	383	9	9
565	417	9	8
566	607	9	9
567	24	9	7
568	149	9	7
569	439	9	10
570	206	9	7
571	499	9	8
572	635	9	9
573	367	9	9
574	472	9	8
575	307	9	8
576	265	9	6
577	143	9	10
578	530	9	8
579	583	9	8
580	114	9	10
581	406	9	10
582	210	9	9
583	77	9	8
584	65	9	8
585	279	9	7
586	409	9	10
587	64	9	10
588	104	9	8
589	437	9	10
590	152	9	6
591	311	9	7
592	550	9	9
593	445	9	10
594	49	9	10
595	325	9	10
596	168	9	8
597	288	9	8
598	626	9	10
599	627	9	9
600	388	9	7
601	275	9	8
602	102	9	10
603	313	9	7
604	504	9	8
605	58	9	8
606	126	9	8
607	269	9	8
608	663	9	10
609	272	9	7
610	480	9	9
611	195	9	10
612	548	9	8
613	483	9	10
614	68	9	10
615	23	9	10
616	351	9	8
617	344	9	9
618	249	10	10
619	83	10	8
620	105	10	8
621	617	10	8
622	412	10	8
623	295	10	7
624	553	10	10
625	187	10	7
626	668	10	9
627	330	10	10
628	643	10	8
629	544	10	10
630	274	10	7
631	619	10	10
632	245	10	7
633	375	10	7
634	141	10	8
635	644	10	9
636	508	10	9
637	98	10	9
638	94	10	7
639	430	10	10
640	91	10	10
641	426	10	8
642	481	10	10
643	95	10	10
644	55	10	6
645	383	10	8
646	584	10	9
647	400	10	10
648	326	10	10
649	149	10	10
650	145	10	8
651	292	10	7
652	290	10	8
653	72	10	10
654	365	10	10
655	493	10	8
656	341	10	7
657	472	10	10
658	186	10	8
659	496	10	10
660	296	10	10
661	56	10	9
662	289	10	10
663	476	10	7
664	25	10	9
665	409	10	10
666	20	10	10
667	561	10	10
668	28	10	9
669	398	10	9
670	228	10	7
671	256	10	10
672	550	10	10
673	390	10	10
674	337	10	9
675	42	10	9
676	523	10	8
677	489	10	7
678	31	10	10
679	445	10	10
680	325	10	10
681	429	10	9
682	354	10	7
683	600	10	8
684	281	10	10
685	403	10	9
686	127	10	9
687	127	10	10
688	16	10	7
689	271	10	10
690	626	10	10
691	383	10	9
692	251	10	10
693	238	10	8
694	436	10	8
695	250	10	7
696	161	10	8
697	462	10	8
698	344	10	7
699	569	10	9
700	209	11	6
701	444	11	7
702	412	11	10
703	443	11	8
704	363	11	7
705	61	11	10
706	201	11	10
707	169	11	9
708	542	11	10
709	632	11	7
710	558	11	8
711	420	11	10
712	544	11	8
713	78	11	8
714	619	11	8
715	174	11	8
716	392	11	10
717	549	11	7
718	45	11	8
719	224	11	10
720	508	11	10
721	41	11	10
722	415	11	9
723	285	11	8
724	91	11	9
725	419	11	6
726	605	11	7
727	531	11	7
728	207	11	8
729	399	11	10
730	216	11	7
731	253	11	9
732	467	11	9
733	4	11	8
734	457	11	7
735	468	11	7
736	7	11	9
737	50	11	7
738	307	11	6
739	89	11	7
740	496	11	10
741	123	11	6
742	432	11	8
743	88	11	7
744	77	11	9
745	369	11	8
746	51	11	8
747	537	11	8
748	122	11	10
749	517	11	8
750	339	11	10
751	257	11	10
752	612	11	10
753	138	11	10
754	139	11	7
755	335	11	9
756	475	11	10
757	53	11	7
758	8	11	6
759	338	11	10
760	337	11	7
761	620	11	8
762	445	11	10
763	151	11	7
764	275	11	9
765	585	11	10
766	403	11	9
767	581	11	10
768	626	11	9
769	251	11	10
770	148	11	9
771	459	11	9
772	672	12	9
773	535	12	10
774	625	12	9
775	61	12	9
776	287	12	10
777	6	12	9
778	364	12	7
779	183	12	7
780	503	12	10
781	386	12	9
782	173	12	7
783	2	12	7
784	234	12	7
785	460	12	9
786	606	12	6
787	513	12	8
788	121	12	7
789	242	12	10
790	49	12	10
791	54	12	10
792	298	12	9
793	290	12	10
794	502	12	10
795	192	12	9
796	367	12	7
797	458	12	6
798	465	12	10
799	446	12	7
800	89	12	10
801	82	12	8
802	396	12	10
803	289	12	8
804	505	12	9
805	59	12	10
806	26	12	7
807	394	12	7
808	88	12	7
809	579	12	8
810	297	12	10
811	15	12	10
812	476	12	10
813	339	12	9
814	155	12	8
815	232	12	9
816	229	12	8
817	621	12	7
818	620	12	8
819	31	12	7
820	198	12	6
821	288	12	10
822	47	12	6
823	495	12	9
824	638	12	9
825	592	12	8
826	388	12	9
827	485	12	9
828	585	12	7
829	653	12	9
830	383	12	9
831	342	12	9
832	166	12	9
833	35	12	10
834	368	12	6
835	483	12	10
836	349	12	7
837	650	12	7
838	525	12	8
839	355	12	10
840	329	12	10
841	407	12	8
842	551	13	10
843	405	13	7
844	588	13	6
845	378	13	7
846	308	13	10
847	625	13	10
848	295	13	10
849	577	13	7
850	479	13	8
851	385	13	9
852	486	13	10
853	287	13	10
854	659	13	9
855	201	13	7
856	305	13	10
857	203	13	7
858	534	13	7
859	274	13	10
860	319	13	10
861	521	13	7
862	146	13	9
863	524	13	7
864	574	13	10
865	456	13	10
866	512	13	7
867	102	13	9
868	418	13	7
869	648	13	10
870	381	13	10
871	44	13	7
872	80	13	10
873	223	13	7
874	244	13	7
875	346	13	8
876	633	13	9
877	610	13	7
878	298	13	7
879	635	13	10
880	493	13	7
881	589	13	10
882	383	13	5
883	7	13	10
884	446	13	8
885	153	13	10
886	370	13	10
887	324	13	10
888	123	13	8
889	448	13	9
890	156	13	6
891	552	13	10
892	331	13	10
893	339	13	6
894	527	13	10
895	28	13	8
896	139	13	7
897	256	13	8
898	104	13	10
899	540	13	8
900	150	13	10
901	390	13	7
902	130	13	10
903	17	13	10
904	154	13	9
905	258	13	7
906	261	13	7
907	653	13	10
908	609	13	10
909	36	13	9
910	471	13	10
911	626	13	9
912	329	13	7
913	407	13	9
914	556	14	10
915	249	14	9
916	105	14	9
917	478	14	8
918	412	14	10
919	577	14	7
920	268	14	10
921	441	14	10
922	323	14	7
923	203	14	10
924	598	14	10
925	215	14	7
926	534	14	10
927	274	14	10
928	319	14	9
929	433	14	10
930	141	14	7
931	312	14	9
932	549	14	8
933	408	14	10
934	521	14	7
935	45	14	7
936	146	14	6
937	224	14	10
938	415	14	10
939	560	14	8
940	369	14	10
941	317	14	8
942	220	14	9
943	34	14	9
944	233	14	8
945	383	14	6
946	584	14	6
947	547	14	10
948	244	14	9
949	326	14	10
950	237	14	8
951	336	14	9
952	357	14	10
953	298	14	10
954	290	14	8
955	37	14	10
956	383	14	7
957	230	14	10
958	623	14	9
959	282	14	6
960	153	14	10
961	93	14	6
962	453	14	8
963	324	14	9
964	227	14	10
965	26	14	10
966	369	14	7
967	297	14	8
968	106	14	10
969	552	14	10
970	361	14	10
971	20	14	6
972	482	14	8
973	155	14	9
974	260	14	10
975	8	14	9
976	538	14	7
977	152	14	10
978	63	14	7
979	159	14	10
980	168	14	9
981	352	14	7
982	163	14	8
983	342	14	8
984	11	14	8
985	626	14	10
986	459	14	10
987	617	15	10
988	169	15	7
989	322	15	9
990	204	15	9
991	328	15	10
992	599	15	10
993	386	15	10
994	392	15	8
995	642	15	8
996	345	15	9
997	120	15	10
998	521	15	7
999	510	15	9
1000	284	15	7
1001	2	15	8
1002	94	15	10
1003	310	15	8
1004	176	15	7
1005	418	15	8
1006	60	15	10
1007	55	15	10
1008	223	15	10
1009	607	15	10
1010	74	15	10
1011	427	15	9
1012	346	15	10
1013	49	15	7
1014	217	15	9
1015	635	15	10
1016	118	15	9
1017	438	15	10
1018	327	15	10
1019	365	15	6
1020	624	15	8
1021	468	15	10
1022	664	15	8
1023	431	15	9
1024	199	15	7
1025	423	15	10
1026	26	15	10
1027	299	15	7
1028	136	15	8
1029	25	15	7
1030	611	15	8
1031	475	15	8
1032	53	15	10
1033	8	15	7
1034	383	15	10
1035	125	15	10
1036	81	15	8
1037	157	15	8
1038	17	15	8
1039	100	15	7
1040	13	15	6
1041	178	15	10
1042	383	15	6
1043	385	15	10
1044	62	15	9
1045	275	15	7
1046	473	15	10
1047	190	15	9
1048	313	15	7
1049	40	15	9
1050	536	15	9
1051	126	15	10
1052	269	15	10
1053	263	15	8
1054	350	15	10
1055	148	15	10
1056	591	15	7
1057	650	15	7
1058	526	15	10
1059	522	16	7
1060	479	16	8
1061	542	16	7
1062	187	16	8
1063	364	16	10
1064	189	16	7
1065	22	16	10
1066	544	16	8
1067	262	16	8
1068	536	16	8
1069	447	16	10
1070	580	16	8
1071	375	16	7
1072	597	16	7
1073	146	16	7
1074	510	16	7
1075	115	16	10
1076	202	16	10
1077	508	16	7
1078	652	16	9
1079	91	16	10
1080	102	16	10
1081	590	16	9
1082	302	16	7
1083	243	16	10
1084	426	16	8
1085	584	16	7
1086	80	16	9
1087	237	16	8
1088	71	16	7
1089	383	16	10
1090	307	16	8
1091	370	16	7
1092	645	16	9
1093	227	16	10
1094	26	16	9
1095	406	16	10
1096	297	16	9
1097	332	16	8
1098	389	16	7
1099	395	16	10
1100	517	16	10
1101	232	16	7
1102	8	16	7
1103	383	16	7
1104	380	16	9
1105	628	16	10
1106	390	16	10
1107	621	16	7
1108	489	16	7
1109	31	16	10
1110	151	16	9
1111	288	16	10
1112	421	16	7
1113	626	16	10
1114	388	16	9
1115	504	16	9
1116	383	16	4
1117	626	16	8
1118	225	16	10
1119	250	16	8
1120	46	16	8
1121	546	16	10
1122	387	16	7
1123	218	16	10
1124	329	16	9
1125	424	17	9
1126	320	17	8
1127	657	17	10
1128	49	17	7
1129	116	17	9
1130	495	17	9
1131	276	17	10
1132	599	17	9
1133	173	17	10
1134	112	17	8
1135	392	17	10
1136	141	17	10
1137	597	17	10
1138	33	17	9
1139	508	17	9
1140	494	17	9
1141	94	17	7
1142	418	17	10
1143	220	17	10
1144	476	17	8
1145	618	17	8
1146	606	17	9
1147	165	17	7
1148	573	17	10
1149	55	17	8
1150	233	17	8
1151	244	17	8
1152	440	17	6
1153	336	17	9
1154	222	17	10
1155	634	17	9
1156	278	17	8
1157	253	17	10
1158	491	17	7
1159	327	17	8
1160	383	17	6
1161	624	17	7
1162	472	17	7
1163	50	17	7
1164	364	17	9
1165	185	17	9
1166	474	17	9
1167	423	17	10
1168	26	17	10
1169	406	17	6
1170	88	17	7
1171	136	17	10
1172	51	17	9
1173	362	17	10
1174	537	17	8
1175	379	17	9
1176	389	17	7
1177	395	17	10
1178	360	17	7
1179	475	17	10
1180	536	17	10
1181	8	17	10
1182	125	17	9
1183	311	17	10
1184	390	17	10
1185	159	17	9
1186	197	17	7
1187	639	17	9
1188	175	17	10
1189	485	17	10
1190	219	17	8
1191	190	17	7
1192	658	17	6
1193	383	17	9
1194	548	17	7
1195	368	17	10
1196	603	17	9
1197	161	17	8
1198	469	17	8
1199	76	17	9
1200	188	18	10
1201	107	18	7
1202	83	18	9
1203	201	18	10
1204	268	18	10
1205	169	18	8
1206	187	18	9
1207	211	18	7
1208	330	18	9
1209	667	18	10
1210	477	18	10
1211	495	18	8
1212	536	18	9
1213	174	18	7
1214	375	18	7
1215	642	18	8
1216	501	18	10
1217	494	18	10
1218	496	18	7
1219	574	18	10
1220	60	18	7
1221	419	18	6
1222	340	18	7
1223	573	18	7
1224	513	18	9
1225	531	18	10
1226	304	18	10
1227	24	18	10
1228	393	18	10
1229	383	18	8
1230	633	18	7
1231	383	18	6
1232	265	18	7
1233	153	18	8
1234	124	18	7
1235	494	18	9
1236	324	18	9
1237	123	18	8
1238	601	18	9
1239	448	18	10
1240	537	18	10
1241	339	18	8
1242	646	18	9
1243	139	18	7
1244	92	18	10
1245	347	18	10
1246	538	18	8
1247	390	18	10
1248	130	18	9
1249	151	18	10
1250	626	18	8
1251	87	18	7
1252	592	18	9
1253	275	18	7
1254	600	18	9
1255	536	18	10
1256	504	18	8
1257	567	18	10
1258	663	18	7
1259	364	18	9
1260	272	18	9
1261	626	18	10
1262	263	18	8
1263	591	18	10
1264	250	18	7
1265	466	18	9
1266	349	18	10
1267	450	18	10
1268	551	19	10
1269	105	19	7
1270	625	19	10
1271	443	19	7
1272	659	19	10
1273	204	19	8
1274	477	19	7
1275	262	19	8
1276	598	19	9
1277	599	19	10
1278	240	19	8
1279	306	19	9
1280	408	19	9
1281	597	19	10
1282	629	19	6
1283	501	19	10
1284	315	19	10
1285	560	19	10
1286	369	19	8
1287	60	19	10
1288	419	19	7
1289	34	19	7
1290	573	19	10
1291	531	19	10
1292	74	19	9
1293	145	19	10
1294	222	19	7
1295	96	19	6
1296	301	19	9
1297	54	19	7
1298	491	19	9
1299	383	19	8
1300	468	19	10
1301	10	19	8
1302	153	19	10
1303	496	19	6
1304	324	19	10
1305	608	19	8
1306	117	19	7
1307	382	19	9
1308	394	19	10
1309	406	19	10
1310	384	19	10
1311	582	19	9
1312	98	19	9
1313	134	19	7
1314	409	19	9
1315	20	19	10
1316	527	19	9
1317	139	19	10
1318	256	19	10
1319	103	19	9
1320	611	19	10
1321	316	19	9
1322	232	19	9
1323	628	19	10
1324	267	19	8
1325	157	19	9
1326	523	19	10
1327	62	19	8
1328	586	19	7
1329	485	19	6
1330	275	19	8
1331	585	19	8
1332	308	19	9
1333	127	19	10
1334	515	19	8
1335	383	19	9
1336	195	19	8
1337	548	19	7
1338	483	19	6
1339	630	19	8
1340	250	19	10
1341	349	19	10
1342	522	20	9
1343	209	20	8
1344	411	20	10
1345	479	20	10
1346	557	20	10
1347	189	20	10
1348	113	20	9
1349	495	20	10
1350	666	20	10
1351	536	20	10
1352	203	20	9
1353	274	20	10
1354	619	20	9
1355	174	20	10
1356	177	20	10
1357	508	20	8
1358	415	20	7
1359	456	20	6
1360	285	20	10
1361	102	20	7
1362	176	20	9
1363	359	20	10
1364	383	20	6
1365	326	20	7
1366	149	20	10
1367	145	20	8
1368	254	20	9
1369	499	20	9
1370	172	20	10
1371	192	20	8
1372	365	20	7
1373	230	20	10
1374	318	20	9
1375	496	20	10
1376	199	20	8
1377	520	20	7
1378	432	20	9
1379	167	20	8
1380	601	20	9
1381	88	20	9
1382	98	20	7
1383	122	20	7
1384	200	20	9
1385	155	20	9
1386	402	20	9
1387	229	20	8
1388	81	20	8
1389	79	20	7
1390	366	20	9
1391	523	20	10
1392	270	20	7
1393	235	20	10
1394	275	20	10
1395	585	20	10
1396	40	20	9
1397	36	20	9
1398	364	20	10
1399	516	20	10
1400	277	20	9
1401	507	20	10
1402	343	20	9
1403	483	20	8
1404	46	20	10
1405	23	20	8
1406	450	20	7
1407	425	21	10
1408	444	21	8
1409	413	21	10
1410	553	21	7
1411	385	21	9
1412	226	21	10
1413	1	21	10
1414	632	21	10
1415	364	21	10
1416	189	21	10
1417	73	21	7
1418	333	21	6
1419	558	21	7
1420	544	21	7
1421	414	21	8
1422	666	21	10
1423	511	21	9
1424	240	21	10
1425	112	21	10
1426	174	21	10
1427	373	21	9
1428	565	21	10
1429	642	21	7
1430	141	21	10
1431	564	21	10
1432	120	21	8
1433	510	21	6
1434	284	21	7
1435	428	21	6
1436	94	21	9
1437	476	21	9
1438	193	21	9
1439	494	21	7
1440	383	21	9
1441	80	21	8
1442	454	21	10
1443	399	21	9
1444	259	21	6
1445	239	21	9
1446	9	21	9
1447	5	21	8
1448	463	21	10
1449	348	21	10
1450	493	21	10
1451	383	21	8
1452	576	21	9
1453	341	21	7
1454	554	21	8
1455	89	21	10
1456	492	21	10
1457	296	21	10
1458	487	21	8
1459	69	21	10
1460	227	21	8
1461	372	21	7
1462	59	21	7
1463	432	21	10
1464	394	21	8
1465	299	21	7
1466	136	21	10
1467	371	21	8
1468	656	21	8
1469	75	21	10
1470	379	21	8
1471	20	21	10
1472	540	21	7
1473	347	21	8
1474	229	21	10
1475	311	21	9
1476	150	21	10
1477	669	21	6
1478	620	21	10
1479	198	21	10
1480	383	21	7
1481	616	21	9
1482	388	21	7
1483	219	21	9
1484	205	21	8
1485	261	21	8
1486	473	21	10
1487	281	21	7
1488	308	21	9
1489	383	21	10
1490	364	21	7
1491	166	21	9
1492	649	21	8
1493	630	21	9
1494	225	21	10
1495	250	21	10
1496	355	21	8
1497	30	21	10
1498	329	21	7
1499	407	21	10
1500	665	22	7
1501	659	22	9
1502	542	22	10
1503	441	22	7
1504	323	22	8
1505	414	22	10
1506	511	22	10
1507	536	22	8
1508	534	22	8
1509	386	22	10
1510	630	22	7
1511	314	22	10
1512	392	22	10
1513	245	22	10
1514	45	22	9
1515	494	22	7
1516	490	22	10
1517	255	22	7
1518	160	22	10
1519	496	22	9
1520	346	22	10
1521	147	22	8
1522	254	22	7
1523	393	22	7
1524	5	22	7
1525	610	22	8
1526	290	22	8
1527	502	22	6
1528	365	22	6
1529	493	22	10
1530	370	22	8
1531	56	22	10
1532	289	22	9
1533	26	22	8
1534	369	22	8
1535	656	22	8
1536	27	22	7
1537	156	22	7
1538	362	22	6
1539	303	22	7
1540	389	22	9
1541	612	22	8
1542	402	22	9
1543	540	22	9
1544	347	22	10
1545	63	22	9
1546	13	22	10
1547	616	22	10
1548	97	22	9
1549	12	22	7
1550	321	22	9
1551	58	22	8
1552	127	22	8
1553	342	22	7
1554	272	22	7
1555	471	22	9
1556	181	22	10
1557	68	22	10
1558	462	22	9
1559	543	22	10
1560	450	22	6
1561	640	22	10
1562	30	22	7
1563	339	22	9
\.


--
-- Data for Name: user_books; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.user_books (id, book_id, user_id, status) FROM stdin;
1	5	22	1
\.


--
-- Data for Name: user_tops; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.user_tops (id, user_id, book_id, pos) FROM stdin;
219	1	41	0
218	1	490	1
217	1	181	2
216	1	420	3
215	1	543	4
214	1	138	5
213	1	160	6
212	1	640	7
211	1	115	8
210	1	503	9
209	2	160	0
208	2	420	1
207	2	490	2
206	2	41	3
205	2	543	4
204	2	138	5
203	2	640	6
202	2	181	7
201	2	115	8
200	2	503	9
199	3	160	0
198	3	138	1
197	3	181	2
196	3	490	3
195	3	640	4
194	3	543	5
193	3	41	6
192	3	420	7
191	3	115	8
190	3	257	9
189	4	41	0
188	4	420	1
187	4	160	2
186	4	640	3
185	4	543	4
184	4	490	5
183	4	181	6
182	4	138	7
181	4	115	8
180	4	396	9
179	5	490	0
178	5	41	1
177	5	181	2
176	5	420	3
175	5	543	4
174	5	138	5
173	5	160	6
172	5	640	7
171	5	115	8
170	5	15	9
169	6	138	0
168	6	181	1
167	6	543	2
166	6	420	3
165	6	490	4
164	6	41	5
163	6	640	6
162	6	160	7
161	6	115	8
160	6	396	9
159	7	160	0
158	7	41	1
157	7	181	2
156	7	420	3
155	7	543	4
154	7	138	5
153	7	640	6
152	7	490	7
151	7	115	8
150	7	503	9
149	8	160	0
148	8	420	1
147	8	41	2
146	8	490	3
145	8	138	4
144	8	543	5
143	8	181	6
142	8	640	7
141	8	115	8
140	8	396	9
139	9	490	0
138	9	640	1
137	9	160	2
136	9	543	3
135	9	420	4
134	9	181	5
133	9	138	6
132	9	41	7
131	9	115	8
130	9	396	9
129	10	160	0
128	10	420	1
127	10	543	2
126	10	640	3
125	10	490	4
124	10	138	5
123	10	181	6
122	10	41	7
121	10	115	8
120	10	396	9
119	11	543	0
118	11	160	1
117	11	640	2
116	11	181	3
115	11	490	4
114	11	115	5
113	11	15	6
112	11	396	7
111	11	242	8
110	11	503	9
109	12	181	0
108	12	138	1
107	12	490	2
106	12	543	3
105	12	640	4
104	12	160	5
103	12	41	6
102	12	420	7
101	12	115	8
100	12	257	9
99	13	160	0
98	13	640	1
97	13	181	2
96	13	543	3
95	13	490	4
94	13	41	5
93	13	115	6
92	13	138	7
91	13	420	8
90	13	257	9
89	14	490	0
88	14	160	1
87	14	181	2
86	14	543	3
85	14	640	4
84	14	420	5
83	14	41	6
82	14	115	7
81	14	138	8
80	14	503	9
79	15	543	0
78	15	160	1
77	15	490	2
76	15	640	3
75	15	181	4
74	15	420	5
73	15	138	6
72	15	115	7
71	15	41	8
70	15	503	9
69	16	420	0
68	16	181	1
67	16	41	2
66	16	490	3
65	16	138	4
64	16	543	5
63	16	640	6
62	16	160	7
61	16	503	8
60	16	15	9
59	17	543	0
58	17	160	1
57	17	420	2
56	17	138	3
55	17	640	4
54	17	41	5
53	17	181	6
52	17	490	7
51	17	115	8
50	17	15	9
49	18	160	0
48	18	543	1
47	18	640	2
46	18	490	3
45	18	420	4
44	18	181	5
43	18	138	6
42	18	41	7
41	18	115	8
40	18	396	9
39	19	543	0
38	19	640	1
37	19	138	2
36	19	490	3
35	19	160	4
34	19	41	5
33	19	181	6
32	19	420	7
31	19	115	8
30	19	257	9
29	20	490	0
28	20	181	1
27	20	640	2
26	20	160	3
25	20	543	4
24	20	138	5
23	20	420	6
22	20	115	7
21	20	41	8
20	20	242	9
19	21	138	0
18	21	640	1
17	21	160	2
16	21	543	3
15	21	490	4
14	21	420	5
13	21	41	6
12	21	181	7
11	21	115	8
10	21	503	9
9	22	138	0
8	22	41	1
7	22	420	2
6	22	115	3
5	22	242	4
4	22	15	5
3	22	396	6
2	22	503	7
1	22	257	8
0	22	202	9
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mymmrac
--

COPY public.users (id, uid, username) FROM stdin;
1	6409921780	dkhotler0
2	6001899266	lbeathem1
3	8913953587	jgeharke2
4	4022786787	mtilio3
5	9481780112	lcandelin4
6	2756904198	measom5
7	5157477686	bgabbatt6
8	0349691355	gfenelon7
9	2800505133	gsanham8
10	1169199534	mgallegos9
11	2184011495	sspellinga
12	2760250555	kfaulkesb
13	4522514328	kheighoc
14	0507992830	egiraudod
15	9626178752	gdelape
16	4892379808	curlichf
17	7927754963	asandelsg
18	1744805792	ssweatlandh
19	0084331496	socahernyi
20	0768642957	lrankmorej
21	102501908249296932225	Test
22	113526589020499083968	mymmrac
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.author_id_seq', 504, true);


--
-- Name: books_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.books_author_id_seq', 1, false);


--
-- Name: books_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.books_genre_id_seq', 1, false);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.books_id_seq', 673, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.genre_id_seq', 60, true);


--
-- Name: libraries_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.libraries_city_id_seq', 1, false);


--
-- Name: libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.libraries_id_seq', 1, false);


--
-- Name: ratings_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.ratings_book_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1563, true);


--
-- Name: ratings_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.ratings_user_id_seq', 1, false);


--
-- Name: user_books_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.user_books_author_id_seq', 1, false);


--
-- Name: user_books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.user_books_book_id_seq', 1, false);


--
-- Name: user_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.user_books_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mymmrac
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- Name: authors author_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- Name: books books_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pk PRIMARY KEY (id);


--
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- Name: genres genre_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);


--
-- Name: libraries libraries_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pk PRIMARY KEY (id);


--
-- Name: ratings ratings_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pk PRIMARY KEY (id);


--
-- Name: user_books user_books_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books
    ADD CONSTRAINT user_books_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: author_name_uindex; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE UNIQUE INDEX author_name_uindex ON public.authors USING btree (name);


--
-- Name: books_name_uindex; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE UNIQUE INDEX books_name_uindex ON public.books USING btree (name);


--
-- Name: genre_name_uindex; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE UNIQUE INDEX genre_name_uindex ON public.genres USING btree (name);


--
-- Name: ix_public_user_tops_id; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE INDEX ix_public_user_tops_id ON public.user_tops USING btree (id);


--
-- Name: users_uid_uindex; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE UNIQUE INDEX users_uid_uindex ON public.users USING btree (uid);


--
-- Name: users_username_uindex; Type: INDEX; Schema: public; Owner: mymmrac
--

CREATE UNIQUE INDEX users_username_uindex ON public.users USING btree (username);


--
-- Name: books books_authors_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_authors_id_fk FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: books books_genres_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_genres_id_fk FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: libraries libraries_cities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_cities_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: ratings ratings_books_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_books_id_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: ratings ratings_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_books user_books_books_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books
    ADD CONSTRAINT user_books_books_id_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: user_books user_books_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: mymmrac
--

ALTER TABLE ONLY public.user_books
    ADD CONSTRAINT user_books_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

