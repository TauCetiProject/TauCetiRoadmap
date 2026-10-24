# Roadmap: classical Euclidean plane geometry from the 1000+ theorems list

**Summary.** The theorems of classical plane geometry (triangles, circles, quadrilaterals and
the incidence theorems of the projective plane) that are listed in the
[1000+ theorems project](https://1000-plus.github.io/) and have no Mathlib declaration in
Mathlib's `docs/1000.yaml`. There are 45 of them. They rest directly on Mathlib's
`EuclideanGeometry` library, which already has circumcentres, incentres and excentres with their
tangency points, the nine-point circle, the Monge point and orthocentre, oriented and unoriented
angles, tangency of spheres, power of a point, poles and polars, inversion, Ptolemy, Stewart,
Apollonius and Ceva. The roadmap adds signed area and a few named constructions, then proves the
theorems in seven layers.

Each target is listed with its Wikidata identifier (the key used in `docs/1000.yaml`), so that
the yaml entry can be updated when the target is done.

## Scope and ownership

**In scope.** The 45 theorems below, in the stated generality, together with the definitions and
API lemmas they need (Layer 0).

**Out of scope, with the owner.**

- The isoperimetric theorem and other sharp inequalities belong to
  [Isoperimetry](../Isoperimetry/README.md). Brunn–Minkowski is already in Tau Ceti.
- The distance from a point to an affine subspace (school-curriculum form) is SchoolCurriculum
  Layer 6 (open roadmap PR #1429).
- Convex and discrete geometry (Jung, Blaschke selection, Kirszbraun, Kirchberger and
  Sylvester–Gallai results, Pick, the art gallery theorem), solid geometry (De Gua, Platonic
  solids, Cauchy rigidity), ruler-and-compass constructions (Gauss–Wantzel, angle trisection,
  Mohr–Mascheroni, Poncelet–Steiner), the axiomatic foundations (Pasch, crossbar, the
  independence of the parallel postulate) and Poncelet's closure theorem are not targets here.
  They are listed in the appendix as material for further roadmaps.

## What Mathlib already has (consume)

All names below are in the namespace `EuclideanGeometry` or `Affine.Simplex` unless written in
full, and were checked against Mathlib `715a03a9` (2026-10-12).

- Points and triangles: `Affine.Triangle ℝ P`, `circumcenter`, `circumradius`, `circumsphere`,
  `incenter`, `inradius`, `insphere`, `excenter`, `exsphere`, `touchpoint`, `ninePointCircle`,
  `eulerPoint`, `mongePoint`, `Affine.Triangle.orthocenter`, `Affine.Simplex.volume`.
- Angles: `∠` (`EuclideanGeometry.angle`), `∡` (`EuclideanGeometry.oangle`), the positive
  orientation `EuclideanGeometry.o` of an oriented plane, `Orientation.areaForm`,
  `Orientation.rotation`, angle bisection (`Mathlib/Geometry/Euclidean/Angle/Bisector.lean`).
- Circles: `Sphere`, `Cospherical`, `Concyclic`, `Sphere.IsTangentAt`, `Sphere.IsIntTangent`,
  `Sphere.IsExtTangent`, `Sphere.secondInter`, `Sphere.power`, `Sphere.pole`, `Sphere.polar`,
  `inversion`, Ptolemy (`mul_dist_add_mul_dist_eq_mul_dist_of_cospherical`).
- Affine geometry: `Collinear`, `Wbtw`, `Sbtw`, `AffineSubspace.SSameSide`, `AffineMap.lineMap`,
  `midpoint`, `AffineSubspace.Parallel`, Ceva
  (`Affine.Triangle.prod_eq_prod_one_sub_of_mem_line_point_lineMap`), `signedInfDist`.
- Similarity and congruence of point families: `Similar`, `Congruent`.
- Projective geometry: `Projectivization` (`ℙ k V`), `Projectivization.IsCollinear`,
  `QuadraticForm`.

Tau Ceti pins Mathlib `6b7abb3c76`; a target's claimant checks there that it is still missing.

**Open Mathlib pull requests on the same ground.** Menelaus (#39809), Varignon (#43702), Euler's
theorem in geometry (#44230), Feuerbach (#44236), Euler's quadrilateral theorem (#43745), the
parallel form of Desargues (#37456) and Pascal in the projective plane (#44986). Targets on this
ground take the names and shapes of those pull requests; if one lands, Tau Ceti's version is
deleted and Mathlib's is used.

## Conventions (pinned)

- Points live in a Euclidean affine space `P` with `[NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [MetricSpace P] [NormedAddTorsor V P]`. Plane statements add `[Fact (finrank ℝ V = 2)]`. A
  statement is stated in arbitrary dimension whenever it holds there (Euler's quadrilateral
  theorem, the angle bisector theorem, the hinge theorem).
- Statements that need an orientation add `[Module.Oriented ℝ V (Fin 2)]` and use
  `EuclideanGeometry.o`. "Counterclockwise" means positive signed area.
- A triangle is an `Affine.Triangle ℝ P`, or three named points with
  `AffineIndependent ℝ ![a, b, c]`. A quadrilateral or polygon is `p : Fin n → P`, indices mod `n`.
- Points on side lines are `AffineMap.lineMap` points, with the parameter convention of Mathlib's
  Ceva theorem: on the side opposite vertex `i` the point is
  `lineMap (t.points (i + 1)) (t.points (i + 2)) (r i)`.
- "Convex quadrilateral" means that the diagonals cross:
  `∃ x, Sbtw ℝ (p 0) x (p 2) ∧ Sbtw ℝ (p 1) x (p 3)`.
- A theorem that has a converse in the literature is proved in both directions, and degenerate
  cases are stated as hypotheses rather than excluded silently.

## The build, in layers

### Layer 0: signed area and named constructions

1. `signedArea a b c := (1/2) * o.areaForm (b -ᵥ a) (c -ᵥ a)`, with its basic API: invariance
   under cyclic permutation, sign change under transposition, additivity
   `signedArea a b c = signedArea p b c + signedArea a p c + signedArea a b p`, vanishing iff
   collinear, behaviour under `lineMap` on one side, and `|signedArea a b c|` equal to
   `Affine.Simplex.volume` of the triangle.
2. `polygonSignedArea (p : Fin n → P)` by the shoelace sum from `p 0`, independence of the base
   point, additivity when the polygon is cut along a diagonal, and agreement with `signedArea`
   for `n = 3`.
3. `equilateralApex x y`: the image of `y` under rotation by `-π/3` about `x` (the apex on the
   right of `x → y`, outward on every side of a counterclockwise triangle), and `napoleonCenter`,
   the centroid of `x`, `y` and that apex. API: the triangle is equilateral, and the reflected
   construction (rotation by `π/3`) gives the inward apex.
4. `squareCenter x y`: the centre of the square erected on the right of `x → y`, with the
   analogous API.
5. External and internal homothety centres of two circles with distinct radii
   (`lineMap c₁ c₂ (r₁ / (r₁ - r₂))` and `lineMap c₁ c₂ (r₁ / (r₁ + r₂))`), with the statement
   that the homothety of ratio `r₂ / r₁` (resp. `-r₂ / r₁`) about it maps the first circle to the
   second.
6. The length of the common external tangent of two circles, `√(d² - (r₁ - r₂)²)`, and the
   statement that it is the distance between the touch points of a common external tangent line
   when one exists.
7. Signed curvature of a circle in a configuration of mutually tangent circles: `1 / r` when the
   circle is externally tangent to the others, `-1 / r` when it contains them.

### Layer 1: affine theorems

These need no metric and are stated over a field `k` where possible.

1. **Intercept theorem** (Q3757563). Two lines through `a`; `b, b'` on the first, `c, c'` on the
   second, `a, b, c` not collinear, `line[b, c] ∥ line[b', c']`. Then there is `r` with
   `b' -ᵥ a = r • (b -ᵥ a)` and `c' -ᵥ a = r • (c -ᵥ a)`, hence the equal ratios of distances;
   and the converse.
2. **Menelaus's theorem** (Q193882). The three side points of the convention above are collinear
   iff `∏ i, r i = -∏ i, (1 - r i)`.
3. **Varignon's theorem** (Q1896455). The midpoints of the sides of any `p : Fin 4 → P` form a
   parallelogram; in the plane its signed area is half that of the quadrilateral.
4. **Thomsen's theorem** (Q19779530). In a triangle, start at a point of a side line and move
   successively parallel to the sides `ca`, `bc`, `ab`, `ca`, `bc`, `ab` to the next side line;
   after six moves the path returns to its start.

### Layer 2: triangle metric theorems

1. **Angle bisector theorem** (Q925854). If `Sbtw ℝ b d c` and `∠ b a d = ∠ d a c` then
   `dist b d * dist a c = dist d c * dist a b`; and the converse.
2. **Hinge theorem** (Q2607007). With `dist a b = dist a' b'`, `dist a c = dist a' c'`,
   `∠ b a c < ∠ b' a' c'` gives `dist b c < dist b' c'`; and the converse.
3. **Steiner–Lehmus theorem** (Q1631992). A triangle with two equal internal angle bisectors
   (measured from the vertex to the opposite side) is isosceles.
4. **Viviani's theorem** (Q852183). In an equilateral triangle, the sum of the distances from a
   point of the closed triangle to the three side lines is the height `√3 / 2 · side`.
5. **Van Schooten's theorem** (Q15844093). For `p` on the arc `bc` of the circumcircle of an
   equilateral triangle `abc` not containing `a`, `pa = pb + pc`.
6. **Pompeiu's theorem** (Q3534036). For an equilateral triangle `abc` and any point `p` of the
   plane, `pa ≤ pb + pc` (and cyclically), with equality iff `p` is on the arc `bc` of the
   circumcircle not containing `a`.
7. **Hjelmslev's theorem** (Q1720410). If `f` is an isometry from a line onto a line in the
   plane, the midpoints of the segments `[x, f x]` are collinear.
8. **Napoleon's theorem** (Q637418). For every three points `a b c`, the three
   `napoleonCenter`s on the sides `ab`, `bc`, `ca` form an equilateral triangle. The signed area
   of the outer Napoleon triangle minus that of the inner one equals `signedArea a b c`.
9. **Van Aubel's theorem** (Q594571). For every `p : Fin 4 → P`, the segments joining the
   `squareCenter`s on opposite sides have equal length and are perpendicular.
10. **Finsler–Hadwiger theorem** (Q15895894). For squares `abcd` and `ab'c'd'` with the common
    vertex `a` and the same orientation, the midpoints of `bd'` and `b'd` and the two centres
    form a square.
11. **Morley's trisector theorem** (Q913447). In a triangle `abc`, let `x` be the point on the
    same side of `line[b, c]` as `a` with `∠ x b c = ∠ a b c / 3` and `∠ x c b = ∠ a c b / 3`,
    and `y`, `z` likewise for the sides `ca` and `ab`. Then `xyz` is equilateral.

### Layer 3: signed area

1. **Theorem of the gnomon** (Q61163749). In a parallelogram `abcd`, for `p` on the diagonal
   `ac`, the two parallelograms cut off by the parallels to the sides through `p` that do not
   meet the diagonal have equal area.
2. **Pappus's area theorem** (Q3527044). For a triangle `abc` and vectors `u`, `w`, let the
   parallelograms be `c, a, a + u, c + u` and `b, c, c + w, b + w`, and let `h` be the
   intersection of the lines `line[a + u, c + u]` and `line[c + w, b + w]`. Then
   `o.areaForm (b -ᵥ a) (c -ᵥ h) = o.areaForm (a -ᵥ c) u + o.areaForm (c -ᵥ b) w`.
3. **Routh's theorem** (Q1789863). With `d = lineMap b c x`, `e = lineMap c a y`,
   `f = lineMap a b z` and `x, y, z ∈ (0, 1)`, the cevians `ad`, `be`, `cf` bound a triangle of
   signed area `(xyz - (1-x)(1-y)(1-z))² / ((1 - x + zx)(1 - y + xy)(1 - z + yz))` times
   `signedArea a b c`. (Ceva is the case where the numerator vanishes.)
4. **Anne's theorem** (Q15859323). For a convex quadrilateral `abcd` that is not a
   parallelogram, with diagonal midpoints `e`, `f`, the set of points `p` with
   `signedArea p a b + signedArea p c d = signedArea p b c + signedArea p d a` is the line `ef`.

### Layer 4: triangle centres and their circles

1. **Euler's theorem in geometry** (Q1423818). `dist O I ^ 2 = R * (R - 2 * r)`, hence `2r ≤ R`
   with equality iff the triangle is equilateral; the excircle forms
   `dist O Iᵢ ^ 2 = R * (R + 2 * rᵢ)`.
2. **Carnot's theorem** (Q1141747). The sum of the signed distances from the circumcentre to the
   three side lines, positive when the circumcentre and the opposite vertex are on the same side,
   is `R + r`.
3. **Feuerbach's theorem** (Q2190744). `t.insphere.IsIntTangent t.ninePointCircle` and, for each
   `i`, `t.ninePointCircle.IsExtTangent (t.exsphere {i})`.
4. **Conway circle theorem** (Q96375449). Extending each side beyond each of its endpoints by the
   length of the opposite side gives six points on a circle centred at the incentre, of radius
   `√(r² + s²)` with `s` the semiperimeter.
5. **Reuschle's theorem** (Q2013213). If the cevians `ad`, `be`, `cf` are concurrent, the circle
   through `d, e, f` meets the side lines again at `d', e', f'`, and `ad'`, `be'`, `cf'` are
   concurrent.
6. **Lester's theorem** (Q1631749). The three lines joining each vertex to the
   `equilateralApex` on the opposite side are concurrent (first Fermat point); for a scalene
   triangle, a point on the three lines to the inward apexes (second Fermat point), the first
   Fermat point, the nine-point centre and the circumcentre are concyclic.

### Layer 5: circles

1. **Butterfly theorem** (Q377047). For `m` the midpoint of a chord `pq`, chords `ab` and `cd`
   through `m`, and `x = ad ∩ pq`, `y = bc ∩ pq`, `m` is the midpoint of `xy`.
2. **Constant chord theorem** (Q60681777). Two circles meeting at `p` and `q`; for `a` on the
   first, the lines `ap` and `aq` meet the second again at `b` and `c`. Then `dist b c` does not
   depend on `a`.
3. **Miquel's theorem** (Q2449984) and the **pivot theorem** (Q2449984X). For points on the three
   side lines of a triangle, the three circles through a vertex and the two points on its
   adjacent sides have a common point; and the Miquel point of a complete quadrilateral (the
   circumcircles of the four triangles formed by four lines in general position concur).
4. **Clifford's circle theorems** (Q5132839). For four circles in general position through a
   common point, each three of them determine (by their pairwise second intersections) a circle,
   and these four circles concur; for five circles through a common point, the five points so
   obtained are concyclic.
5. **Five circles theorem** (Q5456213). For a pentagram, the circumcircles of the five triangles
   at its tips meet consecutively in five further points, which are concyclic.
6. **Casey's theorem** (Q1370316). For four circles internally tangent to a circle at points in
   this cyclic order, `t₁₂ t₃₄ + t₁₄ t₂₃ = t₁₃ t₂₄`, where `tᵢⱼ` is the common external tangent
   length of Layer 0. Ptolemy is the case of radius-zero circles.
7. **Descartes's theorem** (Q1196538). For four circles of positive radius, pairwise tangent at
   six distinct points, the signed curvatures satisfy `(Σ kᵢ)² = 2 Σ kᵢ²`.
8. **Monge's theorem** (Q2981012). For three circles with pairwise distinct radii, the three
   external homothety centres are collinear; so are any two internal centres and the third
   external one.
9. **Thébault's theorem** (Q2500408), problems I to III. (I) The centres of the squares erected
   outward on the sides of a parallelogram form a square. (II) For a square `abcd` and equilateral
   triangles `abe` and `bcf` erected on two adjacent sides, both inside or both outside the
   square, the triangle `def` is equilateral. (III, Sawayama–Thébault) For `d`
   on the side `bc`, the centres of the two circles tangent to `ad`, to `bc` and internally to
   the circumcircle are collinear with the incentre.

### Layer 6: cyclic and tangential quadrilaterals and polygons

1. **Pitot theorem** (Q2310718). A quadrilateral whose sides touch a circle at points of the
   sides has `ab + cd = bc + da`; and the converse for convex quadrilaterals.
2. **Newton's theorem** (Q15872491). In a quadrilateral whose sides touch a circle, the centre is
   collinear with the midpoints of the diagonals.
3. **Euler's quadrilateral theorem** (Q18630480). For every `p : Fin 4 → P`, in any dimension,
   the sum of the squares of the sides equals the sum of the squares of the diagonals plus four
   times the square of the distance between their midpoints.
4. **Brahmagupta theorem** (Q1425308). In a cyclic quadrilateral with perpendicular diagonals
   meeting at `m`, the line through `m` perpendicular to a side bisects the opposite side.
5. **Japanese theorem for concyclic quadrilaterals** (Q1683356). The incentres of the four
   triangles `p (i+1), p (i+2), p (i+3)` of a convex cyclic quadrilateral form a rectangle.
6. **Japanese theorem for concyclic polygons** (Q1317367). For a convex cyclic quadrilateral
   `abcd`, `r(abc) + r(acd) = r(abd) + r(bcd)`; for a convex cyclic `n`-gon, the sum of the
   inradii of the fan triangulation from vertex `j` does not depend on `j`, and the same holds
   for every triangulation by non-crossing diagonals.

### Layer 7: incidence theorems of the projective plane

Stated in `ℙ k (Fin 3 → k)` with `Projectivization.IsCollinear`, then specialised to the
Euclidean plane (when the relevant intersection points exist).

1. **Desargues's theorem** (Q841893). Over a division ring, two triangles in perspective from a
   point are in perspective from a line; and the converse. The parallel form in an affine plane
   (#37456) is a corollary.
2. **Pappus's hexagon theorem** (Q851166). Over a field, with `a₀ a₁ a₂` on one line and
   `b₀ b₁ b₂` on another, six distinct points none of which is on both lines, the three points
   `aᵢbⱼ ∩ aⱼbᵢ` are collinear.
3. **Pascal's theorem** (Q899002). Over a field of characteristic not two, for six distinct
   points on the conic of a nondegenerate quadratic form on `k³`, the three intersections of
   opposite sides of the hexagon are collinear. Corollary: six points on a circle of the
   Euclidean plane.
4. **Brianchon's theorem** (Q119450). Dually, for a hexagon whose six side lines are tangent to
   a nondegenerate conic, the three main diagonals are concurrent; deduced from Pascal through
   the polarity of the conic.

## Suggested Lean

`Suggested.lean` gives the Layer 0 definitions `signedArea`, `equilateralApex` and
`napoleonCenter` with real bodies, and sixteen theorem targets as `sorry`. It imports only
Mathlib and elaborates against Mathlib `715a03a9`.

## Ordering

Layer 0 first. Layers 1, 2 and 7 depend only on Layer 0 and Mathlib. Layer 3 depends on Layer 0.
Layer 4 uses Layer 2 (bisectors) and Layer 0. Layer 5 uses Layer 0 (homothety centres, tangent
lengths, curvatures). Layer 6 uses Layers 2 and 5. Within a layer the targets are independent.

## Provenance

The list is Mathlib's `docs/1000.yaml` (master, 2026-10-24): 1199 entries, of which 982 have no
`decl` or `decls` field. Of these, 207 were found in Tau Ceti or as targets of a merged or open
Tau Ceti roadmap; of the remaining 775, the 45 above are plane Euclidean or projective geometry
resting on existing Mathlib material. The others are listed in the appendix.

## References

- Coxeter and Greitzer, *Geometry Revisited*, MAA 1967 (Layers 2, 4, 5, 7).
- Johnson, *Advanced Euclidean Geometry*, Dover 1960 (Layers 4 and 5).
- Hartshorne, *Geometry: Euclid and Beyond*, Springer 2000 (Layers 1, 3 and 7).
- Each entry's Wikidata item, linked from <https://1000-plus.github.io/>.

## Appendix: the other 1000+ theorems without a Mathlib declaration

**This appendix is not part of the roadmap and lists no targets.** It records, grouped by arXiv
class, the 730 entries of `docs/1000.yaml` that have no Mathlib declaration, are not in Tau Ceti,
are not targets of an existing Tau Ceti roadmap, and are not in this roadmap. It is material for
further roadmaps; contributors should not work from it. The classification is approximate, some
entries may already be in Mathlib under a name the yaml file does not record, and the entries
outside mathematics proper are listed only for completeness.

| Area | Count | Entries |
| --- | ---: | --- |
| `math.CO` Combinatorics | 70 | 2-factor theorem; Abel's binomial theorem; Alspach's theorem; Aztec diamond theorem; Balinski's theorem; Baranyai's theorem; Beck's theorem (geometry); Behrend's theorem; Berge's theorem; BEST theorem; Bondy's theorem; Bondy–Chvátal theorem; Bregman–Minc inequality; Brooks's theorem; Bruck–Chowla–Ryser theorem; Cameron–Erdős theorem; de Bruijn's theorem; De Bruijn–Erdős theorem (graph theory); De Bruijn–Erdős theorem (incidence geometry); Dilworth's theorem; Dirac's theorem on chordal graphs; Erdős–Gallai theorem; Erdős–Pósa theorem; Erdős–Stone theorem; Euler's polyhedron theorem; Five color theorem; Four color theorem; Freiman's theorem; Frucht's theorem; Fáry's theorem; Galvin's theorem; Gomory's theorem; Graph structure theorem; Grinberg's theorem; Grötzsch's theorem; Hajnal–Szemerédi theorem; Halpern–Läuchli theorem; Kirchhoff's theorem; Kneser's theorem; Kruskal's tree theorem; Kövari–Sós–Turán theorem; Lagrange inversion theorem; Lagrange reversion theorem; MacMahon Master theorem; Milliken's tree theorem; Milliken–Taylor theorem; Mirsky–Newman theorem; Monsky's theorem; Mycielski's theorem; Ore's theorem; Perfect graph theorem; Planar separator theorem; Pólya enumeration theorem; Ringel–Youngs theorem; Robertson–Seymour theorem; Rédei's theorem; Schnyder's theorem; Schur's theorem; Schwenk's theorem; Sprague–Grundy theorem; Stanley's reciprocity theorem; Steinitz theorem; Strong perfect graph theorem; Symmetric hypergraph theorem; Szemerédi's theorem; Szemerédi–Trotter theorem; Theorem on friends and strangers; Tverberg's theorem; Wagner's theorem; Zeilberger–Bressoud theorem |
| `math.NT` Number theory | 67 | 15 and 290 theorems; Ankeny–Artin–Chowla theorem; Apéry's theorem; Artin–Verdier duality theorem; ATS theorem; Auxiliary polynomial theorem; Baker's theorem; Barban–Davenport–Halberstam theorem; Birch's theorem; Bombieri–Friedlander–Iwaniec theorem; Brun's theorem; Brun–Titchmarsh theorem; Carmichael's theorem; Chen's theorem; Chowla–Mordell theorem; Critical line theorem; Davenport–Schmidt theorem; Euler's theorem; Fermat polygonal number theorem; Fermat's Last Theorem; Ford's theorem; Franel–Landau theorem; Green–Tao theorem; Gross–Zagier theorem; Hardy's theorem; Hilbert–Waring theorem; Hurwitz's theorem (number theory); Jurkat–Richert theorem; Kaplansky's theorem on quadratic forms; Khinchin's theorem on Diophantine approximations; Kneser's addition theorem (combinatorics); Kronecker's theorem; Lafforgue's theorem; Lagrange's theorem (number theory); Lambek–Moser theorem; Lamé’s theorem; Landau prime ideal theorem; Linnik's theorem; Lochs's theorem; Maier's theorem; Manin–Drinfeld theorem; Mann's theorem; Mazur's control theorem; Mazur's torsion theorem; Midy's theorem; Mihăilescu's theorem; Minkowski–Hlawka theorem; Nicomachus's theorem; Odd number theorem; Pandya theorem; Perlis theorem; Proth's theorem; Ramanujan–Skolem's theorem; Reflection theorem; Robin's theorem; Rosser's theorem; Six exponentials theorem; Sophie Germain's theorem; Star of David theorem; Stark–Heegner theorem; Takagi existence theorem; Thabit ibn Qurra's theorem; Tunnell's theorem; Vantieghem's theorem; Vinogradov's theorem; Wolstenholme's theorem; Zsigmondy's theorem |
| `math.MG` Metric geometry | 49 | Alexandrov's uniqueness theorem; Alternate Interior Angles Theorem; Art gallery theorem; Banach–Tarski theorem; Bang's theorem; Barbier's theorem; Beckman–Quarles theorem; Beer's theorem; Blaschke selection theorem; Busemann's theorem; Cauchy's theorem (geometry); Chasles's theorem (disambiguation); Classification of Platonic solids; Crossbar theorem; Crystallographic restriction theorem; Dandelin's theorem; De Gua's theorem; Descartes's theorem on total angular defect; Dinostratus' theorem; Equal incircles theorem; Erdős–Anning theorem; Erdős–Nagy theorem; Euler's rotation theorem; Gauss–Wantzel theorem; Hadwiger's theorem; Ham sandwich theorem; Holditch's theorem; Impossibility of angle trisection; Independence of the parallel postulate; Joubert's theorem; Jung's theorem; Kawasaki's theorem; Kirchberger's theorem; Kirszbraun theorem; Mohr–Mascheroni theorem; Netto's theorem; Newton's theorem about ovals; Pappus's centroid theorem; Pasch's theorem; Pick's theorem; Pizza theorem; Poncelet's closure theorem; Poncelet–Steiner theorem; Saccheri–Legendre theorem; Separating axis theorem; Six circles theorem; Supporting hyperplane theorem; Sylvester–Gallai theorem; Wallace–Bolyai–Gerwien theorem |
| `math.CA` Classical analysis and ODEs | 46 | Abelian and Tauberian theorems; Absolute convergence theorem; Addition theorem; Analyst's traveling salesman theorem; Balian–Low theorem; Bernstein's theorem (approximation theory); Bernstein's theorem on monotone functions; Bohr–Mollerup theorem; Bolzano's theorem; Carathéodory's existence theorem; Cesàro's theorem; Convolution theorem; Denjoy–Carleman theorem; Denjoy–Luzin theorem; Final value theorem; Fraňková–Helly selection theorem; Froda's theorem; Fubini's theorem on differentiation; Fuchs's theorem; Gradient theorem; Hardy–Littlewood tauberian theorem; Helly's selection theorem; Helmholtz's theorems; Hobby–Rice theorem; Hölder's theorem; Increment theorem; Initial value theorem; Lauricella's theorem; Luzin's theorem; Malgrange–Zerner theorem; Multiplication theorem; Paley's theorem; Paley–Wiener theorem; Peano existence theorem; Riemann series theorem; Shift theorem; Silverman–Toeplitz theorem; Stahl's theorem; Stein–Strömberg theorem; Stolz–Cesàro theorem; Sturm–Picone comparison theorem; Van Vleck's theorem; Vitali–Hahn–Saks theorem; Whitney extension theorem; Zahorski theorem; Śleszyński–Pringsheim theorem |
| `math.CV` Complex variables | 40 | Akhiezer's theorem; Andreotti–Frankel theorem; Arakelyan's theorem; Area theorem (conformal mapping); Behnke–Stein theorem; Bloch's theorem (complex variables); Branching theorem; Carleson–Jacobs theorem; Carlson's theorem; Cartan's theorems A and B; Corona theorem; de Branges's theorem; Edge-of-the-wedge theorem; F. and M. Riesz theorem; Farrell–Markushevich theorem; Fatou's theorem; Grunsky's theorem; Hadamard three-circle theorem; Hartogs's theorem; Hartogs–Rosenthal theorem; Koebe 1/4 theorem; Laurent expansion theorem; Lindelöf's theorem; Liouville's theorem; Liouville's theorem (conformal mappings); Malgrange preparation theorem; Marden's theorem; Mergelyan's theorem; Nachbin's theorem; Ostrowski–Hadamard gap theorem; Picard theorem; Radó's theorem (harmonic functions); Remmert–Stein theorem; Riemann's theorem on removable singularities; Schwarz–Ahlfors–Pick theorem; Siu's semicontinuity theorem; Skoda–El Mir theorem; Sokhotski–Plemelj theorem; Uniformization theorem; Weierstrass–Casorati theorem |
| `math.PR` Probability | 40 | Anderson's theorem; Arrival theorem; Bapat–Beg theorem; Berry–Esséen theorem; Burke's theorem; Clark–Ocone theorem; Cox's theorem; Cramér's theorem (large deviations); Cramér’s decomposition theorem; Dawson–Gärtner theorem; Disintegration theorem; Donsker's theorem; Doob decomposition theorem; Doob's martingale convergence theorems; Doob–Meyer decomposition theorem; Dudley's theorem; Fisher–Tippett–Gnedenko theorem; Freidlin–Wentzell theorem; Glivenko's theorem (probability theory); Glivenko–Cantelli theorem; Gordon–Newell theorem; Hammersley–Clifford theorem; Helly–Bray theorem; Infinite monkey theorem; Jackson's theorem (queueing theory); Karhunen–Loève theorem; Kolmogorov's three-series theorem; Lukacs's proportion-sum independence theorem; Lyapunov's central limit theorem; Lévy's modulus of continuity theorem; Minlos's theorem; Parthasarathy's theorem; Price's theorem; Raikov's theorem; Sazonov's theorem; Sklar's theorem; Skorokhod's embedding theorem; Skorokhod's representation theorem; Structure theorem for Gaussian measures; Wold's theorem |
| `math.AG` Algebraic geometry | 39 | Abel's curve theorem; Abel–Jacobi theorem; Abhyankar–Moh theorem; AF+BG theorem; Appell–Humbert theorem; Arithmetic Riemann–Roch theorem; Birkhoff–Grothendieck theorem; Bézout's theorem; Castelnuovo theorem; Castelnuovo–de Franchis theorem; Cayley–Salmon theorem; Chevalley's structure theorem; Chow's theorem; Clifford's theorem on special divisors; Cramer's theorem (algebraic curves); Decomposition theorem of Beilinson, Bernstein and Deligne; Fulton–Hansen connectedness theorem; Grauert–Riemenschneider vanishing theorem; Grothendieck's connectedness theorem; Grothendieck–Hirzebruch–Riemann–Roch theorem; Haboush's theorem; Harnack's curve theorem; Hurwitz's automorphisms theorem; Katz–Lang finiteness theorem; Lefschetz hyperplane theorem; Lefschetz theorem on (1,1)-classes; Max Noether's theorem; Mumford vanishing theorem; Noether's theorem on rationality for surfaces; Ramanujam vanishing theorem; Rationality theorem; Reider's theorem; Riemann singularity theorem; Riemann–Roch theorem for surfaces; Sylvester pentahedral theorem; The duality theorem; Torelli theorem; Tsen's theorem; Weber's theorem (Algebraic curves) |
| `math.DG` Differential geometry | 35 | 2π theorem; Atiyah–Bott fixed-point theorem; Atiyah–Singer index theorem; Beltrami's theorem; Berger–Kazdan comparison theorem; Bertrand–Diquet–Puiseux theorem; Bonnet theorem; Cartan–Kuranishi prolongation theorem; Cartan–Kähler theorem; Cheng's eigenvalue comparison theorem; Chern–Gauss–Bonnet theorem; Fenchel's theorem; Four-vertex theorem; Gauss's Theorema Egregium; Gauss–Bonnet theorem; Geroch's splitting theorem; Goldberg–Sachs theorem; Gromov's compactness theorem (geometry); Gromov–Ruh theorem; Hilbert's theorem (differential geometry); Hirzebruch signature theorem; Lie–Palais theorem; Meusnier's theorem; Mostow rigidity theorem; Nash embedding theorem; Orbit theorem (Nagano–Sussmann); Positive energy theorem; Preimage theorem; Rashevsky–Chow theorem; Rauch comparison theorem; Reeb sphere theorem; Riemann–Roch theorem for smooth manifolds; Soul theorem; Toponogov's theorem; Whitney immersion theorem |
| `math.LO` Logic | 35 | Ax–Kochen theorem; Barwise compactness theorem; Borel determinacy theorem; Büchi-Elgot-Trakhtenbrot theorem; Church–Rosser theorem; Conservativity theorem; Craig's theorem; Cut-elimination theorem; Deduction theorem; Easton's theorem; Erdős–Dushnik–Miller theorem; Feferman–Vaught theorem; Glivenko's theorem; Goodstein's theorem; Gödel's completeness theorem; Gödel's incompleteness theorem; Herbrand's theorem; Independence of the axiom of choice; Independence of the continuum hypothesis; Isomorphism extension theorem; Kanamori–McAloon theorem; Kirby–Paris theorem; Lindström's theorem; Löb's theorem; Morley's categoricity theorem; Paris–Harrington theorem; Rice–Shapiro theorem; Richardson's theorem; Robinson's joint consistency theorem; Sahlqvist correspondence theorem; Soundness theorem; Stone's representation theorem for Boolean algebras; Tarski's undefinability theorem; Tennenbaum's theorem; Wilkie's theorem |
| `math.FA` Functional analysis | 31 | Babuška–Lax–Milgram theorem; Banach–Mazur theorem; Beurling–Lax theorem; Browder–Minty theorem; Caristi fixed-point theorem; Choquet–Bishop–de Leeuw theorem; Dunford–Schwartz theorem; Fixed-point theorems in infinite-dimensional spaces; Kachurovskii's theorem; Kolmogorov–Arnold representation theorem; Kuiper's theorem; Kōmura's theorem; Mazur–Ulam theorem; Mercer's theorem; Moore–Aronszajn theorem; Moreau's theorem; Mountain pass theorem; Müntz–Szász theorem; Nash–Moser theorem; Orlicz–Pettis theorem; Quotient of subspace theorem; Riesz–Fischer theorem; Ryll-Nardzewski fixed-point theorem; Stone's theorem on one-parameter unitary groups; Sz.-Nagy's dilation theorem; Szegő limit theorems; Tikhonov fixed-point theorem; Titchmarsh convolution theorem; Titchmarsh theorem; Tonelli's theorem (functional analysis); Wiener's tauberian theorem |
| `math.DS` Dynamical systems | 22 | Autonomous convergence theorem; Bendixson–Dulac theorem; Birkhoff's ergodic theorem; Curtis–Hedlund–Lyndon theorem; Floquet's theorem; Hartman–Grobman theorem; Kharitonov's theorem; Kolmogorov–Arnold–Moser theorem; Krylov–Bogolyubov theorem; Liénard's theorem; Lyapunov–Malkin theorem; Maharam's theorem; Markus−Yamabe theorem; Maximal ergodic theorem; No wandering domain theorem; Ornstein theorem; Oseledec theorem; Peixoto's theorem; Poincaré–Bendixson theorem; Routh–Hurwitz theorem; Sharkovskii's theorem; Takens's theorem |
| `math.GR` Group theory | 21 | Alperin–Brauer–Gorenstein theorem; Brauer–Suzuki theorem; Brauer–Suzuki–Wall theorem; Diller–Dress theorem; Feit–Thompson theorem; Fitting's theorem; Gromov's theorem on groups of polynomial growth; Higman's embedding theorem; Jordan's theorem (multiply transitive groups); Jordan–Schur theorem; L-balance theorem; Schreier refinement theorem; Sela's theorem; Stallings theorem about ends of groups; Thompson transitivity theorem; Thompson uniqueness theorem; Tits alternative; Trichotomy theorem; Walter theorem; Z* theorem; ZJ theorem |
| `math.RA` Rings and algebras | 19 | Amitsur–Levitzki theorem; Artin–Schreier theorem; Artin–Zorn theorem; Brauer–Cartan–Hua theorem; Exchange theorem; Gamas's Theorem; Goldie's theorem; Hurwitz's theorem (normed division algebras); Inverse eigenvalues theorem; Jacobson–Bourbaki theorem; Levitzky's theorem; Principal axis theorem; Regev's theorem; Rouché–Capelli theorem; Shirshov–Cohn theorem; Shirshov–Witt theorem; Solèr's theorem; Specht's theorem; Sylvester's theorem |
| `math.GT` Geometric topology | 15 | Bing's recognition theorem; Compression theorem; Donaldson's theorem; Fáry–Milnor theorem; Lickorish twist theorem; Lickorish–Wallace theorem; Novikov's compact leaf theorem; Reidemeister–Singer Theorem; Rokhlin's theorem; Scott core theorem; Stallings–Zeeman theorem; S–cobordism theorem; Tameness theorem; Waldhausen's theorem; Whitney–Graustein Theorem |
| `math.ST` Statistics theory | 9 | Basu's theorem; Cochran's theorem; Fieller's theorem; Gauss–Markov theorem; Le Cam's theorem; Lehmann–Scheffé theorem; Pickands–Balkema–de Haan theorem; Pitman–Koopman–Darmois theorem; Rao–Blackwell theorem |
| `math.RT` Representation theory | 8 | Borel–Bott–Weil theorem; Brauer's theorem on induced characters; Brauer's three main theorems; Chevalley–Shephard–Todd theorem; Frobenius determinant theorem; Great orthogonality theorem; Plancherel theorem for spherical functions; Trombi–Varadarajan theorem |
| `math.AT` Algebraic topology | 7 | Atiyah–Segal completion theorem; Borsuk–Ulam theorem; Freudenthal suspension theorem; Lefschetz–Hopf theorem; Nielsen fixed-point theorem; Simplicial approximation theorem; Vietoris–Begle mapping theorem |
| `math.OA` Operator algebras | 7 | Choi's theorem on completely positive maps; Commutation theorem; Fuglede's theorem; Schröder–Bernstein theorems for operator algebras; Stinespring factorization theorem; Von Neumann bicommutant theorem; Von Neumann's theorem |
| `math.OC` Optimization and control | 6 | Artstein's theorem; Danskin's theorem; Fenchel's duality theorem; Krener's theorem; Minimax theorem; Sion's minimax theorem |
| `math.AP` Analysis of PDEs | 5 | Bôcher's theorem; Cauchy–Kowalevski theorem; Lions–Lax–Milgram theorem; Malgrange–Ehrenpreis theorem; Saint-Venant's theorem |
| `math.IT` Information theory | 5 | Kraft–McMillan theorem; Nyquist–Shannon sampling theorem; Shannon's source coding theorem; Shannon's theorem; Shannon–Hartley theorem |
| `math.NA` Numerical analysis | 5 | Bauer–Fike theorem; Godunov's theorem; Kantorovich theorem; Lax–Richtmyer theorem; Lax–Wendroff theorem |
| `math.GN` General topology | 4 | Bing metrization theorem; Hahn–Mazurkiewicz theorem; Nagata–Smirnov metrization theorem; Parovicenko's theorem |
| `math.AC` Commutative algebra | 3 | Intersection theorem; Quillen–Suslin theorem; Unmixedness theorem |
| `math.SG` Symplectic geometry | 2 | Conley–Zehnder theorem; Lee Hwa Chung theorem |
| `math.CT` Category theory | 1 | Freyd's adjoint functor theorem |
| `math.GM` General mathematics | 1 | Symphonic theorem |
| `math.KT` K-theory and homology | 1 | Swan's theorem |
| `math.QA` Quantum algebra | 1 | Goddard–Thorn theorem |
| Outside mathematics proper (physics, economics, computer science) | 136 | Adiabatic theorem; Alchian–Allen theorem; Arrow's impossibility theorem; Arrow-Lind theorem; Aumann's agreement theorem; Bell's theorem; Betti's theorem; Birkhoff's theorem (relativity); Bishop–Cannings theorem; Blondel's theorem; Blum's speedup theorem; Bogoliubov–Parasyuk theorem; Bohr–van Leeuwen theorem; Bondareva–Shapley theorem; Buckingham π theorem; Byers–Yang theorem; C-theorem; CAP theorem; Carnot's theorem (thermodynamics); Castigliano's first and second theorems; Chomsky–Schützenberger enumeration theorem; Chomsky–Schützenberger representation theorem; Clapeyron's theorem; Clausius theorem; Cluster decomposition theorem; Coase theorem; Codd's theorem; Coleman–Mandula theorem; Cook's theorem; Courcelle's theorem; Crooks fluctuation theorem; Duggan–Schwartz theorem; Earnshaw's theorem; Edgeworth's limit theorem; Elitzur's theorem; Envelope theorem; Equipartition theorem; Faustman–Ohlin theorem; Fisher separation theorem; Fluctuation dissipation theorem; Fluctuation theorem; Folk theorem (game theory); Foster's theorem; Full employment theorem; Fundamental theorem of arbitrage-free pricing; Fundamental theorems of welfare economics; Furry's theorem; FWL theorem; Gell-Mann and Low theorem; Gibbard–Satterthwaite theorem; Goldstone's theorem; Gottesman–Knill theorem; H-theorem; Haag's theorem; Haag–Łopuszański–Sohnius theorem; Heckscher–Ohlin theorem; Hellmann–Feynman theorem; Helmholtz theorem (classical mechanics); Hohenberg–Kohn theorems; Holland's schema theorem; Holmström's theorem; Immerman–Szelepcsényi theorem; Karp–Lipton theorem; Kelvin's circulation theorem; Kinoshita–Lee–Nauenberg theorem; Kochen–Specker theorem; Kramers' theorem; Kuhn's theorem; Kutta–Joukowski theorem; Ladner's theorem; Lami's theorem; Lee–Yang theorem; Lerner symmetry theorem; Linear speedup theorem; Lovelock's theorem; Marginal value theorem; Master theorem (analysis of algorithms); Maximum power theorem; Maxwell's theorem; May's theorem; Mermin–Wagner theorem; Modigliani–Miller theorem; Moving equilibrium theorem; Mutual fund separation theorem; Nielsen–Ninomiya theorem; No free lunch theorem; No-broadcasting theorem; No-cloning theorem; No-communication theorem; No-deleting theorem; No-hair theorem; No-trade theorem; Noether's second theorem; Noether's theorem; Norton's theorem; Optical equivalence theorem; Optical theorem; Osterwalder–Schrader theorem; Parallel axis theorem; PCP theorem; Peeling theorem; Penrose–Hawking singularity theorems; Perpendicular axis theorem; Pomeranchuk's theorem; Poynting's theorem; Pseudorandom generator theorem; Quantum threshold theorem; Reeh–Schlieder theorem; Reversed compound agent theorem; Reynolds transport theorem; Rybczynski theorem; Savitch's theorem; Schaefer's dichotomy theorem; Shannon's expansion theorem; Shell theorem; Sipser–Lautemann theorem; Sonnenschein–Mantel–Debreu Theorem; Space hierarchy theorem; Spin–statistics theorem; Stolper–Samuelson theorem; Structured program theorem; Supersymmetry nonrenormalization theorems; Taylor–Proudman theorem; Theorem of three moments; Thévenin's theorem; Time hierarchy theorem; Toda's theorem; Topkis's theorem; Ugly duckling theorem; Universal approximation theorem; Vafa–Witten theorem; Valiant–Vazirani theorem; Virial theorem; Weinberg–Witten theorem; Wick's theorem; Wigner–Eckart theorem |
