# Roadmap: elliptic analysis of pseudoholomorphic curves

**Summary.** Build the elliptic regularity theory of the Cauchy–Riemann equation as symplectic
topology uses it. That means Sobolev maps from Riemann surfaces into almost complex manifolds,
including surfaces with boundary and totally real boundary conditions. It also means the weak
nonlinear Cauchy–Riemann equation with finite-regularity, domain-dependent and inhomogeneous
data, and the linear estimates for real Cauchy–Riemann operators whose coefficients are only
Sobolev. Building on these, prove the nonlinear bootstrapping theorem, its uniform version for
sequences, and Fredholm theory and Riemann–Roch for real Cauchy–Riemann operators on compact
surfaces with boundary. The spine is McDuff–Salamon, *J-holomorphic Curves and Symplectic
Topology* (2nd ed., AMS Colloquium Publications 52, 2012), Appendices B and C and Chapter 3.

The headline theorem (PH5.1, McDuff–Salamon Theorem B.4.1 and Remark B.4.3): let `p > 2` be
finite, let `(Σ, j)` be a Riemann surface, and let `J` be a `C^ℓ` almost complex structure on
`M`. A `W^{1,p}_loc` map `u : Σ → M` with `du ∘ j = J(u) ∘ du` almost everywhere is of class
`W^{ℓ+1,p}_loc` when `ℓ ≥ 1` and `∂Σ = ∅`. If instead `u(∂Σ) ⊆ L` for a closed smooth totally
real submanifold `L ⊆ M`, then `u` is of class `W^{ℓ,p}_loc` up to the boundary when `ℓ ≥ 2`.
In both cases `u` is smooth when `J` is smooth.

## Scope and ownership

This roadmap owns:

- the local `W^{k,p}` theory of maps from planar domains and half-discs into finite-dimensional
  real normed spaces (PH1);
- `C^ℓ` almost complex structures, totally real embedded submanifolds, and isothermal
  coordinates on surfaces (PH2);
- the linear planar Cauchy–Riemann estimates: the Cauchy and Beurling operators on Hölder and
  `Lᵖ` scales, interior and totally real boundary estimates with Sobolev coefficients, weak
  solution regularity, the similarity principle and unique continuation (PH3);
- intrinsic `W^{k,p}_loc` maps from surfaces into manifolds and the weak pseudoholomorphic
  equation (PH4);
- nonlinear bootstrapping and its uniform version for sequences (PH5);
- Sobolev sections of bundles over compact surfaces with boundary, real Cauchy–Riemann
  operators on them, and their Fredholm theory (PH6);
- the Maslov index of a bundle pair and closed and bordered Riemann–Roch (PH7).

Outside this roadmap:

- [PDE](../PDE/README.md) Lane A owns the scalar Sobolev spaces `W^{k,p}(Ω)` of Euclidean
  domains and their first-order embedding, extension, trace and Rellich theory. PDE Lane E owns
  scalar second-order elliptic regularity. This roadmap consumes Lane A and never restates it.
  The higher-order theory it needs, for vector-valued maps on planar domains and half-discs,
  is PH1.
- [HeegaardFloer](../HeegaardFloer/README.md) owns:
  - Banach manifolds of `W^{k,p}` maps and Fredholm sections (Layer 2);
  - spectral flow, Conley–Zehnder indices and determinant lines (F1.3–F1.4);
  - punctured surfaces with cylindrical ends and weighted Sobolev spaces (F1.5);
  - the local theory of Chapter 2 of McDuff–Salamon: critical points, intersections and
    somewhere injectivity (F2.2);
  - compactness, transversality and gluing for moduli spaces (F2.3–F2.5).

  The planar Cauchy–Riemann package (the Cauchy and Beurling operators, Beltrami charts,
  boundary reflection, bootstrapping and the similarity principle) and closed and bordered
  Riemann–Roch have one owner, this roadmap. HeegaardFloer's Sobolev adapters (F1.1), its
  planar operators and similarity principle (F1.2) and the closed and bordered part of its
  Riemann–Roch (F1.5) are the targets PH1, PH3, PH6 and PH7 here, which HeegaardFloer cites by
  section; F1.2 keeps only its normalized disc solvers with prescribed centre and first jet.
  HeegaardFloer consumes this roadmap and supplies nothing to it.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md#62-regularity-and-solvability)
  P6 owns elliptic regularity and Fredholm theory for smooth-coefficient operators of
  arbitrary order on closed manifolds. This roadmap owns the first-order Cauchy–Riemann case
  with Sobolev coefficients and totally real boundary conditions, which P6 does not cover.
  PH6.4 proves the agreement on their common case.
- [TeichmullerGeometry](../TeichmullerGeometry/README.md) Layer 7.4 owns the Wirtinger
  derivatives of `W^{1,2}_loc` maps, quasiconformal maps and the measurable Beltrami equation
  `f_z̄ = μ f_z` with `‖μ‖_∞ < 1`, including the measurable Riemann mapping theorem. PH2.4
  solves only the Hölder case: a `C^{ℓ,α}` coefficient gives a `C^{ℓ+1,α}` local solution by the
  Beurling contraction of PH3.1. That is the regularity statement the isothermal charts need,
  and it is not the `L^∞` theory.

Every surface here is two-dimensional and every target manifold is finite-dimensional. Elliptic
systems in other dimensions, Hilbert-scale `H^s` spaces of non-integer order, and
pseudodifferential parametrices are outside this roadmap and belong to the roadmaps above.

## Conventions

- **Domains.** `ℂ` carries Lebesgue measure `volume` and coordinate `z = s + it`. Write
  `ℍ̄ = {z : 0 ≤ Im z}` for the closed upper half-plane. A *half-disc* is `D⁺_r = {z ∈ ℍ̄ :
  |z| < r}`; it is relatively open in `ℍ̄`, and its boundary part is `D⁺_r ∩ ℝ`.
- **Cauchy–Riemann operator.** For a map into a complex vector space,
  `∂̄ = (∂_s + i ∂_t)/2`, which is Tau Ceti's
  [`conjWirtingerDeriv u z 1`](https://github.com/TauCetiProject/TauCeti/blob/333c9e49143de812ed1452b412193ee9c05501e7/TauCeti/Analysis/Complex/Wirtinger/Basic.lean).
  For a map `u` into a real vector space `V` with a complex structure field `J : V → End V`,
  the nonlinear operator is `∂_s u + J(u) ∂_t u`; it is twice `∂̄` when `J` is constant. On a
  surface it is `∂̄_J(u) = ½(du + J(u) ∘ du ∘ j)`, a section of `Λ^{0,1} ⊗_J u*TM`. This is
  McDuff–Salamon's normalization.
- **Exponents.** `p` is an extended real `1 < p < ∞` unless stated. Every nonlinear statement
  assumes `p > 2`, which makes `W^{1,p}_loc` maps continuous in dimension two.
  Statements with `k ≥ 1` and `kp > 2` use the Banach-algebra property of `W^{k,p}_loc`.
- **Almost complex structures.** `C^ℓ` with `ℓ : ℕ∞`, `ℓ ≥ 1`. The case `ℓ = ∞` is Tau Ceti's
  [`SmoothAlmostComplexStructure`](https://github.com/TauCetiProject/TauCeti/blob/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean).
  A *domain-dependent* structure on `M` over `Σ` is a `C^ℓ` section of the bundle over `Σ × M`
  whose fiber at `(z, x)` is `End(T_xM)`, with square `−1` in each fiber.
- **Inhomogeneous terms.** An inhomogeneous term is a `C^ℓ` section `ν` of the bundle over
  `Σ × M` with fiber `Hom(T_zΣ, T_xM)`, complex antilinear for `j(z)` and `J(z, x)`. The
  equation is `∂̄_J(u)(z) = ν(z, u(z))`. Floer's equation `∂_s u + J_t(u)(∂_t u − X_t(u)) = 0`
  on a strip or cylinder is the case
  `ν(z, x) = ½(ds ⊗ J_t(x) X_t(x) + dt ⊗ X_t(x))`: evaluating `∂̄_J(u)` on `∂_s` gives
  `½(∂_s u + J_t ∂_t u) = ½ J_t X_t`, and `ν(∂_t) = −J ν(∂_s)`. Pin this formula in PH4.3.
- **Totally real submanifolds.** A *totally real embedding* for `J` is a smooth embedding
  `ι : L → M` in Mathlib's sense
  ([`Manifold.IsSmoothEmbedding`](https://github.com/leanprover-community/mathlib4/blob/f6090c7095e1e56b3464c1daba5f24631f1290d2/Mathlib/Geometry/Manifold/SmoothEmbedding.lean))
  with `2 dim L = dim M`, whose tangent image at every point is maximal totally real for
  `J(ι x)` in Tau Ceti's sense
  ([`TauCeti.IsMaximalTotallyReal`](https://github.com/TauCetiProject/TauCeti/blob/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a/TauCeti/LinearAlgebra/TotallyReal/Basic.lean)).
  Domain-dependent `J` requires the condition for `J(z, ·)` at every boundary point `z`.
- **Surfaces.** All surfaces are Hausdorff and second countable.
  - A *Riemann surface without boundary* is a smooth real two-dimensional manifold with a
    smooth almost complex structure `j`. PH2.4 proves that isothermal charts exist and form a
    holomorphic atlas, and compares this with Mathlib's charted spaces modelled on `ℂ` with
    analytic transition maps.
  - A *Riemann surface with boundary* is a charted space modelled on `ℍ̄` with `HasGroupoid`
    for the *bordered holomorphic groupoid* of PH2.4. That groupoid consists of the
    homeomorphisms between relatively open subsets of `ℍ̄` that are smooth up to the boundary
    and holomorphic in the interior. Such a surface is a smooth manifold with boundary in
    Mathlib's sense and carries an induced `j`.

  Both kinds are written `(Σ, j)`. *Isothermal charts* are the holomorphic charts of the
  respective atlas.
- **Sobolev classes of maps** are local: `W^{k,p}_loc(Σ, M)` never presupposes a metric on `M`.
  Global spaces appear only for sections of vector bundles over compact surfaces (PH6).

Mathlib's Sobolev design discussion
([#mathlib4 > Sobolev spaces](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Sobolev.20spaces.20.28and.20formalization.20done.20by.20Armstrong.20and.20Kemp.29))
settles on Sobolev spaces on normed spaces first, with manifold and bundle versions on top, in
the pattern of `fderiv` and `mfderiv`. PH1 and PH4 follow that pattern. If Mathlib adopts
vector-valued Sobolev spaces, PH1 adopts its API.

## Exact supplier contracts

### From Mathlib

- Manifolds and bundles: `ModelWithCorners`, `𝓡∂ 2`, `IsManifold`, `mfderiv`, `ContMDiff`,
  `ContMDiffSection`, `VectorBundle`, `IsSmoothEmbedding`, `IsImmersionAt`.
- Fredholm operators: `ContinuousLinearMap.IsFredholm` and its index,
  `IsFredholm.comp`, `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`.
- Analysis: `TestFunction`, `MeasureTheory.Lp`, `HasFDerivAt`, the Cauchy integral formula,
  Fourier series on `AddCircle` and Arzelà–Ascoli.

### From Tau Ceti

At the pinned revision
[`358314d4`](https://github.com/TauCetiProject/TauCeti/tree/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a):

- `HasWeakFDerivOn` (vector-valued weak derivatives on `Opens E`), `W1p`, `Wkp`, and the `W1p`
  files `Morrey`, `HolderEmbedding`, `ChainRule`, `Multiplication`,
  `SupercriticalMultiplication`, `Mollification`, `Restriction` and `LocalCompactness`;
- `SmoothAlmostComplexStructure`, `IsPseudoholomorphic` and its `At`, `On` and `WithinAt`
  variants, the normed-space predicate `IsJHolomorphic` and
  `isPseudoholomorphicAt_iff_isJHolomorphicAt`;
- `IsMaximalTotallyReal`, `TotallyRealLoop.maslovIndex`, `maslovIndex_map`, `maslovIndex_prod`
  and `maslovIndex_rotation` (a half turn has index `finrank ℂ E`, so `1` on `ℂ`);
- the Morse–Sard theorem `ContDiff.addHaar_image_criticalPoints_eq_zero`;
- Schwarz reflection across an affine maximal totally real subspace
  (`Analysis/Complex/Conformal/Reflection/TotallyReal`);
- `W1p.hyperplaneTrace`, the `L²` trace of a whole-space `H¹` function on a hyperplane (the
  model `p = 2` only), and `W1p0.extendByZeroL`, extension by zero of `W^{1,p}_0`;
- `ContinuousLinearMap.index_comp` and the Fredholm files under `Analysis/Fredholm`.

At
[`333c9e49`](https://github.com/TauCetiProject/TauCeti/tree/333c9e49143de812ed1452b412193ee9c05501e7),
which postdates the pin, the files below exist and are adopted when the pin reaches them. Until
then `∂̄T = id`, the Calderón–Zygmund inequality, the local solution of `∂̄u = f`, the scalar
similarity principle, the Hölder scale `C^{k,α}` and Weyl's lemma are targets of PH3.1 and
PH3.2 in their own right, so no target waits for the library:

- the Cauchy–Pompeiu formula and the Cauchy transform with parameters
  (`Analysis/Complex/Pompeiu/Basic`, `Parameter`);
- the Calderón–Zygmund inequality `‖Du‖_{Lᵖ} ≤ C‖∂̄u‖_{Lᵖ}` for compactly supported smooth
  `u : ℂ → F`
  (`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_of_hasCompactSupport`,
  `Analysis/Complex/Wirtinger/CalderonZygmund`);
- local solutions of `∂̄u = f` (`Wirtinger/Potential`) and the scalar similarity principle
  (`Wirtinger/Similarity`);
- `CkHolderSpace` (`Analysis/Holder/Iterated`);
- `WeaklyHarmonicOn` and Weyl's lemma `WeaklyHarmonicOn.exists_harmonicOnNhd_ae_eq`
  (`Analysis/InnerProductSpace/Harmonic/Weyl`), with the mean value property
  (`Harmonic/MeanValue`).

### From other roadmaps

- [PDE](../PDE/README.md) Lane A: the scalar spaces `Wkp` and `W1p` (items 1–2), the Sobolev
  and Morrey embeddings (item 4), and item 6's trace operator `W^{1,p}(Ω) → L^p(∂Ω)`, extension
  operator `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)` and Rellich–Kondrachov, all at first order; item 7's
  Hölder spaces `C^{k,α}`. Lane A states these in prose without Lean names. Higher-order
  extension, change of variables and local compactness on planar domains and half-discs are PH1
  targets.
- [CharacteristicClasses](../CharacteristicClasses/README.md) C2.3 (the diagonal trace
  comparison with the alternating Betti sum) and C3.2 (`c₁ = e` in rank one, the Whitney sum
  formula and the determinant-line comparison).
- [ModularForms](../ModularForms/README.md) Layer 10B (iv)–(v) (`dim H⁰(Ω¹) = g_an` and
  `analyticGenus_eq_topologicalGenus` on compact Riemann surfaces), and
  [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layer 5's `RiemannSurface.genus`.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md)
  P5.2 (bundle `W^{k,p}` on compact boundaryless bases) and P6 (for PH6.4).
- [AlgebraicTopology](../AlgebraicTopology/README.md) Stage 6 item 5 (the universal-coefficient
  consequences over a field through the duality maps), Stage 7.1 (Euler–Poincaré and
  independence of the finite CW model) and Stage 8.7 (finite CW type of compact smooth
  manifolds, stated there in prose and applied by FuchsianOrbifolds Layer 5 in real dimension
  two).

## How to read the build

PH1 and PH2.1–PH2.3 are independent foundations. PH3 consumes PH1 and the Tau Ceti
Cauchy–Riemann files. PH2.4 consumes PH3.1. PH4 consumes PH1 and PH2. PH5 is the nonlinear
payoff of PH3 and PH4. PH6 consumes PH3 and PH4's chart calculus. PH7 consumes PH6. The interior
statements of PH3, PH5 and PH6 come before their boundary versions, which add one reflection
argument each.

## Layer 1: local Sobolev maps on planar domains and half-discs (PH1)

### 1.1 Vector-valued local Sobolev classes

For a real normed space `F`, a set `U ⊆ ℂ` and `p`, `MemLpLoc p U u` says that `u : ℂ → F` is
in `Lᵖ(K)` for every compact `K ⊆ U`. For a real normed space `F`, an open `Ω ⊆ ℂ` and `k : ℕ`,
define `MemWkpLoc p Ω k u`. It holds when the iterated weak derivatives `D^i u` exist on `Ω` for
`i ≤ k`, each a `HasWeakFDerivOn` derivative of the previous one and valued in the `i`-fold
iterated continuous linear maps `ℂ →L[ℝ] ⋯ →L[ℝ] F`, and each `D^i u` satisfies `MemLpLoc p Ω`.
The definition admits every real normed space `F`; the theorems of PH3 and PH5 use it for
finite-dimensional `F`, where the iterated continuous linear maps are the continuous
multilinear maps `ℂ [×i]→L[ℝ] F`. Its API:

- for `F = ℝ`, membership is equivalent to `u|_W ∈ Wkp volume W p k` for every relatively
  compact open `W` with closure in `Ω`;
- for every continuous linear `A : F →L[ℝ] G`, membership of `u` gives membership of `A ∘ u`,
  and a map lies in the class exactly when its coordinates in one (equivalently every) basis of
  `F` do;
- the class is closed under addition, scalar multiplication and restriction to smaller opens,
  and has the sheaf property: membership on each set of an open cover gives membership on the
  union;
- membership at order `k + 1` implies membership at order `k`, and at order `0` it is
  `MemLpLoc p Ω`.

**Checks.**

- The identity `z ↦ z` on `Ω = ℂ` lies in `MemWkpLoc p ℂ k` for every `k` and `p`: its first
  weak derivative is the constant `id`, its second is `0`, and constants are `Lᵖ` on compacts.
  A definition that demanded global `Lᵖ` membership would reject it, since `z ∉ Lᵖ(ℂ)`.
- The function `z ↦ |z|` on `Ω = ℂ` lies in `W^{1,p}_loc` for every `p` (its weak gradient
  `z/|z|` is bounded) but not in `W^{2,p}_loc` for `p ≥ 2`: the second derivatives are of size
  `1/|z|`, and `∫_{|z|<1} |z|^{−p}` diverges exactly when `p ≥ 2`. A definition that forgot the
  `Lᵖ` bound on the top derivative would accept it at order `2`.
- A map with a jump across a line, such as the indicator of `{Re z > 0}`, is in `L^p_loc` but
  not in `W^{1,p}_loc`: its distributional derivative is a surface measure, not a function, so no
  `HasWeakFDerivOn` witness exists.
- Agreement with the library: for `F = ℝ` and `Ω = D_1`, the restriction to `W = D_{1/2}` of a
  member is in `Wkp volume W p k`, and conversely membership of all such restrictions gives
  membership on `Ω`.

Do the same for half-discs: `MemWkpLocHalf p U k u`. For a relatively open `U ⊆ ℍ̄`, the weak
derivatives are taken on the interior of `U` in `ℂ`, which is `U ∖ ℝ`, and the `Lᵖ` bounds are
required on every compact `K ⊆ U`, which is the same as on `K ∖ ℝ` because `ℝ` is null. So the
bounds reach the boundary, while the test functions are those of the interior. Prove that a
`W^{k,p}` map on `D⁺_r` extends to a `W^{k,p}` map on `D_r`, with a bound, by the higher-order
reflection `u(s, −t) = Σ_{j=1}^{k} c_j u(s, t/j)` for `t > 0`. The coefficients solve the
Vandermonde system `Σ_j c_j (−1/j)^i = 1` for `0 ≤ i < k`, which matches the normal derivatives
of order `< k` across `ℝ`. At `k = 1` this is the even reflection, the extension operator of
PDE Lane A item 6 for the half-plane.

**Checks.**

- For `U` relatively open in `ℍ̄`, the interior of `U` in `ℂ` is `U ∖ ℝ`: a point of `U` with
  `Im z > 0` has a `ℂ`-neighbourhood inside `U`, and a point with `Im z = 0` has none, since every
  `ℂ`-neighbourhood meets `{Im z < 0}`. So the derivatives are tested only in the interior.
- `k = 1`: the system is `c₁ = 1`, the even reflection `u(s, −t) = u(s, t)`. `k = 2`: the
  system `c₁ + c₂ = 1`, `−c₁ − c₂/2 = 1` has the solution `c₁ = −3`, `c₂ = 4`. A reflection
  using the even extension at `k = 2` fails: `u(s, t) = t` has even extension `|t|`, which is
  not `W^{2,p}` across `ℝ`, while `−3(−t) + 4(−t/2) = t` extends it to `t` on both sides.
- The function `u(s, t) = t^{1/2}` on `D⁺_1` is in `L^p` for all `p` and has derivative
  `t^{−1/2}/2`, which is in `L^p(D⁺_1)` exactly when `p < 2`. So `u ∈ MemWkpLocHalf p D⁺_1 1`
  for `p < 2` and not for `p ≥ 2`: a definition that tested only compact subsets of the open
  half-disc would accept it for every `p`.
- A `W^{1,p}` map on the open half-disc with `p > 2` and a continuous extension to `D⁺_1` need
  not be in `MemWkpLocHalf p D⁺_1 1`: `u = t^{1/2}` is continuous up to `ℝ`.

*Needs:* Tau Ceti `HasWeakFDerivOn`, `W1p`, `Wkp`; PDE Lane A items 1 and 6.

### 1.2 Embeddings, products and composition

For `kp > 2` with `k ≥ 1`, prove the following, both in the interior and on half-discs:

- *Morrey.* Members of `W^{k,p}_loc` have continuous representatives, and for `p > 2` they
  have `C^{k−1,1−2/p}` representatives, with local bounds.
- *Algebra.* Members of `W^{k,p}_loc` form an algebra under bilinear continuous maps
  `F × G → H`, with a local bound.
- *Mixed exponents.* Let `p > 2` and `1 < q ≤ p`, and let `B : F × G → H` be bilinear
  continuous. For `i ≥ 1`, `f ∈ W^{i,p}_loc` and `g ∈ W^{i,q}_loc` give
  `B(f, g) ∈ W^{i,q}_loc`. For `i = 0`, `f ∈ Lᵖ_loc` and `g ∈ W^{1,q}_loc` give
  `B(f, g) ∈ L^q_loc`. Both come with local bounds (McDuff–Salamon Proposition B.1.19,
  p. 560). The case `i = 0` combines Hölder's inequality with the embedding of `W^{1,q}` into
  `L^s` for `1/s = 1/q − 1/2` when `q < 2`, every finite `s` when `q = 2`, and `L^∞` when
  `q > 2`; it uses `p > 2`.
- *Composition.* If `g : F → G` is `C^ℓ` with `ℓ ≥ k` and `u ∈ W^{k,p}_loc`, then
  `g ∘ u ∈ W^{k,p}_loc`, with the chain rule for weak derivatives and a local bound depending
  on `‖g‖_{C^k}` on a neighbourhood of the image of `u` and on `‖u‖_{W^{k,p}}`.
- *Continuity of composition.* The map `u ↦ g ∘ u` is continuous for `W^{k,p}` on compact
  subsets when `ℓ ≥ k + 1`.
- *Change of variables.* `W^{k,p}_loc` is invariant under `C^{k}` diffeomorphisms between
  planar domains, and under those between half-discs that preserve `ℝ`.

Consume Tau Ceti's `W1p` Morrey, chain-rule and supercritical-multiplication files at `k = 1`.
Prove the higher orders by induction on `k` from them.

**Checks.**

- Mixed exponents at `i = 0` need `p ≥ 2`: `W^{1,q} ⊂ L^s` with `1/s = 1/q − 1/2` for `q < 2`,
  and Hölder gives `fg ∈ L^r` with `1/r = 1/p + 1/s = 1/q + (1/p − 1/2)`, which is at most
  `1/q` exactly when `p ≥ 2`. Below `p = 2` the conclusion is false: for `p = q = 4/3`,
  `f = |z|^{−6/5}` is in `L^{4/3}` near `0` (exponent `8/5 < 2`) and `g = |z|^{−2/5}` is in
  `W^{1,4/3}` (its derivative has size `|z|^{−7/5}`, exponent `28/15 < 2`), but
  `fg = |z|^{−8/5}` is not in `L^{4/3}` (exponent `32/15 > 2`).
- Composition at `k = 1` needs `p > 2`: for `p > 2` and `g(x) = x²`, `g ∘ u = u²` has weak
  derivative `2u Du`, in `L^p_loc` because `u` is continuous. For `p = 4/3` and
  `u = |z|^{−2/5} ∈ W^{1,4/3}`, the square `u² = |z|^{−4/5}` has derivative of size `|z|^{−9/5}`
  with `(9/5)(4/3) = 12/5 > 2`, so `u² ∉ W^{1,4/3}` near `0`.
- Change of variables: the map `z ↦ 2z` carries `MemWkpLoc p D_1 k` to `MemWkpLoc p D_2 k`
  with the derivative scaled by `2^i` at order `i`; the map `z ↦ z̄` preserves the class and
  sends `ℝ` to `ℝ`, so it is admissible on half-discs, while `z ↦ iz` is not: it does not
  preserve `ℝ`.

*Needs:* PH1.1; Tau Ceti `W1p` files `Morrey`, `HolderEmbedding`, `ChainRule`,
`Multiplication` and `SupercriticalMultiplication`; PDE Lane A item 4 and item 7.

### 1.3 Local compactness

Prove local Rellich for these classes: a sequence bounded in `W^{k+1,p}` on compact subsets of
`Ω` (or of a half-disc) has a subsequence converging in `W^{k,p}` on compact subsets. Deduce
`C^{k}` convergence on compact subsets when `p > 2`.

**Checks.**

- The sequence `u_m(z) = sin(ms)` is bounded in `L^∞`, hence in `L^p` on compacts, but has no
  convergent subsequence in `L^p(D_1)`; its derivatives `m cos(ms)` are unbounded, so it is not
  bounded in `W^{1,p}` and the statement does not apply.
- The sequence `u_m(z) = z^m` on `D_1` is bounded in `W^{1,p}` on compact subsets of `D_1` and
  converges to `0` in `L^p` on compacts, together with every derivative, as Rellich predicts.
- On the half-disc, `u_m(s, t) = m^{−1} sin(mt)` is bounded in `W^{1,p}` up to `ℝ` and converges
  uniformly to `0`, while `Du_m = cos(mt)` has no convergent subsequence: convergence is in
  `W^{k,p}`, not `W^{k+1,p}`.

*Needs:* PH1.1, PH1.2; PDE Lane A item 6's Rellich–Kondrachov; Tau Ceti `W1p.LocalCompactness`.

### Examples

- The identity, polynomials and holomorphic functions on `Ω` lie in every `MemWkpLoc p Ω k`.
- `|z|` lies in `W^{1,p}_loc(ℂ)` for every `p` and in `W^{2,p}_loc` exactly for `p < 2`.
- `t^{1/2}` on `D⁺_1` lies in `MemWkpLocHalf p D⁺_1 1` exactly for `p < 2`.
- The `k = 2` reflection `u(s, −t) = −3u(s, t) + 4u(s, t/2)` of `u = t` is `t` again.

### Dependencies

Tau Ceti `HasWeakFDerivOn`, `W1p`, `Wkp` and the `W1p` files named in 1.2 and 1.3; PDE Lane A
items 1, 4, 6 and 7. Nothing from later layers.

## Layer 2: almost complex structures, totally real submanifolds and isothermal coordinates (PH2)

### 2.1 Finite-regularity almost complex structures

Define the *`C^ℓ` almost complex structures* on a smooth manifold `M`, for `ℓ : ℕ∞`: a
`ContMDiffSection` of class `ℓ` of the tangent endomorphism bundle with square `−1` in every
fiber. The fields and API follow `SmoothAlmostComplexStructure`:

- at `ℓ = ∞` the carrier is equivalent to `SmoothAlmostComplexStructure`, whose two fields are
  exactly the section and the square identity;
- restriction to `C^m` for `m ≤ ℓ`, pullback along diffeomorphisms, and products;
- the coordinate expression: in a chart, `J` becomes a `C^ℓ` map `V → End V` on an open subset
  of the model space with square `−1` pointwise, and conversely such a map on a chart domain
  of `M` defines a `C^ℓ` structure there.

Define the *domain-dependent structures* and *inhomogeneous terms* of the Conventions with the
same API: a domain-dependent structure over `Σ` is a `C^ℓ` section over `Σ × M` with square
`−1` in each fiber, and its coordinate expression is a `C^ℓ` map `(z, x) ↦ J(z, x)` into
`End V`.

**Checks.**

- On `M = ℂⁿ` the constant endomorphism `i` is a `C^ℓ` structure for every `ℓ`, and the chart
  expression of a smooth structure is a smooth map, which is the comparison with the library
  carrier at `ℓ = ∞`.
- The identity section fails: `id ∘ id = id ≠ −id`, so it is not a structure for any `ℓ`. A
  smooth section equal to `i` on `|z| < 1` and to `id` on `|z| > 2` fails the fiberwise identity
  on `|z| > 2` and is rejected: the identity is required at every point, not on an open set.
- A `C^ℓ` structure is not `C^{ℓ+1}` in general: on `ℂ²` let `A(z)` be the rotation by the
  angle `|z|^{ℓ+1/2}` in the real plane spanned by `e₁ = (1, 0)` and `e₂ = (0, 1)`, fixing
  `ie₁` and `ie₂`, and put `J(z) = A(z) i A(z)⁻¹`. Then `J(z)² = −1`, the value `J(z)(ie₁)`
  equals `−cos(|z|^{ℓ+1/2}) e₁ − sin(|z|^{ℓ+1/2}) e₂` and depends on `z`, and the angle
  `|z|^{ℓ+1/2}` is `C^ℓ` but not `C^{ℓ+1}` at `0`. So the class parameter is not redundant. On
  `ℂ` itself the same recipe gives nothing, since rotations commute with `i`.
- Floer's equation as an inhomogeneous term (Conventions): with `J` and `X` independent of
  `z`, evaluating `∂̄_J(u) = ½(du + J du j)` on `∂_s` gives `½(∂_s u + J∂_t u) = ½ J X` when
  `∂_s u + J(∂_t u − X) = 0`, and antilinearity `ν(∂_t) = ν(j∂_s) = −J ν(∂_s) = ½ X`. So
  `ν = ½(ds ⊗ JX + dt ⊗ X)`, and the plausible wrong normalisation `ν = ds ⊗ JX + dt ⊗ X`
  would be off by the factor `2` of the operator.

*Needs:* Mathlib `ContMDiffSection`, `IsManifold`, `mfderiv`; Tau Ceti
`SmoothAlmostComplexStructure`.

### 2.2 Totally real embeddings

Define the predicate *totally real embedding* of the Conventions: a smooth embedding
`ι : L → M` with `2 dim L = dim M` whose tangent image at every point is maximal totally real
for `J(ι x)`, that is `IsMaximalTotallyReal (J(ι x)) (im dι_x)`, which Tau Ceti defines as
`IsCompl` of the subspace and its `J`-image. Prove that a Lagrangian embedding is totally real
for every `ω`-tame `J`, consuming Tau Ceti's linear Lagrangian/totally real comparison. Prove
that totally real embeddings are stable under `C^1`-small perturbation of `J` on compact
subsets of `L`.

**Checks.**

- `ℝⁿ ⊆ ℂⁿ` is maximal totally real for `i`: `ℝⁿ ∩ iℝⁿ = 0` and `ℝⁿ + iℝⁿ = ℂⁿ`, so the
  inclusion of `ℝⁿ` is a totally real embedding for the constant structure `i`.
- The unit circle in `ℂ` is a totally real embedding: at `e^{iθ}` the tangent line is `ie^{iθ}ℝ`
  and its `i`-image `−e^{iθ}ℝ` is complementary to it.
- The complex line `ℂ × 0 ⊆ ℂ²` is not totally real: its tangent space is `i`-invariant, so
  `L ∩ iL = L ≠ 0`. A real line `ℝ × 0 ⊆ ℂ²` is totally real but not maximal: `L + iL = ℂ × 0`
  is not `ℂ²`, so the dimension condition `2 dim L = dim M` is what the predicate adds to total
  reality.
- The Lagrangian `ℝⁿ ⊆ ℂⁿ` for `ω = Σ ds_j ∧ dt_j` is totally real for `i`, which is `ω`-tame;
  for the structure `−i`, also `ω`-tame after reversing `ω`, the same subspace is totally real,
  so the conclusion does not depend on the sign of `J`.

*Needs:* Mathlib `IsSmoothEmbedding`, `mfderiv`; Tau Ceti `IsMaximalTotallyReal` and the
Lagrangian/totally real comparison; PH2.1.

### 2.3 Adapted coordinates along a totally real submanifold

For a totally real embedding `ι : L → M` for a `C^ℓ` structure `J` and a point `x₀ ∈ L`,
construct a `C^ℓ` chart `ψ` of `M` near `ι x₀` into `ℂⁿ` with the following properties:

- `ψ(ι(L)) = ψ(U) ∩ ℝⁿ` on its domain `U`;
- `dψ(x) ∘ J(x) = i ∘ dψ(x)` for `x ∈ U ∩ ι(L)`, so the pushed-forward structure `ψ_* J`,
  which is only `C^{ℓ−1}`, equals `i` along `ℝⁿ`;
- for `J_m → J` in `C^ℓ`, the charts `ψ_m` can be chosen to converge to `ψ` in `C^ℓ`.

This is McDuff–Salamon Exercise B.4.10 (p. 577). The construction is as follows. Take a chart
`φ` of `L` at `x₀` and a chart `χ` of `M` at `ι x₀`, and write `γ = χ ∘ ι ∘ φ⁻¹` and `J_χ` for
`J` in the chart. Set `Φ(x + iy) = γ(x) + Σⱼ yⱼ J_χ(γ(x)) ∂ⱼγ(x)` for `x, y ∈ ℝⁿ`. Its
derivative at `(x, 0)` sends `eⱼ ↦ ∂ⱼγ(x)` and `ieⱼ ↦ J_χ(γ(x))∂ⱼγ(x)`. That derivative is
invertible because `TL` is totally real, and it intertwines `i` with `J_χ`. The inverse
function theorem then gives `ψ = (χ⁻¹ ∘ Φ)⁻¹` near `ι x₀`. The pushforward costs one
derivative of `J`, which is why the boundary statements of PH5 need `ℓ ≥ 2`.

**Checks.**

- `M = ℂⁿ`, `J = i`, `L = ℝⁿ`, `φ` and `χ` the identities: `γ(x) = x`, `∂ⱼγ = eⱼ`, and
  `Φ(x + iy) = x + Σⱼ yⱼ i eⱼ = x + iy`. So `ψ` is the identity, `ψ(ℝⁿ) = ℝⁿ` and `ψ_* J = i`
  everywhere, with no loss of regularity: the loss of one derivative is an upper bound, not an
  identity.
- The derivative of `Φ` at `(x, 0)` is invertible exactly when `im dγ(x)` is maximal totally
  real: for `L = ℂ × 0 ⊆ ℂ²` with `γ(x₁, x₂) = (x₁ + ix₂, 0)` and `J = i`, `∂₁γ = (1, 0)`,
  `∂₂γ = (i, 0)` and `J ∂₁γ = (i, 0) = ∂₂γ`, so the derivative has rank `2`, not `4`, and no
  chart exists. The hypothesis of PH2.2 is therefore used.
- Regularity count: with `γ` smooth and `J` of class `C^ℓ`, `Φ` is `C^ℓ`, `ψ` is `C^ℓ` by the
  inverse function theorem, and `ψ_* J = dψ ∘ J ∘ dψ⁻¹` is `C^{ℓ−1}` because `dψ` is `C^{ℓ−1}`.
  At `ℓ = 1` the pushed-forward structure is only continuous, which is why PH5.1's boundary
  case starts at `ℓ = 2`.

*Needs:* PH2.1, PH2.2; Mathlib's inverse function theorem; Tau Ceti `IsMaximalTotallyReal`.

### 2.4 Isothermal coordinates and bordered Riemann surfaces

**Interior.** Let `j` be an almost complex structure of class `C^{ℓ,α}` on a boundaryless
surface, with `ℓ ≥ 1` and `0 < α < 1`. McDuff–Salamon prove this integrability twice, as
Corollary C.5.3 (from Riemann–Roch) and Theorem E.3.1 (p. 664, Newlander–Nirenberg); the route
here is the direct Beltrami one. Prove that every point has a `C^{ℓ+1,α}` chart to an open
subset of `ℂ` in which `j = i`. For smooth `j` the chart is smooth.

Use the Beltrami equation. In a smooth chart, write `j` through its Beltrami coefficient `μ`,
with `|μ| < 1`. Normalize by a real-linear change of coordinates so that `μ(0) = 0`. Rescale to
`μ_ε(z) = χ(z)μ(εz)`, which tends to `0` in `C^{ℓ,α}`. Then solve `h = μ_ε(1 + Bh)` by
contraction on the closed subspace of `C^{ℓ,α}` data supported in a fixed disc, where `B = ∂T`
is the Beurling operator of PH3.1. The function `ψ = z + Th` has `∂̄ψ = μ_ε ∂ψ` and is
`C¹`-close to the identity, so it is a local diffeomorphism. After subtracting `ψ(0)` and
dividing by `∂ψ(0)`, it is the chart.

Prove that the transition map between two `C¹` charts in which `j = i` satisfies the
Cauchy–Riemann equations, so it is holomorphic. Consequently, for smooth `j`, the chart obtained
at `ℓ = 1` differs from the one obtained at each `ℓ = m` by a holomorphic map, so it is
`C^{m+1,α}` for every `m`, hence smooth. So the isothermal charts form an analytic atlas
modelled on `ℂ`. Prove the converse: such an atlas induces a smooth `j`, and the two
constructions are mutually inverse.

**Boundary.** Construct the model with corners `ModelWithCorners ℝ ℂ ℍ̄` for the closed upper
half-plane as a subtype of `ℂ`, and compare it with `𝓡∂ 2` through `z ↦ (s, t)`. Define the
bordered holomorphic groupoid on `ℍ̄` of the Conventions as a Mathlib `StructureGroupoid`. Prove
that it is contained in the smooth groupoid of `𝓡∂ 2`, so that a Riemann surface with boundary
is a smooth manifold with boundary. Prove also that its transition maps send `ℝ` to `ℝ`. Prove
that the induced `j` is smooth up to the boundary, and that the interior of a Riemann surface
with boundary is a Riemann surface without boundary.

**Double.** Construct the *Schottky double* of a compact Riemann surface with boundary. It is a
closed Riemann surface with an antiholomorphic involution whose fixed set is the boundary.
Build it by gluing the surface to its conjugate along the boundary, using `z ↦ z̄` on boundary
charts.

**Checks.**

- Beltrami with `μ = 0`: `h = 0` solves `h = μ(1 + Bh)`, `ψ = z`, and the chart is the
  identity. With a constant `μ = a`, `|a| < 1`, and before the cutoff, `ψ(z) = z + a z̄` has
  `∂̄ψ = a` and `∂ψ = 1`, so `∂̄ψ = μ ∂ψ`; its Jacobian is `1 − |a|² > 0`. For `a = 1` the map
  `z + z̄ = 2s` is not a local diffeomorphism, which is where `|μ| < 1` enters.
- Transition maps: two `C¹` charts with `j = i` differ by a map `τ` with `dτ ∘ i = i ∘ dτ`,
  which is the Cauchy–Riemann equation, so `τ` is holomorphic. The map `z ↦ z̄` satisfies
  `dτ ∘ i = −i ∘ dτ` and is not a transition map: the atlas is holomorphic, not merely
  conformal.
- The bordered holomorphic groupoid contains `z ↦ z + 1` and `z ↦ 2z`, which preserve `ℍ̄` and
  `ℝ` and are holomorphic. It does not contain `z ↦ −z̄`, which preserves `ℍ̄` and `ℝ` but is
  antiholomorphic, nor `z ↦ z + i`, which sends `ℝ` off `ℝ` and sends a relatively open
  neighbourhood of `0` in `ℍ̄` to a set that is not relatively open in `ℍ̄`.
- Schottky double: the closed disc doubles to the Riemann sphere (`χ = 2 = 2·1`), the closed
  annulus to the torus (`χ = 0 = 2·0`), and in both cases the fixed set of `τ` is the boundary,
  one circle and two circles respectively. A gluing by `z ↦ −z̄` instead of `z ↦ z̄` on the
  boundary charts would not match the induced structures across `ℝ`.

*Needs:* PH2.1; PH3.1's Cauchy and Beurling operators on Hölder spaces; Mathlib
`ModelWithCorners`, `𝓡∂ 2`, `StructureGroupoid`, `HasGroupoid` and analytic charted spaces.

### Examples

- `ℂⁿ` with `J = i` and `L = ℝⁿ`: the adapted chart is the identity.
- The unit circle in `ℂ` as a totally real embedding; `ℂ × 0 ⊆ ℂ²` as a non-example.
- The affine solution `z + a z̄` of the Beltrami equation with constant coefficient `a`.
- The sphere and the torus as Schottky doubles of the disc and the annulus.

### Dependencies

Mathlib manifolds, `ContMDiffSection`, `IsSmoothEmbedding`, `mfderiv`, the inverse function
theorem, `StructureGroupoid` and `HasGroupoid`; Tau Ceti `SmoothAlmostComplexStructure`,
`IsMaximalTotallyReal` and the Lagrangian/totally real files. Within this roadmap: PH3.1 for
2.4's Beltrami charts; PH2.1–PH2.3 are independent of PH1 and PH3.

## Layer 3: linear Cauchy–Riemann estimates on the plane and the half-plane (PH3)

### 3.1 Cauchy and Beurling operators

Consume Tau Ceti's Cauchy–Pompeiu files. Define `T f = π⁻¹ ∫ (w − z)⁻¹ f(z) dz` on compactly
supported `f` and the Beurling operator `B = ∂T`. Prove the following:

- `∂̄T = id` and `∂T = B` on compactly supported `C¹` data, extended by density to `Lᵖ` data
  with compact support, `1 < p < ∞`;
- `B` is bounded on `Lᵖ(ℂ)`, `1 < p < ∞`; obtain this from Tau Ceti's Calderón–Zygmund
  inequality;
- for data supported in a fixed disc `D_r`, and every bounded output disc `D_R`, the map
  `T : Lᵖ(D_r) → W^{1,p}(D_R)` is bounded, and `T : C^{k,α}(D_r) → C^{k+1,α}(D_R)` is
  bounded, for every `k ≥ 0` and `0 < α < 1`. A global statement is only the derivative
  bound `‖D(Tf)‖_{Lᵖ(ℂ)} ≤ C‖f‖_{Lᵖ}`: for `1 < p ≤ 2` and data with nonzero integral,
  `Tf(w) ~ c/w` at infinity, so `Tf ∉ Lᵖ(ℂ)`;
- `B` is bounded on `C^{k,α}` of data supported in `D_r`, into `C^{k,α}(D_R)`.

State support radii, cutoffs and constants explicitly. Prove continuity in parameters for
families of data with common support.

Cite existing work in [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare),
`MorseFloer/Part2/CauchyPompeiu.lean` and `CauchyHolder.lean`, for its Cauchy/Beurling
Hölder-scale development. Compare its differential and kernel normalization with
`∂̄ = (∂_s + i∂_t)/2` here. Any code integration follows the README's author-coordination and
licence requirements.

**Checks.**

- Normalisation: Tau Ceti's Cauchy transform at `333c9e49` is `(2π)⁻¹ ∫ (w − z)⁻¹ Du` with
  `D = 2∂̄`, so it inverts `2∂̄` with the constant `(2π)⁻¹`, which is `π⁻¹` for `∂̄`: the two
  normalisations agree. The plausible wrong kernel `(z − w)⁻¹` would give `∂̄T = −id`.
- `f = 1_{D_1}`: `Tf(w) = w̄` for `|w| < 1` and `Tf(w) = 1/w` for `|w| ≥ 1`, by the
  Cauchy–Pompeiu formula applied to `z̄` on the disc (the contour term is the sum of the residues
  `−1/w` and `1/w`, which is `0`) and by expanding `(w − z)⁻¹` in powers of `z/w` outside. So
  `∂̄Tf = 1` inside and `0` outside, which is `f` almost everywhere, and `Tf ~ 1/w` at infinity
  with `1 = π⁻¹ ∫ f`: `Tf ∉ L^p(ℂ)` for `p ≤ 2`, as stated.
- `Bf = ∂Tf` for the same `f` is `0` inside and `−1/w²` outside, which lies in `L^p(ℂ)` exactly
  for `p > 1`, since `∫_{|w|>1} |w|^{−2p}` converges iff `2p > 2`. So `B` cannot be bounded on
  `L¹`, and the range `1 < p < ∞` is sharp at the lower end.
- Hölder gain: `f = 1_{D_1}` is not continuous, and `Tf` is Lipschitz but not `C¹` across the
  circle (`∂Tf` jumps from `0` to `−1/w²`); for the `C^{0,α}` function `f(z) = |z|^α χ(z)`,
  `Tf` is `C^{1,α}` near `0`, one derivative better.

*Needs:* PH1.1; Tau Ceti's Cauchy–Pompeiu and Calderón–Zygmund files at `333c9e49`, until then
their statements as targets here; PDE Lane A item 7's Hölder spaces; Mathlib's Cauchy integral
formula.

### 3.2 Interior estimates and regularity for `∂̄`

For `1 < q < ∞`, `k ≥ 0` and compact `K ⊆ Ω`:

- *Estimate.* For `ξ ∈ W^{k+1,q}_loc(Ω; ℂⁿ)`, prove
  `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖∂̄ξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})` for an open `Ω'` with
  `K ⊆ Ω' ⋐ Ω`.
- *Weak regularity.* If `ξ ∈ L^q_loc` and the distribution `∂̄ξ` is in `W^{k,q}_loc`, then
  `ξ ∈ W^{k+1,q}_loc`. The case `∂̄ξ = 0` is Weyl's lemma for `∂̄`: `ξ` agrees almost
  everywhere with a holomorphic function.
- *Divergence-form Laplace regularity.* Let `1 < r ≤ q < ∞`. If `ξ ∈ L^q_loc(Ω; ℝ^N)` and
  `f, g ∈ L^r_loc(Ω; ℝ^N)` satisfy `∫ ξ Δφ = −∫ (f ∂_s φ + g ∂_t φ)` for every test function
  `φ`, so that `Δξ = ∂_s f + ∂_t g` weakly, then `ξ ∈ W^{1,r}_loc`, with
  `‖ξ‖_{W^{1,r}(K)} ≤ C(‖f‖_{L^r(Ω')} + ‖g‖_{L^r(Ω')} + ‖ξ‖_{L^q(Ω')})`.

  Prove it from PH3.1 and Weyl's lemma, not from a general second-order theory. Take a cutoff
  `χ` equal to `1` on a neighbourhood `Ω''` of `K` and supported in `Ω'`, and put
  `ξ₀ = ½ Re T(χ(f + ig))`, with `T` applied componentwise. Since `Δ = 4∂∂̄`,
  `∂̄T = id` and `2 Re ∂(f + ig) = ∂_s f + ∂_t g` for real `f, g`, the function `ξ₀` solves
  `Δξ₀ = ∂_s f + ∂_t g` weakly on `Ω''`. Its derivative lies in `L^r` by the boundedness of
  `B`. So `ξ − ξ₀` is weakly harmonic on `Ω''` in the sense of Tau Ceti's `WeaklyHarmonicOn`,
  hence harmonic after modification on a null set
  (`WeaklyHarmonicOn.exists_harmonicOnNhd_ae_eq`). The mean value property bounds its
  derivatives on `K` by its `L¹` norm on `Ω''`.

**Checks.**

- The `L^q` term in the estimate is needed: `ξ = zⁿ` has `∂̄ξ = 0` and `‖ξ‖_{W^{1,q}(K)} > 0`,
  so an estimate without `‖ξ‖_{L^q(Ω')}` would make the kernel of `∂̄` zero.
- Weyl's lemma for `∂̄` separates `z̄` from the holomorphic functions: `∂̄z̄ = 1 ≠ 0`, so `z̄` is
  not almost everywhere equal to a holomorphic function, while every holomorphic `ξ` passes.
- The solution formula: for real `f, g`, with `h = f + ig`, `Δ(½ Re Th) = ½ Re(4∂∂̄Th) =
  2 Re ∂h = 2 Re(½(∂_s − i∂_t)(f + ig)) = ∂_s f + ∂_t g`, using `Δ = 4∂∂̄` and `∂̄T = id`. The
  plausible wrong factor `Re Th` would solve `Δξ₀ = 2(∂_s f + ∂_t g)`.
- Exponent bookkeeping on `ξ = log|z|` near `0`: `∇ξ = z/|z|²` has size `1/|z|`, so with
  `f = s/|z|²` and `g = t/|z|²` the data are in `L^r` exactly for `r < 2`, and the conclusion
  `ξ ∈ W^{1,r}` holds exactly for `r < 2`: the statement is consistent at every `r`, and
  nothing is claimed at `r = 2`, where `f ∉ L²`.

*Needs:* PH3.1; Tau Ceti `WeaklyHarmonicOn`, `WeaklyHarmonicOn.exists_harmonicOnNhd_ae_eq` and
the mean value property at `333c9e49`, until then Weyl's lemma as a target here; PH1.1–PH1.2.

### 3.3 Interior estimates with Sobolev coefficients

Let `p > 2` be finite and `ℓ ≥ 1`. Let `J ∈ W^{ℓ,p}_loc(Ω; End ℝ^{2n})` with `J² = −1`
pointwise, let `m ∈ {ℓ − 1, ℓ}`, and let `S ∈ W^{m,p}_loc(Ω; End ℝ^{2n})`. Put
`Dξ = ∂_s ξ + J ∂_t ξ + S ξ`. For `p/(p−1) < q ≤ p` and `0 ≤ k ≤ m`, prove the following:

- *Weak regularity.* Call `ξ ∈ L^q_loc` a weak solution of `Dξ = η` if it satisfies
  `∫⟨D*φ, ξ⟩ = ∫⟨φ, η⟩` for every test function `φ`, with `D*` the formal adjoint. If
  `η ∈ W^{k,q}_loc`, then `ξ ∈ W^{k+1,q}_loc`.
- *Estimate.* `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖Dξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})`, where `C` depends
  only on `K`, `Ω'`, `k`, `q`, `p` and bounds for `‖J‖_{W^{ℓ,p}(Ω')}` and
  `‖S‖_{W^{m,p}(Ω')}`.
- *Uniformity.* The same constant works for every `(J, S)` in a set bounded in these norms.

The lower bound on `q` is strict: the first step below needs `1/p + 1/q < 1`. The case
`m = ℓ` (including `S = 0`) gains the full derivative, and PH5.1 uses exactly this case. For
`S = 0` these are the interior cases of McDuff–Salamon Lemma B.4.6 (p. 573) and Proposition
B.4.9 (p. 575).

Prove it in three lemmas, following McDuff–Salamon §B.4.

1. *Exponent ladder* (Lemma B.4.4, p. 572). For `p > 2` there are finitely many exponents
   `q₀ < ⋯ < q_N` with `p/(p−1) < q₀ ≤ p`, `q_{N−1} < 2p/(p−2) < q_N`, and
   `q_{j+1} = 2r_j/(2 − r_j)` for `r_j = pq_j/(p + q_j)`.
2. *Order zero* (Lemma B.4.6). If `J ∈ W^{1,p}`, `S ∈ Lᵖ`, `ξ ∈ L^q_loc` and `η ∈ L^r_loc` with
   `1/p + 1/q = 1/r`, then `ξ ∈ W^{1,r}_loc`, with the estimate. The proof rewrites the weak
   equation as `Δξ = ∂_s f + ∂_t g` for `f, g ∈ L^r`, and consumes PH3.2's divergence-form
   Laplace regularity. Climbing the ladder with Sobolev embedding gives `ξ ∈ W^{1,p}_loc`
   when `η ∈ Lᵖ`, and `ξ ∈ W^{1,q}_loc` when `η ∈ L^q`. This is the case `k = 0`.
3. *Differentiated equation* (Proposition B.4.9, Steps 2–3). Induct on `k`. Let `1 ≤ k ≤ m`
   and `η ∈ W^{k,q}_loc`; by the case `k − 1`, `ξ ∈ W^{k,q}_loc`. The pair
   `Ξ = (∂_s ξ, ∂_t ξ) ∈ W^{k−1,q}_loc(Ω; ℝ^{4n})` solves, weakly,
   `∂_s Ξ + J̃ ∂_t Ξ + S̃ Ξ = (∂_s η − (∂_s S) ξ, ∂_t η − (∂_t S) ξ)` with
   `J̃ = diag(J, J)` and `S̃ = [[S, ∂_s J], [0, S + ∂_t J]]`. Here `J̃ ∈ W^{ℓ,p}_loc` with
   `J̃² = −1`, and `S̃ ∈ W^{ℓ−1,p}_loc`. The right side is in `W^{k−1,q}_loc` by PH1.2's
   mixed-exponent products, applied to `∂S ∈ W^{m−1,p}_loc` and `ξ ∈ W^{k,q}_loc`; at `k = 1`
   this is the case `i = 0`, McDuff–Salamon Lemma B.4.5. The case `k − 1` for `(J̃, S̃)`, with
   `ℓ − 1` in place of `m`, gives `Ξ ∈ W^{k,q}_loc`, so `ξ ∈ W^{k+1,q}_loc`, with the stated
   estimate. The requirement `k − 1 ≤ ℓ − 1` holds because `k ≤ m ≤ ℓ`.

**Checks.**

- The ladder for `p = 4`: `p/(p − 1) = 4/3` and `2p/(p − 2) = 4`. Starting at `q₀ = 3`,
  `r₀ = 12/7` and `q₁ = 2r₀/(2 − r₀) = 12 > 4`, so `N = 1`; then `r₁ = 4·12/16 = 3 > 2`, the
  solution is in `W^{1,3} ⊂ L^∞`, and the next step lands at `r = p = 4`. A ladder that stopped
  at `q_N = 2p/(p − 2)` would end in `W^{1,r}` with `r = 2`, which does not embed in `L^∞`.
- The lower bound `q > p/(p − 1)` is sharp in the route: at `q = p/(p − 1)` the exponent is
  `r = 1`, and `B` is unbounded on `L¹` (PH3.1's check `B1_{D_1} ∉ L¹`), so the order-zero
  lemma has no `L¹` version.
- The differentiated system at `k = 1`, `n` arbitrary: differentiating
  `∂_s ξ + J∂_t ξ + Sξ = η` in `s` gives `∂_s(∂_sξ) + J∂_t(∂_sξ) + S(∂_sξ) + (∂_sJ)(∂_tξ) =
  ∂_sη − (∂_sS)ξ`, and in `t` gives `∂_s(∂_tξ) + J∂_t(∂_tξ) + (S + ∂_tJ)(∂_tξ) = ∂_tη −
  (∂_tS)ξ`. So `S̃` has rows `[S, ∂_sJ]` and `[0, S + ∂_tJ]`, as stated, and the plausible wrong
  `S̃ = diag(S, S)` would drop the `∂J` terms that force `m ≤ ℓ`.
- Uniformity: for the constant structures `J_m = i` and `S_m = m⁻¹ id`, the set `{(J_m, S_m)}`
  is bounded in every norm and the constants stay bounded; for `S_m = m·id` the estimate's
  constant must grow, since `ξ = e^{−ms}` has `Dξ = 0` with `‖ξ‖_{W^{1,q}} / ‖ξ‖_{L^q}` of
  order `m`.

*Needs:* PH1.2's mixed-exponent products; PH3.2's divergence-form Laplace regularity; the
Morrey embedding of PDE Lane A item 4.

### 3.4 Totally real boundary conditions on the half-disc

Keep the hypotheses of PH3.3 on a relatively open `Ω ⊆ ℍ̄`, and assume that `J(s) = i` for
`s ∈ Ω ∩ ℝ`. Impose `ξ(s) ∈ ℝⁿ` for `s ∈ Ω ∩ ℝ`. This is a pointwise condition when `q > 2`,
because `W^{1,q}` maps are then continuous; for `q ≤ 2` it is a condition on traces, using PDE
Lane A's trace. A weak solution `ξ ∈ L^q_loc(Ω)` is defined by testing against smooth `φ`
compactly supported in `Ω`, not required to vanish on `ℝ`, with `φ(s) ∈ ℝⁿ` for `s ∈ ℝ`. The
weak equation is McDuff–Salamon (B.4.3): `∫⟨∂_s φ + Jᵀ ∂_t φ, ξ⟩ = −∫⟨φ, η + (∂_t J)ξ⟩`, with
the zeroth-order term added. Prove the analogues of PH3.3 on `Ω`, with estimates up to the
boundary, for `0 ≤ k ≤ m`. This is McDuff–Salamon Lemma B.4.6 and Proposition B.4.9 in full,
with `S` added.

The route is as follows.

1. *Order zero.* Reflect across `ℝ`, by `ξ(s, −t) = Rξ(s, t)` with `R = conj`, and by the
   corresponding reflections of the auxiliary functions `f` and `g` of PH3.3's order-zero
   lemma. Prove that the reflected functions satisfy the weak Laplace equation on the doubled
   domain, by splitting each test function into a part satisfying the boundary condition and
   two parts with prescribed parity in `t`. Then apply the interior lemma, and recover the
   boundary condition for the limit from the trace. Tau Ceti's totally real Schwarz reflection
   is the constant-coefficient case.
2. *Higher orders.* Tangential derivatives `∂_s` preserve the boundary condition
   `ξ ∈ ℝⁿ` and satisfy the differentiated equation, so the order-zero step bounds `∂_s ξ`
   up to the boundary. Recover the normal derivative from the equation,
   `∂_t ξ = J(∂_s ξ + Sξ − η)`, which uses `J⁻¹ = −J`, and conclude by PH1.2's products.
   Induct on `j ≤ k`.

Every smooth totally real boundary condition on a bundle is put in this form by smooth
trivializations. For nonlinear boundary conditions, use PH2.3's adapted charts.

**Checks.**

- The weak equation (B.4.3) with `J = i`, `S = 0`, `η = 0` and smooth `ξ`, `φ`: integrating
  `∫⟨Jᵀ∂_tφ, ξ⟩` by parts in `t` on `ℍ` leaves the boundary term `−∫_ℝ ⟨φ, iξ⟩ ds`, which is
  `0` when `φ(s), ξ(s) ∈ ℝⁿ`, and the identity becomes `∫⟨∂_sφ + i∂_tφ, ξ⟩ = −∫⟨φ, ∂_sξ +
  i∂_tξ⟩`. For `φ = iχ` with real `χ` and `ξ = 1` the boundary term is `−∫ χ ds ≠ 0`: the
  real-valuedness of the test functions on `ℝ` is what makes the formulation correct.
- The normal derivative formula with `J = i`, `S = 0`, `η = 0` reads `∂_tξ = i∂_sξ`, the
  Cauchy–Riemann equation satisfied by every holomorphic `ξ`; the plausible wrong sign
  `∂_tξ = −J(∂_sξ + Sξ − η)` would make `ξ = z` fail.
- The model operator `∂̄` on the unit disc with `ξ(e^{iθ}) ∈ e^{3iθ/2}ℝ`: writing
  `ξ = Σ aₙzⁿ`, the condition `e^{−3iθ/2}ξ ∈ ℝ` on the circle is `aₙ = conj(a_{3−n})` for
  `0 ≤ n ≤ 3` and `aₙ = 0` for `n > 3`, so the kernel is `a₀ + a₁z + conj(a₁)z² + conj(a₀)z³`,
  of real dimension `4`. For the condition `e^{ikθ/2}ℝ` the same computation gives real
  dimension `k + 1` for `k ≥ −1` and `0` for `k < −1`, the values PH7.2 uses.
- The reflection at order zero, `ξ(s, −t) = conj(ξ(s, t))`, applied to the real-boundary
  solution `ξ = z` gives the value `s − it` at `(s, −t)`, which is `z` there: the reflected
  function is `z` on the whole disc and holomorphic. The even reflection without `R` gives
  `s + i|t|`, which is not holomorphic for `t < 0`, so the conjugation is what makes the doubled
  function a solution.

*Needs:* PH1.1's half-disc classes and reflection; PH3.3; PDE Lane A item 6's trace; Tau Ceti's
totally real Schwarz reflection (`Reflection/TotallyReal`).

### 3.5 Similarity principle and unique continuation

The *vector similarity principle* is McDuff–Salamon Theorem 2.3.5 (p. 23), the Carleman
similarity principle. Let `p > 2`, let `J ∈ W^{1,p}_loc(Ω; GL(2n, ℝ))`, continuous since
`p > 2`, with `J² = −1` and
`C ∈ L^p_loc(Ω; End ℝ^{2n})`, and let `ξ ∈ W^{1,p}_loc(Ω; ℝ^{2n})` solve
`∂_s ξ + J∂_t ξ + Cξ = 0` with `ξ(z₀) = 0`. Then near `z₀`, `ξ = Φσ` with `Φ ∈ W^{1,p}`
invertible, `Φ⁻¹JΦ = i`, and `σ` holomorphic with `σ(z₀) = 0`. Prove it by
absorbing `B conj(ξ)` into an `L^p` matrix acting on `ξ`, then solving the small-disc Cauchy
integral equation for `Φ`. Consume Tau Ceti's scalar similarity principle as the `n = 1`,
`C^k` case and prove the comparison. Derive the following:

- unique continuation: a solution vanishing on a nonempty open set, or to infinite order at a
  point, vanishes on the connected component;
- isolated zeros with positive orders;
- the boundary version on half-discs with totally real boundary condition, by reflection as in
  PH3.4.

The planar statement is `exists_similarity_of_isWeakLinearCauchyRiemann`: for a
finite-dimensional complex normed space `V`, finite `p > 2`, a continuous
`J ∈ W^{1,p}_loc(Ω; End_ℝ V)` with `J² = −1` on `Ω` (the continuous representative that `p > 2`
provides, fixed as a hypothesis because the Sobolev class alone is insensitive to null sets
while the intertwining `JΦ = Φi` is asked at every point), `C ∈ L^p_loc`, and a continuous `ξ`
with weak derivative in `L^p_loc` solving
`∂_sξ + J∂_tξ + Cξ = 0` a.e. with `ξ(z₀) = 0`, there is a disc about `z₀` in `Ω` carrying a
continuous `W^{1,p}` family `Φ` of real-linear automorphisms of `V` with `J Φ = Φ i`, and a
holomorphic `σ` with `σ(z₀) = 0` and `ξ = Φσ` on the disc.

**Checks.**

- `n = 1`, `J = i`, `C = 2`: `ξ = z e^{−z̄}` satisfies `∂̄ξ = −z e^{−z̄} = −ξ`, that is
  `∂_sξ + i∂_tξ + 2ξ = 0`, with `ξ(0) = 0`. The factorization is `Φ = e^{−z̄}` (invertible,
  `W^{1,p}` for every `p`, commuting with `i`) and `σ = z`, holomorphic with `σ(0) = 0` and a
  simple zero. A definition demanding holomorphic `Φ` would fail here, since `e^{−z̄}` is not.
- The coefficient hypothesis is used: `ξ = e^{−1/|z|²}` (and `0` at `0`) is smooth, vanishes
  to infinite order at `0` and is not identically zero; it solves `2∂̄ξ + Cξ = 0` only for
  `C = −2∂̄(−1/|z|²) = −2z/|z|⁴`, of size `|z|^{−3}`, which is in `L^p_loc` for no `p ≥ 1`.
  So unique continuation fails without `C ∈ L^p_loc`, `p > 2`.
- `J` need not be constant: for an invertible `W^{1,p}` matrix `Φ`, put `J = Φ i Φ⁻¹` and
  `C = −(∂_sΦ + J∂_tΦ)Φ⁻¹ ∈ L^p_loc`. Then every `ξ = Φσ` with `σ` holomorphic solves
  `∂_sξ + J∂_tξ + Cξ = 0`, because `JΦ ∂_tσ = Φ i ∂_tσ` and the derivative of `Φ` is absorbed
  by `C`. The plausible wrong conclusion `Φ⁻¹JΦ = −i` is excluded by `ξ = Φ·z`, which solves
  the equation with `J Φ = Φ i` and not with `J Φ = −Φ i`.
- Order of zeros: `ξ = z²` has a zero of order `2` at `0`, isolated, and the orders of the
  zeros of `ξ = Φσ` are those of the holomorphic `σ`, since `Φ` is invertible.

*Needs:* PH1.1–PH1.2; PH3.1's Cauchy operator; PH3.4's reflection for the boundary version; Tau
Ceti's scalar similarity principle at `333c9e49` for the `n = 1` comparison, until then a
target here.

### Examples

- `Tf` for the indicator of the unit disc: `w̄` inside, `1/w` outside.
- `log|z|`: in `W^{1,r}` exactly for `r < 2`, matching the divergence-form data.
- The ladder for `p = 4` from `q₀ = 3`: `12/7`, `12`, then `3` and `4`.
- The disc kernel `a₀ + a₁z + conj(a₁)z² + conj(a₀)z³` for the boundary condition
  `e^{3iθ/2}ℝ`.
- `z e^{−z̄} = e^{−z̄} · z` as a similarity factorization.

### Dependencies

PH1; Tau Ceti's Pompeiu, Calderón–Zygmund, Potential, Similarity, Weyl and `CkHolderSpace`
files at `333c9e49`, each a target here until the pin reaches them, and the totally real
reflection file at the pin; PDE Lane A items 4, 6 and 7; Mathlib's Cauchy integral formula.
Within this roadmap: PH3.1 → PH3.2 → PH3.3 → PH3.4, and PH3.5 uses PH3.1 and PH3.4.

## Layer 4: Sobolev maps from surfaces and the weak Cauchy–Riemann equation (PH4)

### 4.1 Local Sobolev maps between manifolds

Let `(Σ, j)` be a surface and `M` a manifold, with `k ≥ 1` and `kp > 2`. Define the class
*`W^{k,p}_loc(Σ, M)`* of maps `u : Σ → M`. It requires `u` to be continuous, and it requires
`ψ ∘ u ∘ φ⁻¹` to satisfy PH1.1's `MemWkpLoc` (or `MemWkpLocHalf` at a boundary chart) for every
isothermal chart `φ` of PH2.4 and every chart `ψ` of `M`, on the open part of `φ`'s target where
`u` maps into `ψ`'s source. Prove:

- *Chart independence.* It suffices to test one atlas of each, using PH1.2's composition and
  change-of-variables theorems.
- Smooth maps belong to the class.
- Composition with `C^ℓ` maps `M → N`, for `ℓ ≥ k`, preserves the class.
- *Weak differential.* `du` exists as an a.e.-defined measurable section of
  `Hom(TΣ, u*TM)` with locally `Lᵖ` coordinate expressions. It agrees a.e. with `mfderiv` when
  `u` is `C¹`.

**Checks.**

- `Σ = M = ℂ` with the identity charts: `u = id` is in the class for every `k` and `p`, and so
  is every holomorphic map, by PH1.1's first check.
- The condition `kp > 2` is used in the definition itself: for `k = 1` and `p ≤ 2` the function
  `log log(1/|z|)` near `0` is in `W^{1,p}` but unbounded, so no continuous representative
  exists and "continuous and `W^{1,p}` in charts" would be a different, smaller class than the
  Sobolev one. For `p > 2` the two agree by Morrey.
- Chart independence with a computed transition: on `Σ = ℂ` the two isothermal charts `z` and
  `2z` give the same class, with derivatives scaled by `2`; a chart `z ↦ z̄` is not isothermal
  for `j = i` and is excluded, so no antiholomorphic change of variables is ever tested.
- The weak differential of `u(z) = z̄` from `ℂ` to `ℂ` is the constant conjugation map, which
  agrees with `mfderiv` since `u` is smooth; a definition reading `du` off `∂̄u` alone would
  lose the `∂u` component.

*Needs:* PH1.1, PH1.2; PH2.4's isothermal charts; Mathlib `mfderiv`.

### 4.2 The weak pseudoholomorphic equation

For `J` a `C^ℓ` domain-dependent structure with `ℓ ≥ 1`, `ν` an inhomogeneous term and `p > 2`,
define the predicate *weak pseudoholomorphic map* for `(j, J, ν, p)`. It holds when
`u ∈ W^{1,p}_loc(Σ, M)` and `du + J(z, u) ∘ du ∘ j = 2ν(z, u)` holds almost everywhere. For
boundary conditions, define the predicate *maps the boundary into `L`* as `u(∂Σ) ⊆ ι(L)` for a
totally real embedding `ι`; continuity of `u` makes this pointwise. Prove:

- *Coordinates.* In isothermal coordinates on `Σ` and a chart on `M`, the equation is
  `∂_s u + J(z, u)∂_t u = η(z, u)` a.e., with `η` the coordinate form of `2ν(z, u)(∂_s)`.
- *Comparison.* For `ν = 0`, `J` independent of `z`, `ℓ = ∞` and `u` of class `C¹`, the
  predicate is equivalent to Tau Ceti's `IsPseudoholomorphic`.
- *Invariance.* The predicate is invariant under biholomorphisms of `(Σ, j)` and under
  diffeomorphisms of `M`, transporting `J`, `ν` and `ι`.
- *Locality.* It is a sheaf condition on `Σ`.

The planar forms are the two predicates of the Lean file. `IsWeakCauchyRiemannOn p Ω J η u`,
for an open `Ω ⊆ ℂ`, a finite-dimensional real normed space `V`, `J : ℂ → V → End V`,
`η : ℂ → V → V` and `u : ℂ → V`, says that `u` is continuous on `Ω`, that `u` and a weak
derivative `U` of `u` on `Ω` are in `L^p_loc`, and that `U(z)(1) + J(z, u(z)) U(z)(i) =
η(z, u(z))` almost everywhere on `Ω`. `IsWeakCauchyRiemannHalfOn p U J η u`, for a set `U ⊆ ℂ`
meant to be relatively open in `ℍ̄`, says the same with the weak derivative taken on the
interior of `U` and the `L^p` bounds on the compact subsets of `U`, as in PH1.1's half-disc
class.

**Checks.**

- `V = ℂ`, `J = i`, `η = 0`: the identity `u(z) = z` has `U(z) = id`, so
  `U(z)(1) + i·U(z)(i) = 1 + i·i = 0`, and it satisfies `IsWeakCauchyRiemannOn`; the
  conjugation `u(z) = z̄` has `U(z)(1) = 1`, `U(z)(i) = −i`, so `1 + i(−i) = 2 ≠ 0`, and it
  fails. A definition with `U(z)(i) + J U(z)(1)` in place of `U(z)(1) + J U(z)(i)` would
  reverse these two verdicts.
- Constant maps satisfy the homogeneous equation for every `J`, and satisfy the inhomogeneous
  one exactly when `η(z, u₀) = 0` for a.e. `z`.
- The comparison with `IsPseudoholomorphic` on `M = ℂⁿ`, `J = i`: for `C¹` maps,
  `du ∘ i = i ∘ du` is `∂_su + i∂_tu = 0` evaluated on `∂_s`, which is the planar predicate with
  `U = du`; the predicate therefore does not depend on which of `∂_s`, `∂_t` is tested, since
  the two are related by `j`.
- Floer's equation on the strip, `∂_su + J_t(u)(∂_tu − X_t(u)) = 0`, is the inhomogeneous
  equation with `η(z, x) = J_t(x) X_t(x)`, the coordinate form of `2ν(∂_s)` for the `ν` of the
  Conventions: `2 · ½ J_t X_t = J_t X_t`.

*Needs:* PH1.1, PH2.1, PH2.2, PH4.1; Tau Ceti `IsPseudoholomorphic` and
`isPseudoholomorphicAt_iff_isJHolomorphicAt`.

### Examples

- Holomorphic maps between Riemann surfaces, with `J = j_M` and `ν = 0`.
- Graphs: `u` solves the inhomogeneous equation iff `z ↦ (z, u(z))` is pseudoholomorphic for
  Gromov's structure on `Σ × M`.
- Floer's equation with the formula of the Conventions.
- The constant-structure case `M = ℂⁿ`, `J = i`, where the predicate is `∂̄u = 0` weakly, and
  `z̄` as a non-solution.

### Dependencies

PH1 and PH2; Tau Ceti `IsPseudoholomorphic`, its `At`, `On` and `WithinAt` variants and
`isPseudoholomorphicAt_iff_isJHolomorphicAt`; Mathlib `mfderiv`. Nothing from PH3 or later.

## Layer 5: nonlinear bootstrapping (PH5)

### 5.1 Elliptic bootstrapping

Let `p > 2` be finite, let `J` be a `C^ℓ` domain-dependent structure and `ν` a `C^ℓ`
inhomogeneous term, and let `u` be a weak pseudoholomorphic map for `(j, J, ν, p)` (PH4.2).

- *Interior.* If `ℓ ≥ 1`, then `u ∈ W^{ℓ+1,p}_loc` on the interior of `Σ`, so `u` is `C^ℓ`
  there (McDuff–Salamon Remark B.4.3, p. 571).
- *Boundary.* If `ℓ ≥ 2` and `u` maps `∂Σ` into `ι(L)` for a smooth totally real embedding `ι`
  for `J` with closed image, then `u ∈ W^{ℓ,p}_loc` up to the boundary, so `u` is `C^{ℓ−1}` up
  to the boundary (Theorem B.4.1, p. 571).
- *Smooth case.* If `J` and `ν` are smooth, `u` is smooth, up to the boundary in the boundary
  case.

The proof is local. In coordinates, `z ↦ J(z, u(z))` is in `W^{1,p}_loc`. By induction, if
`u ∈ W^{m,p}_loc` with `1 ≤ m ≤ ℓ`, then `J(z, u)` and `η(z, u)` are in `W^{m,p}_loc` by PH1.2.
Apply PH3.3 in the case `S = 0` to the linear operator `∂_s + J(z, u(z))∂_t` with `ξ = u`,
`η = η(z, u)` and `k = m`; this gives `u ∈ W^{m+1,p}_loc`. At the boundary, a PH2.3 chart puts
`u(z) ∈ ℝⁿ` on the boundary with `J = i` there, at the cost of making the structure `C^{ℓ−1}`.
Then PH3.4 runs the same induction for `m ≤ ℓ − 1`, which is where `ℓ ≥ 2` and the conclusion
`W^{ℓ,p}` come from.

The planar forms are the headline statements of the Lean file, in the coordinates the proof
reduces to. `memWkpLoc_of_isWeakCauchyRiemannOn`: for a finite-dimensional real normed space
`V`, finite `p > 2`, `ℓ ≥ 1`, `J : ℂ → V → End V` of class `C^ℓ` jointly with `J² = −1`
pointwise, `η : ℂ → V → V` of class `C^ℓ`, and `u` satisfying `IsWeakCauchyRiemannOn p Ω J η u`,
the map `u` satisfies `MemWkpLoc p Ω (ℓ + 1)`. `contDiffOn_of_isWeakCauchyRiemannOn`: for smooth
`J` and `η` and any `p > 2`, including `p = ∞`, `u` is smooth on `Ω`.
`memWkpLocHalf_of_isWeakCauchyRiemannHalfOn` is the boundary case in the adapted chart of
PH2.3: `V` is a finite-dimensional complex normed space, `L ⊆ V` a real subspace that is
maximal totally real for multiplication by `i`, `U ⊆ ℍ̄` relatively open, `J` of class `C^ℓ`
with `ℓ ≥ 1`, `J² = −1` and `J(s, x) = i` for `s ∈ U ∩ ℝ` and `x ∈ L`, `η` of class `C^ℓ`, `u`
satisfying `IsWeakCauchyRiemannHalfOn p U J η u` with `u(U ∩ ℝ) ⊆ L`; the conclusion is
`MemWkpLocHalf p U (ℓ + 1) u`, the full derivative, because in the model no chart is needed and
PH3.4's induction runs for all `m ≤ ℓ`. The manifold statement is this one applied to the
`C^{ℓ−1}` structure that PH2.3's chart pushes forward, which is where `ℓ ≥ 2` and `W^{ℓ,p}`
come from. `memWkpLocHalf_all_of_isWeakCauchyRiemannHalfOn` is the smooth case:
`MemWkpLocHalf p U k u` for every `k`, which is smoothness up to the boundary. The interior
manifold statements reduce to the planar ones by PH4.1's charts.

The conclusions require `p < ∞`; a `W^{1,∞}_loc` solution is `W^{1,q}_loc` for every finite
`q > 2`, so the smooth case is unaffected. A `C¹` function `f` near `0` with
`f(z) = z² log log(1/|z|)` has `C¹` derivative `∂̄f` and unbounded second derivatives. Its
graph is pseudoholomorphic for the `C¹` structure `J(z, w)(v, a) = (iv, ia − 2i(∂̄f)(z) v̄)`,
so it is a `W^{1,∞}` solution that is not `W^{2,∞}`. Record this example.

Corollary: a `C¹` map satisfying `IsPseudoholomorphic j J u` for smooth `J` is smooth, with
the boundary version for maps sending `∂Σ` into `ι(L)`. This uses PH4.2's comparison, and the
fact that a `C¹` map is `W^{1,p}_loc` for every `p`.

**Checks.**

- The `p = ∞` example, computed: with `r = |z|` and `g(r) = log log(1/r)`, `∂̄f = z² ∂̄g =
  z³/(2r² log r)`, of size `r/(2|log r|)`, with first derivatives of size `1/|log r|`; both
  tend to `0`, so `∂̄f` is `C¹`. The second derivative `∂²f = 2g + 4z∂g + z²∂²g` has the term
  `2 log log(1/r)`, which is unbounded. The graph `z ↦ (z, f(z))` satisfies `∂̄(z, f) =
  (0, ∂̄f)`, which the stated `J` turns into the equation `∂̄_J = 0`, and `J` is `C¹` because
  `∂̄f` is.
- `ℓ = 1`, interior: a `W^{1,p}` solution for a `C¹` structure is `W^{2,p}`, hence `C¹`. This is
  the case HeegaardFloer F2.2 uses; the plausible wrong reading `W^{ℓ,p}` would give nothing
  at `ℓ = 1`.
- Boundary, `ℓ = 2`: the manifold conclusion is `W^{2,p}`, hence `C¹` up to the boundary. The
  derivative count: PH2.3's chart is `C²`, the pushed-forward structure is `C¹` with `J = i`
  along `ℝⁿ`, and the planar boundary theorem at `ℓ = 1` gives `W^{2,p}`. In the model itself,
  `M = V` with `L` a subspace and the identity chart, a `C^ℓ` structure with `J = i` along `L`
  gives `W^{ℓ+1,p}` for every `ℓ ≥ 1`; a planar statement claiming only `W^{ℓ,p}` would be
  below what PH3.4 proves.
- Holomorphic maps: `u = z` on `Ω = D_1` with `J = i`, `η = 0` satisfies every conclusion with
  every `ℓ`; `u = z̄` satisfies none, since it fails the hypothesis.

*Needs:* PH1.2's composition and products; PH2.3's adapted charts; PH3.3 with `S = 0`; PH3.4;
PH4.1, PH4.2.

### 5.2 Uniform estimates

This is McDuff–Salamon Theorem B.4.2 (p. 571) with Remark B.4.3, extended to domain-dependent
and inhomogeneous data. Let `p > 2` be finite. Let `J_m → J` and `ν_m → ν` in `C^ℓ` on compact
subsets, and `j_m → j` in `C^∞`. Let `U_m ⊆ Σ` be an increasing sequence of open sets with union
`Σ`, and let `u_m : U_m → M` satisfy the weak equations for `(j_m, J_m, ν_m)` with
`u_m(U_m ∩ ∂Σ) ⊆ ι(L)`, for a fixed totally real `ι` whose image is closed in `M`. Without
closedness the boundary condition fails in the limit: for `L = (0, 1) ⊆ ℝ ⊆ ℂ` the constant
maps `u_m = 1/(m + 2)` converge to `0 ∉ L`.

Assume that for every compact `Q ⊆ Σ` there are a compact `K ⊆ M` and `c` with
`u_m(Q) ⊆ K`, and with `‖du_m‖_{Lᵖ(Q)} ≤ c` for large `m`, measured in charts or for a
metric on `M`. Then:

- if `∂Σ = ∅` and `ℓ ≥ 1`, the `u_m` are bounded in `W^{ℓ+1,p}` on compact subsets, with
  constants depending only on the `C^ℓ` bounds of the data and `c`, and a subsequence
  converges in `C^ℓ` on compact subsets;
- in the boundary case with `ℓ ≥ 2`, the `u_m` are bounded in `W^{ℓ,p}` on compact subsets up
  to the boundary, and a subsequence converges in `C^{ℓ−1}` on compact subsets;
- the limit satisfies the limiting equation and boundary condition.

For smooth data converging in `C^∞`, the convergence is `C^∞`. Also prove the gradient-bound
corollary used in compactness, McDuff–Salamon Theorem 4.1.1 (p. 76). If `|du_m|` is uniformly
bounded on compact subsets for a metric on `M`, and the images of compact sets stay in a fixed
compact set, then a subsequence converges in `C^∞` on compact subsets. The convergence comes
from PH1.3 and Arzelà–Ascoli, and the uniform bound from PH3.3's uniformity clause. Its planar
form with fixed data is `exists_subseq_tendstoLocallyUniformlyOn_of_isWeakCauchyRiemannOn`: for
a finite-dimensional real normed space `V`, `p > 2` including `p = ∞`, smooth `J` with `J² = −1`
and smooth `η`, and maps `u_m` satisfying `IsWeakCauchyRiemannOn p Ω J η` for every `m`, if
every compact `K ⊆ Ω` has a compact `K' ⊆ V` containing all `u_m(K)` and a constant bounding
`‖du_m‖` on `K` for all `m`, then a subsequence `u_{φ(m)}` and a solution `v` of the same
equation exist with `D^k u_{φ(m)} → D^k v` locally uniformly on `Ω` for every `k`. Each `u_m`
is smooth on `Ω` by PH5.1, so `du_m` is its classical derivative; the gradient bound gives the
`W^{1,p}` bound on compact subsets that the uniform estimate above needs.

**Checks.**

- Closedness of `ι(L)` is used: for `L = (0, 1) ⊆ ℝ ⊆ ℂ` the constant maps
  `u_m = 1/(m + 2)` on the half-disc satisfy every hypothesis, have `du_m = 0`, and converge to
  the constant `0 ∉ L`, so the limit violates the boundary condition. For `L = ℝ` the same
  sequence converges to a solution with boundary values in `L`.
- The gradient bound is used: on `Σ = D_1`, `M = ℂ`, `J = i`, the holomorphic maps
  `u_m(z) = mz` satisfy the equation, map `D_{1/2}` into `D_{m/2}`, and have no convergent
  subsequence; `‖du_m‖_{L^p(D_{1/2})} = m · vol(D_{1/2})^{1/p}` is unbounded, so the hypothesis
  fails, and in the planar form `|du_m| = m` on `D_{1/2}` violates the pointwise bound. The
  maps `u_m(z) = z/m` satisfy both hypotheses (`|du_m| = 1/m ≤ 1`, images in the closed unit
  disc) and converge in `C^∞` to `0`, a solution, along the identity subsequence.
- The image bound is used in the planar form: on `Ω = D_1`, `J = i`, `η = 0`, the constant
  maps `u_m = m` have `du_m = 0`, so the gradient bound holds with `c = 0`, but no subsequence
  converges; the images `{m}` lie in no fixed compact set, so the hypothesis fails.
- Convergence of the data is used: with `A_m` the rotation of PH2.1's third check by the angle
  `|z|^{ℓ+1/2}/m`, the structures `J_m = A_m i A_m⁻¹` converge to `i` in `C^ℓ` on compacts
  but not in `C^{ℓ+1}`, and the conclusion asserts `C^ℓ` convergence of the solutions, not
  `C^{ℓ+1}`; the `W^{ℓ+1,p}` bound depends on the `C^ℓ` norms of the data only.

*Needs:* PH1.3; PH3.3's uniformity clause and PH3.4; PH5.1; Mathlib's Arzelà–Ascoli.

### Examples

- `z ↦ (z, z² log log(1/|z|))`: a `W^{1,∞}` solution for a `C¹` structure that is not
  `W^{2,∞}`.
- `u = z` and `u = z̄` on the disc for `J = i`: a solution and a non-solution.
- The constants `1/(m + 2)` on the half-disc with `L = (0, 1)`: the limit leaves `L`.
- `mz` and `z/m` on the disc: an unbounded and a bounded sequence of holomorphic maps.

### Dependencies

PH1.2 and PH1.3; PH2.3; PH3.3 and PH3.4; PH4.1 and PH4.2; Mathlib's Arzelà–Ascoli. Nothing
from PH6 or PH7.

## Layer 6: real Cauchy–Riemann operators on bundles over compact surfaces (PH6)

### 6.1 Sobolev sections over compact surfaces with boundary

Let `Σ` be a compact surface with (possibly empty) boundary and `E → Σ` a smooth real vector
bundle with smooth complex structure `J_E`. For `k ≥ 0` and `1 < p < ∞`:

- If `∂Σ = ∅`, consume PseudodifferentialOperators P5.2's bundle `W^{k,p}` carrier on compact
  boundaryless bases, with its completeness, smooth density and norm equivalences. Prove that
  its localizations in isothermal charts and trivializations are PH1.1's local classes.
- If `∂Σ ≠ ∅`, construct `W^{k,p}(Σ, E)` the same way. Fix a finite atlas of isothermal charts
  (half-discs at the boundary) with trivializations and a subordinate partition of unity, and
  give the norm by the PH1.1 norms of the localized pieces. Prove that different choices give
  equivalent norms, completeness, density of sections smooth up to the boundary, Rellich
  compactness `W^{k+1,p} → W^{k,p}`, the Morrey embedding for `kp > 2`, and multiplication by
  `W^{k,p}` coefficients for `kp > 2`. Prove that restriction to the interior agrees with
  P5.2's carrier on every compact boundaryless subsurface.

For a smooth totally real subbundle `F ⊆ E|∂Σ` and `kp > 2`, let `W^{k,p}_F(Σ, E)` be the
closed subspace of sections with boundary values in `F`. Construct the target space
`W^{k−1,p}(Σ, Λ^{0,1} ⊗_ℂ E)` the same way.

**Checks.**

- The closed unit disc with the trivial bundle `ℂⁿ` and `F = ℝⁿ`: the constant section `e₁`
  lies in `W^{k,p}_F` for every `k`, the constant section `ie₁` does not, and for `k = 1`,
  `p > 2` the section `z e₁` lies in `W^{1,p}_F` exactly when `z e₁` is real on the circle,
  which fails (`z = i` at `θ = π/2`), while `(z + z̄) e₁ = 2s e₁` passes.
- Equivalence of norms: on the closed disc, the atlas of one interior chart and four half-disc
  charts at the boundary and the atlas with eight half-disc charts give norms that differ by a
  constant depending on the partitions of unity, and the identity map is bounded both ways.
- Rellich on the closed disc: `W^{1,p} → L^p` is compact, with the witness `sin(ms)`, bounded
  in `L^p` and not in `W^{1,p}`, exactly as in PH1.3; `W^{1,p} → W^{1,p}` is not compact.
- The boundary values are a trace condition when `kp ≤ 2`: for `k = 1`, `p = 2` on the disc the
  function `log log(2/|1 − z|)` is in `W^{1,2}` and has no continuous boundary value at `1`,
  so `W^{1,2}_F` is defined through PDE Lane A item 6's trace, as PH6.2 says.

*Needs:* PH1.1–PH1.3; PH2.4's isothermal charts and bordered atlases; PseudodifferentialOperators
P5.2 for the boundaryless case; PDE Lane A item 6's trace; Mathlib `VectorBundle`.

### 6.2 Real Cauchy–Riemann operators

A *smooth* real Cauchy–Riemann operator on `E` is a real-linear operator
`D₀ : Ω⁰(Σ, E) → Ω^{0,1}(Σ, E)` satisfying the Leibniz rule `D₀(fξ) = f D₀ξ + (∂̄f)ξ` for
real-valued smooth `f`. Prove that any two differ by a smooth zeroth-order term in
`Ω^{0,1}(Σ, End_ℝ E)`, and that a `J_E`-complex connection `∇` gives one, `D₀ = (∇)^{0,1}`.
Prove that every real-linear operator is the sum of a complex-linear one and a zeroth-order
complex antilinear term (McDuff–Salamon Exercise C.1.7).

Following McDuff–Salamon Definition C.1.5 (p. 581), a real Cauchy–Riemann operator *of class
`W^{ℓ−1,p}`*, for an integer `ℓ ≥ 1` and finite `p > 2`, is `D = D₀ + α`. Here `D₀` is a smooth
complex-linear Cauchy–Riemann operator and `α ∈ W^{ℓ−1,p}(Σ, Λ^{0,1} ⊗ End_ℝ E)`. The exponent
`p` is fixed with `α`. The realizations use the exponents of McDuff–Salamon Theorem C.1.10
(p. 583): integers `k ∈ {1, …, ℓ}` and reals `q > 1` with `k − 2/q ≤ ℓ − 2/p`. For such `(k, q)`,
prove the following:

- `D_F : W^{k,q}_F(Σ, E) → W^{k−1,q}(Σ, Λ^{0,1} ⊗ E)` is bounded;
- *Compact perturbation* (McDuff–Salamon Lemma C.2.2, p. 587): multiplication by `α` is
  compact from `W^{k,q}_F` to `W^{k−1,q}`;
- the elliptic estimate `‖ξ‖_{W^{k,q}} ≤ C(‖Dξ‖_{W^{k−1,q}} + ‖ξ‖_{L^q})` holds, by PH3.3 and
  PH3.4 in charts.

PH6.1's spaces are needed here at exponents `q ≤ 2`, with `W^{k,q}_F` defined through traces
when `kq ≤ 2`.

**Checks.**

- `∂̄` on functions over the disc is a smooth complex-linear real Cauchy–Riemann operator:
  `∂̄(fξ) = f∂̄ξ + (∂̄f)ξ` for real `f`. The operator `ξ ↦ ∂̄ξ + ξ̄ dz̄` is a real Cauchy–Riemann
  operator (the same Leibniz rule, since `conj(fξ) = f ξ̄` for real `f`) whose antilinear
  zeroth-order part is `ξ ↦ ξ̄ dz̄`, as the decomposition of Exercise C.1.7 predicts. The
  operator `∂` is not one: `∂(fξ) = f∂ξ + (∂f)ξ` has `∂f`, not `∂̄f`.
- Admissible exponents: for `ℓ = 1`, `k = 1` and `1 − 2/q ≤ 1 − 2/p`, that is `q ≤ p`. For
  `ℓ = 2`, `k = 2` needs `q ≤ p` again, while `k = 1` needs `1 − 2/q ≤ 2 − 2/p`, which holds for
  every `q > 1` because `2/p − 1 < 0`. So the realization `W^{1,q} → L^q` of a `W^{1,p}`
  operator exists at every `q > 1`, and the plausible wrong rule "`q ≤ p` for every `k`" would
  exclude it.
- Compactness of multiplication by `α ∈ W^{ℓ−1,p}` at `ℓ = 1`, `k = 1`, `q < 2`: `W^{1,q}`
  embeds compactly in `L^{s'}` for every `s' < 2q/(2 − q)`, and multiplication by `α ∈ L^p`
  maps `L^{s'} → L^q` when `1/p + 1/s' ≤ 1/q`. Since `1/s'` can be taken as close as desired to
  `1/q − 1/2`, this needs `1/p < 1/2`, that is `p > 2`; at `p = 2` the strict room is gone and
  the argument fails, which is why `p > 2` is required.

*Needs:* PH6.1; PH3.3 and PH3.4 for the estimate; PH1.2's products; Mathlib `VectorBundle`.

### 6.3 Fredholm property, kernel and cokernel

Fix a `J_E`-Hermitian metric on `E` *compatible with* `F`, meaning `J_E F = F^⊥`, and prove such
a metric exists. Fix also an area form compatible with `j`. The dual operator `D_F*` is the
formal adjoint `D*` restricted to (0,1)-forms `η` with `η(T∂Σ) ⊆ F`. Prove that
`∫⟨D_F* η, ξ⟩ = ∫⟨η, D_F ξ⟩` for smooth `ξ` and `η` satisfying the two boundary conditions
(McDuff–Salamon Lemma C.1.9, p. 582). On `D⁺_r` with `D = ∂_s + i∂_t` and `F = ℝⁿ`,
integration by parts leaves the boundary term `−∫_ℝ ⟨iξ, η(∂_s)⟩ ds`, which vanishes for all
`ξ ∈ ℝⁿ` exactly when `η(∂_s) ∈ ℝⁿ`. `D*` is a real Cauchy–Riemann operator of `∂`-type. Put it
in the form of PH3.3 by conjugation and the metric.

Prove McDuff–Salamon Theorem C.1.10 (i), which they prove as Theorem C.2.3 (p. 588), in this
order:

1. *Smooth operators.* For smooth `D` and every admissible `(k, q)`, the operators `D_F` and
   `D_F*` have closed range and finite-dimensional kernel, by the estimate and Rellich. An
   element annihilating the range of `D_F` is a weak solution of `D_F* η = 0`. Since the
   coefficients are smooth, PH3.3–PH3.4 apply at every exponent and make `η` smooth.
   Hence `D_F` is Fredholm.
2. *Duality.* Prove (C.1.3) and (C.1.4): `η ∈ im D_F` exactly when `η` is `L²`-orthogonal to
   `ker D_F*`, and symmetrically.
3. *Rough operators.* For `D = D₀ + α` of class `W^{ℓ−1,p}`, `D_F` is a compact perturbation of
   `(D₀)_F` by PH6.2. So it is Fredholm with the same index. Consume Tau Ceti's
   compact-perturbation Fredholm files under `Analysis/Fredholm`.
4. *Kernel regularity.* The kernels of `D_F` and `D_F*` lie in `W^{ℓ,p}`, so they are
   independent of `(k, q)`. They consist of smooth sections when `α` is smooth.
5. *Unique continuation* for kernel and cokernel elements, from PH3.5.
6. *Deformation.* The index is locally constant along continuous families of zeroth-order
   terms in `W^{ℓ−1,p}`. Consume Mathlib's `IsFredholm.eventually_nhds_index_eq`.

**Checks.**

- The boundary term on `D⁺_r` with `D = ∂_s + i∂_t`, `F = ℝⁿ`: integrating `∫⟨η(∂_s), Dξ⟩` by
  parts in `t` leaves `−∫_ℝ ⟨iξ, η(∂_s)⟩ ds`; for `ξ = e₁` it is `−∫ Re⟨ie₁, η(∂_s)⟩`, which
  vanishes for all real `ξ` exactly when `η(∂_s)` is real. The plausible wrong dual condition
  `η(∂_s) ∈ iℝⁿ` would leave the term `−∫⟨ie₁, ie₁⟩ = −∫ 1 ≠ 0`.
- The disc with `(ℂ, e^{ikθ/2}ℝ)`: `∂̄` has kernel of real dimension `k + 1` for `k ≥ −1`
  (PH3.4's check) and cokernel `0`, index `k + 1`; for `k ≤ −1` the kernel is `0` and the
  cokernel has dimension `−1 − k`, index `k + 1` again. The duality (C.1.3) reproduces the
  cokernel: an adjoint solution is `η = ḡ dz̄` with `g` holomorphic, and the condition
  `η(∂_θ) ∈ e^{ikθ/2}ℝ` on the circle, where `dz̄(∂_θ) = −ie^{−iθ}`, reads
  `g(e^{iθ}) ∈ c·e^{i(−k−2)θ/2}ℝ` for a unit constant `c`. That is the disc condition with
  `k` replaced by `−k − 2`, whose kernel has dimension `(−k − 2) + 1 = −1 − k` for `k ≤ −1`.
  The value `−k − 2 = −μ − 2χ(D)` is the Maslov index the vanishing theorem of PH7.2 assigns
  to `D_F*`.
- Compact perturbation keeps the index: `∂̄ + 1` on functions over the disc with real boundary
  values has the same index `1` as `∂̄`, while its kernel is not the constants, since
  `(∂̄ + 1)c = c ≠ 0`; its solutions are `e^{−z̄}h` with `h` holomorphic, and the boundary
  condition selects those real on the circle. So the kernel changes and the index does not.
- Deformation: along `D_t = ∂̄ + t`, `t ∈ [0, 1]`, the index is constant by
  `IsFredholm.eventually_nhds_index_eq` and compactness of `[0, 1]`; a family with
  unbounded zeroth-order terms, `∂̄ + t/(1 − t)`, is not continuous in `W^{ℓ−1,p}` at `t = 1`
  and the statement does not apply.

*Needs:* PH6.1, PH6.2; PH3.3–PH3.5; Mathlib `ContinuousLinearMap.IsFredholm`,
`IsFredholm.comp`, `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`;
Tau Ceti `ContinuousLinearMap.index_comp` and the compact-perturbation files under
`Analysis/Fredholm`.

### 6.4 Agreement with the smooth-coefficient theory

On a closed surface with smooth coefficients, prove that the kernel and cokernel of PH6.2, for
any `p > 2`, coincide as spaces of smooth sections with those of PseudodifferentialOperators
P6's realization `H^{s+1} → H^s` of the same operator. Hence the indices agree.

**Checks.**

- `∂̄` on functions over the torus `ℂ/(ℤ + iℤ)`: both realizations have kernel the constants
  (real dimension `2`) and cokernel the antiholomorphic `(0,1)`-forms, `conj(c) dz̄`, real
  dimension `2`; index `0 = 1·χ + 2·0`.
- `∂̄` on functions over the sphere: kernel the constants, cokernel `0` (every `(0,1)`-form on
  `S²` is `∂̄` of a function, since `H^{0,1}(S²) = 0`), index `2 = χ(S²)` in both theories.
- A rough operator `∂̄ + α` with `α ∈ L^p` not smooth has no P6 realization at all, so the
  agreement is asserted only for smooth coefficients, as stated.

*Needs:* PH6.2, PH6.3; PseudodifferentialOperators P6 (its `H^{s+1} → H^s` realization and
elliptic regularity); PH3.3's weak regularity at every exponent.

### Examples

- The disc with `(ℂⁿ, ℝⁿ)`: `W^{1,p}_F` contains `e₁` and `2s e₁`, not `ie₁` or `z e₁`.
- `∂̄ + ξ̄ dz̄` as a real-linear, not complex-linear, Cauchy–Riemann operator.
- The disc problem `(ℂ, e^{ikθ/2}ℝ)` with kernel `k + 1` or cokernel `−1 − k`.
- `∂̄` on the torus and the sphere, with indices `0` and `2`.

### Dependencies

PH1 (through PH6.1's localizations), PH2.4, PH3.3–PH3.5, PH4.1; Mathlib `VectorBundle`,
`ContinuousLinearMap.IsFredholm`, `IsFredholm.comp`, `IsFredholm.eventually_nhds_index_eq`,
`index_continuousOn_isFredholm`; Tau Ceti `ContinuousLinearMap.index_comp` and the Fredholm
files under `Analysis/Fredholm`; PseudodifferentialOperators P5.2 (boundaryless bundle
`W^{k,p}`) and P6 (for PH6.4 only); PDE Lane A item 6's trace.

## Layer 7: Maslov index and Riemann–Roch (PH7)

### 7.1 Maslov index of a bundle pair

Let `Σ` be a compact Riemann surface with nonempty boundary, `E` a complex bundle of rank `n`,
and `F ⊆ E|∂Σ` a totally real subbundle. Let `Σ_ℂ` be the Schottky double of PH2.4 with its
antiholomorphic involution `τ`. Construct the *doubled bundle* `E_F → Σ_ℂ`: glue `E` over `Σ`
to the conjugate bundle `Ē` over `τ(Σ)` along `∂Σ`. The gluing identifies the fiber of `E`
with that of `Ē` by the antilinear involution of `E|∂Σ` with fixed set `F`. Use collars to make
the result a smooth complex bundle, prove that it is independent of the choices up to
isomorphism, and lift `τ` to an antilinear involution of `E_F` fixing `F`. Define
`μ(E, F) = c₁(E_F)[Σ_ℂ]`, using CharacteristicClasses C3.2's `c₁` and the complex fundamental
class.

Prove the following. The last four are the axioms of McDuff–Salamon Theorem C.3.5 (p. 595),
and the loop formula is their Theorem C.3.6 (trivial bundle), which they use as the definition:

- *Loop formula.* For a trivialization of `E` over `Σ`, `μ(E, F)` is the sum over the boundary
  circles, oriented as the boundary of `Σ`, of Tau Ceti's `TotallyRealLoop.maslovIndex` of `F`
  read in that trivialization. In particular the sum is independent of the trivialization.
- *Naturality* under bundle isomorphisms.
- *Additivity* under direct sums, compared with `maslovIndex_prod`.
- *Normalization.* `μ(ℂ, e^{ikθ/2}ℝ) = k` on the unit disc, for every integer `k`.
- *Composition.* Gluing along boundary circles where the totally real data match adds the
  indices.

For a closed surface write `μ(E) = 2c₁(E)[Σ]`, the Chern class property of McDuff–Salamon
Theorem C.3.6.

**Checks.**

- Convention witness: on the unit disc with `E = ℂ` and `F = e^{iθ/2}ℝ`, the loop
  `θ ↦ e^{iθ/2}ℝ` is a half turn of the real line, and Tau Ceti's `maslovIndex_rotation` gives
  a half turn the index `1`; so `μ(ℂ, e^{iθ/2}ℝ) = 1`, and the normalisation
  `μ(ℂ, e^{ikθ/2}ℝ) = k` is the `k`-fold half turn. The plausible wrong convention counting
  full turns would give `μ = 1/2` here, which is not an integer.
- Doubling the disc: `Σ_ℂ = S²`, and `E_F` for `(ℂ, e^{ikθ/2}ℝ)` is the line bundle of degree
  `k` on `S²`, so `c₁(E_F)[S²] = k = μ`. For `k = 0` the bundle is trivial and `τ` lifts to the
  conjugation on `S² × ℂ`, whose fixed set over the equator is `ℝ`, as the construction says.
- Orientation: reversing the boundary orientation of the disc turns `e^{ikθ/2}ℝ` into
  `e^{−ikθ/2}ℝ` and `μ` into `−k`; a definition insensitive to the boundary orientation would
  give the same value and could not satisfy the loop formula for both.
- Additivity: `(ℂ², ℝ ⊕ e^{iθ}ℝ)` on the disc has `μ = 0 + 2 = 2`, which `maslovIndex_prod`
  computes from the factors, and the composition axiom on the annulus with matching data
  gives `0 + 0 = 0` for `(ℂ, ℝ)` on both circles, PH7.2's third example.

*Needs:* PH2.4's Schottky double; CharacteristicClasses C3.2's `c₁`; Tau Ceti
`TotallyRealLoop.maslovIndex`, `maslovIndex_map`, `maslovIndex_prod` and
`maslovIndex_rotation`; Mathlib `VectorBundle`.

### 7.2 Riemann–Roch

For a real Cauchy–Riemann operator `D` on `(E, F)` as in PH6, prove `ind_ℝ D = nχ(Σ) + μ(E, F)`
(McDuff–Salamon Theorem C.1.10 (ii), p. 583). In the closed case this is
`ind_ℝ D = nχ(Σ) + 2c₁(E)[Σ]`. Here `χ` is the Euler characteristic of a finite CW model.
Identify it with the alternating Betti sum through CharacteristicClasses C2.3 and
AlgebraicTopology Stage 6 item 5, Stage 7.1 and Stage 8.7's finite CW type of compact
manifolds. Prove
the formula for an arbitrary given `j`, independently of uniformization. Work with connected
`Σ`; the general case is the sum over components.

The closed case follows these steps.

1. *Invariance.* By PH6.3 the index is unchanged along the straight-line path between two
   operators on the same data, so it depends only on `(Σ, j, E)`. It is additive under direct
   sums, and invariant under bundle isomorphisms.
2. *Splitting.* If `rank_ℂ E ≥ 2`, a generic smooth section of `E` has no zeros, because real
   rank `≥ 4 > 2 = dim Σ`. Prove this with Tau Ceti's Morse–Sard theorem
   `ContDiff.addHaar_image_criticalPoints_eq_zero` in charts. A nowhere-zero section and a
   Hermitian metric split `E ≅ ℂ ⊕ E'`. By induction, `E ≅ ℂ^{n−1} ⊕ L` with
   `c₁(L) = c₁(E)`, using the Whitney sum formula of CharacteristicClasses C3.2.
3. *Holomorphic structures.* A complex-linear Cauchy–Riemann operator on a line bundle has
   local holomorphic frames by PH3.5's similarity principle. So it is a holomorphic structure,
   and its kernel is the space of holomorphic sections.
4. *Point twisting.* For a holomorphic line bundle `L` and a point `x`, construct the
   holomorphic line bundle `L(x)` with a holomorphic section `s_x` of `𝒪(x)` vanishing simply at
   `x`. Prove `ind_ℝ ∂̄_{L(x)} = ind_ℝ ∂̄_L + 2` and `c₁(L(x)) = c₁(L) + 1`. Prove the index
   statement from the exact sequence
   `0 → ker ∂̄_L → ker ∂̄_{L(x)} → L(x)_x → coker ∂̄_L → coker ∂̄_{L(x)} → 0`. Here the first map
   is multiplication by `s_x`, and the second is evaluation at `x`. The connecting map sends a
   value `c` to the class of `∂̄(χ σ_c)/s_x`, for a local holomorphic section `σ_c` with value
   `c` and a cutoff `χ`. Prove exactness from PH6.3's identification of cokernels with adjoint
   kernels and from unique continuation. This is the operator form of the induction in
   [ModularForms](../ModularForms/README.md) Layer 10B (iii) along
   `0 → 𝒪_D → 𝒪_{D+P} → ℂ_P → 0`. It is stated for arbitrary holomorphic line bundles because
   it is needed before any line bundle is known to be `𝒪(D)` for a divisor `D`.
5. *Reduction to the trivial bundle.* A generic smooth section of `L` has finitely many
   transverse zeros `xᵢ` with signs `εᵢ`, whose signed count is `c₁(L)[Σ]` by
   CharacteristicClasses C3.2's `c₁ = e`. Twisting the trivial holomorphic bundle at those
   points, by `𝒪(xᵢ)` for `εᵢ = 1` and its dual for `εᵢ = −1`, gives a holomorphic bundle.
   Prove it is smoothly isomorphic to `L`, using the section to build the isomorphism. So
   `ind_ℝ ∂̄_L = ind_ℝ ∂̄_ℂ + 2c₁(L)[Σ]`.
6. *Trivial bundle.* The kernel of `∂̄` on functions is the constants, of real dimension 2.
   By PH6.3, the cokernel is the space of antiholomorphic `(0,1)`-forms, which conjugation
   identifies with the holomorphic 1-forms. Consume ModularForms Layer 10B (iv)–(v):
   `dim_ℂ H⁰(Ω¹) = g_an`, and `analyticGenus_eq_topologicalGenus`, which says that `g_an` equals
   FuchsianOrbifolds Layer 5's `RiemannSurface.genus`, defined by `χ = 2 − 2·genus`. Transport
   through PH2.4's comparison of `(Σ, j)` with analytic charted spaces, and prove that the
   holomorphic 1-forms of PH6 agree with ModularForms' holomorphic differentials. Hence
   `ind_ℝ ∂̄_ℂ = 2 − 2·genus = χ(Σ)`.

Combining the steps gives `ind_ℝ D = (n − 1)χ + χ + 2c₁(E)[Σ]`.

The comparison of this formula with divisor Riemann–Roch, `ind_ℂ ∂̄_{𝒪(D)} = deg D + 1 − g`
against ModularForms Layer 10B (iii), is ComplexCurveModuli D0's operator and divisor
comparison. It is not repeated here.

The bordered case follows from the closed case.

7. *Doubling.* Choose `D` complex linear and commuting with the reflection near `∂Σ` in collar
   coordinates, which is possible by step 1. It extends to a real Cauchy–Riemann operator
   `D_F` on `E_F` that commutes with the lifted `τ`. The kernel and cokernel of `D_F` split
   into `±1` eigenspaces of `τ`; multiplication by `i` exchanges them, and the `+1` part is the
   kernel and cokernel of `D` with boundary condition `F`. Hence `ind D_F = 2 ind D`. The closed
   formula with `χ(Σ_ℂ) = 2χ(Σ)` and `c₁(E_F)[Σ_ℂ] = μ(E, F)` gives the bordered formula.
8. *Check against the disc.* Compute the disc case `(ℂ, e^{ikθ/2}ℝ)` directly by Fourier
   series, as in McDuff–Salamon Theorem C.4.1 (p. 598). For `k ≥ −1` the operator `∂̄` is onto,
   with kernel of real dimension `1 + k`. For `k ≤ −1` it is injective, with cokernel of
   dimension `−1 − k`. Prove that this agrees with step 7.

Finally prove the line-bundle vanishing theorem, McDuff–Salamon Theorem C.1.10 (iii). For
`n = 1`, `D_F` is injective if `μ(E, F) < 0`, and surjective if `μ(E, F) + 2χ(Σ) > 0`. In the
closed case, first prove the *zero count*: a section of a complex line bundle over a closed
connected Riemann surface, in the kernel of a real Cauchy–Riemann operator and not identically
zero, has isolated zeros of positive integer order (PH3.5), and the sum of the orders is
`c₁(E)[Σ]`. Compare the orders with the transverse signed count of CharacteristicClasses C3.2's
`c₁ = e`. So a nonzero kernel element forces `μ(E) = 2c₁(E)[Σ] ≥ 0`. Surjectivity follows by
applying injectivity to `D_F*`, a real Cauchy–Riemann operator on a line bundle with
`μ = −μ(E, F) − 2χ(Σ)`, through PH6.3's duality. In the bordered case, reduce to the closed
case by doubling, as McDuff–Salamon do in their proof of (iii) (p. 603).

**Checks.**

- `c₁(TS²)[S²] = 2`, so `∂̄` on `TS²` has index `2 + 4 = 6`, the real dimension of `PSL₂(ℂ)`,
  whose Lie algebra is the kernel (the holomorphic vector fields `(a + bz + cz²)∂_z`, complex
  dimension `3`); the cokernel is `0`. A formula with `c₁` in place of `2c₁` would give `4`.
- The disc with `(ℂⁿ, ℝⁿ)` has `μ = 0` and index `n·1 + 0 = n`: the kernel is the real
  constants `ℝⁿ`, of real dimension `n`, and the cokernel is `0` (`k = 0` in step 8).
- The annulus with `(ℂ, ℝ)` on both boundary circles has `χ = 0`, `μ = 0` and index `0`: the
  kernel is the real constants (dimension `1`) and the cokernel has dimension `1`, since the
  doubled annulus is the torus and the `τ`-invariant part of its index `0` is `0`.
- The disc with `(ℂ, e^{ikθ/2}ℝ)`: step 8's counts give index `(k + 1) − 0` for `k ≥ −1` and
  `0 − (−1 − k)` for `k ≤ −1`, both equal to `1 + k = χ(D) + μ`, as step 7 predicts.
- The vanishing theorem on the disc: `μ = k < 0` gives injectivity, and step 8 confirms kernel
  `0` for `k ≤ −1`; `μ + 2χ = k + 2 > 0`, that is `k ≥ −1`, gives surjectivity, and step 8
  confirms cokernel `0` there. On the sphere, `𝒪(−1)` has `μ = −2 < 0`, kernel `H⁰(𝒪(−1)) = 0`
  and index `2 − 2 = 0`, so cokernel `0` as well; `𝒪(−2)` has `μ + 2χ = −4 + 4 = 0`, not
  positive, and indeed its cokernel `H¹(𝒪(−2)) = ℂ` is nonzero, so the strict inequality is
  sharp.
- Zero count: the section `z` of the trivial bundle over the sphere, read in the chart at
  infinity as `1/w`, has a pole there, so it is not a global section; the section `z` of
  `𝒪(1)` is global, with one simple zero, and `c₁(𝒪(1))[S²] = 1` agrees with the sum of
  orders.

*Needs:* PH6.3; PH7.1; PH3.5's zero orders; Tau Ceti's Morse–Sard theorem
`ContDiff.addHaar_image_criticalPoints_eq_zero`; CharacteristicClasses C2.3 and C3.2;
AlgebraicTopology Stage 6 item 5, Stage 7.1 and Stage 8.7; ModularForms Layer 10B (iv)–(v);
FuchsianOrbifolds Layer 5's `RiemannSurface.genus`; PH2.4's comparison with analytic charted
spaces; Mathlib's Fourier series on `AddCircle` for step 8.

### Examples

- `TS²`: index `6`, the holomorphic vector fields.
- The disc with `(ℂⁿ, ℝⁿ)`: index `n`; with `(ℂ, e^{ikθ/2}ℝ)`: index `1 + k`.
- The annulus with `(ℂ, ℝ)` on both circles: index `0`.
- `𝒪(−1)` and `𝒪(−2)` on the sphere: the vanishing theorem and its sharpness.

### Dependencies

PH2.4, PH3.5, PH6; Tau Ceti `TotallyRealLoop.maslovIndex`, `maslovIndex_map`,
`maslovIndex_prod`, `maslovIndex_rotation` and `ContDiff.addHaar_image_criticalPoints_eq_zero`;
CharacteristicClasses C2.3 and C3.2; AlgebraicTopology Stage 6 item 5, Stage 7.1 and Stage 8.7;
ModularForms Layer 10B (iii)–(v); FuchsianOrbifolds Layer 5; Mathlib's Fourier series on
`AddCircle`.

## Downstream consumers

The targets here are the single owner of the planar and compact Cauchy–Riemann theory, as the
Scope section states against HeegaardFloer. HeegaardFloer consumes them by section:

- F1.1 consumes PH1 and PH6.1, and F1.2 consumes PH2.3–PH2.4, PH3, PH6.3 and PH7.2's zero
  count. F1.2 keeps its normalized disc solvers with prescribed centre and first jet;
- the closed and bordered part of F1.5 is PH6–PH7, and F1.5's punctured and weighted theory
  consumes PH6–PH7 for the compact pieces;
- F2.2's `W^{2,p}` regularity for `C¹` structures is PH5.1 with `ℓ = 1`;
- F2.3's compactness consumes PH5.2.

The symplectic roadmaps that take the planar estimates, the Hölder Cauchy–Green operator and
Riemann–Roch from HeegaardFloer F1.2 and F1.5 reach these targets through it.

## References

- C. Wendl, *Lectures on Holomorphic Curves in Symplectic and Contact Geometry*, arXiv
  1011.1690v2 (open access): Theorem 2.62 (Calderón–Zygmund, PH3.1), Theorem 2.73 (weak
  regularity of `∂̄`, PH3.2), Theorem 2.78 (the similarity principle with an `L^∞` zeroth-order
  term, the case `J = i` of PH3.5), Theorem 2.89 (interior bootstrapping `W^{m+1,p}` for `C^m`
  structures, PH5.1), Theorem 3.22 (closed Riemann–Roch, PH7.2).
- D. McDuff and D. Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed., AMS
  Colloquium Publications 52, 2012, cited by locator (not openly available). Printed page
  numbers:
  - §2.3 (pp. 21–25): Theorem 2.3.5, the Carleman similarity principle (PH3.5);
  - §4.1: Theorem 4.1.1, convergence under gradient bounds (p. 76, PH5.2);
  - Appendix B: Theorems B.1.11–B.1.12, Sobolev embeddings (p. 555); Proposition B.1.19,
    products (p. 560); Theorem B.2.7, Calderón–Zygmund (p. 565); §B.4, elliptic bootstrapping
    (pp. 571–578), with Theorems B.4.1–B.4.2 and Remark B.4.3 (p. 571), Lemma B.4.4 (p. 572),
    Lemmas B.4.5–B.4.6 (p. 573), Proposition B.4.9 (p. 575) and Exercise B.4.10 (p. 577)
    (PH3.3–PH3.4, PH2.3, PH5);
  - Appendix C: Definition C.1.5 (p. 581), Exercise C.1.7, Lemma C.1.9 (p. 582) and
    Theorem C.1.10 (p. 583) (PH6–PH7); Lemma C.2.2 (p. 587) and Theorem C.2.3 (p. 588) (PH6);
    Theorems C.3.5–C.3.6 (p. 595), the boundary Maslov index (PH7.1); Theorem C.4.1 (p. 598),
    the disc case (PH7.2); Corollary C.5.3, integrability on surfaces (p. 605, PH2.4);
  - Appendix E: Theorem E.3.1, Newlander–Nirenberg (p. 664, PH2.4).
- I. N. Vekua, *Generalized Analytic Functions*, Chapters I–III (Cauchy and Beurling operators,
  similarity principle).
- L. Ahlfors, *Lectures on Quasiconformal Mappings*, Chapter V (Beltrami equation).
- Y.-G. Oh, *Riemann–Hilbert problem and application to the perturbation theory of analytic
  discs*, Kyungpook Math. J. 35 (1995) (totally real boundary value problems).
