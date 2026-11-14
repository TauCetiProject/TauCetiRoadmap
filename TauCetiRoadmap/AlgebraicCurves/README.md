# Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch

**Summary.** Build the theory of algebraic function fields of one variable over an arbitrary
field `k`, and its dictionary with regular projective curves. The objects are places
(normalized discrete valuations of `F` trivial on `k`), divisors as finitely supported integer
functions on places, the class group, the Riemann–Roch spaces `L(D)` and their dimensions
`ℓ(D)`, the genus, Weil differentials and the canonical class. The end theorems are the
Riemann–Roch theorem, proved by Weil's repartition argument; its consequences (the
`deg D ≥ 2g − 1` regime, Clifford's theorem, Weierstrass gaps, finiteness of the class number
over a finite field); the Hurwitz genus formula for separable extensions; the behaviour of the
genus under constant-field extension, including its drop under inseparable constants; the
comparison of Weil and Kähler differentials with the residue theorem; the genus of elliptic,
hyperelliptic and smooth plane function fields; finiteness of the automorphism group in genus
at least two, with the Hurwitz bound `84(g − 1)`; and the anti-equivalence between function
fields and regular projective curves, with the comparison of the two Riemann–Roch theorems.

This README is the roadmap; every target and Check is required.
[Suggested.lean](Suggested.lean) is the acceptance test: it states, each admitted, the headline
theorems the pinned libraries do not prove, and its module docstring names the headlines that
the Tau Ceti pin already proves. Production modules import library mathematics, not a
roadmap's acceptance file.

## Scope and ownership

This roadmap owns general function-field places, divisors and `L(D)`, Weil differentials and
Riemann–Roch, ramification in extensions of function fields with the different and the
Hurwitz genus formula, constant-field extensions, the regular projective model of a function
field and the curve/function-field anti-equivalence. Most of this is implemented in Tau Ceti at
the pin under `TauCeti/FieldTheory/FunctionField/` and `TauCeti/AlgebraicGeometry/Curves/`; each
layer cites the pinned declarations by name and states the targets the pin does not prove.
[BelyiMaps](../BelyiMaps/README.md) consumes the pinned carriers `TauCeti.IsFunctionField`,
`TauCeti.Place` and `TauCeti.Divisor` and defines no parallel place, divisor or Riemann–Roch
theory.

**The route.** The development is function-field-first, following Stichtenoth: a curve is its
field of algebraic functions, places are normalized discrete valuations, and Riemann–Roch is
linear algebra over `k` inside the restricted product of copies of `F` indexed by the places
(Weil's repartitions), with no sheaves and no cohomology. This matches the pinned Mathlib,
which supplies valuations, Dedekind domains, `RatFunc` and Laurent series but no divisor on a
scheme and no coherent cohomology. The pinned Tau Ceti also carries the scheme side: Weil
divisors on schemes (`TauCeti.AlgebraicGeometry.SchemeWeilDivisor`,
`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`), finite-dimensional quasi-coherent
cohomology vanishing above degree one on a proper curve
(`TauCeti/AlgebraicGeometry/Curves/Cohomology.lean`) and the two-chart model of a function field
(`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/`). Layer 12 consumes those carriers: it is
where the function-field theory meets the scheme-theoretic one of
[JacobianChallenge](../JacobianChallenge/README.md) (scheme divisors, coherent cohomology,
Riemann–Roch in the form `χ(L) = deg L + 1 − g` with `g := dim H¹(X, 𝒪_X)`, Serre duality), by a
comparison contract instead of a second proof.

**Left to other roadmaps.**

- *Zeta functions and the arithmetic of curves over finite fields* (Stichtenoth Ch. 5:
  rationality, functional equation, Hasse–Weil): CurvesOverFiniteFields
  and FunctionFieldArithmetic, which consume this
  roadmap. The Riemann–Roch inputs they need (finiteness of `Cl⁰(F)` over a finite constant
  field, Stichtenoth Lemma 5.1.1 and Prop. 5.1.3, and the class-group bridge to Mathlib's
  `ClassGroup`) are §5.6 here.
- *Jacobians and abelian varieties*: [JacobianChallenge](../JacobianChallenge/README.md) constructs
  the Jacobian; here `Cl⁰(F)` is a plain abelian group.
- *Elliptic-curve arithmetic* (isogenies, torsion, heights, Mordell–Weil):
  [EllipticCurves](../EllipticCurves/README.md). Elliptic function fields appear here once, as
  the genus-one model class of §§10.1–10.3, with the compatibility statements EllipticCurves
  consumes.
- *Hyperelliptic arithmetic invariants* (Igusa invariants, minimal models, cluster pictures):
  HyperellipticCurves, which consumes §10.4 here.
- *Modular curves*: the moduli-theoretic theory is no part of this roadmap.
  [ModularForms](../ModularForms/README.md) builds the analytic quotient `Γ\ℍ*`, its genus and an
  analytic Riemann–Roch inside its own Layer 10 and consumes nothing from here.
- *The local ramification filtration* (upper numbering, Herbrand functions, Hasse–Arf) for
  completions with finite residue field: [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md)
  Layer 3; §8.9 states the boundary.
- *Moduli of stable curves* and the finiteness of automorphism groups of stable curves over a
  base: [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §4.15, which takes no
  input from this roadmap; §11.4 here proves the function-field statement over every field, under
  positive genus over the algebraic closure, without moduli.
- *The scheme forms of curve theory* (the affine-or-projective dichotomy, the genus of a proper
  curve under extension of the base field, Riemann–Hurwitz with the ramification divisor of
  `Ω_{X/Y}`, degrees of vector bundles on curves): SchemeAndStackFoundations Layer 3 (§§3.1–3.3),
  which takes no input from this roadmap and restates none of Layers 0–12. The function-field
  forms and their comparisons with the scheme side are here: the Cartier ramification divisor
  against the trace-dual different on the separable-residue branch (12B.0d), genus and divisor
  base change on the smooth model (§8.2 with 12B.0b), and the dictionary of 12A–12E.
  [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) also takes no input from this
  roadmap; the curve-specific degree theory it assigns here is the degree of places and divisors
  (§§0.4, 3.1) and its agreement with the degree of scheme Weil divisors (12D).

**Outside the roadmap.** Nonspecial-divisor refinements and Brill–Noether theory; generic
classicality of gap sequences and the Weierstrass-point theory of positive characteristic
(Hasse–Schmidt orders); the quantitative positive-characteristic automorphism bounds of
Roquette and Stichtenoth and the classification of curves with large automorphism groups;
singular plane curves through intersection theory (Bézout is not at the pin); the projective
`PSL₂(𝔽₇)` action on the Klein quartic and the full group `PGU₃(q)` of a Hermitian curve;
refinements of Castelnuovo's inequality beyond §8.11; the comparison with compact Riemann
surfaces over `ℂ`, which needs a GAGA development; zeta functions.

## Conventions

The standing setting is fields `k` and `F` with `[Field k] [Field F] [Algebra k F]` and the
function-field predicate `TauCeti.IsFunctionField k F` (some `x : F` is transcendental over `k`
with `F` finite over `k(x)`), passed explicitly as `(hF : TauCeti.IsFunctionField k F)`: it
supplies no canonical data, so it is not a typeclass. Two further hypotheses appear
constantly and are always explicit.

- **Exactness of the constant field**, spelled with Mathlib's `IsIntegrallyClosedIn k F`: every
  element of `F` algebraic over `k` lies in `k` (the literature's "`k` is the full constant
  field", Stichtenoth's standing assumption from §1.4 on). Equivalently
  `algebraicClosure k F = ⊥`. Layer 0 does not need it; from Layer 3 on statements carry it,
  since without it `ℓ(0) = [k̃ : k]` and degrees rescale. The constant field `k̃` is finite over
  `k`, and `F/k̃` has exact constants, so a consumer can always pass to the exact situation.
- **Perfectness and separability, where the mathematics needs them.** Never a blanket
  `[PerfectField k]`. Layers 0–5 are free of perfectness and of characteristic hypotheses
  (Stichtenoth Ch. 1 assumes nothing of `k`); Stichtenoth's chapter-wide "`k` perfect" in Ch. 3
  is consumed by far fewer results than it covers. Each hypothesis enters at its layer:
  separability of `F′/F` for the Hurwitz genus formula (§7.4; false without it); a smooth
  regular model for genus invariance under arbitrary constant extension (§8.2); a separating
  element for the one-dimensional Kähler module (§9.1); separable residue extensions for the
  completion charts and the residue transport (§9.2); perfect `k` for the trace-residue sum
  (§9.3) and for the Weil-divisor form of the elliptic differential (§10.3); positive genus over
  the algebraic closure for finiteness of automorphism groups (§11.4, automatic over perfect `k`);
  tameness for the Hurwitz bound (§11.5).

Generic separable generation plus exact constants is a **regular field extension**
(geometrically integral generic point), a weaker condition than smoothness of the regular
projective model: purely inseparable constants can drop the genus of a separably generated
field with exact constants (§8.5). Do not fix `k` finite, algebraically closed or of
characteristic zero in the general layers: consumers work over number fields (modular and
Shimura curves), finite fields and `ℂ`.

| object | convention | where |
|---|---|---|
| function field | `TauCeti.IsFunctionField k F : Prop`, intrinsic (no chosen generator). Comparisons with Mathlib's chosen-generator `FunctionField Fq F` and with `Algebra.trdeg k F = 1` under `Algebra.EssFiniteType k F` (finite generation as a field extension) are theorems | §0.1 |
| place | `TauCeti.Place k F`: a normalized discrete valuation `v : Valuation F ℤᵐ⁰`, surjective and trivial on `k`. Normalization makes place equality valuation equality; the valuation-ring view is a theorem | §0.3 |
| multiplicative vs additive | Mathlib's multiplicative convention: integers are `v ≤ 1`, a uniformizer has `v π = exp (−1)`; the additive order `ord_P : F → ℤ` has `ord_P π = 1` and junk value `0` at `0` | §0.3 |
| residue field and degree | `F_P := IsLocalRing.ResidueField 𝒪_P`; `deg P := Module.finrank k F_P`, with `Module.Finite k F_P` a theorem guarding `finrank`'s junk value | §0.4 |
| divisor | `TauCeti.Divisor k F`, finitely supported functions `Place k F → ℤ` with the pointwise order; effective means `0 ≤ D` | §3.1 |
| degree of a divisor | `deg D = ∑_P D(P) · deg P`. The unweighted sum `∑_P D(P)` agrees with it only when every place in the support is rational | §3.1 |
| principal divisor | `div f = ∑_P ord_P(f) · P` for `f ≠ 0`, an additive map from `Fˣ`; zero and pole divisors are its positive and negative parts | §3.1 |
| class group | `Cl(F) = Divisor ⧸ principal`, `Cl⁰(F)` the kernel of the degree on `Cl(F)`; bridges to Mathlib's `ClassGroup` of affine models are theorems, never a redefinition | §§3.2, 3.6 |
| Riemann–Roch space | `L(D) : Submodule k F`, `f = 0` or `div f + D ≥ 0`, equivalently `v_P f ≤ exp (D P)` at every place; `ℓ(D) := Module.finrank k L(D)`, finite by a theorem | §3.3 |
| genus | `TauCeti.genus k F := sSup` of `(deg D + 1 − ℓ(D)).toNat` over divisors `D` (Stichtenoth Def. 1.4.15), defined before Riemann–Roch; `ℓ(W) = g` and `deg W = 2g − 2` are theorems. Without exact constants the truncation `toNat` makes the value `0` where the true maximum is negative | §3.4 |
| repartitions | functions `a : Place k F → F` with `v_P(a P) ≤ 1` for all but finitely many `P` (entries in `F`, no completions); `A_F(D)` uses the multiplicative condition `v_P(a P) ≤ exp (D P)`, so `0 ∈ A_F(D)` for every `D` | §4.1 |
| Weil differential | a `k`-linear map `ω : A_F → k` vanishing on `A_F(D) + F` for some `D`; the divisor `(ω)` of `ω ≠ 0` is the largest such `D`; the canonical class is `W = [(ω)]` | §4.3 |
| differentials | Weil differentials are the formalism of record for the canonical class and the proof of Riemann–Roch; Mathlib's `KaehlerDifferential` enters in Layer 9, through a comparison isomorphism | Layers 4, 9 |
| extensions | the scalar tower `k → k′`, `k → F`, `k′ → F′`, `F → F′`, `k → F′` with `[IsScalarTower k k′ F′]` and `[IsScalarTower k F F′]`; `e(P′∣P)` with `ord_{P′} = e · ord_P` on `F`, `f(P′∣P) = [F′_{P′} : F_P]`. Degree formulas mixing `[F′ : F]` and `[k′ : k]` are cross-multiplied, never divided | §6.1 |
| the different | `Diff(F′/F) = ∑ d(P′∣P) · P′`, with `d(P′∣P)` the valuation of the trace-dual different (`differentIdeal`) at affine models, computed at every place by two charts | §7.1 |

**Notation.** `F⟮X⟯` is scoped notation for `RatFunc F` while `F⟮y⟯` is
`IntermediateField.adjoin F {y}`; both occur in this theory, so `RatFunc` is spelled out where
confusion is possible. Mathlib's `FunctionField Fq F` is an `abbrev` for
`FiniteDimensional (RatFunc Fq) F` relative to a chosen `Algebra (RatFunc Fq) F`; the intrinsic
predicate has its own name and a comparison theorem, never a redefinition.

## Exact supplier contracts

| Supplier | Interface used here | Boundary |
| --- | --- | --- |
| Mathlib at the pin | valuations and Dedekind domains, `RatFunc` with its places, ramification bookkeeping, the different ideal, Kähler differentials, transcendence degree, Weierstrass curves, scheme vocabulary | consumed by name below; what the pin lacks is built here in Mathlib's shape |
| Tau Ceti at the pin: `TauCeti/FieldTheory/FunctionField/`, `TauCeti/FieldTheory/Separable/`, `TauCeti/AlgebraicGeometry/Curves/`, `TauCeti/AlgebraicGeometry/WeilDivisor/` | the carriers `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.genus`, `TauCeti.constantCompositum`, the two-chart model and the scheme Weil divisors, and the theorems cited by name at each layer | the targets each layer states beyond the cited names are this roadmap's |
| [JacobianChallenge](../JacobianChallenge/README.md) Layers A–B and E–F | the sheaf `𝒪_X(D)`, coherent cohomology over `k`, `χ`-form Riemann–Roch and Serre duality (12E); abelian varieties, the Jacobian and the Abel–Jacobi map with its Albanese property (§11.4) | 12E is a comparison contract, not a second proof; the relative theory (cohomology and base change, Layer C) is no part of this roadmap |
| [FormalLaurentPuiseux](../FormalLaurentPuiseux/README.md) L1–L3 | coordinate substitutions, continuous Laurent derivations and the residue transformation in every characteristic | transported through the completion charts of §9.2 at places with finite separable residue extension |
| [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md) Layer 3 | Herbrand functions, the upper numbering and Hasse–Arf for complete discretely valued fields with finite residue field | used only for completions with finite residue field (§8.9); Hasse–Arf also needs an abelian Galois extension |

### From Mathlib

- **The chosen-generator predicate**, `Mathlib/NumberTheory/FunctionField.lean`:
  `FunctionField Fq F` (for an arbitrary field `Fq`, despite the file's framing),
  `functionField_iff`, `FunctionField.ringOfIntegers` with `IsDedekindDomain` under
  `[Algebra.IsSeparable (RatFunc Fq) F]`, `FunctionField.finiteDimensional_of_adjoin_transcendental`
  (any transcendental `y` has `F/Fq(y)` finite) and
  `FunctionField.finiteDimensional_of_constantExtension` (finiteness of the constant field). The
  infinity place is `RatFunc.inftyValuation`, `RatFunc.inftyValued` and
  `RatFunc.CompletionAtInfty` in `Mathlib/FieldTheory/RatFunc/Valuation.lean`.
- **The rational function field**, `Mathlib/FieldTheory/RatFunc/`: `num`/`denom`, `intDegree`,
  `RatFunc.inftyValuation` with `v_∞(f) = exp (intDegree f)` and the instances
  `Valuation.IsNontrivial` and `Valuation.IsTrivialOn`; `RatFunc.algEquivOfTranscendental`
  (`RatFunc K ≃ₐ[K] K(f)` for transcendental `f`); `Polynomial.idealX`;
  `RatFunc.finrank_eq_max_natDegree` (`[K(X) : K(f)] = max (natDegree f.num) (natDegree f.denom)`);
  `RatFunc.adjoin_X`; Lüroth's theorem (`Luroth.lean`). The relative algebraic closure
  `algebraicClosure k F` (`FieldTheory/AlgebraicClosure.lean`) and `IsIntegrallyClosedIn`
  (`RingTheory/IntegralClosure/IntegrallyClosed.lean`) are the constant-field vocabulary.
- **Ostrowski for `RatFunc`**, `Mathlib/NumberTheory/RatFunc/Ostrowski.lean`:
  `RatFunc.valuation_isEquiv_infty_or_adic`, every rank-one discrete valuation of `RatFunc K`
  trivial on `K` is equivalent to exactly one of `v_∞` and a `p(X)`-adic valuation, over an
  arbitrary field `K`. Layer 1 repackages it in place vocabulary.
- **The Dedekind substrate**, `Mathlib/RingTheory/DedekindDomain/`:
  `IsDedekindDomain.HeightOneSpectrum` with `intValuation`, `valuation`,
  `valuation_exists_uniformizer`, `valuation_surjective`, `eq_of_valuation_isEquiv_valuation`
  and `valuationSubringAtPrime` (`AdicValuation.lean`); `FractionalIdeal.count` with `count_mul`,
  `count_inv`, `count_zpow`, `count_finsuppProd`, `FractionalIdeal.finite_factors` and
  `finprod_heightOneSpectrum_factorization'` (`Factorization.lean`); `ClassGroup` with
  `ClassGroup.mk0` and `ClassGroup.equivPic` (`Mathlib/RingTheory/PicardGroup.lean`); S-integers
  (`SInteger.lean`); `IsIntegralClosure.isDedekindDomain` and
  `integralClosure.isFractionRing_of_finite_extension`;
  `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero` (`SelmerGroup.lean`).
- **Ramification bookkeeping**, `Mathlib/RingTheory/RamificationInertia/`: `Ideal.ramificationIdx`
  (the length of `S_q/pS_q` at a prime `q` of `S` over `p`) and `Ideal.inertiaDeg`, with the
  fundamental identity `Ideal.sum_ramification_inertia_eq_finrank` (`Basic.lean`:
  `∑_{q ∣ p} e · f = rank_R S` for a domain `R`, a finite flat `R`-algebra `S` and a prime `p`); the
  Galois action on `primesOver`, `Ideal.ramificationIdxIn`, `Ideal.inertiaDegIn` and
  `Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn` in
  `Mathlib/NumberTheory/RamificationInertia/Galois.lean`. The module
  `Mathlib/NumberTheory/RamificationInertia/Basic.lean`, with `Ideal.sum_ramification_inertia`
  stated for the older `Ideal.ramificationIdx'` and `Ideal.inertiaDeg'`, is deprecated at the pin
  and is not consumed. Reconciliation lemmas with the place invariants `e` and `f` are stated once,
  and consumers stay off the raw definitions.
- **The different ideal**, `Mathlib/RingTheory/DedekindDomain/Different.lean`:
  `Submodule.traceDual`, `FractionalIdeal.dual`, `differentIdeal` with `coeIdeal_differentIdeal`,
  the tower law `differentIdeal_eq_differentIdeal_mul_differentIdeal`, the conductor formula
  `conductor_mul_differentIdeal`, `pow_sub_one_dvd_differentIdeal` and `dvd_differentIdeal_iff`.
  The exact tame value `v_P(𝔡) = e − 1` is not there.
- **Kähler differentials**, `Mathlib/RingTheory/Kaehler/`: `KaehlerDifferential` with base
  change and localization, `KaehlerDifferential.polynomialEquiv`, the second fundamental sequence
  `KaehlerDifferential.exact_kerCotangentToTensor_mapBaseChange`,
  `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` (`RingTheory/Etale/Kaehler.lean`),
  `Algebra.Presentation.differentialsRelations`
  (`Mathlib/Algebra/Module/Presentation/Differentials.lean`), `Algebra.FormallyUnramified`,
  `Algebra.FormallyUnramified.iff_isSeparable` under `Algebra.EssFiniteType`,
  `Algebra.FormallySmooth.of_algebraicIndependent_of_isSeparable` and
  `exists_isTranscendenceBasis_and_isSeparable_of_perfectField`
  (`Mathlib/FieldTheory/SeparablyGenerated.lean`). `KaehlerDifferential` does not occur in
  `Mathlib/FieldTheory/`, so `dim_F Ω[F⁄k] = 1` is Tau Ceti's (§9.1).
- **Transcendence**, `Mathlib/RingTheory/AlgebraicIndependent/`: `Algebra.trdeg`, `trdeg_add_eq`,
  `Polynomial.trdeg_of_isDomain`, `exists_isTranscendenceBasis`, `Transcendental`;
  `Algebra.EssFiniteType` and `IntermediateField.fg_top_iff`.
- **Completions**: `IsDedekindDomain.HeightOneSpectrum.adicCompletion` and
  `adicCompletionIntegers`, `FiniteAdeleRing`, and the `X`-adic comparison with Laurent series
  (`Mathlib/RingTheory/LaurentSeries.lean`: `LaurentSeriesRingEquiv`, `powerSeriesAlgEquiv`,
  `coe_range_dense`). `CompletionAtInfty` carries no equivalence with `K((1/X))`, and
  `FiniteAdeleRing` no `A(D)` filtration.
- **Elliptic curves**, `Mathlib/AlgebraicGeometry/EllipticCurve/`: `WeierstrassCurve` with
  `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.Affine.CoordinateRing` (an `AdjoinRoot`, a
  domain, with no `IsDedekindDomain` instance), `WeierstrassCurve.Affine.FunctionField`
  (`Affine/Point.lean`), `WeierstrassCurve.Affine.Point.toClass` (injective), normal forms,
  `j`-invariants and reduction types (`Reduction.lean`).
- **Plane curves**: the `Polynomial.Bivariate` namespace (`R[X][Y]`, `evalEval`, `swap`), `MvPolynomial.IsHomogeneous`
  with `homogeneousComponent`, `Polynomial.resultant` and `Polynomial.discr`
  (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`), `AdjoinRoot`. No homogenization
  operator, Bézout theorem or intersection multiplicity.
- **Schemes** (Layer 12): `AlgebraicGeometry.Scheme.functionField`, `Spec`, `Proj` with properness
  over `Spec 𝒜₀` (`ProjectiveSpectrum/Proper.lean`), the valuative criterion, `IsProper`,
  `IsSeparated`, `LocallyOfFiniteType`, smooth morphisms of relative dimension `n`, the
  geometric properties of `Geometrically/`, `finite_appTop_of_universallyClosed`, `AlgebraicGeometry.Scheme.Modules`
  and `SheafOfModules.IsQuasicoherent`, the order of vanishing
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`) and algebraic cycles
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`).

### From Tau Ceti

The homes are `TauCeti/FieldTheory/FunctionField/` for Layers 0–11 (with subdirectories `Place/`,
`AffineModel/`, `Divisor/`, `RiemannRoch/`, `Repartition/`, `Consequences/`, `Different/`,
`ConstantExtension/`, `Differential/`, `Elliptic/`, `Hyperelliptic/`, `PlaneCurve/`,
`ArtinSchreier/`, `Hermitian/`, `Automorphism/`) and `TauCeti/AlgebraicGeometry/Curves/` for
Layer 12, next to JacobianChallenge's scheme-side carriers. The carriers consumed throughout:

- `TauCeti.IsFunctionField` (`TauCeti/FieldTheory/FunctionField/Basic.lean`), the intrinsic
  predicate of the conventions table;
- `TauCeti.Place` (`TauCeti/FieldTheory/FunctionField/Place/Basic.lean`) with its order
  function, valuation ring, residue field and degree;
- `TauCeti.Divisor`, its degree, `TauCeti.Divisor.principal` and the Riemann–Roch space
  (`TauCeti/FieldTheory/FunctionField/Divisor/`, `RiemannRoch/`);
- `TauCeti.genus` (`TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.lean`), Stichtenoth's
  definition as in the conventions table;
- `TauCeti.adeleFiltration`, `TauCeti.repartitionDualComponent` and the Weil-differential divisor
  `TauCeti.weilDifferentialDivisor` (`Repartition/`, `Differential/`);
- `TauCeti.constantCompositum` and `TauCeti.geometricDegree`
  (`TauCeti/FieldTheory/FunctionField/GeometricDegree.lean`);
- `TauCeti.Place.ramificationGroup` and `TauCeti.Place.IsTame` (`Different/`);
- `TauCeti.AlgebraicGeometry.twoChartModel` (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/`)
  and `TauCeti.AlgebraicGeometry.SchemeWeilDivisor`
  (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`).

New targets are stated on these carriers, through a comparison with any differently spelled
statement, never on a parallel copy. The pinned theorems each layer consumes are named in that
layer.

### From TauCetiRoadmap.JacobianChallenge

Layers A–B: the sheaf `𝒪_X(D)`, coherent cohomology over `k`, Riemann–Roch as
`χ(L) = deg L + 1 − g` with `g := dim H¹(X, 𝒪_X)`, and Serre duality, used by 12E only for a
separably generated `F/k` whose regular model is smooth, proper and geometrically connected.
Layers E–F: abelian varieties on Tau Ceti's `AbelianVariety`, the Jacobian `Jac X` and the
Abel–Jacobi map with its Albanese property, used by the route of §11.4.

### From TauCetiRoadmap.FormalLaurentPuiseux

L1–L3: formal coordinate substitutions, continuous derivations of Laurent series and the
transformation of residues under a change of uniformizer, in every characteristic. §9.2
transports them along its completion isomorphisms.

### From TauCetiRoadmap.LocalFieldsRamification

Layer 3: Herbrand functions and the upper numbering, and Hasse–Arf for finite abelian Galois
extensions of complete discretely valued fields with finite residue field. §8.9 uses them for
completions of function fields at places with finite residue field only.

## How to read the build

Layer 0 sets up function fields, their constant fields and their places; Layer 1 classifies the
places of the rational function field; Layer 2 identifies the places of a function field with
the height-one primes of two affine normalizations. Layer 3 builds divisors, the product
formula, `L(D)`, Riemann's theorem and the genus; Layer 4 builds repartitions and Weil
differentials and proves Riemann–Roch; Layer 5 derives its consequences and the local components
of Weil differentials. Layer 6 develops extensions of function fields without Riemann–Roch;
Layer 7 the different, the cotrace and the Hurwitz genus formula; Layer 8 constant-field
extensions, ramification groups and the inseparable pathologies. Layer 9 compares Weil with
Kähler differentials and proves the residue theorem; Layer 10 computes the model classes;
Layer 11 proves finiteness of automorphism groups and the Hurwitz bound; Layer 12 builds the
regular projective model, the anti-equivalence and the comparison with the scheme-theoretic
Riemann–Roch. Layers 0–1 are sequential; Layer 2 needs Layer 0 only; Layer 4 is the critical
path; Layer 6 needs Layers 0–3 and runs in parallel with Layers 4–5; Layer 7 needs Layers 4–6;
Layer 9's first section needs Layers 0–3 and its comparison Layer 7. Layer 8 and §12B.0
interleave item by item: §8.1 items 1–2 (Layer 0 only), then the early model of §12B.0 (Layers 0
and 2) with 12B.0a–b, then §8.1 item 3, then 12B.0c (after Layers 3–5) and §§8.2 and 8.5. Each
layer ends with its examples and its dependencies; a `*Needs:*` line lists what each target's
statement and route use, so that a target proved by another route is not blocked behind an
unrelated layer. The anchor `#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`
of the former Layer 8 heading is now
`#layer-8-constant-field-extensions-galois-ramification-and-inseparability`.

## Layer 0: function fields, constant fields, and places

Stichtenoth §§1.1, 1.3 and Appendix A. Chapter 1 of Stichtenoth carries no hypothesis on `k`
beyond being a field; exactness of the constants enters at §1.4, and this layer mirrors that.

### 0.1 The function-field predicate

The predicate is the pinned `TauCeti.IsFunctionField k F` (Stichtenoth Def. 1.1.1, which does not
require `k` exact). Prove that every transcendental `y : F` serves as the variable (Rem. 1.1.2,
from Mathlib's `FunctionField.finiteDimensional_of_adjoin_transcendental`); compare the predicate
with Mathlib's chosen-generator `FunctionField`. The transcendence-degree characterization is
pinned: `TauCeti.IsFunctionField k F` holds iff `Algebra.trdeg k F = 1` and
`Algebra.EssFiniteType k F`, equivalently `(⊤ : IntermediateField k F).FG` by
`IntermediateField.fg_top_iff` (the pinned `TauCeti.isFunctionField_iff_trdeg_eq_one`).
`Algebra.FiniteType k F` is not used: for a field it would force `F/k` algebraic by Zariski's
lemma. Prove stability under finite extension and under passage to the constant field `k̃`.
*Needs:* Tau Ceti `TauCeti.IsFunctionField` and `TauCeti.isFunctionField_iff_trdeg_eq_one`;
Mathlib `FunctionField.finiteDimensional_of_adjoin_transcendental`, `Algebra.trdeg`,
`Algebra.EssFiniteType`, `IntermediateField.fg_top_iff`.

**Checks.**

- `RatFunc k` over `k` satisfies the predicate with `x = X`, and also with `x = X² + 1`, where
  `[k(X) : k(X² + 1)] = 2`: a definition fixing the generator would accept only the first.
- `k(X, Y)` (two variables) has transcendence degree `2` and fails the predicate; an algebraic
  extension such as `ℚ(i)/ℚ` has transcendence degree `0` and fails it too.
- `RatFunc ℂ` over `ℝ` satisfies the predicate although `ℝ` is not its constant field: the
  predicate does not encode exactness.

### 0.2 The constant field and exactness

The constant field is `k̃ := algebraicClosure k F`, Mathlib's relative algebraic closure (an
`IntermediateField k F`, Stacks 09GI), consumed rather than rebuilt. Prove that it is finite over
`k` (Stichtenoth Cor. 1.1.16, from `FunctionField.finiteDimensional_of_constantExtension`); that
`IsIntegrallyClosedIn k F` is equivalent to every algebraic element of `F` lying in `k` and to
`algebraicClosure k F = ⊥`; and that `F/k̃` is a function field with exact constants, the
normalization device every later layer cites.
*Needs:* §0.1; Mathlib `algebraicClosure`, `IsIntegrallyClosedIn`,
`FunctionField.finiteDimensional_of_constantExtension`.

**Checks.**

- For `F = RatFunc ℂ` over `k = ℝ`, the constant field is `ℂ`, of degree `2` over `ℝ`, and
  `IsIntegrallyClosedIn ℝ (RatFunc ℂ)` fails.
- For `F = RatFunc k` over `k`, the constant field is `k` (Stichtenoth Prop. 1.2.1(d)).
- Over an algebraically closed `k` exactness is automatic (the pinned
  `TauCeti.isIntegrallyClosedIn_of_isAlgClosed`); a definition of exactness through a chosen
  generator would not see this.

### 0.3 Places, valuation rings and order functions

The places are the pinned `TauCeti.Place k F`: normalized valuations `F → ℤᵐ⁰`, surjective and
trivial on `k`. Build the valuation subring `𝒪_P` (Stichtenoth Def. 1.1.4: `k ⊊ 𝒪 ⊊ F` with
`z ∈ 𝒪` or `z⁻¹ ∈ 𝒪`), its local and valuation-ring instances, maximal ideal and uniformizers.
`𝒪_P` is a discrete valuation ring (`TauCeti.Place.instIsDiscreteValuationRing`; Thm. 1.1.6),
directly from surjectivity of a `ℤᵐ⁰`-valuation and Mathlib's
`Valuation.IsRankOneDiscrete` and `valuationSubring_isDiscreteValuationRing`. Define `ord_P` with
the multiplicative/additive translation lemma (Def. 1.1.12, strict triangle inequality
Lemma 1.1.11) and prove the correspondence place ↔ normalized discrete valuation ↔ valuation
ring (Def. 1.1.9, Thm. 1.1.13, including that valuation rings are maximal proper subrings).
*Needs:* §0.1; Tau Ceti `TauCeti.Place`; Mathlib `Valuation.IsRankOneDiscrete`,
`valuationSubring_isDiscreteValuationRing`.

**Checks.**

- At the place of `X` on `k(X)`, `ord(X) = 1`, `ord(X² + X) = 1`, `ord(1/X) = −1` and
  `ord(1) = 0`; in multiplicative form `v(X) = exp (−1)`. A sign-flipped translation lemma gives
  `ord(X) = −1`.
- The junk value: `ord_P(0) = 0`, so "`ord_P f ≥ 0` iff `f ∈ 𝒪_P`" is stated for `f ≠ 0` or in
  multiplicative form.
- Scaling a valuation by `2` (`ord ↦ 2 · ord`) gives an equivalent but non-surjective valuation,
  which is not a place: normalization is what makes place equality valuation equality.

### 0.4 Degrees of places and residue fields

The residue field is `F_P := IsLocalRing.ResidueField 𝒪_P` (Def. 1.1.14) and the degree is
`deg P = Module.finrank k F_P`. `Module.Finite k F_P` is the pinned
`TauCeti.Place.finiteDimensional_residueField`, and `1 ≤ deg P ≤ [F : k(x)]` for every `x` with
`ord_P x ≠ 0` (Prop. 1.1.15) the pinned `TauCeti.Place.one_le_degree_of_isFunctionField`; this fills the
Zariski-lemma gap of the pin, which has no `FiniteDimensional k (R ⧸ m)` of this shape. Define
rational places (`deg P = 1`; over algebraically closed `k` all places are rational,
Rem. 1.1.17) and the evaluation `f ↦ f(P) ∈ F_P` for `f ∈ 𝒪_P`.
*Needs:* §0.3; Tau Ceti `TauCeti.Place.finiteDimensional_residueField`,
`TauCeti.Place.one_le_degree_of_isFunctionField`; Mathlib `IsLocalRing.ResidueField`,
`Module.finrank`.

**Checks.**

- Over `ℚ`, the place of `X² + 1` on `ℚ(X)` has residue field `ℚ(i)` and degree `2`; with
  `x = X² + 1` the bound reads `2 ≤ [ℚ(X) : ℚ(X² + 1)] = 2`, so it is sharp.
- Over `ℂ`, every place of `ℂ(X)` has degree `1`.
- Without `Module.Finite k F_P`, `Module.finrank` would return its junk value `0` and
  `deg P ≥ 1` would fail; the finiteness theorem is what excludes it.

### 0.5 Existence, separation and weak approximation

Prove that every subring `k ⊆ R ⊆ F` with a proper nonzero ideal `I` lies in some `𝒪_P` with
`I ⊆ P` (Thm. 1.1.19, by Zorn); hence every `x ∈ F ∖ k̃` has a zero and a pole and `F` has a
place (Cor. 1.1.20); `k̃ = ⋂_P 𝒪_P`; distinct places give inequivalent valuations. **Weak
approximation**, equality form (Thm. 1.3.1; `TauCeti.Place.exists_forall_mem_ord_sub_eq`): for
pairwise distinct places `P₁, …, Pₙ`, elements `f₁, …, fₙ ∈ F` and integers `r₁, …, rₙ` there is
`f ∈ F` with `ord_{Pᵢ}(f − fᵢ) = rᵢ` for all `i`. Corollaries: every function field has
infinitely many places (Cor. 1.3.2; the pinned `TauCeti.Place.infinite`, from the function-field
predicate alone); `∑ ord_{Pᵢ}(x) · deg Pᵢ ≤ [F : k(x)]` over zeros of `x` (Prop. 1.3.3); finiteness
of zeros and poles (Cor. 1.3.4; `TauCeti.Place.finite_setOf_ord_ne_zero`).
*Needs:* §§0.2–0.4; Tau Ceti `TauCeti.Place.exists_forall_mem_ord_sub_eq`, `TauCeti.Place.infinite`,
`TauCeti.Place.finite_setOf_ord_ne_zero`; Mathlib `eq_of_valuation_isEquiv_valuation`.

**Checks.**

- On `k(X)` with places `P₀` (at `X`) and `P₁` (at `X − 1`), targets `f₁ = f₂ = 0` and orders
  `r₁ = 1`, `r₂ = 2`: `f = X(X − 1)²` works, and so does any `f · u` with `u` a unit at both.
- For `x = X² + 1` over `ℚ`, the only zero of `x` is the degree-`2` place, and
  `ord · deg = 1 · 2 = [ℚ(X) : ℚ(X² + 1)]`: equality in Prop. 1.3.3.
- Over the finite field `𝔽₂`, `𝔽₂(X)` has only three rational places but infinitely many places:
  the corollary counts places of all degrees.

### Examples

On `k(X)`: `deg P_∞ = 1`, `deg P_{p} = deg p` for monic irreducible `p`, `ord_∞(X) = −1`,
`ord_{P_X}(X) = 1`. Over `ℚ`, the place `P_{X²+1}` has residue field `ℚ(i)` and degree `2`, the
degree-weighting smoke test. For `F = RatFunc ℂ` over `ℝ` the constant field is `ℂ`.

### Dependencies

Mathlib relative algebraic closure, valuations and transcendence degree; Tau Ceti
`TauCeti.IsFunctionField` and `TauCeti.Place` with the theorems named above. Nothing of
Layers 1–12 is used.

## Layer 1: the rational function field

Stichtenoth §1.2. The base case of everything and the first acceptance suite.

### 1.1 The places of k(x)

For each monic irreducible `p ∈ k[X]` construct the place `P_p` from the `p`-adic valuation of
`k[X]`, with residue field `k[X]/(p)` and `deg P_p = natDegree p` (Prop. 1.2.1(a);
`TauCeti.Place.adicOfIrreducible`, `TauCeti.Place.degree_adicOfIrreducible`); the place at infinity
`P_∞` from `RatFunc.inftyValuation`, with `ord_∞ f = −intDegree f`, prime element `1/X` and
`deg P_∞ = 1` (Prop. 1.2.1(c); `TauCeti.Place.infty`, `TauCeti.Place.valuation_infty_apply`,
`TauCeti.Place.degree_infty`). Prove that these are all the places and pairwise distinct
(Thm. 1.2.2) by repackaging Mathlib's Ostrowski theorem `RatFunc.valuation_isEquiv_infty_or_adic`
as a bijection `Place k (RatFunc k) ≃ {monic irreducibles} ⊕ {∞}`, not by reproving it; the
rational places are `k ∪ {∞}` (Cor. 1.2.3).
*Needs:* Layer 0; Tau Ceti `TauCeti.Place.adicOfIrreducible`, `TauCeti.Place.infty` and their
degree lemmas; Mathlib `RatFunc.valuation_isEquiv_infty_or_adic`, `RatFunc.inftyValuation`.

**Checks.**

- Over `ℝ`, the places of `ℝ(X)` of degree `2` correspond to `X² + bX + c` with `b² < 4c`; a
  classification by roots in `ℝ` misses them.
- Over `𝔽₂`, the rational places are `P_X`, `P_{X+1}` and `P_∞`: exactly `3 = |𝔽₂| + 1`.
- `P_X` and `P_∞` are distinct although `X ↦ 1/X` exchanges them: the classification is of
  places, not of orbits under `Aut(k(X)/k)`.

### 1.2 Order functions on k(x)

Prove `ord_∞ f = −intDegree f` and that `ord_{P_p} f` is the multiplicity of `p` in `f`, as
computation lemmas connecting places with `RatFunc.num` and `RatFunc.denom`, consumed by every
later `k(x)` calculation. Lüroth's theorem (in Mathlib) classifies the subfields of `k(x)`. The
divisor-level identities on `ℙ¹` live in §3.5, after divisors exist.
*Needs:* §1.1; Mathlib `RatFunc.intDegree`, `RatFunc.num`, `RatFunc.denom`.

**Checks.**

- `f = (X² + 1)/X³` over `ℚ`: `ord_∞ f = 1`, `ord_{P_X} f = −3`, `ord_{P_{X²+1}} f = 1`, and
  `1 + (−3) + 1 · 2 = 0`, the product formula weighted by degrees.
- `ord_{P_p}(c) = 0` for `c ∈ kˣ` at every place.
- `ord_∞(X − a) = −1` for every `a ∈ k`, while `ord_∞(1/(X − a)) = 1`.

### Examples

Over `ℚ`, `f = X(X² + 1)` has `div f = P_X + P_{X²+1} − 3P_∞`, of degree `1 + 2 − 3 = 0`. Over `𝔽₂`,
`𝔽₂(X)` has three rational places and exactly one place of degree `2`, at `X² + X + 1`, the only
irreducible quadratic over `𝔽₂`.

### Dependencies

Layer 0; Mathlib `RatFunc` and its Ostrowski theorem; Tau Ceti's places of the rational function
field.

## Layer 2: affine models — the Dedekind bridge

Stichtenoth §3.2 (subrings and integral closures), placed early because the affine half of the
theory falls out of Mathlib's `DedekindDomain/Factorization.lean`.

### 2.1 Finite normalization

For `x ∈ F` transcendental over `k`, let `R_x` be the integral closure of `k[x]` in `F`. Prove,
in dependency order: `k[X]` is Japanese (or exactly its one-dimensional case); the normalization
of `k[X]` in every finite extension of `k(X)` is a finite `k[X]`-module, with no separability
hypothesis; it is Noetherian, integrally closed, of Krull dimension one, with fraction field
canonically `F`; hence it is Dedekind. Mathlib's `IsIntegralClosure.isDedekindDomain` and
`integralClosure.isFractionRing_of_finite_extension` cover the separable branch; the
finite-normalization theorem covers the purely inseparable one.
*Needs:* Layer 0; Mathlib `integralClosure`, `IsIntegralClosure.isDedekindDomain`,
`integralClosure.isFractionRing_of_finite_extension`, `IsDedekindDomain`.

**Checks.**

- For `F = k(X)` and `x = X`, `R_x = k[X]`.
- Over `ℚ`, for `y² = x³ − x`, `R_x = ℚ[x, y]/(y² − x³ + x)`, free of rank `2` over `ℚ[x]`.
- For `k = 𝔽_p(s)`, `F = k(y)` and `x = y^p`, `R_x = k[y]` is free of rank `p` over
  `k[x] = k[y^p]` and `F/k(x)` is purely inseparable: an argument through separable trace forms
  does not reach it.

### 2.2 Places and height-one primes

For a place `P`, prove `ord_P(x) ≥ 0 ↔ k[x] ⊆ 𝒪_P`; integrality then gives `R_x ⊆ 𝒪_P`. Contract
the maximal ideal of `𝒪_P` to a nonzero height-one prime `𝔭_P` of `R_x`, prove
`(R_x)_{𝔭_P} ≃+* 𝒪_P`, and prove that the normalized adic valuation of `𝔭_P` equals `P`'s valuation
(not merely an equivalent one). Conversely, extend the local valuation of
`𝔭 : HeightOneSpectrum R_x` to `F`, normalize it, and prove both constructions inverse. Package
the bijection `{P : Place k F | ord_P x ≥ 0} ≃ HeightOneSpectrum R_x` with the residue-field
equivalence, equality of residue degrees and the `ord_P`/`intValuation` coefficient formula.
*Needs:* §2.1; Mathlib `IsDedekindDomain.HeightOneSpectrum`, `intValuation`,
`valuationSubringAtPrime`.

**Checks.**

- On `k(X)` with `x = X`, the places with `ord ≥ 0` at `X` are all places but `P_∞`, matching the
  maximal ideals of `k[X]`.
- Over `ℚ`, the residue degree of `P_{X²+1}` equals `dim_ℚ ℚ[X]/(X² + 1) = 2`.
- The valuations agree on the nose: at `P_X`, both give `v(X) = exp (−1)`; an
  equivalence-only statement would allow `exp (−2)`.

### 2.3 Two-chart compatibility and holomorphy rings

Repeat §2.2 for `x⁻¹`, identify the common localization on the overlap, and prove that the two
normalized valuations agree there. The places with `ord_P x < 0` are exactly the primes of
`R_{1/x}` over the ideal `(x⁻¹)`, the places over `P_∞`; identify their local rings and residue
maps, and deduce finiteness of the pole fibre from the finite normalization fibre. The place set
is the compatible union of the two charts used by the divisor, ramification, different and
scheme layers. Holomorphy rings `𝒪_S = ⋂_{P∈S} 𝒪_P` (Stichtenoth Def. 3.2.2; the pinned
`TauCeti.holomorphyRing`) are then Mathlib's S-integers with the complementary index set: for `x`
with no pole in `S`, `𝒪_S = Set.integer T F` for `R = R_x` and `T` the height-one primes of `R_x`
whose places are not in `S`, since `Set.integer T F` imposes integrality exactly at the primes
outside `T` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`). Both directions are pinned for
every Dedekind affine model `R`: `TauCeti.holomorphyRing_eq_restrictScalars_integer` (for `S` a set
of places finite on `R`) and `Set.restrictScalars_integer_eq_holomorphyRing`, in
`TauCeti/FieldTheory/FunctionField/AffineModel/SInteger.lean`. The divisor-level bridge is §3.6.
*Needs:* §§2.1–2.2; Tau Ceti `TauCeti.holomorphyRing`,
`TauCeti.holomorphyRing_eq_restrictScalars_integer`, `Set.restrictScalars_integer_eq_holomorphyRing`;
Mathlib `IsLocalization`, `Set.integer`.

**Checks.**

- On `k(x)`, the prime `(x⁻¹ − 1)` of `k[x⁻¹]` lies on the infinity chart but has `ord_P x = 0`:
  it is not a pole of `x`.
- For `y² = x³ − x` over `ℚ` there is one place over `P_∞`, with `ord x = −2` and `ord y = −3`.
- For `y² = x⁴ + 1` over `ℚ`, `(y/x²)² = 1 + x⁻⁴` takes the value `1` at infinity, so there are
  two rational places over `P_∞`, each with `ord x = −1`: the pole fibre need not be one place.
- On `k(X)` with `x = X` and `S = {P_X}`, `𝒪_S = k[X]_(X)`, and `T` is every height-one prime of
  `k[X]` but `(X)`, so `Set.integer T = k[X]_(X)`; indexing by the primes of `S` itself would give
  `Set.integer {(X)} = k[X][1/X]`, the functions integral away from `P_X`.

### Examples

For `y² = x³ − x` over `ℚ`, the finite chart is `ℚ[x, y]/(y² − x³ + x)` and the infinity chart has
the single place at which `x/y` is a uniformizer. For `y² = x⁴ + 1` the infinity chart contains
two places.

### Dependencies

Layer 0; Mathlib Dedekind domains, integral closure and localization. Nothing of Layers 1 or
3–12 is used.

## Layer 3: divisors, L(D), Riemann's theorem, and the genus

Stichtenoth §1.4. From here on the hypothesis `IsIntegrallyClosedIn k F` is in force where a
statement needs it (Stichtenoth's standing assumption at the head of §1.4).

### 3.1 Divisors and principal divisors

Divisors are the pinned `TauCeti.Divisor k F` (Def. 1.4.1), with degree, support, partial order,
`⊔`, `⊓` and positive and negative parts. Using the finiteness of zeros and poles (§0.5), the
principal divisor map `Fˣ → Divisor k F` is `TauCeti.Divisor.principalHom`, with values
`TauCeti.Divisor.principal` and coefficients `ord_P f`; zero and pole divisors are
`(f)₀ = (div f)⁺` and `(f)_∞ = (div f)⁻` (Def. 1.4.2); prove `div f = 0 ↔ f ∈ kˣ` under exact
constants.
*Needs:* Layer 0; Tau Ceti `TauCeti.Divisor`, `TauCeti.Divisor.principalHom`,
`TauCeti.Divisor.principal`.

**Checks.**

- Over `ℚ`, `deg P_{X²+1} = 2`; the unweighted coefficient sum gives `1`.
- For `F = RatFunc ℂ` over `ℝ`, `div(i) = 0` although `i ∉ ℝ`: the equivalence
  `div f = 0 ↔ f ∈ kˣ` needs exact constants.
- `div(X · X⁻¹) = div X + div X⁻¹ = 0` on `k(X)`: the map is additive.

### 3.2 The product formula and the class group

The product formula `deg (div f) = 0` is the pinned `TauCeti.Divisor.degree_principal`, which needs
no exact-constants hypothesis; its route is `deg (f)₀ = deg (f)_∞ = [F : k(f)]` for nonconstant `f`
(Thm. 1.4.11). Define `Cl(F)` (Def. 1.4.3) and `Cl⁰(F)`, prove the exact sequence
`0 → Cl⁰(F) → Cl(F) → ℤ`, that linear equivalence preserves degree and `ℓ` (Cor. 1.4.12(a)), and
that a degree-zero divisor is principal iff `ℓ ≥ 1` iff `ℓ = 1` (Cor. 1.4.12(c)).
*Needs:* §3.1, §3.3 for the last statement; Tau Ceti `TauCeti.Divisor.degree_principal`.

**Checks.**

- On `k(X)`, `deg div(X) = 1 − 1 = 0`.
- On `RatFunc ℂ` over `ℝ` every place has degree `2` and `div X = P₀ − P_∞` has degree
  `2 − 2 = 0`: the product formula holds without exact constants.
- On `y² = x³ − x` over `ℚ`, with `O` the place at infinity and `P` the place of `(0, 0)`,
  `P − O` has degree `0` and `ℓ(P − O) = 0`, so it is not principal (otherwise `F` would be
  rational): `Cl⁰(F) ≠ 0`.

### 3.3 Riemann–Roch spaces

`L(D)` is the pinned Riemann–Roch space (Def. 1.4.4, Rem. 1.4.5). Prove `L(A) ≅ L(A′)` for
`A ∼ A′` (Lemma 1.4.6); `L(0) = k` under exact constants
(`TauCeti.riemannRochSpace_zero_of_isIntegrallyClosedIn`) and `L(D) = 0` for `deg D < 0`
(Lemma 1.4.7, Cor. 1.4.12(b)); monotonicity with `dim (L(D′)/L(D)) ≤ deg D′ − deg D` for
`D ≤ D′` (Lemma 1.4.8); finite-dimensionality for every constant field
(`TauCeti.finiteDimensional_riemannRochSpace`) and `ℓ(D) ≤ deg D⁺ + 1` under exact constants
(Prop. 1.4.9, Def. 1.4.10).
*Needs:* §3.1; Tau Ceti `TauCeti.riemannRochSpace_zero_of_isIntegrallyClosedIn`,
`TauCeti.finiteDimensional_riemannRochSpace`.

**Checks.**

- `ℓ(0) = 1` on `k(X)` over `k`, while `ℓ(0) = 2` for `RatFunc ℂ` over `ℝ`.
- `L(−P_∞) = 0` on `k(X)`: a nonzero polynomial cannot vanish at infinity.
- `ℓ(n · P_∞) = n + 1 = deg (n · P_∞) + 1` on `k(X)` for `n ≥ 0`: the bound of Prop. 1.4.9 is
  attained.

### 3.4 Riemann's theorem and the genus

The quantity `deg D − ℓ(D)` is bounded above (Prop. 1.4.14); the genus is the pinned
`TauCeti.genus k F` (Def. 1.4.15), with `g ≥ 0` (Cor. 1.4.16). **Riemann's theorem**
(Thm. 1.4.17): `ℓ(D) ≥ deg D + 1 − g` for every `D`, with equality for `deg D ≥ c` for some `c`
(`TauCeti.Divisor.degree_add_one_sub_genus_le_dim`,
`TauCeti.exists_forall_dim_eq_degree_add_one_sub_genus`). The index of specialty
`i(D) := ℓ(D) − deg D − 1 + g` is nonnegative and vanishes in large degree (Def. 1.5.1).
*Needs:* §3.3; Tau Ceti `TauCeti.genus`, `TauCeti.Divisor.degree_add_one_sub_genus_le_dim`,
`TauCeti.exists_forall_dim_eq_degree_add_one_sub_genus`.

**Checks.**

- `g(k(X)) = 0` (the pinned `TauCeti.genus_ratFunc`).
- For `y² = x³ − x` over `ℚ`, `g = 1` (§10.2 (i)), so `ℓ(n · O) = n` for `n ≥ 1`.
- For `RatFunc ℂ` over `ℝ` every divisor has even degree `2n` and `ℓ(n · P_∞) = 2(n + 1)` for
  `n ≥ 0`, so `deg D − ℓ(D) + 1 = −1`: the true maximum is `−1` and the pinned genus, truncated by
  `toNat`, is `0`. Statements about `g` carry exact constants.

### 3.5 The rational function field at divisor level

On the places of Layer 1: `div X = P_X − P_∞`; the pole divisor of a nonconstant `f` has degree
`max (natDegree f.num) (natDegree f.denom) = [k(X) : k(f)]` (Mathlib's
`RatFunc.finrank_eq_max_natDegree`); `∑_p deg p · ord_p(f) = intDegree f`; `L(n · P_∞)` is the
polynomials of degree at most `n`, so `ℓ(n · P_∞) = n + 1` for `n ≥ 0`, proved by hand before
Riemann–Roch; hence `g(k(X)) = 0` (Ex. 1.4.18; `TauCeti.genus_ratFunc`) and Riemann's inequality
is sharp for every `n`.
*Needs:* Layer 1, §§3.1–3.4; Mathlib `RatFunc.finrank_eq_max_natDegree`; Tau Ceti
`TauCeti.genus_ratFunc`.

**Checks.**

- `f = (X² + 1)/X`: `ord_∞ f = −1` and `ord_{P_X} f = −1`, so `deg (f)_∞ = 2 = max(2, 1)`.
- `L(2P_∞)` has basis `1, X, X²`, so `ℓ = 3`.
- `D = P_X − P_∞` is `div X`, of degree `0`; `L(D) = k · X⁻¹`, so `ℓ(D) = 1`, as Cor. 1.4.12(c)
  predicts for a principal divisor of degree zero.

### 3.6 The affine bridge at divisor level

Prove the group isomorphism `{D | supp D ⊆ finite chart} ≅ (FractionalIdeal R_x⁰ F)ˣ` through
`FractionalIdeal.count`, shaped like the Dedekind divisor group
`(FractionalIdeal R⁰ K)ˣ ≅ (HeightOneSpectrum R →₀ ℤ)`. The class-group bridge is pinned for every
Dedekind `R` in a scalar tower `k → R → F` with fraction field `F`: restriction to the finite
chart is `TauCeti.Divisor.restrict`; the surjection `π : Cl(F) → ClassGroup R` is
`TauCeti.Divisor.classGroupHom` with `TauCeti.Divisor.classGroupHom_surjective`; its kernel is
`TauCeti.Divisor.ker_classGroupHom`, the subgroup generated by the classes of the places at which
some element of `R` is not integral (generated by, not free on, those classes); the
single-place form is `TauCeti.Divisor.ker_classGroupHom_of_eq_singleton`; and for a single
rational place at infinity the degree-zero isomorphism `Cl⁰(F) ≅ ClassGroup R` is
`TauCeti.Divisor.degreeZeroClassGroupEquiv`.
*Needs:* Layer 2, §§3.1–3.2; Mathlib `FractionalIdeal.count`, `ClassGroup`; Tau Ceti
`TauCeti.Divisor.classGroupHom`, `TauCeti.Divisor.ker_classGroupHom`,
`TauCeti.Divisor.degreeZeroClassGroupEquiv`.

**Checks.**

- `R = k[X]` in `k(X)`: `ClassGroup k[X] = 0` and the kernel is generated by `[P_∞]`, which
  generates `Cl(k(X)) ≅ ℤ`.
- For `y² = x³ − x` over `ℚ` with its coordinate ring, the single rational place at infinity gives
  `Cl⁰(F) ≅ ClassGroup R`.
- For `y² = x⁴ + 1` over `ℚ` with places `∞₁` (where `y/x² → 1`) and `∞₂` at infinity,
  `(y − x²)(y + x²) = 1` and `div(y − x²) = 2∞₁ − 2∞₂`, so `2([∞₁] − [∞₂]) = 0`: the kernel is not
  free on the places at infinity.

### Examples

On `k(X)`: `ℓ(n · P_∞) = n + 1`, `g = 0`, `Cl⁰ = 0`. The exact-constants guard: `RatFunc ℂ` over
`ℝ` satisfies `TauCeti.IsFunctionField ℝ (RatFunc ℂ)` with `ℓ(0) = 2 ≠ 1`. For `y² = x³ − x` over
`ℚ`, `Cl⁰(F)` contains the class of `P − O`, which has order `2` (`div x = 2P − 2O`).

### Dependencies

Layers 0–2; Mathlib fractional ideals and class groups; Tau Ceti divisors, Riemann–Roch spaces,
the genus and the class-group bridge named above.

## Layer 4: repartitions, Weil differentials, and Riemann–Roch

Stichtenoth §1.5, the summit of the first half.

### 4.1 Repartitions and their filtration

Repartitions `A_F` are as in the conventions table (Def. 1.5.2; Stichtenoth calls them adeles):
entries in `F`, integral at all but finitely many places, no completions. The diagonal embeds
`F`; the filtration `A_F(D)` (Def. 1.5.3) uses the multiplicative condition
`v_P(a P) ≤ exp (D P)` at every place, as in the pinned `TauCeti.adeleFiltration`. Prove that
`A_F(D)` is a `k`-submodule containing `0`, monotone in `D`, that `A_F(D) + F` is a
`k`-submodule, and that `A_F` is the union of the `A_F(D)`.
*Needs:* Layer 3; Tau Ceti `TauCeti.adeleFiltration`; Mathlib `Filter.cofinite`.

**Checks.**

- For `D = −P_∞` on `k(X)`, the zero repartition lies in `A_F(D)`; the additive condition
  `ord_P(a P) ≥ −D(P)`, with the junk value `ord_P(0) = 0`, would demand `0 ≥ 1` at `P_∞` and
  exclude it.
- A nonzero `f ∈ F` gives the diagonal repartition `(f)_P`, integral away from the finitely many
  poles of `f`.
- `A_F(0) ≤ A_F(P_∞)` on `k(X)`, and the repartition equal to `1/X` at `P_X` and `0` elsewhere lies
  in `A_F(P_X)` but not in `A_F(0)`.

### 4.2 The local-to-global quotient engine

For a place `P` and integers `a ≤ b`, use a uniformizer filtration to prove
`dim_k (𝔪_P^a / 𝔪_P^b) = (b − a) · deg P` (fractional powers taken inside `F`). For `D ≤ E`,
identify `A_F(E)/A_F(D)` with the direct sum over `supp(E − D)` of these local quotients, so
`dim_k (A_F(E)/A_F(D)) = deg E − deg D`. Prove `F ∩ A_F(D) = L(D)`, the exact sequence relating
`L(E)/L(D)`, `A_F(E)/A_F(D)` and the cokernels of `A_F(D) + F → A_F` and `A_F(E) + F → A_F`, the
finite-dimensionality of those cokernels, and then
`i(D) = dim_k (A_F ⧸ (A_F(D) + F))` (Thm. 1.5.4) and `g = dim_k (A_F ⧸ (A_F(0) + F))`
(Cor. 1.5.5).
*Needs:* §4.1, §3.4.

**Checks.**

- Over `ℚ`, `dim_ℚ (A_F(P)/A_F(0)) = 2` for `P = P_{X²+1}`, the degree of `P`.
- On `k(X)`, `g = 0` says `A_F = A_F(0) + F`: every repartition is a rational function up to
  integral corrections, the partial-fraction decomposition.
- `F ∩ A_F(n · P_∞)` on `k(X)` is the polynomials of degree at most `n`, of dimension `n + 1`.

### 4.3 Weil differentials and the canonical class

Weil differentials `Ω_F` are as in the conventions table (Def. 1.5.6). Prove
`dim_k Ω_F(A) = i(A)` (Lemma 1.5.7, so `Ω_F ≠ 0`); the `F`-action (Def. 1.5.8);
`dim_F Ω_F = 1` (Prop. 1.5.9); the existence of the divisor `(ω)` of `ω ≠ 0` (Lemma 1.5.10,
Def. 1.5.11), regular differentials and `dim Ω_F(0) = g` (Rem. 1.5.12); `(f · ω) = div f + (ω)`
and that any two canonical divisors are equivalent (Prop. 1.5.13), so the canonical class
`W ∈ Cl(F)` is well defined. The divisor of a Weil differential is the pinned
`TauCeti.weilDifferentialDivisor`.
*Needs:* §4.2; Tau Ceti `TauCeti.weilDifferentialDivisor`.

**Checks.**

- On `k(X)` there is a Weil differential `η` with `(η) = −2P_∞`, of degree `−2 = 2g − 2`.
- `(X · η) = div X + (η) = P_X − 3P_∞`.
- `dim_k Ω_F(0) = g`: it is `0` on `k(X)` and `1` on `y² = x³ − x` over `ℚ`.

### 4.4 Duality and the Riemann–Roch theorem

The duality theorem `L(W − D) ≅ Ω_F(D)`, `x ↦ x · ω`, gives `i(D) = ℓ(W − D)` (Thm. 1.5.14).
**The Riemann–Roch theorem** (Thm. 1.5.15), with no hypothesis beyond exact constants (no
perfectness, no separability): `ℓ(D) = deg D + 1 − g + ℓ(W − D)` for every divisor `D`, with `W`
the divisor of a nonzero Weil differential (the pinned
`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`, with
`TauCeti.degree_weilDifferentialDivisor` and `TauCeti.dim_weilDifferentialDivisor`). Corollaries:
`ℓ(W) = g` and `deg W = 2g − 2` (Cor. 1.5.16); a divisor with `deg D = 2g − 2` and `ℓ(D) ≥ g` is
canonical (Prop. 1.6.2); if `(g₀, W₀)` satisfies the Riemann–Roch identity for every `D` then
`g₀ = g` and `W₀` is canonical (Prop. 1.6.1).
*Needs:* §4.3; Tau Ceti `TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`,
`TauCeti.degree_weilDifferentialDivisor`, `TauCeti.dim_weilDifferentialDivisor`.

**Checks.**

- On `k(X)` with `W = −2P_∞` and `D = n · P_∞`, `n ≥ −1`: `ℓ(D) = n + 1 = n + 1 − 0 + ℓ(−(n + 2)P_∞)`,
  the last term `0`; at `n = −2`, `0 = −2 + 1 + ℓ(0) = 0`.
- In genus `1`, `W ∼ 0`: `ℓ(W) = 1 = g` and `deg W = 0 = 2g − 2`.
- `W₀ = 0` on `k(X)` fails the identity at `D = 0`: `ℓ(0) = 1`, while `0 + 1 − 0 + ℓ(0) = 2`; this
  is the uniqueness statement excluding a non-canonical candidate.

### Examples

Riemann–Roch on `ℙ¹`: `W = −2P_∞`, `deg W = −2`, `ℓ(W) = 0 = g`, and `D = n · P_∞` gives `n + 1`
both by hand (§3.5) and from the identity. In genus one, `ℓ(D) = deg D` for every `D` of positive
degree.

### Dependencies

Layer 3; Tau Ceti repartitions, Weil differentials and Riemann–Roch named above; Mathlib
`Filter.cofinite`. No completion, sheaf or cohomology is used.

## Layer 5: consequences of Riemann–Roch, and local components

Stichtenoth §§1.6–1.7.

### 5.1 The regime deg D ≥ 2g − 1 and genus one

`ℓ(D) = deg D + 1 − g` for `deg D ≥ 2g − 1` is the pinned
`TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree` (Thm. 1.5.17), sharp at
`W`. Genus one: `ℓ(D) = deg D` for every divisor of positive degree on a genus-one function field
with exact constants (`TauCeti.Divisor.dim_eq_degree_of_genus_eq_one`), in particular
`ℓ(n · [0]) = n` for a rational place `[0]` and `n ≥ 1`, the ladder every Weierstrass-model
argument uses. Non-special divisors (Def. 1.6.10, Rem. 1.6.11); every `P` and `n ≥ 2g` admit `x`
with `(x)_∞ = n · P` (Prop. 1.6.6); an effective non-special divisor of degree `g` supported on a
given set of at least `g` rational places (Prop. 1.6.12).
*Needs:* Layer 4; Tau Ceti
`TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`,
`TauCeti.Divisor.dim_eq_degree_of_genus_eq_one`.

**Checks.**

- `ℓ(W) = g ≠ g − 1 = deg W + 1 − g`: the bound `2g − 1` cannot be lowered.
- In genus one, `ℓ(0) = 1 ≠ 0`: the ladder starts at `n = 1`.
- On `y² = x³ − x` with `O` at infinity, `(x)_∞ = 2O` and `(y)_∞ = 3O`, the instances `n = 2, 3` of
  Prop. 1.6.6.

### 5.2 Genus zero

That `g = 0` together with a divisor of degree `1` is equivalent to `F` rational is pinned
(Prop. 1.6.3; forward `TauCeti.nonempty_algEquiv_ratFunc_of_genus_eq_zero_of_divisor_degree_eq_one`,
backward `TauCeti.genus_eq_zero_of_adjoin_eq_top`); the hypothesis is a degree-one divisor, from
which Riemann–Roch produces the rational place. Genus `0` alone does not force rationality
(Rem. 1.6.4).
*Needs:* §5.1; Tau Ceti
`TauCeti.nonempty_algEquiv_ratFunc_of_genus_eq_zero_of_divisor_degree_eq_one`,
`TauCeti.genus_eq_zero_of_adjoin_eq_top`.

**Checks.**

- The conic `x² + y² = −1` over `ℝ` has genus `0`, exact constants and only places of even
  degree, so no divisor of degree `1`; it is not rational.
- Over a finite field every genus-zero function field has a divisor of degree one (Rem. 1.6.4), so
  it is rational.
- `k(X)` has genus `0` and the rational place `P_∞`.

### 5.3 Strong approximation

For a proper subset `S` of the places, places `P₁, …, P_r ∈ S`, elements `x₁, …, x_r` and integers
`n₁, …, n_r`, there is `x` with `ord_{Pᵢ}(x − xᵢ) = nᵢ` and `ord_P x ≥ 0` at every other place of
`S` (Thm. 1.6.5; `TauCeti.Place.exists_forall_mem_ord_sub_eq_and_forall_mem_integers`). It is
proved from Riemann–Roch, which is why it is here and not in Layer 0.
*Needs:* §5.1; Tau Ceti `TauCeti.Place.exists_forall_mem_ord_sub_eq_and_forall_mem_integers`.

**Checks.**

- With `S` all places of `k(X)` and the single condition `ord_{P_X}(x) = 1`, `x` would be regular
  everywhere, hence constant, with order `0` or `∞`: properness of `S` is necessary.
- With `S` all places but `P_∞` and the same condition, `x = X` works.
- On `y² = x³ − x` with `S` all places but `O`, a function with a simple pole at a rational
  `P ≠ O` and regular elsewhere in `S` exists in `L(P + 2O)`, of dimension `3`.

### 5.4 Weierstrass gaps

At a rational place `P` of a function field of genus `g > 0` with exact constants there are
exactly `g` gap numbers `i₁ < ⋯ < i_g`, with `i₁ = 1` and `i_g ≤ 2g − 1` (Thm. 1.6.8;
`TauCeti.Place.card_weierstrassGaps`, `TauCeti.Place.one_mem_weierstrassGaps`), in every
characteristic. The refined theory (all but finitely many places share one gap sequence;
Weierstrass points; Rem. 1.6.9, stated in Stichtenoth without proof over algebraically closed
`k`) is §11.3, under its hypotheses; generic classicality is outside the roadmap, since
non-classical curves exist in characteristic `p`.
*Needs:* §5.1; Tau Ceti `TauCeti.Place.card_weierstrassGaps`, `TauCeti.Place.one_mem_weierstrassGaps`.

**Checks.**

- In genus one the gap sequence is `{1}` at every rational place.
- For `y² = x⁵ − 1` (genus `2`, characteristic not `2` or `5`), the gaps at the place over `∞` are
  `{1, 3}`, since `x` and `y` have pole orders `2` and `5`.
- At the place of `(0, i)` over `ℚ(i)`, off the branch locus because `0⁵ − 1 = −1 = i²`, the gaps
  are `{1, 2}`.

### 5.5 Clifford's theorem over infinite constant fields

For infinite `k` (an `[Infinite k]` hypothesis), `0 ≤ deg D ≤ 2g − 2` implies `2ℓ(D) ≤ 2 + deg D`
(Thm. 1.6.13), from the key inequality under `deg B + 1 < #k`
(`TauCeti.Divisor.dim_add_dim_le_one_add_dim_add_of_lt_card`). The hypothesis is the proof's
(Lemma 1.6.14 avoids finitely many hyperplanes), not the theorem's: the unrestricted theorem is
§8.4.
*Needs:* §5.1; Tau Ceti `TauCeti.Divisor.dim_add_dim_le_one_add_dim_add_of_lt_card`.

**Checks.**

- `D = 0`: `2 ≤ 2`; `D = W`: `2g ≤ 2g`, equality at both ends.
- In genus `2`, the degree-two divisor `(x)_∞` of `y² = x⁵ − 1` has `ℓ = 2`: `4 ≤ 4`, equality.
- On a non-hyperelliptic genus-three field, a single rational place `P` has `ℓ(P) = 1`: `2 < 3`.

### 5.6 Finite constant fields: the class number

For finite `k = 𝔽_q` with exact constants, in dependency order: finitely many places of each
bounded degree (each lies over a place of `k(x)` of bounded degree, with finite fibres, Layers 0
and 2; Stichtenoth Lemma 5.1.1); finitely many effective divisors of bounded degree; every
degree-zero class is `[A − n · B]` with `A` effective of degree `n · deg B`, for a fixed `B` of
positive degree and `n · deg B ≥ g` (Riemann's theorem gives `ℓ(D + n · B) ≥ 1`);
`Finite Cl⁰(F)` (Prop. 5.1.3; `TauCeti.Divisor.finite_ker_degreeClass`), the class number
`h_F := #Cl⁰(F)`; and through §3.6, finiteness of `ClassGroup R_x` for every affine model,
recovering Mathlib's `ClassGroup (FunctionField.ringOfIntegers Fq F)` in the chosen-generator
setting. This stops strictly before zeta functions.
*Needs:* §§3.4, 3.6, 5.1, Layer 2; Tau Ceti `TauCeti.Divisor.finite_ker_degreeClass`.

**Checks.**

- `Cl⁰(𝔽_q(x)) = 0`, so `h = 1`.
- For `y² = x³ − x` over `𝔽₃`, `x³ − x = 0` for every `x ∈ 𝔽₃`, so the rational places are
  `(0, 0)`, `(1, 0)`, `(2, 0)` and `O`, and `h = 4`.
- `𝔽₂(x)` has `3` places of degree `1` and `1` of degree `2`.

### 5.7 Local components and completions

Define `ι_P` and the local component `ω_P(x) := ω(ι_P x)` (Def. 1.7.1; the pinned
`TauCeti.repartitionDualComponent`); prove `ω(α) = ∑_P ω_P(α_P)` with cofinite vanishing
(Prop. 1.7.2; `TauCeti.apply_eq_finsum_repartitionDualComponent`,
`TauCeti.finite_support_repartitionDualComponent_apply`), whose specialization
`∑_P ω_P(x) = 0` for `x ∈ F` is the abstract residue theorem over arbitrary `k` (the pinned
`TauCeti.finsum_repartitionDualComponent_eq_zero`; §9.3 refines it to residues); the
characterization of `v_P(ω)` through local components, `ω_P ≠ 0` and "one local component
determines `ω`" (Prop. 1.7.3); and the explicit generator `η` of `Ω_{k(x)}` with `(η) = −2P_∞`
(Prop. 1.7.4). **Completions:** for every place construct the completion of `F` from the
valuation filtration, with valuation, valuation ring, maximal ideal, residue field and chosen
uniformizer, for an arbitrary residue field; Mathlib's `adicCompletion` and `FiniteAdeleRing` of an
affine model receive `A_F` with dense image in the `D`-filtration sense. Nothing in the proof of
Riemann–Roch depends on completions.
*Needs:* Layer 4; Tau Ceti `TauCeti.repartitionDualComponent`,
`TauCeti.apply_eq_finsum_repartitionDualComponent`,
`TauCeti.finite_support_repartitionDualComponent_apply`,
`TauCeti.finsum_repartitionDualComponent_eq_zero`; Mathlib
`IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `LaurentSeries`.

**Checks.**

- `∑_P ω_P(1) = ω(1) = 0`, since `ω` vanishes on the diagonal copy of `F`.
- The completion of `k(X)` at `P_X` is `k((X))` with residue field `k` (Mathlib's
  `LaurentSeriesRingEquiv`); at `P_{X²+1}` over `ℚ` the residue field is `ℚ(i)`.
- `η_P ≠ 0` at every place `P`, including the places outside the support of `(η) = −2P_∞`: the
  local components of a nonzero Weil differential never vanish.

### Examples

On a genus-one field with a rational place `[0]`: `ℓ(n · [0]) = n` for `n ≥ 1`. On `y² = x⁵ − 1`:
gaps `{1, 3}` at infinity. Over `𝔽₃`, the class number of `y² = x³ − x` is `4`.

### Dependencies

Layers 0–4; Tau Ceti's consequences of Riemann–Roch, class-number finiteness and local
components named above; Mathlib completions and Laurent series.

## Layer 6: extensions of function fields

Stichtenoth §§3.1–3.3 and §3.7. `F′/k′` over `F/k` with `[F′ : F]` finite. Stichtenoth's Ch. 3
carries a chapter-wide "`k` perfect"; by an audit of which proofs consume it, Thm. 3.1.11,
Thm. 3.3.7, Def. 3.4.3, Thm. 3.4.6, Thm. 3.4.13 and Thm. 3.5.10 do not, and Hilbert's different
formula (Thm. 3.8.7) consumes it only through the separability of the residue extensions, which
§8.7 assumes explicitly (§8.8's fierce biquadratic extension refutes the formula without it).
Every statement here carries only its true hypotheses.

### 6.1 Setup, lying over, and the invariants e and f

Extensions are the scalar-tower diagram of the conventions table (Def. 3.1.1), never a bare
algebra with a compatibility hypothesis. Prove that `k′` is the constant field of `F′` where a
statement needs it and the tower induces `k → k′`; characterize `P′ ∣ P` three ways
(Prop. 3.1.4: `P ⊆ P′`, `𝒪_P ⊆ 𝒪_{P′}`, `ord_{P′} = e · ord_P` on `F`), defining `e(P′∣P)` and
`f(P′∣P)` (Def. 3.1.5); `f` is finite iff `[F′ : F]` is, and both are multiplicative in towers
(Prop. 3.1.6); each place of `F′` lies over exactly one place of `F`, and each place of `F` has at
least one and finitely many extensions (Prop. 3.1.7).
*Needs:* Layers 0–3; Tau Ceti `TauCeti.Place`.

**Checks.**

- `F = k(x) ⊂ F′ = k(y)` with `y² = x`, characteristic not `2`: over `P_x` there is one place, with
  `e = 2`; over `P_{x−1}` two places `y = ±1`, with `e = f = 1`.
- `ℝ(x) ⊂ ℂ(x)` (constants `ℝ ⊂ ℂ`): over `P_∞` one place with `e = 1` and `f = 2`.
- Restricting a place of `F′` to `F` and normalizing recovers `P`, with `ord_{P′} = e · ord_P`
  on `F`: for `y² = x` at `P_x`, `ord_{P′}(x) = 2 = 2 · ord_{P_x}(x)`.

### 6.2 The conorm and the geometric degree

Define `Con : Divisor k F → Divisor k′ F′`, `P ↦ ∑ e(P′∣P) · P′` (Def. 3.1.8, transitive in
towers); `Con` of a principal divisor is principal (Prop. 3.1.9), inducing `Cl(F) → Cl(F′)`; prove
`[k′ : k] · deg (Con D) = [F′ : F] · deg D` (Cor. 3.1.14), cross-multiplied, so that no
divisibility is presupposed. The geometric degree `n(F′/F)`, with `[F′ : F] = n(F′/F) · [k′ : k]`,
is a separate statement under linear disjointness of `F` and `k′` over `k` (equivalently
`[F k′ : F] = [k′ : k]`, automatic for separable `k′/k` over exact `k`, the pinned
`TauCeti.finrank_constantCompositum_eq_finrank_of_isSeparable`); only under it is
`deg (Con D) = n(F′/F) · deg D` available, as `TauCeti.geometricDegree`.
*Needs:* §6.1; Tau Ceti `TauCeti.geometricDegree`,
`TauCeti.finrank_constantCompositum_eq_finrank_of_isSeparable`.

**Checks.**

- `F = k(x)`, `k′/k` separable quadratic, `F′ = k′(x)`, `D = P_∞`: `[k′ : k] · deg Con D = 2 · 1`
  and `[F′ : F] · deg D = 2 · 1`.
- For `y² = x`, `Con(P_x) = 2P′`, of degree `2 = [F′ : F] · 1`.
- For `k = 𝔽_p(t)` and `s^p = t`, viewing `F = 𝔽_p(s, x)` over `k`: `k′ = 𝔽_p(s)` has
  `[F k′ : F] = 1 ≠ p = [k′ : k]`, so the quotient form of the degree identity is unavailable.

### 6.3 The fundamental identity

The fundamental identity `∑_{P′∣P} e(P′∣P) · f(P′∣P) = [F′ : F]` (Thm. 3.1.11, no perfectness) is the
pinned `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isFunctionField`, proved
through the affine models: Mathlib's `Ideal.sum_ramification_inertia_eq_finrank` over `R_x ⊆ R′_x`
(`R′_x` is finite over the Dedekind `R_x` by §2.1 and torsion-free, hence flat, of rank `[F′ : F]`),
with one bridge each identifying `e` with `Ideal.ramificationIdx` and `f` with `Ideal.inertiaDeg`,
plus the chart swap for the places over `P_∞`. Corollaries: the number of places over `P`, `e` and `f` are at most
`[F′ : F]` (Cor. 3.1.12); split and totally ramified places (Def. 3.1.13); the Eisenstein-type
total-ramification criterion (Prop. 3.1.15, through Mathlib's `Polynomial.IsEisensteinAt`).
*Needs:* §6.1, Layer 2; Tau Ceti
`TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isFunctionField`; Mathlib
`Ideal.sum_ramification_inertia_eq_finrank`, `Ideal.ramificationIdx`, `Ideal.inertiaDeg`.

**Checks.**

- `y² = x` at `P_{x−1}`: `1 · 1 + 1 · 1 = 2`; at `P_x`: `2 · 1 = 2`.
- Over `ℚ`, `y² = x` at `P_{x+1}`: `y² = −1` has no root in `ℚ`, so one place with `f = 2`:
  `1 · 2 = 2`.
- `ℂ(x)/ℝ(x)` at `P_∞`: `1 · 2 = 2`, the residue degree carrying the whole degree.

### 6.4 Integral closures, local integral bases, and Kummer's theorem

Holomorphy rings `𝒪_S = ⋂_{P∈S} 𝒪_P`, integrally closed subrings are holomorphy rings
(Def. 3.2.2, Thm. 3.2.6 with no exact-constants hypothesis by Rem. 3.2.7, Cor. 3.2.8) and for
finite `S` they are principal ideal domains (Prop. 3.2.10): the pinned `TauCeti.holomorphyRing`,
`TauCeti.holomorphyRing_setOf_subset_integers`, `TauCeti.coe_holomorphyRing_subset_integers_iff`
and `TauCeti.isPrincipalIdealRing_holomorphyRing`, none with an exactness hypothesis. The integral closure `𝒪′_P` of `𝒪_P`
in `F′` has local integral bases for separable `F′/F`, and almost every basis of `F′/F` is one
(Cor. 3.3.5, Thm. 3.3.6; `TauCeti.Place.finite_setOf_not_isIntegralBasis`). **Kummer's theorem**,
with the hypotheses split as in the source: `F′ = F(y)` with `y` integral over `𝒪_P` and `φ` its
minimal polynomial, and `φ̄ = ∏ γᵢ^{εᵢ}` over `F_P`. Conclusion A (Thm. 3.3.7, unconditional;
`TauCeti.Place.exists_injective_restrict_eq`): pairwise distinct places `Pᵢ′ ∣ P` with
`f(Pᵢ′∣P) ≥ deg γᵢ`. Conclusion B (Cor. 3.3.8, under `𝒪′_P = 𝒪_P[y]`, that is `P` prime to the
conductor of `𝒪_P[y]`): these are all the places over `P`, with `e = εᵢ` and `f = deg γᵢ`. No
statement cites Kummer without saying which conclusion it uses.
*Needs:* §6.3; Tau Ceti `TauCeti.holomorphyRing`, `TauCeti.holomorphyRing_setOf_subset_integers`,
`TauCeti.coe_holomorphyRing_subset_integers_iff`, `TauCeti.isPrincipalIdealRing_holomorphyRing`,
`TauCeti.Place.finite_setOf_not_isIntegralBasis`, `TauCeti.Place.exists_injective_restrict_eq`;
Mathlib `AdjoinRoot`, `conductor_mul_differentIdeal`.

**Checks.**

- `y² = x` at `P_{x−a}` with `a = b² ≠ 0` and `char k ≠ 2`: `T² − a = (T − b)(T + b)` with distinct
  factors and `k[x, y]` integrally closed, so conclusion B gives two places with `e = f = 1`. In
  characteristic `2` the factors coincide, `T² − a = (T − b)²`, and `x − a = (y − b)²` in `k(y)`:
  one place, with `e = 2` and `f = 1`.
- Over `ℚ`, `y² = x²(x − 1)` at `P_x`: `φ̄ = T²` suggests one place with `e = 2`, but `z = y/x`
  satisfies `z² = x − 1 ≡ −1`, so there is one place with `e = 1`, `f = 2`: without monogenicity
  only conclusion A holds.
- For `y² = x³ − x` over `ℚ` the basis `1, y` is integral at every finite place.

### 6.5 Galois extensions, first pass

For `F′/F` Galois, prove that the Galois group acts transitively on the places over `P`
(Thm. 3.7.1; `TauCeti.Place.exists_smul_eq_of_restrict_eq`), that `e`, `f` and `d` are constant over
`P` with `e · f · r = [F′ : F]` (Cor. 3.7.2;
`TauCeti.Place.ncard_mul_ramificationIdx_mul_relativeDegree_eq_finrank`) and that the
decomposition group has order `e · f` (`TauCeti.Place.card_decompositionSubgroup`). The inertia and
higher ramification groups are §8.6; the local filtration theory is LocalFieldsRamification's
(§8.9).
*Needs:* §6.3; Tau Ceti `TauCeti.Place.exists_smul_eq_of_restrict_eq`,
`TauCeti.Place.ncard_mul_ramificationIdx_mul_relativeDegree_eq_finrank`,
`TauCeti.Place.card_decompositionSubgroup`.

**Checks.**

- For `y² = x`, `y ↦ −y` exchanges the two places over `P_{x−1}`.
- `e · f · r` is `2 · 1 · 1` at `P_x`, `1 · 1 · 2` at `P_{x−1}`, and `1 · 2 · 1` at `P_{x+1}` over `ℚ`.
- The decomposition group has order `2` at `P_x` and `1` at `P_{x−1}`.

### Examples

`y² = x³ − x` over `ℚ(x)`: four ramified places (over `x = 0, 1, −1, ∞`) with `e = 2`, `f = 1`; the
fundamental identity `2 · 1 = 2` at each. The constant extension `ℂ(x)/ℝ(x)` has `e = 1`, `f = 2`
at `P_∞`.

### Dependencies

Layers 0–3; Mathlib ramification bookkeeping and `AdjoinRoot`; Tau Ceti's extension theory named
above. Riemann–Roch is not used.

## Layer 7: the different and the Hurwitz genus formula

Stichtenoth §§3.4–3.5, in the book's order: the cotrace of Weil differentials proves Hurwitz's
formula, and the different theorem computes the exponents.

### 7.1 The different exponent and divisor

The complementary module `C_P` (Def. 3.4.1, Prop. 3.4.2: principal, equal to `𝒪′_P` almost
everywhere) defines `d(P′∣P) := −v_{P′}(t)` for `C_P = t · 𝒪′_P` and `Diff(F′/F) = ∑ d(P′∣P) · P′ ≥ 0`
(Def. 3.4.3, Rem. 3.4.4). In Lean, consume Mathlib's `differentIdeal` over the `R_x`-models, with
the bridge `v_{P′}(differentIdeal R R′) = d(P′∣P)`
(`TauCeti.Place.differentExponent_eq_multiplicity_center`), the two charts covering the places
over `P_∞`, and finite support through `dvd_differentIdeal_iff`. The hypothesis of record is
`F′/F` separable; the inseparable case is Layer 8's.
*Needs:* Layer 6; Tau Ceti `TauCeti.Place.differentExponent_eq_multiplicity_center`; Mathlib
`differentIdeal`, `dvd_differentIdeal_iff`.

**Checks.**

- For `y² = x`, characteristic not `2`: `Diff = P′₀ + P′_∞`, with `d = 1 = e − 1` at both ramified
  places.
- An unramified place with separable residue extension has `d = 0`.
- For `y² + y = x³` over `𝔽₂`, the place over `∞` has `e = 2` and `d = 4`, not `e − 1 = 1`.

### 7.2 Dedekind's different theorem

(a) `d(P′∣P) ≥ e(P′∣P) − 1` for every finite separable extension, including inseparable residue
extensions (Thm. 3.5.1; `TauCeti.Place.ramificationIdx_le_differentExponent_add_one`). (b) Under
`Algebra.IsSeparable F_P F′_{P′}`, equality holds iff the residue characteristic does not divide
`e`. **Tame** means both residue separability and `e` prime to the characteristic
(`TauCeti.Place.IsTame`, with `TauCeti.Place.IsWild` its negation); **unramified** means `e = 1`
and residue separability, so an `e = 1` fierce extension is not unramified. The equivalence
`d = 0 ↔ unramified` is `TauCeti.Place.differentExponent_eq_zero_iff`; part (b) as
`e = d + 1 ↔ tame` is `TauCeti.Place.ramificationIdx_eq_differentExponent_add_one_iff`, with
`e ≤ d ↔ wild` (Cor. 3.5.5) `TauCeti.Place.ramificationIdx_le_differentExponent_iff` and the
divisor form `TauCeti.Divisor.tameDifferent_eq_different_iff`. Stichtenoth proves (b) through
`k` perfect (Lemma 3.5.3); the pin under the displayed residue hypothesis alone. Mathlib supplies
`pow_sub_one_dvd_differentIdeal` and the ramified-iff-divides criterion, not the exact tame value.
A complete local route is an alternative proof whose steps §8.8 consumes: localization and
completion preserve the trace dual and the different; a finite tame extension with separable
residue extension factors as unramified then totally ramified; the unramified different is
trivial; `d = e − 1` in the totally ramified part by the minimal polynomial of a uniformizer; and
the tower law `TauCeti.Place.differentExponent_restrict_add` combines them. Without residue
separability keep `e`, the inseparable residue degree and the trace-dual different separately;
failure of tameness can be fierce, and is never restated as `p ∣ e`.
*Needs:* §7.1; Tau Ceti `TauCeti.Place.ramificationIdx_le_differentExponent_add_one`,
`TauCeti.Place.IsTame`, `TauCeti.Place.differentExponent_eq_zero_iff`,
`TauCeti.Place.ramificationIdx_eq_differentExponent_add_one_iff`,
`TauCeti.Place.ramificationIdx_le_differentExponent_iff`,
`TauCeti.Divisor.tameDifferent_eq_different_iff`, `TauCeti.Place.differentExponent_restrict_add`;
Mathlib `pow_sub_one_dvd_differentIdeal`.

**Checks.**

- `y² = x³ − x`, characteristic not `2`: `d = 1 = e − 1` at the four branch places.
- `y² + y = x³` over `𝔽₂` at `∞`: `e = 2 ≤ d = 4`, wild.
- The biquadratic fierce extension of §8.8 has `e = 1` and `d = 2 > 0`: ramified although `e = 1`.

### 7.3 The cotrace of Weil differentials

Construct `Cotr_{F′/F} : Ω_F → Ω_{F′}` through the trace on fibre-constant repartitions
(Def. 3.4.5, Thm. 3.4.6: existence, uniqueness and `(Cotr ω) = Con (ω) + Diff(F′/F)`), its
`F`-semilinearity and tower transitivity (Prop. 3.4.11), and the transitivity of the different
`d(P″∣P) = e(P″∣P′) · d(P′∣P) + d(P″∣P′)` (Cor. 3.4.12;
`TauCeti.Place.differentExponent_restrict_add`, and for divisors
`TauCeti.Divisor.different_eq_conorm_add`, reconciled with Mathlib's
`differentIdeal_eq_differentIdeal_mul_differentIdeal`).
*Needs:* §§7.1–7.2, Layer 4; Tau Ceti `TauCeti.Place.differentExponent_restrict_add`,
`TauCeti.Divisor.different_eq_conorm_add`; Mathlib
`differentIdeal_eq_differentIdeal_mul_differentIdeal`.

**Checks.**

- `k(x) ⊂ k(x^{1/2}) ⊂ k(x^{1/4})`, characteristic not `2`, over `P_x`: `d(P″∣P) = 3` and
  `e(P″∣P′) · d(P′∣P) + d(P″∣P′) = 2 · 1 + 1 = 3`.
- For `y² = x`, `(Cotr η) = Con(−2P_∞) + Diff = −4P′_∞ + P′₀ + P′_∞`, of degree `−2 = 2g′ − 2` for
  the rational `F′ = k(y)`.
- The cotrace of a nonzero Weil differential is nonzero.

### 7.4 The Hurwitz genus formula

For `F′/F` finite separable, `k` the exact constant field of `F` and `k′` that of `F′`, in the
cross-multiplied form (Thm. 3.4.13, no perfectness):
`[k′ : k] · (2g′ − 2) = [F′ : F] · (2g − 2) + [k′ : k] · deg Diff(F′/F)`. The pinned
`TauCeti.hurwitz_genus_formula`, with `TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame` and
`TauCeti.genus_le_genus` below, also takes `k′/k` finite and separable as instance arguments; both
follow from the hypotheses, so the pinned form loses no generality. Finiteness is the pinned
`TauCeti.IsFunctionField.finiteDimensional_baseExtension`. Separability: for `a ∈ k′`, exactness
of `k` in `F` makes the minimal polynomial of `a` over `k`, mapped to `F`, its minimal polynomial
over `F` (`TauCeti.minpoly.map_algebraMap_of_isIntegrallyClosedIn`), which is separable because
`F′/F` is, and separability descends (`Polynomial.separable_map`). Both inputs are needed: with
`k = 𝔽_p(t)` and `s^p = t`, the purely inseparable `F′ = 𝔽_p(s, x)` over `F = k(x)`, and the
identity extension of `F = 𝔽_p(s, x)` viewed over `k`, both have the inseparable `k′ = 𝔽_p(s)`.
The quotient form through the geometric degree holds under the same hypotheses
(`TauCeti.hurwitz_genus_formula_geometricDegree`; with `[k′ : k] = 1` it is
`2g′ − 2 = n(2g − 2) + deg Diff`), because separable `k′/k` and exact `k` give
`[F k′ : F] = [k′ : k]`. The normalization `2g − 2 = −2[F : k(x)] + deg Diff(F/k(x))` is
Cor. 3.4.14 (`TauCeti.hurwitz_genus_formula_ratFunc`, through the cotrace of `η`). Tame corollary:
`2g′ − 2 ≥ n(2g − 2) + ∑ (e − 1) deg P′`, with equality iff every place of `F′` is tame over `F`
(Cor. 3.5.6; `TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame`, with `TauCeti.geometricDegree`
and the tame different `TauCeti.Divisor.tameDifferent`; an inseparable residue extension makes its
place wild and breaks the equality). Further corollaries: `g′ ≥ g` for separable `F′/F` with exact
constants on both sides (Cor. 3.5.7; `TauCeti.genus_le_genus`); every separable `F/k(x)` of degree
greater than one with exact constants ramifies (Cor. 3.5.8;
`TauCeti.different_ne_zero_of_one_lt_finrank`); and Riemann–Hurwitz for `y² = f(x)` in
characteristic not `2`, from the Kummer data `e = n/r_P`, `d = n/r_P − 1` (Prop. 3.7.3).
*Needs:* §§7.1–7.3, §5.7 (`η`); Tau Ceti `TauCeti.hurwitz_genus_formula`,
`TauCeti.hurwitz_genus_formula_geometricDegree`, `TauCeti.hurwitz_genus_formula_ratFunc`,
`TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame`, `TauCeti.genus_le_genus`,
`TauCeti.different_ne_zero_of_one_lt_finrank`,
`TauCeti.IsFunctionField.finiteDimensional_baseExtension`,
`TauCeti.minpoly.map_algebraMap_of_isIntegrallyClosedIn`; Mathlib `Polynomial.separable_map`.

**Checks.**

- `y² = x³ − x` over `ℚ`: `2 · 1 − 2 = 0 = 2 · (−2) + 4`.
- `y² = x⁵ − 1`, characteristic not `2` or `5`: `2 · 2 − 2 = 2 = 2 · (−2) + 6`.
- `y² + y = x³` over `𝔽₂`: `2g − 2 = 2 · (−2) + 4`, so `g = 1`; the tame count `2 · (−2) + 1 = −3` is
  odd and impossible.
- The purely inseparable `k(y)/k(y^p)` (degree `p`, both of genus `0`) has identically zero
  trace, so the trace-dual different is not defined: the formula is stated for separable `F′/F`
  only.

### Examples

Riemann–Hurwitz for `y² = x³ − x` over `ℚ`: the different is the sum of the four branch places,
`0 = 2 · (−2) + 4`. The Artin–Schreier curve `y² + y = x³` over `𝔽₂` has `Diff = 4Q_∞` and genus
`1`; in its infinity chart `f = w + z³ + w²`, `dw = z² dz`, `t = 1/x = w/z`,
`dt = (w²/z²) dz`, `ord_∞ w = 3`, `ord_∞ z = 1`, hence different exponent `4`: the acceptance test
that no tameness hypothesis entered the formula.

### Dependencies

Layers 4–6, with §5.7's `η`; Mathlib's different ideal; Tau Ceti's different and Hurwitz theorems
named above.

## Layer 8: constant-field extensions, Galois ramification, and inseparability

Stichtenoth §§3.6–3.11. Everything in this layer is about hypotheses. Stichtenoth's §3.6 assumes
`k` perfect throughout and refers to Deuring's lecture notes for counterexamples without stating
one; this layer states them.

### 8.1 Constant-field extensions and their three inputs

For an algebraic `K/k` and the compositum `F_K = F · K`, state the embeddings and scalar towers,
the relative algebraic constant field of `F_K` and its normalization; no field structure is
asserted on `K ⊗[k] F` unless a domain theorem supplies it. Keep the perfect-`k` package
(Prop. 3.6.1, Cor. 3.6.4, Prop. 3.6.6, Cor. 3.6.8) and prove the sharper dictionary:

1. **Generic separable generation**: a separating transcendental `x` with `F/k(x)` finite
   separable. It gives the one-dimensional Kähler module of §9.1 and geometric reducedness of the
   generic field (the pinned `TauCeti.isGeometricallyReduced_of_separating`), with Mathlib's
   `SeparablyGenerated.lean` existential as comparison target; it gives neither smoothness of the
   regular model nor conserved genus. Conversely, a geometrically reduced function field has a
   separating element (the pinned
   `TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_isGeometricallyReduced`,
   the transcendence-degree-one case of
   `TauCeti.exists_isTranscendenceBasis_and_isSeparable_of_isGeometricallyReduced`, which needs
   finite generation), so for a function field the two conditions are equivalent.
2. **Regular field extension**: generic separable generation together with
   `IsIntegrallyClosedIn k F`. Its tensor-domain criterion: `K ⊗[k] F` is a domain for every
   field extension `K/k` (the pinned `TauCeti.isDomain_tensorProduct_of_separating`, which gives
   `IsDomain (F ⊗[k] A)` for every `k`-algebra `A` that is a domain, from exact constants and a
   transcendental `x` with `F/k(x)` separable, as the composite of
   `TauCeti.isGeometricallyReduced_of_separating` and
   `TauCeti.isDomain_tensorProduct_of_isGeometricallyReduced`). State the equivalence of
   regularity with the tensor-domain condition, for every `K/k` or for one algebraically closed
   `K/k`; its converse direction is again a composite of pinned theorems: if `F ⊗[k] L` is a
   domain for an algebraically closed `L/k`, it is reduced, so `F` is geometrically reduced
   (`Algebra.IsGeometricallyReduced.of_isReduced_tensorProduct`) and has a separating element
   (item 1), and `k` is algebraically closed in `F`
   (`TauCeti.algebraicClosure_eq_bot_of_isDomain_tensorProduct` with
   `TauCeti.algebraicClosure_eq_bot_iff_isIntegrallyClosedIn`). The fraction field `F_K` has exact
   constants `K` and is again a function field. Build the tensor-domain and fraction-field maps for
   every `K/k`, with identity, composition and uniqueness laws; these are field-map statements, not
   full faithfulness of base change. For a separating `t`, identify
   `Frac(K ⊗[k] F) ≃ₐ[K] K(t) ⊗[k(t)] F` (localize at the nonzero polynomials in `t`; this finite
   `K(t)`-algebra is a domain, hence a field), with both maps on pure tensors, inverse equations,
   basis transport, linear disjointness and `[F : k(t)] = [F_K : K(t)]`; prove scalar stability of
   regular extensions, also for extensions that are not finitely generated, by finite subextension
   descent. Over perfect `k`, exact constants imply this condition. None of these statements says
   that the closed local rings stay regular after base change.
3. **Smooth-model branch**: the regular projective model `X_F` of §12B.0 with a smooth structure
   morphism and geometric integrality. Prove that its `K`-base change is smooth, proper and
   geometrically integral and is the regular model of `Frac(K ⊗[k] F)`, the identity of fraction
   fields extending uniquely to a model isomorphism. This holds over perfect `k` with exact
   constants; over imperfect `k` it is additional data, not a synonym for items 1 or 2.

The perfect-`k` statements keep their degree formulas explicit: for `F′/F` with full constants
`k′/k`, `deg_{k′}(Con_{F′/F} A) = [F′ : F k′] · deg_k A` (Cor. 3.6.4) and
`[F′ : F] = [F′ k̄ : F k̄] · [k′ : k]` (Prop. 3.6.6); the geometric irreducibility criterion
(Cor. 3.6.8) over perfect `k`, and over arbitrary `k` with separable generation explicit.
*Needs:* items 1–2: Layer 0; Tau Ceti `TauCeti.isDomain_tensorProduct_of_separating`,
`TauCeti.isGeometricallyReduced_of_separating`,
`TauCeti.isDomain_tensorProduct_of_isGeometricallyReduced`,
`TauCeti.exists_isTranscendenceBasis_and_isSeparable_of_isGeometricallyReduced`,
`TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_isGeometricallyReduced`,
`Algebra.IsGeometricallyReduced.of_isReduced_tensorProduct`,
`TauCeti.algebraicClosure_eq_bot_of_isDomain_tensorProduct`,
`TauCeti.algebraicClosure_eq_bot_iff_isIntegrallyClosedIn`, `TauCeti.constantCompositum`; Mathlib
`TensorProduct`, `IsLocalization`, `Algebra.IsGeometricallyReduced`,
`exists_isTranscendenceBasis_and_isSeparable_of_perfectField`. Item 3: the model of §12B.0 with
12B.0a–b. The perfect-`k` degree formulas: Layer 3 (degrees) and §6.2 (the conorm).

**Checks.**

- `ℂ ⊗[ℝ] ℂ(x) ≅ ℂ(x) × ℂ(x)` is not a domain: exactness fails (`i ∈ ℂ(x)` is algebraic over `ℝ`).
- For `k = 𝔽_p(a, b)` and `F = k(x, y)` with `y^p = a + b x^p` (exact constants, no separating
  element), `z = y − a^{1/p} − b^{1/p} x` in `K ⊗[k] F` with `K = k(a^{1/p}, b^{1/p})` has `z^p = 0`
  and `z ≠ 0`.
- `K = k`: `k ⊗[k] F ≅ F`, a domain in every case.

### 8.2 Genus and divisor base change on the smooth model

Under item 3 and for arbitrary `K/k`, construct the flat pullback `Con` of Cartier divisors and
its place expression. For a closed point `P`, the Artinian fibre `κ(P) ⊗[k] K` may have several
local factors and nilpotents; its support gives the places `Q` over `P` and its local lengths the
coefficients of `Con(P)`. Prove the residue maps, the length and degree identity and
`deg_K(Con D) = deg_k D`, without replacing the fibre by a reduced compositum. Prove the
`K`-linear isomorphism `K ⊗[k] L_k(D) ≃ₗ[K] L_K(Con D)` from the finite affine-cover section
equalizer of §12B.0c and flatness, with its multiplication and principal-divisor compatibilities.
Riemann's large-divisor equality on both fields then gives `g(F_K/K) = g(F/k)` (pinned as
`TauCeti.AlgebraicGeometry.genus_functionField_eq_of_isPullback`, for `X` smooth, proper and
geometrically integral over `k` and `Y = X ×_k K` for any field extension `K/k`, and for algebraic
constant extensions as
`TauCeti.AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top`).
Riemann–Roch uniqueness proves that the pulled-back canonical class is canonical, and descent of a
nowhere-vanishing section proves that `Con` is injective on classes. These give every genus,
basis, degree, canonical and class output of Thm. 3.6.3 without losing imperfect smooth models.
*Needs:* §8.1, §§3.4, 4.4, §12B.0c; Tau Ceti
`TauCeti.AlgebraicGeometry.genus_functionField_eq_of_isPullback`,
`TauCeti.AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top`.

**Checks.**

- Over `ℚ`, `Con(P_{X²+1}) = P_{X−i} + P_{X+i}` in `ℚ(i)(X)`, of degree `1 + 1 = 2 = deg P_{X²+1}`.
- `y² = x³ − x` over `ℚ` keeps genus `1` over `ℚ̄`, with `[F : ℚ(x)] = [F_ℚ̄ : ℚ̄(x)] = 2`.
- For `k = 𝔽_p(a)`, `F = k(t)` and `K = k(a^{1/p})`, the fibre of `P = (t^p − a)` is
  `K[t]/((t − a^{1/p})^p)`, of length `p`: `Con(P) = pQ`, and `deg_K(pQ) = p = deg_k P`.

### 8.3 Unramified constant extensions

For `K/k` algebraic and separable, every place `Q` over `P` is unramified in Layer 7's sense
(`e(Q∣P) = 1` and `κ(Q)/κ(P)` separable), with the residue identifications explicit; for finite
separable `K/k` this is the pinned
`TauCeti.Place.ramificationIdx_eq_one_of_constantCompositum_eq_top`,
`TauCeti.Place.differentExponent_eq_zero_of_constantCompositum_eq_top` and
`TauCeti.Place.isUnramifiedAt_of_constantCompositum_eq_top`, and the algebraic case follows by
finite subextension descent; over perfect `k` this recovers Thm. 3.6.3(a),(g). For arbitrary
algebraic `K/k` with `κ(P)/k` separable, prove only that the fibre `κ(P) ⊗[k] K` is reduced, so
`e(Q∣P) = 1`, with `κ(Q)` the corresponding field factor; here `κ(Q)/κ(P)` is separable iff `K/k`
is, so full unramifiedness needs separability of `κ(Q)/κ(P)`, never of `κ(P)/k` alone. Neither
conclusion follows from smoothness of `X_F`.
*Needs:* §§8.1–8.2, Layer 7; Tau Ceti
`TauCeti.Place.ramificationIdx_eq_one_of_constantCompositum_eq_top`,
`TauCeti.Place.differentExponent_eq_zero_of_constantCompositum_eq_top`,
`TauCeti.Place.isUnramifiedAt_of_constantCompositum_eq_top`.

**Checks.**

- `k = 𝔽_p(a)`, `F = k(t)`, `K = k(a^{1/p})` (the model is the smooth projective line and the
  genus stays `0`): at `P = (t^p − a)`, `Con(P) = pQ` with `Q = (t − a^{1/p})` and `e(Q∣P) = p`.
- In the same field, at the rational place `P = (t)`, `κ(P) = k`, the fibre is the field `K`,
  `Con(P) = Q`, `e = 1` and `deg_K Q = 1`, but `κ(Q)/κ(P) = K/k` is purely inseparable of degree
  `p`: `Q/P` is not unramified.
- `ℝ(x) ⊂ ℂ(x)`: every place is unramified, with `e = 1`.

### 8.4 Clifford's theorem over every exact constant field

For finite `k` (perfect), pass to the algebraic closure: the base-change isomorphism of §8.2
preserves genus, divisor degrees and every `ℓ`, so §5.5's infinite-field theorem applies and
descends. Finite and infinite `k` combine into the theorem for every exact constant field (the
pinned `TauCeti.Divisor.two_mul_dim_le_degree_add_two`). No imperfect-field genus statement is
needed.
*Needs:* §§5.5, 8.2; Tau Ceti `TauCeti.Divisor.two_mul_dim_le_degree_add_two`.

**Checks.**

- Over `𝔽₂`, the genus-two field `y² + y = x⁵` with `D = 2P_∞` has `ℓ(D) = 2` (basis `1, x`):
  `4 ≤ 4`, an instance §5.5 does not reach since `𝔽₂` is finite.
- `D = 0` over a finite field: `2 ≤ 2`.
- `D = W` over a finite field: `2g ≤ 2g`.

### 8.5 Genus non-increase and the genus drop

The genus never increases under algebraic constant extension: `k′/k` algebraic and `F′ = F · k′`
give `g(F′/k′) ≤ g(F/k)`, with no separability of `k′/k` and no exactness of `k` in `F` or of `k′`
in `F′` (the pinned `TauCeti.genus_le_genus_of_constantCompositum_eq_top`). Its route: on the two
affine charts of §12B.0c, the Čech `H¹` is finite-dimensional and equals the genus over the exact
constants by the repartition comparison; flat base change preserves it; a nonreduced base change
surjects on `H¹` onto its reduction (no `H²` on two affine charts), and normalization changes
`H¹` by a finite-length cokernel, giving a further surjection. When `k` is exact and `k′` is exact
in `F′` with `[F′ : F] = [k′ : k]`, the drop is a sum of local singularity degrees
`δ_P = dim_{k′}(𝒪′_P ⧸ 𝒪_P ⊗_k k′)`, nonzero at finitely many places:
`g(F/k) = g(F′/k′) + ∑_P δ_P` (the pinned `TauCeti.genus_eq_genus_add_finsum_singularityDegree`).
The quantitative estimates of §3.11 stay separate targets with their inseparability and
constant-field hypotheses (§8.11).
*Needs:* §§8.1–8.2, Layer 3, §12B.0c; Tau Ceti `TauCeti.genus_le_genus_of_constantCompositum_eq_top`,
`TauCeti.genus_eq_genus_add_finsum_singularityDegree`.

**Checks.**

- `k = 𝔽_p(t)`, `y² = x^p − t`, `p` odd: `F/k` is separably generated with exact constants and
  genus `(p − 1)/2`; after adjoining `a` with `a^p = t`, `u = y/(x − a)^((p − 1)/2)` satisfies
  `u² = x − a` and `u^p = y`, so the genus drops to `0` (the pinned
  `TauCeti.GenusDrop.genus_lt_genus`). At `p = 3` the regular cubic has genus `1`.
- The characteristic-two drop: `y² = x³ + a` over `𝔽₂(a)` has genus `1`, and over `𝔽₂(√a)` the
  substitution `v = y + √a`, `u = v/x` gives `x = u²`, `v = u³`, genus `0`
  (`TauCeti.CharTwoGenusDrop.genus_lt_genus`).
- For separable `k′/k` over exact `k` the genus is preserved
  (`TauCeti.genus_eq_genus_of_constantCompositum_eq_top`): a drop needs inseparable constants.

### 8.6 Decomposition, inertia and lower ramification groups

For a finite Galois extension of function fields and a place `P′` over `P`, construct the
decomposition group `D`, the inertia group `I` and the residue action
(`TauCeti.Place.residueAut`). With `f = f_sep · f_ins`: `|D/I| = f_sep`
(`TauCeti.Place.card_decompositionQuotientInertia_eq_finSepDegree`), `|I| = e · f_ins`
(`TauCeti.Place.card_inertiaSubgroup_eq_ramificationIdx_mul_finInsepDegree`), `D/I` is the
automorphism group of the separable part of `κ(P′)/κ(P)`
(`TauCeti.Place.decompositionQuotientInertiaEquivSeparableClosure`), `|D| = e · f`
(`TauCeti.Place.card_decompositionSubgroup`), and under `Algebra.IsSeparable κ(P) κ(P′)`,
`|I| = e` (`TauCeti.Place.card_inertiaSubgroup`). The lower groups `G_i`, `i ≥ 0`, are defined by
`v_{P′}(σb − b) ≥ i + 1` for every `b ∈ 𝒪_{P′}`, with `D = G_{−1}` and `I = G_0`
(`TauCeti.Place.ramificationGroup`, `TauCeti.Place.ramificationGroup_zero`); normality in `D`
(`TauCeti.Place.normal_ramificationGroup`), descent (`TauCeti.Place.ramificationGroup_antitone`)
and eventual triviality (`TauCeti.Place.exists_forall_ramificationGroup_eq_bot`) are pinned. This
all-elements definition works for fierce extensions; testing a uniformizer alone is not
equivalent without a residue-generation proof.
*Needs:* §6.5; Tau Ceti `TauCeti.Place.ramificationGroup` and the theorems named above.

**Checks.**

- `y² = x` at `P_x`, characteristic not `2`: `D = I = G_0 = ℤ/2` and `G_1 = 1`.
- The fierce biquadratic extension of §8.8: `e = 1`, `f_ins = 4`, `|I| = e · f_ins = 4`, `G_0 = V₄`,
  `G_1 = 1`.
- `y² + y = x³` over `𝔽₂` at `∞`: `G_0 = G_1 = G_2 = G_3 = ℤ/2` and `G_4 = 1`.

### 8.7 The residue-separable branch and Hilbert's different formula

With finite separable residue extension as an explicit hypothesis: `G_0/G_1` is cyclic of order
prime to the residue characteristic (`TauCeti.Place.isCyclic_quotient_ramificationGroup_one`,
`TauCeti.Place.not_dvd_index_ramificationGroup_one`); `G_i/G_{i+1}` is elementary abelian `p` for
`i ≥ 1` (`TauCeti.Place.commutator_ramificationGroup_le`,
`TauCeti.Place.pow_mem_ramificationGroup_of_charP`, which need no residue separability); residue
characteristic zero forces `G_1 = 1` (`TauCeti.Place.ramificationGroup_one_eq_bot`). **Hilbert's
different formula** `d(P′∣P) = ∑_{i≥0} (|G_i| − 1)` (Thm. 3.8.7) is
`TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one`, for `F′/F` finite
Galois with separable residue extension at `P′`, the sum finite by eventual triviality, with the
cut-off form `TauCeti.Place.differentExponent_eq_sum_range_card_ramificationGroup_sub_one`; its
ingredients are the monogenic local form
`TauCeti.Place.differentExponent_eq_sum_ord_sub_aut_of_algebra_adjoin_eq_top` and
`TauCeti.Place.ramificationGroup_eq_isLocalRing_ramificationGroup`. It does not cover inseparable
residue extensions.
*Needs:* §8.6, §7.2; Tau Ceti
`TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one` and the theorems named
above.

**Checks.**

- `y² + y = x³` over `𝔽₂` at `∞`: `∑ (|G_i| − 1) = 1 + 1 + 1 + 1 = 4 = d`.
- A tame place: `G_1 = 1`, so the sum is `|G_0| − 1 = e − 1 = d`.
- The fierce extension of §8.8 violates the residue hypothesis: the sum is `3` while `d = 2`.

### 8.8 The general different, including fierce residue

Keep Layer 7's trace-dual different on the same normalization and DVR carriers, and prove that
localization and completion preserve it without residue separability. For a finite extension of
complete excellent DVRs `B/A` with separable fraction fields `L/K`, build an `A`-integral basis
`bᵢ`, its trace Gram matrix `Tᵢⱼ = Tr_{L/K}(bᵢ bⱼ)` (nonzero determinant by separability) and the
dual basis from `T⁻¹`; it spans the complementary module `C`, whose inverse is the different.
Prove its valuation `d`, nonnegativity and tower law, and through elementary divisors over `A`,
`v_A(det T) = length_A(C/B) = f · d` with `f` the full residue degree, inseparable factor
included. The monogenic case specializes through the conductor/derivative identity; otherwise the
integral basis is used, not a Hilbert sum. Residue separability and the classical comparison are
separate outputs, so a consumer chooses its branch.
*Needs:* §§7.1–7.2, §8.7; Mathlib `Submodule.traceDual`, `Algebra.trace`, `conductor_mul_differentIdeal`.

**Checks.**

- The fierce regression in characteristic `2`: `k = 𝔽₂(s, u)`, `A = k[t]_(t)`, `y² + ty = s`,
  `z² + tz = u`, `B = A[y, z]`. `s, u` are `p`-independent and `B/tB = k(√s, √u)` is a field of
  degree `4`, so `B` is a DVR with maximal ideal `(t)` and the full integral closure; the
  extension is `V₄`-Galois with translations by `t`; each quadratic step has different `(t)`, so
  `d = 2`, `e = 1`, `f = 4` and `v(det T) = f · d = 8`.
- A monogenic tame extension: `d = e − 1` from the derivative of the minimal polynomial of a
  uniformizer.
- An unramified extension with separable residue field: `T` is invertible over `A`, so `d = 0`.

### 8.9 Completion and the local-field boundary

Prove that the lower groups at a chosen place, the valuation normalization, the residue maps and
the trace-dual different survive completion at arbitrary residue fields, inferring no new
classical formula. Herbrand functions, the upper numbering and Hasse–Arf are used from
LocalFieldsRamification Layer 3 only for completions with finite residue field, and Hasse–Arf
only for abelian Galois extensions; the general complete-DVR constructions and fierce
computations stay here.
*Needs:* §§5.7, 8.6–8.8; LocalFieldsRamification Layer 3 (Herbrand functions, upper numbering,
Hasse–Arf).

**Checks.**

- The completion of `𝔽_q(t)` at `(t)` is `𝔽_q((t))`, with finite residue field: the upper numbering
  of LocalFieldsRamification applies.
- The completion of `ℚ(t)` at `(t)` is `ℚ((t))`, whose residue field `ℚ` is infinite: no upper
  numbering is imported for it.
- The lower group `G_i` at a place and at its completion coincide for `y² + y = x³` over `𝔽₂`.

### 8.10 Composita

**Abhyankar's lemma** (Thm. 3.9.1): for `F′ = F₁F₂` with one of `Pᵢ ∣ P` tame (separable residue,
`eᵢ` prime to the characteristic), `e(P′∣P) = lcm(e₁, e₂)`; pinned, with the tameness hypothesis
`e₁ ≠ 0` in `k`, as `TauCeti.Place.ramificationIdx_restrict_sup_of_isGalois` for intermediate fields
of a finite Galois extension and a place with separable residue extension, and as
`TauCeti.Place.ramificationIdx_restrict_sup` for intermediate fields of a finite separable
extension when the residue field of `P` is perfect. Unramified in both implies unramified in the
compositum and in the Galois closure (Cor. 3.9.3; `TauCeti.Place.isUnramified_sup_iff` and
`TauCeti.Place.isUnramified_normalClosure_iff`, both equivalences); a rational place splitting
completely in both splits completely in the compositum with exact constants (Cor. 3.9.7;
`TauCeti.Place.isSplitCompletely_sup_iff`, needing no rationality, and
`TauCeti.Place.isIntegrallyClosedIn_sup_of_isSplitCompletely`).
*Needs:* §§6.5, 7.2; Tau Ceti `TauCeti.Place.ramificationIdx_restrict_sup_of_isGalois`,
`TauCeti.Place.ramificationIdx_restrict_sup`, `TauCeti.Place.isUnramified_sup_iff`,
`TauCeti.Place.isUnramified_normalClosure_iff`, `TauCeti.Place.isSplitCompletely_sup_iff`,
`TauCeti.Place.isIntegrallyClosedIn_sup_of_isSplitCompletely`.

**Checks.**

- `k(x^{1/2})` and `k(x^{1/3})` over `k(x)` at `P_x`, characteristic prime to `6`: `e₁ = 2`, `e₂ = 3`,
  and the compositum `k(x^{1/6})` has `e = 6 = lcm(2, 3)`.
- Over `ℂ`, `ℂ(√x)` and `ℂ(√(x − 1))` both split completely at `P_{x−4}` (`4` and `3` are squares
  in `ℂ`), and the compositum has `4` places over it.
- Over `ℚ`, `ℚ(√x)` splits at `P_{x−4}` but `ℚ(√(x − 1))` does not (`3` is not a square in `ℚ`), and
  the compositum has `2` places over `P_{x−4}`, each of residue degree `2`.

### 8.11 Inseparable extensions and genus estimates

A purely inseparable step of degree `p` has a unique place over each place
(`TauCeti.Place.restrict_bijective_of_isPurelyInseparable`), with purely inseparable residue
extension (`TauCeti.Place.isPurelyInseparable_residueField`) and `e · f = p`
(`TauCeti.Place.ramificationIdx_mul_relativeDegree_eq_finrank_of_isPurelyInseparable`); `e = p`,
`f = 1` only under separability of the residue extension, in particular for perfect `F_P`
(`TauCeti.Place.ramificationIdx_eq_finrank_of_isPurelyInseparable`,
`TauCeti.Place.relativeDegree_eq_one_of_isPurelyInseparable`). Over perfect `k` every function
field is separably generated
(`TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField`, in
`TauCeti/FieldTheory/FunctionField/SeparablyGenerated.lean`), any `z` with `v_P(z) ≢ 0 (mod p)` is
separating, and Frobenius gives `F^{pⁿ} ≅ F` with the same genus (Prop. 3.10.2). Genus bounds,
each pinned over an arbitrary exact constant field: `g ≤ 1 + n(g₁ − 1) + deg C` for `F/F₁` of
degree `n` with a basis of `F` over `F₁` inside `L(C)` (Prop. 3.11.1,
`TauCeti.genus_le_one_add_finrank_mul_genus_sub_one_add_degree`); **Castelnuovo's inequality**
`g ≤ n₁g₁ + n₂g₂ + (n₁ − 1)(n₂ − 1)` for `F = F₁F₂` (Thm. 3.11.3,
`TauCeti.genus_le_finrank_mul_genus_add_finrank_mul_genus_add` under a separating element, with
the perfect-field form `TauCeti.genus_le_finrank_mul_genus_add_finrank_mul_genus_add_of_perfectField`);
**Riemann's inequality** `g ≤ ([F : k(x)] − 1)([F : k(y)] − 1)` for `F = k(x, y)` (Cor. 3.11.4,
`TauCeti.genus_le_finrank_sub_one_mul_finrank_sub_one`); and the plane bound `g ≤ ½(n − 1)(n − 2)`
for `F = k(x, y)` with `n = [F : k(x)]` and `y ∈ L((x)_∞)` (Prop. 3.11.5,
`TauCeti.genus_le_finrank_sub_one_mul_finrank_sub_two_div_two`).
*Needs:* §§6.3, 8.5; Tau Ceti theorems named above.

**Checks.**

- `k = 𝔽_p(s)`, `F = k(t) ⊂ F′ = k(y)` with `t = y^p`, at `P = (t − s)`: `e = 1` and `f = p`, for any
  `k` of characteristic `p` with `s ∉ k^p` (`TauCeti.Place.ramificationIdx_adicOfIrreducible_X_pow_sub_C`,
  `TauCeti.Place.relativeDegree_adicOfIrreducible_X_pow_sub_C`).
- In the same extension at `P = (t)`: `ord_{(y)}(t) = p`, so `e = p` and `f = 1`.
- `y² = x³ − x` over `ℚ`: Riemann's inequality gives `g ≤ (2 − 1)(3 − 1) = 2`, and the plane bound
  with `n = [F : ℚ(y)] = 3` and `x ∈ L((y)_∞) = L(3O)` gives `g ≤ 1`, equality.

### Examples

The inseparable drop `y² = x^p − t` over `𝔽_p(t)` (`p` odd): genus `(p − 1)/2` drops to `0` after
adjoining `t^{1/p}`; at `p = 3` the regular model has genus `1` and is geometrically reduced but not
smooth, which guards both §8.1's item 3 and §12's smoothness criterion. The rational-function-field
example of §8.3 guards constant-extension ramification at `(t^p − a)` and the opposite conflation at
`(t)`. The fierce biquadratic regression of §8.8 prevents a classical Hilbert sum or a
prime-to-`e` test from replacing the trace-dual different.

### Dependencies

Layers 0–7; §12B.0 for the smooth-model branch and the genus-drop route; LocalFieldsRamification
Layer 3 for completions with finite residue field; Tau Ceti's constant-extension, ramification-group
and genus-bound theorems named above.

## Layer 9: Kähler differentials, residues, and the comparison

Stichtenoth §§4.1–4.3. This layer reconciles the formalism of record (Weil differentials) with
Mathlib's `KaehlerDifferential`, so that consumers and the invariant differential of elliptic
curves speak one language. §9.1 stands on Layers 0–3 alone; the comparison map is
`δ(x) := Cotr_{F/k(x)}(η)`, so §9.3 depends on Layer 7's cotrace and §5.7's `η`.

### 9.1 Ω[F⁄k] is one-dimensional

For `F/k` with a separating element `x` (equivalently separably generated; always over perfect
`k`, by §8.11): `dim_F Ω[F⁄k] = 1` (`TauCeti.finrank_kaehlerDifferential_eq_one_of_separating`),
with basis `dx` (`TauCeti.kaehlerBasisOfSeparating`) and `dy = (dy/dx) · dx`
(`TauCeti.derivativeOfSeparating_smul_D`), and the derivative calculus of Stichtenoth
Def. 4.1.1–Lemma 4.1.6 with the universal property Prop. 4.1.8(d). Stichtenoth sets `dt := 0` for
non-separating `t` inside his one-dimensional module `Δ_F` (Def. 4.1.7), whereas Mathlib's
`Ω[F⁄k]` is the genuine Kähler module, whose dimension jumps for inseparably generated `F/k`; the
carrier throughout is `Ω[F⁄k]`, with `Δ_F` as reference vocabulary for the separably generated
case. The route: Mathlib's `Algebra.FormallyEtale.of_isSeparable` for `F/k(x)` and
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` give
`F ⊗_{k(x)} Ω[k(x)⁄k] ≃ₗ[F] Ω[F⁄k]`, and the polynomial basis identifies the generator with `dx`.
*Needs:* Layers 0–3; Tau Ceti `TauCeti.finrank_kaehlerDifferential_eq_one_of_separating`,
`TauCeti.kaehlerBasisOfSeparating`, `TauCeti.derivativeOfSeparating_smul_D`; Mathlib
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, `Algebra.FormallyEtale.of_isSeparable`.

**Checks.**

- `Ω[k(x)⁄k]` has basis `dx`, and `d(x^p) = p x^{p−1} dx = 0` in characteristic `p`.
- For `y² = x³ − x` over `ℚ`, `2y dy = (3x² − 1) dx`, so `dy = ((3x² − 1)/(2y)) dx`.
- For `k = 𝔽_p(a, b)` and `F = k(x, y)` with `y^p = a + b x^p`, the relation differentiates to
  `0 = 0`, so `dx` and `dy` are independent and `dim_F Ω[F⁄k] = 2`: the dimension jumps without a
  separating element.

### 9.2 Local expansions and residues

Keep the separably generated hypothesis (automatic for perfect `k`). From §5.7's complete-DVR
construction choose a uniformizer `t`. At a rational place prove that the completed valuation
ring is `k[[T]]` with `T ↦ t`, extend to `k((T))`, and prove uniqueness of coefficients; transport
FormalLaurentPuiseux L1–L3's coordinate substitution and residue transformation, in every
characteristic, along these isomorphisms. At a non-rational place require `F_P/k` separable;
construct the unique `k`-compatible coefficient field `F_P → Ô_P` by Hensel lifting and the
isomorphism `Ô_P ≃ₐ[k] F_P[[T]]`; prove that `t` is separating (the coefficient-field-killing
derivation sends `t` to `1`), so `dt` is a basis of `Ω[F⁄k]`, and that the derivative of `F`
corresponds to the derivative of `F_P((T))`. Define the `F_P`-valued residue `res_{P,t}(z) := a₋₁`
(Def. 4.2.8), prove the transformation formula `res_{P,s}(z) = res_{P,t}(z · ds/dt)` (Prop. 4.2.9),
including characteristic `p`, define `res_P(z dt) := res_{P,t}(z)` independently of `t`
(Def. 4.2.10), and compose with `Algebra.trace k F_P` for the `k`-valued local residue. The
residue at a rational place over a perfect field is the pinned
`TauCeti.Place.kaehlerResidueOfPerfectField`.
*Needs:* §§5.7, 9.1; FormalLaurentPuiseux L1–L3 (substitutions, continuous derivations, residue
transformation); Tau Ceti `TauCeti.Place.kaehlerResidueOfPerfectField`; Mathlib `LaurentSeries`,
`Algebra.trace`.

**Checks.**

- On `k(x)`, `res_{P_0}(dx/x) = 1` and `res_{P_∞}(dx/x) = −1`, with `t = 1/x` at infinity.
- Transformation with `s = 2t` (characteristic not `2`): `res_s(1/s) = 1` and
  `res_t((1/(2t)) · 2) = 1`.
- In characteristic `p`, `x^{−p−1} dx` has residue `0` at `P_0` while `x^{−1} dx` has residue `1`,
  and `x^{−p−1} dx` is not exact in `k((x))`: a Laurent antiderivative would need a term `c x^{−p}`
  with `−p · c = 1`, impossible in characteristic `p`. A residue read as the obstruction to
  exactness, correct in characteristic `0`, would give it a nonzero value. Its neighbour
  `x^{−p} dx = d(x^{1−p})` (since `1 − p = 1` in `k`) is exact, of residue `0`; at `p = 3`,
  `d(c x^{−3}) = −3c x^{−4} dx = 0`.

### 9.3 The comparison theorem and the residue theorem

The linear comparison needs only exact constants and a separating `x`: with §5.7's rational
`η_x`, `δ(x) := Cotr_{F/k(x)}(η_x)` is the pinned `TauCeti.weilDifferentialOfSeparating`, nonzero,
and `μ : Ω[F⁄k] ≃ₗ[F] Ω_F`, `z dx ↦ z · δ(x)`, is
`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating` (Thm. 4.3.2), sending `dy` to
`(dy/dx) · δ(x)`; the canonical divisor formula `(dx) = −2(x)_∞ + Diff(F/k(x))`, of degree `2g − 2`,
is `TauCeti.weilDifferentialDivisor_weilDifferentialOfSeparating` (Rem. 4.3.7(c)). Without
perfectness, the chain rule `Cotr_{F/k(y)}(η_y) = (dy/dx) · Cotr_{F/k(x)}(η_x)` holds for any two
separating `x` and `y` over exact constants (Thm. 4.3.2(a); the pinned
`TauCeti.weilDifferentialOfSeparating_eq_derivativeOfSeparating_smul`, with no rational place
assumed), so `μ` does not depend on `x` (the pinned
`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating_eq`). Local components are trace
residues at every place `P` with `F_P/k` separable: for a separating prime element `t` of `P`, the
local component at `P` of `μ(ω)` is `u ↦ Tr_{F_P/k}(res_{P,t}(u ω/dt))` (Thm. 4.3.2(d) and
Rem. 4.3.7(d); the pinned `TauCeti.Place.traceResidue_coord_smul_eq_repartitionDualComponent`,
over exact constants with no condition on `k`). Perfect `k` enters only for the **residue
theorem** `∑_P Tr_{F_P/k}(res_P(ω)) = 0`, whose sum needs a trace residue at every place; over
perfect `k` every residue field is separable and every prime element separating (the pinned
`TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`: perfect exact `k`, a prime
element `t_P` chosen at each place, the trace residues of `ω/dt_P` summed over the places of every
degree). Over algebraically closed `k` this is the sum of coefficient residues (the pinned
`TauCeti.finsum_kaehlerResidueOfPerfectField_eq_zero`). §5.7's abstract identity keeps its
arbitrary-field generality.
*Needs:* §§9.1–9.2, §7.3, §5.7; Tau Ceti `TauCeti.weilDifferentialOfSeparating`,
`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating`,
`TauCeti.weilDifferentialDivisor_weilDifferentialOfSeparating`,
`TauCeti.weilDifferentialOfSeparating_eq_derivativeOfSeparating_smul`,
`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating_eq`,
`TauCeti.Place.traceResidue_coord_smul_eq_repartitionDualComponent`,
`TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`,
`TauCeti.finsum_kaehlerResidueOfPerfectField_eq_zero`.

**Checks.**

- For `y² = x³ − x` over `ℚ`, `(x)_∞ = 2O` and `Diff = P₀ + P₁ + P₋₁ + O`, so
  `(dx) = P₀ + P₁ + P₋₁ − 3O = div y`, of degree `0 = 2g − 2`, and `dx/y` has divisor `0`.
- On `ℚ(x)`, `x dx/(x² + 1)` has residue `1/2 ∈ ℚ(i)` at `P_{x²+1}`, with trace `1`, and residue
  `−1` at `P_∞`: the traced sum is `0`, while the untraced sum `1/2 − 1` is not.
- `dx/x` on `k(x)`: residues `1` at `P_0` and `−1` at `P_∞`, sum `0`.

### Examples

On `y² = x³ − x` over `ℚ`, the differential `dx/y` is regular and nowhere vanishing, a basis of the
one-dimensional space of regular differentials (`g = 1`). On `ℚ(x)`, the residue theorem for
`x dx/(x² + 1)` needs the trace at the degree-two place.

### Dependencies

Layers 0–7; FormalLaurentPuiseux L1–L3; Mathlib Kähler differentials and Laurent series; Tau Ceti's
Kähler, Weil and residue theorems named above.

## Layer 10: model classes — elliptic, hyperelliptic, plane curves

Stichtenoth §§6.1–6.4; Fulton Chs. 5 and 8 for the plane-curve computations.

### 10.1 Elliptic function fields

The definition of record is Stichtenoth Def. 6.1.1: genus `1` together with a divisor of degree
`1` (a divisor, not a rational place; Riemann–Roch produces the place, Prop. 6.1.6(a)). With exact
constants, at a rational place `P₀` the ladder `ℓ(iP₀) = i` gives `x, y` with pole divisors `2P₀`
and `3P₀`, `F = k(x, y)`, satisfying a long Weierstrass equation over `k` (Prop. 6.1.2; the pinned
`TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`, in
`TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean`), with no
nonsingularity asserted. Normal forms: in characteristic not `2`, `y² = f(x)` with `f` a cubic
(`TauCeti.Place.exists_isWeierstrassCoordinates_isCharNeTwoNF_of_genus_eq_one`), squarefree
(a repeated factor would make `F` rational), and conversely every squarefree cubic gives genus `1`
with exact constants; in characteristic `2`, Mathlib's shapes `IsCharTwoJNeZeroNF`
(`Y² + XY = X³ + a₂X² + a₆`) and `IsCharTwoJEqZeroNF` (`Y² + a₃Y = X³ + a₄X + a₆`)
(`TauCeti.Place.exists_isWeierstrassCoordinates_isCharTwoNF_of_genus_eq_one`), with no
discriminant condition. **Nonsingularity is the smooth-model branch**: for such an equation `W`,
`W.IsElliptic` holds iff the regular model `X_F` is smooth over `k` (§8.1 item 3, §12B.0b), the
projective cubic being the regular model because its arithmetic genus equals the genus `1`; over
perfect `k` every genus-one field with a degree-one divisor is the function field of a
nonsingular Weierstrass curve, and over imperfect `k` smoothness is a hypothesis. In the normal
forms nonsingularity reads `f` separable (characteristic not `2`), `a₆ ≠ 0` (`j ≠ 0`),
`a₃ ≠ 0` (`j = 0`). The converse, a nonsingular equation giving a genus-one field with exact
constants, holds in every characteristic. For the odd-characteristic squarefree cubic,
`Diff(F/k(x))` is the reduced sum of the places over the branch divisor plus `Q_∞` (Prop. 6.1.3);
characteristic `2` uses the weighted different from the Weierstrass derivative. The degree-one
places form a group isomorphic to `Cl⁰(F)` through `P ↦ [P − P₀]`, with `P ⊕ Q = R` iff
`P + Q ∼ R + P₀` (Prop. 6.1.6(b), 6.1.7).
*Needs:* §§5.1, 7.4, 8.1; Tau Ceti `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`
and its normal-form refinements; Mathlib `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`.

**Checks.**

- `y² = x³ − x` over `ℚ`: `Δ = −16(4 · (−1)³ + 27 · 0²) = 64 ≠ 0`, nonsingular, genus `1`.
- Over `k = 𝔽₂(a)`, `y² = x³ + a`: `F/k(y)` has degree `3`, the place `y² + a` (degree `2`) and the
  place at infinity have `e = 3`, `f = 1`, different exponent `2`, so
  `2g − 2 = 3 · (−2) + 2 · 2 + 2 · 1 = 0`; the rational place at infinity gives exact constants and `y`
  is separating; yet `a₃ = 0` gives `Δ = a₃⁴ = 0`, and over `k(√a)` the field is rational
  (`v = y + √a`, `u = v/x`, `x = u²`, `v = u³`), so `F` has no nonsingular Weierstrass model over `k`.
- In characteristic `3`, `y² = x³ − t` over `𝔽₃(t)` is squarefree but inseparable, with
  `Δ = −27b₆² = 0`.

### 10.2 The Mathlib compatibility statements

The general theory meets `Mathlib/AlgebraicGeometry/EllipticCurve/` in four statements, which
EllipticCurves consumes as named interfaces:
(i) `genus k W.toAffine.FunctionField = 1` for `[W.IsElliptic]`, in every characteristic (the
pinned `WeierstrassCurve.Affine.genus_functionField`);
(ii) `W.toAffine.CoordinateRing` is the integral closure of `k[x]` in the function field, and the
elliptic `IsDedekindDomain` instance (`WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing`
with `WeierstrassCurve.Affine.isDedekindDomain_coordinateRing_of_isIntegrallyClosed`) follows from
§10.3's local computation: the ring is a Noetherian domain whose localizations at maximal ideals
are DVRs (Mathlib's `isDedekindDomain_iff_isDiscreteValuationRing_atPrime`);
(iii) the point–place dictionary `W.toAffine.Point ≃` degree-one places, from §10.3's affine and
infinity classification: degree-one affine places are the `k`-rational maximal ideals, Mathlib's
`WeierstrassCurve.Affine.CoordinateRing.XYIdeal`, and Prop. 6.1.6 gives the general genus-one form
independently;
(iv) `Cl⁰(W.toAffine.FunctionField) ≅ ClassGroup W.toAffine.CoordinateRing`, §3.6's bridge for one
rational place at infinity (`TauCeti.Divisor.degreeZeroClassGroupEquiv`), which with Mathlib's
injective `WeierstrassCurve.Affine.Point.toClass` closes the triangle `E(k) ≅ Cl⁰` without
re-proving the group law.
*Needs:* §§3.6, 10.1, 10.3; Tau Ceti `WeierstrassCurve.Affine.genus_functionField`,
`WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing`,
`WeierstrassCurve.Affine.isDedekindDomain_coordinateRing_of_isIntegrallyClosed`,
`TauCeti.Divisor.degreeZeroClassGroupEquiv`; Mathlib `WeierstrassCurve.Affine.Point.toClass`,
`WeierstrassCurve.Affine.CoordinateRing.XYIdeal`, `isDedekindDomain_iff_isDiscreteValuationRing_atPrime`.

**Checks.**

- (i) at `y² = x³ − x` over `ℚ`: genus `1`, matching Hurwitz `0 = 2 · (−2) + 4`.
- (iii) at `y² = x³ − x` over `𝔽₃`: four points `(0, 0)`, `(1, 0)`, `(2, 0)`, `O` and four degree-one
  places.
- (iv) at `y² = x³ − x` over `ℚ`: the class of `P − O`, `P = (0, 0)`, has order `2`, matching the
  `2`-torsion point `(0, 0)`.

### 10.3 The elliptic invariant differential

In Mathlib's Kähler module define `ω = dx/(2y + a₁x + a₃) ∈ Ω[W.toAffine.FunctionField⁄k]`, with
nonzero denominator for elliptic `W`, the expression EllipticCurves uses. This is the early
Weierstrass local-ring milestone, the local elliptic-differential computation available after
Layer 0: it needs only Layer 0's places and the smooth Weierstrass local rings built here,
independently of the genus-one comparison and of Layers 7–9. Prove in all characteristics, including imperfect
`k`, that `Ω[𝒪_P⁄k]` maps injectively into `Ω[W.toAffine.FunctionField⁄k]` and that `ω` generates
its image at each place. For the affine coordinate ring `A`, prove that the equation and its two
partial derivatives generate the unit ideal (unit discriminant, nonsingularity over every residue
field), so `A` is smooth of dimension one and its Kähler module is free on `ω`; construct the affine
places from the local DVRs of `A` and prove that every place with `ord_P(x) ≥ 0` has
`ord_P(y) ≥ 0` (monic Weierstrass equation) with `𝒪_P` the localization of `A` at its center. At
infinity use the chart `z = −x/y`, `w = −1/y` with
`f = w − z³ − a₁zw − a₂z²w − a₃w² − a₄zw² − a₆w³ = 0`; as a polynomial in `z` over `k[w]`, `−f` is monic
and Eisenstein at `(w)` (Mathlib's `Polynomial.IsEisensteinAt.irreducible`), so `k[z, w]/(f)` is a
domain integral over `k[w]`, mapping injectively to the function field; its localization at `(z, w)`
is a DVR since `∂f/∂w(0, 0) = 1`, with uniformizer `z` and residue field `k`. The place at infinity is
unique (`ord_P(x) < 0` forces `2 ord_P(y) = 3 ord_P(x)`), which with the affine classification
accounts for every place, and the rational infinity place gives exact constants. From
`f_z dz + f_w dw = 0` and `w f_w + z f_z = w(−2 + a₁z + a₃w)` modulo `f`, `ω = dz/f_w` with
`ω/dz ∈ 𝒪_∞ˣ`, including characteristic `2`. Under `k` perfect, deduce with §9.3 that the Weil divisor
of `ω` is `0`, consuming Layer 7 to prove that the affine different over `k[x]` is generated by
`2y + a₁x + a₃`, including wild characteristic `2`.
*Needs:* Layer 0, §10.1; Layer 7 and §9.3 for the divisor statement; Mathlib `KaehlerDifferential`,
`Polynomial.IsEisensteinAt.irreducible`, `Ideal.eq_bot_of_under_eq_bot`.

**Checks.**

- `y² = x³ − x` over `ℚ`: `ω = dx/(2y)` has divisor `0` (§9.3's computation of `(dx) = div y`).
- `y² + y = x³` over `𝔽₂`: `a₃ = 1` and `2y + a₃ = 1`, so `ω = dx`, and
  `(dx) = −2(x)_∞ + Diff = −4Q_∞ + 4Q_∞ = 0`.
- At infinity `f_w(0, 0) = 1`, so `ω/dz` is a unit at `Q_∞` in every characteristic.

### 10.4 Hyperelliptic function fields

The definition of record is `g ≥ 2` together with a rational subfield `k(x) ⊆ F` with
`[F : k(x)] = 2` and `F/k(x)` separable; separability is part of the definition, since over an
arbitrary `k` an index-two subfield can be inseparable in characteristic `2`, and over perfect `k` it
is automatic, so the definition agrees there with Stichtenoth Def. 6.2.1 (that equivalence is a
target here). The pin's predicate is `TauCeti.IsHyperellipticFunctionField`. Prove that `F/k(x)` is
cyclic of degree `2`; the characterization by a divisor `A` with `deg A = 2` and `ℓ(A) ≥ 2`; that every
genus-two field over perfect `k` is hyperelliptic (Lemma 6.2.2; pinned as
`TauCeti.isHyperellipticFunctionField_of_genus_eq_two_of_perfectField`, and with `char k ≠ 2` in place
of perfectness as `TauCeti.isHyperellipticFunctionField_of_genus_eq_two`); the models `y² = f(x)` in
characteristic not `2` with `f` squarefree of degree `2g + 1` or `2g + 2` and the genus formula
`g = (m − 1)/2` for odd `m = deg f` and `(m − 2)/2` for even `m` (Prop. 6.2.3; the pinned
`TauCeti.genus_eq_of_sq_eq`), with the ramified places from Riemann–Hurwitz; the characteristic-two
models through Artin–Schreier theory (§10.6); uniqueness of the degree-two rational subfield
(`[F : k(z)] ≤ g` implies `z ∈ k(x)`, `TauCeti.mem_adjoin_of_finrank_adjoin_le_genus`, hence `k(z) = k(x)`
when `g ≥ 2` and `[F : k(z)] = 2`, `TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two`) and its
description by regular differentials (Prop. 6.2.4).
*Needs:* §§5.1, 7.4, 10.6; Tau Ceti `TauCeti.IsHyperellipticFunctionField`,
`TauCeti.isHyperellipticFunctionField_of_genus_eq_two_of_perfectField`,
`TauCeti.isHyperellipticFunctionField_of_genus_eq_two`, `TauCeti.genus_eq_of_sq_eq`,
`TauCeti.mem_adjoin_of_finrank_adjoin_le_genus`, `TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two`.

**Checks.**

- `y² = x⁵ − 1`, characteristic not `2` or `5`: `g = (5 − 1)/2 = 2`; the branch places are the zeros of
  `x⁵ − 1` (total degree `5`) and `∞`, and `2 · 2 − 2 = 2 · (−2) + 6`.
- `y² = x⁶ − 1`, characteristic not `2` or `3`: `g = (6 − 2)/2 = 2`, and `∞` is unramified because `6` is
  even: `2 = 2 · (−2) + 6` again.
- `y² = x³ − x` has genus `1` and is not hyperelliptic in this definition (`g ≥ 2` fails).

### 10.5 Smooth plane curves

One function-field route (Fulton Chs. 5, 8; Stichtenoth's Appendix B vocabulary): homogeneous
coordinates, the three affine charts, smoothness through homogeneous partial derivatives and the
function field of an integral projective plane equation; after a finite separable constant
extension if necessary, a projection centre off the curve and its tangent and exceptional locus,
so that the linear coordinate `x` is separating with `[F : k(x)] = d`; the places over infinity and
their uniformizers; the local different exponents from the projected equation; independence of the
chosen separable extension; and for imperfect `k`, passage to an algebraic closure through §12B.0
and §8.2 without changing the genus, with the canonical divisor and space of forms descended by
§12B.0c and faithful flatness. The canonical divisor is cut by forms of degree `d − 3` and
`g = (d − 1)(d − 2)/2`. The genus formula is pinned over an arbitrary constant field:
`TauCeti.genus_eq_of_isHomogeneous` takes `G` homogeneous of degree `d` over `k`, nonsingular at
every point over an algebraically closed extension `K` of `k`, and `F = k(x, y)` with `x`
transcendental and `G(x, y, 1) = 0`, and concludes `g = (d − 1)(d − 2)/2`, exactness being a
consequence of nonsingularity; the form with more than `d + 1` constants is
`TauCeti.genus_eq_of_isHomogeneous_of_lt_card`, and the form in any chart is
`TauCeti.genus_eq_of_isHomogeneous_of_aeval_insertNth_eq_zero`. Fulton's adjoint calculation is a
cross-check only; singular plane curves are outside the roadmap.
*Needs:* §§7.4, 8.2, 9.3, §12B.0; Tau Ceti `TauCeti.genus_eq_of_isHomogeneous`,
`TauCeti.genus_eq_of_isHomogeneous_of_lt_card`,
`TauCeti.genus_eq_of_isHomogeneous_of_aeval_insertNth_eq_zero`; Mathlib `MvPolynomial.IsHomogeneous`,
`MvPolynomial.pderiv`.

**Checks.**

- The projective closure of `x³y + y³ + x = 0` over an algebraically closed field of characteristic
  zero is smooth of degree `4`: `g = 3 · 2/2 = 3`.
- A smooth cubic has `g = 1` and a line or smooth conic `g = 0`.
- The nodal cubic `y² = x²(x + 1)` is singular at `(0, 0)` and has genus `0`, not `1`: the
  nonsingularity hypothesis is load-bearing.

### 10.6 Kummer and Artin–Schreier covers

**Kummer** `F′ = F(y)`, `yⁿ = u` (Prop. 3.7.3, Cor. 3.7.4, Ex. 3.7.6), under four hypotheses: (a)
`n > 1`; (b) `char k ∤ n`; (c) `k` contains a primitive `n`-th root of unity (making the extension
Galois with group `ℤ/n`); (d) `u ≠ w^d` for every `w ∈ F` and every divisor `d > 1` of `n` (making
`Tⁿ − u` irreducible; the sufficient form "some place has `gcd(v_P(u), n) = 1`" is its own lemma).
Then `e(P′∣P) = n/r_P` and `d(P′∣P) = n/r_P − 1` for `r_P = gcd(n, v_P(u))`. This local data is
pinned for every `n` invertible in `k`, for `F′ = F(y)` finite and separable over `F` and
`u ≠ 0`, without (c) or (d): `TauCeti.Place.ramificationIdx_eq_of_pow_eq` and
`TauCeti.Place.differentExponent_add_one_eq_of_pow_eq`, the latter as `d(P′∣P) + 1 = n/r_P`, free of
truncated subtraction. The targets here are the exact constant field criterion and the genus
formula. **Artin–Schreier**
`F′ = F(y)`, `y^p − y = u`, `char k = p > 0` (Prop. 3.7.8, with the elementary abelian Prop. 3.7.10),
under `u ∉ {w^p − w ∣ w ∈ F}` and with the reduced local invariant `m_P` supplied with its actual
hypothesis: if `F_P` is perfect, there is a substitute `u − (w^p − w)` regular at `P` (`m_P := −1`) or
with a pole of order `m_P` prime to `p`; for arbitrary residue fields such a representative is
explicit input (in `𝔽_p(a)((t))` with `a ∉ 𝔽_p(a)^p`, the term `a t^{−p}` cannot be cancelled). Under
that hypothesis: `d(P′∣P) = (p − 1)(m_P + 1)` with total ramification at every pole of a reduced
representative (`TauCeti.Place.differentExponent_eq_of_sub_pow_sub_self_ord_eq_neg`), wildness there
(`TauCeti.Place.isWild_of_exists_reduced_artinSchreier_pole`), `e = 1` and `d = 0` where a
representative is regular (`TauCeti.Place.differentExponent_eq_zero_of_exists_sub_pow_sub_self_mem_integers`),
and the genus formula with reduced representatives as input
(`TauCeti.two_mul_genus_sub_two_eq_of_exists_reduced_artinSchreier_poles`). These two families test
the tame and wild halves of Layer 7.
*Needs:* §§6.5, 7.4; Tau Ceti theorems named above.

**Checks.**

- `y³ = x` over `ℚ` satisfies (a), (b) and (d) but not (c): `ℚ(x, x^{1/3})/ℚ(x)` is not normal.
- `y² + y = x³` over `𝔽₂`: `u = x³` is reduced at `∞` with `m_∞ = 3`, so `d = (2 − 1)(3 + 1) = 4` and
  `2g − 2 = 2 · (−2) + 4`, `g = 1`.
- `y² + y = x² + x` over `𝔽₂` is trivial (`u = w² + w` with `w = x`), and `y² + y = x²` reduces to
  `u − (x² + x) = x`, with `m_∞ = 1` and genus `0`: the pole order `2`, divisible by `p`, gives no
  formula until reduced.

### Examples

A genus-one cubic is Mathlib's elliptic curve: for `[W.IsElliptic]`,
`genus k W.toAffine.FunctionField = 1` and `ℓ(n · [O]) = n` for `n ≥ 1`; over `ℚ`, `y² = x³ − x` has
the four branch places as different and Hurwitz `2 · 1 − 2 = 2 · (−2) + 4`. Hyperelliptic genus two:
`y² = x⁵ − 1` over `k` with `char k ∉ {2, 5}` (the Kummer hypotheses hold: `n = 2`, `−1` is a
primitive square root of unity, `x⁵ − 1` is squarefree and not a square), genus `2` by
`TauCeti.genus_eq_of_sq_eq`, different of degree `6`. The smooth plane quartic `x³y + y³ + x = 0` has
genus `3 = (4 − 1)(4 − 2)/2` (the instance `d = 4` of `TauCeti.genus_eq_of_isHomogeneous`); its full
automorphism group is not an acceptance criterion.

### Dependencies

Layers 0–9 and §12B.0; Mathlib Weierstrass curves, Kähler differentials, homogeneous polynomials and
Eisenstein polynomials; Tau Ceti's elliptic, hyperelliptic, plane-curve, Kummer and Artin–Schreier
theorems named above.

## Layer 11: automorphisms and the Hurwitz bound

Stichtenoth contains no numbered theorem on automorphism groups: the bound `84(g − 1)` is his
Exercise 3.18 (algebraically closed `k`, `gcd(|G|, char k) = 1`), finiteness for `g ≥ 2` is a remark
without proof, and the counterexamples are Exercises 1.2, 6.10 and 6.14. The written sources of
record are Rosenlicht (finiteness over every algebraically closed field), Villa Salvador and
Hartshorne IV.

### 11.1 The automorphism group and small genus

`Aut(F/k)` is the group of `k`-algebra automorphisms of `F`; it acts on places
(`v_{σP}(y) = v_P(σ⁻¹ y)`), divisors, `L(D)` and `Ω_F`, and preserves the canonical class and the
gap sequences (`TauCeti.Place.weierstrassWeight_smul`). The fixed field `F^G` of a finite
`G ≤ Aut(F/k)` is a function field (`TauCeti.IsFunctionField.fixedField`) with `F/F^G` Galois of
group `G`. Small genus, with field hypotheses: `Aut(k(x)/k) ≅ PGL₂(k)` over every `k` (Stichtenoth
Ex. 1.2; `RatFunc.pglEquivAlgEquiv`, in `TauCeti/FieldTheory/RatFunc/Mobius.lean`), infinite exactly
when `k` is infinite; in genus one the translations form a normal subgroup isomorphic to `Cl⁰(F)`
with finite quotient (Ex. 6.14), infinite over algebraically closed `k`
(`TauCeti.infinite_algEquiv_of_genus_eq_one`) and finite over finite `k` (§5.6).
*Needs:* Layers 3–6; Tau Ceti `TauCeti.IsFunctionField.fixedField`, `RatFunc.pglEquivAlgEquiv`,
`TauCeti.infinite_algEquiv_of_genus_eq_one`, `TauCeti.Place.weierstrassWeight_smul`.

**Checks.**

- `Aut(𝔽_q(x)/𝔽_q) ≅ PGL₂(𝔽_q)` has order `q(q² − 1)`, which is `6` for `q = 2`.
- `x ↦ x + n` for `n ∈ ℤ` gives infinitely many automorphisms of `ℚ(x)/ℚ`.
- For `y² = x³ − x` over `𝔽₃`, the translations form a group of order `h = 4`; over `𝔽̄₃` they are
  infinite.

### 11.2 Rigidity

An automorphism fixing `2g + 3` distinct rational places of a function field with exact constants
is the identity (Stichtenoth Ex. 3.16–3.17; the pinned `TauCeti.eq_one_of_two_mul_genus_add_three_le_card`),
so an `Aut`-invariant finite set of at least `2g + 3` rational places makes `Aut(F/k)` finite (the
pinned `TauCeti.finite_algEquiv_of_invariant_rational_places`).
*Needs:* §§7.4, 11.1; Tau Ceti `TauCeti.eq_one_of_two_mul_genus_add_three_le_card`,
`TauCeti.finite_algEquiv_of_invariant_rational_places`.

**Checks.**

- On `k(x)`, a Möbius transformation fixing `0`, `1` and `∞` is the identity (`2g + 3 = 3`).
- In characteristic not `2`, `x ↦ 1/x` fixes the two rational places `x = ±1` and is not the
  identity: two places do not suffice in genus `0`. In characteristic `2` the two coincide, and
  `x = 1` is its only fixed rational place.
- Over a field `k` of characteristic not `2` or `5` containing a primitive fifth root of unity `ζ`
  (`ℚ(ζ₅)`, or `𝔽₁₁` since `5 ∣ 11 − 1`), the hyperelliptic involution `y ↦ −y` of `y² = x⁵ − 1`
  fixes the `6 = 2g + 2` rational branch places `x = ζⁱ` (`0 ≤ i ≤ 4`) and `∞`, and is not the
  identity, so `2g + 2` rational places do not suffice in genus `2`. Over `ℚ` only the branch places
  over `x = 1` and `∞` are rational, and the one over `x⁴ + x³ + x² + x + 1` has degree `4`.

### 11.3 Weierstrass points

Over algebraically closed `k`, at places where the gaps stay pairwise distinct in `k` (always in
characteristic zero, and in characteristic `p ≥ 2g − 1`, since every gap lies in `1, …, 2g − 1`),
define the Weierstrass weight `w(P) = ∑ⱼ (lⱼ − j)` of the gaps `l₁ < ⋯ < l_g`
(`TauCeti.Place.weierstrassWeight`, with `TauCeti.Place.weierstrassGaps`), prove that the Wronskian
of a basis of `L(W)` vanishes to order `w(P)` corrected by `g · W(P)`, that finitely many places have
positive weight (`TauCeti.Place.finite_setOf_weierstrassWeight_ne_zero`), that the total weight is
`g³ − g` for `g ≥ 2` (`TauCeti.finsum_weierstrassWeight`), and the counts: between `2g + 2` and `g³ − g`
Weierstrass points (`TauCeti.two_mul_genus_add_two_le_ncard_setOf_weierstrassWeight_ne_zero`,
`TauCeti.ncard_setOf_weierstrassWeight_ne_zero_le_genus_pow_three_sub_genus`), exactly `2g + 2` iff `F`
is hyperelliptic (`TauCeti.isHyperellipticFunctionField_iff_ncard_setOf_weierstrassWeight_ne_zero_eq`),
and at least `2g + 3` for non-hyperelliptic `F`
(`TauCeti.two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero`). Stichtenoth's
Rem. 1.6.9 cites the counts without proof; the Wronskian treatment is Goldschmidt's. The
Hasse–Schmidt theory of non-classical curves is outside the roadmap.
*Needs:* §§5.4, 9.1, 10.4; Tau Ceti theorems named above.

**Checks.**

- `y² = x⁵ − 1` in characteristic zero: six Weierstrass points (the branch places), each of weight
  `g(g − 1)/2 = 1`, total `6 = g³ − g`.
- The Klein quartic in characteristic zero has `24` Weierstrass points of weight `1`, total
  `24 = 3³ − 3`.
- The Hermitian curve `y³ + y = x⁴` over `𝔽̄₃` has genus `3` and gaps `{1, 2, 5}` at `P_∞` (semigroup
  generated by `3` and `4`); `2 = 5` in `𝔽₃`, so the distinct-gap hypothesis fails.

### 11.4 Finiteness for g ≥ 2

The headline theorem, over an arbitrary field `k`: let `F/k` have exact constants and genus
`g ≥ 2`, let `K` be an algebraic closure of `k` (`[IsAlgClosure k K]`) and let `F′` be a field
generated by `F` and `K` (the scalar tower of the conventions table with
`TauCeti.constantCompositum F K F′ = ⊤`). If `g(F′/K) > 0`, then `F` has finitely many
`k`-automorphisms (`finite_algEquiv_of_two_le_genus_of_genus_constantCompositum_pos`; Rosenlicht
1955, §3, p. 5, with §2, Theorem, p. 4). Since the genus never increases under algebraic constant
extension (the pinned `TauCeti.genus_le_genus_of_constantCompositum_eq_top`), `g(F′/K) ≥ 2` already
implies `g ≥ 2`; the theorem also covers a drop from `g ≥ 2` to `g(F′/K) = 1`.

Over a perfect `k` it reads: a function field with exact constants and genus `g ≥ 2` has finitely
many `k`-automorphisms, in every characteristic (`finite_algEquiv_of_two_le_genus`). Here `F/k` is
separably generated
(`TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField`), so
`F ⊗[k] k̄` is a domain (the pinned `TauCeti.isDomain_tensorProduct_of_separating`), algebraic over
`F` and hence a field `F′`, and `F′/k̄` has genus `g` because `k̄/k` is separable (the pinned
`TauCeti.genus_eq_genus_of_constantCompositum_eq_top`, which needs no smooth model).

The pinned `TauCeti.finite_algEquiv_of_two_le_genus` is the case of an algebraically closed field
on which the gaps at every place are pairwise distinct (characteristic zero or `p ≥ 2g − 1`),
proved through §11.3's counts and §11.2's rigidity in the non-hyperelliptic case
(`TauCeti.finite_algEquiv_of_not_isHyperellipticFunctionField`) and through the branch places of
the index-two subfield in the hyperelliptic case (`TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two`).
The route of the general theorem:

1. *Extension to the compositum.* Prove that every `k`-automorphism `σ` of `F` extends uniquely to
   a `K`-automorphism of `F′`, giving an injective homomorphism `Aut(F/k) → Aut(F′/K)`. For the
   separable closure `k^sep` of `k` in `K`, exactness makes `F ⊗[k] k^sep` a domain (the pinned
   `TauCeti.isDomain_tensorProduct_of_isIntegrallyClosedIn`), integral over `F` and hence a field;
   `K/k^sep` is purely inseparable (Mathlib's `separableClosure.isPurelyInseparable`), so
   `Spec (F ⊗[k] K) → Spec (F ⊗[k] k^sep)` is a homeomorphism (Mathlib's
   `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`, after
   `F ⊗[k] K ≅ (F ⊗[k] k^sep) ⊗[k^sep] K`) and the nilradical is the only prime ideal of
   `F ⊗[k] K`, which need not be reduced (§8.1's Check `y^p = a + b x^p`); the image of `F ⊗[k] K`
   in `F′` is a domain integral over `F` that generates `F′`, so `F′` is the residue field of that
   prime, which `σ ⊗ id` preserves. `F′/K` is a function field with exact constants `K`.
2. *Geometric genus at least two.* If `g(F′/K) ≥ 2`, `Aut(F′/K)` is finite by Rosenlicht's
   theorem over the algebraically closed `K` (Rosenlicht 1955, §2, Theorem, p. 4), in three steps.
   - *The tricanonical model.* `deg 3W = 6g′ − 6 > 2g′ − 2` for `g′ = g(F′/K)`, so
     `ℓ(3W) = 5g′ − 5` by Riemann–Roch, the map to `ℙ(L(3W))` embeds the regular model of §12B, and
     every automorphism, permuting the canonical divisors, acts by a projective transformation
     (Rosenlicht 1955, §2, first Lemma, pp. 2–3).
   - *An algebraic group.* Prove that the projective transformations preserving the image are the
     `K`-points of a closed subgroup scheme `G′` of `PGL_{5g′−5}` (the pinned
     `TauCeti.ProjectiveGeneralLinear.groupScheme`), cut out by the forms of a fixed degree `N`
     vanishing on the image and acting on it by a morphism `G′ × X → X`, and that the reduced
     identity component `G` (the quotient of the reduced coordinate ring by the pinned
     `TauCeti.HopfAlgebra.identityComponentHopfIdeal`) has finite index in `G′(K)` (Rosenlicht 1955,
     §2, second Lemma, pp. 3–4).
   - *`G` is trivial.* Let `φ : X → Jac X` be the Abel–Jacobi map normalized at a point `P₀`.
     Apply the rigidity lemma (the pinned `TauCeti.AlgebraicGeometry.eq_snd_comp_lift_comp`), with
     the proper geometrically integral curve `X` as first factor, `G` as second factor and
     `Jac X` as target, to `(P, σ) ↦ φ(σP) − φ(P) − φ(σP₀)`. This map sends `X × {e}` to `0`, so it
     equals its value at `(P₀, σ)`, which is `0`: hence `φ(σP) = φ(σP₀) + φ(P)` for `σ ∈ G`. Since
     `φ(X)` is a curve generating `Jac X`, of dimension `g′ ≥ 2`, `σP₀ = P₀`, so `σP − P` is
     principal for every `P`, and `σ = 1` because `g′ > 0` (Rosenlicht 1955, proof of the Theorem
     of §2, p. 4).
3. *Geometric genus one.* If `g(F′/K) = 1` while `g ≥ 2`, then `k` is imperfect, of
   characteristic `p > 0`, since over a perfect `k` the genus is kept (the pinned
   `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`). Suppose `Aut(F/k)` infinite. Its fixed
   field has infinite index in `F`, so it is algebraic over `k` and equals `k` by exactness. Prove
   that for a field `E` of characteristic `p > 0` and a group `G` of automorphisms of `E` with
   fixed field `E^G`, the `p`-th powers of `E^G`-linearly independent elements of `E` are
   `E^G`-linearly independent (Rosenlicht 1955, §3, Lemma, pp. 4–5, whose "separably generated"
   means this criterion of MacLane; without finite generation it does not give a separating
   transcendence basis, see the Checks). Since `F/k` is finitely generated
   (`TauCeti.IsFunctionField.essFiniteType`), Mathlib's
   `exists_isTranscendenceBasis_and_isSeparable_of_linearIndepOn_pow_of_essFiniteType` then gives
   a separating transcendence basis, so `F/k` is separably generated (§3, Corollary, p. 5),
   the generic point of the regular model `X_F` of §12B is smooth over `k`, and the closed points
   at which `X_F` is not smooth form a finite set. `Aut(F/k)` permutes this set through the
   anti-equivalence of §12C, and the set is nonempty, since a smooth `X_F` would keep the genus
   (the pinned `TauCeti.AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top`).
   A subgroup of finite index fixes one such point `P` and one of the finitely many places of `F′`
   over it, and embeds through step 1 into the group of `K`-automorphisms of the genus-one field
   `F′` fixing a place. That group meets the translations trivially, so it embeds into the finite
   quotient of §11.1 by the translations, and is finite. This contradicts the choice of
   `Aut(F/k)` (Rosenlicht 1955, §3, p. 5).

The hypothesis `g(F′/K) > 0` cannot be dropped: over a separably closed imperfect field the
exceptional fields `k(x, y₁, …, yₙ)` with `yᵢ^p − yᵢ = aᵢ x^{p^{mᵢ}} + bᵢ` and `aᵢ ∉ k^p` have
infinitely many automorphisms `x ↦ x + β`, `yᵢ ↦ yᵢ + αᵢ` (Rosenlicht 1955, §3, Theorem and its
converse, p. 10), and their genus drops to `0` over `k̄`. Neither can `g ≥ 2`: an elliptic function
field over `ℚ` with a rational point of infinite order has infinitely many translations.
*Needs:* §§3.4, 4.4, 8.1, 8.2, 8.5, 11.1–11.3, §12B (the pinned model) and §12C (the pinned
`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`); JacobianChallenge
Layers E–F (abelian varieties, `Jac X`, the Abel–Jacobi map and its Albanese property); Tau Ceti
`TauCeti.constantCompositum`, `TauCeti.genus_le_genus_of_constantCompositum_eq_top`,
`TauCeti.genus_eq_genus_of_constantCompositum_eq_top`,
`TauCeti.AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top`,
`TauCeti.ProjectiveGeneralLinear.groupScheme`, `TauCeti.HopfAlgebra.identityComponentHopfIdeal`,
`TauCeti.AlgebraicGeometry.eq_snd_comp_lift_comp`, `TauCeti.finite_algEquiv_of_two_le_genus`,
`TauCeti.finite_algEquiv_of_not_isHyperellipticFunctionField`,
`TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two`, `TauCeti.isDomain_tensorProduct_of_separating`,
`TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField`,
`TauCeti.isDomain_tensorProduct_of_isIntegrallyClosedIn`, `TauCeti.IsFunctionField.essFiniteType`;
Mathlib `IsAlgClosure`, `TensorProduct`, `separableClosure.isPurelyInseparable`,
`PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`,
`exists_isTranscendenceBasis_and_isSeparable_of_linearIndepOn_pow_of_essFiniteType`.

**Checks.**

- The Hermitian curve `y³ + y = x⁴` over `𝔽̄₃` (genus `3`) has the finite automorphism group
  `PGU₃(3)`, of order `3³ · (3³ + 1) · (3² − 1) = 6048`; the pinned distinct-gap theorem does not
  apply to it (§11.3), the headline does.
- Over a separably closed imperfect field of characteristic `5`, `y⁵ − y = a x⁵` with `a ∉ k⁵` has
  exact constants, genus `(5 − 1)(5 − 2)/2 = 6` and infinitely many automorphisms `x ↦ x + β`,
  `y ↦ y + α` with `α⁵ − α = a β⁵` (Rosenlicht 1955, §3, p. 10). Over `k̄`, `w = y − a^{1/5} x` has
  `w⁵ = y⁵ − a x⁵ = y`, so `x = (w⁵ − w)/a^{1/5}` and `F′ = k̄(w)` has genus `0`: the hypothesis
  `g(F′/K) > 0` is load-bearing, and so is perfectness in the perfect-field form.
- `y² = x⁵ − 1` over the imperfect `𝔽₃(t)` has a rational place at `∞`, hence exact constants, and
  genus `2`; `x⁵ − 1` is separable in characteristic `3`, so the model is smooth and the genus stays
  `2` over `k̄`. The general theorem gives a finite automorphism group; the perfect-field form does
  not apply.
- `y² = (x³ − t)(x² − 1)` over `𝔽₃(t)` has genus `(5 − 1)/2 = 2` (squarefree of degree `5`, exact
  constants from the rational place at `∞`); over `k̄`, with `τ³ = t`, `u = y/(x − τ)` satisfies
  `u² = (x − τ)(x² − 1)`, so `g(F′/K) = 1`. The general theorem applies through step 3, while a
  hypothesis `g(F′/K) = g` would not. Directly: an automorphism maps the canonical subfield
  `𝔽₃(t)(x)` (the unique subfield of degree two and genus `0`) to itself and permutes its three
  rational branch places `1`, `−1`, `∞`, which determine a Möbius transformation, so at most
  `2 · 6 = 12` automorphisms exist.
- A genus-one field over `ℂ` has infinitely many automorphisms (§11.1), and so has `y² = x³ − 2`
  over `ℚ`, translated by the multiples of the point `(3, 5)` of infinite order: the hypothesis
  `g ≥ 2` is load-bearing although `g(F′/K) = 1 > 0`.
- The step-3 lemma concludes linear independence of `p`-th powers, not a separating transcendence
  basis. For the perfect closure `E` of `𝔽̄_p(t)` and the translations `t ↦ t + a`, `a ∈ 𝔽̄_p`, the
  fixed field is `𝔽̄_p` (an invariant `u` has `u^{p^n} ∈ 𝔽̄_p(t)` invariant under infinitely many
  translations, hence constant) and the criterion holds (`∑ cᵢ fᵢ^p = (∑ cᵢ^{1/p} fᵢ)^p`), but
  `E/𝔽̄_p` has no separating transcendence basis: for a candidate `s`, `s^{1/p} ∈ E` is a root of
  the irreducible `X^p − s` over `𝔽̄_p(s)`, inseparable of degree `p`. A version of the lemma
  concluding separable generation for every group of automorphisms would be refuted here; `E` is
  not finitely generated over `𝔽̄_p`.

### 11.5 The Hurwitz bound

For `g ≥ 2`, a finite group `G` of automorphisms of a function field with exact constants, every
place of which is tame over `F^G`, has `|G| ≤ 84(g − 1)`, by Riemann–Hurwitz for `F/F^G` and the
extremal analysis of the branch data at `(2, 3, 7)` (Stichtenoth Ex. 3.18; the pinned
`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`, over any exact constant field). Over a perfect
field of characteristic `p` with `p ∤ |G|` every place is tame
(`TauCeti.natCard_le_eighty_four_mul_genus_sub_one_of_not_dvd`); in characteristic zero no tameness
hypothesis is needed (`TauCeti.natCard_le_eighty_four_mul_genus_sub_one_of_charZero`), and with
§11.4 the whole group satisfies `|Aut(F/k)| ≤ 84(g − 1)`
(`TauCeti.card_algEquiv_le_eighty_four_mul_genus_sub_one_of_charZero`, whose finiteness instance
§11.4 discharges over perfect `k`). The projective `PSL₂(𝔽₇)` action on the Klein quartic is
outside the acceptance suite.
*Needs:* §§7.4, 11.1, 11.4; Tau Ceti `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`,
`TauCeti.natCard_le_eighty_four_mul_genus_sub_one_of_not_dvd`,
`TauCeti.natCard_le_eighty_four_mul_genus_sub_one_of_charZero`,
`TauCeti.card_algEquiv_le_eighty_four_mul_genus_sub_one_of_charZero`.

**Checks.**

- For branch data `(2, 3, 7)` over `F^G` of genus `0`:
  `2g − 2 = |G| · (−2 + 1/2 + 2/3 + 6/7) = |G|/42`, so `|G| = 84(g − 1)`; the Klein quartic attains
  `168 = 84 · 2`.
- `(2, 3, 8)` gives `2g − 2 = |G| · (−2 + 1/2 + 2/3 + 7/8) = |G|/24`, a group of order `48(g − 1)`: below the
  bound.
- A genus-two field has `84(g − 1) = 84`, and `y² = x⁶ − 1` over a field of characteristic zero
  containing `i` and the sixth roots of unity (`ℚ(ζ₁₂)`, or `ℂ`) has automorphisms `x ↦ ζx`
  (`ζ⁶ = 1`), `y ↦ ±y` and `x ↦ 1/x`, `y ↦ iy/x³`, a group of order `24 ≤ 84`. Over `ℚ` the
  maps `x ↦ ζx` with `ζ ≠ ±1` and `y ↦ iy/x³` are not defined.

### 11.6 Wild automorphism groups in positive characteristic

The bound fails in characteristic `p` without tameness. On the Hermitian field `y^q + y = x^{q+1}`
over `𝔽_{q²}`, the translations `x ↦ x + a`, `y ↦ y + a^q x + b` with `b^q + b = a^{q+1}` form a subgroup
of order `q³` (`TauCeti.hermitianTranslations`), and for `q ≥ 41` it exceeds `84(g − 1)` with
`g = q(q − 1)/2` (the pinned
`TauCeti.IsHermitianCoordinates.eighty_four_mul_genus_sub_one_lt_natCard_hermitianTranslations`, with
the concrete instance `q = 64` over `GaloisField 2 12`,
`TauCeti.exists_hermitianTranslations_hurwitz_counterexample`, in
`TauCeti/FieldTheory/FunctionField/Hermitian/HurwitzCounterexample.lean`). No statement about the full
group `PGU₃(q)` is a target; the positive-characteristic bounds of Roquette and Stichtenoth
are outside the roadmap.
*Needs:* §§10.6, 11.5; Tau Ceti `TauCeti.hermitianTranslations`,
`TauCeti.IsHermitianCoordinates.eighty_four_mul_genus_sub_one_lt_natCard_hermitianTranslations`,
`TauCeti.exists_hermitianTranslations_hurwitz_counterexample`.

**Checks.**

- `q = 41`: `41³ = 68921 > 84 · 819 = 68796`.
- `q = 37`: `37³ = 50653 < 84 · 665 = 55860`, so "`q` large" is needed.
- `q = 64`: `64³ = 262144 > 84 · 2015 = 169260`, with `g = 2016`.

### Examples

The Klein quartic attains the Hurwitz bound `168 = 84 · 2` in characteristic zero. The Hermitian
curve `y³ + y = x⁴` over `𝔽̄₃` has genus `3`, non-distinct gaps and a finite automorphism group of
order `6048`; its translation subgroup has order `27`. For Hermitian `y^q + y = x^{q+1}` with `q = 41`,
the translation subgroup of order `q³` exceeds `84(g − 1)`.

### Dependencies

Layers 3–10, §12B and its pinned anti-equivalence; JacobianChallenge Layers E–F; Tau Ceti's
automorphism, Weierstrass-point, Hurwitz-bound and Hermitian theorems named above.

## Layer 12: the dictionary — function fields ↔ curves, and the comparison contracts

Stichtenoth Appendix B; Hartshorne I.6. The layer where the function-field theory meets
schemes, in sublayers 12A–12E, each with its prerequisites, its new definitions and the output the
next consumes, stated in the vocabulary of `Scheme`, `IsIntegral`, `IsProper` and
`AlgebraicGeometry.Scheme.functionField`. **Regular, not smooth**: over imperfect `k` the regular projective model
need not be smooth. For a locally finite-type `k`-scheme, smoothness is equivalent to geometric
regularity (every field base change has regular local rings); geometric reducedness is weaker, even
with regularity of the original model (the cusp of §8.5 is the counterexample). Use the actual
`Smooth` and `GeometricallyIntegral` morphism predicates, with geometric regularity the displayed
condition on all field base changes, and prove its equivalence with smoothness as a theorem. There
is one construction throughout: normalize `ℙ¹_k` in `F`; gluing the affine normalizations of Layer 2
implements it on two charts, and `Proj` properness and the valuative criterion are proof tools, not
competing definitions.

### 12B.0 The early regular model, regular constants and smooth-model base change

An early extraction of the same normalization, with inputs Layer 0, Layer 2's finite normalization
and two charts, and Mathlib's `Spec`, gluing, finite and projective morphisms and DVRs. Construct
`X_F` from the charts, its regular projective structure, the function-field algebra equivalence and
the closed-point, place, local-ring and residue dictionaries; maps come from the rational map on
function fields extended through every DVR by properness, refining affine charts as necessary.

**12B.0a, generic regular constants.** The regular-field statements are those of §8.1 item 2,
consumed here: the equivalence of regularity with the tensor-domain condition, the tensor-domain
and fraction-field maps for every `K/k` with their laws, the identification
`Frac(K ⊗[k] F) ≃ₐ[K] K(t) ⊗[k(t)] F` for a separating `t` with `[F : k(t)] = [F_K : K(t)]`, and
scalar stability. In characteristic zero with exact constants, separable generation is Mathlib's
perfect-field theorem; with `X_F` smooth and geometrically integral (12B.0b) this is the generic
input BelyiMaps consumes in its Layer 9 (algebraic Belyi pairs, 9.1).

**12B.0b, whole-model geometric regularity.** Prove smooth ↔ geometrically regular for the model;
geometric integrality from generic regularity; smoothness over perfect `k`. Over imperfect `k`
geometric regularity is additional input. The base-changed model has the fraction field of 12B.0a
and is the unique regular projective model, so normalization and base-change comparisons are scheme
isomorphisms; normality of the original model alone does not commute normalization with purely
inseparable constants.

**12B.0c, sections and divisor transport before cohomology.** After Layer 3, identify `L(D)` with the
rational functions obeying the local Cartier bounds on the model; a finite affine cover with affine
intersections expresses the sections as the kernel of two restriction maps, which flat field
extension preserves. Prove the restriction and multiplication diagrams, independence of the cover
and the isomorphism on `L(D)`; Artinian fibre lengths give pulled-back coefficients and the weighted
degree identity, even at inseparable closed residues. Build the two-affine Čech complex: `H⁰` is the
restriction equalizer and `H¹` the overlap sections modulo the chart restrictions; prove flat base
change on kernel and cokernel, the long exact sequence of a coherent module, vanishing above degree
one and higher vanishing for finite-support modules. The repartition comparison identifies
`H¹(𝒪_{X_F})` with Layer 4's repartition quotient of dimension `g` over the full constants, after
Layers 4–5 and without Serre duality. This finite-cover construction supplies the genus-drop route
of §8.5; 12E identifies it with sheaf cohomology rather than keeping a second `H¹`.

**12B.0d, characteristic-zero finite maps and finite-model descent.** A finite separable map between
smooth models stays finite after field extension; construct the pullback square, the fraction-field
maps and the local-order and residue comparisons; the zero divisor of the map of relative cotangent
line bundles is the Cartier ramification divisor, preserved by pullback, and agrees with the
trace-dual different on the separable-residue branch. For extensions of algebraically closed
characteristic-zero constants this preserves every geometric ramification index and creates no new
branch values; outside that branch keep the Artinian fibre multiplicities of Layer 8. For finitely
many finite models and maps over an algebraically closed characteristic-zero field, descend the
finite presentations, gluings, bases, multiplication tables, separability witnesses and three
specified branch sections to a finitely generated subfield over `ℚ`, then to its algebraic closure in
the ambient field; faithful field extension reflects geometric integrality and finite étaleness off
those sections. BelyiMaps consumes this in its 10.6 together with its own finite enumeration and
owns the fixed-`t` Hom comparison of its 9.1.
*Needs:* the model and its dictionaries: Layers 0 and 2; 12B.0a–b: §8.1 item 2; 12B.0c: Layer 3,
and Layers 4–5 for the repartition comparison; 12B.0d: 12B.0b and §7.1 (the trace-dual different);
Tau Ceti `TauCeti.AlgebraicGeometry.twoChartModel`; Mathlib `AlgebraicGeometry.Scheme`, `Spec`,
`IsProper`, `Smooth`, `GeometricallyIntegral`, `Module.Flat`.

**Checks.**

- For `F = k(x)`, `X_F` is `ℙ¹_k`, glued from `Spec k[x]` and `Spec k[x⁻¹]`, with `H¹(𝒪) = 0 = g`.
- For `y² = x³ − x` over `ℚ`, `X_F` is the projective cubic, smooth, with `dim H¹(𝒪) = 1`.
- For `y² = x³ − t` over `𝔽₃(t)`, `X_F` is regular but not smooth: geometric reducedness holds and
  geometric regularity fails at the cusp over `𝔽₃(t^{1/3})`.

### 12A Dimension-one schemes, closed points, and orders of vanishing

*Prerequisites:* Mathlib's `Scheme`, `IsIntegral`, `IsProper`, `IsLocallyNoetherian`,
`AlgebraicGeometry.Scheme.functionField`, `ringKrullDim_stalk_eq_coheight` and the DVR characterization; Layer 0's
places. *New definitions:* a curve over `k` is an integral scheme, proper over `k`, of dimension one
(through `topologicalKrullDim` or stalk dimensions, with "dimension = transcendence degree of the
function field" a theorem); `ord_x : k(X)ˣ → ℤ` at a regular closed point through the DVR stalk; the
degree of a closed point. *Output:* for regular `X`, `k(X) := X.functionField` satisfies
`Algebra.EssFiniteType k k(X)` and `Algebra.trdeg k k(X) = 1`, hence is a function field by §0.1;
closed points give places with matching residue fields and degrees. These statements use the
vocabulary of Mathlib's `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` and
`AlgebraicCycle/Basic.lean`.
*Needs:* §0.1, §0.4; Mathlib `AlgebraicGeometry.Scheme.functionField`, `ringKrullDim_stalk_eq_coheight`.

**Checks.**

- On `ℙ¹_ℚ`, the closed point `(x² + 1)` has residue field `ℚ(i)` and degree `2`, matching
  `deg P_{x²+1}`.
- `ord` of `x` at the origin of `𝔸¹ ⊂ ℙ¹` is `1`, and at the point at infinity `−1`.
- `ℙ²_k` is integral and proper of dimension `2`, not a curve.

### 12B Normalize ℙ¹_k in F

*Prerequisites:* Layer 2's finite normalization and the compatible charts `R_x` and `R_{1/x}`;
Mathlib's `Spec`, gluing, finite and projective morphisms. *Construction:* reuse the 12B.0 gluing and
prove that `ν_F : X_F → ℙ¹_k` has the universal property of the normalization of `ℙ¹_k` in `F`.
*Outputs:* the chart maps glue to a finite morphism, so `X_F` is Noetherian, integral, of dimension
one and proper; its local rings are Layer 2's normal one-dimensional local domains, hence DVRs, so
`X_F` is regular; `k(X_F) ≃ₐ[k] F` and closed points correspond to places; `X_F → Spec k` is
projective, since a finite morphism is projective and projective morphisms compose. The model, its
function field and its projectivity are pinned: `TauCeti.AlgebraicGeometry.twoChartModel` (the
pushout of the spectra of the two chart rings of `x`),
`TauCeti.AlgebraicGeometry.twoChartModel.functionFieldEquiv` (`k(X_F) ≃ₐ[k] F`),
`TauCeti.AlgebraicGeometry.twoChartModel.exists_isClosedImmersion_proj` (a closed immersion of `X_F`
over `k` into the projective space of a finite-dimensional `k`-vector space) and
`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` (every regular proper curve over `k` is
projective over `k`).
*Needs:* 12A, 12B.0, Layer 2; Tau Ceti `TauCeti.AlgebraicGeometry.twoChartModel`,
`TauCeti.AlgebraicGeometry.twoChartModel.functionFieldEquiv`,
`TauCeti.AlgebraicGeometry.twoChartModel.exists_isClosedImmersion_proj`,
`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`.

**Checks.**

- For `F = k(x)` the normalization of `ℙ¹_k` in `F` is `ℙ¹_k` itself, with `ν_F` the identity.
- For `y² = x` it is `ℙ¹_k` with `ν_F` the squaring map of degree `2`, ramified at `0` and `∞`.
- For `y² = x³ − x` over `ℚ`, `ν_F` is the degree-two projection of the cubic to the `x`-line.

### 12C Morphisms and the anti-equivalence

*Prerequisites:* 12A–12B and the universal property of normalization. *Categories:* on the field
side, function fields over `k` with `k`-embeddings; on the geometric side, integral regular
projective dimension-one `k`-schemes with dominant `k`-morphisms. *Outputs:* restriction to the
generic point gives the contravariant function-field functor; an embedding `F ↪ F′` gives a rational
map that extends over every DVR by properness, the local extensions agree generically and glue, and
separatedness gives uniqueness; full faithfulness, essential surjectivity (every object is the
normalization of `ℙ¹_k` in its function field, through a nonconstant rational function) and the
natural isomorphisms give the anti-equivalence, the pinned
`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`
(`RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ`, with the model functor as inverse), and on
regular proper curves `TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat`.
Specialized to `W.toAffine.FunctionField`, the anti-equivalence identifies isogenies of elliptic
curves with the dominant morphisms of their regular models fixing the origin.
*Needs:* 12A–12B; Tau Ceti
`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`,
`TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat`, `TauCeti.FunctionFieldCat`.

**Checks.**

- `Aut(F/k)` is anti-isomorphic to the automorphism group of `X_F`: `x ↦ 1/x` on `k(x)` is the
  inversion of `ℙ¹`.
- The inclusion `k(x) ⊂ k(y)`, `y² = x`, corresponds to the squaring map `ℙ¹ → ℙ¹`, of degree
  `2 = [k(y) : k(x)]`.
- A constant morphism `X → ℙ¹` is not dominant, induces no map `k(x) → k(X)` of function fields, and
  is not a morphism of the geometric category.

### 12D Divisors and degrees, compared

*Prerequisites:* 12A–12B, Layer 3's `TauCeti.Divisor` and degree. *Definitions:* Weil divisors on the
regular model, the pinned `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` (finite formal sums of
codimension-one points). *Outputs:* under the point–place dictionary, Weil divisors on `X_F`
correspond to `TauCeti.Divisor k F` with matching degrees, principal divisors and linear equivalence,
so the Picard-style class group agrees with `Cl(F)`.
*Needs:* 12A–12B, Layer 3; Tau Ceti `TauCeti.AlgebraicGeometry.SchemeWeilDivisor`.

**Checks.**

- On `ℙ¹_ℚ`, the divisor of the closed point `(x² + 1)` has degree `2`, the degree of `P_{x²+1}`.
- `div x` on `ℙ¹` is `[0] − [∞]` on both sides.
- On the cubic `y² = x³ − x`, `[P] − [O]` for `P = (0, 0)` is not principal on either side, and twice
  it is `div x`.

### 12E Cohomology compared: H⁰ = L(D), the genus, and the canonical class

*Prerequisites:* 12A–12D; JacobianChallenge Layers A–B (the sheaf `𝒪_X(D)`, coherent cohomology over
`k`, `χ`-form Riemann–Roch, Serre duality), used only when `F/k` is separably generated and `X_F` is
smooth, proper and geometrically connected. *Definitions:* none; this sublayer is the comparison
contract, so that whichever route is formalized first, the other refactors onto it:
(i) `H⁰(X, 𝒪_X(D)) ≅ L(D)` under 12D's identification (the pinned
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.globalSectionsEquivRiemannRochSpace`);
(ii) the cohomological genus `dim H¹(X, 𝒪_X)` equals `TauCeti.genus k F` (the pinned
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.genus_eq_genus_functionField`, for an integral separated
Noetherian scheme over `k` of coheight at most one satisfying the existence half of the valuative
criterion, with DVR codimension-one local rings, `k(X)` a function field and `k` exact in `k(X)`; on
the model `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`), equivalently
`h¹(𝒪(D)) = i(D) = ℓ(W − D)`, so function-field Riemann–Roch with the dictionary is equivalent to
`χ`-form Riemann–Roch with Serre duality (the pinned
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`,
`H¹(X, 𝒪_X(D))^∨ ≃ H⁰(X, 𝒪_X(K − D))` for `K` the divisor of a nonzero Weil differential of `k(X)`);
(iii) the dualizing sheaf `ω_{X/k}` corresponds to the canonical class `W`, with `deg ω = 2g − 2` (the
degree is the pinned `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree_eq_two_mul_genus_sub_two`).
The contract is this list; neither roadmap builds the other's side, and the relative theory
(cohomology and base change, JacobianChallenge Layer C) is no part of this roadmap.
*Needs:* 12A–12D, Layers 4–5; JacobianChallenge Layers A–B (sheaf cohomology over `k`, `χ`-form
Riemann–Roch, Serre duality); Tau Ceti
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.globalSectionsEquivRiemannRochSpace`,
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.genus_eq_genus_functionField`,
`TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`,
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`,
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree_eq_two_mul_genus_sub_two`.

**Checks.**

- For a genus-one `F` with a rational place `[0]`, the comparison turns `ℓ(n · [0]) = n` into
  `h⁰(X_F, 𝒪(n · [0])) = n` for `n ≥ 1`.
- On `ℙ¹`, `h¹(𝒪) = 0 = g` and `h¹(𝒪(−2[∞])) = h⁰(𝒪) = 1`, Serre duality with `K = −2[∞]`.
- On `y² = x³ − x`, `deg ω = 0 = 2g − 2` and `ω ≅ 𝒪`, generated by `dx/y`.

### Examples

`ℙ¹_k` is the model of `k(x)`; the projective cubic `y²z = x³ − xz²` is the model of `y² = x³ − x` over
`ℚ`, with `H¹(𝒪)` of dimension `1`; the cusp `y² = x³ − t` over `𝔽₃(t)` is regular but not smooth.

### Dependencies

Layers 0–5, §7.1 (for 12B.0d) and §8.1 items 1–2; JacobianChallenge Layers A–B for 12E; Mathlib
schemes; Tau Ceti's two-chart model, scheme Weil divisors and the anti-equivalence named above.

## Downstream consumers

- EllipticCurves consumes Layer 0's places and `k̃ = ⋂_P 𝒪_P`, Layer 3's divisors, Layer 6's induced
  places and fundamental identity, and §10.3's early local elliptic-differential computation in its
  Layer 0 (places, Dedekind instance, point dictionary) and Layer 1 (Kähler basis,
  regular/nonvanishing differential, unramifiedness); the four statements of §10.2 are its named
  interfaces.
- BelyiMaps consumes the pinned carriers, Layers 6–7 (ramification, Riemann–Hurwitz), §8.1 item 2
  through 12B.0a for its 9.1 and 12B.0d for its 10.6.
- EtaleCohomologyFoundations consumes Layers 8 and 12 for decomposition and inertia groups;
  ModularCurves consumes Layers 7–9 and 12; AbhyankarLemma consumes §8.10's pinned compositum
  theorems; DiophantineApproximationAndTranscendence consumes §9.3's comparison of Kähler with
  Weil differentials in its Layer 5.
- FunctionFieldArithmetic consumes Layers 0–12 with §5.6's finiteness of `Cl⁰(F)`;
  CurvesOverFiniteFields consumes Layers 8 and 10, including §10.2's statements (i)–(iii);
  HyperellipticCurves consumes Layers 10–11;
  CanonicalModelsAndGonality consumes the carriers, Layer 8's constant-field extensions and
  Layer 12's regular projective model.

## References

- **[Stichtenoth2009]** H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254,
  Springer, 2009, [doi:10.1007/978-3-540-76878-4](https://doi.org/10.1007/978-3-540-76878-4). The
  primary source: Ch. 1 (Layers 0–5), Ch. 3 (Layers 6–8), Ch. 4 (Layer 9), Ch. 6 (Layer 10),
  Appendix B (Layer 12); §5.1 for §5.6. Locators use the book's numbering.
- **[Fulton2008]** W. Fulton, *Algebraic Curves: An Introduction to Algebraic Geometry*, 2008 edition
  (author's text): Ch. 5 (projective plane curves), §§8.1–8.6 (divisors, Riemann's theorem with the
  ordinary-singularities genus formula, differentials, canonical divisors through adjoints,
  Riemann–Roch by the Brill–Noether argument, not by repartitions). Fulton assumes `k` algebraically
  closed from Ch. 3 on and characteristic zero at several points (§8.4 Prop. 6(2); Appendix A), so
  every statement taken from it is re-hypothesized. Layer 10's plane curves.
- **[Hartshorne1977]** R. Hartshorne, *Algebraic Geometry*, GTM 52, 1977: I.6 (the abstract curve of
  a function field), IV.2 (Hurwitz), Ex. IV.2.5 (the bound `84(g − 1)`); Layers 11–12.
- **[Goldschmidt2003]** D. M. Goldschmidt, *Algebraic Functions and Projective Curves*, GTM 215,
  2003: Weierstrass points and Wronskians with proofs (§11.3).
- **[VillaSalvador2006]** G. D. Villa Salvador, *Topics in the Theory of Algebraic Function Fields*,
  Birkhäuser, 2006: automorphism groups and constant-field pathologies (Layers 8, 11).
- **[Deuring1973]** M. Deuring, *Lectures on the Theory of Algebraic Functions of One Variable*,
  LNM 314, 1973: the imperfect-constant-field counterexamples Stichtenoth §3.6 refers to (Layer 8).
- **[Rosen2002]** M. Rosen, *Number Theory in Function Fields*, GTM 210, 2002: S-integers and class
  groups (Layer 2, §5.6).
- **[Serre1979]** J.-P. Serre, *Local Fields*, GTM 67, 1979: Ch. III (the different), Ch. IV
  (ramification groups); Layers 7–8.
- **[Rosenlicht1955]** M. Rosenlicht, *Automorphisms of function fields*, Trans. Amer. Math. Soc. 79
  (1955), 1–11, [doi:10.1090/S0002-9947-1955-0070211-3](https://doi.org/10.1090/S0002-9947-1955-0070211-3):
  §2, Theorem (finiteness over an algebraically closed field) and its two lemmas; §3, finiteness
  over an arbitrary field when the genus stays positive over `k̄` (p. 5), the Lemma and Corollary
  of pp. 4–5 (MacLane's `p`-th-power criterion over the fixed field of a group of automorphisms,
  and separable generation of a function field with infinitely many automorphisms), and the
  exceptional fields over imperfect fields (p. 10) (§11.4).
- **[DeligneMumford1969]** P. Deligne, D. Mumford, *The irreducibility of the space of curves of given
  genus*, Publ. Math. IHÉS 36 (1969), 75–109,
  [Numdam](http://www.numdam.org/item/PMIHES_1969__36__75_0/): Theorem (1.11), finiteness and
  unramifiedness of the automorphism scheme of a stable curve, the scheme form of §11.4 over an
  algebraically closed field.
- **[Roquette1970]** P. Roquette, *Abschätzung der Automorphismenanzahl von Funktionenkörpern bei
  Primzahlcharakteristik*, Math. Z. 117 (1970), 157–163;
  **[Stichtenoth1973a]**, **[Stichtenoth1973b]** H. Stichtenoth, *Über die Automorphismengruppe eines
  algebraischen Funktionenkörpers von Primzahlcharakteristik* I, II, Arch. Math. 24 (1973),
  527–544 and 615–631: the positive-characteristic bounds and classifications outside the
  roadmap.

## Existing Lean work

The pinned Tau Ceti implements most of Layers 0–12 under `TauCeti/FieldTheory/FunctionField/` and
`TauCeti/AlgebraicGeometry/Curves/`; each layer cites what it uses. Two external developments overlap:

- [vaca22/riemann-roch-function-fields](https://github.com/vaca22/riemann-roch-function-fields)
  (Guanghao Li; Apache-2.0): a sorry-free function-field Riemann–Roch by the same Stichtenoth route
  (intrinsic places, divisors, adele spaces, Weil differentials, canonical divisors, genus, duality,
  Riemann's and Clifford's inequalities, genus-one applications), covering the mathematics of
  Layers 0–5 and parts of Layer 10. It is a reference, not a dependency, and no code is copied from
  it; its Dedekind divisor group `(FractionalIdeal R⁰ K)ˣ ≅ (HeightOneSpectrum R →₀ ℤ)` is the shape
  of §3.6, and if it reaches Mathlib the corresponding statement here is replaced by an import. The
  divergence of carriers (normalized `ℤᵐ⁰`-valuations, `Finsupp` divisors and `IsIntegrallyClosedIn`
  constants here, an intrinsic DVR-subring interface there) is deliberate.
- Mathlib's scheme-side order of vanishing (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`) and
  algebraic cycles (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`): 12A and 12D state their
  dictionary in that vocabulary, and the function-field divisors here never fork a rival
  scheme-divisor notion.
- Graph Riemann–Roch (Baker–Norine) is formalized in Lean with no mathematical overlap; no
  Riemann–Roch for curves or function fields exists in Isabelle's AFP or in Rocq.
