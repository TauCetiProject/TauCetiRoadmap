# Roadmap: modular forms of half-integral weight

**Summary.** A modular form of weight `k + 1/2` on `Γ₀(N)`, `4 ∣ N`, with character `χ`, is a
holomorphic function `f` on the upper half-plane with
`f(γz) = χ(d) j(γ, z)^{2k+1} f(z)` for every `γ = [[a, b], [c, d]] ∈ Γ₀(N)`, holomorphic at every
cusp, where `j(γ, z) = θ(γz)/θ(z)` is the automorphy factor of the classical theta function
`θ(z) = ∑_{n ∈ ℤ} e(n² z)`. This roadmap builds the holomorphic theory of these forms as the LMFDB
uses it: the spaces `M_{k+1/2}(N, χ)` and `S_{k+1/2}(N, χ)` with their nebentypus decomposition,
Shimura's Hecke operators `T(p²)` and the Shimura lift to weight `2k`, the Shimura decomposition of
`S_{k+1/2}(N, χ)` into the theta subspace and the components attached to integral-weight newforms,
the theta series of **odd-rank** positive definite lattices as forms of weight `n/2`, the `θ` and
`η` multiplier systems with eta quotients, the unary theta series with the Serre–Stark basis
theorem in weight `1/2`, Kohnen's plus space with its isomorphism to `S_{2k}(SL₂(ℤ))`, the
Kohnen–Zagier and Waldspurger formulas and the Shintani lift (stated), and Eichler–Zagier's Jacobi
forms with the theta decomposition and `J_{k,1} ≅ M⁺_{k−1/2}(Γ₀(4))`. It serves the LMFDB sections
`mf.half_integral` (the table `halfmf_forms`: level, weight, character, dimension, Shimura
decomposition, theta subspace, newform components with their coefficient fields), `cmf` (the
Shimura correspondence, the plus space, eta quotients) and `lattice` (the theta series of a lattice
of odd rank, which the `lattice.theta` knowl sends to the Shimura lift).

**Carrier.** A single bundled type `HalfIntegralForm k Γ` for `Γ ≤ Γ₀(4)` a subgroup of
`SL(2, ℤ)`, mirroring Mathlib's `ModularForm Γ k`: a function `ℍ → ℂ`, holomorphic, satisfying the
transformation law in the *multiplied-out* form `f(γz) θ(z)^{2k+1} = θ(γz)^{2k+1} f(z)`, bounded at
every cusp. The multiplied-out law is the same condition as the law with `j`, because `θ` has no
zero on `ℍ`; it is stated this way so that the carrier mentions only Mathlib's `jacobiTheta`, while
the multiplier `j` itself, its nonvanishing seed and its square-root formula are consumed from
GeometryOfNumbersAndQuadraticArithmetic §4.3 (below). Characters enter as eigenspaces of diamond
operators on `HalfIntegralForm k (Γ₁(N))`, exactly as Tau Ceti's `modFormCharSpace` does in
integral weight, so the LMFDB's `M_{k/2}(N, χ)` is a `Submodule`, not a second bundled type.
Suggested home: `TauCeti/NumberTheory/ModularForms/HalfIntegral/` (carrier, `Basic`, `Hecke`,
`Shimura`, `ThetaSeries`, `Eta`, `UnaryTheta`, `Plus`, `Jacobi`, `LMFDB`).

**Size.** Eight layers (0–7), thirty-eight milestones. The two long proofs are Shimura's theorem (1.3) and
the Serre–Stark theorem (4.2); everything else is either a construction with its basic API, a
finite computation, or a theorem the LMFDB only needs stated, and said so.

## Prerequisites

- **Mathlib** at the pin: `UpperHalfPlane` with the `SL(2, ℤ)` action, `CongruenceSubgroup.Gamma0`,
  `Gamma1`, `Gamma`; `ModularForm`, `CuspForm`, `IsBoundedAtImInfty`, `IsZeroAtImInfty`,
  `qExpansion`; `jacobiTheta`, `jacobiTheta_S_smul`, `jacobiTheta₂`,
  `jacobiTheta₂_functional_equation`; `ModularForm.eta`, `eta_ne_zero`, `logDeriv_eta_eq_E2`;
  `DirichletCharacter`, `MulChar`, `jacobiSym`, `ZMod.χ₄`, `ZMod.χ₈`; `LSeries`; `Complex.cpow`.
- **Tau Ceti** at the pin: `TauCeti.NumberTheory.ModularForms.DiamondOperators` (`diamondOpHom`,
  `modFormCharSpace`, `cuspFormCharSpace`), `FiniteDimensional`, `Petersson.*`, `Newforms.*`,
  `HeckeSlash.*`, `LFunction.*`, `LevelOne.GradedRing`, `SturmBound`,
  `TauCeti.NumberTheory.HurwitzClassNumber`, `TauCeti.LinearAlgebra.IntegralLattice.*`.
- **Roadmaps on main**: the [modular-forms roadmap](../ModularForms/README.md) (Layers 0, 2, 3, 4,
  5, 7, 8, 8G, 10); the [theta-series roadmap](../ThetaSeries/README.md) (Layers 2, 3, 6, 7 and its
  *Kronecker symbol*); the [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)
  (Layer 3, Jordan splittings, for 2.1).
- **Roadmaps consumed in prose** and never redeclared in Lean:
  GeometryOfNumbersAndQuadraticArithmetic §4.3; MetaplecticAutomorphicForms Layer 2, 6.17, 6.18,
  6.20, 7.1, 7.10, 7.49; QSeriesPartitionsAndMockModularForms §§5.2, 6.1, 9.1.
- **Sibling drafts** named at the boundary: `SiegelModularForms` (consumer of Layer 6),
  `LatticePackingsAndPerfectForms`.

## Scope and ownership

### Owned here

- The carrier `HalfIntegralForm k Γ` of holomorphic forms of weight `k + 1/2`, `k : ℕ`, on a
  subgroup `Γ ≤ Γ₀(4)` of `SL(2, ℤ)`, with its basic API: linear structure, Fourier expansion at
  `∞` and at every cusp, the diamond operators and the nebentypus spaces `M_{k+1/2}(N, χ)`,
  `S_{k+1/2}(N, χ)`, the forced evenness of `χ`, multiplication by integral-weight forms and the
  injection `f ↦ fθ` into `M_{k+1}(N, χ χ₋₄^{k+1})`, finite-dimensionality, the Petersson product
  on `S_{k+1/2}(N, χ)`, and Cohen's basis `θ^{2k+1−4j} F^j` of `M_{k+1/2}(Γ₀(4))` (Layer 0).
- Shimura's Hecke operators `T(p²)` with their coefficient formula, the Shimura lift `Sh_t`, the
  theorems of Shimura and Niwa on its image, its Hecke equivariance, the Euler product, and the
  Shimura decomposition `S_{k+1/2}(N, χ) = S_0 ⊕ ⨁_F S_{k+1/2}(N, χ, F)` with the field of
  definition of each component (Layer 1).
- The theta series of an even positive definite lattice of **odd** rank as a form of weight `n/2`
  on `Γ₀(level L)` with character `(2 det L / ·)`, the coset series on `Γ(level L)`, and the
  reading of the LMFDB column `lat_lattices.theta_series` in odd rank (Layer 2).
- Automorphy factors of real weight, the `θ` multiplier system, Dedekind sums with their
  reciprocity law, the Dedekind-sum and Kronecker-symbol closed forms of the consumed `η`
  multiplier and its packaging as a multiplier system of weight `1/2`, and eta quotients of
  half-integral weight with their level, order at the cusps and character, as the
  `mf.half_integral_weight.*` knowls write `θ` and `η` (Layer 3).
- The unary theta series `θ_{ψ,t}` of weight `1/2` and `h_{ψ,t}` of weight `3/2` (the latter built
  on QSeriesPartitionsAndMockModularForms' unary theta characteristics), their Dirichlet-character
  modularity, the
  Serre–Stark basis theorem for `M_{1/2}(N, χ)` and `S_{1/2}(N, χ)`, and the theta subspace
  `S_0(N, χ) ⊂ S_{3/2}(N, χ)` of the Shimura decomposition (Layer 4).
- Kohnen's plus space `M⁺_{k+1/2}(Γ₀(4))` with the plus–minus decomposition, the operator `T⁺(4)`,
  Kohnen's Hecke isomorphism with `M_{2k}(SL₂(ℤ))`, Kohnen's level-`4N` plus space (stated), the
  Kohnen–Zagier formula and Waldspurger's theorem (stated), and the Shintani lift as the Petersson
  adjoint of the Shimura lift with Shintani's cycle-integral formula (stated) (Layer 5).
- The classical form of the Jacobi forms `J_{k,m}` of every index `m ≥ 1`
  (MetaplecticAutomorphicForms 6.18's carrier, compared with Eichler–Zagier's definition) with its
  Fourier-coefficient API, the half-integral-weight membership and laws of the components of
  MetaplecticAutomorphicForms 6.20's theta decomposition,
  `J_{k,1} ≅ M⁺_{k−1/2}(Γ₀(4)) ≅ M_{2k−2}(SL₂(ℤ))` as Hecke modules, the dimension formula, and the
  Skoruppa–Zagier correspondence for `J^{cusp}_{k,m}` (stated) (Layer 6).
- The LMFDB invariant layer for `halfmf_forms`, the intrinsic label prefix `(N, k, χ)`, and the
  coverage map (Layer 7).

### Consumed, not redefined

- From Mathlib: `jacobiTheta` and `jacobiTheta₂` with their functional equations (the odd-rank
  `S`-law of rank one, which the theta-series roadmap deliberately consumes only through its
  square, is consumed here directly, in 4.1); `ModularForm.eta` and `eta_ne_zero` (Mathlib has
  the function, QSeriesPartitionsAndMockModularForms §5.2 its multiplier, 3.3 the closed forms);
  `ModularForm`, `CuspForm` and `qExpansion` as the targets of every integral-weight statement;
  `jacobiSym`, `ZMod.χ₄`, `ZMod.χ₈`; `LSeries`.
- From Tau Ceti: `diamondOpHom`, `modFormCharSpace`, `cuspFormCharSpace` and
  `mem_modFormCharSpace_iff`, the pattern that 0.4 reproduces; the finite-dimensionality of
  `ModularForm Γ k` (0.3 reduces to it); the Petersson product on integral-weight cusp forms
  (`TauCeti.NumberTheory.ModularForms.Petersson.Basic`), whose adjoint theory 5.7 copies in shape;
  `HeckeRing.GL2.Newform` with its coefficient field and its Atkin–Lehner, Fricke and root-number
  data (1.5, 6.4); `hurwitzClassNumber` (Layer 4 examples); the integral-lattice library through
  the theta-series roadmap's bridge.
- From the [modular-forms roadmap](../ModularForms/README.md): *Layer 0* (`M_k(N, χ)`,
  `S_k(N, χ)`, the nebentypus law `mem_modFormCharSpace_iff_nebentypus`, the cusp–Eisenstein
  decomposition), *Layer 2* (the Hecke operators `T_n` on `M_{2k}(Γ₁(N))`, the target of 1.3's
  equivariance), *Layer 3* (Petersson adjoints), *Layer 4* (newforms, the `F` of 1.5), *Layer 7*
  (`L(s, f)`, its functional equation and root number `ε(f)`, used by 5.5–5.6 and 6.4), *Layer 8*
  and *8G* (`CoefficientField`, `CharacterField`, the `ℚ(χ)`-structure of a newspace, used by 1.5),
  and its worked example `η²⁴ = Δ` (the `SL₂(ℤ)` transformation of `η` as an integral-weight fact,
  from which QSeriesPartitionsAndMockModularForms §5.2 builds the multiplier 3.3 consumes).
- From the [theta-series roadmap](../ThetaSeries/README.md): its carrier (a full `ℤ`-lattice
  `L : Submodule ℤ E` in a real inner product space), `IsEven`, `IsIntegral`, `det`, `level`,
  `repNum`, `discGroup` (*Layer 2*); `thetaSeries`, `thetaCoset`, `thetaCoset_add_mem`,
  `hasSum_thetaSeries`, `thetaSeries_orthSum`, `thetaSeries_scale`, `thetaSeries_int` (*Layer 3*);
  `kroneckerSym` and `kroneckerChar` (*the Kronecker symbol*); `gaussSum`, `gaussSum_reciprocity`
  and `milgram` (*Layer 6*), and the even-rank Hecke–Schoeneberg theorem
  `thetaSeries_slash_of_mem_Gamma0`, `thetaCoset_slash_of_mem_Gamma`, `thetaFormOfLevel` with
  `thetaFormOfLevel_mem_modFormCharSpace` and `discChar` (*Layer 7*). Layer 2 below states the
  odd-rank theorem on the same `thetaSeries L` and proves it by dividing the even-rank theorem for
  `L ⊕ A₁` by `θ` and taking the square root of the one for `L ⊕ L`; no second theta series, no
  second Poisson summation and no second Gauss sum appear here.
- From GeometryOfNumbersAndQuadraticArithmetic §4.3 (*Half-integral cusp forms and the ternary
  specialization*, *Half-integral coefficient estimate*): the theta multiplier `j(γ, z) = θ(γz)/θ(z)`
  on `Γ₀(4)`, the nonvanishing of `θ`, the identification of `j` with Shimura's
  `ε_d^{−1} (c/d) (cz + d)^{1/2}`, the carrier `HalfIntegralCuspForm k N` of cusp forms with trivial
  character and its Petersson product, `thetaMultiplierPhase`, `halfIntegralKloosterman` and
  `halfIntegralCoefficientBound`. 0.1 records the three facts about `θ` as consumed statements;
  0.5 identifies `S_{k+1/2}(Γ₀(N), 1)` with `HalfIntegralCuspForm k N` as subspaces of functions on
  `ℍ`. Nothing here redefines `j`, reproves `θ ≠ 0`, or states a coefficient bound.
- From the [metaplectic groups, Weil representations and automorphic theta kernels roadmap](../MetaplecticAutomorphicForms/README.md):
  *Layer 2* (the metaplectic double cover) by citation only, as the object this roadmap avoids;
  *6.17–6.18* (the Jacobi group and `jacobiSpace`, whose holomorphic classical specialization at the
  Jacobi lattice `SL₂(ℤ) ⋉ ℤ²`, integral index `m ≥ 1`, weight `k` and trivial multiplier is the
  carrier `J_{k,m}` of 6.1); *6.20* (`jacobi_thetaDecomposition`, the theta decomposition with
  finitely many discriminant residues and unique components, read in 6.2); *7.1* (the unitary
  normalization `J(γ, z) = j(γ, z) |cz + d|^{−1/2}`, named in 3.2); *7.10* (the weight-`1/2` unitary
  `U`, `W`, `pr⁺`, named in 5.2 as the analogue of Kohnen's operators); *7.49* (the adelic–classical
  comparison, where a form of this roadmap meets a genuine automorphic form). Its weight-`1/2` Maass
  spaces, their plus subspace, Hecke eigenbasis and Shimura bijection of eigenlines (7.2–7.48) are
  spectral objects, not the holomorphic objects of Layers 1 and 5.
- From the [q-series, partition statistics and mock modular forms roadmap](../QSeriesPartitionsAndMockModularForms/README.md):
  *§5.2* (the eta multiplier `ν_η(γ) = η(γz)/((cz + d)^{1/2} η(z))` on `SL₂(ℤ)`, principal root,
  its independence of `z`, `ν_η(T) = e(1/24)`, `ν_η(S) = e(−1/8)`, the law
  `η(γz) = ν_η(γ)(cz + d)^{1/2} η(z)`, its square-root cocycle and the lifted character on the
  square-root cover; 3.3 proves its closed forms); *§6.1* (the unary theta characteristic
  `g(a, b; τ) = ∑_{ν ∈ a + ℤ} ν exp(πiν²τ + 2πiνb)` with its shift, `T`- and `S`-laws and its
  cuspidality at rational characteristics; 4.1 builds `h_{ψ,t}` from it); *§9.1* (the classical
  theta-component coordinates `θ_{m,μ}(τ, z) = ∑_{r ≡ μ (2m)} e(r²τ/(4m) + rz)`, their
  identification with `jacobiTheta₂` at rescaled arguments, their invariance under `μ ↦ μ + 2m`, and
  the uniqueness of the theta coefficients of a holomorphic elliptic function of index `m`; 6.2
  reads MetaplecticAutomorphicForms 6.20 in these coordinates).

### Not owned here

- Integral weight: the spaces `M_k(N, χ)`, Hecke operators, newforms, `L`-functions, Atkin–Lehner
  theory, dimension formulas, coefficient fields and Galois orbits are the
  [modular-forms roadmap](../ModularForms/README.md)'s. The target of the Shimura lift, the `F` of
  the Shimura decomposition and the `S_{2k}(SL₂(ℤ))` of Kohnen's isomorphism are its objects.
- Theta series of **even** rank, Poisson summation, Gauss sums of a lattice, the Kronecker symbol,
  `Θ_{E₈} = E₄` and the Leech identity: the [theta-series roadmap](../ThetaSeries/README.md).
  Lattice invariants (rank, determinant, level, genus, automorphisms, minimum, kissing number,
  density, perfection): the [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)
  and the sibling `LatticePackingsAndPerfectForms`. Layer 2 adds to a lattice exactly one new
  statement, the modularity of `Θ_L` in odd rank.
- The theta multiplier as a definition, the nonvanishing of `θ`, the trivial-character cusp carrier,
  the half-integral Kloosterman sums and the coefficient bounds of Iwaniec and Duke:
  GeometryOfNumbersAndQuadraticArithmetic §4.3.
- The metaplectic group `Mp₂`, the Weil representation of `SL₂(ℤ)` on `ℂ[A]` for a finite quadratic
  module, vector-valued modular forms, theta kernels and theta lifts as integrals, the Siegel–Weil
  formula, the weight-`1/2` spectral theory, and the Jacobi group, `jacobiSpace` and the theta
  decomposition of Jacobi forms in general: MetaplecticAutomorphicForms. 6.2 states the laws of the
  scalar components of that decomposition on `Γ(4m)` and does not build the Weil representation.
- The eta multiplier `ν_η` as a definition, with its `S`- and `T`-values and its cocycle, the unary
  theta characteristics `g(a, b)` with their transformation laws, and the theta-component
  coordinates `θ_{m,μ}`: QSeriesPartitionsAndMockModularForms §§5.2, 6.1, 9.1.
- Harmonic Maass forms of half-integral weight, mock theta functions, shadows and completed Lerch
  sums: QSeriesPartitionsAndMockModularForms (its Layers 5–9). Everything here is holomorphic.
- Siegel modular forms of degree two, the Fourier–Jacobi expansion of a Siegel form, the Maass lift
  and the Saito–Kurokawa theorem, the Gritsenko lift: the sibling `SiegelModularForms` (its Layer
  9), which consumes 6.1–6.4 by name: its 9.2 reads the carrier `J_{k,1}` in the classical form of
  6.1 and states on it the Jacobi Eisenstein series `E_{k,1}` and the operators `V_l`, and its Maass
  lift (9.3) and Saito–Kurokawa theorem (9.5) read MetaplecticAutomorphicForms 6.20's
  decomposition with the components of 6.2 and the isomorphisms of 6.3; it declares no Jacobi
  carrier of its own.
- Modular forms of half-integral weight on **noncongruence** groups, on `Γ₀(N)` with `4 ∤ N`
  (where no `θ`-multiplier exists and the theory needs `Mp₂`), and of weight `k + 1/2` with `k < 0`:
  not objects of any LMFDB section served here.
- Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists,
  and the completeness of database tables are not targets: the LMFDB label string of a
  `halfmf_forms` row, the ordering of the newform components on a page, the choice of basis of
  `S_{k+1/2}(N, χ, F)` whose `q`-expansions the `half_forms` column stores. Layer 7 states only
  the intrinsic prefix `(N, k, χ)` and the intrinsic invariants.

The theta-series roadmap records the boundary from its side (*Rank*: "half-integral weight is out of
scope, and a contributor should not attempt it here"; *Not owned here*: "Half-integral weight, as
above"); the integral quadratic forms and lattices roadmap lists "Half-integral weight modular forms,
hence the modularity of the theta series of a lattice of **odd** rank" among the things it does not
own; the sibling `SiegelModularForms` lists half-integral weight Siegel modular forms, the theta
multiplier, the Kohnen plus space and the Shimura lift under its *Not owned here*, and consumes from
here the classical form of the Jacobi carrier and three named isomorphisms.

## Pinned conventions

Decide these once; every one of them can be taken two ways in the literature, and the knowls take
some of them differently from the sources.

- **Weight.** Weights are `k + 1/2` with `k : ℕ`, so the weight-`1/2` theory is `k = 0`. The LMFDB
  writes the weight of a `halfmf_forms` row as `k/2` with `k` odd; its `k` is our `2k + 1`, its
  `λ = (k − 1)/2` is our `k`. Shimura's `κ` is the LMFDB's `k`.
- **The theta function.** `θ(z) = ∑_{n ∈ ℤ} e(n² z) = jacobiTheta (2z)`, `e(x) = exp(2πix)`, so
  `θ = 1 + 2q + 2q⁴ + 2q⁹ + ⋯` with `q = e(z)`. It is Shimura's `θ`, the knowl
  `mf.half_integral_weight.theta`'s `θ`, and the theta-series roadmap's `Θ_{√2ℤ}` (its
  `thetaSeries_int` at the scaled lattice). Mathlib's `jacobiTheta τ = ∑ exp(πi n² τ)` is `θ(τ/2)`.
- **The multiplier.** `j(γ, z) = θ(γz)/θ(z)` for `γ ∈ Γ₀(4)`, GeometryOfNumbersAndQuadraticArithmetic
  §4.3's object. Its explicit form is Shimura's (1.10): `j(γ, z) = ε_d^{−1} (c/d) (cz + d)^{1/2}`
  with `ε_d = 1` for `d ≡ 1 (mod 4)`, `ε_d = i` for `d ≡ 3 (mod 4)`, `(c/d)` the Kronecker symbol
  (`c` may be `0`, when `(0/±1) = 1`), and `(cz + d)^{1/2}` the principal branch
  (`−π/2 < arg ≤ π/2`). Its square is `j(γ, z)² = (−1/d)(cz + d) = χ₋₄(d)(cz + d)`
  (Shimura (1.11)). The only facts about `j` used below are: the cocycle law (automatic for a ratio),
  the square formula, `j(T, z) = 1` and `j(−I, z) = 1`.
- **The law, multiplied out.** `f ∈ M_{k+1/2}(Γ)` means `f(γz) θ(z)^{2k+1} = θ(γz)^{2k+1} f(z)` for
  all `γ ∈ Γ` and `z ∈ ℍ`. Since `θ(z) ≠ 0` this is `f(γz) = j(γ, z)^{2k+1} f(z)`. The character is
  **not** in the law: `M_{k+1/2}(N, χ)` is the `χ`-eigenspace of the diamond operators on
  `M_{k+1/2}(Γ₁(N))` (0.4), and the law `f(γz) = χ(d) j(γ, z)^{2k+1} f(z)` for `γ ∈ Γ₀(N)` is a
  theorem (0.4), exactly as in the modular-forms roadmap's Layer 0.
  Because `j(−I, z) = 1`, a nonzero form in `M_{k+1/2}(N, χ)` forces `χ(−1) = 1`: **every character
  of this roadmap is even**, and the spaces for odd `χ` are `0` (0.4), a fact the knowl
  `mf.half_integral_weight` leaves implicit.
- **Groups.** `Γ` is always a subgroup of `SL(2, ℤ)` contained in `Γ₀(4)`, carried as
  `Subgroup SL(2, ℤ)` with the hypothesis `Γ ≤ Gamma0 4`; `N` is always divisible by `4`, written
  `4 ∣ N` as a hypothesis and never built into the type. The LMFDB's `Γ₀(N)` with `χ` is
  `Gamma1 N` with the eigenspace.
- **Cusps.** *Holomorphic at the cusps* is **boundedness**: for every `A ∈ SL(2, ℤ)`, the function
  `z ↦ |f(Az)| · |cz + d|^{−(2k+1)/2}` is bounded as `Im z → ∞` (Mathlib's `IsBoundedAtImInfty`,
  applied to a real-valued function). This is branch-free, it is how Mathlib's `ModularForm` is
  defined, and 0.3 proves it equivalent to Shimura's condition that the expansion at every cusp has
  no negative exponents. *Cusp form* replaces boundedness by `IsZeroAtImInfty`.
- **`q`-expansions.** `q = e(z)`; `T ∈ Γ` for every group considered and `j(T, z) = 1`, so every form
  has period `1` and a Fourier expansion `f = ∑_{n ≥ 0} a(n) qⁿ` (`Mathlib`'s `qExpansion 1`). The
  Fourier coefficient of record is `a(n) = (qExpansion 1 f).coeff n`.
- **Hecke operators.** `T(p²)` on `M_{k+1/2}(N, χ)` is Shimura's `T^{N,χ}(p²)` normalized so that
  for `p ∤ N` (Shimura, Theorem 1.7)
  `b(n) = a(p²n) + χ(p) ((−1)^k n / p) p^{k−1} a(n) + χ(p²) p^{2k−1} a(n/p²)`,
  with `a(n/p²) = 0` if `p² ∤ n` and `((−1)^k n / p)` the Kronecker symbol (which is `0` for
  `p ∣ n`); for `p ∣ N` it is `b(n) = a(p²n)` (Shimura, Proposition 1.5 as used in the proof of
  Theorem 1.7). `T(n)` for `n` not a square is **not** defined (Shimura, Proposition 1.0: the
  double cosets of non-square determinant act by zero). Kohnen's plus-space operator `T⁺(4)` at
  `p = 2` is the formula above read with the Kronecker symbol `((−1)^k n / 2)` (5.3).
- **The Shimura lift.** For `t` squarefree, `Sh_t : S_{k+1/2}(N, χ) → M_{2k}(Γ₁(N/2))` is defined
  on `q`-expansions by `A_t(n) = ∑_{d ∣ n} χ_t(d) d^{k−1} a(t n²/d²)`, equivalently
  `∑ A_t(n) n^{−s} = L(s − k + 1, χ_t) ∑ a(tn²) n^{−s}`, with
  `χ_t(m) = χ(m) ((−1)^k t / m)` — Shimura's `χ_t` (Main Theorem), a character modulo `tN`.
  ⚠ The knowl `cmf.shimura_correspondence` writes `χ_t(m) = χ(m)(−1/m)(t/m)`, i.e. with
  `(−1/m)` in place of `((−1)^k / m)`; the two agree exactly when `k` (its `λ`) is odd. The
  convention of record is Shimura's, and 1.3 records the discrepancy. The level `N/2` is Niwa's
  theorem; Shimura's own level `N_t` divides `N` and equals `N/2` under his hypothesis.
- **Kohnen's plus space.**
  `M⁺_{k+1/2}(Γ₀(4)) = {f ∈ M_{k+1/2}(Γ₀(4)) : a(n) = 0 unless (−1)^k n ≡ 0, 1 (mod 4)}`, Kohnen's definition; the knowl `mf.half_integral_weight` names no plus
  space, the LMFDB `cmf` needs row does.
- **The Petersson product.** `⟨f, g⟩ = ∫_{Γ₀(N)\ℍ} f(z) \overline{g(z)} y^{k+1/2} dx dy / y²`, with
  no normalizing volume factor. The Kohnen–Zagier formula (5.5) is stated with this product on both
  sides; their paper's `⟨g, g⟩` carries the factor `1/6` relative to this one, and 5.5 says so.
- **Odd-rank lattices.** The carrier is the theta-series roadmap's `thetaSeries L`, exponent
  `π i ‖v‖² τ`, so for an even lattice `Θ_L = ∑_m r_L(2m) qᵐ`. For even `L` of odd rank `n = 2k + 1`
  the level `N = level L` is divisible by `4`, and the character is
  `χ_L^{odd}(d) = (2 det L / d)` (Kronecker symbol), a character modulo `N`; its square is
  trivial on `(ℤ/N)ˣ`. ⚠ This differs from the even-rank `χ_L(d) = ((−1)^k det L / d)` of that
  roadmap's 6F in the factor `2` and in the sign: both are forced by `θ = Θ_{√2ℤ}` having trivial
  character with respect to `j`, and 2.1 records the check.
- **Eta.** `η = ModularForm.eta`, `η(z) = q^{1/24} ∏_{n ≥ 1} (1 − qⁿ)`, `q^{1/24} = e(z/24)`. Its
  multiplier system `ν_η` is QSeriesPartitionsAndMockModularForms §5.2's,
  `η(γz) = ν_η(γ) (cz + d)^{1/2} η(z)` with `(cz + d)^{1/2}` principal; its two closed forms are
  both pinned: for `c > 0`,
  ```text
  ν_η(γ) = (d/c) e(((a + d)c − bd(c² − 1) − 3c)/24)                    if c is odd,
  ν_η(γ) = (c/d) e(((a + d)c − bd(c² − 1) + 3d − 3 − 3cd)/24)          if c is even,
  ```
  `(·/·)` the Kronecker symbol (Knopp's form of Rademacher's formula), and
  `η(γz) = e((a + d)/(24c) − s(d, c)/2) (−i(cz + d))^{1/2} η(z)` with `s(d, c)` the Dedekind sum
  (Apostol, Theorem 3.4; his `ε(a, b, c, d) = exp(πi((a + d)/(12c) − s(d, c)))`). Both agree with
  `η(z + 1) = e(1/24) η(z)` and `η(−1/z) = (−iz)^{1/2} η(z)`, and both were checked numerically
  on twenty matrices (worked examples). An **eta quotient** is `∏_{m ∣ N} η(mz)^{r_m}` with
  `r_m ∈ ℤ`, weight `(∑ r_m)/2`.
- **Jacobi forms.** `J_{k,m}` is MetaplecticAutomorphicForms 6.18's `jacobiSpace` at the Jacobi
  lattice `SL₂(ℤ) ⋉ ℤ²`, integral index `m ≥ 1`, weight `k` and trivial multiplier, holomorphic in
  `τ` with the cusp condition, written in the classical coordinates of 6.1, which proves that this
  is Eichler–Zagier's definition: `φ : ℍ × ℂ → ℂ` holomorphic with
  `φ((aτ + b)/(cτ + d), z/(cτ + d)) = (cτ + d)^k e(mcz²/(cτ + d)) φ(τ, z)` for `SL₂(ℤ)` (the
  exponential has the **positive** sign: for `θ_{1,0}(τ, z) = ∑ e(n²τ + 2nz)` at `S` it is
  Mathlib's `jacobiTheta₂_functional_equation`, `θ₂(z/τ, −1/τ) = (−iτ)^{1/2} e(z²/(2τ)) θ₂(z, τ)`) and
  `φ(τ, z + λτ + μ) = e(−m(λ²τ + 2λz)) φ(τ, z)` for `λ, μ ∈ ℤ`, with Fourier expansion
  `∑ c(n, r) e(nτ + rz)` over `4nm − r² ≥ 0`. This is the knowl `mf.jacobi`'s definition with
  `N = m`. Hecke operators on `J_{k,m}` are not objects here (6.3 states equivariance for the
  induced operators through the isomorphisms).
- **Characters.** A Dirichlet character is Mathlib's `DirichletCharacter ℂ N`; where Tau Ceti's
  `modFormCharSpace` wants the unit-homomorphism face, `MulChar.equivToUnitHom` converts, as the
  theta-series roadmap does. `χ₋₄ = (−1/·)` is `ZMod.χ₄` lifted, `(2/·) = ZMod.χ₈`, `(t/·)` is the
  theta-series roadmap's `kroneckerChar` of the discriminant of `ℚ(√t)` extended by zero to the
  level; `(a/d)` for odd `d > 0` is Mathlib's `jacobiSym a d`.
- **Stated theorems.** A milestone marked *stated* defines its objects completely and states the
  theorem with all hypotheses and the source's constants; its proof is not a target of this roadmap.
  The stated theorems are 5.4, 5.5, 5.6, 5.7 (the cycle-integral formula), 6.4 and the Eisenstein
  part of 4.5.

## What Mathlib supplies (consume)

- `UpperHalfPlane`, the `SL(2, ℤ)` action, `denom`, `im_smul_eq_div_normSq`, `ModularGroup.S`, `T`;
  `CongruenceSubgroup.Gamma0 N`, `Gamma1 N`, `Gamma N` as subgroups of `SL(2, ℤ)`.
- `ModularForm Γ k`, `CuspForm Γ k`, `SlashAction`, `slash_apply`, `IsBoundedAtImInfty`,
  `IsZeroAtImInfty`, `qExpansion`, `hasSum_qExpansion`, `ModularForm.mul`; `Cusps.lean`
  (`IsCusp`, `CuspOrbits`, `widthInfty`, `strictPeriods`) for 0.3.
- `jacobiTheta` (`JacobiTheta/OneVariable.lean`): `jacobiTheta_two_add`, `jacobiTheta_S_smul`
  (`jacobiTheta (S • τ) = (−Iτ)^{1/2} jacobiTheta τ`), `hasSum_nat_jacobiTheta`,
  `mdifferentiable_jacobiTheta`, `isBigO_at_im_infty_jacobiTheta_sub_one`; `jacobiTheta₂ z τ`
  with `jacobiTheta₂_functional_equation`, `jacobiTheta₂_add_left`, `jacobiTheta₂_add_right`
  (`TwoVariable.lean`). ⚠ `jacobiTheta τ = θ(τ/2)`: every use carries the substitution `τ = 2z`,
  and `jacobiTheta_S_smul` reads `θ(−1/(4z)) = (−2iz)^{1/2} θ(z)`, the `W₄`-law of 0.1 and 5.2.
- `ModularForm.eta` (`DedekindEta.lean`): `eta`, `eta_ne_zero`, `multipliableLocallyUniformlyOn_eta`,
  `differentiableAt_eta_of_mem_upperHalfPlaneSet`, `logDeriv_eta_eq_E2`. Mathlib has the function,
  its nonvanishing and its logarithmic derivative, no transformation law and no Dedekind sums.
- `DirichletCharacter ℂ N`, `changeLevel`, `conductor`, `primitiveCharacter`,
  `MulChar.equivToUnitHom`, `DirichletCharacter.Even`/`Odd`; `jacobiSym` with quadratic reciprocity,
  `ZMod.χ₄`, `ZMod.χ₈`; `LSeries`, `ArithmeticFunction` (1.2); `Complex.cpow`, `Real.rpow`.

## What Tau Ceti supplies (consume)

- `DiamondOperators`: `diamondOpHom`, `modFormCharSpace`, `cuspFormCharSpace`,
  `mem_modFormCharSpace_iff`, `eq_of_mem_cuspFormCharSpace_of_ne_zero`; 0.4 copies the construction
  onto the new carrier. `FiniteDimensional`: finite-dimensionality of `ModularForm 𝒢 k` for
  arithmetic `𝒢`; 0.3 pulls it back along `f ↦ fθ`.
- `Petersson.*` (shape for 0.5, 1.1, 5.7); `Newforms.*` (`HeckeRing.GL2.Newform`, coefficient fields,
  `a_p(F)`, Fricke and Atkin–Lehner eigenvalues, strong multiplicity one: the `F` of 1.4 and 6.4);
  `LFunction.*` (`L(s, F)`, functional equation, root number: 5.5, 5.6, 6.4);
  `LevelOne.GradedRing` (`dim M_{2k}(SL₂(ℤ))`: 5.3, 6.3); `SturmBound` (7.1, examples).
- `hurwitzClassNumber` (examples of Layers 2 and 4; `r₃(n) = 12(H(4n) − 2H(n))` is a check, not a
  target). `IntegralLattice.*` through the theta-series roadmap's bridge: `typeARootLattice`,
  `typeE₈RootLattice`, `checkerboardLattice` for `A₁`, `A₃`, `D₅`, `E₇`.
- Tau Ceti main has no half-integral-weight, metaplectic, eta-multiplier or Jacobi-form module
  beyond the pin; nothing post-pin is cited.

## What is missing (build here)

Every object of the summary except the consumed ones (the `η` multiplier, the unary theta
characteristics, the theta-component coordinates, the Jacobi carrier and its theta decomposition).
In Lean terms: the carrier `HalfIntegralForm`, its instances and `qExpansion`; the diamond operators
and `charSpace`; `thetaMulₗ` and the finite-dimensionality bridge; the cusp predicate and
`cuspSpace`; the Petersson product on `cuspSpace`; `heckeSq`; the Shimura lift `shimuraLift t`; the
theta subspace and the components `shimuraComponent F`; the odd-rank `oddDiscChar` and
`thetaFormOdd`; `AutomorphyFactor`, `dedekindSum`, `etaQuotient`; `unaryTheta`, `unaryThetaOdd`;
`plusSpace`, `plusProj`, `heckePlusFour`, `kohnenEquiv`; the reducible alias `JacobiForm` with its
comparison and `JacobiForm.indexOneEquiv`; and the LMFDB record of Layer 7. `Suggested.lean` states
only what can be stated over Mathlib and the pinned Tau Ceti: the carrier with its linear
structure, `q`-coefficients, cusp predicate and `cuspSpace`; `θ` as a form of weight `1/2` on
`Γ₀(4)`; the level-`4` dimensions of 0.6; `dedekindSum` with the reciprocity law and the closed
forms of the `η` transformation; `unaryTheta` and `unaryThetaOdd` with the modularity, Serre–Stark
and Theorem B statements in their `Γ₁(N)` form (summed over the characters modulo `N`); and
`plusSpace` with its dimension. The diamond operators and the nebentypus spaces, `thetaMulₗ`, the
Petersson product, `heckeSq`, the Shimura lift, Layer 2 (whose carrier is the theta-series
roadmap's), the character of a unary theta series, `heckePlusFour`, `kohnenEquiv` and Layers 6–7
are specified in this README only; each milestone whose declaration left `Suggested.lean` ends
with **Checks**.

## Layer 0: the carrier

Standing hypotheses: `k : ℕ`; `Γ ≤ Γ₀(4)` a subgroup of `SL(2, ℤ)`; `N` with `4 ∣ N`;
`θ(z) = jacobiTheta (2z)`.

### 0.1 The three facts about `θ`, consumed

Record, as consumed statements of GeometryOfNumbersAndQuadraticArithmetic §4.3 and not as targets:
(i) `θ(z) ≠ 0` for all `z ∈ ℍ`; (ii) `j(γ, z) = θ(γz)/θ(z)` for `γ ∈ Γ₀(4)` satisfies
`j(γ, z) = ε_d^{−1} (c/d) (cz + d)^{1/2}` (Shimura (1.10)); (iii) hence
`j(γ, z)² = χ₋₄(d)(cz + d)` (Shimura (1.11)). Derive here, from (ii) alone: `j(T, z) = 1`,
`j(−I, z) = 1`, `j(γ, z)^{2k+1} = χ₋₄(d)^k (cz + d)^k j(γ, z)`, and the cocycle law
`j(γδ, z) = j(γ, δz) j(δ, z)` (a ratio, so this one needs only (i)). Also record Mathlib's
`jacobiTheta_S_smul` in the form `θ(−1/(4z)) = (−2iz)^{1/2} θ(z)` (substitute `τ = 2z`), which is
the `W₄`-law used in 5.2 and 7.1 and is **not** a `Γ₀(4)` statement.

*Rests on:* Mathlib `jacobiTheta`, `jacobiTheta_S_smul`; GeometryOfNumbersAndQuadraticArithmetic
§4.3 (i)–(ii).

### 0.2 The carrier `HalfIntegralForm k Γ`

Define `HalfIntegralForm k Γ` as a structure with fields: `toFun : ℍ → ℂ`;
`holo : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) toFun`;
`law : ∀ γ ∈ Γ, ∀ z, toFun (γ • z) * θ z ^ (2k+1) = θ (γ • z) ^ (2k+1) * toFun z`;
`bdd : ∀ A : SL(2, ℤ), IsBoundedAtImInfty (fun z ↦ ‖toFun (A • z)‖ / ‖(A 1 0 : ℂ) z + A 1 1‖ ^ ((2k+1)/2 : ℝ))`. Give it `FunLike`, `ext`, and prove the law in `j`-form:
`toFun (γ • z) = j(γ, z)^{2k+1} toFun z` (using 0.1 (i)). Non-vacuity: the zero function, and
`θ ∈ HalfIntegralForm 0 (Γ₀(4))` — its law is `θ(γz) θ(z) = θ(γz) θ(z)`, its boundedness at the
cusps is the statement that `θ` is bounded at `∞`, `0` and `1/2` (from `hasSum_nat_jacobiTheta`
at `∞`, the `W₄`-law of 0.1 at `0`, and `θ(z + 1/2) = ∑ (−1)ⁿ qⁿ²` with the `W₄`-law at `1/2`).
Prove `θ^{2k+1} ∈ HalfIntegralForm k (Γ₀(4))` and more generally the products of 0.3.

*Rests on:* 0.1; Mathlib `UpperHalfPlane`, `IsBoundedAtImInfty`.

### 0.3 Basic API: linear structure, expansions, products, finite dimension

Prove: `HalfIntegralForm k Γ` is a `ℂ`-vector space under pointwise operations (the law and the
bound are linear); restriction along `Γ' ≤ Γ` (`ofLe`); for `f ∈ HalfIntegralForm k Γ` and
`g ∈ ModularForm (Γ.map (mapGL ℝ)) l`, the product `fg ∈ HalfIntegralForm (k+l) Γ`, and for
`f ∈ HalfIntegralForm k Γ`, `g ∈ HalfIntegralForm l Γ`, the product `fg` is an integral-weight form of
weight `k + l + 1` on `Γ` **up to the character** `χ₋₄(d)^{k+l+1}`: precisely,
`fg ∣[k+l+1] γ = χ₋₄(d_γ)^{k+l+1} fg` for `γ ∈ Γ` (from 0.1 (iii)). The case `g = θ` is the injection
`thetaMulₗ : HalfIntegralForm k Γ →ₗ[ℂ] ModularForm ((Γ ∩ Γ₁(4)).map (mapGL ℝ)) (k+1)` (on
`Γ ∩ Γ₁(4)` the character `χ₋₄(d)` is `1`), injective because `θ ≠ 0`; hence
**`HalfIntegralForm k Γ` is finite-dimensional**, by Tau Ceti's finite-dimensionality of the target
and `Module.Finite.of_injective`. Fourier expansion: `T ∈ Γ` and `j(T, z) = 1` give period `1`;
`qExpansion 1 f` has `HasSum (fun n ↦ a(n) qⁿ) (f z)`; define `coeff f n := (qExpansion 1 f).coeff n`
and prove the cusp condition at `∞` is `coeff f n = 0` for no `n` and boundedness. Expansions at
the other cusps: for `A ∈ SL(2, ℤ)` the function `g_A(z) := f(Az)(cz + d)^{−(2k+1)/2}` (principal
branch) is holomorphic on `ℍ` with `g_A(z + h) = e(κ_A) g_A(z)` for the width `h` of the cusp `A∞`
and a rational `0 ≤ κ_A < 1` fixed by the multiplier on the stabilizer; prove **boundedness of
`|g_A|` is equivalent to `g_A(z) = ∑_{n ≥ 0} b(n) e((n + κ_A) z/h)`** (a coefficient with
`n + κ_A < 0` is an integral that tends to `0`), and `IsZeroAtImInfty` to the same with `b(0) = 0`
when `κ_A = 0`. This equivalence is what makes the branch-free carrier agree with Shimura's §1 definition.

*Rests on:* 0.1, 0.2; Tau Ceti `FiniteDimensional`; Mathlib `qExpansion`, `Cusps.lean`
(`widthInfty`, `strictPeriods`).

**Checks.**

- `f ↦ fθ` sends `θ` to `θ² = 1 + 4q + 4q² + 4q⁴ + 8q⁵ + ⋯` (checked in Sage), a form of
  weight `1` on `Γ₁(4)`, in `M_1(4, χ₋₄)` by 0.4.
- Injectivity: `fθ = 0` forces `f = 0` because `θ` has no zero on `ℍ`; in weight `5/2` the basis
  `θ⁵ = 1 + ⋯`, `θF = q + ⋯` of 0.6 goes to `θ⁶`, `θ²F`, independent by their leading terms.
- Reject: on `Γ₀(4)` itself the product is a form only up to `χ₋₄(d)^{k+1}`; `θ²` is not in
  `M_1(Γ₀(4))` with trivial character, which is `0` because `−I` acts by `−1` in odd weight.
- Mathlib comparison: the target is Mathlib's `ModularForm` on `(Γ ∩ Γ₁(4)).map (mapGL ℝ)`, and
  `dim M_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ + 1` (0.6) is at most the dimension of that target.

### 0.4 Diamond operators and the nebentypus spaces

For `4 ∣ N` and `d ∈ (ℤ/N)ˣ`, slashing by any lift `γ_d ∈ Γ₀(N)` with lower-right entry `d`
(`f ↦ (z ↦ f(γ_d z) θ(z)^{2k+1}/θ(γ_d z)^{2k+1})`) is a well-defined linear endomorphism `⟨d⟩` of
`HalfIntegralForm k (Γ₁(N))`, independent of the lift because `Γ₁(N)` acts trivially (the law) and
`j` is a cocycle; package `diamondHom : (ℤ/N)ˣ →* Module.End ℂ (HalfIntegralForm k (Γ₁(N)))`.
Define `charSpace k N χ := ⨅ d, eigenspace (diamondHom d) (χ d)` for
`χ : DirichletCharacter ℂ N` (through `MulChar.equivToUnitHom`), written `M_{k+1/2}(N, χ)`. Prove
the nebentypus law `f ∈ M_{k+1/2}(N, χ) ↔ ∀ γ ∈ Γ₀(N), f(γz) = χ(d_γ) j(γ, z)^{2k+1} f(z)`; the
internal direct sum `HalfIntegralForm k (Γ₁(N)) = ⨁_χ M_{k+1/2}(N, χ)`; **`M_{k+1/2}(N, χ) = 0`
for odd `χ`** (apply the law to `γ = −I`, where `j(−I, z) = 1`); `θ ∈ M_{1/2}(4, 1)`; and that
`thetaMulₗ` carries `M_{k+1/2}(N, χ)` into Tau Ceti's `modFormCharSpace (k+1) (χ χ₋₄^{k+1})` at
level `N`. This is the LMFDB's `M_{k/2}(N, χ)` (knowl `mf.half_integral_weight`, with their `k`
our `2k + 1`).

*Rests on:* 0.2, 0.3; Tau Ceti `diamondOpHom`, `modFormCharSpace`; modular-forms roadmap Layer 0.

**Checks.**

- `θ ∈ M_{1/2}(4, 1)` and `θ³ ∈ M_{3/2}(4, 1)` (worked examples).
- At level `4` the lift `−I` of `d = −1` acts trivially (`j(−I, z) = 1`), so `⟨−1⟩` is the identity
  and `M_{k+1/2}(4, χ₋₄) = 0`: an odd character gives the zero space.
- `Θ_{A₃}` (2.2) lies in `M_{3/2}(8, (2/·))`: `⟨3⟩ Θ_{A₃} = −Θ_{A₃}` since `(2/3) = −1`, the law
  checked at `[[3,1],[8,3]]`; it is not in `M_{3/2}(8, 1)`.
- Tau Ceti comparison: `f ↦ fθ` carries `M_{k+1/2}(N, χ)` into `modFormCharSpace (k+1) (χ χ₋₄^{k+1})`;
  for `θ` this is `θ² ∈ M_1(4, χ₋₄)`.

### 0.5 Cusp forms, the trivial-character identification, the Petersson product

Define `IsCuspForm f := ∀ A : SL(2, ℤ), IsZeroAtImInfty (fun z ↦ ‖f(Az)‖/‖cz + d‖^{(2k+1)/2})`,
the submodule `cuspSpace k Γ`, and `S_{k+1/2}(N, χ) := cuspSpace ∩ charSpace`. Prove: cusp forms
are stable under `⟨d⟩`, under multiplication by integral-weight forms, and `thetaMulₗ` carries
`S_{k+1/2}(N, χ)` into `cuspFormCharSpace`; `coeff f 0 = 0` for a cusp form; `θ^{2k+1}` is never a
cusp form. **Identification:** for `χ = 1`, `S_{k+1/2}(N, 1)` equals, as a set of functions on `ℍ`,
GeometryOfNumbersAndQuadraticArithmetic §4.3's `HalfIntegralCuspForm (k + 1/2) N` (its law
`f(γτ) = j(γ, τ)^{2k+1} f(τ)` is the `j`-form of 0.2, and its vanishing at every cusp "after the
metaplectic lift" is the `IsZeroAtImInfty` condition by 0.3's equivalence). Define the Petersson
product on `S_{k+1/2}(N, χ)` by `⟨f, g⟩ = ∫_{Γ₀(N)\ℍ} f ḡ y^{k+1/2} dμ`, `dμ = dx dy/y²`: the
integrand is `Γ₀(N)`-invariant because `|j(γ, z)| = |cz + d|^{1/2}` and `|χ(d)| = 1`, and it
converges because cusp forms decay; prove it is a positive definite Hermitian form, and that on
`S_{k+1/2}(N, 1)` it is §4.3's product. Define the Eisenstein complement
`E_{k+1/2}(N, χ) := S_{k+1/2}(N, χ)^⊥` in `M_{k+1/2}(N, χ)` with respect to the product extended
to pairs with one cuspidal factor, and prove `M = S ⊕ E` with `dim E ≤ #cusps of Γ₀(N)`.

*Rests on:* 0.2–0.4; §4.3 of GeometryOfNumbersAndQuadraticArithmetic; Tau Ceti
`Petersson.Basic` (shape).

**Checks.**

- `θ` is not a cusp form (constant term `1`); `S_{1/2}`, `S_{3/2}`, `S_{5/2}` and `S_{7/2}` of
  `Γ₀(4)` are `0`, `dim S_{9/2}(Γ₀(4)) = 1` and `dim S_{13/2}(Γ₀(4)) = 2` (table of 0.6, worked
  examples).
- `η(24z) = ½ θ_{χ₁₂,1}` is a nonzero element of `S_{1/2}(576, (12/·))`, and `η(72z) = ½ θ_{χ₁₂,3}`
  one of `S_{1/2}(1728, 1)`.
- The Petersson product is positive on `δ ∈ S⁺_{13/2}(4)`; for `χ = 1` it is §4.3's product; the
  Kohnen–Zagier `⟨g, g⟩` of 5.5 is this product divided by `6`.

### 0.6 Level `4`: Cohen's basis and the dimensions

With `F(z) := ∑_{n odd} σ(n) qⁿ ∈ M_2(Γ₀(4))` (the modular-forms roadmap's Layer 0 Eisenstein series
with character at level `4`, the combination `(E₂(z) − 3E₂(2z) + 2E₂(4z))/(−24)`), prove **Cohen's
structure theorem**: `M_{k+1/2}(Γ₀(4), 1)` has basis `θ^{2k+1−4j} F^j`, `0 ≤ j ≤ ⌊k/2⌋`, hence
`dim M_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ + 1`. Route: these forms lie in the space by 0.3 and are
independent by their leading terms (`θ^{2k+1−4j}F^j = q^j + ⋯`); for the spanning statement, map
by `thetaMulₗ` into `M_{k+1}(Γ₀(4), χ₋₄^{k+1})`, whose dimension is the modular-forms roadmap's
Layer 10 formula (`⌊(k+1)/2⌋ + 1` for even `k+1`, `(k+1+1)/2` for odd `k+1`, both at level `4`),
and count the forms of that space divisible by `θ` through the order of `θ` at the cusp `1/2`
(`θ` vanishes there to order `1/4` in the local parameter `q`: with `A = [[1, 0], [2, 1]]`,
`θ(Az)(2z + 1)^{−1/2} = 2 η(4z)²/η(2z) = 2q^{1/4}(1 + q² + ⋯)`, from the `W₄`-law of 0.1 and
`θ(u + 1/2) = η(u)²/η(2u) = 1 − 2q_u + 2q_u⁴ − ⋯` at `u = −1/(4z)`; Ligozat's formula of 3.4 gives
the same `1/4`), or directly by the valence formula on `Γ₀(4)` applied to `f/θ^{2k+1} ∈ M_0`.
Deduce `dim S_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ − 1` for `k ≥ 2` and `0` for `k ≤ 1` (two Eisenstein
dimensions, at the cusps `∞` and `0`: the cusp `1/2` has `κ_{1/2} = (2k+1)/4 mod 1 ∈ {1/4, 3/4}`,
never `0`, so it is irregular for the multiplier for every `k` and carries no Eisenstein series;
the evaluation map `(f ↦ f(∞), f ↦ (W₄f)(∞))` is onto because `θ^{2k+1} ↦ (1, 1)` and
`θ^{2k−3}F ↦ (0, (W₄F)(∞)) = (0, 1/16)` with `W₄F = (E₂(z) − 6E₂(2z) + 8E₂(4z))/48`), `dim M_{1/2}(Γ₀(4)) = 1`
(so `M_{1/2}(Γ₀(4)) = ℂθ`, the level-`4` case of 4.2, proved here directly), and record the table
```text
k            : 0 1 2 3 4 5 6 7 8 9 10
dim M_{k+1/2}: 1 1 2 2 3 3 4 4 5 5 6
dim S_{k+1/2}: 0 0 0 0 1 1 2 2 3 3 4
```
These are the `Gamma0_4_half` dimensions of the LMFDB (Layer 7), with `k − 1/2` there our `k − 1`.

*Rests on:* 0.3–0.5; modular-forms roadmap Layers 0 and 10 (dimension of `M_{k+1}(Γ₀(4), χ)`),
or Layer 1 (valence formula).

## Layer 1: Hecke operators and the Shimura correspondence

Standing hypotheses: `4 ∣ N`, `χ` even modulo `N`, `f = ∑ a(n) qⁿ ∈ M_{k+1/2}(N, χ)`.

### 1.1 The operators `T(p²)`

Define `heckeSq p : M_{k+1/2}(N, χ) →ₗ[ℂ] M_{k+1/2}(N, χ)` for a prime `p` on `q`-expansions by
Shimura's formula (pinned conventions), and prove that it is Shimura's double-coset operator
`T^{N,χ}(p²)` (Shimura, Theorem 1.7, with the `p² + p` right coset representatives there, the
action on cusp conditions and the character twist in his (1.12)–(1.14)), so that it preserves
`M_{k+1/2}(N, χ)` and `S_{k+1/2}(N, χ)`. Prove `heckeSq p` commutes with `heckeSq q`
(Shimura, Proposition 1.6: the double cosets of square determinant generate a commutative ring),
and that for `p ∤ N` it is self-adjoint for the Petersson product up to the character
(`⟨T(p²) f, g⟩ = χ(p²) ⟨f, T(p²) g⟩`), so that `S_{k+1/2}(N, χ)` has a basis of simultaneous
eigenforms for all `T(p²)`, `p ∤ N` (Shimura, the paragraph after Proposition 1.6).

*Rests on:* 0.3–0.5; Shimura §1.

**Checks.**

- `T(9)δ = 252δ` and `T(25)δ = 4830δ` for `δ ∈ S⁺_{13/2}(4)` (worked examples).
- Weight `1/2`: `T(p²)θ = (1 + p^{−1})θ` for odd `p` (4.4 with `ψ = 1`, `t = 1`); at `n = 0` the
  formula gives `b(0) = 1 + p^{−1}`, since the Kronecker symbol `(0/p)` is `0`.
- For `p ∣ N` the operator is `a(n) ↦ a(p²n)`; `T(n)` for non-square `n` is not an operator.

### 1.2 Shimura's Euler product

Prove (Shimura, Theorem 1.9): if `f ∈ M_{k+1/2}(N, χ)` is an eigenform of every `T(p²)` with
`T(p²) f = ω_p f`, then for every squarefree `t ≥ 1` the formal Dirichlet series satisfies
```text
∑_{n ≥ 1} a(t n²) n^{−s} = a(t) ∏_p [1 − χ_t(p) p^{k−1−s}] / [1 − ω_p p^{−s} + χ(p)² p^{2k−1−2s}],
```
`χ_t(m) = χ(m)((−1)^k t / m)`, as an identity of formal Dirichlet series (Tau Ceti's
`ArithmeticFunction` ring; summability is not needed for the statement and is a separate theorem
from the coefficient bound of GeometryOfNumbersAndQuadraticArithmetic §4.3 when it is wanted).
Note the consequence that `a(t) = 0` for a squarefree `t` forces `a(tn²) = 0` for all `n`.

*Rests on:* 1.1.

### 1.3 The Shimura lift

Define `shimuraLift t : S_{k+1/2}(N, χ) →ₗ[ℂ] M_{2k}(Γ₁(N/2))` for `k ≥ 1` and squarefree `t` by
the `q`-expansion `A_t(n) = ∑_{d ∣ n} χ_t(d) d^{k−1} a(tn²/d²)` (so
`∑ A_t(n) n^{−s} = L(s − k + 1, χ_t) ∑ a(tn²) n^{−s}`), convergent on `ℍ` by the trivial bound `a(n) = O(n^{k/2+1/4})`
from `thetaMulₗ` and the integral-weight Hecke bound; that the series is a modular form is Niwa's
theorem below, and the hypothesis `k ≥ 1` is not removable (4.4). Prove:

- **Shimura's Main Theorem** (`k ≥ 1`, i.e. weight `≥ 3/2`): if `f` is an eigenform of `T(p²)` for
  every prime `p ∣ N` not dividing the conductor of `χ_t`, then `Sh_t(f) ∈ M_{2k}(N_t, χ²)` for a
  positive integer `N_t ∣ N` (described in Shimura's Proposition 3.7; `N_t = N/2` when `t` is odd
  and every prime of `N` divides the conductor of `χ_t`), and `Sh_t(f)` is a cusp form when
  `k ≥ 2`.
- **Niwa's theorem**: for every `f ∈ S_{k+1/2}(N, χ)` (no eigenform hypothesis) and `k ≥ 1`,
  `Sh_t(f) ∈ M_{2k}(N/2, χ²)` (Niwa, via the theta-kernel integral), cuspidal for `k ≥ 2`
  (Niwa, main theorem; the knowl `cmf.shimura_correspondence` states this form). The proof route
  of record is Niwa's classical theta-integral computation with the theta function of a ternary
  form; MetaplecticAutomorphicForms 7.49 is where that kernel becomes a theta lift in its sense.
- **Hecke equivariance**: `Sh_t ∘ T(p²) = T_p ∘ Sh_t` for `p ∤ N`, with `T_p` the modular-forms
  roadmap's Layer 2 operator on `M_{2k}(Γ₁(N/2))`; **independence of `t` on eigenforms**: for `f`
  an eigenform of all `T(p²)`, `Sh_t(f) = a(t) · Sh(f)` with `Sh(f) := ∑ A(n) qⁿ`,
  `∑ A(n) n^{−s} = ∏_p [1 − ω_p p^{−s} + χ(p)² p^{2k−1−2s}]^{−1}` (Shimura, Corollary to the Main
  Theorem), and `Sh(f)` is a normalized Hecke eigenform of `M_{2k}(N/2, χ²)` with `T_p`-eigenvalue
  `ω_p`.
- The **weight `3/2` exception** (`k = 1`): `Sh_t(f)` can be an Eisenstein series; 4.5 identifies
  when.
- The character discrepancy of the pinned conventions: the knowl's `χ_t` is Shimura's for odd `k`
  only; the lift of record uses Shimura's.

*Rests on:* 1.1, 1.2; modular-forms roadmap Layers 0, 2; Shimura §3, Niwa.

**Checks.**

- `Sh_1(δ) = Δ = q − 24q² + 252q³ − 1472q⁴ + 4830q⁵ − ⋯` (worked examples).
- The knowl's `χ_t` with `(−1/m)` fails on this example: `Sh_1(δ) = Δ` needs `χ_1 = 1` at `k = 6`,
  not `χ₋₄`.
- Reject `k = 0`: on `θ_{ψ,t}` the formula gives `A_t(n) = 2ψ(n)σ_{−1}(n)`, not a constant
  (`A_t(1) = 2`), so no modular form of weight `0` arises (4.4).

### 1.4 The Shimura decomposition

For `k ≥ 1` define the **theta subspace** `S_0(N, χ) ⊂ S_{k+1/2}(N, χ)` as the span of the unary
theta series `h_{ψ,t}` of 4.1 that lie in it when `k = 1`, and as `0` when `k ≥ 2`, and
`S_0'(N, χ) := S_0(N, χ)^⊥`. For a newform `F` (Tau Ceti's `Newform`) of weight `2k`, level
`M ∣ N/2` and character `χ²`, define
`S_{k+1/2}(N, χ, F) := {g ∈ S_0'(N, χ) : ∀ p ∤ N, T(p²) g = a_p(F) g}` (the knowl
`mf.half_integral_weight.shimura_decomposition`'s `S_{k/2}(N, χ, F)` with `λ_p(F) = a_p(F)`).
Prove the **Shimura decomposition** `S_0'(N, χ) = ⨁_F S_{k+1/2}(N, χ, F)`, `F` over the newforms
of weight `2k`, level dividing `N/2` and character `χ²`: the eigenbasis of 1.1 and the Shimura lift
of 1.3 send each eigenline to a Hecke eigenform of `M_{2k}(N/2, χ²)`, which is cuspidal by
Niwa for `k ≥ 2` and by the definition of `S_0'` for `k = 1` (4.5), hence (strong multiplicity one,
modular-forms roadmap Layer 5) determines a unique newform `F` of level dividing `N/2`; the
components are orthogonal. Record `dim S_0`, `dim S_0'` and `dim S_{k+1/2}(N, χ, F)` as the
LMFDB's `dimtheta`, `dimnew = dim − dimtheta` and `dim_image`. ⚠ `S_{k+1/2}(N, χ, F)` can have
dimension `> 1` and can be `0` (Waldspurger; 5.6): the decomposition is **not** a bijection with
newforms, and `dim_image` is a datum.

*Rests on:* 1.1, 1.3, 4.1, 4.5; modular-forms roadmap Layers 4, 5.

### 1.5 Fields of definition

Define the **field of definition** of a subspace `V ⊂ S_{k+1/2}(N, χ)` as the smallest subfield
`K ⊂ ℂ` such that `V` has a basis of forms with all `q`-coefficients in `K`. Prove that
`S_{k+1/2}(N, χ)` has field of definition contained in `ℚ(χ)` (through `thetaMulₗ` into
`M_{k+1}(N, χχ₋₄^{k+1})`, whose `ℚ(χ)`-structure is the modular-forms roadmap's Layer 8G, and the
fact that division by `θ`, which has integer coefficients, preserves `K`-rationality of expansions
of forms known to be divisible), that the `T(p²)` are defined over `ℚ(χ)` (their coefficient
formula), and hence that `S_{k+1/2}(N, χ, F)` has field of definition `ℚ(χ) · CoefficientField F`
(the eigenspace of operators defined over `ℚ(χ)` for eigenvalues in `K_F`). This is the LMFDB's
`nf_label` of a newpart entry: the number field containing the coefficients of the stored basis.

*Rests on:* 1.1, 1.4; modular-forms roadmap Layer 8, 8G.

## Layer 2: theta series of odd-rank lattices

Standing hypotheses: `L` an even lattice in the theta-series roadmap's carrier, of rank
`n = 2k + 1`, level `N = level L`, determinant `det L` (a positive integer).

### 2.1 Level and character in odd rank

Prove `4 ∣ level L` for an even lattice of odd rank. Route of record: over `ℤ₂` the lattice has a
Jordan splitting (the [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md),
Layer 3, 3A–3B) into `2^j`-scaled unimodular constituents; an even unimodular `ℤ₂`-lattice has even
rank, so an odd-rank even lattice has a constituent `2^j ⟨u⟩` of odd type with `j ≥ 1`, and
`N · Gram⁻¹` even integral forces `2^{j+1} ∣ N`. Also prove the elementary half, that `det L` and
`N` are even (the Gram matrix is alternating modulo `2` and of odd size, hence singular modulo `2`),
which needs no localization. Define
`oddDiscChar L : DirichletCharacter ℂ (level L)` as the Kronecker character `(2 det L / ·)` induced
to the level (the theta-series roadmap's `kroneckerChar` of the discriminant `8 det L` or
`2 det L`, whichever is `≡ 0, 1 (mod 4)`, made primitive and induced; its conductor divides `N`:
writing `2 det L = u v²` with `u` squarefree, the odd part of `u` divides `N` because it divides
`det L ∣ Nⁿ` and is squarefree, and `8 ∣ N` whenever `u` is even, because `v₂(det L)` even forces an
odd-type Jordan constituent `2^j⟨w⟩` with `j ≥ 2` in the splitting above), and prove `oddDiscChar L (d) = (2 det L / d)` for `d` coprime to `N`,
that it is even, and that `(oddDiscChar L)² = 1`. Check: `L = √2ℤ` (`A₁`) has `det = 2`, level `4`,
`(4/d) = 1`.

*Rests on:* theta-series roadmap Layers 2, 6 (`level`, `det`, `kroneckerChar`, 6F).

**Checks.**

- `A₁ = √2ℤ`: `det = 2`, level `4`, character `(4/·)`, trivial.
- `A₃`: `det = 4`, level `8`, character `(8/·) = (2/·)`, with value `−1` at `d = 3`; the even-rank
  sign `((−1)^k 2 det L / ·)` gives `+1` there and is rejected.
- `diag(2, 2, 6)`: `det = 24`, level `12`, character `(48/·) = (3/·)`, with value `−1` at `d = 5`.
- For every even lattice of odd rank, `det L` and `level L` are even.

### 2.2 Hecke–Schoeneberg in odd rank

Prove: `Θ_L ∈ M_{k+1/2}(level L, oddDiscChar L)`, i.e. the law
`Θ_L(γz) = (2 det L / d) j(γ, z)^{2k+1} Θ_L(z)` for `γ ∈ Γ₀(N)` and boundedness at every cusp.
Route of record, with no new analysis: (a) `L ⊕ A₁` is even of even rank `2(k+1)`, level `N`
(since `4 ∣ N`) and determinant `2 det L`, and `Θ_{L ⊕ A₁} = Θ_L · θ` (that roadmap's
`thetaSeries_orthSum` and `thetaSeries_int` at `√2ℤ`); its 7C gives
`Θ_L(γz) θ(γz) = ((−1)^{k+1} 2 det L / d)(cz + d)^{k+1} Θ_L(z) θ(z)`; dividing by `θ(γz)` (0.1 (i))
and writing `(cz + d)^{k+1} = χ₋₄(d)^{k+1} j(γ, z)^{2k+2}` (0.1 (iii)) gives
`Θ_L(γz) = ((−1)^{k+1} 2 det L / d)(−1/d)^{k+1} j^{2k+1} Θ_L(z) = (2 det L / d) j(γ, z)^{2k+1} Θ_L(z)`.
(b) `L ⊕ L` is even of even rank `2n` and level `N` with `Θ_{L⊕L} = Θ_L²`; its 7D gives boundedness
of `|Θ_L(Az)|² |cz + d|^{−n}` at every cusp, whose square root is the bound of 0.2. Bundle as
`thetaFormOdd L : HalfIntegralForm k (Γ₁(N))` with `thetaFormOdd L ∈ charSpace k N (oddDiscChar L)`,
prove `coeff (thetaFormOdd L) m = r_L(2m)` (that roadmap's `hasSum_thetaSeries`), in particular the
constant term `1`, so `Θ_L` is never a cusp form, and prove functoriality: isometry invariance and `Θ_{L ⊕ M} = Θ_L Θ_M` with the character of
the sum the product of the characters (odd ⊕ odd rank is even rank and the theta-series roadmap's
theorem; the two characters agree on `d` coprime to the level, a check forced by the laws).
Examples: `Θ_{√2ℤ^n} = θⁿ` with
trivial character; `Θ_{A₃} ∈ M_{3/2}(Γ₀(8), (2/·))`; `Θ_{D₅} ∈ M_{5/2}(Γ₀(8), (2/·))`;
`Θ_{E₇} ∈ M_{7/2}(Γ₀(4), 1)` (worked examples).

*Rests on:* 0.1–0.4, 2.1; theta-series roadmap Layers 3 and 7.

**Checks.**

- `Θ_{√2ℤ³} = θ³`, level `4`, trivial character, coefficients
  `r₃(n) = 1, 6, 12, 8, 6, 24, 24, 0, 12, 30, 24, 24, 8` for `n = 0, …, 12`.
- `Θ_{A₃} = 1 + 12q + 6q² + 24q³ + 12q⁴ + ⋯ ∈ M_{3/2}(Γ₀(8), (2/·))` and
  `Θ_{D₅} = 1 + 40q + 90q² + 240q³ + 200q⁴ + ⋯ ∈ M_{5/2}(Γ₀(8), (2/·))`.
- `Θ_{E₇} = θ⁷ + 112 θ³F ∈ M_{7/2}(Γ₀(4), 1)`, with `126` roots as its `q`-coefficient.
- `Θ_L` is never a cusp form: its constant term is `1`.

### 2.3 The coset series on `Γ(N)`

For `γ ∈ L^∨`, prove `θ_{γ+L} ∈ HalfIntegralForm k (Γ(N))` (trivial character on the principal
congruence subgroup): the law from that roadmap's 7E applied to the coset `(γ, 0) + (L ⊕ A₁)`,
`θ_{(γ,0)+(L⊕A₁)} = θ_{γ+L} · θ`, divided by `θ(Az)` with `χ₋₄(d) = 1` for `d ≡ 1 (mod N)`, `4 ∣ N`;
boundedness from the coset `(γ, γ) + (L ⊕ L)`. Prove the `q_N`-expansion inherited from that
roadmap's `hasSum_thetaCoset` and that `θ_{γ+L}` depends only on `γ + L` and satisfies
`θ_{−γ} = θ_γ`. These are the rank-one objects of which 4.1's unary theta series are linear
combinations, and the components of 6.2's theta decomposition when `L = √(2m)ℤ`.

*Rests on:* 0.2, 2.2; theta-series roadmap Layers 3 and 7 (7E).

**Checks.**

- For `γ ∈ L`, `θ_{γ+L} = Θ_L` (2.2); `θ_{−γ+L} = θ_{γ+L}`.
- For `L = √2ℤ`, `L^∨ = ℤ/√2` has the two cosets of `0` and `1/√2`, and
  `θ_{0+L} + θ_{1/√2+L} = Θ_{L^∨} = θ(z/4)`, where `θ_{0+L} = θ`.

### 2.4 The LMFDB lattice column in odd rank

The LMFDB `lat_lattices.theta_series` column stores the coefficients of `Θ_L(q²) = ∑_v q^{⟨v,v⟩}`,
i.e. `(r_L(m))_{m ≥ 0}` with `r_L(m) = 0` for odd `m` when `L` is even; the knowl `lattice.theta`
states that `Θ_L` is "a modular form of weight `n/2` and level `N`" and, for odd `n`, that the
Shimura lift produces a form of weight `n − 1`. State: for even `L` of odd rank, the first clause is
2.2 with the character `oddDiscChar L`; the second clause applies to the cuspidal projection of
`Θ_L` (`Θ_L` itself is not a cusp form, and 1.3 is stated on cusp forms), so the LMFDB sentence is
read as "`Sh_t` of the cuspidal part of `Θ_L` lies in `M_{n−1}(N/2, 1)`". For an **odd** (integral,
not even) lattice `L`, `Θ_L` has a `q^{1/2}`-expansion and is `Θ_{√2 L}(z/2)`; `√2 L` is even (that
roadmap's `isEven_scale_sqrt_of_even`), and the LMFDB stores `Θ_L(q²) = Θ_{√2L}(q)`: the
odd-lattice case is the even-lattice case for the scaled lattice, with its level that roadmap's
`level (√2 L)`. Rank, determinant, level, genus and the other
columns of the `lattice` section are the integral quadratic forms and lattices roadmap's and the
sibling `LatticePackingsAndPerfectForms`'s.

*Rests on:* 2.2, 1.3; theta-series roadmap Layer 2 (`scale`, `level`).

## Layer 3: multiplier systems; `θ`, `η` and eta quotients

### 3.1 Automorphy factors of real weight

Define `AutomorphyFactor Γ r` for `Γ ≤ SL(2, ℤ)` and `r : ℝ`: a function `J : Γ → ℍ → ℂ`,
holomorphic and nonvanishing in `z`, with the cocycle law `J(γδ, z) = J(γ, δz) J(δ, z)` and the
modulus `|J(γ, z)| = |cz + d|^r`. Prove: for a holomorphic nonvanishing `g : ℍ → ℂ` with
`|g(γz)| = |cz + d|^r |g(z)|` on `Γ`, the ratio `J_g(γ, z) := g(γz)/g(z)` is an automorphy factor of
weight `r` (`ofRatio`); the **multiplier system** `ν_J(γ) := J(γ, z)/(cz + d)^r` (principal branch)
is independent of `z` (it is holomorphic of modulus `1` on the connected `ℍ`, hence constant),
and satisfies Rankin's consistency relation `ν(γδ) = ν(γ)ν(δ) σ_r(γ, δ)` with the explicit
root-of-unity correction `σ_r(γ, δ) = (c_γ δz + d_γ)^r (cz + d)^r / (c_{γδ} z + d_{γδ})^r`
(trivial for `r ∈ ℤ`). Define `ModularFormWithFactor J` as the holomorphic
`f` with `f(γz) = J(γ, z) f(z)` and bounded at the cusps (the bound as in 0.2), and prove that for
`Γ ≤ Γ₀(4)` and `J = j^{2k+1}` this is `HalfIntegralForm k Γ` (same fields).

*Rests on:* 0.1, 0.2; Mathlib `Complex.cpow`.

### 3.2 The `θ` multiplier system

`j` of 0.1 is `ofRatio θ` of weight `1/2` on `Γ₀(4)`, with multiplier system
`ν_θ(γ) = ε_d^{−1} (c/d)` (Shimura (1.10)), a fourth root of unity, with `ν_θ(T) = 1` and
`ν_θ(−I) = −i`: indeed `j(−I, z) = 1 = ν_θ(−I)·(−1)^{1/2}` with the principal `(−1)^{1/2} = i`, and
Shimura's formula gives `ε_{−1}^{−1}(0/−1) = i^{−1} = −i`. Both faces are stated; the
multiplier-system face is the one 3.3 and 3.4 generalize. Record MetaplecticAutomorphicForms 7.1's
unitary face `J(γ, z) = j(γ, z) |cz + d|^{−1/2} = ν_θ(γ) (cz + d)^{1/2} |cz + d|^{−1/2}` as the
same system in the unitary normalization, and the modular-forms roadmap's remark that
`η(z)η(11z)` carries a non-Dirichlet multiplier as an instance of 3.1 (its multiplier system is
`ν_η(γ)ν_η(γ_{11})` with `γ_{11} = [[a, 11b], [c/11, d]]`, of weight `1`, not a character of
`Γ₀(11)`).

*Rests on:* 0.1, 3.1.

### 3.3 The `η` multiplier system

Consume from QSeriesPartitionsAndMockModularForms §5.2 the eta multiplier
`ν_η(γ) = η(γz)/((cz + d)^{1/2} η(z))` on `SL(2, ℤ)` (principal root), its independence of `z`,
`ν_η(T) = e(1/24)`, `ν_η(S) = e(−1/8)`, the law `η(γz) = ν_η(γ)(cz + d)^{1/2} η(z)` and its
square-root cocycle; none of these is redefined or reproved here.

Define `dedekindSum (h c : ℤ) : ℚ := ∑_{r=1}^{c−1} ((r/c))((hr/c))`, `((x)) = x − ⌊x⌋ − 1/2` for
`x ∉ ℤ` and `0` for `x ∈ ℤ`, with its API: `s(h + c, c) = s(h, c)`, `s(−h, c) = −s(h, c)`,
`s(h, 1) = 0`, and the **reciprocity law** `s(h, c) + s(c, h) = (h² + c² + 1)/(12hc) − 1/4` for
coprime `h, c > 0` (Apostol, Theorem 3.7; the proof of record is Apostol's, through the `η`
transformation, so this is a theorem *of* 3.3 and not an input). Prove **Apostol's closed form**
of the consumed multiplier: for `γ ∈ SL(2, ℤ)` with `c > 0`,
`η(γz) = e((a + d)/(24c) − s(d, c)/2) (−i(cz + d))^{1/2} η(z)` (Apostol, Theorem 3.4), with the
principal branch, i.e. `ν_η(γ) = e((a + d)/(24c) − s(d, c)/2 − 1/8)` since
`(−i(cz + d))^{1/2} = e(−1/8)(cz + d)^{1/2}` for `c > 0`; for `c < 0` apply the law to `−γ`.
Route: both sides satisfy the consumed cocycle and agree on `S` and `T`, and Dedekind's induction
on `c` through the generators, which is how Apostol proves Theorem 3.4 and the reciprocity law
together, gives the identity. Package `ν_η` as the multiplier system of `ofRatio η` of weight
`1/2` (3.1; the consumed law is the hypothesis `|η(γz)| = |cz + d|^{1/2} |η(z)|` of `ofRatio`),
prove `ν_η(γ)²⁴ = 1`, and prove the **closed form** (Rademacher–Knopp): for `c > 0`,
```text
ν_η(γ) = (d/c) e(((a + d)c − bd(c² − 1) − 3c)/24)                 (c odd),
ν_η(γ) = (c/d) e(((a + d)c − bd(c² − 1) + 3d − 3 − 3cd)/24)       (c even),
```
with `(·/·)` the Kronecker symbol, as an identity with the Dedekind-sum form (a finite computation
once both are known to be multiplier systems agreeing on `S` and `T`, since `SL(2, ℤ) = ⟨S, T⟩`).
Deduce that `ν_η^{2m}` is a character of `SL(2, ℤ)` of order `12/gcd(12, m)` (`ν_η²` generates
the character group `ℤ/12` of `SL(2, ℤ)`), so `η^{2m}` has trivial multiplier exactly when
`12 ∣ m` (at `m = 12` the modular-forms roadmap's worked example `η²⁴ = Δ`), the `N = 1` case of
the eta-quotient criterion of 3.4.

*Rests on:* 0.1, 3.1; QSeriesPartitionsAndMockModularForms §5.2; Mathlib `ModularForm.eta`,
`eta_ne_zero`.

### 3.4 Eta quotients of half-integral weight

Define `etaQuotient (r : ℕ →₀ ℤ) : ℍ → ℂ := ∏_m η(mz)^{r_m}` (finite support in the positive
integers), its weight `w(r) = (∑ r_m)/2`, and `N`-admissibility: `supp r ⊆ divisors N`. Prove it is
holomorphic and nonvanishing on `ℍ`, that its multiplier on `Γ₀(N)` is `∏_m ν_η(γ_m)^{r_m}` with
`γ_m = [[a, mb], [c/m, d]]` (3.3), and the **half-integral-weight eta-quotient theorem**: if
`∑ r_m = 2k + 1`, `∑_m m r_m ≡ 0 (mod 24)` and `∑_m (N/m) r_m ≡ 0 (mod 24)`, then
`∏ η(mz)^{r_m}` satisfies the law `f(γz) = (2s/d) j(γ, z)^{2k+1} f(z)` for `γ ∈ Γ₀(N)`, where
`s := ∏_m m^{r_m} ∈ ℚ_{>0}` and `(2s/d)` is the Kronecker symbol of the squarefree-free part
(write `2s = u v²` with `u` a squarefree-with-sign integer times a power of `2`, and read
`(2s/d) := (u/d)`; `d` is odd and coprime to `N`), together with the **order at the cusps**
(Ligozat): at the cusp `a/c` of `Γ₀(N)`, `c ∣ N`, the order in the local parameter is
`(N/24) ∑_m gcd(c, m)² r_m / (gcd(c, N/c) · c · m)`, so the quotient lies in `M_{k+1/2}(N, (2s/·))`
when every order is `≥ 0` and in `S_{k+1/2}(N, (2s/·))` when every order is `> 0`. ⚠ The
character `(2s/·)` is the half-integral-weight counterpart of the Gordon–Hughes–Newman character
`((−1)^w s/·)` for integral weight `w`; the factor `2` and the absent sign come from measuring the
multiplier against `j` rather than against `(cz + d)^w`, and the three LMFDB identities below
calibrate it: `θ(z) = η(2z)⁵/(η(z)² η(4z)²)` has `s = 2⁵/4² = 2`, `(4/d) = 1`, trivial character
and level `4` ✓; `η(8z)³` has `s = 512`, `(1024/d) = 1`, level `64`, weight `3/2`, trivial character;
`η(24z)` has `s = 24`, `(48/d) = (3/d)`, level `576`, weight `1/2`, character `(12/·)`. Prove the
two identities of the knowl `mf.half_integral_weight.theta`,
`θ(z) = η(2z)⁵/(η(z)²η(4z)²) = η((z+1)/2)²/η(z+1)`, as `q`-series identities (Gauss's product
`θ = ∏(1 − q^{2n})(1 + q^{2n−1})²`, from Jacobi's triple product), and `θ(z + 1/2) = η(z)²/η(2z)`.

*Rests on:* 3.3; Mathlib `eta`; Jacobi's triple product (Mathlib `jacobiTheta₂` product form if
present at the pin, otherwise a target here stated for `|q| < 1`).

## Layer 4: unary theta series; Serre–Stark in weight `1/2`; the theta subspace in weight `3/2`

Standing hypotheses: `ψ` a primitive Dirichlet character of conductor `r` (so
`ψ : DirichletCharacter ℂ r` with `ψ.conductor = r`), `t ≥ 1`.

### 4.1 The unary theta series and their modularity

Define `θ_{ψ,t}(z) := ∑_{n ∈ ℤ} ψ(n) e(t n² z)`, convergent and holomorphic, and, with
`g(a, b; τ) = ∑_{ν ∈ a + ℤ} ν exp(πiν²τ + 2πiνb)` the unary theta characteristic of
QSeriesPartitionsAndMockModularForms §6.1, `h_{ψ,t}(z) := r ∑_{a mod r} ψ(a) g(a/r, 0; 2r²t z)`
(independent of the representatives `a` by §6.1's shift law `g(a + 1, b) = g(a, b)`); prove the
series form `h_{ψ,t}(z) = ∑_{n ∈ ℤ} ψ(n) n e(t n² z)` (write `n = a + rj` and `ν = n/r`). These are
Shimura's `h(z; ψ, ν)` at `tz` with `ν = 0, 1` and Serre–Stark's `θ_{ψ,t}`; `θ_{ψ,t}` is used for
`ψ` even and `h_{ψ,t}` for `ψ` odd. Prove (Shimura, Proposition 2.2 and its Remark):
`θ_{ψ,t} ∈ M_{1/2}(4r²t, ψ χ_t)` and `h_{ψ,t} ∈ S_{3/2}(4r²t, ψ χ₋₄ χ_t)`, with `χ_t = (t/·)`, and
the `W`-law of Shimura's second display, `θ_{ψ,t}(−1/(4r²tz)) = (−2irtz)^{1/2}·(g(ψ)/r)·θ_{ψ̄,t}(z)`
up to the explicit root of unity recorded there, with `g(ψ)` the Gauss sum. Route for `θ_{ψ,t}`:
expand `ψ(n) = (1/g(ψ̄)) ∑_{a mod r} ψ̄(a) e(an/r)` for primitive `ψ`, so
`θ_{ψ,t}(z) = (1/g(ψ̄)) ∑_a ψ̄(a) jacobiTheta₂(a/r, 2tz)`; apply `jacobiTheta₂_functional_equation`
for `S`-type matrices and the coset splitting of 2.3 for general `γ ∈ Γ₀(4r²t)` (each
`∑_{n ≡ a (r)} e(tn²z)` is a coset series of the rank-one lattice `√(2t) r ℤ`, in `M_{1/2}(Γ(4r²t))`
by 2.3, and `Γ₀(4r²t)` permutes the cosets `a ↦ ad`, which is where `ψ(d)` comes from). Route for
`h_{ψ,t}`: §6.1 makes each `g(a/r, 0)` a cusp form of weight `3/2` on the stabilizer of its
characteristics, with explicit shift, `T`- and `S`-laws; after the rescaling `τ = 2r²tz`, `Γ₀(4r²t)`
permutes the characteristics `a/r` by `a ↦ ad` modulo the shift laws, which again produces `ψ(d)`,
and Shimura's Proposition 2.2 computes the remaining phase. Prove `θ_{ψ,t} = 0` for odd `ψ`
(termwise cancellation) and `h_{ψ,t} = 0` for even `ψ` (§6.1's `g(−a, −b) = −g(a, b)`). Examples:
`θ_{1,1} = θ`; `θ_{χ₁₂,1} = 2 η(24z)` (Euler); `h_{χ₋₄,1} = 2 η(8z)³` (Jacobi), both in Shimura's
Remark.

*Rests on:* 0.2–0.4, 2.3; QSeriesPartitionsAndMockModularForms §6.1; Mathlib
`jacobiTheta₂_functional_equation`; Shimura §2.

**Checks.**

- `θ_{1,1} = θ`, with trivial character at level `4`.
- `θ_{χ₁₂,1} = 2η(24z)` at level `4·12² = 576` with character `χ₁₂ = (12/·)` (`χ_1 = 1`), and
  `θ_{χ₁₂,3} = 2η(72z)` at level `1728` with character `χ₁₂ χ_3 = 1`.
- `h_{χ₋₄,1} = 2η(8z)³` at level `64` with character `χ₋₄ χ₋₄ χ_1 = 1`, not `χ₋₄`: the law holds at
  `γ = [[3, 2], [64, 43]]` with `d ≡ 3 (mod 4)`.
- `θ_{ψ,t} = 0` for odd `ψ` and `h_{ψ,t} = 0` for even `ψ`.

### 4.2 The Serre–Stark basis theorem

Prove (Serre–Stark, Theorem A): for `4 ∣ N` and `χ` even modulo `N`, the forms `θ_{ψ,t}` with
`ψ` primitive even of conductor `r`, `t ≥ 1`, `r² t ∣ N/4` and `χ = ψ χ_t` (as characters modulo
`N`) form a **basis** of `M_{1/2}(N, χ)`. In particular
`dim M_{1/2}(N, χ) = #{(ψ, t)}` so defined (`ψ` of any order: `θ_{ψ,1}` for the even cubic `ψ`
of conductor `7` spans `M_{1/2}(196, ψ)`, so `χ` need not be quadratic), **`M_{1/2}(Γ₀(4)) = ℂθ`**,
and `M_{1/2}(N, χ)` has a basis with coefficients in `ℚ(χ)` supported on the integers `tn²`. Route
of record: Serre–Stark §§3–7 — the Hecke operators `T(p²)` of 1.1 at weight `1/2`, the lemma that an
eigenform of weight `1/2` has eigenvalues of the form `ω_p = ψ(p)(1 + p^{−1})` for a character `ψ`
(Serre–Stark §§4–6), after which 1.2 at `k = 0` reads `∑_n a(tn²) n^{−s} = a(t) L(s, ψ)`, i.e.
`a(tn²) = a(t) ψ(n)`, so the coefficients are determined by the finitely many `a(t)`, `t ∣ N/4`,
and the identification of the resulting eigenfunctions with the `θ_{ψ,t}`. The Shimura lift of 1.3
is not available at `k = 0` (4.4); 4.2 uses only 1.1 and 1.2 there. This is the longest proof of
the roadmap after 1.3.

*Rests on:* 1.1–1.2 (at `k = 0`), 4.1; Serre–Stark.

### 4.3 Cusp forms of weight `1/2`

Prove (Serre–Stark, Theorem B): `S_{1/2}(N, χ)` has basis the `θ_{ψ,t}` of 4.2 with `ψ` **not
totally even**, where `ψ = ∏_p ψ_p` is totally even if every `p`-component `ψ_p` is even. The
condition is on `ψ`, not on `χ`: `S_{1/2}(N, χ) = 0` whenever no pair `(ψ, t)` of 4.2 has `ψ` not
totally even, in particular **whenever `N/4` is squarefree** (then `r = 1` and `ψ = 1`), so
`S_{1/2}(Γ₀(4)) = S_{1/2}(Γ₀(8)) = 0`; but a trivial `χ` does not force vanishing:
`η(72z) = ∑ χ₁₂(n) q^{3n²} = ½ θ_{χ₁₂,3} ∈ S_{1/2}(1728, χ₁₂ χ_3) = S_{1/2}(1728, 1)` (worked
examples). The first cusp form of weight `1/2`, at the smallest level, is
`η(24z) = ½ θ_{χ₁₂,1} ∈ S_{1/2}(576, (12/·))` (`χ₁₂ = χ₋₃ χ₋₄`, both components odd, so not totally even; `12` is the
smallest conductor of an even character that is not totally even, and `4 · 12² = 576`). Boundary:
`θ = θ_{1,1}` is not a cusp form (trivial `ψ` is totally even).

*Rests on:* 4.2; Serre–Stark.

### 4.4 Weight `1/2` as the base of the Shimura correspondence

Prove, by the coefficient formula of 1.1 at `k = 0` (where
`b(n) = a(p²n) + χ(p)(n/p)p^{−1}a(n) + χ(p²)p^{−1}a(n/p²)`): for `p ∤ 4r²t`, `T(p²) θ_{ψ,t} = ψ(p)(1 + p^{−1}) θ_{ψ,t}` — the two cases
`p ∤ m` and `p ∣ m` of the coefficient `a(tm²) = 2ψ(m)` give the same value, and the coefficients
off the squares `tm²` stay zero. Hence every `θ_{ψ,t}` is a simultaneous eigenform. The lift of
1.3 does **not** extend to `k = 0`: its `q`-expansion formula applied to `θ_{ψ,t}` gives
`A_t(n) = 2 ∑_{d ∣ n} ψ(d) d^{−1} ψ(n/d) = 2 ψ(n) σ_{−1}(n)`, so `∑ A_t(n) qⁿ` is not constant
(`A_t(1) = 2`, `A_t(5) = 2ψ(5)·6/5`), while a holomorphic modular form of weight `0` on `Γ₁(N/2)`
is constant. This is why Shimura's Main Theorem and Niwa's theorem require `k ≥ 1`, why
`shimuraLift` carries the hypothesis `1 ≤ k`, and why 4.2 uses 1.1–1.2 at `k = 0` but not 1.3.

*Rests on:* 1.1, 1.3, 4.1.

### 4.5 The theta subspace `S_0(N, χ)` in weight `3/2`

Define `S_0(N, χ) ⊂ S_{3/2}(N, χ)` as the span of the `h_{ψ,t}` with `ψ` primitive odd of
conductor `r`, `r² t ∣ N/4` and `χ = ψ χ₋₄ χ_t` (as characters modulo `N`); prove these `h_{ψ,t}`
are linearly independent (distinct supports or distinct `ψ`-twists), so
`dim S_0(N, χ) = #{(ψ, t)}` — the LMFDB's `dimtheta`, with the list of `ψ` the `thetas` column
(the page prints `h(ψ)` for each). Prove `S_0(N, χ)` is `T(p²)`-stable with `T(p²) h_{ψ,t} = ψ(p)(1 + p) h_{ψ,t}` for `p ∤ N`
(the same two-case computation as 4.4 at `k = 1`, where `χ(p)(−tm²/p) = ψ(p)(t/p)²(−1/p)² = ψ(p)`), and **state** (Shimura's weight-`3/2`
remark made precise by Niwa and by Cipra's analysis of the kernel): the Shimura lift `Sh_t` sends
`h_{ψ,t}` to a weight-`2` **Eisenstein** series of `M_2(N/2, χ²)` (its `T_p`-eigenvalue `ψ(p)(1 + p)` is that
of the Eisenstein series `E_2^{ψ,ψ}` of the modular-forms roadmap's Layer 0, and no cusp form has it) and is injective on
`S_0'(N, χ) = S_0(N, χ)^⊥` with cuspidal image, which is the content of the knowl
`mf.half_integral_weight.shimura_decomposition` at `k = 3` and the reason 1.4 removes `S_0` first.
Example: `S_0(64, 1) ∋ h_{χ₋₄,1} = 2η(8z)³` (worked examples).

*Rests on:* 1.1, 1.3, 4.1.

## Layer 5: Kohnen's plus space; Kohnen–Zagier, Waldspurger, Shintani

Standing hypotheses: level `4`, trivial character, `k ≥ 1`.

### 5.1 The plus space

Define `plusSpace k := {f ∈ M_{k+1/2}(Γ₀(4)) : ∀ n, (−1)^k n ≢ 0, 1 (mod 4) → coeff f n = 0}`,
written `M⁺_{k+1/2}(4)`, and `S⁺_{k+1/2}(4) := plusSpace ∩ cuspSpace`. Prove: it is a subspace
(intersection of coefficient kernels); `θ^{2k+1} ∉ M⁺` for `k ≥ 1` (its `q`-coefficient is
`2(2k+1) ≠ 0` and `(−1)^k · 1 ≡ 1` only for even `k`; for even `k` use `n = 2`, coefficient
`2(2k+1)(2k)`, with `2 ≢ 0, 1`); `M⁺_{3/2}(4) = 0` (0.6: `M_{3/2}(4) = ℂθ³`); the Cohen–Eisenstein
series `H_{k+1/2} := ζ(1 − 2k) + ∑_{N ≥ 1} H(k, N) q^N` (Cohen's generalized class numbers
`H(k, N) = L(1 − k, χ_{(−1)^k N})`-type values; for `k = 1` the nonholomorphic `H_{3/2}` is
**excluded**, see QSeriesPartitionsAndMockModularForms) lies in `M⁺_{k+1/2}(4)` for `k ≥ 2`, with
`120 H_{5/2} = 1 − 10q − 70q⁴ − 48q⁵ − 120q⁸ − 250q⁹ − ⋯` spanning `M⁺_{5/2}(4)` (worked
examples).

*Rests on:* 0.3–0.6.

### 5.2 The plus–minus decomposition and Kohnen's projection

Define on `M_{k+1/2}(Γ₀(4))` the operators `U₄ f := ∑_n a(4n) qⁿ` (equivalently
`(1/4)∑_{ν=0}^{3} f((z + ν)/4)`) and `(W₄ f)(z) := (−2iz)^{−(k+1/2)} f(−1/(4z))`, the power being
the principal one (`−2iz` has positive real part), normalized so that `W₄ θ = θ` by the `W₄`-law of
0.1. Prove `W₄` and `U₄` map `M_{k+1/2}(Γ₀(4))` to itself (`W₄` normalizes `Γ₀(4)`; the multiplier
computation is 0.1 (ii) conjugated by `W₄`), and **Kohnen's lemma** (Kohnen 1980, Proposition 2):
`W₄U₄` is diagonalizable on `M_{k+1/2}(Γ₀(4))` with exactly two eigenvalues `α_k` and `−α_k/2`,
the `α_k`-eigenspace (the one of larger absolute value) being `M⁺_{k+1/2}(4)`, where with the
normalizations above `α_k = (−1)^{⌊(k+1)/2⌋} 2^k` (so `α_2 = −4`: `W₄U₄(θ⁵ − 20θF) = −4(θ⁵ − 20θF)`
while `W₄U₄` has eigenvalue `2` on `M⁻_{5/2}`; checked on Cohen's basis for `k = 2, …, 8`, worked
examples). Put `P := α_k^{−1} W₄U₄` and `pr⁺ := (2/3)P + 1/3`. Then `pr⁺` is the **projection onto
`M⁺_{k+1/2}(4)`**, orthogonal for the Petersson product on cusp forms, and
`M⁻_{k+1/2}(4) := ker pr⁺` (the `−1/2`-eigenspace of `P`) gives `M_{k+1/2}(Γ₀(4)) = M⁺ ⊕ M⁻`.
MetaplecticAutomorphicForms 7.10 states the weight-`1/2` unitary analogue (`U`, `W`,
`pr⁺ = (2/3)WU + 1/3`, with a factor `√2` from `y^{1/4}`); the holomorphic operators here are not
those. The `cmf` needs row's "plus/minus spaces" are `M⁺` and `M⁻`.

*Rests on:* 0.1, 0.5, 5.1; Kohnen 1980.

### 5.3 Hecke operators on the plus space and Kohnen's isomorphism

Define `T⁺(4)` on `M⁺_{k+1/2}(4)` by the coefficient formula of the pinned conventions at `p = 2`
with the Kronecker symbol `((−1)^k n / 2)`, prove it preserves `M⁺` and commutes with the
`T(p²)`, `p` odd (which preserve `M⁺` because the support condition is a congruence condition
preserved by the three terms of the formula), and prove **Kohnen's theorem**: there is a
`ℂ`-linear isomorphism `kohnenEquiv : M⁺_{k+1/2}(4) ≃ₗ[ℂ] M_{2k}(SL₂(ℤ))` restricting to
`S⁺_{k+1/2}(4) ≃ S_{2k}(SL₂(ℤ))`, with `kohnenEquiv ∘ T(p²) = T_p ∘ kohnenEquiv` for odd `p` and
`kohnenEquiv ∘ T⁺(4) = T₂ ∘ kohnenEquiv`, carrying `H_{k+1/2}` to a multiple of `E_{2k}`; on a
normalized eigenform `f ∈ S_{2k}` the preimage `g` satisfies `Sh_t(g) = c(t) f` for every
squarefree `t` with `(−1)^k t ≡ 0, 1 (mod 4)` (the Shimura lift of 1.3 at `N = 4`, `N/2 = 2`,
descending to level `1` on the plus space — the descent is part of the theorem). In particular
**`dim M⁺_{k+1/2}(4) = dim M_{2k}(SL₂(ℤ))`** and `dim S⁺_{k+1/2}(4) = dim S_{2k}(SL₂(ℤ))`
(Tau Ceti's `mvPolynomialEquivModularForms` gives the right side; for `k = 1, …, 10` it is
`0, 1, 1, 1, 1, 2, 1, 2, 2, 2`, against the table of 0.6). Route of record: Kohnen 1980 (the explicit isomorphism
through `pr⁺`, the Shimura lift and the trace map; the Hecke equivariance at `2` is where `T⁺(4)`
enters). The eigenform `δ ∈ S⁺_{13/2}(4)` with `δ = q − 56q⁴ + 120q⁵ − 240q⁸ + 9q⁹ + ⋯` corresponds
to `Δ`: `T(9)δ = 252δ`, `T(25)δ = 4830δ`, `T⁺(4)δ = −24δ`, `Sh_1(δ) = Δ` (worked examples).

*Rests on:* 1.1, 1.3, 5.1, 5.2; Tau Ceti `LevelOne.GradedRing`; Kohnen 1980.

**Checks.**

- `T⁺(4)δ = −24δ`, checked at `n = 1, 4, 5`: `a(4) + 2⁵a(1) = −24`, `a(16) + 2¹¹a(1) = 1344`,
  `a(20) − 2⁵a(5) = −2880` (worked examples).
- `kohnenEquiv δ` is a multiple of `Δ`: `T(9)δ = 252δ` and `T(25)δ = 4830δ` match `τ(3) = 252` and
  `τ(5) = 4830`, and `T⁺(4)δ = −24δ` matches `τ(2) = −24`.
- `dim M⁺_{k+1/2}(4) = dim M_{2k}(SL₂(ℤ)) = 0, 1, 1, 1, 1, 2, 1, 2, 2, 2` for `k = 1, …, 10`;
  `M⁺_{5/2}(4) = ℂ(θ⁵ − 20θF)` goes to `ℂE₄`.

### 5.4 Kohnen's plus space at level `4N`, stated

For `N` odd and squarefree and trivial character, define `M⁺_{k+1/2}(4N)` by the same support
condition `(−1)^k n ≡ 0, 1 (mod 4)` inside `M_{k+1/2}(4N, 1)`, and the newspace
`S⁺_{k+1/2}(4N)^{new}` as the orthogonal complement of the images of the level-raising maps from
`4M`, `M ∣ N`, `M < N`. **State** (Kohnen 1982): `S⁺_{k+1/2}(4N)^{new} ≅ S_{2k}(Γ₀(N))^{new}` as
Hecke modules (for `T(p²)` against `T_p`, `p ∤ 2N`, and the operators at `p ∣ 2N`), with a
half-integral-weight newform theory (strong multiplicity one on the plus newspace). This is the
level-`4N` shape of the LMFDB's `newpart` for odd squarefree `N` and trivial character; the version
with a character modulo `N` is not stated here. The roadmap states 5.4 and does not prove it.

*Rests on:* 1.1, 1.4, 5.1; modular-forms roadmap Layer 4; Kohnen 1982.

### 5.5 The Kohnen–Zagier formula, stated

**State** (Kohnen–Zagier, Theorem 1): let `f ∈ S_{2k}(SL₂(ℤ))` be a normalized Hecke eigenform
and `g ∈ S⁺_{k+1/2}(4)` its preimage under 5.3, `g = ∑ c(n) qⁿ`; for every fundamental
discriminant `D` with `(−1)^k D > 0`,
```text
c(|D|)² / ⟨g, g⟩ = ((k − 1)! / π^k) · |D|^{k − 1/2} · L(f, D, k) / ⟨f, f⟩ ,
```
where `L(f, D, s) = ∑ (D/n) a_n(f) n^{−s}` is the twist of `L(s, f)` by `χ_D` (modular-forms roadmap
Layer 7), `⟨f, f⟩ = ∫_{SL₂(ℤ)\ℍ} |f|² y^{2k} dμ`, and `⟨g, g⟩` is the Petersson product of the
pinned conventions **divided by `6`** (Kohnen–Zagier normalize
`⟨g, g⟩ = (1/6)∫_{Γ₀(4)\ℍ} |g|² y^{k+1/2} dμ`, the `1/6` being `[SL₂(ℤ) : Γ₀(4)]^{−1}`). The normalization-free consequence
`c(|D|)²/c(|D'|)² = (|D|/|D'|)^{k−1/2} L(f, D, k)/L(f, D', k)` is the form checked in the worked
examples for `Δ` (`D = 5, 8, 12, 13, 17` against `D' = 1`). Both are stated; the proof is not a
target.

*Rests on:* 0.5, 5.3; modular-forms roadmap Layer 7; Kohnen–Zagier.

### 5.6 Waldspurger's theorem, stated

**State** (Waldspurger 1981, Corollaire 2, for trivial `χ`): let `g ∈ S_{k+1/2}(N, 1)` be an
eigenform of all `T(p²)`, `p ∤ N`, lying in the component `S_{k+1/2}(N, 1, F)` of 1.4, and let
`t, t'` be squarefree positive integers with `t/t' ∈ (ℚ_p^×)²` for every `p ∣ N`. Then
```text
a_g(t)² · t'^{k−1/2} · L(F ⊗ χ_{(−1)^k t'}, k) = a_g(t')² · t^{k−1/2} · L(F ⊗ χ_{(−1)^k t}, k) ,
```
`L(F ⊗ χ_D, s)` the twist of `L(s, F)` by the Kronecker character of `D` (modular-forms roadmap
Layer 7). So `a_g(t)²/(t^{k−1/2} L(F ⊗ χ_{(−1)^k t}, k))` depends on `t` only through its classes
in `ℚ_p^×/(ℚ_p^×)²`, `p ∣ N`, wherever the `L`-value is nonzero; and (Waldspurger's existence
statement) for each `F` and each such local class there is a level `N'` and an eigenform `g` in
some `S_{k+1/2}(N', χ', F)` with `a_g(t) ≠ 0` whenever `L(F ⊗ χ_{(−1)^k t}, k) ≠ 0`. This is why
`dim S_{k+1/2}(N, χ, F)` can exceed `1` and can vanish, and why the LMFDB stores `dim_image`. The
nontrivial-`χ` version carries an extra character factor and is stated in the source only; the
proof is MetaplecticAutomorphicForms' and GrossZagierAndArithmeticHeights' business.

*Rests on:* 1.4, 5.5; modular-forms roadmap Layer 7; Waldspurger.

### 5.7 The Shintani lift

Define `shintaniLift : S_{2k}(SL₂(ℤ)) → S⁺_{k+1/2}(4)` as the **Petersson adjoint** of
`Sh := kohnenEquiv⁻¹`-normalized Shimura lift of 5.3 (so `⟨Sh(g), f⟩ = ⟨g, Sh*(f)⟩` for all `g, f`;
this determines `Sh*` uniquely and makes it Hecke-equivariant and an isomorphism), and **state**
Shintani's theorem (Shintani 1975, in Kohnen's plus-space normalization): for `f ∈ S_{2k}(SL₂(ℤ))`
and `m ≥ 1` with `D := (−1)^k m > 0` a non-square, the `m`-th coefficient of `Sh*(f)` is
`c_k · ∑_{Q ∈ SL₂(ℤ)\𝒬_D} ∫_{C_Q} f(z) Q(z, 1)^{k−1} dz`, the sum over classes of integral binary
quadratic forms of discriminant `D`, `C_Q` the closed geodesic `Γ_Q\{Q(z,1)-root geodesic}` oriented
as in the source, and `c_k` the constant of the source (Shintani's theta-kernel normalization; the
constant is recorded with the statement and is not computed here). For `D` a square or `D < 0` the
source's formula has the corresponding degenerate cycles; the roadmap states only the non-square
`D > 0` case, which is the one the Kohnen–Zagier applications use. Stated; the adjoint definition
is the object.

*Rests on:* 0.5, 5.3; Shintani 1975, Kohnen 1985 (normalization).

## Layer 6: Jacobi forms

### 6.1 The carrier `JacobiForm k m`

`JacobiForm k m` (`k : ℕ`, `m ≥ 1`) is a reducible alias (`abbrev`) for the holomorphic classical
specialization of MetaplecticAutomorphicForms 6.18's `jacobiSpace`: the Jacobi lattice
`SL₂(ℤ) ⋉ ℤ²`, central index `m`, weight `k` and trivial multiplier, cut down by holomorphy in `τ`
and the cusp condition. Define its classical coordinate function
`JacobiForm.toFun : JacobiForm k m → ℍ → ℂ → ℂ` (evaluation along the orbit of the base point
`(i, 0)` of `ℍ × ℂ` under the real Jacobi group, with the weight-`k` automorphy factor and the
index-`m` phase removed) and prove the **comparison**: `toFun` is injective and linear, and a
function `φ : ℍ → ℂ → ℂ` is `toFun` of an element iff it is holomorphic in both variables, satisfies
the `SL₂(ℤ)` law and the lattice law of the pinned conventions (6.18's `jacobiSpace_weight` and
`jacobiSpace_elliptic` in these coordinates; the central character `ψ_m` of `jacobiSpace_central` is
the index `m`), and the Fourier condition
`∃ c : ℤ → ℤ → ℂ, (∀ n r, 4nm < r² → c n r = 0) ∧ ∀ τ z, HasSum (fun p : ℤ × ℤ ↦ c p.1 p.2 · e(p.1 τ + p.2 z)) (φ τ z)`,
which is Eichler–Zagier's definition. On the alias prove: the coefficients are unique and `c(n, r)`
depends only on `4nm − r²` and `r mod 2m` (Eichler–Zagier, Theorem 2.2);
`φ(τ, −z) = (−1)^k φ(τ, z)`, so `J_{k,1} = 0` for odd `k` (`c(n, −r) = (−1)^k c(n, r)` and `r mod 2`
is determined by `4n − r²`); the cusp subspace `J^{cusp}_{k,m}` (`c(n, r) = 0` when `4nm = r²`);
`φ(τ, 0) ∈ M_k(SL₂(ℤ))` and more generally the Taylor development in `z` (Eichler–Zagier §3, the
maps `D_ν : J_{k,m} → M_{k+ν}`). `JacobiForm k 1` is the carrier on which the sibling
`SiegelModularForms` 9.2–9.5 state the Jacobi Eisenstein series, `V_l` and the Maass lift.
Finite-dimensionality is 6.2's corollary.

*Rests on:* MetaplecticAutomorphicForms 6.17, 6.18; Mathlib `UpperHalfPlane`, `HasSum`;
Eichler–Zagier §§1–3.

### 6.2 The theta decomposition

Consume MetaplecticAutomorphicForms 6.20's `jacobi_thetaDecomposition` (positive index, finitely
many discriminant residues, unique theta components transforming through the finite Weil module),
read in the coordinates of QSeriesPartitionsAndMockModularForms §9.1: the theta components
`θ_{m,μ}(τ, z) = ∑_{r ≡ μ (2m)} e(r²τ/(4m) + rz)` for `μ ∈ ℤ/2m`, their identification with
Mathlib's `jacobiTheta₂` at rescaled arguments, their invariance under `μ ↦ μ + 2m`, and the
uniqueness of the theta coefficients of a holomorphic elliptic function of index `m`. So every
`φ ∈ J_{k,m}` is `φ(τ, z) = ∑_{μ mod 2m} h_μ(τ) θ_{m,μ}(τ, z)` with unique holomorphic `h_μ`.
Owned here is the half-integral-weight content of Eichler–Zagier's Theorem 5.1: the components are
`h_μ(τ) = ∑_{N ≡ −μ² (4m)} c(N, μ) e(Nτ/(4m))`, where `c(N, μ) := c(n, r)` for any `(n, r)` with
`4nm − r² = N`, `r ≡ μ` (well defined by 6.1); each `h_μ` lies in `HalfIntegralForm (k−1) (Γ(4m))`
(the law with `j^{2k−1}` on the principal congruence subgroup of level `4m`, since `Γ(4m)` acts
trivially on `ℤ/2m` and on the Gauss-sum phases); `h_{−μ} = (−1)^k h_μ` (from 6.1's
`φ(τ, −z) = (−1)^k φ(τ, z)` and `θ_{m,μ}(τ, −z) = θ_{m,−μ}(τ, z)`);
`h_μ(τ + 1) = e(−μ²/4m) h_μ(τ)`; and the `S`-law
`h_μ(−1/τ) = c_{k,m} τ^{1/2−k} ∑_ν e(μν/(2m)) h_ν(τ)` with `c_{k,m}` the product of `(2m)^{−1/2}`
and the eighth root of unity recorded in Eichler–Zagier's Theorem 5.1 (stating it exactly is part of
the target). These are the scalar form of 6.20's covariance under the (dual) Weil representation
of the discriminant form `ℤ/2m` with `q(μ) = −μ²/4m`. The components are the coset series of the
rank-one lattice `√(2m)ℤ` of 2.3 multiplied by the weight-`k` data: for `φ = θ_{m,·}` itself this
is the identity, which checks the convention. Deduce **finite-dimensionality of `J_{k,m}`**:
`φ ↦ (h_μ)_μ` is injective into `⨁_μ HalfIntegralForm (k−1) (Γ(4m))`, finite-dimensional by 0.3.
The Weil representation itself is MetaplecticAutomorphicForms' (its 4.7) and IntegralLattices'
(Layer 1G–1H); nothing here quantifies over it.

*Rests on:* 0.2, 0.3, 2.3, 6.1; MetaplecticAutomorphicForms 6.20;
QSeriesPartitionsAndMockModularForms §9.1; Eichler–Zagier §5.

### 6.3 `J_{k,1} ≅ M⁺_{k−1/2}(Γ₀(4)) ≅ M_{2k−2}(SL₂(ℤ))`

Prove (Eichler–Zagier, Theorem 5.4): for even `k ≥ 2`, `φ ↦ h₀(4τ) + h₁(4τ) = ∑_{N ≥ 0} c(N) q^N`
(with `c(N) := c(n, r)` for `4n − r² = N`) is a `ℂ`-linear isomorphism
`JacobiForm.indexOneEquiv : J_{k,1} ≃ₗ[ℂ] M⁺_{k−1/2}(Γ₀(4))` = `plusSpace (k − 1)` in the indexing of
5.1 (the support condition `N ≡ 0, 3 (mod 4)` is `(−1)^{k−1} N ≡ 0, 1 (mod 4)` for even `k`),
restricting to `J^{cusp}_{k,1} ≃ S⁺_{k−1/2}(4)`, and compatible with Hecke operators: the operator
`T_l` on `J_{k,1}` induced through the isomorphism from `T(l²)` on `M⁺` agrees with Eichler–Zagier's
`T_l` (their §4) — stated as the definition of the Hecke action on `J_{k,1}` here. Composing with
5.3 gives the **Hecke-equivariant isomorphism `J_{k,1} ≅ M_{2k−2}(SL₂(ℤ))`**,
`J^{cusp}_{k,1} ≅ S_{2k−2}(SL₂(ℤ))` (Eichler–Zagier, Theorem 5.4 with Kohnen's isomorphism), under
which `E_{k,1} ↦ E_{2k−2}` up to a scalar and a Jacobi eigenform corresponds to an eigenform with
the same `T_p`-eigenvalues — the input `SiegelModularForms` 9.5 consumes for the Saito–Kurokawa
Satake parameters. Prove the **dimension formula** (Eichler–Zagier, Theorem 9.2, even `k`):
`dim J_{k,m} = ∑_{j=0}^{m} (dim M_{k+2j}(SL₂(ℤ)) − ⌈j²/(4m)⌉)`, with `dim J_{k,1} = dim M_{2k−2}`
as the `m = 1` case (check: `dim J_{4,1} = dim J_{6,1} = dim J_{8,1} = 1`,
`dim J_{10,1} = dim J_{12,1} = 2`, the values `SiegelModularForms` 9.2 records). Example: `E_{4,1}` has
`c(0) = 1, c(3) = 56, c(4) = 126, c(7) = 576, c(8) = 756`, i.e. `c(1, r) = 1, 56, 126, 56, 1` for
`r = −2, …, 2` and `c(2, r) = 126, 576, 756, 576, 126`, and maps to the generator
`1 + 56q³ + 126q⁴ + 576q⁷ + 756q⁸ + ⋯` of `M⁺_{7/2}(4)` (worked examples).

*Rests on:* 5.1, 5.3, 6.1, 6.2; Tau Ceti `LevelOne.GradedRing`; Eichler–Zagier §§5, 9.

### 6.4 The Skoruppa–Zagier correspondence, stated

For `m ≥ 1` define `S^−_{2k−2}(m) ⊂ S_{2k−2}(Γ₀(m))` as the span of the forms `F(dz)`, `F` a
newform of weight `2k − 2` and level `m' ∣ m` with **root number `ε(F) = −1`** (the sign of the
functional equation of `L(s, F)`, modular-forms roadmap Layer 7), `d ∣ m/m'`. **State**
(Skoruppa–Zagier 1988, main theorem): there is a Hecke-equivariant isomorphism
`J^{cusp}_{k,m} ≅ S^−_{2k−2}(m)` for all `k, m ≥ 1` (`T_l` on the Jacobi side for `l` coprime to
`m`, the sibling's `V_l`-type operators excluded). Consistency: at `m = 1` and even `k`, every
level-one newform of weight `2k − 2 ≡ 2 (mod 4)` has `ε = (−1)^{k−1} = −1`, recovering 6.3 on cusp
forms; at `m = 1` and odd `k`, `ε = +1` for all of them and `J^{cusp}_{k,1} = 0`, consistent with
6.1; at `k = 2`, `J^{cusp}_{2,p} ≅ S^−_2(p)` is the space of weight-`2` newforms of level `p` with
odd analytic rank (Gross–Kohnen–Zagier), and `dim J^{cusp}_{2,277} = 10` is the value
`SiegelModularForms` 9.6 records. This is the "Skoruppa–Zagier correspondence" that roadmap's 9.6
consumes; `J^{cusp}_{k,N}` for `N > 1` is 6.1's.

*Rests on:* 6.1, 6.2; modular-forms roadmap Layers 4, 7; Skoruppa–Zagier.

## Layer 7: the LMFDB invariant layer

### 7.1 The `halfmf_forms` record

Define the record of a space `S_{k+1/2}(N, χ)` as the LMFDB stores it: `level N` (with `4 ∣ N`),
`weight 2k + 1` (the LMFDB's odd `k`), `character χ` (a Dirichlet character modulo `N`, Tau
Ceti's `conreyCharacter N n` for the Conrey label `N.n`; the label semantics are not a target), `dim = dim S_{k+1/2}(N, χ)` (0.3, 0.5),
`dimtheta = dim S_0(N, χ)` (4.5; `0` for `k ≥ 2`), `dimnew = dim S_0'(N, χ) = dim − dimtheta`
(1.4), `thetas` = the list of `ψ` with `h_{ψ,t} ∈ S_0(N, χ)` (4.5), and `newpart` = the list over
newforms `F` of weight `2k`, level `∣ N/2`, character `χ²` with `S_{k+1/2}(N, χ, F) ≠ 0` of
(`dim_image = dim S_{k+1/2}(N, χ, F)` (1.4), `mf_label = F` (its intrinsic data: level, weight,
character orbit, Hecke eigenvalues — the string is the modular-forms roadmap's Layer 9 prefix),
`nf_label` = the field of definition `ℚ(χ) · K_F` of 1.5, `half_forms` = a basis of
`S_{k+1/2}(N, χ, F)` with coefficients in that field — **the choice of basis is a convention and is not
a target**; what is intrinsic is the subspace and its field). Prove every
component is computable from a Sturm-type bound: `S_{k+1/2}(N, χ)` embeds by `thetaMulₗ` into
`S_{k+1}(N, χχ₋₄^{k+1})`, so two forms agreeing to the Sturm bound of weight `k + 1` at level `N`
(Tau Ceti's `sturm_bound_finiteIndex`) are equal.

*Rests on:* 0.3–0.5, 1.4, 1.5, 4.5; Tau Ceti `SturmBound`.

### 7.2 The intrinsic label prefix and the search invariants

The intrinsic prefix of a `halfmf_forms` row is `(N, 2k + 1, χ)`: the level, the LMFDB weight and
the character, in that order; the search page filters on `weight`, `level` and `character` (a
Conrey label `q.n`), and nothing else. Define `labelPrefix (N) (k) (χ)` as this triple and prove
it determines the space. Everything after the prefix (the Conrey numbering of `χ`, the order of
the `newpart` entries, the basis in `half_forms`) is an ordering or a stored list and is not a
target. For the `cmf` section, the Shimura-correspondence data a newform
page could display (which half-integral-weight spaces lift to it, with `dim_image`) is 1.4 read
from the `F` side, and the plus-space data (`Gamma0_4_half`: `dim M_{k−1/2}(Γ₀(4))` and
`dim M⁺_{k−1/2}(Γ₀(4))` for weights `k − 1/2`) is 0.6 and 5.3.

*Rests on:* 0.4, 0.6, 1.4, 5.3.

### 7.3 Coverage map

| LMFDB object or column | Milestone |
| --- | --- |
| `halfmf_forms.level`, `.weight`, `.character`, the space `S_{k/2}(N, χ)` | 0.4, 0.5 |
| `halfmf_forms.dim` | 0.3, 0.5, 7.1 |
| `halfmf_forms.dimtheta`, `.thetas`; knowl `shimura_decomposition`'s `S_0` | 4.5 |
| `dimnew`, `newpart.dim_image`, `newpart.mf_label`; `S_{k/2}(N, χ, F)` | 1.4 |
| `newpart.nf_label` | 1.5 |
| `newpart.half_forms` (the subspace; the basis is not a target) | 1.4, 7.1 |
| knowl `mf.half_integral_weight` (the definition, `j`, `M_{k/2}(N)`, `S_{k/2}(N)`) | 0.1, 0.2, 0.4, 0.5 |
| knowl `mf.half_integral_weight.theta` (`θ`, its product, the two eta identities) | 0.1, 3.4 |
| knowl `mf.half_integral_weight.dedekind_eta` (`η`, `Δ = η²⁴`) | 3.3 |
| knowl `cmf.eta_quotient` | 3.4 |
| knowl `cmf.shimura_correspondence` (`Sh_t`, `χ_t`, level `N/2`, cusp forms for `k ≥ 5`) | 1.3 |
| `cmf` needs row: plus/minus spaces | 5.1, 5.2 |
| knowl `lattice.theta` in odd rank; `lat_lattices.theta_series` for odd rank | 2.2, 2.4 |
| knowl `mf.jacobi` (`J_{k,N}`, `J^{cusp}_{k,N}`) | 6.1 |
| `smf` family `Gamma0_4_half` (`dim M_{k−1/2}(Γ₀(4))`, plus-space part) | 0.6, 5.3, 7.2 |
| `smf` 9.5 (Saito–Kurokawa input), 9.6 (Skoruppa–Zagier input) | 6.3, 6.4 |

*Rests on:* all of the above.

## Explicit scope exclusions

- The **metaplectic group**, the Weil representation of `Mp₂(ℤ)` or `SL₂(ℤ)` on `ℂ[A]`, vector-valued
  modular forms, theta kernels as integrals, theta lifts of automorphic forms, Siegel–Weil, and the
  adelic–classical dictionary: MetaplecticAutomorphicForms (its Layers 2, 4, 5, 6 and 7.49; 6.1–6.2
  here consume its Jacobi carrier and theta decomposition, 6.18 and 6.20, through their classical
  specialization). This roadmap never forms a double cover; every statement is about functions on
  `ℍ` (or `ℍ × ℂ`) and matrices in `SL(2, ℤ)`.
- **Weight-`1/2` Maass forms** and the spectral theory of the theta multiplier (`Δ_{1/2}`, `V_r`,
  the Maass plus space, Poincaré series, the Duke–Imamoḡlu–Tóth identities, the Shimura bijection
  of eigenlines): MetaplecticAutomorphicForms 7.2–7.48. **Harmonic Maass forms**, mock theta
  functions, shadows, the nonholomorphic `H_{3/2}`: QSeriesPartitionsAndMockModularForms.
- **Coefficient bounds** (Iwaniec, Duke), half-integral Kloosterman sums, Salié sums, equidistribution
  of lattice points on spheres: GeometryOfNumbersAndQuadraticArithmetic §4.3.
- **Half-integral weight on `Γ₀(N)` with `4 ∤ N`**, on noncongruence groups, in negative weight, or
  with a general multiplier system other than `χ · j^{2k+1}` (3.1 defines the general notion;
  spaces of forms for a general multiplier are not objects here beyond the `θ` and `η` cases).
- The **extension of the Shimura lift to non-cuspidal forms**, the lift of the Eisenstein part of
  `Θ_L`, and any Shimura lift in weight `1/2` (4.4: the `q`-expansion formula does not produce a
  modular form there).
- **Siegel modular forms**, the Fourier–Jacobi expansion, the Maass lift, the Saito–Kurokawa and
  Gritsenko lifts, paramodular forms: the sibling `SiegelModularForms`. **Hecke theory on
  `J_{k,m}` for `m > 1`** and Jacobi Eisenstein series of index `m > 1`: not objects here; 6.4 is
  stated against the integral-weight side.
- **Integral-weight eta quotients** and the Gordon–Hughes–Newman criterion as a theorem for all
  weights: the modular-forms roadmap's worked example (`η²⁴ = Δ`, `η(z)²η(11z)²`); 3.4 states the
  half-integral-weight criterion and recovers the three LMFDB identities.
- **Proofs** of 5.4 (Kohnen's level-`4N` theory), 5.5 (Kohnen–Zagier), 5.6 (Waldspurger), 5.7's
  cycle-integral formula (Shintani), 6.4 (Skoruppa–Zagier) and the Eisenstein identification in
  4.5: stated with their objects fully defined.
- **Labels, orderings, stored bases and the completeness of tables** are not targets.
- **Lattice invariants** other than `Θ_L` in odd rank: the integral quadratic forms and lattices
  roadmap and the sibling `LatticePackingsAndPerfectForms`.

## Worked examples (acceptance criteria)

Every number below was checked by computation (Sage `QuadraticForm.representation_number_list`,
`CuspForms(1,12)`, `Dokchitser`; exact `q`-series arithmetic in Python; direct numerical evaluation
of `θ` and `η` at points of `ℍ` for the multiplier formulas).

- **`θ`** (0.1, 0.2, 0.4, 3.2, 4.2): `θ = 1 + 2q + 2q⁴ + 2q⁹ + ⋯ ∈ M_{1/2}(Γ₀(4), 1)`, not a cusp
  form; `M_{1/2}(Γ₀(4)) = ℂθ`; `θ = η(2z)⁵/(η(z)²η(4z)²)` with `s = 2`, `(4/d) = 1`;
  `ν_θ([[1,0],[4,1]]) = ε_1^{−1}(4/1) = 1`, `ν_θ([[3,1],[8,3]]) = ε_3^{−1}(8/3) = −i·(−1) = i`,
  `ν_θ(−I) = −i`. Checked numerically on twelve matrices of `Γ₀(4)`:
  `θ(γz)/θ(z) = ε_d^{−1}(c/d)(cz+d)^{1/2}` to `10⁻⁷`.
- **`θ³ = Θ_{√2ℤ³}`** (2.2): weight `3/2`, level `4`, trivial character, coefficients
  `r₃(n) = 1, 6, 12, 8, 6, 24, 24, 0, 12, 30, 24, 24, 8` for `n = 0, …, 12`; `r₃(7) = 0`. Check
  against Tau Ceti's Hurwitz class numbers: `r₃(n) = 12(H(4n) − 2H(n))` holds for `n = 1, …, 12`
  (`H(3) = 1/3`, `H(4) = 1/2`, `H(12) = 4/3`); this identity is a check here, not a target.
  `θ³ ∉ M⁺_{3/2}(4)` (coefficient `6` at `n = 1 ≢ 0, 3 (mod 4)`), consistent with `M⁺_{3/2}(4) = 0`.
- **`Θ_{A₃}`** (2.1, 2.2): rank `3`, `det = 4`, level `8`, character `(8/·) = (2/·)`;
  `Θ_{A₃} = 1 + 12q + 6q² + 24q³ + 12q⁴ + 24q⁵ + 8q⁶ + 48q⁷ + ⋯ ∈ M_{3/2}(Γ₀(8), (2/·))`. The law
  `Θ(γz) = (2/d) j(γ,z)³ Θ(z)` was checked numerically for `γ = [[1,0],[8,1]]`, `[[−1,0],[8,−1]]`,
  `[[3,1],[8,3]]` (`(2/3) = −1`). **`Θ_{D₅}`**: rank `5`, `det = 4`, level `8`, character `(2/·)`,
  `1 + 40q + 90q² + 240q³ + 200q⁴ + ⋯`. **`Θ_{diag(2,2,6)}`**: level `12`, `det = 24`, character
  `(48/·) = (3/·)`, checked at `[[5,2],[12,5]]` (`(3/5) = −1`).
- **`Θ_{E₇}`** (2.2, 0.6): rank `7`, `det = 2`, level `4`, trivial character,
  `Θ_{E₇} = 1 + 126q + 756q² + 2072q³ + 4158q⁴ + 7560q⁵ + ⋯ = θ⁷ + 112 θ³F` in Cohen's basis
  of `M_{7/2}(Γ₀(4))`, where `F = q + 4q³ + 6q⁵ + 8q⁷ + ⋯`; `126` is the number of roots of `E₇`.
  Not in the plus space (`126 ≠ 0` at `n = 1 ≢ 0, 3 (mod 4)`).
- **Cohen's basis and the level-`4` dimensions** (0.6, 5.1, 5.3): the table of 0.6; `M_{5/2}(4)`
  has basis `θ⁵ = 1 + 10q + 40q² + 80q³ + 90q⁴ + ⋯`, `θF = q + 2q² + 4q³ + 8q⁴ + ⋯`, and
  `M⁺_{5/2}(4)` is spanned by `θ⁵ − 20θF = 1 − 10q − 70q⁴ − 48q⁵ − 120q⁸ − 250q⁹ + ⋯ = 120 H_{5/2}`
  (`H(2, 1) = −1/12`, `H(2, 4) = −7/12`, `H(2, 5) = −2/5`, `H(2, 8) = −1`, `H(2, 9) = −25/12`);
  `dim M⁺_{k+1/2}(4) = dim M_{2k}(SL₂(ℤ)) = 0, 1, 1, 1, 1, 2, 1, 2, 2, 2` for `k = 1, …, 10`.
  `M⁺_{7/2}(4)` is spanned by `1 + 56q³ + 126q⁴ + 576q⁷ + 756q⁸ + 1512q¹¹ + 2072q¹² + ⋯`.
- **`δ ∈ S⁺_{13/2}(4)` and `Δ`** (1.1, 1.3, 5.3, 5.5):
  `δ = q − 56q⁴ + 120q⁵ − 240q⁸ + 9q⁹ + 1440q¹² − 1320q¹³ − 704q¹⁶ − 240q¹⁷ + 960q²⁰ + 5040q²¹ − 12960q²⁴ + 1705q²⁵ + 13440q²⁸ − 3960q²⁹ + ⋯` (the unique normalized cusp form in the plus
  space; `dim S_{13/2}(4) = 2`, `dim S⁺_{13/2}(4) = 1`); `T(9)δ = 252δ`, `T(25)δ = 4830δ`,
  `T⁺(4)δ = −24δ` (checked at `n = 1, 4, 5`: `a(4) + 2⁵a(1) = −24`,
  `a(16) + 2¹¹a(1) = 1344 = −24·(−56)`, `a(20) − 2⁵a(5) = −2880`), and
  `Sh_1(δ) = q − 24q² + 252q³ − 1472q⁴ + 4830q⁵ − 6048q⁶ − 16744q⁷ + ⋯ = Δ`. Kohnen–Zagier in ratio form:
  `c(D)²/c(1)² = D^{11/2} L(Δ, D, 6)/L(Δ, 6)` holds for `D = 5` (`14400`), `8` (`57600`), `12` (`2073600`), `13`
  (`1742400`), `17` (`57600`), with the `L`-values computed to ten digits.
- **`η`** (3.3, 3.4, 4.3, 4.5): `η(z + 1) = e(1/24)η(z)`, `η(−1/z) = (−iz)^{1/2}η(z)`; the
  Dedekind-sum and Kronecker-symbol formulas for `ν_η` agree with `η(γz)/η(z)` to `10⁻⁷` on twenty
  matrices with `c > 0`, among them `[[−2,−1],[7,3]]`, `[[−3,−2],[8,5]]`, `[[5,2],[12,5]]`,
  `[[−2,−1],[9,4]]`.
  `η(24z) = q − q²⁵ − q⁴⁹ + q¹²¹ + q¹⁶⁹ − ⋯ = ∑_{n ≥ 1} χ₁₂(n) q^{n²} = ½θ_{χ₁₂,1} ∈ S_{1/2}(Γ₀(576), (12/·))`, level `4·12²·1 = 576`, `s = 24`, `(48/d) = (3/d)`;
  `η(8z)³ = q − 3q⁹ + 5q²⁵ − 7q⁴⁹ + ⋯ = ∑_{n ≥ 1} χ₋₄(n) n q^{n²} = ½h_{χ₋₄,1} ∈ S_0(64, 1) ⊂ S_{3/2}(Γ₀(64))`, level `4·4²·1 = 64`, character `χ₋₄·χ₋₄·(1/·) = 1`, `s = 512`, `(1024/d) = 1`.
  The half-integral eta-quotient character `(2s/·)` was checked numerically on these three and on
  fourteen further quotients of levels `8` and `12` (and the alternatives `(s/·)`, `(−2s/·)` fail
  on each); for `η(8z)³` the law `f(γz) = j(γ, z)³ f(z)` holds at `γ = [[3, 2], [64, 43]]`
  (`d ≡ 3 (mod 4)`), so the character is `1` and not `χ₋₄`.
  `η(72z) = q³ − q⁷⁵ − q¹⁴⁷ + ⋯ = ½ θ_{χ₁₂,3} ∈ S_{1/2}(1728, 1)` (`s = 72`, `(144/d) = 1`; `ψ = χ₁₂` not totally even): a
  weight-`1/2` cusp form with trivial character (4.3).
- **`W₄U₄` on Cohen's basis** (5.2): with `W₄θ = θ` and
  `W₄F = (E₂(z) − 6E₂(2z) + 8E₂(4z))/48 = 1/16 − q/2 + 3q²/2 − 2q³ + ⋯`, the matrix of `W₄U₄` on `(θ⁵, θF)` is `[[6, 1/2], [−80, −8]]`,
  eigenvalues `−4` (on `θ⁵ − 20θF ∈ M⁺`) and `2`; for `k = 2, …, 8` the plus-space eigenvalue is
  `α_k = −4, 8, 16, −32, −64, 128, 256 = (−1)^{⌊(k+1)/2⌋} 2^k` with multiplicity `dim M_{2k}(SL₂(ℤ))`
  and the other eigenvalue is `−α_k/2`.
- **Jacobi forms** (6.1, 6.3): `E_{4,1}` has `c(1, r) = 1, 56, 126, 56, 1` (`r = −2, …, 2`) and
  `c(2, r) = 126, 576, 756, 576, 126`, so `c(N) = 1, 56, 126, 576, 756` for `N = 0, 3, 4, 7, 8`,
  matching the generator of `M⁺_{7/2}(4)` above; `dim J_{4,1} = dim J_{6,1} = dim J_{8,1} = 1`,
  `dim J_{10,1} = dim J_{12,1} = 2`, `J_{k,1} = 0` for odd `k`, from the formula of 6.3.
- **Boundary and off-hypothesis checks.** An odd character gives the zero space:
  `M_{k+1/2}(4, χ₋₄) = 0` (0.4). `θ³ ∉ M⁺` and `θ^{2k+1} ∉ M⁺` for `k ≥ 1` (5.1). `θ_{ψ,t} = 0` for
  odd `ψ` and `h_{ψ,t} = 0` for even `ψ` (4.1). `η(z)η(11z)` is not in any `M_1(11, χ)`: its
  multiplier is `ν_η(γ)ν_η(γ₁₁)`, not a character (3.2). `T(n)` for non-square `n` is not an
  operator (pinned conventions). The odd-rank character `(2 det L/·)` with the sign of the even-rank
  formula, `((−1)^k 2 det L/·)`, fails on `A₃` at `d = 3`. The knowl's `χ_t` with `(−1/m)` fails for
  `Δ` at `k = 6`: `Sh_1(δ) = Δ` requires `χ_1 = 1`, not `χ₋₄` (1.3).

## Ordering

```text
Layer 0 (carrier, nebentypus, cusp forms, Cohen basis)
  ├── Layer 1 (Hecke, Shimura lift, decomposition, fields)      needs 4.1, 4.5 for 1.4 at k = 1
  ├── Layer 2 (odd-rank theta series)                            needs only Layer 0 and ThetaSeries
  ├── Layer 3 (multiplier systems, η, eta quotients)             needs only 0.1–0.2
  ├── Layer 4 (unary theta, Serre–Stark, theta subspace)         needs 1.1–1.3 at k = 0 and 2.3
  ├── Layer 5 (plus space, Kohnen, KZ, Waldspurger, Shintani)    needs 1.1–1.4
  └── Layer 6 (Jacobi forms)                                     needs 2.3, 5.1, 5.3
Layer 7 (LMFDB record)                                           needs 0, 1, 4.5, 5.3, 6.3
```

Layers 2 and 3 can proceed in parallel with Layer 1 as soon as Layer 0 exists; Layer 4 needs
Layer 1's operators at weight `1/2` and Layer 2's coset series; Layer 5 needs Layers 1 and 4.5's
theta subspace only for the level-`4N` statement 5.4; Layer 6 needs 2.3, 5.1 and 5.3. Outside this
roadmap, 3.3 rests on QSeriesPartitionsAndMockModularForms §5.2, 4.1 on its §6.1, and 6.1–6.2 on
MetaplecticAutomorphicForms 6.17, 6.18, 6.20 with QSeriesPartitionsAndMockModularForms §9.1. The
two long proofs, 1.3 (Shimura–Niwa) and 4.2 (Serre–Stark), are independent of each other except
that 4.2 uses 1.1–1.3 at `k = 0`.

## References

- Shimura, G. *On modular forms of half integral weight*, Ann. of Math. 97 (1973), 440–481.
  Notation 1 (the branch of `z^{1/2}`); (1.9)–(1.11) (`θ`, `j`, its formula and square);
  Proposition 1.0 (non-square determinants act by zero), Propositions 1.5–1.6 and Theorem 1.7
  (`T(p²)` and its coefficient formula); Theorem 1.9 (the Euler product); Proposition 2.2 and its
  Remark (unary theta series, `θ`, `η(24z)`); §3 Main Theorem, Corollary and Proposition 3.7
  (the lift, its level `N_t`).
- Niwa, S. *Modular forms of half integral weight and the integral of certain theta-functions*,
  Nagoya Math. J. 56 (1975), 147–161: the level `N/2` for every cusp form (1.3).
- Serre, J.-P., Stark, H. *Modular forms of weight 1/2*, in Modular Functions of One Variable VI,
  LNM 627 (1977), 27–67: Theorems A and B (4.2, 4.3).
- Kohnen, W. *Modular forms of half-integral weight on Γ₀(4)*, Math. Ann. 248 (1980), 249–266:
  the plus space, Proposition 2 (the operator `W₄U₄`), the Hecke isomorphism with
  `M_{2k}(SL₂(ℤ))` (5.1–5.3).
- Kohnen, W. *Newforms of half-integral weight*, J. reine angew. Math. 333 (1982), 32–72 (5.4).
- Kohnen, W. *Fourier coefficients of modular forms of half-integral weight*, Math. Ann. 271
  (1985), 237–268: the plus-space Shintani lift and its normalization (5.7).
- Kohnen, W., Zagier, D. *Values of L-series of modular forms at the center of the critical strip*,
  Invent. Math. 64 (1981), 175–198: Theorem 1 (5.5); the form `δ` and its coefficients.
- Waldspurger, J.-L. *Sur les coefficients de Fourier des formes modulaires de poids demi-entier*,
  J. Math. Pures Appl. 60 (1981), 375–484: Théorème 1, Corollaire 2 (5.6).
- Shintani, T. *On construction of holomorphic cusp forms of half integral weight*, Nagoya Math.
  J. 58 (1975), 83–126 (5.7).
- Eichler, M., Zagier, D. *The Theory of Jacobi Forms*, Progress in Math. 55, Birkhäuser 1985:
  §1 (definition), Theorem 2.2 (`c(n, r)` depends on `4nm − r²` and `r mod 2m`), §3 (Taylor
  development), Theorem 5.1 (theta decomposition), Theorem 5.4 (`J_{k,1} ≅ M⁺_{k−1/2}`), §4 (`T_l`),
  Theorem 9.2 (dimension formula).
- Skoruppa, N.-P., Zagier, D. *Jacobi forms and a certain space of modular forms*, Invent. Math.
  94 (1988), 113–146: the correspondence `J^{cusp}_{k,m} ≅ S^−_{2k−2}(m)` (6.4).
- Koblitz, N. *Introduction to Elliptic Curves and Modular Forms*, 2nd ed., GTM 97, Springer 1993:
  Chapter IV (half-integral weight: the multiplier, `M_{k/2}(Γ₀(4))` with Cohen's basis
  `θ^{k−4j}F^j`, Hecke operators, the Kohnen–Zagier example `δ`). Used for 0.6 and the examples.
- Apostol, T. *Modular Functions and Dirichlet Series in Number Theory*, 2nd ed., GTM 41, Springer
  1990: Theorem 3.4 (the `η` transformation with Dedekind sums), Theorem 3.7 (reciprocity for
  Dedekind sums) (3.3).
- Knopp, M. *Modular Functions in Analytic Number Theory*, Markham 1970: Chapter 4 (the
  Rademacher closed form of `ν_η`) (3.3).
- Ligozat, G. *Courbes modulaires de genre 1*, Bull. Soc. Math. France Mém. 43 (1975): the order of
  an eta quotient at the cusps of `Γ₀(N)` (3.4).
- Cohen, H. *Sums involving the values at negative integers of L-functions of quadratic characters*,
  Math. Ann. 217 (1975), 271–285: `H(k, N)` and `H_{k+1/2}` (5.1).
- Gross, B., Kohnen, W., Zagier, D. *Heegner points and derivatives of L-series II*, Math. Ann. 278
  (1987), 497–562: the weight-`2` case of 6.4 and the `ε = −1` convention.
- The knowls `mf.half_integral_weight`, `mf.half_integral_weight.theta`,
  `mf.half_integral_weight.dedekind_eta`, `mf.half_integral_weight.shimura_decomposition`,
  `cmf.shimura_correspondence`, `cmf.eta_quotient`, `mf.jacobi`, `lattice.theta`, and the column
  knowls of `halfmf_forms`.
