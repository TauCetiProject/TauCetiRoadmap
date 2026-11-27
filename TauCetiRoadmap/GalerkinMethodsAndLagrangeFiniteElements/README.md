# Roadmap: Galerkin methods and Lagrange finite elements

**Summary.** This roadmap builds the conforming finite element method for second-order elliptic
problems, from the abstract theory of Galerkin approximation to error estimates for continuous
piecewise polynomials on simplicial meshes:
- well-posedness of linear problems in Banach spaces (the Banach–Nečas–Babuška theorem) and its
  discrete form, the discrete inf-sup condition, Fortin's criterion and its converse;
- quasi-optimality of Galerkin approximations: Céa's lemma, Babuška's bound and the sharper
  Xu–Zikatanov bound, the two Strang lemmas for perturbed and nonconforming methods, and the
  abstract duality argument of Aubin and Nitsche;
- simplices, their diameters and inscribed balls, conforming simplicial meshes, shape regularity
  and quasi-uniformity;
- finite elements in the sense of Ciarlet, unisolvence and the Lagrange elements of every degree;
- the spaces of continuous piecewise polynomials on a mesh, their global degrees of freedom and
  their conformity in first-order Sobolev spaces;
- nodal interpolation and the Scott–Zhang quasi-interpolant with their error estimates, inverse
  estimates and discrete trace inequalities;
- convergence of the Lagrange finite element method for a uniformly elliptic Dirichlet problem,
  with rates in the energy norm and, under an explicit regularity hypothesis, in `L²`.

The nearest roadmaps are
[SobolevPolynomialApproximation](../SobolevPolynomialApproximation/README.md), which supplies the
polynomial approximation on a single cell, and [PDE](../PDE/README.md), which
supplies the weak formulation that is discretized; the numerical-analysis roadmaps on mixed,
nonconforming, time-dependent and adaptive finite elements build on this one. The roadmap is a
multi-source synthesis of Ern–Guermond (both volumes), Brenner–Scott, Han–Atkinson and
Boffi–Brezzi–Fortin (see [References](#references)). Headlines that restate a source result cite a
theorem, definition, section or equation number with its printed page; corollaries and
adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry a
Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/NumericalAnalysis/Galerkin/` for Layer 1 and
`TauCeti/NumericalAnalysis/FiniteElement/` for Layers 2–6.

## How to read the build

Layer 1 is functional analysis with no reference to meshes: a bilinear form on a pair of normed
spaces, its restriction to a pair of subspaces, and the error of the discrete solution measured
against the distance to the trial space. Every error estimate of Layer 6 is one application of a
Layer 1 bound followed by an approximation estimate of Layer 5.

Layers 2–4 build the discrete spaces. Layer 2 is affine geometry of a single simplex and of a
finite family of simplices. Layer 3 is linear algebra on one cell: a finite element is a space of
functions with a family of linear functionals, and unisolvence is bijectivity of the functionals
on the space. Layer 4 glues the cells: continuity across shared faces is where conformity of the
mesh enters, and membership in `W^{1,p}` is the step that connects the discrete spaces to Tau
Ceti's Sobolev spaces.

Layer 5 transfers the polynomial approximation of SobolevPolynomialApproximation §4.1 from a
convex domain to each cell by the affine scaling of its §2.2, with shape regularity bounding the
scaling constants. Layer 6 specializes Layer 1 to the energy form of PDE §4.1 on a fixed
polyhedral domain.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Ambient space.** `E d = EuclideanSpace ℝ (Fin d)` with Lebesgue measure `volume`, the local
  copy of SobolevPolynomialApproximation's `E`. Statements about cells assume `[NeZero d]`: in
  `d = 0` a simplex is a point, its open simplex `Affine.Simplex.interior` is empty and the
  inradius is not defined.
- **Bilinear forms** are bundled as `A : V →L[ℝ] StrongDual ℝ W`, so `A v w` is `a(v, w)`, and the
  restriction of `A v` to a test subspace `Y` is `(A v).comp Y.subtypeL`, whose operator norm is
  the supremum over `Y` of `a(v, w)/‖w‖`. A form on `V × V` is `B : V →L[ℝ] V →L[ℝ] ℝ`, Mathlib's
  shape for `IsCoercive`.
- **Constants are explicit.** The inf-sup condition with constant `α` is `0 < α` and
  `∀ v, α * ‖v‖ ≤ ‖A v‖`; coercivity is `∀ v, α * ‖v‖ ^ 2 ≤ B v v`. No statement takes an infimum
  or supremum of a ratio, so there is no junk value at `v = 0` or for an empty subspace.
- **Best approximation** is `Metric.infDist u X`, a real number at most `‖u‖` because every
  subspace contains `0`.
- **Cells.** A cell is `K : Affine.Simplex ℝ (E d) d`. Its closed simplex is
  `Affine.Simplex.closedInterior`, `h_K` is `cellDiam K` (the diameter of the closed simplex), and
  `ρ_K` is `cellInball K = 2 * K.inradius`, the diameter of the inscribed ball. This is
  Ern–Guermond's convention (Definition 11.2, p. 124); Brenner–Scott's chunkiness parameter uses
  the radius of a ball with respect to which the cell is star-shaped. With the diameter convention
  `h_K / ρ_K = 1` for an interval and `√3` for an equilateral triangle.
- **Meshes** are finite: a `SimplicialMesh d` has `numCells` cells indexed by `Fin numCells`.
  Conformity (`SimplicialMesh.conforming`) asks that any two closed cells meet in the convex hull
  of a set of common vertices. This constrains intersections of every dimension, which is
  Brenner–Scott's triangulation condition ((3.3.11), p. 79), not only intersections of codimension
  one as in Ern–Guermond's matching meshes (Definition 8.11, p. 94).
- **Families of meshes** are sequences `T : ℕ → SimplicialMesh d` with `meshSize` the largest cell
  diameter; the index set `H` of the sources is replaced by `ℕ`. In Layer 6 all meshes of a family
  cover one fixed open set `Ω`: `(T n).domainOpens = Ω`.
- **Sobolev spaces** are Tau Ceti's `TauCeti.W1p`, `TauCeti.W1p0` and `TauCeti.Wkp`, with
  `p : ℝ≥0∞` and `[Fact (1 ≤ p)]`, and the Sobolev seminorm of order `j` of
  SobolevPolynomialApproximation §1.3 (`seminorm`, local copy). A Lagrange function is a genuine
  function on `E d` (zero off the mesh); its Sobolev version is an element of `W1p` whose value is
  almost everywhere equal to it.
- **Lagrange nodes** are `node K k α = ∑ᵢ (αᵢ / k) vᵢ` for `α` in
  `Finset.Nat.antidiagonalTuple (d + 1) k`, the multi-indices of length `d + 1` and sum `k`. For
  `k = 0` the expression is the origin (`0 / 0 = 0`); every statement that uses the position of the
  nodes assumes `1 ≤ k`.
- **Constants.** Every `∃ C` is quantified before the meshes, mesh families, cells and functions,
  so `C` depends only on the listed parameters (`d`, degrees, exponents, `σ`, `τ`, ellipticity
  and regularity constants).

## Layer 1: abstract Galerkin theory

### 1.1 Well-posedness

- **The Banach–Nečas–Babuška theorem** (`bijective_iff_infSup`): for `V` and `W` Banach with `W`
  reflexive (the canonical map `NormedSpace.inclusionInDoubleDual ℝ W` surjective), `A` is
  bijective iff it satisfies the inf-sup condition with some `α > 0` and `A v w = 0` for all `v`
  forces `w = 0`. Ern–Guermond II, Theorem 25.9, p. 17.
- **A priori bound** (`norm_le_of_infSup`): under the inf-sup condition, `A u = ℓ` implies
  `‖u‖ ≤ ‖ℓ‖ / α`. Ern–Guermond II, Theorem 25.9, p. 17. Proved in `Suggested.lean`.
- **Coercive forms** (`infSup_of_coercive`): a form with `α ‖v‖² ≤ B v v` satisfies both
  conditions of the Banach–Nečas–Babuška theorem with constant `α`. With the theorem, this is the
  Lax–Milgram lemma (Ern–Guermond II, Lemma 25.2, p. 15). Proved in `Suggested.lean`.

*Needs:* Mathlib's double dual and the closed range theorem for the direction from the two
conditions to surjectivity.

**Checks.**

- `V = W = ℝ`, `A v w = 2 v w`: inf-sup constant `2`, `u = ℓ / 2`, `‖u‖ = ‖ℓ‖ / 2`.
- Negative control: on `ℓ²`, the right shift satisfies the inf-sup condition with `α = 1` but its
  adjoint, the left shift, has the kernel spanned by `e₀`; it is not surjective, so the second
  condition cannot be dropped.
- Negative control: `B v w = v₁ w₂ - v₂ w₁` on `ℝ²` is bijective as a map to the dual but
  `B v v = 0`, so the inf-sup condition does not imply coercivity.

### 1.2 The discrete inf-sup condition

For subspaces `X ⊆ V` and `Y ⊆ W` the discrete problem is `(A u_h).comp Y.subtypeL = ℓ|_Y` with
u_h ∈ X.

- **Discrete well-posedness** (`bijective_restrict_iff`): for `X` and `Y` finite-dimensional, the
  restricted map `X → StrongDual ℝ Y` is bijective iff `finrank X = finrank Y` and the discrete
  inf-sup condition holds with some `α_h > 0`. Ern–Guermond II, Theorem 26.6, p. 29.
- **Coercivity passes to subspaces** (`infSup_restrict_of_coercive`): `α_h ≥ α` for every `X`,
  with `Y = X`. Ern–Guermond II, Example 26.4, p. 29. Proved in `Suggested.lean`.
- **Fortin's criterion** (`infSup_restrict_of_fortin`): if `A` satisfies the inf-sup condition
  with constant `α` and `P : W → Y` satisfies `A v (P w) = A v w` for `v ∈ X` and
  `γ ‖P w‖ ≤ ‖w‖`, then the discrete inf-sup constant is at least `γ α`. Ern–Guermond II,
  Lemma 26.9 (i), p. 31; Boffi–Brezzi–Fortin, Proposition 5.4.2, pp. 303–304. No linearity of `P`
  and no Hilbert structure is used.
- **Converse of Fortin's criterion** (`exists_fortin_of_infSup`): if the test space `H` is an inner
  product space and the discrete inf-sup condition holds with constant `α`, there is a linear
  idempotent Fortin operator `P : H →L[ℝ] Y` with `(α / ‖A‖) ‖P w‖ ≤ ‖w‖`. Ern–Guermond II,
  Lemma 26.9 (ii), p. 31, which assumes both spaces Hilbert. Proof route: the map
  `Y → StrongDual ℝ X`, `y ↦ (v ↦ A v y)`, is onto by the inf-sup condition; `P w` is the solution
  orthogonal to its kernel, and the inf-sup constant of the transpose on that complement is `α`.
  The trial space `V` needs only a norm.

*Needs:* 1.1.

**Checks.**

- `V = W = ℝ²`, `A` the identity, `X = Y = span e₁`: the discrete constant is `1`.
- Negative control: same `A`, `X = span e₁`, `Y = span e₂`: dimensions agree but `A v w = 0` on
  `X × Y`, so the discrete inf-sup condition fails although the continuous one holds.
- Negative control: `X = span e₁`, `Y = ℝ²` gives constant `1` but `finrank X ≠ finrank Y`, so the
  discrete problem is not surjective: the equivalence needs equal dimensions.
- Fortin: with `X = span e₁`, `Y = span (e₁ + e₂)` and the identity form, `P w = (w₁) (e₁ + e₂)`
  is a Fortin operator with `‖P‖ = √2`, giving `γ α = 1/√2`, the exact discrete constant.

### 1.3 Quasi-optimality

- **Galerkin orthogonality** (`galerkin_orthogonality`): if `A u = ℓ` and u_h solves the
  discrete problem then `A (u - u_h) w = 0` for `w ∈ Y`. Ern–Guermond II, Lemma 26.12, p. 33.
  Proved in `Suggested.lean`.
- **Babuška's bound** (`norm_sub_le_of_infSup`): under the discrete inf-sup condition with
  constant `α` and Galerkin orthogonality,
  `‖u - u_h‖ ≤ (1 + ‖A‖ / α) * Metric.infDist u X`. Ern–Guermond II, Lemma 26.14, p. 34, which
  also assumes equal dimensions (only for the existence of u_h); Han–Atkinson, Theorem 9.2.1,
  p. 374.
- **The Xu–Zikatanov bound** (`norm_sub_le_of_infSup_of_hilbert`): if moreover the trial space is
  an inner product space, `X` and `Y` are finite-dimensional of equal dimension and `X ≠ ⊥`, the
  constant is `‖A‖ / α`. Ern–Guermond II, Lemma 26.18, p. 36, which assumes both spaces Hilbert
  and `X ≠ V`; the proof (`‖I - P‖ = ‖P‖` for an idempotent `P ≠ 0, I`) uses the inner product on
  the trial space only, and `X = V` gives `u = u_h`.
- **Céa's lemma** (`norm_sub_le_of_coercive`): for `B` coercive with constant `α` and Galerkin
  orthogonality on `X`, `‖u - u_h‖ ≤ ‖B‖ / α * Metric.infDist u X`. Ern–Guermond II, Lemma 26.13,
  p. 33; Brenner–Scott (2.8.1), p. 64; Han–Atkinson, Proposition 9.1.3, p. 371.
- **Symmetric case** (`norm_sub_le_of_coercive_of_symm`): if `B` is also symmetric the constant
  is `√(‖B‖ / α)`. Ern–Guermond II, Lemma 26.13, p. 33; Brenner–Scott (2.8.1), p. 64, in the
  energy norm.
- **Convergence**: if `infDist u X_n → 0` along a sequence of subspaces with discrete inf-sup
  constants bounded below, u_n → u. Ern–Guermond II, Corollary 26.15, pp. 34–35; immediate from
  Babuška's bound.

*Needs:* 1.2.

**Checks.**

- Babuška versus Xu–Zikatanov in `ℝ²`: the Galerkin projector onto `span e₁` along
  `span (e₁ + t e₂)` has `‖P‖ = ‖I - P‖ = √(1 + 1/t²)`, so `‖u - u_h‖ ≤ ‖P‖ infDist`, while the
  Babuška factor is `1 + ‖P‖`; at `t = 1`: `1.4142` against `2.4142`.
- Negative control: `X = ⊥` makes the discrete inf-sup condition vacuous for every `α`; with
  `u ≠ 0`, u_h = 0 and `α = 2 ‖A‖` the Xu–Zikatanov bound reads `‖u‖ ≤ ‖u‖ / 2`, false. The
  Babuška factor `1 + ‖A‖/α > 1` survives.
- Céa for `-u'' = π² sin πx` on `(0,1)` with continuous piecewise linears, `‖B‖ / α = 1` in the
  `H¹₀` seminorm: the Galerkin solution coincides with the nodal interpolant (nodal errors below
  `10⁻¹⁴` for `n = 8, …, 64`).

### 1.4 Strang lemmas and duality

- **First Strang lemma** (`norm_sub_le_strang_first`): for a perturbed form
  `Ah : X →L[ℝ] StrongDual ℝ Y` with stability constant `α` and right side `ℓh`, and every
  `v ∈ X`,
  `‖u - u_h‖ ≤ (1 + ‖A‖/α) ‖u - v‖ + ‖ℓh - ℓ|_Y + (A v)|_Y - Ah v‖ / α`. Ern–Guermond II,
  Lemma 27.12, p. 50, which takes the supremum of the consistency error over `v`; the pointwise
  form here implies it.
- **Second Strang lemma** (`norm_sub_le_strang_second`): for a nonconforming trial space `Xh` in a
  normed space `Z` containing `u`, a form `Ah : Z →L[ℝ] StrongDual ℝ W` stable on `Xh`, and
  `Ah u_h = ℓh`,
  `‖u - u_h‖ ≤ (1 + ‖Ah‖/α) * Metric.infDist u Xh + ‖ℓh - Ah u‖ / α`. Ern–Guermond II,
  Lemma 27.15, p. 51.
- **Strang's lemma in the energy inner product** (`norm_sub_le_strang_energy`): if the norm of `Z`
  comes from the discrete inner product, then for every `u` and every u_h ∈ Xh,
  `‖u - u_h‖ ≤ Metric.infDist u Xh + ‖(innerSL ℝ (u - u_h)).comp Xh.subtypeL‖`. Brenner–Scott
  (10.1.9), p. 274.
- **Abstract Aubin–Nitsche lemma** (`norm_le_of_dualApproximation`): for `A` on `V × V`, a
  continuous map `J : V → H` into an inner product space, `e` Galerkin-orthogonal to `X`, and
  `δ ≥ 0` such that for every `g ∈ H` the dual problem `a(v, z) = ⟪J v, g⟫` for all `v` has a
  solution `z` within `δ ‖g‖` of `X`, `‖J e‖ ≤ ‖A‖ δ ‖e‖`. Han–Atkinson, Theorem 10.4.3, p. 417;
  Ern–Guermond II, Lemma 32.10, p. 121.

*Needs:* 1.3.

**Checks.**

- Strang energy in `ℝ²` with `Xh = span e₁`, `u = (1, 1)`, u_h = (2, 0): left side `√2 = 1.4142`,
  right side `1 + 1 = 2`.
- Second Strang with `Ah = A` on a conforming space: the consistency term `‖ℓh - Ah u‖` is `0`
  and the bound is Babuška's.
- Negative control: in the dual approximation lemma take `V = H = ℝ²`, `A` the identity,
  `J = diag(0, 1)` and `X = span e₂`. Every dual solution `z = Jᵀ g` lies in `X`, so `δ = 0`, and
  the lemma gives `J e = 0` for `e` orthogonal to `e₂`; for `e = e₂`, which is not orthogonal to
  `X`, `‖J e‖ = 1`. Galerkin orthogonality cannot be dropped.

## Layer 2: simplices and meshes

### 2.1 Cells

- `refSimplex d` is `{x | 0 ≤ xᵢ, ∑ xᵢ ≤ 1}`; `cellMap K` is the affine map
  `x ↦ v₀ + ∑ xᵢ (vᵢ₊₁ - v₀)` with linear part `cellLinear K`; `cellOpen K` is the topological
  interior of the closed cell, as an open set.
- **The cell map** (`cellMap_image_refSimplex`, `cellMap_bijective`): `cellMap K` maps
  `refSimplex d` onto the closed cell and is bijective. Brenner–Scott (3.4.1), p. 82; the
  Jacobian bound `‖J_K‖ ≤ h_K / ρ̂` is Ern–Guermond I, Lemma 11.1, p. 123, and is consumed from
  SobolevPolynomialApproximation §2.3.
- **Diameters** (`cellInball_le_cellDiam`): `0 < ρ_K ≤ h_K`. Proof route: the inscribed ball lies
  in the cell (next bullet) and has diameter `ρ_K`; `Affine.Simplex.inradius` is positive.
- **Inscribed ball** (`ball_subset_and_starConvex`): the open ball about `Affine.Simplex.incenter`
  of radius `inradius` lies in the closed cell, and the cell is star-shaped with respect to every
  point of it. This is the hypothesis of the Bramble–Hilbert lemma of
  SobolevPolynomialApproximation §4.1 with chunkiness `h_K / (ρ_K / 2) ≤ 2σ` under shape
  regularity. Proof route: the closed cell is convex and contains the ball.
- **Interior** (`interior_closedInterior`): the topological interior of the closed cell is the
  open simplex `Affine.Simplex.interior` (for `d ≥ 1`). Proof route: the barycentric coordinates
  are continuous affine functions.

*Needs:* Mathlib affine simplices, incenter and inradius.

**Checks.**

- `d = 1`, `K = [0, h]`: `h_K = h`, `ρ_K = h`, ratio `1` (Ern–Guermond I, Example 11.3, p. 125).
- Equilateral triangle of side `1`: inradius `1/(2√3)`, `ρ_K = 0.5774`, ratio `√3 = 1.7321`; the
  reference triangle: `h_K = √2`, `ρ_K = 2 - √2 = 0.5858`, ratio `1 + √2 = 2.4142`.
- Negative control: in `d = 0` the closed cell is the whole (one-point) space and its topological
  interior is that point, while `Affine.Simplex.interior` is empty; this is why the interior
  statement assumes `d ≥ 1`.

### 2.2 Meshes

- `SimplicialMesh d` has cells with pairwise disjoint open simplices that meet in convex hulls of
  common vertices; `SimplicialMesh.domain` is the union of the closed cells,
  `SimplicialMesh.domainOpens` its interior and `SimplicialMesh.meshSize` the largest `h_K` (`0` for
  the empty mesh). Ern–Guermond I, Definition 8.11, p. 94; Brenner–Scott (3.3.11), p. 79.
- `IsShapeRegular T σ` is `h_K ≤ σ ρ_K` for every cell of every mesh (Ern–Guermond I,
  Definition 11.2, p. 124); `IsQuasiUniform T τ` is `meshSize ≤ τ h_K` (Ern–Guermond I,
  Definition 22.20, p. 284).
- `SimplicialMesh.SharesFacet M i j`: `d` vertices of cell `i` are vertices of cell `j`.
  `SimplicialMesh.HasConnectedStars M`: for every point `x`, any two cells containing `x` are
  joined by a chain of cells containing `x`, consecutive ones sharing a facet.
- **Bounded overlap** (`card_cells_meeting_le`): under shape regularity a point lies in at most
  `N(d, σ)` cells. Proof route: each cell containing `x` covers a solid angle at `x` bounded below
  in terms of `σ` (Ern–Guermond I, Remark 11.5, p. 125), and the open cells are disjoint.
- **Neighbouring cells** (`exists_cellDiam_le_of_meet`): for `d ≥ 2`, under shape regularity and
  connected stars, cells that meet have comparable diameters, `h_K ≤ κ(d, σ) h_K'`. Ern–Guermond
  I, Proposition 11.6, p. 125, whose proof walks through the cells around a vertex across shared
  faces; connected stars is the hypothesis that makes the walk possible, and the chain has at most
  `N(d, σ)` steps. Each step uses that a facet of a shape-regular cell has diameter comparable to
  the cell: every edge has length at least `ρ_K / 2`, because the inradius is
  `d |K| / ∑ |Fᵢ|` and `|K| ≤ |F| ℓ / d` for the facet `F` opposite an endpoint of an edge of
  length `ℓ`. The proposition is stated there for every `d`, but in `d = 1` the faces are points
  and the comparison fails (next Checks).

*Needs:* 2.1.

**Checks.**

- `d = 1`, `n` equal cells of `[0, 1]`: meshSize `1/n`, shape constant `1`, quasi-uniform with
  `τ = 1`, at most `2` cells at any point.
- Negative control: two triangles meeting only at a common vertex, of diameters `1` and `ε`, form
  a conforming, shape-regular mesh (each triangle equilateral) with `h_K / h_K' = 1/ε`; the star of
  the common vertex is not connected through facets. Shape regularity alone does not give local
  quasi-uniformity.
- Negative control: in `d = 1` every mesh is shape regular (`h_K = ρ_K`, Ern–Guermond I,
  Example 11.3, p. 125), and the cells `[0, 1]` and `[1, 1 + ε]` share the facet `{1}` with a
  connected star, yet `h_K / h_K' = 1/ε`; this is why the neighbouring-cells statement assumes
  `d ≥ 2`.
- Negative control: a triangle with a vertex of another triangle in the interior of one of its
  edges (a hanging node) violates `conforming`: the two cells meet in a segment whose endpoint is
  not a vertex of the first.

## Layer 3: finite elements

### 3.1 Ciarlet elements

- `CiarletElement d ι` is a cell `K`, a space `P` of shape functions inside a space `D` of
  functions, and degrees of freedom `dof i : D →ₗ[ℝ] ℝ`. `CiarletElement.evalDof` sends a shape
  function to its vector of degrees of freedom and `CiarletElement.IsUnisolvent` is its
  bijectivity. Ern–Guermond I, Definition 5.2, p. 51. Unisolvence
  is a predicate, not a field, so the Lagrange element can be constructed before it is proved.
- **Unisolvence by counting** (`CiarletElement.isUnisolvent_iff`): for finite `ι`, unisolvence is
  `card ι = finrank P` together with injectivity of `evalDof`. Ern–Guermond I, Remark 5.3, p. 51;
  Brenner–Scott (3.1.4), p. 70. No finite-dimensionality is assumed: an injective map into
  `ι → ℝ` forces it.
- `CiarletElement.shapeFunction` is the nodal basis and `CiarletElement.localInterpolant` the
  local interpolation operator `D → P`, both through `LinearEquiv.ofBijective` with the
  unisolvence proof as argument.
- **Duality** (`CiarletElement.dof_shapeFunction`): `dof j (θ_i) = δᵢⱼ`. Ern–Guermond I,
  Proposition 5.5, p. 51. Proved in `Suggested.lean`.
- **Projection** (`CiarletElement.localInterpolant_inclusion`): the local interpolant is the
  identity on `P`. Proved in `Suggested.lean`.

*Needs:* Mathlib `LinearEquiv.ofBijective`.

**Checks.**

- `P` the affine functions on an interval, two point evaluations at the endpoints: unisolvent,
  shape functions `1 - x` and `x` on `[0, 1]`.
- Negative control: `P = P₂` on `[0, 1]` with evaluations at `0` and `1`: `card ι = 2 ≠ 3`; and
  `P = P₁` with evaluations at `0, 1/2, 1`: injective but `3 ≠ 2`. Both halves of the counting
  criterion are needed.
- Negative control: `P₂` with evaluations at the vertices of the reference triangle and at three
  further points of the circle `x² + y² - x - y = 0` through them, such as `(1, 1)`, is not
  unisolvent: the quadratic `x² + y² - x - y` vanishes at all six points. The counting condition
  holds and injectivity fails.

### 3.2 The Lagrange element

- `node K k α` is the Lagrange node with barycentric coordinates `α / k`; `lagrangeElement K k`
  takes `P = polynomialsDegLE d k` (local copy of SobolevPolynomialApproximation §1.2), `D` all
  functions, and point evaluations at the nodes. `IsLagrangeInterpolant K k f q` says `q ∈ P_k`
  agrees with `f` at the nodes.
- **Unisolvence** (`isUnisolvent_lagrangeElement`): for every `k` and every nondegenerate `K`.
  Ern–Guermond I, Proposition 7.12, p. 79 (`k ≥ 1`); Brenner–Scott (3.1.10), p. 71, is the
  factorization step: a polynomial vanishing on a hyperplane `L = 0` is `L Q`. At `k = 0` the
  single node is the origin and the constants are unisolvent for any single point.
- **Interpolant** (`existsUnique_isLagrangeInterpolant`): every `f` has exactly one Lagrange
  interpolant of degree `k` on `K`. Immediate from unisolvence.
- **Affine equivalence** (`node_map`, `isLagrangeInterpolant_map_iff`): for `1 ≤ k` and an
  injective affine `A`, the nodes of `K.map A` (Mathlib `Affine.Simplex.map`) are the images of
  the nodes of `K`, and `q` interpolates `f` on `K.map A` iff `q ∘ A` interpolates `f ∘ A` on `K`.
  Brenner–Scott (3.4.4), p. 82; the invariance of P_k under affine maps is
  SobolevPolynomialApproximation §2.3.
- **Face unisolvence** (`eqOn_zero_of_face`): for `1 ≤ k`, a `q ∈ P_k` vanishing at the nodes with
  `αᵢ = 0` vanishes on the face opposite vertex `i`. Ern–Guermond I, Lemma 7.13, p. 80.

*Needs:* 3.1; SobolevPolynomialApproximation §1.2 and §2.3.

**Checks.**

- The number of nodes is `C(k + d, d) = finrank P_k`: verified for `d ≤ 3`, `k ≤ 4`.
- Reference triangle, monomial basis: the node matrix has determinant `1` (`k = 1`), `1/64`
  (`k = 2`) and `1.652 · 10⁻⁷` (`k = 3`), nonzero in each case.
- Negative control: at `k = 0` the node formula gives the origin for every cell, outside the cell
  in general; `node_map` fails there (`A 0 ≠ 0` for a translation), which is why it assumes
  `1 ≤ k`.

## Layer 4: Lagrange finite element spaces

### 4.1 The discrete space and its degrees of freedom

- `lagrangeSpace M k` is the space of functions on `E d` that vanish off `SimplicialMesh.domain`,
  are continuous on it, and agree on each closed cell with a polynomial of degree `≤ k`.
  `globalNodes M k` is the union of the nodes of all cells.
- **Finite dimension** (`finiteDimensional_lagrangeSpace`). Proof route: a function in the space
  is determined by its cell polynomials.
- **Global unisolvence** (`bijective_eval_globalNodes`): for `1 ≤ k`, evaluation at the global
  nodes is a bijection from `lagrangeSpace M k` onto the functions on `globalNodes M k`. Hence the
  global shape functions form a basis. Ern–Guermond I, Proposition 19.4, p. 231. Proof route:
  surjectivity glues the local interpolants, which agree on a shared subsimplex by face
  unisolvence applied in every dimension; conformity makes the nodes of a shared subsimplex the
  same from both sides.

*Needs:* 2.2, 3.2.

**Checks.**

- `d = 1`, `n` cells, `k = 1`: `n + 1` global nodes and dimension `n + 1`; `k = 2`: `2n + 1`.
- Two triangles sharing an edge, `k = 1`: `4` nodes; `k = 2`: `9`.
- Negative control: at `k = 0` the space is the functions constant on each cell and continuous,
  while every node is the origin, so `globalNodes M 0` is one point, in general outside the
  domain, where every function of the space vanishes; evaluation is not injective, which is why
  global unisolvence assumes `1 ≤ k`.
- Negative control: with a hanging node (not a `SimplicialMesh`: a triangle with edge `[a, b]` and,
  on the other side, two triangles sharing the midpoint `m` of `[a, b]`), every continuous
  piecewise linear function has `v(m) = (v(a) + v(b))/2`, so evaluation at all vertices, `m`
  included, is not surjective.

### 4.2 Conformity

- `lagrangeSubmoduleW1p Ω p M k` is the submodule of `W1p volume Ω p` of elements whose value is
  almost everywhere a function of `lagrangeSpace M k`; `lagrangeSubmoduleW1p0 Ω p M k` is its
  preimage in `W1p0 volume Ω p`.
- **`H¹`-conformity** (`exists_W1p_of_mem_lagrangeSpace`): every `v ∈ lagrangeSpace M k` is the
  value of an element of `W1p volume M.domainOpens p`, for every `p`. Ern–Guermond I,
  Theorem 18.8, p. 218 (a broken Sobolev function has a weak gradient iff its jumps vanish);
  Brenner–Scott (3.3.17), p. 81.
- **Zero boundary values** (`exists_W1p0_of_mem_lagrangeSpace`): for `p < ∞`, if `v` also vanishes
  on the frontier of the domain it is the value of an element of `W1p0`. Proof route: `v` is
  Lipschitz and the truncations `(v - ε)⁺ - (v + ε)⁻` have compact support in the open domain.
- **The converse**: if the Sobolev version of `v ∈ lagrangeSpace M k` lies in `W1p0`, then `v`
  vanishes on the frontier of the domain. Proof route: by conformity every frontier point lies in
  a facet of some cell that is shared with no other cell, the exterior of the domain is locally on
  the other side of that facet, and the trace from the cell (PDE §1.6) of the extension by zero is
  both the restriction of `v` and `0`.
- **Additivity over cells** (`lintegral_domain_eq_sum`): for `d ≥ 1` and `f ≥ 0`,
  `∫⁻ over the domain = ∑ over cells ∫⁻ over the closed cell`. Proof route: closed cells overlap
  in their boundaries, which are null. In `d = 0` the one-point cell may be repeated and the point
  has measure `1`, so the sum counts it twice.

*Needs:* 4.1; Tau Ceti `W1p`, `W1p0` and the almost-everywhere linearity of `W1p.value`
(`TauCeti.W1p.value_add_ae`).

**Checks.**

- `d = 1`, the hat function at `1/2` on two cells of `[0, 1]`: weak derivative `2` and `-2`,
  `‖∇v‖_{L²} = 2`, value in `W1p0`.
- Negative control: a function equal to `0` on one triangle and to `1` on a neighbouring one is
  polynomial on each cell but not continuous, not in `lagrangeSpace`, and has no weak gradient:
  the jump across the shared edge is `1`.

## Layer 5: interpolation and inverse estimates

### 5.1 Nodal interpolation

- **Local interpolation error** (`exists_lagrangeInterpolation_error_le`): for `1 ≤ k`,
  `r ≤ k + 1`, `m ≤ r` and `d < r p` or (`p = 1` and `d ≤ r`), there is `C(d, k, r, m, p, σ)` such
  that on every cell with `h_K ≤ σ ρ_K`, for `u ∈ W^{r,p}(int K)` with a representative `f`
  continuous on the closed cell and `q` its Lagrange interpolant, `f - q` is the value of some
  `e ∈ W^{r,p}(int K)` with `|e|_{m,p} ≤ C h_K^{r-m} |u|_{r,p}`. Ern–Guermond I, Theorem 11.13,
  pp. 129–130; Brenner–Scott (4.4.20), p. 108. Proof route: on the reference cell, point
  evaluation is bounded on `W^{r,p}` (SobolevPolynomialApproximation §5.1), the interpolant is the
  identity on P_k, and the Bramble–Hilbert lemma (its §4.1) bounds the error; the affine scaling
  of its §2.2 with the geometric bounds of its §2.3 transfers the estimate to `K`.
- **Global interpolation error** (`exists_globalInterpolation_error_le`): on a mesh with
  `h_K ≤ σ ρ_K`, if `v ∈ lagrangeSpace M k` agrees with the continuous representative `f` of `u`
  at the global nodes, then on each cell `K` the restriction of `f - v` is the value of some
  function e_K in `W^{r,p}(int K)` with `|e_K|_{m,p} ≤ C h_K^{r-m} |u|_{r,p,K}`, with the same `C`
  for every cell. Ern–Guermond I, Corollary 19.8, p. 238, which sums the `p`-th powers. Proof
  route: on each cell `v` is the local interpolant. The error is stated cell by cell because a
  continuous piecewise polynomial is not in `W^{2,p}(Ω)`: for `r ≥ 2` the function `f - v` has no
  `W^{r,p}(Ω)` version.

*Needs:* 2.1, 3.2, 4.1; SobolevPolynomialApproximation §2.2, §2.3, §4.1 and §5.1; Tau Ceti
`TauCeti.Wkp.restrictL`.

**Checks.**

- `d = 1`, `k = 1`, `f = sin πx` on `n` equal cells: the maximum error is `0.01885`, `0.004792`,
  `0.001203`, `0.0003011` for `n = 8, 16, 32, 64`, ratio `→ 4` (`r - m = 2`), and below the bound
  `h² ‖f''‖_∞ / 8 = 0.01928, …`; the `H¹` seminorm error halves (`r - m = 1`).
- Negative control: `d = 2`, `p = 2`, `r = 1` violates `d < r p`: `log log (1/|x|)` near `0` is in
  `H¹` of a disc but unbounded, so nodal interpolation is not defined on `H¹` in two dimensions.
- Negative control: one `W^{r,p}(Ω)` error on the whole mesh is wrong for `r ≥ 2`: for `f = x²`
  on the cells `[0, 1/2]` and `[1/2, 1]` the linear interpolant has slopes `1/2` and `3/2`, so the
  derivative of `f - v` jumps by `1` at `1/2` and `f - v ∉ H²(0, 1)`.
- Negative control: `r ≤ k + 1` cannot be dropped: for `k = 1`, `r = 3`, `m = 0` and `f = x²` on
  `[0, h]` the error of the linear interpolant is `h²/4` at the midpoint while `|f|_{3} = 0`.

### 5.2 The Scott–Zhang operator

- **Existence and approximation** (`exists_scottZhang`): for `p < ∞`, `1 ≤ k`, `s ≤ k`, there is
  `C(d, k, s, p, σ)` such that every mesh with `h_K ≤ σ ρ_K` and connected stars carries a
  continuous linear `I : W^{1,p}(Ω) → W^{1,p}(Ω)` with range in `lagrangeSubmoduleW1p`, the
  identity on it, preserving `W1p0`, and for `u ∈ W^{s+1,p}(Ω)`
  `∑_K ‖u - I u‖^p_{L^p(K)} ≤ C ∑_K (h_K^{s+1} |u|_{s+1,p,K})^p` and
  `∑_K ‖∇(u - I u)‖^p_{L^p(K)} ≤ C ∑_K (h_K^s |u|_{s+1,p,K})^p`. Brenner–Scott (4.8.7)–(4.8.16),
  pp. 122–123, whose local estimates are on the patch S_K of cells meeting `K`; the sums follow
  by bounded overlap (2.2) and, for `d ≥ 2`, comparable diameters on a patch
  (`exists_cellDiam_le_of_meet`). In `d = 1` the face averages are point values at the vertices,
  the operator is nodal interpolation, and the estimates are local to each cell.
  Brenner–Scott state (4.8.16) with the seminorm `|v|_{W^k_p}` on the right where the norm is
  meant: for `v` constant and `k ≥ 1` the stated bound gives `‖v‖ ≤ 0`.
- **Stability**: `‖I u‖_{W^{1,p}(K)} ≤ C ‖u‖_{W^{1,p}(S_K)}`, and the local estimates for `p = ∞`.
  Brenner–Scott, the display before (4.8.9) and (4.8.10), p. 122. Stated in prose: the patch
  seminorm needs a restriction to a union of cells that is not an open cell.

*Needs:* 2.2, 4.2, 5.1; SobolevPolynomialApproximation §4.1; Mathlib `Measure.hausdorffMeasure`
for the face averages.

**Checks.**

- `d = 1`, `k = 1`: the Scott–Zhang operator with face averages at the vertices is nodal
  interpolation, and the estimates reduce to those of 5.1.
- Negative control: two triangles meeting at a vertex (2.2, Checks), `u = 0` on one and `u = 1` on
  the other: `u ∈ W^{1,p}` of the (disconnected) interior with `∇u = 0`, but the value at the
  common vertex is taken from one side, so `u - I u ≠ 0` on the other triangle while the right
  side is `0`. This is why the operator assumes connected stars.

### 5.3 Inverse estimates and discrete traces

- **Local inverse estimate** (`exists_inverse_estimate`): for `m ≤ l` and `1 ≤ p, q ≤ ∞`, there is
  `C(d, k, l, m, p, q, σ)` with
  `‖D^l v‖_{L^q(K)} ≤ C h_K^{m - l + d (1/q - 1/p)} ‖D^m v‖_{L^p(K)}` for `v ∈ P_k` on every cell
  with `h_K ≤ σ ρ_K`, with classical derivatives `iteratedFDeriv` and `eLpNorm`. Brenner–Scott
  (4.5.3), p. 111; Ern–Guermond I, Lemma 12.1, p. 137. The exponent `1/p` is `0` at `p = ∞`.
- **Discrete trace inequality** (`exists_discrete_trace`): `‖v‖_{L²(F)} ≤ C h_K^{-1/2} ‖v‖_{L²(K)}`
  for `v ∈ P_k` and every face `F` of a shape-regular cell, with the `(d-1)`-dimensional Hausdorff
  measure on `F`. Ern–Guermond I, Lemma 12.8, p. 140; Di Pietro–Ern, Lemma 1.46, p. 27.
- **Global inverse estimate** (`exists_global_inverse_estimate`): on a shape-regular
  quasi-uniform family, `‖∇v‖_{L^p} ≤ C h⁻¹ ‖v‖_{L^p}` for every `v ∈ lagrangeSubmoduleW1p`.
  Brenner–Scott (4.5.11), p. 112.

*Needs:* 2.1, 2.2, 3.2, 4.2; SobolevPolynomialApproximation §2.2.

**Checks.**

- `d = 1`, `K = [0, h]`, `k = 1`, `p = q = 2`, `l = 1`, `m = 0`: the best constant is
  `√12 / h = 2√3 / h`, attained by `x - h/2`; for `k = 2` it is `√60 / h`.
- `d = 1`, `k = 1`: `v(0)² ≤ (4/h) ∫₀ʰ v²`, so the trace constant is `2`; for `k = 2` it is `3`.
- Negative control: the exponent `h^{-1}` cannot be replaced by `h^0`: the constants above scale as
  `1/h` exactly (the ratio times `h²` is `12` for `h = 1` and `h = 1/2`).
- Negative control: without quasi-uniformity the global inverse estimate fails: in `d = 1`, for
  the hat function at the node between a cell of length `ε` and one of length `h`,
  `‖v'‖² = 1/ε + 1/h` and `‖v‖² = (ε + h)/3`, so `‖v'‖ / ‖v‖ = √(3/(ε h))`, unbounded against
  `C / h` as `ε → 0`.

## Layer 6: the Lagrange finite element method for an elliptic problem

Throughout, `Ω` is open, `A : E d → Matrix (Fin d) (Fin d) ℝ` is almost everywhere strongly
measurable with `TauCeti.PDE.UniformlyEllipticOn Ω A λ Λ`, the problem is
`-div(A ∇u) = f` with `u ∈ H¹₀(Ω)` (`TauCeti.PDE.IsWeakSolutionDirichlet A 0 0 f u`, PDE §4.1),
and a family of meshes has `(T n).domainOpens = Ω` for all `n`.

### 6.1 The discrete problem and Céa's lemma

- `IsGalerkinSolution A f Vh u_h`: u_h ∈ Vh and `TauCeti.PDE.energyFormH1 A 0 0 u_h v` equals
  `TauCeti.PDE.dirichletForcing f v` for every `v ∈ Vh`.
- **Existence and uniqueness** (`existsUnique_isGalerkinSolution`): for every finite-dimensional
  `Vh ⊆ H¹₀(Ω)`. Ern–Guermond II, Lemma 26.3, p. 29. Proof route: injectivity on `Vh`, since
  `∇v = 0` and `v ∈ H¹₀(Ω)` force `v = 0` (extend by zero to `E d`); no Poincaré inequality is
  needed in finite dimension.
- **Céa's lemma in the energy seminorm** (`norm_gradient_sub_le_cea`): for every `v ∈ Vh`,
  `‖∇(u - u_h)‖ ≤ (Λ / λ) ‖∇(u - v)‖`. Brenner–Scott (2.8.1), p. 64, and Ern–Guermond II,
  Theorem 32.2, p. 117, applied in the gradient seminorm, in which the form is coercive with
  constant `λ` and bounded by `Λ` on `H¹₀(Ω)`.

*Needs:* Layer 1; PDE §4.1.

**Checks.**

- `A = I` (`λ = Λ = 1`): the Galerkin solution is the `H¹₀`-seminorm projection, and in `d = 1`
  it equals the nodal interpolant (1.3, Checks).
- `A = diag(1, 4)` in `d = 2` (`λ = 1`, `Λ = 4`): the constant is `4`; Céa in the gradient
  seminorm does not use symmetry, whereas the symmetric bound of 1.3 in the energy norm gives `2`.

### 6.2 Convergence and rates in the energy norm

- **Convergence** (`tendsto_galerkin`): for a shape-regular family with `meshSize → 0`, `1 ≤ k`
  and Galerkin solutions u_h in `lagrangeSubmoduleW1p0`, `‖∇(u - u_h)‖ → 0`. Ern–Guermond II,
  Corollary 26.15, pp. 34–35. Proof route: Céa, density of `C_c^∞(Ω)` in `H¹₀(Ω)`, and the
  interpolation estimate of 5.1 with `p = ∞`, `r = 2`, `m = 1` for a test function, whose nodal
  interpolant vanishes on the frontier by face unisolvence.
- **Rate** (`exists_galerkin_rate`): for `1 ≤ s ≤ k`, shape regularity and connected stars, if
  `u` is the first-order part of `w ∈ W^{s+1,2}(Ω)`, then
  `‖∇(u - u_h)‖ ≤ C h^s |w|_{s+1,2}`. Brenner–Scott (5.4.4), p. 136; Ern–Guermond II,
  Theorem 32.2, p. 117. Proof route: Céa with the Scott–Zhang operator of 5.2, `p = 2`.

*Needs:* 5.1, 5.2, 6.1.

**Checks.**

- `d = 1`, `k = 1`, `u = sin πx`: `‖∇(u - u_h)‖ = 0.2512, 0.1258, 0.06295, 0.03148` for
  `n = 8, 16, 32, 64`, ratio `2.00` (rate `h¹`).
- Negative control: `s = 0` is excluded; for `u ∈ H¹₀` only, convergence holds without a rate.

### 6.3 Duality and the `L²` rate

- `HasAdjointH2Regularity Ω A Creg`: for every `g ∈ L²(Ω)` the weak solution `z ∈ H¹₀(Ω)` of
  `-div(Aᵀ ∇z) = g` is the first-order part of some `w ∈ H²(Ω)` with `|w|_{2,2} ≤ Creg ‖g‖`. This
  is the elliptic regularity of convex or smooth domains; no roadmap on main proves it for convex
  polyhedra (PDE's regularity theory is for smooth domains), so it is a hypothesis.
- **Aubin–Nitsche** (`exists_aubinNitsche`): under adjoint `H²` regularity, shape regularity and
  connected stars, `‖u - u_h‖_{L²} ≤ C h ‖∇(u - u_h)‖`. Ern–Guermond II, Lemma 32.11 with the
  smoothing property (32.18), p. 122; Brenner–Scott (5.4.8) with (5.4.7), p. 137.
  Proof route: the abstract lemma of 1.4 with `g = u - u_h` and the Scott–Zhang estimate for `z`.
- **`L²` rate** (`exists_galerkin_L2_rate`): with the hypotheses of the rate in 6.2 and adjoint
  `H²` regularity, `‖u - u_h‖_{L²} ≤ C h^{s+1} |w|_{s+1,2}`. Brenner–Scott (5.4.8), p. 137.

*Needs:* 1.4, 5.2, 6.2.

**Checks.**

- `d = 1`, `k = 1`, `u = sin πx` (an interval is convex): `‖u - u_h‖_{L²}` is `0.009921`,
  `0.002487`, `0.0006220`, `0.0001555` for `n = 8, …, 64`, ratio `4.00` (rate `h²`), against `2.00`
  in the energy norm.
- Negative control: on the L-shaped domain `(-1, 1)² \ [0, 1)²` the solution `r^{2/3} sin(2θ/3)`
  of the Laplace equation is not in `H²`, adjoint `H²` regularity fails, and the `L²` rate of
  piecewise linears is `h^{4/3}`, not `h²`.

## Downstream consumers

- Mixed finite elements and saddle-point problems: the discrete inf-sup condition and Fortin's
  criterion of 1.2.
- Nonconforming and discontinuous Galerkin methods: the second Strang lemma of 1.4, the discrete
  trace inequality and inverse estimates of 5.3.
- Time-dependent Galerkin methods: the Lagrange spaces of Layer 4 and the Scott–Zhang operator as
  a stable projection.
- Finite element eigenvalue approximation and adaptive finite elements: the error estimates of
  Layer 6, the bounded overlap of 2.2 and the local estimates of 5.2.
- Multilevel solvers and model reduction: the global inverse estimate and the abstract Galerkin
  bounds.

## Scope and ownership

This roadmap owns meshes, Ciarlet finite elements, Lagrange finite element spaces and their
interpolation operators, and the abstract Galerkin theory: Banach–Nečas–Babuška in the form of
1.1, the discrete inf-sup condition and Fortin's criterion, Céa, Babuška, Xu–Zikatanov, the Strang
lemmas and the abstract Aubin–Nitsche lemma.

It does not build Sobolev spaces: `W^{1,p}`, `W^{1,p}_0` and `W^{k,p}` are Tau Ceti's, and the
weak Dirichlet problem is PDE §4.1–4.2. It does not prove polynomial approximation on a convex
domain, the Bramble–Hilbert lemma or Sobolev point evaluation; those are
SobolevPolynomialApproximation §§4.1 and 5.1, and this roadmap supplies their hypotheses for a
cell (`ball_subset_and_starConvex`). Elliptic `H²` regularity on convex polyhedra is a hypothesis
(6.3). Ritz–Galerkin approximation of eigenvalues of compact form pairs is
[VariationalMethods](../VariationalMethods/README.md) §6.1; finite element eigenvalue estimates
build on both roadmaps and are not stated here. Mathlib's Lax–Milgram theorem
(`IsCoercive.continuousLinearEquivOfBilin`) is consumed, not reproved; 1.1 is the Banach-space
generalization.

## Exact supplier contracts

### From Mathlib

- **Functional analysis:** `IsCoercive`, `IsCoercive.continuousLinearEquivOfBilin`,
  `NormedSpace.inclusionInDoubleDual`, `innerSL`, `Metric.infDist`, `LinearEquiv.ofBijective`.
- **Affine geometry:** `Affine.Simplex.closedInterior`, `Affine.Simplex.interior`,
  `Affine.Simplex.map`, `Affine.Simplex.incenter`, `Affine.Simplex.inradius`
  (`Mathlib/Geometry/Euclidean/Incenter/Basic.lean`), `convexHull`.
- **Polynomials and combinatorics:** `MvPolynomial.restrictTotalDegree`,
  `Finset.Nat.antidiagonalTuple`.
- **Analysis and measure:** `iteratedFDeriv`, `MeasureTheory.eLpNorm`,
  `MeasureTheory.Measure.hausdorffMeasure`.

### From Tau Ceti

- **Sobolev spaces** (`TauCeti/Analysis/Sobolev/`): `TauCeti.W1p`, `TauCeti.W1p0`, `TauCeti.Wkp`,
  `TauCeti.W1p.value`, `TauCeti.W1p.gradient`, `TauCeti.W1p.value_add_ae`,
  `TauCeti.W1p.restrictL`, `TauCeti.Wkp.value`, `TauCeti.Wkp.firstOrder`,
  `TauCeti.Wkp.lowerOrderL`, `TauCeti.Wkp.iteratedGradient`, `TauCeti.Wkp.restrictL`.
- **Elliptic problems** (`TauCeti/Analysis/PDE/`): `TauCeti.PDE.energyFormH1`,
  `TauCeti.PDE.energyFormH1L0`, `TauCeti.PDE.dirichletForcing`,
  `TauCeti.PDE.IsWeakSolutionDirichlet`, `TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`,
  `TauCeti.PDE.UniformlyEllipticOn`.

### From PDE

- §1.2: the zero-boundary space `H¹₀(Ω)` and density of test functions in it (6.2).
- §4.1: the weak formulation and the energy form of a divergence-form operator (Layer 6).
- §4.2: existence and uniqueness in the coercive case, for the weak solution `u` that Layer 6
  approximates and for the adjoint problem of 6.3.

### From SobolevPolynomialApproximation

- Conventions and §1.2: `E`, `evalₗ` and `polynomialsDegLE`, copied verbatim.
- §1.3: `toOrderL` and `seminorm`, copied verbatim.
- §2.2: the affine scaling of seminorms (5.1, 5.3).
- §2.3: the geometric bounds on the linear part of an affine map and the invariance of
  polynomials (3.2, 5.1).
- §4.1: the Bramble–Hilbert lemma on a domain star-shaped with respect to a ball (5.1, 5.2).
- §5.1: point evaluation on `W^{k,p}` for `k p > n` or `p = 1`, `k ≥ n` (5.1).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- Interpolation of functions in fractional Sobolev spaces (`r ∉ ℕ`) and rates `h^{s}` for
  fractional `s`, which need fractional Sobolev spaces on domains.
- Polynomial approximation in `W^{k,∞}` on Lipschitz domains (the residual of the polynomial
  approximation item beyond cells): cells are convex and are covered by
  SobolevPolynomialApproximation §4.1.
- `H²` regularity on convex polyhedra and the `H^{1+s}` regularity of polygonal domains, which
  would discharge `HasAdjointH2Regularity`.
- Mesh refinement, bisection and the closure estimates of adaptive methods.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (commit 8efdbf7, `NASC/Galerkin.lean`)
proves without `sorry` the following abstract Galerkin targets, in forms close to those here
(best approximation there is an infimum of distances):

- 1.2: Fortin's criterion for a continuous linear Fortin operator
  (NASC.norm_restrict_ge_of_fortin);
- 1.3: Babuška's bound (NASC.norm_galerkinError_le_of_infSup), and the best approximation of the
  Galerkin solution in the energy norm of a symmetric form (NASC.galerkin_energy_error_le), the
  step from which the symmetric Céa bound follows;
- 1.4: the first Strang lemma at a fixed comparison function (NASC.norm_galerkinError_le_strang)
  and the abstract Aubin–Nitsche lemma (NASC.norm_weak_galerkinError_le_of_dualApproximation).

Mathlib (commit `1b1ccf4`) has affine simplices with their incenter and inradius, and
Lax–Milgram; it has no meshes or finite elements.

## References

- A. Ern and J.-L. Guermond, *Finite Elements I: Approximation and Interpolation*, Texts in
  Applied Mathematics 72, Springer, 2021. Cited as Ern–Guermond I.
- A. Ern and J.-L. Guermond, *Finite Elements II: Galerkin Approximation, Elliptic and Mixed
  PDEs*, Texts in Applied Mathematics 73, Springer, 2021. Cited as Ern–Guermond II.
- S. C. Brenner and L. R. Scott, *The Mathematical Theory of Finite Element Methods*, 3rd ed.,
  Texts in Applied Mathematics 15, Springer, 2008.
- W. Han and K. Atkinson, *Theoretical Numerical Analysis: A Functional Analysis Framework*,
  3rd ed., Texts in Applied Mathematics 39, Springer, 2009.
- D. Boffi, F. Brezzi and M. Fortin, *Mixed Finite Element Methods and Applications*, Springer
  Series in Computational Mathematics 44, Springer, 2013.
- D. A. Di Pietro and A. Ern, *Mathematical Aspects of Discontinuous Galerkin Methods*,
  Mathématiques et Applications 69, Springer, 2012.
