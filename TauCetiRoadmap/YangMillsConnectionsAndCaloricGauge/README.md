# Roadmap: Yang–Mills connections on Euclidean space and the caloric gauge

**Summary.** Build the analytic theory of connections on Euclidean space with values in a compact
Lie group at the critical regularity, from the matrix-group and Sobolev material of Mathlib and
Tau Ceti to the caloric gauge of Oh and Tataru. The roadmap develops `G`-valued Sobolev maps at
the critical exponent and their homotopy classes on annuli; rough bundles and connections whose
curvature lies in `L^{d/2}` on open subsets of `ℝ^d`, `d ≥ 3`, with their gauge action;
Uhlenbeck's Coulomb gauge on balls and punctured balls for an arbitrary compact structure group;
the good global gauge theorem and the topological class of a rough connection; characteristic
numbers and the instanton number; harmonic Yang–Mills connections on `ℝ⁴` with their regularity,
decay at infinity, energy gap and ground state; the covariant elliptic and parabolic linear theory on
`ℝ⁴` in homogeneous Sobolev and Besov spaces; the Yang–Mills heat flow in the local caloric gauge;
and the caloric gauge with the manifold of caloric connections. Its end theorems are: gauge
invariance of finite energy; Uhlenbeck's lemma on the unit ball for every compact `G` and every
`d ≥ 3`; the good global gauge theorem; well-definedness, gauge invariance and locality of the
topological class, and the characterisation of the trivial class by `Ẇ^{1,d/2}` potentials;
topological invariance of every characteristic number; the Bogomol'nyi bound; integrality and
completeness of the instanton number for `SU(2)`; the energy gap and the ground state theorem;
local well-posedness, continuation and convergence to a flat limit for the heat flow; the
Dichotomy and Threshold Theorems; existence and uniqueness of the caloric gauge; and the theorem
that the caloric connections form a `C¹` submanifold of the Banach space `ℋ`, with its tangent
spaces and the nonlinear div–curl decomposition. The roadmap is this README;
`Suggested.lean` states the integrality of the `SU(2)` instanton number and the existence of every
integer value (§6.4), and records what the other headline signatures need beyond the pinned APIs.

## Scope and ownership

This roadmap owns, for a compact matrix group `G` with an `Ad`-invariant inner product on its
Lie algebra (Conventions):

- the comparison of Euclidean matrix formulas with SmoothBundlesConnections B3.1, B4.1–B4.2
  (gauge action, curvature, Bianchi identity, Leibniz rules), the derivative of the
  nearest-point retraction onto `G` (whose existence is RiemannianGeometry R6's),
  the Euclidean and right Maurer–Cartan form of CharacteristicClasses' curvature evaluation,
  transgression and Chern–Simons forms (C4 item 1, C5a.3) with the explicit `SU(2)`
  normalisation, the self-dual splitting
  of `𝔤`-valued 2-forms in dimension four with the pointwise Bogomol'nyi inequality, and the
  structure constant `γ₀` with the cubic bound for self-dual forms (Layer 1);
- the classes `G^{k,d/k}_loc` of matrix-valued Sobolev maps with values in `G` almost everywhere,
  their approximation by smooth `G`-valued maps, the continuity of products, inverses, Maurer–Cartan
  forms and the adjoint action, and the homotopy class of a critical map on an annulus (Layer 2);
- rough bundles and connections with `L^{d/2}_loc` curvature on open subsets of `ℝ^d`, `d ≥ 3`, their
  gauge action and patching, and the concentration radii (Layer 3);
- Uhlenbeck's lemmas on the unit ball and the punctured ball for every compact `G`, the elliptic
  regularity of the nonlinear div–curl system, and the good gauge on a ball (Layer 4);
- the good global gauge theorem on `ℝ^d`, the gauge at infinity, the topological class and its
  properties, and the characterisation of the trivial class (Layer 5);
- characteristic numbers of connections with `L^{d/2}` curvature in even dimension, their
  topological invariance, the integrated Bogomol'nyi bound, and the instanton number of `SU(2)`
  connections with its integrality and completeness (Layer 6);
- harmonic Yang–Mills connections on `ℝ⁴`: regularity, removable singularities and decay, the
  Weitzenböck and improved Kato inequalities, the energy gap, the BPST connection on `ℝ⁴` and the
  ground state energy (Layer 7);
- the finite-dimensional coefficient specialisations of PDE §7.2’s homogeneous spaces and of
  Tau Ceti's `TauCeti.D1p0`, the realised homogeneous spaces `Ẇ^{σ,p}` on `ℝ⁴`, the graph space
  `ℋ` and frequency envelopes on `ℝ⁴`, the homogeneous `L²` product estimates (distinct from PDE
  §7.3's inhomogeneous Hölder estimates), and the solvability theory of the covariant Laplacian
  and of the covariant heat operator (Layer 8);
- the covariant, dynamic and linearised Yang–Mills heat flows on `ℝ⁴`, their gauge fixings, the
  well-posedness and long-time theory in the local caloric gauge, and the Dichotomy and Threshold
  Theorems (Layer 9);
- flat `Ḣ¹` connections as pure gauges, caloric connections, the map `Cal`, the notion of a `C¹`
  split submanifold of a Banach space (a subset with charts that are Mathlib's `C¹` smooth embeddings), the
  caloric manifold, its tangent spaces, the projection `Π_a` and the bundle of caloric initial data sets
  (Layer 10).

It leaves to named roadmaps:

- **PDE** owns the Euclidean Sobolev spaces beyond the Tau Ceti carriers (density, embeddings,
  Poincaré inequalities, trace and extension on Lipschitz domains: §1.2, §1.4, §1.5, §1.6),
  Calderón–Zygmund theory and the Mihlin–Hörmander multiplier theorem (§2.3), Bochner spaces
  (§6.1), the heat semigroup on `ℝ^d` (§6.3), the dyadic partition with the Bernstein and
  Littlewood–Paley estimates (§7.1), Besov spaces with their homogeneous versions (§7.2) and
  paraproducts (§7.3). Everything here is scalar
  there and is applied componentwise to `𝔤`-valued functions in an orthonormal basis of `𝔤`.
  The `L^p` theory of the Neumann problem on the unit ball, the `L^p` div–curl estimate for
  1-forms with vanishing normal component on the unit ball, Hardy's inequality on `ℝ^d`, and the
  Sobolev classes `W^{k,p}(Ω; V)` of order `k ≥ 2` of maps into a finite-dimensional real normed
  space `V`, with their local versions and their coordinate comparison with the scalar classes,
  are sections PDE lacks; they are requested of PDE under Exact supplier contracts. The order-one
  class `W^{1,p}(Ω; V)` is Tau Ceti's (From Tau Ceti). The consistent inhomogeneous partition
  needed for the restriction-Besov norm of §4.3 is requested of PDE §7.1–§7.2 there as well.
- **SmoothBundlesConnections** owns principal connections, curvature, the gauge group and its
  left action `u·A = Ad(u)A − du·u⁻¹` (B3.1, B4.1, B4.2). Every smooth connection here is a connection
  on the trivial bundle `X × G` in its sense, and §1.3 proves that the formulas used here are its
  local formulas. The Yang–Mills energy on closed Riemannian manifolds is SmoothBundlesConnections,
  Part II, the jet-level Yang–Mills Euler–Lagrange and Noether identities are
  LocalVariationalFieldTheory's (§4.1 for the Euler expression and its currents, §5.2 for the gauge
  identity), and the closed-manifold `SU(2)` theory with anti-self-dual moduli spaces is
  FourManifolds, Layer 5; none of them is planned here. §7.1 states only the weak
  equation for rough potentials on open subsets of `ℝ⁴`. Sobolev gauge groups and Coulomb slices at
  subcritical orders on closed manifolds are HamiltonianReduction R5's (over a surface, `H^s`,
  `s > 1`) and SeibergWittenTheory SW4's (the abelian group on a closed four-manifold); the critical
  classes `G^{2,d/2}_loc`, `d ≥ 3`, on Euclidean domains are a different setting and are owned here.
- **CharacteristicClasses** owns `Ad`-invariant symmetric polynomial forms on a Lie algebra with
  polarisation and pullback, their evaluation on curvature, closedness, gauge invariance and the
  transgression form of the affine connection path (C4 item 1), the Weil algebra with the
  normalised Chern–Simons forms `CS_P` and their Maurer–Cartan cocycles `τ(P)` (C5a.3), and
  Chern–Weil theory of bundles. This roadmap reads those objects in the Euclidean trivialisation
  and in its right Maurer–Cartan convention (§1.4), and computes characteristic numbers of rough
  connections by transgression on `ℝ^d` (Layer 6); it states no comparison with Chern–Weil
  classes of bundles on `S^d`.
- **RiemannianGeometry** owns the inversion of the normal tube of a closed Euclidean embedding and
  the smooth nearest-point retraction on a tube of uniform radius for compact embeddings (R6).
  §1.2 applies it to `G` and computes the derivative of the retraction along `G`.
- **DifferentialGeometry** owns differential forms, the exterior derivative `TauCeti.mextDeriv` on
  manifolds, Stokes' theorem and the homotopy operator (Layers 0, 1, 5.3, 5.4) and the Brouwer
  degree with its integral formula, homotopy invariance and `deg id = 1` (Layer 10, items
  10.3–10.5). Tau Ceti's `Orientation.formHodgeStar` is the pointwise Hodge star.
- **AlgebraicTopology** owns the comparison of cubical and spherical homotopy groups and the
  absolute Hurewicz theorem in every universe (§8.3; for spaces in `Type` it is Tau Ceti's
  `HomotopyGroup.bijective_hurewicz`), and the comparison of the homological degree with
  DifferentialGeometry's smooth degree (§6.5); through them the degree classifies maps
  `S³ → S³`.
- **LieGroups** owns `Ad` and `ad` (Layer 1) and the generic invariant-metric and compact
  Lie-algebra splitting (Layer 5A). Its exponential map (Layer 0) and its closed-subgroup theorem
  with the Lie algebra of a closed subgroup (Layer 2) are already in Tau Ceti (From Tau Ceti), and
  the matrix exponential is Mathlib's `NormedSpace.exp`. Tau Ceti also proves the facts §1.1 uses
  about the Lie algebra of a closed subgroup: it grows with the subgroup, is preserved by `Ad(g)`
  for `g` in the subgroup and is the range of the differential of the inclusion at `1`, and for the
  unitary (special unitary) matrices it consists of the skew-Hermitian (trace-free
  skew-Hermitian) matrices; `exp(𝔤) ⊆ G` is the defining property of `𝔤`. Here the matrix trace
  metric is an explicit compatible choice; the splitting is consumed on the identity component and
  is not reconstructed. The compact real root planes and normalised root `𝔰𝔲(2)` subalgebras are
  LieGroups Layer 6’s constructions. The additional norm comparison saying that a longest-root
  subalgebra attains `γ₀` is requested there under Exact supplier contracts.
- **Yamabe** owns the sharp Euclidean Sobolev inequality with the constant `Y(Sⁿ)` (Y2 item 1),
  which the energy gap of §7.5 consumes in dimension four.
- **FourManifolds** states Uhlenbeck's small-curvature Coulomb gauge on the unit Euclidean
  4-ball for `SU(2)` (§5.3) and constructs the BPST instanton on its oriented `S⁴` carrier
  (Layer 5, introduction). This roadmap owns the Euclidean statements of §§4.1–4.2 and §7.3
  (Coulomb gauge and removability) and §7.6 (the BPST potential on `ℝ⁴` needed by the heat flow).
  The unit-ball statement for `SU(2)` is the case `G = SU(2)`, `d = 4` of §4.1;
  FourManifolds' `S⁴` carrier, moduli spaces and compactification belong there.
  The energy identity `ℰ_e = 8π²c₂ + 2‖F⁺‖²` is stated here on `ℝ⁴` for finite-energy rough
  connections (pointwise in §1.5, integrated in §6.3); its closed-manifold form
  `E(A) = 8π²k + 2‖F_A⁺‖²` and the BPST solution on `S⁴` (FourManifolds Layer 5, introduction),
  which SmoothBundlesConnections' scope assigns to FourManifolds together with InstantonFloerTheory
  IF1, stay there; InstantonFloerTheory consumes FourManifolds' `SU(2)` core for its `SO(3)` and
  cylindrical theory, and nothing of it is planned here.

Not owned here and owned by no roadmap this one consumes: the hyperbolic Yang–Mills equation, its
initial data sets, the constraint equation and the caloric form of the wave equation, together
with the generalised Coulomb condition and the heat-flow bounds for linearised caloric data
(OhTataru-YMHF §§7.3–9, OhTataru-CaloricLWP, OhTataru-Threshold), which belong to a hyperbolic
Yang–Mills roadmap consuming this one (Downstream consumers); the Yang–Mills heat flow on closed
manifolds (Rade-YMHeat); the structure of `π₃` of compact Lie groups beyond what §5.6 and §6.4 use
(MimuraToda-TopologyLieGroups, Ch. IV–V).

## Conventions

**Dimension.** All dilations have factor `λ > 0`; all scalar products and function spaces are real,
with complex matrices regarded as real vector spaces. Finite-dimensional coefficient spaces lie in
an arbitrary fixed universe; covers have small index types in a fixed containing universe and
refinements may enlarge that universe. Sobolev exponents satisfy `1 ≤ p ≤ ∞`; statements at the
critical exponent `p = d/k` have `1 ≤ k < d`, so `p > 1`.

Layers 2–5 work in `ℝ^d` with `d ≥ 3` (for `d = 2` the critical space `L^{d/2}` is
`L¹` and the theory changes, OhTataru-TopClass line 277). Characteristic numbers (Layer 6) need
`d = 2k`. Layers 7–10 work in `d = 4`, the energy-critical dimension, which the Dichotomy and
Threshold Theorems use (OhTataru-YMHF line 762–764). `ℝ^d` is `EuclideanSpace ℝ (Fin d)` with
Lebesgue measure `volume`; `B_r(x)` is the open ball, `B_r = B_r(0)`, `B'_r = B_r ∖ {0}`; an open set
`X ⊆ ℝ^d` is arbitrary unless a statement says bounded, Lipschitz or connected.

**Structure group.** `G` is a closed subgroup of the unitary group `U(N)` (Mathlib's
`Matrix.unitaryGroup (Fin N) ℂ`), for some `N ≥ 1`; it is compact, and by the closed-subgroup
theorem (Tau Ceti's `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`) an embedded Lie subgroup. It is
not assumed connected. Its Lie algebra `𝔤 = {X ∈ 𝔲(N) : exp(tX) ∈ G for all t ∈ ℝ}` is a real Lie
subalgebra of the skew-Hermitian matrices, with `Ad(g)X = gXg⁻¹` and `ad(X)Y = [X, Y]`. The inner
product `⟨·,·⟩` on `𝔤` is part of the
data and is `Ad(G)`-invariant: `⟨Ad(g)X, Ad(g)Y⟩ = ⟨X, Y⟩` for all `g ∈ G`. This implies
`⟨[X, Y], Z⟩ = −⟨Y, [X, Z]⟩`; the converse holds only for connected `G` (§1.1, Checks). The trace form
`⟨X, Y⟩ = −Re tr(XY)` is always admissible. "Noncommutative" means `[𝔤, 𝔤] ≠ 0`. Constants written
`≲` depend on `d`, `G` and `⟨·,·⟩` besides the displayed subscripts; `ε₀`, `ε'₀`, `ε_*` are small
positive constants depending on `d`, `G` and `⟨·,·⟩` only.

**Connections and gauge transformations.** A connection on (an open subset of) `ℝ^d` is a
`𝔤`-valued 1-form `A = A_j dx^j`; `D_j = ∂_j + ad(A_j)`; the curvature is
`F_jk = ∂_j A_k − ∂_k A_j + [A_j, A_k]`, so `F = ½ F_jk dx^j ∧ dx^k = dA + ½[A ∧ A]` and
`D_j D_k − D_k D_j = ad(F_jk)`. For a `G`-valued map `O` write `O;x = (∂_x O) O⁻¹` (the right
Maurer–Cartan form). The gauge action is `O·A = Ad(O)A − O;x`, under which `F ↦ Ad(O)F`
(OhTataru-YMHF line 103–118). This is SmoothBundlesConnections B4.2's inverse-pullback left action
`u·A = Ad(u)A − du·u⁻¹` in the trivial bundle with `u = O`; equivalently, SmoothBundlesConnections'
change of local section `s' = s·g` acts by `O = g⁻¹`. Witness: for `G = U(1)`, `A = i x₁ dx₂` and
`O = exp(iφ)`, `F₁₂ = i` and `O·A = A − i dφ`; with the opposite sign `Ad(O)A + O;x`, the image of `A = 0` is `R = dO O⁻¹` and
`F[R] = 2R ∧ R`, rather than `0`. For `O = exp(x₁i)exp(x₂j)` in `SU(2)`, at `0` this gives
`F₁₂[R] = 2[i,j] = 4k`; the chosen sign gives `F₁₂[−R] = 0`.

**Norms of forms.** `|A|² = Σ_j ⟨A_j, A_j⟩` and `|F|² = Σ_{j<k} ⟨F_jk, F_jk⟩`, so that
`½ ⟨F_jk, F^{jk}⟩` summed over all `j, k` equals `|F|²`. The energy is `ℰ_e(a) = ∫_{ℝ⁴} |F[a]|² dx`.
`‖F‖_{L^p(X)}` means `‖ |F| ‖_{L^p(X)}`. In dimension four `⟨F ∧ F⟩` is the 4-form whose coefficient
of `dx¹ ∧ dx² ∧ dx³ ∧ dx⁴` is `2(⟨F₁₂, F₃₄⟩ − ⟨F₁₃, F₂₄⟩ + ⟨F₁₄, F₂₃⟩)`: this is the wedge of the
2-form `F` with itself paired by `⟨·,·⟩`, the normalisation of OhTataru-YMHF (6.11), line 2857, and
OhTataru-Threshold line 242. (OhTataru-TopClass (1.26), line 886, omits the factor `¼` of the
all-index sum; with it omitted the Bogomol'nyi inequality fails for `F₁₂ = F₃₄ = X`.) The
characteristic number in dimension four is `χ(a) = −∫ ⟨F ∧ F⟩`, the integral of a top form for the
standard orientation.

**Orientation and Hodge star.** `ℝ⁴` is oriented by `dx¹ ∧ dx² ∧ dx³ ∧ dx⁴`; `⋆` is Tau Ceti's
`Orientation.formHodgeStar` applied componentwise, so `⋆(dx¹ ∧ dx²) = dx³ ∧ dx⁴`; `F` is self-dual if
`⋆F = F`. `S³ ⊂ ℝ⁴` carries the boundary orientation of the unit ball (outward normal first).
`SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` is identified with `S³` by
`Φ(x) = [[x₁ + ix₂, x₃ + ix₄], [−x₃ + ix₄, x₁ − ix₂]]`, an algebra homomorphism from the quaternions,
and is oriented through `Φ`.

**Homogeneous spaces (`d = 4`).** For a finite-dimensional real inner product space `V` (here `𝔤`,
`𝔤`-valued 1-forms or 2-forms) the spaces below are defined componentwise in an orthonormal basis
and are independent of the basis. `Ḣ¹(ℝ⁴; V) = {u ∈ L⁴ : ∇u ∈ L²}` with norm `‖∇u‖_{L²} + ‖u‖_{L⁴}`,
the scaling-invariant form of OhTataru-TopClass line 957–963; `Ẇ^{1,d/2}(ℝ^d; V)` is defined the
same way with exponents `d/2` and `d`. Coefficientwise these are the images of Tau Ceti's
`TauCeti.D1p0` (with `p = 2`, `p* = 4`, respectively `p = d/2`, `p* = d`) under its Sobolev embedding,
with equivalent norms: 8.1 proves this for `Ḣ¹`, and its cut-off and mollification argument, with
`‖∇χ_R‖_{L^d}` independent of `R`, gives it for `Ẇ^{1,d/2}`. For `σ ∈ ℝ`, `Ḣ^σ = Ḃ^σ_{2,2}`, `ℓ¹L² = Ḃ⁰_{2,1}` and
`ℓ¹Ḣ^σ = Ḃ^σ_{2,1}` are PDE §7.2's homogeneous Besov spaces built on the homogeneous blocks `P_k`,
`k ∈ ℤ`, of PDE §7.1 (Mathlib's Fourier normalisation with `2π` in the exponent);
`|D| = (−Δ)^{1/2}` is the multiplier `2π|ξ|`, and for `σ < 4/p` the realised homogeneous space
`Ẇ^{σ,p}(ℝ⁴; V)`, with norm `‖|D|^σ u‖_{L^p}`, and its heat-continuity subspace `Ẇ^{σ,∞}_c` are
defined in 8.1;
`ℋ = {a ∈ Ḣ¹ : ∂^ℓ a_ℓ ∈ ℓ¹L²}` with norm `‖a‖_{Ḣ¹} + ‖∂^ℓ a_ℓ‖_{ℓ¹L²}`. For `σ ≥ 2 = 4/2` the
space `Ḣ^σ` is realised only modulo polynomials (8.1), so for every `σ > 1` the intersection
`Ḣ¹ ∩ Ḣ^σ` (resp. `ℋ ∩ Ḣ^σ`) means the set of `u ∈ Ḣ¹` (resp. `u ∈ ℋ`) with
`‖u‖_{Ḣ^σ} = (Σ_k 2^{2kσ}‖P_k u‖²_{L²})^{1/2} < ∞`, normed by the sum of the two norms; its elements are
functions in `L⁴`, so no polynomial ambiguity arises, and for `1 < σ < 2` it is the intersection of the
realised spaces. It is complete: a Cauchy sequence converges in `Ḣ¹` (resp. `ℋ`), its blocks converge in
`L²`, and Fatou's lemma in `ℓ²` bounds the `Ḣ^σ` distance to the limit. The heat-time variable is
`s ≥ 0`; weighted `ds/s` norms are over `s > 0`, with the initial trace stated
separately. In endpoint exponent formulas `1/∞ = 0`. Here `J ⊆ [0, ∞)` is an interval, and `L^p(J; X)` is Mathlib's Bochner space with values in the
Banach space `X`. For such a space-time norm `Y = L^q(J; Ḣ^σ)`, `ℓ^pY` is the norm
`‖u‖_{ℓ^pY} = (Σ_k ‖P_k u‖^p_Y)^{1/p}` (OhTataru-YMHF line 857); Minkowski's integral inequality gives
`‖u‖_{ℓ²L¹Ḣ^σ} ≲ ‖u‖_{L¹Ḣ^σ}`, and the reverse bound fails (8.3, Checks).
Littlewood–Paley indices follow PDE §7.1: a frequency of size `2^j` is carried by
`P_{j−1}` (PDE §7.1, first Check).

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib; paths under `Mathlib/`.

- `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean`, an abbreviation for the submonoid of
  unitary matrices) and `Matrix.specialUnitaryGroup` (same file, the unitary matrices of determinant
  one).
- `NormedSpace.exp` and `NormedSpace.exp_add_of_commute` (`Analysis/Normed/Algebra/Exponential.lean`),
  `Matrix.isUnit_exp` (`Analysis/Normed/Algebra/MatrixExponential.lean`).
- `LieAlgebra.IsKilling.instSemisimple` (`Algebra/Lie/Killing.lean`: a finite-dimensional Lie algebra
  over a field whose Killing form is nondegenerate is `LieAlgebra.IsSemisimple`, that is, the
  independent supremum of its atomic ideals, none of them abelian) and
  `LieAlgebra.IsSemisimple.isSimple_of_isAtom` (`Algebra/Lie/Semisimple/Basic.lean`: each atomic
  ideal is a simple Lie algebra). Used in §1.6 for the real Lie algebra `[𝔤, 𝔤]`, whose Killing form is
  negative-definite by LieGroups Layer 5A and hence nondegenerate.
- `ContinuousMap.Homotopic` with `ContinuousMap.Homotopic.equivalence` (`Topology/Homotopy/Basic.lean`)
  for free homotopy classes; `HomotopyGroup` (`Topology/Homotopy/HomotopyGroup.lean`, defined through
  cubes, not spheres).
- `MeasureTheory.Lp`, `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
  (`Analysis/FunctionalSpaces/SobolevInequality.lean`: the Gagliardo–Nirenberg–Sobolev inequality
  for compactly supported `C¹` functions), `MeasureTheory.Measure.toSphere` and
  `homeomorphUnitSphereProd` (`MeasureTheory/Constructions/HaarToSphere.lean` and
  `Analysis/Normed/Module/Ball/RadialEquiv.lean`) for polar coordinates.
- `TemperedDistribution.fourierMultiplierCLM` (`Analysis/Distribution/FourierMultiplier.lean`: the
  Fourier multiplier `𝓕⁻¹(g · 𝓕u)` on tempered distributions with values in a complex normed space,
  used on the complexification of `V`) and `MeasureTheory.Lp.toTemperedDistribution`
  (`Analysis/Distribution/TemperedDistribution.lean`), for the multipliers `|D|^σ P_k` and the
  realised spaces of 8.1.
- `ContDiff` and `HasFDerivAt` for maps between Banach spaces; `Submodule.ClosedComplemented`
  (`Topology/Algebra/Module/Complement.lean`) for split subspaces; `Orientation.volumeForm`.
- `Manifold.IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean`: a `C^n` immersion that is a
  topological embedding) and `Manifold.IsImmersion` with `Manifold.IsImmersion.isDiffImmersionAt`
  (`Geometry/Manifold/Immersion.lean`: one complement `F` for all points, the local normal form `u ↦ (u, 0)` in
  charts of the maximal `C^n` atlases, and a continuous left inverse of the derivative at every point), for the
  charts of 10.4; `TopologicalSpace.Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean`) for an open
  subset as a manifold; the inverse function theorem `ContDiffAt.toOpenPartialHomeomorph` and
  `ContDiffAt.to_localInverse` (`Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean`). `isDiffImmersionAt`
  goes from an immersion to a split injective derivative only; 10.4 proves the converse from the inverse function
  theorem.

### From Tau Ceti

At the pinned Tau Ceti; paths under `TauCeti/`.

- `TauCeti.HasWeakFDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean`): weak Fréchet derivatives of
  functions with values in a complete normed space, which includes local integrability of the
  function and of the derivative. `Suggested.lean` uses it for the local class `W^{1,2}_loc` of
  `IsFiniteEnergySU2Potential` (§6.4).
- The order-one vector-valued class, in `Analysis/Sobolev/GraphStep/`: `TauCeti.WeakDerivStep`
  (`Basic.lean`), taken over `Lᵖ(Ω; V)` with the identity as base map, is `W^{1,p}(Ω; V)` for every
  complete normed space `V`, a measure finite on compact sets and `1 ≤ p`, normed by
  `(‖u‖²_p + ‖Du‖²_p)^{1/2}`; it is complete (the `CompleteSpace` instance on `TauCeti.WeakDerivStep`
  in `Basic.lean`), and `TauCeti.mem_weakDerivStepSubmodule_iff_hasWeakFDerivOn` (`Basic.lean`; for a
  measure locally finite on `Ω`) says that a pair lies in it exactly when its second entry is a
  weak derivative of its first. `TauCeti.WeakDerivStep.toW1pL` (`ScalarProjection.lean`; for an
  additive Haar measure on a finite-dimensional inner product space) is the continuous linear map
  to the scalar `TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean`) given by a functional `V →L[ℝ] ℝ`.
  `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean`) iterates this step for real-valued functions;
  the vector-valued orders `k ≥ 2` and the local classes are requested of PDE (gap
  `vector-valued-wkp`).
- `TauCeti.W1p.morreyRepresentative` (`Analysis/Sobolev/W1p/Morrey.lean`) and
  `TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt`, used through PDE §1.4.
- `TauCeti.D1p0` (`Analysis/Sobolev/D1p0/Basic.lean`): for a measure finite on compact sets, an open
  `Ω` and `1 ≤ p`, the closure in `L^p(Ω; E)` of the gradients of real test functions, each element
  recorded by its gradient field, with its norm and completeness; `TauCeti.D1p0.ofTestFunctionₗ` with
  `TauCeti.D1p0.norm_ofTestFunctionₗ` (a test function has norm `‖∇φ‖_p`) and
  `TauCeti.D1p0.denseRange_ofTestFunctionₗ` (test functions are dense). For an additive Haar measure,
  `p* ≠ ∞` and `1/p* + 1/dim E = 1/p`: `TauCeti.D1p0.sobolevEmbeddingL`, the continuous linear map to
  `L^{p*}(Ω)` extending `φ ↦ φ`, with `TauCeti.D1p0.norm_sobolevEmbeddingL_le` (the
  Gagliardo–Nirenberg–Sobolev bound), `TauCeti.D1p0.hasWeakFDerivOn_sobolevEmbeddingL` (the recorded
  field is the weak gradient of the image) and `TauCeti.D1p0.sobolevEmbeddingL_injective`. It is
  scalar and of order one: it supplies neither the converse characterisation of its image by weak
  gradients, nor fractional or Besov orders, nor covariant operators. Used in 8.1 with Lebesgue
  measure, `Ω = ℝ⁴`, `p = 2`, `p* = 4`.
- `Orientation.formHodgeStar` (`Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean`) with
  `Orientation.wedge_formHodgeStar_apply` (`α ∧ ⋆β = ⟨α, β⟩ vol`) and
  `Orientation.formHodgeStar_formHodgeStar_of_even`.
- `TauCeti.heatKernel` and its semigroup and Fourier identities, used through PDE §6.3.
- `TauCeti.Wkp.dense_contDiffOn_representatives` (`Analysis/Sobolev/Wkp/MeyersSerrin.lean`): for
  `1 ≤ p < ∞` and an arbitrary open set, the elements of the scalar `W^{k,p}` with a representative
  smooth on the set are dense. This is PDE §1.2's density, used coordinatewise in §2.2.
- `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`
  (`Analysis/Fourier/MihlinHormander.lean`): the Mihlin–Hörmander theorem for the `L²` Fourier
  multiplier of a symbol smooth off the origin satisfying Mihlin's condition of an order `N` with
  `2N > dim`, giving `‖T_m f‖_{L^p} ≤ C A ‖f‖_{L^p}` for `f ∈ L²` and `1 < p < ∞`; with
  `TauCeti.exists_norm_iteratedFDeriv_le_div_pow_of_smul_eq`
  (`Analysis/Calculus/IteratedFDeriv/Homogeneous.lean`: a symbol smooth off the origin and
  homogeneous of degree `0` satisfies Mihlin's condition of every order) it bounds the Riesz
  transforms and their products `R_iR_j` on `L² ∩ L^p`, which is what the div–curl estimate of §4.3
  uses on test functions. PDE §2.3 states these bounds on all of `L^p`.
- The closed-subgroup theorem, in `Geometry/Lie/Subgroup/`: for a subgroup `K` of a
  finite-dimensional real Lie group, `TauCeti.Lie.lieSubalgebraOfSubgroup` (`LieAlgebra.lean`) is the
  Lie subalgebra generated by the `X` with `exp(tX) ∈ K` for all real `t`,
  `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`Embedded.lean`) makes a closed subgroup an
  embedded Lie subgroup, and for a closed subgroup `K` of the units of a finite-dimensional real
  normed algebra `R`, `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`
  (`Units.lean`) says that `X ∈ R` lies in the Lie algebra of `K` exactly when
  `TauCeti.expUnit (t • X) ∈ K` for all real `t`. Used in §1.1 with `R` the `N × N` complex
  matrices and `K` the group `G`, as a subgroup of their units; the Lie algebra so obtained is the
  `𝔤` of the Conventions, and the choice of norm on `R` does not affect it. Further (file
  names again in `Geometry/Lie/Subgroup/` unless a full path is given):
  `TauCeti.Lie.lieSubalgebraOfSubgroup_mono` (`LieAlgebra.lean`: a larger subgroup has a larger Lie
  algebra); `TauCeti.Lie.Ad_mem_lieSubalgebraOfSubgroup` (`LieAlgebra.lean`: `Ad(g)` maps the Lie
  algebra of `K` into itself for `g` in the normaliser of `K`), read in matrix coordinates through
  `TauCeti.Lie.unitsLieAlgebraEquiv_Ad` (`Geometry/Lie/Adjoint/Units/Basic.lean`: there
  `Ad(g)X = gXg⁻¹`);
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_conjTranspose_eq_neg`
  (`Unitary.lean`: the Lie algebra of the unitary matrices is `{X : Xᴴ = −X}`);
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff`
  (`SpecialUnitary.lean`: the Lie algebra of `TauCeti.GLSpecialUnitary`, the special unitary group
  as a subgroup of the units, is `{X : Xᴴ = −X, tr X = 0}`), whose elements are those of
  `Matrix.specialUnitaryGroup` by `TauCeti.GLSpecialUnitary.mem_iff`
  (`LinearAlgebra/Matrix/GeneralLinearGroup/SpecialUnitary.lean`); and
  `TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq` (`Differential.lean`: for
  embedded-subgroup data modelled on the Lie algebra of `K`, the differential of the inclusion at
  `1` has range the Lie algebra of `K`), with
  `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`
  (`Embedded.lean`: a closed subgroup `K` of a finite-dimensional real Lie group carries such data,
  modelled on its Lie algebra). Used in §1.1, and the special unitary computation in §6.4.
- `HomotopyGroup.bijective_hurewicz` (`AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean`): for a
  space in `Type` whose homotopy groups vanish below degree `n + 2`, the cubical Hurewicz map
  `π_{n+2} → H_{n+2}(·; ℤ)` is bijective. Used in §6.4 for `S³`, with AlgebraicTopology §8.3's
  comparison with pointed sphere maps.

### From TauCetiRoadmap.PDE

- §1.2: density of smooth functions in `W^{k,p}` on arbitrary open sets (used in §2.2).
- §1.4: Sobolev, Morrey and higher-order embeddings, including `W^{k,p}(Ω) → W^{k−1,p*}(Ω)` on bounded
  Lipschitz domains and the whole-space Gagliardo–Nirenberg–Sobolev inequality (§§2.2–2.5, 5.1).
- §1.5: the Poincaré inequality on balls, `‖u − u_B‖_{L^p(B)} ≤ C(d, p) r ‖∇u‖_{L^p(B)}` for a ball `B`
  of radius `r` and `1 ≤ p < ∞`, with the constant scaling linearly in `r` (§2.2).
- §1.6: the trace operator and the extension operator on bounded Lipschitz domains (§§2.2, 4.1).
- §2.2 and §2.3: interpolation, Calderón–Zygmund operators, the Riesz transforms `R_j` with
  multiplier `−iξ_j/|ξ|` and their `L^p` bounds for `1 < p < ∞`, and the Mihlin–Hörmander theorem.
  §4.3 derives from the Riesz transforms the whole-space div–curl estimate
  `‖∇u‖_p ≲ ‖div u‖_p + ‖du‖_p`, `1 < p < ∞` (used in §4.3, and
  through §4.4 in §5.2).
- §3.2: the weak maximum principle for weak subsolutions of the Laplacian on balls (§§8.2, 10.4).
- §6.1: Bochner spaces; §6.3: the heat semigroup `e^{sΔ}` on `L^p(ℝ^d)`, its generator, Duhamel's
  formula and the smoothing estimates (Layers 8–9).
- §7.1: the homogeneous blocks `P_k`, Bernstein and Littlewood–Paley estimates, and the heat-block
  estimate for indices `j ≥ 1`; §8.1 here extends that estimate to every `k ∈ ℤ` by dilation.
  §7.2 supplies whole-space inhomogeneous Besov spaces and homogeneous Besov spaces modulo
  polynomials; §8.1 fixes their representatives in `𝒮'_h` in dimension four, and §4.3 defines the
  restriction norm on a ball, using the consistent inhomogeneous partition requested below.
  §7.3 supplies the inhomogeneous Bony decomposition pattern and its
  Hölder–Besov estimates. The homogeneous `L²` product estimates needed in Layers 8–10 are the
  distinct targets of §8.1, using §7.1's Bernstein inequality.

What PDE must provide (gap:lp-neumann-ball): For `1 < p < ∞`, `d ≥ 2`, `f ∈ L^p(B₁)` and `V ∈ W^{1,p}(B₁;ℝ^d)` with `∫_{B₁} f = ∫_{∂B₁} ν·V`: `Δu = f` in `B₁`, `∂_νu = ν·V` on `∂B₁` has a solution `u ∈ W^{2,p}(B₁)`, unique up to constants, with `‖∇u‖_{W^{1,p}} ≤ C(d,p)(‖f‖_{L^p} + ‖V‖_{W^{1,p}})`.
Consumed by §4.1. It belongs in PDE Layer 5, as a new section on the `L^p` Neumann problem.

What PDE must provide (gap:lp-divcurl-normal-ball): For `1 < p < ∞`, `d ≥ 2` and every 1-form `a ∈ W^{1,p}(B₁;ℝ^d)` with `x^ℓa_ℓ = 0` on `∂B₁`: `‖a‖_{W^{1,p}(B₁)} ≤ C(d,p)(‖da‖_{L^p} + ‖∂^ℓa_ℓ‖_{L^p})`.
Consumed by §4.1. It belongs in the same new section of PDE Layer 5, as its second theorem.

What PDE must provide (gap:hardy-inequality): For `d ≥ 2` and `1 ≤ p < d`, `‖u/|x|‖_{L^p(ℝ^d)} ≤ (p/(d−p))‖∇u‖_{L^p(ℝ^d)}` for `u ∈ C_c^∞(ℝ^d)`, with extension to the homogeneous Sobolev closure.
Consumed by §§5.2, 5.3 and 6.1. It belongs in PDE §1.4, as a new item.

What PDE must provide (gap:vector-valued-wkp): For a finite-dimensional real normed space `V`, an open `Ω ⊆ ℝ^d` and `1 ≤ p ≤ ∞`: for every integer `k ≥ 2`, the space `W^{k,p}(Ω; V)` obtained from the order-one class `TauCeti.WeakDerivStep` over `Lᵖ(Ω; V)` by adjoining one `L^p` weak derivative (`TauCeti.HasWeakFDerivOn`) per order, as `TauCeti.Wkp` does for real-valued functions, complete for its graph norm; for every `k ≥ 1`, a continuous linear equivalence of `W^{k,p}(Ω; V)` with the product of `dim V` copies of `TauCeti.Wkp` of order `k`, given by the coordinates in any basis of `V` and commuting with every iterated weak derivative (so the class does not depend on the basis); and for every `k ≥ 1`, the local class `W^{k,p}_loc(Ω; V)` of the `u` whose restriction to every ball with closure in `Ω` lies in `W^{k,p}`.
Consumed by §2.1, and through it by Layers 2–5 and 7. It belongs in PDE Layer 1, as a new section on Sobolev classes with values in a finite-dimensional space.

What PDE must provide (gap:inhomogeneous-besov-partition): For every `d ≥ 1`, use the consistent inhomogeneous blocks `Δ_{−1} = χ(D)`, `Δ_j = ψ(2^{−j}D)` for `j ≥ 0`, with `Σ_{j≥−1}Δ_j = I`, and supply §7.2's complete Besov norms and cutoff independence for this partition.
Consumed by §4.3. It belongs in PDE §§7.1–7.2, with the inhomogeneous partition and its Besov
norms. The blocks `P_0 = χ(D)` and `P_j = ψ(2^{−j}D)`, `j ≥ 1`, written in PDE §7.1 sum to
`1 + χ(ξ) − χ(ξ/2)`, which vanishes at `|ξ| = 2`, so they do not resolve the identity and cannot
define an inhomogeneous Besov norm; the homogeneous blocks used in §8.1 run over all integers and
sum to `1` at every `ξ ≠ 0`.

### From TauCetiRoadmap.SmoothBundlesConnections

- B3.1: principal connections and the local potential `A' = Ad(g⁻¹)A + g⁻¹dg` for `s' = s·g`.
- B4.1: curvature `Ω = dω + ½[ω ∧ ω]` with the determinant-style wedge, and the Bianchi identity.
- B4.2: the gauge group and its local formulas `u·A = Ad(u)A − du·u⁻¹`, `F_{u·A} = Ad(u)F_A`.
  Used in §1.3 for the comparison of conventions on the trivial bundle.

### From TauCetiRoadmap.CharacteristicClasses

- C4 item 1: `Ad`-invariant homogeneous symmetric polynomial forms on the Lie algebra, their
  polarisation `P(z) = B_P(z, …, z)` with no extra factorial, pullback by Lie homomorphisms and
  evaluation on curvature with the value-bundle wedge; gauge invariance, closedness from the
  Bianchi identity, and connection independence along the affine connection path with its explicit
  transgression form. Used in §1.4 and Layer 6.
- C5a.3: the Weil algebra `W(𝔤)` with `d_W θ = Ω − ½[θ, θ]`, `d_W Ω = −[θ, Ω]`; for homogeneous
  invariant `P` of degree `k ≥ 1` the normalised form `CS_P = k ∫₀¹ B_P(θ, F_t, …, F_t) dt`,
  `F_t = tΩ + ((t² − t)/2)[θ, θ]`, with `d_W CS_P = P(Ω)`, pullback naturality, and the cocycle
  `τ(P)` obtained by setting `Ω = 0`. It is stated for the compact connected group with Lie algebra
  `𝔤`, here the identity component of `G`; its constructions are algebraic in `𝔤`. Used in §1.4.

### From TauCetiRoadmap.RiemannianGeometry

- R6: for a closed-image smooth embedding into a Euclidean space, the inversion of the normal tube
  below its injectivity radius, giving the nearest-point retraction with smooth inverse of normal
  addition, and a tube of uniform radius when the embedded manifold is compact. Used in §1.2 for
  the compact embedded submanifold `G ⊂ M_N(ℂ)` given by Tau Ceti's closed-subgroup theorem.

### From TauCetiRoadmap.DifferentialGeometry

- Layer 0 (forms and the paired wedge, `TauCeti.RoughForm.wedgeWith`) and Layer 1
  (`TauCeti.mextDeriv`, naturality, `d² = 0`, Leibniz): §1.4.
- 5.2–5.3 (integration of top forms, Stokes' theorem with the outward-first boundary orientation)
  and 5.4 (the homotopy operator): §§6.2, 6.4, and 5.2 for the integral in the Checks of §1.4.
- Layer 10, items 10.3–10.5 (`degree` of a smooth map between closed oriented connected manifolds
  of the same dimension, `∫ f*ω = deg · ∫ ω` for top forms, homotopy invariance, `deg id = 1`): §6.4.

### From TauCetiRoadmap.AlgebraicTopology

- §6.5: the homological characterization `f_*[M] = deg f · [N]` of DifferentialGeometry's
  smooth degree for closed oriented connected manifolds, compared there with DifferentialGeometry
  Layer 10: §6.4.
- §8.3: the absolute Hurewicz map from the cubical homotopy groups through pointed
  sphere maps, and the theorem `π_n(X) ≅ H_n(X; ℤ)` for `(n−1)`-connected `X`, `n ≥ 2`: §§5.6, 6.4.

### From TauCetiRoadmap.RepresentationTheory.LieGroups

- Layer 1 (`Ad`, `ad`): §1.1. The exponential map and the closed-subgroup theorem with the Lie
  algebra of a closed subgroup are taken from Tau Ceti (From Tau Ceti).
- Layer 5A: the invariant real metric, skew-adjointness of `ad`, and the orthogonal centre/derived
  decomposition for compact connected groups, applied to the identity component of `G`. Starting
  its averaging with the prescribed invariant metric returns that metric. Its derived ideal
  `[𝔤, 𝔤]` is centreless and semisimple with negative-definite Killing form; Layer 5A does not
  decompose it further. Mathlib decomposes it into simple ideals (From Mathlib), and §1.6 proves
  that these ideals and the centre are mutually orthogonal for the prescribed metric.
- Layer 6, “Compact real roots and the Weyl comparison” and “Rank-one representatives”: the
  real root planes, coroots, normalised compact rank-one Lie subalgebras and integrated
  `SU(2) → G` maps. §7.7 consumes them; the remaining metric extremality is the following gap.

What LieGroups must provide (gap:compact-su2-subalgebra): For every noncommutative compact real Lie algebra with a prescribed ad-invariant positive inner product, the bracket constant γ₀ equals the largest root length, and its restriction to the normalised compact su(2) subalgebra of a longest root has the same value.
Consumed by §7.7. It belongs in LieGroups Layer 6, under “Rank-one representatives”, as their
metric extremality. Root lengths are measured in the inner product dual to the prescribed one on
the Lie algebra of a maximal torus. The root-space operator bound and the rank-one bracket calculation are the argument of
OhTataru-TopClass line 2381–2401, applied in each simple ideal with its prescribed metric.

### From TauCetiRoadmap.Yamabe

- Y2 item 1: for `n ≥ 3`, `a_n ∫ |du|² ≥ Y(Sⁿ) (∫ |u|^{p_n})^{2/p_n}` on the homogeneous space
  `D^{1,2}(ℝⁿ)`, with `a_n = 4(n−1)/(n−2)`, `p_n = 2n/(n−2)`, `Y(Sⁿ) = n(n−1)Vol(Sⁿ)^{2/n}`. In
  dimension four `a₄ = 6`, `p₄ = 4` and `Y(S⁴) = 12 (8π²/3)^{1/2} = 8√6 π`. Used in §7.5.

## How to read the build

Layer 1 is pointwise algebra: the structure group, the gauge identities for smooth data, invariant
forms with their transgression and Cartan forms, and four-dimensional self-duality. Layer 2 is the
analysis of `G`-valued maps at the critical exponent. Layer 3 defines rough connections, proves the
gauge invariance of finite energy and patches local gauges. Layer 4 proves Uhlenbeck's lemmas and the
good gauge on a ball. Layer 5 globalises to `ℝ^d` and defines the topological class. Layer 6 computes
characteristic numbers by transgression and the instanton number by degree theory. Layer 7 is the
elliptic theory of harmonic Yang–Mills connections on `ℝ⁴` up to the ground state. Layer 8 is the
linear covariant theory in homogeneous spaces. Layer 9 is the Yang–Mills heat flow, ending with the
Dichotomy and Threshold Theorems. Layer 10 constructs the caloric gauge and the caloric manifold.
Layer 1 depends only on suppliers; Layer 8 then uses its coefficient algebra;
within Layer 4 the elliptic estimates of §4.3 precede their uses in §4.1; Layers 2–7 form a chain (Layer 6
needs Layer 5, Layer 7 needs Layers 4–6); Layer 9 needs Layer 8 for its local theory and Layers 4, 6
and 7 for the Dichotomy and Threshold Theorems; Layer 10 needs Layer 9 and Layers 3–4 for §10.1.

## Layer 1: structure groups and pointwise gauge algebra

### 1.1 The structure group

Define a compact matrix structure group as a triple `(N, G, ⟨·,·⟩)` with `G` a closed subgroup of
`Matrix.unitaryGroup (Fin N) ℂ`, its Lie algebra `𝔤` as in the Conventions, and an `Ad(G)`-invariant
inner product on `𝔤` (OhTataru-YMHF line 92–102; OhTataru-TopClass line 121–127 and 976–979).

- The tangent space of `G` at `g`, as a subspace of the matrices, is `g𝔤 = 𝔤g`. Route: the
  differential of the inclusion at `1` has range `𝔤`; left multiplication by `g` is linear on the
  matrices and maps `G` onto itself, so it carries this range onto `g𝔤`; and `Ad(g)𝔤 = 𝔤`
  (`Ad(g)𝔤 ⊆ 𝔤` applied to `g` and to `g⁻¹`) with `gX = (gXg⁻¹)g` gives `g𝔤 = 𝔤g`.
- `Ad(g)` is an isometry of `𝔤` for `g ∈ G`, and `ad(X)` is skew-adjoint for `X ∈ 𝔤`.
- The trace form `−Re tr(XY)` is positive definite and `Ad(U(N))`-invariant on `𝔲(N)`, so every
  closed `G ⊆ U(N)` admits an admissible inner product.
- Restriction to a closed subgroup `H ⊆ G` and block-diagonal products `G₁ × G₂ ⊆ U(N₁ + N₂)` with the
  orthogonal sum of inner products are again structure groups.

**Checks.**

- `G = U(1) = Matrix.unitaryGroup (Fin 1) ℂ`: `𝔤 = iℝ`, `Ad` is trivial and every inner product is
  admissible; the curvature of `A` is `dA`.
- `G = SU(2)` with `⟨X, Y⟩ = −tr(XY)`: for `i = [[0, 1], [−1, 0]]`, `j = [[0, i], [i, 0]]`,
  `k = diag(i, −i)` one has `|i|² = |j|² = |k|² = 2`, `[i, j] = 2k`, `[j, k] = 2i`, `[k, i] = 2j`
  (OhTataru-TopClass (6.1)–(6.2), lines 2312–2332).
- A finite group, for instance `{±1} ⊂ U(1)`, has `𝔤 = 0`: every connection is `0`.
- `G = T² ⋊ ℤ/2 ⊂ U(2)`, the diagonal unitary matrices together with the permutation matrix
  `[[0, 1], [1, 0]]`: `𝔤` is the abelian algebra of imaginary diagonal matrices, the inner product
  with `|e₁|² = 1`, `|e₂|² = 2`, `⟨e₁, e₂⟩ = 0` is `ad`-invariant, but conjugation by the permutation
  matrix exchanges `e₁` and `e₂`, so it is not `Ad(G)`-invariant and is excluded.

*Needs:* Mathlib `Matrix.unitaryGroup`, `NormedSpace.exp`, `Matrix.isUnit_exp`; Tau Ceti
`TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`,
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`,
`TauCeti.Lie.lieSubalgebraOfSubgroup_mono`,
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_conjTranspose_eq_neg`,
`TauCeti.Lie.Ad_mem_lieSubalgebraOfSubgroup` with `TauCeti.Lie.unitsLieAlgebraEquiv_Ad`, and
`TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq` with
`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`; LieGroups
Layers 1, 5A.

### 1.2 The nearest-point retraction onto `G`

`G` is a compact embedded submanifold of the real inner product space of `N × N` complex matrices
with the Frobenius inner product (Tau Ceti's closed-subgroup theorem), with tangent space `g𝔤` at `g`
(1.1).
RiemannianGeometry R6, applied to this closed embedding, gives `ε > 0`, the open neighbourhood
`𝒰 = {M : dist(M, G) < ε}` of `G` and a smooth map `π_G : 𝒰 → G` with `π_G(g) = g` for `g ∈ G`, such
that `π_G(M)` is the unique point of `G` nearest to `M` and `π_G(g + v) = g` for every `v` normal to `G`
at `g` with `|v| < ε`. Prove that the derivative of `π_G` at `g ∈ G` is the orthogonal projection onto
`g𝔤` (used in OhTataru-TopClass line 1057–1058). Route: differentiating `π_G = id` on `G` gives the
identity on `g𝔤`, and differentiating `t ↦ π_G(g + tv) = g` at `t = 0` gives `0` on the normal space,
the orthogonal complement of `g𝔤`.

- The restriction of the retraction to `G` is the identity, so its derivative on tangent vectors
  is the identity.
- The retraction is constant along sufficiently short normal segments, so its derivative kills
  normal vectors.
- In its tubular domain every matrix has exactly one minimising point, and the residual vector
  is orthogonal to the tangent space there.

**Checks.**

- `G = U(1) ⊂ ℂ` with `⟨z, w⟩ = Re(z w̄)`: on `𝒰`, `π_G(r e^{iθ}) = e^{iθ}` for `r > 0`, so
  `π_G(1 + i) = (1 + i)/√2` when `1 + i ∈ 𝒰`, and `dπ_G(1)(a + ib) = ib`, the orthogonal projection
  onto `𝔤 = iℝ`. A map with `π_G(1 + h) = 1 + h − Re h` has the right derivative at `1` but does not
  take values in `G`.
- `G = U(N)`: for `M ∈ 𝒰`, `π_G(M) = M(M*M)^{−1/2}` is the unitary polar factor, and
  `dπ_G(1)(H) = (H − H*)/2` is the skew-Hermitian part. For `M_t = [[1, t], [0, 1]] ∈ 𝒰` with `t ≠ 0`,
  `π_G(M_t) = (4 + t²)^{−1/2}[[2, t], [−t, 2]]`, at squared distance `4 + t² − 2√(4 + t²)`, which is
  less than `t² = |M_t − 1|²` (at `t = 1`: `5 − 2√5 ≈ 0.528 < 1`). So the Gram–Schmidt retraction,
  which sends `M_t` to `1`, is a smooth retraction onto `U(N)` but not the nearest-point map.
- `G = {±1} ⊂ U(1)`: `𝔤 = 0`, `π_G(z) = 1` for `z ∈ 𝒰` with `Re z > 0` and `−1` for `Re z < 0`, so
  `π_G` is locally constant and `dπ_G(±1) = 0`, the projection onto the zero space. The points with
  `Re z = 0` are equidistant from `±1` and lie outside `𝒰`.
- `G = U(N)`: `|0 − g|² = tr(g*g) = N` for every `g ∈ U(N)`, so `0` has no unique nearest point and
  `0 ∉ 𝒰`. No retraction is defined on the whole matrix space, and every `M ∈ 𝒰` is invertible.

*Needs:* RiemannianGeometry R6; Tau Ceti `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`; 1.1.

### 1.3 Gauge identities for smooth data

For `X ⊆ ℝ^d` open, smooth `𝔤`-valued 1-forms `A`, smooth `G`-valued `O`, `O'` and a smooth
`𝔤`-valued function `B` on `X`, prove (OhTataru-YMHF line 103–118; OhTataru-TopClass line 165–183
and 1128–1130):

- `O·A` is `𝔤`-valued, `1·A = A` and `O·(O'·A) = (OO')·A`;
- `F[O·A] = Ad(O)F[A]`, and `D(O·A)_j(Ad(O)B) = Ad(O)(D(A)_j B)`;
- `D_j D_k B − D_k D_j B = [F_jk, B]` and the Bianchi identity `D_j F_kl + D_k F_lj + D_l F_jk = 0`;
- `(OO');x = O;x + Ad(O)(O';x)`, `(O⁻¹);x = −Ad(O⁻¹)(O;x)`, and
  `∂_j(Ad(O)B) = Ad(O)∂_j B + [O;j, Ad(O)B]`;
- the connection `A` is a principal connection on the trivial bundle `X × G` (SmoothBundlesConnections
  B3.1) whose local potential in the section `x ↦ (x, 1)` is `A`, whose curvature (B4.1) in that
  section is `F[A]`, and on which the gauge transformation `u = O` of B4.2 acts by `A ↦ O·A`.

The last Leibniz rule corrects OhTataru-TopClass Lemma 3.4(3), line 1130, which writes
`Ad(O)[O;x, B]` for the second term.

**Checks.**

- For `O(x) = g exp(x₁X)` with a constant `g ∈ G` and constant `B = Y`: `O;1 = Ad(g)X`, and
  `∂₁(Ad(O)Y)` at `x₁ = 0` is `Ad(g)[X, Y] = [Ad(g)X, Ad(g)Y] = [O;1, Ad(O)Y]`, whereas
  `Ad(O)[O;1, Y] = Ad(g)[Ad(g)X, Y]`, which differs as soon as `Ad(g)X ≠ X` and `[X, Y] ≠ [Ad(g)X, Y]`
  (for `SU(2)`, `X = i`, `g = exp(πk/4)`, `Y = j`: `Ad(g)i = j`, so `[O;1, Ad(O)Y] = Ad(g)(2k) = 2k` while
  `Ad(g)[j, j] = 0`).
- For `G = U(1)`, `A = i x₁ dx₂` and `O = exp(iφ)`: `F₁₂ = i` and `O·A = A − i dφ`, with
  `F[O·A] = F[A]`.
- A constant `O = c` gives `O·A = Ad(c)A`; a constant central `c` acts trivially, matching
  SmoothBundlesConnections B4.2.

*Needs:* SmoothBundlesConnections B3.1, B4.1, B4.2; 1.1.

### 1.4 Invariant forms, transgression and Cartan forms

Let `k ≥ 1` and let `f` be an `Ad(G)`-invariant symmetric `k`-linear form on `𝔤`: the polarisation
`B_P = f` of the invariant polynomial `P(X) = f(X, …, X)` of CharacteristicClasses C4 item 1.
CharacteristicClasses owns the evaluation of `P` on curvature with its gauge invariance and
closedness, the transgression form of the affine connection path (C4 item 1), and the normalised
Chern–Simons form `CS_P = k ∫₀¹ B_P(θ, F_t, …, F_t) dt`, `F_t = tΩ + ((t² − t)/2)[θ, θ]`, of the Weil
algebra `W(𝔤)` with `d_W CS_P = P(Ω)` and its cocycle `τ(P)` at `Ω = 0` (C5a.3, stated for the identity
component of `G`, which has the same Lie algebra). This section records their form on Euclidean
space and in the right Maurer–Cartan convention of this roadmap (OhTataru-TopClass line 236–255;
OhTataru-YMHF Lemma 6.7, lines 2860–2883). For `𝔤`-valued 2-forms `F₁, …, F_k` on `ℝ^d`,
`f(F₁ ∧ … ∧ F_k)` is the `2k`-form obtained by the paired wedge. Prove:

- Through 1.3's identification of a smooth connection `A` on an open `X ⊆ ℝ^d` with a principal
  connection on `X × G`, C4's evaluation of `P` on its curvature is `f(F ∧ … ∧ F)`;
  `f(Ad(O)F₁ ∧ … ∧ Ad(O)F_k) = f(F₁ ∧ … ∧ F_k)` for `O ∈ G`, and in `d = 2k` the coefficient of
  `f(F ∧ … ∧ F)` is bounded by `C_f |F|^k`.
- The assignment `θ ↦ A`, `Ω ↦ F[A]` is a map of differential graded algebras from `W(𝔤)` to the
  forms on `X` (the image of `d_W Ω = −[θ, Ω]` is the Bianchi identity `dF = −[A ∧ F]` of 1.3), and
  it sends `CS_P` to `T_f(A) = k ∫₀¹ f(A ∧ F_t ∧ … ∧ F_t) dt` with `F_t = t dA + ½ t² [A ∧ A]`, the
  curvature of `tA`; this is C4's transgression form for the affine path from the product connection
  to `A`. Hence `f(F ∧ … ∧ F) = d T_f(A)`.
- For the right Maurer–Cartan form `θ_R = dg g⁻¹` of `G`, which satisfies `dθ_R = θ_R ∧ θ_R`, the
  connection `−θ_R` on `G` is flat, and `ω_f = T_f(−θ_R)`, the image of `τ(P)` under `θ ↦ −θ_R`, is a
  closed `(2k − 1)`-form on `G`. It is invariant under left and right translations: `θ_R` is
  right-invariant and `L_h*θ_R = Ad(h)θ_R`, and `f` is `Ad(G)`-invariant, which for disconnected `G`
  is more than C5a's connected setting provides. For every smooth `G`-valued `O` on `X`,
  `−O;x = O*(−θ_R)`, so `T_f(−O;x) = O*ω_f` by naturality.
- For `G = SU(2)`, `f(X, Y) = tr(XY)` (that is, `f = −⟨·,·⟩` for `⟨X, Y⟩ = −tr(XY)`):
  `T_f(A) = tr(A ∧ dA + ⅔ A ∧ A ∧ A)` and `ω_f = ⅓ tr((dg g⁻¹)³)`.

**Checks.**

- For the pure gauge `A = −R`, `R = dO O⁻¹`: `dR = R ∧ R`, so `dA = −R ∧ R`, `A ∧ A = R ∧ R` and `F = 0`;
  then `tr(A ∧ dA) + ⅔ tr(A³) = tr(R³) − ⅔ tr(R³) = ⅓ tr(R³)`.
- With `Φ` the Conventions' identification and `S³` boundary-oriented, `dΦ` maps the positive frame
  `(e₂, e₃, e₄)` at `e₁` to `(k, i, j)`, `tr((dg g⁻¹)³)(k, i, j) = 6 tr(kij) = −12`, and bi-invariance
  gives `∫_{S³} Φ*tr((dg g⁻¹)³) = −12 · 2π² = −24π²`, so `∫_{S³} Φ*ω_f = −8π²`.
- In `d = 4` with `f = −⟨·,·⟩` the transgression form is
  `−(⟨a_j, ∂_k a_l⟩ + ⅓⟨a_j, [a_k, a_l]⟩) dx^j ∧ dx^k ∧ dx^l`, the form `Y` of OhTataru-YMHF line 2869.
- C5a.3's normalisation for `k = 2`, `B_P(X, Y) = tr(XY)`: `∫₀¹ t dt = ½` and `∫₀¹ (t² − t)/2 dt = −1/12`
  give `CS_P = tr(θΩ) − (1/6) tr(θ[θ, θ])`; with `[θ, θ] = 2θ ∧ θ` and `Ω ↦ dA + A ∧ A` its image is
  `tr(A ∧ dA) + tr(A³) − ⅓ tr(A³) = tr(A ∧ dA + ⅔ A³)`, the `SU(2)` formula above, and at
  `θ = −θ_R`, `Ω = 0` it is `−⅓ tr((−θ_R)³) = ⅓ tr(θ_R³) = ω_f`. An extra factor `1/k!` in the
  polarisation would halve both and give `∫_{S³} Φ*ω_f = −4π²`.

*Needs:* CharacteristicClasses C4 item 1 and C5a.3; DifferentialGeometry Layers 0–1, and 5.2 for the
integral in the Checks; 1.3.

### 1.5 Self-duality in dimension four

For a `𝔤`-valued 2-form `F` on an oriented four-dimensional inner product space put
`F^± = ½(F ± ⋆F)`, so that `⋆F^± = ±F^±` (OhTataru-TopClass Lemma 1.31, lines 901–906, computation
lines 860–866; OhTataru-YMHF Lemma 6.9, lines 2892–2902; Bogomolnyi-Stability). Prove:

- `F = F⁺ + F⁻` with `F⁺ ⊥ F⁻`, and `|F|² = |F⁺|² + |F⁻|²`.
- `⋆⟨F ∧ F⟩ = |F⁺|² − |F⁻|²`; hence the pointwise Bogomol'nyi inequality `|F|² ≥ |⋆⟨F ∧ F⟩|`, with
  equality exactly when `F⁺ = 0` or `F⁻ = 0`.
- For `O ∈ G`, `Ad(O)` commutes with `⋆` and so preserves `F⁺` and `F⁻`; reversing the orientation
  exchanges `F⁺` and `F⁻`.

**Checks.**

- `F = X(dx¹ ∧ dx² + dx³ ∧ dx⁴)` is self-dual with `|F|² = 2|X|²` and `⋆⟨F ∧ F⟩ = 2|X|²`: equality.
- For `X ≠ 0`, `F = X dx¹ ∧ dx²` has `F^± = ½X(dx¹ ∧ dx² ± dx³ ∧ dx⁴)`, `|F|² = |X|²` and `⋆⟨F ∧ F⟩ = 0`: strict.
- For `X ≠ 0`, with the coefficient of `⟨F ∧ F⟩` taken as the all-index sum `8(⟨F₁₂, F₃₄⟩ − …)`, the first Check
  would give `8|X|² > 2|X|²`, refuting the inequality; this pins the Conventions' normalisation.
  For `X = 0` every displayed quantity is `0`, and no strictness is asserted.

*Needs:* Tau Ceti `Orientation.formHodgeStar`, `Orientation.wedge_formHodgeStar_apply`,
`Orientation.formHodgeStar_formHodgeStar_of_even`; 1.1.

### 1.6 The structure constant and the cubic bound

Define `γ₀(𝔤, ⟨·,·⟩)` as the maximum of `|[X,Y]|` over `|X| ≤ 1`, `|Y| ≤ 1`.
For `𝔤 ≠ 0` this equals `sup |[X,Y]|/(|X||Y|)` over nonzero pairs; the denominators are then positive.
For the zero algebra the closed-ball definition gives `0`. For
`𝔤`-valued 2-forms `F`, `ω` on `ℝ⁴` put `𝔉_F(ω)_{ij} = Σ_l ([F_il, ω_lj] − [F_jl, ω_li])`, the curvature
term of the Weitzenböck formula for `𝔤`-valued 2-forms. Prove: `𝔉_F(ω) = 𝔉_{F⁺}(ω)` when `ω` is
self-dual, and for self-dual `ω`, `|⟨ω, 𝔉_ω(ω)⟩| ≤ (2√6/3) γ₀ |ω|³`, where `⟨ω, η⟩ = Σ_{i<j} ⟨ω_ij, η_ij⟩`
(GurskyKelleherStreets-GapTheorem Definition 2.3 and Lemma 2.6, lines 164–222, in the normalisation of
this roadmap; OhTataru-TopClass Lemma 6.4 and line 2404).

- The closed-ball maximum is attained; for `c > 0` it scales as
  `γ₀(𝔤, c⟨·,·⟩) = c^{−1/2} γ₀(𝔤, ⟨·,·⟩)`. It vanishes exactly when the bracket is zero.
- Orthogonality of the factors: decompose the semisimple ideal `[𝔤, 𝔤]` of LieGroups Layer 5A into its
  simple ideals by Mathlib (`LieAlgebra.IsKilling.instSemisimple`,
  `LieAlgebra.IsSemisimple.isSimple_of_isAtom`; the atomic ideals of `[𝔤, 𝔤]` are ideals of `𝔤`
  because the centre brackets trivially). For every `ad`-invariant inner product, distinct simple
  ideals `I`, `J` are orthogonal: for `X, Y ∈ I` and `Z ∈ J`, `⟨[X, Y], Z⟩ = −⟨Y, [X, Z]⟩ = 0` since
  `[I, J] ⊆ I ∩ J = 0`, and `I = [I, I]` because `I` is simple; the same computation with `Z` central
  gives `[𝔤, 𝔤] ⊥ z(𝔤)`.
- Hence `γ₀(𝔤, ⟨·,·⟩)` is the maximum of `γ₀(I, ⟨·,·⟩|_I)` over the simple ideals `I` of `[𝔤, 𝔤]`, with
  value `0` when `[𝔤, 𝔤] = 0`: writing `X = X_z + Σ_m X_m`, `Y = Y_z + Σ_m Y_m`, one has
  `|[X, Y]|² = Σ_m |[X_m, Y_m]|² ≤ max_m γ_m² Σ_m |X_m|²|Y_m|² ≤ max_m γ_m² |X|²|Y|²`, with equality for
  a maximising pair inside one ideal.
- In an orthonormal basis `e₁, e₂, e₃` of self-dual 2-forms, `ω = Σ ω^a e_a`,
  `⟨ω, 𝔉_ω(ω)⟩ = ±6√2 ⟨ω¹, [ω², ω³]⟩`.

**Checks.**

- `𝔰𝔲(2)` with `−tr`: `X = diag(i, −i)`, `Y = [[0, 1], [−1, 0]]` give `[X, Y] = [[0, 2i], [2i, 0]]`,
  `|X|² = |Y|² = 2`, `|[X, Y]|² = 8`, so the ratio is `√2`; with the cross-product description of
  `𝔰𝔲(2)` no pair does better, so `γ₀ = √2` (OhTataru-TopClass line 2338: normalisation (6.3) is `−tr`).
- For `ω^a = λ(i, j, k)` (the BPST curvature at a point, GurskyKelleherStreets-GapTheorem Remark 2.7,
  lines 223–232): `|ω|² = 6λ²`, `⟨ω¹, [ω², ω³]⟩ = 4λ³`, so `|6√2 · 4λ³| = 24√2 |λ|³ = (2√6/3) √2 (6λ²)^{3/2}`:
  the bound is an equality. For the explicit basis
  `e₁=(dx12+dx34)/√2`, `e₂=(dx13−dx24)/√2`, `e₃=(dx14+dx23)/√2`,
  the signed cubic is `−24√2 λ³`.
- For commutative `𝔤` both sides vanish; for `𝔤 = 0` the maximum is `0` at `(0,0)`,
  while a maximum over nonzero pairs would have no attaining pair.
- `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` with `−tr` on the first factor and `−4 tr` on the second: the scaling law gives
  `γ₀ = √2` and `4^{−1/2}√2 = √2/2` on the factors, so `γ₀ = max(√2, √2/2) = √2`; a sum or a
  root-mean-square of the factor constants would give `3√2/2` or `√5/2`.
- On `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` add to `−tr ⊕ −tr` the cross term `⟨(X, 0), (0, Y)⟩ = −c tr(XY)` with
  `0 < |c| < 1` (still positive definite). Then `⟨[(j, 0), (k, 0)], (0, i)⟩ = ⟨(2i, 0), (0, i)⟩ = −2c tr(i²) = 4c`,
  while `−⟨(k, 0), [(j, 0), (0, i)]⟩ = 0`, so the form is not `ad`-invariant: orthogonality of the simple
  ideals is forced by invariance, not assumed.
- `𝔲(2) = iℝ·1 ⊕ 𝔰𝔲(2)` with `−tr`: the centre is orthogonal to `𝔰𝔲(2)` (`−tr(i·1 · X) = −i tr X = 0`
  for traceless `X`), the bracket ignores the central components, and `γ₀(𝔲(2)) = γ₀(𝔰𝔲(2)) = √2`.

*Needs:* Mathlib `LieAlgebra.IsKilling.instSemisimple`, `LieAlgebra.IsSemisimple.isSimple_of_isAtom`;
LieGroups Layer 5A; 1.1, 1.5.

### Examples

`U(1)`, `SU(2)` with `−tr` and its constant `γ₀ = √2`, the finite group `{±1}` and the group
`T² ⋊ ℤ/2` with a non-admissible inner product; the transgression of the pure gauge of `Φ` with value
`−8π²`; the self-dual form `X(dx¹ ∧ dx² + dx³ ∧ dx⁴)`.

### Dependencies

Mathlib's unitary groups and exponential; Tau Ceti's Hodge star and closed-subgroup theorem;
RiemannianGeometry R6; LieGroups Layers 1 and 5A; SmoothBundlesConnections B3.1, B4.1, B4.2;
CharacteristicClasses C4 item 1 and
C5a.3; DifferentialGeometry Layers 0–1.

## Layer 2: critical Sobolev maps into `G`

Throughout this layer `d ≥ 3`, `1 ≤ k < d` is an integer and `X ⊆ ℝ^d` is open
(OhTataru-TopClass line 991). The Sobolev definitions themselves cover every integer order
and every `1 ≤ p ≤ ∞`.

### 2.1 Vector-valued Sobolev classes and `G^{k,p}`

For a finite-dimensional real normed space `V`, `W^{k,p}(X; V)` is the space of `u ∈ L^p(X; V)` whose
iterated weak derivatives of order `≤ k` (Tau Ceti `TauCeti.HasWeakFDerivOn`) exist and lie in `L^p`,
and `W^{k,p}_loc(X; V)` the class of the `u` with `u|_B ∈ W^{k,p}(B; V)` for every ball `B` with closure
in `X` (OhTataru-TopClass line 964–968). For `k = 1` the space is Tau Ceti's `TauCeti.WeakDerivStep`
over `Lᵖ(X; V)` (From Tau Ceti); the orders `k ≥ 2`, the local classes, and the coordinatewise
identification with the scalar `TauCeti.Wkp` in any basis of `V` are PDE's (gap `vector-valued-wkp`
under Exact supplier contracts).
Define `G^{k,p}_loc(X)` as the `O ∈ W^{k,p}_loc(X; M_N(ℂ))` with
`O(x) ∈ G` for almost every `x`, and `G^{k,p}(U)` likewise (OhTataru-TopClass (1.5), lines 283–285,
and lines 982–989).

- Every `O ∈ G^{k,p}_loc(X)` satisfies `|O(x)| = √N` almost everywhere (Frobenius norm), so lies in `L^∞`.
- Restriction to open subsets, constant maps, and smooth `G`-valued maps on a neighbourhood of the
  closure of a bounded `U` give elements; membership is local (a sheaf condition on open covers).
- On a connected `X`, an `O ∈ G^{1,1}_loc(X)` takes values almost everywhere in a single connected
  component of `G` (compose with the locally constant component map).

**Checks.**

- `d = 4`, `X ∈ 𝔤 ∖ {0}`, `φ(x) = log log(1/|x|)` on `B_{1/e}`: `|∇φ| ≈ 1/(|x| log(1/|x|))`,
  `|∇²φ| ≈ 1/(|x|² log(1/|x|))`, and `∫ |∇²φ|² + |∇φ|⁴ < ∞` (the radial integrals are
  `∫ dr/(r log²(1/r))` and `∫ dr/(r log⁴(1/r))`); so `O = exp(φX)` lies in `G^{2,2}(B_{1/e})` and has no
  continuous representative at `0`: the critical class is not contained in `C⁰`.
- For a finite `G`, `G^{k,p}_loc(X)` consists of the maps that are almost everywhere constant on each
  component of `X`.
- `d = 3`, `G = U(1)`, `O = exp(iθ)` with `θ` the angle around the `x₃`-axis: `|∇O| ≈ 1/ρ`, `ρ` the
  distance to the axis, and `∫_{B₁} ρ^{−3} dx = ∞`, so `O ∉ G^{1,3}(B₁)` and `O ∉ G^{2,3/2}(B₁)`.

*Needs:* Tau Ceti `TauCeti.WeakDerivStep`; gap `vector-valued-wkp` (PDE); Mathlib `MeasureTheory.Lp`; 1.1.

### 2.2 Approximation by smooth `G`-valued maps

Prove: for `O ∈ G^{k,d/k}_loc(X)`, an open `U` with compact closure in `X`, open `V`, `W ⊆ U` with
`V ∩ W = ∅`, and `ε > 0`, there is `O' ∈ G^{k,d/k}_loc(X)` equal to `O` almost everywhere on `V`
and off `U`, smooth with values in `G` on `W`, with `‖O' − O‖_{W^{k,d/k}(U)} < ε`; in particular `O` is
the `W^{k,d/k}(B)`-limit of smooth `G`-valued maps on every ball `B` with closure in `X`
(OhTataru-TopClass Lemma 3.2, lines 1038–1072). Route: inhomogeneous mollification
`O_δ(x) = ∫ ζ(y) O(x − δh(x)y) dy`, with `ζ` smooth, supported in the unit ball and of integral `1`, and
a smooth `h : X → [0, 1]` vanishing on `V` and off `U` and positive on `W`; such an `h` exists because
`W` lies in the open set `U ∖ V̄` (an open `W` disjoint from `V` misses `V̄`), and every open subset of
`ℝ^d` is the set where some smooth function `h ≥ 0` is positive. Then `O_δ = O` where `h = 0`, that is
on `V` and off `U`, and `O_δ` is smooth where `h > 0`, in particular on `W`; the Poincaré inequality
on small balls gives `dist(O_δ(x), G)^d ≲ ∫_{B_{δh(x)}(x)} |∂O|^d → 0` uniformly on the compact
closure of `U`, so `π_G ∘ O_δ` is defined and converges. The source chooses `h` equal to `1` on `W`
(line 1049), which needs disjoint closures of `V` and `W`; a cut-off that is only positive on `W`
needs no more than `V ∩ W = ∅`.

**Checks.**

- `U = W = B₁`, `V = ∅` (the plain approximation on a ball): a smooth `h` equal to `1` on `B₁` equals `1`
  on `∂B₁` and so is positive at points off `U`, where `O_δ` differs from `O`; the standard bump
  `h(x) = exp(−1/(1 − |x|²))` for `|x| < 1`, `h = 0` otherwise, is smooth with values in `[0, e^{−1}]`,
  positive on `W` and zero off `U`, as the route requires.
- `U = B₁`, `V = B₁ ∩ {x₁ < 0}`, `W = B₁ ∩ {x₁ > 0}`: `V ∩ W = ∅` while the closures meet along
  `{x₁ = 0}`, so no continuous `h` is `0` on `V` and `1` on `W`; the product of `exp(−1/x₁)` (for
  `x₁ > 0`, and `0` for `x₁ ≤ 0`) with the bump of the previous Check is smooth, positive exactly on
  `W`, and zero on `V` and off `U`, so the statement holds for this pair.
- `V = U`, `W = ∅`: the conclusion is met by `O' = O`, and `O'` keeps every singularity of `O` in `V`
  (for instance that of the map `exp(log log(1/|x|) X)` of 2.1 at `0 ∈ V`): smoothness is asserted on
  `W` only.

*Needs:* PDE §1.2 (Tau Ceti `TauCeti.Wkp.dense_contDiffOn_representatives`), §1.4 (Sobolev embedding
`W^{k,d/k} ⊆ W^{1,d}`) and §1.5 (Poincaré on balls); 1.2; 2.1.

### 2.3 Products and inverses

Prove that pointwise multiplication `G^{k,d/k}_loc(X) × G^{k,d/k}_loc(X) → G^{k,d/k}_loc(X)` and
inversion `O ↦ O⁻¹` are continuous, with `∂_j(O⁻¹) = −O⁻¹(∂_j O)O⁻¹`, and the same on `G^{k,d/k}(U)` for
a bounded Lipschitz domain `U` (OhTataru-TopClass Lemmas 3.1 and 3.3, lines 1000–1102). Route: `O⁻¹ = O*`
almost everywhere, a real-linear isometry; for products, the Leibniz rule with the embeddings
`W^{k,d/k} ⊆ W^{j,d/j}`, `1 ≤ j ≤ k`, Hölder's inequality, the bound `|O| = √N`, and dominated
convergence along almost everywhere convergent subsequences. The critical product proof uses the bounded group values
(OhTataru-TopClass line 1011).

- `‖O₁O₂‖_{W^{k,d/k}} ≲ ‖O₁‖_{L^∞}‖O₂‖_{W^{k,d/k}} + ‖O₁‖_{W^{k,d/k}}‖O₂‖_{L^∞}` on `U`.

*Needs:* PDE §1.4 (iterated embeddings on bounded Lipschitz domains); 2.1, 2.2.

### 2.4 Maurer–Cartan forms and the adjoint action

Prove (OhTataru-TopClass Lemma 3.4, lines 1109–1135): `O ↦ O;x` and `O ↦ O⁻¹∂_x O` are continuous
`G^{k,d/k}_loc(X) → W^{k−1,d/k}_loc(X; 𝔤)` (with values in `𝔤` almost everywhere); for `0 ≤ k' < k`,
`(O, B) ↦ Ad(O)B` is continuous `G^{k,d/k}_loc(X) × W^{k',d/k}_loc(X; 𝔤) → W^{k',d/k}_loc(X; 𝔤)`;
at `k' = k` the same conclusion holds with `B ∈ W^{k,d/k}_loc ∩ L^∞_loc` and the
intersection topology on this second input; and the
product and inverse identities of 1.3 hold almost everywhere for
`O, O₁, O₂ ∈ G^{k,d/k}_loc(X)`. The adjoint derivative identity holds almost everywhere for
`B ∈ W^{k',d/k}_loc(X; 𝔤)` under these hypotheses when `k' ≥ 1`; at `k' = 0` only the continuous adjoint action is asserted. The same holds on bounded Lipschitz domains. The top-order boundedness qualification
corrects the endpoint printed in OhTataru-TopClass line 1116–1123; without it the term
`[O;x, Ad(O)B]` need not have the required integrability. That `O;x` takes values in `𝔤`
follows from 2.2 and the closedness of `𝔤`.

**Checks.**

- For `U(1)`, `O = exp(iφ)` has `O;x = i dφ`; the adjoint action is the identity, so the
  derivative of `Ad(O)B` equals that of `B`.
- For `SU(2)`, `d = 4`, `k = 1`, set `L = log(1/r)` on `B_{1/e}`,
  `O = exp(√L i)` and `B = √L j`. Both `O` and `B` are in `W^{1,4}`: their derivative
  fourth-power radial integrals are multiples of `∫₁^∞L^{−2}dL = 1`. But the rotating part
  of `∂_r(Ad(O)B)` has norm proportional to `1/r`, so its fourth-power integral contains
  `∫₀^{1/e}dr/r = ∞`. This refutes the unqualified `k' = k` action.
- When `B` is a constant matrix `j`, the same `O` gives `∂_r(Ad(O)j)` of magnitude
  proportional to `1/(r√L)`; its fourth-power integral is finite. Bounded top-order data
  meet the corrected statement.

*Needs:* 1.3, 2.2, 2.3.

### 2.5 The homotopy class of a critical map on an annulus

For `0 < R₁ < R₂ < ∞`, an annulus `A = {R₁ < |x| < R₂}` and `O ∈ G^{2,d/2}(A)` prove (OhTataru-TopClass Lemmas 3.20–3.22,
lines 1623–1665):

- for almost every `R ∈ (R₁, R₂)` the restriction of `O` to `∂B_R` has a continuous representative,
  and these representatives are mutually homotopic; this defines `[O] ∈ [S^{d−1}, G]`, the free
  homotopy classes (Mathlib `ContinuousMap.Homotopic`);
- `[O]` is locally constant for the `W^{2,d/2}(A)` topology, and `[O₁O₂] = [O₁]·[O₂]` for the
  pointwise product of classes;
- for `0 < δ < R₁` and `O ∈ G^{2,d/2}({R₁ − δ < |x| < R₂})` there is `Õ ∈ G^{2,d/2}(B_{R₂})` equal to `O` on `A` exactly when
  `[O]` is the class of a constant map;
- for `O ∈ G^{2,d/2}_loc(ℝ^d ∖ B̄_{R₁})` with `∂O ∈ L^d(ℝ^d ∖ B̄_{R₁})`,
  `[O]` is the class of a constant map. This is a derivative condition; the unitary-valued map
  itself need not lie in `L^{d/2}` on this infinite-measure domain.

Route: `W^{2,d/2} ⊆ W^{1,d}`; in polar coordinates almost every slice lies in `W^{1,d}(S^{d−1})`, which
embeds into `C⁰` by Morrey's inequality in stereographic charts since `d > d − 1`; smooth `G`-valued
approximants (2.2) converge uniformly on almost every sphere, and uniformly close maps into `G` are
homotopic through `π_G`. For the exterior statement, `∫_{r > R₁} ∫_{S^{d−1}} |∂_Θ O|^d dΘ dr/r < ∞` forces
`liminf_{r→∞} ‖∂_Θ O(r,·)‖_{L^d(S^{d−1})} = 0`. The source states the last two items with "`[id]`",
which is the class of a constant map only for connected `G` (Lemma 3.21's proof joins the constant
`O_n(0)` to the identity).

**Checks.**

- A constant map with value `−1` in `{±1}` extends by that constant to the ball; its class
  is not the class of the identity value `1`. Thus “some constant” is necessary.
- The degree-one map `Φ(x/|x|)` in dimension four has no extension to the ball in the critical
  class: its sphere degree is `1`, while the boundary of any such extension has degree `0`.
- On the exterior, a constant has `∂O = 0` and the constant homotopy class, whereas the same
  homogeneous degree-one map has `∫|∂O|^d = C∫₁^∞ dr/r = ∞`. Its obstruction is excluded
  by the derivative hypothesis, not by an impossible global `L^{d/2}` condition on `O`.

*Needs:* Mathlib `ContinuousMap.Homotopic`, `MeasureTheory.Measure.toSphere`,
`homeomorphUnitSphereProd`; PDE §1.4 (Morrey's inequality on balls); 1.2, 2.2, 2.3.

### Examples

The discontinuous critical map `exp(log log(1/|x|) X)` in `G^{2,2}(B_{1/e})`; the vortex
`exp(iθ) ∉ G^{1,3}`; for `d = 4`, `G = SU(2)` and `O(x) = Φ(x/|x|)` on an annulus, `[O]` is the class of
`Φ`, which is not the class of a constant map (its degree is `1`, §6.4), so `O` has no `G^{2,2}`
extension to the ball.

### Dependencies

Layer 1; Tau Ceti's weak derivatives and Sobolev carriers; PDE §1.2, §1.4 and §1.5, and the
vector-valued classes of gap `vector-valued-wkp`; Mathlib's homotopy and polar-coordinate API.

## Layer 3: rough connections and gauge invariance

Throughout this layer `d ≥ 3` and `X ⊆ ℝ^d` is open.

### 3.1 Rough bundles, connections and curvature

Define a `G^{2,d/2}_loc` bundle on `X` as an open cover `{U_α}` of `X` with transition maps
`O_(αβ) ∈ G^{2,d/2}_loc(U_α ∩ U_β)` satisfying `O_(αα) = 1` and `O_(αβ)O_(βγ) = O_(αγ)` almost everywhere,
with equivalence through a common refinement and maps `P_(γ) ∈ G^{2,d/2}_loc(V_γ)` intertwining the
cocycles. Define a `W^{1,d/2}_loc` connection on it as local potentials
`A_(α) ∈ W^{1,d/2}_loc(U_α; 𝔤 ⊗ (ℝ^d)*)` with `A_(α) = O_(αβ)·A_(β)` almost everywhere on overlaps, its
curvature by `F_(α) = dA_(α) + ½[A_(α) ∧ A_(α)]`, and `A^{1,d/2}_loc(X)` as the class of all such
connections on all such bundles (OhTataru-TopClass line 289–335). A global potential is a
connection on the one-set cover `{X}`.

- `F_(α) ∈ L^{d/2}_loc(U_α)`, since `W^{1,d/2}_loc ⊆ L^d_loc`, and `F_(α) = Ad(O_(αβ))F_(β)` on overlaps;
  hence `|F|` is a well-defined element of `L^{d/2}_loc(X)`.
- Equivalence of bundles is an equivalence relation, compatible with restriction to open subsets
  and with refinement; connections transport along equivalences.
- Translations and the dilations `A ↦ A_λ`, `A_λ(x) = λA(λx)`, act, with `F[A_λ](x) = λ² F[A](λx)`.
- Smooth connections on smooth bundles define elements of `A^{1,d/2}_loc(X)`.

**Checks.**

- Scaling: `‖F[A_λ]‖_{L^{d/2}}^{d/2} = ∫ λ^d |F(λx)|^{d/2} dx = ‖F[A]‖_{L^{d/2}}^{d/2}`, so the critical
  norm is dilation invariant, and in `d = 4` so is the energy; in `d = 3` the `L²` norm of `F` scales by
  `λ^{1/2}`.
- `d = 3`, `G = U(1)`, `A = i dθ` around the `x₃`-axis: `F = 0` off the axis, but `|∇A| ≈ ρ^{−2}` and
  `∫_{B₁} ρ^{−3} dx = ∞`, so `A ∉ W^{1,3/2}_loc(B₁)`: the class excludes line singularities.
- For a finite `G` every potential is `0` and every curvature vanishes.

*Needs:* 2.1–2.4; PDE §1.4.

### 3.2 Gauge invariance of finite energy

Prove: for `A ∈ W^{1,d/2}_loc(X; 𝔤 ⊗ (ℝ^d)*)` and `O ∈ G^{2,d/2}_loc(X)`, `O·A ∈ W^{1,d/2}_loc(X; 𝔤 ⊗ (ℝ^d)*)`,
`F[O·A] = Ad(O)F[A]` almost everywhere, and `‖F[O·A]‖_{L^{d/2}(X)} = ‖F[A]‖_{L^{d/2}(X)}`; for `d = 4`,
`ℰ_e(O·A) = ℰ_e(A)`. Equivalent rough bundles with connections have the same `|F|` almost everywhere
(OhTataru-TopClass line 283–292; OhTataru-YMHF line 103–118, 124–130).

**Checks.**

- `G = U(1)`, `O = exp(iφ)` with `φ ∈ W^{2,d/2}_loc`: `O·A = A − i dφ` and `F` is unchanged.
- `O(x) = Φ(x/|x|)` on `X = ℝ⁴ ∖ {0}` and `A = 0`: `O·A = −O;x` has curvature `0`, consistent with
  `F[O·A] = Ad(O)·0`, although `|O;x| ≈ 1/|x|`.

*Needs:* 1.3, 2.4, 3.1.

### 3.3 Patching to a global gauge

Prove: every `G^{2,d/2}_loc` bundle on `X = B_R` or `X = ℝ^d` admits a global gauge, and every connection
on it has a global potential in `W^{1,d/2}_loc(X)`. Quantitatively, fix `R ≥ 1` and a covering margin
`0 < ℓ ≤ 1`, and cover `B_R` by the traces `B_α ∩ B_R` of unit balls `B_α` centred in `B_R` such that for every
`x ∈ B_R` the set `B_ℓ(x) ∩ B_R` lies in some `B_α` (a Lebesgue number `ℓ` for the cover). Then transition
maps and local potentials with `‖O_(αβ);x‖_{W^{1,d/2}(B_α ∩ B_β ∩ B_R)} ≤ M` and
`‖A_(α)‖_{W^{1,d/2}(B_α ∩ B_R)} ≤ M` give a global potential with `‖A‖_{W^{1,d/2}(B_R)} ≤ C(d, G, R, M, ℓ)`
(OhTataru-TopClass Propositions 3.9–3.10 and Scenarios (1)–(3), lines 1165–1347). The constant
depends on `ℓ` because the reduction of Scenario (2) to the cube scenario chooses the refining
cube scale from the Lebesgue number (lines 1265–1281); no bound on the number of balls or on their
overlap is needed. Proposition 3.9 writes `W^{k,d/k}` for the potential, which should read `W^{k−1,d/k}`,
and Remark 3.8 infers a Lebesgue number of order `1` from the separation of the unit-ball centres,
which the second Check refutes. In applications the cover is chosen so that the balls of radius `½`
with the same centres already cover `B_R`; then `ℓ = ½`.

**Checks.**

- If the balls `B_{1/2}(x_α)` cover `B_R`, then `ℓ = ½` works: for `x ∈ B_{1/2}(x_α)` and `y ∈ B_{1/2}(x)`,
  `|y − x_α| < ½ + ½ = 1`, so `B_{1/2}(x) ⊆ B_1(x_α)`.
- Separation does not give a margin. In `ℝ⁴` put `a = 1 − ε`, `0 < ε < ½`, and take the eight unit balls
  centred at `±a e_j`. They cover `B₁`: for `|x| = r < 1` pick `j` with `|x_j| ≥ r/2` and the matching sign;
  the squared distance to that centre is at most `r² − ar + a² ≤ max(a², 1 − a + a²) < 1`. Their centres are
  at mutual distance at least `√2 a ≥ √2/2`, yet `B_ℓ(0)` lies in one of them only for `ℓ ≤ 1 − a = ε`.
  A bound depending only on `d`, the separation, `R` and `M` would be uniform in `ε`; the statement above
  keeps `ℓ`.
- A single ball, `R = 1` and the cover `{B₁}`: `ℓ = 1`, the bundle is trivial on the one set, and the global
  potential is `A_(1)` with norm at most `M`.

*Needs:* 2.2–2.5, 3.1.

### 3.4 Concentration radii

For `D ∈ A^{1,d/2}_loc(X)` and `ε > 0` define the inner concentration radius
`r_c^ε[D] = sup{r > 0 : ‖F‖_{L^{d/2}(B_r(x) ∩ X)} ≤ ε for all x ∈ X}` and, for `X = ℝ^d`, the outer
concentration radius `R_c^ε[D] = inf{r > 0 : ‖F‖_{L^{d/2}(ℝ^d ∖ B_r(x))} ≤ ε for some x}`
(OhTataru-TopClass line 337–341 and 361–365).

- If `F ∈ L^{d/2}(X)` then `r_c^ε[D] > 0`, by uniform absolute continuity of `|F|^{d/2}`; if `X = ℝ^d`
  then `R_c^ε[D] < ∞`.
- Both are gauge invariant; `r_c^ε[D_λ] = λ^{−1} r_c^ε[D]` and `R_c^ε[D_λ] = λ^{−1} R_c^ε[D]`; `r_c^ε` is
  nondecreasing and `R_c^ε` nonincreasing in `ε`.

**Checks.**

- `F = 0`: `r_c^ε = ∞` and `R_c^ε = 0`.
- If `‖F‖_{L^{d/2}(X)} ≤ ε` then `r_c^ε = ∞`.
- For the BPST connection of §7.6 (`d = 4`), `‖F‖²_{L²(B_r)} = 96π² ∫₀^r s³(1 + s²)^{−4} ds`, which equals
  `8π² · r⁴(r² + 3)/(r² + 1)³` exactly (tending to `8π²`); the energy density is radially decreasing, so
  balls centred at `0` carry the most curvature and `r_c^ε` is the root of `8π² r⁴(r² + 3)/(r² + 1)³ = ε²`
  for `ε² < 8π²`, which behaves like `(ε²/24π²)^{1/4}` as `ε → 0`; dilating the instanton by `λ` divides it by
  `λ`.

*Needs:* 3.1.

### Examples

The angular potential `i dθ` excluded from `A^{1,3/2}_loc`; the pure gauge `−O;x` of `Φ(x/|x|)` on
`ℝ⁴ ∖ {0}`; the concentration radius of the BPST connection.

### Dependencies

Layer 2; PDE §1.4.

## Layer 4: Uhlenbeck's lemmas and the good gauge on a ball

Throughout this layer `d ≥ 3`.

### 4.1 Uhlenbeck's lemma on the unit ball

Prove (OhTataru-TopClass Theorem 3.11, lines 1358–1395; Uhlenbeck-LpCurvature Theorem 1.3): there are
`ε₀ > 0` and `C₀` such that for every `A ∈ W^{1,d/2}(B₁; 𝔤 ⊗ (ℝ^d)*)` with `‖F[A]‖_{L^{d/2}(B₁)} < ε₀`:

- there is `O ∈ G^{2,d/2}(B₁)` with `Ã = O·A` satisfying `∂^ℓ Ã_ℓ = 0` in `B₁` weakly, `x^ℓ Ã_ℓ = 0` on `∂B₁`
  in the sense of traces, and `‖Ã‖_{W^{1,d/2}(B₁)} ≤ C₀ ‖F[A]‖_{L^{d/2}(B₁)}`;
- if `O'` is another such gauge with the same three properties, then `O' = cO` for a constant `c ∈ G`;
- if `A_n → A` in `W^{1,d/2}(B₁)` and `(Ã_n, O_n)` are such gauges for `A_n`, then after passing to a
  subsequence and replacing `(Ã_n, O_n)` by `(Ad(c_n)Ã_n, c_n O_n)` for constants `c_n ∈ G`, `Ã_n → Ã` in
  `W^{1,d/2}(B₁)` and `O_n → O` in `W^{2,d/2}(B₁)`.

Route: the method of continuity along `A_t(x) = tA(tx)`, `t ∈ [0, 1]`, whose curvature norms are
`‖F‖_{L^{d/2}(B_t)}`; openness by the implicit function theorem for the map
`(O, A) ↦ ∂^ℓ(O·A)_ℓ` with Neumann data, through the requested `L^p` Neumann theory; closedness by the
a priori estimate for the div–curl system `dÃ + ½[Ã ∧ Ã] = F`, `∂^ℓ Ã_ℓ = 0`, `x^ℓ Ã_ℓ = 0`, through the
requested div–curl estimate with vanishing normal component; uniqueness
because `Õ = O'O⁻¹` has `‖Õ;x‖_{W^{1,d/2}} ≲ ε₀` and solves a div–curl system with vanishing normal
component, forcing `Õ;x = 0`; continuity by weak compactness, uniqueness and the strong convergence of
`F[Ã_n] = Ad(O_n)F[A_n]` (OhTataru-TopClass line 1372–1395). Rescaling gives the same statement on
`B_r(x₀)` under `‖F‖_{L^{d/2}(B_r(x₀))} < ε₀`.

**Checks.**

- `G = U(1)`: `Ã = A − i dφ` where `φ` solves the Neumann problem `Δφ = −i ∂^ℓ A_ℓ`, `∂_ν φ = −i x^ℓ A_ℓ`;
  the gauge is unique up to the constant in `φ`, matching the second item.
- `A = 0`: the gauges are exactly the constants.
- `G = SU(2)`, `d = 4`: the statement is FourManifolds §5.3's small-curvature Coulomb gauge on the
  unit 4-ball, with `‖Ã‖_{W^{1,2}} + ‖Ã‖_{L⁴} ≲ ‖F‖_{L²}` because `W^{1,2}(B₁) ⊆ L⁴(B₁)`.
- Linearising at `A = 0`: a gauge `O = exp(ψ)` with small `ψ` keeps the three properties to first
  order exactly when `Δψ = 0` in `B₁` and `∂_ν ψ = 0` on `∂B₁`, whose solutions are the constants; this is
  the infinitesimal form of the second item, and its proof uses the bound to stay in this regime.

*Needs:* gap `lp-neumann-ball` (PDE); gap `lp-divcurl-normal-ball` (PDE); PDE §1.4 and §1.6; 2.3, 2.4,
3.1; 4.3.

### 4.2 Uhlenbeck's lemma on a punctured ball

Prove (OhTataru-TopClass Theorem 3.12, lines 1398–1412; Uhlenbeck-RemovableSingularities Theorem 4.1):
there is `ε'₀ > 0` such that if `D ∈ A^{1,d/2}_loc(B'_{1+δ})`, `δ > 0`, has a global potential
`A ∈ W^{1,d/2}_loc(B'_{1+δ})` with `‖F[A]‖_{L^{d/2}(B'₁)} ≤ ε'₀`, then there is `O ∈ G^{2,d/2}_loc(B'₁)` with
`Ã = O·A` satisfying `∂^ℓ Ã_ℓ = 0` in `B'₁` and `‖Ã‖_{W^{1,d/2}(B'₁)} ≲ ‖F[A]‖_{L^{d/2}(B'₁)}`; consequently `Ã`
extends to `W^{1,d/2}(B₁)` (a point is removable for `W^{1,d/2}`, `d/2 < d`) and `D` extends to an element
of `A^{1,d/2}_loc(B_{1+δ})`. Route: 4.1 on dyadic annuli, patching of the gauges through 3.3 and 2.5, and
the decay of the small transition maps.

**Checks.**

- `d = 4`, `A = −O;x` with `O = Φ(x/|x|)`: `F = 0`, `A ∉ W^{1,2}(B'₁)` since `∫ |x|^{−4} dx = ∞` near `0`, and
  `Ã = O⁻¹·A = 0` extends: the extension needs the gauge change.
- Every connection on `B'_{1+δ}` with a global potential and `F ∈ L^{d/2}(B'₁)` extends across the puncture: `‖F‖_{L^{d/2}(B'_r)} ≤ ε'₀` for small
  `r` by absolute continuity, and the statement applies on `B'_r` after rescaling; the threshold only
  governs the bound on `B'₁`.
- For `d = 3`, a `U(1)` monopole of charge `n ≠ 0` on a punctured ball has no global
  potential: its flux is `2πn`, whereas the flux of `dA` for a global potential is `0`.
  Hölder on each sphere gives `∫_{S_r}|F|^{3/2} ≥ |2πn|^{3/2}/(4πr²)^{1/2}`;
  integrating in `r` gives a positive multiple of `|n|^{3/2}∫₀¹ dr/r = ∞`.
  It fails both the global-potential and finite-curvature hypotheses.

*Needs:* 2.5, 3.3, 4.1.

### 4.3 Elliptic regularity of the nonlinear div–curl system

Prove (OhTataru-TopClass Lemmas 3.13–3.17 and Remark 3.15, lines 1418–1496): if `A ∈ W^{1,d/2}(B)` on a
unit ball `B`, for an integer `m ≥ 0`, solves `∂_j A_k − ∂_k A_j = F_jk − [A_j, A_k]`, `∂^ℓ A_ℓ = 0`, and `D^{(m)}F ∈ L^{d/(m+2)}(B)`
with `d/(m+2) > 1`, then `∂^{(m+1)}A ∈ L^{d/(m+2)}(λB)` for `0 ≤ λ < 1`, bounded in terms of `m`,
`‖D^{(m)}F‖_{L^{d/(m+2)}(B)}`, `‖A‖_{L^d(B)}` and `λ`. Prove the angular version: if
`B ∩ B₁(0) = ∅`, set `∂̸_jk = |x|^{−1}(x_j∂_k − x_k∂_j)` and
`D̸_jk = |x|^{−1}(x_jD_k − x_kD_j)`; then `D̸^{(m)}F ∈ L^{d/(m+2)}(B)` implies
`∂∂̸^{(m)}A ∈ L^{d/(m+2)}(λB)`, bounded by its curvature norm,
`‖A‖_{W^{1,d/2}(B)}`, `m` and `λ`.

For sequences in §4.1, additionally suppose the original covariant derivatives
`D(A_n)^{(j)}F[A_n] → D(A)^{(j)}F[A]` strongly in `L^{d/(j+2)}(B)` for
`0 ≤ j ≤ m`, where `d/(m+2) > 1`. In the normalised Coulomb gauges, prove
`∂^{(j+1)}Ã_n → ∂^{(j+1)}Ã` strongly in `L^{d/(j+2)}(λB)` for each such `j`.
The angular conclusion holds under the corresponding strong angular curvature hypotheses.
If the original potentials also converge in the ordinary Sobolev orders
`W^{j+1,d/(j+2)}` for `0 ≤ j ≤ m`, the equation for `∂O_n` upgrades the
gauge convergence to `W^{m+2,d/(m+2)}(λB)`. Thus higher derivative convergence requires
higher derivative data, rather than only the base convergence in §4.1.
For a ball `B ⊂ ℝ^d` and `1 < p < ∞`, define `ℓ¹W^{1,p}(B)` as the restrictions to `B`
of `B¹_{p,1}(ℝ^d)` with the inhomogeneous partition of gap `inhomogeneous-besov-partition`
(PDE §7.1–§7.2), with norm
`inf{‖U‖_{B¹_{p,1}(ℝ^d)} : U|_B = u}`; equality on `B` is distributional.
Use this restriction norm in every local occurrence of `ℓ¹W^{1,p}`; it is precisely the infimum
of the extension norms used in OhTataru-TopClass Lemma 3.17, lines 1487–1496. Prove:

- `ℓ¹W^{1,p}(B)` is the Banach quotient of `B¹_{p,1}(ℝ^d)` by the closed subspace of the
  distributions vanishing on `B`, with the restriction norm as its quotient norm; the class of
  `u` does not depend on the chosen extension.
- Up to equivalent norms it does not depend on the admissible dyadic cutoff.
- For `O ∈ G^{2,d/2}(B)`, `O;x ∈ ℓ¹W^{1,d/2}(B)` implies that `O` has a continuous representative
  on `B` (same locator). The proof estimates differences of `O` using any extension of `O;x` and
  then takes the infimum; it does not extend `O;x` by zero.

The interior estimates above rest on the whole-space div–curl estimate, which this section proves
(it is the input of the interior argument of OhTataru-TopClass Lemma 3.13, lines 1428–1433). For
`d ≥ 2`, a 1-form `u ∈ C_c^∞(ℝ^d; V ⊗ (ℝ^d)*)` with values in a finite-dimensional real inner product space `V`,
and PDE §2.3's Riesz transforms `R_j` (multiplier `−iξ_j/|ξ|`, applied componentwise), prove the identity
`∂_i u_j = −R_iR_j(∂^k u_k) − Σ_k R_iR_k(∂_k u_j − ∂_j u_k)` (compare symbols: with `∂_j ↦ 2πiξ_j` and
`R_iR_k ↦ −ξ_iξ_k/|ξ|²`, the right side has symbol `2πiξ_i û_j`), and hence, for `1 < p < ∞`,
`‖∇u‖_{L^p} ≤ C(d, p, dim V)(‖∂^k u_k‖_{L^p} + ‖du‖_{L^p})`, where `(du)_{kj} = ∂_k u_j − ∂_j u_k`. The bound
extends to the closure of `C_c^∞` in the norm `‖∇u‖_{L^p}`, in particular to `Ẇ^{1,d/2}` and to `Ḣ¹`.

**Checks.**

- An abelian constant-curvature Coulomb potential has constant first derivatives and all
  derivatives of order at least two equal to `0`, agreeing with both interior assertions.
- In `d = 4`, on a fixed ball, `A_n = n^{−3/2} sin(nx₁)i dx²` is Coulomb, with
  `‖A_n‖_{W^{1,2}} = O(n^{−1/2}) → 0`, but
  `‖∂²A_n‖_{L^{4/3}(λB)} ≍ n^{1/2} → ∞` for `0 < λ < 1`.
  Its curvature derivative has the same growth, so the extra convergence hypothesis excludes it.
- Constant gauges have `O;x = 0`, restriction norm `0`, and a continuous representative.
  The map `exp(log log(1/|x|) X)` of §2.1 has distinct cluster values at `0`, so its
  Maurer–Cartan derivative cannot have this restriction regularity.
- A nonzero constant on `B` has finite restriction norm: multiply it by a smooth compactly
  supported cutoff equal to `1` near the closure of `B`. Its extension by zero has a jump
  and a surface measure in its weak derivative; it is not in `W^{1,p}`, hence not in
  `B¹_{p,1}` for `p > 1`. Zero extension cannot define this norm.
- At a frequency `|ξ| = 2`, the consistent inhomogeneous partition has low symbol
  `χ(ξ) = 0` and `Δ_0` symbol `χ(ξ/2) − χ(ξ) = 1`, hence total `1`.
  Omitting `Δ_0` gives total `0`; this is the missing-annulus model excluded by the supplier gap.
- Two smooth compactly supported extensions that differ only outside `B` restrict to the
  same element; their difference has quotient norm `0`, while a nonzero constant on `B`
  has positive quotient norm, since the quotient norm controls its `L^p(B)` norm.
- Div–curl identity on a gradient `u = ∇φ`: `du = 0`, and `−R_iR_j Δφ` has symbol
  `(ξ_iξ_j/|ξ|²)(−4π²|ξ|²)φ̂ = −4π²ξ_iξ_jφ̂`, the symbol of `∂_i∂_jφ`. On a divergence-free field the first
  term vanishes and the curl term alone reconstructs `∇u`. With the opposite sign convention
  `R_iR_j ↦ +ξ_iξ_j/|ξ|²` the identity would return `−∂_i u_j`.
- The estimate needs `p > 1`. Let `Γ` be the Newtonian potential (`ΔΓ = δ`), `f_ε ≥ 0` radial of mass `1`
  supported in `B_ε`, `χ` a cut-off equal to `1` on `B₁` and `0` off `B₂`, and `u_ε = ∇(χ · (Γ * f_ε))`.
  Then `du_ε = 0`, and `div u_ε = χf_ε + 2∇χ·∇(Γ * f_ε) + (Γ * f_ε)Δχ` has `L¹` norm bounded independently
  of `ε`, since `Γ * f_ε = Γ` off `B_ε` (Newton's theorem). But `|∇²Γ(x)| = c_d|x|^{−d}` with `c_d > 0`, so
  `‖∇u_ε‖_{L¹} ≥ c_d|S^{d−1}| log(1/(2ε)) → ∞`: no `L¹` version holds.

*Needs:* PDE §2.3 (Riesz transforms and their `L^p` bounds), §1.4, §7.1–7.2; Tau Ceti
`TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`,
`TauCeti.exists_norm_iteratedFDeriv_le_div_pow_of_smul_eq`; gap `inhomogeneous-besov-partition` (PDE); 2.4.

### 4.4 The good gauge on a ball

Prove (OhTataru-TopClass Theorem 1.4, lines 342–353, with Lemma 3.18 and Proposition 3.19,
lines 1497–1561): for `D ∈ A^{1,d/2}_loc(B_R)` with `F ∈ L^{d/2}(B_R)` and `r_c^{ε_*}[D] ≥ r > 0`, there is a
global gauge whose potential satisfies `‖A‖_{Ẇ^{1,d/2}(B_R)} ≲_{ε_*, R/r} 1`; if moreover
`D^{(n)}F ∈ L^p(B_R)` for an integer `n ≥ 0` and `p ∈ (1, ∞)` with `p ≥ d/(n+2)`, then `A ∈ W^{n+1,p}(B_R)`.
The norm `‖·‖_{Ẇ^{1,d/2}(B_R)}` is `‖∂A‖_{L^{d/2}} + ‖A‖_{L^d}` (OhTataru-TopClass line 957–963). Route:
4.1 on balls of radius `≈ r`, with centres chosen so that the balls of half that radius already cover,
which after rescaling to unit balls gives 3.3 the covering margin `ℓ = ½`; patching (3.3) on a ball of
comparable size, exhaustion `R_n ↗ R`, and 4.3.

**Checks.**

- If `‖F‖_{L^{d/2}(B_R)} < ε₀` the statement is 4.1 rescaled, with a bound independent of `R/r`.
- Scaling: the bound depends on `R/r` only, consistent with the dilation invariance of the
  hypotheses.

*Needs:* 3.3, 3.4, 4.1, 4.3.

### Examples

The Neumann Coulomb gauge for `U(1)`; FourManifolds §5.3's `SU(2)` lemma as the case `d = 4`; the removable
pure-gauge singularity of `Φ(x/|x|)`.

### Dependencies

Layers 2–3; PDE §1.4, §1.6, §2.3, §7.1–7.2; the gaps `lp-neumann-ball`, `lp-divcurl-normal-ball` and `inhomogeneous-besov-partition`.

## Layer 5: the good global gauge and the topological class

Throughout this layer `d ≥ 3`. Fix a smooth cut-off `η : ℝ^d → [0, 1]` with `η = 0` on `B₁` and `η = 1` off `B₂`.

### 5.1 Good representatives and gauges at infinity

For a global potential `A ∈ W^{1,d/2}_loc(ℝ^d; 𝔤 ⊗ (ℝ^d)*)` define a good representative as a pair
`(O_(∞), B)` of a smooth map `O_(∞) : ℝ^d ∖ {0} → G` that is homogeneous of degree `0` and a
`B ∈ Ẇ^{1,d/2}(ℝ^d; 𝔤 ⊗ (ℝ^d)*)` such that `A = −η' O_(∞);x + B` for some smooth `η'` vanishing near `0` and
equal to `1` outside a compact set; `O_(∞)` is then a gauge at infinity for `A` (OhTataru-TopClass
lines 382–390 and Theorem 1.3, lines 226–235).

- `|O_(∞);x| ≲ |x|^{−1}` and `|∂(O_(∞);x)| ≲ |x|^{−2}`, so `η' O_(∞);x ∈ W^{1,d/2}_loc`; the vanishing of `η'` near
  `0` is needed for this.
- Changing `η'` changes `B` by a smooth compactly supported form; `O_(∞)h`, for a constant `h ∈ G`, has the
  same `O_(∞);x`; the constant gauge transformation `c` sends `(O_(∞), B)` to `(cO_(∞), Ad(c)B)`.
- `O_(∞)` is determined by its restriction to `S^{d−1}`, an element of `C(S^{d−1}, G)`.

**Checks.**

- `d = 4`, `O(x) = Φ(x/|x|)` and the cut-off `η' ≡ 1`: `A = −O;x` has `|∂A| ≈ |x|^{−2}` and
  `∫_{B₁} |x|^{−4} dx = ∞`, so `A ∉ W^{1,2}_loc(ℝ⁴)`; the source's condition `1 − η ∈ C_c^∞` alone admits this,
  and the vanishing near `0` excludes it.
- `G = {±1}` and `A = 0`: both constants `1` and `−1` are gauges at infinity, so a gauge at infinity is
  not unique up to homotopy when `G` is disconnected.
- The BPST potential of §7.6 has the good representative `(Φ(x̄/|x|), B)` with
  `B = A_BPST + η O;x`; off `B₂`, `B = −Im(x̄ dx)/(|x|²(1 + |x|²))` (through `Φ`) is `O(|x|^{−3})` with
  gradient `O(|x|^{−4})`, so `B ∈ Ḣ¹(ℝ⁴)`.

*Needs:* 1.3, 2.4; PDE §1.4.

### 5.2 The good global gauge theorem

Prove (OhTataru-TopClass Theorem 1.5, lines 361–375, proof lines 1562–1617): there is `ε_* > 0` such that
for every `D ∈ A^{1,d/2}_loc(ℝ^d)` with `F ∈ L^{d/2}(ℝ^d)`, `r_c^{ε_*}[D] ≥ r` and `R_c^{ε_*}[D] ≤ R`,
`0 < r ≤ R`, there is a centre `x₀` and a global gauge such that in the translated
coordinate `y = x − x₀` its potential is `A(y) = −η(y/(2R)) O_(∞);y + B(y)`, with `O_(∞)` smooth, homogeneous of
degree `0` with values in `G`, `B ∈ Ẇ^{1,d/2}(ℝ^d)`, `‖B‖_{Ẇ^{1,d/2}} ≲_{ε_*, R/r} 1` and
`‖O_(∞)‖_{C^n(S^{d−1})} ≲_{ε_*, R/r, n} 1` for every `n`; if moreover `D^{(n)}F ∈ L^p(ℝ^d)` for an integer
`n ≥ 0` and `p ∈ (1, ∞)` with `p ≥ d/(n+2)`, then the weak derivatives of order `n + 1` of `B` lie in
`L^p(ℝ^d)`. For `d = 4`: every connection with
finite energy is gauge equivalent to `−η O_(∞);x + b` with `b ∈ Ḣ¹(ℝ⁴)` (OhTataru-Threshold Theorem 2.17,
lines 1069–1075). Route: choose `x₀` with exterior curvature at radius `2R` at most `ε_*` (the infimum
defining `R_c` need not be attained), translate to `x₀ = 0`, and use 3.3 for a global potential and
4.4 on `B_{10R}`, the inversion `x ↦ x/|x|²`, which
preserves `‖F‖_{L^{d/2}}`, with 4.2 on the punctured ball for the exterior, a gauge on the annulus
smoothed by 2.2 and extended homogeneously, and Hardy's inequality for `Ad(P)B ∈ L^d ∩ Ẇ^{1,d/2}` when
`P` is homogeneous of degree `0`. The source's higher-regularity hypothesis reads `L^p(B_R)`; the
statement above assumes it on `ℝ^d`.

**Checks.**

- A flat connection on `ℝ^d` (`F = 0`): on each ball §4.1 gives a Coulomb potential with
  norm at most `C₀·0 = 0`. Transitions between these zero potentials have zero derivative
  and are constants on connected overlaps. A locally constant cocycle on the simply connected
  space `ℝ^d` is trivial, so these gauges patch as in §3.3 to the potential `0`.
  This representative has `(O_(∞), B) = (1, 0)`, `r_c = ∞` and `R_c = 0`; the numerical bound
  in §5.2 alone does not force a chosen remainder to vanish.
- `A ∈ Ẇ^{1,d/2}` itself: the representative `(1, A)` already has the form, with no bound uniform in
  `R/r` claimed for it.
- A translated BPST instanton centred at `b` has the same concentration radii as one at `0`;
  choose `x₀ = b`. The coordinate `y = x − b` gives exactly the same remainder norm. Fixing
  the cut-off centre at `0` while claiming constants independent of `b` would lose this witness.
- Dilation by `λ` replaces `(r, R)` by `(r/λ, R/λ)` and leaves `R/r` and the bounds unchanged.

*Needs:* gap `hardy-inequality` (PDE); 2.2, 2.5, 3.3, 3.4, 4.2, 4.4, 5.1.

### 5.3 Gauges at infinity are unique up to homotopy and constants

Prove (OhTataru-TopClass Proposition 1.6 and Remark 1.7, lines 397–405, proof lines 1666–1686): let
`A, A'` be global potentials of the same connection, `A' = P·A` with `P ∈ G^{2,d/2}_loc(ℝ^d)`, with good
representatives `(O_(∞), B)` and `(O'_(∞), B')`. Then `O'_(∞)|_{S^{d−1}}` is homotopic to
`c · O_(∞)|_{S^{d−1}} · c'` for some constants `c, c' ∈ G`; for connected `G`, `O'_(∞)` and `O_(∞)` are
homotopic. Conversely, for every smooth homogeneous `O'_(∞)` whose restriction is homotopic to that of
`O_(∞)`, there is a gauge-equivalent global potential `A' = P·A` having `O'_(∞)` as a gauge
at infinity. The converse permits changing the global potential of the same connection; it does
not keep a fixed matrix-valued potential unchanged. The class does not depend on the cut-off. Route: outside a ball `B_ρ`
off which both cut-offs equal `1`, `A' = P·A` and the Leibniz rules of 2.4 give
`(O'_(∞)⁻¹ P O_(∞));x = Ad(O'_(∞)⁻¹P)B − Ad(O'_(∞)⁻¹)B'`, which puts `O'_(∞)⁻¹PO_(∞)` in
`W^{1,d}_loc(ℝ^d ∖ B̄_ρ; G)` with globally `L^d` first derivative; 2.5 shows that `P` and `O'_(∞)⁻¹PO_(∞)` restrict on spheres to classes of constant
maps `c` and `c''`, so `O'_(∞) = P O_(∞) (O'_(∞)⁻¹PO_(∞))⁻¹` is homotopic to `c O_(∞) c''⁻¹`. The source
writes the identity for `A = O·A'` (OhTataru-TopClass line 1671–1673), that is for `O = P⁻¹`. The
source's conclusion "`O_(∞)` homotopic to `O'_(∞)`" holds for connected `G`; the constants are needed
otherwise (5.1, Checks).

**Checks.**

- `G = U(1)`, `O_(∞) = e^{iθ}`, `O'_(∞) = e^{iθ'}` and `P = e^{iψ}` with real `θ, θ', ψ`, and `B = B' = 0`
  on `ℝ^d ∖ B_ρ`: there `A' = P·A = A − i dψ` gives `dθ' = dθ + dψ`, and
  `(O'_(∞)⁻¹PO_(∞));x = i(−dθ' + dψ + dθ) = 0`, matching the right side `0`; the identity with the roles
  of `O_(∞)` and `O'_(∞)` exchanged would give `i(−dθ + dψ + dθ') = 2i dψ` against a right side `0`,
  false unless `ψ` is locally constant there.
- For `A = 0` and `G = U(1)`, the angular map `O'_(∞) = exp(i x₁/|x|)` is null-homotopic,
  but `η O'_(∞);x` has nonzero `L^d` angular mass at every large radius and
  integral `C∫₂^∞dr/r = ∞`. Thus it cannot be a gauge at infinity of the fixed potential `0`.
  Extend its angular phase smoothly across the cut-off ball; the resulting global pure gauge
  has that gauge at infinity and is gauge equivalent to `0`, as the converse asserts.

*Needs:* gap `hardy-inequality` (PDE); 2.2, 2.4, 2.5, 5.1.

### 5.4 The topological class

Define `Top(d, G)` as the quotient of the free homotopy classes `[S^{d−1}, G]` by the action of `G × G`
through `(c, c')·[O] = [cOc'⁻¹]`, and the topological class `[A] ∈ Top(d, G)` of a connection with
`L^{d/2}` curvature as the image of the restriction to `S^{d−1}` of a gauge at infinity of a global
potential (OhTataru-TopClass Definition 1.8, lines 407–411). Prove (lines 412–429, proof of
Proposition 1.9, lines 1688–1705):

- `[A]` is well defined (5.2, 5.3) and invariant under `G^{2,d/2}_loc(ℝ^d)` gauge transformations;
- `[A + b] = [A]` for `b ∈ Ẇ^{1,d/2}(ℝ^d)` when the chosen potential `A` admits
  a good representative, and every class contains smooth connections with compactly
  supported curvature approximating a given good representative in the difference norm
  `Ẇ^{1,d/2}`;
- each class is path-connected for the distance `‖A − A'‖_{Ẇ^{1,d/2}}` modulo `G^{2,d/2}_loc(ℝ^d)` gauge
  transformations;
- locality: there is `ε_* > 0` such that `‖A − A'‖_{L^d(B_{5R})} ≤ ε_*`, `‖F[A]‖_{L^{d/2}(ℝ^d ∖ B_R)} ≤ ε_*` and
  `‖F[A']‖_{L^{d/2}(ℝ^d ∖ B_R)} ≤ ε_*` imply `[A] = [A']`.

For connected `G` the quotient map `[S^{d−1}, G] → Top(d, G)` is a bijection.

**Checks.**

- The perturbation statement requires a good representative. In `d = 4`, the flat potential
  `A = −2x₁ i dx¹` in `SU(2)` has `F = 0`, and `b = j dx²/(1 + |x|²)` lies in `Ḣ¹`.
  But `F₁₂[A+b] = −2x₁j/(1+|x|²)² − 4x₁k/(1+|x|²)` is not in `L²`: its `k` component
  has squared radial integral comparable to `∫₁^∞ r dr = ∞`. An arbitrary rough global
  gauge therefore cannot be used for adding an untransformed `b`.
- `G = {±1}`: `Top(d, G)` is a point, as it must be since every connection is `0`; without the quotient
  the two constant gauges at infinity of `A = 0` would give two classes.
- `G = O(4)` acting on `ℝ⁴ = ℍ` and `d = 4`: conjugation by the reflection `q ↦ q̄` sends left
  multiplication `q ↦ uq` to right multiplication `q ↦ qū`, exchanging the two summands of
  `π₃(SO(4)) ≅ ℤ ⊕ ℤ`; so a constant gauge transformation in the non-identity component changes the
  homotopy class of `O_(∞)`, and the quotient by `G × G` is what makes `[A]` gauge invariant.
- `G = U(1)`, `d ≥ 3`: `[S^{d−1}, U(1)]` is a point (`S^{d−1}` is simply connected), so every abelian
  connection with `L^{d/2}` curvature is in the trivial class.

*Needs:* 2.5, 3.2, 5.2, 5.3; PDE §1.4.

### 5.5 The trivial class

Prove (OhTataru-TopClass Corollary 1.11 and Remark 1.12, lines 451–466; OhTataru-Threshold Theorem 2.16,
lines 1066–1067): a connection with `L^{d/2}` curvature lies in the class of `0` (the class of constant
maps) exactly when it is gauge equivalent, by some `P ∈ G^{2,d/2}_loc(ℝ^d)`, to a potential in
`Ẇ^{1,d/2}(ℝ^d)`; for `d = 4`, exactly when it is gauge equivalent to a potential in `Ḣ¹(ℝ⁴)`. No bound on
the `Ẇ^{1,d/2}` norm of that potential in terms of the curvature is asserted.

**Checks.**

- `0 ∈ Ẇ^{1,d/2}` is in the trivial class; the pure gauge `−O;x` of `O = Φ(x/|x|)` cut off near `0`,
  `−ηO;x`, is not (its class is that of `Φ`, of degree `1`), and indeed it is gauge equivalent to no `Ḣ¹`
  potential, since the characteristic number `χ` vanishes on `Ḣ¹` connections (§6.3) while `χ(−ηO;x) = −8π²`
  (§6.4).
- For connected `G` and `d = 4`, the trivial class is `0 ∈ π₃(G)` under 5.6.

*Needs:* 2.5, 5.2, 5.3, 5.4.

### 5.6 Topological classes in dimension four

Prove: for connected `G`, the map from the based homotopy classes of pointed maps `(S³, e₁) → (G, 1)` to
`[S³, G]` forgetting the base point is a bijection (a free map `O` is homotopic to the based map
`O(e₁)⁻¹O`, and a free homotopy `H` between based maps yields the based homotopy `H(t, e₁)⁻¹H(t, ·)`), so
`Top(4, G) ≅ π₃(G)`, with Mathlib's cubical `HomotopyGroup` compared to pointed sphere maps through
AlgebraicTopology §8.3 (OhTataru-Threshold line 1074).

**Checks.**

- `G = SU(2)`: `Top(4, SU(2)) ≅ π₃(S³) ≅ ℤ`, computed by the instanton number in §6.4.
- `G = U(1)`: `π₃(U(1)) = 0`, matching the single class of 5.4.

*Needs:* Mathlib `HomotopyGroup`, `ContinuousMap.Homotopic`; AlgebraicTopology §8.3; 5.4.

### Examples

The two gauges at infinity of `A = 0` for `G = {±1}`; the `O(4)` reflection exchanging the summands of
`π₃(SO(4))`; the good representative of the BPST potential.

### Dependencies

Layers 1 (1.3), 2–4; AlgebraicTopology §8.3; PDE §1.4; the gap `hardy-inequality`.

## Layer 6: characteristic numbers and the instanton number

### 6.1 Characteristic numbers

For `d = 2k ≥ 4`, an `Ad(G)`-invariant symmetric `k`-linear form `f` on `𝔤` and a connection with
`F ∈ L^{d/2}(ℝ^d)`, define `χ_f(A) = ∫_{ℝ^d} f(F ∧ … ∧ F)` (OhTataru-TopClass (1.4), lines 238–255 and
430–445).

- The integral converges absolutely, `|χ_f(A)| ≤ C_f ‖F‖_{L^{d/2}}^k`, and `χ_f` is gauge invariant and
  dilation invariant.
- `|χ_f(A) − χ_f(A')| ≤ C_f (‖F[A]‖_{L^{d/2}} + ‖F[A']‖_{L^{d/2}})^{k−1} ‖F[A] − F[A']‖_{L^{d/2}}`, and for a good
  representative `(O_(∞), B)` of `A` written with its cut-off as `A = −η' O_(∞);x + B` (5.1) and every
  `b ∈ Ẇ^{1,d/2}`,
  `‖F[A + b] − F[A]‖_{L^{d/2}} ≲ ‖b‖_{Ẇ^{1,d/2}}(1 + ‖B‖_{Ẇ^{1,d/2}} + ‖η'‖_{L^∞}‖O_(∞)‖_{C¹(S^{d−1})} + ‖b‖_{Ẇ^{1,d/2}})`,
  from `F[A + b] − F[A] = db + [A ∧ b] + ½[b ∧ b]`, Hölder for `[B ∧ b]` and `[b ∧ b]`, and Hardy's inequality
  `‖b/|x|‖_{L^{d/2}} ≤ ‖∇b‖_{L^{d/2}}` (`p = d/2`, `p/(d − p) = 1`) for the term `η'[O_(∞);x ∧ b]`, with
  `|O_(∞);x| ≤ C ‖O_(∞)‖_{C¹(S^{d−1})}|x|^{−1}`. For a cut-off with values in `[0, 1]`, such as the `η` of this
  layer, the factor `‖η'‖_{L^∞}` is `1`.
- For `d = 4` and `f = −⟨·,·⟩`, `χ_f = χ` of the Conventions.

**Checks.**

- `G = U(1)`, `d = 4`, `f(X, Y) = −XY` on `iℝ`: `χ_f(A) = ∫ dα ∧ dα` for `A = iα`, which vanishes for every
  finite-energy `α` (all abelian connections are in the trivial class, 5.4).
- `G = SU(2)`, `f(X, Y) = tr(XY)`: `χ_f = χ = 8π² c₂` (6.4).
- Dilation: `f(F[A_λ] ∧ F[A_λ])(x) = λ⁴ f(F ∧ F)(λx)` in `d = 4`, so `χ_f(A_λ) = χ_f(A)`.
- The cut-off size enters the perturbation bound. Take `G = SU(2)`, `O_(∞)(x) = exp(i x₁/|x|)`, `B = 0`, a cut-off
  `η'_M` equal to `M` on a ball `B_ρ(3e₂)` (and, as 5.1 requires, `0` near `0` and `1` outside a compact set),
  and `b = jβ dx²` with `β` smooth, nonzero and supported in `B_ρ(3e₂)`. Then `O_(∞);x = i d(x₁/|x|)` and the
  `k`-component of `(F[A + b] − F[A])₁₂` is `−2Mβ ∂₁(x₁/|x|)`; at `3e₂`, `∂₁(x₁/|x|) = 1/|x| − x₁²/|x|³ = 1/3`,
  so for small `ρ` its `L^{d/2}` norm is at least a positive multiple of `M`, while `b`, `B` and `O_(∞)` do not
  depend on `M`. The bound without the factor `‖η'‖_{L^∞}` would fail as `M → ∞`; with it, both sides grow
  linearly in `M`.

*Needs:* gap `hardy-inequality` (PDE); 1.4, 3.2, 5.1.

### 6.2 Characteristic numbers depend only on the class

Prove (OhTataru-TopClass Corollary 1.10, lines 445–448, and lines 460–462): for `d = 2k ≥ 4` and every
connection with `L^{d/2}` curvature and gauge at infinity `O_(∞)`,
`χ_f(A) = ∫_{S^{d−1}} O_(∞)*ω_f` with the Cartan form `ω_f` of 1.4; hence `χ_f(A)` depends only on `[A]`,
vanishes on the trivial class, and is the limit of `χ_f` of smooth approximants with compactly supported
curvature in the same class. Route: for smooth `A = −η'O_(∞);x + B` with `B` compactly supported,
`f(F ∧ … ∧ F) = d T_f(A)`, Stokes' theorem on `B_ρ` for large `ρ` where `A = −O_(∞);x`, and
`T_f(−O_(∞);x) = O_(∞)*ω_f`; the integral of a closed form is a homotopy invariant (homotopy operator), and `ω_f` is
invariant under left and right translations, so it is constant on `Top(d, G)`; the general case by 5.4
and the continuity of 6.1.

**Checks.**

- `G = SU(2)`, `f = tr`, `A = −ηO;x` with `O = Φ(x/|x|)`: `χ_f(A) = ∫_{S³} Φ*ω_f = −8π²` (1.4, Checks).
- Trivial class: `O_(∞)` constant, `O_(∞)*ω_f = 0`.
- Odd `d` has no characteristic numbers: `f(F ∧ … ∧ F)` is a `2k`-form and `2k ≠ d`.

*Needs:* DifferentialGeometry 5.3 and 5.4; 1.4, 5.4, 6.1.

### 6.3 The Bogomol'nyi bound

Prove, for `d = 4` and every connection with finite energy (OhTataru-TopClass line 860–868 and Lemma
1.31, lines 901–906; OhTataru-Threshold line 237–246; Bogomolnyi-Stability):
`ℰ_e(a) − χ(a) = 2 ∫ |F⁺|²` and `ℰ_e(a) + χ(a) = 2 ∫ |F⁻|²`, hence `ℰ_e(a) ≥ |χ(a)|`, with equality exactly
when `F⁺ = 0` almost everywhere or `F⁻ = 0` almost everywhere; and `χ(a) = 0` for `a ∈ Ḣ¹(ℝ⁴)`
(OhTataru-YMHF Lemma 6.7, lines 2860–2883).

**Checks.**

- For `SU(2)`: `ℰ_e = 8π² c₂ + 2‖F⁺‖²`, FourManifolds Layer 5's normalisation
  `E(A) = 8π²k + 2‖F_A⁺‖²` with `k = c₂`.
- Put `I₊ = ∫|F⁺|²` and `I₋ = ∫|F⁻|²`. If both are positive, then
  `ℰ_e − |χ| = I₊ + I₋ − |I₋ − I₊| = 2 min(I₊, I₋) > 0`.
  Thus pointwise equality does not imply integrated equality when both dualities carry
  nonzero energy. For `I₊ = I₋ = 1` the difference is `2`; for `F = 0` it is `0`.
- The BPST connection (anti-self-dual) has `ℰ_e = χ = 8π²`.

*Needs:* 1.5, 6.1, 6.2, 5.5.

### 6.4 The instanton number for `SU(2)`

For `G = SU(2)` with `⟨X, Y⟩ = −tr(XY)` define `c₂(a) = (8π²)⁻¹ ∫_{ℝ⁴} tr(F ∧ F)`, so `χ(a) = 8π² c₂(a)`.
Prove (OhTataru-TopClass line 256–264 and 852–860; OhTataru-YMHF line 327–335 and 2913–2915):

- `c₂(a) = −deg(Φ⁻¹ ∘ O_(∞)|_{S³})` for every gauge at infinity, with `S³` boundary-oriented; in particular
  `c₂(a) ∈ ℤ`;
- `[a] ↦ c₂(a)` is a bijection `Top(4, SU(2)) → ℤ`, so `π₃(SU(2)) ≅ ℤ`; the class of `−n` is that of
  `x ↦ Φ(x/|x|)ⁿ` (quaternionic power), which has degree `n`.

Route: 6.2 with `∫_{S³} O*ω_f = deg(Φ⁻¹ ∘ O) ∫_{S³} Φ*ω_f = −8π² deg`, the integral formula of
DifferentialGeometry 10.3–10.4 applied to the smooth map `Φ⁻¹ ∘ O : S³ → S³` and the top form `Φ*ω_f`;
injectivity by the Hopf degree theorem for `S³`: the Hurewicz isomorphism `π₃(S³) ≅ H₃(S³; ℤ)`
(AlgebraicTopology §8.3, with Tau Ceti's `HomotopyGroup.bijective_hurewicz`) sends the class of a based map `h` to `h_*[S³]`, which equals
`deg h · [S³]` by AlgebraicTopology §6.5, so based maps of equal degree are homotopic, and
5.6 passes to free classes. The source states `c₂ = deg O_(∞)` "with the appropriate choices of
orientations" (OhTataru-TopClass line 2369); the sign here is fixed by the orientations of the
Conventions.

`Suggested.lean` states the integrality and the surjectivity on global potentials, which by 3.3
(OhTataru-TopClass Proposition 3.10, lines 1328–1347) every finite-energy connection on `ℝ⁴` has, so
its statements have the generality of this section:

- `curvature A DA x j k` is `F_jk(x) = ∂_jA_k − ∂_kA_j + [A_j, A_k]` (Conventions) for a potential `A`
  on `ℝ^d` with values in `N × N` complex matrices and a weak derivative `DA`, where `∂_jA_k` is the
  `k`-th component of `DA x` applied to the `j`-th coordinate vector.
- `IsFiniteEnergySU2Potential A DA` says that the four coefficients of `A` are skew-Hermitian and
  trace free almost everywhere, that is, lie in `𝔰𝔲(2)` (Tau Ceti's
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff`), that `DA` is a
  weak derivative of `A` on `ℝ⁴` (`TauCeti.HasWeakFDerivOn`) with every entry of `A` and of each
  directional derivative `DA x v` square integrable on every compact set, so that `A` lies in
  `W^{1,2}_loc(ℝ⁴; 𝔰𝔲(2) ⊗ (ℝ⁴)*)`, and that every entry of every curvature coefficient lies in
  `L²`.
- `instantonNumber A DA` is `c₂(a)`: `(8π²)⁻¹` times the integral of
  `2(tr(F₁₂F₃₄) − tr(F₁₃F₂₄) + tr(F₁₄F₂₃))`, the coefficient of `dx¹ ∧ dx² ∧ dx³ ∧ dx⁴` in
  `tr(F ∧ F)`, which is real for `𝔰𝔲(2)`-valued curvature.
- `exists_int_instantonNumber_eq`: the instanton number of every such potential is an integer.
- `exists_potential_instantonNumber_eq`: every integer `n` is the instanton number of such a
  potential, for instance the cut-off pure gauge `−η O;x` of `O(x) = Φ(x/|x|)⁻ⁿ`. Together with the
  integrality this fixes the normalisation `(8π²)⁻¹`.

**Checks.**

- Anti-self-dual curvature has `F₃₄ = −F₁₂`, `F₂₄ = F₁₃`, `F₂₃ = −F₁₄`, so the integrand of `c₂` is
  `−2(tr F₁₂² + tr F₁₃² + tr F₁₄²) = |F|²` and `c₂ = ℰ_e/(8π²) ≥ 0`. For the BPST connection this is
  `8π²/(8π²) = 1`; an integrand without the factor `2` would give `½`, which the integrality excludes,
  and a factor `(4π²)⁻¹` would give only even values, which the surjectivity excludes.
- `O = Φ(x/|x|)`, degree `1`: `c₂ = −1` (`χ = −8π²`, 1.4).
- The BPST connection: `O_(∞)(x) = Φ(x̄/|x|)`, which restricted to `S³` is `Φ` composed with
  `(x₁, x₂, x₃, x₄) ↦ (x₁, −x₂, −x₃, −x₄)` of degree `(−1)³ = −1`, so `c₂ = 1`, matching `χ = 8π²` for the
  anti-self-dual curvature (6.3).
- The trivial connection has `c₂ = 0`; with the opposite orientation of `S³` all signs flip, which is
  why the orientation is part of the statement.

*Needs:* AlgebraicTopology §6.5 and §8.3; Tau Ceti `HomotopyGroup.bijective_hurewicz`,
`TauCeti.HasWeakFDerivOn` and
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff`;
DifferentialGeometry Layer 10 (10.3–10.5); 1.4, 3.3, 5.6, 6.2.

### Examples

`χ = −8π²` for the pure gauge of `Φ`; `χ = 0` on `Ḣ¹` connections; the BPST charge `c₂ = 1`.

### Dependencies

Layers 1, 3 (3.2), 5; DifferentialGeometry Layer 5 and Layer 10 (10.3–10.5); AlgebraicTopology §6.5
and §8.3; the gap `hardy-inequality`.

## Layer 7: harmonic Yang–Mills connections and the ground state

Throughout this layer `d = 4`.

### 7.1 Harmonic Yang–Mills connections

Define a harmonic Yang–Mills connection on an open `X ⊆ ℝ⁴` as `A ∈ W^{1,2}_loc(X; 𝔤 ⊗ (ℝ⁴)*)` with
`∫_X Σ_{j,ℓ} ⟨F_ℓj, D_ℓ φ_j⟩ dx = 0` for every smooth compactly supported `𝔤`-valued 1-form `φ`, the weak
form of `D^ℓ F_ℓj = 0`; for a rough bundle, through the local potentials. It is nontrivial if `F ≢ 0`
(OhTataru-YMHF (1.1)–(1.2), lines 124–128; OhTataru-TopClass line 829–834; OhTataru-Threshold
lines 253–266).

- The weak equation is the vanishing of the first variation of `∫_K |F|²` under compactly supported
  variations; it is invariant under `G^{2,2}_loc` gauge transformations, translations, dilations
  `A ↦ A_λ` and the conformal inversion `x ↦ x/|x|²` of `ℝ⁴ ∖ {0}`, which preserves `ℰ_e` on corresponding
  sets.
- Self-dual and anti-self-dual connections are harmonic, by the Bianchi identity.
- For commutative `G` a finite-energy harmonic connection on `ℝ⁴` has `F = 0` (no nonzero `L²` harmonic
  2-forms).

**Checks.**

- A flat connection is harmonic and trivial.
- `G = U(1)`, `A = (i/2)(x₁ dx₂ − x₂ dx₁)`: `F = i dx¹ ∧ dx²` is constant, harmonic, of infinite energy; with
  `F = iψ(x) dx¹ ∧ dx²` for nonconstant `ψ = ψ(x₁)`, `∂^ℓF_ℓ2 = iψ'(x₁) ≠ 0`, not harmonic.
- The BPST connection (§7.6) is anti-self-dual, hence harmonic, with `ℰ_e = 8π²`.

*Needs:* 1.3, 1.5, 3.1.

### 7.2 Regularity

Prove (OhTataru-YMHF Theorem 2.1, lines 275–276; OhTataru-Threshold Theorem 1.5, lines 269–274):
every harmonic Yang–Mills connection on a ball or on `ℝ⁴` is smooth after a gauge transformation
`O ∈ G^{2,2}_loc`, and on a general open set locally so. Prove further the quantitative ε-regularity,
obtained from 4.1 and 4.3 by the route below:
there is `ε > 0` such that every harmonic Yang–Mills connection on `B₁` with `‖F‖_{L²(B₁)} ≤ ε` satisfies
`‖D^{(n)}F‖_{L^∞(B_{1/2})} ≲_n ‖F‖_{L²(B₁)}` for every `n ≥ 0`; the left side is gauge invariant, since
`D^{(n)}F` transforms by `Ad(O)`. Route: the Coulomb gauge of 4.1 (on `B₁` itself when `ε < ε₀`, on
small balls in general) turns the equation into the elliptic system `ΔA_k = −[A_j, D_kA_j] + …` (OhTataru-YMHF (1.4), line 134) with
critical quadratic terms; smallness of `‖A‖_{W^{1,2}} ≤ C₀‖F‖_{L²}` bootstraps through `W^{2,p}`, `p > 2`,
and 4.3, and in this small regime every estimate is bounded by a constant multiple of
`‖A‖_{W^{1,2}(B₁)}`, which gives the quantitative bound; patching by 3.3.

*Needs:* 3.3, 4.1, 4.3; PDE §2.3, §1.4.

### 7.3 Removable singularities and decay at infinity

Prove (OhTataru-YMHF line 315–320; Uhlenbeck-RemovableSingularities Theorem 4.1; OhTataru-TopClass
Theorem 3.12): a harmonic Yang–Mills connection on `B'₁` with `∫_{B'₁} |F|² < ∞` extends, after a gauge
transformation on `B'_{1/2}`, to a smooth harmonic Yang–Mills connection on `B_{1/2}`; and a finite-energy
harmonic Yang–Mills connection on `ℝ⁴` satisfies `|D^{(n)}F(x)| ≤ C_n(a)(1 + |x|)^{−4−n}` for every `n`, with
constants depending on the connection. Route: 4.2 on a small punctured ball, removability of a point
for the weak equation (a point has zero `W^{1,2}` capacity in `ℝ⁴`), 7.2; for decay, the inversion of 7.1.

**Checks.**

- The BPST connection: `|F| = √48 (1 + |x|²)^{−2}`, so `|F(x)| ≈ √48 |x|^{−4}`, the rate asserted.
- The pure gauge of `Φ(x/|x|)` on `B'₁` is flat; the statement produces the gauge `O⁻¹` removing the
  singularity of the potential.

*Needs:* 4.2, 7.1, 7.2.

### 7.4 The Weitzenböck formula and the improved Kato inequality

Prove, for a smooth harmonic Yang–Mills connection `A` on an open `X ⊆ ℝ⁴`
(GurskyKelleherStreets-GapTheorem Lemma 2.1, lines 139–153, Proposition 2.8, lines 242–286, and (3.1)–(3.4),
lines 293–308, specialised to the flat metric):

- `d_A F⁺ = 0` and `d_A^* F⁺ = 0`, and `½ Δ|F⁺|² = |∇_A F⁺|² − ⟨F⁺, 𝔉_{F⁺}(F⁺)⟩`;
- the improved Kato inequality `|∇_A ω|² ≥ (3/2) |∇|ω||²` wherever `ω ≠ 0`, for every `𝔤`-valued 2-form `ω`
  with `d_A ω = 0 = d_A^* ω`;
- consequently `Δ|F⁺|^{1/2} ≥ −(√6/3) γ₀ |F⁺| |F⁺|^{1/2}` in the sense of distributions on `X`, and the same for
  `F⁻` after reversing the orientation.

The operator `𝔉` has the sign of §1.6, so its contribution is subtracted
(GurskyKelleherStreets-GapTheorem line 142). The constant `√6/3` is half the constant
`2√6/3` of 1.6.

**Checks.**

- For `G` commutative the cubic term vanishes and `|F⁺|^{1/2}` is subharmonic.
- For the self-dual BPST connection (the orientation-reversed instanton of §7.6) the inequality of
  1.6 is an equality at every point, so the cubic term in the displayed Weitzenböck formula is `−(2√6/3)√2 |F⁺|³`.
  Indeed `u = 48^{1/4}/(1 + |x|²)` has `Δu = −8·48^{1/4}/(1 + |x|²)³`, exactly the right side
  `−(√6/3)√2 |F⁺|u`; this fixes the sign. At the centre, `∇_A F⁺ = 0`, `|F⁺|² = 48`,
  `½Δ|F⁺|² = −768` and `⟨F⁺,𝔉_{F⁺}(F⁺)⟩ = 768`; a plus sign before this pairing fails.

*Needs:* 1.5, 1.6, 7.2.

### 7.5 The energy gap

Prove (GurskyKelleherStreets-GapTheorem Theorem 1.1 and Corollary 1.2(1), lines 36–41 and 88–100;
OhTataru-TopClass Theorem 1.30, Claim 6.3 and footnote 6, lines 877–878, 894–896 and 2373–2407;
OhTataru-YMHF Theorem 2.5, lines 348–352): for noncommutative `G` and every finite-energy harmonic
Yang–Mills connection on `ℝ⁴`, if `F⁺ ≢ 0` then `∫ |F⁺|² ≥ 16π²/γ₀²`, and likewise for `F⁻`; hence if `F` is
neither self-dual nor anti-self-dual, `ℰ_e ≥ |χ| + 32π²/γ₀²`, and every nontrivial one has
`ℰ_e ≥ 16π²/γ₀²`. Route: 7.4 with `u = |F⁺|^{1/2}` gives `∫ |∇u|² ≤ (√6/3)γ₀ ∫ |F⁺|²` after integration
against `u` (justified by 7.3); the sharp Sobolev inequality `6 ∫ |∇u|² ≥ 8√6 π (∫ u⁴)^{1/2}` and
`(∫ u⁴)^{1/2} = ‖F⁺‖_{L²}` give `‖F⁺‖_{L²} ≥ 4π/γ₀`; then 6.3. The constants are those of the source after
conversion: GurskyKelleherStreets use `⟨A, B⟩ = −½ tr(AB)` and the all-index norm of 2-forms, so their
`∫|F|²` is `2ℰ_e` here for `SU(2)`, and their `16π²|κ| + 32π²` becomes `8π²|c₂| + 16π²`.

**Checks.**

- `SU(2)` with `−tr`, `γ₀ = √2`: non-instantons have `ℰ_e ≥ 8π²|c₂| + 16π²`, OhTataru-YMHF Theorem 2.5; the
  self-dual BPST connection has `∫|F⁺|² = 8π² = 16π²/γ₀²`, so the first bound is sharp.
- `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` with `−tr` on each factor: an instanton of charge `−1` in one factor and of charge `1` in
  the other is neither self-dual nor anti-self-dual, with `ℰ_e = 16π²`, `χ = 0`, and
  `16π² = |χ| + 32π²/γ₀²`: equality.
- Commutative `G`: `γ₀ = 0` and the statement is replaced by 7.1's vanishing of `F`.

*Needs:* Yamabe Y2 item 1; 6.3, 7.3, 7.4.

### 7.6 The BPST connection on `ℝ⁴`

For `G = SU(2)` with `−tr` define `A_BPST = Φ(Im(x̄ dx))/(1 + |x|²)`, writing `x = x₁ + x₂i + x₃j + x₄k` as a
quaternion and `Φ` for the identification of the Conventions (OhTataru-TopClass Theorem 1.29,
lines 871–872; GurskyKelleherStreets-GapTheorem Remark 2.7, lines 223–232; FreedUhlenbeck-Instantons Ch. 3;
DonaldsonKronheimer Ch. 3).

- `F[A_BPST] = Φ(dx̄ ∧ dx)/(1 + |x|²)²`, which is anti-self-dual; `A_BPST` is a smooth harmonic Yang–Mills
  connection with `ℰ_e = 8π²`, `χ = 8π²`, `c₂ = 1`, and gauge at infinity `O_(∞)(x) = Φ(x̄/|x|)`.
- Translations and dilations `λA_BPST(λ(x − b))` preserve all these values; composing with the
  orientation-reversing map `x ↦ x̄` gives a self-dual connection with `c₂ = −1`.
- For a Lie algebra homomorphism `φ : 𝔰𝔲(2) → 𝔤` with `⟨φX, φY⟩ = −c tr(XY)`, `φ ∘ A_BPST` is a harmonic
  `G`-connection with `ℰ_e = 8π²c`.

**Checks.**

- At `x = 0`, `A_BPST = 0` and `F = Φ(dx̄ ∧ dx)`, whose `Φ(i)`-component is `2(dx¹ ∧ dx² − dx³ ∧ dx⁴)`:
  anti-self-dual.
- `|F|² = 48/(1 + |x|²)⁴` (six components of norm `2√2/(1 + |x|²)²`), and
  `ℰ_e = 96π² ∫₀^∞ r³(1 + r²)^{−4} dr = 96π² · (1/12) = 8π²`.
- At infinity `A_BPST − Φ(Im(x̄ dx))/|x|² = O(|x|^{−3})`, and `Φ(Im(x̄ dx))/|x|² = −O;x` for `O = Φ(x̄/|x|)`, of
  degree `−1`; so `c₂ = 1` by 6.4, agreeing with `χ = ℰ_e` for anti-self-dual curvature.

*Needs:* 1.1, 1.5, 6.3, 6.4, 7.1.

### 7.7 The ground state energy

Define the extended nonnegative real number
`E_GS(G) = inf {ℰ_e(a) : a a nontrivial finite-energy harmonic Yang–Mills connection on ℝ⁴}`, with
value `+∞` for an empty set. Prove (OhTataru-TopClass Theorem 1.32, lines 910–918, proof lines 2268–2451;
OhTataru-YMHF Theorem 6.10, lines 2905–2918; OhTataru-Threshold Theorem 1.6, lines 277–283): for
noncommutative `G`,

- `E_GS = 16π²/γ₀²`, attained by `φ ∘ A_BPST` for an embedding `φ` of `𝔰𝔲(2)` onto a subalgebra `𝔰` with
  `γ₀(𝔰) = γ₀(𝔤)`;
- every nontrivial finite-energy harmonic Yang–Mills connection `a` has `ℰ_e(a) ≥ 2E_GS` or
  `|χ(a)| = ℰ_e(a) ≥ E_GS`;
- for `G = SU(2)` with `−tr`, `E_GS = 8π²`, attained by `A_BPST`.

Route: the lower bound is 7.5; for the upper bound, `𝔰` carries an `Ad`-invariant inner product
proportional to `−tr`, `⟨φX, φY⟩ = −c tr(XY)`, and `γ₀(𝔰) = √2/√c`, so `ℰ_e(φ ∘ A_BPST) = 8π²c = 16π²/γ₀²`; the
second item from 7.5, since a non-instanton has `ℰ_e ≥ |χ| + 32π²/γ₀² ≥ 2E_GS`. The source's route
through Bott's theorem on `π₃` of simple groups (OhTataru-TopClass Theorem 6.1, line 2340) and the
splitting into simple ideals is replaced by this one, which needs no `π₃` computation; the value
`16π²/γ₀²` agrees with the source's `16π²/⟨α, α⟩` for a highest root `α` (line 2445), since `γ₀ = |α|`
(Lemma 6.4).

**Checks.**

- `SU(2)`: `16π²/(√2)² = 8π²`, the BPST energy; the topologically trivial threshold is `2E_GS = 16π²`.
- Rescaling the inner product by `c` multiplies `E_GS` by `c` and `γ₀^{−2}` by `c`.
- Commutative `G`: the set is empty and `E_GS = +∞`.

*Needs:* gap `compact-su2-subalgebra` (LieGroups); 1.6, 7.5, 7.6.

### Examples

The BPST connection with `ℰ_e = χ = 8π²`; the pair of opposite instantons in `𝔰𝔲(2) ⊕ 𝔰𝔲(2)` attaining the
gap; `E_GS(SU(2)) = 8π²`.

### Dependencies

Layers 1, 3–6; Yamabe Y2; PDE §1.4 and §2.3; the gap `compact-su2-subalgebra`.

## Layer 8: homogeneous spaces and linear covariant flows on `ℝ⁴`

Throughout Layers 8–10 `d = 4`, and connections are `𝔤`-valued 1-forms on `ℝ⁴` or on `ℝ⁴ × J`.

### 8.1 Homogeneous spaces and frequency envelopes

Use the coefficient specialisations of the spaces `Ḣ¹`, `Ḣ^σ`, `ℓ¹L²`, `ℓ¹Ḣ^σ` and `ℋ` of the Conventions.

For real coefficients, Tau Ceti's `TauCeti.D1p0` with Lebesgue measure, `Ω = ℝ⁴` and `p = 2` is complete
with dense test functions, and `TauCeti.D1p0.sobolevEmbeddingL` with `p* = 4` (`1/4 + 1/4 = 1/2`) is an
injective bounded map to `L⁴` sending each element to a function whose weak gradient is the recorded
field (Exact supplier contracts). Prove that its image is exactly `{u ∈ L⁴ : ∇u ∈ L²}`: for such `u` and
`χ_R = χ(·/R)` with a smooth cut-off `χ` equal to `1` on `B₁` and `0` off `B₂`,
`‖u ∇χ_R‖_{L²} ≤ ‖∇χ‖_{L⁴} ‖u‖_{L⁴(R ≤ |x| ≤ 2R)} → 0`, because `‖∇χ_R‖_{L⁴}` does not depend on `R`, and
mollifying the compactly supported `χ_R u` gives test functions converging to `u` in the gradient norm.
Hence, in an orthonormal basis of `V`, `Ḣ¹(ℝ⁴; V)` is the product of `dim V` copies of `TauCeti.D1p0` with an
equivalent norm (`‖u‖_{L⁴} ≤ C‖∇u‖_{L²}`, `TauCeti.D1p0.norm_sobolevEmbeddingL_le`), so it is a Banach
space in which `C_c^∞` is dense. Prove that it agrees with the realisation of PDE §7.2's `Ḃ¹_{2,2}`
(`s = 1 < d/p = 2`) with equivalent norms, and that `ℋ` is a Banach space.

Let `𝒮'_h(ℝ⁴; V)` be the tempered distributions `u` with `P_{≤k}u → 0` in `𝒮'` as `k → −∞`, where `P_{≤k}`
is the Fourier multiplier by `χ(2^{−k−1}ξ)` for PDE §7.1's cut-off `χ`; at every `ξ ≠ 0` this symbol is the
sum of the block symbols `ψ(2^{−j}ξ)`, `j ≤ k`. Prove that for `1 ≤ p, q ≤ ∞`,
`s < 4/p`, or `s = 4/p` with `q = 1`, every class in PDE §7.2's `Ḃ^s_{p,q}` has a unique
representative in `𝒮'_h`, given by `Σ_k P_k u`. Indeed, its low-frequency tail is controlled by
`Σ_{k≤K} 2^{k(4/p−s)}(2^{ks}‖P_k u‖_p)`, tending to `0` as `K → −∞`; at equality the
`ℓ¹` tail tends to `0`. The high-frequency sum converges in `𝒮'` by testing against Schwartz
functions. Two representatives differ by a polynomial, and the low-frequency condition kills it.
Use these representatives whenever the indices satisfy this range; outside it the Besov space
remains a quotient. This supplies the realisation used below (PDE §7.2's reconstruction,
with this low-frequency argument; BahouriCheminDanchin-FourierAnalysis, Definition 2.15 in §2.3, of the
homogeneous Besov spaces as subspaces of `𝒮'_h`, and the completeness theorem of that section for
`s < d/p`, or `s = d/p` and `r = 1`; cited by locator).

Prove also the heat-block estimate for every `k ∈ ℤ` and `1 ≤ p ≤ ∞`:
`‖e^{tΔ}P_k f‖_p ≤ C exp(−c4^k t)‖P_k f‖_p` for `t ≥ 0` and `P_k f ∈ L^p`.
For `λ = 2^{k−1}`, Fourier dilation gives
`P_k f = (P_1(f(λ⁻¹·)))(λ·)` and
`e^{tΔ}(g(λ·)) = (e^{λ²tΔ}g)(λ·)`.
PDE §7.1's estimate at index `1` therefore gives this estimate, with constants independent of
`k`, including `k ≤ 0`. For `σ ∈ ℝ` and `1 ≤ p ≤ ∞` with `σ < 4/p`, define the
realised homogeneous space `Ẇ^{σ,p}(ℝ⁴; V)` as the set of `u ∈ 𝒮'_h` for which some
`g ∈ L^p(ℝ⁴; V) ∩ 𝒮'_h` has `P_k g = |D|^σ P_k u` for every `k ∈ ℤ`, where `|D|^σ P_k` is the multiplier
`(2π|ξ|)^σ ψ(2^{−k}ξ)`, smooth because `ψ` vanishes near `0` (Mathlib `TemperedDistribution.fourierMultiplierCLM`
on the complexification of `V`); equivalently `𝓕g = (2π|ξ|)^σ 𝓕u` on `ℝ⁴ ∖ {0}`. Write `g = |D|^σ u` and
`‖u‖_{Ẇ^{σ,p}} = ‖g‖_{L^p}`. Define the heat-continuity subspace
`Ẇ^{σ,∞}_c = {u ∈ Ẇ^{σ,∞} : ‖e^{sΔ}u − u‖_{Ẇ^{σ,∞}} → 0 as s → 0⁺}`. These are the spaces of 8.4;
OhTataru-YMHF names them (line 850–856, used at line 1355–1356) without fixing a realisation. Prove:

- `g` is unique: two candidates differ by an element of `𝒮'_h` with Fourier support in `{0}`, a
  polynomial `q`, and `P_{≤k}q = q` for every `k` forces `q = 0`. Every `u ∈ 𝒮'_h` is `Σ_k P_k u` in `𝒮'`,
  so `‖u‖_{Ẇ^{σ,p}} = 0` only for `u = 0`.
- `u ↦ |D|^σ u` is a linear isometry of `Ẇ^{σ,p}` onto `L^p ∩ 𝒮'_h`, which is all of `L^p` for `p < ∞`
  and for `p = ∞` a closed subspace of `L^∞` containing no nonzero constant. Its inverse is
  `g ↦ Σ_k |D|^{−σ}P_k g`, whose low-frequency part converges in `L^∞` because
  `‖|D|^{−σ}P_k g‖_{L^∞} ≲ 2^{k(4/p − σ)}‖g‖_{L^p}` (Bernstein, PDE §7.1) and `σ < 4/p`. Hence `Ẇ^{σ,p}`
  is a Banach space.
- On a single block, `‖P_k u‖_{Ẇ^{σ,p}}` lies between constant multiples, depending on `σ` and `p`, of
  `2^{kσ}‖P_k u‖_{L^p}`: on the frequencies of `P_k` the multipliers `2^{−kσ}|D|^σ` and `2^{kσ}|D|^{−σ}`
  have kernels that are `L¹`-dilates of fixed Schwartz functions (PDE §7.1). So frequency envelopes in
  `Ẇ^{σ,p}` (below) may be formed with either quantity, up to constants.
- `Ḃ^σ_{p,1} ⊆ Ẇ^{σ,p} ⊆ Ḃ^σ_{p,∞}` for the representatives of PDE §7.2's Besov spaces just constructed, with bounded inclusions, and
  `Ẇ^{σ,2} = Ḣ^σ` with equivalent norms (Plancherel).
- The heat semigroup `e^{sΔ}` of PDE §6.3 commutes with `|D|^σ`, preserves `𝒮'_h` and is a contraction of
  `Ẇ^{σ,p}`, strongly continuous for `p < ∞`. `Ẇ^{σ,∞}_c` is the closed subspace of the `u` for which
  `|D|^σ u` has a bounded uniformly continuous representative, and it contains `C_c^∞` for `−2 < σ < 0`.
- `‖u(λ·)‖_{Ẇ^{σ,p}} = λ^{σ − 4/p}‖u‖_{Ẇ^{σ,p}}` for every `λ > 0`.

**Homogeneous product bounds.** On `ℝ⁴` construct the continuous bilinear product
`Ḣ¹ × Ḣ^{σ+1} → Ḣ^σ` for `−2 < σ < 1`, agreeing with multiplication of smooth annular
Fourier truncations and with the pointwise product when both inputs are functions for which
that product is defined. Prove
`‖uv‖_{Ḣ^σ} ≲_σ ‖u‖_{Ḣ¹}‖v‖_{Ḣ^{σ+1}}` and the stronger summability bound
`‖uv‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` for `u, v ∈ Ḣ¹`.
They apply componentwise to any fixed bilinear map between finite-dimensional coefficient
spaces, in particular the Lie bracket. Their source is homogeneous Bony calculus
(BahouriCheminDanchin-FourierAnalysis, the homogeneous paraproduct and remainder theorems of §2.6,
cited by locator; Theorems 2.82 and 2.85 of §2.8 are the nonhomogeneous analogues that PDE §7.3 uses;
OhTataru-YMHF lines 2287–2301 use the bilinear theory).

A route is the homogeneous trichotomy
`T_u v = Σ_k P_{≤k−4}u · P_k v`, `T_v u` with the inputs interchanged, and
`R(u,v) = Σ_{|j−k|≤3} P_j u · P_k v`. These three sets of pairs partition all block pairs;
the separation by four matches the support `1 ≤ |ξ| ≤ 4` of the blocks and makes each
paraproduct term annular. Prove convergence of the three series in `𝒮'` on the stated
Sobolev domains, with sum the product above, independent of the annular approximation.
For `a_j = 2^j‖P_j u‖₂`, `b_k = 2^{k(σ+1)}‖P_k v‖₂`, Bernstein gives the paraproduct bounds at
output frequency `k` by
`b_k Σ_{j≤k−4} 2^{j−k} a_j` and
`a_k Σ_{j≤k−4} 2^{(1−σ)(j−k)} b_j` after weighting by `2^{kσ}`.
Comparable high inputs at index `j` and output `k ≤ j + C` give
`2^{kσ}‖P_k(P_j u P_l v)‖₂ ≲ 2^{(σ+2)(k−j)} a_j b_l` for `|j−l| ≤ 3`.
All kernels are summable exactly in the stated open range. Cauchy–Schwarz and convolution
in the block indices prove the `ℓ²` output estimate; at `σ = 0`, summing these bounds in
`ℓ¹` gives `‖uv‖_{ℓ¹L²} ≲ ‖a‖₂‖b‖₂`. Thus no product of arbitrary distributions is assumed.

Define, after OhTataru-YMHF Definitions 3.2–3.4 and
Lemma 3.5 (lines 884–954), with a small universal `δ > 0` and `0 < ε ≪ 1`:

- a frequency envelope for `u` in a translation-invariant space `X` is a positive sequence `(c_k)_{k∈ℤ}`
  with `‖P_k u‖_X ≤ c_k` and `2^{−δ(j−k)}c_j ≲ c_k ≲ 2^{δ(j−k)}c_j` for `j > k`;
  the identically zero sequence is also allowed and majorizes exactly the data whose
  homogeneous blocks all vanish. In a realised space contained in `𝒮'_h` this means `u = 0`;
  in a homogeneous quotient it means the zero class;
- for `σ₁, σ₂ > 0` it is `(−σ₁, σ₂)`-admissible if
  `2^{−σ₁(1−ε)(j−k)}c_j ≲ c_k ≲ 2^{σ₂(1−ε)(j−k)}c_j` for `j > k`;
- `d_k` is `σ`-compatible with `c_k` if `c_k Σ_{j<k} 2^{σ(1−ε)(j−k)} d_j ≲ d_k`;
- `c^{[σ]}_k = sup_{j<k} 2^{(1−ε)σ(j−k)} c_j`, `(c·d)_k = c_k d_k`, `a_{≤k} = Σ_{j≤k} a_j`.

Prove: every `u ∈ Ḣ^σ` has a `(−σ₁, σ₂)`-admissible envelope with `‖c‖_{ℓ²} ≲ ‖u‖_{Ḣ^σ}`; and Lemma 3.5: if
`c_k`, `d_k` are `(−σ₁, S)` envelopes and `c` is bounded, then `e_k = d_k + c_k Σ_{j<k} 2^{σ̃(j−k)} d_j`,
`σ̃ < σ(1 − ε)`, is `σ`-compatible with `c_k` whenever the defining sums are finite
(for example, `d ∈ ℓ²` and `0 < σ̃ < σ(1 − ε)`), with constant at most `1 + C_{σ(1−ε)−σ̃}‖c‖_{ℓ^∞}`.

**Checks.**

- In the trichotomy, a pair of indices `(0,4)` occurs once in `T_u v`, `(4,0)` once
  in `T_v u`, and `(0,0)` and `(0,3)` once in `R`. Counting the pair `(0,3)` also as
  a paraproduct would count its product twice.
- Under `u(λ·), v(λ·)`, both sides of the Sobolev product bound have degree `σ − 2`;
  the `ℓ¹L²` bound has degree `−2`. At `λ = 2`, `σ = 0` both sides acquire `1/4`;
  if either input is `0`, both products and all three series are `0`.
- The lower endpoint fails: for nonzero real Schwartz `u = v` with annular Fourier support,
  `∫u² > 0`, so the Fourier transform of `u²` is nonzero at `0` and its `Ḣ^{−2}` norm
  contains `∫₀^ε r^{−1}dr = ∞`, although `‖u‖_{Ḣ¹}‖u‖_{Ḣ^{−1}} < ∞`.
  The upper endpoint also fails: choose real annular Schwartz `φ` with nonnegative Fourier transform and `φ(0) > 0` and
  `v_N = N^{−1/2}Σ_{j=1}^N φ(2^j·)`. Then `‖v_N‖_{Ḣ²} ≍ 1` and
  `v_N(0) = √N φ(0)`. A fixed nonzero test bump concentrated at scale `2^{−2N}`,
  `u_N(x) = 2^{2N}u(2^{2N}x)`, has `‖u_N‖_{Ḣ¹} ≍ 1` but
  `‖u_N v_N‖_{Ḣ¹} ≳ √N`. Neither excluded endpoint is imported as an estimate.
- For `k = 0`, Plancherel and `|ξ| ≥ 1` on the block support give
  `‖e^{tΔ}P_0 f‖₂ ≤ e^{−4π²t}‖P_0 f‖₂`; for `k = −1` the corresponding bound is
  `e^{−π²t}`. The dilation from index `1` uses `λ = 1/2` and `1/4`, respectively.
- A constant has every homogeneous block `0`, so its quotient class has the unique realised
  representative `0`; the constant itself has `P_{≤k}1 = 1` and is excluded. At the
  endpoint `s = 2`, `p = 2`, `q = 1`, a low tail with weighted block sizes `2^k`, `k ≤ 0`,
  has sum `Σ_{k≤K}2^k = 2^{K+1} → 0`; merely bounded sizes `1` have an infinite tail,
  so the endpoint proof requires `q = 1`.
- `u` with a single nonzero block `P_{k₀}u`: `c_k = 2^{−δ|k−k₀|}‖P_{k₀}u‖_X` is an envelope, and every
  envelope has `c_{k₀} ≥ ‖P_{k₀}u‖_X`.
- `c_k = 2^{k}` for `k ≤ 0`, `c_k = 1` for `k > 0` grows at rate `1 > 1 − ε` to the right on `k ≤ 0`, so it is
  not `(−1, S)`-admissible for any `S`.
- The constant `1 ∈ L^∞` has every `P_k1 = 0`, so the zero envelope majorizes it although
  `‖1‖_∞ = 1`. It is excluded from `𝒮'_h` since `P_{≤k}1 = 1` for every `k`.
  The zero distribution has all blocks and all low-frequency limits `0`.
- Zero data admit the zero envelope and its `ℓ²` norm is `0`; requiring strict positivity
  while also demanding `‖c‖₂ ≤ C‖0‖` would give `0 < c_k ≤ 0`. With `d_j = 1` for `j < 0`
  and `σ̃ = 0`, the convolution at `k = 0` is `Σ_{j<0}1 = ∞`; the finiteness condition excludes it.
- `ℋ ⊊ Ḣ¹`: a gradient field `a = ∇φ` with `‖P_k(∂^ℓ a_ℓ)‖_{L²} = 1/k` for `k ≥ 1` and `0` otherwise is in `Ḣ¹`
  but `Σ_k 1/k = ∞`, so `a ∉ ℋ`; a divergence-free `a ∈ Ḣ¹` has `‖a‖_ℋ = ‖a‖_{Ḣ¹}`; for `λ = 2^m`,
  `‖λa(λ·)‖_ℋ = ‖a‖_ℋ`.
- `Ḣ¹ ∩ Ḣ³` (Conventions): the polynomial `x₁` has every block `P_k x₁ = 0`, so its `Ḣ³` quantity is `0`,
  but it is not in `L⁴` and hence not an element; without the `Ḣ¹` anchor the `Ḣ³` quantity would vanish
  on a nonzero function and would not be a norm. A test function `φ` has
  `Σ_k 2^{6k}‖P_k φ‖²_{L²} ≈ ‖|D|³φ‖²_{L²} < ∞` and lies in `Ḣ¹ ∩ Ḣ³`.
- `Ḣ¹` against Tau Ceti's space: a test function `φ` maps to itself under the Sobolev embedding and has
  norm `‖∇φ‖_{L²}` there, while the Conventions' norm adds `‖φ‖_{L⁴} ≤ C‖∇φ‖_{L²}`: equivalent, not equal.
  The constant `1` has `∇1 = 0 ∈ L²` but is not in `L⁴`, so it is not an element; the condition `u ∈ L⁴`
  is what removes the constants that the gradient norm alone does not see.
- At `d = 4`, `p = 2`, `p* = 4`, the exponent equation is `1/4 + 1/4 = 1/2` and
  `p* ≠ ∞`. At `d = p = 4`, `p* = ∞`, the equation `0 + 1/4 = 1/4` still holds,
  but the identity-extending embedding is not asserted: smooth truncations of a cutoff
  of `log log(1/r)` have bounded gradient fourth-power integral
  `C∫₁^∞ t^{−4}dt = C/3` and arbitrarily large supremum. The finite-exponent hypothesis
  cannot be dropped from the supplier contract.
- The step at `p = ∞`, `σ = −1`: `g = sign(x₁)` lies in `L^∞ ∩ 𝒮'_h`, since `P_{≤k}g(x) = Φ(2^{k+1}x₁)` for an
  odd bounded `Φ` and this tends to `0` boundedly as `k → −∞`. So `b = Σ_k |D|P_k g ∈ Ẇ^{−1,∞}` with
  `|D|^{−1}b = g` and `‖b‖_{Ẇ^{−1,∞}} = 1`. Each `g + c`, `c ≠ 0` constant, has the same blocks and sup norm
  `1 + |c|`, but `P_{≤k}(g + c) → c ≠ 0`: without the realisation `𝒮'_h` the norm would not be determined.
  `|D|^{−1}(e^{sΔ}b − b) = e^{sΔ}g − g` with `e^{sΔ}g(x) = erf(x₁/(2√s))`, whose sup distance to `g` is `1`
  for every `s > 0`, so `b ∉ Ẇ^{−1,∞}_c`. The zero distribution has norm `0`, and the dilation law holds with
  `λ^{σ − 4/p} = λ^{−1}`: `|D|^{−1}(b(λ·)) = λ^{−1}g(λ·) = λ^{−1}g`.
- A smooth datum: for real `φ ∈ C_c^∞(ℝ⁴)`, `|D|^{−1}φ(x) = (4π²)^{−1} ∫ φ(y)|x − y|^{−3} dy` (the Riesz
  potential, constant `Γ(3/2)/(2π²Γ(1/2)) = 1/(4π²)`), a bounded uniformly continuous function of size
  `(4π²)^{−1}(∫φ)|x|^{−3}` at infinity, so `φ ∈ Ẇ^{−1,∞}_c`: the heat-continuity subspace is not reduced to
  `0`, and it is a proper subspace by the previous Check.
- The `2π` and the full norm against blocks, at `p = 2`: for `𝓕u` supported in a thin shell around
  `|ξ| = 2^{k+1}`, the symbol `ψ(2^{−k}ξ)` tends uniformly to `1` and the neighbouring symbols
  tend to `0` as the shell shrinks. Thus the ratio of
  `‖u‖_{Ẇ^{σ,2}} = ‖(2π|ξ|)^σ 𝓕u‖_{L²}` to `2^{kσ}‖P_k u‖_{L²}` tends to `(4π)^σ`. The full
  norm equals the block quantity only at `σ = 0`; a definition with `|ξ|^σ` in place of `(2π|ξ|)^σ` would
  give the factor `2^σ`.

*Needs:* Tau Ceti `TauCeti.D1p0`, `TauCeti.D1p0.sobolevEmbeddingL`, `TauCeti.D1p0.norm_sobolevEmbeddingL_le`,
`TauCeti.D1p0.hasWeakFDerivOn_sobolevEmbeddingL`, `TauCeti.D1p0.sobolevEmbeddingL_injective`,
`TauCeti.D1p0.denseRange_ofTestFunctionₗ`; Mathlib `TemperedDistribution.fourierMultiplierCLM`,
`MeasureTheory.Lp.toTemperedDistribution`, `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`;
PDE §6.3, §7.1–7.3 (the decomposition pattern and Bernstein, with the homogeneous targets above).

### 8.2 Solvability for the covariant Laplacian

For `A ∈ Ḣ¹` put `Δ_A = D^ℓ D_ℓ`. Prove (OhTataru-YMHF Theorems 4.1–4.2, lines 955–1175): for
`0 < σ < 2` and `F ∈ Ḣ^{σ−2}` there is a unique `B ∈ Ḣ^σ` with `Δ_A B = F` and
`‖B‖_{Ḣ^σ} ≲_{‖A‖_{Ḣ¹}} ‖F‖_{Ḣ^{σ−2}}`; if moreover `∂^j A_j ∈ ℓ¹L²`, then for every `F ∈ ℓ¹L²` there is a
unique `B ∈ ℓ¹Ḣ²` with `Δ_A B = F` (an identity in `L²`: each term of `Δ_A B` lies there for `A ∈ Ḣ¹`,
`B ∈ ℓ¹Ḣ²`), where `ℓ¹Ḣ² = Ḃ²_{2,1}` is realised in `𝒮'_h` by 8.1 (endpoint `s = 4/p`, `q = 1`) and lies in
`C₀`, since `‖P_k B‖_{L^∞} ≲ 2^{2k}‖P_k B‖_{L²}` (Bernstein); it satisfies `‖B‖_{ℓ¹Ḣ²} ≲ ‖F‖_{ℓ¹L²}` with a
constant depending on `‖A‖_{Ḣ¹}` and `‖∂^j A_j‖_{ℓ¹L²}`, and it is the `Ḣ^σ` solution whenever `F` also lies in
`Ḣ^{σ−2}`, `0 < σ < 2`. This `ℓ¹L²` clause is not a corollary of the first: `ℓ¹L² ⊂ L² = Ḣ⁰` corresponds
to the excluded `σ = 2` (Checks). And if `c_k` is a `(−1, S)` envelope for `A` in
`Ḣ¹` and `d_k` a `(−1, S)` envelope for `F` in `Ḣ^{−1}` that is `1`-compatible with `c_k`, then
`‖P_k B‖_{Ḣ¹} ≲ d_k`. Route: at `σ = 1`, the minimiser of `∫ ½|DB|² + ⟨B, F⟩` with the diamagnetic inequality `|∂|B|| ≤ |DB|` and
`‖B‖_{L⁴} + ‖B‖_{Ḣ¹} ≲ (1 + ‖A‖_{Ḣ¹})‖DB‖_{L²}`; `σ < 1` by duality; `σ > 1` and the envelope bounds by the
paradifferential decomposition with `[P_{<k}, Δ_A]`. For the `ℓ¹L²` clause, the a priori bound
(OhTataru-YMHF (4.3), line 966–967) applies to the finite block sums `F_N = Σ_{|k|≤N} P_k F`, which lie in
every `Ḣ^{σ−2}` and converge to `F` in `ℓ¹L²`; their solutions are Cauchy in `ℓ¹Ḣ²`, and the limit solves
the equation, since `ΔB_N`, `∂B_N` and `B_N` converge in `L²`, `L⁴` and `L^∞` against the coefficients
`A ∈ L⁴`, `∂A ∈ L²`. If `F ∈ Ḣ^{σ−2}` as well, `F_N → F` there too and both limits agree in `𝒮'`.
Uniqueness: a solution `z ∈ ℓ¹Ḣ²` of `Δ_A z = 0` lies in `C₀`, has `∂z ∈ L⁴` and `∂²z ∈ L²`, and satisfies
`Δ|z|² = 2|Dz|² + 2⟨z, Δ_A z⟩ = 2|Dz|² ≥ 0` weakly, because `ad(A_j)` is skew; the weak maximum principle
on large balls (PDE §3.2) and `z → 0` at infinity give `z = 0`. The source states (4.3) as a bound only;
existence and the uniqueness class for forcing in no `Ḣ^{σ−2}` are supplied here.

**Checks.**

- `A = 0`: `B = Δ⁻¹F`, the Fourier multiplier `−(4π²|ξ|²)⁻¹` for `ξ ≠ 0`, and `‖B‖_{Ḣ^σ}` is `‖F‖_{Ḣ^{σ−2}}` up to the factor
  `4π²` of Mathlib's normalisation. Zero frequency is handled by the
  homogeneous distribution realisation, rather than division by `|ξ|² = 0`.
- For `A = 0` and a Fourier mode `F = e^{2πiξ·x}X`, `ξ ≠ 0`, the inverse is
  `B = −F/(4π²|ξ|²)`. Varying `½‖DB‖² + ⟨B,F⟩` gives `−Δ_A B + F = 0`;
  the negative linear term would instead give `Δ_A B = −F`.
- A pure gauge `A = −O;x` with `O;x ∈ Ḣ¹`: `Δ_A(Ad(O)B) = Ad(O)ΔB`, so the solution is `Ad(O)Δ⁻¹(Ad(O⁻¹)F)`.
- The diamagnetic inequality at a point where `B ≠ 0`: `∂_j|B| = ⟨B, D_j B⟩/|B|` since `⟨B, [A_j, B]⟩ = 0`.
- The `ℓ¹L²` clause is needed separately: let `‖P_k F‖_{L²} = k^{−2}` for `k ≤ −1` and `P_k F = 0` for `k ≥ 0`.
  Then `‖F‖_{ℓ¹L²} = Σ_{k≥1} k^{−2} = π²/6`, but `‖F‖²_{Ḣ^{σ−2}} = Σ_{k≥1} 2^{2k(2−σ)}k^{−4} = ∞` for every
  `σ < 2`, so the first clause gives no solution, while the `ℓ¹L²` clause does.
- Uniqueness needs the class `ℓ¹Ḣ² ⊂ C₀`: for `A = 0` the constant `1` and the linear function `x₁` solve
  `ΔB = 0`; both have every block `P_k = 0`, so their realised representative in `𝒮'_h` is `0`, and
  neither tends to `0` at infinity.

*Needs:* PDE §3.2 (weak maximum principle), §7.1–7.3; 8.1.

### 8.3 The covariant heat operator: `L²` theory

Fix `S ∈ (0,∞]` and `J = [0,S)`. On `ℝ⁴ × J` let `A ∈ L^∞(J; Ḣ¹)` with `F ∈ L²(J; Ḣ¹)` and `∂_s A ∈ L²(J; L²)`, and consider
`∂_s B_j − Δ_A B_j − 2[F_j^k, B_k] = G_j + D^k H_kj` (OhTataru-YMHF (4.9), lines 1176–1183). Prove
(Theorems 4.3, 4.5, 4.6 and Corollary 4.4, lines 1187–1345): for `−2 < σ < 2` the problem is well posed in
`Ḣ^σ` with `‖B‖_{L^∞Ḣ^σ} + ‖DB‖_{L²Ḣ^σ} ≲ ‖B(0)‖_{Ḣ^σ} + ‖G‖_{L¹Ḣ^σ} + ‖H‖_{L²Ḣ^σ}`, constants depending on
`‖A‖_{L^∞Ḣ¹}`, `‖F‖_{L²Ḣ¹}`, `‖∂_s A‖_{L²L²}`, with covariant derivatives on the left for `σ ≥ 1` and on the right
for `σ ≤ −1`; the envelope bounds `‖P_k B‖_{L^∞L²} + ‖P_k DB‖_{L²L²} ≲ d_k` for `(−2, 2)` envelopes, and for
`1`-compatible `(−2, S)` envelopes when `‖P_k A‖_{L^∞Ḣ¹} + ‖P_k F‖_{L²Ḣ¹} + ‖P_k ∂_s A‖_{L²L²} ≲ c_k` with `c_k` a
`(−1, S)` envelope; for `H = 0` and `−1 < σ < 1`, `‖DB‖_{ℓ²L¹Ḣ^σ} ≲ ‖B(0)‖_{Ḣ^{σ−1}} + ‖G‖_{L¹Ḣ^{σ−1}}`, with
its envelope version `‖P_k DB‖_{L¹L²} ≲ d_k` for `1`-compatible `(−1, S)` envelopes `d_k` of `B(0)` in `Ḣ^{−1}`
and `G` in `L¹Ḣ^{−1}`; and, for `J = [0, ∞)`, decay: if `−2 < σ < 2`, `B(0) ∈ Ḣ^σ`, `G ∈ L¹Ḣ^σ` and
`H ∈ L²Ḣ^σ`, then `B(s) → 0` in `Ḣ^σ` as `s → ∞`. All of this holds, with the same proofs, for `𝔤`-valued
functions and 2-forms `B`, the term `−2[F_j^k, B_k]` being replaced by a bilinear term `R(F, B)` with
constant coefficients built from brackets and index contractions (`R = 0` for functions): the proofs use
only `|R(F, B)| ≲ |F||B|`, the Leibniz rule `D R(F, B) = R(DF, B) + R(F, DB)`, and that the adjoint of
`R(F, ·)` is of the same form.

The source's Theorem 4.6 prints `L¹Ḣ^σ` on the left (line 1290). Its proof bounds each block `P_k DB` in
`L¹L²` (lines 1297–1320), which sums to the `ℓ²L¹` norm that its applications use (lines 2207 and 2546);
the `L¹Ḣ^σ` form is false (Checks). The decay clause supplies the asymptotic step used at OhTataru-YMHF line 2535,
line 2543 and line 3404; its route is given below.

Route for the decay. First let `G = H = 0` and `B(0) ∈ L² ∩ Ḣ^{−1/2}`. The bound at `σ = 0` gives
`∫₀^∞ ‖DB‖²_{L²} ds < ∞`, so `‖DB(s_n)‖_{L²} → 0` along some `s_n → ∞`. Since `‖B‖_{L⁴} ≲ ‖∂|B|‖_{L²} ≤ ‖DB‖_{L²}`
(Sobolev's inequality and the diamagnetic inequality of 8.2) and `‖∂B‖_{L²} ≲ ‖DB‖_{L²} + ‖A‖_{L⁴}‖B‖_{L⁴}`, also
`‖B(s_n)‖_{Ḣ¹} → 0`; with the uniform `Ḣ^{−1/2}` bound and `‖u‖_{L²} ≲ ‖u‖^{2/3}_{Ḣ^{−1/2}} ‖u‖^{1/3}_{Ḣ¹}`, this gives
`‖B(s_n)‖_{L²} → 0`. The `σ = 0` bound on `[s_n, ∞)`, whose constants are at most those of `[0, ∞)`, gives
`sup_{s ≥ s_n} ‖B(s)‖_{L²} ≲ ‖B(s_n)‖_{L²}`, so `B(s) → 0` in `L²`. For data `u ∈ Ḣ^σ`, approximate by the
finite block sums `Σ_{|k|≤N} P_k u`: they converge to `u` in `Ḣ^σ` because its norm is the `ℓ²` sum of the
block norms (PDE §7.2), and, having Fourier transforms in `L²` supported in compact annuli, they lie in
every `Ḣ^τ`. For such data, interpolate the `L²` decay with the uniform `Ḣ^{σ'}` bound for some
`σ' ∈ (−2, 2)` with `σ` between `0` and `σ'`; the uniform `Ḣ^σ` bound controls the approximation error. For
nonzero `G` and `H`, split the solution at `s = S` into the homogeneous solution with data `B(S)` and the
solution with zero data at `S`; the latter is bounded in `Ḣ^σ` by `‖G‖_{L¹([S, ∞); Ḣ^σ)} + ‖H‖_{L²([S, ∞); Ḣ^σ)}`,
which tends to `0` as `S → ∞`.

**Checks.**

- `A = 0`, `G = H = 0`, `σ = 0`: `‖B(s)‖²_{L²} + 2∫₀^s ‖∇B‖²_{L²} = ‖B(0)‖²_{L²}` with Mathlib's `Δ`, so
  `‖B‖_{L^∞L²} ≤ ‖B(0)‖_{L²}` and `‖∇B‖_{L²L²} ≤ 2^{−1/2}‖B(0)‖_{L²}`, and the estimate holds with constant
  `1 + 1/√2`. On `J = [0, ∞)` this constant is attained by every nonzero `b`: for `‖b‖_{L²} = 1`,
  `sup_s ‖e^{sΔ}b‖_{L²} = 1` and `∫₀^∞ ‖∇e^{sΔ}b‖²_{L²} ds = ½` (since `e^{sΔ}b → 0` in `L²`), so the left side
  is `1 + 1/√2 > 1`; the energy identity has coefficients `1` and `2`, the sum estimate does not have
  constant `1`.
- At `σ = 0` the estimate is invariant under `A ↦ λA(λ²s, λx)`, `B ↦ λ²B(λ²s, λx)`, `G ↦ λ⁴G(λ²s, λx)`,
  `H ↦ λ³H(λ²s, λx)`: for instance `‖λ⁴G(λ²·, λ·)‖_{L¹L²} = λ⁴ · λ^{−2} · λ^{−2} ‖G‖_{L¹L²}`, and the hypotheses'
  norms of `A` are invariant.
- `σ = 2` is excluded: the term `2[F_j^k, B_k]` with `F ∈ L²Ḣ¹` is not controlled in `L¹Ḣ²`.
- `ℓ²L¹` against `L¹`, at `A = 0`, `σ = 0`: `‖∇e^{sΔ}P_k b‖_{L¹L²} ≲ 2^k ∫₀^∞ e^{−c4^k s} ds ‖P_k b‖_{L²} ≈ ‖P_k b‖_{Ḣ^{−1}}`,
  so the `ℓ²L¹` bound holds. For `b = Σ_{k=1}^{K} b_k` with `b̂_k` supported where `|ξ| ≈ 2^k` and
  `‖b_k‖_{Ḣ^{−1}} = K^{−1/2}`, `‖b‖_{Ḣ^{−1}} ≈ 1`, while on `4^{−k−1} ≤ s ≤ 4^{−k}` the block `k` alone gives
  `‖∇e^{sΔ}b‖_{L²} ≳ 4^k K^{−1/2}`; summing over `k`, `‖∇e^{sΔ}b‖_{L¹L²} ≳ K^{1/2}`, so the `L¹L²` form fails.
- Decay at `A = 0`, `G = H = 0`: `‖e^{sΔ}b‖²_{Ḣ^σ} ≈ ∫ |2πξ|^{2σ} e^{−8π²s|ξ|²} |b̂(ξ)|² dξ → 0` by dominated
  convergence. No rate depends on `‖b‖_{Ḣ^σ}` alone: if `b̂` is supported in `|ξ| ≤ 2^{1−m}`, then at
  `s = 4^m` the multiplier is at least `e^{−16π²}` on the support, so the decay is qualitative.
- The time-global hypotheses are needed: a static Yang–Mills connection with `F ≠ 0`, such as BPST (which
  also lies outside `Ḣ¹`), has `F ∉ L²([0, ∞); Ḣ¹)`, and for `ξ ∈ ℝ⁴` the field `B_j = ξ^k F_{kj}` (in `L²`, as
  `|F| ≈ |x|^{−4}` at infinity) is a nonzero stationary solution of the homogeneous equation. Indeed the
  Bianchi identity gives `D_j B_i − D_i B_j = −ξ^k D_k F_{ij}`, and with `D^j F_{jk} = 0` and
  `D_j D_k − D_k D_j = ad(F_{jk})` this yields `D^ℓ D_ℓ B_i = −2[F_{ij}, B_j]`. It does not decay.

*Needs:* PDE §6.1, §6.3, §7.1, §7.2; Mathlib `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`; 8.1, 8.2.

### 8.4 The covariant heat operator: `L^p` parabolic regularity

Assume `‖P_k A(s)‖_{Ḣ¹} ≲ c_k(1 + 2^{2k}s)^{−N}` for all `s > 0` with `(c_k) ∈ ℓ²` and `N > 2`. Prove
(OhTataru-YMHF Theorems 4.7–4.8, lines 1346–1530): for `−2 < σ < 4/p`, `2 ≤ p ≤ ∞` and
`0 < δ ≤ min{4/p − σ, 2 + σ}`, with the sequence `c_k` of the hypothesis a `(−δ, S)` envelope,
`b ∈ Ẇ^{σ,p}` (the realised space of 8.1) and
`d^{σ,p}_k` a `(−δ, S)` envelope for `b` in `Ẇ^{σ,p}` that is `δ`-compatible with `c_k`, the homogeneous
problem `(∂_s − Δ_A − 2ad(F))B = 0`, `B(0) = b`, has a unique solution in the class with the stated dyadic bounds, strongly continuous
in `Ẇ^{σ,p}` for `p < ∞`, with
`‖P_k B(s)‖_{Ẇ^{σ,p}} ≲_{‖c‖_{ℓ²}, N} d^{σ,p}_k (1 + 2^{2k}s)^{−N}`; and for `0 ≤ β < 1` and a `(−δ, S)`
envelope `d^{σ,p}_k` that is `δ`-compatible with `c_k`, the inhomogeneous problem with `B(0) = 0` and
`‖P_k G‖_{Ẇ^{σ,p}} ≲ 2^{2k}(2^{2k}s)^{−β} d^{σ,p}_k (1 + 2^{2k}s)^{−N}` has
`‖P_k B‖_{Ẇ^{σ,p}} ≲ (2^{2k}s)^{1−β} d^{σ,p}_k (1 + 2^{2k}s)^{−N}`. At `p = ∞`, require the initial trace block by block and in distributions; strong continuity
in the full norm at `s = 0` holds for `b` in the heat-continuity subspace `Ẇ^{σ,∞}_c` of 8.1. The source
asserts full norm continuity also at `p = ∞` (line 1356); that endpoint requires this distinction.
The source writes the exponent of the
second conclusion as `1 − α/2` (line 1522), which does not match its `L²` case `1 − β` (line 1517); the
exponent `1 − β` is the one its induction (4.35) propagates with `α` read as `β`.

**Checks.**

- `A = 0`, `b = P_k b`: `‖e^{sΔ}P_k b‖_{L^p} ≲ exp(−c 4^k s)‖P_k b‖_{L^p}` (PDE §7.1), which is stronger than the
  polynomial decay asserted.
- `β = 0`, `A = 0`, `G = P_k G` constant near `s = 0` and smoothly cut off by heat-time `2^{−2k}`: `B(s) = ∫₀^s e^{(s−s')Δ}G ds'` has `‖B‖ ≈ s‖G‖` for
  `s ≲ 2^{−2k}`, matching `(2^{2k}s) · 2^{−2k}`.
- At `p = ∞`, `σ = −1`, let `g(x) = sign(x₁)` and `b ∈ Ẇ^{−1,∞}` with `|D|^{−1}b = g` (8.1, Checks).
  Then `‖b‖_{Ẇ^{−1,∞}} = ‖g‖_∞ = 1`, but
  `‖e^{sΔ}b − b‖_{Ẇ^{−1,∞}} = ‖e^{sΔ}g − g‖_∞ = 1` for every `s > 0`: the heat-smoothed step
  approaches `0` at the jump. Each fixed frequency block converges, so this separates the two traces.

*Needs:* PDE §6.3, §7.1; 8.1, 8.3.

### Examples

The heat equation as the case `A = 0`; the conjugation of `Δ` by a pure gauge; single-block envelopes;
the step `|D| sign(x₁)` in `Ẇ^{−1,∞}` outside the heat-continuity subspace.

### Dependencies

PDE §3.2 (8.2), §6.1, §6.3, §7.1–7.3; Tau Ceti's `TauCeti.D1p0`; Mathlib's Fourier multipliers on tempered
distributions; Layer 1.

## Layer 9: the Yang–Mills heat flow on `ℝ⁴`

### 9.1 The covariant, dynamic and linearised flows

Here `J = [0,S)` for `0 < S ≤ ∞`, with initial trace at `s = 0`. Define a covariant Yang–Mills heat flow on `ℝ⁴ × J` as a connection `A_j dx^j + A_s ds` solving
`F_sj = D^ℓ F_ℓj`, with `F_sj = ∂_s A_j − ∂_j A_s + [A_s, A_j]`; a dynamic Yang–Mills heat flow as
`A_α dx^α + A_s ds`, `α = 0, …, 4`, solving `F_sα = D^ℓ F_ℓα`; and the linearised flow
`D_s B_i − D_i B_s = D^ℓ(D_ℓ B_i − D_i B_ℓ) + [B^ℓ, F_ℓi]` (OhTataru-YMHF Definitions 5.1 and 5.3, (5.4),
lines 1541–1607). Prove, for regular solutions:

- covariance under gauge transformations `O(s, x)` (and `O(t, s, x)` for the dynamic flow), and the
  linearised gauge invariance `B ↦ B − D A₀` of (5.5);
- the curvature equations `D_s F_ij − D^ℓ D_ℓ F_ij = −2Σ_ℓ[F_iℓ, F_jℓ]` and
  `D_s F_si − D^ℓ D_ℓ F_si = −2Σ_ℓ[F_sℓ, F_iℓ]`, and their dynamic versions (Lemmas 5.2 and 5.4);
- the energy identity `∫|F|²(s₁) + 2∫_{s₀}^{s₁}∫ Σ_j |D^ℓ F_ℓj|² = ∫|F|²(s₀)` (Proposition 5.6, (1.19));
- in the local caloric gauge `A_s = 0`: `∂_s A_i = D^ℓ D_ℓ A_i − D^ℓ ∂_i A_ℓ` (5.21),
  `∂_s ∂^ℓ A_ℓ = −[A^k, D^ℓ F_ℓk]` (5.22), the linearised flow `∂_s B_i = D^j(D_j B_i − D_i B_j) + [B^j, F_ji]`
  (5.23) with the residual freedom `B ↦ B − DC`, `C = C(x)`. For the dynamic component,
  `∂_s A₀ = D^ℓF_ℓ0` and `(∂_s − Δ_A)F_0j = 2Σ_ℓ[F_jℓ,F_0ℓ]`.
  In the infinitesimal reconstruction `B_j = F_0j + D_jA₀`, adding an `s`-independent
  `C` to the auxiliary `A₀` while fixing `F_0j` changes `B` by `DC`, the residual linearised
  freedom (5.26)–(5.28). In the de
  Turck gauge `A_s = ∂^ℓ A_ℓ`: `(∂_s − Δ_A)A_j = [A_j, ∂^k A_k] − [A^k, ∂_j A_k]` (1.7)–(1.8);
- every regular covariant flow is gauge equivalent to one in the local caloric gauge, by the gauge
  transformation `O` with `∂_s O = O A_s` and `O(0) = 1` (so that `(O·A)_s = Ad(O)A_s − (∂_s O)O⁻¹ = 0`), unique up to
  `s`-independent gauge transformations.

**Checks.**

- Energy identity, `G = U(1)`, one Fourier mode `a = α e^{2πiξ·x}` with `ξ·α = 0` (complexified): the flow is
  `∂_s a = Δa`, the energy per unit volume `4π²|ξ|²|α|² e^{−8π²|ξ|²s}` has derivative
  `−32π⁴|ξ|⁴|α|²e^{−8π²|ξ|²s}`, and `Σ_j |∂^ℓ f_ℓj|² = 16π⁴|ξ|⁴|α|²e^{−8π²|ξ|²s}`: the factor is `2`. The source's
  (1.19) and (5.11) print the dissipation term with factor `1` for the energy `½∫⟨F_jk, F^{jk}⟩`.
- To fix the order of the curvature indices, take the spatially constant
  `A₁=i`, `A₂=j`, `A₃=k`, `A₄=0`. Then `F₁₂=2k`, `F₁₃=−2j`, `F₂₃=2i`,
  `∂_s F₁₂=−32k` and `Δ_A F₁₂=−16k`. The right side is
  `−2[F₁₃,F₂₃]=−16k`; reversing the first curvature pair would give `+16k`.
- A flat connection is a stationary solution in the local caloric gauge: `D^ℓ F_ℓj = 0`.
- Parabolic scaling `A ↦ λA(λx, λ²s)`, `A_s ↦ λ²A_s(λx, λ²s)` maps solutions to solutions.

*Needs:* 1.3; PDE §6.3.

### 9.2 Covariant bounds

Prove (OhTataru-YMHF Proposition 5.7, Corollary 5.8 and Lemma 5.17, lines 1628–1801 and 1986–2000): for a
regular covariant flow on `J = [0, s₁)` with `‖F‖_{L³(J; L³)} ≤ Q`, the weighted bounds
`‖s^{n/2} D^{(n)}_x F‖_{L^∞(J, ds/s; L²)} + ‖s^{(n+1)/2} D^{(n+1)}_x F‖_{L²(J, ds/s; L²)} ≲ Q_n(‖F(0)‖_{L²}, Q)` for
every `n ≥ 0`, and the same for `F_{0j}` of a dynamic flow in terms of `‖F_{0x}(0)‖_{L²}` and `‖F(0)‖_{L²}`; the following `L^p L^q` bounds from the diamagnetic inequality and weighted covariant
Sobolev interpolation: for `p,q ≥ 2`, `n = 0` with `1/p + 2/q ≤ 1/2`, or `n ≥ 1` with no further
restriction,
`‖s^{n/2 + 1 − 2/q} D_x^{(n)}F‖_{L^p(J,ds/s;L^q)} ≤ C_{n,p,q}(‖F(0)‖₂,Q)`,
and the dynamic analogue with the additional argument `‖F_{0x}(0)‖₂`. The weight is fixed by
parabolic scaling; the extra `1/4 − 1/p` printed in Corollary 5.8 is incompatible with `ds/s`; and, in the local caloric gauge with energy `≤ E`,
`‖A‖_{L^∞(J; Ḣ¹)} ≲_{Q,E} 1 + inf_{s∈J}‖A(s)‖_{Ḣ¹}`, with its version on balls.

**Checks.**

- For an abelian heat mode of frequency `|ξ|`, the dimensionless smoothing variable is
  `s|ξ|²`, and `s^{n/2}D^{(n)}F` scales like curvature; the `ds/s` norm adds no time scale.
- In the displayed `L^pL^q` bound, parabolic dilation contributes
  `λ^{2+n−4/q}λ^{−2(n/2+1−2/q)} = 1`. The extra weight `1/4−1/p` would instead give
  `λ^{−1/2+2/p}`; at `p = ∞`, `q = 4`, this is `λ^{−1/2}`, refuting a uniform scale-invariant bound.
- For `F = 0` all weighted curvature quantities are `0`; the potential may be a nonzero
  stationary pure gauge, so the potential bound includes `inf_s ‖A(s)‖_{Ḣ¹}`.

*Needs:* 8.1, 8.3 (covariant parabolic estimates), 9.1; PDE §1.4 (Sobolev interpolation).

### 9.3 Local well-posedness in the local caloric gauge

Define a regular solution as `A ∈ C(J; Ḣ¹ ∩ Ḣ³)` solving (5.21), and an `Ḣ¹` solution on `J = [0, s₀)` as
`A ∈ C(J; Ḣ¹)` that is, on every compact subinterval, the `C(·; Ḣ¹)`-limit of regular solutions
(OhTataru-YMHF Lemmas 5.16 and 5.26, lines 1963–1980 and 2336–2340). Prove (Theorem 5.9, lines 1873–1875):

- for every `a ∈ Ḣ¹` there is a unique maximal `Ḣ¹` solution on `[0, s₀(a))`, `s₀(a) ∈ (0, ∞]`;
- for every `s₁ < s₀(a)` there are `ε, C > 0` such that `‖ã − a‖_{Ḣ¹} < ε` implies `s₀(ã) > s₁` and
  `sup_{[0,s₁]}‖Ã − A‖_{Ḣ¹} ≤ C‖ã − a‖_{Ḣ¹}`;
- the same holds with `Ḣ¹` replaced by `ℋ` and by `Ḣ¹ ∩ Ḣ^σ`, `σ ≥ 1`, for data in those spaces, with the
  same `s₀(a)`.

Route: local well-posedness in `Ḣ¹ ∩ Ḣ³` with lifespan depending on the size of the data, by the
curl/div splitting into a parabolic and a transport equation; regularised data `P_{<k}a` with the
`L³L³` bound controlled on a common interval; the linearised flow solved through the dynamic flow (the
infinitesimal de Turck trick), with 8.3–8.4.

**Checks.**

- Dilation: `s₀(λa(λ·)) = λ^{−2}s₀(a)`, so any finite lifespan can be made arbitrarily small without changing `‖a‖_{Ḣ¹}`;
  a quantitative lifespan must retain a concentration scale.
- `a` flat with `a ∈ Ḣ¹`: `A(s) = a` for all `s`, `s₀ = ∞`.
- `G = U(1)`: `A(s) = ∇φ + e^{sΔ}a^{df}` for the Helmholtz decomposition `a = ∇φ + a^{df}`, global for every
  `a ∈ Ḣ¹`.

*Needs:* 8.1–8.4, 9.1, 9.2.

### 9.4 Caloric size, continuation and small energy

Define the caloric size `Q(a) = ‖F‖_{L³([0,∞); L³)}` when `s₀(a) = ∞`, and `Q(a) = ∞` otherwise
(OhTataru-YMHF (2.5) and (5.40), lines 419–425 and 1940–1942). Prove (Theorem 5.10, Theorem 5.11,
Corollaries 5.12–5.14, lines 1878–1948):

- if `‖F‖_{L³(J;L³)} ≤ Q` on `J = [0, s₀)` and `‖a‖_{Ḣ¹} ≤ M₁`, then
  `‖A‖_{L^∞Ḣ¹} + ‖F‖_{L^∞L² ∩ L²Ḣ¹} + ‖∂_s A‖_{L²L²} ≲_Q ‖a‖_{Ḣ¹}`, the linearised bounds
  `‖B‖_{L^∞Ḣ^σ} + ‖curl_A B‖_{L²Ḣ^σ} ≲_{Q,M₁} ‖b‖_{Ḣ^σ}` for `−2 < σ < 2`, the higher-regularity bounds for
  `a ∈ Ḣ¹ ∩ Ḣ^σ`, `σ > 1`, including for linearised data `b ∈ Ḣ¹ ∩ Ḣ^σ` the tame bound
  `‖B‖_{L^∞Ḣ^σ} + ‖curl_A B‖_{L²Ḣ^σ} ≲_{Q,M₁} ‖b‖_{Ḣ^σ} + ‖b‖_{Ḣ¹}‖a‖_{Ḣ^σ}` (Theorem 5.10(3), (5.33),
  line 1893), the analogous `ℋ` bounds, and the envelope bounds of Theorem 5.11;
- under the same hypothesis the limit `A(s₀) = lim_{s→s₀} A(s)` exists in `Ḣ¹` (in `ℋ`, in `Ḣ¹ ∩ Ḣ^σ` for such
  data). If `s₀ < ∞` and `Q > 0`, there are `s̃₀ > s₀` and `ε > 0` such that
  `‖ã − a‖_{Ḣ¹} < ε` gives a solution on `[0,s̃₀)` with `L³L³` norm at most `2Q`;
  at `s₀ = ∞` the conclusion is the flat limit of §9.5;
- continuation: a maximal `Ḣ¹` solution on `[0, s₀)` has `s₀ = ∞` or `‖F‖_{L³([0,s₀); L³)} = ∞`;
- small energy: there is `ε > 0` such that `ℰ_e(a) ≤ ε` implies `s₀(a) = ∞` and `Q(a)² ≲ ℰ_e(a)`.

**Checks.**

- `Q` is dilation invariant: `F_λ(s, x) = λ²F(λ²s, λx)` gives `∫∫ λ⁶|F(λ²s, λx)|³ dx ds = ∫∫ |F|³`.
- A flat `a ∈ Ḣ¹` has `Q(a) = 0`.
- A global flat flow has endpoint `s₀ = ∞` and limit `a`; no strictly larger time interval
  than `[0,∞)` exists. Thus the larger-interval clause explicitly assumes a finite endpoint.
- The BPST potential is not in `Ḣ¹` (`|A_BPST| ≈ |x|^{−1}` is not in `L⁴(ℝ⁴)`); as a static flow it has
  `‖F‖_{L³([0,∞); L³)} = ∞`, so no small-energy or threshold statement applies to it.

*Needs:* 8.3, 9.1–9.3.

### 9.5 Convergence to a flat connection

Prove (OhTataru-YMHF Corollary 5.15 and Lemma 5.33, lines 1952–1957 and 2509–2555): for a global `Ḣ¹`
solution with `Q(a) ≤ Q < ∞` the limit `A_∞ = lim_{s→∞} A(s)` exists in `Ḣ¹` (in `ℋ` for `a ∈ ℋ`) and is flat;
the linearised solution with data `b ∈ Ḣ^σ`, `−1 < σ ≤ 1` (resp. `b ∈ ℋ`), has a limit `B_∞` in `Ḣ^σ`
(resp. `ℋ`), with `‖B_∞‖_{Ḣ^σ} ≲_{Q,M₁} ‖b‖_{Ḣ^σ}` when `‖a‖_{Ḣ¹} ≤ M₁` and
`D(A_∞)_k B_{∞,j} − D(A_∞)_j B_{∞,k} = 0`; if moreover `a, b ∈ Ḣ¹ ∩ Ḣ^{σ'}` with `σ' > 1` (Conventions), the
limit `B_∞` exists in `Ḣ¹ ∩ Ḣ^{σ'}`, with `‖B_∞‖_{Ḣ^{σ'}} ≲_{Q,M₁} ‖b‖_{Ḣ^{σ'}} + ‖b‖_{Ḣ¹}‖a‖_{Ḣ^{σ'}}`
(Lemma 5.33(2), line 2520, proof line 2550–2551: the `Ḣ¹` case together with the tame bound of 9.4 and
its envelope bounds (Theorem 5.11, (5.36); Lemma 5.24, lines 2242–2245, with `G = H = 0`), which make the
high-frequency `Ḣ^{σ'}` tails of `B(s)` uniformly small in `s`, so that
`Ḣ¹` convergence upgrades to `Ḣ^{σ'}` convergence, and lower semicontinuity of the `Ḣ^{σ'}` norm passes the
tame bound to the limit); the map `a ↦ A_∞` is Lipschitz in `Ḣ¹`, `ℋ` and `Ḣ¹ ∩ Ḣ^σ` (`σ > 1`)
on bounded convex subsets of the respective space on which `Q` is uniformly bounded.
For each `X = Ḣ¹`, `ℋ`, or `Ḣ¹ ∩ Ḣ^σ` with `σ > 1` (intersection norm), prove that
`Ω_X = {a ∈ X : Q(a) < ∞}` is open, `Q` is locally bounded there, and
`a ↦ A_∞(a) : Ω_X → X` is continuously Fréchet differentiable, in the sense of Mathlib
`ContDiff ℝ 1` on the open domain. Its derivative is the bounded linear map
`L_X(a) : X → X`, `b ↦ B_∞[a]b`, with operator-norm continuity:
for each `a ∈ Ω_X` and `ε > 0` there is `δ > 0` such that
`‖ã − a‖_X < δ` implies `ã ∈ Ω_X` and
`sup_{‖b‖_X ≤ 1} ‖B_∞[ã]b − B_∞[a]b‖_X < ε`.
The mixed space `ℋ ∩ Ḣ^σ` has the same conclusion by combining the two intersection norms.

For openness, flat convergence gives a large finite `T` with `ℰ_e(A(T))` below the
small-energy threshold of §9.4. Finite-time stability of §9.3 gives the same strict bound
for nearby data, and §9.4 controls the whole tail and hence `Q` locally.
For differentiability, distinguish the curve calculation (OhTataru-YMHF lines 2552–2555)
from the operator-norm continuity target above. A route to that target subtracts the
linearised flows with the same initial datum `b` around `Ã` and `A`; the difference has
zero initial datum and forcing formed from `Ã − A`, its derivatives and `B[ã]b`.
Use §§8.1, 8.3 and §9.4 for the resulting difference estimates, uniformly over
`‖b‖_X ≤ 1`. Splitting the coefficient frequencies at a finite cutoff makes the tails
small by the fixed data's Sobolev or Besov summability and bounds the finite part by
`C_{a,ε}‖ã − a‖_X`. This operator estimate must include the limit as heat-time tends to
infinity; pointwise convergence for each `b` does not suffice.
Once it holds, integration along `a + th`, `0 ≤ t ≤ 1`, gives the explicit remainder bound
`‖A_∞(a+h) − A_∞(a) − L_X(a)h‖_X ≤ ‖h‖_X sup_{0≤t≤1}‖L_X(a+th) − L_X(a)‖_{X→X} = o(‖h‖_X)`.
Thus the Fréchet assertion includes an estimate beyond the source's curve argument.

Route for `−1 < σ < 1`: the infinitesimal de Turck trick of the proof of Lemma 5.33 (lines 2538–2549), with
the bound of Lemma 5.23, Case 1 (lines 2172–2208). Put `A₀(0) = 0`. Then `F_{0j}` solves the homogeneous
equation of 8.3 with data `b`, so it is bounded in `Ḣ^σ`, and it tends to `0` there as `s → ∞` by the decay
clause of 8.3 (the source asserts this decay at line 2543). The `ℓ²L¹` bound of 8.3, applied to the equation
of the `𝔤`-valued function `D^ℓF_{ℓ0}`, whose right side `[DF, F_{0x}] + [F, DF_{0x}]` lies in `L¹Ḣ^{σ−1}` for
`−1 < σ < 1` (`DF ∈ L²L²` against `F_{0x} ∈ L²Ḣ^{σ+1}`, and `F ∈ L²Ḣ¹` against `DF_{0x} ∈ L²Ḣ^σ`), gives
`‖D^ℓF_{ℓ0}‖_{ℓ²L¹Ḣ^{σ+1}} ≲_{Q,M₁} ‖b‖_{Ḣ^σ}`. Hence each block `P_k A₀(s) = ∫₀^s P_k D^ℓF_{ℓ0}` converges in
`Ḣ^{σ+1}`, and its tail `∫_s^∞ ‖P_k D^ℓF_{ℓ0}‖_{Ḣ^{σ+1}}` tends to `0` for each `k` and is at most the
square-summable `‖P_k D^ℓF_{ℓ0}‖_{L¹Ḣ^{σ+1}}`; by dominated convergence in `ℓ²`, `A₀(s)` converges in
`Ḣ^{σ+1}` to some `a_{0,∞}`. The product bound `‖[u, v]‖_{Ḣ^σ} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ^{σ+1}}` on `ℝ⁴`, valid for
`−2 < σ < 1` (§8.1, homogeneous product bounds), and `A → A_∞` in
`Ḣ¹` then give
`B_j = F_{0j} + D_jA₀ → D(A_∞)_j a_{0,∞}` in `Ḣ^σ`. This limit is `D(A_∞)`-curl-free because `A_∞` is flat,
and the bound on `B_∞` is the uniform bound of 9.4. For `σ = 1` and for `ℋ` the route is the covariant div–curl
system of lines 2530–2537 and 2550: `curl_A B` solves the 2-form version of the equation of 8.3 with right
side `[F, DB] + [DF, B]` in `L²Ḣ^{−1}`, which is `D^k H_k` with `H = D Δ_A^{−1}([F, DB] + [DF, B]) ∈ L²L²` by
8.2, so `curl_A B → 0` in `L²` by the decay clause of 8.3 (the source asserts this at line 2535). The
source's Corollary 5.15 states the linearised limit for `−1 < σ < 2` (lines 1954–1955). Its proof, Lemma
5.33(2), writes `0 ≤ σ ≤ 1` (lines 2515–2516), but the de Turck argument given there for `0 ≤ σ < 1` uses
only facts that hold for `−1 < σ < 1` (for `σ < 0` the decay of `F_{0j}` is the decay clause of 8.3 at a
negative index), so it proves the negative range as well. For data in `Ḣ^σ` alone with `1 < σ < 2`
neither place gives a proof, and that range is not stated here.

**Checks.**

- `G = U(1)`: `A_∞ = ∇φ`, the gradient part of `a`, and `a ↦ A_∞` is the bounded linear Helmholtz projection.
- Pure gauge data `a = −O;x` with `O;x ∈ Ḣ¹`: `A_∞ = a`.
- `G = U(1)`, `b ∈ Ḣ¹ ∩ Ḣ³`: `B_∞` is the gradient part of `b`, and the Helmholtz projection acts on each block
  by an orthogonal projection, so `‖P_k B_∞‖_{L²} ≤ ‖P_k b‖_{L²}` for every `k`, hence `B_∞ ∈ Ḣ¹ ∩ Ḣ³` with
  `‖B_∞‖_{Ḣ³} ≤ ‖b‖_{Ḣ³}`: the first term of the tame bound already suffices when the bracket vanishes.
  This is the clause that makes `L_X(a)` map `X = Ḣ¹ ∩ Ḣ^σ` into itself.
- In the abelian case `L_X(a)` is the gradient projection for every `a`, so
  `‖L_X(ã) − L_X(a)‖_{X→X} = 0` and the Fréchet remainder is `0`.
- For `N(u) = sin u` on `L²(0,1)`, curve derivatives are `cos(u)h`, but take
  `u_n = π 1_{(0,1/n)}` at `u = 0`: `‖u_n‖₂ = π/√n → 0`,
  `‖(cos u_n − 1)·‖_{L²→L²} = 2` and
  `‖sin u_n − u_n‖₂/‖u_n‖₂ = 1`. This excludes replacing the operator-norm
  condition by differentiation along curves.
- `G = U(1)`, `σ = −½`: the linearised flow is `∂_s B = ΔB − ∇(∂^ℓB_ℓ)`. For the splitting
  `b = ∇ψ + b^{df}` it gives `B(s) = ∇ψ + e^{sΔ}b^{df}`, where `e^{sΔ}` is the multiplier `e^{−4π²s|ξ|²}`
  in Mathlib's normalisation, and `‖e^{sΔ}b^{df}‖²_{Ḣ^{−1/2}} ≈ ∫ |ξ|^{−1}e^{−8π²s|ξ|²}|b̂^{df}(ξ)|² dξ → 0` by
  dominated convergence. So `B_∞ = ∇ψ` is curl-free, and `‖B_∞‖_{Ḣ^{−1/2}} ≤ ‖b‖_{Ḣ^{−1/2}}` because each
  block `P_k` commutes with the `L²`-orthogonal Helmholtz projection: the negative range holds, with
  constant `1`, in the abelian case.

*Needs:* 8.1 (homogeneous product bounds); 8.2 (for `σ = 1`), 8.3 (bounds, `ℓ²L¹` bound and decay); 9.1–9.4.

### 9.6 The Dichotomy Theorem

Prove (OhTataru-YMHF Theorem 6.1, lines 2562–2589, with Lemmas 6.2–6.5, lines 2605–2786): for `a ∈ Ḣ¹`,
either `s₀(a) = ∞` and `Q(a) < ∞`, or there are heat-times `s_n ↗ s₀(a)`, points `x_n ∈ ℝ⁴`,
scales `r_n > 0` with `r_n² ≤ s_n` (and `r_n → 0` when `s₀(a) < ∞`), `s`-independent gauge transformations
`O_n ∈ G^{2,2}_loc(ℝ⁴)` and a nontrivial finite-energy harmonic Yang–Mills connection `Q` such that
`O_n·A^(n) → Q` and `Ad(O_n)F[A^(n)] → F[Q]` in
`L²_loc(ℝ⁴ × [−1, 0])`, where
`A^(n)(s,x) = r_n A(s_n + r_n²s, x_n + r_n x)` and `O_n` acts in the rescaled spatial coordinate.
The source also asserts `x_n → x₀`; its proof locates the concentration cubes
without showing that their centres converge, and the statement above omits that clause.

**Checks.**

- Small energy `ℰ_e(a) ≤ ε`: the first alternative holds (9.4), consistent with `ℰ_e(Q) ≥ E_GS > ε` for any
  bubble.
- A bubble satisfies `ℰ_e(Q) ≤ ℰ_e(a)`, by the energy identity and lower semicontinuity.

*Needs:* 4.1, 7.1, 7.2, 9.1–9.4.

### 9.7 The Threshold Theorem

Prove (OhTataru-YMHF Theorem 6.6, lines 2833–2837, proof lines 2852–2990): for noncommutative `G` and every
`E < 2E_GS` there is `Q_E < ∞` such that every `a ∈ Ḣ¹(ℝ⁴)` with `ℰ_e(a) ≤ E` has `s₀(a) = ∞` and
`Q(a) ≤ Q_E`. Route: a contradiction argument with a sequence of data, interval selection by the energy
identity, extraction of a nontrivial harmonic bubble as in 9.6, which has energy `< 2E_GS` and hence
`|χ| = ℰ_e ≥ E_GS` by 7.7, against `χ = 0` on `Ḣ¹` (6.3) and the balance of characteristic integrals between a bubble and its exterior.
Precisely, local strong `L²` curvature convergence gives convergence of the integral on each
fixed ball. Since every rescaled time slice has total `χ = 0`, its exterior carries the negative
of that integral. The pointwise Bogomol’nyi inequality on the exterior therefore gives
`E ≥ ℰ_e(Q) + |χ(Q)| ≥ 2E_GS` as the ball exhausts `ℝ⁴`
(OhTataru-YMHF line 2942–2988); local convergence does not preserve the total characteristic number.

**Checks.**

- `G = SU(2)`: the threshold is `16π²`; `Ḣ¹` data with energy below `16π²` flow globally to a flat limit.
- The `Ḣ¹` hypothesis is needed: the BPST connection has `ℰ_e = 8π² < 2E_GS` and is a static solution with
  infinite caloric size (9.4, Checks); it lies in the class `c₂ = 1`, not in `Ḣ¹`.
- Commutative `G` is excluded by the hypothesis; there every `a ∈ Ḣ¹` flows globally (9.3, Checks).

*Needs:* 6.3, 7.7, 9.4, 9.6.

### Examples

The abelian flow as the Helmholtz splitting followed by the heat equation; the static BPST solution
with infinite caloric size; the threshold `16π²` for `SU(2)`.

### Dependencies

Layers 1 (1.3), 8; Layers 4, 6 and 7 for 9.6–9.7; PDE §1.4 (9.2), §6.3; §8.1 supplies the homogeneous product bounds of 9.5.

## Layer 10: the caloric gauge and the caloric manifold

### 10.1 Flat `Ḣ¹` connections are pure gauges

Prove (OhTataru-YMHF line 552–560 and 584–592, Lemma 7.3, lines 3163–3211; OhTataru-TopClass Lemma 3.17,
lines 1487–1496): for flat `a ∈ Ḣ¹(ℝ⁴)` there is `O ∈ G^{2,2}_loc(ℝ⁴)` with `O·a = 0`, i.e. `a = O⁻¹∂_x O`, and
then `O;x = Ad(O)a ∈ Ḣ¹`; `O` is unique up to left multiplication by a constant; if `a ∈ ℋ`, `O` is
continuous with a limit at infinity and is normalised by `lim_{x→∞} O(x) = 1`. With `c^p_{jk} = ‖P_j Ad(O) P_k‖_{L^p→L^p}`,
`2 ≤ p < ∞`: `c^p_{jk} ≲_{‖O⁻¹∂_x O‖_{Ḣ¹}} 2^{−(4/p)|j−k|}`, and `c^p_{jk} ≲ 2^{(4/p)(k−j)} c_j` for `k < j − C` when `c_k` is a
`(−1, S)` envelope for `O⁻¹∂_x O` in `Ḣ¹`. Route: §4.1 on balls gives zero
Coulomb potentials; their constant transition maps trivialise on the simply connected
space `ℝ⁴`, giving the global gauge as in §3.3. §4.3 gives continuity under the local
restriction-Besov hypothesis, obtained from the flat div–curl system when `a ∈ ℋ`
(OhTataru-TopClass Lemma 3.16, lines 1474–1484; OhTataru-YMHF lines 3053–3071).

**Checks.**

- `G = U(1)`, `a = i∇φ` with `∇φ ∈ Ḣ¹`: `O = exp(iφ)` up to a constant.
- `a = 0`: `O` is constant, and normalised to `1`.

*Needs:* 3.3, 4.1, 4.3, 8.1.

### 10.2 Caloric connections and the caloric gauge

For the normalised gauge use the real Banach space `𝔘` of matrix-valued functions
`U ∈ C₀(ℝ⁴; M_N(ℂ))` whose distributional derivative belongs to `Ḣ¹`, with norm
`‖U‖_∞ + ‖∂U‖_{Ḣ¹}`. Here `C₀` means continuous and tending to zero at infinity.
Prove completeness by passing to uniform limits and weak derivatives, and continuity of
its inclusion into bounded continuous functions and of its derivative map into `Ḣ¹`.
A gauge normalised by `O(∞) = 1` is represented by `O − 1 ∈ 𝔘`;
Fréchet differentiability below is into this ambient Banach space, with the additional
pointwise condition `1 + U ∈ G`, rather than into an uncharted set of gauges
(OhTataru-YMHF lines 3033–3078).

Define a caloric connection as `a ∈ Ḣ¹` with `Q(a) < ∞` and `A_∞ = 0`; `𝒞` as the set of caloric
connections and `𝒞_Q = {a ∈ 𝒞 : Q(a) ≤ Q}`; the orbit pseudometric `d(a₁, a₂) = inf_{c∈G} ‖Ad(c)a₁ − a₂‖_{Ḣ¹}`,
which is a metric on the quotient by constant conjugations; and
`Cal(ã) = O·ã` with `O` given by 10.1 for `ã_∞` (OhTataru-YMHF Definitions 2.17 and 7.1, lines 564–574 and
3000–3001, and lines 3280–3282). Prove (Proposition 7.2, lines 3003–3008; Theorem 2.18, lines 571–574;
Proposition 7.4, Corollary 7.6, lines 3213–3278; Theorem 2.20, lines 591–592):

- every `ã ∈ Ḣ¹` with `Q(ã) < ∞` is gauge equivalent to a caloric connection `Cal(ã)`, unique up to constant
  gauge transformations; `Q` and `ℰ_e` are unchanged;
- `ã ↦ Cal(ã)` is continuous from `{ã ∈ Ḣ¹ : Q(ã) < ∞}` to `Ḣ¹` modulo `Ad(G)` with the distance `d`, and
  continuously Fréchet differentiable from the open set `Ω_X = {ã ∈ X : Q(ã) < ∞}` to `X`,
  for `X = ℋ` and `X = ℋ ∩ Ḣ^σ`, `σ > 1`, with the normalisation `O(∞) = 1`;
  the map `ã ↦ O(ã) − 1 : Ω_ℋ → 𝔘` is continuously Fréchet differentiable;
- for noncommutative `G` and `ℰ_e(ã) < 2E_GS` the caloric representative exists for every `ã ∈ Ḣ¹`;
- an `Ḣ¹` envelope of `ã` is an envelope of `Cal(ã)`: `‖P_j Cal(ã)‖_{Ḣ¹} ≲_{Q, M₁} c_j`.

`𝒞` is dilation invariant; the heat flow of a caloric connection stays caloric.

For the Fréchet assertions, put `q = A_∞(ã)` and let `b ∈ ℋ`.
The flat div–curl system improves `q` to `ℓ¹Ḣ¹` (OhTataru-YMHF lines 3053–3057).
With `B_∞ = L_ℋ(ã)b`, solve
`Δ_q ψ = D(q)^j B_{∞,j}`, `ψ ∈ ℓ¹Ḣ² ⊂ C₀`, by §8.2.
Prove `D(q)ψ = B_∞` and the derivative formulas
`dO[ã]b = Oψ` and
`dCal[ã]b = Ad(O)(b − B_∞ + [ψ, ã − q])` (lines 3065–3078).
Use the operator-norm continuity in §9.5 and the elliptic resolvent identity
`Δ_q⁻¹ − Δ_q'⁻¹ = Δ_q⁻¹(Δ_q' − Δ_q)Δ_q'⁻¹`, together with §8.1's products,
to prove operator-norm continuity of `b ↦ Oψ` into `𝔘` and of `b ↦ dCal[ã]b` into `ℋ`.
The divergence component of the latter is estimated in `ℓ¹L²` as in lines 3082–3086;
the extra `Ḣ^σ` norm uses the higher-regularity bounds of §9.4.
Integration along short segments then supplies the Fréchet remainder in each stated norm,
as in §9.5. This is a Banach-space derivative assertion, including continuity in operator norm.

**Checks.**

- The zero function lies in `𝔘` with norm `0`; for `a = 0` the normalised gauge is `1`,
  represented by `O − 1 = 0`. A nonzero constant matrix has derivative `0` but fails the
  limit at infinity and is excluded from `𝔘`.
- A smooth compactly supported matrix function `U = φM` lies in `𝔘` with norm
  `‖φM‖_∞ + ‖∂(φM)‖_{Ḣ¹} < ∞`. Taking `M = 1` and `φ ≥ 0` positive somewhere gives
  `1 + U ∉ U(N)` there, since its norm on vectors is `1 + φ > 1`: the ambient space
  does not itself impose the group-valued condition.
- For `G = U(1)` and real `φ ∈ C_c^∞`, the flat input `ã_t = it dφ` has
  `O_t = exp(itφ)` and `Cal(ã_t) = 0`; at `t = 0`, `ψ = iφ`,
  `dO = iφ`, `dCal = i dφ − i dφ = 0`. The opposite sign for `ψ` would give `2i dφ`.

- `G = U(1)`: `Cal(ã) = ã − ∇φ`, the divergence-free part; caloric means `∂^ℓ a_ℓ = 0`.
- Pure gauge data `ã = −O;x`: `Cal(ã) = 0`.
- `d(Ad(c)a, a) = 0` for every constant `c`, so `Cal` is defined only up to `Ad(G)` until `O(∞) = 1` is imposed.

*Needs:* 8.1 (homogeneous products), 8.2 (elliptic inverse); 7.7, 9.4, 9.5 (Fréchet regularity and operator-norm continuity), 9.7, 10.1.

### 10.3 Caloric connections lie in `ℋ`

Prove (OhTataru-YMHF Proposition 7.7, lines 3286–3290, from Lemma 5.30, line 2419–2423;
OhTataru-Threshold Theorem 2.8, lines 912–917): for `a ∈ 𝒞_Q` with `ℰ_e(a) ≤ E`, its heat flow satisfies
`‖A‖_{Ḣ¹} + ‖∂^ℓ A_ℓ‖_{ℓ¹L²} + ‖∇(∂^ℓ A_ℓ)‖_{L^{4/3}} ≲_{Q,E} 1` uniformly in `s`, that is a uniform bound
in `ℓ¹L² ∩ Ẇ^{1,4/3}` with the homogeneous gradient seminorm on the `L²` function `∂^ℓ A_ℓ`; in
particular `𝒞 ⊆ ℋ`. Route: the `Ḣ¹` bound is the global covariant bound of 9.2 on `[0, ∞)`, and the
divergence bounds integrate `∂_s ∂^ℓ A_ℓ = −[A_ℓ, D^j F_{jℓ}]` (OhTataru-YMHF line 2434) in heat time between
`s` and `∞`, where `∂^ℓ A_ℓ → 0` because the flat limit of a caloric connection is `0` (9.5). Proposition
7.7 prints the inhomogeneous `W^{1,4/3}` (line 3288), whereas the Lemma 5.30 it invokes bounds the
homogeneous `Ẇ^{1,4/3}` (line 2423); the inhomogeneous bound is false (Checks).

**Checks.**

- `G = U(1)`: `∂^ℓ a_ℓ = 0` for `a ∈ 𝒞`, and the bound reduces to `‖a‖_{Ḣ¹} ≲ ℰ_e(a)^{1/2}`, since for divergence-free
  `a = iα`, `ℰ_e(a) = ∫ |∇α|² − ∫ (∂^ℓ α_ℓ)² = ‖∇α‖²_{L²}` (inner product `⟨ix, iy⟩ = xy`).
- Dilation: `a_λ = λa(λ·)` is caloric with the same `ℰ_e` and `Q`, and `h = ∂^ℓ a_ℓ` becomes
  `h_λ = λ²h(λ·)`. Then `‖∇h_λ‖_{L^{4/3}} = ‖∇h‖_{L^{4/3}}` and, for `λ = 2^m`, `‖h_λ‖_{ℓ¹L²} = ‖h‖_{ℓ¹L²}`,
  while `‖h_λ‖_{L^{4/3}} = λ^{−1}‖h‖_{L^{4/3}}`, which is unbounded as `λ = 2^{−m} → 0` unless `h = 0`. So no
  bound by `Q` and `E` controls the inhomogeneous `W^{1,4/3}` norm of a caloric connection with nonzero
  divergence.
- Such connections exist for `G = SU(2)`: for small divergence-free data `εu`, the divergence of the caloric
  representative is `ε² ∫₀^∞ [e^{sΔ}u_ℓ, Δe^{sΔ}u_ℓ] ds + O(ε³)`, by integrating the identity of the route
  with `A(s) = εe^{sΔ}u + O(ε²)`. For `u` the sum of two plane-wave packets with frequencies near `ξ = e₁` and
  `η = 2e₁`, polarisation `e₂` and Lie coefficients `i` and `j`, the component at frequency `ξ + η` has symbol
  `(|ξ|² − |η|²)/(|ξ|² + |η|²)[i, j] = (1 − 4)/5 · 2k = −6k/5 ≠ 0`. In the abelian case the bracket vanishes,
  `h = 0`, and the two norms cannot be told apart.

*Needs:* 9.2, 9.4, 9.5, 10.2.

### 10.4 The caloric manifold

Define a `C¹` split submanifold of a real Banach space `𝔅` as a subset `S` such that every `a ∈ S` has an open
neighbourhood `U`, a closed subspace `E ⊆ 𝔅` with `Submodule.ClosedComplemented`, an open `V ⊆ E` and a chart
`φ : V → 𝔅` with image `S ∩ U` that is a `C¹` smooth embedding in Mathlib's sense,
`Manifold.IsSmoothEmbedding 𝓘(ℝ, E) 𝓘(ℝ, 𝔅) 1 φ`, where `V` is charted as an open subset of `E`
(`TopologicalSpace.Opens.instChartedSpace`). That is, `φ` is a topological embedding and a `C¹` immersion
(`Manifold.IsImmersion`): there is one Banach space `F` such that near each `v ∈ V` some `C¹` charts of `V` and of
`𝔅` write `φ` as `u ↦ (u, 0)` through an isomorphism `E × F ≅ 𝔅`. The tangent space at `a = φ(v)` is the range
of `Dφ(v)`. Prove:

- at every point the derivative of a chart has a continuous left inverse (Mathlib
  `Manifold.IsImmersion.isDiffImmersionAt`; on an open subset of `E` the manifold derivative is the Fréchet
  derivative), so the tangent space is a closed complemented subspace isomorphic to `E`;
- conversely, a `C¹` map `φ` on a connected open `V ⊆ E` that is a homeomorphism onto its image, with `Dφ(v)`
  injective of closed complemented range for every `v`, is a `C¹` smooth embedding: at `v₀`, with
  `𝔅 = Dφ(v₀)E ⊕ F`, the map `(u, w) ↦ φ(u) + w` on `V × F` has invertible derivative at `(v₀, 0)`, so its local
  inverse is a `C¹` chart of `𝔅` (Mathlib `ContDiffAt.toOpenPartialHomeomorph`, `ContDiffAt.to_localInverse`) in
  which `φ` reads `u ↦ (u, 0)`; that chart serves every point near `v₀`, with `F ≅ 𝔅/Dφ(v)E` there, so the
  isomorphism class of the cokernel is locally constant, hence constant on connected `V`, and one `F` serves all
  of `V`;
- the tangent space does not depend on the chart: for charts with `φ₁(v₁) = φ₂(v₂) = a`, the map `φ₂⁻¹ ∘ φ₁` near
  `v₁` is `φ₁` followed by a normal-form chart of `φ₂` and the projection `E₂ × F₂ → E₂`, hence `C¹`, so
  `Dφ₁(v₁)E₁ ⊆ Dφ₂(v₂)E₂`, and symmetrically.

Prove (OhTataru-YMHF Theorem 7.8, lines 3294–3346): `𝒞` is a `C¹` split submanifold of `ℋ`, with the chart at `a`
given by `b ↦ Cal(a + b)` on a ball around `0` in the covariant Coulomb slice `E_a = {b ∈ ℋ : D(a)^ℓ b_ℓ = 0}`
(lines 3301–3306). Route: `C¹` regularity from 10.2. Let `Δ_a⁻¹` be the solution operator of 8.2 on `ℓ¹L²` and
`𝒢_a = D(a)Δ_a⁻¹(ℓ¹L²)` the gauge directions. By 8.2, Hölder with `ℓ¹Ḣ² ⊂ L^∞` and the product bound
`‖[u, v]‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` on `ℝ⁴` (§8.1), `‖D(a)Δ_a⁻¹f‖_ℋ ≲ ‖f‖_{ℓ¹L²}` and `D(a)^ℓ h_ℓ ∈ ℓ¹L²` for `h ∈ ℋ`, so
`Ph = h − D(a)Δ_a⁻¹(D(a)^ℓ h_ℓ)` is a bounded projection of `ℋ` onto `E_a` with kernel `𝒢_a`. The derivative of the
chart at `0` is `Lb = b − D(a)c`, `c = dO(0)b` (lines 3315–3321), and `c = Δ_a⁻¹(Δ_a c)` with
`Δ_a c = −D(a)^ℓ(Lb)_ℓ ∈ ℓ¹L²`: both vanish at infinity (`O(∞) = 1`; `ℓ¹Ḣ² ⊂ C₀` by Bernstein), and a solution `z`
of `Δ_a z = 0` vanishing at infinity has `Δ|z|² = 2|D(a)z|² ≥ 0`, so `z = 0` by the weak maximum principle on large
balls (PDE §3.2). Hence `PL = id`: `L` is bounded below and its range is closed and complemented by `𝒢_a`. The
construction of the second item at `0` puts the chart in normal form on a ball, where it is a `C¹` immersion with
continuous inverse; local surjectivity, which makes its image `𝒞 ∩ U` for an open `U ∋ a`, by gauge-transforming
the segment to a nearby caloric connection into the slice, solving `D^k D_k O;h = …` in `ℓ¹Ḣ²` (lines 3327–3346).
No regularity beyond `C¹` is asserted (lines 3295–3296).

**Checks.**

- `G = U(1)`: `𝒞 = {a ∈ Ḣ¹ : ∂^ℓ a_ℓ = 0}` is a closed linear subspace of `ℋ` and equals every slice `E_a`; the
  chart is `b ↦ a + b` (so `c = 0` and `L` is the inclusion), `𝒢_a` is the gradients
  `{∇φ : ∇φ ∈ Ḣ¹, Δφ ∈ ℓ¹L²}`, and `P` is the Leray projection `h ↦ h − ∇Δ⁻¹∂^ℓ h_ℓ`.
- The unit sphere of a Hilbert space `𝔅` is a `C¹` split submanifold of codimension one: at `e` the chart
  `v ↦ (e + v)/‖e + v‖` on `e^⊥` is a homeomorphism onto the open hemisphere where `⟨y, e⟩ > 0`, with inverse
  `y ↦ (y − ⟨y, e⟩e)/⟨y, e⟩`, and in the chart `y ↦ (y − ⟨y, e⟩e)/⟨y, e⟩ + (‖y‖ − 1)e` of `𝔅` on `{⟨y, e⟩ > 0}`
  (inverse `v + te ↦ (1 + t)(e + v)/‖e + v‖`, `t > −1`) it reads `v ↦ v`, the normal form `u ↦ (u, 0)` for
  `𝔅 = e^⊥ ⊕ ℝe`; its derivative at `0` is the inclusion of `e^⊥`.
- Differentiability along curves does not give the chart's Fréchet `C¹` regularity:
  for `N(u) = sin u` on `L²(0,1)`, the sequence `u_n = π1_{(0,1/n)}` has norm
  `π/√n → 0` but derivative operators at distance `2` from the derivative at `0`,
  and relative linearisation error `1` (§9.5, Checks). The operator-norm condition of
  §§9.5–10.2 excludes this model before the inverse function theorem is used.
- The cross `{x₁² = x₂²}` in `ℝ²` is not one: removing `0` from a small neighbourhood of `0` in it leaves four
  components, while removing a point from a connected open subset of a line leaves two and of the plane one, and a
  neighbourhood is not a point; so no chart exists at `0`.
- The graph of `|x₁|` in `ℝ²` is a topological but not a `C¹` split submanifold, and it separates the definition
  from "a `C¹` homeomorphism onto `S ∩ U`": `t ↦ (t³, |t|³)` is `C¹` and a homeomorphism of `ℝ` onto the graph, but
  its derivative vanishes at `0`. No chart is an immersion at `0`: the graph has empty interior and no isolated
  points, so `E` is a line, and a `C¹` map `t ↦ (x(t), |x(t)|)` with `x(t₀) = 0` has `x'(t₀) = 0` (else `|x|` has a
  corner at `t₀`), and then `|x|`, minimal at `t₀`, has derivative `0` there, so `Dφ(t₀) = 0`, against the first
  item.

*Needs:* Mathlib `Submodule.ClosedComplemented`, `ContDiff`, `Manifold.IsSmoothEmbedding`, `Manifold.IsImmersion`
with `Manifold.IsImmersion.isDiffImmersionAt`, `TopologicalSpace.Opens.instChartedSpace`,
`ContDiffAt.toOpenPartialHomeomorph`, `ContDiffAt.to_localInverse`; PDE §3.2 (weak maximum principle);
8.1 (homogeneous product bounds), 8.2, 10.2, 10.3.

### 10.5 Tangent spaces and the nonlinear div–curl decomposition

For `a ∈ 𝒞` let `B` solve the linearised flow (5.23) around the heat flow of `a` with `B(0) = b`. Prove
(OhTataru-YMHF Definition 2.21, lines 604–610, lines 3347–3361, Proposition 7.9 and Theorem 2.22,
lines 3363–3385 and 613–619):

- the tangent space of 10.4 is `T_a𝒞 = {b ∈ ℋ : B(∞) = 0}`, and the closure of `T_a𝒞 ∩ L²` in `L²` is
  `T^{L²}_a𝒞 = {b ∈ L² : B(∞) = 0}`, with `T^{L²}_a𝒞 ∩ D(a)Ḣ¹ = {0}`;
- every `w ∈ L²` decomposes uniquely as `w = b − D(a)c` with `b ∈ T^{L²}_a𝒞` and `c ∈ Ḣ¹`, with
  `‖b‖_{Ḣ^σ} + ‖c‖_{Ḣ^{σ+1}} ≲_{Q,E} ‖w‖_{Ḣ^σ}` for `−1 < σ < 1` and `‖b‖_ℋ + ‖c‖_{ℓ¹Ḣ²} ≲_{Q,E} ‖w‖_ℋ`, for
  `a ∈ 𝒞_Q` of energy `≤ E`;
- `c = −Δ⁻¹∇·w + L(a, w)` with `L(a, ·)` linear, `L(0, ·) = 0` and
  `‖L(a, w)‖_{ℓ¹Ḣ^{σ+1}} ≲_{Q,E} ‖w‖_{Ḣ^σ}`;
- the projection `Π_a w = b` is bounded on `L²` with range `T^{L²}_a𝒞` and kernel `D(a)Ḣ¹`.

Route for the `Ḣ^σ` bound, `−1 < σ < 1` (OhTataru-YMHF line 3381–3385): `‖a‖_{Ḣ¹} ≲_{Q,E} 1` by 10.3. Solve
(5.23) with data `w`. By 9.5 its limit `W(∞)` exists in `Ḣ^σ` with `‖W(∞)‖_{Ḣ^σ} ≲_{Q,E} ‖w‖_{Ḣ^σ}`, and it is
curl-free because `A_∞ = 0` for caloric `a`. So `W(∞) = −∇c` with `c = −Δ⁻¹∂^ℓW(∞)_ℓ` and
`‖c‖_{Ḣ^{σ+1}} ≈ ‖W(∞)‖_{Ḣ^σ}`. Put `b = w + D(a)c`. The linearised flow of `D(a)c` is `D(A(s))c`, by the
residual freedom of 9.1, and it tends to `∇c`, so the flow of `b` tends to `W(∞) + ∇c = 0`. Finally `[a, c]`
is bounded in `Ḣ^σ` by §8.1's homogeneous product bound.

Define the bundle of caloric initial data sets `T^{L²}𝒞 = {(a, b) ∈ ℋ × L² : a ∈ 𝒞, b ∈ T^{L²}_a𝒞}`
(OhTataru-Threshold line 920–925), equal to `{(a, Π_a w) : a ∈ 𝒞, w ∈ L²}`.

**Checks.**

- `G = U(1)`: `T^{L²}_a𝒞` is the divergence-free `L²` fields, `Π_a` is the Leray projection, `c = −Δ⁻¹∇·w` and
  `L = 0`.
- `w = D(a)c₀` with `c₀ ∈ Ḣ¹`: `b = 0` and `c = −c₀`, so `Π_a` kills the linearised gauge directions.
- `w ∈ T^{L²}_a𝒞`: `c = 0` and `Π_a w = w`.

*Needs:* 8.1 (homogeneous product bounds), 8.2, 9.1, 9.5, 10.2–10.4.

### Examples

The abelian case, in which caloric means Coulomb, `𝒞` is a closed subspace and `Π_a` is the Leray
projection; pure gauges, which `Cal` sends to `0`.

### Dependencies

Layers 8–9; Layers 3–4 for 10.1; Layer 7 for the subthreshold existence of `Cal`; §8.1 for the homogeneous product bounds in 10.4–10.5; PDE §3.2 for the uniqueness step of 10.4.

## Downstream consumers

- A roadmap for the hyperbolic Yang–Mills equation on `ℝ^{1+4}` consumes every layer: finite-energy and
  caloric initial data sets (Layers 5, 10), the instanton number and the ground state (Layers 6–7), the
  heat flow and the dynamic flow (Layer 9), and the caloric manifold with `Π_a` (Layer 10), for the
  Threshold Theorem below `2E_GS` and the Dichotomy Theorem in an arbitrary topological class
  (OhTataru-Threshold line 428–447; OhTataru-CaloricLWP; OhTataru-YMHF Sections 8–9;
  OhTataru-TopClass Section 1.5). It owns the generalised Coulomb condition and the heat-flow bounds
  for linearised caloric data (OhTataru-YMHF §§7.3–7.5).
- A roadmap for the Yang–Mills heat flow on closed manifolds in dimensions two to four
  (Rade-YMHeat Theorems 1–2, lines 212–223; GurskyKelleherStreets-GapTheorem Corollary 1.3, lines 117–123)
  can reuse the covariant flows, the energy identity and the energy gap of Layers 7 and 9.

## References

- `OhTataru-YMHF`: S.-J. Oh, D. Tataru, *The Yang–Mills heat flow and the caloric gauge*, read as
  arXiv:1709.08599v2; published in Astérisque 436 (2022).
- `OhTataru-TopClass`: S.-J. Oh, D. Tataru, *The hyperbolic Yang–Mills equation for connections in an
  arbitrary topological class*, Comm. Math. Phys. 365 (2019), read as arXiv:1709.08604v2.
- `OhTataru-Threshold`: S.-J. Oh, D. Tataru, *The threshold conjecture for the energy critical hyperbolic
  Yang–Mills equation*, Ann. of Math. 194 (2021), read as arXiv:1709.08606v2.
- `OhTataru-CaloricLWP`: S.-J. Oh, D. Tataru, *The hyperbolic Yang–Mills equation in the caloric gauge*,
  Pure Appl. Anal. 2 (2020), read as arXiv:1709.09332v2.
- `GurskyKelleherStreets-GapTheorem`: M. Gursky, C. L. Kelleher, J. Streets, *A conformally invariant gap
  theorem in Yang–Mills theory*, Comm. Math. Phys. 361 (2018), read as arXiv:1708.01157v3.
- `Uhlenbeck-LpCurvature`: K. K. Uhlenbeck, *Connections with Lᵖ bounds on curvature*, Comm. Math. Phys. 83
  (1982), Theorem 1.3; cited by locator.
- `Uhlenbeck-RemovableSingularities`: K. K. Uhlenbeck, *Removable singularities in Yang–Mills fields*,
  Comm. Math. Phys. 83 (1982), Theorem 4.1; cited by locator.
- `Rade-YMHeat`: J. Råde, *On the Yang–Mills heat equation in two and three dimensions*, J. reine angew.
  Math. 431 (1992).
- `FreedUhlenbeck-Instantons`: D. S. Freed, K. K. Uhlenbeck, *Instantons and Four-Manifolds*, 2nd ed.,
  Springer 1991, Ch. 1–3; cited by locator.
- `DonaldsonKronheimer`: S. K. Donaldson, P. B. Kronheimer, *The Geometry of Four-Manifolds*, Oxford 1990,
  Ch. 2–4; cited by locator.
- `BahouriCheminDanchin-FourierAnalysis`: H. Bahouri, J.-Y. Chemin, R. Danchin,
  *Fourier Analysis and Nonlinear Partial Differential Equations*, Springer 2011,
  §2.3 (Definition 2.15 and the completeness theorem) and §2.6 (homogeneous paradifferential calculus);
  cited by locator.
- `Bogomolnyi-Stability`: E. B. Bogomol'nyi, *The stability of classical solutions*, Sov. J. Nucl. Phys. 24
  (1976); cited by locator.
- `MimuraToda-TopologyLieGroups`: M. Mimura, H. Toda, *Topology of Lie Groups, I and II*, AMS 1991,
  Ch. IV–V; cited by locator.
