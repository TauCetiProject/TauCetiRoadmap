# Roadmap: periods of elliptic curves and modular parametrizations

An elliptic curve `E` over a number field `K` has, at each infinite place, a period lattice
`Λ_v ⊂ ℂ`, the lattice of periods of its invariant differential `ω = dx/(2y + a₁x + a₃)`. Four
families of invariants in a table of elliptic curves are built from these lattices, and this roadmap
owns them: the **local and global periods** `Ω_v(E)` and `Ω(E/K)` that enter the Birch and
Swinnerton-Dyer formula; the **analytic order of Ш**, the real number that formula defines once the
leading coefficient `L^{(r)}(E/K, 1)/r!` of the Hasse–Weil `L`-function is given; the invariants of
the **modular parametrization** `φ : X₀(N) → E` of a curve over `ℚ` — `X₀(N)`- and `Γ₁(N)`-optimality,
the modular degree and its relation to the Petersson norm and the congruence modulus, and the Manin
constant of the curve, built on the scalar `c` with `φ^*ω = c · 2πi f(τ) dτ` of the
[Gross–Zagier roadmap](../GrossZagierAndArithmeticHeights/README.md); and the **period-lattice form
of the Faltings height**, the curve of minimal height in an isogeny class (Stevens) and the Faltings
ratio.

The carrier is Mathlib's `WeierstrassCurve K` with `[W.IsElliptic]`, exactly as in the
[elliptic-curves roadmap](../EllipticCurves/README.md): there is no bundled elliptic-curve type, an
invariant of the curve is a function of the equation proved invariant under `VariableChange`, and
the points are `W.toAffine.Point`. The period lattice of a complex Weierstrass equation is a
`Submodule ℤ ℂ` with Mathlib's `DiscreteTopology` and `IsZLattice ℝ` instances, pinned by the
Eisenstein invariants `g₂, g₃` of Mathlib's `PeriodPair`; its covolume is Mathlib's
`ZLattice.covolume`. The Hasse–Weil `L`-series over `K` is Mathlib's `WeierstrassCurve.LSeries`.
Everything about modularity itself — the newform `f_E`, the quotient `A_f` of `J₀(N)`, the
parametrization `φ` and its degree — is consumed from the
[modularity roadmap](../EllipticCurveModularity/README.md) and the
[modular curves, part II roadmap](../ModularCurvesPartII/README.md); nothing of it is rebuilt here.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/Periods/` (the complex period lattice,
local and global periods), `TauCeti/AlgebraicGeometry/EllipticCurve/BSD/` (the `L`-series
estimates, the continuation hypothesis, the analytic order of Ш),
`TauCeti/AlgebraicGeometry/EllipticCurve/ModularParametrization/` (optimality, the modular degree,
the Manin constant, Stevens' curve) and `TauCeti/AlgebraicGeometry/EllipticCurve/FaltingsHeight/`
(the lattice formulas and the Faltings ratio).

## Prerequisites

- **Mathlib**: `WeierstrassCurve` with `IsElliptic`, `VariableChange`, `map`/`baseChange`, the
  invariants `b₂, …, c₄, c₆, Δ, j`; `PeriodPair`, `PeriodPair.lattice`, `PeriodPair.g₂`,
  `PeriodPair.g₃`, `PeriodPair.weierstrassP`; `IsZLattice`, `ZLattice.covolume`;
  `NumberField.InfinitePlace` with `embedding`, `IsReal`, `IsComplex`, `embedding_of_isReal`,
  `mult`; `Ideal.absNorm`, `Algebra.norm`, `NumberField.discr`; `WeierstrassCurve.LFunction`
  and `WeierstrassCurve.LSeries`; `LSeries`, `LSeriesSummable`, `analyticOrderAt`,
  `iteratedDeriv`, `AnalyticOnNhd`; `Height.logHeight`; `Submodule.torsion`, `Nat.card`,
  `AddSubgroup.relIndex`.
- **Tau Ceti at the pin**: the minimal-model library
  `TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.*` and `GlobalMinimalModel` (built to
  the elliptic-curves roadmap's Layers 4.5a–b); the canonical height and regulator
  `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic`,
  `MordellWeil.PointModTorsion`, `MordellWeil.Regulator`; Mordell–Weil
  `MordellWeil.FinitelyGenerated`; the Hasse bound `HasseBound`; isogenies and the pullback of the
  invariant differential `Isogeny.Basic`, `Isogeny.Differential`, `Isogeny.Hom.Differential`,
  `Affine.InvariantDifferential`; the Petersson pairing
  `TauCeti.NumberTheory.ModularForms.Petersson.Basic` and `Petersson.FiniteIndex`; modular symbols
  and the period map `TauCeti.NumberTheory.ModularForms.ModularSymbols.*`.
- **Roadmaps**: [EllipticCurves](../EllipticCurves/README.md) Layers 1, 2, 4, 4.5a–b, 6, 7;
  [ModularForms](../ModularForms/README.md) Layers 3, 4, 7, 8, 10B;
  [EllipticCurveModularity](../EllipticCurveModularity/README.md) R29.3–R29.6;
  [ModularCurvesPartII](../ModularCurvesPartII/README.md) §§1.1–1.4, 7.2, 7.5–7.6, 14.12, 16.2;
  [GrothendieckPeriodConjecture](../GrothendieckPeriodConjecture/README.md) Layers 0–2;
  [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md) §0.4 and §1.1;
  [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) §§3.5, 3.7–3.10,
  3.12; [PeriodsAndSpecialValues](../PeriodsAndSpecialValues/README.md) PS.1.1, PS.1.7, PS.1.8,
  PS.3.3;
  [ArakelovGeometryAndAbelianHeights](../ArakelovGeometryAndAbelianHeights/README.md) §§2.1–2.3,
  2.9, 3.1–3.4; [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md)
  Layers 1, 3, 5; [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md) for the
  discriminant and signature conventions; [EllipticIntegrals](../EllipticIntegrals/README.md)
  Milestone 8 is a consumer, not a supplier.

## Scope and ownership

The boundary in one sentence: an invariant of an elliptic curve over a number field that is
*computed from its period lattices* or *from the map `X₀(N) → E`*, together with the real number
the BSD formula defines, is here; the curve, its models, local data, Mordell–Weil group, heights
and Selmer/Sha groups are the elliptic-curves roadmap's; the modular side of the parametrization is
the modularity roadmap's; and a lattice in `ℂ` and the functions attached to it are the lattice
roadmaps'.

### Owned here

- The **period lattice** `Λ(W) ⊂ ℂ` of an elliptic Weierstrass equation over `ℂ`, as a function
  of the equation: its characterization by `g₂(Λ) = c₄/12`, `g₃(Λ) = c₆/216`, its scaling law
  under a change of variables, its behaviour under complex conjugation, and, for an equation over
  `ℝ`, its shape (rectangular or not according to the sign of `Δ`), its least positive real period
  and the number of real components (Layer 1).
- The **local periods** `Ω_v(E)` at the real and complex places of a number field `K`, the
  **global period** `Ω(E/K)` with its correction for the absence of a global minimal model, their
  invariance and their values on a global minimal model; over `ℚ`, the identification with the real
  period of the reduced minimal model, the **Néron lattice** `Λ_E`, and the lattice form of an
  isogeny, `α · Λ_E ⊆ Λ_{E'}` with index `deg ψ` (Layer 2).
- The **analytic side of BSD as a definition**: absolute convergence and nonvanishing of
  `L(E/K, s)` for `Re s > 3/2`, its identification with the finite Hasse–Weil `L`-function of
  `H¹(E)`, the pinned continuation hypothesis, the analytic rank and the
  leading coefficient as functions of a continuation and their independence of it, the two
  normalizations of the regulator, the **BSD quotient over `K`**, the **analytic order of Ш** as the
  real number `|D_K|^{1/2} L^{(r)}(E/K,1)/r! · #E(K)_tors² / (Reg_NT · Ω · ∏ c_𝔭)`, and the weak and
  strong BSD conjectures over `K` as statements (Layer 3).
- **Optimality and the invariants of `φ`** for `E/ℚ`: `X₀(N)`- and `Γ₁(N)`-optimality with their
  equivalent forms, the modular degree of every curve in an isogeny class, the **Manin constant of
  a curve** (`|c_φ|` for an optimal `φ`, extended along the least-degree isogeny to every curve of
  the class) with the lattice identity `Λ_E = c·Λ_f` and the covolume form
  `deg φ · covol Λ_E = 4π² c² ‖f‖²` of the Petersson–degree identity, the congruence modulus and
  its relation to the modular degree, the theorems of Mazur, Abbes–Ullmo, Raynaud, Česnavičius
  and ARS Theorem 2.7 on the curve invariant, the covolume certificate for `c = 1` and Manin's conjecture as a
  statement, **Stevens'
  theorem** on the minimal curve and his conjecture, and Cremona's optimal-first convention as an
  interface; with them the two bridges these need and no supplier states, the comparison of the
  cuspidal integral symbols of `Γ₀(N)` with `H₁(X₀(N), ℤ)` and the lattice `S₂(Γ₀(N), ℤ)` of
  integral cusp forms (Layer 4).
- The **lattice formulas for the Faltings height** of an elliptic curve: `h = −½ log covol Λ_min`
  over `ℚ`, the general-`K` formula through the local covolumes and the minimal discriminant, the
  stable height through the denominator of `j`, the change along an isogeny, and the **Faltings
  ratio** (Layer 5).

### Consumed, not redefined

- From [EllipticCurves](../EllipticCurves/README.md): the invariant differential and its pullback
  along isogenies (Layer 1; Tau Ceti `invariantDifferential`, `Isogeny.pullbackDifferential`,
  `Hom.pullbackDifferential_zsmul_id_invariantDifferential`); reduction types, the local index
  `c_𝔭 = [E(K_𝔭) : E₀(K_𝔭)]` and the algorithmic conductor (Layer 4; on Tau Ceti main the
  algorithm's output is `WeierstrassCurve.tateLocalIndex` in
  `TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/LocalIndex.lean` and the conductor ideal
  is `algorithmicConductor` in `TateAlgorithm/Reduction/Conductor.lean`); the minimal discriminant
  ideal, global and semi-global minimal models, the reduced minimal model over `ℚ` (Layers 4.5a–b;
  Tau Ceti `minimalDiscriminantIdeal`, `IsGlobalMinimal`, `reducedMinimalModel`); Mordell–Weil, the
  canonical height `canonicalHeight`, the Néron–Tate pairing and the regulator `regulator` with
  its rank-zero convention (Layer 6); the Shafarevich–Tate group and the BSD quotient and
  statement over `ℚ` (Layer 7). The real period over `ℝ` as an explicit integral is that
  roadmap's Layer 7 object, `WeierstrassCurve.realPeriod` in
  `TauCeti/AlgebraicGeometry/EllipticCurve/RealPeriod.lean` on Tau Ceti main; Layer 2 below
  identifies it with the lattice form and never redefines it.
- From [ModularCurvesPartII](../ModularCurvesPartII/README.md) §§1.1–1.4: the lattice Weierstrass
  model `W_L` of a `PeriodPair`, the pointed uniformization `ℂ/Λ ≅ E(ℂ)` with `ω ↦ dz`
  (`pointedEllipticUniformization`), the homothety and isogeny comparison, and the theorem that
  the period homomorphism of `ω` has image a full lattice `Λ_ω` (`invariantDifferentialsAndPeriods`).
  Layer 1 here defines `Λ(W)` through `g₂, g₃` and *proves* it equals `Λ_ω`; it does not
  reconstruct the uniformization. From the same roadmap, Layer 4 consumes the regular differential
  `ω_f = 2πi f dτ` of a weight-two cusp form (§7.2), the rational structure `V_ℚ` of `S₂(Γ₀(N))`
  with the first-coefficient Hecke pairing `β` (§§7.5–7.6), the comparison of the homological
  symbol module with `H₁(X₀(N), cusps; ℤ)` (§14.12) and the quotient `A_f` of `J₁(N)` (§16.2).
- From [GrothendieckPeriodConjecture](../GrothendieckPeriodConjecture/README.md) Layers 0–2: the
  scaling action on `PeriodPair` with `g₂_smul`, `g₃_smul`, lattice invariance `G_congr`, the
  discriminant `g₂³ − 27g₃² ≠ 0`, and the Eisenstein dictionary `g₂ = ω₁⁻⁴(4π⁴/3)E₄(τ)`,
  `g₃ = ω₁⁻⁶(8π⁶/27)E₆(τ)`.
- From [EllipticCurveModularity](../EllipticCurveModularity/README.md): the newform
  `F_E = newformOf E` and `IsNewformOf` (R29.3), the quotient `A_F^0` of `J₀(N)` and the quotient
  isogeny `QuotientIsogeny E F hF` (R29.5), the parametrization
  `modularParametrisation E λ : X₀(N_E) ⟶ E` with `modularParametrisation_cusp`,
  `modularParametrisation_nonconstant` and the scalar of `modularParametrisation_pullback`
  (R29.5), the quotient `A_F^1` of `J₁(N)`, and the Dirichlet-coefficient identity and entire
  continuation `exists_entire_completed_LSeries` with the functional equation (R29.6). Layer 4
  states its definitions against these names.
- From [ModularForms](../ModularForms/README.md): the Petersson pairing on `S₂(Γ₀(N))` over a
  `Γ₀(N)`-fundamental domain (Layer 3; Tau Ceti `peterssonInnerCosets`), newforms and the
  coefficient field (Layers 4, 8), `L(f, s)` and its entire extension (Layer 7), the homological
  symbol module `𝕄` and the period map (Layer 8; Tau Ceti `TauCeti.ModularSymbols.periodMap`).
- From [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md): the boundary
  map on symbols and the cuspidal subspace (§0.4), through which the period lattice `Λ_f` of 4.4 is
  the image of the cycles.
- From [ArakelovGeometryAndAbelianHeights](../ArakelovGeometryAndAbelianHeights/README.md): the
  Faltings norm `‖dz‖²_Fal = covol Λ` (§§2.1–2.2), its behaviour along isogenies (§2.3), the
  elliptic formula through `|Δ(τ)|(Im τ)⁶` (§2.9), the relative Faltings height
  `AbelianVariety.faltingsHeight` (§3.1) and the stable height `stableFaltingsHeight` (§3.4).
  Layer 5 proves lattice formulas for these objects and defines neither.
- From [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md): the
  norm-fibre coefficients `normCoeff`, the Euler-product package `EulerProductData` and the ideal
  counts `idealCount_linearBounds` that the convergence estimates of 3.1–3.2 rest on.
- From [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) Layer 3:
  the Manin constant `c_φ ∈ ℚ^×` of a nonconstant `φ : X₀(N) → E`, `φ^*ω_E = c_φ · 2πi f dτ`,
  with its isogeny law `c_{ψ∘φ} = a_ψ c_φ` (§3.5); `c_φ ∈ ℤ` for every `φ`, and `p ∤ c_φ` for
  `φ` `X₀(N)`-optimal and `p > 2` a semistable prime (§3.7); `c_φ ∣ 6 deg φ` with its exact `2`-
  and `3`-adic exceptions (§3.8); the Petersson–degree identity
  `|c_φ|² · 8π²(f, f) = deg φ · i∫_E ω_E ∧ ω̄_E` (§3.9, in the form of §3.12); the valuation form
  of the isogeny law and the transfer of `p`-units along isogenies of degree prime to `p` (§3.10).
  Layer 4 defines the curve invariant `maninConstant` from `c_φ` and reads §§3.5, 3.9 on the Néron
  lattices (4.4, 4.5, 4.7); it reproves none of these.
- From [PeriodsAndSpecialValues](../PeriodsAndSpecialValues/README.md): the local factors
  `P_v(T) = det(1 − T Fr_v | (ker N_v)^{I_v})` and the finite `L`-function of a compatible system
  (PS.1.1), Serre's functional-equation predicate `SerreSystem` (PS.1.7), the Hasse–Weil completion
  `Λ_1(A, s) = Λ(H¹(A), s)` of an abelian variety over a number field (PS.1.8), and the order and
  leading coefficient of a finite `L`-function at a supplied nonzero germ (PS.3.3). Layer 3 is
  stated on Mathlib's `WeierstrassCurve.LSeries`; 3.2 proves that it is the finite part of
  PS.1.8's `Λ_1(E, s)`, and 3.3–3.4 read the continuation, the analytic rank and the leading
  coefficient in those terms.

### Not owned here

- The curve and its arithmetic: models, local data, Tamagawa numbers, the conductor, torsion,
  rank, heights, regulator, Selmer groups, `Ш`, Cassels' isogeny invariance of the BSD quotient
  and the BSD statement over `ℚ` — [EllipticCurves](../EllipticCurves/README.md).
- Modularity, the newform of `E`, the Hecke correspondences, `A_f`, the construction of `φ`, its
  degree as a morphism of curves, and the analytic continuation of `L(E, s)` over `ℚ` —
  [EllipticCurveModularity](../EllipticCurveModularity/README.md) and
  [ModularCurvesPartII](../ModularCurvesPartII/README.md).
- Elliptic functions, `℘`, `ζ`, `σ`, quasi-periods, Legendre's relation and the transcendence of
  periods — [GrothendieckPeriodConjecture](../GrothendieckPeriodConjecture/README.md) and
  ModularCurvesPartII §1.4a. Complex tori as manifolds and their families —
  [ComplexTori](../ComplexTori/README.md). The real period as a Legendre integral and the AGM —
  [EllipticIntegrals](../EllipticIntegrals/README.md).
- Periods of newforms as modular-symbol functionals, critical values and `p`-adic `L`-functions
  — [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md).
- The Faltings height of an abelian variety in general, the Hodge line and Faltings' isogeny
  formula — [ArakelovGeometryAndAbelianHeights](../ArakelovGeometryAndAbelianHeights/README.md).
- The Manin constant `c_φ` of a parametrization, its integrality and odd semistable `p`-unit
  range, `c_φ ∣ 6 deg φ`, the Petersson–degree identity, and the Gross–Zagier formula —
  [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md).
- The `L`-function of a motive or of an abelian variety of any dimension, its completion, the
  functional-equation predicates, and the order and leading term of a motivic `L`-function —
  [PeriodsAndSpecialValues](../PeriodsAndSpecialValues/README.md).
- Proving anything about `L(E/K, s)` beyond its half-plane of absolute convergence for
  `[K : ℚ] > 1`, Kolyvagin, and the rank-`≤ 1` cases of BSD: not here and not in any supplier
  named above; the statements of Layer 3 carry the continuation as a hypothesis.
- Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables are not targets: the Cremona and LMFDB orderings of isogeny
  classes and of curves within a class, the isogeny-class letter, the `990h` exception as a table
  fact. Layer 4.11 states the intrinsic predicates and nothing about the order.

## Pinned conventions

- **The invariant differential and its periods.** `ω_W = dx/(2y + a₁x + a₃)` for every equation.
  Under `C = (u, r, s, t)`, `ω_{C • W} = u · ω_W`, `Δ_{C • W} = u⁻¹² Δ_W`, `c₄_{C • W} = u⁻⁴ c₄_W`,
  and the period lattice scales by `Λ(C • W) = u · Λ(W)`. The lattice of an equation over `ℂ`
  is the lattice of periods of *this* `ω`, never of `dx/y` or of `2πi f(τ)dτ`.
- **The lattice invariants.** `Λ(W)` is the lattice `L.lattice` of a `PeriodPair L` with
  `L.g₂ = c₄(W)/12` and `L.g₃ = c₆(W)/216`, where `g₂ = 60 G₄`, `g₃ = 140 G₆` are Mathlib's. These
  are the invariants of the equation `y² = x³ − (g₂/4) x − (g₃/4)` reached from `W` by the change
  `(u, r, s, t) = (1, −b₂/12, −a₁/2, −a₃/2 + a₁b₂/24)` (Mathlib's `a₃' = u⁻³(a₃ + r a₁ + 2t)`
  forces `t = −(a₃ + r a₁)/2`), which has `u = 1` and so preserves `ω`; they are not the
  coefficients `(−27c₄, −54c₆)` of Silverman III.1's model `y² = x³ − 27c₄x − 54c₆`, whose change
  of variables has `u ≠ 1`.
- **Real places.** For a real place `v` with real embedding `σ_v`, `E_v = W.map σ_v` over `ℝ`
  and `Λ_v = Λ(W.map v.embedding)`. The number of connected components of `E_v(ℝ)` is `2` if
  `σ_v(Δ) > 0` and `1` if `σ_v(Δ) < 0`, written `realComponentCount`; `Λ_v` is rectangular
  (a `ℤ`-basis `[x, yi]`, `x, y > 0`) exactly in the first case and has a basis `[2x, x + yi]` in
  the second. The **local period** is `Ω_v(E) = realComponentCount · x₀`, with `x₀` the least
  positive element of `Λ_v ∩ ℝ`; it is `2x` in both cases, and it equals `∫_{E_v(ℝ)} |ω|` and
  `WeierstrassCurve.realPeriod (W.map σ_v)` (Layer 2.2). Over `ℚ` this is the LMFDB's
  `real_period`: the least positive real period multiplied by the number of real components.
- **Complex places.** For a complex place `v`, `Ω_v(E) = 2 · covol(Λ_v)`, with `covol` the
  Lebesgue covolume `ZLattice.covolume Λ_v volume` of `ℂ = ℝ²`; this is
  `|∫_{E_v(ℂ)} ω ∧ ω̄|`, twice the covolume, and does not depend on which of the two conjugate
  embeddings represents `v`. The factor `2` is part of the definition.
- **The global period.** `Ω(E/K) = |N_{K/ℚ}(Δ_W) / N(𝔇_{E/K})|^{1/12} · ∏_v Ω_v(E)`, the product
  over all infinite places (each complex place once), with `𝔇_{E/K}` the minimal discriminant
  ideal. It is independent of the equation and equals `∏_v Ω_v` when `W` is globally minimal.
- **The regulator.** Tau Ceti's `regulator` is computed from `canonicalHeight`, the limit
  `lim h(2ⁿP)/4ⁿ` of Mathlib's `Height.logHeight` of the `x`-coordinate, which is the
  *relative* (non-normalised) Weil height of `K`: a sum over all places weighted by local degrees
  and not divided by `[K : ℚ]`. So `regulator W` **is the Néron–Tate regulator `Reg_NT(E/K)`** of
  the BSD formula, with the pairing `⟨P, Q⟩ = ½(ĥ(P+Q) − ĥ(P) − ĥ(Q))` (Tau Ceti
  `neronTatePairing_apply`) and `Reg = 1` in rank `0`. The base-change-invariant regulator of a
  table is `Reg(E/K) = Reg_NT(E/K) / [K : ℚ]^r`; over `ℚ` the two agree, and `ĥ` is twice the
  normalisation of Silverman VIII.9, as the elliptic-curves roadmap pins.
- **The `L`-series.** `L(E/K, s)` is Mathlib's `W.LSeries`, the Dirichlet series of the
  arithmetic function `W.LFunction` built from the local polynomials `1 − a_𝔭T + N𝔭 T²`,
  `1 ∓ T`, `1` at good, split, nonsplit and additive primes of minimal equations; it is a `tsum`,
  equal to `0` outside its half-plane of convergence, and no statement below evaluates it at a
  point with `Re s ≤ 3/2`. The central point is `s = 1` (arithmetic normalization).
- **The continuation hypothesis.** A continuation of `L(E/K, s)` is a pair `(U, F)`: `U ⊆ ℂ`
  open and **convex**, containing `{Re s > 3/2}` and the point `1`; `F` analytic on `U` and equal
  to `W.LSeries` on `{Re s > 3/2}`. Convexity is what makes two continuations agree near `1`
  (3.4); the half-plane `{Re s > σ}` for any `σ < 1`, and `ℂ` itself, qualify. The analytic rank is
  `analyticOrderAt F 1` and the leading coefficient is `F^{(r)}(1)/r!`, both read from `F`, never
  from the `tsum`. This is the elliptic-curves roadmap's hypothesis with the domain restricted to
  convex sets containing the half-plane of convergence.
- **The analytic order of Ш** is a real number defined for every elliptic curve over `K` and
  every continuation, by the formula of 3.6; it carries no finiteness, rationality or integrality
  claim. "Analytic rank" always means `analyticOrderAt F 1` for a stated continuation.
- **Optimality.** `E/ℚ` of conductor `N` is `X₀(N)`-optimal when the quotient isogeny
  `λ : A_{F_E}^0 → E` can be chosen of degree `1`, equivalently when `ker(J₀(N) → E)` is
  connected; `Γ₁(N)`-optimal when the same holds for `A_{F_E}^1 → E`. Every isogeny class over `ℚ`
  contains exactly one curve of each kind, and they need not coincide.
- **The Manin constant** of an `X₀(N)`-optimal `E` is the positive rational `c` with
  `φ^*ω_E = c · 2πi f_E(τ) dτ` for the Néron differential `ω_E` (the differential of a global
  minimal equation, which is unique up to sign; the sign of `ω_E` is chosen so that `c > 0`),
  that is `|c_φ|` for GrossZagierAndArithmeticHeights §3.5's `c_φ`, equivalently `Λ_E = c · Λ_f`.
  For a non-optimal `E'` in the class it is the positive rational `c'` with
  `(ψ ∘ φ)^*ω_{E'} = c' · 2πi f dτ`, `ψ : E → E'` the isogeny of least degree from the optimal
  curve. The Manin–Stevens constant is the same scalar for the `Γ₁(N)`-parametrization.
- **The modular degree** of a curve `E'/ℚ` is the least degree of a non-constant morphism
  `X₀(N) → E'`; for the optimal curve it is `deg φ`, and for `E'` it is `deg φ · deg ψ` with `ψ`
  as above. The Petersson norm in `deg φ · covol Λ_E = 4π² c² ‖f‖²` is
  `‖f‖² = ∫_{Γ₀(N)\ℍ} |f(τ)|² dx dy`, the weight-`2` Petersson self-pairing over a fundamental
  domain for `Γ₀(N)`, not divided by the volume of the domain.
- **The congruence modulus** `r_E` of a newform `f ∈ S₂(Γ₀(N))` with integer coefficients is the
  largest `r ≥ 1` such that some `g ∈ S₂(Γ₀(N))` with integer Fourier coefficients and
  `⟨f, g⟩ = 0` satisfies `a_n(f) ≡ a_n(g) (mod r)` for all `n ≥ 1`.
- **Faltings heights** are in Faltings' normalization `‖α‖² = ½|∫ α ∧ ᾱ| = covol Λ` for `α = dz`,
  as the Arakelov roadmap pins (§2.7): `h_Fal(E/ℚ) = −½ log covol Λ_min`. Deligne's normalization
  differs by `+½ log π` and is never used here.
- **Stevens' curve.** In an isogeny class over `ℚ`, `E_min` is the curve whose Néron lattice is
  contained in the Néron lattice of every curve of the class, equivalently the curve of least
  Faltings height. The **Faltings ratio** of `E` is the index `[Λ_E : Λ_{E_min}]`.
- **The Néron lattice** of `E/ℚ` is `Λ_E = periodLattice` of the reduced minimal model
  (`reducedMinimalModel E`, Tau Ceti), embedded in `ℂ`; the same lattice is obtained from every
  globally minimal equation, since two of them differ by a change with `u = ±1`. Its covolume is
  the LMFDB `area`, and `Ω_E = realComponentCount · leastPositiveRealPeriod Λ_E`.
- **The multiplier of an isogeny.** For an isogeny `ψ : E → E'` over `ℚ`, `α_ψ ∈ ℤ` is the
  integer with `ψ^*ω_{E'} = α_ψ · ω_E` for the Néron differentials; it is positive once the signs of
  `ω_E, ω_{E'}` are fixed as above, and `α_ψ · Λ_E ⊆ Λ_{E'}` with index `deg ψ`. An isogeny is
  **étale** when `α_ψ = 1`.
- **The denominator ideal of `j`.** `𝔧_E = ∏_𝔭 𝔭^{max(0, −v_𝔭(j))}`, an integral ideal of `𝓞_K`
  dividing the minimal discriminant ideal; over `ℚ` its norm is `denom(j)`.
- **Bases.** Whenever a `ℤ`-basis `[w₁, w₂]` of a lattice in `ℂ` is written, it is oriented:
  `Im(w₂/w₁) > 0`, so that `covol = Im(w̄₁ w₂)`.
- **The special value** of `L(E/K, s)` is the leading coefficient `F^{(r)}(1)/r!` of 3.4, the first
  nonzero Taylor coefficient at `1`; it is a real number (3.4), and no sign is claimed for it.

## What Mathlib supplies

- `WeierstrassCurve R`, `IsElliptic`, `VariableChange` with its action `C • W`, `map`,
  `baseChange`, the invariants `b₂, b₄, b₆, c₄, c₆, Δ, j` and their transformation laws
  (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`, `VariableChange.lean`), the
  two-torsion cubic `Ψ₂Sq`, reduction over a DVR with `minimal`, `HasGoodReduction`,
  `HasSplitMultiplicativeReduction` (`Reduction.lean`).
- `PeriodPair` with `lattice : Submodule ℤ ℂ`, its `DiscreteTopology` and `IsZLattice ℝ`
  instances, `latticeBasis`, `G n`, `g₂`, `g₃`, `weierstrassP`, `derivWeierstrassP_sq`
  (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`).
- `ZLattice.covolume` with `covolume_pos`, `covolume_eq_det`, `covolume_comap` and
  `covolume_div_covolume_eq_relIndex'` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean`); the
  Lebesgue measure on `ℂ` through `Complex.measurableEquivRealProd`.
- `NumberField.InfinitePlace`: `embedding`, `mk_conjugate_eq`, `IsReal`, `IsComplex`,
  `embedding_of_isReal`, `mult`, `card_add_two_mul_card_eq_rank`; `Algebra.norm ℚ`,
  `Ideal.absNorm`, `NumberField.discr`, `NumberField.sign_discr`.
- `WeierstrassCurve.localPolynomial`, `localEulerFactor`, `LFunction : ArithmeticFunction ℤ` and
  `WeierstrassCurve.LSeries` over a number field (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`),
  on top of `LSeries`, `LSeriesSummable`, `LSeries.abscissaOfAbsConv`, Dirichlet convolution
  (`NumberTheory/LSeries/`), and `analyticOrderAt`, `iteratedDeriv`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.
- `Height.logHeight`, the number-field instance `Height.instAdmissibleAbsValues` with
  `mulHeight₁` as the product over all places with multiplicities `mult` and no `1/[K:ℚ]`
  (`NumberTheory/Height/NumberField.lean`), and `absLogHeight₁` for the normalised one.
- `Submodule.torsion ℤ`, `Nat.card`, `AddSubgroup.relIndex`, `Module.finrank`.

## What Tau Ceti supplies

- `WeierstrassCurve.minimalDiscriminantIdeal O W : Ideal O` with `minimalDiscriminantIdeal_smul`,
  `minimalDiscriminantIdeal_eq_span_of_isGlobalMinimal`,
  `isGlobalMinimal_iff_minimalDiscriminantIdeal_eq_span`; `IsGlobalMinimal`,
  `IsSemiGlobalMinimal`, `globalMinimalityClass`; `IsReducedMinimal`, `reducedMinimalModel E`
  with `exists_smul_eq_reducedMinimalModel` and `existsUnique_reducedMinimal`
  (`TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/`, `GlobalMinimalModel.lean`).
- `WeierstrassCurve.Affine.Point.canonicalHeight`, `canonicalHeight_parallelogram_law`,
  `neronTatePairing` with `neronTatePairing_apply` (the halved polar form) and
  `neronTatePairing_self`; `PointModTorsion`; `regulator` with
  `regulator_eq_abs_det_neronTateGramMatrix`, `regulator_eq_one_of_finrank_eq_zero`
  (`CanonicalHeight/Basic.lean`, `MordellWeil/PointModTorsion.lean`,
  `MordellWeil/Regulator.lean`); `fg_point_of_numberField` (`MordellWeil/FinitelyGenerated.lean`).
- `WeierstrassCurve.hasse_bound` over a finite field (`HasseBound.lean`).
- `TauCeti.Isogeny W₁ W₂`, `TauCeti.Isogeny.Hom`, degrees, the dual, and the pullback of the
  invariant differential: `Isogeny.pullbackDifferential`, `Hom.pullbackDifferential`,
  `Hom.pullbackDifferential_zsmul_id_invariantDifferential` (`[n]^*ω = n • ω`),
  `pullbackDifferential_negIsogeny_invariantDifferential`; `Affine.invariantDifferential` as a
  basis of `Ω[K(E)/F]` with `existsUnique_smul_invariantDifferential`.
- `UpperHalfPlane.peterssonInner k D f g = ∫_D conj(f) g (Im τ)^k`, `CuspForm.peterssonInnerFd`
  over the level-one domain, and `CuspForm.peterssonInnerCosets`, the pairing over a fundamental
  domain of a finite-index subgroup assembled from coset translates, with
  `peterssonInnerCosets_definite` (`NumberTheory/ModularForms/Petersson/`); `Newform N k`.
- `TauCeti.ModularSymbols`: `degreeZero`, the homological module `ModularSymbols R Γ w`, the
  Manin symbols, `rawPairing`, `periodMap R Γ hk : CuspForm → (𝕄 →ₗ[R] ℂ)` with `periodMap_mk`
  (`{α, β} ⊗ P ↦ ∫_β^α f(z) P(z, 1) dz`) and `periodMap_injective`
  (`NumberTheory/ModularForms/ModularSymbols/`).
- On Tau Ceti main and not at the pin, cited by path only: `WeierstrassCurve.realPeriodLIntegral`,
  `realPeriod`, `realPeriod_pos`, `realPeriod_variableChange` (`Ω(C • W) = |u| Ω(W)`)
  in `TauCeti/AlgebraicGeometry/EllipticCurve/RealPeriod.lean`; `tateLocalIndex` in
  `TateAlgorithm/LocalIndex.lean`; `algorithmicConductor` in `TateAlgorithm/Reduction/Conductor.lean`;
  `TauCeti.Isogeny.Hom.canonicalHeight_pointMap` and
  `regulator_mul_degree_pow_eq_index_sq_mul_regulator` in `CanonicalHeight/Isogeny.lean` and
  `MordellWeil/Regulator/Isogeny.lean`.

## What is missing

Neither Mathlib nor Tau Ceti has: a period lattice attached to a Weierstrass equation (Mathlib's
`PeriodPair` goes from a lattice to `℘`, not from an equation to a lattice); any local or global
period over a number field; any estimate on `WeierstrassCurve.LSeries` (summability, the
half-plane, nonvanishing); analytic rank or leading coefficient of an elliptic `L`-function; the
BSD quotient or the analytic order of Ш; optimality, the modular degree, the Manin constant of a
curve, the congruence modulus, Stevens' minimal curve, the Faltings ratio; or any lattice formula
for a Faltings height. All of these are built here, the Manin constant on
GrossZagierAndArithmeticHeights §3.5's scalar `c_φ`.

## Layer 1: the period lattice of a complex Weierstrass equation

Base: `W : WeierstrassCurve ℂ` with `[W.IsElliptic]`. Everything in this layer is a statement
about the function `W ↦ Λ(W)`; the lattice-side theory of `Λ` itself (elliptic functions, `η`,
Legendre) is the Grothendieck-period roadmap's and the uniformization `ℂ/Λ ≅ E(ℂ)` is
ModularCurvesPartII's.

### 1.1 The period lattice, pinned by `g₂` and `g₃`

Define `periodLattice W : Submodule ℤ ℂ`, with `[DiscreteTopology]` and `[IsZLattice ℝ]`
instances, as the lattice of the unique `PeriodPair`-lattice `Λ` with `g₂(Λ) = c₄(W)/12` and
`g₃(Λ) = c₆(W)/216`. The content is the two theorems

- `exists_periodPair_periodLattice : ∃ L : PeriodPair, L.lattice = periodLattice W ∧
  L.g₂ = W.c₄ / 12 ∧ L.g₃ = W.c₆ / 216`;
- `periodLattice_unique : L.g₂ = W.c₄ / 12 → L.g₃ = W.c₆ / 216 → L.lattice = periodLattice W`
  for every `PeriodPair L`.

*Existence* is the surjectivity of `Λ ↦ (g₂, g₃)` onto `{g₂³ − 27g₃² ≠ 0}`: the Weierstrass
equation `y² = x³ − (c₄/48)x − (c₆/864)`, reached from `W` by the change
`(1, −b₂/12, −a₁/2, −a₃/2 + a₁b₂/24)`, is elliptic, so ModularCurvesPartII §1.2 gives a lattice `Λ` and a
pointed isomorphism `ℂ/Λ ≅ E(ℂ)`, and §1.1 says `E` is then the lattice Weierstrass model of
`Λ`, with `a₄ = −g₂/4`, `a₆ = −g₃/4`. *Uniqueness*: if two lattices have the same `(g₂, g₃)` their
lattice Weierstrass models coincide, so by §1.3 they are homothetic, `Λ' = uΛ` with
`u⁻⁴g₂ = g₂` and `u⁻⁶g₃ = g₃`; one of `g₂, g₃` is nonzero since `g₂³ − 27g₃² = Δ(W) ≠ 0`
(1.2), so `u⁴ = 1` when `g₃ ≠ 0`, `u⁶ = 1` when `g₂ ≠ 0`, and `u² = 1` when both are nonzero;
in each case `u` is an automorphism of `Λ` (`iℤ[i] = ℤ[i]`, `ζ₆ℤ[ζ₃] = ℤ[ζ₃]`).

*Rests on:* Mathlib `PeriodPair.g₂`, `g₃`; ModularCurvesPartII §§1.1–1.3; GrothendieckPeriodConjecture
Layer 0 (`g₂_smul`, `g₃_smul`).

### 1.2 Discriminant, `j`, and the lattice Weierstrass model

For `L` with `L.lattice = periodLattice W`: `L.g₂³ − 27 L.g₃² = W.Δ` (`Δ_periodLattice`), and
`j(W)` is the `j`-invariant of the lattice, `1728 g₂³/(g₂³ − 27g₃²)`. The first identity is the
discriminant of `y² = x³ − (g₂/4)x − (g₃/4)`, namely `−16(4a₄³ + 27a₆²) = g₂³ − 27g₃²`
(ModularCurvesPartII `latticeWeierstrass_discriminant`), transported along the `u = 1` change,
which fixes `Δ`. The equation `W` and the lattice Weierstrass model `W_L` of ModularCurvesPartII
§1.1 are related by that change, so the period lattice of `W_L` is
`L.lattice`: the two directions, equation ↦ lattice ↦ equation and
lattice ↦ equation ↦ lattice, are the identity up to that change and up to equality of lattices.
Check the constants on `y² = x³ − x`: `c₄ = 48`, `c₆ = 0`, `g₂ = 4`, `g₃ = 0`, `Δ = 64 = g₂³`;
and on `11a1`, `y² + y = x³ − x² − 10x − 20`: `c₄ = 496`, `c₆ = 20008`, `g₂ = 124/3`,
`g₃ = 2501/27`, and the equation `y² = x³ − (31/3)x − 2501/108` has the same period lattice.

*Rests on:* 1.1; Mathlib `WeierstrassCurve.Δ`, `c₄`, `c₆` identities.

### 1.3 The scaling law

`periodLattice_smul (C : VariableChange ℂ) : periodLattice (C • W) = (C.u : ℂ) • periodLattice W`
(pointwise scaling of the submodule). Proof: `c₄(C • W) = u⁻⁴c₄`, `c₆(C • W) = u⁻⁶c₆`, and
`g₂(uΛ) = u⁻⁴g₂(Λ)`, `g₃(uΛ) = u⁻⁶g₃(Λ)` (GrothendieckPeriodConjecture Layer 0), so `uΛ` satisfies
the characterization of 1.1 for `C • W`. Corollaries: the change `u = −1` leaves the lattice
fixed, which is why the sign of `ω` never matters below;
`covolume_periodLattice_smul : covol Λ(C • W) = |u|² covol Λ(W)`.

*Rests on:* 1.1; Mathlib `WeierstrassCurve.c₄_smul`-type identities (`VariableChange` API).

### 1.4 Identification with the periods of `ω`

Under the pointed uniformization `ℂ/Λ ≅ E(ℂ)` of ModularCurvesPartII §1.2 with `Λ = periodLattice W`,
the invariant differential `ω_W` corresponds to `dz` (§1.4, `invariantDifferentialsAndPeriods`),
so `periodLattice W` is the image of `H₁(E(ℂ), ℤ) → ℂ`, `γ ↦ ∫_γ ω_W`: the lattice `Λ_{ω_W}` of
that section. This is the theorem that lets every statement below say "the period lattice of
`(E, ω)`" and mean `periodLattice`. Its proof is the composite of 1.2 with §1.4's `dx/(2y) = dz`
on the lattice model and the `u = 1` change of variables, which preserves `ω`.

*Rests on:* 1.2; ModularCurvesPartII §§1.2, 1.4.

### 1.5 Complex conjugation

For the conjugate equation `W̄ = W.map (starRingEnd ℂ)`: `z ∈ periodLattice W̄ ↔ conj z ∈
periodLattice W` (`mem_periodLattice_conj`), since `g₂, g₃` are conjugated and `G_k(Λ̄) = conj G_k(Λ)`
by reindexing the absolutely convergent sums. Hence `covol Λ(W̄) = covol Λ(W)`
(`covolume_periodLattice_conj`): the covolume of a complex place does not depend on the chosen
representative embedding. For `W` defined over `ℝ` (all `aᵢ` real), `Λ(W)` is stable under
conjugation.

*Rests on:* 1.1; Mathlib `PeriodPair.G`; GrothendieckPeriodConjecture Layer 0 (`G_congr`).

### 1.6 Real equations: shape, real components, least positive real period

Let `W : WeierstrassCurve ℝ` be elliptic and `Λ = periodLattice (W.map algebraMap ℝ ℂ)`.

- `realComponentCount W : ℕ := if 0 < W.Δ then 2 else 1`, and the theorem that it is the number
  of connected components of `E(ℝ)`: stated against the real locus of the projective model,
  `{P : W.toAffine.Point}` with the topology of `ℝℙ²`; the milestone includes giving that locus
  its topology as a compact `1`-manifold. (`E(ℝ)` is `S¹` for `Δ < 0` and `S¹ × ℤ/2` for `Δ > 0`:
  Silverman, *Advanced Topics*, Corollary V.2.3.1, or directly through the real roots of `Ψ₂Sq`:
  three real roots when `Δ > 0`, one when `Δ < 0`.)
- `leastPositiveRealPeriod Λ : ℝ := sInf {x : ℝ | 0 < x ∧ (x : ℂ) ∈ Λ}`, with
  `leastPositiveRealPeriod_pos`, `leastPositiveRealPeriod_mem` (the infimum is attained: `Λ ∩ ℝ`
  is a discrete subgroup of `ℝ`, nonzero because `Λ` is conjugation-stable — `λ + λ̄ ∈ Λ ∩ ℝ` and
  cannot vanish for all `λ`), and `Λ ∩ ℝ = ℤ · leastPositiveRealPeriod Λ`.
- **Shape.** If `Δ > 0` then `Λ = ℤx ⊕ ℤ(yi)` with `x = leastPositiveRealPeriod Λ`, `y > 0`
  (`periodLattice_rectangular_of_pos`); if `Δ < 0` then `Λ = ℤ(2x) ⊕ ℤ(x + yi)` with
  `2x = leastPositiveRealPeriod Λ`, `y > 0` (`periodLattice_rhombic_of_neg`). Both from the real
  roots of `4X³ − g₂X − g₃`: three real roots give two real half-periods and the rectangular
  lattice, one real root gives one.
- `realPeriod_eq_of_le_ofReal` — the comparison with the integral form of the real period
  (Tau Ceti main's `WeierstrassCurve.realPeriod`, the elliptic-curves roadmap's Layer 7 object):
  `realComponentCount W * leastPositiveRealPeriod Λ = 2 ∫_{Ψ₂Sq(x) > 0} dx/√Ψ₂Sq(x)`. Proof:
  on each real component `x ↦ ∫ dx/√Ψ₂Sq` is the real elliptic logarithm, whose total variation over
  the component is the least positive real period (`Δ < 0`: one component, two branches of `y`,
  integral over `(e₁, ∞)`; `Δ > 0`: two components, `2∫ dx/√Ψ₂Sq` over each of `(e₃, e₂)` and `(e₁, ∞)`
  equal to `x`); the three-real-root and one-real-root evaluations of
  EllipticIntegrals Milestone 8.2–8.3 give the same numbers through `K(k)` and are a consumer's
  check, not an input.

*Rests on:* 1.1, 1.5; Mathlib `Ψ₂Sq`, `Cubic.splits_iff_roots_eq_three`.

## Layer 2: local periods at the infinite places and the global period

Base: `K` a number field, `W : WeierstrassCurve K` with `[W.IsElliptic]`, `v : InfinitePlace K`,
`W_v := W.map v.embedding : WeierstrassCurve ℂ` and `Λ_v := periodLattice W_v`.

### 2.1 The embedded equations

`(W.map v.embedding).IsElliptic` (an instance), `Δ(W_v) = v.embedding Δ(W)`, and for a real
place `v` with `hv : v.IsReal`, `W.map v.embedding = (W.map (embedding_of_isReal hv)).map
algebraMap ℝ ℂ` (`map_embedding_of_isReal`), so the real equation of 1.6 is available. For a
complex place the two embeddings `v.embedding` and its conjugate give conjugate equations, and 1.5
applies.

*Rests on:* Mathlib `InfinitePlace.embedding_of_isReal_apply`, `mk_conjugate_eq`.

### 2.2 The local period at a real place

`localPeriod W v := realComponentCount (W.map (embedding_of_isReal hv)) * leastPositiveRealPeriod Λ_v`
for `hv : v.IsReal`. Theorems: `localPeriod_pos`; the integral form
`localPeriod W v = WeierstrassCurve.realPeriod (W.map (embedding_of_isReal hv))` (from 1.6, the
Tau Ceti main object cited by path); the scaling law `localPeriod_smul_of_isReal : localPeriod (C • W) v = |σ_v C.u| *
localPeriod W v` (from 1.3: `Λ` scales by `σ_v(u)`, a real number, and `realComponentCount` is
unchanged since `σ_v(Δ)` changes by the positive factor `σ_v(u)⁻¹²`). Over `ℚ` with its one place:
`localPeriod W ∞ = realPeriod W`, the LMFDB `real_period` once `W` is the reduced minimal model.

*Rests on:* 1.3, 1.6, 2.1.

### 2.3 The local period at a complex place

`localPeriod W v := 2 * ZLattice.covolume Λ_v volume` for `v.IsComplex`. Theorems:
`localPeriod_pos` (Mathlib `covolume_pos`); independence of the representative embedding
(1.5); the scaling law `localPeriod_smul_of_isComplex : localPeriod (C • W) v = ‖v.embedding C.u‖² *
localPeriod W v` (1.3);
the formula `2 Im(w̄₁ w₂)` for an oriented basis `[w₁, w₂]`, `Im(w₂/w₁) > 0`
(`covolume_eq_det` in the real basis `(w₁, w₂)` of `ℂ = ℝ²`); and the identification
`localPeriod W v = |∫_{E_v(ℂ)} ω ∧ ω̄|` through `dz ∧ dz̄ = −2i dx ∧ dy` on `ℂ/Λ_v`, consumed
from the Arakelov roadmap's §2.1–2.2 (`‖dz‖²_Fal = covol Λ`, and `|∫ ω ∧ ω̄| = 2‖ω‖²_Fal`).

*Rests on:* 1.3, 1.5, 2.1; ArakelovGeometryAndAbelianHeights §§2.1–2.2.

### 2.4 The product of the local periods under a change of variables

`prod_localPeriod_smul : ∏_v localPeriod (C • W) v = |N_{K/ℚ} (C.u)| * ∏_v localPeriod W v`,
from 2.2–2.3 and `|N_{K/ℚ} u| = ∏_{v real} |σ_v u| ∏_{v complex} |σ_v u|²`
(Mathlib `NumberField.prod_eq_abs_norm`-type identity over infinite places with `mult`). This is
the identity that makes 2.5 well defined; it is false place by place (a unit with `|σ_v u| ≠ 1` at
some `v` changes individual local periods) and true only for the product, which is why the global
period is the primitive object over a field with infinitely many units.

*Rests on:* 2.2, 2.3; Mathlib `InfinitePlace.prod_eq_abs_norm`.

### 2.5 The global period

`globalPeriod W := (|Algebra.norm ℚ W.Δ| / Ideal.absNorm (minimalDiscriminantIdeal (𝓞 K) W)) ^ (1/12 : ℝ)
* ∏ v, localPeriod W v`. Theorems:

- `globalPeriod_pos`;
- `globalPeriod_smul : globalPeriod (C • W) = globalPeriod W`: `N(Δ(C • W)) = N(u)⁻¹² N(Δ(W))`,
  the minimal discriminant ideal is invariant (`minimalDiscriminantIdeal_smul`), and 2.4;
- `globalPeriod_eq_prod_of_isGlobalMinimal`: for `W` globally minimal over `𝓞 K`,
  `(Δ W) = 𝔇_{E/K}` (`minimalDiscriminantIdeal_eq_span_of_isGlobalMinimal`) and
  `|N_{K/ℚ} Δ| = N((Δ))`, so the prefactor is `1` and `globalPeriod W = ∏ v, localPeriod W v`;
- for a semi-global minimal model with exceptional prime
  `𝔭` and defect `k` (the obstruction exponent of EllipticCurves 4.5a), the prefactor is `N𝔭^k`;
- over `ℚ`: `globalPeriod W = realPeriod (reducedMinimalModel W)` — the LMFDB `real_period` —
  through 2.2 and `exists_smul_eq_reducedMinimalModel`;
- base change: under base change to `L/K`,
  `globalPeriod W_L = (N(𝔇_{E/K})^{[L:K]} / N(𝔇_{E_L/L}))^{1/12} · ∏_v Ω_v(E)^{r_v} · (2 covol Λ_v)^{c_v}`,
  the product over the infinite places `v` of `K`, where `r_v` (resp. `c_v`) is the number of real
  (resp. complex) places of `L` above `v`, so `r_v + 2c_v = [L:K]` at a real `v` and `r_v = 0`,
  `c_v = [L:K]` at a complex `v`; the finite factor is `≥ 1` and is `1` when `E` is semistable
  over `K`. A real place that becomes complex contributes `2 covol Λ_v`, **not** `Ω_v²`, so the
  global period is not multiplicative in the degree even for semistable curves: `11a1` over `ℚ(i)`
  has `Ω(E/ℚ(i)) = 2 covol Λ_{11a1} = 3.7030872`, while `Ω(11a1)² = 1.6108923` (Worked examples).
  Only when every infinite place of `L` above a real place of `K` is real (e.g. `ℚ(√5)/ℚ`) and `E`
  is semistable over `K` does `globalPeriod W_L = globalPeriod W ^ [L:K]` hold.

*Rests on:* 2.2–2.4; Tau Ceti `minimalDiscriminantIdeal`, `IsGlobalMinimal`, `reducedMinimalModel`;
EllipticCurves 4.5a (obstruction exponent).

### 2.6 The Néron lattice over `ℚ`

For `E : WeierstrassCurve ℚ` elliptic, `neronLattice E := periodLattice ((reducedMinimalModel E).map
(algebraMap ℚ ℂ))`. Theorems:

- `neronLattice_smul : neronLattice (C • E) = neronLattice E` for every `C : VariableChange ℚ`
  (Tau Ceti `VariableChange.reducedMinimalModel_smul`): the lattice is an invariant of the
  `ℚ`-isomorphism class;
- `neronLattice_eq_of_isGlobalMinimal`: for every `W` in the class that is globally minimal over
  `ℤ`, `periodLattice (W.map (algebraMap ℚ ℂ)) = neronLattice E`. Two globally minimal equations
  differ by a change of variables over `ℤ` with `u ∈ ℤˣ = {±1}` (EllipticCurves 4.5b), and
  1.3 says `u = −1` fixes the lattice;
- the lattice is stable under complex conjugation (1.5), hence of one
  of the two shapes of 1.6 according to the sign of the minimal discriminant;
- `globalPeriod_eq_neronLattice`: `globalPeriod E = realComponentCount · leastPositiveRealPeriod
  (neronLattice E)` — the LMFDB `real_period` — and `covol (neronLattice E)` is the LMFDB `area`.

*Rests on:* 1.3, 1.5, 1.6, 2.5; Tau Ceti `reducedMinimalModel`, `exists_smul_eq_reducedMinimalModel`.

### 2.7 Isogenies and lattices

Let `ψ : E → E'` be an isogeny (Tau Ceti `Isogeny`) between elliptic Weierstrass equations over a
subfield `F ⊆ ℂ`, and `α ∈ F^×` the scalar with `ψ^*ω_{E'} = α · ω_E` (Tau Ceti
`Isogeny.pullbackDifferential` and `existsUnique_smul_invariantDifferential`; `α ≠ 0` because `ψ`
is separable in characteristic `0`). Theorems, with `Λ = periodLattice (E.map ι)`,
`Λ' = periodLattice (E'.map ι)` for the inclusion `ι : F → ℂ`:

- `smul_periodLattice_le_of_isogeny : α • Λ ≤ Λ'` and `relIndex (α • Λ) Λ' = deg ψ`: under the
  uniformizations of 1.4, `ψ` is `z ↦ αz` on `ℂ/Λ → ℂ/Λ'` (ModularCurvesPartII §1.3,
  `homothetyAndIsogenyCompatibility`: the induced map has degree `[Λ' : αΛ]`);
- `covolume_periodLattice_isogeny : covol Λ' = |α|² · covol Λ / deg ψ` (Mathlib
  `covolume_div_covolume_eq_relIndex'` and 1.3);
- `dual_isogeny`: for the dual `ψ̂` with scalar `α̂`, `α α̂ = deg ψ` (Tau Ceti
  `Hom.pullbackDifferential_zsmul_id_invariantDifferential`: `[deg ψ]^*ω = deg ψ · ω`).

Over `ℚ` the **multiplier** of an isogeny `ψ : E → E'` between elliptic equations over `ℚ`
(target name `neronMultiplier ψ : ℕ`) is the positive integer `α_ψ` with
`ψ^*ω_{E'} = ±α_ψ · ω_E`, where `ω_E` is the **Néron differential** of `E`: the invariant
differential of a globally minimal equation `ℚ`-isomorphic to `E` (for instance
`reducedMinimalModel E`), carried to `E` along that isomorphism. It is well defined up to sign,
since two globally minimal equations differ by a change with `u = ±1` (2.6), and the `±` absorbs
the sign; it depends on `ψ` only through the curves, not through the equations `E`, `E'` chosen
for them. `α_ψ` is an integer because `ψ` extends to the Néron models over `ℤ` by the Néron
mapping property (BLR §1.2) and so pulls Néron differentials back to Néron differentials (the
lattice of Néron differentials is the one the Arakelov roadmap's §2.9 uses); it is nonzero since
`ψ` is separable in characteristic `0`; and `α_ψ ∣ deg ψ` by the dual-isogeny identity. On the
Néron lattices the lattice theorems above read `α_ψ · Λ_E ⊆ Λ_{E'}` with index `deg ψ` and
`covol Λ_{E'} = α_ψ² · covol Λ_E / deg ψ` (target names `neronMultiplier_pos`,
`neronMultiplier_dvd_degree`, `relIndex_scaleLattice_neronLattice`,
`covolume_neronLattice_isogeny`). The two extreme cases both occur: `α_ψ = 1` (an **étale**
isogeny, `Λ_E ⊆ Λ_{E'}` with index `deg ψ`, so the target has the *smaller* covolume) and
`α_ψ = deg ψ` (`Λ_{E'} ⊇ (deg ψ) Λ_E` with index `deg ψ`, so `Λ_{E'} ⊆ Λ_E` with index `deg ψ`).

*Rests on:* 1.3, 1.4, 2.6; ModularCurvesPartII §1.3; Tau Ceti `Isogeny.Differential`,
`Isogeny.Hom.Differential`; ArakelovGeometryAndAbelianHeights §2.9 (the Néron differential
lattice).

**Checks.**

- `11a1 → 11a2` (degree `5`) has `α_ψ = 1`: `Λ_{11a1} ⊆ Λ_{11a2}` with index `5`, and
  `covol Λ_{11a2} = 1.8515436 / 5 = 0.3703087` (Worked examples).
- `11a1 → 11a3` (degree `5`) has `α_ψ = 5`: `covol Λ_{11a3} = 5² · 1.8515436 / 5 = 9.2577181`.
- The dual `11a3 → 11a1` is étale (`α = 1`), and `5 · 1 = 5` is the degree, as the dual-isogeny
  identity `α_ψ α_ψ̂ = deg ψ` requires; `990h3 → 990h1` (degree `3`) is also étale.
- A definition read on the given equations instead of on Néron differentials must be rejected:
  for the isomorphism from the non-minimal model `y² = x³ + 16` of `27a3` (lattice `Λ_{27a3}/2`,
  5.2) to its minimal model, the scalar between the two equations' invariant differentials is not
  `±1`, while the multiplier of an isomorphism is `1`.

## Layer 3: the analytic side of Birch–Swinnerton-Dyer, as definitions

Base: `K` a number field, `W : WeierstrassCurve K` with `[W.IsElliptic]`, `L(E/K, s) = W.LSeries`.
Nothing in this layer proves anything about `L(E/K, s)` beyond `Re s > 3/2`; the layer makes the
numbers a table displays — analytic rank, special value, BSD quotient, analytic order of Ш — into
real numbers attached to a curve and a pinned continuation, and states the conjectures.

### 3.1 Absolute convergence for `Re s > 3/2`

`LSeriesSummable_LFunction : 3/2 < s.re → LSeriesSummable ((↑) ∘ W.LFunction) s`, and
`abscissaOfAbsConv_LFunction_le : LSeries.abscissaOfAbsConv ((↑) ∘ W.LFunction) ≤ 3/2`.

Proof: `W.LFunction` is the Euler product of the local factors (Mathlib `eulerProduct`), so its
`n`-th coefficient is `∑_{N𝔞 = n} a_𝔞` with `a_𝔞` multiplicative in `𝔞`. At a good prime
`|a_𝔭| ≤ 2√(N𝔭)` (Tau Ceti `hasse_bound` applied to the reduction, since Mathlib's
`localPolynomial` is `1 − a_𝔭 T + N𝔭 T²` with `a_𝔭 = N𝔭 + 1 − #Ẁ(κ_𝔭)` counting the point at
infinity), so the coefficients of `(1 − a_𝔭T + N𝔭T²)⁻¹` satisfy `|a_{𝔭^k}| ≤ (k+1) N𝔭^{k/2}`; at a
bad prime `|a_{𝔭^k}| ≤ 1`. Hence `|a_𝔞| ≤ d(𝔞) · N𝔞^{1/2}`, and the number of ideals of norm `n`
is `O(n^ε)` (ArithmeticDirichletSeries Layer 5, `idealCount_linearBounds`, through the norm-fibre
coefficients `normCoeff` of its Layer 1), so `∑ |coeff n| n^{−σ}` converges for `σ > 3/2`.

*Rests on:* Mathlib `WeierstrassCurve.LFunction`, `LSeriesSummable`; Tau Ceti `hasse_bound`;
ArithmeticDirichletSeries Layers 1, 3, 5.

### 3.2 The Euler product and nonvanishing on `Re s > 3/2`

For `3/2 < Re s`: `W.LSeries s = ∏' 𝔭, (localPolynomial_𝔭 (N𝔭^{−s}))⁻¹` (`LSeries_eq_tprod`,
from ArithmeticDirichletSeries Layer 3's `EulerProductData` packaging of Mathlib's
`EulerProduct`), and `W.LSeries s ≠ 0` (`LSeries_ne_zero`): each local factor is nonzero because
the roots of `1 − a_𝔭T + N𝔭T²` have `|T| = N𝔭^{−1/2}` and `|N𝔭^{−s}| < N𝔭^{−1/2}` for
`Re s > 1/2`, the bad factors `1 ∓ T` are nonzero for `|T| < 1`, and an absolutely convergent
product of nonzero factors is nonzero. For real `s > 3/2`, `W.LSeries s > 0` (`LSeries_pos`:
each good factor is `|1 − α_𝔭 N𝔭^{−s}|⁻²`, each bad factor is positive).

`LSeries_eq_hasseWeil`: for `3/2 < Re s`, `W.LSeries s = L_fin(H¹(E), s)`, the finite part of
PeriodsAndSpecialValues PS.1.8's `Λ_1(E, s)` for `E` as an abelian variety of dimension `1` over
`K`. Both sides are absolutely convergent Euler products over the primes of `𝓞_K` on this
half-plane (PS.1.1's `Re s > 1 + w/2` with `w = 1`), so the theorem is the equality of local
polynomials `P_𝔭(H¹(E), T) = localPolynomial_𝔭(T)` at every `𝔭`. At good `𝔭` it is PS.1.8's
point-count identity, whose `H⁰` and `H²` factors are `1 − T` and `1 − N𝔭 T`, leaving
`1 − a_𝔭 T + N𝔭 T²` with `a_𝔭 = N𝔭 + 1 − #Ẽ(κ_𝔭)`. At bad `𝔭`, with `ℓ` prime to `𝔭`, the
`ℓ`-adic member of `H¹(E)` is the dual of the Tate module `V_ℓ E` of EllipticCurves Layer 2 (the
realization through which PeriodsAndSpecialValues reads `h¹(E)(1)`), and its inertia invariants are
a line on which geometric Frobenius acts by `1` or `−1` under split or nonsplit multiplicative
reduction (the Tate curve, EllipticCurves Layer 4), and `0` under additive reduction. In the
additive case with potentially good reduction, inertia acts through a nontrivial finite subgroup of
`SL(V_ℓ E)` (Néron–Ogg–Shafarevich, EllipticCurves Layer 4; the determinant is the cyclotomic
character of the Weil pairing, unramified at `𝔭`), in which an element fixing a line is the
identity; otherwise `E` is a ramified quadratic twist of a Tate curve (EllipticCurves Layer 4),
whose inertia invariants vanish. The bad factors are therefore `1 − T`, `1 + T` and `1`,
Mathlib's.

*Rests on:* 3.1; ArithmeticDirichletSeries Layer 3; Mathlib `EulerProduct`; PeriodsAndSpecialValues
PS.1.1, PS.1.8 (`LSeries_eq_hasseWeil`); EllipticCurves Layers 2, 4.

### 3.3 The continuation hypothesis

```lean
structure IsContinuation (W : WeierstrassCurve K) [W.IsElliptic] (U : Set ℂ) (F : ℂ → ℂ) : Prop where
  isOpen : IsOpen U
  convex : Convex ℝ U
  halfPlane_subset : {s : ℂ | 3 / 2 < s.re} ⊆ U
  one_mem : (1 : ℂ) ∈ U
  analyticOnNhd : AnalyticOnNhd ℂ F U
  eqOn : Set.EqOn F W.LSeries {s : ℂ | 3 / 2 < s.re}
```

Theorems: `IsContinuation.eqOn_inter`: two continuations `(U, F)`, `(U', F')` agree on `U ∩ U'`
— the intersection is convex, hence connected, open, and contains the half-plane on which
`F = F' = W.LSeries` (the identity theorem `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`);
in particular they agree on a neighbourhood of `1`. `IsContinuation.halfPlane`: `({Re s > 3/2},
W.LSeries)` is *not* a continuation (`1 ∉ U`), and `({Re s > σ}, F)` for `σ < 1` and `(Set.univ,
F)` are, whenever `F` is analytic there and agrees with the series. Convexity is the reason the
analytic rank of 3.4 is a function of `W` alone: for merely connected `U, U'` the intersection can
be disconnected, with the component of `1` missing the half-plane, and then `F(1) ≠ F'(1)` is
consistent with both being continuations. Over `ℚ`, the entire continuation of EllipticCurveModularity
R29.6 (`exists_entire_completed_LSeries`, divided by the gamma and conductor factors) gives
`isContinuation_univ : ∃ F, IsContinuation W Set.univ F` (`isContinuation_of_modularity`); over a
general `K` no such theorem is claimed and every statement below carries `IsContinuation` as a
hypothesis. In PeriodsAndSpecialValues' terms: a continuation of `Λ_1(E, s)` as in PS.1.7's
`SerreSystem` for `H¹(E)` that is analytic on a convex open `U` containing the half-plane and `1`,
divided by its gamma factor (whose reciprocal is entire), is an `IsContinuation W U F` through 3.2's
`LSeries_eq_hasseWeil`; `IsContinuation` asks for no functional equation and no continuation
beyond `U`.

*Rests on:* 3.1, 3.2; Mathlib `AnalyticOnNhd`, `Convex.isPreconnected`; EllipticCurveModularity
R29.6 (the `ℚ` instance only); PeriodsAndSpecialValues PS.1.7 (the comparison only).

### 3.4 Analytic rank, leading coefficient, and their independence of the continuation

For `h : IsContinuation W U F`:

- `analyticRank W h : ℕ := (analyticOrderAt F 1).toNat`, with `analyticOrderAt F 1 ≠ ⊤`
  (`analyticOrderAt_ne_top`): `F` is not identically zero near `1`, since `U` is connected and
  `F ≠ 0` on the half-plane (3.2);
- `leadingCoefficient W h : ℂ := iteratedDeriv (analyticRank W h) F 1 / (analyticRank W h)!`, with
  `leadingCoefficient_ne_zero`; it is the first nonzero Taylor coefficient of `F` at `1`
  (`taylor_leadingCoefficient`: `F s = leadingCoefficient · (s − 1)^r + O((s − 1)^{r+1})`), the
  LMFDB `special_value`;
- `leadingCoefficient_im : (leadingCoefficient W h).im = 0`: the coefficients of `W.LFunction`
  are integers, so `conj (F (conj s))` is a second continuation on `conj U` (convex, contains the
  half-plane and `1`), equal to `F` near `1` by 3.3; hence all derivatives of `F` at `1` are real.
  No sign is claimed: positivity of `L^{(r)}(E/K, 1)/r!` is not a theorem in this generality;
- `analyticRank_congr`, `leadingCoefficient_congr`: two continuations give the same rank and
  coefficient (3.3's `eqOn_inter` on a neighbourhood of `1`).

Over `ℚ` with the continuation of 3.3, `analyticRank` is the LMFDB `analytic_rank`; the sign of
the functional equation and the parity statement are EllipticCurveModularity R29.6's and are not
restated. `analyticRank W h` and `leadingCoefficient W h` are PeriodsAndSpecialValues PS.3.3's
order and leading coefficient of
`L_fin(H¹(E)(1), s) = L_fin(H¹(E), s + 1)` at `s = 0` for the germ `s ↦ F(1 + s)` (a germ of that
function by 3.2's `LSeries_eq_hasseWeil`): PS.3.3's order is `meromorphicOrderAt`, which on an
analytic germ is `analyticOrderAt` (Mathlib `AnalyticAt.meromorphicOrderAt_eq`), and its leading
coefficient of a holomorphic germ of order `r` is `L^{(r)}(0)/r!`.

*Rests on:* 3.2, 3.3; Mathlib `analyticOrderAt`, `iteratedDeriv`; PeriodsAndSpecialValues PS.3.3
(the comparison only).

### 3.5 The regulators and the torsion order

- `#E(K)_tors = Nat.card (Submodule.torsion ℤ W.Point)`, finite by Mordell–Weil (Tau Ceti
  `fg_point_of_numberField`), `torsion_card_pos`.
- `neronTateRegulator W := regulator W` (Tau Ceti; the Gram determinant of `neronTatePairing` on
  `PointModTorsion W`), and the theorem that makes the name honest,
  `canonicalHeight_eq_finrank_mul_absolute : ĥ(P) = [K : ℚ] · ĥ_abs(P)`, where `ĥ_abs` is the
  limit of `absLogHeight₁` of the `x`-coordinate: Mathlib's `Height.logHeight` on a number field
  is the sum over all places weighted by local degrees with no `1/[K:ℚ]`
  (`Height.instAdmissibleAbsValues`), so the limit `lim h(x(2ⁿP))/4ⁿ` Tau Ceti takes is the
  *relative* canonical height, the one in the knowl `ec.analytic_sha_order`'s `Reg_NT`.
- `normalisedRegulator W := regulator W / ([K : ℚ] : ℝ) ^ finrank ℤ (PointModTorsion W)`, the
  LMFDB `regulator` over `K` (`ec.regulator`: `Reg_NT = d^r Reg`), with
  `normalisedRegulator_baseChange : normalisedRegulator (W.baseChange L) = normalisedRegulator W`
  whenever `E(L) = E(K)` (the Gram matrix scales by `[L : K]` in each entry), and the two agree over
  `ℚ`. Base change in general (`E(L) ⊋ E(K)`) changes the rank and is no identity.

*Rests on:* Tau Ceti `canonicalHeight`, `regulator`, `regulator_eq_abs_det_neronTateGramMatrix`,
`regulator_eq_one_of_finrank_eq_zero`; Mathlib `Height.logHeight`, `absLogHeight₁`;
EllipticCurves Layer 6 (the normalisation pin `ĥ = lim h(x(nP))/n²`).

### 3.6 The BSD quotient over `K` and the analytic order of Ш

With `c_𝔭 = [E(K_𝔭) : E₀(K_𝔭)]` the local index of EllipticCurves Layer 4
(`W.tateLocalIndex ϖ s`, the index Tate's algorithm reports at the symbol `s` on which it stops, in
`TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/LocalIndex.lean` on Tau Ceti main), which is `1` at every prime not dividing the minimal discriminant ideal, so
that `∏_𝔭 c_𝔭` is a finite product over the `Finset` of prime factors of `𝔇_{E/K}`:

- `bsdFactor W : ℝ := globalPeriod W * regulator W * ∏_{𝔭 ∣ 𝔇} c_𝔭 / (#E(K)_tors)²`, positive;
  the arithmetic side of BSD without `#Ш`;
- `analyticShaOrder W h : ℝ := √|discr K| * (leadingCoefficient W h).re / bsdFactor W`, for
  `h : IsContinuation W U F`; `analyticShaOrder_congr` (independent of the continuation, 3.4);
  the LMFDB `sha_an`. It is a real number and nothing more: no integrality, rationality, squareness
  or positivity is asserted;
- over `ℚ`: `discr ℚ = 1`, `globalPeriod = realPeriod (reducedMinimalModel W)` (2.5), and
  `bsdFactor` is the `Ш`-free part of the BSD quotient of EllipticCurves Layer 7, which is
  `#Ш(E/ℚ) · bsdFactor` once `Ш` is finite (`bsdFactor_eq`); the knowl `ec.q.bsdconjecture`'s
  displayed identity `L^{(r)}(E,1)/r! ≈ Ш_an · Ω · Reg · ∏c_p / #tors²` is the definition
  rearranged;
- base change: `bsdFactor` and `analyticShaOrder` are defined per field, and no base-change law
  is stated for either (rank, torsion and the Tamagawa numbers all change under base change; the
  period alone has the law of 2.5).

*Rests on:* 2.5, 3.4, 3.5; EllipticCurves Layer 4 (`c_𝔭`), Layer 7 (`Ш`, the quotient over `ℚ`);
Mathlib `NumberField.discr`.

### 3.7 The conjectures as statements

- `WeakBSD W : Prop := ∀ U F (h : IsContinuation W U F), analyticRank W h = finrank ℤ
  (PointModTorsion W)` (the knowl `ec.bsdconjecture`'s weak form; `finrank ℤ` of the free quotient
  is the Mordell–Weil rank);
- `StrongBSD W : Prop := WeakBSD W ∧ Finite Ш(E/K) ∧ ∀ h, analyticShaOrder W h = #Ш(E/K)`, with
  `Ш(E/K)` EllipticCurves Layer 7's group; no squareness of `analyticShaOrder` is asserted
  (Cassels' theorem that `#Ш` is a square when finite is stated in no roadmap named here);
- `strongBSD_iff_of_isogeny`: for `E, E'` isogenous over `ℚ`, `StrongBSD E ↔ StrongBSD E'` is
  *exactly* Cassels' isogeny invariance of the BSD quotient together with the equality of the
  local Euler factors, hence of `LFunction`, of isogenous curves, both statements of the Cassels
  block of EllipticCurves Layer 7 (pinned there to `ℚ`); over general `K` this equivalence is not
  claimed.
- Rank-`0` and rank-`1` theorems (Gross–Zagier, Kolyvagin, the rationality of `Ш_an` in analytic
  rank `≤ 1`) are not here (Not owned); the one rationality statement this roadmap proves is 4.12,
  in analytic rank `0` over `ℚ`, from the modular side.

*Rests on:* 3.4–3.6; EllipticCurves Layer 7.

## Layer 4: the modular parametrization — optimality, modular degree, Manin constant

Base: `E : WeierstrassCurve ℚ` elliptic of conductor `N`, `f = F_E = newformOf E ∈ S₂(Γ₀(N))` with
integer coefficients (EllipticCurveModularity R29.3), `λ` a quotient isogeny and
`φ = modularParametrisation E λ : X₀(N) → E` (R29.5). Everything about `φ` as a morphism —
existence, the cusp condition, surjectivity, the rational scalar of `φ^*ω` — is consumed; this
layer defines the invariants a table records and proves the lattice identities behind them. All
lattices are the Néron lattices of 2.6 unless a model is named.

### 4.1 The period lattice of a rational newform

`newformPeriodLattice f : Submodule ℤ ℂ`, the set of `2πi ∫_γ f(τ) dτ` for `γ ∈ H₁(X₀(N), ℤ)`,
the integral homology of the compact Riemann surface `X₀(N)` (ModularForms Layer 10B), with
`2πi f(τ) dτ` the regular differential `ω_f` of `f` (ModularCurvesPartII §7.2). Theorems:

- it is a full lattice (`DiscreteTopology`, `IsZLattice ℝ` instances): `ℂ/Λ_f` is the complex
  torus of the quotient `A_f^0 = J₀(N)/I_f J₀(N)` of EllipticCurveModularity R29.5, an elliptic
  curve, since the `f`-isotypic part of `H⁰(X₀(N), Ω¹)` is the line `ℂ · 2πi f dτ` and the image of
  `H₁(X₀(N), ℤ)` under integration against it is the period lattice of that quotient (Cremona
  §2.10, p. 34, where the rank-`2` lattice is read off the real structure);
- `newformPeriodLattice_eq_image_periodMap`: `Λ_f` is the image under `2πi · periodMap ℤ (Γ₀(N)) f`
  (Tau Ceti, `{α, β} ↦ ∫_β^α f dz`) of the cuspidal integral modular symbols, the kernel of the
  boundary map `𝕄 → ℤ[Γ₀(N)\P¹(ℚ)]`, `{α, β} ↦ [β] − [α]`, of the homological symbol module
  (ModularCurvesPartII §14.12; the Hom-side counterpart is ModularSymbolsPadicLFunctions §0.4).
  The input is §14.12's comparison for `r = 0`, `𝕄 ≅ H₁(X₀(N), cusps; ℤ)`, whose cuspidal kernel
  is `H₁(X₀(N), ℤ)` by the exact sequence of the pair; §14.12 states it for a torsion-free group,
  and `cuspidalSymbols_equiv_homology`, the same comparison for `Γ₀(N)` with elliptic points
  (Manin's theorem; Cremona §§2.1.4–2.1.6, pp. 12–14), is a milestone here;
- `mem_newformPeriodLattice_conj`: it is stable under complex conjugation, since `f` has real
  coefficients and the involution `z ↦ −z̄` of `X₀(N)` acts on homology (Cremona §2.1.3); hence
  it has one of the two real shapes of 1.6 (Cremona's lattice types 1 and 2, §2.10, p. 34:
  `[2x, x + yi]` or `[x, yi]`);
- `realPeriod_newform`: Cremona's `Ω(f) = 2Ω₀(f)` (rectangular) or `Ω₀(f)` (otherwise), with
  `Ω₀(f)` the least positive real period (§2.8, p. 30), is `realComponentCount · leastPositiveRealPeriod`
  of this lattice, i.e. the construction of 1.6 applied to `Λ_f`.

Cremona's definition (§2.15.1, p. 47) is the same lattice described as the image of the
homomorphism `P_f : Γ₀(N) → ℂ`, `M ↦ 2πi ∫_{z₀}^{M z₀} f`.

*Rests on:* 1.6; Tau Ceti `periodMap`; ModularForms Layers 8, 10B; ModularCurvesPartII §§7.2, 14.12;
ModularSymbolsPadicLFunctions §0.4; EllipticCurveModularity R29.5 (the quotient `A_f^0`).

**Checks.**

- `11a1` is `X₀(11)`-optimal with Manin constant `1` (4.4), so for the newform `f` of level `11`,
  `Λ_f = Λ_{11a1}`: basis `[1.2692093, 0.6346047 + 1.4588166 i]`, `covol Λ_f = 1.8515436`, and
  Cremona's `Ω(f) = 1.2692093` (one real component).
- `37a1` (optimal, Manin constant `1`, `Δ > 0`): `Λ_f = ℤ · 2.9934586 ⊕ ℤ · 2.4513894 i`, the
  rectangular shape of 1.6, with `covol Λ_f = 7.3381327`.
- Only cuspidal symbols contribute: for level `11` the symbol `{0, ∞}` has period
  `L(f, 1) = 0.2538419 = 1.2692093 / 5` (4.12; `L(E, 1)/Ω = 1/5` in Worked examples), which is
  not in `Λ_f` since `Λ_f ∩ ℝ = ℤ · 1.2692093`. A definition through all of `𝕄` gives a strictly
  larger group and must be rejected.

### 4.2 `X₀(N)`-optimality

`IsX0Optimal E : Prop := ∃ λ : QuotientIsogeny E F_E _, deg λ = 1`: the quotient isogeny
`A_{F_E}^0 → E` from the modular quotient of `J₀(N)` can be chosen to be an isomorphism. Equivalent
forms (`isX0Optimal_iff_*`):

- `ker (J₀(N) → E)` is connected (`A_F^0` is by construction the quotient of `J₀(N)` by the
  connected subvariety `I_F J₀(N)`, and an isogeny `A → E` has connected kernel iff it is an
  isomorphism);
- `φ_* : H₁(X₀(N), ℤ) → H₁(E, ℤ) = Λ_E` is surjective, for any (equivalently every) `φ` built
  from a quotient isogeny of degree `1` — a quotient of complex tori with connected kernel is
  surjective on the period lattices;
- `Λ_E = c · Λ_f` for the scalar `c` of 4.4 (a restatement of surjectivity through 1.4);
- every factorization `φ = ψ ∘ φ''` through an isogeny `ψ : E'' → E` over `ℚ` has `deg ψ = 1`.

Existence and uniqueness in the isogeny class: `exists_isX0Optimal`: the curve `A_{F_E}^0`
itself, with `λ = id`, is a curve in the class of `E` (R29.5 `nonempty_quotientIsogeny`);
`isX0Optimal_unique`: two optimal curves in one class are `ℚ`-isomorphic, both being isomorphic to
`A_F^0` for the common newform (R29.3 `newformOf_isogeny_invariant`). So `optimalCurve E`, the
`X₀(N)`-optimal curve isogenous to `E`, is well defined up to `ℚ`-isomorphism, and is pinned as a
curve by presenting it as a reduced minimal model (`isReducedMinimal_optimalCurve`,
`optimalCurve_smul`, `optimalCurve_isogenous`, `optimalCurve_eq_of_isogeny`). While the quotient
isogeny is not available as a Lean object, a formalisation states `IsX0Optimal E` in its equivalent
form `reducedMinimalModel E = optimalCurve E`, with `isX0Optimal_optimalCurve`.

*Rests on:* 1.4, 2.6; EllipticCurveModularity R29.3, R29.5.

**Checks.**

- `11a1` is optimal (`X₀(11) ≅ 11a1`), so `optimalCurve` of each of `11a1`, `11a2`, `11a3` is the
  reduced minimal model `[0, −1, 1, −10, −20]` of `11a1` (R29.5).
- `11a3` is not optimal: every map `X₀(11) → 11a3` has degree `5n²` (R29.5).
- `37a1` is optimal with `deg φ = 2`; `990h3` is the optimal curve of class `990h` and `14a1`,
  `27a1` those of classes `14a`, `27a` (Worked examples).

### 4.3 `Γ₁(N)`-optimality

`IsGamma1Optimal E : Prop` is the same statement for the quotient `A_{F_E}^1` of `J₁(N)`
(EllipticCurveModularity R29.5, through its `J₁` comparison): the quotient isogeny `A_F^1 → E` can
be chosen of degree `1`, equivalently `ker (J₁(N) → E)` is connected. `exists_isGamma1Optimal`,
`isGamma1Optimal_unique` as in 4.2, giving `gamma1OptimalCurve E`, again presented as a reduced
minimal model (`isReducedMinimal_gamma1OptimalCurve`, `gamma1OptimalCurve_isogenous`), with
`IsGamma1Optimal E` the equation `reducedMinimalModel E = gamma1OptimalCurve E`. The pullback map
`J₀(N) → J₁(N)` along `X₁(N) → X₀(N)`, whose kernel is the Shimura subgroup `Σ ⊆ J₀(N)`, restricts
to an isogeny `E₀ → E₁` from the `X₀(N)`-optimal curve `E₀ ⊆ J₀(N)` to the `Γ₁(N)`-optimal curve
with kernel `E₀ ∩ Σ` (`x0_to_gamma1`), so `E₀ ≅ E₁` iff `E₀ ∩ Σ = 0`; its dual `E₁ → E₀`, the
Shimura cover, has constant kernel (Vatsal, Remark 1.8). The two notions differ
already at `N = 11`: `X₁(11) ≅ 11a3`, so `11a3` is `Γ₁(11)`-optimal while `11a1` is
`X₀(11)`-optimal (R29.5's `modularParametrisation_11a3` check).

*Rests on:* 4.2; EllipticCurveModularity R29.5; ModularCurvesPartII §16.2 (the `J₁` quotient).

**Checks.**

- `X₁(11) ≅ 11a3`, so `11a3` is `Γ₁(11)`-optimal and `gamma1OptimalCurve` of every curve of class
  `11a` is `11a3`.
- `11a1` is `X₀(11)`-optimal but not `Γ₁(11)`-optimal: in class `11a` the two optimal curves are
  different, so `gamma1OptimalCurve` and `optimalCurve` are different functions.

### 4.4 The Manin constant of an optimal curve

For `E` with `IsX0Optimal E`, `λ` of degree `1`, `φ = modularParametrisation E λ`, and the Néron
differential `ω_E` (the differential of `reducedMinimalModel E`): the nonzero rational `c_φ` with
`φ^*ω_E = c_φ · 2πi f dτ` is GrossZagierAndArithmeticHeights §3.5's Manin constant of `φ` (R29.5
`modularParametrisation_pullback` gives the scalar for the differential of the displayed model,
and 1.3's scaling with `u ∈ ℚ^×` transports it to the reduced minimal model).
`maninConstant E : ℚ := |c_φ|`, a positive integer since `c_φ ∈ ℤ` (§3.7). Theorems:

- `maninConstant_indep`: independence of `λ`: two quotient isogenies of degree `1` differ by an
  automorphism of `E` over `ℚ`, which is `±1` (over `ℚ` the extra automorphisms at `j = 0, 1728`
  need `ζ₃` or `i`), and `[−1]^*ω = −ω` (Tau Ceti
  `pullbackDifferential_negIsogeny_invariantDifferential`), so `|c_φ|` is unchanged;
- `maninConstant_smul`: `c` depends only on the `ℚ`-isomorphism class;
- `neronLattice_optimalCurve_eq : Λ_E = maninConstant E • Λ_f` (as `ℤ`-submodules of `ℂ`,
  `c • Λ_f = {c z | z ∈ Λ_f}`): `Λ_E = {∫_{φ_*γ} ω_E} = {∫_γ φ^*ω_E} = c · {2πi ∫_γ f dτ}` using
  surjectivity of `φ_*` (4.2) and 1.4; the sign of `c` is absorbed by `−Λ_f = Λ_f`;
- `maninConstant_optimalCurve_sq : maninConstant E ^ 2 = covol Λ_E / covol Λ_f` (1.3's covolume
  scaling), the form in which `c` is computed;
- `maninConstant_pos`.

The Manin constant is a property of the optimal curve and its newform, not of a model: the knowl
`ec.q.manin_constant` is this definition.

*Rests on:* 1.3, 1.4, 2.6, 4.1, 4.2; GrossZagierAndArithmeticHeights §§3.5, 3.7;
EllipticCurveModularity R29.5; Tau Ceti `Isogeny.Differential`.

**Checks.**

- `11a1`, `37a1`, `990h3`: `maninConstant = 1` (Worked examples), and for `11a1`
  `covol Λ_E / covol Λ_f = 1.8515436 / 1.8515436 = 1`.
- The value is `|c_φ|`, so the sign of the Néron differential does not matter: the change
  `u = −1` replaces `ω_E` by `−ω_E` and `c_φ` by `−c_φ`, and leaves `maninConstant` unchanged.
- The Manin constant is not the degree of `φ`: `37a1` has `deg φ = 2` and `maninConstant = 1`.

### 4.5 The Manin constant of a non-optimal curve

For `E'` in the isogeny class of the optimal `E`, `Hom_ℚ(E, E')` is a free `ℤ`-module of rank `1`
(`hom_rank_one`): `End_ℚ(E) = ℤ`, because a `ℚ`-endomorphism acts on the invariant differential by
a scalar in `ℚ` (Tau Ceti `existsUnique_smul_invariantDifferential`), this action is an injective
ring homomorphism in characteristic `0` (Silverman AEC II.4.2(c): an isogeny with `φ^*ω = 0` is
inseparable), and a subring of `ℚ` whose elements are algebraic integers is `ℤ`; and a nonzero
`Hom(E, E')` is a torsion-free `End(E)`-module of rank `1` (Silverman AEC III.9). So there is an
isogeny `ψ : E → E'` of least degree, unique up to sign (`leastIsogeny`). With `α_ψ ∈ ℤ_{>0}` its
multiplier (2.7), `maninConstant E' := maninConstant E · α_ψ`
(`maninConstant_eq_mul_neronMultiplier`, stated for any `ψ` of least degree), the knowl's `c'` with
`(ψ ∘ φ)^*ω_{E'} = c' · 2πi f dτ`: GrossZagierAndArithmeticHeights §3.5's isogeny law
`c_{ψ∘φ} = a_ψ c_φ`, with `a_ψ = ±α_ψ` the scalar of 2.7, gives `maninConstant E' = |c_{ψ∘φ}|`;
the valuation form of that law and the transfer of `p`-units along isogenies of degree prime to `p`
are §3.10's. Theorems: `α_ψ ∣ deg ψ` (2.7), so
`(maninConstant E · deg ψ) / maninConstant E' = deg ψ / α_ψ` is a positive integer; the lattice
form `maninConstant E' • Λ_f = α_ψ • Λ_E ≤ Λ_{E'}` with index `deg ψ`; and the two values `α_ψ = 1`, `α_ψ = deg ψ` both occur
(`11a2`, `11a3`).

*Rests on:* 2.7, 4.4; GrossZagierAndArithmeticHeights §§3.5, 3.10; Tau Ceti `Isogeny.Hom`,
`Affine.InvariantDifferential`.

**Checks.**

- Class `11a`: `maninConstant 11a2 = 1 · 1 = 1` (`α = 1`) and `maninConstant 11a3 = 1 · 5 = 5`
  (`α = 5`).
- Classes `14a`, `27a`: `maninConstant` is `3` for `14a4`, `14a6`, `27a3` and `27a4`; class
  `990h`: `maninConstant 990h1 = 1` (Worked examples).
- The factor is the multiplier, not the degree: the least isogeny `11a1 → 11a2` has degree `5`,
  and `maninConstant 11a2 = 1`, not `5`.

### 4.6 The modular degree

`modularDegree E' : ℕ := sInf {deg g | g : X₀(N) → E' a nonconstant ℚ-morphism}` for every `E'/ℚ`
of conductor `N` (the knowl `ec.q.modular_degree`: the minimum degree of a modular parametrization).
Theorems:

- `modularDegree_optimal : IsX0Optimal E → modularDegree E = deg φ` for `φ` built from a degree-`1`
  quotient isogeny. Every nonconstant `g : X₀(N) → E'` differs by a translation (degree-preserving)
  from one sending `∞ ↦ O`, which factors through the Abel–Jacobi map and a homomorphism
  `J₀(N) → E'`; a homomorphism from `J₀(N)` to a curve attached to `f` kills `I_f J₀(N)` (R29.6
  `exists_isNewformOf_of_X0` identifies the form), so it factors through `A_f^0 = E`, hence
  `g = ψ ∘ φ` with `deg g = deg ψ · deg φ ≥ deg φ`;
- `modularDegree_eq_mul_degree : modularDegree E' = modularDegree E · deg ψ` with `ψ` any
  least-degree isogeny of 4.5 (`deg(nψ) = n² deg ψ`, so the minimum over `Hom(E, E') ∖ 0` is at
  `±ψ`);
- `modularDegree_pos`; `modularDegree_smul`; `modularDegree_optimalCurve_dvd`: within a class every
  modular degree is a multiple of the optimal one.

*Rests on:* 4.2, 4.5; EllipticCurveModularity R29.5–R29.6; ModularCurvesPartII §16.

**Checks.**

- `11a1 ↦ 1`, `11a2 ↦ 5`, `11a3 ↦ 5`: both non-optimal curves are reached by an isogeny of
  degree `5` from the optimal one.
- `37a1 ↦ 2`, `389a1 ↦ 40`, `5077a1 ↦ 1984` (Cremona §2.15.1, p. 48).
- `990h3 ↦ 1728` and `990h1 ↦ 5184 = 1728 · 3`, the degree-`3` isogeny `990h3 → 990h1`;
  `14a6 ↦ 6`, `27a4 ↦ 9`, `64a1 ↦ 2` (Worked examples).

### 4.7 The Petersson formula for the modular degree

`modularDegree_mul_covolume : (modularDegree E : ℝ) * covol Λ_E = 4π² (maninConstant E)² ‖f‖²`
for `E` `X₀(N)`-optimal, and for every curve of the class with 4.5's extension, with
`‖f‖² = ∫_{Γ₀(N)\ℍ} |f(τ)|² dx dy = peterssonInnerCosets f f`
(Tau Ceti: the coset sum of the level-one pairing `∫_D conj(f) g (Im τ)^k` against the invariant
measure `dx dy / y²`, which at `k = 2` is `∫ |f|² dx dy`; for `Γ = Γ₀(N)` the coset domain is a
fundamental domain for `Γ₀(N)`). This is GrossZagierAndArithmeticHeights §3.9's identity
`|c_φ|² · 8π²(f, f) = deg φ · i∫_{E(ℂ)} ω_E ∧ ω̄_E` (equivalently §3.12's
`‖ω‖² = c²‖ω_f‖²/deg π`) read on the Néron lattice: `i∫_{E(ℂ)} ω_E ∧ ω̄_E = 2 covol Λ_E` (the
Arakelov roadmap's §2.1, `(i/2)∫ dz ∧ dz̄ = covol`, via 1.4), `deg φ = modularDegree E` (4.6) and
`|c_φ| = maninConstant E` (4.4); for a non-optimal curve, §3.9 applied to `ψ ∘ φ` with 4.5 and
4.6. With `c = 1` it is Zagier's formula (Cremona, Proposition 2.15.1, p. 48:
`4π²‖f‖² = deg(φ) Vol(E_f)` for the curve `E_f = ℂ/Λ_f`). Corollary `maninConstant_eq_one_iff`:
for optimal `E`, `c = 1 ↔ deg φ · covol Λ_E = 4π² ‖f‖²`.

*Rests on:* 1.4, 2.6, 4.4, 4.5, 4.6; GrossZagierAndArithmeticHeights §§3.9, 3.12; Tau Ceti
`peterssonInnerCosets`; ModularForms Layer 3; ArakelovGeometryAndAbelianHeights §2.1.

**Checks.** `‖f‖²` is integrated over the `N + 1` coset translates `F`, `S T^j F` of the
standard fundamental domain, with every `y`-integral taken to `∞`; in each case
`deg φ · covol Λ_E / (4π² ‖f‖²) = 1` to `15` digits.

- `11a1`: `covol Λ_E = 1.8515436`, `deg φ = 1`, `‖f‖² = 0.0469001`.
- `37a1`: `covol = 7.3381327`, `deg φ = 2`, `‖f‖² = 0.3717541`.
- `67a1`: `covol = 3.8594830`, `deg φ = 5`, `‖f‖² = 0.4888092`; `73a1`: `covol = 3.3029156`,
  `deg φ = 3`, `‖f‖² = 0.2509915`.
- Truncation must be rejected: the translates `(f|S)(τ + j) = (w_N/N) f((τ + j)/N)` decay only
  like `e^{−4πy/N}`, so a `y`-cutoff of `8` already loses `1.6%` of the norm at `N = 37`.

### 4.8 The congruence modulus

`integralCuspForms N`, written `S₂(Γ₀(N), ℤ)`: the `ℤ`-submodule of `S₂(Γ₀(N))` of forms whose
`q`-expansion coefficients (`qExpansion 1`) are integers, defined here, with the theorem
`integralCuspForms_span` that it spans `S₂(Γ₀(N))` over `ℂ`. Proof: ModularCurvesPartII §§7.5–7.6
give the rational structure `V_ℚ = H⁰(X₀(N)_ℚ, Ω¹)`, `V_ℚ ⊗ ℂ = S₂(Γ₀(N))`, with rational
`q`-coefficients `a_n(f) = β(T_n, f)`; the `ℤ`-finiteness of the Hecke algebra `heckeAlgℤ`
(ModularForms Layer 8) bounds the denominators of `β(T_n, f)`, `n ≥ 1`, for each `f ∈ V_ℚ`, so
clearing them gives an integral `ℂ`-basis. Then `congruenceModulus f : ℕ` is the largest `r ≥ 1`
for which some `g ∈ S₂(Γ₀(N), ℤ)` with `⟨f, g⟩ = 0` has `a_n(f) ≡ a_n(g) (mod r)` for all `n ≥ 1`
(Agashe–Ribet–Stein, *The modular degree, congruence primes, and multiplicity one*, §2.1,
definition (i)). Theorems:

- `congruenceModulus_eq_card`: it is the order of the finite group
  `S₂(Γ₀(N), ℤ) / (ℤf ⊕ (ℤf)^⊥)` (their definition (ii)); the group is finite because
  `ℤf ⊕ (ℤf)^⊥` has full rank in `S₂(Γ₀(N), ℤ)` (`integralCuspForms_span`), and cyclic, being the
  image of `g ↦ ⟨g, f⟩/⟨f, f⟩` modulo `ℤ`, so its order is also its exponent; the `sSup` in the
  definition is attained;
- `modularDegree_dvd_congruenceModulus : modularDegree E ∣ congruenceModulus f` for `E` optimal
  (Ribet; ARS Theorem 2.1, first part);
- `padicValNat_congruenceModulus : p² ∤ N → padicValNat p (congruenceModulus f) = padicValNat p
  (modularDegree E)` (ARS Theorem 2.1, second part: `ord_p(N) ≤ 1 → ord_p(r_E) = ord_p(m_E)`);
  both are cited statements whose proofs run through the Hecke module `H₁(J₀(N), ℤ)` and are not
  rebuilt here.

*Rests on:* 4.6; Tau Ceti `peterssonInnerCosets`, `qExpansion`; ModularForms Layers 3, 8;
ModularCurvesPartII §§7.5–7.6.

**Checks.**

- `54b1`, `y² + xy + y = x³ − x² + x − 1` (ARS Table 1): `r_E = 6` and `m_E = 2`, so `2 ∣ 6`, and
  the prime `3`, with `9 ∣ 54`, is where the two differ; the group
  `S₂(Γ₀(54), ℤ) / (ℤf ⊕ (ℤf)^⊥)` of definition (ii) has order `6`.
- The form `g = 0` is admissible and witnesses only `r = 1`, since `a₁(f) = 1`; so the set of
  admissible `r` is never empty.
- The orthogonality condition is load-bearing: `g = f` is congruent to `f` modulo every `r` but is
  rejected, since `⟨f, f⟩ > 0` (`peterssonInnerCosets_definite`); without it there is no
  largest `r`.

### 4.9 Divisibility theorems for the Manin constant, and Manin's conjecture

Integrality of `c_φ` for every `φ`, the odd semistable `p`-unit statement for `X₀(N)`-optimal `φ`,
and `c_φ ∣ 6 deg φ` with its exact `2`- and `3`-adic exceptions are GrossZagierAndArithmeticHeights
§§3.7–3.8's and are not restated; read through 4.4–4.6 they say that `maninConstant E` is a
positive integer, and for optimal `E` is prime to every odd `p` with `p² ∤ N` and divides
`6 · modularDegree E`. The theorems below are stated on the curve invariant, each a theorem of
this layer with the proof recorded as a citation (the proofs use the integral
structure of `X₀(N)` over `ℤ_p`, which this roadmap does not build):

- `sq_dvd_four_mul_of_dvd_maninConstant : p ∣ c → p² ∣ 4N` — Mazur (ARS Theorem 2.3,
  Mazur's Corollary 4.1), for odd `p` the divisibility form of §3.7's `p`-unit statement on
  `maninConstant (optimalCurve E)`; `dvd_conductor_of_dvd_maninConstant : p ∣ c → p ∣ N` — Abbes–Ullmo
  (ARS Theorem 2.5); `four_dvd_conductor_of_four_dvd_maninConstant` — Raynaud (ARS Theorem 2.4);
  `sq_dvd_conductor_or_dvd_modularDegree : p ∣ c → p² ∣ N ∨ p ∣ modularDegree E` (ARS Theorem 2.7);
- `maninConstant_optimalCurve_eq_one_of_isSemistable`: `E` semistable over `ℚ` (Tau Ceti
  `IsSemistable ℤ E`; squarefree conductor, EllipticCurves Layer 4) → `c = 1` — Česnavičius, *The Manin constant in the semistable case*
  (Compositio Math. 154 (2018), 1889–1920); its local form, `p² ∤ N → p ∤ c`, is the statement
  `padicValRat p (maninConstant E) = 0`, which for odd `p` is §3.7's and which Česnavičius
  extends to `p = 2`;
- `ManinConjecture : Prop := ∀ E, IsX0Optimal E → maninConstant E = 1` (Manin 1972, §5; ARS
  Conjecture 2.1), stated and not asserted.

The per-curve verification is a certificate: since `c ∈ ℤ_{>0}` (§3.7 through 4.4) and
`c² = covol Λ_E / covol Λ_f` (4.4), `c = 1 ↔ covol Λ_f > covol Λ_E / 4`, so a rational lower
bound `q < covol Λ_f` with `q ≥ covol Λ_E / 4`, together with the exact `covol Λ_E`, proves `c = 1`
(`maninConstant_optimalCurve_eq_one_of_covolume_lt`). This is Cremona's method (ARS §5): the
periods of `f` are computed from modular symbols to a stated precision, and the lattice of `E` from the AGM
(EllipticIntegrals Milestone 8, a consumer-side method and not an input here).

*Rests on:* 4.4, 4.6; GrossZagierAndArithmeticHeights §§3.7–3.8; EllipticCurves Layer 4
(semistability, the conductor).

**Checks.**

- `11a1` and `37a1` are optimal and semistable (conductors `11`, `37`), and `maninConstant = 1`
  for both, as Česnavičius' theorem requires.
- `990h3` is optimal but not semistable (`9 ∣ 990`), and still `maninConstant 990h3 = 1`.
- Certificate on `11a1`: `covol Λ_E = 1.8515436 < 4 · covol Λ_f = 7.4061744`, so `c = 1`.
- The theorems concern the optimal curve only: `maninConstant 11a3 = 5` with `25 ∤ 4 · 11`, and
  `maninConstant 14a4 = maninConstant 27a3 = 3`; these curves are not optimal, so neither Mazur's
  theorem nor `ManinConjecture` is contradicted.

### 4.10 Stevens' theorem and Stevens' conjectures

- `stevensCurve E`, the **minimal curve** of the isogeny class of `E`: Stevens' theorem (Stevens,
  *Stickelberger elements and modular parametrizations of elliptic curves*, Theorem 2.3; in the form
  of Vatsal, Theorem 1.3) — in every isogeny class over `ℚ` there is a unique `E_min` such that for
  every `E'` in the class there is an **étale** isogeny `E_min → E'` (multiplier `α = 1`, 2.7),
  equivalently `Λ_{E_min} ⊆ Λ_{E'}` for every `E'`. The theorem is cited; its proof (Stevens §2)
  runs through the cyclic isogenies of the class and the behaviour of Néron differentials along
  them (2.7), and is not rebuilt here. `stevensCurve E` is presented as a reduced minimal model
  (`isReducedMinimal_stevensCurve`), so it is a function of the isogeny class
  (`stevensCurve_eq_of_isogeny`). API: `neronLattice_stevensCurve_le : Λ_{stevensCurve E} ≤ Λ_E`,
  `stevensCurve_isogenous`, `exists_isogeny_stevensCurve_neronMultiplier_eq_one` (the étale
  isogeny), and `etale_isogeny_unique` (two cyclic étale isogenies `E_min → E'` agree up to `±1`,
  Vatsal Remark 1.4). The characterization through the Faltings height is Layer 5's (5.5).
- **Stevens' Conjecture II** (`StevensConjectureII : Prop`): `stevensCurve E ≅ gamma1OptimalCurve E`
  — the `Γ₁(N)`-optimal curve is the minimal curve (Vatsal, Conjecture 1.9). Cited partial
  results, stated as theorems: for a class of semistable curves the étale isogeny
  `E_min → E₁` has degree a power of `2` (Vatsal, Theorem 1.10); for `ℓ ≥ 7` with `E[ℓ]`
  reducible and `E` ordinary at `ℓ`, the conjecture holds for the class (Vatsal, Theorem 1.11).
- **Stevens' Conjecture I** (`StevensConjectureI : Prop`): the **Manin–Stevens constant** — the
  scalar `c₁` with `φ₁^*ω_{E₁} = c₁ · 2πi f dτ` for the `Γ₁(N)`-parametrization `φ₁ : X₁(N) → E₁`
  of the `Γ₁(N)`-optimal curve, defined exactly as in 4.4 (`maninStevensConstant E`, a function
  of the isogeny class) — equals `1` for every `E₁`.

*Rests on:* 2.7, 4.3, 4.4.

**Checks.**

- Class `11a`: `E_min = 11a3 = X₁(11)`, so Conjecture II holds for it, and `E_min` is not the
  `X₀(11)`-optimal curve `11a1`; the étale isogeny `11a3 → 11a1` is the dual of `11a1 → 11a3`
  (multiplier `1`, degree `5`).
- Class `990h`: the minimal curve is `990h3`, which is also `X₀(990)`-optimal.
- Classes `14a`, `27a`: the minimal curves are `14a4` and `27a3`, while the optimal curves are
  `14a1` and `27a1` (Worked examples).

### 4.11 Optimality and the integer invariants of the parametrization

The predicate `IsX0Optimal` (4.2), the theorem that each isogeny class over `ℚ` has exactly one
`X₀(N)`-optimal curve up to isomorphism (4.2), the predicate `IsGamma1Optimal` (4.3), and the
integer-valued invariants `modularDegree` (4.6) and `maninConstant` (4.4–4.5, an integer by
GrossZagierAndArithmeticHeights §3.7), each a function of the `ℚ`-isomorphism class. Cremona's
convention that the optimal curve is listed first in its class, the index of a curve within its
class, the single class in which the first-listed curve is not the optimal one, and the
correctness of a stored table's optimality flags are not targets. The knowl `ec.q.optimal`'s statement that
"the first curve in each class is optimal" is, in this roadmap's terms, the assertion
`IsX0Optimal (curve numbered 1)`, a fact about a list and not about a curve.

*Rests on:* 4.2, 4.3, 4.4, 4.6.

### 4.12 Rationality of `L(E, 1)/Ω_E` in analytic rank `0`

`leadingCoefficient_div_globalPeriod_mem_rat`: for `E/ℚ` with the entire continuation of 3.3 and
`analyticRank E = 0`, `L(E, 1)/globalPeriod E ∈ ℚ` (`globalPeriod E = realPeriod` over `ℚ`, 2.5); hence `analyticShaOrder E ∈ ℚ` (the other
factors are rational), the knowl `ec.analytic_sha_order`'s rank-`0` rationality. Proof:
`L(f, 1) = −2πi ∫_0^{i∞} f(τ) dτ`, the period of the symbol `{0, ∞}` (the Mellin formula of
ModularSymbolsPadicLFunctions §1.2 at `s = 1`, with `L(E, s) = L(f, s)` by R29.4); by the
Manin–Drinfeld theorem (ModularSymbolsPadicLFunctions §0.8; Cremona Theorem 2.1.3) `{0, ∞}` is a
rational multiple of an integral cycle, so `L(f, 1) ∈ ℚ · Λ_f`; `L(f,1)` is real, so it lies in
`ℚ · (Λ_f ∩ ℝ) = ℚ · leastPositiveRealPeriod Λ_f`; and `Λ_E = c Λ_f` with `c ∈ ℚ` (4.4) for the
optimal curve, `Λ_{E'} ⊇ α Λ_E` with finite index for the others (2.7), so `Λ_f ∩ ℝ` and
`Λ_{E'} ∩ ℝ` are commensurable. Cremona's formula (2.8.10), `L(f,1)/Ω(f) = n(p,f)/(2(1 + p − a_p))`
for any good prime `p`, is the effective form and a consumer's check. The rank-`1` rationality
(Gross–Zagier) is not here.

*Rests on:* 1.6, 2.6, 2.7, 3.4, 4.1, 4.4; ModularSymbolsPadicLFunctions §§0.8, 1.2;
EllipticCurveModularity R29.4.

## Layer 5: lattice formulas for the Faltings height, and the Faltings ratio

Base: `K` a number field, `E/K` elliptic, `h_Fal(E/K) = AbelianVariety.faltingsHeight` and
`h_st(E) = AbelianVariety.stableFaltingsHeight` of
[ArakelovGeometryAndAbelianHeights](../ArakelovGeometryAndAbelianHeights/README.md) §§3.1, 3.4, in
Faltings' normalisation (`‖α‖² = (i/2)∫ α ∧ ᾱ`, §2.7). This layer defines nothing called a
Faltings height; it proves that the Arakelov roadmap's heights are given by explicit formulas in
the discriminant and the period lattices, and builds the two table invariants on those formulas.

### 5.1 Over `ℚ`: `h_Fal(E) = −½ log covol Λ_E`

`faltingsHeightLattice_eq_neronLattice : h_Fal(E/ℚ) = −(1/2) · Real.log (covol (neronLattice E))`.
Proof: the Arakelov roadmap's `faltingsHeight_eq` with `α = ω_E`, the differential of the reduced
minimal model, which generates the `ℤ`-module of Néron differentials (its §2.9's Néron
differential lattice is `ℤ · ω_min`, EllipticCurves 4.5b), so `log #(ω̄/ℤ ω_E) = 0`; and
`‖ω_E‖² = covol Λ_E` (§§2.1–2.2 through 1.4). This is the knowl `ec.q.faltings_height`. Check:
`11a1`, `covol = 1.8515436`, `h = −0.3080098`; the Arakelov roadmap's own check
`faltingsHeight_11a2` is the same number for the same curve (`11.a2 = 11a1`).

*Rests on:* 1.4, 2.6; ArakelovGeometryAndAbelianHeights §§2.1–2.2, 2.9, 3.1; EllipticCurves 4.5b.

### 5.2 Over `K`: the formula for an arbitrary equation

For every elliptic `W : WeierstrassCurve K`:

`faltingsHeightLattice W : ℝ := (1/[K:ℚ]) · ( −(1/12) log (|N_{K/ℚ} Δ_W| / N(𝔇_{E/K})) − (1/2) ∑_v mult(v) · log covol Λ_v(W) )`,

the sum over the infinite places with `mult(v) = 1, 2` (equivalently over all `[K:ℚ]` embeddings,
conjugate embeddings giving equal covolumes by 1.5). Theorems:

- `faltingsHeightLattice_smul : faltingsHeightLattice (C • W) = faltingsHeightLattice W`: the
  discriminant term changes by `+log |N u|` (`N Δ ↦ N(u)⁻¹² N Δ`) and the covolume term by
  `−(1/2) ∑_v mult(v) · 2 log |σ_v u| = −log |N u|` (1.3, Mathlib `prod_eq_abs_norm`);
- `faltingsHeightLattice_eq : AbelianVariety.faltingsHeight E = faltingsHeightLattice W`: the
  Arakelov roadmap's `faltingsHeight_eq` with `α = ω_W`, where the Néron differential lattice is
  `𝔲 · ω_W` for the integral ideal `𝔲` with `𝔲¹² = (Δ_W) 𝔇_{E/K}⁻¹` (at each prime, the local minimal
  equation is `C_𝔭 • W` with `u_𝔭`, and `v_𝔭(Δ_W) − v_𝔭(𝔇) = 12 v_𝔭(u_𝔭)`; EllipticCurves 4.5a's
  defect identity `(Δ W) = 𝔇 · 𝔍_W¹²` is the same statement, `𝔲 = 𝔍_W`), so
  `log #(ω̄/O_K ω_W) = −log N(𝔲) = −(1/12) log(|N Δ_W| / N 𝔇)`, and `‖ω_W‖²_v = covol Λ_v(W)`;
- agreement with §2.9's
  `12[K:ℚ] h = log N(𝔇) − ∑_σ log(|Δ(τ_σ)|(Im τ_σ)⁶) − 12[K:ℚ] log 2π`, through `Δ_W = g₂³ − 27g₃²`
  (1.2), `g₂³ − 27g₃²` of `ω₁(ℤ + τℤ)` equal to `ω₁⁻¹²(2π)¹²Δ(τ)` (GrothendieckPeriodConjecture's
  Eisenstein dictionary), and `covol = |ω₁|² Im τ`; the `(2π)¹²` of the lattice discriminant is
  exactly what cancels the `−12 log 2π`;
- `faltingsHeightLattice_eq_of_isGlobalMinimal`: for `W` globally minimal the first term is `0`
  and `h = −(1/(2[K:ℚ])) ∑_v mult(v) log covol Λ_v(W)`; over `ℚ` this is 5.1;
- the non-minimal check of the Arakelov roadmap (`faltingsHeight_model_nonexample`): for `27a3`,
  `y² + y = x³`, the model `y² = x³ + 16` has `|Δ| = 2¹² · 27` against `𝔇 = (27)`, so the first term
  is `−log 2`, while its lattice is `Λ_{27a3}/2` with covolume `covol Λ_{27a3}/4`, so the second
  term is `−½ log covol Λ_{27a3} + log 2`; the sum is `h(27a3) = −1.0464644`, and the naive
  `−½ log covol` of the non-minimal lattice is `h + log 2`.

*Rests on:* 1.2, 1.3, 1.5, 2.1; Tau Ceti `minimalDiscriminantIdeal`, `IsGlobalMinimal`;
EllipticCurves 4.5a; ArakelovGeometryAndAbelianHeights §§2.9, 3.1; GrothendieckPeriodConjecture
Layer 2.

### 5.3 The stable Faltings height through the denominator of `j`

`stableFaltingsHeightLattice W : ℝ := (1/[K:ℚ]) · ( (1/12)(log N(𝔧_E) − log |N_{K/ℚ} Δ_W|) − (1/2) ∑_v mult(v) log covol Λ_v(W) )`
with `𝔧_E` the denominator ideal of `j` (Pinned conventions; `jDenominatorIdeal W`, a
`K`-isomorphism invariant, `jDenominatorIdeal_smul`, dividing the minimal discriminant ideal,
`minimalDiscriminantIdeal_dvd_jDenominatorIdeal`). Theorems:

- `stableFaltingsHeightLattice_smul`: model independence, as in 5.2 (the `j`-term is a
  `ℚ`-isomorphism invariant);
- `stableFaltingsHeightLattice_eq : AbelianVariety.stableFaltingsHeight E = stableFaltingsHeightLattice W`:
  over an extension `L/K` where `E` is semistable (Arakelov §3.4 `stableFaltingsHeight` is `h(E_L/L)`),
  `𝔇_{E_L/L} = 𝔧_{E_L}`, since at a multiplicative prime the minimal discriminant has valuation
  `−v(j)` and at a good prime both are `0` (EllipticCurves Layer 4, Tate's algorithm), while
  `N_L(𝔧_{E_L}) = N_K(𝔧_E)^{[L:K]}`, `|N_L Δ_W| = |N_K Δ_W|^{[L:K]}`, and each infinite place of
  `K` splits into places of `L` of total multiplicity `[L:K] mult(v)` with the same lattice; 5.2 for
  `E_L/L` then gives the formula, which does not mention `L`;
- `stableFaltingsHeightLattice_le`: `h_st ≤ h` (since `𝔧_E ∣ 𝔇_{E/K}`: `−v(j) = v(Δ) − 3v(c₄) ≤ v(Δ)`
  at every prime), with equality iff `E` is semistable over `K` (`𝔧 = 𝔇`;
  `stableFaltingsHeightLattice_eq_iff`, against Tau Ceti's `IsSemistable (𝓞 K) W`), the Arakelov roadmap's
  `stableFaltingsHeight_le` and `stableFaltingsHeight_eq_of_semistable` made explicit;
- curves with the same `j` over `ℚ̄` have the same stable
  height (Arakelov `stableFaltingsHeight_congr_geometric`); check: `27a1` and `27a3` (`j = 0`) both
  `−1.3211174`, `27a2` and `27a4` (`j = −12288000`) both `−0.9549133`; `32a1` and `64a1`
  (`j = 1728`) both `−1.3105329`.

Over `ℚ` this is the knowl `ec.q.faltings_height`'s `h_stable = (1/12)(log denom(j) − log|Δ|) − ½ log A`.

*Rests on:* 5.2; EllipticCurves Layer 4; ArakelovGeometryAndAbelianHeights §3.4.

### 5.4 The change of the Faltings height along an isogeny

`faltingsHeight_isogeny : h_Fal(E'/K) − h_Fal(E/K) = (1/2) log (deg ψ) − (1/[K:ℚ]) log N(𝔞_ψ)` for
an isogeny `ψ : E → E'` over `K`, where `ψ^*ω̄_{E'} = 𝔞_ψ · ω̄_E` as lattices of Néron differentials
(`𝔞_ψ` an integral ideal dividing `(deg ψ)`). Proof: 2.7's `covol Λ'_v = |σ_v α|² covol Λ_v / deg ψ`
at each place together with 5.2 and the local relation between `α` and `𝔞_ψ`. Over `ℚ`:
`h(E') − h(E) = ½ log deg ψ − log α_ψ`, so an étale isogeny raises
the height by `½ log deg ψ` and one with `α = deg ψ` lowers it by the same amount; this is the
elliptic case of Faltings' isogeny lemma (Faltings 1983, Lemma 5) and of the Arakelov roadmap's
§2.3 norm law `‖ψ^*α‖² = deg ψ · ‖α‖²`.

*Rests on:* 2.7, 5.2; ArakelovGeometryAndAbelianHeights §2.3.

**Checks.**

- `11a1 → 11a2` (degree `5`, `α = 1`): `h(11a2) − h(11a1) = 0.4967091 − (−0.3080098)`, which is
  `+0.8047190 = ½ log 5`.
- `11a1 → 11a3` (degree `5`, `α = 5`): `h(11a3) − h(11a1) = −0.8047190 = ½ log 5 − log 5`.
- `27a1 → 27a2` and `990h3 → 990h1` (degree `3`, `α = 1`): `+0.5493061 = ½ log 3`; for `990h`,
  `1.4219024 − 0.8725963 = 0.5493061`.

### 5.5 Stevens' curve as the curve of least height; the Faltings ratio

- `faltingsHeightLattice_stevensCurve_le : h_Fal(stevensCurve E) ≤ h_Fal(E')` for every `E'` in the
  class, with equality iff `E' ≅ stevensCurve E`: `Λ_{E_min} ⊆ Λ_{E'}` (4.10) gives
  `covol Λ_{E_min} = [Λ_{E'} : Λ_{E_min}] · covol Λ_{E'} ≥ covol Λ_{E'}`, and `h = −½ log covol`
  (5.1). Conversely a curve of least height has the smallest lattice: this is the equivalence
  (1) ⇔ (3) of Vatsal's Theorem 1.3 and completes Stevens' theorem as the knowl `ec.q.faltings_ratio`
  states it ("the unique curve of minimal Faltings height").
- `faltingsRatio E : ℕ := AddSubgroup.relIndex Λ_{stevensCurve E} Λ_E` — the index of the Néron
  lattice of `E_min` in that of `E` — with `faltingsRatio_pos`, `faltingsRatio_eq_covolume_div`:
  `faltingsRatio E = covol Λ_{E_min} / covol Λ_E` (Mathlib `covolume_div_covolume_eq_relIndex'`),
  `faltingsRatio_eq_exp : faltingsRatio E = exp (2 (h_Fal(E) − h_Fal(E_min)))`, and
  `faltingsRatio_eq_one_iff : faltingsRatio E = 1 ↔ reducedMinimalModel E = stevensCurve E`. The
  LMFDB `faltings_ratio`; like the invariants of 4.11 it is a function of the `ℚ`-isomorphism
  class.
- Checks: class `11a`: `11a1 ↦ 5`, `11a2 ↦ 25`, `11a3 ↦ 1`; class `14a`: `14a1 ↦ 3`, `14a2 ↦ 6`,
  `14a3 ↦ 9`, `14a4 ↦ 1`, `14a5 ↦ 18`, `14a6 ↦ 2`; class `990h`: `990h1 ↦ 3`, `990h2 ↦ 6`,
  `990h3 ↦ 1`, `990h4 ↦ 2`; class `27a`: `27a1 ↦ 3`, `27a2 ↦ 9`, `27a3 ↦ 1`, `27a4 ↦ 3`.

*Rests on:* 2.6, 4.10, 5.1; Mathlib `ZLattice.covolume_div_covolume_eq_relIndex'`.

### 5.6 The height of the optimal curve through the Petersson norm

`faltingsHeight_optimal : h_Fal(E) = (1/2) log (modularDegree E) − log (2π · maninConstant E · ‖f‖)`
for `E` `X₀(N)`-optimal: 4.7 rewritten with 5.1. Check on `11a1`: `‖f‖² = 0.0469001`,
`−log(2π · 0.2165644) = −log 1.3607087 = −0.3080098`. Combined with 5.4 it gives the height of
every curve in the class from `‖f‖`, the modular degrees and the isogeny multipliers.

*Rests on:* 4.7, 5.1, 5.4.

## Explicit scope exclusions

- The uniformization `ℂ/Λ ≅ E(ℂ)`, elliptic functions, `η`, Legendre's relation, the period
  matrix and transcendence of periods: ModularCurvesPartII §1 and GrothendieckPeriodConjecture.
- The newform of `E`, `A_f`, the Hecke correspondences, the construction and degree of `φ` as a
  morphism, the analytic continuation and functional equation of `L(E, s)` over `ℚ`:
  EllipticCurveModularity and ModularCurvesPartII.
- Models, minimal discriminants, Tate's algorithm, Tamagawa numbers, torsion, rank, canonical
  heights, Selmer groups, `Ш`, Cassels' isogeny invariance and the BSD statement over `ℚ`:
  EllipticCurves.
- Any theorem about `L(E/K, s)` for `[K : ℚ] > 1` beyond `Re s > 3/2`; Gross–Zagier, Kolyvagin,
  the rank-`≤ 1` theorems, the parity conjecture, the rationality of `Ш_an` in rank `1`.
- Periods of newforms as signed modular-symbol functionals, integral periods, critical values of
  twists, `p`-adic `L`-functions: ModularSymbolsPadicLFunctions.
- The Faltings height of abelian varieties of dimension `> 1`, the Hodge line, Faltings' isogeny
  formula in general, the Northcott property for heights of abelian varieties:
  ArakelovGeometryAndAbelianHeights.
- The real period as a complete elliptic integral, the AGM and its convergence:
  EllipticIntegrals.
- The proofs of the cited theorems of 4.9 (Mazur, Abbes–Ullmo, Raynaud, ARS Theorem 2.7,
  Česnavičius), of Stevens' theorem and of ARS Theorem 2.1, which run through the integral models
  of `X₀(N)` over `ℤ_p` and the Hecke module `H₁(J₀(N), ℤ)`; the statements are theorems of
  Layer 4 with certificate-style proofs by citation. The integrality of `c_φ`, its odd semistable
  `p`-unit range and `c_φ ∣ 6 deg φ`: GrossZagierAndArithmeticHeights §§3.7–3.8.
- The modular degree as a value of the symmetric-square `L`-function at `s = 2`, Watkins'
  algorithm, and the degree conjecture (`deg φ ≪ N^{1+ε}`): not here; the lattice formula 4.7 is the
  only route to `deg φ` specified.
- The Cremona and LMFDB orderings of classes and of curves within a class, the `990h` exception,
  the `optimality` flag as a database column, and the certification of tables are not targets.
- Elliptic curves over function fields, the Manin constant over function fields, and
  modular parametrizations by Shimura curves (`Γ₀(N)` only here).

## Worked examples

All numbers are computed from the reduced minimal model to the precision shown; `Λ` denotes the
Néron lattice with its oriented basis, `covol` its covolume, `Ω` the real period, `h` the Faltings
height and `h_st` the stable one. LMFDB labels are given where the class has a single curve or the
correspondence is fixed above (`11.a1 = 11a2`, `11.a2 = 11a1`, `11.a3 = 11a3`); other curves are
named by Cremona label, since the within-class index is not a target.

### `11.a2 = 11a1`: `y² + y = x³ − x² − 10x − 20`

`Δ = −11⁵ = −161051 < 0`, so one real component (1.6) and `Λ = ℤ·2x ⊕ ℤ(x + yi)` with
`x = 0.6346047`, `y = 1.4588166`: basis `[1.2692093, 0.6346047 + 1.4588166 i]`. `Ω = 2x =
1.2692093 = leastPositiveRealPeriod` (2.2, 2.6); `covol = 2xy = 1.8515436` (2.6). `g₂ = 124/3`,
`g₃ = 2501/27` (1.1–1.2). Analytic rank `0`, `L(E, 1) = 0.2538419` (3.4); `#tors = 5`,
`∏ c_p = c_{11} = 5`, `Reg = 1`: `bsdFactor = 1.2692093 · 1 · 5 / 25 = 0.2538419` and
`analyticShaOrder = 1.0000000` (3.6), rational by 4.12 (`L(E,1)/Ω = 1/5`). `IsX0Optimal` (4.2),
`modularDegree = 1`, `maninConstant = 1` (4.4, 4.6); `‖f‖² = 0.0469001`, so
`deg φ · covol/(4π² ‖f‖²) = 1` (4.7).
`h = −½ log 1.8515436 = −0.3080098 = h_st` (semistable; 5.1, 5.3); `faltingsRatio = 5`,
`stevensCurve = 11a3` (5.5).

### `11.a1 = 11a2`: `y² + y = x³ − x² − 7820x − 263580`

`Δ = −11`, `Ω = 0.2538419`, `covol = 0.3703087 = covol(11a1)/5`; `#tors = 1`, `c_{11} = 1`,
`L(E,1) = 0.2538419` (the same `L`-function: isogenous curves), `analyticShaOrder = 0.2538419/0.2538419 = 1`.
Not optimal; the least isogeny `11a1 → 11a2` has degree `5` and multiplier `α = 1` (étale), so
`Λ_{11a1} ⊆ Λ_{11a2}` with index `5` (2.7), `maninConstant = 1 · 1 = 1`, `modularDegree = 5`
(4.5–4.6); `h = −0.3080098 + ½ log 5 = 0.4967091` (5.4); `faltingsRatio = 25`.

### `11.a3 = 11a3`: `y² + y = x³ − x²`

`Δ = −11`, `Ω = 6.3460465`, `covol = 9.2577181 = 5 · covol(11a1)`; `#tors = 5`, `c_{11} = 1`,
`analyticShaOrder = 0.2538419 · 25 / 6.3460465 = 1`. `11a1 → 11a3` has degree `5` and `α = 5`, so
`5Λ_{11a1} ⊆ Λ_{11a3} ⊆ Λ_{11a1}`, both of index `5`; `maninConstant = 5`, `modularDegree = 5`;
`h = −0.3080098 + ½ log 5 − log 5 = −1.1127288`; `faltingsRatio = 1`: `11a3 = X₁(11)` is the
`Γ₁(11)`-optimal curve (4.3) and Stevens' minimal curve (4.10, 5.5), and the étale isogeny
`11a3 → 11a1` of Stevens' theorem is the dual of `11a1 → 11a3`.

### `37.a1 = 37a1`: `y² + y = x³ − x`

`Δ = 37 > 0`: two real components, rectangular `Λ = ℤx ⊕ ℤ(yi)`, `x = 2.9934586`, `y = 2.4513894`;
`leastPositiveRealPeriod = x`, `Ω = 2x = 5.9869173`, `covol = xy = 7.3381327`; `g₂ = 4`, `g₃ = −1`
(`c₄ = 48`, `c₆ = −216`). Analytic rank `1`, `L'(E, 1) = 0.3059998` (3.4); `#tors = 1`, `c_{37} = 1`,
`Reg_NT = ĥ(P) = 0.0511114` for `P = (0, 0)`; `analyticShaOrder = 0.3059998/(5.9869173 · 0.0511114) =
1.0000000`. Optimal, `modularDegree = 2`, `maninConstant = 1` (R29.5's check: the quotient isogeny is
an isomorphism, the parametrization has degree `2`). `h = h_st = −0.9965422`; single-curve class,
`faltingsRatio = 1`.

### `389.a1 = 389a1` and `5077.a1 = 5077a1`

`389a1`, `y² + y = x³ + x² − 2x`: rank `2`, `L''(E,1)/2 = 0.7593165`, `Ω = 4.9804251`,
`Reg_NT = 0.1524602`, `#tors = 1`, `∏ c_p = 1`, `analyticShaOrder = 1.0000000`; `modularDegree = 40`;
`h = −0.7956417`. `5077a1`, `y² + y = x³ − 7x + 6`: rank `3`, `L'''(E,1)/6 = 1.7318499`,
`Ω = 4.1516880`, `Reg_NT = 0.4171436`, `analyticShaOrder = 1.0000000`; `modularDegree = 1984`
(Cremona §2.15.1, p. 48); `h = −0.5613901`. In both, `analyticShaOrder` is a real number computed
from a numerical continuation; no statement of this roadmap makes it an integer.

### Class `990h` (Cremona labels)

`990h3 = [1, −1, 1, −1568, −4669]` is the `X₀(990)`-optimal curve (4.2): `modularDegree = 1728`,
`maninConstant = 1`; `Δ = 235516723200 = 2¹⁸·3³·5²·11³ > 0`, two components,
`Λ = ℤ·0.4061982 ⊕ ℤ·0.4298675 i`, `Ω = 0.8123963`, `covol = 0.1746114`; rank `1`,
`L'(E,1) = 3.0762047`, `Reg_NT = 0.6310969`, `#tors = 6`, `∏ c_p = 216`:
`analyticShaOrder = 3.0762047 · 36/(0.8123963 · 0.6310969 · 216) = 1.0000000`. `h = 0.8725963`,
`h_st = h + (1/12) log(denom(j)/|Δ|) = h − (1/12) log 27 = 0.5979432` (`j = 15781142246787/8722841600`,
`denom(j) = 2¹⁸·5²·11³`, `|Δ|/denom(j) = 3³`; 5.3). `990h1 = [1, −1, 1, −96608, −11533373]` (`Δ = 2⁶·3⁹·5⁶·11`): `990h3 → 990h1` of degree `3`,
`α = 1`; `modularDegree = 5184 = 3 · 1728`, `maninConstant = 1`, `Ω = 0.2707988`, `#tors = 2`,
`∏ c_p = 24`, `Reg_NT = 1.8932907`, `analyticShaOrder = 1`; `h = 0.8725963 + ½ log 3 = 1.4219024`,
`h_st = 1.4219024 − (9/12) log 3 = 0.5979432` (`|Δ|/denom(j) = 3⁹` for `990h1`); the two stable
heights coincide although the `j`-invariants differ, because the `3`-isogeny raises `h` by `½ log 3`
and lowers the `j`-term by the same amount; 5.3 does not predict this and 5.4 does not forbid it.
`faltingsRatio`: `990h1 ↦ 3`, `990h2 ↦ 6`, `990h3 ↦ 1`, `990h4 ↦ 2`; the minimal
curve is the optimal one.

### Class `14a` and class `27a` (Cremona labels)

`14a1 = [1, 0, 1, 4, −6]`: optimal, `modularDegree = 1`, `Ω = 1.9813420`, `covol = 2.6262514`,
`#tors = 6`, `∏ c_p = 6`, `L(E,1) = 0.3302237`, `analyticShaOrder = 0.3302237 · 36/(1.9813420 · 6) = 1`;
`faltingsRatio = 3`; the minimal curve is `14a4 = [1, 0, 1, −1, 0]` (`covol = 7.8787542`,
`h = −1.0320849`, `maninConstant = 3`, `modularDegree = 3`). `14a6 = [1, 0, 1, −11, 12]` has
`Δ = 98 > 0`, two components, `Ω = 5.9440259 = Ω(14a4)` although `covol(14a6) = covol(14a4)/2`:
the real period and the covolume are different invariants (2.2 vs 2.6); `maninConstant = 3`,
`modularDegree = 6`, `faltingsRatio = 2`. Class `27a` (`j = 0` for `27a1, 27a3`; `j = −12288000`
for `27a2, 27a4`): `27a1 = [0, 0, 1, 0, −7]` optimal, `modularDegree = 1`, `Ω = 1.7666388`,
`covol = 2.7028761`, `h = −0.4971582`, `h_st = h − (9/12) log 3 = −1.3211174` (`Δ = −3⁹`, `denom(j) = 1`);
`27a3 = [0, 0, 1, 0, 0]` minimal, `covol = 8.1086283`, `h = −1.0464644`, `h_st = −1.3211174`,
`maninConstant = 3`, `modularDegree = 3`; `27a4 = [0, 0, 1, −30, 63]`: `covol = 2.7028761 = covol(27a1)`
but `Ω = 5.2999163 ≠ Ω(27a1)` (equal covolumes, different lattices), `modularDegree = 9`,
`maninConstant = 3`, `h_st = −0.9549133 = h_st(27a2)`. Faltings ratios `[3, 9, 1, 3]` for
`27a1, …, 27a4`.

### `32a1` and `64a1`: CM by `ℤ[i]` (Cremona labels)

`32a1 = y² = x³ + 4x`, `Δ = −2¹² < 0`: `Λ = ℤ·2x ⊕ ℤ(x + xi)` with `x = 1.3110288`, which is the
square lattice of side `x√2 = 1.8540747` turned by `45°` (so `y = x` in the shape theorem of 1.6), `Ω = 2.6220576 = Γ(1/4)²/(2√(2π))`, `covol = 2x² = 3.4375929`;
`L(E,1) = 0.6555144`, `#tors = 4`, `c_2 = 4`, `analyticShaOrder = 0.6555144 · 16/(2.6220576 · 4) = 1`;
optimal, `modularDegree = 1`. `64a1 = y² = x³ − 4x`, `Δ = +2¹²`: rectangular `Λ = ℤ x' ⊕ ℤ x'i`,
`x' = 1.8540747`, `Ω = 3.7081494`, `covol = x'² = 3.4375929 = covol(32a1)`: the two curves are
isomorphic over `ℚ(i)` and have the same `h = −0.6173857` and `h_st = h − log 2 = −1.3105329`
(`denom(j) = 1`, `|Δ| = 2¹²`; 5.3), but different real periods. `64a1` has `modularDegree = 2`.

### Base changes (ecnf)

- `11a1` over `K = ℚ(√5)` (`2.2.5.1`, `D_K = 5`): the equation is globally minimal over `𝓞_K`
  (`N_{K/ℚ}(Δ) = 11¹⁰ = N(𝔇_{E/K})`, prefactor `1`; 2.5). Both real places have `σ_v(Δ) < 0`, one
  component each, `Ω_v = 1.2692093` for both (`11a1` is defined over `ℚ`), `Ω(E/K) = 1.6108923`
  (2.4–2.5). `11` splits, `c_𝔭 = 5` at both primes above it, `∏ c_𝔭 = 25`; `#E(K)_tors = 5`; rank `0`
  (the twist `275b2` has rank `0`), `Reg_NT = 1`; `L(E/K, 1) = L(E, 1) · L(E^{(5)}, 1)`, which is
  `0.2538419 · 2.8380383 = 0.7204129`; `analyticShaOrder = √5 · 0.7204129 · 25/(1 · 1.6108923 · 25) = 1.0000000`
  (3.6).
- `32a1` over `K = ℚ(i)` (`2.0.4.1`, `|D_K| = 4`): one complex place. The equation `y² = x³ + 4x` is
  not minimal at `(1 + i)`: the globally minimal model is `y² = x³ − x` (`u = 1 + i`,
  `(1+i)¹² = −64`), `N(Δ) = 2²⁴`, `N(𝔇) = 2¹²`, prefactor `(2¹²)^{1/12} = 2` (2.5).
  `Λ_v(W) = Λ_{32a1}`, `covol = 3.4375929`, `Ω_v(W) = 2 · covol = 6.8751858` (2.3), so
  `Ω(E/K) = 2 · 6.8751858 = 13.7503716`; the same number from the minimal model directly: its lattice is the square lattice of
  side `2.6220576`, `covol = 6.8751858`, `Ω_v = 13.7503716`. `#E(K)_tors = 8`, `c_{(1+i)} = 4`,
  rank `0`, `Reg_NT = 1`; `L(E/K, s) = L(E, s)²` (the twist of `32a1` by `−1` is `32a1`), so
  `L(E/K, 1) = 0.6555144² = 0.4296991`;
  `analyticShaOrder = 2 · 0.4296991 · 64/(13.7503716 · 4) = 1.0000000`. With the covolume in place of `2 · covol` at the complex place the quotient would be `2`:
  the factor `2` in 2.3 is load-bearing.
- `11a1` over `K = ℚ(i)`: semistable, globally minimal, one complex place,
  `Ω(E/K) = 2 covol Λ_{11a1} = 3.7030872 ≠ Ω(11a1)² = 1.6108923` (2.5's base-change formula with
  `r_∞ = 0`, `c_∞ = 1`); `11` is inert, `c_{(11)} = 5`, `#E(K)_tors = 5`, rank `0`;
  `L(E/K, 1) = L(E, 1) · L(E^{(−1)}, 1) = 0.2538419 · 1.4588166 = 0.3703087` (`E^{(−1)} = 176b2`),
  and `analyticShaOrder = √4 · 0.3703087 · 25 / (3.7030872 · 5) = 1.0000000`; with `Ω(11a1)²` in place of `Ω(E/K)` the quotient would be
  `2.2989`, not an integer.

### Boundary checks

- `periodLattice_unique` has no lattice to return for `(g₂, g₃)` with `g₂³ = 27g₃²` (e.g. `(3, 1)`):
  no elliptic `W` has these invariants, and `exists_periodPair_periodLattice` requires `[W.IsElliptic]`.
- `IsContinuation` rejects `(U, F) = ({|s − 1| < 1/4}, 0)`: `U` misses the half-plane; and rejects
  `({Re s > 3/2}, W.LSeries)`: `1 ∉ U`. The pair `({Re s > 0}, F)` with `F` the continuation of
  R29.6 over `ℚ` is accepted.
- `realComponentCount` is `1` for `11a1` and `2` for `37a1`; the shape theorems of 1.6 give a
  basis `[2x, x + yi]` for the first and `[x, yi]` for the second, and `Ω = 2x` in both.
- `analyticShaOrder` is defined for `389a1` and `5077a1` without any rationality claim; `4.12`
  applies to neither (analytic rank `2`, `3`).
- `IsX0Optimal 11a3` is false (every map `X₀(11) → 11a3` has degree `5n²`), `IsGamma1Optimal 11a3`
  is true; `IsX0Optimal 11a1` is true and `IsGamma1Optimal 11a1` is false.
- The multiplier of `11a1 → 11a2` is `1 ≠ deg = 5`: the knowl's remark that the multiplier "may be
  strictly less than the degree" is this case; `maninConstant 11a2 = 1`, not `5`.
- `faltingsHeightLattice` on the non-minimal model `y² = x³ + 16` of `27a3` returns `−1.0464644`,
  while `−½ log covol` of that model's lattice is `−1.0464644 + log 2 = −0.3533172`: the
  discriminant prefactor of 5.2 is load-bearing.
- `congruenceModulus` and `modularDegree` differ for `54b1` (`6` versus `2`); the prime `3` has
  `3² ∣ 54`, as ARS Theorem 2.1 requires of any prime where they differ.

## Ordering

```
Layer 1 (period lattice of a complex equation)
   │
Layer 2 (local and global periods; Néron lattice; isogenies and lattices)
   ├──────────────────────────┬──────────────────────────────┐
Layer 3 (analytic BSD data)  Layer 4 (parametrization)     Layer 5.1–5.4 (height formulas)
   │                          │   4.1–4.2 → 4.4 → 4.5–4.7      │
   │                          │   4.8 ← 4.6;  4.9 ← 4.4, 4.6    │
   │                          │   4.3 → 4.10 ← 2.7             │
   │                          └── 4.10 ──────────────────────► 5.5 → 5.6 ← 4.7
   └── 4.12 ← 3.4, 4.1, 4.4
```

Layer 1 comes first and needs only Mathlib, ModularCurvesPartII §1 and GrothendieckPeriodConjecture
Layer 0. Layer 2 needs Layer 1 and the minimal-model library. Layers 3, 4 and 5.1–5.4 are
independent of one another once Layer 2 is in place and can proceed in parallel: Layer 3 needs
2.5, EllipticCurves Layers 2, 4, 6, 7 and PeriodsAndSpecialValues PS.1.1, PS.1.8; Layer 4 needs
2.6–2.7, EllipticCurveModularity R29.3–R29.6, ModularCurvesPartII §§7.2, 7.5–7.6, 14.12, 16.2
and GrossZagierAndArithmeticHeights §§3.5, 3.7–3.10, 3.12;
Layer 5 needs 2.6–2.7 and ArakelovGeometryAndAbelianHeights §§2–3. Milestones 4.12 (needs 3.4), 5.5
(needs 4.10) and 5.6 (needs 4.7) are the only cross-layer edges among the three.

## References

- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106, Springer, 2009: II.4.2
  (separability through differentials), III.1 (Weierstrass equations and `c₄, c₆, Δ`), VI.1–VI.5
  (elliptic functions and the uniformization theorem, VI.5.1), VII.1 (minimal equations), VIII.9
  (the canonical height), X.4 (Selmer and Shafarevich–Tate groups), C.16 (the
  Birch–Swinnerton-Dyer conjecture and the real period).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151, Springer,
  1994: Corollary V.2.3.1 (`E(ℝ)` is `S¹` or `S¹ × ℤ/2` according to the sign of `Δ`).
- J. E. Cremona, *Algorithms for Modular Elliptic Curves*, 2nd ed., Cambridge, 1997
  (`references/Cremona -- Algorithms for Modular Elliptic Curves.pdf`): §2.1.3 (real structure,
  p. 11), Theorem 2.1.3 (Manin–Drinfeld, p. 13), §§2.1.4–2.1.6 (modular symbols and homology,
  pp. 12–14), §2.8 (`Ω(f) = 2Ω₀(f)` or `Ω₀(f)`, p. 30; (2.8.10), `L(f,1)/Ω(f)`, p. 31), §2.10
  (lattice types 1 and 2, p. 34), §2.14 (`c₄ = 12g₂`, `c₆ = 216g₃`, p. 45), §2.15.1 and
  Proposition 2.15.1 (`4π²‖f‖² = deg(φ) Vol(E_f)`, pp. 47–48; `deg φ = 1984` for `5077a1`, p. 48).
- D. Zagier, *Modular parametrizations of elliptic curves*, Canad. Math. Bull. 28 (1985), 372–384
  (the degree formula through the Petersson norm; Theorem 3 there is the divisibility `m_E ∣ r_E`,
  attributed to Ribet, with the direction corrected in ARS below).
- A. Agashe, K. Ribet, W. Stein, *The Manin constant*, Pure Appl. Math. Q. 2 (2006), 617–636:
  Conjecture 2.1 (Manin), Theorem 2.3 (Mazur: `p ∣ c → p² ∣ 4N`), Theorem 2.4 (Raynaud),
  Theorem 2.5 (Abbes–Ullmo: `p ∣ c → p ∣ N`), Theorem 2.7, §5 (Cremona's verification algorithm).
- A. Agashe, K. Ribet, W. Stein, *The modular degree, congruence primes, and multiplicity one*, in
  *Number Theory, Analysis and Geometry: In Memory of Serge Lang*, Springer, 2012, 19–49: §2.1
  (definitions (i)–(ii) of `r_E`), Theorem 2.1 (`m_E ∣ r_E`; `ord_p(N) ≤ 1 → ord_p r_E = ord_p m_E`),
  Table 1 (`54b1`: `r_E = 6`, `m_E = 2`), Theorem 3.6.
- B. Mazur, *Rational isogenies of prime degree*, Invent. Math. 44 (1978), 129–162, Corollary 4.1.
- A. Abbes, E. Ullmo, *À propos de la conjecture de Manin pour les courbes elliptiques modulaires*,
  Compositio Math. 103 (1996), 269–286, Theorem A.
- K. Česnavičius, *The Manin constant in the semistable case*, Compositio Math. 154 (2018),
  1889–1920 (`c = 1` for semistable optimal curves).
- Y. I. Manin, *Parabolic points and zeta functions of modular curves*, Izv. Akad. Nauk SSSR
  Ser. Mat. 36 (1972), 19–66, §5 (the conjecture `c = 1`).
- G. Stevens, *Stickelberger elements and modular parametrizations of elliptic curves*,
  Invent. Math. 98 (1989), 75–106, Theorem 2.3 (the minimal curve), Conjectures I and II.
- V. Vatsal, *Multiplicative subgroups of `J₀(N)` and applications to elliptic curves*,
  J. Inst. Math. Jussieu 4 (2005), 281–316: Theorem 1.3 (Stevens' theorem in three equivalent
  forms), Remarks 1.4 and 1.8, Conjecture 1.9, Theorems 1.10–1.11.
- G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73
  (1983), 349–366, §3 (the Faltings height), Lemma 5 (the isogeny formula).
- P. Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*,
  Séminaire Bourbaki 616, Astérisque 121–122 (1985), 25–41 (the normalisation differing by
  `½ log π`, not used here).
- S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models*, Ergeb. Math. 21, Springer, 1990, §1.2
  (the Néron mapping property, used for the integrality of isogeny multipliers).
- LMFDB knowls `ec.q.period_lattice`, `ec.q.real_period`, `ec.period`, `ec.regulator`,
  `ec.analytic_sha_order`, `ec.bsdconjecture`, `ec.q.bsdconjecture`, `ec.special_value`,
  `ec.q.optimal`, `ec.q.modular_degree`, `ec.q.manin_constant`, `ec.q.faltings_height`,
  `ec.q.faltings_ratio` (the definitions formalized here, with the conventions pinned above).
