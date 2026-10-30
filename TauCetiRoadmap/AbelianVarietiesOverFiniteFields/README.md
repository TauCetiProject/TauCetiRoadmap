# Roadmap: abelian varieties over finite fields

An abelian variety `A` over a finite field `𝔽_q` carries one distinguished endomorphism, the
`q`-power Frobenius `π_A`, and almost everything the LMFDB records about the isogeny class of `A`
is a function of the characteristic polynomial `P_A ∈ ℤ[T]` of `π_A`: the point counts over every
`𝔽_{q^r}`, the decomposition into simple factors and the fields and division algebras they
generate, the Newton polygon and the `p`-rank, the Frobenius angles, the twists and the field of
definition of all endomorphisms. The theorems that make this true are Tate's theorem
`Hom(A, B) ⊗ ℤ_ℓ ≅ Hom_{Gal}(T_ℓ A, T_ℓ B)`, its corollary that `A` and `B` are isogenous exactly
when `P_A = P_B`, the description of `End⁰(A)` of a simple `A` as a division algebra over `ℚ(π)`
with prescribed local invariants, and Honda's theorem that every `q`-Weil number comes from an
abelian variety. The LMFDB section `av.fq` is organized around exactly these invariants, and its
isomorphism-class data inside an isogeny class is organized around the order `ℤ[π, q/π]` of the
Frobenius, its overorders, their Picard groups and weak equivalence classes, and Deligne's
description of ordinary abelian varieties by lattices. Tate's theorem at every prime, the isogeny
criterion, the centre, dimension formula and local invariants of `End⁰(A)`, Honda–Tate and the
classification of the isomorphism classes in an isogeny class by lattice tuples are
[*Abelian schemes and arithmetic moduli, part II*](../AbelianSchemesAndArithmeticModuliPartII/README.md)
Layers F0–F3, consumed here. This roadmap builds the rest: the Frobenius and the point-count
identity, the isogeny relation, the endomorphism field and the display data of the endomorphism
algebras, Waterhouse's list of elliptic isogeny classes, the data-bearing refinements of an isogeny
class, the order-theoretic invariants, Deligne modules, Deligne's equivalence and the
Centeleghe–Stix equivalence over prime fields with the exact count of isomorphism classes they give,
polarizations and the existence of Jacobians in dimension two.

The carrier is Tau Ceti's `AbelianVariety K` for a field `K` with `[Finite K]`, written
`𝔽_q` with `q = Nat.card K`; the dimension is `A.dim` and every statement "of dimension `g`"
carries `A.dim = g`. Nothing here is a new kind of object: the Frobenius is an element of Tau
Ceti's `End A`, the characteristic polynomial is the one every endomorphism has, the orders are
`NumberFieldOrder`s of Tau Ceti's orders library or `ℤ`-subalgebras that are `Submodule.IsLattice`
in a finite étale `ℚ`-algebra, and Deligne modules are finite free `ℤ`-modules with an
endomorphism.

Suggested home: `TauCeti/AlgebraicGeometry/AbelianVariety/FiniteField/` for Layers 1–7 and 9–10
(files `Frobenius`, `Tate`, `EndomorphismAlgebra`, `EllipticClasses`, `Decomposition`, `NewtonPolygon`,
`Points`, `DeligneModule`, `Polarization`, `Jacobian`), and
`TauCeti/NumberTheory/NumberField/Global/Orders/` for Layer 8, beside the existing order files
(`Bass`, `WeakEquivalence`, `CohenMacaulayType`, `Overorders`, `Etale`).

## Prerequisites

Each milestone names its direct prerequisites. They are of five kinds.

1. **Mathlib at the pin.** Listed under *What Mathlib supplies*.
2. **Tau Ceti at the pin.** `AbelianVariety K` with `End`, `mulBy`, `IsIsogeny`, `prod`,
   `baseChange`; `TateModule`; the orders library `GlobalNumberFields.NumberFieldOrder`; the
   elliptic Frobenius isogeny, point count and Hasse bound; the central simple algebra and
   Brauer group libraries. Listed under *What Tau Ceti supplies*.
3. **Merged roadmaps.** [JacobianChallenge](../JacobianChallenge/README.md) Layer E (duals,
   polarizations, `[n]` as an isogeny); [GlobalNumberFields](../GlobalNumberFields/README.md)
   Layer 11 (orders and Picard groups, Gorenstein orders);
   [ClassFieldTheory](../ClassFieldTheory/README.md) Layers 5 and 10 (the local invariant
   `invMap`, the global Brauer sequence `finiteInvAt`, `infiniteInvAt`, `sumLocalInv`,
   `eq_zero_of_localInv_eq_zero`, `exists_br_of_sum_eq_zero`);
   [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) 7B (the comparison
   `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)`);
   [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) §§7.4, 7.21, 7.49
   (`IntegralOrder.IsOrder`, `IsMaximalOrder` in a finite-dimensional algebra, the trace-dual bound
   on overorders);
   [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.29
   (`SchemeFrobenius.absoluteFrobenius`, `qPowerFrobenius`);
   [EllipticCurves](../EllipticCurves/README.md) Layers 2 and 3 (Tate module of an elliptic
   curve, Frobenius trace, zeta function, ordinary and supersingular);
   [Chebotarev](../Chebotarev/README.md) is a neighbour, not a supplier: nothing here uses a
   density theorem.
4. **Roadmaps specified elsewhere in this repository and consumed as if on main**, cited by
   title, directory and milestone: *Abelian schemes and arithmetic moduli*
   (`AbelianSchemesAndArithmeticModuli`, Layer A6 and A4.1); [*Abelian schemes and arithmetic
   moduli, part II*](../AbelianSchemesAndArithmeticModuliPartII/README.md) (Layers F0, F1, F3, cited
   as Part II); [FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md) (§§5.3–5.4);
   *Deligne weights, purity and the Weil bounds* (`DeligneWeightsAndPurity`, Layer DWP.1); *PEL
   moduli* (`PELModuli`, M0.1–M0.2); *Complex multiplication and explicit reciprocity*
   (`ComplexMultiplicationAndExplicitReciprocity`, 5.2); *Faltings finiteness and isogeny theorems*
   (`FaltingsFinitenessAndIsogenyTheorems`, R28.5.1).
5. **Sibling roadmaps**, cited by directory name only: `CurvesOverFiniteFields` for the
   polynomial-level theory of Weil polynomials, `SatoTateGroups` for endomorphism algebras over
   number fields and Galois endomorphism types.

## Scope and ownership

### Owned here

- **The `L`-polynomial and the point-count API.** For the `q`-Frobenius `π_A ∈ End A`
  (consumed, below), its characteristic polynomial `P_A` (consumed) and the count
  `#A(𝔽_{q^m}) = deg(1 − π_A^m) = P_{A,m}(1)` (consumed from DWP.1 §1.5): the identification of
  `A(L)` with the kernel of `1 − π_A^r` for *every* finite extension `L/K` of degree `r`, so that
  the count does not depend on a chosen model of `𝔽_{q^r}`; the `L`-polynomial
  `L_A = T^{2g} P_A(1/T)`; naturality `f ∘ π_A = π_B ∘ f` for every `K`-homomorphism; the
  Frobenius of a product and of a base change; and the comparison with Tau Ceti's elliptic
  `frobeniusIsogeny`, `pointCount` and `frobeniusTrace` (Layer 1).
- **The isogeny relation** `IsIsogenous A B`, its equivalence-relation laws, and its invariants
  (Layer 1).
- **The Galois representation on the Tate module** of `A` over `𝔽_q` and **the endomorphism
  field** (Layer 2); Tate's theorem itself and the isogeny criterion are consumed.
- **The endomorphism algebras as the LMFDB displays them**: the three real exceptional classes and
  the data `(F_i, D_i, inv_v)` of `End⁰(A_L)` for every `L` (Layer 3); the centre, dimension formula
  and local invariants of `End⁰` of a simple `A` are consumed.
- **Waterhouse's list** of the isogeny classes of elliptic curves over `𝔽_q` (Layer 4); Honda–Tate
  itself is consumed.
- **The data-bearing refinements** of an isogeny class: simple factors and multiplicities,
  squarefreeness, geometric simplicity and squarefreeness, the endomorphism field and the
  geometric extension degree, primitivity and base-change models, twists, the number field
  and Galois group of a simple class (Layer 5); the `p`-rank, Newton polygon, ordinary,
  supersingular and almost-ordinary predicates, Newton elevation, angle rank and corank *of an
  abelian variety* (Layer 6); the group `A(𝔽_q)`, its structure, cyclicity and the non-cyclic
  primes of a class, and the Jacobian obstruction the (consumed) virtual curve counts give (Layer 7).
- **The Frobenius order** `ℤ[π, q/π]`, its index, real index and relative discriminant norm,
  overorders, Bass orders, Cohen–Macaulay type, conductor-sum predicates, weak equivalence
  classes, singular primes and the dimensions at them, and the generalization of Tau Ceti's
  order library from a number field to a finite étale `ℚ`-algebra (Layer 8).
- **Deligne modules**, Deligne's equivalence for ordinary abelian varieties, Centeleghe–Stix
  for `q = p` as an equivalence of categories, Waterhouse's description of the elliptic case, the
  exact count of isomorphism classes in a squarefree isogeny class through the ideal class monoid,
  and the group structure of each member (Layer 9); the lattice classification of isomorphism
  classes is consumed.
- **Principal polarizability of an isogeny class**, Howe's description of polarizations of
  Deligne modules, the structure of principally polarized abelian surfaces, Howe–Nart–Ritzenthaler,
  and the Jacobian and hyperelliptic counts (Layer 10).
- **The intrinsic label prefix** `g.q.P_A` and the page map (Layer 11).

### Consumed, not redefined

- From Tau Ceti: `AbelianVariety K`, `AbelianVariety.End A` (the ring `Additive (A ⟶ A)`),
  `mulBy`, `IsIsogeny`, `prod`, `fst`, `snd`, `lift`, `baseChange`, `End.baseChange`,
  `Hom.baseChange`; `TateModule p G` with its `ℤ_p`-module structure and topology; the orders
  library `GlobalNumberFields.NumberFieldOrder` with `conductor`, `index`, `discr`,
  `multiplierRing`, `IsProperFractionalIdeal`, `invertibleProperFractionalIdeals`, `Pic`,
  `NarrowPic`, `IdealClassMonoid`, `Hom`, `mapPic`, `integralIdealsAwayConductor`; the elliptic
  `frobeniusIsogeny`, `WeierstrassCurve.frobeniusTrace`, `WeierstrassCurve.pointCount`,
  `hasse_bound`; `BrauerGroup` with `TauCeti.BrauerGroup.instCommGroup`, `CSA`, `quaternionClass`
  and the central simple algebra library `TauCeti/Algebra/CentralSimple/`. Post-pin Tau Ceti
  material is cited by module path in prose:
  `TauCeti/NumberTheory/NumberField/Global/Orders/Gorenstein.lean` (`traceDual`, `IsGorenstein`),
  `.../Orders/Maximal.lean`
  (`maximalOrderPicEquiv : Pic (maximalNumberFieldOrder K) ≃* ClassGroup (𝓞 K)`),
  `.../Orders/Lattice.lean`, `.../Orders/Quadratic/Basic.lean` (proper ideals of quadratic
  orders are invertible), `TauCeti/Algebra/CrossedProduct/Comparison.lean`
  (`brauerCohomologyEquiv`), `TauCeti/AlgebraicGeometry/EllipticCurve/Supersingular.lean`
  (`WeierstrassCurve.IsSupersingular p W`, `WeierstrassCurve.IsOrdinary p W`),
  `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/{Charpoly,Isogenous,Supersingular,Ordinary,EndomorphismField,Zeta}.lean`
  (the `g = 1` Frobenius theory:
  `isSupersingular_iff_dvd_frobeniusTrace`, `pointCount_eq` for isogenous curves,
  `zetaFunction`, `OrdinaryEnd` with its `NumberFieldOrder`),
  `TauCeti/Algebra/AlgebraicGroup/Frobenius/FiniteField.lean` (`frobeniusPoints`,
  `rationalPointsMulEquiv`) and
  `TauCeti/AlgebraicGeometry/AbelianVariety/DimensionZero.lean` (`isZero_iff_dim_eq_zero`).
- From *Abelian schemes and arithmetic moduli*, Layer A6: `Hom.deg` and `End.degRat` (A6.1),
  `homTateInjective` (A6.2), the abelian image (A6.3), `IsSimple`, `simpleEndDivision` (A6.4),
  `poincareReducibility` with the uniqueness of simple factors and multiplicities (A6.5),
  `homFreeFinite` (A6.7), `endQ_isSemisimple` (A6.8), `End.charpoly`, `End.charpoly_eval`,
  `End.charpoly_monic`, `End.trace`, `End.charpoly_coeff_zero` (A6.10), `charpolyTate` (A6.11),
  `traceDegreeSubfield` (A6.12), `polarizedIsogenyDegree` (A6.13), `rosatiPositivity` (A6.14),
  `reducedTraceComparison` (A6.17), `polarizedAutomorphisms` (A6.18), `polarizationOrbits`
  (A6.19), `frobeniusSemisimple` (A6.21: `π` central, `π^† π = q`, `ℚ[π]` a product of fields,
  `π` semisimple on `V_ℓ A`), `weilRestriction`, `weilRestrictionAbelian`,
  `weilRestrictionTate` (A6.30–A6.33), `QuadraticAbelianTwist` (A6.34); and its A4.1
  `AbelianTate` (`T_ℓ A = TateModule ℓ (A(K^{sep}))`, free of rank `2g`, with its continuous
  Galois action, `AbelianTate.map`, `AbelianTate.modPow`, `AbelianTate.dualPairing`) and A3.9
  `Polarization.rosati`.
- From [*Abelian schemes and arithmetic moduli, part II*](../AbelianSchemesAndArithmeticModuliPartII/README.md)
  Layers F0–F3 (cited as Part II): F0.2 (reciprocity `a_{2g−i} = q^{g−i} a_i` of `P_A` in
  descending powers, `P_{A×B} = P_A P_B`), F0.3 (`q`-Weil numbers), F0.4 (Tate's isotropic image
  lemma, with the polarized finiteness of F0.1 and F0.8), F0.5 (isogeny invariance and product
  compatibility of point counts), F0.6–F0.7 (Tate's theorem at `ℓ ≠ p`, the split-prime commutant
  and its dimension), F1.9–F1.10 (Tate's theorem at `p`, integral and rational, for the
  contravariant Dieudonné modules), F1.11 (the invariant of `End⁰` of a simple `A` at `v ∣ p`),
  F3.1a–F3.1d (Honda's existence and the Weil-restriction descent), F3.2 (the Honda–Tate
  classification of simple isogeny classes with the dimension formula and the local invariants),
  F3.3 (`IsIsogenous A B ↔ P_A = P_B`), F3.8 (every order of `ℚ(π)` containing `π` and `p/π` is an
  `End A'` in a non-real simple class over `𝔽_p`), F3.9–F3.10 (the isomorphism classes in an
  isogeny class as `End⁰(A₀)^×`-orbits of finite-support lattice tuples, marked and unmarked over
  `𝔽_p`). The milestones below cite these by number. `IsIsogenous` is defined here (1.7); its
  criterion is F3.3.
- From [FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md): §5.3 (`L_F(1) = h_F`) and
  §5.4 (`L_F` is the reversed characteristic polynomial of the Frobenius of the Jacobian, and
  `N_r = q^r + 1 − ∑ α_i^r`), used in 1.5 and 7.5.
- From *Deligne weights, purity and the Weil bounds*, Layer DWP.1: §1.1 the Frobenius adapter
  `AbelianVariety.frobenius A : End A` (the `q`-power scheme Frobenius of §0.29 of
  SchemeAndStackFoundations as a group endomorphism, with `deg = q^g`, Tate action equal to
  arithmetic Frobenius, and `π_{A_{𝔽_{q^m}}} = π_A^m`); §1.2 `π_A^∨ λ π_A = q λ`; §1.4 the Weil
  estimate: every root of `P_{π_A}` has absolute value `q^{1/2}` under every complex embedding;
  §1.5 the count `#A(𝔽_{q^m}) = deg(1 − π_A^m) = P_{π_A^m}(1) = ∏ (1 − a_i^m)` with its bound,
  for its model of `𝔽_{q^m}`; §1.9 `P_{π_A^m}` has roots `a_i^m`. This roadmap writes `π_A`
  for `AbelianVariety.frobenius A` and `P_A` for `End.charpoly π_A`.
- From *PEL moduli*, M0.1 `PositiveInvolution` and M0.2 `albertTypes`: the Albert
  classification of division algebras with positive involution, used only to read off the
  shape of `End⁰(A) ⊗ ℝ`.
- From *Complex multiplication and explicit reciprocity*, 5.2: the ordinary order levels and the
  supersingular level pairs that 8.3 and 9.6 compare with for `g = 1`.
- From *Faltings finiteness and isogeny theorems*, R28.5.1 `finite_weilPolynomials`: finitely
  many monic integer polynomials of degree `n` with all roots of absolute value `r`.
- From [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 11 (landed in Tau Ceti):
  everything in the orders library named above, and `O.IsGorenstein` with the trace-dual
  criterion.
- From [ClassFieldTheory](../ClassFieldTheory/README.md): Layer 5 `Br K`, `invMap` (normalized
  by arithmetic Frobenius, so the fundamental class of a degree-`n` unramified layer has
  invariant `1/n`); Layer 10 `finiteInvAt`, `infiniteInvAt`, `brauerSupport`, `sumLocalInv`,
  `eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`, `exists_br_of_sum_eq_zero`.
- From [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) 7B: the comparison
  `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)` characterized by
  `brauerCohomologyEquiv_crossedProductClass`. Every local invariant of a central simple
  algebra in this roadmap is `invMap` composed with this comparison at the completion.
- From [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) §7.4 and
  §7.21: `IntegralOrder.IsOrder Λ` (a `ℤ`-subalgebra of a finite-dimensional `ℚ`-algebra that
  is `Submodule.IsLattice ℚ`) and `IntegralOrder.IsMaximalOrder`. Layer 8 states its
  étale-algebra theorems with the hypothesis `Submodule.IsLattice ℚ (Subalgebra.toSubmodule Λ)`
  spelled out, which is that predicate. §7.49 *One trace-dual lattice bounds every overorder*: for
  an order `Λ` with a `ℚ`-basis `e_i ∈ Λ` and `r := det(Tr(e_i e_j)) ≠ 0`, every overorder of `Λ`
  lies in `r⁻¹ ∑_i ℤ e_i`; 8.1 consumes it for the finiteness of `𝓞_E` and of the overorders.
- From [JacobianChallenge](../JacobianChallenge/README.md) Layer E: the dual abelian variety
  and `f^∨`, polarizations `φ_L`, principal polarizations as isomorphisms, the principal
  polarization of a Jacobian, and `[n]` as an isogeny of degree `|n|^{2g}`.
- From [EllipticCurves](../EllipticCurves/README.md) Layer 3: `frobeniusTrace`, the Hasse
  bound, the zeta function, the geometric predicates `IsSupersingular`/`IsOrdinary`
  (`E[p](Kˢᵉᵖ) = 0` or not) and the criterion `IsSupersingular p E ↔ p ∣ frobeniusTrace E`
  over a finite field.
- From `CurvesOverFiniteFields` (sibling): the polynomial-level theory of `q`-Weil polynomials:
  the predicate on a monic `P ∈ ℤ[T]` that all complex roots have absolute value `√q`, real Weil
  polynomials, the Newton polygon of `P` at `p` with its slopes and the `p`-rank of a polynomial,
  ordinary, supersingular and almost-ordinary polynomials and the Newton elevation, Frobenius
  angles and the angle rank of a polynomial, the number field and Galois group of an irreducible
  `P`; its Weil powers `weilPower`, the polynomial twist relation `IsTwistOver` with its least
  degree `twistDegree`, the Weil roots `weilRoots r P` (the monic `Q` with `weilPower Q r = P`) and
  `geometricExtensionDegree` (its 4.10). Layers 5 and 6 attach each to `A` through `P_A` and prove
  the geometric statement that makes the attachment honest; Layer 5 decides by Honda–Tate (Part II F3.2)
  which members of a polynomial twist class or Weil-root set are realized, which is what makes
  `is_primitive` and `twists` statements about isogeny classes. This roadmap defines none of these
  notions on polynomials.

### Not owned here

- **Abelian varieties over a general field**: rigidity, duals, polarizations, the Rosati
  involution, degrees, characteristic polynomials of endomorphisms, finiteness of `Hom`,
  Poincaré reducibility, semisimplicity of `End⁰`, Rosati positivity, Albert's classification
  (*Abelian schemes and arithmetic moduli* A6, *PEL moduli* M0, JacobianChallenge Layer E).
- **The `q`-Frobenius endomorphism itself** and the Weil estimate `|π| = √q`
  (*Deligne weights, purity and the Weil bounds* DWP.1, §§1.1–1.4).
- **Tate's theorem over a finite field, the isogeny criterion, the centre and local invariants of
  `End⁰` of a simple `A`, Honda–Tate, and the lattice classification of the isomorphism classes in
  an isogeny class** (Part II F0–F3).
- **The Tate conjecture over number fields** and the finiteness theorems of Faltings
  (`FaltingsFinitenessAndIsogenyTheorems` R28.4–R28.5).
- **Weil polynomials as combinatorics** and the Serre and Ihara bounds (`CurvesOverFiniteFields`);
  **zeta functions of curves**, the Riemann hypothesis for curves and the Hasse–Weil bound
  ([FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md) Layer 5,
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §5.11).
- **Counting and distribution**: `#A_g(𝔽_q)`, masses, equidistribution of Frobenius angles
  (`ArithmeticStatisticsPartI`, `ArithmeticStatisticsPartVIII`); **Sato–Tate groups** and the
  Galois endomorphism types of abelian varieties over number fields (`SatoTateGroups`).
- **Enumerative indices and stored lists**: see *Explicit scope exclusions*. The intrinsic
  prefixes are Layer 11.
- **Dieudonné theory, `p`-divisible groups, crystalline cohomology**: the Newton polygon of `A`
  is defined here through `P_A`, and the one geometric comparison (6.2) is stated against the
  `p`-divisible group supplier of *Abelian schemes and arithmetic moduli* A4.5 and the
  Dieudonné–Manin classification it names; no Dieudonné module is constructed here.
- **Gorenstein and Bass orders in a quaternion algebra**: the sibling `QuaternionArithmetic` (its 2.2,
  2.5, with the even Clifford correspondence and the Eichler symbol). 8.4 here and 2.2 there are
  the two instances — commutative étale, quaternion — of one definition (the codifferent, here the
  trace dual, is invertible) for orders in a finite-dimensional semisimple algebra, which no
  roadmap states in that generality; each owns its instance.
- **Genus-2 curves and their invariants** (Igusa–Clebsch, automorphism groups,
  hyperellipticity in genus `≥ 3`): the sibling `HyperellipticCurves`. Layer 10 uses only
  "the Jacobian of a smooth projective curve of genus `g` over `𝔽_q`" from JacobianChallenge.

## Pinned conventions

| Object | Convention |
|---|---|
| Base field | `K` with `[Field K] [Finite K]`, `q := Nat.card K`, `p := ringChar K`. `𝔽_{q^r}` means an extension `L` of `K` with `[Algebra K L] [Module.Finite K L]` and `Module.finrank K L = r`; every statement about `A(𝔽_{q^r})` is stated for such an `L`, and invariance under the choice of `L` is a theorem (1.3). |
| Frobenius | `π_A := AbelianVariety.frobenius A : End A` (DWP.1 §1.1), the `q`-power Frobenius, an endomorphism *over `K`*. Geometric Frobenius never appears except as `π_A⁻¹` on `V_ℓ A` in 2.1. `π` acts on `T_ℓ A` as the arithmetic Frobenius of `Gal(K^{sep}/K)`. |
| Characteristic polynomial | `P_A := End.charpoly π_A ∈ ℤ[T]`, monic of degree `2g`, `P_A(T) = det(T − π_A ∣ V_ℓ A)` for every `ℓ ≠ p` (A6.10–A6.11). Roots `α_1, …, α_{2g}` with multiplicity. `P_{A,r} := End.charpoly (π_A ^ r)`, whose roots are `α_i^r`. |
| `L`-polynomial | `L_A(T) := T^{2g} P_A(1/T) = Polynomial.reverse P_A`, constant term `1`, the LMFDB `poly`. Coefficients `1, a_1, …, a_g, q a_{g−1}, …, q^g`. |
| Weil number, Weil polynomial | A `q`-Weil number is an algebraic integer all of whose complex conjugates have absolute value `q^{1/2}` (the predicate of `CurvesOverFiniteFields`; Part II F0.3 and the real-base adapter `IsWeilNumber q 1` of DWP.0 agree). A `q`-Weil polynomial is a monic `P ∈ ℤ[T]` all of whose roots are `q`-Weil numbers; it need not be the characteristic polynomial of an abelian variety (Honda–Tate, Part II F3.2, says which are; Layer 4). |
| Isogeny, isogenous | `IsIsogeny f` is Tau Ceti's (finite and surjective). `IsIsogenous A B := ∃ f : A ⟶ B, IsIsogeny f`; symmetry is a theorem (1.7), not a second clause. The isogeny class is the `Setoid` quotient. |
| Simple | *Abelian schemes and arithmetic moduli* A6.4 `IsSimple`: positive dimension and no abelian subvariety other than `0` and `A`. Geometrically simple: `IsSimple (A.baseChange (AlgebraicClosure K))`. The dimension-zero variety is not simple and not squarefree-with-a-factor; it has empty decomposition. |
| Decomposition | By A6.5, `A ~ ∏ A_i^{n_i}` with `A_i` simple, pairwise non-isogenous, unique up to isogeny and order; by Part II F0.2 (`P_{A×B} = P_A P_B`) and 1.8, `P_A = ∏ P_{A_i}^{n_i}`. Each `P_{A_i}` is a power `m_i^{e_i}` of a monic irreducible `m_i ∈ ℤ[T]` (Layer 3), so the factorization of `P_A` into irreducibles is `∏ m_i^{e_i n_i}`, and the decomposition is read off `P_A` through Honda–Tate (Part II F3.2; Layer 4), which says which `e_i` occur. The LMFDB field `is_squarefree` (knowl `av.squarefree`: no simple factor occurs with exponent `> 1`) is **all `n_i = 1`**, equivalently `P_A = ∏ m_i^{e(m_i)}` with the `m_i` distinct (every irreducible factor to exactly its Honda–Tate exponent, Layer 4), equivalently `End⁰(A) = ∏ D_i` is a product of division algebras with no matrix factor (3.4); `is_geometrically_squarefree` is the same condition for `A_{𝔽_{q^d}}` with `d` the geometric extension degree (5.3, 5.4). It is *weaker* than `Squarefree P_A` in `ℚ[T]`, which is all `n_i = 1` *and* all `e_i = 1`, equivalently `End⁰(A) = ℚ[π_A]` commutative; `Squarefree P_A` is the hypothesis of the `ℤ[π, V]` dictionary of Layers 8–9 and is never called `is_squarefree` here. Every simple class is `is_squarefree`: `2.2.a_ae` is simple with `P_A = (T² − 2)²`, so `is_squarefree` holds and `Squarefree P_A` fails. The simple factors are a `Multiset` of isogeny classes; their order on a page is a database convention, not a target. |
| Endomorphism algebra | `End⁰(A) := ℚ ⊗[ℤ] End A`, the convention of *Abelian schemes and arithmetic moduli*. `Hom⁰(A, B) := ℚ ⊗[ℤ] (Additive (A ⟶ B))`. For simple `A`, `End⁰(A)` is a division algebra with centre `ℚ(π_A)`; `divalg_dim := Module.finrank (Center) (End⁰ A)`, a square `e²`; the LMFDB `divalg_dim` is this `e²`. |
| Local invariants | For a place `v` of a number field `F` and a central simple `F`-algebra `D`, `inv_v D ∈ ℚ/ℤ` is ClassFieldTheory's `invMap` (finite `v`) or `infiniteInvAt` (archimedean `v`) applied to the class of `D ⊗_F F_v` under the QFI 7B comparison. With CFT's normalization by *arithmetic* Frobenius, Tate's formula reads `inv_v(End⁰ A) = (ord_v π / ord_v q) · [F_v : ℚ_p] mod 1` at `v ∣ p`, `1/2` at real `v`, `0` elsewhere (Part II F1.11, F3.2; Layer 3). The LMFDB stores `inv_v` as a reduced fraction in `[0, 1)`. |
| Tate module | `T_ℓ A := AbelianTate A ℓ` (A4.1) for a prime `ℓ ≠ p`, `V_ℓ A := ℚ_ℓ ⊗ T_ℓ A`. Never used at `ℓ = p`. |
| Twist | `B` is a twist of `A` when `A.baseChange (AlgebraicClosure K) ≅ B.baseChange (AlgebraicClosure K)` (knowl `av.twist`); the LMFDB's twist table is at the level of isogeny classes, where it means `IsIsogenous (A.baseChange L) (B.baseChange L)` for some finite `L/K`, the *extension degree* of a twist is the least `[L : K]`; `twists` ranges over the classes `B ≠ A` of the twist class of `A`, `twist_count` is the **size of the twist class, `A` included** (so `1` for a class without twists: `1.4.ae` has four twists and `twist_count = 5`), and `max_twist_degree` the largest degree of a `B ≠ A`, `0` when there are none (5.6). |
| Endomorphism field, geometric extension degree | The endomorphism field of `A` is the least subextension `L ⊆ K^{sep}` of `K` with `End (A_L) = End (A_{K^{sep}})`; it is `𝔽_{q^d}` and `d` is `geometric_extension_degree` (5.4). |
| `p`-rank, Newton polygon | `p`-rank of `A` is `Module.finrank (ZMod p) (A[p](AlgebraicClosure K))`, the dimension of the geometric `p`-torsion (6.1). The Newton polygon of `A` is the Newton polygon of `P_A` at `p` with the `q`-normalized valuation `ord_q = ord_p / ord_p q`, as a list of `2g` slopes in `[0, 1]` in increasing order (`CurvesOverFiniteFields`' polygon of `P_A`); the LMFDB `slopes`. Ordinary: `p`-rank `= g`; supersingular: every slope `1/2`; almost ordinary: Newton elevation `1` (6.3). |
| Angle rank | The angle rank of `A` is the angle rank of `P_A`: `dim_ℚ (span_ℚ {arg α_i / (2π)} ∪ {1}) − 1`, equivalently `rank ⟨α_1, …, α_{2g}, q⟩ − 1` in `ℂ^× / torsion` (6.5). Corank `g − δ`. |
| Group of points | `A(L)` is the group of `L`-points of the group scheme, a finite abelian group for finite `L` (7.1); its invariants are Mathlib's `AddCommGroup.equiv_directSum_zmod_of_finite` data. A class is *cyclic* when `A(K)` is cyclic for every `A` in it (7.3). |
| Frobenius order | For a simple class with `F := ℚ(π)`: `frobeniusOrder := ℤ[π, q/π] : NumberFieldOrder F`, the `ℤ`-subalgebra generated by `π` and `q/π = π̄`. For a squarefree class with `E := ℚ[T]/(P_A) = ∏ F_i` étale: the `ℤ`-subalgebra of `E` generated by the class of `T` and `q · T⁻¹`, an order in the sense of ClassicalArithmeticCompletion §7.4. Verschiebung is `V := q/π`; the LMFDB writes `F` for `π`. |
| Order invariants | `zfv_index := [𝓞_E : ℤ[π, V]]`; `zfv_real_index := [𝓞_{E⁺} : ℤ[π + V]]` for the totally real subalgebra `E⁺ = ℚ[π + V]`; `zfv_rel_disc_norm := |N_{E/ℚ}(π − V)|`; `is_bass`, `is_gorenstein` (Tau Ceti's `IsGorenstein`), `max_cohen_macaulay_type`, `is_zconductor_sum`, `is_zfvconductor_sum`, `is_conjugate_stable`, `is_maximal` as in Layer 8. |
| Weak equivalence | Fractional `R`-ideals `I`, `J` of an order `R` are weakly equivalent when `I_𝔪 ≅ J_𝔪` as `R_𝔪`-modules for every maximal ideal `𝔪` of `R`; equivalently (8.6) `1 ∈ (I : J)(J : I)`. |
| Deligne module | A pair `(M, F)` with `M` a finite free `ℤ`-module and `F : M →ₗ[ℤ] M` such that `F ⊗ ℚ` is semisimple, every eigenvalue of `F` is a `q`-Weil number, and `q M ⊆ F M` (so `V := q F⁻¹` preserves `M`); the characteristic polynomial of `F` is the polynomial of the module. "Ordinary" Deligne module: half the roots of the characteristic polynomial are `p`-adic units (9.1). |
| Polarization of a Deligne module | Howe's convention (10.2): a nondegenerate alternating form `b : M × M → ℤ` with `b(Fx, y) = b(x, Vy)` and the positivity condition `b(ι x, x) > 0` phrased through a fixed `p`-adic CM type `Φ` of `ℚ[F]`. `Φ` is part of the data of the equivalence and is pinned in 9.2. |
| Principally polarizable class | `has_principal_polarization = 1` means some member of the isogeny class admits a principal polarization over `K`; `= −1` means none does; the LMFDB `0` ("unknown") has no counterpart here: the predicate is a `Prop`, and a page value `0` is a datum this roadmap neither confirms nor denies. Likewise `has_jacobian`. |
| Label prefix | The isogeny-class label `g.q.isog` is intrinsic: `g`, `q` and the coefficients `a_1, …, a_g` of `L_A` (Layer 11). Labels of endomorphism rings, weak equivalence classes, Deligne modules and polarizations carry enumerative indices, which are not targets; their intrinsic parts (the index `N`, the polarization degree `d`) are theorems here. |

## What Mathlib supplies

- Finite fields: `Finite K`, `Fintype.card`, `Nat.card`, `GaloisField p n`, `FiniteField.card`,
  `ringChar`, `frobenius K p`, `CharP`, `ExpChar`; `AlgebraicClosure K`, `SeparableClosure`.
- Polynomials: `Polynomial.Monic`, `roots`, `aroots`, `rootSet`, `reverse`, `Polynomial.Gal`,
  `galActionHom`, `Polynomial.splittingField`, `Squarefree`, `Irreducible`,
  `UniqueFactorizationMonoid.normalizedFactors`, `Polynomial.mahlerMeasure` and
  `finite_mahlerMeasure_le` (through R28.5.1).
- Linear algebra: `LinearMap.charpoly`, `Matrix.charpoly`, `LinearMap.IsSemisimple`,
  `Module.finrank`, `Module.Free`, `Module.Finite`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
  `Submodule.IsLattice`, `Submodule.span`, `FractionalIdeal`, `ClassGroup`, `IsDedekindDomain`,
  `IsLocalization.AtPrime`, `Ideal.IsMaximal`, `IsArtinianRing.equivPi`,
  `IsArtinianRing.isField_of_isReduced_of_isLocalRing`.
- Number fields: `NumberField`, `𝓞 K`, `NumberField.discr`, `InfinitePlace`, `IsReal`,
  `IsComplex`, `IsTotallyReal`, `IsTotallyComplex`, `IsCMField` with `complexConj` and
  `K⁺` (`Mathlib/NumberTheory/NumberField/CMField.lean`), `HeightOneSpectrum`,
  `adicCompletion`, `Padic`, `PadicInt`, `padicValRat`, `ClassGroup`, `classNumber`,
  `Units.rank`, `Algebra.trace`, `Algebra.norm`.
- Algebras: `Algebra.IsCentral` together with `IsSimpleRing` (Mathlib's spelling of "central
  simple algebra"; `CSA K` bundles them), `IsSemisimpleRing`,
  `isSemisimpleRing_iff_pi_matrix_divisionRing`, `Subalgebra.center`, `Algebra.adjoin`,
  `BrauerGroup`, `IsBrauerEquivalent` (`Mathlib/Algebra/BrauerGroup/Defs.lean`),
  `Algebra.Etale`, `IsReduced`, `IsArtinianRing.equivPi` (a reduced Artinian ring is the product
  of its residue fields), `TensorProduct`, `Matrix`.
- `Complex.arg`, `Real.pi`, `Complex.abs`, `Module.rank` over `ℚ`.

Mathlib has no absolute Frobenius of a scheme, no Newton polygon, no notion of order in an
étale algebra, no Gorenstein or Bass predicate, no weak equivalence, no Deligne module, and no
abelian variety.

## What Tau Ceti supplies

- `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`: `AbelianVariety K`, `dim`, `zeroSection`,
  `baseChange` with the invariance of `dim` under base change; `.../End/Basic`: `End A` as a ring with `toHom`, `ofHom`,
  `mulBy`, `congr`; `.../End/BaseChange`: `End.baseChange : End A →+* End (A.baseChange L)`;
  `.../Isogeny`: `IsIsogeny`, `isogenies` as a multiplicative morphism property respecting
  isomorphisms, `IsIsogeny.baseChange`; `.../Product`: `prod`, `fst`, `snd`, `lift`, finite
  products; `.../Hom/BaseChange`: `Hom.baseChange`, `baseChangeFunctor`; `.../MorphismGroup`:
  the commutative group `A ⟶ B`, `leftComp`, `rightComp`.
- `TauCeti.Algebra.Module.Torsion.TateModule`: `TateModule p A` for an additive group, with
  `proj`, `lift`, `map`, `mapLinearMap`, the `ℤ_[p]`-module structure, the profinite topology.
- `TauCeti.NumberTheory.NumberField.Global.Orders.*`: `NumberFieldOrder K`, `maximalNumberFieldOrder`,
  `conductor`, `index`, `discr`, `discr_eq_index_sq_mul`, `natCast_index_mem_conductor`,
  `multiplierRing`, `IsProperFractionalIdeal`, `invertibleProperFractionalIdeals`, `Pic`, `mkPic`,
  `NarrowPic`, `narrowToPic`, `IdealClassMonoid` with `multiplierRing`, `IsProper`,
  `picEquivUnits`, `Hom`, `mapFractionalIdeal`, `mapPic`, `integralIdealsAwayConductor`,
  `integralIdealsAwayConductorEquiv`.
- `TauCeti.AlgebraicGeometry.EllipticCurve.*`: `WeierstrassCurve.pointCount` (all `F`-points of
  the projective model), `WeierstrassCurve.frobeniusTrace` (`q + 1 − pointCount`),
  `hasse_bound`, `frobeniusIsogeny` with its degree and separable degree, `Isogeny.degree`.
- `TauCeti.Algebra.CentralSimple.*` and `TauCeti.Algebra.BrauerGroup.*`: the tensor-product
  group law, base change, splitting, quaternion classes, the real Brauer group, Wedderburn,
  Skolem–Noether, centralizers, degree and index.
- `TauCeti.NumberTheory.NumberField.ComplexConjugation.CMField`: CM fields and their involution.

## What is missing

Nothing in Mathlib or Tau Ceti mentions the Frobenius of an abelian variety of dimension
`> 1`, Tate's theorem over a finite field, the isogeny relation, Honda–Tate, the `p`-rank or
Newton polygon of an abelian variety, the group `A(𝔽_q)` beyond `g = 1`, orders in an étale
algebra, Bass orders, Cohen–Macaulay type, weak equivalence, Deligne modules, polarizations of
lattices, or Jacobians in an isogeny class. Tate's theorem and Honda–Tate are Part II's and the
Frobenius is DWP.1's (consumed); each of the others is built below.

## The build, in layers

Milestones are `### N.M`, grouped into the layers below. Each names its direct prerequisites at the end (*Rests on:*); every
prerequisite is Mathlib, Tau Ceti at the pin, a supplier roadmap cited by its own numbering, or a
strictly earlier milestone here. Throughout, `K` is a finite field, `q = Nat.card K`, `p = ringChar K`,
`A` and `B` are abelian varieties over `K` of dimensions `g` and `h`, `π_A` and `P_A` are as pinned.

## Layer 1: the Frobenius, the `L`-polynomial and the isogeny relation

Everything about `π_A` that is not already *Deligne weights and purity* DWP.1 or *Abelian schemes
and arithmetic moduli* A6, and the isogeny relation with its first invariants. Sources: Milne
*Abelian Varieties* (AV) II §1; Tate 1966 §1; Waterhouse 1969 Chapter 2.

### 1.1 Naturality of the Frobenius

For every `K`-homomorphism `f : A ⟶ B`, `f ∘ π_A = π_B ∘ f` (as a statement in `Additive (A ⟶ B)`
with the two `End` actions: `End.ofHom f * π_A = π_B * End.ofHom f` in the convention of Tau
Ceti's `End`, whose multiplication is composition in the order recorded by `ofHom_comp`). Hence
`π_A` is central in `End A` and in `End⁰(A)` (A6.21 states centrality; this is its proof from the
scheme-level Frobenius). Also: `π_{A × B} = (π_A, π_B)` under Tau Ceti's `prod`, `fst`, `snd`;
`π_{A^∨} = (π_A)^∨` for the dual of JacobianChallenge Layer E; `π_{A_L} = (End.baseChange π_A)^r`
for `[L : K] = r` (DWP.1 §1.1 states this for its model of `𝔽_{q^r}`; here for every `L`);
`π_A` is an isogeny of degree `q^g` (DWP.1 §1.1), and `π_A ∘ π_A^† = [q]` for the Rosati adjoint
of any polarization (A6.21), so the Verschiebung `V_A := π_A^† ∈ End A` is independent of the
polarization and `π_A V_A = V_A π_A = [q]`.
*Rests on:* DWP.1 §1.1; A6.21; A3.9; Tau Ceti `End`, `prod`, `End.baseChange`;
SchemeAndStackFoundations §0.29 (`qPowerFrobenius` is natural for all `K`-morphisms).

### 1.2 Points over every finite extension

For a finite extension `L / K` of degree `r` (any `L` with `[Algebra K L] [Module.Finite K L]`),
the group `A(L)` of `L`-points of the group scheme `A.toScheme` is the fixed subgroup of
`π_A^r` acting on `A(K^{sep})` (equivalently `A(AlgebraicClosure K)`, `K` being perfect), that is
`A(L) = ker (1 − π_A^r)(K^{sep})`; it is finite; and
`Nat.card (A(L)) = (End.charpoly (π_A^r)).eval 1 = Hom.deg (1 − π_A^r)`. DWP.1 §1.5 proves the count
for its model of `𝔽_{q^r}`; the content
here is that any two extensions of `K` of degree `r` are `K`-isomorphic (Mathlib
`FiniteField.algEquivOfCardEq`) and `A(−)` carries isomorphisms to isomorphisms, so `#A(L)` is a
function of `r` alone, written `#A(𝔽_{q^r})`. Corollaries: `A(K) ⊆ A(L)` as subgroups of `A(K^{sep})`
with `#A(K) ∣ #A(L)` (because `T − 1 ∣ T^r − 1` and `∏(1 − α_i^r)/∏(1 − α_i) = ∏(1 + α_i + ⋯ + α_i^{r−1})`
is a symmetric integer); `A(K^{sep})` is the increasing union of the `A(𝔽_{q^r})` over `r`
ordered by divisibility; and `#A(𝔽_{q^r}) = ∏_{i=1}^{2g} (1 − α_i^r)` in `ℂ` (DWP.1 §1.5, §1.9).
*Rests on:* DWP.1 §§1.1, 1.5, 1.9; A6.1, A6.10; Mathlib `FiniteField.algEquivOfCardEq`.

### 1.3 The `L`-polynomial and the functional equation

`L_A := Polynomial.reverse P_A ∈ ℤ[T]`; `L_A(0) = 1`, `natDegree L_A = 2g`, leading coefficient
`q^g`. The reciprocity of `P_A` — `a_{2g−i} = q^{g−i} a_i` for `P_A = ∑ a_i T^{2g−i}`, `0 ≤ i ≤ g`,
so `P_A(0) = q^g` — is Part II F0.2; equivalently **the root multiset of `P_A` is stable under
`α ↦ q/α`** (by A6.21 and DWP.1 §1.3 the Rosati involution acts on `ℚ[π_A] ⊗ ℝ` as complex
conjugation on each factor and `π_A^† = q/π_A`, so the complex conjugate of each root `α` is
`q/α`). Consequently `P_A` is symmetric in the sense of `CurvesOverFiniteFields`
(`q^j · coeff_j P_A = q^g · coeff_{2g−j} P_A`) and `L_A` has the coefficient shape
`1, a_1, …, a_g, q a_{g−1}, …, q^g` of the LMFDB `poly`. The pair `(q, P_A)` satisfies the
sibling's `IsWeilPolynomial q P_A ∧ IsWeilSymmetric q g P_A` (DWP.1 §1.4 for the modulus; Part II
F0.2 for the symmetry), which is the statement that lets every Layer-4 result of
`CurvesOverFiniteFields` be applied to `P_A`.
*Rests on:* DWP.1 §§1.3, 1.4; A6.21; Part II F0.2; Mathlib `Polynomial.reverse`.

### 1.4 Powers of the Frobenius and the sibling's `weilPower`

`P_{A,r} := End.charpoly (π_A^r)` has roots `α_1^r, …, α_{2g}^r` (DWP.1 §1.9) and equals
`weilPower P_A r` of `CurvesOverFiniteFields` 4.10 (both are the characteristic polynomial of
`π^r` on a `2g`-dimensional space whose `π` has characteristic polynomial `P_A`: compare on
`V_ℓ A` through A6.11). Hence `#A(𝔽_{q^r}) = virtualAbvarCount P_A r` (sibling 4.11); the sequence
`r ↦ #A(𝔽_{q^r})` determines `P_A` (it is `∑_{S ⊆ {1..2g}} (−1)^{|S|} (∏_{i ∈ S} α_i)^r`, an
exponential sum that determines each distinct product `∏_{i∈S} α_i` with its signed multiplicity,
and the products of modulus `√q` are exactly the `α_i`, each with coefficient `−(multiplicity)`);
for `g ≤ 2` the two counts `#A(𝔽_q) = P_A(1)` and `#A(𝔽_{q²}) = P_A(1) P_A(−1)` already determine
`a_1, a_2` linearly; and `P_{A_L} = P_{A,r}` for `[L : K] = r` (1.1).
*Rests on:* 1.1, 1.2; DWP.1 §1.9; A6.11; `CurvesOverFiniteFields` 4.10, 4.11.

### 1.5 Jacobians: `P_{Jac C}` is the Weil polynomial of the function field

For a smooth projective geometrically connected curve `C / K` of genus `g` with function field `F`
and Jacobian `J = Jac C` (JacobianChallenge Layer E, `dim J = g`): `P_J = P_F`, the Weil polynomial
of `CurvesOverFiniteFields` 2.5, and `#C(𝔽_{q^r}) = N_r(F) = q^r + 1 − ∑ α_i^r` for all `r`
(FunctionFieldArithmetic §5.4: `L_F` is the reversed characteristic polynomial of the Frobenius of
the Jacobian, DWP.1 §1.6, and gives the count from its roots; `CurvesOverFiniteFields` 2.6 is the
integer form). Hence the `curve_counts` of a Jacobian class are honest counts (7.4 below only
*defines* them from `P_A`), and `#J(K) = P_J(1) = h_F` is the class number of the function field
(FunctionFieldArithmetic §5.3).
*Rests on:* 1.4; DWP.1 §1.6; JacobianChallenge Layer E; FunctionFieldArithmetic §§5.3–5.4;
`CurvesOverFiniteFields` 2.5, 2.6.

### 1.6 The elliptic comparison

For a Weierstrass curve `W / K` with `[W.IsElliptic]` and `E` the abelian variety attached to it
(A0.2 `toAbelianVariety`, a one-dimensional `AbelianVariety K`): `P_E = T² − a T + q` with
`a = WeierstrassCurve.frobeniusTrace W`, and `#E(K) = WeierstrassCurve.pointCount W` (A6.10's
elliptic check, made a theorem against Tau Ceti's declarations); the
Frobenius `π_E` is `frobeniusIsogeny` under the dictionary; and `L_E = 1 − aT + qT²`, the Euler
factor of [EllipticCurves](../EllipticCurves/README.md) Layer 3. The dimension-zero variety has
`P = 1`, `L = 1`, one point over every `L`.
*Rests on:* 1.2, 1.3; A0.2; A6.10; Tau Ceti `WeierstrassCurve.frobeniusTrace`, `pointCount`,
`frobeniusIsogeny`, `DimensionZero`.

### 1.7 The isogeny relation

`IsIsogenous A B := ∃ f : A ⟶ B, IsIsogeny f`. Milestones: reflexive (`isIsogeny_id`);
**symmetric**: an isogeny `f` of degree `n` admits `g : B ⟶ A` with `g ∘ f = [n]_A` and
`f ∘ g = [n]_B` (A3.1, A3.5 dual isogenies), and `g` is an isogeny; transitive
(`IsIsogeny.comp`); `IsIsogenous` is a `Setoid` and the **isogeny class** of `A` is its class in
the quotient. Invariance: isogenous varieties have equal dimension (an isogeny is finite and
surjective); `IsIsogenous (A.baseChange L) (B.baseChange L)` for every `L`
(`IsIsogeny.baseChange`); `IsIsogenous (A × A') (B × B')` from the factors;
`IsIsogenous A B → IsIsogenous A^∨ B^∨`. Isogenous varieties have isomorphic `End⁰`:
`φ ↦ (1/n) g φ f` is a
`ℚ`-algebra isomorphism `End⁰(B) ≃ End⁰(A)` carrying `π_B` to `π_A`, and `Hom⁰(A, B)` depends
only on the two classes.
*Rests on:* Tau Ceti `IsIsogeny`, `isogenies`; A3.1, A3.5, A6.1, A6.7.

### 1.8 First invariants of the isogeny class

If `IsIsogenous A B` then `P_A = P_B` (1.1 and A6.11: `V_ℓ f` is an isomorphism intertwining the
two Frobenii), hence `#A(𝔽_{q^r}) = #B(𝔽_{q^r})` for all `r` (Part II F0.5), `L_A = L_B`, and every
function of `P_A` in this roadmap is an invariant of the class. The converse is Part II F3.3.
*Rests on:* 1.1, 1.2, 1.7; A6.11; Part II F0.5.

## Layer 2: the Tate module and the endomorphism field

Tate's theorem over a finite field and its consequences are [*Abelian schemes and arithmetic
moduli, part II*](../AbelianSchemesAndArithmeticModuliPartII/README.md) (Part II below), consumed:
at `ℓ ≠ p`, `Hom(A, B) ⊗ ℤ_ℓ ≅ Hom_{G_K}(T_ℓ A, T_ℓ B)` (F0.7, by Tate's isotropic image lemma F0.4
under the polarized finiteness that F0.1 and F0.8 establish over finite fields, and the split-prime
commutant F0.6, which gives `dim_ℚ Hom⁰(A, B) = #{(i, j) | α_i = β_j}`, counted with multiplicity
over the root multisets of `P_A`, `P_B`); at `p`, `Hom(A, B) ⊗ ℤ_p ≅ Hom(C(B), C(A))` for the
contravariant Dieudonné modules with `F` and `V`, and its rational form identifying
`End⁰(A)^{op} ⊗ ℚ_p` with the endomorphism algebra of the isocrystal (F1.9–F1.10); and the
**isogeny criterion `IsIsogenous A B ↔ P_A = P_B`** (F3.3). This layer keeps the Galois
representation those statements are about and the endomorphism field. Sources: Tate 1966 §§1–3;
Milne AV II §2.

### 2.1 The Galois representation on the Tate module

For `ℓ ≠ p`, `T_ℓ A = AbelianTate A ℓ` is a free `ℤ_ℓ`-module of rank `2g` with a continuous
action of `G_K = Gal(K^{sep}/K) ≅ ℤ̂` in which the arithmetic Frobenius acts as `AbelianTate.map π_A`
(DWP.1 §1.1). Milestones: the image of `G_K` in `GL(T_ℓ A)` is the closure of the subgroup
generated by `T_ℓ π_A`; a `ℤ_ℓ`-linear map `φ : T_ℓ A → T_ℓ B` is `G_K`-equivariant iff
`φ ∘ T_ℓ π_A = T_ℓ π_B ∘ φ`; so `Hom_{G_K}(T_ℓ A, T_ℓ B) = {φ | φ π_A = π_B φ}` and
`End_{G_K}(V_ℓ A)` is the commutant of `π_A` in `End_{ℚ_ℓ}(V_ℓ A)`; `π_A` acts semisimply on
`V_ℓ A` (A6.21), so `V_ℓ A` is a semisimple `ℚ_ℓ[π_A]`-module and `ℚ_ℓ[π_A] ⊆ End(V_ℓ A)` is a
product of fields; `charpoly (T_ℓ π_A) = P_A` (A6.11). Geometric Frobenius is `π_A⁻¹` on `V_ℓ A`
and never enters a statement below.
*Rests on:* A4.1, A6.11, A6.21; DWP.1 §1.1; Tau Ceti `TateModule`.

### 2.8 Homomorphisms after base change and the endomorphism field

For `L / K` finite of degree `r`: `Hom(A_L, B_L) ⊗ ℚ_ℓ ≅ Hom_{ℚ_ℓ[π^r]}(V_ℓ A, V_ℓ B)` (Part II
F0.6–F0.7 over `L`, 1.1), so `dim_ℚ Hom⁰(A_L, B_L) = #{(i, j) | α_i^r = β_j^r}`;
`Hom(A_L, B_L) = Hom(A_{K^{sep}}, B_{K^{sep}})` once `r` is a multiple of every order of a root of
unity among the ratios
`α_i / β_j` (then the count stabilizes), and every homomorphism over `K^{sep}` is defined over a
finite extension (A6.7: `Hom` is finitely generated, and each generator is defined over a finite
extension, `Hom.baseChange` being injective). The **endomorphism field** of `A` is the least
subextension `L ⊆ K^{sep}` with `End(A_L) = End(A_{K^{sep}})`; it exists and is `𝔽_{q^d}` for a
unique `d ≥ 1`, which Layer 5 identifies with the sibling's `geometricExtensionDegree P_A`.
*Rests on:* 1.1; Part II F0.6–F0.7; A6.7; Tau Ceti `Hom.baseChange`.

## Layer 3: the endomorphism algebra of a simple abelian variety

Throughout, `A` is simple (A6.4), `D := End⁰(A)` is a division algebra (A6.4 `simpleEndDivision`),
`F := ℚ(π_A) ⊆ D`, and `m_A ∈ ℤ[T]` is the minimal polynomial of `π_A` over `ℚ` (monic, irreducible,
integral since `π_A` is integral). Consumed from Part II: `F` is the centre of `D`, `P_A = m_A^e`
with `e² = [D : F]` (the LMFDB `divalg_dim`) and **`2g = e · [F : ℚ]`** (F3.2's dimension formula,
with the commutant of F0.6); and the local invariants of `D` in the pinned normalization:
`inv_v(D) = 0` at `v ∤ p∞` (F0.6: `D ⊗_F F_v` is split),
`inv_v(D) = (ord_v π_A / ord_v q) · [F_v : ℚ_p] mod 1` at `v ∣ p` (F1.11), `inv_v(D) = 1/2` at real
`v` (F3.2). Hence `D` is determined
up to isomorphism by `π_A` (ClassFieldTheory Layer 10), `e` is the order of `[D]` in `Br F`, and
`e`, `g = e[F:ℚ]/2` and `P_A = m_A^e` are functions of `m_A` alone. The LMFDB's
`brauer_invariants` are the `inv_v(D)` at the `places` `v ∣ p` of `F` (reduced fractions in
`[0, 1)`), its `center` is `F`, its `divalg_dim` is `e²`. This layer keeps the real classes and the
display data. Sources: Tate 1966 Theorem 2; Milne AV II.2.9; Waterhouse–Milne 1971 §2; Waterhouse
1969 Chapter 2.

### 3.3 Real Weil numbers: the three exceptional classes

`F` has a real place only when some root of `m_A` is real, i.e. `π_A = ±√q` under that place, so
`F = ℚ` (`q` a square) or `F = ℚ(√p)` (`q = p^a`, `a` odd) and `m_A ∈ {T − √q, T + √q, T² − q}`. If
`q` is a square, `m_A = T ∓ √q`, `F = ℚ`, `D` is the quaternion algebra over
`ℚ` ramified exactly at `p` and `∞`, `e = 2`, `g = 1`, `P_A = (T ∓ √q)²`: the supersingular elliptic
curves over `K` with trace `±2√q` (Waterhouse 1969 Theorem 4.1(2)). If `q` is not a square,
`m_A = T² − q`, `F = ℚ(√p)`, `D` is the quaternion algebra over `F` ramified exactly at the two
real places (the invariant above `p` is `(1/2) · 2 = 0`, and `e = 1` would give `P_A = T² − q` with
constant term `−q ≠ q^g`), `e = 2`, `g = 2`, `P_A = (T² − q)²`: a simple supersingular abelian
surface with `End⁰ ⊗ ℝ ≅ ℍ × ℍ`, geometrically isogenous to the square of a supersingular elliptic
curve (5.3 below makes this precise). Every other simple `A` has `F` a CM field (totally imaginary
quadratic over the totally real `ℚ(π_A + V_A)`), as `CurvesOverFiniteFields` 4.8 proves on the
polynomial side; the Rosati involution restricts to complex conjugation of `F`.
*Rests on:* 1.3; Part II F1.11, F3.2; A6.14; `CurvesOverFiniteFields` 4.5, 4.8.

### 3.4 The endomorphism algebra of an arbitrary `A`, and the display data

For `A ~ ∏ A_i^{n_i}` (A6.5), `End⁰(A) ≅ ∏ M_{n_i}(D_i)` with `D_i = End⁰(A_i)` (A6.5, A6.8, 1.7),
its centre is `∏ F_i`, and `dim_ℚ End⁰(A) = ∑ n_i² e_i² [F_i : ℚ]`, which agrees with the
coincidence count of Part II F0.6. For a finite extension `L / K`, `End⁰(A_L)` is the same product
for the decomposition of `A_L` (whose factors are read off `P_{A,r}` by Honda–Tate over `L`,
Part II F3.2), and for `L` containing the endomorphism field (2.8) it is `End⁰(A_{K̄})`. The LMFDB's
endomorphism algebra tables record, for each `L = 𝔽_{q^r}` with `r ∣ d`, the list of pairs
`(F_i, D_i)` with `divalg_dim = e_i²`, `center = F_i` and the `inv_v` at `v ∣ p`; Part II F1.11 and
F3.2 compute every entry.
*Rests on:* 1.7, 2.8; Part II F0.6, F1.11, F3.2; A6.5, A6.8.

## Layer 4: Honda–Tate, and Waterhouse's elliptic list

Honda–Tate is Part II F3.2, consumed, with `q`-Weil numbers as in F0.3 (algebraic integers all of
whose conjugates have absolute value `√q`; the predicate of `CurvesOverFiniteFields` 4.1 on their
minimal polynomials), existence from F3.1a–F3.1c (CM types with prescribed slopes, their
realization, effectivity of a power by CM reduction) and the Weil-restriction descent
`P_{Res B}(T) = P_B(T^N)` of F3.1d: `A ↦ w(A)`, the conjugacy class of the roots of `m_A`, is a
bijection from simple isogeny classes over `K` to conjugacy classes of `q`-Weil numbers,
equivalently to monic irreducible Weil `q`-polynomials (`CurvesOverFiniteFields` 4.1, 4.2).
Throughout this roadmap, for a monic irreducible Weil `q`-polynomial `m`, `e(m)` is the index of the
division algebra F3.2 attaches to the class of its roots (the order of the Brauer class with the
invariants of Layer 3, a function of `m` and `q`) and `g(m) := e(m) · deg m / 2`, so the simple
class with `m_A = m` has `P_A = m^{e(m)}` and dimension `g(m)`. With A6.5 and F0.2
(`P_{A×B} = P_A P_B`), F3.2 says which polynomials occur: a monic `P ∈ ℤ[T]` is the characteristic
polynomial of an abelian variety over `K` iff `P = ∏_i m_i^{e(m_i) n_i}` with the `m_i` distinct
monic irreducible Weil `q`-polynomials and `n_i ≥ 1`, and then `A ~ ∏ A_i^{n_i}` with
`w(A_i) = [m_i]`; `A ↦ P_A` is a bijection from isogeny classes of dimension `g` over `K` to the set
of such `P` of degree `2g`, which is finite (`CurvesOverFiniteFields` 4.3). The LMFDB knowl
`av.fq.honda_tate` is this statement with Waterhouse 1969 Chapter 2 as its source. This layer keeps
the elliptic case.

### 4.6 Elliptic curves: Waterhouse's list

For `g = 1`, Honda–Tate (Part II F3.2) reads: the isogeny classes of elliptic curves over `K`
correspond to the integers `a` with `|a| ≤ 2√q` such that one of: `p ∤ a`; `a` even (as
`q = p^{a_0}`, `a_0` even) and `a = ±2√q`; `a_0` even, `p ≢ 1 mod 3`, `a = ±√q`; `a_0` odd,
`p ∈ {2, 3}`, `a = ±p^{(a_0+1)/2}`; `a_0` odd or (`a_0` even and `p ≢ 1 mod 4`), `a = 0`
(Waterhouse 1969 Theorem 4.1). The proof is the reading of F3.2 in the Layer 4 introduction with
`P = T² − aT + q`: when `P` is irreducible with `F = ℚ(π)` imaginary quadratic one needs
`e(P) = 1`, i.e. the `p`-adic invariants of F1.11 integral, which is the case analysis; when `P` has
a real root one is in 3.3. The first family is the ordinary curves, the rest supersingular (6.3).
*Rests on:* 3.3; Part II F1.11, F3.2; EllipticCurves Layer 3.

## Layer 5: decomposition, geometric data and twists

The data of the LMFDB's "Decomposition", "Base change" and "Twists" boxes: every item is a
function of `P_A` through Honda–Tate, and each milestone proves the identification of the
polynomial-level reading (`CurvesOverFiniteFields` 4.9, 4.10) with the statement about `A`.
Sources: Milne AV II §2; Waterhouse 1969 Chapter 2; the LMFDB knowls `av.fq.number_field`,
`av.fq.galois_group`, `ag.primitive`, `ag.base_change`.

### 5.1 Simple factors and multiplicities

`simpleFactors A : Multiset (Quotient isogenyClassSetoid)` is the multiset of isogeny classes of
simple factors of `A` with multiplicity (A6.5 gives the decomposition and its uniqueness; 1.7 makes
the classes well defined). Milestones: `A ~ ∏_{[A_i] ∈ simpleFactors A} A_i` (as a product over the
multiset, A6.5 with Tau Ceti `prod`); `P_A = ∏ P_{A_i}` over the multiset (1.8 and Part II F0.2,
F3.3 applied to the product) and conversely **the multiset is read off `P_A`**: `simpleFactors A` is
the image under `[m] ↦` the class with `m_A = m` (Part II F3.2) of the multiset
`∑ (e(m_i) n_i / e(m_i)) [m_i]`, i.e. each monic irreducible factor `m_i` of multiplicity `k_i` in
`P_A` contributes `k_i / e(m_i)` copies (Layer 4: `e(m_i) ∣ k_i`).
`IsSimple A ↔ IsIsotypic P_A ∧ (exponent = e(m))` (A6.4; the sibling's
`IsIsotypic` alone is "isotypic", `A ~ A_1^{n}`); `is_squarefree`, as pinned, is `∀ n_i = 1`, i.e.
`simpleFactors A` has no repeated element, equivalently every irreducible factor `m_i` of `P_A` has
multiplicity exactly `e(m_i)`, equivalently `End⁰(A)` has no matrix factor (3.4); the stronger
`Squarefree P_A` (all `n_i = e_i = 1`) is equivalent to `End⁰(A)` commutative and is the
hypothesis of Layers 8–9, not an LMFDB column; the LMFDB `simple_distinct` is the support of
`simpleFactors A` and `simple_multiplicities` its multiplicities. `dim A = ∑ n_i g_i`. For products:
`simpleFactors (A × B) = simpleFactors A + simpleFactors B`; for the dual:
`simpleFactors A^∨ = simpleFactors A` (`P_{A^∨} = P_A`, 1.1).
*Rests on:* 1.1, 1.7, 1.8; Part II F0.2, F3.2, F3.3; A6.4, A6.5; `CurvesOverFiniteFields` 4.9.

### 5.2 Decomposition after base change

For `L / K` of degree `r`: `P_{A_L} = P_{A,r}` (1.4), so `simpleFactors (A.baseChange L)` is read
off `weilPower P_A r` by 5.1 over `L`. Milestones: the simple factors of `A_L` are factors of base
changes of simple factors of `A`; a simple `A` stays simple over `L` iff `P_{A,r} = m'^{e(m')}`
with `m'` irreducible (5.1 over `L`), and otherwise `P_{A,r} = m'^{k}` with `e(m') ∣ k` and
`A_L ~ B^{k / e(m')}` for the simple `B / L` with `m_B = m'` (Milne II §2: the roots `α_i^r`
coincide exactly when `α_i / α_j` is an `r`-th root of unity, which is what creates multiplicity). The surface `(T² − q)²` of 3.3 has
`P_{A,2} = (T − q)⁴`, so `A_{𝔽_{q²}} ~ E²` for the supersingular curve `E / 𝔽_{q²}` with
`π_E = q` (Part II F3.2 over `𝔽_{q²}`: `e(T − q) = 2`), which is the precise form of "geometrically isogenous
to the square of a supersingular elliptic curve" promised in 3.3.
*Rests on:* 1.4, 3.3, 5.1; Part II F3.2; `CurvesOverFiniteFields` 4.10.

### 5.3 Geometric simplicity and geometric squarefreeness

`IsGeometricallySimple A := IsSimple (A.baseChange (AlgebraicClosure K))` (pinned). Milestones:
every abelian subvariety of `A_{K̄}` is defined over a finite extension (A6.7 for its inclusion
morphism, as in 2.8), so **`IsGeometricallySimple A ↔ ∀ r ≥ 1, IsSimple (A.baseChange 𝔽_{q^r})`**;
the decomposition of `A_L` stabilizes once `L` contains the endomorphism field (2.8:
`End⁰(A_L) = End⁰(A_{K̄})`, and the number of simple factors with multiplicity is read off the
centre and the
`n_i` of 3.4), so it suffices to test `r = d`, the geometric extension degree (5.4):
`IsGeometricallySimple A ↔ IsSimple (A.baseChange 𝔽_{q^d})`, which by 5.1 is a condition on
`weilPower P_A d`. Consequences: `IsGeometricallyIrreducible P_A → IsGeometricallySimple A`
(sibling 4.10: all `P_{A,r}` irreducible, so all `A_{𝔽_{q^r}}` simple), with the converse when
`e(m_d) = 1` for the irreducible `m_d` with `P_{A,d} = m_d^{e(m_d)}`; a geometrically simple `A` is
simple; the surface of 3.3 and every supersingular `A` of dimension `≥ 2` is not geometrically
simple (6.3). `is_geometrically_squarefree` is `is_squarefree` for `A.baseChange 𝔽_{q^d}` (5.1 over
`𝔽_{q^d}`: `simpleFactors (A_{𝔽_{q^d}})` has no repeated element, equivalently every irreducible
factor of `P_{A,d}` occurs to exactly its exponent `e` over `𝔽_{q^d}`), knowl
`av.geometrically_squarefree`; it is stable under further extension (the decomposition has
stabilized), fails for every supersingular `A` of dimension `≥ 2` (`A_{𝔽_{q^r}} ~ E^g`, 6.3) and for
`2.2.a_ae` (`A_{𝔽_4} ~ E²`, 5.2) although both are `is_squarefree`.
*Rests on:* 2.8, 3.4, 5.1, 5.2; A6.4, A6.7; `CurvesOverFiniteFields` 4.10.

### 5.4 The endomorphism field and the geometric extension degree

With `d := geometricExtensionDegree P_A` of `CurvesOverFiniteFields` 4.10 (the least `r ≥ 1` such
that `(α_i/α_j)^r = 1` for every ratio of roots that is a root of unity): **the endomorphism field
of 2.8 is `𝔽_{q^d}`**. Proof: by 2.8, `dim_ℚ End⁰(A_{𝔽_{q^r}}) = #{(i, j) | α_i^r = α_j^r}`, which is
nondecreasing in divisibility of `r`, maximal exactly when every root-of-unity ratio is killed by
`r`, and `End(A_L) = End(A_{K̄})` iff this dimension is maximal (`End(A_L) ⊆ End(A_{K̄})` is an
inclusion of free `ℤ`-modules of the same rank iff it is saturated, A6.7, and saturation holds
because an endomorphism over `K̄` defined over `L` up to torsion is defined over `L`:
`Hom.baseChange` is injective with saturated image, A6.2). Hence `geometric_extension_degree = d`,
`d = 1` iff `End A = End A_{K̄}`, `d ∣ r` iff `End(A_{𝔽_{q^r}}) = End(A_{K̄})`, and the LMFDB's
`endo_extensions` table lists `End⁰(A_{𝔽_{q^r}})` for `r ∣ d` (3.4). Bound: `d` divides the
exponent of the group generated by the root-of-unity ratios, which lie in a number field of degree
`≤ (2g)!`, so `d ≤ ` the largest order of a root of unity in such a field; the sibling's 4.10
finiteness gives `d` finite.
*Rests on:* 2.8, 3.4; A6.2, A6.7; `CurvesOverFiniteFields` 4.10.

### 5.5 Primitivity and base-change models

`IsPrimitiveClass A := ∀ (K₀ : Subfield K), K₀ ≠ ⊤ → ∀ B : AbelianVariety K₀, ¬ IsIsogenous (B.baseChange K) A`
(the isogeny class is not a base change from a proper subfield;
knowl `ag.primitive` at the level of isogeny classes, the LMFDB's `is_primitive`). Milestones: with
`q = q₀^r`, `r ≥ 2`, `B / 𝔽_{q₀}` has `P_{B_K} = weilPower P_B r` (1.4), so
**`IsPrimitiveClass A ↔ ∀ r ≥ 2, ∀ q₀, q₀^r = q → ∀ Q ∈ weilRoots r P_A, Q is not the characteristic polynomial of an abelian variety over 𝔽_{q₀} (Part II F3.2)`**,
where `weilRoots r P_A` (the monic `Q` with `weilPower Q r = P_A`; sibling 4.10) is finite. The
**base-change models** of `A` are the pairs `(q₀, [B])` with
`q₀^r = q`, `r ≥ 2` and `P_B ∈ weilRoots r P_A`, finitely many (Part II F3.3 over `𝔽_{q₀}`); `primitiveModels A` is the
set of those with `IsPrimitiveClass B`, the LMFDB's `primitive_models`, nonempty iff
`¬ IsPrimitiveClass A` (a model over the least subfield from which `A` descends is primitive, base
change being transitive). The purely polynomial condition "`weilRoots r P_A` contains no `q₀`-Weil
polynomial for any `r ≥ 2`" implies `IsPrimitiveClass A` and is *strictly* stronger: `1.4.ae`
(`P = (T − 2)²` over `𝔽_4`) is primitive as an isogeny class (an elliptic curve over `𝔽_2` with
trace `a` has `P_{E,2} = T² − (a² − 4)T + 4`, and `a² − 4 = 4` has no integer solution) but
`T² − 2 ∈ weilRoots 2 ((T − 2)²)` is a `2`-Weil polynomial that is not a `P_B` (Part II F3.2:
`e(T² − 2) = 2`). Realizability is Honda–Tate, which is why the column is a statement about isogeny
classes and lives here.
*Rests on:* 1.4; Part II F3.2, F3.3; `CurvesOverFiniteFields` 4.2, 4.10.

### 5.6 Twists

At the level of isogeny classes (pinned):
`IsTwistClass A B := ∃ r ≥ 1, IsIsogenous (A.baseChange 𝔽_{q^r}) (B.baseChange 𝔽_{q^r})`, and the
**twist degree** `twistDegree A B` is the least such `r`.
Milestones: `IsTwistClass A B ↔ ∃ r ≥ 1, IsTwistOver r P_A P_B` (Part II F3.3 over `𝔽_{q^r}`, 1.4; the
sibling's 4.10 relation `weilPower P_A r = weilPower P_B r`) and
`twistDegree A B = twistDegree P_A P_B` (sibling 4.10); it is an equivalence relation; the twist
class of `A` is finite (the
polynomial twist class of `P_A` is, sibling 4.10, and Part II F3.3) and its members are the classes
`B` with `P_B` in the polynomial twist class of `P_A` — not every member of that polynomial class is
a `P_B` (`T² − 2` lies in the class of `P_{1.2.a} = T² + 2` with `r = 4`, and no abelian variety
over `𝔽_2` has it, Part II F3.2), so membership is decided by Part II F3.2; `twists A` is the set of
classes `B ≠ A` with
`IsTwistClass A B`, `twistCount A := Nat.card (twists A) + 1` the size of the twist class with `A`
counted (the LMFDB's `twist_count`: `1.4.ae` has the four twists `1.4.a`, `1.4.ac`, `1.4.c`, `1.4.e`
and `twist_count = 5`; `2.2.ad_f` has three and `twist_count = 4`) and
`maxTwistDegree A := sSup {twistDegree A B | B ∈ twists A}` (the LMFDB's `max_twist_degree`; `0`
for a class without twists); every twist degree divides the lcm of the orders of the root-of-unity
ratios `α_i / β_j`; `A_{K̄} ≅ B_{K̄}` implies `IsTwistClass A B` (an isomorphism over `K̄` is defined
over a finite extension, A6.7, and is an isogeny there), so a twist in the sense of knowl `av.twist`
lies in the twist class; the quadratic twist of A6.34 has `P_{A'}(T) = P_A(−T)` and is a twist of
degree `≤ 2`; `IsTwistClass A B` implies equal dimension and geometric extension degree (5.4) and
equal `p`-rank, slopes and angle rank of `P_A` and `P_B` (sibling 4.6, 4.7: all are invariants of
`P_{A,r}` for one `r`). Example: over `𝔽_2` the three supersingular classes `1.2.a`, `1.2.ac`,
`1.2.c` form one twist class with `max_twist_degree = 8` (`(i√2)^8 = (1 + i)^8 = 16`, and no smaller
power works), while the ordinary classes `1.2.ab`, `1.2.b` form a class of degree `2`.
*Rests on:* 1.4, 5.4; Part II F3.2, F3.3; A6.7, A6.34; `CurvesOverFiniteFields` 4.6, 4.7, 4.10.

### 5.7 The number field and the Galois group of a class

For `A` with `P_A` irreducible (hence simple with `e = 1`): `F = ℚ(π_A) ≃ weilNumberField P_A`
(sibling 4.8) as `ℚ`-algebras carrying `π_A` to the root, of degree `2g`; it is a CM field with
maximal real subfield `ℚ(π_A + V_A) ≃ AdjoinRoot h_{P_A}` (3.3; sibling 4.8), or `ℚ(√p)`, or `ℚ`
in the real cases; `galois_group := weilGaloisGroup P_A = Polynomial.Gal (P_A)_ℚ`, the Galois group
of the splitting field, with its action on the `2g` roots (knowl `av.fq.galois_group`). For
reducible `P_A` the LMFDB's `number_fields` and `galois_groups` are the lists over the distinct
irreducible factors `m_i`; each `ℚ[T]/(m_i)` is the centre `F_i` of the corresponding factor of
`End⁰(A)` (3.4), which is the content of attaching them to `A`. The class-number, discriminant and
signature of `F` are those of Mathlib's `NumberField` structure on `weilNumberField`; the LMFDB
labels of the fields are not a target.
*Rests on:* 3.3, 3.4; Part II F3.2; `CurvesOverFiniteFields` 4.8.

## Layer 6: `p`-rank, Newton polygon, ordinary and supersingular, angle rank

The geometric invariants at `p`, each defined on `A` and then identified with the polynomial
invariant of `P_A` from `CurvesOverFiniteFields` 4.6–4.7. Sources: Milne AV I §7 (`A[p]`),
Waterhouse 1969 Chapter 1 (Dieudonné modules and slopes), Waterhouse–Milne 1971 §2; the LMFDB
knowls `av.fq.p_rank`, `av.fq.ordinary`, `av.fq.supersingular`, `av.fq.newton_elevation`,
`av.fq.angle_rank`.

### 6.1 The `p`-rank of `A`

`pRank A := Module.finrank (ZMod p) (A[p](AlgebraicClosure K))` (pinned; knowl `av.fq.p_rank`).
Milestones: `A[p](K̄)` is a finite elementary abelian `p`-group (A4.5: `A[p]` is a finite flat
group scheme of order `p^{2g}`, and its `K̄`-points form the group of its étale part), so
`0 ≤ pRank A ≤ g`, with the bound `≤ g` from the connected–étale sequence of `A[p]` and the
Cartier duality `A[p]^∨ ≅ A^∨[p]` (A4.5, A3.x duality): the étale part has order at most `p^g`
because the connected part of `A[p]` has order at least `p^g` (its Lie algebra is that of `A`,
of dimension `g`); equality `pRank A = g` is
`IsOrdinary A` (pinned). `pRank` is invariant under base change (`A[p](K̄)` does not see `L`),
additive on products, and an isogeny invariant (an isogeny of degree prime to `p` induces an
isomorphism on `A[p^∞]`; one of degree a power of `p` preserves the étale height, A4.5), and
`pRank A^∨ = pRank A` (Cartier duality). For `g = 1` it is `0` or `1`, and
`pRank E = 0 ↔ IsSupersingular p E` in the sense of [EllipticCurves](../EllipticCurves/README.md)
Layer 3.
*Rests on:* A4.5; JacobianChallenge Layer E (duals); EllipticCurves Layer 3.

### 6.2 The Newton polygon of `A` and the slope comparison

The Newton polygon of `A` is the polygon of `P_A` at `p` (pinned; sibling 4.6), with slope multiset
`slopes A := slopes P_A`, `2g` rationals in `[0, 1]`, symmetric under `s ↦ 1 − s` (1.3, sibling
4.6). **Comparison:** the slopes of `P_A` are the slopes of the `F`-isocrystal `M(A) ⊗ L` of
`A[p^∞]` (A4.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.15–R07.2.16 for the slope
decomposition over `K̄` and its descent to `K`), because `π_A = F^a` acts on the isocrystal with
characteristic polynomial `P_A` (Part II F1.10: `End⁰(A)^{op} ⊗ ℚ_p` is the endomorphism algebra of the isocrystal, which identifies the Frobenius) and the
slopes of an isocrystal over a finite field are the `q`-normalized valuations of the eigenvalues of
its linear Frobenius (R07.2.16). Consequences: **`pRank A` = multiplicity of the slope `0`** (the
étale part of `A[p^∞]` is the slope-`0` part of the isocrystal, A4.5, and its height is the
`p`-rank by 6.1), which is the sibling's `pRank p P_A` and the elementary criterion
`IsOrdinary A ↔ p ∤ coeff g P_A` (sibling 4.6); `p_rank_deficit := g − pRank A` (the LMFDB
`p_corank`). Isogenous varieties have the same polygon (1.8), and
`slopes (A × B) = slopes A + slopes B` (sibling 4.6, polygon of a product).
*Rests on:* 1.3, 1.8, 6.1; Part II F1.10; A4.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.15,
R07.2.16; `CurvesOverFiniteFields` 4.6.

### 6.3 Ordinary, supersingular, almost ordinary; the supersingular structure theorem

`IsOrdinary A := pRank A = g`; `IsSupersingular A := ∀ s ∈ slopes A, s = 1/2` (pinned; knowl
`av.fq.supersingular`); `IsAlmostOrdinary A := pRank A + 1 = g`; `newtonElevation A` the
sibling's elevation of `P_A`, with `elevation = 0 ↔ IsOrdinary A`,
`elevation = 1 ↔ IsAlmostOrdinary A`, and the supersingular value `(g+1)²/4` (odd `g`) or `g(g+2)/4`
(even `g`)
(sibling 4.6). **Structure theorem:**
`IsSupersingular A ↔ ∃ r ≥ 1, ∃ E : AbelianVariety 𝔽_{q^r}, dim E = 1 ∧ IsSupersingular E ∧ IsIsogenous (A.baseChange 𝔽_{q^r}) (E^g)`
(Oort's characterization;
Waterhouse–Milne 1971 §2). `←`: slopes are base-change and isogeny invariants and `slopes (E^g)` is
`{1/2}^{2g}` for supersingular `E` (6.1, 6.2 for `g = 1`: `pRank E = 0` means no slope `0`, so both
slopes are `1/2`). `→`: all slopes `1/2` makes every `α_i / √q` a root of unity (sibling 4.7,
Kronecker), so for `r` the lcm of their orders `α_i^r = q^{r/2}` with `r` even,
`P_{A,r} = (T − q^{r/2})^{2g}`, and Part II F3.2 over `𝔽_{q^r}` gives `A_{𝔽_{q^r}} ~ E^g` with `E`
the class of `T − q^{r/2}` (3.3: `e = 2`, `g(E) = 1`, supersingular with trace `2 q^{r/2}`).
Corollaries:
`IsSupersingular A → pRank A = 0`; for `g ≤ 2` the converse (a slope `0` is absent and the symmetric
multiset of `≤ 4` slopes in `(0, 1)` with the integrality of the polygon's break points is all
`1/2`; sibling 4.6); `IsSupersingular A ↔ angleRank A = 0` (6.5); supersingularity is preserved by
isogeny, base change, products, duals, and inherited by abelian subvarieties and quotients
(sibling 4.6: slopes of factors). For `g = 1` the three predicates `IsSupersingular E` (this
layer), EllipticCurves' `E[p](K̄) = 0`, and `p ∣ frobeniusTrace` coincide (6.1, 1.6, Tau Ceti main
`isSupersingular_iff_dvd_frobeniusTrace`).
*Rests on:* 1.6, 3.3, 6.1, 6.2; Part II F3.2; `CurvesOverFiniteFields` 4.6, 4.7.

### 6.4 Invariance

The `p`-rank, slopes, elevation and the three predicates are invariants of the isogeny class (6.2),
of base change (`slopes (A_L) = slopes A` as multisets: the roots `α_i^r` have `q^r`-normalized
valuation equal to the `q`-normalized valuation of `α_i`; sibling 4.6 for `weilPower`), of the
twist class (5.6) and of the dual; `pRank (A × B) = pRank A + pRank B`;
`IsOrdinary (A × B) ↔ IsOrdinary A ∧ IsOrdinary B`; the `p`-rank of a Jacobian is the `p`-rank of
the curve's
function field in the sense of the sibling (`pRank p P_F`, 1.5). The LMFDB stores `p_rank`,
`p_rank_deficit`, `slopes`, `newton_elevation`, `is_ordinary`, `is_supersingular` per isogeny
class; each is well defined by this milestone.
*Rests on:* 1.5, 1.8, 5.6, 6.1, 6.2, 6.3; `CurvesOverFiniteFields` 4.6.

### 6.5 Angle rank and corank

`frobeniusAngles A := frobeniusAngles P_A` (`g` angles `θ_i ∈ [0, 1]` with `α_i = √q e^{iπθ_i}`),
`angleRank A := angleRank P_A` (sibling 4.7; pinned; knowl `av.fq.angle_rank`),
`angle_corank := g − angleRank A`. Milestones: `0 ≤ angleRank A ≤ g`;
`angleRank A = 0 ↔ IsSupersingular A` (sibling
4.7 with 6.3); `angleRank (A.baseChange L) = angleRank A`;
`angleRank (A × B) ≤ angleRank A + angleRank B`; `angleRank A` is the rank of the subgroup of
`ℂ^× / μ_∞` generated by
`α_1, …, α_{2g}` and `√q`, minus one (sibling 4.7's equivalent form), so `angleRank A = g` iff the
only multiplicative relations among `α_1, …, α_g, q` (one root per conjugate pair) are torsion; no
sufficient condition for `angleRank A = g` in terms of the Galois group of `P_A` is claimed. The LMFDB's `angle_rank` is
computed numerically (knowl `av.fq.frobenius_angles_correctness`); here it is the exact rational
dimension and the two agree whenever the LMFDB's certificate does.
*Rests on:* 6.3; `CurvesOverFiniteFields` 4.7.

## Layer 7: the group of points

`A(L)` for finite `L / K`, its structure, and the invariants the LMFDB records per isogeny class:
`abvar_counts`, `curve_counts`, `size` (7.1, 7.5), `is_cyclic`, `noncyclic_primes` (7.3), and the
obstruction to containing a Jacobian that the virtual curve counts give (7.4). Sources: Milne AV I
§7, II §1; the LMFDB knowls `av.fq.group_structure`, `av.fq.cyclic_group_points`,
`av.fq.noncyclic_primes`, `av.fq.curve_point_counts`, `av.fq.one_rational_point`.

### 7.1 The finite abelian group `A(L)`

For finite `L / K`: `A(L)` is a finite abelian group (1.2) of order
`#A(𝔽_{q^r}) = P_{A,r}(1) = virtualAbvarCount P_A r` (1.4), with invariant factors
`AddCommGroup.equiv_directSum_zmod_of_finite`
(Mathlib) and `abvar_counts := (r ↦ #A(𝔽_{q^r}))_{r ≥ 1}`, of which the LMFDB stores the first ten
terms (`1.4.ae`: `1, 9, 49, 225, 961, 3969, 16129, 65025, 261121, 1046529`). Milestones:
the bound `(√q^r − 1)^{2g} ≤ #A(𝔽_{q^r}) ≤ (√q^r + 1)^{2g}` (sibling 4.11; DWP.1 §1.5);
**`#A(K) = 1 → q ≤ 4`** (for `q ≥ 5`, `(√q − 1)^{2g} > 1`), the hypothesis of the knowl
`av.fq.one_rational_point`
with the examples `1.2.ac`, `1.4.ae` and `2.2.ad_f`; `A(K) ⊆ A(L)` with `#A(K) ∣ #A(L)` (1.2).
*Rests on:* 1.2, 1.4; `CurvesOverFiniteFields` 4.11; Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`.

### 7.2 The `ℓ`-primary parts through the Tate module

For a prime `ℓ ≠ p`: **`A(K)[ℓ^∞] ≃+ T_ℓ A ⧸ (T_ℓ π_A − 1)(T_ℓ A)`**. Proof: `A(K̄)[ℓ^∞] ≅ V_ℓ A / T_ℓ A`
(A4.1), `π_A − 1` is bijective on `V_ℓ A` (no root of `P_A` is `1`, since `|α_i| = √q > 1`, DWP.1
§1.4), and the snake lemma for `0 → T_ℓ → V_ℓ → V_ℓ/T_ℓ → 0` with the endomorphism `π_A − 1`
identifies `ker(π_A − 1 ∣ V_ℓ/T_ℓ) = A(K)[ℓ^∞]` (1.2) with `coker(π_A − 1 ∣ T_ℓ)`. For `ℓ = p`:
`A(K)[p^∞] ≃+ T_p(A[p^∞]^{ét}) ⧸ (π − 1)` with `T_p` of the étale part of rank `pRank A` (A4.5,
6.1), by the same argument on the étale quotient (`A(K̄)[p^∞] = A[p^∞]^{ét}(K̄)`). Consequences:
`A(K)` is generated by at most `2g` elements, its `ℓ`-part by at most `2g` and its `p`-part by at
most `pRank A`; `#A(K)[ℓ^∞] = ℓ^{v_ℓ(P_A(1))}` (the determinant of `π_A − 1` on `T_ℓ A` is
`P_A(1)` up to a unit, A6.11); the structure of `A(K)[ℓ^∞]` is the Smith normal form of
`T_ℓ π_A − 1` on the `ℤ_ℓ[π_A]`-module `T_ℓ A`, which depends on `A` and not only on its isogeny
class (two isogenous varieties have different `T_ℓ A ⊆ V_ℓ A` in general: `1.5.ac` below has
members with `ℤ/4` and with `(ℤ/2)²`).
*Rests on:* 1.2, 6.1; A4.1, A4.5, A6.11; DWP.1 §1.4.

### 7.3 Cyclic classes and non-cyclic primes

`IsCyclicClass A := ∀ B, IsIsogenous A B → ∃ n, Nonempty (B(K) ≃+ ZMod n)` (pinned: a class is cyclic when every member has
cyclic `A(K)`; knowl `av.fq.cyclic_group_points`);
`noncyclicPrimes A := {ℓ | ∃ B, IsIsogenous A B ∧ ¬ cyclic (B(K)[ℓ^∞])}` (knowl
`av.fq.noncyclic_primes`). Milestones: `noncyclicPrimes A ⊆ {ℓ | ℓ² ∣ P_A(1)}` (a cyclic-or-not
`ℓ`-group of order `ℓ^1` is cyclic), hence finite; `IsCyclicClass A ↔ noncyclicPrimes A = ∅`; by 7.2
the `ℓ`-part of `B(K)` is non-cyclic iff `T_ℓ π_B − 1` has at least
two non-unit elementary divisors on `T_ℓ B`, i.e. iff `(T_ℓ π_B − 1)(T_ℓ B) ⊆ ℓ T_ℓ B + …` — the
honest criterion: **`B(K)[ℓ^∞]` is cyclic iff `T_ℓ B / (π_B − 1) T_ℓ B` is cyclic iff
`dim_{𝔽_ℓ} T_ℓ B / ((π_B − 1) T_ℓ B + ℓ T_ℓ B) ≤ 1`**. For squarefree classes 9.5 computes the set
of all groups `B(K)` occurring and so both invariants; for `g = 1`, `E(K) ≅ ℤ/n × ℤ/nm` with `n ∣ q − 1` (two generators by 7.2, and `E[n] ⊆ E(K)`
forces `μ_n ⊆ K` by the Weil pairing, A4.1 `dualPairing`), and 9.6 says which members have `n > 1`. These two invariants are the only ones in this roadmap quantified
over all members of a class; they are predicates on the class (1.7's quotient).
*Rests on:* 1.7, 7.1, 7.2.

### 7.4 Virtual curve counts and the Jacobian obstruction

`curveCounts A r := virtualCurveCount q P_A r = q^r + 1 − ∑ α_i^r` (sibling 4.11), of which the
LMFDB stores the first ten. Milestones: if `A ~ Jac C` then `curveCounts A r = #C(𝔽_{q^r})` (1.5); hence if
some `curveCounts A r < 0`, or `curveCounts A r < curveCounts A s` for `s ∣ r` (points over `𝔽_{q^s}`
are points over `𝔽_{q^r}`), or the Jacobian-compatibility conditions of `CurvesOverFiniteFields`
3.10 fail for `P_A`, then **no member of the class is a Jacobian**:
`hasJacobian A := ∃ C, ∃ B, IsIsogenous A B ∧ B ≅ Jac C` is false, which is the LMFDB value
`has_jacobian = −1`. Example:
`2.2.a_ae` has `curveCounts = [3, −3, …]`. Also: `hasJacobian A → hasPrincipalPolarization A`
(10.2; the Jacobian's canonical principal polarization, JacobianChallenge Layer E).
*Rests on:* 1.5, 1.7; JacobianChallenge Layer E; `CurvesOverFiniteFields` 3.10, 4.11.

### 7.5 Points over extensions and the class number of a function field

For `A = Jac C`: `#A(𝔽_{q^r}) = h_{F_r}`, the class number of the degree-`r` constant-field extension
of the function field `F` of `C` (1.5; FunctionFieldArithmetic §5.3 and `CurvesOverFiniteFields`
2.7), and `A(K) ≅ Cl⁰(F)` (JacobianChallenge
Layer E: `Jac C (K) = Pic⁰(C)(K)`, with Tau Ceti's `Divisor.degreeOneEquivDegreeZeroClassGroup`
for the identification with the degree-zero divisor class group when `C` has a rational point).
A Jacobian class with `P_A(1) = 1` (a function field of class number one, knowl
`av.fq.class_number_1`) has `q ≤ 4` by 7.1; the finiteness of the list of such function fields is a
theorem about curves (`CurvesOverFiniteFields` 3.10–3.11), not claimed here.
*Rests on:* 1.5, 7.1; JacobianChallenge Layer E; FunctionFieldArithmetic §5.3;
`CurvesOverFiniteFields` 2.7.

## Layer 8: orders in étale algebras and the Frobenius order

The order-theoretic invariants of the LMFDB's isomorphism-class data: `ℤ[π, V]`, its overorders,
and the predicates `zfv_index`, `zfv_real_index`, `zfv_rel_disc_norm`, `zfv_is_maximal`,
`zfv_is_bass`, `is_gorenstein`, `max_cohen_macaulay_type`, `is_zconductor_sum`,
`is_zfvconductor_sum`, `is_conjugate_stable`, weak equivalence classes, Picard groups, singular
primes and singular dimensions. The carrier is an order in a finite étale `ℚ`-algebra, since
`ℚ[π]` is a product of fields when `P_A` is squarefree and reducible. Tau Ceti's orders library
(`NumberFieldOrder`, Picard groups, conductors, ideal class monoids) is the number-field case; this
layer generalizes exactly what the Frobenius order needs and states the comparison. Sources: the
LMFDB knowls `av.fq.order`, `av.fq.conductor`, `av.fq.index_of_order`, `av.fq.picard_group`,
`av.fq.weak_equivalence_class`, `av.fq.bass_zfv`, `av.fq.max_cohen_macaulay_type`,
`av.fq.singular_primes`, `av.fq.singular_dimensions`, `av.fq.is_zconductor_sum`,
`av.fq.is_zfvconductor_sum`, `av.fq.conjugate_stable`, `av.fq.zfv_real_index`,
`av.fq.zfv_rel_disc_norm`; Neukirch *Algebraic Number Theory* I §12 (orders, Picard group, the
conductor exact sequence); Reiner *Maximal Orders* (Jordan–Zassenhaus); Marseglia 2021 §§2–4 (weak
equivalence, the ideal class monoid); Bass's characterization of Bass orders as quoted in
Marseglia 2021 §4.

### 8.1 Orders in a finite étale `ℚ`-algebra

Let `E` be a commutative `ℚ`-algebra with `[Module.Finite ℚ E] [Algebra.Etale ℚ E]` (equivalently
`IsReduced E`, since `ℚ` is perfect; Mathlib `IsArtinianRing.equivPi` then gives `E ≅ ∏ F_i` with
`F_i` number fields). An **order** of `E` is a `Λ : Subalgebra ℤ E` with
`Submodule.IsLattice ℚ (Subalgebra.toSubmodule Λ)`, ClassicalArithmeticCompletion §7.4's
`IntegralOrder.IsOrder`.
Milestones: every element of an order is integral (`IsIntegral ℤ`); the **maximal order**
`𝓞_E := integralClosure ℤ E` contains every order and is an order: for an order `Λ` with a
`ℚ`-basis `e_i ∈ Λ`, every overorder of `Λ` lies in the one lattice `r⁻¹ ∑_i ℤ e_i`,
`r = det(Tr(e_i e_j)) ≠ 0` (ClassicalArithmeticCompletion §7.49 with base `ℤ`; the regular trace
pairing `Algebra.trace ℚ E` is nondegenerate because `E` is étale), and every `x ∈ 𝓞_E` lies in the
overorder `Λ[x]`, so `𝓞_E` is a finitely generated `ℤ`-module containing `Λ`; under `E ≅ ∏ F_i`,
`𝓞_E ≅ ∏ 𝓞_{F_i}`; `𝓞_E / Λ` is finite, `index Λ := Nat.card (𝓞_E ⧸ Λ)`; the **overorders** of `Λ`
are the orders containing `Λ`, finitely many (subgroups of the finite `𝓞_E / Λ`), forming a finite
lattice under inclusion with top `𝓞_E`; `Λ = 𝓞_E ↔ index Λ = 1`
(`IsMaximalOrder`, §7.21). **Comparison:** for `E = F` a number field,
`NumberFieldOrder F ≃ {Λ // IsOrder Λ}` (Tau Ceti's structure has exactly these fields), `𝓞_E = 𝓞 F`
(`maximalNumberFieldOrder`), and the index is Tau Ceti's `index`. The product of orders of the
`F_i` is an order of `E` but not every order is such a product (the Frobenius order of a reducible
squarefree `P_A` is not: for `P = (T² − T + 2)(T² + T + 2)` over `𝔽_2`, `E ≅ ℚ(√−7)²` and
`ℤ[T]/(P)` does not contain the idempotent `(1, 0)`, so it is not a product of orders of the factors).
*Rests on:* ClassicalArithmeticCompletion §§7.4, 7.21, 7.49; Mathlib `integralClosure`, `Algebra.Etale`,
`IsArtinianRing.equivPi`, `Submodule.IsLattice`; Tau Ceti `NumberFieldOrder`, `index`.

### 8.2 Fractional ideals, colon ideals, multiplier rings and conductors

A **fractional `Λ`-ideal** is a `Λ`-submodule `I ⊆ E` that is a `ℤ`-lattice of `E`
(`Submodule.IsLattice ℚ I`); `(I : J) := {x ∈ E | x J ⊆ I}` is a fractional ideal when `I, J` are
(finitely many generators of `J`); the **multiplier ring** `(I : I)` is an overorder of `Λ`
(Tau Ceti `multiplierRing` in the field case); `I` is **invertible** iff `I (Λ : I) = Λ`, iff `I`
is locally principal at every maximal ideal of `Λ`, iff `(I : I) = Λ` and `I (Λ : I) = Λ`; the
**conductor** `𝔣_Λ := (Λ : 𝓞_E)`, the largest `𝓞_E`-ideal in `Λ` (knowl `av.fq.conductor`;
Tau Ceti `conductor` in the field case), and the relative conductor `(Λ : Λ')` for an overorder
`Λ'`; `(index Λ : ℤ) ∈ 𝔣_Λ`, so `𝔣_Λ ≠ 0`; `Λ = 𝓞_E ↔ 𝔣_Λ = 𝓞_E`. **The Picard group** `Pic Λ` is
the quotient of the group of invertible fractional ideals under multiplication by the principal
ones `x Λ`, `x ∈ E^×` (knowl `av.fq.picard_group`); for a number field it is `ClassGroup Λ` (Tau
Ceti `Pic`, by `ClassGroup`'s construction as invertible fractional ideals modulo principal ones);
in general it is defined here as the quotient of the group of invertible fractional ideals by the
principal ones, since Mathlib's `ClassGroup` requires a domain. **Finiteness:** the exact sequence
`1 → Λ^× → 𝓞_E^× → (𝓞_E/𝔣)^× / (Λ/𝔣)^× → Pic Λ → Pic 𝓞_E → 1` (Neukirch I.12.9–12.11 for a number
field; the same
proof factor by factor for étale `E`, since an invertible ideal is locally principal and prime to
`𝔣` after scaling, Tau Ceti `integralIdealsAwayConductor` in the field case), with
`Pic 𝓞_E = ∏ Pic 𝓞_{F_i}` finite (Mathlib `ClassGroup` finiteness), gives `Pic Λ` finite and the
**index formula**
`#Pic Λ = #Pic 𝓞_E · #(𝓞_E/𝔣)^× / (#(Λ/𝔣)^× · [𝓞_E^× : Λ^×])`. Functoriality: an inclusion `Λ ⊆ Λ'`
induces `I ↦ I Λ'`, a homomorphism `Pic Λ → Pic Λ'`, surjective (Tau Ceti `mapPic` in the field
case).

Suggested.lean declares the fractional ideals, colon ideals, multiplier ring, conductor,
invertibility and the set `Pic Λ` of classes of invertible fractional ideals modulo `x Λ` for
`x ∈ E^×`; the following are specified here only. The **group law** on `Pic Λ` is
`[I] · [J] := [I J]`, with identity `[Λ]` and inverse `[I]⁻¹ = [(Λ : I)]`; it is well defined
because a product of invertible fractional ideals is again one and `(x I)(y J) = (x y) I J`. The
**comparison**: for a number field `F` and an order `O`, this group is isomorphic as a group to
Tau Ceti's `Pic O`, by sending a class to the class of the same fractional ideal.
*Rests on:* 8.1; Tau Ceti `multiplierRing`, `conductor`, `Pic`, `mapPic`,
`integralIdealsAwayConductor`; Mathlib `ClassGroup`, `FractionalIdeal`.

**Checks.**

- (computation) For `ℤ[2i]`, the Frobenius order of `1.5.ac`: the conductor is `2ℤ[i]`, of index
  `4` in `ℤ[i]`, and `#Pic ℤ[2i] = 1` by the index formula `1 · 2 / (1 · 2)`.
- (computation) For the Frobenius order of `2.3.b_ac`: the conductor has index `4` in `𝓞_F`, and
  `#Pic = 1` by the index formula `1 · 3 / (1 · 3)`.
- (comparison) For `ℤ[i]`, the maximal order of `1.2.ac`, `Pic` is trivial, matching
  `ClassGroup (𝓞 ℚ(i))` and the class number `1`.
- (reject) `ℤ[i]` is a fractional `ℤ[2i]`-ideal but not an invertible one:
  `(ℤ[2i] : ℤ[i]) = 2ℤ[i]` and `ℤ[i] · 2ℤ[i] = 2ℤ[i] ≠ ℤ[2i]`, so it has no class in
  `Pic ℤ[2i]`; it is the second element of `ICM(ℤ[2i])` (8.6, 9.6).

### 8.3 The Frobenius order `ℤ[π, V]` and its numerical invariants

For `A` with `Squarefree P_A`: `E_A := ℚ[T] ⧸ (P_A)`, a finite étale `ℚ`-algebra of dimension `2g`
with `E_A ≃ Center (End⁰ A) = End⁰ A` carrying the class `π` of `T` to `π_A` (3.4, 1.7: the
isomorphism is canonical and depends only on the isogeny class); `V := q · π⁻¹ ∈ E_A` (`π` is a
unit of `E_A` since `P_A(0) = q^g ≠ 0`); the **CM involution** `x ↦ x̄` of `E_A` is the unique
`ℚ`-algebra involution with `π̄ = V` (it is complex conjugation on each CM factor and the identity
on the real factors `ℚ`, `ℚ(√p)` of 3.3; knowl `av.fq.conjugate_stable`).
**`frobeniusOrder A := Algebra.adjoin ℤ {π, V}`**, an order of `E_A` (8.1: `π` and `V` are integral,
`V = π̄`), the LMFDB
`ℤ[F, V]`; the **real suborder** `ℤ[π + V] ⊆ E_A^+ := ℚ[π + V]`, with `E_A^+ ≃ ℚ[T]/(h_{P_A})` for the
real Weil polynomial (sibling 4.4) and `[E_A : E_A^+] = 2` when `P_A` has no real root. Invariants
(pinned): `zfv_index := index (frobeniusOrder A)`; `zfv_is_maximal := frobeniusOrder A = 𝓞_{E_A}`;
`zfv_real_index := index (ℤ[π + V])` in `𝓞_{E_A^+}`; `zfv_rel_disc_norm := |Algebra.norm ℚ (π − V)|`,
an integer, with the **identity `|N_{E/ℚ}(π − V)| = |disc ℤ[π, V]| / disc(ℤ[π + V])²`** (knowl
`av.fq.zfv_rel_disc_norm`; proof: `ℤ[π, V]` is free over `ℤ[π + V]` on `1, π`, and the relative
discriminant of that basis is `(π − V)²`), and `disc ℤ[π, V] = zfv_index² · disc 𝓞_{E_A}` (Tau Ceti
`discr_eq_index_sq_mul` in the field case, the same proof in general). **Containment:** for every
`B` in the isogeny class, `frobeniusOrder A ⊆ End B ⊆ 𝓞_{E_A}` under `E_A ≃ End⁰ B`
(`π_B, V_B ∈ End B` by 1.1; `End B` is an order of `End⁰ B` by A6.7 and integrality), so **every
endomorphism
ring in the class is an overorder of `ℤ[π, V]`**. `ℤ[π, V]` is conjugate stable; `ℤ[π] ⊆ ℤ[π, V]`
with equality iff `V ∈ ℤ[π]`, i.e. iff `q ∈ π ℤ[π]` (`V = q/π`), which holds for `g = 1` (`V = a − π`) and fails for
`2.2.ad_f` (`[ℤ[π, V] : ℤ[π]] = 2`). Comparison with the elliptic order of Tau Ceti main's
`OrdinaryEnd` and with *Complex multiplication and explicit reciprocity* 5.2 for `g = 1`.
*Rests on:* 1.1, 1.7, 3.3, 3.4, 8.1, 8.2; A6.7; `CurvesOverFiniteFields` 4.4; Tau Ceti
`discr_eq_index_sq_mul`.

### 8.4 Gorenstein and Bass orders

The **trace dual** `Λ^∨ := {x ∈ E | Algebra.trace ℚ E (x Λ) ⊆ ℤ}`, a fractional `Λ`-ideal with
`(Λ^∨ : Λ^∨) = Λ` (Tau Ceti main `traceDual` in the field
case). **`IsGorenstein Λ := Λ^∨` is invertible** (Tau Ceti main `NumberFieldOrder.IsGorenstein` in
the field case, consumed by comparison), equivalent to: every fractional ideal `I` with
`(I : I) = Λ` is invertible (Marseglia 2021 §4, quoting Bass); `𝓞_E` is Gorenstein; an order in
a quadratic field is Gorenstein (Tau Ceti main `Quadratic/Basic`: proper ideals are invertible);
Gorenstein is local (`Λ` Gorenstein iff `Λ_𝔪` Gorenstein for every maximal ideal `𝔪`, iff
`dim_{Λ/𝔪} Λ^∨/𝔪Λ^∨ = 1` for all `𝔪`, 8.5). **`IsBass Λ := ∀ Λ' overorder of Λ, IsGorenstein Λ'`**
(knowl `av.fq.bass_zfv`); equivalent to: every fractional `Λ`-ideal is invertible over its
multiplier ring, and to `max_cohen_macaulay_type Λ = 1` (8.5); `𝓞_E` and quadratic orders are
Bass; `ℤ[π, V]` for `g = 1` is Bass; the LMFDB `zfv_is_bass := IsBass (frobeniusOrder A)`. **The
Frobenius order over a prime field is Gorenstein:** for `K = 𝔽_p`, `IsGorenstein (frobeniusOrder A)`
(Centeleghe–Stix 2015 §4; `ℤ[π, p/π] = ℤ[T, T'] / (T T' − p, h(T, T'))` is the quotient of the
two-dimensional Gorenstein ring `ℤ[T, T']/(TT' − p)` by one equation `h`, the symmetrization of
`P_A`, hence Gorenstein).
*Rests on:* 8.1, 8.2; Tau Ceti main `Gorenstein.lean`, `Quadratic/Basic.lean`; Marseglia 2021 §4;
Centeleghe–Stix 2015 §4.

### 8.5 Cohen–Macaulay type

For a maximal ideal `𝔪` of `Λ`: `cmType Λ 𝔪 := Module.finrank (Λ ⧸ 𝔪) (Λ^∨ ⧸ 𝔪 Λ^∨)`, the number of
generators of the canonical module `Λ^∨_𝔪` of the one-dimensional Cohen–Macaulay local ring `Λ_𝔪`
(every order is reduced of Krull dimension one, hence Cohen–Macaulay; Tau Ceti
`RingTheory/CohenMacaulay` on main for the general notion, cited in prose; here the type is defined
directly through `Λ^∨` and no CM theory is needed); `cmType Λ := sup_𝔪 cmType Λ 𝔪` (a finite
supremum: `cmType Λ 𝔪 = 1` unless `𝔪 ∣ 𝔣_Λ`, 8.6). Milestones: `cmType Λ 𝔪 = 1 ↔ Λ_𝔪 Gorenstein`
(the canonical module is principal iff the ring is Gorenstein), so `IsGorenstein Λ ↔ cmType Λ = 1`;

**`maxCohenMacaulayType A := sup` over the overorders `S` of `ℤ[π, V]` of `cmType S`**, the LMFDB
`max_cohen_macaulay_type`, finite (finitely many overorders, 8.1), and
`IsBass (frobeniusOrder A) ↔ maxCohenMacaulayType A = 1`.
*Rests on:* 8.1, 8.4.

### 8.6 Weak equivalence and the ideal class monoid

Fractional `Λ`-ideals `I`, `J` are **weakly equivalent** when `I_𝔪 ≅ J_𝔪` as `Λ_𝔪`-modules for every
maximal ideal `𝔪` (pinned; knowl `av.fq.weak_equivalence_class`); they are **isomorphic** when
`I = x J` for some `x ∈ E^×` (then `I ≅ J` as `Λ`-modules, and conversely a `Λ`-linear isomorphism
`I → J` extends `E`-linearly to multiplication by a unit). Milestones:
**`WeakEquiv I J ↔ 1 ∈ (I : J) (J : I)`** (Dade–Taussky–Zassenhaus; Marseglia 2021 §2, as the
computable criterion), and
`WeakEquiv I J → (I : I) = (J : J)`; weak equivalence is an equivalence relation coarser than
isomorphism; the **ideal class monoid** `ICM Λ` is the set of fractional ideals modulo isomorphism
with multiplication (Tau Ceti `IdealClassMonoid` in the field case, with `multiplierRing` and
`IsProper`), and `W Λ := ICM Λ / WeakEquiv`; the fibre of `ICM Λ → W Λ` over the class of `I` is a
torsor under `Pic ((I : I))` (`I ↦ I J` for invertible `(I:I)`-ideals `J`; Marseglia 2021 §3), so
**`#ICM Λ = ∑_{S overorder} #W_S(Λ) · #Pic S`** with `W_S(Λ)` the weak classes with multiplier ring
`S`, and `#W_S(Λ) = 1` when `S` is Gorenstein (8.4: the unique class is that of `S` itself), which
is the LMFDB's `[index]^{#weak · #Pic}_i` notation (knowl `av.fq.endomorphism_ring_notation`).
**Singular primes** of `Λ`: the maximal ideals `𝔪 ∣ 𝔣_Λ` (knowl `av.fq.singular_primes`), exactly
those at which `Λ_𝔪` is not a discrete valuation ring (`Λ_𝔪 = (𝓞_E)_𝔪` iff `𝔪 ∤ 𝔣_Λ`); the
**singular support** of an overorder `S` is the set of singular primes of `ℤ[π, V]` containing
`(ℤ[π, V] : S)`; the **singular dimensions** of `I` with `(I : I) = Λ` are the numbers
`dim_{Λ/𝔪} (I ⧸ 𝔪 I)` at the singular primes, with `= 1 ↔ I_𝔪` principal (knowl
`av.fq.singular_dimensions`), so `I` is invertible iff all singular dimensions are `1`; weakly
equivalent ideals have the same singular dimensions. **Finiteness (Jordan–Zassenhaus):** `ICM Λ`
is finite (Reiner *Maximal Orders* §26: finitely many isomorphism classes of `Λ`-lattices in a
fixed finite-dimensional `E`-module), equivalently `W Λ` is finite and each `Pic S` is (8.2).
*Rests on:* 8.1, 8.2, 8.4; Tau Ceti `IdealClassMonoid`; Marseglia 2021 §§2–3; Reiner §26.

### 8.7 Conductor-sum predicates, conjugate stability, and the overorder lattice of `ℤ[π, V]`

For an overorder `S` of `R := frobeniusOrder A`: `is_zconductor_sum S := S = ℤ + 𝔣_S` (as
`ℤ`-submodules of `E_A`; knowl `av.fq.is_zconductor_sum`), `is_zfvconductor_sum S := S = R + 𝔣_S`
(knowl `av.fq.is_zfvconductor_sum`), `is_conjugate_stable S := S̄ = S` for the CM involution of 8.3
(knowl `av.fq.conjugate_stable`). Milestones: `ℤ + 𝔣_S` and `R + 𝔣_S` are orders contained in `S`,
so both predicates are decidable equalities of lattices; `R` and `𝓞_{E_A}` are conjugate stable,
and `S ↦ S̄` is an involution of the overorder lattice preserving index, Gorenstein, Bass and type;
`ℤ + 𝔣_S ⊆ R + 𝔣_S ⊆ S`, so `is_zconductor_sum S → is_zfvconductor_sum S`. The overorders of
`R` form a finite lattice (8.1),
the LMFDB's endomorphism-ring graph; its elements are the endomorphism rings occurring in the
class (9.4), and its indices in `𝓞_{E_A}` are the `[index]` labels; the counter `i` among orders
of equal index is not a target.
*Rests on:* 8.1, 8.2, 8.3.

## Layer 9: Deligne modules, Centeleghe–Stix, and the isomorphism classes in an isogeny class

The lattice description of abelian varieties in an isogeny class: Deligne's equivalence for ordinary
varieties, the Centeleghe–Stix anti-equivalence over a prime field, and the resulting
identification of the isomorphism classes of a squarefree class with the ideal class monoid of
`ℤ[π, V]`, which is what the LMFDB's isomorphism-class pages, `size`, `is_cyclic` and
`noncyclic_primes` rest on. Sources: Deligne 1969; Centeleghe–Stix 2015; Marseglia 2021 §§2–4
(the ideal dictionary and its polarized refinement); Waterhouse 1969 Chapter 4 (elliptic curves)
and Chapter 7 (ordinary classes); Howe 1995 §4 for duals.

### 9.1 The category of Deligne modules

`DeligneModule q` (pinned): a finite free `ℤ`-module `M` with `F : M →ₗ[ℤ] M` such that `F ⊗ ℚ` is
semisimple (`LinearMap.IsSemisimple`), every root of `charpoly F` is a `q`-Weil number
(`IsWeilPolynomial q (charpoly F)` of the sibling), and `q • M ⊆ F(M)` (so `V := q F⁻¹` restricts to
an endomorphism of `M` with `FV = VF = q`). Morphisms are `ℤ`-linear maps commuting with `F`; the
category is additive with finite products; `rank M` is even and `charpoly F` is symmetric (the
complex conjugate of a root `α` is `q/α` and `charpoly F ∈ ℤ[T]`, sibling 4.4), so
`dim M := rank M / 2`. Milestones: `Hom(M, N)` is a free `ℤ`-module of rank `#{(i, j) | α_i = β_j}`
(the
`ℚ`-intertwiners of two semisimple operators, intersected with the `ℤ`-linear maps); an **isogeny** is an
injective morphism with finite cokernel, of **degree** the index;
`IsOrdinary M := pRank p (charpoly F) = dim M` (half the roots are `p`-adic units; pinned); the
**dual** `M^∨ := Hom_ℤ(M, ℤ)`
with `F^∨ := Vᵗ` is a Deligne module with the same characteristic polynomial (Howe 1995 §4), and
`M^{∨∨} ≅ M`. **The ideal dictionary (squarefree case):** for `P` a squarefree symmetric Weil
`q`-polynomial, `E := ℚ[T]/(P)`, `R := ℤ[π, V] ⊆ E` (8.3 with `P` in place of `P_A`): every Deligne
module with `charpoly F = P` is isomorphic to a fractional `R`-ideal `I ⊆ E` with `F = (π · )`
(`M ⊗ ℚ` is a faithful semisimple `ℚ[F]`-module of dimension `deg P`, hence `≅ E`), two ideals give
isomorphic modules iff they are isomorphic as `R`-modules (`I = xJ`), `Hom(I, J) = (J : I)`,
`End(I) = (I : I)`, and so **isomorphism classes of Deligne modules with polynomial `P` ↔ `ICM R`**
(8.6; Marseglia 2021 §2). For non-squarefree `P` the modules are `R`-lattices in `E^n`-type
modules and the dictionary is not used by any LMFDB datum.

Suggested.lean declares the category's objects, morphisms, isogenies, the `ℤ`-module of morphisms
and the polynomial; the following are specified here only. The **Verschiebung** of `(M, F)` for
`q ≥ 1` is the unique `ℤ`-linear `V : M → M` with `F ∘ V = q · id`: it exists and is unique
because `q M ⊆ F(M)` and `F` is injective (its determinant is `± q^{dim M} ≠ 0`, all roots having
absolute value `√q`), and then also `V ∘ F = q · id`. The
**dual** of `(M, F)` is `(M^∨, F^∨)` with `M^∨` the `ℤ`-linear dual of `M` and `F^∨` the transpose
of `V`; it satisfies the three conditions, with `V^∨` the transpose of `F`. The **ideal module**
of a fractional `R`-ideal `I ⊆ E`, for `R = ℤ[π, V]` of a squarefree Weil `q`-polynomial `P` as
above, is `(I, x ↦ π x)`, a Deligne module with polynomial `P`, and the dictionary is the
statement that `I ↦ (I, π ·)` induces a bijection from `ICM R` to the isomorphism classes of
Deligne modules with polynomial `P`.
*Rests on:* 8.3, 8.6; Mathlib `LinearMap.IsSemisimple`, `LinearMap.charpoly`;
`CurvesOverFiniteFields` 4.1, 4.4, 4.6.

**Checks.**

- (Verschiebung) For `1.5.ac` (`q = 5`, `P = T² − 2T + 5`), the ideal module `ℤ[2i]` has
  `F = ·(1 + 2i)` and `V = ·(1 − 2i) = 2 − F`, and `FV = VF = 5`.
- (dual) For `1.2.ac` (`P = T² − 2T + 2`), the ideal module `ℤ[i]` has `F = ·(1 + i)`,
  `V = ·(1 − i)`, and its dual has polynomial `T² − 2T + 2` again.
- (dictionary) For `1.5.ac`, `ICM(ℤ[2i])` has two classes, `ℤ[2i]` and `ℤ[i]`, so there are
  exactly two Deligne modules with polynomial `T² − 2T + 5` up to isomorphism, with
  `M/(F − 1)M ≅ ℤ/4` and `(ℤ/2)²` (9.5); for `1.2.ac` there is exactly one.
- (boundary) For `q = 2`, `(ℤ[√2], ·√2)` is a Deligne module (roots `±√2`, `2 ∈ √2 · ℤ[√2]`)
  although `T² − 2` is not the polynomial of an abelian variety over `𝔽₂` (9.3 excludes `√p`).
- (reject) For `q = 2`, `(ℤ, F = 2)` is not a Deligne module: its root `2` does not have absolute
  value `√2`.

### 9.2 Deligne's equivalence for ordinary abelian varieties

Fix a ring homomorphism `ε : W(K̄) → ℂ` from the Witt vectors of `K̄ = AlgebraicClosure K` (a domain
of characteristic zero and cardinality at most that of `ℂ`, so one exists). For an ordinary `A / K` let `Ã` be its
Serre–Tate canonical lift to `W(K̄)` (*Abelian schemes and arithmetic moduli* A4.9–A4.10: the unique lift
to which every endomorphism of `A_{K̄}` lifts, equivalently with `Ã[p^∞]` the product of its
étale and multiplicative parts), and `T(A) := H_1((Ã ×_ε ℂ)(ℂ), ℤ)` (A5.1 lattice uniformization:
`Ã_ℂ = ℂ^g / T(A)`), `F := H_1(π̃_A)` for the lift `π̃_A` of `π_A`. **Theorem (Deligne 1969).**
`A ↦ (T(A), F)` is an equivalence from the category of ordinary abelian varieties over `K` (with
`K`-homomorphisms) to the full subcategory of ordinary Deligne modules in `DeligneModule q`;
`rank T(A) = 2g`, `charpoly F = P_A` (so the eigenvalues are the `α_i`), `T(A × B) = T(A) × T(B)`,
isogenies correspond to isogenies of the same degree (`deg f = [T(B) : f T(A)]`), `T(A^∨) ≅ T(A)^∨`
(Howe 1995 §4), and `T(A_L)` for `L = 𝔽_{q^r}` is `(T(A), F^r)`. The **`p`-adic CM type** attached
to `ε` is `Φ_ε := {φ : E_A → ℂ | ε⁻¹ ∘ φ (π) is a p-adic unit}`, one embedding from each conjugate
pair (half the roots of `P_A` are units, 6.3), the datum the polarization convention (10.1)
depends on; a different `ε` changes `T` by a `p`-adic CM-type twist and the equivalence class of
the functor by an automorphism of the target, so every statement below is independent of `ε`.
Consequence for `End`: `End A ≅ End(T(A), F)`, an order of `End⁰ A ≅ End_ℚ(T(A) ⊗ ℚ, F)`
containing `ℤ[π_A, V_A]` (8.3).
*Rests on:* 6.3, 8.3, 9.1; *Abelian schemes and arithmetic moduli* A4.9, A4.10, A5.1; Deligne 1969.

### 9.3 Centeleghe–Stix over a prime field

Let `K = 𝔽_p`. **Theorem (Centeleghe–Stix 2015).** Let `w` be a finite `Gal(ℚ̄/ℚ)`-stable set of
`p`-Weil numbers with `√p ∉ w` (so `T² − p` divides no `P_A` with roots in `w`), `AV_w` the full
subcategory of abelian varieties over `𝔽_p` with all roots of `P_A` in `w`, and
`R_w := ℤ[π, V] ⊆ E_w := ℚ[T]/(∏_{m ∈ w/∼} m)`. There is an abelian variety `A_w ∈ AV_w` with
`End A_w = R_w` (its
existence uses that `R_w` is Gorenstein, 8.4), and `A ↦ T_w(A) := Hom_{𝔽_p}(A, A_w)` with
`F := (− ∘ π_{A_w}) = (π_A ∘ −)` is an **anti-equivalence** from `AV_w` to the category of
`R_w`-modules
that are finite free over `ℤ` — i.e. Deligne modules in the pinned sense with roots in `w`, `F`
acting with `charpoly F = P_A` — with `rank T_w(A) = 2 dim A`, isogenies ↔ finite-index inclusions
(`deg f = [T_w(A) : f^* T_w(B)]`), and `A ↦ T_w(A)^∨ := Hom_ℤ(T_w(A), ℤ)` with `F^∨ = Vᵗ` (9.1) the covariant version, a Deligne
module with the same polynomial. The classification of the isomorphism classes in an isogeny class
over `𝔽_p` is Part II F3.10 (`End⁰(A₀)^×`-orbits of finite-support lattice tuples, with F3.8 for the
endomorphism orders of a non-real simple class), consumed; 9.4 reads it as `ICM (ℤ[π, V])` for
squarefree `P_A`, and `T_w` realizes the same bijection. For ordinary `A` over `𝔽_p` both 9.2 and 9.3
apply; the functors differ by duality and a CM-type twist (Centeleghe–Stix 2015 §7). The excluded Weil
number `√p` is a root of `T² − p`, whose simple class is the supersingular surface `(T² − p)²` of
3.3 (`q = p` is not a square); for every other `P` over `𝔽_p` the theorem applies.
*Rests on:* 3.3, 8.3, 8.4, 9.1; Part II F3.8, F3.10; Centeleghe–Stix 2015 Theorem 1 and §§4–7.

### 9.4 Isomorphism classes in a squarefree isogeny class

For `A` with `Squarefree P_A` and (`IsOrdinary A` or `q = p`): **the isomorphism classes of abelian
varieties over `K` isogenous to `A` are in bijection with `ICM (frobeniusOrder A)`**: for ordinary
`A` by 9.2 with 9.1's ideal dictionary (the class of `B` maps to the class of the ideal `T(B)`);
for `q = p` by Part II F3.10, since for squarefree `P_A` a finite-support tuple of `π`- and
`V`-stable lattices is the family of completions of a unique fractional `R`-ideal, so the
`E_A^×`-orbits of tuples are `ICM R` (9.3's `T_w(B)` gives the same bijection). Consequences:
`isogenyClassSize A := Nat.card (ICM R) = ∑_{S overorder of R} #W_S(R) · #Pic S` (8.6), finite
(8.6), the LMFDB `size`; **every overorder `S` of `R` is `End B`
for some `B` in the class** (`S` is a fractional ideal with `(S : S) = S`; for `q = p` and simple
non-real `A` this is Part II F3.8), and the number of
isomorphism classes with `End B ≅ S` is `#W_S(R) · #Pic S`, which is `#Pic S` when `S` is
Gorenstein (8.4, 8.6), so the LMFDB's endomorphism-ring graph with labels `[index]^{#weak·#Pic}_i`
(knowl `av.fq.endomorphism_ring_notation`) is exactly the overorder lattice of 8.7 with these
counts; `B` and `B'` in the class have `B ≅ B'` iff `T(B) = x T(B')` for some `x ∈ E_A^×`; the
`ℤ[π, V]`-ideal `T(B)` is determined by `B` up to isomorphism, and the LMFDB's isomorphism-class
label records the index of `End B`, the weak class and the Picard element (the three indices are
not targets). For a non-squarefree class or a non-ordinary class with `q ≠ p`,
the finiteness of the set of isomorphism classes is consumed from *Arithmetic statistics, part I*
(target `support-abelian-counts`: integral class-set finiteness within an isogeny class), and no
enumeration is specified here.
*Rests on:* 8.3, 8.4, 8.6, 8.7, 9.1, 9.2, 9.3; Part II F3.8, F3.10.

### 9.5 The group of points from the module

For `A` as in 9.4 with Deligne module `(T, F)`: **`A(K) ≃+ T ⧸ (F − 1) T`** (Deligne's equivalence
identifies `A(K) = ker(π_A − 1 ∣ A(K̄))` with the kernel of `F − 1` on `T ⊗ ℚ/ℤ`, which is
`T/(F − 1)T` by the snake lemma, exactly as in 7.2 but integrally; for 9.3 the same group arises as
the
dual of `T_w(A)/(F − 1)T_w(A)`, isomorphic to it as a finite abelian group), and more generally
`A(𝔽_{q^r}) ≃+ T / (F^r − 1) T`. Hence in the ideal dictionary `B(K) ≃+ I / (π − 1) I` for the ideal
`I` of `B`, of order `|N_{E_A/ℚ}(π − 1)| = P_A(1)` (7.1 again), and **the set of groups occurring in
the isogeny class is `{I / (π − 1) I | [I] ∈ ICM R}`**, finite; `IsCyclicClass A` and
`noncyclicPrimes A` (7.3) are computed from it, and `B(K)` depends only on `T(B)` as an abstract
`R`-module (so on the weak equivalence class and the Picard element only through the module).
Examples: `1.5.ac` has `ℤ[i]/(2i) ≅ (ℤ/2)²` and `ℤ[2i]/(2i)ℤ[2i] ≅ ℤ/4`; `2.3.b_ac` has `ℤ/12` and
`ℤ/2 × ℤ/6` (worked examples).
*Rests on:* 7.1, 7.2, 7.3, 9.2, 9.3, 9.4.

### 9.6 Elliptic curves: Waterhouse's description

For `g = 1` and an isogeny class with `P = T² − aT + q`, the isomorphism classes are the
`End⁰(E)^×`-orbits of finite-support lattice tuples of Part II F3.9 (F3.10 for `q = p`), and
Waterhouse's description reads that classification in three cases: (1) **ordinary** (`p ∤ a`): `F = ℚ(π)`
imaginary quadratic, `R = ℤ[π]` (8.3: `V = a − π`), every order `ℤ[π] ⊆ O ⊆ 𝓞_F` is `End E` for some
`E` in the class, and the curves with `End E ≅ O` form a principal homogeneous space under `Pic O`
(Waterhouse 1969 Theorems 4.2(2) and 4.5), so the class has `∑_{O ⊇ ℤ[π]} #Pic O` isomorphism
classes — this is 9.4 (quadratic orders are Gorenstein, so `#W_O = 1`), and the comparison with
Tau Ceti main's `OrdinaryEnd` and *Complex multiplication and explicit reciprocity* 5.2's "ordinary
order levels" is a theorem; (2) **supersingular with `π ∉ ℚ`** (`F` imaginary quadratic, `e = 1`):
`End E` is an order containing `ℤ[π]` and maximal at `p` (Waterhouse Theorem 4.2(3)), and the
curves with `End E ≅ O` again form a `Pic O`-homogeneous space (Theorem 4.5); (3) **supersingular
with `π ∈ ℚ`** (`q` a square, `a = ±2√q`, 3.3): `End E` is a maximal order of the quaternion
algebra `D` ramified at `p` and `∞`, every maximal order occurs, and the number of isomorphism
classes in the class is the class number of `D` (Waterhouse Theorem 4.2(1), 4.5; the class number
of `D` is `QuaternionArithmetic`'s and *Complex multiplication and explicit reciprocity* 5.2's
"supersingular level pairs"). Group structures: `E(K) ≅ ℤ/n × ℤ/nm` with the possible `(n, m)` for
each `O` read off `O/(π − 1)O` (9.5), and the class is cyclic iff `O/(π − 1)O` is cyclic for every order `O` that occurs (9.5, 7.3); for
a quadratic order `O`, `O/(π − 1)O ≅ ℤ/n × ℤ/nm` with `n` the largest integer with `(π − 1)/n ∈ O`,
so the member with `End E = O` is non-cyclic at `ℓ` iff `ℓ ∣ (π − 1)` in `O`. Cases (2)–(3) are
stated against Tau Ceti's `WeierstrassCurve.IsSupersingular`.
*Rests on:* 3.3, 7.3, 8.3, 9.4, 9.5; Part II F3.9, F3.10; Waterhouse 1969 Theorems 4.2, 4.5;
EllipticCurves Layer 3.

## Layer 10: polarizations, principal polarizability, and Jacobians

Polarizations in the module dictionary, the predicate `has_principal_polarization`, the structure
of principally polarized abelian surfaces, Howe–Nart–Ritzenthaler, and the Jacobian counts.
Sources: Howe 1995 §4 (polarizations of Deligne modules); Marseglia 2021 §4 (the ideal form);
Howe–Nart–Ritzenthaler 2009 (Jacobians among abelian surfaces); Weil 1957 (principally polarized
surfaces); the LMFDB knowls `av.princ_polarizable`, `av.fq.jacobian`,
`av.fq.all_polarizations_product`.

### 10.1 Polarizations of Deligne modules and of ideals

With the pinned convention (Howe): a **polarization** of an ordinary Deligne module `(M, F)` with
respect to `Φ := Φ_ε` (9.2) is a nondegenerate alternating `ℤ`-bilinear form `b : M × M → ℤ` with
`b(Fx, y) = b(x, Vy)` such that `b(ι x, x) > 0` for all nonzero `x ∈ M ⊗ ℝ` and every (equivalently, one) totally
imaginary `Φ`-positive `ι ∈ E ⊗ ℝ`, where `E := ℚ[F] ⊆ End_ℚ(M ⊗ ℚ)` is the étale algebra generated
by `F`, `ῑ = −ι` for its CM involution, and `Φ`-positive means `Im φ(ι) > 0` for every `φ ∈ Φ`. When
`M ⊗ ℚ ≅ E` (squarefree case) every such `b` is `b(x, y) = Tr_{E/ℚ}(λ x ȳ)` for a unique `λ ∈ E` with
`λ̄ = −λ`, and the condition is **`Im φ(λ) > 0` for all `φ ∈ Φ`** ("`λ` is `Φ`-positive"). **Theorem (Deligne's equivalence with polarizations;
Howe 1995 §4):** under 9.2, polarizations `λ : A → A^∨` of an ordinary `A` correspond to
polarizations of `T(A)` in this sense, with `deg λ = [T(A)^∨ : b(T(A))]` (`b` viewed as
`T(A) → T(A)^∨`), principal iff `b` is unimodular. **The ideal form (squarefree `P_A`):** for
`B ↔ I`,
`B^∨ ↔ Ī^t` with `I^t := {x ∈ E | Tr_{E/ℚ}(x I) ⊆ ℤ}` the trace dual (8.4's `Λ^∨` for `I` in place of
`Λ`) and the bar the CM involution; a polarization of `B` is an element `λ ∈ E^×` with `λ̄ = −λ`,
`Φ`-positive, and `λ I ⊆ Ī^t`; its degree is `[Ī^t : λ I]`; it is **principal iff `λ I = Ī^t`**;
`(I, λ) ≅ (I', λ')` iff `I' = u I` and `λ' = λ / (u ū)` for some `u ∈ E^×`; the automorphism group
of `(I, λ)` is the group of torsion units `u` of `(I : I)` with `u ū = 1`, finite (Marseglia 2021
§4). For `q = p` the same statements hold for the covariant module of 9.3 (Centeleghe–Stix 2015
§7, with the positivity convention transported), so every statement below for "`A` ordinary or
`q = p`, `P_A` squarefree" is proved once in the ideal form. The number of polarizations of a
given degree on a fixed `B`, up to isomorphism, is finite: the `Φ`-positive totally imaginary `λ`
with `λ I ⊆ Ī^t` of fixed index lie in finitely many orbits of `{u ū | u ∈ (I : I)^×}`
(Dirichlet's unit theorem for `(I : I)` and its real suborder).
*Rests on:* 8.3, 8.4, 9.1, 9.2, 9.3; Howe 1995 §4; Marseglia 2021 §4; Centeleghe–Stix 2015 §7.

### 10.2 Principal polarizability of a class

`hasPrincipalPolarization A := ∃ B, IsIsogenous A B ∧ ∃ λ : B ⟶ B^∨, IsPolarization λ ∧ IsIso λ`
(pinned; polarizations and duals from JacobianChallenge Layer E and A2.5; knowl
`av.princ_polarizable`), the LMFDB `has_principal_polarization = 1`, with `= −1` its negation.
Milestones: it is a predicate on the isogeny class (1.7);
`hasJacobian A → hasPrincipalPolarization A` (7.4); products:
`hasPrincipalPolarization A ∧ hasPrincipalPolarization B → hasPrincipalPolarization (A × B)`
(product polarization); the Weil restriction of a principally
polarized `(B, λ)` over `L` is principally polarized (`Res_{L/K} λ : Res B → Res (B^∨) ≅ (Res B)^∨`,
A6.30–A6.33 with the compatibility of Weil restriction and duals, a milestone here); for squarefree
`P_A` with `A` ordinary or `q = p`,
**`hasPrincipalPolarization A ↔ ∃ [I] ∈ ICM R, ∃ λ ∈ E_A^×, λ̄ = −λ ∧ Φ-positive ∧ λ I = Ī^t`**
(10.1, 9.4), a decidable condition on the finite set `ICM R` (8.6) up
to the unit-orbit finiteness of 10.1; the number of principal polarizations on each `B` up to
isomorphism is finite and is the LMFDB's per-class count; the number of isomorphism classes of
principally polarized pairs `(B, λ)` in the class is finite. Howe's criteria for
simple ordinary classes are consumed through 10.4 in dimension two; no criterion in terms of `P_A`
alone is claimed in higher dimension.
*Rests on:* 1.7, 7.4, 8.6, 9.4, 10.1; JacobianChallenge Layer E; A2.5, A6.30–A6.33.

### 10.3 Principally polarized abelian surfaces

Let `(B, λ)` be a principally polarized abelian surface over `K` and `Θ ⊆ B` a theta divisor of
`λ` (an effective divisor with `φ_{𝒪(Θ)} = λ`; one exists over `K`: the line bundles `L` with
`φ_L = λ` form a torsor under `B^∨(K̄) = Pic⁰(B)`, which has a `K`-point by Lang's theorem for the
connected group `B^∨` over the finite field `K`, and `h⁰(L) = 1` (A2.4: `h⁰(L)² = deg φ_L = 1`) gives a
unique effective `Θ` in `|L|`, necessarily `K`-rational). **Trichotomy:** exactly one of (i) `Θ` is a smooth
geometrically irreducible curve `C` of genus `2` and `(B, λ) ≅ (Jac C, canonical)` (JacobianChallenge
Layer E for the Jacobian and its polarization; Weil 1957 for the converse direction `Θ` smooth ⟹
Jacobian, by Torelli); (ii) `Θ = E_1 + E_2` with `E_1, E_2` elliptic curves over `K` meeting in one
point and `(B, λ) ≅ (E_1 × E_2, product)`; (iii) `Θ` is geometrically `E + E^σ` for an elliptic curve
`E` over `L = 𝔽_{q²}` and its conjugate, and `(B, λ) ≅ Res_{L/K}(E, canonical)` (A6.30–A6.33).
Consequences: in cases (ii)–(iii) `P_B` is `P_{E_1} P_{E_2}` (reducible) resp. `P_E(T²)` (Part II F3.1d), so
**a simple principally polarized surface is a Jacobian or `Res_{L/K} E` with `P_E(T²)` irreducible**;
a Jacobian's canonical polarization is indecomposable (its theta divisor is irreducible; knowl
`av.fq.all_polarizations_product`), while (ii) is decomposable and (iii) is indecomposable over `K`
but decomposable over `L`. The elementary direction of each case is proved here (Jacobians, products
and Weil restrictions are principally polarized surfaces with the stated `P`); the exhaustiveness
is Weil's theorem, stated with its proof outline: `Θ² = 2` and `h⁰(Θ) = 1` make `Θ` a reduced
connected curve of arithmetic genus `2`, whose components are either one smooth genus-`2` curve or
two genus-`1` curves meeting transversally in one point.
*Rests on:* 10.2; Part II F3.1d; JacobianChallenge Layer E; A2.4, A6.30–A6.33; Weil 1957.

### 10.4 Jacobians in isogeny classes of abelian surfaces (Howe–Nart–Ritzenthaler)

`hasJacobian A` (7.4) for `g = 2`. Write `P_A = T⁴ + aT³ + bT² + qaT + q²` (symmetric, 1.3), so the
real Weil polynomial is `h = x² + ax + (b − 2q)`. **Theorem (HNR).** An isogeny class of abelian
surfaces over `𝔽_q` contains a Jacobian iff it is not in HNR's exceptional list; the list, in the
cases this roadmap proves, is: **(A) `A` simple and ordinary:** no Jacobian iff one of
(i) `a² − b = q`, `b < 0`, and every prime divisor of `b` is `≡ 1 mod 3`; (ii) `a = 0` and
`b = 1 − 2q`; (iii) `a = 0` and `b = 2 − 2q`. In case (A), by 10.3 the class is principally
polarizable iff it contains a Jacobian or is `Res_{𝔽_{q²}/𝔽_q} E` with `P_E(T²) = P_A` (`a = 0` and
`E / 𝔽_{q²}` of trace `−b` exists, 4.6 over `𝔽_{q²}`); (ii)–(iii) are the Weil-restriction classes
without a Jacobian (`P_A = T⁴ − tT² + q²` with `t = 2q − 1`, resp. `2q − 2`, the trace of
`E / 𝔽_{q²}`, an ordinary curve since `p ∤ t`), and a class satisfying (i) is not a Weil
restriction (`a = 0` in (i) forces `b = −q`, `p ∣ b`, not ordinary), so
**`hasPrincipalPolarization A ↔ ¬(i)` and `hasJacobian A ↔ ¬(i) ∧ ¬(ii) ∧ ¬(iii)`** for simple
ordinary surfaces. Witnesses: `2.2.ab_ab` (i), `2.2.a_ad` (ii), `2.3.a_ae` (iii) in the worked
examples; (iii) is vacuous for `p = 2`, where `T⁴ + (2 − 2q)T² + q²` is supersingular. **(B) `A`
not simple or not ordinary:** the exceptional list is the remaining
finite family of shapes in `(q, a, b)` of HNR's main theorem, consumed from that paper as a
theorem whose statement is the list; the parts proved here are the obstructions of 7.4 and 10.5
(which together account for every exceptional split class with `|s − t| = 1` and every class with a
negative or decreasing virtual curve count). The worked examples check (A) against every genus-2
curve over `𝔽_2`, `𝔽_3`, `𝔽_5`.
*Rests on:* 1.3, 7.4, 10.2, 10.3; Part II F3.1d; Howe–Nart–Ritzenthaler 2009.

### 10.5 The resultant-one obstruction

If `h_{P_A} = h_1 h_2` with `h_1, h_2 ∈ ℤ[x]` monic, coprime, and `Res(h_1, h_2) = ±1`, then every
polarized `(B, λ)` in the isogeny class of `A` is a polarized product `(B_1, λ_1) × (B_2, λ_2)` with
`h_{P_{B_i}} = h_i`, hence **the class contains no Jacobian** (10.3: the canonical polarization of a
Jacobian is indecomposable; knowl `av.fq.all_polarizations_product`). Proof: `Res = ±1` gives
`u, v ∈ ℤ[x]` with `u h_1 + v h_2 = 1`; `η := π_B + V_B ∈ End B` (1.1) satisfies `h_{P_A}(η) = 0`
(`P_A(π) = π^g h(π + V)` and `π` is an isogeny), so `e_1 := v h_2(η)`, `e_2 := u h_1(η)` are
complementary idempotents of `End B`, `B = e_1 B × e_2 B` (Tau Ceti `prod`, the images as abelian
subvarieties, A6.3), and since `η` is fixed by the Rosati involution of `λ` (`π^† = V`, A6.21), the
`e_i` are Rosati-fixed and `λ = λ_1 × λ_2`. For `g = 2` this is the case `h = (x − s)(x − t)`,
`|s − t| = 1`, of a class `E_1 × E_2` with `E_1 ≁ E_2` (Serre's obstruction; HNR §2).
*Rests on:* 1.1, 1.3, 10.3; A3.9, A6.3, A6.21; Mathlib `Polynomial.resultant`.

### 10.6 Jacobian and hyperelliptic counts

`jacobianCount A := Nat.card {C : smooth projective geometrically connected curve of genus g over K up to K-isomorphism // P_{Jac C} = P_A}`
(1.5 makes the condition "`Jac C` is in the class", Part II
F3.3), finite (finitely many curves of genus `g` over a finite field up to isomorphism: a
quasi-compact scheme locally of finite type over the finite field `K` has finitely many `K`-points,
since a `K`-point of an affine `Spec R` is fixed by the images of finitely many generators in the
finite set `K` (Mathlib `Algebra.FiniteType`, `AlgHom.ext` on generators), applied to the
moduli-of-curves presentation of A2.8-type, or directly to the finitely many plane models);
`hypCount A` the same over hyperelliptic curves (`HyperellipticCurves`' predicate; for `g = 2`
every curve is hyperelliptic, so `hypCount = jacobianCount`); `hasJacobian A ↔ 0 < jacobianCount A`.
The LMFDB's `jacobian_count` and `hyp_count` are the values of these definitions; its `curves`
(the stored list of equations) and the completeness of that list are not targets. The theorems
here are the definitions, their finiteness, and the per-curve check
`P_{Jac C} = P_A` through 1.5 (for a hyperelliptic model `y² + h y = f`, `P_{Jac C}` is determined by
`#C(𝔽_q), …, #C(𝔽_{q^g})`, 1.4, which are finite computations).
*Rests on:* 1.4, 1.5; Part II F3.3; A2.8; Mathlib `Algebra.FiniteType`; `HyperellipticCurves` (the
hyperelliptic predicate).

## Layer 11: the intrinsic label prefix and the page map

### 11.1 The isogeny-class label prefix

`labelPrefix A := (g, q, [coeff 1 L_A, …, coeff g L_A])`, the dimension, the field size and the first
`g` coefficients of the `L`-polynomial (1.3). Milestones: it is an isogeny invariant (1.8) and
**injective on isogeny classes** (1.3: `L_A` is determined by its first `g` coefficients and `q`
through the symmetry `q^j a_{2g−j} = q^g a_j`-form of 1.3; Part II F3.3: `P_A` determines the class),
with image exactly the coefficient lists of the polynomials Honda–Tate allows (Part II F3.2, as read
in Layer 4); the base-`26` encoding `g.q.isog`
of the list (knowl `av.fq.lmfdb_label`) and every other label component — the indices of
endomorphism rings `[index]_i`, weak equivalence classes, Deligne modules and polarizations — are
not targets. The dimension `g` and `q` are recovered from the prefix, and `p` from
`q`.
*Rests on:* 1.3, 1.8; Part II F3.2, F3.3.

### 11.2 The page map

Every column and property of the `av.fq` pages, placed:

| LMFDB column / knowl | Milestone |
| --- | --- |
| `label` prefix `g.q.isog`; `g`, `q`, `p` | 11.1; conventions |
| `poly` (`L_A`), `av.fq.weil_polynomial`, `initial_coefficients` | 1.3 (`CurvesOverFiniteFields` for the polynomial) |
| `abvar_counts` (`ag.fq.point_counts`), `size`-type orders `#A(𝔽_{q^r})` | 1.2, 1.4, 7.1 |
| `curve_counts` (`av.fq.curve_point_counts`) | 7.4 (1.5 for Jacobians) |
| `is_simple`, `simple_distinct`, `simple_multiplicities`, `is_squarefree` | 5.1 |
| `is_geometrically_simple`, `is_geometrically_squarefree` (`geom_squarefree`) | 5.3 |
| `geometric_extension_degree`, `endo_extensions` (the fields of definition of endomorphisms) | 5.4, 3.4 |
| `is_primitive`, `primitive_models` | 5.5 |
| `twists`, `twist_count`, `max_twist_degree` | 5.6 (the order of the stored `twists` list is not a target) |
| `number_fields`, `galois_groups` (`av.fq.number_field`, `av.fq.galois_group`) | 5.7 |
| `center`, `divalg_dim`, `brauer_invariants`, `places` (the endomorphism algebra tables) | 3.4 (Part II F1.11, F3.2 as read in Layer 3) |
| `p_rank`, `p_rank_deficit` / `p_corank`, `is_ordinary` | 6.1, 6.2, 6.3 |
| `slopes`, `newton_elevation`, `is_supersingular`, almost ordinary | 6.2, 6.3 |
| `angles` (`av.fq.frobenius_angles`), `angle_rank`, `angle_corank` | 6.5 |
| `is_cyclic`, `noncyclic_primes`, group structures (`av.fq.group_structure`) | 7.2, 7.3, 9.5 |
| `has_principal_polarization` (`av.princ_polarizable`) | 10.2 (10.4 for `g = 2`) |
| `has_jacobian`, `jacobian_count`, `hyp_count` (`av.fq.jacobian`) | 7.4, 10.4, 10.6 |
| `zfv_index`, `zfv_is_maximal`, `zfv_real_index`, `zfv_rel_disc_norm` | 8.3 |
| `zfv_is_bass`, `is_gorenstein`, `max_cohen_macaulay_type` | 8.4, 8.5 |
| `is_zconductor_sum`, `is_zfvconductor_sum`, `is_conjugate_stable`, the endomorphism-ring graph | 8.7 |
| weak equivalence classes, `#weak`, `#Pic`, singular primes, singular dimensions | 8.6 |
| `size` (isomorphism classes in the class), the isomorphism-class pages' `End`, group, polarizations | 9.4, 9.5, 10.1 |
| `av.fq.honda_tate` | Part II F3.2 (as read in Layer 4); 4.6 for `g = 1` |
| `av.fq.one_rational_point` | 7.1 (the bound `q ≤ 4`); the classification is excluded below |
| the enumerative indices `i`, `w`, `j`, `k` of all sub-labels; the order of the stored `twists` list; the stored `curves` list | not a target (database convention) |

## Explicit scope exclusions

- **Abelian varieties over a general field** (duals, polarizations, Rosati, degrees, Poincaré
  reducibility, Hom finiteness, Albert): *Abelian schemes and arithmetic moduli* A2–A3, A6 and
  *PEL moduli* M0; consumed in Layers 1–3 and 10.
- **Tate's theorem over a finite field, Honda–Tate and the lattice classification of isomorphism
  classes**: Part II F0–F3; consumed in Layers 1–6 and 9–11.
- **The `q`-Frobenius as an endomorphism and `|π| = √q`**: *Deligne weights, purity and the Weil
  bounds* DWP.1. Every Lean statement here that would mention `π_A` is stated in prose until that
  object is importable; `Suggested.lean` covers the carriers that do not need it (the isogeny
  relation, orders in étale algebras, the Frobenius order of a Weil polynomial, Deligne modules).
- **Dieudonné theory and `p`-divisible groups**: A4.5 and `FiniteFlatGroupsAndIntegralPadicHodgeTheory`
  R07; used in 6.2 by citation only (Part II F1 builds the comparison at `p`).
- **Weil polynomials as polynomials** (the predicate, symmetry, Newton polygon, `p`-rank, angles,
  angle rank, Galois group, Weil powers, twists of polynomials, virtual counts):
  `CurvesOverFiniteFields` Layer 4; attached to `A` in Layers 1, 5, 6, 7.
- **Zeta functions of curves and the Riemann hypothesis for curves**: FunctionFieldArithmetic
  Layer 5, read as Weil polynomials in `CurvesOverFiniteFields` Layers 2–3; 1.5 identifies
  `P_{Jac C}` with that Weil polynomial.
- **CM lifting and the Shimura–Taniyama formula** (Honda's existence inputs): *Shimura varieties*
  §§5.5–5.8, assembled in Part II F3.1a–F3.1c.
- **Counting and distribution** (`#A_g(𝔽_q)`, masses, Lipnowski–Tsimerman, equidistribution of
  angles, the finiteness of isomorphism classes in a non-squarefree class):
  `ArithmeticStatisticsPartI`, `ArithmeticStatisticsPartVIII`.
- **The Madan–Pal classification** of simple isogeny classes with one rational point (knowl
  `av.fq.one_rational_point`): only the bound `q ≤ 4` (7.1) is here.
- **Howe–Nart–Ritzenthaler beyond the simple ordinary case** (10.4 (B)): consumed as the stated
  theorem; only the obstructions 7.4 and 10.5 are proved here.
- **Principal polarizability criteria in dimension `≥ 3`** in terms of `P_A` alone: none claimed;
  10.2 gives the decidable ideal-theoretic criterion for squarefree ordinary or prime-field classes.
- **Sato–Tate groups and Galois endomorphism types** (`SatoTateGroups`); **endomorphism algebras
  over number fields** (same).
- **Curve invariants** (Igusa–Clebsch, automorphism groups, hyperellipticity in genus `≥ 3`,
  equations of curves): `HyperellipticCurves`; 10.6 uses only "`C` has genus `g` and `P_{Jac C} = P_A`".
- **Class numbers of quaternion algebras** (9.6 case (3)): `QuaternionArithmetic`.
- **Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables** are not targets: the indices `i`, `w`, `j`, `k` in
  sub-labels, the order of simple factors on a page and of the `twists` list, the stored `curves`
  list and the certification of `jacobian_count` and `hyp_count` against it, and the base-`26`
  encoding. The prefix `g.q.isog` is 11.1, and the counts are defined in 10.6.
- **The LMFDB value `0` ("unknown")** of `has_principal_polarization` and `has_jacobian`: not a
  mathematical statement; the predicates here are `Prop`s.

## Worked examples

Every number below is computed (Sage: roots, factorizations, Newton slopes, `S`-unit ranks for angle
ranks, orders, conductors, Picard groups by the index formula of 8.2, Smith forms of `π − 1` for
group structures, and exhaustive enumeration of genus-`2` curves for 10.4). Labels are the LMFDB
isogeny-class labels `g.q.isog` (11.1).

**`1.2.ac`** — `E / 𝔽_2 : y² + y = x³ + x + 1`. `P = T² − 2T + 2`, `L = 1 − 2T + 2T²` (1.6).
`#E(𝔽_{2^r}) = 1, 5, 13, 25` for `r = 1, …, 4` (1.2; `#E(𝔽_2) = 1`, so 7.1's bound `q ≤ 4` is
attained); `curve_counts = abvar_counts` (1.5). Supersingular: slopes `{1/2, 1/2}`, `p`-rank `0`,
elevation `1`, angle rank `0` (6.2, 6.3, 6.5). `F = ℚ(π) = ℚ(i)` (`disc −4`, `h = 1`), Galois group
`C_2` (5.7). `ℤ[π, V] = ℤ[π] = ℤ[i]`: `zfv_index = 1` (maximal), Gorenstein, Bass, `#Pic = 1`,
`zfv_real_index = 1`, `zfv_rel_disc_norm = 4` (8.3, 8.4). Geometric extension degree `4`
(`P_{E,4} = (T + 4)²`, so `End(E_{𝔽_{16}})` is the maximal order of the quaternion algebra
ramified at `2, ∞`; 5.4, 5.2), not geometrically simple (5.3). Twist class `{1.2.a, 1.2.ac, 1.2.c}`
with `max_twist_degree = 8` (5.6). `q = p`: Centeleghe–Stix applies, `ICM(ℤ[i])` has one element, so
**one isomorphism class** (9.4), with `E(𝔽_2) = 0` (9.5); cyclic; primitive (5.5, `q` prime);
`has_jacobian = has_principal_polarization = 1`.

**`1.5.ac`** — `P = T² − 2T + 5`, `L = 1 − 2T + 5T²`, `q = 5`. `#E(𝔽_{5^r}) = 4, 32, 148, 640`.
Ordinary: slopes `{0, 1}`, `p`-rank `1`, elevation `0`, angle rank `1` (6.3, 6.5). `F = ℚ(i)`,
`ℤ[π, V] = ℤ[π] = ℤ[2i]`: `zfv_index = 2`, conductor `(1 + i)² = (2)` of index `4` in `ℤ[i]`,
`zfv_rel_disc_norm = 16`, `zfv_real_index = 1`, Gorenstein and Bass (quadratic), `is_zconductor_sum`
(`ℤ + 2ℤ[i] = ℤ[2i]`), `#Pic(ℤ[2i]) = 1` by the index formula `1 · 2 / (1 · 2)` (8.2, 8.3, 8.7).
Overorders: `ℤ[2i] ⊂ ℤ[i]`, both Gorenstein, `max_cohen_macaulay_type = 1` (8.5). **Two isomorphism
classes** (9.4, 9.6): `y² = x³ + x + 2` (`j = 1`) with `End = ℤ[2i]` and `E(𝔽_5) ≅ ℤ/4`
(`ℤ[2i]/(2i)ℤ[2i]`), and `y² = x³ + x` (`j = 3`) with `End = ℤ[i]` and `E(𝔽_5) ≅ (ℤ/2)²`
(`ℤ[i]/(2i)`) (9.5; 7.2 shows two isogenous varieties with different group structures). Not cyclic,
`noncyclic_primes = {2}` (7.3). Geometric extension degree `1`; twist class `{1.5.ae, 1.5.ac, 1.5.c, 1.5.e}` (the roots `±(1 + 2i)`,
`±i(1 + 2i)`; `(1 + 2i)⁴ = (2 − i)⁴ = −7 − 24i`), `max_twist_degree = 4`.

**`2.2.ad_f`** — `P = T⁴ − 3T³ + 5T² − 6T + 4`, `L = 1 − 3T + 5T² − 6T³ + 4T⁴`, `q = 2`. Simple,
irreducible, squarefree (5.1); `#A(𝔽_{2^r}) = 1, 19, 76, 171` (**one rational point**, 7.1);
`curve_counts = 0, 6, 9, 10` (7.4). Ordinary: slopes `{0, 0, 1, 1}`, `p`-rank `2`, elevation `0`;
angle rank `1` (not `2`: `α_1 α_2^{-1}`-relations exist since the class is not geometrically
simple; 6.5). `F = ℚ(√5, √−3)` (`disc 225`, `h = 1`), Galois group `C_2 × C_2` (`4T2`); real Weil
polynomial `h = x² − 3x + 1` (5.7). `ℤ[π, V] = 𝓞_F` (`zfv_index = 1`, `zfv_is_maximal`),
`[ℤ[π, V] : ℤ[π]] = 2` (8.3: `V ∉ ℤ[π]`), `zfv_real_index = 1`, `zfv_rel_disc_norm = 9 = 225 / 5²`
(8.3's identity), Gorenstein, Bass, `#Pic = 1`: **one isomorphism class**, `A(𝔽_2) = 0`, cyclic
(9.4, 9.5). Geometric extension degree `6` (`P_{A,6} = (T² + 11T + 64)²`: over `𝔽_{64}`, `A ~ E²` for
`E` of trace `−11`), so not geometrically simple and not geometrically squarefree (5.3, 5.4);
primitive. **Jacobian:** `y² + (x³ + x² + 1) y = x⁶ + x⁵ + 1` over `𝔽_2` has this `P` and `0, 6, 9`
points over `𝔽_2, 𝔽_4, 𝔽_8`, so `has_jacobian = has_principal_polarization = 1` (10.4 (A): `a = −3`,
`b = 5`, none of (i)–(iii)).

**`2.3.b_ac`** — `P = T⁴ + T³ − 2T² + 3T + 9`, `L = 1 + T − 2T² + 3T³ + 9T⁴`, `q = 3`. Simple ordinary
(slopes `{0, 0, 1, 1}`), angle rank `1`; `#A(𝔽_{3^r}) = 12, 48, 1296, 7104`;
`curve_counts = 5, 5, 44, 89`. `F = ℚ(√−3, √33)` (`disc 1089 = 33²`, `h = 1`), Galois `C_2 × C_2`,
`h_P = x² + x − 8` (`disc 33`). `ℤ[π, V]`: `zfv_index = 2`, `[ℤ[π, V] : ℤ[π]] = 3`, conductor `𝔣` of
index `4` in `𝓞_F` (a prime
of norm `4` above `2`), `is_zconductor_sum` (`ℤ + 𝔣 = ℤ[π, V]`),
`zfv_rel_disc_norm = 4 = (4 · 1089) / 33²`, `zfv_real_index = 1`, Gorenstein, `#Pic(ℤ[π, V]) = 1`
(index formula `1 · 3 / (1 · 3)`);
overorders `ℤ[π, V] ⊂ 𝓞_F` only (`𝓞_F / ℤ[π, V] ≅ ℤ/2`), both Gorenstein, so Bass and
`max_cohen_macaulay_type = 1` (8.4, 8.5). **Two isomorphism classes** (9.4): `End = ℤ[π, V]` with
`A(𝔽_3) ≅ ℤ/12`, and `End = 𝓞_F` with `A(𝔽_3) ≅ ℤ/2 × ℤ/6` (9.5); `noncyclic_primes = {2}` (7.3).
Geometric extension degree `3` (`P_{A,3} = (T² + 8T + 27)²`). **Jacobian:** `y² = 2x⁵ + 2x⁴ + x³ + x`
over `𝔽_3` has this `P` (and `5, 5, 44` points), so `has_jacobian = 1`.

**`2.2.a_ae`** — `P = (T² − 2)², L = 1 − 4T² + 4T⁴`, `q = 2`: the simple supersingular surface of 3.3
(`m_A = T² − 2`, `e = 2`, `F = ℚ(√2)`, `End⁰` the quaternion algebra over `ℚ(√2)` ramified at the two
real places, `divalg_dim = 4`; `brauer_invariants` at the place above `2`: `0`). Simple, hence
`is_squarefree = true`, but `P_A` is **not squarefree** as a polynomial (the Decomposition
convention's example): Layers 8–9 do not apply and there is no `ℤ[π, V]` or isomorphism-class
data; `is_geometrically_squarefree = false` (`A_{𝔽_4} ~ E²`). Slopes `{1/2}^4`,
`p`-rank `0`, elevation `2 = g(g+2)/4`, angle rank `0`; `#A(𝔽_{2^r}) = 1, 1, 49, 81`;
`curve_counts = 3, −3, 9, 1`, so **`has_jacobian = −1`** by 7.4 (the boundary check for a negative
virtual count). `P_{A,2} = (T − 2)⁴`: `A_{𝔽_4} ~ E²` for `E = 1.4.ae`, geometric extension degree `2`,
not geometrically simple (5.2, 5.3). Galois group of `P`: `C_2`.

**`1.4.ae`** — `E / 𝔽_4 : y² + y = x³ + ω`, `P = (T − 2)²`, `π_E = 2`: the real case `F = ℚ`, `e = 2`
of 3.3; `End⁰` the quaternion algebra over `ℚ` ramified at `{2, ∞}`, `divalg_dim = 4`, geometric
extension degree `1` (all endomorphisms defined over `𝔽_4`). `#E(𝔽_{4^r}) = 1, 9, 49, 225`. **Primitive
as an isogeny class** although `P = weilPower (T² − 2) 2`: the separating example of 5.5.

**Rejected and boundary polynomials.** `T² − 7T + 49` over `𝔽_{49}`: a Weil polynomial, irreducible,
`F = ℚ(√−3)`, `7` splits, `inv_v = (1/2) · 1 = 1/2` at both primes above `7` (Part II F1.11), so `e = 2` and
**no elliptic curve over `𝔽_{49}` has trace `7`** (Part II F3.2, 4.6: `p = 7 ≡ 1 mod 3`); its square
`(T² − 7T + 49)² = T⁴ − 14T³ + 147T² − 686T + 2401` is the simple supersingular surface
`2.49.ao_fr`.
`T² − 2` over `𝔽_2`: irreducible Weil, not a `P_A` (`e = 2`); `2.2.a_ae` is its square.
`T⁴ − 3T² + 4 = 2.2.a_ad` (`a = 0`, `b = −3 = 1 − 2q`): simple ordinary, **principally polarizable
but no Jacobian**
(10.4 (ii): it is `Res_{𝔽_4/𝔽_2} E` for `E / 𝔽_4` of trace `3`, 10.3 (iii)).
`T⁴ − T³ − T² − 2T + 4 = 2.2.ab_ab` (`a = −1`, `b = −1`, `a² − b = 2 = q`): simple ordinary,
**neither principally polarizable
nor a Jacobian** (10.4 (i)). `T⁴ − 3T³ + 6T² − 6T + 4 = (T² − 2T + 2)(T² − T + 2) = 2.2.ad_g`: split,
`s = 2`, `t = 1`, `Res(x − 2, x − 1) = 1`, **no Jacobian** by 10.5; likewise
`2.3.d_i = (T² + T + 3)(T² + 2T + 3)`. Among the `35`, `63`, `129` isogeny classes of surfaces over
`𝔽_2`, `𝔽_3`, `𝔽_5`, exactly
`20`, `50`, `115` contain a Jacobian (every genus-`2` curve enumerated), and the simple ordinary ones
without a Jacobian are exactly those satisfying (i), (ii) or (iii) of 10.4.

## Ordering

```
Layer 1 (Frobenius, L-polynomial, isogeny relation)                      ← Part II F0.2, F0.5
  ├── Layer 2 (Tate module, endomorphism field)                          ← Part II F0, F1, F3.3
  │     ├── Layer 3 (real classes, display data of End⁰)                 ← Part II F1.11, F3.2
  │     │     └── Layer 4 (Waterhouse's list)  ──┬── Layer 5 (decomposition, geometric data, twists)
  │     │                                        └── Layer 6 (p-rank, Newton polygon, angle rank)
  │     └── Layer 7 (group of points)              [7.3 also uses 9.5 only for computation]
  └── Layer 11 (label prefix, page map)
Layer 8 (orders in étale algebras, ℤ[π, V])   — independent of Layers 1–7 except 8.3's use of 3.4
  └── Layer 9 (Deligne modules, Centeleghe–Stix, isomorphism classes)  ← 5, 6, 8, A4.9–A4.10, Part II F3.8–F3.10
        └── Layer 10 (polarizations, Howe–Nart–Ritzenthaler, Jacobians) ← 9, Part II F3.1d, JacobianChallenge E
```

Layers 1 and 8 can start at once (8.1–8.2 and 8.4–8.6 need nothing from Layers 1–7); Layer 2 after
1; Layers 3 and 7 after 2, in parallel; 4 after 3; 5 and 6 after 4, in parallel; 9 after 5, 6 and
8; 10 after 9; 11 after 1 and 4. Layers 2–6 and 9–11 read Part II F0–F3 (Tate's theorem, Honda–Tate,
the lattice classification) wherever they use those theorems. The external inputs with the longest
lead time are DWP.1 (every layer), A6 (Layers 1–3), Part II F0–F3 (Layers 2–6 and 9–11) and
A4.9–A4.10 (9.2 only); Layers 8 and the polynomial-level parts of 5–6 depend on none of them.

## References

- J. Tate, *Endomorphisms of abelian varieties over finite fields*, Invent. Math. 2 (1966), 134–144.
  Theorems 1–2, consumed through Part II F0 and F3.2 (Layers 2–3). On disk.
- W. C. Waterhouse, *Abelian varieties over finite fields*, Ann. Sci. ÉNS (4) 2 (1969), 521–560.
  Chapter 2 (the Honda–Tate statement of knowl `av.fq.honda_tate`, Layer 4), Theorem 4.1 (4.6),
  Theorems 4.2, 4.5 (9.6), Theorem 7.4 (9.4: endomorphism rings of ordinary classes are the orders
  containing `π, q/π`). On disk.
- W. C. Waterhouse, J. S. Milne, *Abelian varieties over finite fields*, Proc. Sympos. Pure Math. 20
  (1971), 53–64. §2 (supersingular structure, 6.3). On disk.
- J. S. Milne, *Abelian Varieties*, course notes v2.00. I §7 (`A[p]`, 6.1), II §1–2 (II.2.1 Honda–Tate,
  II.2.9 the endomorphism algebra; the background of Layers 2–4). On disk.
- D. Mumford, *Abelian Varieties*, 2nd ed., Oxford 1974. §16 (Riemann–Roch, 10.3 via A2.4).
- P. Deligne, *Variétés abéliennes ordinaires sur un corps fini*, Invent. Math. 8 (1969), 238–243.
  The equivalence of 9.2.
- T. G. Centeleghe, J. Stix, *Categories of abelian varieties over finite fields I: abelian varieties
  over 𝔽_p*, Algebra & Number Theory 9 (2015), 225–265. Theorem 1 (9.3), §4 (Gorenstein, 8.4), §7
  (comparison with Deligne, 9.3, 10.1).
- E. W. Howe, *Principally polarized ordinary abelian varieties over finite fields*, Trans. Amer.
  Math. Soc. 347 (1995), 2361–2401. §4 (duals and polarizations of Deligne modules, 9.1, 10.1).
- E. W. Howe, E. Nart, C. Ritzenthaler, *Jacobians in isogeny classes of abelian surfaces over finite
  fields*, Ann. Inst. Fourier 59 (2009), 239–289. The main theorem (10.4); the resultant
  obstruction (10.5).
- S. Marseglia, *Computing square-free polarized abelian varieties over finite fields*, Math. Comp. 90
  (2021), 953–971. §2 (weak equivalence, ideal dictionary, 8.6, 9.1), §3 (ideal class monoid, 8.6),
  §4 (Bass/Gorenstein and polarizations in ideal form, 8.4, 10.1).
- A. Weil, *Zum Beweis des Torellischen Satzes*, Nachr. Akad. Wiss. Göttingen (1957), 33–53.
  Principally polarized surfaces are Jacobians or products (10.3).
- J. Neukirch, *Algebraic Number Theory*, Springer 1999. I §12 (orders, Picard group, the conductor
  exact sequence, 8.2).
- I. Reiner, *Maximal Orders*, LMS Monographs 5, 1975. §26 (Jordan–Zassenhaus, 8.6).
- LMFDB knowls `av.fq.*` as named per milestone; `lmfdb/abvar/fq/isog_class.py`, `main.py`,
  `web_abvar.py`, `stats.py` for the columns of the page map (11.2).
