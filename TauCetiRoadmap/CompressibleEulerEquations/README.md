# Roadmap: compressible Euler equations, symmetric hyperbolic systems and maximal developments

**Summary.** Build the classical theory of the compressible Euler equations of a perfect fluid
on the Galilean spacetime `𝔐 = ℝ_t × E`, `E = ℝⁿ`, `n ≥ 1`, with the partially periodic
carriers `ℝ × (ℝ/2πℤ)^{n−1}` treated as periodic lifts. From Mathlib's calculus, measure theory
and ODE theory, Tau Ceti's whole-space Sobolev spaces, LorentzianGeometry's acoustical form and
its causal curves and domains of dependence inside subsets, and SymmetricHyperbolicSystems'
linear systems, the roadmap constructs: the barotropic and the full (entropy-carrying) Euler
systems with a general smooth equation of state; a general carrier for first-order quasilinear
symmetric hyperbolic systems, with the Euler systems as instances through explicit
symmetrisers; the identification of the null covectors of the acoustical form of a state with
the sound sheet of the Euler symbol; for continuous sound-cone fields on relatively open subsets
of a half-space, limit curves, compact causal pasts and open, idempotent future domains of
dependence; the `Hᵏ` calculus on partially periodic carriers (Gagliardo–Nirenberg, Moser
product, commutator and composition estimates, Friedrichs mollifiers); the Friedrichs energy
method for linear symmetric hyperbolic systems in the periodic Sobolev spaces, including
weighted energies with characteristic-monotone Lipschitz weights; local uniqueness on lens-shaped domains and
uniqueness on domains of dependence; local well-posedness in `Hᵏ`, `k > n/2 + 1`, with
continuous dependence and the continuation criterion; and the theory of developments of
Cauchy data. The end theorems are the local well-posedness of compressible Euler for
non-vacuum `Hᵏ` data, uniqueness on lens-shaped domains, the uniqueness, compatibility and
existence theory of developments (any two developments of the same data have a largest
common development below both, and are compatible exactly when they have a common upper
bound; every development lies below a maximal one; if the data extend to a classical solution
on the whole future half-space, the maximal development is unique), and the nullity of the
regular boundary of every maximal development. The classical claim that all developments of
the same data agree on their common domain is false for compressible Euler on a fixed Galilean
background; the roadmap states the correct uniqueness theorems and records an explicit
counterexample.

## Scope and ownership

This roadmap owns:

- the equations of state with positive sound speed, the barotropic and the full compressible
  Euler systems in material and conservative form, their Galilean invariance and the
  constant-entropy reduction;
- quasilinear symmetric hyperbolic systems on an open set of states as a carrier, their
  principal symbol, round cones dominating the characteristic speeds, and the symmetrisers that
  make both Euler systems instances;
- for the acoustical form `g = −c² dt² + Σᵢ (dxⁱ − vⁱ dt)²` of a state on `ℝ × E`: its
  determinant, its Galilean covariance, the explicit classification of its covectors and the
  identification of its null covectors with the sound sheet of the characteristic variety of
  the Euler symbol (the material sheet `ζ₀ + v·ζ′ = 0`, `ζ′ ≠ 0`, is characteristic when its
  multiplicity is positive but is never null, and it is absent for the barotropic system with
  `n = 1`); for sound-cone fields continuous on a subset of a half-space: the integral
  characterisation, local existence and limit-curve compactness of time-parametrised causal
  curves, past-inextendible extensions, causal pasts, compactness of causal pasts in domains of
  dependence, openness and idempotence of future domains of dependence of relatively open data,
  bounded slabs, past-closed restriction and Galilean covariance;
- Sobolev spaces `Hᵏ_Λ` of Λ-periodic functions for a discrete period group `Λ ⊆ E`, their
  embeddings, the Gagliardo–Nirenberg interpolation inequality, Moser estimates and Friedrichs
  mollifiers;
- energy identities and estimates for linear symmetric hyperbolic systems in the Sobolev class
  on `E/Λ`, weighted energies with characteristic-monotone Lipschitz weights and moving cones,
  linear existence in `Hᵏ_Λ`, local well-posedness of the quasilinear Cauchy problem in `Hᵏ_Λ`,
  uniformly local data, and the Euler instances;
- local uniqueness on lens-shaped domains and uniqueness on domains of dependence for
  quasilinear symmetric hyperbolic systems;
- initial data sets with an open data domain, developments, their order and compatibility, the
  maximal common development, maximal developments, the largest development inside a given
  solution, and the null character of the regular part of the boundary of a maximal development.

Boundaries:

- **Mathlib and Tau Ceti** supply everything below this roadmap. The whole-space identification
  `Hᵏ = Wᵏ'²` and the embedding `Hᵏ(ℝⁿ) ⊆ C₀(ℝⁿ)` for `2k > n`, which the PDE roadmap lists
  among its §1.3–§1.4 material, are already pinned Tau Ceti declarations and are cited from
  Tau Ceti directly; nothing else of the PDE roadmap is consumed. Tau Ceti also has nine special
  cases of Layer 4. On `ℝⁿ` and its open subsets: the product on `W^{1,p}(ℝⁿ)` for `p > n` (at
  `p = 2`, the case `n = k = 1`, `Λ = 0` of the algebra property), the scalar weak chain rule for a
  `C¹` function with bounded derivative, the additive interpolation inequality on `W^{2,p}(E)`,
  and the interior embedding `W^{k+j,2}(Ω) ⊆ Cʲ(Ω)` for `2k > n`, without a bound. On the circle
  (`n = 1`, `Λ = Tℤ`, complex values): the continuous representatives of
  `TauCeti.CircleSobolev s A` for `s > 1/2`, the algebra property of that space, the action of
  holomorphic functions on it, the derivative `H^{s+1} → H^s`, and, for `s > 1/2`, the
  differentiability of the continuous representative of an element of `H^{s+1}`, with the
  representative of its derivative as derivative. §§4.1–4.3 state the general forms, and the
  supplier contracts say how each differs. The commutation `∂^αJ_εu = J_ε∂^αu` of a mollifier
  with weak derivatives is already pinned for every smooth compactly supported kernel
  (`TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right`); §4.4 consumes it and does not
  restate it. Every statement of the PDE
  roadmap is scalar (elliptic, parabolic and dispersive theory, with the dyadic analysis of its
  Layer 7); it plans no hyperbolic system and no Moser estimate in `Hᵏ` (the product bounds of its
  §7.3 are paraproduct estimates in the Hölder–Zygmund spaces `𝒞^s`). Its §7.1–§7.2 plan the
  periodic Besov spaces on `𝕋^d = ℝ^d/ℤ^d` by Fourier series; their case `p = q = 2`, integer
  `s = k`, is `Hᵏ_Λ` for a full-rank `Λ` after a linear change of variable (`y = x/2π` for
  `Λ = (2πℤ)^n`), up to norm equivalence. The spaces `Hᵏ_Λ` here are for discrete period groups of
  every rank, nothing here uses the full-rank case, and the norm comparison is a Check of §4.1.
- **Lorentzian geometry** is LorentzianGeometry's, and this roadmap imports what it uses of it.
  LorentzianGeometry §7.3 owns the acoustical form on `ℝ × Σ` (the form, its inverse, the
  material vector `B`, causal vectors, its Lorentzian character and the time orientation `[B]`),
  §6.1 the Minkowski form (and §7.3's first Check the frame carrying the acoustical form of
  constant `c`, `v` to it), and §6.3 the causal type of hyperplanes through the sign of the
  inverse form; §8.2 owns locally Lipschitz causal curves, their restriction and concatenation
  and the passage from piecewise `C¹` curves; §12.6 owns causal curves in an arbitrary subset,
  past-inextendibility, the future domain of dependence `D⁺_D(S)` in a subset, its monotonicity,
  the slice identity `D⁺_D(S) ∩ {t = t₀} = S ∩ D`, the reduction to time-parametrised curves,
  determination for data closed in an open set, and covering invariance. Sections 3.1–3.3 take
  these with `Σ = E` Euclidean and state only what LorentzianGeometry does not; each kept
  statement says how it differs. LorentzianGeometry's causal vectors are nonzero (its §7.3: a
  causal vector `X` has `dt(X) ≠ 0`), while the closed cone `g(X, X) ≤ 0` of §3.1 contains `0`;
  both give `g(0, 0) = 0`, and on time-parametrised curves, whose velocities `(1, ẋ)` never
  vanish, the two conventions agree. Null hypersurfaces are LorentzianGeometry's as well
  (§9.2 there); §8.4 states the nullity of a boundary through the conormal condition of §3.1
  (`dφ ≠ 0` a null covector), which is §9.2's equivalent form `g⁻¹(dφ, dφ) = 0`.
  LorentzianGeometry §12.7 proves, for a locally Lipschitz metric on a manifold without
  boundary, the limit curve theorem and the nullity of Cauchy horizons where they are `C¹`
  hypersurfaces; §3.2 (limit curves) and §8.4 each say how their statements differ. Null
  generators and geodesics of `C^{1,1}` metrics are LorentzianGeometry's and are not used here.
- **Linear symmetric hyperbolic systems with classical solutions** are
  SymmetricHyperbolicSystems'. Its §1.2 owns the linear system carrier `LinearSystem` and the
  predicate `LinearSystem.IsSymmetricHyperbolic`, §2.1 the pointwise energy identity, §2.2
  finite propagation speed for a single speed, §2.3 uniqueness of classical solutions and the
  integrated energy identity and `L²` estimate for classical solutions vanishing outside a
  bounded set, and §7.3 existence for smooth compactly supported data and `C_b^∞` coefficients.
  Layer 5 takes the carrier from its §1.2 and the pointwise identity from its §2.1, and states
  what it lacks: the energy identity and estimate in the Sobolev class on the quotient `E/Λ`
  (§5.1), weighted energies with Lipschitz weights, moving cones and periodic lifts (§5.2), and
  existence in `Hᵏ_Λ` (§5.4). Quasilinear systems and the `Hᵏ` theory are outside its scope and
  are owned here.
- **Characteristic initial data** (data on `S₀ ∪ C` with `C` a null hypersurface, its
  constraint and compatibility conditions), acoustical eikonal functions, the ruling of the
  characteristic boundary by null geodesics issuing from the edge of the data, and shock
  formation are not part of this roadmap; they are the subject of "Compressible Euler
  equations, Part II", which consumes this roadmap together with LorentzianGeometry for
  `C^{1,1}` geodesics and null generators. This roadmap stops at the nullity of the regular
  boundary.
- **Fractional orders.** Well-posedness is stated for integer Sobolev orders `k > n/2 + 1`,
  which is the generality of the cited theorems. Real orders `s > n/2 + 1` need the
  Kato–Ponce commutator estimates in Besov form, built on the paraproducts of the PDE roadmap's
  Layer 7; they are not part of this roadmap and belong to "Compressible Euler equations,
  Part II".
- **Incompressible flows** (the Leray projection, the incompressible Euler and Navier–Stokes
  equations) are not part of this roadmap. The spaces `Hᵏ_Λ` here are for discrete period
  groups of any rank; when `Λ` has full rank, a linear change of variable taking `Λ` to `ℤⁿ`
  identifies them, up to norm equivalence, with the integer-order `L²` Sobolev spaces of the
  unit-period torus `UnitAddTorus (Fin n)`; nothing here uses that case, and the norm comparison
  is a Check of §4.1. For `n = 1` and a full-rank `Λ = Tℤ`, `Hᵏ_Λ` is likewise Tau Ceti's
  `TauCeti.CircleSobolev k ℂ`, the Fourier-side Sobolev space of `AddCircle T`, restricted to
  real functions and up to norm equivalence; this case is not used here either, and the norm
  comparison is a Check of §4.1. Friedrichs' lemma of §4.4 is stated for period groups of every
  rank (`Λ = 0` and `Λ_cyl` included); after the change of variable `y = x/2π`, its case
  `Λ = (2πℤ)^n` is the case `p = ∞`, `L²` densities, of the DiPerna–Lions commutator estimate for
  transport by `W^{1,p}` fields on the unit torus.
- **Periodic Sobolev classes in statistics.** MathematicalStatisticsNonparametric §6.2
  characterises the periodic Sobolev classes `W^per(β, L)` on `[0, 1]`, integer `β`, as ellipsoids
  of Fourier coefficients. These are balls for the top-order seminorm in the case `n = 1`,
  `Λ = ℤ` of `Hᵏ_Λ`; §4.1 here defines the space and its norm for every `n` and every period
  group, and nothing of that roadmap is consumed.
- **Commutators with mollifiers on the Bessel scale.** ComplexKahlerGeometry §5.7 states, for a
  chart-localised second-order operator `P` with smooth matrix coefficients and a convolution
  regulariser `J_ε`, that `[P, J_ε]` is bounded from `H^r` to `H^{r−1}` uniformly for
  `0 < ε ≤ 1` and every real `r`, and, for a smooth compactly supported matrix `f`, the multiplier
  bound `‖fw‖_{H^s} ≤ sup‖f‖·‖w‖_{H^s} + C_{f,s}‖w‖_{H^{s−1}}`. Friedrichs' lemma of §4.4 is the
  first-order `L²` statement on `E/Λ` for a coefficient that is only bounded and Lipschitz, and
  the products of §4.3 are tame, with constants independent of the factors; the coefficients
  `Mⁱ(U)` of §5.3 are `C¹` but in general not smooth (`a = |sin x|` on `Λ = 2πℤ` is bounded,
  `1`-Lipschitz and periodic, so §4.4 applies to it, but it is not `C¹` at `0`). Neither
  statement gives the other, and nothing of that roadmap is consumed.
- **Flat finite propagation for Klein–Gordon** is RelativisticQuantumFieldTheory RQFT1; it is a
  second-order scalar statement on Minkowski space and is neither consumed nor restated.
- Vacuum boundaries `ρ = 0`, weak and entropy solutions, Riemann solvers and numerical schemes
  are outside the roadmap.

## Conventions

**Carrier.** `E` is `EuclideanSpace ℝ (Fin n)` with `n ≥ 1`; spacetime is `𝔐 = ℝ × E` with
points `(t, x)`; `Σ_t = {t} × E`; `H_{t₀} = [t₀, ∞) × E` is the closed future half-space and
`[t₀, t₁) × E` a slab. Spatial derivatives are `∂ᵢ`, the gradient `∇`, the divergence `div`. A
*period group* is a discrete additive subgroup `Λ ⊆ E` (an `AddSubgroup E` with the discrete
subspace topology); a set `D ⊆ 𝔐` is Λ-invariant when
`(t, x + λ) ∈ D` for `(t, x) ∈ D`, `λ ∈ Λ`, and a function is Λ-periodic when it is invariant
under these translations. `Λ = 0` is the Euclidean carrier `Σ = ℝⁿ`;
`Λ_cyl = {0} × (2πℤ)^{n−1}` is the cylinder: a statement about `ℝ × (ℝ/2πℤ)^{n−1}` (as in
Abbrescia–Speck and Luk–Speck) is, by definition here, the statement about Λ_cyl-periodic lifts,
and a curve on the cylinder is identified with its lifts.

**Domains and regularity.** A *domain* in this roadmap is a subset `D ⊆ H_{t₀}` that is
relatively open in `H_{t₀}` (`IsHalfSpaceDomain t₀ D`: `D = W ∩ H_{t₀}` for an open `W ⊆ 𝔐`);
data domains are open subsets `S ⊆ E`, placed at `{t₀} × S`.
Closed domains are never used: with a closed domain the domain-of-dependence condition does not
see data entering from outside (Check in §3.3). A map on a domain `D` is `C¹` when it is
`ContDiffOn ℝ 1` on `D` in Mathlib's sense; derivatives are `fderivWithin` on `D`, which is a
uniquely differentiable set because `H_{t₀}` is convex with nonempty interior. `C¹` up to
`t = t₀` is therefore part of every regularity hypothesis.

**States.** A barotropic state is `(ρ, v)` with `ρ` in the open interval `I ⊆ (0, ∞)` of an
equation of state; a full state is `(ρ, v, s)` with `(ρ, s)` in the open set `𝒪 ⊆ (0, ∞) × ℝ` of
an equation of state, and a *fluid field* is a map `U = (ρ, v, s) : 𝔐 → ℝ × E × ℝ`. The material
derivative is `B = ∂_t + v·∇`; for a `C¹` field it is the derivative of `U` applied to the vector
`(1, v)`. The sound speed is `c = √(∂_ρ p) > 0`.

**Cauchy data.** Data of the Cauchy problem are continuous functions on `E`. For data in
`Ū + Hᵏ_Λ` with `2k > n + 2` this picks the `C¹` representative of the Sobolev class (§4.2), and it
is what makes `U(t₀, ·) = U₀` hold everywhere rather than almost everywhere: a classical solution
is continuous, so data altered on a null set have no classical solution attaining them.

**Signature and time orientation.** The acoustical form has signature `(−, +, …, +)`. Vectors
are `(τ, ξ) ∈ ℝ × E`, covectors `ζ = (ζ₀, ζ')` paired by `ζ(τ, ξ) = ζ₀τ + ζ'·ξ`. Future means
increasing `t`. Witness, `n = 1`, `c = 1`, `v = 0`: `(1, 1/2)` has `g = −3/4` (timelike, future),
`(1, 1)` has `g = 0` (null), `(1, 2)` has `g = 3` (spacelike), and `g((1, 0), (1, 1/2)) = −1 < 0`.
For the covector `dt`, `g⁻¹(dt, dt) = −c⁻²`, so with `c = 2` it is `−1/4`: every slice `Σ_t` is
spacelike. Luk–Speck normalise the acoustical metric as `c⁻² g`; with `c = 2`, `v = 0` and
`X = (1, 0)` their value is `−1` and ours `−4`. Causal character is unchanged by this conformal
factor, and nothing here depends on it. The signature is LorentzianGeometry's, and its §7.3
time-orients the acoustical form by `[B]`, `B = (1, v)`: a nonzero causal `X = (τ, ξ)` has
`g(B, X) = −c²τ`, so `X` is future for `[B]` exactly when `τ > 0`, and the two notions of future
agree. In the witness above, `g(B, (1, 1/2)) = −1 < 0` with `B = (1, 0)`.

**Sobolev orders and norms.** Sobolev orders are natural numbers; `k > n/2 + 1` means
`2k > n + 2`. `Hᵏ_Λ` norms are the `ℓ²` sums over multi-indices of order at most `k` of the
`L²` norms over a fundamental domain (§4.1), and for maps into `ℝ^N` or into `ℝ × E × ℝ` the
Euclidean norm of the values; they are handled as squared norms with values in `[0, ∞]`
(`sobolevNormSq`). Matrices are real; "positive definite" and
"positive semidefinite" are Mathlib's `Matrix.PosDef` and `Matrix.PosSemidef`; `M ≤ M'` is the
Loewner order.

**Symmetric hyperbolic systems.** A system is `A⁰(U)∂_tU + Σᵢ Aⁱ(U)∂ᵢU = F(U)` with values in
an open `G ⊆ ℝ^N`; its symbol at a covector `ζ` is `σ(U; ζ) = ζ₀A⁰(U) + Σᵢ ζᵢAⁱ(U)`. A round
cone `(c, w)` with `c > 0`, `w ∈ E` *dominates* the system at `U` when `σ(U; ζ)` is positive
semidefinite for every `ζ` with `ζ₀ + w·ζ' ≥ c|ζ'|`. The sign is fixed by the scalar transport
equation `∂_t u + a ∂_x u = 0`: its symbol is `ζ₀ + aζ₁`, and the cone `(c, a)` dominates for
every `c > 0`, while `(1, 0)` does not dominate when `a = 3` (take `ζ = (1, −1)`: the cone
condition `1 ≥ 1` holds and the symbol is `1 − 3 = −2`).

## Exact supplier contracts

### From Mathlib

- `ContDiffOn`, `fderivWithin`, `UniqueDiffOn` and the convexity criterion for unique
  differentiability: the meaning of `C¹` on a domain and of the equations at `t = t₀`.
- `Matrix.PosDef`, `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:176,62`):
  the definiteness conditions on `A⁰` and on the symbol.
- `Matrix.IsHermitian` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45`), `Matrix.IsSymm`
  (`Mathlib/LinearAlgebra/Matrix/Symmetric.lean:33`) and `Matrix.isHermitian_iff_isSymm`
  (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:69`, for a trivial star, as on `ℝ`): the
  symmetric matrices of §2.1 (`Matrix.IsHermitian`, which `Matrix.PosDef` contains) and of
  SymmetricHyperbolicSystems §1.2 (`Matrix.IsSymm`) are the same for real matrices.
- `Matrix.det`, `Real.sqrt` and `IsCompact`: the determinant of §2.2 and §3.1, the sound speed of
  §1.1 and the compactness statements of §3.3.
- `LipschitzOnWith`, `LocallyLipschitzOn`, Rademacher's theorem
  `LipschitzOnWith.ae_differentiableWithinAt_of_mem`
  (`Mathlib/Analysis/Calculus/Rademacher.lean:362`), `LipschitzOnWith.absolutelyContinuousOnInterval`
  (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:310`) and the fundamental theorem of
  calculus `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:227`, scalar
  valued; applied coordinatewise): the analysis of locally Lipschitz causal curves in §3.2.
- `LipschitzWith.integral_lineDeriv_mul_eq` (`Mathlib/Analysis/Calculus/Rademacher.lean:170`):
  integration by parts `∫ (∂_v f) g = ∫ (∂_{−v} g) f` for globally Lipschitz `f`, `g` with `g`
  compactly supported, used against the Lipschitz weights of §5.2 (for `Λ = 0`, and through the
  localisation of §4.1 for a general period group).
- `BoundedContinuousFunction.arzela_ascoli`
  (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:113`): compactness of families of
  causal curves.
- `CompactExhaustion` (`Mathlib/Topology/Compactness/SigmaCompact.lean:323`): compact sets
  `K_n`, each contained in the interior of the next, with union the whole space;
  `CompactExhaustion.choice` (line 418) provides one on a weakly locally compact σ-compact space,
  such as a domain with its subspace topology (locally closed in `𝔐`, second countable). Used in
  the limit-curve statement of §3.2.
- `zorn_le_nonempty₀` (`Mathlib/Order/Zorn.lean:126`): existence of maximal developments and of
  past-inextendible extensions.
- `IsPicardLindelof` and `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`
  (`Mathlib/Analysis/ODE/PicardLindelof.lean:80`, `Mathlib/Analysis/ODE/ExistUnique.lean:57`),
  stated for a complete normed space; `ODE_solution_unique_of_mem_Icc`
  (`Mathlib/Analysis/ODE/ExistUnique.lean:252`): the regularised ODE of §5.4 in `Hᵏ_Λ`, and
  material curves of a `C¹` velocity in §1.3.
- `TemperedDistribution.MemSobolev` (`Mathlib/Analysis/Distribution/Sobolev.lean:153`), the
  Bessel-potential scale on `E`, used only through the Tau Ceti comparison below.
- `MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean:51`): the
  Fourier transform on `L²(E)` as a linear isometric equivalence (Plancherel), used for the
  interpolation inequality of §4.2 on `E`.
- `MeasureTheory.norm_integral_le_integral_norm`
  (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:970`): the norm of a Bochner integral is
  at most the integral of the norm; with the translation isometries below it gives the
  convolution bounds of §4.4, `‖∫ k(y) τ_y w dy‖ ≤ ‖k‖_{L¹}‖w‖`, with no separate convolution
  inequality.
- `Real.young_inequality` (`Mathlib/Analysis/MeanInequalities.lean:547`):
  `ab ≤ |a|ᵖ/p + |b|^q/q` for Hölder conjugate exponents `p`, `q`, the last step of the product
  estimate of §4.3.
- The chain rule `HasFDerivAt.comp` (`Mathlib/Analysis/Calculus/FDeriv/Comp.lean:103`) and the
  Faà di Bruno formula `HasFTaylorSeriesUpToOn.comp`
  (`Mathlib/Analysis/Calculus/ContDiff/FaaDiBruno.lean:1051`: if `g` and `f` have Taylor series
  `q` and `p` up to order `m`, then `g ∘ f` has the Taylor series `q.taylorComp p`): the
  classical derivatives of `Φ̃ ∘ u` up to order `k` for smooth `u`, `Φ̃` the compactly supported
  cut-off of `Φ`, in the composition estimate of §4.3.
- `MeasureTheory.IsAddFundamentalDomain` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:59`,
  a null-measurable set whose translates are pairwise almost disjoint and cover almost every
  point) for the fundamental domain `F` of `Λ` acting on `E` by translation; for `Λ = 0` the set
  `F` is `E` up to a null set. And `Finset.Nat.antidiagonalTuple`
  (`Mathlib/Data/Fin/Tuple/NatAntidiagonal.lean:206`, the multi-indices `α : Fin n → ℕ` of order
  exactly `m`): the norm of §4.1.
- `derivWithin` and `DifferentiableWithinAt` for the velocity of a time-parametrised causal curve
  (§3.2), and `frontier` for the boundary of a development (§8.4).
- `MeasureTheory.convolution`, `ContDiffBump`, the Bochner integral, `Lp`, Hölder's and
  Minkowski's inequalities, dominated convergence and the Lebesgue differentiation theorem.

Mathlib has no symmetric hyperbolic system, no Moser estimate, no Gagliardo–Nirenberg
interpolation inequality between `L^∞` and `Hᵏ`, no periodic or partially periodic Sobolev space
on `E`, no Lorentzian quadratic form with a time orientation and no causal curve.

### From Tau Ceti

- `TauCeti.HasWeakLineDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`): `u′` is a
  weak derivative of `u` in the direction `v` on an open set `Ω` for a measure `μ` when the
  codomain is complete, `u` and `u′` are locally integrable on `Ω`, and `∫ (∂_vφ) u = −∫ φ u′` for
  every smooth `φ` compactly supported in `Ω`. Used with `Ω = ⊤` and Lebesgue measure for the
  iterated weak derivatives of §4.1; local integrability is part of it, so no junk integral
  enters.
- `TauCeti.Wkp` (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145`), the weak-derivative Sobolev
  space `W^{k,p}(Ω)` of real functions, used with `Ω = ⊤`, `p = 2`, Lebesgue measure; and
  `TauCeti.HasWeakFDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`), the weak
  derivative on an open set, which is a weak line derivative in every direction.
- `MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq`
  (`TauCeti/Analysis/Sobolev/BesselPotential/Basic.lean:133`): for `1 < p < ∞` and every
  natural `k`, a real `Lᵖ` function is in Mathlib's `MemSobolev k p` exactly when it is the
  value of an element of `TauCeti.Wkp volume ⊤ p k`.
- `TemperedDistribution.MemSobolev.exists_zeroAtInftyContinuousMap_ae_eq` and
  `TauCeti.Wkp.toZeroAtInfty` (`TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:81,194`):
  for `2k > n` every element of `W^{k,2}(ℝⁿ)` has a unique representative in `C₀(ℝⁿ)`, and the
  representative map is a bounded linear map. Only continuity, vanishing at infinity and the sup
  bound are used; no Hölder modulus is assumed.
- `TauCeti.Wkp.exists_contDiffOn_ae_eq`
  (`TauCeti/Analysis/Sobolev/Wkp/ContDiffRepresentative.lean:101`), with
  `TauCeti.HasWeakFDerivOn.contDiffOn_succ` (`TauCeti/Analysis/Sobolev/WeakDeriv/Classical.lean:145`:
  a function continuous on an open set with a weak derivative of class `Cᵐ` there is of class
  `Cᵐ⁺¹` there): for Lebesgue measure, an open `Ω ⊆ E` and `2k > n`, every element of
  `W^{k+j,2}(Ω)` agrees almost everywhere on `Ω` with a function of class `Cʲ` on `Ω`, which need
  not be bounded. With `Ω = ⊤`, and `k − j` in place of `k` (so that the hypothesis reads
  `2k > n + 2j`), this is the regularity of the representative in §4.2 for `Λ = 0`; §4.2 adds the
  bound `sup_{|α|≤j} ‖∂^αu‖_∞ ≤ C‖u‖_{Hᵏ_Λ}`, the decay and every period group. Consumed in §4.2.
- `TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`, with its two directions
  `TauCeti.Wkp.exists_hasWeakLineDerivOn_value` and
  `TauCeti.Wkp.exists_value_eq_of_forall_hasWeakLineDerivOn`
  (`TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:287,156,267`): for an additive Haar measure and an
  open `Ω`, an element of `Lᵖ(Ω)` is the value of an element of `W^{k+1,p}(Ω)` exactly when in
  every direction it has a weak derivative that is the value of an element of `W^{k,p}(Ω)`, and
  for the converse the directions of one orthonormal basis suffice. With `Ω = ⊤`, `p = 2` and
  Lebesgue measure it is, by induction on `k`, the identification of §4.1 at `Λ = 0` of a family
  `IsWeakDerivFamily k u g` whose members `g_α`, `|α| ≤ k`, lie in `L²` with an element of
  `TauCeti.Wkp volume ⊤ 2 k` of value `u`; consumed, not proved again.
- `TauCeti.exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le`
  (`TauCeti/Analysis/Sobolev/DifferenceQuotient.lean:152`): a locally integrable `u` on an
  open set whose `L²` difference quotients in a direction `v` are bounded by `C` on every
  compact subset, for parameters `t → 0` frequently, has a weak derivative in direction `v` of
  `L²` norm at most `C`; the lower semicontinuity of §4.2.
- `TauCeti.Wkp.dense_contDiff_representatives`
  (`TauCeti/Analysis/Sobolev/Wkp/SmoothDensity.lean:92`): density of smooth functions in
  `W^{k,p}(ℝⁿ)` for finite `p`.
- `TauCeti.Wkp.normedBumpL` with `TauCeti.Wkp.norm_normedBumpL_le_one`,
  `TauCeti.Wkp.lowerOrder_normedBumpL`, `TauCeti.Wkp.iteratedGradient_normedBumpL` and
  `TauCeti.Wkp.tendsto_normedBumpL`
  (`TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.lean:52,67,107,118,132`): mollification of
  `W^{k,p}(ℝⁿ)`, `p < ∞`, by a normalised smooth bump (`ContDiffBump`, radial, hence even and
  nonnegative) as a contraction in the `Wkp` norm, commuting with the lower-order projection and
  with the iterated gradient, and converging strongly to the identity as the bump radii tend to
  `0`; `TauCeti.W1p.normedBumpL` (`TauCeti/Analysis/Sobolev/W1p/Mollification.lean:87`) is the
  order-one case. The contraction and the convergence are here the `Λ = 0` statements of §4.4
  for the normalised-bump kernels only; a general even nonnegative kernel (§4.4) need not be of
  this form, and for it these two statements are proved in §4.4 from the translations below.
- `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right` with
  `TauCeti.HasWeakLineDerivOn.hasLineDerivAt_convolution_right`
  (`TauCeti/Analysis/Sobolev/Mollification/Basic.lean:97,73`): for a locally integrable `u` with
  a weak derivative `u′` in the direction `v` on an open `Ω`, an s-finite left-invariant measure
  and a smooth compactly supported scalar kernel `ρ`, the convolution `u ⋆ ρ` (Mathlib's
  `MeasureTheory.convolution` with the flipped scalar multiplication, `x ↦ ∫ ρ(x − y) u(y) dy`)
  has directional derivative `(u′ ⋆ ρ)(x)` in the direction `v` at every `x` with
  `x − tsupport ρ ⊆ Ω`. With `Ω = ⊤`, Lebesgue measure and `ρ = φ_ε`, applied successively to the
  weak derivatives of §4.1, this is `∂^αJ_εu = J_ε∂^αu` of §4.4 for every admissible kernel and
  every period group (the identity is pointwise, and a Λ-periodic `u` with finite norm is locally
  integrable); it is consumed, not proved again.
- `TauCeti.Wkp.translate`, `TauCeti.Wkp.lowerOrder_translate`,
  `TauCeti.Wkp.iteratedGradient_translate`, `TauCeti.Wkp.continuous_translate`,
  `TauCeti.Wkp.norm_translate` and `TauCeti.Wkp.translateLIE`
  (`TauCeti/Analysis/Sobolev/Wkp/Translation.lean:104,137,130,182,193,229`): translation of
  `W^{k,p}(ℝⁿ)` acts on the value and every weak derivative, is a linear isometric equivalence,
  and for finite `p` is continuous in the translation vector for each fixed element.
  `TauCeti.Wkp.lowerOrder_translate` and `TauCeti.Wkp.iteratedGradient_translate` give the
  translation invariance of the norm of §4.1 at `Λ = 0`; the others carry the route of §4.4.
- `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
  (`TauCeti/Analysis/Sobolev/Translation.lean:133`): for `1 ≤ p ≤ ∞`, an additive Haar measure
  `μ` on `E` and `u` in `TauCeti.w1p0Submodule μ ⊤ p`, the closure of the test functions in
  `W^{1,p}(E)`, the translation estimate `‖u(· + h) − u‖_p ≤ |h|‖∇u‖_p`; with
  `TauCeti.w1p0Submodule_top_eq_top` (`TauCeti/Analysis/Sobolev/W1p/Density.lean:299`), by
  which that closure is all of `W^{1,p}(E)` for `p < ∞`, it holds for every element of
  `TauCeti.W1p volume ⊤ 2`, which is `TauCeti.Wkp volume ⊤ 2 1`. With
  `MeasureTheory.norm_integral_le_integral_norm` it gives the loss bound of §4.4 for `Λ = 0`,
  and the localisation of §4.1 carries it to every `Λ`.
- `TauCeti.HasWeakLineDerivOn.contDiffOn_smul`, `TauCeti.HasWeakFDerivOn.contDiffOn_smul` and
  `TauCeti.HasWeakLineDerivOn.lipschitzOnWith_smul`
  (`TauCeti/Analysis/Sobolev/Leibniz.lean:112,168,317`): the Leibniz rule for the weak derivative
  of `ψu` with `ψ` smooth, or Lipschitz, on the open set and `u` weakly differentiable; the
  product rule of §4.3 for two Sobolev factors is obtained from it by density.
- `TauCeti.W1p.mul`, `TauCeti.W1p.norm_mul_le` and `TauCeti.W1p.mulL`
  (`TauCeti/Analysis/Sobolev/W1p/SupercriticalMultiplication.lean:320,500,515`): for `p > n`
  the product of the Morrey representatives of `u, v ∈ W^{1,p}(ℝⁿ)` lies in `W^{1,p}(ℝⁿ)` with
  `‖uv‖ ≤ 3‖ι‖‖u‖‖v‖`, `ι` Morrey's embedding, and is a bounded bilinear map. At `p = 2` the
  hypothesis `n < 2` leaves `n = 1`, where the `W1p` norm is the `H¹` norm: this is the case
  `Λ = 0`, `n = 1`, `k = 1` of the algebra property of §4.3, which is stated for every `Λ` and
  every `n`, `k` with `2k > n`, together with the product bound with `L^∞` factors.
- `TauCeti.W1p.hasWeakFDerivOn_comp` and `TauCeti.W1p.contDiffComp`
  (`TauCeti/Analysis/Sobolev/W1p/ChainRule.lean:375,385`): for `1 ≤ p < ∞`, a real
  `u ∈ W^{1,p}(Ω)` on an open `Ω` and a `C¹` function `F : ℝ → ℝ` with bounded derivative,
  `F ∘ u` has the weak gradient `F′(u)∇u` on `Ω`, and lies in `W^{1,p}(Ω)` when `F(0) = 0`. This
  is the scalar chain rule, the case `N = 1`, `k = 1` of the composition estimate of §4.3 for a
  `Φ` with bounded derivative on all of `ℝ`; §4.3 states vector-valued `u`, every order `k`, and
  `Φ` smooth only on an open `G` containing the values.
- `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:789`): a real function of class `C¹` on an
  open set has its classical gradient as weak derivative there; applied componentwise to
  `Φ̃ ∘ u`, `Φ̃` the compactly supported cut-off of `Φ` of §4.3, for the smooth approximants `u`
  there, which may leave the domain `G` of `Φ`.
- `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`
  (`TauCeti/Analysis/Sobolev/Wkp/Interpolation.lean:335`): for `1 ≤ p < ∞`, `ε > 0` and
  `u ∈ W^{2,p}(E)`, `‖∇u‖_p ≤ ε‖D²u‖_p + (n²/ε)‖u‖_p`. At `p = 2` the infimum over `ε` gives
  `‖∇u‖₂ ≤ 2n‖u‖₂^{1/2}‖D²u‖₂^{1/2}`, the case `j = 1`, `k = 2`, `Λ = 0` of the interpolation
  inequality of §4.2 in additive form; §4.2 states every `0 ≤ j ≤ k` and every `Λ`, by
  Plancherel.
- `TauCeti.CircleSobolev s E` (`TauCeti/Analysis/Sobolev/Circle/Basic.lean:197`), the
  Fourier-side Sobolev space of the circle with norm squared `Σ_m (1 + |m|)^{2s}‖c_m‖²`
  (`TauCeti.CircleSobolev.norm_sq_eq_tsum`, line 375), identified at `s = 0` with
  `L²(AddCircle T)` for the probability Haar measure by `TauCeti.CircleSobolev.toLpₗᵢ`
  (`TauCeti/Analysis/Sobolev/Circle/Lp.lean:59`): for `n = 1`, `Λ = Tℤ` and integer `s = k` this
  is `Hᵏ_Λ` (real functions, complexified) up to norm equivalence; nothing here uses it, and the
  norm comparison is a Check of §4.1. The space carries five special cases of Layer 4, none of
  them consumed; all but the derivative need `s > 1/2`. `TauCeti.CircleSobolev.toContinuousMap` with
  `TauCeti.CircleSobolev.norm_toContinuousMap_le`
  (`TauCeti/Analysis/Sobolev/Circle/Basic.lean:807,831`), the continuous representative as a
  bounded linear map into `C(AddCircle T, E)`, is the embedding of §4.2 at `j = 0`.
  `TauCeti.CircleSobolev.norm_mul_le` with `TauCeti.CircleSobolev.toContinuousMap_mul`
  (`TauCeti/Analysis/Sobolev/Circle/Algebra.lean:288,300`), the bound `‖ab‖ ≤ C_s‖a‖‖b‖` for a
  complete normed `ℂ`-algebra `A` with the product pointwise on representatives, is at `A = ℂ`
  the algebra property of §4.3. `TauCeti.CircleSobolev.toContinuousMap_nemytskii` with
  `TauCeti.CircleSobolev.analyticOnNhd_nemytskii`
  (`TauCeti/Analysis/Sobolev/Circle/Nemytskii.lean:431,441`), by which, for `F` holomorphic on an
  open `U ⊆ ℂ` and `u` with values in `U`, `F ∘ u` represents an element of the space and
  `u ↦ F ∘ u` is analytic on the open set of such `u`, is the composition statement of §4.3 for
  `N = 2` and holomorphic `Φ`, membership and continuity. `TauCeti.CircleSobolev.derivative` with
  `TauCeti.CircleSobolev.norm_derivative_le` (`TauCeti/Analysis/Sobolev/Circle/Derivative.lean:83,98`),
  for `s + 1 ≤ t` the operator `H^t → H^s` multiplying the `m`-th Fourier coefficient by `2πim/T`,
  of norm at most `2π/T`, is the boundedness of `∂ᵢ : Hᵏ⁺¹_Λ → Hᵏ_Λ` of §4.1; and
  `TauCeti.CircleSobolev.hasDerivAt_toContinuousMap` (same file, line 195), by which for
  `s > 1/2` and `s + 1 ≤ t` the continuous representative of `a ∈ H^t` is differentiable with the
  continuous representative of the derivative of `a` as derivative, gives, applied `j` times
  together with `TauCeti.CircleSobolev.norm_toContinuousMap_le`, the embedding of §4.2 into
  `C^j_b` with its bound when `2k > 1 + 2j` (at `k = 2`, `j = 1`: `s = 1 > 1/2`, `t = 2 = s + 1`).
  At integer orders `s = k ≥ 1` these are the case `n = 1`, `Λ = Tℤ`, complex values, of
  §§4.1–4.3, up to the norm equivalence of §4.1; §§4.1–4.3 state the tame bounds with `L^∞`
  factors, every `n`, period groups of every rank, and real `Φ` that is only smooth on an open
  `G ⊆ ℝ^N`, while the pinned statements also cover real orders (`s > 1/2` where a continuous
  representative enters) and values in complex Banach spaces and algebras.
- `TauCeti.le_mul_exp_of_le_add_mul_integral` (`TauCeti/Analysis/ODE/Gronwall.lean:59`): the
  integral Grönwall inequality `φ(t) ≤ c + K∫ₐᵗ φ ⇒ φ(t) ≤ c e^{K(t−a)}` for continuous `φ` and
  `K ≥ 0`, the closure step of every energy estimate.

### From TauCetiRoadmap.LorentzianGeometry

- §6.1, `minkowskiForm E`: the Minkowski form `−τ² + |ξ|²` on `ℝ × E`, Lorentzian; the frame
  `(t, x) ↦ (ct, x − vt)` carrying the acoustical form of constant `c > 0`, `v` to it is §7.3's
  first Check, which §3.1 uses and to which it adds the determinant.
- §6.3: for a Lorentzian form and a nonzero covector `ζ`, the hyperplane `ker ζ` is spacelike,
  timelike or null according as the inverse form `g⁻¹(ζ, ζ)` is negative, positive or zero, with
  timelike meaning nondegenerate of index one, equivalently containing a timelike vector; used
  for the covector classification of §3.1.
- §7.3: the acoustical form `g = −c² dt² + h(dx − v dt, dx − v dt)` on `ℝ × Σ` for given fields
  `c`, `v` and a Riemannian `h`, here with `Σ = E` and `h` Euclidean; at points with `c ≠ 0` it is
  Lorentzian, `g(B, B) = −c²` for `B = ∂_t + v`, `g(X, B) = −c² dt(X)`,
  `g⁻¹ = −c⁻² B ⊗ B + h⁻¹`, `g⁻¹(dt, dt) = −c⁻²`, every causal vector has `dt(X) ≠ 0`, `∂_t + Y`
  is causal iff `|Y − v| ≤ |c|`, and where `c > 0` with `c`, `v` continuous, `B` is a continuous
  timelike field orienting time. Assumed: these statements for constant and for continuous
  `c > 0`, `v`, which is all §§3.1–3.3 use.
- §8.2: locally Lipschitz future causal curves (velocity future causal almost everywhere),
  their restriction and concatenation, and that piecewise `C¹` future causal curves are locally
  Lipschitz causal curves.
- §12.6: `TimeOrientedLorentzianFieldOn D` (a Lorentzian form field and a timelike field, both
  continuous on the subset `D`), `IsFutureCausalCurveIn`, `IsPastInextendibleIn` and
  `futureDomainOfDependenceIn`, written `D⁺_D(S)`, for any subset `D` of a manifold possibly
  with boundary; `S ∩ D ⊆ D⁺_D(S)` and monotonicity in `S`; concatenation in `D`; the time
  function statement, which for the acoustical field with the time coordinate reduces causal
  curves in `D` to time-parametrised ones, with past-inextendibility in its extension form and
  one-point intervals admitted; the slab identity `D⁺_D(S) ∩ {t = t₀} = S ∩ D` for
  `D ⊆ {t ≥ t₀}` and `S ⊆ {t = t₀}`; determination `futureDomainOfDependenceIn_self` for `S`
  closed in an open set of a manifold without boundary; and invariance under coverings that are
  local isometries. Assumed: these for the acoustical field of a sound-cone field (§3.2) on
  subsets of `ℝ × E` where `c > 0` and `c`, `v` are continuous.

### From TauCetiRoadmap.SymmetricHyperbolicSystems

- §1.2: the structure `LinearSystem n N` (coefficients `A0`, `A`, `B` on `ℝ × E`, valued in real
  `N × N` matrices), its left-hand side `LinearSystem.apply` and the predicate
  `LinearSystem.IsSymmetricHyperbolic` (`A⁰` and every `Aʲ` symmetric in the sense of
  `Matrix.IsSymm`, and `λ|ξ|² ≤ ξ·A⁰ξ` with `λ > 0`). The structure and the predicate are the
  carrier of §5.1. `LinearSystem.apply` is the classical left-hand side, built from the pointwise
  `deriv` and `fderiv`, which are `0` where the map is not differentiable; it is used here only on
  `C¹` maps, in the pointwise identity of §5.2. In §§5.1, 5.3 and 5.4, for
  `W ∈ C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`, `LW` denotes `A⁰∂_tW + Σᵢ Aⁱ∂ᵢW + BW` with `∂_tW` the
  derivative of `t ↦ W(t)` in `L²_Λ` and `∂ᵢW` the weak derivative of §4.1; it lies in
  `C([0, T]; L²_Λ)`, and when `W` is moreover `C¹` on `[0, T] × E`, for each `t ∈ (0, T)` the class
  of `x ↦ LinearSystem.apply W t x` is `LW(t)`.
- Conventions, *Propagation speed*: its notion of a speed `c ≥ 0`,
  `|ξ·(Σⱼ ωⱼAʲ)ξ| ≤ c ξ·A⁰ξ` for all `(t, x)` and `|ω| ≤ 1` (§1.2 gives the existence of one when
  the `Aʲ` are bounded). Compared in §5.2 with dominating cones, at a point.
- §2.1: the pointwise energy identity
  `∂_t⟨A⁰u, u⟩ + Σⱼ ∂ⱼ⟨Aʲu, u⟩ = ⟨Ku, u⟩ + 2⟨F, u⟩`, `K = ∂_tA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ`, for
  classical solutions of `Lu = F` with `A⁰`, `Aʲ` of class `C¹` and `B` continuous. Used in
  §5.2 in local form, for an operator satisfying `LinearSystem.IsSymmetricHyperbolic` with
  constant `λ`: at a point `p ∈ (0, T) × E` near which `u`, `A⁰` and the `Aʲ` are `C¹`, it gives
  the identity with `Lu` in place of `F`, applied to `ψu` and to the coefficients
  `ψA⁰ + (1 − ψ)λI`, `ψAʲ`, `ψB` for a smooth cutoff `ψ` with `0 ≤ ψ ≤ 1`, equal to `1` near `p`
  and compactly supported in an open subset of `(0, T) × E` on which `u`, `A⁰` and the `Aʲ` are
  `C¹`. The cut-off coefficients and `ψu` (extended by `0`) are `C¹` on all of `ℝ × E`, `ψB` is
  continuous, and the cut-off coefficients keep the predicate with the same `λ`, since
  `ψA⁰ + (1 − ψ)λI = λI + ψ(A⁰ − λI) ≥ λI` when `ψ ≥ 0` (with `A⁰ = 2I`, `λ = 1`: `1.5I` at
  `ψ = 1/2`, while a value `ψ = −1` would give the matrix `0`).

The statements of its §2.2, §2.3 and §7.3 (single-speed finite propagation, the integrated
identity and `L²` estimate for classical solutions vanishing outside a bounded set, existence
for smooth compactly supported data) are not consumed: §§5.1, 5.2 and 5.4 state the versions
in other classes and say how they differ.

The roadmap records no supplier gap: every other input is a pinned declaration or a target of
this roadmap.

## How to read the build

Layer 1 states the Euler systems and Layer 2 the symmetric hyperbolic carrier with the Euler
symmetrisers; both are algebra and calculus on Mathlib. Layer 3 is the causal geometry of
sound-cone fields on the Galilean carrier: on top of LorentzianGeometry's acoustical form and
its causal curves and domains of dependence in subsets, it proves the identification with the
Euler symbol, limit curves, compact causal pasts, openness and idempotence of domains of
dependence and the slab statements; it needs Layer 1, LorentzianGeometry, Mathlib and, for one
identification in §3.1, §2.2, and can be built in parallel with Layers 4 and 5. Layer 4 is the
`Hᵏ_Λ` calculus on Tau Ceti's Sobolev spaces. Layer 5 is the Friedrichs energy method in
`Hᵏ_Λ` for linear systems on SymmetricHyperbolicSystems' carrier (Layers 2 and 4). Layer 6
proves local uniqueness on lens-shaped domains and uniqueness on domains of dependence (Layers
2, 3 and 5). Layer 7 is local well-posedness (Layers 2 and 4–6, Layer 1 for the Euler statement,
and §3.3 for uniformly local data). Layer 8 is the theory of developments (Layers 1–3, 6 and 7,
and LorentzianGeometry §12.6).
The headline theorems, which the acceptance test `Suggested.lean` states, are uniqueness on
lens-shaped domains and on domains of dependence (§6.1 `QuasilinearSystem.eqOn_lens`, §6.2
`QuasilinearSystem.eqOn_causalPast`); local well-posedness of quasilinear symmetric hyperbolic
systems with its continuation criterion (§7.1 `QuasilinearSystem.localWellPosedness`,
`QuasilinearSystem.exists_extension_of_lintegral_lt_top`); local well-posedness of compressible
Euler with its continuation criterion (§7.2 `EquationOfState.localWellPosedness`,
`EquationOfState.exists_extension_of_lintegral_lt_top`); the theory of developments (§8.2
`EquationOfState.maximalCommonDevelopment`, `EquationOfState.compatible_iff`,
`EquationOfState.exists_maximal_development`, `EquationOfState.isGreatest_development_of_solution`
and the counterexample `exists_incompatible_developments`; §8.3
`EquationOfState.isDevelopment_slab` and `EquationOfState.slab_subset_of_maximal`); and the causal
character and nullity of the boundary of a development (§8.4
`EquationOfState.boundary_futureCausal`, `EquationOfState.boundary_null`). The Euler statements are made for the full system; the
barotropic ones are their case of a law `P(ρ, s) = p(ρ)` and constant entropy (§1.3). The
definitions they need are the equation of state and the Euler system (§§1.1, 1.3), the
quasilinear symmetric hyperbolic system with its symbol and dominating cones (§2.1), the causal
curves, causal pasts and future domains of dependence of a cone field in the time-parametrised
form to which LorentzianGeometry §12.6 reduces its notions (§§3.2–3.3), the norm of `Hᵏ_Λ`
(§4.1), the lens function (§6.1), and the development (§8.1).

## Layer 1: equations of state and the Euler systems

### 1.1 Equations of state

Define a *barotropic equation of state* as an open interval `I ⊆ (0, ∞)` together with a
function `p : ℝ → ℝ` that is smooth on `I` with `p′(ρ) > 0` for every `ρ ∈ I`, and its sound speed
`c(ρ) = √(p′(ρ))`. Define a (full) *equation of state* (`EquationOfState`) as an open set
`𝒪 ⊆ (0, ∞) × ℝ` of density–entropy pairs together with a function `P` smooth on `𝒪` with
`∂_ρP > 0` on `𝒪`, where `∂_ρP(ρ, s)` is the derivative of `r ↦ P(r, s)` at `ρ`, and its sound
speed `c(ρ, s) = √(∂_ρP(ρ, s))` (`EquationOfState.soundSpeed`; ChristodoulouMiao2014 line 606,
eq. (1.24); AbbresciaSpeck2022 lines 165–170, eq. (1.3)). The polytropic laws `p = k₀ρ^γ` on
`(0, ∞)` with `k₀ > 0`, `γ ≥ 1` (LuoYu2023a line 88, where `1 < γ < 3`) and the ideal-gas law
`P(ρ, s) = k₀ e^s ρ^γ` are instances, and so is the law `P(ρ, s) = ρ²` on `(0, ∞) × ℝ`
(`quadraticLaw`), with `c = √(2ρ)`.

- The sound speed is smooth and strictly positive on `I` (on `𝒪`), and `c² = p′` (`c² = ∂_ρP`).
- A barotropic equation of state on `I` is an equation of state on `I × ℝ` independent of `s`,
  with the same sound speed; conversely, for every `s₀` and every open interval `J` with
  `J × {s₀} ⊆ 𝒪`, `ρ ↦ P(ρ, s₀)` is a barotropic equation of state on `J`.
- For the polytropic law `c² = k₀γρ^{γ−1}`; for the ideal-gas law `c² = k₀γe^sρ^{γ−1}`.

**Checks.**

- `p = ρ²/2` on `(0, ∞)`: `c² = ρ`, so `c(4) = 2`; the plausible wrong definition `c = p′`
  gives `4`.
- `p = ρ²` (`k₀ = 1`, `γ = 2`) at `ρ = 1/2`: `c² = 2ρ = 1`, so `c = 1`; this is the state of the
  counterexample of §8.2.
- The isothermal law `p = a²ρ` with `a ≠ 0` has constant sound speed `c = |a|` (for `a = −1`,
  `p = ρ`, `p′ = 1` and `c = 1`, not `−1`); `a = 0` gives `p′ = 0` and is excluded. The Chaplygin
  law `p = −A/ρ` with `A > 0` has `p′ = A/ρ² > 0`: it is an equation of state although the pressure is
  negative, with `c = √A/ρ`. A definition demanding `p > 0` would wrongly exclude it.
- `p = −ρ²` on `(0, ∞)` has `p′ = −2ρ < 0` and is not an equation of state: for it the symbol of
  §2.2 would have the non-real characteristic speeds `v·ζ′ ± i√(2ρ)|ζ′|`.
- Ideal gas with `k₀ = 1`, `γ = 2` at `(ρ, s) = (1, 0)`: `∂_ρP = 2`, `∂_sP = 1`, `c = √2`.

*Needs:* Mathlib `ContDiffOn`, `Real.sqrt`.

### 1.2 The barotropic Euler system

Fix a barotropic equation of state `(I, p)`. Define a *classical barotropic solution* on a
domain or open set `D ⊆ 𝔐` as a pair `(ρ, v)` of `C¹` maps on `D` with `ρ(D) ⊆ I` satisfying, at
every point of `D`,

    ∂_t ρ + v·∇ρ = −ρ div v,        ∂_t v + (v·∇)v = −ρ⁻¹ ∇(p ∘ ρ)

(ChristodoulouMiao2014 lines 488 and 529, eqs. (1.4) and (1.10); LuoYu2023a line 84, eq. (1.1);
AbbresciaSpeck2022 lines 158–164, eqs. (1.1a)–(1.2), with the material field `B = ∂_t + v·∇`).
Prove that a `C¹` pair with `ρ(D) ⊆ I` is a classical barotropic solution if and only if it
satisfies the conservative system `∂_tρ + div(ρv) = 0`, `∂_t(ρvⁱ) + Σⱼ ∂ⱼ(ρvⁱvʲ) + ∂ᵢ(p ∘ ρ) = 0`
(ChristodoulouMiao2014 lines 481–529; the division by `ρ` uses `ρ > 0`). Prove Galilean
invariance: for `w ∈ E`, a linear isometry `R` of `E` and `a = (a₀, a′) ∈ 𝔐`, with
`φ(t, x) = (t + a₀, Rx + tw + a′)`, the pair `(ρ ∘ φ⁻¹, (Rv + w) ∘ φ⁻¹)` is a classical
barotropic solution on `φ(D)` if and only if `(ρ, v)` is one on `D` (ChristodoulouMiao2014
lines 818–822).

- Constant states `(ρ₀, v₀)` with `ρ₀ ∈ I` are solutions on `𝔐`.
- The expanding flow `ρ = ρ₀(1 + t)^{−n}`, `v = x/(1 + t)` is a solution on every open set of
  `(−1, ∞) × E` where `ρ ∈ I`, for every equation of state, since `ρ` is spatially constant.
- Restriction to a smaller domain and Λ-translates of solutions are solutions.

**Checks.**

- Expanding flow, `n = 1`, at `t = 1`: `ρ = ρ₀/2`, `v = x/2`, and `∂_tρ = −ρ₀/4`,
  `∂_x(ρv) = ρ₀/4`, so the continuity equation holds; momentum: `∂_tv + v∂_xv = −x/4 + x/4 = 0`.
- `(ρ, v) = (1 + t, 0)` is not a solution: `∂_tρ = 1 ≠ 0 = −ρ div v`.
- Boost of the expanding flow (`n = 1`) by `w = 1`: the correct rule gives
  `ṽ(t, y) = (y − t)/(1 + t) + 1`, with `∂_tṽ + ṽ∂_yṽ = 0`; the plausible wrong rule `ṽ = v ∘ φ⁻¹`
  leaves the residual `−w/(1 + t)`, which is `−1/2` at `t = 1`.

*Needs:* Mathlib `ContDiffOn`, `fderivWithin`, the product and chain rules; Layer 1.1.

### 1.3 The full Euler system

Fix an equation of state `(𝒪, P)`. Define a *classical solution* of the full system on `D`
(`EquationOfState.IsSolution`) as a fluid field `U = (ρ, v, s)` of class `C¹` on `D` with
`(ρ, s)(D) ⊆ 𝒪` satisfying

    Bρ = −ρ div v,        Bv = −ρ⁻¹ ∇(P(ρ, s)),        Bs = 0,       B = ∂_t + v·∇

at every point of `D` (ChristodoulouMiao2014 lines 833–838, eqs. (2.1)–(2.3); AbbresciaSpeck2022
lines 158–160). Derivatives are taken within `D`: `(Bρ, Bv, Bs)` at `q` is the derivative of `U`
within `D` at `q` applied to `(1, v(q))`, and the momentum equation is read against every
`w ∈ E`, `⟨Bv, w⟩ = −ρ⁻¹ ∂_w(P(ρ, s))`.
Prove the conservative form (the barotropic one with `P(ρ, s)` and `∂_t(ρs) + div(ρsv) = 0`),
Galilean invariance as in §1.2 with `s ∘ φ⁻¹`, and the constant-entropy reduction: if `s ≡ s₀`
on `D` then `(ρ, v)` is a barotropic solution for `ρ ↦ P(ρ, s₀)` on each open interval `J` with
`J × {s₀} ⊆ 𝒪` containing `ρ(D)`, and conversely. Prove entropy propagation: if `(ρ, v, s)` is a
classical solution on a slab `[t₀, t₁) × E` with `v` bounded on `[t₀, t₂] × E` for every
`t₂ < t₁` and `s = s₀` on `Σ_{t₀}`, then `s ≡ s₀`, since `s` is constant along the material
curves `ẋ = v(t, x)`, which exist backwards to `t₀` by Picard–Lindelöf for the locally Lipschitz
field `v` and boundedness (ChristodoulouMiao2014 lines 530–544).

- Every barotropic solution `(ρ, v)` with a constant `s₀` is a full solution for
  `P(ρ, s) = p(ρ)`, and conversely a full solution for this law with constant entropy is a
  barotropic solution; with entropy propagation (on slabs, here; on developments, §8.1) this is
  how every statement made for the full system below (§7.2, Layer 8) contains the barotropic one.
- Constant states, Λ-translates and restrictions are solutions.

**Checks.**

- Static entropy wave: `P = e^sρ²`, `n = 1`, `s = x`, `ρ = e^{−x/2}`, `v = 0`. Then
  `P(ρ, s) = 1` is constant and `(ρ, 0, x)` is a stationary classical solution with non-constant
  entropy, hence not barotropic. A wrong momentum equation keeping only `ρ⁻¹∂_ρP ∂_xρ` gives
  `e^{x/2} · 2e^{x/2} · (−e^{−x/2}/2) = −e^{x/2} ≠ 0`.
- The constant-entropy reduction at `s₀ = 0` turns `P = e^sρ²` into `p = ρ²`, whose sound speed
  `√(2ρ)` agrees with `√(∂_ρP(ρ, 0))`.
- `(ρ, v, s) = (1, 0, t)` is not a solution: `Bs = 1`.

*Needs:* Mathlib `ContDiffOn`, `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`,
`ODE_solution_unique_of_mem_Icc`; Layers 1.1–1.2.

### Examples

The constant states, the expanding flow and the static entropy wave are exact solutions with
computed values; the Galilean boost of a constant state `(ρ₀, 0)` by `w` is `(ρ₀, w)`.

### Dependencies

Mathlib only.

## Layer 2: symmetric hyperbolic systems and the Euler symmetrisers

### 2.1 Quasilinear symmetric hyperbolic systems

Define a *quasilinear symmetric hyperbolic system* (`QuasilinearSystem n N`) of size `N` in `n`
space dimensions as an open set `G ⊆ ℝ^N` of states, smooth maps `A⁰, …, Aⁿ` from `G` to real
symmetric `N × N` matrices with `A⁰(U)` positive definite for every `U ∈ G`, and a smooth map
`F : G → ℝ^N`. A *classical solution* on a domain or open set `D`
(`QuasilinearSystem.IsClassicalSolution`) is a `C¹` map `U : D → G` with
`A⁰(U)∂_tU + Σᵢ Aⁱ(U)∂ᵢU = F(U)` on `D`, the derivatives taken within `D`. Define the symbol
`σ(U; ζ)` (`QuasilinearSystem.symbol`, with `ζ₀ = ζ(1, 0)` and `ζᵢ = ζ(0, eᵢ)`) and the dominating
round cones (`QuasilinearSystem.Dominates`, with `ζ₀ + w·ζ′ = ζ(1, w)` and `|ζ′|` the norm of the
restriction of `ζ` to `E`) as in the Conventions (Friedrichs1954, pp. 345–392; Majda1984, Ch. 2,
§2.1; Dafermos2016, Ch. V, §5.1; Christodoulou2019 lines 124–126 for the Euler equations as a
quasilinear hyperbolic first-order system).

- `σ(U; ζ)` is linear in `ζ`, and `σ(U; dt) = A⁰(U)` is positive definite.
- Monotonicity: if `(c, w)` dominates at `U` and `c′ ≥ c + |w′ − w|`, then `(c′, w′)` dominates
  at `U`.
- Maximal speed: for every compact `K ⊆ G` and every `w ∈ E` there is `M > 0` such that
  `(M, w)` dominates at every `U ∈ K`.
- For fixed `(c, w)` the set of states at which `(c, w)` dominates is closed in `G`.
- There is a continuous map `κ : G → (0, ∞) × E` with `κ(U)` dominating at every `U`. For
  `N > 0` one may take `κ(U) = (1 + λ(U), 0)` with `λ(U)` the largest root of
  `det(Σᵢ ωᵢAⁱ(U) − λA⁰(U)) = 0` over unit `ω`: the roots are real because `A⁰(U)` is positive
  definite and the `Aⁱ(U)` are symmetric, `λ(U) ≥ 0` because `ω ↦ −ω` negates them, `λ`
  depends continuously on `U`, and `σ(U; ζ) ≥ (ζ₀ − λ(U)|ζ′|)A⁰(U) ≥ |ζ′|A⁰(U)` when
  `ζ₀ ≥ (1 + λ(U))|ζ′|`. For `N = 0` the determinant is the constant `1` and has no root; every
  cone dominates (positive semidefiniteness of a `0 × 0` matrix is vacuous) and `κ = (1, 0)`.
- Symmetrisation: if `S : G → Sym_N` is smooth and positive definite and `S Mⁱ` is symmetric for
  smooth `Mⁱ : G → Mat_N`, then `C¹` solutions of `∂_tU + Σᵢ Mⁱ(U)∂ᵢU = f(U)` are exactly the
  classical solutions of the system `(G, S, S M¹, …, S Mⁿ, S f)`.
- Difference bound: for classical solutions `U₁, U₂` on `D` with values in a compact `K ⊆ G`
  and `|∂U₂| ≤ L` on `D`, `|A⁰(U₁)∂_tW + Σᵢ Aⁱ(U₁)∂ᵢW| ≤ C(K, L)|W|` on `D` for
  `W = U₁ − U₂`, because `A^μ` and `F` are Lipschitz on compact subsets of `G`.

**Checks.**

- Scalar transport `∂_tu + a∂_xu = 0` (`N = n = 1`, `A⁰ = 1`, `A¹ = a`, `F = 0`): every `(c, a)`
  with `c > 0` dominates; for `a = 3`, `(1, 0)` does not (Conventions).
- The first-order wave system on `ℝ^{1+n}` with `A⁰ = I`, `Aⁱ = −(e₀eᵢᵀ + eᵢe₀ᵀ)` has symbol
  eigenvalues `ζ₀ ± |ζ′|` and, for `n ≥ 2`, `ζ₀` with multiplicity `n − 1`: the cone `(1, 0)`
  dominates, `(1/2, 0)` does not (at `ζ = (1/2, e₁)` the eigenvalue `1/2 − 1 = −1/2` appears).
  For `n = 1` the eigenvalue `ζ₀` is absent: at `ζ = (0, 1)` the symbol is `[[0, −1], [−1, 0]]`,
  with characteristic polynomial `λ² − 1`, determinant `−1` and eigenvalues `−1, 1`, not
  `−1, 0, 1`.
- Size zero: for `N = 0` the symbol is the empty matrix, positive semidefinite for every `ζ`,
  and `det(Σᵢ ωᵢAⁱ − λA⁰) = 1` has no root, so the largest-root recipe for `κ` is undefined and
  `κ = (1, 0)` is used; a definition of `κ` by the largest root alone fails here.
- The Cauchy–Riemann system `∂_tu − ∂_xw = 0`, `∂_tw + ∂_xu = 0` has `A¹ = [[0, −1], [1, 0]]`,
  which is not symmetric: it is not an instance, as it must not be (it is elliptic).
- `A⁰ = diag(1, −1)` is symmetric but not positive definite; the carrier rejects it.

*Needs:* Mathlib `Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.IsHermitian`, `ContDiffOn`.

### 2.2 The Euler symmetrisers

Construct the *barotropic Euler system* on `G = I × E ⊆ ℝ^{1+n}`, `U = (ρ, v)`:
`A⁰ = diag(c²/ρ², 1, …, 1)`, `Aⁱ = vⁱA⁰ + (c²/ρ)(e₀eᵢᵀ + eᵢe₀ᵀ)`, `F = 0`. Construct the *full
Euler system* on `G = {(ρ, v, s) : (ρ, s) ∈ 𝒪}`, `U = (ρ, v, s)`: with `Mⁱ(U)` the coefficient
matrices of the material form (`vⁱ` on the diagonal; `ρ` in position `(ρ, vⁱ)`; `∂_ρP/ρ` in
position `(vⁱ, ρ)`; `∂_sP/ρ` in position `(vⁱ, s)`), take the symmetriser

    S = [[∂_ρP/ρ, 0, ∂_sP/ρ], [0, ρ I_n, 0], [∂_sP/ρ, 0, 1 + (∂_sP)²/(ρ ∂_ρP)]]

and `A⁰ = S`, `Aⁱ = S Mⁱ`, `F = 0`. Prove: both are quasilinear symmetric hyperbolic systems; a
`C¹` state is a classical solution of §1.2 (§1.3) if and only if it is a classical solution of
the corresponding system; for `ζ′ ≠ 0` the roots `λ` of `det(σ(U; ζ) − λA⁰(U)) = 0` are
`ζ₀ + v·ζ′` with multiplicity `n − 1` (barotropic) or `n` (full) and `ζ₀ + v·ζ′ ± c|ζ′|`; `σ(U; ζ)`
is positive semidefinite if and only if `ζ₀ + v·ζ′ ≥ c|ζ′|`, positive definite if and only if
`ζ₀ + v·ζ′ > c|ζ′|`, and singular if and only if `|ζ₀ + v·ζ′| = c|ζ′|`, or `ζ₀ + v·ζ′ = 0` when
that root has positive multiplicity (the barotropic system with `n ≥ 2`, and the full system for
every `n`; for the barotropic system with `n = 1` the root `ζ₀ + vζ₁` is absent and the symbol
is singular only on the sound sheet); and a
round cone `(c′, w)` dominates at `U` if and only if `c′ ≥ c(U) + |v − w|`, so the sound cone
`(c(U), v)` is the least dominating cone (Majda1984, Ch. 2, §2.1, compressible Euler as a
symmetric hyperbolic system; Dafermos2016, Ch. V, §5.1).

- The barotropic symmetriser is `ρ⁻¹` times the restriction of `S` to the `(ρ, v)` block when
  `∂_sP = 0`; the two normalisations have the same solutions.
- The map `U ↦ (c(U), v(U))` is continuous on `G` and gives a dominating cone at every state; it
  is the *acoustical cone map* used in Layers 3, 6 and 8.

**Checks.**

- `n = 1`, `ρ = 1`, `c = 2`, `v = 3`: `A⁰ = diag(4, 1)`, `A¹ = [[12, 4], [4, 3]]`, and
  `det(A¹ − λA⁰) = 4(λ − 1)(λ − 5)`, so the speeds are `1 = v − c` and `5 = v + c`.
- The plausible wrong weight `A⁰ = I` gives `A¹ = [[v, ρ], [c²/ρ, v]] = [[3, 1], [4, 3]]`, which is
  not symmetric.
- Full system, `n = 1`, `P = e^sρ²` at `(ρ, s) = (1, 0)`: `∂_ρP = 2`, `∂_sP = 1`, `d = 3/2`,
  `S = [[2, 0, 1], [0, 1, 0], [1, 0, 3/2]]` with leading minors `2, 2, 2`, positive definite;
  the entry `d = (∂_sP)²/(ρ∂_ρP) = 1/2`, without the summand `1`, gives determinant `0`. Since
  `S M¹` is symmetric for every `d`, it is positive definiteness that forces
  `d > (∂_sP)²/(ρ∂_ρP)`.
- Multiplicity zero: `n = 1`, barotropic, `(ρ, v) = (1, 3)`, `c = 2`, `ζ = (−3, 1)`: here
  `ζ₀ + vζ₁ = 0`, yet `σ = −3A⁰ + A¹ = [[0, 4], [4, 0]]` has determinant `−16`, and
  `g⁻¹(ζ, ζ) = −c⁻²·0 + 1 = 1`, so `ζ` is not null either: `σ` is nonsingular. A statement
  making `ζ₀ + v·ζ′ = 0` singular for every `n` is refuted; for the full system with `n = 1` at
  the same `(ρ, v)` the entropy row makes `ζ₀ + vζ₁` a root and `σ` is singular.
- Dominance at `(ρ, v) = (1, 3)` with `c = 2`: `(2, 3)` dominates, `(2, 0)` does not
  (`ζ = (2, −1)`: `ζ₀ + 0 = 2 ≥ 2·1`, but `ζ₀ + vζ₁ − c|ζ₁| = 2 − 3 − 2 = −3 < 0`), and `(5, 0)`
  dominates, matching `c′ ≥ c + |v − w| = 5`.
- Constant state, material sheet: at a constant state the barotropic system has constant
  coefficients, and for unit `ω` its speeds are `v·ω ± c` and the material speed `v·ω` with
  multiplicity `n − 1`. For `n = 2`, `ρ = c = 1`, `v = 0` and `ζ = (0, 1, 0)` the symbol is
  `A¹ = [[0, 1, 0], [1, 0, 0], [0, 0, 0]]`, with determinant `0` and eigenvalues `−1, 0, 1`: `ζ` is
  characteristic (material sheet) although `g⁻¹(ζ, ζ) = 1`, so it is not null. For `n = 1` at the
  same state the speeds are `−1, 1` only. The full system has material multiplicity `n`.

*Needs:* Layers 1.1–1.3, 2.1; Mathlib `Matrix.PosDef`, `Matrix.det`.

### Examples

The scalar transport equation, the first-order wave system and both Euler systems are
instances; the Cauchy–Riemann system and an indefinite `A⁰` are non-instances.

### Dependencies

Layer 1 and Mathlib.

## Layer 3: sound cones, causal curves and domains of dependence

### 3.1 The acoustical form

For `c > 0` and `v ∈ E` the *acoustical form* `g_{c,v}` on `ℝ × E` is the acoustical form of
LorentzianGeometry §7.3 for `Σ = E` with its Euclidean metric and the constant fields `c`, `v`:
`g_{c,v}((τ, ξ), (τ′, ξ′)) = −c²ττ′ + (ξ − τv)·(ξ′ − τ′v)`, with *material vector* `B = (1, v)`
and inverse form on covectors `g⁻¹_{c,v}(ζ, η) = −c⁻²(ζ₀ + v·ζ′)(η₀ + v·η′) + ζ′·η′`
(ChristodoulouMiao2014 lines 672–676, eqs. (1.39)–(1.40); LuoYu2023a line 95; LukSpeck2018
lines 1999–2008, eqs. (3.3.10a)–(3.3.10b), in the normalisation `c⁻²g`). LorentzianGeometry §7.3
proves that `g_{c,v}` is Lorentzian, `g(B, B) = −c²`, `g(X, B) = −c²τ` for `X = (τ, ξ)`, the
inverse formula and `g⁻¹(dt, dt) = −c⁻²`, that a nonzero `X` is causal iff `|ξ − τv| ≤ c|τ|`, in
which case `τ ≠ 0`, and that `[B]` orients time. The acoustical form of a state `U` of either
Euler system is `g_{c(U), v(U)}`. In this roadmap the closed cone `{X : g(X, X) ≤ 0}` is
LorentzianGeometry's set of causal vectors together with `0`, and a causal vector is *future*
when `τ > 0`, equivalently `g(B, X) < 0`.

Prove the following, which LorentzianGeometry §7.3 does not state:

- *Determinant and frame.* In the standard basis the Gram matrix of `g` has determinant
  `det g = −c²`, so `√(−det g) = c` (ChristodoulouMiao2014 line 685), and its inverse is the
  Gram matrix of the inverse form of LorentzianGeometry §7.3. The linear map
  `(τ, ξ) ↦ (cτ, ξ − τv)` carries `g` to the Minkowski form `−τ² + |ξ|²` (LorentzianGeometry
  §7.3, first Check, with §6.1's `minkowskiForm E`, whose Gram determinant is `−1`); stated here
  is its determinant `c`, which gives `det g = c² · (−1)` again.
- *Covectors.* `ζ` is future causal (`ζ(X) ≥ 0` for every future causal `X`) iff
  `ζ₀ + v·ζ′ ≥ c|ζ′|`, and future timelike (`g⁻¹(ζ, ζ) < 0` and `ζ(B) > 0`) iff
  `ζ₀ + v·ζ′ > c|ζ′|`; for `ζ ≠ 0` the hyperplane `ker ζ` is spacelike iff
  `|ζ₀ + v·ζ′| > c|ζ′|`, null iff equality holds, and timelike iff `|ζ₀ + v·ζ′| < c|ζ′|`; a
  timelike hyperplane carries an indefinite form when `n ≥ 2` and a negative definite one when
  `n = 1`. `dt` is future timelike. The hyperplane statements are LorentzianGeometry §6.3's
  trichotomy evaluated with `g⁻¹(ζ, ζ) = −c⁻²(ζ₀ + v·ζ′)² + |ζ′|²`; the explicit inequalities
  and the future covector cones are stated here.
- Galilean covariance: `g_{c,v}((τ, ξ + τw), (τ′, ξ′ + τ′w)) = g_{c, v−w}((τ, ξ), (τ′, ξ′))`.
- Identification with the symbol: for a state `U`, `σ(U; ζ)` of §2.2 is positive definite iff
  `ζ` is a future timelike covector of `g_U⁻¹`, positive semidefinite iff `ζ` is future causal, and
  singular iff `ζ` is `g_U⁻¹`-null or, when the root `ζ₀ + v·ζ′` of §2.2 has positive multiplicity
  (barotropic with `n ≥ 2`, full for every `n`), `ζ₀ + v·ζ′ = 0`: the null cone of `g_U⁻¹` is the
  sound sheet of the characteristic variety, and the hyperplane `ζ₀ + v·ζ′ = 0`, characteristic
  for the material derivative `B`, is its other sheet, absent for the barotropic system with
  `n = 1` (§2.2, the multiplicity-zero Check; the identification is proved here. For the sound
  cones of a solution as its causal structure: ChristodoulouMiao2014 lines 869–872;
  Christodoulou2019 lines 134–138).

**Checks.**

- `n = 2`, `c = 2`, `v = (1, 0)`: the Gram matrix is `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]` with
  determinant `−4`; `g(B, B) = −4`; `(1, 3, 0)` is null and `(1, 4, 0)` has `g = 5`; and
  `g⁻¹(dt, dt) = −1/4`. The plausible wrong form `−c²dt² + |dx|²` gives `g(B, B) = −3`.
- The covector `ζ = (−3, 1, 0)` at the same state has `ζ₀ + v·ζ′ = −2`, so it is null and past;
  its kernel contains the null vector `(1, 3, 0)`.
- The boost by `w = v` turns `g_{c,v}` into the static form `g_{c,0}`: the vector `(1, 3, 0)`
  becomes `(1, 2, 0)`, null for `g_{2,0}`.
- Timelike hyperplanes for `n = 1`: with `c = 1`, `v = 0` and `ζ = dx`, `|ζ₀ + vζ₁| = 0 < 1 = c|ζ₁|`,
  so `ker dx` is timelike; it is the time axis `{(τ, 0)}`, where `g((τ, 0), (τ, 0)) = −τ²` takes
  the values `−1` and `−4` at `τ = 1, 2`: negative definite, not indefinite. A definition of
  timelike hyperplanes as those carrying an indefinite form would make `ker dx` none of
  spacelike, null and timelike.

*Needs:* LorentzianGeometry §6.1, §6.3 and §7.3; Mathlib `Matrix.det`; Layer 2.2 for the
identification with the symbol.

### 3.2 Sound-cone fields and causal curves

A *sound-cone field* on a set `D ⊆ 𝔐` is a pair of continuous maps `c : D → (0, ∞)` and
`v : D → E`; the acoustical field of a classical Euler solution is `(c ∘ U, v)`
(`EquationOfState.acousticalCone`, the pair `(c(ρ, s), v)` at each point). The forms
`g_{c(p), v(p)}` of §3.1 with the time field `B(p) = (1, v(p))` are a
`TimeOrientedLorentzianFieldOn D` of LorentzianGeometry §12.6 on `𝔐 = ℝ × E` (Lorentzian with
`B` timelike by its §7.3, and continuous on `D`). The *causal curves* of the field in `D`, their
endpoints and their past-inextendibility in `D` are §12.6's `IsFutureCausalCurveIn`, endpoint
and `IsPastInextendibleIn` for this field. By §12.6's statement on time functions, applied to
the time coordinate, a causal curve on a nontrivial interval becomes after an admissible change
of parameter a time-parametrised one, and in that form a causal curve in `D` is an interval
`J ⊆ ℝ` (a single point allowed) and a map `x : J → E` that is locally Lipschitz on `J`, with
`(t, x(t)) ∈ D` for `t ∈ J`, such that for almost every `t ∈ J` the map `x` is differentiable at
`t` within `J` and `|ẋ(t) − v(t, x(t))| ≤ c(t, x(t))` (`IsCausalCurve κ D J x`, for the cone
field `κ = (c, v)`; the same definition serves any continuous field of round cones `(c, w)`,
`c > 0`, such as the dominating cone fields of §2.1 used in §6.2). Causal curves are
time-parametrised, hence future-directed, from here on; restriction and concatenation are
LorentzianGeometry §8.2 and §12.6, and a piecewise `C¹` curve in `D` whose one-sided tangents are nonzero future causal
vectors is one after reparametrisation by time (§8.2 and §12.6 there). (Minguzzi2019
lines 1359–1363, Theorem 2.12, for the Lipschitz parametrisation of continuous causal curves;
Chrusciel2011 line 534, §2.3; MinguzziCone2019 lines 680–697, §2.1, p. 17, for the locally
absolutely continuous solutions of the differential inclusion (2.2) of a closed cone structure,
and Remark 2.3, lines 698–718, p. 17, for their Lipschitz reparametrisation.)

Prove, beyond LorentzianGeometry §8.2 and §12.6:

- *Integral characterisation.* A continuous `x : J → E` with graph in `D` is a causal curve iff
  `|x(t) − x(s) − ∫ₛᵗ v(r, x(r)) dr| ≤ ∫ₛᵗ c(r, x(r)) dr` for all `s ≤ t` in `J`; in particular
  causal curves are Lipschitz with constant `sup_K (|v| + c)` on any compact piece of their
  graph contained in `K`.
- *Local existence.* If `D` is a domain, `p ∈ D` with `t_p > t₀`, and `|u − v(p)| < c(p)`, the
  segment `x(t) = x_p + (t − t_p)u` is a causal curve on `[t_p − δ, t_p]` for some `δ > 0`, and
  similarly forward in time.
- *Limit curves.* Causal curves with graphs in a compact `K ⊆ D` are equi-Lipschitz, and a
  sequence of them defined on a common `[a, b]` has a subsequence converging uniformly to a causal
  curve. If `D` is a domain, `p_m → p` in `D`, and `x_m` are causal curves in `D` ending at `p_m`
  on `[a_m, t_{p_m}]` with `a_m → a < t_p`, then there are a subsequence, an interval
  `J ⊆ [a, t_p]` containing `t_p` and a causal curve `x : J → E` in `D` ending at `p` such that
  `x_m(s_m) → x(s)` along the subsequence whenever `s_m ∈ [a_m, t_{p_m}]` and `s_m → s ∈ J`
  (uniform convergence on compact subsets of `J`, read with the moving endpoints); if `a ∈ J`
  then in particular `x_m(a_m) → x(a)`, and if `a ∉ J` (for instance if `inf J > a`) then `x` is
  past-inextendible in `D` (Minguzzi2019 line 1917, §2.11; Chrusciel2011 line 1352, §2.6, for
  the classical limit curve theorems). Route: take compact sets `K_1 ⊆ K_2 ⊆ …` with union `D`,
  each in the relative interior of the next (`CompactExhaustion`), and fix `j_p` with `p` in the
  relative interior of `K_{j_p}`. That interior is open in `D`, so for `m` large
  `p_m ∈ K_{j_p} ⊆ K_j` for every `j ≥ j_p`, and the least times `σ_m^j` from which on `x_m` stays
  in `K_j` exist (for `j < j_p` there may be no such time, when `p_m ∉ K_j`); along a diagonal
  subsequence `σ_m^j` converges for every `j ≥ j_p`, and the first statement applies on each
  `K_j`. Either some `K_j` contains the whole graphs of infinitely many `x_m`, and then `a ∈ J`;
  or for every `j ≥ j_p` the `x_m` eventually leave `K_j`, the points
  `(σ_m^j, x_m(σ_m^j))` lie on the relative boundary of `K_j`, and a past endpoint `q ∈ D` of `x`
  would be a limit of points on these boundaries for arbitrarily large `j`, which avoid the
  relative interior of `K_{j₀}` for `j ≥ j₀`, whereas `q` lies in it for some `j₀`. This differs
  from LorentzianGeometry §11.4, which treats causal curves of a spacetime parametrised by arc
  length of an auxiliary complete Riemannian metric, and from the limit curve theorem of its
  §12.7, for inextendible causal curves of a locally Lipschitz metric on a manifold without
  boundary, in that the field is continuous only on `D` and the curves are time-parametrised.
- *Covariance.* Λ-translates, spacetime translations and Galilean boosts carry causal curves of
  a field to causal curves of the transformed field. A boost `(t, x) ↦ (t, x + tw)` changes the
  field `(c, v)` into `(c, v + w)` and is not an isometry of one field, so this is not
  LorentzianGeometry §12.6's covering invariance.

**Checks.**

- Field `(1, 0)`, `n = 1`: `x(t) = t/2` is causal, `x(t) = 2t` is not on any interval of
  positive length (`|2| > 1`; on a one-point interval every map is causal), and
  `x(t) = |t|` on `[−1, 1]` is causal with a corner: Lipschitz, with derivative `±1` off `0`.
- Let `f` be the Cantor function on `[0, 1]` and `x = 10f` with the field `(1, 0)`: `x` is
  continuous with `ẋ = 0` almost everywhere, so it passes a definition that drops the Lipschitz
  condition, but it is not Lipschitz and violates the integral characterisation, since
  `x(1) − x(0) = 10 > 1 = ∫₀¹ c` (compare Minguzzi2019 line 1364, Remark 2.13).
- Field `(1, x)` on `𝔐` (`n = 1`): the material curve `x(t) = eᵗ` has `ẋ = v` and is causal;
  `x(t) = e^{3t}` has `|ẋ − v| = 2e^{3t}`, which on `[0, 1]` is at least `2 > 1`, so it is not
  causal there, while on `(−∞, −(ln 2)/3]`, where `2e^{3t} ≤ 1` (at `t = −1`: `2e^{−3} ≈ 0.0996`),
  it is causal: causality is a property of the curve on its interval.
- Limit curves with `inf J = a`: field `(1, 0)`, `n = 1`, `t₀ = 0`, the domain
  `D = H₀ \ {(1, 0)}`, `x_m ≡ 1/m` on `[1, 2]`, `p_m = (2, 1/m) → p = (2, 0)`, `a_m = a = 1`.
  The limit is `x ≡ 0`, and `J = (1, 2]` because `(1, 0) ∉ D`: `inf J = 1 = a` but `a ∉ J`, and
  `x` is past-inextendible in `D`, since an extension would pass through `(1, 0)`, the limit of
  the starting points `(1, 1/m)`. A version that concludes past-inextendibility only when
  `inf J > a` says nothing here. With `D = H₀` the same curves give `J = [1, 2]`,
  `x_m(1) = 1/m → 0 = x(1)`, and `x` is not past-inextendible: it extends by `0` to `[0, 2]`.
- Moving endpoints: field `(1, 0)`, `D = H₀`, `x_m ≡ 0` on `[1 + 1/m, 2]`, so `a_m ↓ a = 1` and no
  `x_m` is defined at `1`. Convergence along `s_m ∈ [a_m, 2]` gives `J = [1, 2]` and
  `x_m(a_m) = 0 → 0 = x(1)`; a reading that asks every `x_m` to be defined on `J` would force
  `J = (1, 2]` and call `x ≡ 0` past-inextendible, which it is not.
- Unbounded starting points: field `(1, x²)`, `D = [0, 1) × ℝ`, `x_m` the material curve
  `x(s) = 1/(1/4 − s)` through `p = (1/2, −4)` on `[1/4 + 1/m, 1/2]`: `a = 1/4`,
  `x_m(a_m) = −m` is unbounded, `J = (1/4, 1/2]`, and the limit, the same material curve, tends
  to `−∞` at `1/4`, so it is past-inextendible.

*Needs:* LorentzianGeometry §7.3 (the acoustical field is Lorentzian and time-oriented), §8.2
and §12.6 (causal curves in `D`, past-inextendibility, restriction, concatenation, reduction to
time-parametrised curves); Mathlib `LocallyLipschitzOn`,
`LipschitzOnWith.ae_differentiableWithinAt_of_mem`,
`LipschitzOnWith.absolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `BoundedContinuousFunction.arzela_ascoli`,
`CompactExhaustion`, dominated convergence and the Lebesgue differentiation theorem; Layer 3.1
for the field of forms.

### 3.3 Causal pasts and future domains of dependence

Fix a sound-cone field on `D ⊆ H_{t₀}`. A *past causal curve in `D` ending at `p`*
(`IsPastCausalCurve`) is a causal curve `x : J → E` in `D` with `t_p = max J` and
`x(t_p) = x_p`. One such curve *extends* another when its interval contains the other's and the
two agree there. By LorentzianGeometry §12.6 (time functions), a past causal curve is
past-inextendible in `D` in its sense iff it has no proper extension in `D`
(`IsPastInextendible`, this extension form), and the *future domain of dependence* `D⁺_D(S)`
(`futureDomainOfDependence`), which is §12.6's `futureDomainOfDependenceIn` for the field of
§3.2, is the set of `p ∈ D` such that every past-inextendible past causal curve in `D` ending at
`p` meets `S` (Minguzzi2019 lines
3576–3582, Definition 3.1 and Remark 3.2, for piecewise `C¹` causal curves; MinguzziCone2019
lines 1737–1740, Definition 2.17, for continuous causal curves of a closed cone structure and
closed achronal `S`; BarGinouxPfaffle2007 line 1006, Definition 1.3.5, the two-sided Cauchy
development `D(S)`, defined with causal curves inextendible in both directions;
ChristodoulouMiao2014 lines 866–872; HawkingEllis1973 at §6.5; ONeill1983, Ch. 14, causality in
Lorentz manifolds). Chrusciel2011 line 1169, §2.5, treats inextendible
paths; its domain of dependence (lines 1843–1848, §2.9) is the timelike variant `D⁺_I`, defined
with timelike curves, and line 1859 there names the causal variant `D⁺_J` used here.
LorentzianGeometry §12.6 proves `S ∩ D ⊆ D⁺_D(S)`, monotonicity in `S`, the slice identity
`D⁺_D(S) ∩ Σ_{t₀} = S ∩ D` for `S ⊆ Σ_{t₀}` (its slab statement, with the time coordinate as
time function), determination for `S` closed in an open set, and covering invariance; they are
used here as stated there. Define the *causal past* `J⁻_D(p)` (`causalPast`) as the set of
points of past causal curves in `D` ending at `p`; LorentzianGeometry defines causal pasts only
in a spacetime (§8.3 there), not inside a subset. `Suggested.lean` states these
time-parametrised notions on `ℝ × E` directly, because Mathlib and Tau Ceti have no causal curve;
they are the forms to which LorentzianGeometry §12.6 reduces its own, and nothing of that roadmap
is planned again.

Prove:

- Every past causal curve in `D` ending at `p` has a past-inextendible extension in `D` (Zorn's
  lemma on the extension order, `zorn_le_nonempty₀` started at the given curve: every nonempty
  chain glues to a causal curve extending each member, its upper bound). LorentzianGeometry
  §12.6 does not state this existence.
- *Past-closed restriction.* If `D′ ⊆ D` and `J⁻_D(q) ⊆ D′` for every `q ∈ D′`, then
  `J⁻_{D′}(q) = J⁻_D(q)` for `q ∈ D′` and `D⁺_D(S) ∩ D′ ⊆ D⁺_{D′}(S ∩ D′)`.
- *Compact pasts.* If `D` is a domain, `S ⊆ Σ_{t₀}` and `p ∈ D⁺_D(S)`, then every
  past-inextendible causal curve in `D` ending at `p` is defined on `[t₀, t_p]`, `J⁻_D(p)` is
  compact, and `J⁻_D(p) ∩ Σ_{t₀} ⊆ S`. Route: let `q_m = (a_m, x_m(a_m))` lie on past causal
  curves `x_m` in `D` ending at `p`, and pass to `a_m → a ∈ [t₀, t_p]`. If `a = t_p` then
  `q_m → p`, because the field is bounded on a compact neighbourhood of `p` in `D` and the `x_m`
  stay in it for a time independent of `m`. Otherwise the limit-curve statement of §3.2 with
  `p_m = p` gives `q_m → (a, x(a)) ∈ J⁻_D(p)` when `a ∈ J`; when `a ∉ J` its limit `x` is
  past-inextendible in `D`, ends at `p` and misses `Σ_{t₀} ⊇ S`, as `t₀ ≤ a ≤ inf J`, which
  `p ∈ D⁺_D(S)` excludes (Minguzzi2019 line 1917, §2.11, the limit curve theorems, which give the
  classical form of this compactness).
- *Openness.* If moreover `S` is relatively open in `Σ_{t₀}`, then `D⁺_D(S)` is a domain, and
  `q ↦ J⁻_D(q)` is upper semicontinuous on it: every neighbourhood of `J⁻_D(p)` contains
  `J⁻_D(q)` for `q` near `p`. Route: let `q_m → p ∈ D⁺_D(S)` and let `y_m` be past-inextendible
  causal curves in `D` ending at `q_m` that miss `S`; restrict `y_m` to `[a_m, t_{q_m}]` with
  `a_m` less than `1/m` above the infimum of its interval, and pass to `a_m → a`. The field is
  bounded on a compact neighbourhood in `D` of each point of `D`, so if `(a_m, y_m(a_m))`
  converges in `D`, the rest of `y_m`, of duration `< 1/m`, stays in such a neighbourhood, and
  `y_m`, being past-inextendible, is defined down to `t₀`: then `a = t₀`. This convergence holds
  if `a = t_p` (the curves stay near `p`) and if `a ∈ J` in the limit-curve statement of §3.2
  with `p_m = q_m`. If `a < t_p` and `a ∉ J`, the limit `x` is past-inextendible in `D`, ends
  at `p` and misses `Σ_{t₀}`, as `t₀ ≤ a ≤ inf J`, against `p ∈ D⁺_D(S)`. Otherwise `a = t₀`
  and the limit `z` of `(a_m, y_m(a_m))` is `(t₀, x(t₀))` (or `p` itself when `t_p = t₀`), which
  lies in `S` because `x` on `[t₀, t_p]` (or the one-point curve at `p`) is past-inextendible in
  `D` and ends at `p`; then `(t₀, y_m(t₀)) → z`, and since `S` is relatively open in `Σ_{t₀}`,
  `y_m` meets `S` for large `m`, a contradiction. The classical analogue, for closed achronal `S`
  in a spacetime, is Minguzzi2019 line 3718, Proposition 3.16, eq. (3.1),
  `Int D⁺(S) = I⁺(S) ∩ I⁻(D⁺(S))`; the open-`S` statement on a domain is proved here, and
  LorentzianGeometry §12.6 has no openness statement.
- *Idempotence.* In the same setting `D⁺_{D⁺_D(S)}(S) = D⁺_D(S)`: a past-inextendible causal
  curve in `D⁺_D(S)` is past-inextendible in `D`, because its first exit point from `D⁺_D(S)`
  would start a curve not meeting `S` (proved here; the notion is MinguzziCone2019 lines
  1737–1740, Definition 2.17, for closed achronal `S`). This differs from LorentzianGeometry
  §12.6's determination, the same identity for `S` closed in an open set `U` of a manifold
  without boundary: here `S` is relatively open in `Σ_{t₀}` and `D` is a relatively open subset
  of the half-space `H_{t₀}`, which has boundary.
- *Slabs.* If `D = [t₀, t₁) × E` and `c`, `|v|` are bounded on `[t₀, t₂] × E` for every `t₂ < t₁`,
  then every past causal curve in `D` extends to one defined on `[t₀, t_p]`; for `S ⊆ Σ_{t₀}`,
  `D⁺_D(S)` is the set of `p ∈ D` all of whose past causal curves in `D` on `[t₀, t_p]` start in
  `S`; and `D⁺_D(Σ_{t₀}) = D`. Route: the integral characterisation of §3.2 bounds a causal curve
  on `(a, t_p]` by `|x(t) − x_p| ≤ (t_p − a) sup(|v| + c)`, so it has a limit at `a` and extends by
  local existence unless `a = t₀`. Since `D ⊆ H_{t₀}`, a curve on `[t₀, t_p]` has no proper
  extension, so the past-inextendible curves ending at `p` are exactly those on `[t₀, t_p]`, and
  such a curve meets `S ⊆ Σ_{t₀}` iff its starting point lies in `S` (proved here; the two-sided
  analogue is BarGinouxPfaffle2007 line 1006, Definition 1.3.5, the Cauchy development `D(S)`,
  defined with causal curves inextendible in both directions). LorentzianGeometry §12.6's slab
  statement is the slice identity only.
- *Invariance.* If `D`, `S` are Λ-invariant and the field is Λ-periodic, `D⁺_D(S)` is
  Λ-invariant and `J⁻_D(p + λ) = J⁻_D(p) + λ`; translations and Galilean boosts act likewise.
  The Λ-invariance of `D⁺_D(S)` is also LorentzianGeometry §12.6's covering invariance for the
  covering `ℝ × E → ℝ × E/Λ`; the statements on `J⁻_D` and on boosts are not there.

**Checks.**

- Field `(c₀, v₀)` constant on `D = H₀`, `S = {0} × B(0, R)`:
  `D⁺_D(S) = {(t, x) : t ≥ 0, |x − tv₀| < R − c₀t}`; for `S = {0} × {x¹ > 0}`,
  `D⁺_D(S) = {x¹ > (v₀¹ + c₀)t}`, whose boundary is null for `g_{c₀,v₀}` (the configuration of
  LuoYu2023b lines 417–419).
- Closed domains fail: with `n = 1`, field `(1, 0)`, the closed set
  `D = {t ≥ 0, |x| ≤ 1 + t}` and `S = {0} × [−1, 1]`, every past-inextendible curve in `D` reaches
  `t = 0` inside `D ∩ Σ₀ = S`, so `D⁺_D(S) = D`, although data on `S` do not determine a solution at
  `(1, 1.9)`. With the domain `D = {t ≥ 0, |x| < 1 + t}` and `S = {0} × (−1, 1)` the curve
  `x ≡ 1.9` leaves `D` at `t = 0.9` without meeting `S`, and `D⁺_D(S) = {|x| < 1 − t}`.
- The boundedness hypothesis of the slab statement is needed: for `n = 1` and the field
  `(1, x²)` on `D = [0, 1) × ℝ`, the material curve through `(1/2, −4)` is `x(s) = 1/(1/4 − s)`,
  which solves `ẋ = x²`, equals `−4` at `s = 1/2`, is causal, and tends to `−∞` as `s ↓ 1/4`. On
  `(1/4, 1/2]` it is past-inextendible in `D` and never meets `Σ₀`, so `(1/2, −4) ∉ D⁺_D(Σ₀)` and
  `D⁺_D(Σ₀) ≠ D`.
- The description of `D⁺_D(S)` by starting points needs `S ⊆ Σ_{t₀}`: for `n = 1`, the field
  `(1, 0)`, `D = [0, 2) × ℝ` and the point datum `S = {(1, 0)}`, every curve ending at `(1, 0)`
  meets `S` there, so `(1, 0) ∈ S ∩ D ⊆ D⁺_D(S)`, although the causal curve `x ≡ 0` on `[0, 1]`
  starts at `(0, 0) ∉ S`. In fact `D⁺_D(S) = S` (any other point is the end of a curve on
  `[0, t_p]` with slope `0` or `1/2` that avoids `(1, 0)`), while the set of points all of whose
  curves start in `S` is empty.
- Expanding flow, `n = 1`, `p = ρ²/2`, `ρ₀ = 1`, `S = {0} × (−1, 1)`, `D = H₀`: with
  `y = x/(1 + t)` the left-moving boundary characteristic satisfies `ẏ = −(1 + t)^{−3/2}`, so
  `D⁺_D(S) = {(t, x) : |x| < 2√(1 + t) − (1 + t)}`, which closes at `t = 3`; at `t = 1` the half-width
  is `2√2 − 2 ≈ 0.828`, against `1 − t = 0` for the static field `(1, 0)`.
- Causal pasts of a constant field `(c₀, v₀)` on `D = H_{t₀}`:
  `J⁻_D(p) = {(t, x) : t₀ ≤ t ≤ t_p, |x − x_p − (t − t_p)v₀| ≤ c₀(t_p − t)}`, since a causal curve
  satisfies `|x(t) − x_p − (t − t_p)v₀| ≤ c₀(t_p − t)` and the segments to `p` are causal. For
  `n = 1`, the field `(1, 0)`, `t₀ = 0` and `p = (1, 0)` it is `{0 ≤ t ≤ 1, |x| ≤ 1 − t}`: it
  contains `p` (the one-point curve) and `(0, 1)` (the null curve `x = 1 − t`), not `(0, 1.1)`. The
  chronological past `{0 ≤ t < 1, |x| < 1 − t}` omits `p` and `(0, 1)`, and a definition asking
  `|ẋ − v| < c` almost everywhere omits `(0, 1)`, since it would force `|x(1) − x(0)| < 1`.
- The causal past is taken inside `D`, not in `𝔐`: same field and `p`, and the domain
  `D = H₀ \ ({1/2} × [−1, 1])`. A past causal curve from `p` defined at `t = 1/2` would have
  `|x(1/2)| ≤ 1/2`, a point removed from `D`, so `J⁻_D(p) = {1/2 < t ≤ 1, |x| ≤ 1 − t}`; the point
  `(0, 0)` lies in `D` and in the causal past of `p` in `𝔐`, but not in `J⁻_D(p)`, so the past in
  `𝔐` intersected with `D` is the wrong set.
- Compactness of `J⁻_D(p)` needs `p ∈ D⁺_D(S)`: same field and `p`, and
  `D = H₀ \ {(1/2, 0)}`. Then `J⁻_D(p)` is the closed triangle of the first of these Checks
  without `(1/2, 0)` (`(0, 0)` is reached through `(1/2, 1/4)`, with slopes `1/2`), which is not
  compact; and `p ∉ D⁺_D(Σ₀)`, since `x ≡ 0` on `(1/2, 1]` has no extension in `D` (it would pass
  through `(1/2, 0)`) and misses `Σ₀`. The same curve shows `p ∉ D⁺_D(Σ₀)` for the slit domain of
  the previous Check, so the statement on compact pasts makes no claim in either.

*Needs:* LorentzianGeometry §12.6 (`futureDomainOfDependenceIn`, past-inextendibility, the
reduction to time-parametrised curves, concatenation, the slice identity); Mathlib
`zorn_le_nonempty₀`, `IsCompact`; Layer 3.2 (limit curves, local existence, the integral
characterisation).

### Examples

Constant fields and the expanding flow give explicit domains of dependence and causal pasts; the
Cantor curve, the closed domain, the unbounded field, the point datum off the initial slice and
the slit and punctured half-spaces are the negative controls.

### Dependencies

Layer 1 (acoustical fields of solutions), Layer 2.2 (identification with the symbol in §3.1),
LorentzianGeometry §6.1, §6.3, §7.3, §8.2 and §12.6, Mathlib.

## Layer 4: Sobolev spaces on partially periodic carriers

### 4.1 The spaces `Hᵏ_Λ`

Fix a period group `Λ`, its span `V ⊆ E`, the orthogonal projection `π_V`, and a measurable
fundamental domain `F` of `Λ` acting on `E`. Define `Hᵏ_Λ(E; ℝ^N)`, for `k ∈ ℕ`, as the space of
Λ-periodic `u ∈ L²_loc(E; ℝ^N)` whose iterated weak derivatives `∂^αu`, `|α| ≤ k`, exist on `E`
coordinatewise, with `‖u‖²_{Hᵏ_Λ} = Σ_{|α|≤k} ∫_F |∂^αu|² < ∞`. A family `(g_α)_α` of real
functions is a family of iterated weak derivatives of order `k` of a real `u`
(`IsWeakDerivFamily k u g`) when `g_0 = u` and, for `|α| < k` and every direction `i`, `g_{α+eᵢ}`
is a weak derivative of `g_α` in the direction `eᵢ` on all of `E` in the sense of
`TauCeti.HasWeakLineDerivOn` for Lebesgue measure, which includes local integrability. The
squared norm over `F` is `sobolevNormSq F k u ∈ [0, ∞]`, the infimum over such families of
`Σ_{|α|≤k} ∫_F |g_α|²` (`∞` when there is none); for maps into `ℝ^N` it is the sum over the
coordinates (`sobolevNormSqVec`), and for fluid fields `(ρ, v, s) : E → ℝ × E × ℝ` the sum over
`ρ`, the coordinates of `v` and `s` (`stateSobolevNormSq`). Then `u ∈ Hᵏ_Λ` iff `u` is
Λ-periodic and its squared norm over `F` is finite. For a set `I` of times, a map `U` on `I × E`
and a constant state `Ū`, `U − Ū ∈ C(I; Hᵏ_Λ)` (`IsContinuousIn ν I Ū U`, `ν` one of these
squared norms) means that `U(t) − Ū` has finite norm for `t ∈ I` and that `ν(U(t′) − U(t)) → 0`
as `t′ → t` in `I`. This is the Sobolev space of the quotient `E/Λ`; for
`Λ_cyl` it is `Hᵏ(ℝ × (ℝ/2πℤ)^{n−1})`, the space in which AbbresciaSpeck2022 (lines 149–152 and
176–179) poses `H³` data on `ℝ × 𝕋²`.

- Weak derivatives are unique almost everywhere and commute, so all families of iterated weak
  derivatives of `u` give the same value of `Σ_{|α|≤k} ∫_F |g_α|²`, and the infimum defining
  `sobolevNormSq F k u` is that value; a family indexed by multi-indices exists exactly when
  every iterated weak derivative of order at most `k` exists.
- The norm does not depend on `F`; `Hᵏ_Λ` is a real Hilbert space; translations act
  isometrically; `∂ᵢ : Hᵏ⁺¹_Λ → Hᵏ_Λ` is bounded; `∫_F (∂ᵢu)·w = −∫_F u·∂ᵢw` for `u, w ∈ H¹_Λ`.
- For `Λ = 0`, `u ∈ Hᵏ_Λ` iff each coordinate of `u` is the value of an element of
  `TauCeti.Wkp volume ⊤ 2 k` (by induction on `k`, one derivative at a time, through
  `TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`), iff each coordinate is in
  Mathlib's `MemSobolev k 2` (through
  `MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq`), with equivalent norms in both
  cases. In the first case the norms are equal in particular when `k ≤ 1`, and at every order
  when `n = 1`; for `n ≥ 2` and `k = 2` they differ. Tau Ceti's `Wkp` norm squared at order
  `k ≥ 2` is the norm squared at order `k − 1` plus the `L²` norm squared of the highest
  derivative field measured by the operator norm on `TauCeti.IteratedGradient`
  (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean`, module docstring); for `k = 2` that is the
  operator norm of the Hessian rather than its `ℓ²` norm over multi-indices. At order `1` the
  gradient's norm is its Euclidean norm, and for `n = 1` every derivative field is a scalar whose
  operator norm is its absolute value.
- *Localisation.* Fix `χ_Λ ∈ C_c^∞(V)` with `Σ_{λ∈Λ} χ_Λ(· − λ) = 1` on `V`. Then
  `u ↦ (χ_Λ ∘ π_V)u` is bounded from `Hᵏ_Λ` to `Hᵏ(E)`, `u = Σ_{λ∈Λ} τ_λ((χ_Λ ∘ π_V)u)` with a
  locally finite sum, and `‖u‖_{Hᵏ_Λ}` and `‖(χ_Λ ∘ π_V)u‖_{Hᵏ(E)}` are equivalent norms with
  constants depending on `k`, `Λ` and `χ_Λ`. Every whole-space estimate of §§4.2–4.4 transfers to
  `Hᵏ_Λ` through this map.

**Checks.**

- `Λ = 0`, `k = 0`: `H⁰_Λ = L²(E; ℝ^N)` with its norm. At `k = 0` the only family is `g_0 = u`
  and nothing is asked of it, so `sobolevNormSq F 0 u = ∫_F |u|²`; for `n = 1`, `F = E = ℝ` and
  `u = |x|^{−1/2}` on `(−1, 1)`, zero outside, the value is `∫₋₁¹ |x|^{−1} dx = ∞`, not a junk `0`.
- No weak derivative, infinite norm: `n = 1`, `Λ = 0`, `k = 1`, `u` the indicator of `[0, 1]`. A
  weak derivative would be a locally integrable `g` with `∫ φ′u = φ(1) − φ(0) = −∫ φg` for every
  test function `φ`, which no function satisfies (it is `δ₀ − δ₁`), so there is no family and the
  squared norm over `F = E` is `∞`. A definition summing the almost-everywhere classical derivative,
  which is `0`, would give the value `1`.
- The sum runs over multi-indices, so `∂₁∂₂u` is counted once: for `n = 2`, `Λ = 0`, `k = 2` and
  `u = e^{−|x|²}` the value is `5π` (Check below), while a sum over ordered pairs of directions,
  the Hilbert–Schmidt norm of the Hessian, gives `5π + π/2 = 11π/2`.
- The constant `1` lies in `Hᵏ_Λ` for a full-rank `Λ = (2πℤ)^n`, with norm squared `(2π)^n`, but
  not for `Λ = 0` or `Λ = Λ_cyl` (infinite norm): a definition that integrates over a bounded cell
  regardless of the rank would wrongly admit it for `Λ_cyl`.
- `n = 2`, `Λ = Λ_cyl`: `u = e^{−(x¹)²} cos x²` has `‖u‖²_{L²_Λ} = √(π/2) · π`, while `cos x²` alone
  is not in `H⁰_Λ`.
- `n = 2`, `Λ = 0`, `k = 2`, `u = e^{−|x|²}`: `∫ u² = π/2`, `∫ |∇u|² = π`, and the Hessian is
  `(4xxᵀ − 2I)u`, so `Σ_{|α|=2} ∫ |∂^αu|² = 3π/2 + 3π/2 + π/2 = 7π/2` and the `H²_Λ` norm squared
  is `5π`; its operator norm is `max(2, |4|x|² − 2|)u`, whose square integrates to
  `2π(1 − e^{−2}) + 10πe^{−2} = (2 + 8e^{−2})π`, so the `TauCeti.Wkp volume ⊤ 2 2` norm squared is
  `(7/2 + 8e^{−2})π ≈ 4.58π`. The two norms differ and are equivalent. For `k = 1` both norms
  of `u` are `(∫ u² + |∇u|²)^{1/2}`. A claim of equal norms for every `k` is refuted.
- `n = 1`, `Λ = 0`, `k = 2`, `u = e^{−x²}`: `‖u‖₂² = ‖u′‖₂² = √(π/2)` and `‖u″‖₂² = 3√(π/2)`, so
  both squared norms are `5√(π/2)`; a claim that the norms differ at every order `k ≥ 2` is
  refuted in dimension one.
- `n = 1`, `Λ = 2πℤ`, `k = 1`, `u = cos x`: the Fourier coefficients for the probability Haar
  measure of `ℝ/2πℤ` are `c_{±1} = 1/2`, so the `TauCeti.CircleSobolev 1 ℂ` norm squared of `u`
  is `2 · 2² · (1/4) = 2`, while the constant `1` has `1`; here the values are `2π` and `2π`. The
  ratios `π` and `2π` differ, so the two norms are equivalent (the weights `(1 + |m|)²` and
  `2π(1 + m²)` have ratio between `1/(2π)` and `1/π`) but not proportional.
- `n = 1`, `Λ = 2πℤ`, `u = cos x`: `‖u‖²_{H¹_Λ} = π + π = 2π`. For full-rank `Λ = (2πℤ)^n`
  and `u(x) = Σ c_m e^{im·x}`, `‖u‖²_{H¹_Λ} = (2π)^n Σ (1 + |m|²)|c_m|²`, while the squared
  `H¹` norm (squared `L²` norms of the function and of its gradient, summed, for the Lebesgue
  measure of total mass `1`) of the rescaled function `y ↦ u(2πy)` on the unit-period torus
  `UnitAddTorus (Fin n)` is `Σ (1 + 4π²|m|²)|c_m|²`; for `cos x` the two values are `2π` and
  `(1 + 4π²)/2`. The norms are equivalent and not equal; an agreement claim that ignores the
  rescaling is refuted here.
- Against the periodic Besov spaces of PDE §7.2 (`𝕋 = ℝ/ℤ` of length `1`, the blocks of PDE §7.1
  acting on Fourier coefficients with its `2π` convention), `n = 1`, `Λ = 2πℤ`, `k = 1`: the
  change of variable `y = x/2π` turns `cos x` into `cos 2πy`, of frequency `|ξ| = 1`, carried by
  the block `P_0` alone (`χ = 1` on the unit ball, so for `j ≥ 1` the multiplier
  `ψ(2^{−j}ξ) = χ(2^{−j−1}ξ) − χ(2^{−j}ξ)` vanishes at `|ξ| = 1`). Its `B^s_{2,2}(𝕋)` norm
  squared is `‖cos 2πy‖²_{L²(𝕋)} = 1/2` for every `s`, in particular at `s = 1`, against `2π` for
  `‖cos x‖²_{H¹_Λ}`; the constant `1` has `1` against `2π`. The ratios `4π` and `2π` differ: the
  two norms are equivalent, not proportional.
- Continuity in time, `n = 1`, `Λ = 0`, `k = 0`, `Ū = 0`, `w = 1_{[0, 1]}`, so that the squared
  norm is `∫ |·|²`. Transport `U(t, x) = w(x − t)` is in `C([0, 1]; L²)`: the squared norm of
  `U(t′) − U(t)` is the length of `[t′, t′ + 1] Δ [t, t + 1]`, which is `2|t′ − t|` for
  `|t′ − t| ≤ 1`. The escaping bump `U(t, x) = w(x − 1/t)` for `t > 0`, `U(0, ·) = w`, has squared
  norm `1` at every `t`, so its norm is continuous in `t`, but `U(t) − U(0)` has squared norm `2`
  for `0 < t < 1` (the intervals `[1/t, 1/t + 1]` and `[0, 1]` are disjoint): it is not in
  `C([0, 1]; L²)`, and a definition asking only for continuity of `t ↦ ‖U(t) − Ū‖` would admit
  it. The finiteness clause is not implied by the continuity clause: `U ≡ 1` has
  `U(t′) − U(t) = 0` for all `t, t′`, yet `U(t) − Ū = 1` has infinite squared norm on `Λ = 0`.

*Needs:* Tau Ceti `TauCeti.HasWeakLineDerivOn`, `TauCeti.HasWeakFDerivOn`, `TauCeti.Wkp`,
`TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn` (with
`TauCeti.Wkp.exists_hasWeakLineDerivOn_value` and
`TauCeti.Wkp.exists_value_eq_of_forall_hasWeakLineDerivOn`),
`MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq`, `TauCeti.Wkp.lowerOrder_translate`
and `TauCeti.Wkp.iteratedGradient_translate` (translations); Mathlib
`MeasureTheory.IsAddFundamentalDomain`, `Finset.Nat.antidiagonalTuple`,
`TemperedDistribution.MemSobolev`, `MeasureTheory.Lp`, `ContDiffBump`.

### 4.2 Embeddings, interpolation and lower semicontinuity

Prove: if `2k > n + 2j`, every `u ∈ Hᵏ_Λ` has a `Cʲ` representative with
`sup_{|α|≤j} ‖∂^αu‖_∞ ≤ C‖u‖_{Hᵏ_Λ}`, `C = C(n, k, j, Λ)`, whose derivatives of order `≤ j` tend to
`0` at infinity in the directions orthogonal to `V`; the inclusion `Hᵏ_Λ ⊆ C^j_b` is bounded
(for `Λ = 0`, `TauCeti.Wkp.exists_contDiffOn_ae_eq` with `Ω = ⊤` for the `Cʲ` representative,
and `TauCeti.Wkp.toZeroAtInfty` applied to `∂^αu ∈ H^{k−|α|}`, `|α| ≤ j`, for the bound and the
decay: the classical derivatives of the representative are continuous and equal almost everywhere
to the continuous representatives of the `∂^αu`, hence equal to them; in general through the
localisation of §4.1). Prove the interpolation inequality
`‖u‖_{Hʲ_Λ} ≤ C‖u‖_{L²_Λ}^{1−j/k}‖u‖_{Hᵏ_Λ}^{j/k}` for `k ≥ 1` and `0 ≤ j ≤ k`; at `k = 0` the only
order is `j = 0`, the exponent `j/k` is undefined, and the statement is the identity
`‖u‖_{H⁰_Λ} = ‖u‖_{L²_Λ}`. Prove lower semicontinuity: if
`u_m → u` in `L²_Λ` and `‖u_m‖_{Hᵏ_Λ} ≤ M`, then `u ∈ Hᵏ_Λ` and `‖u‖_{Hᵏ_Λ} ≤ M`, by the `L²`
difference-quotient criterion (Tau Ceti
`TauCeti.exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le`) applied
derivative by derivative. These are the standard Sobolev facts of Majda1984, Ch. 2, §2.1; the
embedding is LukNotes line 1210, Theorem 5.5, for `Λ = 0`.

- For `2k > n + 2`, the `C¹` representatives of `u − Ū` and their first derivatives are bounded
  and uniformly continuous; this is what makes `Hᵏ` solutions classical.
- Convergence in `L²_Λ` together with a bound in `Hᵏ_Λ` gives convergence in `Hʲ_Λ` for every
  `j < k`, and in `C^i_b` for `2j > n + 2i`.

**Checks.**

- `n = 1`, `Λ = 0`, `u = e^{−x²}`: `‖u‖²₂ = ‖u′‖²₂ = √(π/2)`, and `sup |u| = 1`, consistent with
  the one-dimensional bound `sup |u|² ≤ ‖u‖₂‖u′‖₂ = √(π/2) ≈ 1.2533`.
- `n = 2`, `k = 1` (`2k = n`): a cut-off of `log log(1 + 1/|x|)` is in `H¹(ℝ²)` and unbounded, so
  the hypothesis `2k > n` cannot be weakened to `2k ≥ n`.
- Interpolation witness on `ℝ`, `j = 1`, `k = 2`, `u = e^{−x²}`: `‖u‖₂² = ‖u′‖₂² = √(π/2)` and
  `‖u″‖₂² = 3√(π/2)`, so `‖u‖²_{H¹} = 2√(π/2) ≤ ‖u‖₂‖u‖_{H²} = √(π/2)·√5`. The wrong exponent
  pair `‖u‖_{L²}^{2/3}‖u‖_{H²}^{1/3}` is refuted by the dilations `u(λx)`, `λ → ∞`: the left side
  grows like `λ^{1/2}`, the right side like `λ^{1/6}`.
- Agreement with Tau Ceti's additive form `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` at
  `p = 2`, `n = 1`, `u = e^{−x²}`: the infimum over `ε` of `ε‖u″‖₂ + ‖u‖₂/ε` is
  `2‖u‖₂^{1/2}‖u″‖₂^{1/2} = 2·3^{1/4}(π/2)^{1/4} ≈ 2.947`, and the left side is
  `‖u′‖₂ = (π/2)^{1/4} ≈ 1.120`. The exponent pair `(3/4, 1/4)` in place of `(1/2, 1/2)` fails
  under `u(λx)`: `‖u′‖₂` scales as `λ^{1/2}`, `‖u‖₂^{1/2}‖u″‖₂^{1/2}` as `λ^{1/2}`, but
  `‖u‖₂^{3/4}‖u″‖₂^{1/4}` as `λ^{0}`, so the ratio grows like `λ^{1/2}` as `λ → ∞`.

*Needs:* §4.1; Tau Ceti `TauCeti.Wkp.toZeroAtInfty`,
`TemperedDistribution.MemSobolev.exists_zeroAtInftyContinuousMap_ae_eq`,
`TauCeti.Wkp.exists_contDiffOn_ae_eq` (with `TauCeti.HasWeakFDerivOn.contDiffOn_succ`),
`TauCeti.exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le`; Mathlib
Plancherel, `MeasureTheory.Lp.fourierTransformₗᵢ`, for the interpolation inequality on `E`
(Tau Ceti `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` is its case `j = 1`, `k = 2`,
`Λ = 0`; `TauCeti.CircleSobolev.toContinuousMap` with
`TauCeti.CircleSobolev.norm_toContinuousMap_le` is the case `n = 1`, `Λ = Tℤ`, `j = 0`, complex
values, of the embedding, and with `TauCeti.CircleSobolev.hasDerivAt_toContinuousMap` and
`TauCeti.CircleSobolev.derivative` its case `j ≥ 1`, `2k > 1 + 2j`).

### 4.3 Gagliardo–Nirenberg interpolation and Moser estimates

Prove, for `u, f, g ∈ L^∞ ∩ Hᵏ_Λ` and multi-indices `α` (the commutator and composition
estimates state their own hypotheses):

- *Gagliardo–Nirenberg.* For `k ≥ 1` and `1 ≤ i ≤ k`,
  `‖Dⁱu‖_{L^{2k/i}_Λ} ≤ C‖u‖_∞^{1−i/k}‖u‖_{Hᵏ_Λ}^{i/k}`, and for `Λ = 0` the homogeneous form with
  `‖Dᵏu‖_{L²}` in place of `‖u‖_{Hᵏ}` (Nirenberg1959 line 318, the Theorem of Lecture II,
  inequality (2.2), with `m = k`, `j = i`, `q = ∞`, `r = 2`, `a = i/k`; Majda1984, Ch. 2, §2.1).
  The endpoint `i = 0` is the `L^∞` norm itself and is not part of the statement; at `k = 0`
  there is no positive order and nothing is asserted.
- *Products.* For `|α| ≤ k`, `‖∂^α(fg)‖_{L²_Λ} ≤ C(‖f‖_∞‖g‖_{Hᵏ_Λ} + ‖f‖_{Hᵏ_Λ}‖g‖_∞)`; hence
  `Hᵏ_Λ` is an algebra when `2k > n`. Route: expand `∂^α(fg)` by the Leibniz rule; the terms
  `f∂^αg` and `(∂^αf)g` are bounded by `‖f‖_∞‖g‖_{Hᵏ_Λ}` and `‖f‖_{Hᵏ_Λ}‖g‖_∞`, and each term
  `∂^βf ∂^{α−β}g` with `0 < β < α` by Hölder's inequality with exponents `2|α|/|β|` and
  `2|α|/|α − β|`, the Gagliardo–Nirenberg inequality at order `|α|` for both factors and Young's
  inequality (Majda1984, Ch. 2, §2.1).
- *Commutators.* Let `k ≥ 1`, `1 ≤ |α| ≤ k`, let `f` be Λ-periodic and locally integrable with
  weak gradient `∇f ∈ L^∞ ∩ Hᵏ⁻¹_Λ` (`f` itself need not lie in `L²_Λ`; when `2k > n + 2`,
  `f − f̄ ∈ Hᵏ_Λ` for a constant `f̄` suffices, by the embedding of §4.2), and let
  `g ∈ L^∞ ∩ Hᵏ⁻¹_Λ`. The commutator `[∂^α, f]g = Σ_{0<β≤α} (α choose β) ∂^βf ∂^{α−β}g` contains
  derivatives of `g` of order at most `|α| − 1` only, equals `∂^α(fg) − f∂^αg` when moreover
  `g ∈ Hᵏ_Λ`, is unchanged when a constant is added to `f`, and satisfies
  `‖[∂^α, f]g‖_{L²_Λ} ≤ C(‖∇f‖_∞‖g‖_{Hᵏ⁻¹_Λ} + ‖∇f‖_{Hᵏ⁻¹_Λ}‖g‖_∞)` (Majda1984, Ch. 2, §2.1). Route:
  with `m = |α| − 1`, write each term as `∂^{β−e}(∂_e f) ∂^{α−β}g` for a unit multi-index
  `e ≤ β`, with orders `i = |β| − 1` and `j = |α − β|`, `i + j = m`. For `m = 0` it is `∂_e f · g`,
  bounded by `‖∇f‖_∞‖g‖_{L²_Λ}`; for `m ≥ 1` the terms with `i = 0` or `j = 0` are bounded by
  `‖∇f‖_∞‖g‖_{Hᵐ_Λ}` or `‖∇f‖_{Hᵐ_Λ}‖g‖_∞`, and the others by Hölder's inequality with exponents
  `2m/i` and `2m/j`, the Gagliardo–Nirenberg inequality at order `m ≤ k − 1` for `∂_e f` and for
  `g`, and Young's inequality, since the product of the two bounds is
  `(‖∂_e f‖_∞‖g‖_{Hᵐ_Λ})^{j/m}(‖∂_e f‖_{Hᵐ_Λ}‖g‖_∞)^{i/m}`.
- *Composition.* For `Φ` smooth on an open `G ⊆ ℝ^N`, a compact `K ⊆ G`, `Ū ∈ K` and `u` with
  values in `K` and `u − Ū ∈ Hᵏ_Λ`: `Φ(u) − Φ(Ū) ∈ Hᵏ_Λ` with
  `‖Φ(u) − Φ(Ū)‖_{Hᵏ_Λ} ≤ C(Φ, K, k)‖u − Ū‖_{Hᵏ_Λ}`, and for `Λ = 0` and `k ≥ 1` the top
  derivatives obey `‖DᵏΦ(u)‖_{L²} ≤ C(Φ, K, k)‖Dᵏu‖_{L²}` (at `k = 0` only the centred bound is
  asserted); and `u ↦ Φ(u)` is continuous for the `Hᵏ_Λ` topology on such `u` (LukNotes
  line 1612, Lemma 6.8, for `Φ(0) = 0`, which the centring at `Ū` reduces to; Majda1984, Ch. 2,
  §2.1).

The constants depend on `n`, `k`, `Λ` and, for the composition, on `K`, on a `δ > 0` such that
the closed `δ`-neighbourhood `K_δ` of `K` lies in `G`, and on `Φ` through its derivatives of
order at most `max(1, k)` on `K_δ`. At order `0` the composition constant is a Lipschitz
constant of `Φ` on `K`: for `a, b ∈ K`,
`|Φ(a) − Φ(b)| ≤ max(sup_{K_δ} |DΦ|, 2δ^{−1} sup_K |Φ|) |a − b|`, by the mean value theorem on
the segment `[a, b] ⊆ K_δ` when `|a − b| ≤ δ` and trivially when `|a − b| > δ`; this secant
bound is what the order-zero part of every order uses, also when `K` is not convex and the
segment from `Ū` leaves `G`. Every constant is independent of `u`, `f`, `g`.

**Checks.**

- Scaling witness for the homogeneous (`Λ = 0`) Gagliardo–Nirenberg inequality: for
  `u_λ(x) = u(λx)`, `‖Dⁱu_λ‖_{L^{2k/i}}` and `‖u_λ‖_∞^{1−i/k}‖Dᵏu_λ‖_{L²}^{i/k}` both scale as
  `λ^{i − ni/(2k)}`. The wrong exponent `L^{k/i}` gives a left side scaling as `λ^{i − ni/k}`, so
  the ratio of the wrong left side to the right side scales as `λ^{−ni/(2k)}`: it is unbounded
  as `λ → 0` and tends to `0` as `λ → ∞`, so the refutation is by spreading `u` out, not by
  concentrating it. For `n = 1`, `k = 2`, `i = 1` the wrong left side scales as `λ^{1/2}` and
  the right side as `λ^{3/4}`; the ratio `λ^{−1/4}` is `2` at `λ = 1/16` and `1/2` at `λ = 16`.
- The `L^∞` factors are needed: on `ℝⁿ`, `u = |x|^{−n/3}` on the unit ball (zero outside) is in
  `L²`, but `u² = |x|^{−2n/3}` has `∫ u⁴ = ∞` near `0`, so `L² = H⁰` is not an algebra.
- Commutator with a coefficient outside `L²`: `Λ = 0`, `n = 1`, `k = 2`, `α = 2`, `f = 1 + e^{−x²}`
  (Burgers' coefficient at `U = 1 + e^{−x²}`, `Ū = 1`; `∫ f² = ∞`) and `g = e^{−x²}`. Then
  `[∂², f]g = 2f′g′ + f″g = (12x² − 2)e^{−2x²}`, of squared `L²` norm `(19/8)√π ≈ 4.21`, so of norm
  `≈ 2.05`, while `‖f′‖_∞ = √2e^{−1/2} ≈ 0.858`, `‖g‖²_{H¹} = 2√(π/2)`, `‖f′‖²_{H¹} = 4√(π/2)` and
  `‖g‖_∞ = 1` give the right side `≈ 0.858 · 1.583 + 2.239 · 1 ≈ 3.60` with `C = 1`. A statement
  asking `f ∈ Hᵏ_Λ` would say nothing here (`‖f‖_{H²} = ∞`), and §5.3 applies the estimate to
  exactly such coefficients; replacing `f` by `f − 1` changes neither side.
- Composition with `Φ(u) = u²`, `n = 1`, `k = 1`: `‖(u²)′‖₂ = ‖2uu′‖₂ ≤ 2‖u‖_∞‖u′‖₂`, the constant
  `2 sup_K |u|` predicted by the composition estimate.
- Order zero, composition: `Λ = 0`, `K = {0}`, `u = Ū = 0`, `Φ ≡ 1`. The uncentred top-derivative
  bound at `k = 0` would read `‖Φ(u)‖_{L²(E)} ≤ C‖u‖_{L²(E)}`, with left side `∞` (the constant `1`
  is not in `L²(E)`) and right side `0`; the centred bound gives `‖Φ(u) − Φ(Ū)‖ = 0 ≤ 0`. This is
  why the top-derivative form is stated for `k ≥ 1` only.
- Order zero, constant dependence: `Λ = 0`, `n = N = 1`, `K = [0, 1]`, `Ū = 0`,
  `Φ_m(s) = sin(ms)` and `u_m = m^{−1}1_{[0,1]}`, with values in `{0, 1/m} ⊆ K`. Then
  `sup_K |Φ_m| = 1` for `m ≥ 2`, `‖u_m‖_{L²} = 1/m` and `‖Φ_m(u_m) − Φ_m(0)‖_{L²} = sin 1 ≈ 0.8415`,
  so the order-zero constant is at least `m sin 1` (`8.41`, `84.1`, `841` at `m = 10, 100, 1000`)
  while every order-zero bound of `Φ_m` on `K` stays `1`: a constant controlled by `sup_K |Φ|`
  alone does not exist. With the first derivative (`K` is convex here, so the Lipschitz
  constant on `K` is `sup_K |Φ_m′| = m`) the bound reads `sin 1 ≤ m · m^{−1} = 1`.
- The hypothesis `Ū ∈ K` is needed: `Λ = 2πℤ`, `n = N = 1`, `Φ(y) = y³`, `K = {0}`, `δ = 1`,
  `u ≡ 0` and `Ū = a > 1`, so that `u − Ū = −a ∈ Hᵏ_Λ`. Then
  `‖Φ(u) − Φ(Ū)‖_{Hᵏ_Λ}/‖u − Ū‖_{Hᵏ_Λ} = a³/a = a²` at every order (`100` at `a = 10`), unbounded
  in `a`, while `Φ` on `K_δ = [−1, 1]`, and with it the order-zero constant
  `max(sup_{[−1, 1]} 3y², 2 · 0) = 3` of `K`, does not change: no constant depending on `K` and
  `Φ` on `K_δ` alone exists. For `K ∪ {Ū} = {0, 10}` the order-zero constant is
  `max(3 · 11², 2 · 1000) = 2000 ≥ 100`; this enlargement is how §§5.3 and 7.1 meet the
  hypothesis.
- Order zero, interpolation: at `k = i = 0` the Gagliardo–Nirenberg exponents `2k/i` and `i/k`
  are `0/0`, and at `k = j = 0` the interpolation exponent `j/k` of §4.2 is `0/0`; the statements
  start at `k ≥ 1`, `i ≥ 1`, and the `k = 0` case of §4.2 is the identity on `L²_Λ`. At `k = 1`,
  `i = 1` the inequality is `‖Du‖_{L²_Λ} ≤ C‖u‖_{H¹_Λ}`, true with `C = 1`.
- The approximants leave `G` when `2k ≤ n`: `n = 3`, `N = 2`, `Λ = 0`, `k = 1`,
  `G = {1/2 < |y| < 2}`, `K` the unit circle, `Ū = (1, 0)`, and `u = (cos ϑ, sin ϑ)` with
  `ϑ = πβ(|x|)x₃/|x|`, where `β = 1` on `[0, 1]`, `β(r) = 2 − r` on `[1, 2]` and `β = 0` beyond.
  Then `u` takes values in `K`, `u − Ū` is bounded and vanishes for `|x| ≥ 2`, `|∇u| = |∇ϑ|` is
  bounded on `1 ≤ |x| ≤ 2`, and on the unit ball `|∇ϑ|² = π²(1 − t²)/|x|²` with `t = x₃/|x|`, so
  `∫_{|x|≤1} |∇u|² = π²(4π − 4π/3) = 8π³/3`: `u − Ū ∈ H¹(ℝ³)`. For a radial kernel `φ` supported
  in the unit ball and `ε ≤ 1`, `t` is uniformly distributed on `[−1, 1]` over every sphere about
  `0`, so `J_εu(0) = (½∫₋₁¹ cos πt dt, ½∫₋₁¹ sin πt dt) = (0, 0) ∉ G`. For `Φ(y) = 1/|y|`, smooth
  on `G`, `Φ(J_εu(0))` has no value, while the cut-off `Φ̃` of the route below (with `δ = 1/4`)
  has `Φ̃(J_εu(0)) = Φ̃(0) = 0`; a route that composes the approximants with `Φ` itself fails
  here. For `2k > n` the approximants converge uniformly (§4.2) and lie in `K_δ` for small `ε`.

*Needs:* §§4.1–4.2; Mathlib Hölder's inequality and Young's inequality `Real.young_inequality`;
Tau Ceti's Leibniz rule
`TauCeti.HasWeakLineDerivOn.contDiffOn_smul`, `TauCeti.HasWeakFDerivOn.contDiffOn_smul` and
`TauCeti.HasWeakLineDerivOn.lipschitzOnWith_smul` (smooth or Lipschitz factor; two Sobolev
factors by density through §4.4), `TauCeti.HasWeakFDerivOn`; for the composition, the
cut-off `Φ̃ = χΦ`, extended by `0` outside `G`, with `χ` smooth on `ℝ^N`, equal to `1` on the
`δ/2`-neighbourhood of `K` and supported in `K_δ` (the indicator of the `3δ/4`-neighbourhood of
`K` mollified at radius `δ/8`, whose derivatives of order `j` are at most `(8/δ)^j` times an
`L¹` norm of the kernel): `Φ̃` is smooth with compact support on `ℝ^N`, `Φ̃ ∘ u = Φ ∘ u` because
`u` takes values in `K`, and the smooth approximants `Ū + J_ε(u − Ū)` of §4.4, which may leave
`G` when `2k ≤ n` (Check above), are composed with `Φ̃`, never with `Φ`; then
`TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn` applied componentwise to `Φ̃ ∘ u` for smooth
`u`, whose classical derivatives up to order `k` are given by Mathlib's chain rule
`HasFDerivAt.comp` and Faà di Bruno formula `HasFTaylorSeriesUpToOn.comp`, and density through
§4.4 (in the scalar case `N = 1`, `k = 1`, Tau Ceti `TauCeti.W1p.hasWeakFDerivOn_comp`, applied
on bounded open sets to `u − Ū` and to `s ↦ Φ̃(Ū + s)`, gives the weak chain rule directly). The
derivatives of `Φ̃` of order at most `max(1, k)` are bounded by those of `Φ` on `K_δ` and powers
of `δ^{−1}`, the dependence stated for the constants above. Tau
Ceti `TauCeti.W1p.mul`, `TauCeti.W1p.norm_mul_le` and `TauCeti.W1p.mulL` are the case
`Λ = 0`, `n = k = 1` of the algebra property; `TauCeti.CircleSobolev.norm_mul_le` and
`TauCeti.CircleSobolev.toContinuousMap_nemytskii` are the case `n = 1`, `Λ = Tℤ`, integer order
`s = k ≥ 1`, complex values, of the algebra property and of the composition statement (for
holomorphic `Φ`), up to the norm equivalence of §4.1.

### 4.4 Friedrichs mollifiers

Construct, for `ε > 0`, `J_ε u = φ_ε ⋆ u` with `φ ∈ C_c^∞(E)` even, nonnegative, `∫ φ = 1`,
`φ_ε = ε^{−n}φ(·/ε)` (Mathlib `MeasureTheory.convolution`). Prove: `J_ε` preserves
Λ-periodicity and maps `Hᵏ_Λ` into `⋂_j Hʲ_Λ`; `‖J_εu‖_{Hᵏ_Λ} ≤ ‖u‖_{Hᵏ_Λ}`; `J_ε` is symmetric
for the `L²_Λ` pairing; `J_εu → u` in `Hᵏ_Λ` as `ε → 0`;
`‖J_εu‖_{Hᵏ⁺¹_Λ} ≤ C(1 + ε^{−1})‖u‖_{Hᵏ_Λ}` for every `ε > 0`, hence
`‖J_εu‖_{Hᵏ⁺¹_Λ} ≤ 2Cε^{−1}‖u‖_{Hᵏ_Λ}` for `0 < ε ≤ 1` (the orders `≤ k` are bounded by the
contraction and each derivative of order `k + 1`, `∂ᵢJ_ε∂^αu = ∫ ∂ᵢφ_ε(z) τ_z∂^αu dz`, by the
bound `‖∫ k(z) τ_z w dz‖ ≤ ‖k‖_{L¹}‖w‖` for Bochner integrals of translates, with
`‖∂ᵢφ_ε‖_{L¹} = ε^{−1}‖∂ᵢφ‖_{L¹}`);
for `k ≥ 1` and every `ε > 0`, `‖J_εu − u‖_{Hᵏ⁻¹_Λ} ≤ Cε‖u‖_{Hᵏ_Λ}`; and Friedrichs' lemma: for
`a` bounded, Lipschitz and Λ-periodic (for `Λ = 0`: any bounded Lipschitz `a`),
`‖J_ε(a∂ᵢu) − a∂ᵢJ_εu‖_{L²_Λ} ≤ C(‖a‖_∞ + Lip a)‖u‖_{L²_Λ}` for `u ∈ H¹_Λ` and every `ε > 0`, the
commutator extends to `L²_Λ` with the same bound and tends to `0` strongly as `ε → 0`
(Majda1984, Ch. 2, §2.1; Friedrichs1954). Periodicity of `a` is what makes `a∂ᵢu` and the
commutator Λ-periodic.

The kernel class is the general one above. Tau Ceti's mollifiers are the special case of
normalised bumps (`φ` the normalisation of a `ContDiffBump`, which is radial and positive at
`0`), for which, at `Λ = 0` and in Tau Ceti's `Wkp` norm, the contraction and the convergence
`J_εu → u` are `TauCeti.Wkp.norm_normedBumpL_le_one` and `TauCeti.Wkp.tendsto_normedBumpL` at
`p = 2` (with `TauCeti.Wkp.lowerOrder_normedBumpL` and `TauCeti.Wkp.iteratedGradient_normedBumpL`
for the derivatives). This section owns the extension of these two statements to every
admissible kernel and every period group. The commutation `∂^αJ_εu = J_ε∂^αu` is not restated:
for every admissible kernel and every `Λ` it is Tau Ceti's
`TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right` with `Ω = ⊤`, applied successively to
the weak derivatives of §4.1 (supplier contracts), and it is used throughout below. Route: write
`J_εu = ∫ φ(y) τ_{−εy}u dy`, a Bochner integral of the translates `τ_h = TauCeti.Wkp.translate h`
(the sign convention of `τ` is immaterial because `φ` is even), which depend continuously on
`y` (`TauCeti.Wkp.continuous_translate` at `p = 2`) and are isometries
(`TauCeti.Wkp.norm_translate`, `TauCeti.Wkp.translateLIE`). The contraction follows from
`φ ≥ 0` and `∫ φ = 1`: the norm of a Bochner integral is at most the integral of the norm
(`MeasureTheory.norm_integral_le_integral_norm`), so `‖J_εw‖ ≤ ∫ φ(y)‖τ_{−εy}w‖ dy = ‖w‖` for
every `w`, and in the multi-index norm of §4.1 this bound is applied to each `J_ε∂^αu = ∂^αJ_εu`;
no separate convolution inequality is used. The strong convergence follows from
`‖J_εu − u‖ ≤ ∫ φ(y)‖τ_{−εy}u − u‖ dy`, whose integrand is at most `2φ(y)‖u‖` and tends to `0`
for each `y`, by dominated convergence. For `Λ ≠ 0` the same route runs in `Hᵏ_Λ`, with the
translation isometries of §4.1 and their continuity in the translation vector obtained through
the localisation of §4.1. On a normalised bump the route recovers the cited Tau Ceti statements.
Proved here as well are the `ε^{−1}` gain and `ε` loss bounds, the `L²_Λ` symmetry and
Friedrichs' lemma. The loss bound: for `|α| ≤ k − 1` the function
`w = ∂^αu` lies in `H¹_Λ`, `J_εw − w = ∫ φ(y)(τ_{−εy}w − w) dy` because `∫ φ = 1`, and for
`Λ = 0` the translation estimate `‖τ_hw − w‖_{L²} ≤ |h|‖∇w‖_{L²}`
(`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`, on all of `H¹(E)` by
`TauCeti.w1p0Submodule_top_eq_top`) gives `‖J_εw − w‖_{L²} ≤ ε(∫ |y|φ(y) dy)‖∇w‖_{L²}`; summing
over `α`, each derivative of order between `1` and `k` occurs at most `n` times as some `∂ᵢ∂^α`,
so `C = √n ∫ |y|φ(y) dy` serves. For `Λ ≠ 0` the localisation of §4.1 gives
`‖τ_hw − w‖_{L²_Λ} ≤ C′|h|‖w‖_{H¹_Λ}` with `C′` depending on `Λ` and `χ_Λ`, which is enough.

**Checks.**

- `J_ε` fixes constants (for full-rank `Λ`) because `∫ φ_ε = 1`; the wrong scaling
  `φ_ε = φ(·/ε)` multiplies constants by `εⁿ`.
- `n = 1`, `Λ = 2πℤ`: `J_ε cos(mx) = φ̂(εm) cos(mx)` with `φ̂(η) = ∫ φ(y) cos(ηy) dy`, a factor in
  `[−1, 1]` tending to `1` as `εm → 0`; with `m ≈ 1/ε` the gain `ε^{−1}` in the `Hᵏ⁺¹` bound is
  attained up to a constant, so it cannot be improved. The loss bound needs `k ≥ 1`: for `k = 0` it
  would read `‖J_εu − u‖_{L²} ≤ Cε‖u‖_{L²}`, but `‖J_ε cos(mx) − cos(mx)‖₂ = |1 − φ̂(εm)|‖cos(mx)‖₂`
  tends to `‖cos(mx)‖₂` as `m → ∞` (Riemann–Lebesgue), exceeding `Cε‖cos(mx)‖₂` once `Cε < 1`; for
  `k = 1` it holds, since `|1 − φ̂(η)| ≤ |η|∫|y|φ(y) dy` gives
  `|1 − φ̂(εm)|√π ≤ Cεm√π ≤ Cε‖cos(mx)‖_{H¹_Λ}` with `‖cos(mx)‖²_{H¹_Λ} = π(1 + m²)`.
- The gain needs the `1 + ε^{−1}` form for large `ε`: for `Λ = 2πℤ` and `u = 1`, `J_εu = 1` and
  `‖1‖_{Hᵏ⁺¹_Λ} = ‖1‖_{Hᵏ_Λ} = √(2π)`, so a bound `Cε^{−1}‖u‖_{Hᵏ_Λ}` for all `ε > 0` would give
  `1 ≤ C/ε`, false at `ε = 2C`; the stated bound gives `1 ≤ C(1 + ε^{−1})`, true for `C ≥ 1`.
- Friedrichs' lemma needs a Λ-periodic coefficient: for `Λ = 2πℤ`, `u = sin x` and
  `a = sin(x/2)` (bounded, Lipschitz, `4π`-periodic and `2π`-antiperiodic) the commutator is
  `½[(φ̂(3ε/2) − φ̂(ε)) sin(3x/2) − (φ̂(ε/2) − φ̂(ε)) sin(x/2)]`, which with
  `φ̂(η) = 1 − μ₂η²/2 + o(η²)`, `μ₂ = ∫ y²φ(y) dy > 0`, equals `μ₂ε²/8 + o(ε²)` at `x = π` and its
  negative at `x = 3π`: it is not `2π`-periodic and is not an element of `L²_Λ`. For `a = sin x`
  the commutator is `2π`-periodic, and for constant `a` it vanishes.
- Friedrichs' commutator vanishes for constant `a` (`J_ε` commutes with `∂ᵢ`). For `a(x) = x`
  on `ℝ` (only its Lipschitz constant enters) it equals `ψ′ ⋆ u` with `ψ(z) = −zφ_ε(z)`, and
  `‖ψ′‖_{L¹} = ∫ |φ(w) + wφ′(w)| dw` does not depend on `ε`, as the lemma predicts; a bound of
  the form `Cε^{−1}` would be the trivial one.
- The kernel class is wider than the normalised bumps: on `ℝ`, with `η` even, nonnegative,
  smooth, of integral `1` and supported in `(−1/4, 1/4)`, the kernel
  `φ(x) = (η(x − 2) + η(x + 2))/2` is even, nonnegative, smooth, compactly supported, of
  integral `1`, and has `φ(0) = 0`, while every normalised `ContDiffBump` is positive at `0`; so
  `J_ε` for this `φ` is not one of Tau Ceti's `TauCeti.Wkp.normedBumpL`. The translation route
  still applies: `J_εu = ½(τ_{2ε} + τ_{−2ε})(η_ε ⋆ u)`, a contraction, and
  `‖J_εu − u‖ ≤ ∫ φ(y)‖τ_{−εy}u − u‖ dy → 0`; and `∂ᵢJ_εu = J_ε∂ᵢu` is the pinned
  `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right`, `φ` being smooth with compact support,
  while no `TauCeti.Wkp.normedBumpL` statement covers it.

*Needs:* §4.1; Mathlib `MeasureTheory.convolution`, `ContDiffBump`, the Bochner integral with
`MeasureTheory.norm_integral_le_integral_norm`, and dominated convergence; Tau Ceti `TauCeti.Wkp.translate`,
`TauCeti.Wkp.continuous_translate`, `TauCeti.Wkp.norm_translate` and `TauCeti.Wkp.translateLIE`
for the general kernel; `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right` (with
`TauCeti.HasWeakLineDerivOn.hasLineDerivAt_convolution_right`) for `∂^αJ_εu = J_ε∂^αu`;
`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` and
`TauCeti.w1p0Submodule_top_eq_top` for the loss bound; `TauCeti.Wkp.normedBumpL`, `TauCeti.Wkp.norm_normedBumpL_le_one`,
`TauCeti.Wkp.lowerOrder_normedBumpL`, `TauCeti.Wkp.iteratedGradient_normedBumpL`,
`TauCeti.Wkp.tendsto_normedBumpL` for the normalised-bump case, and
`TauCeti.Wkp.dense_contDiff_representatives`.

### Examples

Gaussians and trigonometric polynomials on the cylinder are the worked members of `Hᵏ_Λ`; the
critical logarithm and the `|x|^{−n/3}` singularity are the negative controls for the embedding
and the algebra property.

### Dependencies

Tau Ceti's Sobolev spaces and Mathlib; no earlier layer.

## Layer 5: energy estimates for linear symmetric hyperbolic systems

### 5.1 Linear symmetric hyperbolic operators and the energy identity

A *linear symmetric hyperbolic operator* on `[0, T] × E` (Λ-periodic coefficients) is a linear
system `LinearSystem n N` of SymmetricHyperbolicSystems §1.2,
`LW = A⁰∂_tW + Σᵢ Aⁱ∂ᵢW + BW`, with `∂_tW` the `L²_Λ`-valued time derivative and `∂ᵢW` the weak
derivatives (supplier contracts), satisfying its `LinearSystem.IsSymmetricHyperbolic` with a
constant `λ₀ > 0` (so `A⁰` and the `Aⁱ` take symmetric values and `A⁰ ≥ λ₀I`), whose
coefficients are Λ-periodic and satisfy on `[0, T] × E`: `A⁰` bounded and of class `C¹` with
bounded first derivatives, `Aⁱ` bounded and continuous with bounded continuous spatial
derivatives `∂ⱼAⁱ` (no time derivative of `Aⁱ` enters), and `B` continuous and bounded.
Coefficients given on `[0, T] × E` are extended to all times by their values at `t = 0` and
`t = T`, which keeps the predicate (it quantifies over every `(t, x)`); the values for
`t ∉ [0, T]` play no other role. The bound on `A⁰` makes `E` below finite and
comparable to `‖W‖²_{L²_Λ}`, and the bounds on `A^μ` and `B` put `LW` in `C([0, T]; L²_Λ)` for
every `W` in the class below; bounded derivatives alone do neither on a non-compact quotient
`E/Λ` (Check below). Define its energy
`E(t) = ∫_F ⟨A⁰(t)W(t), W(t)⟩`. Prove the Friedrichs energy identity for
`W ∈ C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`:

    dE/dt = ∫_F ⟨(∂_tA⁰ + Σᵢ ∂ᵢAⁱ − B − Bᵀ)W, W⟩ + 2∫_F ⟨LW, W⟩

and the `L²` estimate `‖W(t)‖_{L²_Λ} ≤ Ce^{Ct}(‖W(0)‖_{L²_Λ} + ∫₀ᵗ ‖LW(s)‖_{L²_Λ} ds)` with `C`
depending on `λ₀`, `sup‖A⁰‖`, `sup|∂_tA⁰|`, `sup|∂ᵢAⁱ|` and `sup‖B‖`; hence uniqueness for the
linear Cauchy problem in this class (Friedrichs1954, pp. 345–392; Majda1984, Ch. 2, §2.1;
LukNotes line 679, Proposition 4.1, for the wave equation). SymmetricHyperbolicSystems §2.1
proves the pointwise form of this identity for classical solutions, and its §2.3 the integrated
form and the `L²` estimate for classical solutions vanishing outside a bounded set; the
statement here differs by the class (`W` in `C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`, not `C¹`
and not compactly supported) and by integration over a fundamental domain of `Λ`, that is over
the quotient `E/Λ`, which is not compact unless `Λ` has full rank.

- The identity is invariant under multiplying `L` by a positive constant and under Λ-translation.
- The estimate holds backwards in time with the same constant.

**Checks.**

- Scalar transport `A⁰ = 1`, `A¹ = a`, `B = 0`: the solution is `W(t, x) = W₀(x − at)` and `E` is
  constant, as the identity gives.
- `A⁰ = I`, `Aⁱ = 0`, `B = bI` (`b` constant): `E(t) = e^{−2bt}E(0)`, matching the term
  `−(B + Bᵀ)`; a sign error would give `e^{2bt}`.
- The non-symmetric `A¹ = [[0, 1], [0, 0]]` with `A⁰ = I`, `B = 0` has solutions
  `W = (g(x) − tf′(x), f(x))` whose `L²` norm grows like `t‖f′‖₂`, so no `L²` estimate in terms of
  `‖W(0)‖₂` holds: symmetry is necessary.
- Bounded coefficients are needed, not only bounded derivatives: `n = N = 1`, `Λ = 0`,
  `A⁰(x) = √(1 + x²)`, `A¹ = B = 0` and the stationary `W(t, x) = (1 + x²)^{−1/2}`. Then
  `A⁰ ≥ 1`, `|∂ₓA⁰| ≤ 1`, `LW = 0`, `‖W‖₂² = π` and `‖∂ₓW‖₂² = π/8`, so `W` is in the class, but
  `∫_{−R}^{R} A⁰W² = 2 asinh R → ∞`: the energy is infinite and the estimate in terms of
  `sup‖A⁰‖ = ∞` is empty. The bound on `A⁰` excludes it; with `A⁰ = 1` instead, `E = π` and both
  sides of the identity are `0`.
- `L` acts through weak derivatives, not pointwise ones: `n = 2`, `N = 1`, `Λ = 0`, `A⁰ = A¹ = 1`,
  `A² = 0`, `B = 0`, and `W(t, x) = h(x)` with `h = Σ_k 2^{−k} η(x − q_k) log log(1/|x − q_k|)`
  (value `0` at the `q_k`), `η ≥ 0` smooth, supported in `B(0, 1/4)` and equal to `1` near `0`,
  `(q_k)` dense in `ℝ²`. Each term is in `H¹(ℝ²)` with the same norm (`∫ dr/(r log²(1/r)) < ∞`
  near `0`), so `h ∈ H¹(ℝ²)`; it is unbounded on every open set, hence differentiable nowhere,
  and `LinearSystem.apply W` vanishes identically. But `LW = ∂₁h ≠ 0` (an `L²` function with
  `∂₁h = 0` is `0`), and the solution with data `h` is `h(x₁ − t, x₂)`; read pointwise, `L` would
  make the constant `W` a second solution and uniqueness would fail.

*Needs:* SymmetricHyperbolicSystems §1.2 (the carrier and the predicate); §4.1 (integration by
parts on `F`); Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`.

### 5.2 Weighted energies with characteristic-monotone weights

Let `χ : [0, T] × E → [0, ∞)` be Lipschitz and Λ-periodic, with `{χ > 0}` relatively compact
modulo `Λ` (its image in `([0, T] × E)/Λ` has compact closure), and let `W` be Λ-periodic and
`C¹`, and the coefficients of `L` be `C¹`, on a relatively open subset of `[0, T] × E` containing
the closure of `{χ > 0}`. Call `χ` *characteristic-monotone* for `L` when `∂_tχ A⁰ + Σᵢ ∂ᵢχ Aⁱ`
is negative semidefinite at almost every point of `{χ > 0}`. Prove that then
`E_χ(t) = ∫_F χ⟨A⁰W, W⟩` is finite and Lipschitz in `t` and satisfies `E_χ(t) ≤ e^{Ct}E_χ(0)`
whenever `|LW| ≤ C₁|W|` on `{χ > 0}`, with `C` depending on `λ₀`, the bounds of the coefficients
and of their first derivatives on the closure of `{χ > 0}`, and `C₁`; in particular `W = 0` on
`{χ(0, ·) > 0}` forces `W = 0` on `{χ > 0}`. For a quasilinear system linearised at `U₁`
(§2.1, difference bound; §6.1 makes the linearised operator an operator of §5.1 by a cutoff
equal to `1` near the closure of `{χ > 0}`) the condition reads `σ(U₁; dχ) ≤ 0`, and for the
Euler systems `∂_tχ + v₁·∇χ + c₁|∇χ| ≤ 0` almost everywhere on `{χ > 0}` (LukNotes line 724,
Proposition 4.4, the localised energy of the wave equation on backward cones; Majda1984, Ch. 2,
§2.1, the energy method, whose localised form is proved here).

This extends SymmetricHyperbolicSystems §2.2, which is the case `Λ = 0`, `w = 0` (a static cone
of a single speed), with a smoothed weight and `LW = 0` on the cone, to Lipschitz
characteristic-monotone weights, moving cones `(M, w)`, periodic lifts and the hypothesis
`|LW| ≤ C₁|W|`. The two notions of speed agree: for `c > 0`, `c` is a speed of the system at a
point in the sense of SymmetricHyperbolicSystems' Conventions (`|ξ·(Σⱼ ωⱼAʲ)ξ| ≤ c ξ·A⁰ξ` for
`|ω| ≤ 1`) iff the round cone `(c, 0)` dominates there. Indeed, for `ζ₀ ≥ c|ζ′|` and `ζ′ = |ζ′|ω`,
`ξ·σ(ζ)ξ ≥ (ζ₀ − c|ζ′|) ξ·A⁰ξ ≥ 0`; conversely the covectors `(c, ±ω)`, `|ω| ≤ 1`, satisfy the
cone condition and give `∓ξ·(Σⱼ ωⱼAʲ)ξ ≤ c ξ·A⁰ξ`. (A speed `0` forces every `Aʲ = 0` and has no
round cone, whose opening is positive.)

- The proof differentiates `E_χ`, which is finite and Lipschitz in `t` because `W`, `∂W` and the
  coefficients are Λ-periodic and continuous, hence bounded, on the closure of `{χ > 0}`, which is
  compact modulo `Λ`; it inserts the pointwise identity of SymmetricHyperbolicSystems §2.1 (in
  the local form of the supplier contracts), integrates by parts in `x` against the Lipschitz
  weight (`LipschitzWith.integral_lineDeriv_mul_eq`, through the localisation of §4.1 when
  `Λ ≠ 0`) and drops the term `∫_F⟨σ(dχ)W, W⟩ ≤ 0`.
- The truncated periodised moving cone `χ = φ₊` with
  `φ(t, x) = max_{λ∈Λ} (R − |x − λ − x₀ − tw| − Mt)` (for `Λ = 0`,
  `χ = (R − |x − x₀ − tw| − Mt)₊`) is Lipschitz and Λ-periodic, with `{χ > 0}` inside the
  Λ-translates of `[0, T] × B(x₀, R + |w|T)`, hence relatively compact modulo `Λ`, and
  characteristic-monotone for every operator dominated by `(M, w)` on its support: at almost
  every point of `{χ > 0}` the differential of `χ` is that of one term attaining the maximum (a
  maximum of Lipschitz functions that is differentiable at a point where an attaining term is
  differentiable has that term's differential), and for that term `dχ = (e·w − M, −e)` with `e`
  a unit vector, so `σ(dχ) = −σ((M − e·w, e)) ≤ 0` because `M − e·w + w·e = M ≥ M|e|`. A single
  cone `R − |x − x₀ − tw| − Mt` is not Λ-periodic when `Λ ≠ 0` (for `n = 1`, `Λ = 2πℤ` and `t = 0`
  it takes the values `R` at `x₀` and `R − 2π` at `x₀ + 2π`) and is not an admissible weight
  there; its periodisation is.

**Checks.**

- Transport with `a = 1`: `χ = (1 − |x| − t)₊` has `∂_tχ + ∂_xχ = −1 − sign x ≤ 0` on `{χ > 0}`;
  `χ = (1 − |x| − t/2)₊` has `−1/2 + 1 = 1/2 > 0` for `x < 0`, and indeed `u = f(x − t)` with
  `f` supported in `(−2, −1)` has `E_χ(0) = 0` but `E_χ(0.9) > 0`, its support `(−1.1, −0.1)`
  meeting `{|x| < 0.55}`.
- Euler at a constant state `(ρ₀, v₀)`, `Λ = 0`: `χ = (R − |x − tv₀| − c₀t)₊` gives
  `∂_tχ + v₀·∇χ + c₀|∇χ| = (e·v₀ − c₀) − v₀·e + c₀ = 0` with `e = (x − tv₀)/|x − tv₀|`: the sound
  cone itself is admissible, with equality.
- A non-moving cone `(R − |x| − Mt)₊` at the state `v₀ = 3`, `c₀ = 1` (`n = 1`) is admissible only
  for `M ≥ 4 = |v₀| + c₀`, while the moving cone needs only `M = 1`.
- Speeds against dominating cones, transport `∂_tu + a∂_xu = 0` with `a = 1`: the least speed
  in the sense of SymmetricHyperbolicSystems is `|a| = 1` (`|ξ·(ωa)ξ| = |ω|ξ² ≤ cξ²` for
  `|ω| ≤ 1` iff `c ≥ 1`), and `(c, 0)` dominates iff `c ≥ 1` (at `ζ = (c, −1)` the symbol is
  `c − 1`). With `c = 1/2` both fail: `ω = 1` gives `1 > 1/2`, and `ζ = (1/2, −1)` gives the symbol
  `−1/2 < 0`. A bridge identifying a speed `c` with the cone `(c, a)` would be wrong: `(1/2, 1)`
  dominates (symbol `ζ₀ + ζ₁ ≥ (1/2)|ζ₁| ≥ 0` on its cone) although `1/2` is not a speed.
- Regularity up to the closure of `{χ > 0}` is needed: `Λ = 0`, `L = ∂_t`, `χ = (1 − |x|)₊`
  (independent of `t`) and `W = (1 − x)^{−1}` on `(−1, 1)`. `W` is `C¹` on the open set
  `[0, T] × (−1, 1) = {χ > 0}`, `LW = 0` and `σ(dχ) = ∂_tχ = 0`, but
  `∫₀¹ χW² dx = ∫₀¹ (1 − x)^{−1} dx = ∞`, so `E_χ` is not finite; `W` is not `C¹` on a neighbourhood
  of the closure `[0, T] × [−1, 1]`, which the hypothesis demands.

*Needs:* §5.1; §2.1 (difference bound); SymmetricHyperbolicSystems §2.1 (pointwise identity)
and its Conventions (speed, for the comparison with dominating cones); §4.1 (localisation, for
`Λ ≠ 0`); Mathlib Rademacher
`LipschitzOnWith.ae_differentiableWithinAt_of_mem` and integration by parts for Lipschitz
functions `LipschitzWith.integral_lineDeriv_mul_eq`; Tau Ceti
`TauCeti.le_mul_exp_of_le_add_mul_integral`.

### 5.3 `Hᵏ` estimates for the linearised quasilinear system

Fix a quasilinear symmetric hyperbolic system, `k` with `2k > n + 2`, a compact `K ⊆ G` and a
constant state `Ū ∈ K`; constants `C` below depend only on `K`, the system, `n`, `k` and `Λ`. For
`U` with values in `K` and `U − Ū ∈ C([0, T]; Hᵏ_Λ) ∩ C¹([0, T]; Hᵏ⁻¹_Λ)`, and `W` in the same
class solving `A⁰(U)∂_tW + Σᵢ Aⁱ(U)∂ᵢW = f` with `f ∈ C([0, T]; Hᵏ_Λ)`, prove that
`E_k(t) = Σ_{|α|≤k} ∫_F ⟨A⁰(U)∂^αW, ∂^αW⟩` is `C¹` on `[0, T]` and that at every `t`

    dE_k/dt ≤ C(1 + ‖∂_tU‖_∞ + ‖U − Ū‖_{Hᵏ_Λ}) E_k + C(1 + ‖U − Ū‖_{Hᵏ_Λ}) E_k^{1/2} ‖f‖_{Hᵏ_Λ},

and the tame estimate for `W = U − Ū` when `U` itself solves the system with `F(Ū) = 0`:
`dE_k/dt ≤ C(1 + ‖∇U‖_∞)E_k` (Majda1984, Ch. 2, §§2.1–2.2; LukNotes line 1620, Theorem 6.10,
for the analogous breakdown estimate of wave equations). Route: with `Mⁱ = (A⁰)⁻¹Aⁱ` write the
equation as `∂_tW + Σᵢ Mⁱ(U)∂ᵢW = A⁰(U)⁻¹f`, apply `∂^α` and multiply by `A⁰(U)`:

    A⁰(U)∂_t∂^αW + Σᵢ Aⁱ(U)∂ᵢ∂^αW = A⁰(U)(∂^α(A⁰(U)⁻¹f) − Σᵢ [∂^α, Mⁱ(U)]∂ᵢW).

Applying `∂^α` to the equation directly produces instead the time commutator
`[∂^α, A⁰(U)]∂_tW`, and eliminating `∂_tW` by the equation leads to the same two terms. The
commutator `[∂^α, Mⁱ(U)]∂ᵢW = [∂^α, Mⁱ(U) − Mⁱ(Ū)]∂ᵢW` is bounded by the commutator estimate of
§4.3, with `f = Mⁱ(U) − Mⁱ(Ū) ∈ L^∞ ∩ Hᵏ_Λ` (composition estimate; `Mⁱ(U)` itself is not in
`L²_Λ` when `Λ` is not of full rank and `Mⁱ(Ū) ≠ 0`) and `g = ∂ᵢW ∈ L^∞ ∩ Hᵏ⁻¹_Λ`, by
`C(‖∇U‖_∞‖W‖_{Hᵏ_Λ} + ‖U − Ū‖_{Hᵏ_Λ}‖∇W‖_∞)`, where `‖∇U‖_∞` and `‖∇W‖_∞` are controlled by the
`Hᵏ_Λ` norms since `2k > n + 2`. The forcing term is bounded by
the product and composition estimates of §4.3 after writing
`A⁰(U)⁻¹ = A⁰(Ū)⁻¹ + (A⁰(U)⁻¹ − A⁰(Ū)⁻¹)`:
`‖A⁰(U)⁻¹f‖_{Hᵏ_Λ} ≤ C(1 + ‖U − Ū‖_{Hᵏ_Λ})‖f‖_{Hᵏ_Λ}`, using `‖f‖_∞ ≤ C‖f‖_{Hᵏ_Λ}`; this is where
the forcing coefficient acquires `‖U − Ū‖_{Hᵏ_Λ}`, which it cannot avoid (Check below). The energy
identity of §5.1, applied to `J_ε∂^αW` and passed to the limit with Friedrichs' lemma (§4.4) for
the commutators `[J_ε, Mⁱ(U)]∂ᵢ∂^αW` (the `Mⁱ(U)` are Lipschitz and Λ-periodic), gives `E_k` as
the integral of a continuous function, hence `C¹`. In the tame estimate the forcing term is
`∂^α(A⁰(U)⁻¹F(U))`; since `A⁰(U)⁻¹F(U)` is a smooth function of `U` vanishing at `Ū`, its
`Hᵏ_Λ` norm is at most `C‖U − Ū‖_{Hᵏ_Λ}` by the composition estimate, the commutator terms are at
most `C‖∇U‖_∞‖U − Ū‖_{Hᵏ_Λ}`, and the coefficient terms `∂_tA⁰(U)`, `∂ᵢAⁱ(U)` at most
`C(‖∂_tU‖_∞ + ‖∇U‖_∞)`.

- Equivalence of energies: `λ_K‖W‖²_{Hᵏ_Λ} ≤ E_k ≤ Λ_K‖W‖²_{Hᵏ_Λ}` with `λ_K, Λ_K` the extreme
  eigenvalues of `A⁰` on `K`.
- For a classical solution `U` with values in `K`,
  `‖∂_tU‖_∞ ≤ C(‖F(U)‖_∞ + ‖∇U‖_∞) ≤ C(1 + ‖∇U‖_∞)`, since
  `∂_tU = A⁰(U)⁻¹(F(U) − Σᵢ Aⁱ(U)∂ᵢU)` and `F` is bounded on `K`; when `F = 0`, as for the Euler
  systems, `‖∂_tU‖_∞ ≤ C‖∇U‖_∞`. The `1` of the tame estimate absorbs the source through this
  bound.

**Checks.**

- Constant `U ≡ Ū`: the coefficients are constant, the commutator terms vanish and `E_k` is
  conserved for `f = 0`, as for scalar transport.
- Burgers `∂_tu + u∂_xu = 0` (`A¹ = u`) with `W = u`: `d/dt‖u‖²₂ = −∫ u²u_x = 0` and
  `d/dt‖u_x‖²₂ = −∫ u_x³`, bounded by `‖u_x‖_∞‖u_x‖²₂`, which is the tame form with `C = 1`.
- The forcing coefficient depends on `‖U − Ū‖_{Hᵏ_Λ}`: on `Λ = 2πℤ` (`n = 1`) with `k = 2`,
  `N = 1`, `G = (−3/2, 3/2)`, `A⁰(u) = 1/(2 + u)`, `A¹ = 0`, `K = [−1, 1]`, `Ū = 0`, take the
  stationary `U = sin(mx)`, `f = 1` and `W = (δ + t)(2 + sin(mx))`, which solves
  `A⁰(U)∂_tW = 1`. With `r = 2 + sin(mx)`, `E₂ = (δ + t)²S_m` where
  `S_m = ∫₀^{2π}(r² + r′² + r″²)/r ≥ πm⁴/3`, so at `t = 0` `dE₂/dt = 2δS_m` and `E₂ = δ²S_m`.
  Dividing a bound `dE₂/dt ≤ C₀E₂ + C₁E₂^{1/2}‖f‖_{H²_Λ}` by `δ` and letting `δ → 0` gives
  `2√S_m ≤ C₁√(2π)`, so
  `C₁ ≥ √(2/3)m²` for every `m`: no `C₁` depending on `K` alone works. The stated coefficient
  `C(1 + ‖sin(mx)‖_{H²_Λ})` grows like `m²`, and indeed `√S_m ≤ ‖r‖_{H²_Λ} ≤ C(1 + m²)`.
- The source term in the bound for `∂_tU` is needed: `N = n = 1`, `A⁰ = 1`, `A¹ = 0`, `F(u) = u`,
  `Ū = 0`, `Λ = 2πℤ`, `U(t, x) = eᵗ` on `[0, log 2]`, `K = [0, 2]`: at `t = 0`, `‖∂_tU‖_∞ = 1`
  while `‖∇U‖_∞ = 0`, so `‖∂_tU‖_∞ ≤ C‖∇U‖_∞` fails; the stated bound reads `1 ≤ C(1 + 0)`.

*Needs:* §2.1 (the system), §§4.1–4.3, §4.4 (Friedrichs' lemma, for the differentiability of
`E_k`), §5.1; Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`.

### 5.4 Linear existence in `Hᵏ_Λ`

Prove: for a linear system `LinearSystem n N` of SymmetricHyperbolicSystems §1.2 satisfying
`LinearSystem.IsSymmetricHyperbolic` with constant `λ₀` (so `A⁰` and every `Aⁱ` take symmetric
values and `A⁰ ≥ λ₀I`), whose coefficients `A^μ(t, x)`, `B(t, x)` satisfy
`A^μ − Ā^μ, B ∈ C([0, T]; Hᵏ_Λ)` for constant matrices `Ā^μ`, with
`A⁰ − Ā⁰ ∈ C¹([0, T]; Hᵏ⁻¹_Λ)` in addition (so that `∂_tA⁰` is bounded, since `2(k − 1) > n`; by
the embedding of §4.2 the coefficients then have the bounds of §5.1, and `L` is an operator of
§5.1), `2k > n + 2`, data `W₀ ∈ Hᵏ_Λ` and `f ∈ C([0, T]; Hᵏ_Λ)`, there is a
unique `W ∈ C([0, T]; Hᵏ_Λ) ∩ C¹([0, T]; Hᵏ⁻¹_Λ)` with `LW = f`, `W(0) = W₀`, obeying the estimate
`dE_k/dt ≤ C E_k + C E_k^{1/2}‖f‖_{Hᵏ_Λ}`, `E_k = Σ_{|α|≤k} ∫_F ⟨A⁰∂^αW, ∂^αW⟩`, with `C` depending
on `n`, `N`, `k`, `Λ`, `λ₀`, the constant matrices `Ā⁰, …, Āⁿ` (the spatial ones included),
`sup_t ‖∂_tA⁰‖_∞`, `sup_t ‖A^μ − Ā^μ‖_{Hᵏ_Λ}` and `sup_t ‖B‖_{Hᵏ_Λ}` (Majda1984, Ch. 2, §2.1;
Kato1975, Theorem II, whose case of coefficients independent of the unknown gives the linear
statement for `Λ = 0` on a short interval, carried to `[0, T]` by the estimate; both with `A⁰`
Lipschitz in time; LukNotes line 1158, Theorem 5.3, proves the
wave-equation analogue by
duality). The time derivative of `A⁰` enters through the term `∫⟨∂_tA⁰ W, W⟩` of the energy identity
of §5.1, so the hypothesis on `A⁰` is part of the statement; `Aⁱ` and `B` need no time derivative.
Route: the Friedrichs regularisation
`A⁰∂_tW_ε = −Σᵢ J_ε(Aⁱ∂ᵢJ_εW_ε) − BW_ε + f` is an ODE with Lipschitz right-hand side in
`Hᵏ_Λ` and has a solution on `[0, T]` by `IsPicardLindelof` and the uniform bound. The estimate
of the statement holds for `W_ε` uniformly in `ε`. §5.3 is not used for it, being stated for
coefficients `A^μ(U)` with `U − Ū ∈ C¹([0, T]; Hᵏ⁻¹_Λ)` and for `B = 0`; its computation is
carried out with `A^μ(t, x)` and `B(t, x)`. Write the regularised equation as
`∂_tW_ε = −(A⁰)⁻¹(Σᵢ J_ε(Aⁱ∂ᵢJ_εW_ε) + BW_ε − f)` and apply `∂^α`, `|α| ≤ k`. The commutators of
`∂^α` with `(A⁰)⁻¹` and with `Aⁱ`, and the terms `∂^α((A⁰)⁻¹BW_ε)` and `∂^α((A⁰)⁻¹f)`, are
bounded by the commutator, product and composition estimates of §4.3 through
`sup_t ‖A^μ − Ā^μ‖_{Hᵏ_Λ}` and `sup_t ‖B‖_{Hᵏ_Λ}`: a commutator is unchanged when the constant
`Āⁱ` is subtracted from `Aⁱ`, and matrix inversion is composed on the compact set
`{λ₀I ≤ A ≤ sup‖A⁰‖ I}` of symmetric matrices, centred at `Ā⁰`, which lies in it when `Λ` is not
of full rank (then `A⁰(t, x) → Ā⁰` orthogonally to the span of `Λ`), and at a value of `A⁰` when
`Λ` has full rank (then constants lie in `Hᵏ_Λ`). The term `∫_F ⟨∂_tA⁰∂^αW_ε, ∂^αW_ε⟩` is bounded
through `sup_t ‖∂_tA⁰‖_∞`. In the principal term, with `V = J_ε∂^αW_ε`,
`Σᵢ ∫_F ⟨J_ε(Aⁱ∂ᵢ∂^αJ_εW_ε), ∂^αW_ε⟩ = Σᵢ ∫_F ⟨Aⁱ∂ᵢV, V⟩ = −½ Σᵢ ∫_F ⟨(∂ᵢAⁱ)V, V⟩` by the
`L²_Λ` symmetry of `J_ε`, the symmetry of `Aⁱ` and integration by parts on `F` (§4.1). No time
derivative of `Aⁱ` or `B` enters, and nothing depends on `ε`, `J_ε` being a contraction on every
`Hʲ_Λ` (§4.4). Then `(W_ε)` is Cauchy in `C([0, T]; L²_Λ)` by §5.1; the limit is in
`C([0, T]; Hᵏ⁻¹_Λ)` with an `Hᵏ` bound by §4.2, solves the equation, and is strongly continuous
in `Hᵏ_Λ` because the weighted energy `E_k(t)` is continuous (the energy identity of §5.1 applied
to `J_δ∂^αW`, passed to the limit `δ → 0` with Friedrichs' lemma of §4.4) and the equation is
time-reversible. This differs from SymmetricHyperbolicSystems §7.3 by the class: data, forcing
and coefficients in `Hᵏ_Λ` (coefficients in `Ā + C([0, T]; Hᵏ_Λ)`), against smooth compactly
supported data and forcing and `C_b^∞` coefficients there.

**Checks.**

- Constant-coefficient transport: `W = W₀(x − at)`, in `C([0, T]; Hᵏ_Λ)` for every `k`, with
  `W_ε` given on the Fourier side by `e^{−iatmφ̂(εm)²}Ŵ₀(m)`.
- Uniqueness forces the zero solution for zero data and forcing. Symmetry is needed: the Jordan
  block of §5.1, `A⁰ = I`, `A¹ = [[0, 1], [0, 0]]`, `B = 0`, `f = 0`, has constant coefficients
  (`A^μ = Ā^μ`) and `A⁰ ≥ I`, and its only solution with data `(g, h)` is `(g − th′, h)`, which
  for `h ∈ Hᵏ_Λ` with `h′ ∉ Hᵏ_Λ` leaves `Hᵏ_Λ` at every `t > 0`; `A¹` is not symmetric, so
  `LinearSystem.IsSymmetricHyperbolic` fails and the statement does not apply.
- The constant depends on the spatial background matrices: on `Λ = 2πℤ` (`n = N = 1`) with
  `k = 2`, `A⁰ = e^{sin x}`, `A¹ = M` constant, `B = f = 0` and `W(0) = sin x + sin 2x`, take
  `Ā⁰ = 1`, `Ā¹ = M`, `λ₀ = e^{−1}`: `∂_tA⁰ = 0`, `A¹ − Ā¹ = 0` and `A⁰ − Ā⁰` do not depend on `M`.
  With `a = e^{sin x}`, `w = W(0)` and `∂_tW = −Mw′/a`, integration by parts gives
  `dE₂/dt / M = 2∫cos x (w′)² + 4∫cos x (w″)² + 2∫(−sin x − cos²x) w″w′ = 2·2π + 4·4π + 2(π + 0) = 22π`
  at `t = 0`, while `E₂(0) ≤ e(2π + 5π + 17π) = 24eπ`. A constant independent of `M` would give
  `22πM ≤ C·24eπ` for every `M`; with `C` depending on `|Ā¹| = M` there is no contradiction.

*Needs:* SymmetricHyperbolicSystems §1.2 (the linear system and its predicate), §§4.1–4.4 (the
commutator, product and composition estimates of §4.3; the mollifier and Friedrichs' lemma of
§4.4), §5.1; Mathlib `IsPicardLindelof`,
`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`.

### Examples

Transport, the first-order wave system and the Euler system linearised at a constant state are
the worked operators, with the explicit energies above.

### Dependencies

Layer 2 (symbol, dominance, difference bound), Layer 4, and SymmetricHyperbolicSystems §1.2
(carrier) and §2.1 (pointwise identity).

## Layer 6: local uniqueness and domains of dependence

### 6.1 Lens-shaped domains and local uniqueness

Define a *lens function* on `[t₁, t₂] × E` (`IsLensFunction Λ t₁ t₂ φ`) as a function `φ` that is
Lipschitz and Λ-periodic on `[t₁, t₂] × E` and such that the image of `{φ > 0}` in
`([t₁, t₂] × E)/Λ` is relatively compact, that is, `{φ > 0}` is covered by the Λ-translates of one
compact set (so each slice `{φ(t, ·) > 0}` is relatively compact modulo `Λ`, uniformly in `t`); its
*lens* is
`L_φ = {(t, x) ∈ [t₁, t₂] × E : φ(t, x) > 0}` and its *base* is `L_φ ∩ Σ_{t₁}`. For a classical
solution `U` of a quasilinear symmetric hyperbolic system defined near `L_φ`, `φ` is *spacelike
for `U`* when `σ(U(t, x); dφ(t, x))` is negative semidefinite at almost every point of `L_φ`; for
the Euler systems this reads `∂_tφ + v·∇φ + c|∇φ| ≤ 0` almost everywhere on `L_φ`, that is, the
inward conormal `−dφ` is a future causal covector of the acoustical form of `U` (§3.1). Prove:

**Local uniqueness** (`QuasilinearSystem.eqOn_lens`). Let `U₁, U₂` be Λ-periodic classical
solutions of the same quasilinear symmetric hyperbolic system on a Λ-invariant relatively open
subset of `[t₁, t₂] × E` containing the closure of `L_φ`, with `φ` spacelike for `U₁` (for
`Λ = 0` periodicity is no condition). If `U₁ = U₂` on the base of `L_φ`, then `U₁ = U₂` on `L_φ`.
Only the cones of `U₁` enter. At the points of `L_φ` where `φ` is not differentiable the
derivative `dφ` is read as `0`, where the condition holds trivially; they form a null set by
Rademacher's theorem. (Majda1984, Ch. 2, §2.1, the energy method, whose localised form is proved
here; LukNotes line 724, Proposition 4.4, for the wave
equation; EperonReallSbierski2019 line 1178, Proposition 4.63, which quotes the standard local
uniqueness; BarGinouxPfaffle2007 line 3365, Corollary 3.2.3, with Lemma 3.2.2 at line 3284, the
linear wave analogue: on a small relatively compact causal domain with a spacelike Cauchy
hypersurface, a solution vanishes at every point not causally related to the support of its
data.)
The proof applies §5.2 to `W = U₁ − U₂` with the weight `χ = φ₊`, using the difference bound
of §2.1. Let `𝒩` be the common domain of `U₁`, `U₂` and `L̄` the closure of `L_φ`. Since `L̄`
is compact modulo `Λ` and `𝒩` is Λ-invariant and relatively open, some `δ > 0` makes the closed
`δ`-neighbourhood `N_δ` of `L̄` in `[t₁, t₂] × E` a subset of `𝒩`; `N_δ` is compact modulo `Λ`, so
`U₁`, `U₂` take values in a compact `K ⊆ G` on `N_δ`, and `|∂U₁|`, `|∂U₂|` are bounded there. The
linearised operator `A⁰(U₁)∂_t + Σᵢ Aⁱ(U₁)∂ᵢ` has coefficients only on `𝒩`; it is made an
operator of §5.1 by a cutoff. Let `θ` be the convolution of the indicator of the open
`δ/2`-neighbourhood of `L̄` in `ℝ × E` with a smooth nonnegative bump of integral `1` supported
in the ball of radius `δ/4`: it is smooth, Λ-periodic, `0 ≤ θ ≤ 1`, with bounded derivatives,
equal to `1` on the `δ/4`-neighbourhood of `L̄` and supported in `N_δ`. Take the coefficients
`θA⁰(U₁) + (1 − θ)λI`, `θAⁱ(U₁)` and `B = 0`, with `λ > 0` such that `A⁰(U) ≥ λI` for `U ∈ K`
(it exists because `A⁰` is continuous and positive definite and `K` is compact), extended by
`λI`, `0` where `θ = 0`. They are symmetric, Λ-periodic, bounded with bounded first
derivatives on `[t₁, t₂] × E`, and `θA⁰(U₁) + (1 − θ)λI = λI + θ(A⁰(U₁) − λI) ≥ λI`, so they form
an operator of §5.1 with `λ₀ = λ`. On `{χ > 0} = L_φ` they equal `A⁰(U₁)`, `Aⁱ(U₁)`, so there
the symbol at `dχ` is `σ(U₁; dφ)`, negative semidefinite almost everywhere because `φ` is
spacelike for `U₁`, and the difference bound gives `|LW| ≤ C₁|W|`, as §5.2 requires.

**Moving cones.** For `x₀ ∈ E`, `R > 0`, `w ∈ E` and `M > 0`, the *periodised moving cone*
`φ(t, x) = max_{λ∈Λ} (R − |x − λ − x₀ − (t − t₁)w| − M(t − t₁))` (a maximum over a locally finite
family, since `Λ` is discrete and each term tends to `−∞` as `|λ| → ∞`) is a lens function: it is
Lipschitz with constant `1 + |w| + M`, Λ-periodic, and `{φ(t, ·) > 0}` is the union of the
Λ-translates of the ball of radius `R − M(t − t₁)` about `x₀ + (t − t₁)w`, so that `L_φ` lies in
the Λ-translates of `[t₁, t₂] × B(x₀, R + |w|(t₂ − t₁))` and its image modulo `Λ` is relatively
compact. For `Λ = 0` it is the single cone `R − |x − x₀ − (t − t₁)w| − M(t − t₁)`, and
when `2R` is less than the least norm of a nonzero element of `Λ` the positive parts of the terms
are pairwise disjoint and `L_φ` is the disjoint union of the Λ-translates of the single cone's
lens. It is spacelike for every `U₁` such that `(M, w)` dominates at `U₁(q)` for `q ∈ L_φ`: at almost
every point of `L_φ` the differential of `φ` is that of a term attaining the maximum (§5.2), and
for that term `σ(U₁; dφ) = −σ(U₁; (M − e·w, e)) ≤ 0` with `e` the unit vector from the term's apex.
For the Euler systems the dominance condition holds iff `M ≥ c(U₁(q)) + |v(U₁(q)) − w|` on `L_φ`
(§2.2). Every lens used in §6.2 and §8.4 is a periodised moving cone, with `Λ = 0` in §6.2 and
the period group of the data in §8.4.

- The relation "spacelike for `U`" is monotone: shrinking `φ` by a positive factor,
  intersecting two lenses (minimum of two lens functions) or uniting them (maximum, by the
  differential argument above) keeps it.
- Translation, Λ-translation and Galilean boost of a lens are lenses for the transformed
  solution.

**Checks.**

- Constant Euler state `(ρ₀, v₀)` with sound speed `c₀`, `Λ = 0`: `φ = R − |x − tv₀| − c₀t` is
  spacelike,
  with equality `∂_tφ + v₀·∇φ + c₀|∇φ| = 0` (§5.2): null lateral boundaries are admitted.
- `n = 1`, `v₀ = 3`, `c₀ = 1`, `Λ = 0`: the static cone `R − |x| − Mt` is spacelike iff `M ≥ 4`,
  the moving cone with `w = 3` iff `M ≥ 1`; with `Λ = 2πℤ` and `R < π` the periodised cones have
  the same differentials on each translate and the same thresholds. A formulation demanding
  `τ > |v·ξ| + c|ξ|` for the conormal (static cones only) loses this sharpness.
- Transport `a = 1` with `φ = 1 − |x| − t/2`: not spacelike for `x < 0`, and uniqueness fails on
  `L_φ` (§5.2, the travelling bump).
- Periodicity of the solutions is needed when `Λ ≠ 0`: `n = 1`, `Λ = ℤ`, `φ = 1 − t` on
  `[0, 2] × ℝ` is a lens function (Λ-periodic, `L_φ = [0, 1) × ℝ` with relatively compact image
  in `[0, 2] × ℝ/ℤ`) and is spacelike for every solution of every system, since
  `σ(U; −dt) = −A⁰(U) ≤ 0`. The system `U = (u, z)`, `A⁰ = I`, `A¹(U) = diag(z², 0)`, `F = 0` has
  the classical solutions `(0, x)` and `(u, x)` with `u = g(t + 1/x)` for `x < 0`, `u = 0` for
  `x ≥ 0`, `g` smooth and supported in `(1/2, 1)`: `∂_tu + x²∂_xu = g′·(1 − 1) = 0`, both vanish
  at `t = 0` (there `t + 1/x < 0`), yet at `t = 0.9`, `x = −1/0.3` the second has `u = g(0.6)`,
  which is nonzero for suitable `g`. Neither is `ℤ`-periodic; the characteristics `x = 1/(c − t)`
  enter from `x = −∞` at time `c`.
- The compactness clause of a lens function: for `Λ = 0` the same `φ = 1 − t` on `[0, 2] × ℝ` is
  Lipschitz and (vacuously) Λ-periodic, but `{φ > 0} = [0, 1) × ℝ` lies in no compact set, so it is
  not a lens function for `Λ = 0`. It must not be one: the two solutions `(0, x)` and `(u, x)` of
  the previous Check are classical on `[0, 2] × ℝ`, agree on its base and differ at
  `(0.9, −10/3)`, so a definition without the clause would make local uniqueness false. The
  periodicity clause: for `Λ = 2πℤ` (`n = 1`) the single cone `R − |x − x₀| − Mt` is not a lens
  function, taking the values `R` at `x₀` and `R − 2π` at `x₀ + 2π` when `t = 0` (§5.2); its
  periodisation is.
- The cutoff of the linearised operator: for Burgers, `n = N = 1`, `Λ = 0`, `A⁰ = 1`,
  `A¹(u) = u`, with `U₁` given only on a neighbourhood of `L̄`, and `λ = 1`, the cut-off
  coefficients are `1` and `θU₁`, defined on all of `[t₁, t₂] × ℝ`. The plausible cutoff
  `θA⁰(U₁) = θ`, without the term `(1 − θ)λI`, vanishes outside the compact set `N_δ`, so it
  satisfies `A⁰ ≥ λ₀I` for no `λ₀ > 0` and is not an operator of §5.1. For a system with
  `A⁰ = 2` and `λ = 1` the cut-off `A⁰` is `1 + θ`, which is `1.5 ≥ 1` at `θ = 1/2`.

*Needs:* §2.1 (difference bound), §2.2 (dominance for Euler), §3.1 (the acoustical form, for the
Euler reading of the spacelike condition), §5.1 (the operator class the cut-off coefficients
belong to), §5.2; Mathlib `MeasureTheory.convolution` and `ContDiffBump`
for the cutoff `θ`.

### 6.2 Uniqueness on domains of dependence

Fix a quasilinear symmetric hyperbolic system and a continuous map `κ : G → (0, ∞) × E` such
that `κ(U)` dominates at `U` for every `U ∈ G` (for the Euler systems, the acoustical cone map of
§2.2). Prove:

**Theorem** (`QuasilinearSystem.eqOn_causalPast`). Let `D ⊆ H_{t₀}` be a domain, `U₁` a
classical solution on `D` with cone field `κ ∘ U₁`, `S` a relatively open subset of `Σ_{t₀}`
contained in `D`, `O ⊆ H_{t₀}` relatively open and `U₂` a classical solution on `O` with
`U₁ = U₂` on `S ∩ O`. If `p ∈ D⁺_D(S)` and `J⁻_D(p) ⊆ O`, then `U₁ = U₂` on `J⁻_D(p)`; causal
pasts and domains of dependence are those of the cone field `κ ∘ U₁` (§3.3).

Route: `J⁻_D(p)` is compact and meets `Σ_{t₀}` inside `S` (§3.3); choose a compact neighbourhood
`N ⊆ D ∩ O` of it whose slice at `t₀` lies in `S`, on which `κ ∘ U₁` is uniformly continuous; sweep
from `t₀` to `t_p` in steps `h`, applying §6.1 with `Λ = 0` (single moving cones, so that
`U₁`, `U₂` need no periodicity) to moving cones with apex data
`(c(q) + 2ε, v(q))`
at points `q` of the shrinking neighbourhoods; each step loses a margin `O(εh)`, so for `ε`
small the total loss `O(ε(t_p − t₀))` stays below the distance from `J⁻_D(p)` to the complement
of `N` (Majda1984, Ch. 2, §2.1, the energy method, whose localised form is proved here;
ChristodoulouMiao2014 lines 872–878, where local uniqueness is asserted on the whole of
`D₁ ∩ D₂`; the statement here carries the hypothesis `J⁻_D(p) ⊆ O`, without which it fails, by
the second Check below and §8.2; EperonReallSbierski2019 lines 1178–1189).

- *Slab uniqueness.* Two classical solutions on `[t₀, t₁) × E` with the same data on `Σ_{t₀}`,
  one of which has a cone field bounded on `[t₀, t₂] × E` for each `t₂ < t₁`, agree: take that
  solution as `U₁` and `D = O = [t₀, t₁) × E`, `S = Σ_{t₀}` in the Theorem; then
  `D⁺_D(Σ_{t₀}) = D` for the field of `U₁` (§3.3, slabs) and `J⁻_D(p) ⊆ O` for every `p`, and
  only the cones of `U₁` enter, so nothing is assumed of the other solution's cone field.
- *Domain-of-dependence form.* If `U₁` on `D` and `U₂` on `O ⊇ D` agree on `S`, then they
  agree on `D⁺_D(S)`.

**Checks.**

- `n = 1`, `p = ρ²/2`, the constant state `(1, 0)` (`c = 1`) and any classical solution on
  `[0, 1) × ℝ` equal to it on `{0} × (−2, 2)` agree on `{|x| < 2 − t}`, for instance at
  `(1/2, 1.4)`, and no claim is made at `(1/2, 1.6)`.
- The hypothesis `J⁻_D(p) ⊆ O` cannot be dropped: in the counterexample of §8.2 the two solutions
  agree on `S` and differ at `(2, 0)`, where the causal past for one solution leaves the domain
  of the other.
- For the expanding flow of §3.3 the theorem gives uniqueness exactly on
  `{|x| < 2√(1 + t) − (1 + t)}` from data on `(−1, 1)`, not on the static cone `{|x| < 1 − t}`
  computed with the wrong (frozen) field.
- Slab uniqueness needs one bounded cone field, not two: for Burgers `∂_tu + u∂_xu = 0`
  (`N = n = 1`, `A⁰ = 1`, `A¹ = u`) and the cone map `κ(u) = (1 + |u|, 0)` of §2.1, `U₁ ≡ 0` has
  the constant field `(1, 0)`, and every classical solution `U₂` on `[0, T) × ℝ` with zero data,
  whose field `(1 + |U₂|, 0)` is not assumed bounded, is constant along the backward
  characteristic through each point `p`, which is therefore the straight line of slope `U₂(p)`
  and reaches `t = 0` inside the slab; so `U₂(p) = 0 = U₁(p)`, as the statement asserts.
  Dropping the bound altogether fails: the two solutions `(0, x)` and `(u, x)` of the periodicity
  Check of §6.1, read with `Λ = 0`, both have the field `(1 + x², 0)` for the cone map of §2.1,
  agree at `t = 0`, and differ at `(0.9, −10/3)`, where `t + 1/x = 0.6`.

*Needs:* §3.3 (compact pasts, slabs), §6.1, Layer 2.

### Examples

The constant states and the expanding flow give explicit lenses and domains of dependence;
the travelling bump is the negative control.

### Dependencies

Layers 2, 3 and 5.

## Layer 7: local well-posedness

### 7.1 Local well-posedness for quasilinear symmetric hyperbolic systems

Prove (`QuasilinearSystem.localWellPosedness`): let a quasilinear symmetric hyperbolic system be
given, `Ū ∈ G` with `F(Ū) = 0`, a period group `Λ` with a measurable fundamental domain `F`,
`k ∈ ℕ` with `2k > n + 2`, a compact `K ⊆ G` containing `Ū` and a bound `M`. There are
`T = T(M, K) > 0` and `R = R(M, K)` such that for every continuous Λ-periodic `U₀ : E → G` with
`U₀ − Ū ∈ Hᵏ_Λ`, `‖U₀ − Ū‖_{Hᵏ_Λ} ≤ M` and `U₀(E) ⊆ K`:

- *existence:* there is a Λ-periodic `U` with `U − Ū ∈ C([0, T]; Hᵏ_Λ)`, which is `C¹` on
  `[0, T] × E` and a classical solution with `U(0) = U₀`, and `‖U(t) − Ū‖_{Hᵏ_Λ} ≤ R` for
  `t ∈ [0, T]`;
- *uniqueness:* `U` is the only classical solution on `[0, T) × E` with these data:
  `U([0, T] × E)` has compact closure in `G`, because by §4.2 `t ↦ U(t) − Ū` is continuous into
  the bounded continuous functions and each `U(t) − Ū` tends to `0` at infinity orthogonally to
  the span of `Λ`, so the cone field `κ ∘ U` of §6.2 is bounded, and slab uniqueness (§6.2) needs
  the cones of one of the two solutions only;
- *continuous dependence:* if `U₀^m → U₀` in `Ū + Hᵏ_Λ`, where each `U₀^m` is continuous,
  Λ-periodic, takes values in `K` and satisfies `‖U₀^m − Ū‖_{Hᵏ_Λ} ≤ M`, the solutions of the
  `U₀^m`, which exist on `[0, T]` by the existence clause, converge to `U` in
  `C([0, T]; Hᵏ_Λ)`.

Prove the continuation criterion (`QuasilinearSystem.exists_extension_of_lintegral_lt_top`): a
Λ-periodic classical solution `U` on `[0, T) × E`, `T > 0`, with `U − Ū ∈ C([0, T); Hᵏ_Λ)`,
values in a compact subset of `G` and `∫₀ᵀ ‖∇U(t)‖_∞ dt < ∞` extends to a classical solution on
`[0, T′] × E` for some `T′ > T`, with `U − Ū ∈ C([0, T′]; Hᵏ_Λ)`. Hence the maximal existence time
`T*` satisfies: if `T* < ∞`, then `∫₀^{T*} ‖∇U(t)‖_∞ dt = ∞` or the closure of `U([0, T*) × E)` is
not a compact subset of `G`.

- *Time regularity:* the solution also has `U − Ū ∈ C¹([0, T]; Hᵏ⁻¹_Λ)`, since
  `∂_tU = A⁰(U)⁻¹(F(U) − Σᵢ Aⁱ(U)∂ᵢU)` lies in `C([0, T]; Hᵏ⁻¹_Λ)` by the product and
  composition estimates of §4.3 at order `k − 1`, where `2(k − 1) > n`.
- *Persistence:* if `U₀ − Ū ∈ Hᵏ′_Λ` with `k′ > k`, the solution stays in `Hᵏ′_Λ` on the same
  maximal interval.

(Kato1975, Theorem II; Majda1984, Ch. 2, Theorem 2.1 and the continuation principle of §2.2;
Dafermos2016, Ch. V, Theorem 5.1.1; LukNotes line 1239, Theorem 6.1, and line 1620,
Theorem 6.10, for quasilinear wave equations.) Route: the iteration
`A⁰(U^m)∂_tU^{m+1} + Σᵢ Aⁱ(U^m)∂ᵢU^{m+1} = F(U^m)` with mollified data
`Ū + J_ε(U₀ − Ū)` (§4.4), which, for `δ > 0` with the closed `δ`-neighbourhood `K_δ` of `K` in
`G`, take values in `K_{δ/2}` once `ε ≤ ε₀(M, K)`, because
`‖J_ε(U₀ − Ū) − (U₀ − Ū)‖_∞ ≤ C‖J_ε(U₀ − Ū) − (U₀ − Ū)‖_{Hᵏ⁻¹_Λ} ≤ CεM` by the embedding of §4.2
(`2(k − 1) > n`) and the loss bound of §4.4, so that the coefficients are evaluated inside `G`;
solved by §5.4 (the iterate satisfies `U^m − Ū ∈ C([0, T]; Hᵏ_Λ) ∩ C¹([0, T]; Hᵏ⁻¹_Λ)`, so
`A⁰(U^m) − A⁰(Ū)` has the time regularity `C¹([0, T]; Hᵏ⁻¹_Λ)` that §5.4 asks, by the
composition and product estimates of §4.3 at order `k − 1`, where `2(k − 1) > n`);
boundedness `‖U^m − Ū‖_{Hᵏ_Λ} ≤ R` on a uniform interval `[0, T]`, with `R` and `T` depending only
on `M` and `K`, by §5.3 applied with the compact `K_δ`, which contains `Ū` (its coefficients
depend on this bound; the forcing is `F(U^m) − F(Ū)`), contraction in `C([0, T]; L²_Λ)` by §5.1,
convergence in `C([0, T]; Hᵏ⁻¹_Λ)` by §4.2 with the bound `R` passing to the limit by the lower
semicontinuity of §4.2, top-order continuity and continuous dependence by the
Bona–Smith regularisation of the data; continuation by the tame estimate of §5.3 and Grönwall.

- The hypothesis `Ū ∈ K` is the one §5.3 and the composition estimate of §4.3 need, and it
  costs no generality: for any compact `K ⊆ G`, the set `K ∪ {Ū}` is compact, lies in `G` and
  contains the values of every datum whose values lie in `K`.
- The solution of `Λ`-periodic data is unique among all solutions, hence Λ-periodic, by
  translation invariance of the system.
- The data-to-solution map commutes with time translation; the solutions of a system and of its
  multiple by a positive smooth scalar coincide.

**Checks.**

- `F(Ū) = 0` is necessary on non-compact carriers: for `N = 1`, `A⁰ = 1`, `Aⁱ = 0`, `F ≡ 1`,
  `Ū = 0`, the solution `u = u₀ + t` is not in `Ū + L²(ℝⁿ)` for `t > 0`.
- Burgers `∂_tu + u∂_xu = 0` (a symmetric system with `A¹ = u`) with `u₀ = −e^{−x²}`:
  `min u₀′ = −√2 e^{−1/2}` at `x = −1/√2`, so `T* = e^{1/2}/√2 ≈ 1.1658`; the values stay in
  `[−1, 0]` while `∫₀^{T*} ‖u_x‖_∞ = ∞`, the first alternative of the continuation criterion.
- The existence time depends on the norm bound and not on `K` alone, which is why the continuity
  clause keeps the approximating data in the ball of radius `M`: for Burgers with
  `u₀^λ(x) = −e^{−λ²x²}`, `λ > 0`, the values stay in `K = [−1, 0]`, while
  `min (u₀^λ)′ = −√2 λ e^{−1/2}` at `x = −1/(λ√2)` gives `T* = e^{1/2}/(λ√2)` (`≈ 0.1166` at
  `λ = 10`) and `‖(u₀^λ)″‖²_{L²} = 3√(π/2) λ³` (`≈ 3760` at `λ = 10`). A time depending on `K`
  alone would exceed `T*` for large `λ`; and for fixed `M`, the data `u₀^λ` with `λ` large have
  values in `K` but no solution on `[0, T(M, K)]`, so their norm exceeds `M`.
- Constant data `U₀ ≡ Ū` give the constant solution with `T* = ∞`.
- Continuity of the data is needed for `U(0) = U₀` everywhere: for `N = n = 1`, `A⁰ = 1`,
  `A¹ = 0`, `F = 0`, `Ū = 0`, `Λ = 2πℤ`, the datum equal to `1` on `2πℤ` and `0` elsewhere has
  `‖U₀ − Ū‖_{Hᵏ_Λ} = 0` (it is `0` almost everywhere, and the zero family is a family of weak
  derivatives), yet the only candidate solution, `U(t, x) = U₀(x)`, is not continuous. Its
  continuous representative `0` has the solution `0`.

*Needs:* §2.1 (the system and the dominating cone map `κ`), §§4.1–4.4, §§5.1–5.4, §6.2; Tau Ceti
`TauCeti.le_mul_exp_of_le_add_mul_integral`.

### 7.2 Compressible Euler

Prove, for a barotropic equation of state `(I, p)`, a period group `Λ`, `k` with `2k > n + 2`, a
background `(ρ₀, v₀) ∈ I × E`, an interval `[ρ_*, ρ^*] ⊆ I` and a bound `M`: there is `T > 0`,
depending only on `(I, p)`, `Λ`, `k`, `(ρ₀, v₀)`, `[ρ_*, ρ^*]` and `M`, such that for every
initial time `t₀` and all continuous Λ-periodic data `(ρ̄, v̄)` with `ρ̄ − ρ₀, v̄ − v₀ ∈ Hᵏ_Λ`,
`‖(ρ̄ − ρ₀, v̄ − v₀)‖_{Hᵏ_Λ} ≤ M` and `ρ_* ≤ ρ̄ ≤ ρ^*` on `E`, there is a Λ-periodic classical
solution `(ρ, v)` on `[t₀, t₀ + T] × E` with these data, `(ρ − ρ₀, v − v₀) ∈ C([t₀, t₀ + T]; Hᵏ_Λ)`
and `ρ ≥ ρ_*/2`, and it is the only classical solution on `[t₀, t₀ + T] × E` with these data. The
solution depends continuously on the data within this class: if `(ρ̄^m, v̄^m) → (ρ̄, v̄)` in
`(ρ₀, v₀) + Hᵏ_Λ` with continuous Λ-periodic `(ρ̄^m, v̄^m)`, `‖(ρ̄^m − ρ₀, v̄^m − v₀)‖_{Hᵏ_Λ} ≤ M` and
`ρ_* ≤ ρ̄^m ≤ ρ^*`, their solutions, all defined on `[t₀, t₀ + T]`, converge to `(ρ, v)` in
`C([t₀, t₀ + T]; Hᵏ_Λ)`. Continuation: a Λ-periodic classical solution on `[t₀, t₀ + T) × E` with
`(ρ − ρ₀, v − v₀) ∈ C([t₀, t₀ + T); Hᵏ_Λ)`, `∫ ‖∇(ρ, v)‖_∞ dt < ∞` and the range of `ρ` with compact
closure in `I` extends to a classical solution on `[t₀, t₀ + T′] × E` for some `T′ > T`, in the same
class; so if the maximal time is finite then `∫ ‖∇(ρ, v)‖_∞ dt = ∞` or the closure of the range
of `ρ` is not a compact subset of `I`. The
same holds for the full system (`EquationOfState.localWellPosedness`,
`EquationOfState.exists_extension_of_lintegral_lt_top`), for an equation of state `(𝒪, P)` in
place of `(I, p)`, a background `(ρ₀, v₀, s₀)` with `(ρ₀, s₀) ∈ 𝒪` and `v₀ ∈ E` in place of
`(ρ₀, v₀)`, and data `(ρ̄, v̄, s̄)` with `s̄ − s₀ ∈ Hᵏ_Λ` as well and `(ρ̄, s̄)(E)` contained in a compact subset `L` of
`𝒪`: with `L` in place of `[ρ_*, ρ^*]`, `ρ_*` the least density on `L`, the triples
`(ρ̄ − ρ₀, v̄ − v₀, s̄ − s₀)`, `(ρ − ρ₀, v − v₀, s − s₀)` and `∇(ρ, v, s)` in place of the pairs,
and the range of `(ρ, s)` in `𝒪` in place of the range of `ρ` in `I`. The barotropic statement is
the case `𝒪 = I × ℝ`, `P(ρ, s) = p(ρ)`, `L = [ρ_*, ρ^*] × {s₀}` of the full one with constant
entropy `s₀`, by entropy propagation (§1.3) and uniqueness. (AbbresciaSpeck2022
lines 172–179, the full system on `ℝ × 𝕋²` with non-vacuum `H³` data; ChristodoulouMiao2014 lines 866–868; LuoYu2023a
lines 82–95; Majda1984, Ch. 2.) Route: §7.1 applied to the symmetrisers of §2.2, with `F = 0`,
`Ū = (ρ₀, v₀)`, which lies in `G = I × E` because `ρ₀ ∈ I`, and the compact
`K = ([ρ_*, ρ^*] ∪ {ρ₀}) × B̄(v₀, CM) ⊆ G`, where `C` is the constant of the embedding
`Hᵏ_Λ ⊆ C_b` of §4.2, so that `K` contains `Ū` and the values of every datum of the class (for
the full system `Ū = (ρ₀, v₀, s₀)`, which lies in `G` because `(ρ₀, s₀) ∈ 𝒪`, and
`K = {(ρ, v, s) : (ρ, s) ∈ L ∪ {(ρ₀, s₀)}, |v − v₀| ≤ CM}`); the bound `ρ ≥ ρ_*/2` by
shrinking `T` to at most `ρ_*/(2C′)`, where `C′ > 0` bounds
`‖∂_tρ‖_∞ = ‖v·∇ρ + ρ div v‖_∞` in terms of the bound `R(M, K)` of §7.1, `ρ₀` and `v₀`, by the
embedding of §4.2 into `C¹_b` (`2k > n + 2`). For the continuation criterion §7.1 needs the
values of the whole state in a compact subset of `G`, while the hypothesis bounds only `(ρ, s)`
(only `ρ` for the barotropic system); the velocity is bounded as well. For `t₂ < t₀ + T`, `v` is
bounded on `[t₀, t₂] × E`, because `t ↦ v(t) − v₀` is continuous into `C_b` (§4.2); so the
material curves `ẋ = v(t, x)` through the points of `[t₀, t₂] × E` exist back to `t₀` (§1.3),
and along them `Bv = −ρ⁻¹∇(P(ρ, s)) = −ρ⁻¹(∂_ρP ∇ρ + ∂_sP ∇s)` gives
`sup_x |v(t, x)| ≤ sup_x |v(t₀, x)| + C_L ∫_{t₀}^{t} ‖∇(ρ, s)(r)‖_∞ dr` with
`C_L = max_L (|∂_ρP| + |∂_sP|)/ρ`, finite because `L ⊆ 𝒪` is compact, `P` is smooth on `𝒪` and
`ρ > 0` on `L`. With `V` the right-hand side at `t = t₀ + T`, finite by the hypothesis on the
gradient, the values lie in the compact `{(ρ, v, s) : (ρ, s) ∈ L, |v| ≤ V} ⊆ G`, and §7.1
applies.

- For `Λ = 0` and `Λ = Λ_cyl` these are the Euclidean and cylinder carriers of the Conventions.
- The solution is Galilean covariant: boosting the data by `w` boosts the solution.

**Checks.**

- Simple-wave blow-up, `n = 1`, `p = ρ³/3` (so `c = ρ`): the Riemann invariants `v ± ρ` solve
  Burgers equations. Data `ρ̄ = 1 + e^{−x²}/2`, `v̄ = ρ̄ − 1` keep `v − ρ ≡ −1` and give
  `v + ρ = 1 + e^{−x²}` at `t = 0`, so `T* = e^{1/2}/√2 ≈ 1.1658` while `ρ` stays in `[1, 3/2]`:
  the gradient alternative of the criterion, with no vacuum.
- Constant data give global solutions; data with `ρ̄ = 0` somewhere are excluded (vacuum).
- On `Λ_cyl` with `n = 2`, data depending only on `x¹` give solutions depending only on
  `(t, x¹)`, by uniqueness and invariance under translations in `x²`.
- Sobolev threshold for `n = 3`: `k = 3` gives `2k = 6 > 5 = n + 2`, the `H³` setting of
  AbbresciaSpeck2022 line 179; `k = 2` gives `4 < 5` and is excluded.
- The background of the full system must be a state: on `Λ = 2πℤ` (`n = 1`) with
  `𝒪 = (0, ∞) × (0, 1)` and the constant data `(ρ̄, v̄, s̄) = (1, 0, 1/2)`, the triple `(1, 0, 5)`
  has `s̄ − 5 = −9/2 ∈ Hᵏ_Λ` (squared norm `(81/4)·2π = 81π/2`) but `(1, 5) ∉ 𝒪`, so it is not a
  point of `G` and §7.1 cannot be applied at it; the background `(1, 0, 1/2)` lies in `G`, and the
  solution is the constant one. When `Λ` is not of full rank the condition holds automatically:
  `ρ̄ − ρ₀` and `s̄ − s₀` tend to `0` at infinity orthogonally to the span of `Λ` (§4.2), so
  `(ρ₀, s₀)` lies in the closure of `(ρ̄, s̄)(E)`, inside `L`. For full-rank `Λ` the background
  need not lie in `L`, nor `ρ₀` in `[ρ_*, ρ^*]`, which is why the route adjoins it to `K`: for
  the data `(1, 0, 1/2)` above and `L = {(1, 1/2)}`, the background `(1, 0, 1/4)` has
  `s̄ − 1/4 = 1/4 ∈ Hᵏ_Λ` and `(1, 1/4) ∈ 𝒪 \ L`; for the barotropic system with `I = (0, ∞)`,
  the constant data `(1, 0)` and the background `(5, 0)` have `‖ρ̄ − 5‖²_{Hᵏ_Λ} = 16·2π = 32π` and
  `[ρ_*, ρ^*] = [1, 1]`, so `{1} × B̄(0, CM)` misses `Ū = (5, 0)`, while `{1, 5} × B̄(0, CM)` is
  compact, lies in `G` and contains it. That set is not convex, which the secant bound of §4.3
  allows.

*Needs:* §§1.1–1.3 (the equations of state and the Euler systems the statement is about; the
material curves of §1.3 for the velocity bound of the continuation criterion), §2.2, §4.1 (the
space `Hᵏ_Λ`), §4.2 (the embeddings into `C_b` and `C¹_b`), §7.1.

### 7.3 Uniformly local data

Fix a quasilinear symmetric hyperbolic system `(G, A⁰, …, Aⁿ, F)` with an arbitrary smooth
source `F` (no equilibrium is assumed), a state `Ū ∈ G`, a compact `K ⊆ G` such that `G`
contains the segment `[Ū, U]` for every `U ∈ K`, `k ∈ ℕ` with `2k > n + 2`, `M > 0`, and a cutoff
`χ ∈ C_c^∞(E)` with `0 ≤ χ ≤ 1` and `χ = 1` on the unit ball. For the barotropic Euler system
`G = I × E` is convex, and for the full system the segment condition holds whenever `𝒪` is
convex. Prove: there is `T > 0`, depending only on the system, `n`, `k`, `χ`, `Ū`, `K` and `M`,
such that for every `U₀ : E → K` with `U₀ − Ū ∈ Hᵏ_loc(E)` and
`sup_{y∈E} ‖χ(· − y)(U₀ − Ū)‖_{Hᵏ(E)} ≤ M` there is a unique classical solution `U` on
`[0, T] × E` with `U(0) = U₀`. Its values lie in a compact subset of `G` depending only on `G`,
`Ū` and `K`; `sup_y ‖χ(· − y)(U(t) − Ū)‖_{Hᵏ(E)}` is bounded on `[0, T]`; and `U` commutes with
every translation of `E` that fixes `U₀`, so Λ-periodic data give Λ-periodic solutions for every
period group (Majda1984, Ch. 2, §2.3, uniformly local Sobolev spaces; Kato1975, Theorem II, whose
coefficients are uniformly local; the localisation below is proved here).

The localisation uses the *source-switched system* of the given system: the system on `G × ℝ`
with states `(U, a)`, coefficient matrices `diag(A⁰(U), 1)` and `diag(Aⁱ(U), 0)`, and source
`(aF(U), 0)`.

- It is a quasilinear symmetric hyperbolic system of size `N + 1`, and `(Ū, 0)` is an
  equilibrium of it whatever the value `F(Ū)` is.
- Every classical solution `(U, a)` has `∂_ta = 0`, so `a(t, x) = a(0, x)`; on every open set
  where `a = 1`, `U` is a classical solution of the given system.
- A round cone `(c, w)` with `c ≥ |w|` dominates the switched system at `(U, a)` iff it dominates
  the given system at `U`: on the cone `ζ₀ + w·ζ′ ≥ c|ζ′|` the added entry `ζ₀` of the symbol is
  at least `(c − |w|)|ζ′| ≥ 0`.

Route. The segment hull `K′ = {Ū + θ(U − Ū) : θ ∈ [0, 1], U ∈ K}` is compact and lies in `G`. Fix
`δ > 0` such that the closed `δ`-neighbourhood `K₁` of `K′` lies in `G`, the continuous
dominating cone map `κ = (c_κ, w_κ)` of §2.1, and `m ≥ sup_{K₁} (c_κ + |w_κ|)`; then
`κ_m = (max(m, c_κ + |w_κ|), 0)` is a continuous dominating cone map (§2.1, monotonicity) equal
to `(m, 0)` on `K₁`. For `y ∈ E` the cut-off data `(Ū + χ(· − y)(U₀ − Ū), χ(· − y))` of the
switched system take values in the compact `K′ × [0, 1]` because `0 ≤ χ ≤ 1` (a set containing
`(Ū, 0)`, as §7.1 asks, since `θ = 0` gives `Ū ∈ K′` when `K` is nonempty), lie within
`M + ‖χ‖_{Hᵏ(E)}` of `(Ū, 0)` in `Hᵏ(E)`, and equal `(U₀, 1)` on the ball `B(y, 1)`. Section 7.1
with `Λ = 0`, applied to the switched system at the equilibrium `(Ū, 0)`, gives solutions
`(U^y, a^y)` on a common interval `[0, T₀]` with a common bound `R` in `Hᵏ(E)`. While `U^y` takes
values in `K₁`, `∂_tU^y = A⁰(U^y)^{−1}(a^yF(U^y) − Σᵢ Aⁱ(U^y)∂ᵢU^y)` is bounded in terms of `K₁`
and `R` (§4.2), so the values stay within `δ` of `K′` on a common `[0, T₁]`. On the cone
`C_y = {(t, x) : 0 ≤ t < min(T₀, T₁), |x − y| < 1 − mt}`, a domain, one has `a^y = 1`, so `U^y`
solves the given system there, and its causal curves for `κ_m` have speed at most `m`; for
`p ∈ C_y ∩ C_{y′}`, §6.2 with `D = C_y`, `S = {0} × B(y, 1)`, `O = C_{y′}` and the cone map `κ_m` gives
`U^y = U^{y′}` at `p`, because both data equal `U₀` on `B(y, 1) ∩ B(y′, 1)` and `J⁻_{C_y}(p)` lies
in `C_{y′}`. For `T = min(T₀, T₁, 1/m)/2` each point `(t, x)` of `[0, T] × E` lies in `C_x`, and
`U(t, x) = U^x(t, x)` is a classical solution; the uniformly local bound follows from `R` by
covering the support of `χ(· − y)` with finitely many balls of radius `1/2` (§4.3, products
with smooth cutoffs). Uniqueness among all classical solutions with data `U₀` is §6.2 with
`D = O = [0, T) × E`, in which only the cone field `κ_m ∘ U = (m, 0)` of the constructed solution
enters, together with the slab statement of §3.3 and continuity at `t = T`.

- Data equal to two different constant states outside a compact set are uniformly local.

**Checks.**

- The data `v̄ = 2` for `x ≤ −1`, `v̄ = −2` for `x ≥ 1`, smooth in between, `ρ̄ ≡ 1/2`
  (`p = ρ²`) are uniformly local but not in `Ū + H¹(ℝ)` for any constant `Ū`; their values
  `(1/2, v)`, `|v| ≤ 2`, form a compact subset of the convex `G = I × ℝ`.
- Periodic data in all directions (full-rank `Λ`) are uniformly local, and when `F(Ū) = 0` the
  solution of §7.1 for full-rank `Λ` agrees with the one here, by uniqueness.
- Without the segment hypothesis the localised data may leave `G`; for the barotropic system
  `G = I × E` is convex, so no condition arises.
- The order hypothesis is needed: for `∂_tu = 0` (`N = n = 1`, `G = ℝ`, `A⁰ = 1`, `A¹ = 0`,
  `F = 0`), `K = [0, 1]`, `Ū = 0` and `k = 0`, the step `U₀ = 1_{[0, ∞)}` has
  `sup_y ‖χ(· − y)U₀‖_{L²} ≤ ‖χ‖_{L²}`, but its one-sided limits at `0` are `0` and `1`, so no
  `C¹` solution attains it; `2k > n + 2` (here `k ≥ 2`) excludes it.
- Compactness of `K` is needed: `N = n = 1`, `G = (−∞, 1)`, `A⁰ = 1`, `A¹ = 0`,
  `F(u) = u/(1 − u)` (so `F(0) = 0`), `Ū = 0` and `U₀(x) = 1 − 1/(2 + √(1 + x²))`, with values in
  `[2/3, 1)`, every segment `[0, U₀(x)]` inside `G`, and every uniformly local `Hᵏ` norm finite.
  The solution of `u′ = u/(1 − u)` from `U₀(x)` reaches the edge `u = 1` at time
  `−log U₀(x) − (1 − U₀(x))`, which is `≈ 0.0721` at `x = 0`, `≈ 0.00365` at `x = 10`,
  `≈ 0.0000484` at `x = 100`, and tends to `0` as `|x| → ∞`: there is no uniform existence time.
  The range `[2/3, 1)` has non-compact closure in `G`.
- The cutoff must take values in `[0, 1]`: with `G = (0, 2)`, `Ū = 1` and `K = {3/2}` the segment
  `[1, 3/2]` lies in `G`, but a smooth cutoff equal to `1` on the unit ball that takes the value
  `3` somewhere gives the localised value `1 + 3 · 1/2 = 5/2 ∉ G`; for `0 ≤ θ ≤ 1` the value
  `1 + θ/2` lies in `[1, 3/2]`.
- General sources: for `N = 1`, `G = ℝ`, `A⁰ = 1`, `Aⁱ = 0` and `F ≡ 1`, the given system has no
  equilibrium and §7.1 does not apply to it (the Check of §7.1); the source-switched system has
  source `(a, 0)`, which vanishes at `(Ū, 0)`, and on `{a = 1}` it gives `∂_tU = 1`, so constant
  data `Ū` give `U = Ū + t`, the solution of the given system, whose uniformly local norms
  `t‖χ‖_{Hᵏ(E)}` stay bounded on `[0, T]`.
- The stationary component of the switched system has speed `0`, so a cone `(c, w)` with
  `c < |w|` can dominate the given system without dominating the switched one: for transport
  with `a = 3`, `(1, 3)` dominates the given equation, but at `ζ = (−2, 1)` the cone condition
  `−2 + 3 = 1 ≥ 1` holds while the added entry is `ζ₀ = −2 < 0`. The gluing uses cones `(m, 0)`.
- Switching off: with `a ≡ 0` the `U`-equation of the switched system is the homogeneous system
  `A⁰(U)∂_tU + Σᵢ Aⁱ(U)∂ᵢU = 0`, of which every constant state is a solution, and on
  `{0 < a < 1}` the source is `aF(U)`. A switched solution therefore solves the given system only
  where `a = 1`; this is why only the cones `C_y` over `B(y, 1)`, where `χ(· − y) = 1`, are glued.

*Needs:* §2.1 (maximal speed, monotonicity, the continuous dominating cone map), §3.3 (slabs),
§4.1 (the spaces `Hᵏ(E)` and `Hᵏ_Λ`), §4.2, §4.3, §6.2, §7.1.

### Examples

The Burgers and simple-wave blow-ups fix the continuation criterion with computed blow-up
times; constant states are global.

### Dependencies

Layers 1 (the Euler systems, for §7.2), 2, 3 (§3.3, for §7.3), 4, 5 and 6.

## Layer 8: developments and maximal developments

### 8.1 Initial data sets and developments

Define an *initial data set* for either Euler system as a time `t₀`, a period group `Λ`, a
Λ-invariant open `S ⊆ E`, and Λ-periodic `C¹` data `Ū : S → G` (barotropic: `(ρ̄, v̄)` with
`ρ̄ ∈ I`; full: `(ρ̄, v̄, s̄)` with `(ρ̄, s̄) ∈ 𝒪`). Define a *development* of it as a pair `(D, U)`
with `D ⊆ H_{t₀}` a Λ-invariant domain, `D ∩ Σ_{t₀} = {t₀} × S`, `U` a Λ-periodic classical
solution on `D` with `U(t₀, x) = Ū(x)` for `x ∈ S`, and `D = D⁺_D({t₀} × S)` for the acoustical
cone field of `U`. For the full system this is `EquationOfState.IsDevelopment P t₀ Λ S Ū D U`,
with the data as separate arguments and `U` a fluid field on `𝔐` of which only the values on `D`
matter; the conditions on the data are then consequences of the existence of a development: `S`
is open because `D` is relatively open, and `Ū` is `C¹`, Λ-periodic and `𝒪`-valued on `S` because
`U` is so on `D`. Order developments by `(D₁, U₁) ≤ (D₂, U₂)` iff `D₁ ⊆ D₂` and `U₂ = U₁` on
`D₁`; call two developments *compatible* when `U₁ = U₂` on `D₁ ∩ D₂`. (ChristodoulouMiao2014
lines 864–872 for developments, and lines 872–880, which assert that any two developments of the
same data are compatible, false on a fixed Galilean background by §8.2; Christodoulou2019 lines
130–138; LuoYu2023b lines 417–419 and line 910,
Definition 2.13; BarGinouxPfaffle2007 line 1006, Definition 1.3.5, the two-sided Cauchy
development `D(S)`; EperonReallSbierski2019 lines 1129–1144; Christodoulou2007, Ch. 1.)

- `≤` is a partial order on the developments of fixed data.
- *Past-closed truncation.* If `(D, U)` is a development and `D′ ⊆ D` is a Λ-invariant domain
  with `D′ ∩ Σ_{t₀} = {t₀} × S` and `J⁻_D(q) ⊆ D′` for every `q ∈ D′`, then `(D′, U|_{D′})` is a
  development below `(D, U)`; time truncations `D ∩ {t < T}` with `T > t₀` are examples.
- Galilean boosts, spacetime translations and Λ-translations act on developments of the
  correspondingly transformed data.
- If `S = ∅` the only development is `(∅, ∅)`.
- If `(D, U) ≤ (D′, U′)` then `J⁻_{D′}(p) ⊆ D` for every `p ∈ D`: a causal curve of `U′` leaving
  `D` would leave it at a time `> t₀` and give a past-inextendible curve in `D` that misses the
  data.
- *Entropy on developments.* If `(D, U)` is a development of full data with `s̄ ≡ s₀` on `S`, then
  `s ≡ s₀` on `D`. The material curve `ẋ = v(t, x)` through `p ∈ D` is a causal curve of the
  acoustical field (`|ẋ − v| = 0 ≤ c`). Continue it backwards in `D` as far as possible: at a
  lower end `a > t₀` where it has a limit in `D` it continues further by Picard–Lindelöf (`D` is
  relatively open in `H_{t₀}`, so it is open in `𝔐` near points with `t > t₀`, and `v` is `C¹`
  there), so the maximal continuation either has a limit at `t₀`, which lies in
  `D ∩ Σ_{t₀} = {t₀} × S`, or is past-inextendible in `D` on an interval not containing `t₀`,
  which `D = D⁺_D({t₀} × S)` excludes. Since `Bs = 0` along the curve, `s(p) = s₀`. Hence the
  developments of barotropic data for `(I, p)` are exactly the full developments, for
  `P(ρ, s) = p(ρ)` on `I × ℝ`, of the same data with constant entropy (the acoustical fields
  agree, `c` not depending on `s`), and §§8.2–8.4 contain the barotropic statements.

**Checks.**

- Constant data `(ρ₀, v₀)` on `B(0, R)` with sound speed `c₀`: the constant solution on
  `{|x − v₀(t − t₀)| < R − c₀(t − t₀)}` is a development.
- With `n = 1`, `c₀ = 1`, `v₀ = 0` and data on `(−1, 1)`, the domain `{|x| < 1 + t}` with the
  constant solution is not a development (§3.3), nor is `{|x| < 1 − t/2}`, whose boundary is
  timelike (§8.4 (a)).
- The expanding flow with `p = ρ²/2`, `ρ₀ = 1` on `(−1, 1)`: `{|x| < 2√(1 + t) − (1 + t)}` with the
  flow is a development.
- Truncation times: with `t₀ = 0`, `c₀ = 1`, `v₀ = 0` and constant data on `S = (−1, 1)`, the
  truncation of `D = {|x| < 1 − t}` at `T = 1/2` is `{|x| < 1 − t, 0 ≤ t < 1/2}`, whose initial
  slice is `{0} × S` and which contains `J⁻_D(q) ⊆ {t ≤ t_q}` for each of its points `q`: a
  development. At `T = 0` the truncation is empty, its initial slice `∅ ≠ {0} × S`, and it is
  not a development; the truncation statement needs `T > t₀`.

*Needs:* §1.2, §1.3, §3.3.

### 8.2 Uniqueness, compatibility and maximal developments

Prove, for developments `(D₁, U₁)`, `(D₂, U₂)` of the same data:

- *Maximal common development* (`EquationOfState.maximalCommonDevelopment`). The set
  `W₁₂ = {p ∈ D₁ : J⁻_{D₁}(p) ⊆ D₂}`, with causal pasts for the field of `U₁`, carries `U₁ = U₂`,
  equals `W₂₁`, and with this solution is a development; it is the largest development below
  both. In particular `D₁ ⊆ D₂` implies
  `(D₁, U₁) ≤ (D₂, U₂)` (EperonReallSbierski2019 lines 1141–1144 and 1232–1240, the common and
  the maximal common development of two developments of a quasilinear wave equation, and lines
  1208–1210, its identification with the component of the intersection containing the data; the
  description by causal pasts is proved here). Route: §6.2 with `D = D₁`, `O = D₂`, and the
  first-exit argument of §3.3.
- *Compatibility* (`EquationOfState.compatible_iff`). The developments are compatible iff
  `W₁₂ = D₁ ∩ D₂` iff they have a common upper bound; the union of any nonempty pairwise compatible family, with the glued solution, is
  a development and the least upper bound of the family (EperonReallSbierski2019 line 1228,
  Theorem 4.64, and line 1330, Remark 4.67, the wave-equation analogue for a connected
  intersection, and lines 1218–1223 on gluing along the maximal common development on a fixed
  background). (The empty family has union `∅`, a development only when `S = ∅`, where
  `(∅, ∅)` is the unique development.)
- *Maximal developments* (`EquationOfState.exists_maximal_development`). Every development lies
  below a maximal one (`zorn_le_nonempty₀` started
  at the given development: every nonempty chain is a nonempty compatible family, whose union is
  an upper bound; EperonReallSbierski2019 lines 1010–1012, Remark 3.56, the same use of Zorn's
  lemma for a quasilinear wave equation).
- *Uniqueness criterion* (`EquationOfState.isGreatest_development_of_solution`). If the data on
  the Λ-invariant open `S` extend to a Λ-periodic classical solution `U_*` on all of `H_{t₀}`, then
  `(D⁺_{H_{t₀}}({t₀} × S), U_*)` is a development and every development is below it, which is
  therefore the unique maximal development (EperonReallSbierski2019 line 1342, Corollary 4.69,
  for quasilinear wave equations). No bound on the acoustical field of `U_*` is needed: a past
  causal curve of `U_*` from a point of a development `D` cannot leave `D` at a time `> t₀`, by
  the first-exit argument.
- *Failure of uniqueness* (`exists_incompatible_developments`). For the law `P(ρ, s) = ρ²` on
  `(0, ∞) × ℝ` (`quadraticLaw`), `n = 1`, `t₀ = 0`, `Λ = 0` and the data
  `(ρ, v, s) = (1/2, 2, 0)` on `x < −1` and `(1/2, −2, 0)` on `x > 1`, there are two
  developments that are not compatible; the developments and the computation are the first
  Check below.

The classical statement that any two developments agree on `D₁ ∩ D₂`, so that the union of all
developments is the unique maximal development (ChristodoulouMiao2014 lines 872–880), is false
on a fixed Galilean background; the Checks give a counterexample with constant states. Uniqueness
of a maximal development is a property to be proved for the data at hand, as
EperonReallSbierski2019 (line 767, Theorem 3.45, and lines 1195–1210) and AbbresciaSpeck2022
(lines 408–414) explain; the criterion above and the existence theorem of §8.3 are the forms in
which it holds here.

**Checks.**

- *Non-uniqueness.* `n = 1`, `p = ρ²` (`c = 1` at `ρ = 1/2`), `t₀ = 0`,
  `S = (−∞, −1) ∪ (1, ∞)`, data `(1/2, 2)` on `(−∞, −1)` and `(1/2, −2)` on `(1, ∞)`. The towers
  `T_L = {x < −1 + t}` and `T_R = {x > 1 − t}` are the domains of dependence of the two half-lines
  for the constant states (`v − c = 1`, `v + c = −1`). Then `D₁ = T_L ∪ (T_R ∩ {t < 1})` and
  `D₂ = (T_L ∩ {t < 1}) ∪ T_R` with the constant states are developments, `(2, 0) ∈ D₁ ∩ D₂`, and
  `v₁(2, 0) = 2 ≠ −2 = v₂(2, 0)`. No development lies above both, so there are at least two
  maximal developments. Here `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`, and `D₁ ∩ D₂` is disconnected (its slice at
  `t = 1` is empty), in line with EperonReallSbierski2019 line 1338, Corollary 4.68, which is
  stated for quasilinear wave equations with data on a connected hypersurface and does not
  apply here (the system is Euler and `S` is disconnected).
- Constant data on `B(0, R)` extend to the constant solution on `H_{t₀}`, so
  `{|x − v₀(t − t₀)| < R − c₀(t − t₀)}` is the unique maximal development.
- Truncations `D ∩ {t < T}`, `T > t₀`, of a development are below it and compatible with it;
  two truncations at different times are comparable.
- The union statement needs a nonempty family: for constant data on `S = (−1, 1)` the empty
  family is vacuously pairwise compatible, but its union `∅` has initial slice `∅ ≠ {0} × S` and is
  not a development; a singleton family `{(D, U)}` has union `(D, U)`, with initial slice
  `{0} × S`.

*Needs:* §3.3, §6.2, §8.1; Mathlib `zorn_le_nonempty₀`.

### 8.3 Existence of developments

Prove (`EquationOfState.isDevelopment_slab`): let `S` be a Λ-invariant open set with Λ-periodic
data `Ū` on it, `T > 0`, and `U` a classical solution on `O = [t₀, t₀ + T) × E` with
`U(t₀, x) = Ū(x)` for `x ∈ S`; for instance the solution of §7.2 (or of §7.3) for an extension
`U₀` of the data to `E`. Then `(D⁺_O({t₀} × S), U)` is a development, and it is the largest
development contained in `O`: every development `(D, U′)` with `D ⊆ O` has `D ⊆ D⁺_O({t₀} × S)`
and `U′ = U` on `D`. No periodicity of `U` off `D⁺_O({t₀} × S)` is assumed: the extension `U₀`
may be data for the period group `0` only (§8.4, Checks); the translates of `U` by `Λ` are
solutions on `O` with the same data on `S`, and by §6.2 and the largest-development property they
agree with `U` on `D⁺_O({t₀} × S)`, which is therefore Λ-invariant. Consequently two such
solutions give developments that coincide below the smaller of the two times, since each
truncation is a development contained in the smaller slab.

Prove (`EquationOfState.slab_subset_of_maximal`): for full Cauchy data `S = E`, if `U` is a
classical solution on `O` with `U(t₀, ·) = Ū` whose sound speed and velocity are bounded on
`[t₀, t₂] × E` for every `t₂ < t₀ + T` (as for the solutions of §7.2 and §7.3, whose values have
compact closure in the set of states), then every development is compatible with `(O, U)`, and
every maximal development contains the slab `O` (ChristodoulouMiao2014 lines 866–872;
AbbresciaSpeck2022 lines 175–179; LuoYu2023b lines 417–419; Kato1975, Theorem II and Majda1984,
Ch. 2, for the slab). The bound makes `(O, U)` a development (§3.3, slabs) and `U` Λ-periodic
(slab uniqueness, §6.2). Route: openness and idempotence of `D⁺` (§3.3), §6.2 for compatibility,
§8.2.

**Checks.**

- `S = E` with constant data: `O = H_{t₀}` (`T = ∞`), and the unique maximal development is
  `H_{t₀}` itself.
- `S = {x¹ > 0}` with constant data `(ρ₀, v₀)`: the development is `{x¹ > (v₀¹ + c₀)(t − t₀)}`,
  and the extension `U₀ ≡ (ρ₀, v₀)` versus any other `Hᵏ` extension gives the same development
  below the common time.
- With `p = ρ³/3`, the simple-wave data of §7.2 on `S = E` have every maximal development
  containing `[0, T) × ℝ` for each `T < e^{1/2}/√2`.

*Needs:* §3.3, §6.2, §7.2, §7.3, §8.2.

### 8.4 The regular boundary of a maximal development

Prove, for a development `(D, U)` of either Euler system, a point `q ∈ ∂D` with `t(q) > t₀`, an
open neighbourhood `N` of `q` and a `C¹` function `φ` on `N` with `dφ(q) ≠ 0` and
`D ∩ N = {φ < 0}`:

- (a) (`EquationOfState.boundary_futureCausal`) If the acoustical field `(c, v)` of `U` extends
  continuously from `D` to `q` with `c(q) > 0`, then
  `∂_tφ(q) + v(q)·∇φ(q) ≥ c(q)|∇φ(q)|`: the boundary is spacelike or null at `q` with `D` on its
  past side. Route: otherwise a past-directed timelike vector `X` with `dφ(q)(X) > 0` exists, and
  segments in direction `X` from points of `D` near `q` are causal and leave `D` at time `> t₀`,
  contradicting `D = D⁺_D({t₀} × S)`.
- (b) (`EquationOfState.boundary_null`) If moreover `U` extends to a classical solution `Ũ` on
  the union of the Λ-translates of `N`, Λ-periodically, and no development `(D′, U′) ≥ (D, U)` with
  `D′ ⊆ D ∪ ⋃_{λ∈Λ} (N + λ)` contains `q` (this holds in particular when `(D, U)` is maximal,
  since `q ∉ D`), then `∂_tφ(q) + ṽ(q)·∇φ(q) = c̃(q)|∇φ(q)|` and `∇φ(q) ≠ 0`: `∂D` is a null
  hypersurface of the acoustical form of `Ũ` at `q`. Route: suppose
  the inequality were strict, and write `a = ∂_tφ(q) + ṽ(q)·∇φ(q)` and `b = ∇φ(q)`, so that
  `a > c̃(q)|b|`. Choose `M` with `c̃ + |ṽ − ṽ(q)| < M` on a neighbourhood of `q` and `M|b| < a`;
  this is possible because `c̃(q) < a/|b|` (with no upper bound when `b = 0`) and by continuity.
  Let `ψ` be the periodised moving cone of §6.1 with apex data `(ε, x_q, ṽ(q), M)`, that is
  `ψ = ε − |x − x_q − (t − t_q)ṽ(q)| − M(t − t_q)` near `q` and its Λ-translates elsewhere, with
  `2ε` below the least norm of a nonzero period. In the coordinates `s = t − t_q`,
  `y = x − x_q − sṽ(q)` the function `φ` is `as + b·y + o(|s| + |y|)`, and on the set where
  `as + b·y ≥ 0` and `ε − |y| − Ms > 0` one has `|y| − (M/a)(b·y) < ε`, a bounded set exactly
  when `M|b| < a`; so for a small ball `N₀ ⊆ N` about `q` and small `ε` the lens
  `{φ ≥ 0} ∩ {ψ > 0} ∩ N₀` lies in a ball of radius `O(ε)` about `q`. This lens, together with
  its Λ-translates, added to `D` with `Ũ`, would give a development above `(D, U)`, contained in
  `D ∪ ⋃_{λ∈Λ} (N + λ)` and containing `q` (where `φ = 0` and `ψ = ε`), against the hypothesis:
  past causal curves from the lens stay in it until they reach `{φ = 0}`, and cannot re-enter it
  from `D` because `φ` increases along future causal curves near `q`. Without the bound `M|b| < a` the
  set `{φ ≥ 0} ∩ {ψ > 0}` need not be small (Check below).

(Christodoulou2019 lines 131–138: the regular part `C` of the boundary of the maximal
development is a null hypersurface; ChristodoulouMiao2014 lines 880–886; LuoYu2023b
lines 417–419; EperonReallSbierski2019 line 1603, Theorem 4.82, for the role of maximal
developments lying on one side of their boundary.)

LorentzianGeometry §12.7 proves, for a locally Lipschitz time-oriented Lorentzian metric on an
open set `U` of a manifold without boundary and `S` closed in a slice `{t = t₀}` of a temporal
function on `U`, that `∂_U D⁺_U(S) ∩ {t > t₀} = H⁺_U(S) ∩ {t > t₀}` and that the horizon
`H⁺_U(S)` is null, in the sense of its §9.2, wherever it is a `C¹` hypersurface. Statement (b)
differs: the acoustical form exists only on `D` and on the neighbourhood `N` to which the
solution extends, `S` is open, `D` is a relatively open subset of the half-space `H_{t₀}`, which
has boundary, and nullity follows, through the moving-cone lens of §6.1, from the absence of a
development above `(D, U)` that contains `q` and adds only points of `N` and its Λ-translates
(in particular from maximality among developments), not from achronality in a fixed spacetime;
(a), for any development, gives only spacelike or null. The two are separated by the constant
state `c = 1`, `v = 0`, `n = 1`, `S = (−1, 1)`: its truncation `{|x| < 1 − t, 0 ≤ t < 1/2}` is a
development (§8.1) whose top `t = 1/2` is spacelike, which (a) allows and at which the hypothesis
of (b) fails (Checks), while §12.7 with `U = ℝ²` sees only
`D⁺_U({0} × [−1, 1]) = {0 ≤ t ≤ 1 − |x|}`, whose boundary above `t = 0` is null, and says nothing
about the truncation.

- *Regular boundary hypersurfaces.* Let `H ⊆ ∂D ∩ {t > t₀}` be a `C¹` hypersurface such that
  each `q ∈ H` has an open neighbourhood `N` with `D ∩ N = {φ < 0}` for a `C¹` function `φ` on
  `N` with `dφ(q) ≠ 0` (so that `D` lies on one side of `H` near `q`), and a classical extension
  of `U` to `N` and, Λ-periodically, to its Λ-translates, as (b) requires (an extension to `N`
  alone gives one on a smaller ball about `q`, by the translation in the route of the statement on
  developments inside a slab below). If `(D, U)` satisfies the hypothesis of (b) at each point of
  `H` for such an `N` (in particular, if `(D, U)` is maximal), then `H` is null for the acoustical
  form of the extension at each of its points; the value of the extension at `q` is the limit of
  `U` from `D`, so this form does not depend on the extension chosen.
- *Developments inside a slab.* Let `(D, U) = (D⁺_O({t₀} × S), U)` be the development of §8.3,
  with `O = [t₀, t₀ + T) × E`, and let `q ∈ ∂D` with `t₀ < t(q) < t₀ + T`, an open `N ∋ q` with
  `N ⊆ (t₀, t₀ + T) × E` and `φ` be as above. Then `∂_tφ(q) + v(q)·∇φ(q) = c(q)|∇φ(q)|` for the
  acoustical field `(c, v)` of `U`: the boundary is null at `q`. Route: (b) on an open ball
  `N₁ ⊆ N` about `q` of diameter less than the least norm of a nonzero period (any open ball about
  `q` inside `N` when `Λ = 0`), so that the translates `N₁ + λ` are pairwise disjoint, with
  `Ũ(t, x + λ) = U(t, x)` for `(t, x) ∈ N₁` and `λ ∈ Λ`. This `Ũ` is a Λ-periodic classical
  solution on `⋃_{λ∈Λ} (N₁ + λ)` (Λ-translates of solutions are solutions, §1.2, §1.3), it extends
  `U` because `D` is Λ-invariant and `U` is Λ-periodic on `D`, and `Ũ(q) = U(q)`. It is `U` itself
  when `U₀` is Λ-periodic, but `U` need not be Λ-periodic off `D` (Check), so `U` on the
  translates of `N` is in general not an extension of the kind (b) requires. A development above
  `(D, U)` contained in `D ∪ ⋃_{λ∈Λ} (N₁ + λ) ⊆ O` is a development contained in `O`, hence below
  `(D, U)`, the largest one (§8.3), so it does not contain `q ∉ D`. On the top `{t = t₀ + T}`
  only (a) applies. For data on a half-space `{x¹ > 0}` this is the configuration of LuoYu2023b
  lines 417–419.

**Checks.**

- Constant state on `B(0, R)`: `φ = |x − v₀(t − t₀)| − R + c₀(t − t₀)` gives
  `∂_tφ + v₀·∇φ = −e·v₀ + c₀ + v₀·e = c₀ = c₀|∇φ|`: null.
- Expanding flow (`p = ρ²/2`, `ρ₀ = 1`) at `t = 1`, `x = 2√2 − 2`: with
  `φ = x − (2√(1 + t) − (1 + t))`, `∂_tφ = 1 − 1/√2 ≈ 0.2929`, `v∂_xφ = √2 − 1 ≈ 0.4142`, sum
  `1/√2`, equal to `c|∂_xφ| = (1 + t)^{−1/2} = 1/√2`: null.
- The truncation `D ∩ {t < T}`, `T > t₀`, has `φ = t − T` with `∂_tφ = 1 > 0 = c|∇φ|`:
  spacelike, which (a) allows; so the hypothesis of (b) must fail on the top. For the state
  `c = 1`, `v = 0` and the truncation `{|x| < 1 − t, 0 ≤ t < 1/2}` it does: at a top point
  `(1/2, x_q)`, `|x_q| < 1/2`, and for `0 < r < 1/2 − |x_q|` so small that the cone below lies
  in `N`, the union with
  `{t ≥ 1/2, |x − x_q| < r − 2(t − 1/2)}` and the constant state is a development above the
  truncation containing `(1/2, x_q)` (a backward causal curve, of speed at most `1`, stays in the
  cone of slope `2` down to `t = 1/2` and then has `|x(t)| < |x_q| + r + 1/2 − t < 1 − t`), so the
  consequence for hypersurfaces claims nothing about the top. On the lateral boundary `|x| = 1 − t`
  of the maximal development `{|x| < 1 − t}` it gives, with `φ = |x| − 1 + t`,
  `∂_tφ = 1 = c|∂_xφ|`. The domain `{|x| < 1 − t/2}` with `c = 1`, `v = 0` has
  `∂_tφ = 1/2 < 1 = c|∇φ|`: timelike, excluded by (a), and indeed it is not a development.
- Developments inside a slab: `n = 1`, `c₀ = 1`, `v₀ = 0`, `t₀ = 0`, `T = 1`, constant data on
  `S = {x > 0}`, so `D = D⁺_O({0} × S) = {x > t, 0 ≤ t < 1}`. At `(t, x) = (1/2, 1/2)`, `φ = t − x`
  gives `∂_tφ + v∂_xφ = 1 = c|∂_xφ|`: null, as the slab statement asserts. At `(1, 5)`, on the
  top, `φ = t − 1` gives `∂_tφ = 1 > 0 = c|∂_xφ|`: spacelike, although the constant state extends
  past it; there the slab statement does not apply (`t(q) = t₀ + T`, and no `N ∋ q` lies in
  `(0, 1) × ℝ`), and the hypothesis of (b) fails, since for small `r` (the cone inside `N`) the
  union of `D` with
  `{t ≥ 1, |x − 5| < r − 2(t − 1)}` is a development above `D` containing `(1, 5)`. So the
  hypothesis of (b) cannot be weakened to "`U` extends classically to `N`" by dropping the
  condition on developments.
- The slab solution need not be Λ-periodic off `D`: `n = 1`, `Λ = ℤ`, `t₀ = 0`, an equation of
  state with `c₀ = 1` at `ρ₀`, and the data `(ρ₀, 0)` on `S = ⋃_{k∈ℤ} (k, k + 1/2)`, extended to
  `U₀` equal to `(ρ₀, 0)` off `(0.52, 0.6)` and changing there only the Riemann invariant
  `v − ∫^ρ c(r)/r dr`, by a bump of size `δ` that is nonzero on all of `(0.52, 0.6)` (a §7.2 datum
  for the period group `0`, whose solution exists beyond `t = 1/4` for `δ` small). That invariant
  is constant along curves of speed `v − c = −1 + O(δ)`. `U` is constant on `D`, the union of the
  triangles `{k + t < x < k + 1/2 − t}` (§6.2). Take `q = (0.2, 0.3)` on the edge `x = 1/2 − t` and `N` the
  ball of radius `0.05` about `q`; the apex `(1/4, 1/4)` and the edge `x = t` are at distance
  `0.0707 > 0.05`, so `D ∩ N = {φ < 0}` with `φ = x − 1/2 + t`. At `(0.21, 0.33) ∈ N` the backward
  curve of speed `v − c` reaches `t = 0` at `0.54 + O(δ)`, so `U ≠ (ρ₀, 0)` there, while `N + 1`
  (`x > 1.25`, `t < 1/4`) lies in `{x ≥ 0.6 + 2t}`, where `U = (ρ₀, 0)` (§6.2, speeds below `2`).
  So `U` on `N ∪ (N + 1)` is not Λ-periodic and is not an extension of the kind (b) requires; the
  translates of `U|_N` (diameter `0.1 < 1`) are, and (b) gives at `q`, for the limit `c = 1`,
  `v = 0` of `U` from `D`, `∂_tφ + v∂_xφ = 1 = c|∂_xφ|`: null.
- The lens of (b) needs the upper bound on `M`: `n = 1`, `c̃ = 1`, `ṽ = 0`, `q = 0` and the
  strictly spacelike `φ = t − 0.9x` (`a = 1 > 0.9 = c̃|b|`). For `M = 5`, `M|b| = 4.5 > 1`, and
  the point `(t, x) = (−100, −400)` has `φ = 260 ≥ 0` and `ψ = ε − 400 + 500 > 0`: the set
  `{φ ≥ 0} ∩ {ψ > 0}` is unbounded. For `M = 1.05`, `c̃ + 0 = 1 < M` and `M|b| = 0.945 < 1`, and
  the set is `{0.9x ≤ t < (ε − |x|)/1.05}`, which forces `|x| + 0.945x < ε`, that is
  `−ε/0.055 < x < ε/1.945`, so `|x| < 18.2ε` and `|t| < 16.4ε`.

*Needs:* §3.1 (covector classification), §3.2 (local existence of causal segments), §3.3,
LorentzianGeometry §12.6 (concatenation), §6.1 (moving cones), §8.1, §8.2; §1.2 and §1.3
(Λ-translates of solutions) for the translated extensions; §8.3 (the largest development in a
slab) for the statement on developments inside a slab only.

### Examples

The worked domains of dependence of the constant states and of the expanding flow are maximal
developments with null boundaries; the counter-flowing constant states give two incompatible
developments.

### Dependencies

Layers 1, 2 (§2.2), 3, 6 and 7; LorentzianGeometry §12.6 (concatenation, for §8.4).

## Downstream consumers

- **Compressible Euler equations, Part II** (characteristic data, acoustical geometry and real
  Sobolev orders):
  characteristic initial data on `S₀ ∪ C` with the constraint and compatibility conditions on
  `C`, acoustical eikonal functions and null foliations (ChristodoulouMiao2014 lines 880–910;
  LuoYu2023b line 910, Definition 2.13), and the ruling of the regular boundary of §8.4 by null
  geodesics issuing from the edge of the data when the boundary is `C²` and the metric `C^{1,1}`;
  and well-posedness at real Sobolev orders `s > n/2 + 1`, through the Kato–Ponce commutator
  estimates on the PDE roadmap's Layer 7 paraproducts. It consumes §§3.1, 3.3, 4.1–4.4, 6.2,
  7.1–7.2 and 8.1–8.4 here and LorentzianGeometry for geodesics and null hypersurfaces.
- **Shock formation and shock development** (Christodoulou2007; Speck2016, §1.11; LukSpeck2018;
  AbbresciaSpeck2022; Christodoulou2019): their theorems describe portions of maximal
  developments of `Hᵏ` data through the acoustical metric and are stated against §7.2, §8.2–§8.4.
- **Rarefaction waves** (LuoYu2023a, LuoYu2023b): the future domain of dependence of data on a
  half-space and its null boundary (§8.3, §8.4) are the carriers of their main theorems.
- **Relativistic fluids and the Einstein equations in harmonic or symmetric hyperbolic
  formulations**: they consume the quasilinear symmetric hyperbolic well-posedness theorem of
  §7.1 and the domain-of-dependence uniqueness of §6.2 for quasilinear systems.

## Worked examples

- *Supersonic counter-flow.* With `p = ρ²`, `ρ = 1/2`, `c = 1`, velocity `2` on the left and `−2`
  on the right, the towers `x < −1 + t` and `x > 1 − t` overlap for `t > 1`; at `(2, 0)` the two
  developments give velocities `2` and `−2`. With a smooth transition on `[−1, 1]` and `S = ℝ`
  the same towers together with a development near `Σ₀` from §7.3 give two incompatible
  developments of full Cauchy data, so the failure is not an artefact of the gap in `S`.
- *Expanding flow.* `ρ = (1 + t)^{−1}`, `v = x/(1 + t)`, `p = ρ²/2`: the maximal development of the
  data on `(−1, 1)` is `{|x| < 2√(1 + t) − (1 + t)}`, closing at `t = 3`, with null boundary.
- *Simple wave.* `p = ρ³/3`: the Riemann invariants solve Burgers' equation and the gradient
  blows up at `T* = e^{1/2}/√2` for the data of §7.2.

## References

- ChristodoulouMiao2014 — D. Christodoulou, S. Miao, *Compressible Flow and Euler's Equations*,
  Surveys of Modern Mathematics 9, 2014; arXiv:1212.2867v2.
- Christodoulou2019 — D. Christodoulou, *The Shock Development Problem*, EMS Monographs, 2019;
  arXiv:1705.00828v1.
- Christodoulou2007 — D. Christodoulou, *The Formation of Shocks in 3-Dimensional Fluids*, EMS
  Monographs, 2007, Ch. 1.
- Speck2016 — J. Speck, *Shock Formation in Small-Data Solutions to 3D Quasilinear Wave
  Equations*, AMS, 2016; arXiv:1407.6320v1.
- LukSpeck2018 — J. Luk, J. Speck, *Shock formation in solutions to the 2D compressible Euler
  equations in the presence of non-zero vorticity*, Invent. Math. 214 (2018); arXiv:1610.00737v1.
- AbbresciaSpeck2022 — L. Abbrescia, J. Speck, *The emergence of the singular boundary from the
  crease in 3D compressible Euler flow*; arXiv:2207.07107v1.
- LuoYu2023a, LuoYu2023b — T.-W. Luo, P. Yu, *On the stability of multi-dimensional rarefaction
  waves I, II*, Ann. of Math. 202 (2025); arXiv:2302.09714v2, arXiv:2305.06308v2.
- EperonReallSbierski2019 — F. C. Eperon, H. S. Reall, J. J. Sbierski, *Predictability of
  subluminal and superluminal wave equations*, Comm. Math. Phys. 368 (2019); arXiv:1802.03020v2.
- BarGinouxPfaffle2007 — C. Bär, N. Ginoux, F. Pfäffle, *Wave Equations on Lorentzian Manifolds and
  Quantization*, 2007; arXiv:0806.1036v1.
- Chrusciel2011 — P. T. Chruściel, *Elements of causality theory*, 2011; arXiv:1110.6706v1.
- MinguzziCone2019 — E. Minguzzi, *Causality theory for closed cone structures with
  applications*, Rev. Math. Phys. 31 (2019); arXiv:1709.06494v4.
- Minguzzi2019 — E. Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019).
- LukNotes — J. Luk, *Introduction to nonlinear wave equations*, lecture notes (author's page), 2016.
- Nirenberg1959 — L. Nirenberg, *On elliptic partial differential equations*, Ann. Sc. Norm.
  Sup. Pisa 13 (1959), 115–162, Lecture II.
- Kato1975 — T. Kato, *The Cauchy problem for quasi-linear symmetric hyperbolic systems*, Arch.
  Rational Mech. Anal. 58 (1975), Theorem II.
- Majda1984 — A. Majda, *Compressible Fluid Flow and Systems of Conservation Laws in Several Space
  Variables*, Springer, 1984, Ch. 2.
- Dafermos2016 — C. M. Dafermos, *Hyperbolic Conservation Laws in Continuum Physics*, 4th ed.,
  2016, Ch. V.
- Friedrichs1954 — K. O. Friedrichs, *Symmetric hyperbolic linear differential equations*, Comm.
  Pure Appl. Math. 7 (1954), 345–392.
- HawkingEllis1973 — S. W. Hawking, G. F. R. Ellis, *The Large Scale Structure of Space-Time*,
  1973, §6.5.
- ONeill1983 — B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, 1983,
  Ch. 14.
