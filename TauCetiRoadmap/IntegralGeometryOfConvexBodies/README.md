# Roadmap: integral geometry of convex bodies

**Summary.** This roadmap builds the deterministic integral geometry of convex bodies in
Euclidean space `ℝ^d`. The intrinsic volumes `V_0, …, V_d` are defined from the Steiner formula,
which says that the volume of the parallel body of a convex body at distance `ε` is a polynomial
in `ε`; they are additive, continuous for the Hausdorff metric and invariant under rigid
motions, and they extend by inclusion–exclusion to finite unions of convex bodies, where `V_0` is
the Euler characteristic. Hadwiger's theorem shows that every continuous, motion-invariant,
additive functional is a linear combination of the intrinsic volumes, with nonnegative
coefficients when it is increasing. With the invariant probabilities on the rotation group and
on the Grassmannians, and the invariant measures on affine flats and on rigid motions, the
roadmap proves the integral formulas of the subject: Crofton's formula for sections by random
flats, Kubota's formula for projections and Cauchy's formula for the mean width, the formula
for the intrinsic volumes of zonoids, Hadwiger's general kinematic theorem with the principal
and iterated kinematic formulas, the translative formulas for volume and surface area, and
their extensions to finite unions of convex bodies. These are the deterministic tools of
stochastic geometry: the mean values of Boolean models, of random flats and of tessellations,
and the stereological formulas, are the integral formulas of this roadmap taken in expectation.

[Isoperimetry](../Isoperimetry/README.md) supplies the identification of the derivative of the
parallel volume with the boundary area, which gives the surface-area form of `V_{d-1}`;
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) supplies the normalization of the
Hausdorff measures; [ConvexAnalysisAndDuality](../ConvexAnalysisAndDuality/README.md) supplies
the support function; and SpecialFunctionsHigherSpheres supplies the
Funk–Hecke formula used to represent smooth centrally symmetric bodies through zonoids in the
proof of Hadwiger's theorem. The roadmap is a synthesis of Schneider and Weil's monograph, of
Kiderlen's lectures, of the integral-geometric chapter of Adler and Taylor and of the survey of
Chiu, Stoyan, Kendall and Mecke; it follows none of them section by section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof
route for a corollary or adaptation, and Checks, which are sanity checks of the key definitions
and theorems. Layer 1 defines the intrinsic volumes and proves their elementary properties;
Layer 2 proves that they are continuous valuations and extends valuations to the convex ring;
Layer 3 is Hadwiger's characterization theorem. Layer 4 constructs the invariant measures and
uses only the definitions of Layer 1. Layer 5 uses Layers 3 and 4: Crofton's formula is proved
through Hadwiger's theorem, and the nonnegativity and monotonicity of the intrinsic volumes,
Kubota's formula, the mean width and the zonoid formulas follow from it. Layer 6 uses Layers 3
to 5, and Layer 7 combines Layer 6 with the extension of Layer 2.

## Conventions

- **Space.** `Eucl d` is `EuclideanSpace ℝ (Fin d)`, with Lebesgue measure `volume` and
  `volume.real` for finite volumes. A convex body is a compact convex set; theorems carry
  `IsCompact` and `Convex ℝ` hypotheses, and nonemptiness is a separate hypothesis where it is
  needed, so that intersections, which may be empty, need no case split. The Hausdorff metric is
  that of Mathlib's `ConvexBody`, the type of nonempty convex bodies.
- **Constants.** `κ_j = unitBallVolume j` is the volume of the unit ball of `ℝ^j`, with `κ_0 = 1`,
  and `c^r_s = kinematicConst r s = r! κ_r / (s! κ_s)`. The constant written `c^{r,s}_{p,q}` in
  Schneider and Weil is `c^r_p c^s_q`; it is spelled out as a product in every statement.
- **Intrinsic volumes.** `V_j = intrinsicVolume j` is a function on all sets: the Steiner
  polynomial of `K` is the interpolation polynomial of degree at most `d` of
  `ε ↦ V_d(K + ε B^d)` at `ε = 0, 1, …, d`, and `V_j(K)` is the coefficient of `ε^{d-j}` divided
  by `κ_{d-j}`, with `V_j = 0` for `j > d`. On convex bodies this is the Steiner coefficient; on
  the empty set it is `0`; on other sets it carries no meaning and is used only through the
  additive extension of 2.2. This is the normalization of Schneider–Weil (14.5)–(14.6), p. 600,
  and of Kiderlen (2.2), p. 23, in which `V_j` does not depend on the ambient dimension.
- **Hausdorff measure.** `μHE[k]` is Mathlib's `MeasureTheory.Measure.euclideanHausdorffMeasure`,
  normalized to agree with Lebesgue measure on `k`-planes, as in GeometricMeasureTheory and
  Isoperimetry.
- **Rotations.** The rotation group is `Matrix.orthogonalGroup (Fin d) ℝ`, the full orthogonal
  group, acting by `rot`, which is Tau Ceti's `TauCeti.orthogonalGroupToLinearIsometryEquiv`. The
  rotation probability `rotationMeasure d` is Tau Ceti's Euclidean Haar measure
  `TauCeti.orthogonalGroupMeasure` divided by its mass. Schneider and Weil integrate over the
  special orthogonal group and Adler and Taylor, (6.3.11)–(6.3.12), p. 145, over the full one;
  every formula of Layers 4 to 7 is the same for both, because the integrands are invariant under
  rotations and the image of the Haar probability of the special orthogonal group under
  inclusion, averaged with its image under one reflection, is the Haar probability of the full
  group.
- **Motion invariance.** The hypothesis `IsMotionInvariant` asks for invariance under proper
  rigid motions only (affine isometries whose linear part has determinant `1`), the hypothesis of
  Hadwiger's theorem in Schneider and Weil; the conclusions about `V_j` assert invariance under
  all affine isometries.
- **Flats and motions.** Affine `k`-flats are parametrized as `affineFlat k ϑ y = ϑ (L_k + y)`,
  with `L_k` the span of the first `k` coordinate vectors, `ϑ` a rotation and `y` a vector of the
  last `d - k` coordinates; rigid motions as `motion ϑ t x = ϑ x + t`. The invariant measures
  `flatMeasure d k` and `motionMeasure d` are products of the rotation probability and Lebesgue
  measure on the parameters, the form (13.8)–(13.9) of Schneider and Weil, p. 587–588; no
  quotient space is formed, and the uniqueness of these measures is stated through 4.1–4.2.
- **Integrals.** Integrands of signed functionals are Bochner integrals, and every theorem that
  integrates one asserts its integrability as a conclusion.
- **Support function.** `h_K(u)` is the support function of ConvexAnalysisAndDuality §2.1,
  `supportFunction (innerₗ (Eucl d)) K u`, an extended real that is finite for nonempty compact
  `K`; it is read as a real number through `EReal.toReal` only for nonempty compact `K`.

## Layer 1: the Steiner formula and the intrinsic volumes

### 1.1 Constants

Sources: Schneider–Weil p. 171 (the identity `m! κ_m = 2^m π^{(m-1)/2} Γ((m + 1)/2)`) and
p. 172 (the constants of the Crofton formula); Chiu et al. (1.22)–(1.24), p. 12.

- **Definitions** (`unitBallVolume`, `kinematicConst`): `κ_j` and `c^r_s` as in the Conventions.
- **Closed forms** (`unitBallVolume_eq_and_kinematicConst_eq`): `κ_j = π^{j/2} / Γ(j/2 + 1)`, and
  `c^r_s = (2√π)^{r - s} Γ((r + 1)/2) / Γ((s + 1)/2)` with an integer exponent. Route: the first
  is `EuclideanSpace.volume_closedBall` (for `j = 0` the space is a point), and the second follows
  from the first and the duplication formula `Real.Gamma_mul_Gamma_add_half`. Schneider and Weil
  print the second form on p. 172 without the factor `(2√π)^{r - s}`.

**Checks.**
- `κ_0, κ_1, κ_2, κ_3 = 1, 2, π, 4π/3`, and `κ_4 = π²/2 = 4.93480`.
- `c^1_0 = 2`; the form printed on p. 172 gives `Γ(1)/Γ(1/2) = 1/√π = 0.56419`, so the factor
  `(2√π)^{r-s}` is needed (negative control).
- `c^1_1 c^1_2 = 2/π` and `c^2_1 c^2_3 = π/4`, the constants of Crofton's formula for lines in the
  plane and for planes in space.

### 1.2 The Steiner formula

Sources: Schneider–Weil (14.5)–(14.6), p. 600; Kiderlen (2.2), p. 23; Adler–Taylor (6.3.3)–(6.3.4),
p. 142; Chiu et al. (1.28)–(1.31), p. 14.

- **Definitions** (`steinerPolynomial`, `intrinsicVolume`): as in the Conventions.
- **Steiner formula** (`steiner_formula`): for a convex body `K` and `ε ≥ 0`,
  `V_d(K + ε B^d) = ∑_{j=0}^{d} ε^{d-j} κ_{d-j} V_j(K)`. Route: Schneider–Weil derive it for
  polytopes by decomposing the parallel body over the normal cones of the faces and pass to
  convex bodies by continuity of the volume; with the interpolation definition the content of the
  theorem is that `ε ↦ V_d(K + ε B^d)` is a polynomial of degree at most `d` on `[0, ∞)`.
- **Volume** (`intrinsicVolume_top`): `V_d(K) = volume.real K` for a convex body; the constant
  term of the Steiner polynomial.

**Checks.**
- For a box with sides `a, b, c` in `ℝ³`, `V_0, …, V_3 = 1, a + b + c, ab + bc + ca, abc`, the
  elementary symmetric functions of the sides.
- For the unit square, `V_2(K + ε B²) = 1 + 4ε + π ε²`, so `V_1 = 2` is half the perimeter.
- Negative control: for the L-shaped union of three unit squares, the coefficient of `ε²` of the
  parallel area is `5π/4 - 1 = 2.92699`, not `π V_0 = π`; the parallel volume of a non-convex set
  is not given by the Steiner formula, and the intrinsic volumes of such sets are defined by
  inclusion–exclusion in 2.2 instead.

### 1.3 Invariance, homogeneity and the ball

Sources: Schneider–Weil p. 600 (independence of the dimension) and the property list of p. 601;
(14.8), p. 601, for the ball; Kiderlen p. 23; Chiu et al. Table 1.1, p. 13.

- **Rigid motions** (`intrinsicVolume_image_affineIsometryEquiv`): `V_j(f K) = V_j(K)` for every
  affine isometry `f` and every set `K`. Route: `f (K + ε B^d) = f K + ε B^d` and `f` preserves
  volume (Mathlib's `LinearIsometryEquiv.measurePreserving` and translation invariance), so the
  interpolation data agree.
- **Homogeneity** (`intrinsicVolume_smul`): `V_j(t K) = t^j V_j(K)` for a convex body `K` and
  `t ≥ 0`. Route: `t K + ε B^d = t (K + (ε/t) B^d)` and the Steiner formula.
- **Ball** (`intrinsicVolume_ball`): `V_j(B^d) = (d choose j) κ_d / κ_{d-j}` for `j ≤ d`.
- **Euler characteristic of a body** (`intrinsicVolume_zero`): `V_0(K) = 1` for a nonempty convex
  body. Route: divide the Steiner formula by `ε^d κ_d` and let `ε → ∞`.
- **Dimension independence** (`intrinsicVolume_linearIsometry`): for a linear isometric
  embedding `e : ℝ^d → ℝ^n` and a convex body `K`, `V_j(e K) = V_j(K)`. Route: the parallel body
  of `e K` in `ℝ^n` fibres over `e K + ε B^d` in the image of `e`, with fibres the balls of the
  orthogonal complement; integrating with the Steiner formula in `ℝ^d` and the beta integrals of
  the ball gives the Steiner formula in `ℝ^n` with the same `V_j`.

**Checks.**
- `V_1(B²) = π` (half the perimeter of the unit circle), `V_1(B³) = 4`, `V_2(B³) = 2π` (half the
  surface area) and `V_3(B³) = 4π/3`.
- The unit segment `[0, 1] × {0}` in `ℝ²` has `V_0 = 1`, `V_1 = 1` and `V_2 = 0`, as in `ℝ`.
- Negative control: `V_1(K)²` is homogeneous of degree `2` and motion invariant, but not
  additive: for two unit squares sharing an edge, `V_1(K ∪ M)² + V_1(K ∩ M)² = 9 + 1 = 10` while
  `V_1(K)² + V_1(M)² = 8`; so Hadwiger's theorem (3.3) needs additivity.

### 1.4 Lower-dimensional bodies, surface area and products

Sources: Schneider–Weil p. 601 (the surface area `2 V_{d-1}`) and Lemma 14.2.1, p. 602 (products);
Chiu et al. (1.45), p. 16 (generalized Steiner formula); Kiderlen p. 23.

- **Lower-dimensional bodies** (`intrinsicVolume_of_subset_affineSubspace`): a convex body in an
  affine subspace of dimension `k` has `V_j = 0` for `j > k` and `V_k = μHE[k]`. Route: Tau
  Ceti's `TauCeti.tendsto_volume_real_add_smul_closedBall_div` identifies the limit of
  `V_d(K + ε B^d) / κ_{d-k} ε^{d-k}` as `ε → 0` with `μHE[k](K)`, and the Steiner formula
  identifies it with `V_k(K)` once the coefficients of lower powers vanish, which follows from
  the same limit.
- **Surface area** (`surfaceArea_eq`): for `d ≥ 1` and a convex body `K` with interior points,
  `2 V_{d-1}(K) = μHE[d-1](frontier K)`. Route: the right derivative at `0` of the Steiner
  polynomial is `κ_1 V_{d-1}(K) = 2 V_{d-1}(K)`; Tau Ceti's
  `Convex.hasDerivWithinAt_measureReal_add_smul_closedBall` identifies it with the perimeter
  `TauCeti.perimeter`, which Isoperimetry §2.3 identifies with the boundary area.
- **Orthogonal products** (`intrinsicVolume_add_of_subset_orthogonal`): for convex bodies
  `K ⊆ L` and `M ⊆ L^⊥` and a linear subspace `L`,
  `V_j(K + M) = ∑_{i=0}^{j} V_i(K) V_{j-i}(M)`; Schneider–Weil Lemma 14.2.1, p. 602.
- **Generalized Steiner formula** (`intrinsicVolume_add_closedBall`): for `k ≤ d` and `r ≥ 0`,
  `V_k(K + r B^d) = ∑_{j=0}^{k} (d - j choose d - k) (κ_{d-j} / κ_{d-k}) V_j(K) r^{k-j}`;
  Chiu et al. (1.45), p. 16. Route: expand `V_d(K + (r + ε) B^d)` by the Steiner formula in two
  ways and compare coefficients of `ε^{d-k}`.

**Checks.**
- For the unit cube in `ℝ³`, `V_2(K + r B³) = 3 + 3π r + 2π r²`, both from the generalized Steiner
  formula and from the surface area of the parallel body.
- For the unit square, `2 V_1 = 4` is the perimeter.
- Negative control: a unit segment in `ℝ²` has `2 V_1 = 2`, while `μHE[1]` of its frontier (the
  segment itself) is `1` and its perimeter is `0`; the surface-area identity needs interior points.

## Layer 2: valuations and the convex ring

### 2.1 Continuous motion-invariant valuations

Sources: Schneider–Weil (14.46), p. 617, and the property list of p. 601; Kiderlen p. 24
(additivity, Exercises 2.1–2.2); Adler–Taylor (6.3.5), p. 143.

- **Definitions** (`IsConvexValuation`, `IsHausdorffContinuous`, `IsMotionInvariant`):
  additivity `φ(K ∪ M) + φ(K ∩ M) = φ(K) + φ(M)` whenever `K`, `M` and `K ∪ M` are convex bodies;
  continuity on `ConvexBody (Eucl d)`; invariance under proper rigid motions on convex bodies.
- **Valuation property** (`isConvexValuation_intrinsicVolume`): every `V_j` is additive. Route:
  for convex `K ∪ M`, `(K ∪ M) + ε B^d = (K + ε B^d) ∪ (M + ε B^d)` and
  `(K ∩ M) + ε B^d = (K + ε B^d) ∩ (M + ε B^d)`, so the parallel volumes are additive and so are
  the interpolation polynomials.
- **Continuity** (`isHausdorffContinuous_intrinsicVolume`): every `V_j` is continuous for the
  Hausdorff metric. Route: the parallel volumes at the interpolation nodes are continuous, and the
  coefficients are fixed linear combinations of them.

**Checks.**
- The intrinsic volumes of the unit square `[0, 1]²` and of `[1, 2] × [0, 1]` add up to those of
  the rectangle `[0, 2] × [0, 1]` and the segment `{1} × [0, 1]`: areas `1 + 1 = 2 + 0`, half
  perimeters `2 + 2 = 3 + 1`, Euler characteristics `1 + 1 = 1 + 1`.
- Negative control: area of the Minkowski sum with a fixed segment, `K ↦ V_2(K + [0, 1] e_1)`, is
  additive and continuous but not rotation invariant: for the unit square rotated by
  `0, π/6, π/4` it is `2, 2.36603, 2.41421`.

### 2.2 The convex ring and Groemer's extension

Sources: Schneider–Weil Theorems 14.4.1 (p. 618) and 14.4.2 (Groemer's extension theorem,
p. 620), with (14.47), p. 617; Kiderlen pp. 27–28; Adler–Taylor (6.3.9)–(6.3.10), p. 144.

- **Definitions** (`IsPolyconvex`, `inclusionExclusion`, `convexRingExtension`): a polyconvex
  set is a finite union of convex bodies; the inclusion–exclusion sum over a representation
  `K = C_1 ∪ ⋯ ∪ C_m` is `∑_{∅ ≠ v} (-1)^{|v|-1} φ(⋂_{i ∈ v} C_i)`; the extension evaluates it at
  a chosen representation, and is `0` off the convex ring.
- **Groemer's extension theorem** (`groemer_extension`): for a continuous valuation `φ` with
  `φ(∅) = 0`, the inclusion–exclusion sum does not depend on the representation, the extension
  agrees with `φ` on convex bodies, it is additive on polyconvex sets, and it is the only additive
  function on polyconvex sets that vanishes at `∅` and agrees with `φ` on convex bodies. Route
  (Schneider–Weil): by Theorem 14.4.1 it suffices that `φ` satisfies inclusion–exclusion on
  convex bodies whose union is convex; this holds for polytopes by induction on the number of
  bodies, using a hyperplane that separates, and passes to convex bodies by continuity.

**Checks.**
- The square frame `[0, 3]² \ (1, 2)²` as the union of four rectangles has inclusion–exclusion
  Euler characteristic `4 - 4 + 0 = 0`, and as the union of eight unit squares around the hole
  also `8 - 8 + 0 = 0`.
- The L-shaped union of three unit squares has half perimeter `V_1 = 4` and area `3`.

### 2.3 Euler characteristic and convex ring index

Sources: Schneider–Weil p. 601 (`V_0` on the convex ring is the Euler characteristic) and
Theorem 14.4.5, p. 625 (the Euler characteristic on polyhedra).

- **Definitions** (`eulerChar`, `convexRingIndex`): the additive extension of the functional
  that is `1` on nonempty sets and `0` on `∅`; and the least number of nonempty convex bodies
  whose union is a given set.
- **Euler characteristic** (`eulerChar_spec`): `eulerChar` is the extension of `V_0` on polyconvex
  sets, and a union of `m` pairwise disjoint nonempty convex bodies has Euler characteristic `m`.
  Route: the two functionals agree on convex bodies (1.3), so the uniqueness clause of 2.2 applies;
  for disjoint bodies only singleton intersections survive.

**Checks.**
- The square frame of 2.2 has Euler characteristic `0`, a disc `1`, two disjoint discs `2`.
- The convex ring index is `0` for `∅`, `1` for a nonempty convex body and `2` for the L-shape
  (two rectangles, and the L-shape is not convex).

## Layer 3: Hadwiger's characterization theorem

### 3.1 Zonotopes and zonoids

Sources: Schneider–Weil (14.33) and Theorem 14.3.4, p. 614, and the citation of the zonoid
representation in the proof of Proposition 14.4.1, p. 630.

- **Definitions** (`zonotope`, `IsZonoid`): `∑_i [0, a_i]`, and a Hausdorff limit of translates
  of zonotopes in `ConvexBody (Eucl d)`.
- **Smooth symmetric bodies** (`exists_isZonoid_add_eq`): an origin-symmetric convex body whose
  support function is `C^∞` away from the origin satisfies `K + Z_1 = Z_2` for zonoids
  `Z_1, Z_2`. Route: for `d ≤ 1`, `K` is a centred segment or a point, itself a zonotope, and
  `Z_1 = {0}`. For `d ≥ 2`, the even function `h_K` on the sphere is the cosine transform
  `T g(u) = ∫ |⟪u, v⟫| g(v) dσ(v)` of a continuous even `g`. By the Funk–Hecke formula of
  SpecialFunctionsHigherSpheres §4.3 with `f(t) = |t|`, `T` multiplies the harmonics of degree
  `l` by `λ_l`, which is `0` for odd `l` and, for even `l`, nonzero with `|λ_l|` of exact order
  `l^{-(d+2)/2}`. The harmonic components `h_l` of the smooth `h_K` have `L²` norms decaying
  faster than every power of `l` (integrate by parts with the spherical Laplacian), and
  `sup |h_l| ≤ (dim H_l)^{1/2} ‖h_l‖_2` with `dim H_l` polynomial in `l`; so
  `g = ∑_{l even} h_l / λ_l` converges uniformly, and `T g = h_K` because the harmonics are
  complete in `L²` (§2.2 there). Write `g = g^+ - g^-`. The body `Z_±` with support function
  `T g^±` is the Hausdorff limit of the centred zonotopes of Riemann sums of `T g^±`, so it is a
  zonoid. Support functions add under Minkowski sums and determine bodies, so
  `h_K + h_{Z_-} = h_{Z_+}` gives `K + Z_- = Z_+`. Schneider and Weil cite this representation
  without proof (p. 630).

**Checks.**
- A centred parallelogram is a zonotope; a centred disc is a zonoid with uniform generating
  measure, `h(u) = ∫ |⟪u, v⟫| σ(dv) / 4`, with `σ` arc length on the unit circle, giving radius `1`.
- Negative control: a triangle is not centrally symmetric, hence not a zonoid.
- `d = 2`: `∫_0^{2π} |cos θ| cos(l θ) dθ = 4 (-1)^{l/2 + 1} / (l² - 1)` for even `l` (`4/3`,
  `-4/15`, `4/35` at `l = 2, 4, 6`), so `λ_l` decays like `l^{-2}`; numerically, the log-slope
  of `|λ_l|` between `l = 80` and `l = 160` is `-2.000`, `-2.489`, `-2.974`, `-3.454` for
  `d = 2, 3, 4, 5`, tending to `-(d + 2)/2`, and `λ_l = 0` for odd `l`. Negative control: an
  order `l^{-(d+1)/2}` would give the slope `-1.5` at `d = 2`.

### 3.2 Simple valuations

Source: Schneider–Weil Proposition 14.4.1, p. 629, with its proof pp. 629–631.

- **Simple valuations** (`eq_zero_of_isConvexValuation_of_simple`): a continuous
  motion-invariant valuation that vanishes on convex bodies without interior points and on the
  unit cube vanishes on all convex bodies. Route (Schneider–Weil, by induction on `d`): the
  valuation vanishes on segments of rational and then of all lengths in `d = 1`; in general, the
  induction hypothesis applied to `K ↦ ψ(K + I)` on a hyperplane makes it vanish on right
  cylinders, and a cut-and-translate argument on oblique cylinders. Groemer's extension (2.2)
  turns it into an additive function on dissections, so `ψ(P + S) = ψ(P)` for a polytope `P` and
  a segment `S`, hence `ψ(K + Z) = ψ(K)` for zonoids `Z`. By 3.1, `ψ` vanishes on centrally
  symmetric bodies with smooth support function, and by approximation (smoothing the support
  function with a rotation-invariant mollifier) on all centrally symmetric bodies. A simplex and
  its reflection differ by a centrally symmetric piece of a parallelotope, so `ψ(-Δ) = -ψ(Δ)`; a
  proper rigid motion carries `Δ` to `-Δ` in even dimension, and in odd dimension a dissection of
  `Δ` into pieces each carried to its reflection by a proper motion gives `ψ(-Δ) = ψ(Δ)`. So `ψ`
  vanishes on simplices, on polytopes, and by continuity on all convex bodies.

### 3.3 Hadwiger's theorem

Sources: Schneider–Weil Theorem 14.4.6, p. 628; Kiderlen Theorems 2.1–2.2, pp. 24–25 (the monotone
version, stated without proof); Adler–Taylor Theorem 6.3.1, p. 146 (the monotone version on basic
complexes); Chiu et al. (1.44), p. 16.

- **Hadwiger's characterization theorem** (`hadwiger`): a continuous motion-invariant valuation
  is, on nonempty convex bodies, `∑_{i=0}^{d} c_i V_i`. Route: induction on `d` (Schneider–Weil,
  p. 629): on a hyperplane `φ` is a combination of `V_0, …, V_{d-1}` by induction and by the
  dimension independence of 1.3; subtracting it and the multiple of `V_d` that matches the cube
  leaves a simple valuation, which vanishes by 3.2.
- **Segments act linearly** (`exists_apply_add_smul_segment_eq`): for an increasing
  motion-invariant valuation `φ`, a convex body `K` and a vector `v`, there is `a ≥ 0` with
  `φ(K + t [0, v]) = φ(K) + a t` for all `t ≥ 0`. Route: for `s, t ≥ 0` the bodies
  `K + s [0, v]` and `K + s v + t [0, v]` have the convex union `K + (s + t) [0, v]`, and their
  intersection is `K + s v`: a point `x` of both has `{α : x - α v ∈ K}`, an interval, meeting
  `[0, s]` and `[s, s + t]`, so it contains `s`. Additivity and translation invariance give
  `g(s + t) + g(0) = g(s) + g(t)` for `g(t) = φ(K + t [0, v])`, so `g - g(0)` is additive on
  `[0, ∞)`; it is linear on the rationals and, being increasing, linear.
- **Continuity of increasing valuations** (`isHausdorffContinuous_of_monotone`): an increasing
  motion-invariant valuation is continuous. Route (it shows that `φ` is Lipschitz on the bodies
  inside a fixed ball): let `C = [-e_1, e_1] + ⋯ + [-e_d, e_d]` be the cube, which contains
  `B^d`, and `R > 0`. For a nonempty convex body `M ⊆ R B^d` and `0 ≤ t ≤ 1`, add the `d`
  segments one at a time: by the previous item each step `N ↦ N + t [-e_i, e_i]` raises `φ` by
  `t (φ(N + [-e_i, e_i]) - φ(N))`, and by monotonicity and translation invariance this is at
  most `t (φ((R + d) C) - φ({0}))`, since `N` contains a point and `N + [-e_i, e_i] ⊆ (R + d) C`.
  So `φ(M + t C) ≤ φ(M) + L t` with `L = d (φ((R + d) C) - φ({0}))`. If nonempty convex bodies
  `K, K' ⊆ R B^d` have Hausdorff distance `t ≤ 1`, then `K ⊆ K' + t B^d ⊆ K' + t C`, so
  `φ(K) ≤ φ(K') + L t`, and symmetrically. No polytope approximation is used, so bodies of
  lower dimension, such as thin rectangles near a segment, need no separate treatment. None of
  the four sources prints this step: Kiderlen (p. 24) states the monotone theorem without proof
  and refers to Hadwiger, and Adler and Taylor (p. 146) refer to Hadwiger's monograph.
- **Monotone version** (`hadwiger_monotone`): an increasing motion-invariant valuation with
  `φ(∅) = 0` is `∑_{i=0}^{d} c_i V_i` on nonempty bodies with every `c_i ≥ 0`. Route: the previous
  item and `hadwiger` give the expansion; `c_0 = φ({0}) ≥ φ(∅) = 0`, and on the `i`-dimensional
  cube `[0, t]^i` the value `∑_{m ≤ i} c_m (i choose m) t^m` increases in `t`, so its leading
  coefficient `c_i` is nonnegative.
- **Homogeneous valuations** (`eq_smul_intrinsicVolume_of_homogeneous`): a continuous
  motion-invariant valuation homogeneous of degree `j ≤ d` is a multiple of `V_j` on nonempty
  bodies. Route: compare the degrees in `t` of `hadwiger` applied to `t K`.

**Checks.**
- `V_j` itself satisfies all hypotheses, with `c = e_j`.
- `K ↦ V_1(K) + 3 V_0(K)` is increasing, and its coefficients are `≥ 0`.
- Negative control for `φ(∅) = 0` in the monotone version: the functional equal to `-1` on
  nonempty sets and `-2` on `∅` is an increasing motion-invariant valuation (two disjoint nonempty
  convex bodies never have a convex union), and it is `-V_0` on nonempty bodies, with a negative
  coefficient.
- Negative control: `K ↦ V_2(K + [0, 1] e_1)` of 2.1 is a continuous valuation that is not a
  combination of `V_0, V_1, V_2`, since its value on the unit square depends on the rotation.
- Segments act linearly: in the plane, `V_2` and `V_1` of the unit square plus `t [0, e_1]` are
  `1 + t` and `2 + t`, and of the unit disc plus `t [0, e_1]` (a stadium) `π + 2t` and `π + t`.
  Negative control: `V_1(B² + t [0, e_1])² = (π + t)²` has second difference `2` at
  `t = 0, 1, 2`; `V_1²` is increasing and motion invariant but not additive (1.3).
- Thin rectangles: `[0, 1] × [0, ε]` is at Hausdorff distance `ε` from the segment
  `[0, 1] × {0}`, and `V_0, V_1, V_2 = 1, 1 + ε, ε` tend to the segment's values `1, 1, 0`.

## Layer 4: invariant measures

### 4.1 Rotations and the sphere

Sources: Schneider–Weil Theorem 13.2.9, p. 584; Adler–Taylor (6.3.11)–(6.3.12), p. 145.

- **Definitions** (`rot`, `rotationMeasure`, `uniformSphere`): rotations as in the Conventions;
  the normalized Haar measure; the surface measure of the unit sphere, `Measure.toSphere` of
  Mathlib, normalized and transported to `Eucl d`.
- **Rotation probability** (`rotationMeasure_spec`): `rotationMeasure d` is a probability that
  is left and right invariant and invariant under inversion, and it is the only left-invariant
  probability. Route: Tau Ceti gives the Haar property and `TauCeti.orthogonalGroupVolume_pos`;
  the group is compact, hence unimodular; uniqueness is
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
- **Sphere** (`map_rotationMeasure_eq_uniformSphere`): for a unit vector `e`, the image of
  `rotationMeasure d` under `ϑ ↦ ϑ e` is `uniformSphere d`. Route: Tau Ceti's
  `TauCeti.map_orthogonalGroupLastColumn_orthogonalGroupMeasure` for the last basis vector, and
  invariance for the others.

**Checks.**
- `d = 1`: the group is `{±1}`, each of mass `1/2`, and `uniformSphere 1` puts mass `1/2` on `±1`.
- `d = 2`: the image of `ϑ ↦ ϑ e` is arc length on the circle divided by `2π`.

### 4.2 Grassmannians

Sources: Schneider–Weil Theorem 13.2.11, p. 588; Kiderlen p. 26.

- **Definitions** (`Subspaces`, `rotateSubspace`, `coordSubspace`, `grassmannianMeasure`): linear
  subspaces with the Borel structure of their orthogonal projections; the image of a subspace
  under a rotation; `L_k`; and `ν_k`, the image of the rotation probability under `ϑ ↦ ϑ L_k`.
- **Measurability** (`measurable_rotateSubspace_orthogonal_finrank`): the action
  `(ϑ, L) ↦ ϑ L`, jointly in both arguments, the complement `L ↦ L^⊥` and the dimension
  `L ↦ dim L` are measurable; so the images of measures under them in the next two items are not
  the junk value `0`, and each Grassmannian `{L : dim L = k}` is a measurable set. Route: a map
  into `Subspaces d` is measurable when its composite with `L ↦ P_L`, the orthogonal projection,
  is; and `P_{ϑ L} = ϑ P_L ϑ^{-1}`, `P_{L^⊥} = 1 - P_L` and `dim L = tr P_L` are continuous
  functions of `ϑ` and `P_L`.
- **Grassmannian measure** (`grassmannianMeasure_spec`): `ν_k` is a rotation-invariant
  probability carried by the `k`-dimensional subspaces; it is the image of the rotation
  probability under `ϑ ↦ ϑ L` for every `k`-dimensional `L`; and `L ↦ L^⊥` carries it to
  `ν_{d-k}`. Route: `L = ϑ_0 L_k` and right invariance of 4.1; `(ϑ L_k)^⊥ = ϑ L_k^⊥`.
- **Uniqueness** (`grassmannianMeasure_unique`): `ν_k` is the only such probability. Route: for an
  invariant `μ`, Fubini over `μ ⊗ rotationMeasure d` and the second clause give
  `∫ f dμ = ∫∫ f(ϑ L) dϑ μ(dL) = ∫ f dν_k`.

**Checks.**
- `d = 2`, `k = 1`: `ν_1` is the law of the line through `(cos θ, sin θ)` with `θ` uniform on
  `[0, π)`.
- `k = 0` and `k = d`: `ν_k` is the Dirac mass at `{0}` and at the whole space.

### 4.3 Affine flats

Sources: Schneider–Weil Theorem 13.2.12 and (13.9), p. 588; Kiderlen p. 26; Adler–Taylor
(6.3.6)–(6.3.7), p. 144.

- **Definitions** (`standardFlat`, `affineFlat`, `flatMeasure`): as in the Conventions.
- **Flat measure** (`flatMeasure_spec`): every affine isometry `f` acts on the parameters by a
  measure-preserving map `T` with `affineFlat (T p) = f (affineFlat p)`, and the flats meeting the
  unit ball have measure `κ_{d-k}`. Route: for `f = A · + b`,
  `T(ϑ, y) = (A ϑ, y + π_{>k}((A ϑ)^{-1} b))`, a left translation in `ϑ` followed by a translation
  in `y` depending on `ϑ`; the flat `ϑ(L_k + y)` meets the unit ball exactly when `|y| ≤ 1`.

**Checks.**
- Lines meeting the unit disc have measure `2`, planes meeting the unit ball of `ℝ³` measure `2`,
  lines meeting it measure `π`.
- `k = d`: the parameter `y` ranges over a point, and the measure is the rotation probability,
  carried by one flat, the whole space.

### 4.4 Rigid motions

Sources: Schneider–Weil Theorem 13.2.10, p. 586, and (13.8), p. 587.

- **Definitions** (`motion`, `motionMeasure`).
- **Motion measure** (`motionMeasure_spec`): `motionMeasure d` is invariant under composition with
  a fixed motion on the left and on the right and under inversion, and the motions that move a
  given point into the unit ball have measure `κ_d`. Route: left and right invariance of the
  rotation probability, translation invariance of Lebesgue measure, and Fubini.

**Checks.**
- `d = 1`: `motionMeasure 1` is `(δ_{1} + δ_{-1})/2 ⊗ λ`, and the motions moving `0` into `[-1, 1]`
  have measure `2 = κ_1`.

## Layer 5: Crofton, Cauchy and Kubota formulas

### 5.1 Crofton's formula

Sources: Schneider–Weil Theorem 5.1.1 and (5.6), p. 172; Kiderlen Theorem 2.4, p. 27; Chiu et al.
(1.49), p. 16.

- **Crofton formula** (`crofton`): for `j ≤ k ≤ d`,
  `∫ V_j(K ∩ F) μ_k(dF) = c^k_j c^{d-k+j}_d V_{d-k+j}(K)`, with integrability. Route
  (Schneider–Weil): the left side is a continuous motion-invariant valuation in `K`, homogeneous
  of degree `d - k + j`, hence a multiple of `V_{d-k+j}` by 3.3; the constant comes from the unit
  ball, where `V_j(B^d ∩ F)` is `V_j` of a ball of radius `√(1 - |y|²)` in `F`.

**Checks.**
- `d = 2`, `k = 1`, `j = 0`: the measure of lines meeting a convex body is
  `c^1_0 c^1_2 V_1(K) = (2/π) V_1(K)`; for the unit square it is `4/π = 1.27324`, its mean width,
  and for the unit disc `2`, as in 4.3.
- `k = d`, `j = d`: both sides are `V_d(K)`; `k = 0`, `j = 0`: both sides are the volume.
- The constants agree with a direct integration over balls for every `d ≤ 6`.

### 5.2 Nonnegativity and monotonicity

Source: Schneider–Weil p. 601 (the property list).

- **Positivity** (`intrinsicVolume_nonneg_and_mono`): `0 ≤ V_j(K) ≤ V_j(M)` for convex bodies
  `K ⊆ M`. Route: Crofton with `j = 0` and `k = d - j` writes `V_j(K)` as a positive multiple of the
  measure of the flats meeting `K`, which is nonnegative and increasing in `K`.

**Checks.**
- `V_1` of the unit square, `2`, is at most `V_1` of its circumscribed disc of radius `1/√2`,
  `π/√2 = 2.22144`.
- Negative control: monotonicity fails on the convex ring: two disjoint discs inside a large disc
  have extended `V_0 = 2 > 1`.

### 5.3 Kubota, Cauchy and the mean width

Sources: Schneider–Weil (5.8), p. 172, and (14.7), p. 601; Kiderlen Theorem 2.3, p. 26; Chiu et al.
(1.50), p. 16.

- **Kubota's formula** (`kubota`): for `m ≤ d`,
  `V_m(K) = c^0_m c^d_{d-m} ∫ λ_m(K | L) ν_m(dL)`, with `K | L` the orthogonal projection and
  `λ_m` Lebesgue measure on `L`. Route: Crofton with `j = 0` and `k = d - m`, by Fubini over the
  flats `L^⊥ + y` and the complement clause of 4.2. The constant is the flag coefficient
  `(d choose m) κ_d / (κ_m κ_{d-m})`.
- **Definition** (`meanWidth`): the mean of `h_K(u) + h_K(-u)` over `uniformSphere d`.
- **Mean width** (`intrinsicVolume_one_eq_meanWidth`): for `d ≥ 1` and a nonempty convex body,
  `V_1(K) = (d κ_d / (2 κ_{d-1})) w(K)`. Route: Kubota with `m = 1`; the projection onto the line
  `ℝ u` has length `h_K(u) + h_K(-u)`, and 4.1 carries `ν_1` to the sphere.
- Cauchy's surface area formula, `V_{d-1}(K) = (1/κ_{d-1}) ∫ λ_{d-1}(K | u^⊥) σ(du)` with `σ`
  the unnormalized sphere measure, is Kubota with `m = d - 1` and the complement clause; it is a
  target in prose.

**Checks.**
- The constant `d κ_d / (2 κ_{d-1})` is `π/2` for `d = 2` and `2` for `d = 3`.
- The unit square has mean width `4/π = 1.27324` and `V_1 = (π/2)(4/π) = 2`.
- The unit cube has mean shadow area `3/2`, a quarter of its surface area (Monte Carlo
  `1.4991`), as Cauchy's formula requires.

### 5.4 Zonotopes and zonoids

Sources: Schneider–Weil (14.35), p. 614, and (14.39), p. 615.

- **Definition** (`gramDet`): the Gram determinant of `j` vectors, the square of the `j`-volume
  of the parallelepiped they span.
- **Zonotopes** (`intrinsicVolume_zonotope`): `V_j(∑_i [0, a_i])` is the sum over
  `i_1 < ⋯ < i_j` of the `j`-volumes of the parallelepipeds spanned by `a_{i_1}, …, a_{i_j}`.
  Route: for `j = d` by induction on the number of segments, Cavalieri's principle giving
  `V_d(Z + [0, a]) = V_d(Z) + |a| V_{d-1}(Z | a^⊥)`; for `j < d`, Kubota writes `V_j(Z)` as the mean
  of `λ_j(Z | L)`, the case `j = d` inside `L` writes that as a sum over `j`-subsets of the
  projected parallelepipeds, and Kubota with 1.4 gives back their `j`-volumes.
- **Zonoids** (`intrinsicVolume_zonoid`): if `Z` has support function
  `h_Z(u) = ∫ |⟪u, v⟫| ρ(dv)` for an even finite measure `ρ` on the sphere, then
  `V_j(Z) = (2^j / j!) ∫ ⋯ ∫ ∇_j(v_1, …, v_j) ρ(dv_1) ⋯ ρ(dv_j)`, with `∇_j` the `j`-volume of the
  parallelepiped; Schneider–Weil (14.35), p. 614. Route: for atomic `ρ`, `Z` is a centred
  zonotope and this is the previous item; approximate `ρ` weakly by atomic even measures, so that
  support functions converge uniformly and 2.1 applies.

**Checks.**
- For four random vectors in `ℝ²`, the area of the zonotope and the sum of `|det|` over pairs
  agree (`6.40460`); in `ℝ³`, the volume and the sum over triples agree (`18.34500`), and half the
  surface area and the sum over pairs of `|a × b|` agree (`5.28200`).
- For a centred zonotope `∑ [-a_i, a_i]` the zonoid formula with `j = 2` in the plane gives the
  area `7.62833` and with `j = 1` half the perimeter `6.53100`.
- `j = 0` gives `V_0 = 1` on both sides (empty sum and empty product).

## Layer 6: kinematic formulas

### 6.1 Hadwiger's general integral-geometric theorem

Source: Schneider–Weil Theorem 5.1.2 and (5.9), p. 173, with the integrability on p. 173 and the
identification of the coefficients on p. 174; Kiderlen p. 27 (Hadwiger's general formula, stated
without proof).

- **General kinematic theorem** (`kinematic_valuation`): for a continuous valuation `φ` with
  `φ(∅) = 0` and convex bodies `K`, `M`,
  `∫ φ(K ∩ g M) μ(dg) = ∑_{k=0}^{d} φ_{d-k}(K) V_k(M)`, where `φ_{d-k}(K) = ∫ φ(K ∩ F) μ_k(dF)`,
  with integrability of every integrand. Route (Schneider–Weil): for fixed `K` the left side is a
  continuous motion-invariant valuation in `M`, hence `∑ c_k(K) V_k(M)` by 3.3; the coefficient
  of `V_k` is identified by inserting `M = r C` for a centred `k`-dimensional unit cube `C` in
  `L_k`, dividing by `r^k` and letting `r → ∞`, where the integrand over translations along `L_k`
  converges to `φ(K ∩ ϑ(L_k + y))`.

**Checks.**
- `φ = V_d`: `∫ V_d(K ∩ g M) = V_d(K) V_d(M)`, the term `k = d` (the other `φ_{d-k}` vanish since
  `V_d` of a section by a flat of lower dimension is `0`).
- `φ = V_0`, `d = 2`: the measure of motions of a unit segment that meet the unit square is
  `1 + 4/π = 2.27324` (Monte Carlo `2.27303`).

### 6.2 The principal kinematic formula

Sources: Schneider–Weil Theorem 5.1.3 and (5.10), p. 175; Kiderlen Theorem 2.2 and (2.3), p. 25;
Chiu et al. p. 17.

- **Principal kinematic formula** (`principal_kinematic`): for `j ≤ d`,
  `∫ V_j(K ∩ g M) μ(dg) = ∑_{k=j}^{d} c^k_j c^{d-k+j}_d V_k(K) V_{d-k+j}(M)`. Route: 6.1 with
  `φ = V_j` and Crofton (5.1).

**Checks.**
- Discs of radii `r = 0.7` and `s = 1.3`, `j = 0`: the motions with `D_r ∩ g D_s ≠ ∅` have
  measure `π (r + s)² = 12.56637`, which is `π r² + π s² + (2π r)(2π s)/(2π)`.
- The same discs, `j = 1`: `17.96268` both by integrating the half perimeter of the lens and from
  the formula, `π r π s² + π r² π s`.

### 6.3 The iterated kinematic formula

Sources: Schneider–Weil Theorems 5.1.4 (p. 175) and 5.1.5 (p. 176); Kiderlen Theorem 2.3, p. 26.

- **Iterated formula** (`iterated_kinematic`): for convex bodies `K_0, …, K_n` with `n ≥ 1` and
  `j ≤ d`,
  `∫ ⋯ ∫ V_j(K_0 ∩ g_1 K_1 ∩ ⋯ ∩ g_n K_n) = ∑ c^d_j ∏_{i=0}^{n} c^{m_i}_d V_{m_i}(K_i)`, the sum
  over `j ≤ m_i ≤ d` with `m_0 + ⋯ + m_n = n d + j`. Route: induction on `n` with 6.2 and the
  invariance of 4.4 (Schneider–Weil, p. 176).

**Checks.**
- For `n = 1` the constants `c^d_j c^{m_0}_d c^{m_1}_d` equal `c^{m_0}_j c^{m_1}_d` when
  `m_0 + m_1 = d + j`, so the formula is 6.2 (checked for `d ≤ 5`).

### 6.4 Translative formulas

Sources: Kiderlen Exercise 2.4 and the remark after Theorem 2.3, p. 26 (the cases `j = d` and
`j = d - 1` need no rotation integral); Schneider–Weil Theorem 5.2.3 and (5.17), p. 186, for the
general translative formula with mixed functionals.

- **Translative formulas for `V_d` and `V_{d-1}`** (`translative_formula`): for `d ≥ 1`,
  `∫ V_d(K ∩ (M + t)) dt = V_d(K) V_d(M)` and
  `∫ V_{d-1}(K ∩ (M + t)) dt = V_{d-1}(K) V_d(M) + V_d(K) V_{d-1}(M)`, with integrability. Route:
  the first is Fubini. For the second, when both bodies have interior points, 1.4 writes
  `2 V_{d-1}(K ∩ (M + t))` as `μHE[d-1]` of the boundary, which for almost every `t` is the union
  of `∂K ∩ (M + t)` and `K ∩ ∂(M + t)` up to a null set, and Fubini integrates each piece; bodies
  without interior points are limits of `K + ε B^d`, with dominated convergence.

**Checks.**
- Two axis-parallel unit squares: `∫ V_1 = 4 = 2 · 1 + 1 · 2`.
- `d = 1`: `∫ V_0(K ∩ (M + t)) dt` is the measure of `K - M`, the sum of the two lengths.

## Layer 7: integral geometry of polyconvex sets

### 7.1 Extension of the integral formulas

Sources: Schneider–Weil pp. 177–178 (the extension to the convex ring) and (5.12), p. 178;
Kiderlen p. 28; Adler–Taylor Theorem 13.1.1, p. 332, and (13.1.2), p. 333.

- **General kinematic theorem on the convex ring** (`kinematic_valuation_polyconvex`), **Crofton
  on the convex ring** (`crofton_polyconvex`) and **principal kinematic formula on the convex
  ring** (`principal_kinematic_polyconvex`): 6.1, 5.1 and 6.2 hold for polyconvex `K`, `M` with
  `convexRingExtension` of `φ` and of the `V_j` in place of `φ` and `V_j`, with integrability.
  Route: by 2.2, both sides are inclusion–exclusion sums over representations of `K` and `M`, and
  the intersection of a representation of `K` with a moved representation of `M` is a
  representation of `K ∩ g M`.

**Checks.**
- The frame `F = [0, 3]² \ (1, 2)²` against a disc `D_ρ` with `ρ < 1/2`: 6.2 gives
  `∫ χ(F ∩ g D_ρ) = χ(F) π ρ² + (2/π) V_1(F) π ρ + V_2(F) = 8 + 16 ρ`, while the area of the
  `ρ`-parallel set of `F` is `8 + 16 ρ + (π - 4) ρ²`; the difference `(4 - π) ρ²` is the measure of
  the positions near the four inner corners where `F ∩ g D_ρ` has two components.
- Adler and Taylor's (13.1.2) is the case `φ = V_0`.

### 7.2 Bounds on the convex ring

- **Bound** (`abs_convexRingExtension_intrinsicVolume_le`): a union of `m` convex bodies inside a
  convex body `W` has `|V_j| ≤ (2^m - 1) V_j(W)`. Route: inclusion–exclusion has `2^m - 1` terms,
  each the `V_j` of a convex body inside `W`, which 5.2 bounds by `V_j(W)`. This is the bound
  that makes the intrinsic volumes of Boolean models integrable.

**Checks.**
- `m = 1`: the bound is the monotonicity of 5.2. For the frame of four rectangles inside
  `[0, 3]²`, `|V_0| = 0 ≤ 15`.

## Downstream consumers

- GaussianFieldsSupremaAndExcursions (a sibling roadmap) consumes the constants (1.1), the
  intrinsic volumes (1.2) and the product formula (1.4) for the intrinsic volumes of boxes in its
  mean Euler characteristic of excursion sets.
- RandomClosedSetsAndBooleanModels (a sibling roadmap) consumes the constants, the intrinsic
  volumes and the Steiner formula (1.1–1.2), their dimension independence (1.3), valuations, the
  convex ring and Groemer's extension (2.1–2.3), the unit cube (3.2), the principal, iterated and
  translative kinematic formulas (6.2–6.4), the principal kinematic formula on the convex ring
  (7.1) and the bound of 7.2, for the Boolean model, the specific intrinsic volumes, the mean
  value formulas of Miles and stereology.
- RandomTessellations (a sibling roadmap) consumes the intrinsic volumes (1.1–1.2) and the
  content of lower-dimensional bodies (1.4), the unit cube (3.2), the rotation, Grassmannian and
  flat parameters with the invariance of the flat measure (4.1–4.3) for flat processes,
  Crofton's formula (5.1), the mean width (5.3) and the zonoid formulas (5.4) for hyperplane
  processes and their associated zonoids.

## Scope and ownership

- Owned here: the intrinsic volumes and their properties, valuations and the convex ring extension,
  Hadwiger's theorem, the invariant measures on rotations, Grassmannians, flats and motions in the
  parametrized form of the Conventions, and the integral formulas of Layers 5–7.
- Consumed, not reproved: the boundary-area identification of Isoperimetry §2.3; the
  normalization of the Hausdorff measures of GeometricMeasureTheory (Conventions); the support
  function of ConvexAnalysisAndDuality §2.1; the Funk–Hecke formula and the completeness of the
  harmonics of SpecialFunctionsHigherSpheres §§4.3, 2.2; the Haar measure on the orthogonal group
  and the parallel volume results of Tau Ceti.
- Boundary with RandomClosedSetsAndBooleanModels: measurability of additive functionals on the
  convex ring with its Fell topology (Schneider–Weil Theorem 14.4.4, p. 624), random closed sets,
  standard random sets, specific intrinsic volumes and every statement in expectation are owned
  there.
- Boundary with RandomTessellations: flat processes, hyperplane processes and tessellations are
  owned there; this roadmap owns only the deterministic measures they are built on.

## Exact supplier contracts

### From Isoperimetry

- §2.3: for a compact convex set with nonempty interior, the perimeter equals the
  `(d - 1)`-dimensional Euclidean Hausdorff measure of the frontier, consumed in 1.4 and 6.4.

### From GeometricMeasureTheory

- Conventions: `μHE[k]` normalized to agree with Lebesgue measure on `k`-planes, consumed in 1.4.

### From ConvexAnalysisAndDuality

- §2.1: the definition of `supportFunction`, finite on nonempty bounded sets, consumed in 3.1 and
  5.3; a local copy is in `Suggested.lean`.

### From SpecialFunctionsHigherSpheres

- §4.3: the Funk–Hecke formula, for `d ≥ 2`, for continuous functions of `⟪η, x⟫` against
  spherical harmonics of degree `l`, with the multiplier given by the Gegenbauer integral;
  consumed in 3.1 with `f(t) = |t|` for the cosine transform of even smooth functions.
- §2.2: `L²` of the sphere is the orthogonal Hilbert sum of the spaces of harmonics of degree
  `l`; consumed in 3.1 to identify the cosine transform of the series with `h_K`.

### From Tau Ceti and Mathlib

- `TauCeti.orthogonalGroupMeasure`, `TauCeti.orthogonalGroupVolume_pos`,
  `TauCeti.map_orthogonalGroupLastColumn_orthogonalGroupMeasure`,
  `TauCeti.orthogonalGroupToLinearIsometryEquiv` (4.1);
  `TauCeti.tendsto_volume_real_add_smul_closedBall_div`,
  `Convex.hasDerivWithinAt_measureReal_add_smul_closedBall`, `TauCeti.perimeter` (1.4);
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `MeasureTheory.Measure.toSphere`,
  `EuclideanSpace.volume_closedBall`, `Real.Gamma_mul_Gamma_add_half`, `ConvexBody` (1.1, 2.1,
  4.1).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Curvature measures and the local Steiner formula** (Schneider–Weil §14.2): the localization of
  the intrinsic volumes to support measures and the local kinematic formulas, which need a theory
  of normal bundles of convex bodies.
- **Mixed volumes and the translative formulas for all `j`** (Schneider–Weil §5.2): the mixed
  functionals of the general translative formula (5.17) and the Minkowski inequalities; this is a
  roadmap on its own, with the Brunn–Minkowski theory.
- **Euler relation for polytopes** (Schneider–Weil (14.63), p. 626): the face-number identity from
  the Euler characteristic on relatively open polyhedra.
- **Blaschke–Petkantschin formulas** (Schneider–Weil §7.2): decomposition of products of Lebesgue
  measures through Grassmannians; consumed by RandomTessellations, which can carry them.
- **Alesker's theory of valuations**: smooth and non-invariant valuations, the product and
  convolution of valuations.

## Prior formalization

[lean-MSSS](https://github.com/bjbraams/lean-MSSS) (commit 6826ba2) proves, without `sorry`, in
`MSSS/StochasticGeometry/IntegralGeometry.lean`: the volume clause `intrinsicVolume_top` and the
ball formula `intrinsicVolume_ball` of 1.2–1.3; the invariance of 1.3 under all affine isometries
and for all sets, as isMotionInvariant_intrinsicVolume there
(`intrinsicVolume_image_affineIsometryEquiv` here); and the valuation property
`isConvexValuation_intrinsicVolume` and the continuity `isHausdorffContinuous_intrinsicVolume`
of 2.1, the latter for an `ε`–`δ` form of Hausdorff continuity on nonempty convex bodies, through
the Hausdorff continuity of Lebesgue volume on Mathlib's `ConvexBody`
(continuous_volume_real_convexBody there). Its definitions of the constants and of the intrinsic
volumes are those of 1.1–1.2. The other targets of this roadmap are stated there with `sorry`
(among them the homogeneity of 1.3) or not at all.

## References

- [SW] R. Schneider and W. Weil, *Stochastic and Integral Geometry*, Springer, Probability and its
  Applications, 2008. Chapter 5 (pp. 167–200), Chapter 13 §13.2 (pp. 580–588) and Chapter 14
  (pp. 597–632).
- [K] M. Kiderlen, Introduction into integral geometry and stereology, Chapter 2 of E. Spodarev
  (ed.), *Stochastic Geometry, Spatial Statistics and Random Fields: Asymptotic Methods*, Lecture
  Notes in Mathematics 2068, Springer, 2013, pp. 21–48.
- [AT] R. J. Adler and J. E. Taylor, *Random Fields and Geometry*, Springer Monographs in
  Mathematics, 2007. §6.3 (pp. 141–148) and §13.1 (pp. 331–334).
- [CSKM] S. N. Chiu, D. Stoyan, W. S. Kendall and J. Mecke, *Stochastic Geometry and its
  Applications*, 3rd ed., Wiley, 2013. §1.3–§1.4 (pp. 12–17).
