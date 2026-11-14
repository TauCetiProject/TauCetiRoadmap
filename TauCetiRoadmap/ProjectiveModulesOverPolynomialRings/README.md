# Roadmap: projective modules over polynomial rings

**Summary.** Build the commutative algebra of Serre's problem on Mathlib's carriers: modules over
`A[X]` (`Polynomial`) and over `A[X₁, …, Xₙ]` (`MvPolynomial (Fin n) A`) for a commutative ring `A`,
with Mathlib's `Module.Projective`, `Module.Free`, `Module.IsStablyFree`, `Module.IsUnimodular` and
`Matrix.GeneralLinearGroup`. The end theorems are: Suslin's `r!` theorem, which makes
`(a₀ ^ m₀, …, a_r ^ m_r)` the first row of a matrix of determinant one for every unimodular row
`(a₀, …, a_r)` with `r ≥ 1`, positive exponents and `r! ∣ m₀ ⋯ m_r` (Layer 1); finitely generated
projective modules over a polynomial ring over a field are stably free (Layer 2); an `A[X]`-module
is extended from `A` exactly when it is `A[X] ⊗[A] M(0)`; for an `A`-algebra `R`, not necessarily
commutative, `f ∈ A` and a unit `θ` of `R_f[X]` with `θ(0) = 1`, the unit `θ(g₁X) θ(g₂X)⁻¹` comes
from a unit of `R[X]` whenever `g₁ − g₂` lies in a high enough power of `fA` (Quillen's dilation
lemma); the `a ∈ A` over which a finitely presented `A[X]`-module becomes extended form an ideal,
and a finitely presented module over `A[X]` or `A[X₁, …, Xₙ]` that is extended at every maximal
ideal of `A` is extended, Quillen's patching theorem (Layer 3); for the localisation `A⟨X⟩` of
`A[X]` at the monic polynomials, `k⟨X⟩` is a principal ideal domain when `k` is one and a field when
`k` is one; over a local ring `A`, a finitely generated projective `A[X]`-module that is free over
`A⟨X⟩` is free (local Horrocks); over any commutative `A`, one that is extended from `A` over `A⟨X⟩`
is extended (affine Horrocks), finitely generated projective `A`-modules that become isomorphic over
`A⟨X⟩` are isomorphic (Bass), and one that is free over `A⟨X⟩` is free (Quillen's form of Horrocks'
theorem) (Layer 4); a unimodular vector over `A[X]` whose leading coefficients, for some formal
degrees, generate the unit ideal is equivalent under `GLₙ(A[X])` to its value at `X = 0`, and the
Quillen–Suslin theorem: over a principal ideal domain `k` every finitely generated projective
`k[X₁, …, Xₙ]`-module is free and every unimodular vector over `k[X₁, …, Xₙ]` is the first column of
an invertible matrix, while over a Dedekind domain every finitely generated projective module over
the polynomial ring is extended (Layer 5).

Suggested home: `TauCeti/RingTheory/Polynomial/Projective/`.

## Scope and ownership

**Owned here.** Suslin's `r!` theorem (Layer 1); Serre's stable freeness over polynomial rings
over a field (Layer 2); extended modules, base change of a polynomial module along `A → B`,
Quillen's dilation lemma, the Quillen ideal and Quillen's patching theorem in one and in `n`
variables (Layer 3); the monic polynomials, the ring `A⟨X⟩` and its faithful flatness over `A`,
Quillen's Lemma 2, Horrocks' theorem in its local, affine and global (Quillen's) forms, and Bass's
theorem that `A⟨X⟩` reflects isomorphism (Layer 4); unimodular polynomial vectors with a unit
head ideal, the Quillen–Suslin theorem over principal ideal domains, its extended form over
Dedekind domains, and Suslin's completion theorem (Layer 5).

**Left to PadicDifferentialEquationsAndRigidCohomology.** Finite free resolutions (finite length,
finite free terms) with two out of three, the stable freeness of a projective module with one,
and their passage from a Noetherian ring `B` to `B[X]`
(PadicDifferentialEquationsAndRigidCohomology §RD.0.55); unimodular vectors, their equivalence
under `GLₙ`, the unimodular extension property and its equivalence with freeness of finitely
generated stably free modules (PadicDifferentialEquationsAndRigidCohomology §RD.0.56 (b)). This
roadmap states neither and consumes both (Exact supplier contracts). Target 5.1 here differs from
§RD.0.56 (a): any commutative ring and a unit head ideal, instead of an integral domain and a
monic entry. The rigid-analytic Quillen–Suslin theorem over overconvergent power series rings
(PadicDifferentialEquationsAndRigidCohomology §RD.3.27) is a different ring and stays there.

**Left to RelativeFarguesFontaine.** Glueing pairs `(R → R′, f)` and the gluing of a finitely
generated projective `R′`-module with a finitely generated projective `R_f`-module along an
isomorphism over `R′_f` (RelativeFarguesFontaine §6.4 and §6.5), which contains the gluing over two
comaximal localisations used in 4.4. This roadmap states no gluing theorem and consumes this one
(Exact supplier contracts).

**Left to AlgebraicKTheory.** The elementary subgroups `Eₙ(R)`, Bass's stable range
`HasStableRangeLE R s` and the stability theorems (AlgebraicKTheory 1.1, 4.1, 4.2), K₀ and K₁ of
rings (AlgebraicKTheory 0.3, 2.1), Milnor patching (AlgebraicKTheory Layer 6), and the stably free
non-free tangent module over the continuous functions on `S²` (AlgebraicKTheory 0.5). This roadmap
states its results on `GLₙ` and `SLₙ` and uses none of these; the refinements of 5.1 and 1.1 with
`Eₙ(A[X])` in place of `GLₙ(A[X])` (Suslin's normality and stability theorems) are outside its
scope.

**Left to GeneralAlgebraicKTheory.** Polynomial invariance of K₀ of regular Noetherian rings
(GeneralAlgebraicKTheory 10.12a) and the Fundamental Theorem (GeneralAlgebraicKTheory 9.16), which
give `K₀(k[X₁, …, Xₙ]) = ℤ` and hence 2.1 by another route; 2.1 here is proved from finite free
resolutions (PadicDifferentialEquationsAndRigidCohomology §RD.0.55 (b) and (d)), with no K-theory.

**Supplied by Mathlib and consumed by name.** Polynomials, multivariate polynomials, their
evaluation and coefficient maps; localisations `Localization`, `Localization.Away`,
`Localization.AtPrime`; tensor products and base change, of modules and of algebras; endomorphism
rings `Module.End`; projective, free, stably free, finite and finitely presented modules; unimodular
elements; general and special linear groups; principal ideal domains, Dedekind domains and their
localisations at nonzero primes, which are discrete valuation rings, Noetherian rings, local rings
and fields; flat and faithfully flat modules, with the descent of finite generation and of flatness
along a faithfully flat algebra; freeness of finitely generated flat modules over a local ring
(`Module.free_of_flat_of_isLocalRing`) and of finitely generated torsion-free modules over a
principal ideal domain (`Module.free_of_finite_type_torsion_free'`); the primes of a
localisation, Gauss's lemma for primitive polynomials, and the fact that a ring whose prime ideals
are principal is a principal ideal ring; and the transport of a finitely generated module to the
universe of its ring (`Shrink`).

**Out of scope.** Suslin's theorem that stably free modules of rank at least `dim A` over an affine
algebra over an algebraically closed field are free (Suslin 1977, Theorem 1), which needs dimension
theory of affine algebras; the Traverso–Swan theorem on `Pic A[X]` and seminormal rings, used here
only in Checks; Roitman's theorem (Lombardi–Quitté, Theorem XVI.3.8, p. 910); the Bass–Quillen
conjecture (Research context); projective modules over Laurent polynomial rings and over the
overconvergent rings of PadicDifferentialEquationsAndRigidCohomology; and algorithms.

## Conventions

1. **Vectors are columns.** `GLₙ(R)` acts on `Fin n → R` on the left by `Matrix.mulVec`, and a
   vector `v` is completable when it is the first column `i ↦ g i 0` of some `g`. Suslin's
   theorem 1.1 produces a first row, `i ↦ α 0 i`; the transpose exchanges the two. Witness: over
   `ℤ` the matrix `!![2, 1; 3, 2]` has determinant `4 − 3 = 1` and first column `(2, 3)`, and its
   transpose has first row `(2, 3)`.
2. **Extension of scalars.** A module over an `A`-algebra `R` is extended from `A` when it is
   isomorphic to `R ⊗[A] N`, with `R` acting on the left factor, for an `A`-module `N` in the
   universe of the module. For an `A[X]`-module `M`, `M(0)` is `A ⊗[A[X]] M` along evaluation at
   `0`. Witness: for `M = A[X] ⧸ (X − 1)`, `M(0) = A ⧸ (0 − 1) = 0`, while specialising at `X = 1`
   would give `A`; so `M` is extended only when `A = 0`.
3. **Base change of polynomial modules.** For an `A`-algebra `B`, an `A[X]`-module is moved to
   `B[X]` along the coefficient map `Polynomial.mapRingHom (algebraMap A B)`, Mathlib's
   `Polynomial.algebra A B`, and an `A[X₁, …, Xₙ]`-module along
   `MvPolynomial.algebraMvPolynomial`; neither is a global instance, and the two predicates of 3.1
   install them locally. Witness: for `A = ℤ`, `B = Localization.Away 2` and
   `M = ℤ[X] ⧸ (2, X)`, the base change is `ℤ[1/2][X] ⧸ (2, X) = 0`.
4. **Monic.** `Polynomial.Monic` means leading coefficient `1`; `A⟨X⟩` is the localisation of
   `A[X]` at the submonoid of monic polynomials. Witness: in `ℤ⟨X⟩` the element `X` is a unit and
   `2` is not, since `2 · p = s` with `s` monic would make the leading coefficient of `s` even.

## Exact supplier contracts

**From Mathlib** (at the pins; file names are relative to `Mathlib/`).

- Polynomials: `Polynomial`, `Polynomial.Monic`, `Polynomial.monic_one`, `Polynomial.Monic.mul`,
  `Polynomial.natDegree`, `Polynomial.coeff`, `Polynomial.C`, `Polynomial.X`, `Polynomial.eval`,
  `Polynomial.eval₂` (over a not necessarily commutative coefficient ring), `Polynomial.map`,
  `Polynomial.evalRingHom`, `Polynomial.mapRingHom` (`Algebra/Polynomial/`),
  `Polynomial.algebra` (`RingTheory/PolynomialAlgebra`), `Polynomial.primPart`
  (`RingTheory/Polynomial/Content`), `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`
  (Gauss's lemma; `RingTheory/Polynomial/GaussLemma`); `MvPolynomial`,
  `MvPolynomial.algebraMvPolynomial` (`Algebra/MvPolynomial/Eval`), `MvPolynomial.finSuccEquiv`
  (`Algebra/MvPolynomial/Equiv`).
- Modules: `Module.Projective` (`Algebra/Module/Projective`), `Module.Free`, `Module.Finite`,
  `Module.FinitePresentation` (`Algebra/Module/FinitePresentation`), `Module.IsStablyFree` and
  `Module.IsStablyFree.of_shrink` (`Algebra/Module/StablyFree/Basic`), `Module.Finite.small` (a
  finitely generated module is small in the universe of its ring; `RingTheory/Finiteness/Small`),
  `Shrink.linearEquiv` (`Algebra/Module/Shrink`), `Module.IsUnimodular`
  (`LinearAlgebra/Unimodular`), `TensorProduct` with its left module structure, `LinearEquiv`,
  `Module.finitePresentation_of_projective` (`Algebra/Module/FinitePresentation`),
  `Module.free_of_flat_of_isLocalRing` (`RingTheory/LocalRing/Module`) and
  `Module.free_of_finite_type_torsion_free'` (`LinearAlgebra/FreeModule/PID`).
- Flatness: `Module.Flat`, `Module.FaithfullyFlat` and `Module.Flat.of_flat_tensorProduct`
  (flatness descends along a faithfully flat algebra; `RingTheory/Flat/FaithfullyFlat/Basic`),
  `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat` (so does finite generation;
  `RingTheory/Finiteness/Descent`).
- Rings: `Ideal.span`, `Ideal.IsMaximal`, `Submonoid`, `Localization`, `Localization.Away`,
  `Localization.AtPrime`, `IsLocalization.isDomain_localization` (`RingTheory/Localization/Defs`),
  `IsLocalization.orderIsoOfPrime` (the primes of a localisation; `RingTheory/Localization/Ideal`),
  `IsDomain`, `IsField`, `IsLocalRing`, `IsPrincipalIdealRing`, `IsPrincipalIdealRing.of_prime`
  (a ring whose prime ideals are principal is a principal ideal ring;
  `RingTheory/PrincipalIdealDomainOfPrime`), `IsDedekindDomain`, `IsDiscreteValuationRing`
  (`RingTheory/DiscreteValuationRing/Basic`),
  `IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain` (the localisation of a
  Dedekind domain at a nonzero prime is a discrete valuation ring; `RingTheory/DedekindDomain/Dvr`),
  `IsNoetherianRing`; `Module.End` (`Algebra/Module/LinearMap/End`) and
  `Algebra.TensorProduct.includeRight` (`RingTheory/TensorProduct/Basic`);
  `Matrix.GeneralLinearGroup` (notation `GL`), `Matrix.SpecialLinearGroup`, `Matrix.mulVec`;
  `Nat.factorial`, `Finset.prod`.

**From Tau Ceti.** Nothing is consumed from the Tau Ceti library.

**From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.**

- §RD.0.55, finite free resolutions: `HasFiniteFreeResolution R M` for `R` and `M` in one
  universe, with (a) two out of three, (b) `HasFiniteFreeResolution.isStablyFree` (a projective
  module with a finite free resolution is stably free), and (d)
  `hasFiniteFreeResolution_polynomial` (if `R` is Noetherian and every finite `R`-module has a
  finite free resolution, so has every finite `R[X]`-module). Used in 2.1.
- §RD.0.56 (b), `hasUnimodularExtension_iff`: every unimodular `v : Fin (n + 1) → R` is carried to
  `Pi.single 0 1` by some element of `GL (Fin (n + 1)) R` (equivalently, is the first column of
  an invertible matrix) exactly when every finitely generated stably free `R`-module in the
  universe of `R` is free. Used in 5.4.

**From TauCetiRoadmap.RelativeFarguesFontaine.**

- §6.4, `GlueingPair R′ f` for an `R`-algebra `R′` and `f ∈ R`, both rings in one universe: for
  every `n`, `R ⧸ fⁿR → R′ ⧸ fⁿR′` is bijective, and `R → R′` is bijective on `f`-power torsion.
- §6.5, `beauvilleLaszlo_effective`: for a glueing pair `(R → R′, f)`, a localisation `L` of `R′`
  away from `f` that is an `R_f`-algebra, a finitely generated projective `R′`-module `M′`, a
  finitely generated projective `R_f`-module `M₁` and an `L`-linear isomorphism
  `α : L ⊗[R′] M′ ≅ L ⊗[R_f] M₁`, all in the universe of `R`, there are a finitely generated
  projective `R`-module `M` in that universe and isomorphisms `R′ ⊗[R] M ≅ M′` and
  `R_f ⊗[R] M ≅ M₁` compatible with `α`. Used in 4.4.

## How to read the build

Layer 1 is Suslin's `r!` theorem on unimodular rows, independent of the rest. Layer 2 applies the
finite free resolutions of PadicDifferentialEquationsAndRigidCohomology §RD.0.55 to obtain Serre's
stable freeness over polynomial rings over a field. Layer 3 defines extended modules and base change
of polynomial modules, proves Quillen's dilation lemma on units of polynomial rings over a not
necessarily commutative algebra, and from it Quillen's patching theorem through the Quillen ideal.
Layer 4 inverts the monic polynomials: Quillen's Lemma 2 and the faithful flatness of `A⟨X⟩` over
`A`, then Horrocks' theorem over a local ring, the affine Horrocks theorem (local Horrocks at every
maximal ideal plus Layer 3), Bass's theorem on isomorphism over `A⟨X⟩` (with `Y = 1/X`, a gluing
over `A[Y]` by RelativeFarguesFontaine §6.5, then the affine Horrocks theorem over `A[Y]`) and, from
the last two, Horrocks' theorem in Quillen's form, with no projective line. Layer 5 assembles the
Quillen–Suslin theorem: by induction on `n`, Lemma 2 makes `k⟨Xₙ⟩` a principal ideal domain, the
induction hypothesis makes the base change of the module to `k⟨Xₙ⟩[X₁, …, Xₙ₋₁]`, a localisation
of `A[Xₙ]` for `A = k[X₁, …, Xₙ₋₁]`, free, hence its base change to `A⟨Xₙ⟩`, and 4.5 descends
freeness to `A[Xₙ]`; Dedekind domains add Layer 3; and
PadicDifferentialEquationsAndRigidCohomology §RD.0.56 (b) turns freeness into completion of
unimodular vectors. Target 5.1, on unimodular polynomial vectors, uses Layer 3.

## Layer 1: Suslin's `r!` theorem

### 1.1 Suslin's `r!` theorem

Prove `exists_specialLinearGroup_row_pow`: for a commutative ring `A`, `r ≥ 1`, a row
`a : Fin (r + 1) → A` whose entries generate the unit ideal and positive exponents `m` with
`r! ∣ ∏ i, m i`, there is `α : Matrix.SpecialLinearGroup (Fin (r + 1)) A` with first row
`i ↦ a i ^ m i` (Suslin 1977, Theorem 2, p. 479 of the translation; for `r = 2`, Swan–Towber 1975).
*Needs:* Mathlib `Matrix.SpecialLinearGroup`, `Ideal.span`, `Nat.factorial`.

**Checks.**

- `r = 0` is excluded: `0! = 1` divides every exponent, but `SL₁(A) = {1}`, so `(2)` over `ℚ`
  would have to be `1`.
- `r = 1`: every unimodular `(b₀, b₁)` with `b₀c₀ + b₁c₁ = 1` is the first row of
  `!![b₀, b₁; −c₁, c₀]`, of determinant `1`, so the theorem holds with no divisibility condition,
  as `1! = 1` says.
- `r = 2` on the sphere ring `R = ℝ[x, y, z] ⧸ (x² + y² + z² − 1)`: the row `(x, y, z)` is
  unimodular (`x · x + y · y + z · z = 1`) and is not the first row of an invertible matrix: a
  completion would make the kernel `K` of `(x, y, z)ᵀ : R³ → R`, the module of polynomial tangent
  fields of the sphere, free, and its base change to the continuous functions would trivialise
  the tangent bundle of `S²`, against the hairy ball theorem (Swan 1962); `K ⊕ R ≅ R³`, so `K` is
  stably free and not free. With exponents `(1, 1, 1)`, `2 ∤ 1`, and the theorem says nothing,
  while `(x, y, z²)` with exponents `(1, 1, 2)` satisfies `2 ∣ 2` and is the first row of a matrix
  of determinant one: the divisibility condition is sharp in this case.

### Examples

- Over `ℤ`, `a = (2, 3)` and `m = (1, 2)` give the row `(2, 9)`, the first row of
  `!![2, 9; 1, 5]`, of determinant `10 − 9 = 1`.

### Dependencies

Mathlib only.

## Layer 2: Serre's stable freeness

### 2.1 Stable freeness over polynomial rings over a field

Prove `isStablyFree_mvPolynomial`: over a field `k`, every finitely generated projective
`k[X₁, …, Xₙ]`-module (in any universe) is stably free (Lombardi–Quitté, Section XVI.5, p. 919,
for the attribution to Serre). Route: by induction on `n`, every finite `k[X₁, …, Xₙ]`-module in
the universe of `k` has a finite free resolution: for `n = 0` it is a finite free `k`-module, and
the step is PadicDifferentialEquationsAndRigidCohomology §RD.0.55 (d) over the Noetherian ring
`k[X₁, …, Xₙ]`, transported along `MvPolynomial.finSuccEquiv`. A finitely generated module `P` is
small in the universe of `k` (`Module.Finite.small`); its `Shrink` is finitely generated projective
through `Shrink.linearEquiv`, §RD.0.55 (b) makes it stably free, and
`Module.IsStablyFree.of_shrink` returns to `P`.

The API:

- A finite free resolution is carried along a ring isomorphism together with its module.

*Needs:* PadicDifferentialEquationsAndRigidCohomology §RD.0.55; Mathlib `MvPolynomial`,
`MvPolynomial.finSuccEquiv`, `IsNoetherianRing`, `Module.IsStablyFree`, `Module.Finite.small`,
`Shrink.linearEquiv`, `Module.IsStablyFree.of_shrink`.

**Checks.**

- `n = 0`: `MvPolynomial (Fin 0) k ≅ k`, over which every module is free.
- `n = 1`: `k[X]` is a principal ideal domain, and the statement is the freeness of finitely
  generated projective modules, with the trivial complement.
- The field cannot be replaced by `ℤ/6`: there `ℤ/2 ≅ 3ℤ/6` is projective of rank `1` at the
  prime `(2)` and `0` at `(3)`, so not stably free, and so is its extension `(ℤ/6)[X] ⊗ ℤ/2`.

### Examples

- The ideal `(X, Y)` of `k[X, Y]` has the Koszul resolution
  `0 → k[X, Y] → k[X, Y]² → (X, Y) → 0`, maps `c ↦ (−Yc, Xc)` and `(a, b) ↦ Xa + Yb`; the
  projective module `k[X, Y]` itself is free.

### Dependencies

PadicDifferentialEquationsAndRigidCohomology §RD.0.55; Mathlib.

## Layer 3: extended modules and Quillen patching

### 3.1 Extended modules and base change

Define `IsExtendedFrom A R M` for an `A`-algebra `R` and an `R`-module `M : Type v`: there are an
`A`-module `N : Type v` and an `R`-linear isomorphism `M ≃ R ⊗[A] N` (Convention 2; Quillen 1976,
p. 168; Lombardi–Quitté, Section XVI.1, p. 898). Define `IsExtendedAfter A B M` for an
`A`-algebra `B` and an `A[X]`-module `M`: the base change `B[X] ⊗[A[X]] M` along the coefficient
map is extended from `B`; and `IsExtendedAfterMv A B n M`, the same over `A[X₁, …, Xₙ]`
(Convention 3). Prove `isExtendedFrom_iff_evalZero`: `M` is extended from `A` if and only if
`M ≅ A[X] ⊗[A] M(0)`, stated for an instance `Algebra A[X] A` whose `algebraMap` is
`Polynomial.evalRingHom 0` (Quillen 1976, p. 168, where `N ≅ M/TM`; Lombardi–Quitté, Fact
XVI.1.1, p. 899).

The API:

- `IsExtendedFrom A R M` and `IsExtendedAfter A B M` are invariant under linear isomorphism of `M`
  (over `R`, resp. `A[X]`).
- Base change along `A → B` preserves extended modules:
  `B[X] ⊗[A[X]] (A[X] ⊗[A] N) ≅ B[X] ⊗[B] (B ⊗[A] N)`, so `IsExtendedFrom A A[X] M` implies
  `IsExtendedAfter A B M`.
- For `B = A`, `IsExtendedAfter A A M` is `IsExtendedFrom A A[X] M`, through
  `A[X] ⊗[A[X]] M ≅ M`.
- `IsExtendedAfterMv A B n M` is invariant under `A[X₁, …, Xₙ]`-linear isomorphism of `M`.
- For `B = A`, `IsExtendedAfterMv A A n M` is `IsExtendedFrom A A[X₁, …, Xₙ] M`, through
  `A[X₁, …, Xₙ] ⊗[A[X₁, …, Xₙ]] M ≅ M`.
- For a `B`-algebra `C`, `IsExtendedAfterMv A B n M` implies `IsExtendedAfterMv A C n M`, through
  the associativity of base change, `C[X₁, …, Xₙ] ⊗ (B[X₁, …, Xₙ] ⊗ M) ≅ C[X₁, …, Xₙ] ⊗ M`.
- For `n = 0`, `IsExtendedAfterMv A B 0 M` always holds.
- For `n = 1`, `IsExtendedAfterMv A B 1 M` is `IsExtendedAfter A B M`, through `A[X₁] ≅ A[X]` and
  `B[X₁] ≅ B[X]`.

*Needs:* Mathlib `TensorProduct`, `LinearEquiv`, `Polynomial.algebra`,
`MvPolynomial.algebraMvPolynomial`, `Polynomial.evalRingHom`.

**Checks.**

- A free `A[X]`-module `A[X]ⁿ` is extended, with `N = Aⁿ`; `A[X] ⧸ (X)` is not when `A ≠ 0`: its
  `M(0)` is `A`, and `A[X] ⊗[A] A = A[X]`, on which `X` acts injectively, while it acts by `0`
  on `A[X] ⧸ (X)`.
- `A[X] ⧸ (X − 1)` has `M(0) = 0` (Convention 2) and is not extended when `A ≠ 0`; specialising at
  `X = 1` gives `A`, distinguishing this specialisation from `M(0) = 0`; the extension criterion
  at one also rejects `M`, since `A[X] ⊗[A] M(1) ≅ A[X]`.
- For `M = ℤ[X] ⧸ (2, X)`, `IsExtendedAfter ℤ (Localization.Away 2) M` holds (the base change is
  `0`), while `IsExtendedAfter ℤ (Localization.AtPrime (Ideal.span {2})) M` fails: the base change
  is `ℤ₍₂₎[X] ⧸ (2, X) = 𝔽₂` with `X` acting by `0`, its `M(0)` is `𝔽₂`, and
  `ℤ₍₂₎[X] ⊗ 𝔽₂ = 𝔽₂[X] ≠ 𝔽₂`, as in the first Check. At `(3)` it would hold, `2` being a unit
  of `ℤ₍₃₎` and the base change `0`.
- Over the zero ring `B`, `IsExtendedAfter A B M` holds for every `M`.
- `IsExtendedAfterMv A B 0 M` holds for every `M`: `MvPolynomial (Fin 0) B ≅ B`, so the base
  change `M′`, a `B`-module by restriction, is `MvPolynomial (Fin 0) B ⊗[B] M′`, with `N = M′`.
- For `M = ℤ[X, Y] ⧸ (2, X)` and `n = 2`, `IsExtendedAfterMv ℤ (Localization.Away 2) 2 M` holds:
  the base change is `ℤ[1/2][X, Y] ⧸ (2, X) = 0`.
- For the same `M`, `IsExtendedAfterMv ℤ (Localization.AtPrime (Ideal.span {2})) 2 M` fails: the
  base change is `ℤ₍₂₎[X, Y] ⧸ (2, X) = 𝔽₂[Y]`, with `X` acting by `0` and `Y` acting as `Y`; its
  value at `X = Y = 0` is `𝔽₂`, whose extension `𝔽₂[X, Y]` is not `𝔽₂[Y]`, and indeed `X` acts
  injectively on every `ℤ₍₂₎[X, Y] ⊗ N` and by `0` on this nonzero module. A map that also
  specialised a variable, `X ↦ 0`, would give `ℤ₍₂₎[X, Y] ⧸ (2) = 𝔽₂[X, Y]`, which is extended: the
  predicate changes the coefficients only.

### 3.2 Quillen's dilation lemma

Prove `exists_unit_lift_dilation`: let `R` be an `A`-algebra, not necessarily commutative, `f ∈ A`,
`R_f = A_f ⊗[A] R`, and `θ` a unit of `R_f[X]` with `θ(0) = 1`. Then there is `k ≥ 0` such that
for all `g₁, g₂ ∈ A` with `g₁ − g₂ ∈ fᵏA` some unit `ψ` of `R[X]` with `ψ(0) = 1` has image
`θ(g₁X) θ(g₂X)⁻¹` in `R_f[X]` (Quillen 1976, Lemma 1, pp. 167–168). Here `θ(gX)` is
`θ.eval₂ C (g • X)`, the substitution `X ↦ gX`, a ring endomorphism of `R_f[X]` because `g` is
central; the statement multiplies out the inverse, `ψ_f · θ(g₂X) = θ(g₁X)`. Route (Quillen): with
`θ = Σ aᵢXⁱ` and `θ⁻¹ = Σ bⱼXʲ`, the product `θ((Y + fʳZ)X) θ(YX)⁻¹` in `R_f[Y, Z, X]` is
`1 + ZX h`, where each coefficient of `h` is a sum of terms `fʳ aᵢ bⱼ` times integers and powers
of `fʳ`; for `r` large the `fʳ aᵢ bⱼ` come from `R`, which gives `φ ∈ 1 + ZX R[Y, Z, X]` with
this image, and likewise `φ′` for the inverse; `φφ′ − 1` and `φ′φ − 1` are killed by some `fˢ`,
so `φ(Y, fˢZ, X)` is a unit, and `k = r + s`, `ψ(X) = φ(g₂, fˢz, X)` for `g₁ = g₂ + fᵏz`.
*Needs:* Mathlib `Localization.Away`, `Algebra.TensorProduct.includeRight`, `Polynomial.eval₂`,
`Polynomial.map`, `Polynomial.coeff`.

**Checks.**

- `A = ℤ`, `R = Matrix (Fin 2) (Fin 2) ℤ`, `f = 2` and `θ = 1 + (X/2) E₁₂`, a unit with inverse
  `1 − (X/2) E₁₂` since `E₁₂² = 0`: `θ(g₁X) θ(g₂X)⁻¹ = 1 + ((g₁ − g₂)/2) X E₁₂`, which comes from
  `R[X]` exactly when `g₁ − g₂` is even, `R[X] → R_f[X]` being injective. So `k = 1` works
  (`g₁ = 2`, `g₂ = 0` give `ψ = 1 + X E₁₂`), and `k = 0` does not (`g₁ = 1`, `g₂ = 0`). The
  dilation cannot be dropped: `θ` itself does not come from `R[X]`.
- `f` a unit: `R → R_f` is bijective, `k = 0` works, and `ψ` is the preimage of
  `θ(g₁X) θ(g₂X)⁻¹`. `f = 0`: `A_f` and `R_f` are zero rings, and `ψ = 1` works for every `k`.
- The lemma must allow a noncommutative `R`: 3.3 applies it to `R = Module.End A N`, which for
  `N = ℤ²` over `ℤ` is the matrix ring of the first Check.

### 3.3 The Quillen ideal

Prove `exists_ideal_isExtendedAfter_away`: for a finitely presented `A[X]`-module `M`, there is an
ideal `I` of `A` with `a ∈ I` exactly when `IsExtendedAfter A (Localization.Away a) M` (Quillen
1976, proof of Theorem 1, p. 168; a different ideal with the same role, the `s` with `G(X + sY)`
equivalent to `G(X)` over `A[X, Y]` for a matrix `G`, is in Lombardi–Quitté, proof of XVI.3.6,
p. 909).
Route: closure under multiples is base change along `A_a → A_(ab)` (3.1). For sums, let `a` and `b`
satisfy the predicate and `c ∈ Aa + Ab`; after base change to `A_c` one may assume `Aa + Ab = A`.
Put `N = M(0)`, finitely presented over `A`, and `R = Module.End A N`. By 3.1 there are
isomorphisms `u_a : A_a[X] ⊗[A] N ≅ M_a` and `u_b : A_b[X] ⊗[A] N ≅ M_b`, which after composition
with the extension of their value at `X = 0` reduce to the identity at `X = 0`. Since `N` is
finitely presented, the `A_(ab)[X]`-linear endomorphisms of `A_(ab)[X] ⊗[A] N` form `R_(ab)[X]`,
and `θ = u_a⁻¹ u_b` is a unit of it with `θ(0) = 1`. Take `k` large enough for 3.2 over `A_a`,
with the algebra `R_a` and the element `b`, and over `A_b`, with `R_b` and `a`, and `g ∈ aᵏA` with
`1 − g ∈ bᵏA`. In `θ(X) = [θ(X) θ(gX)⁻¹] [θ(0X) θ(gX)⁻¹]⁻¹` the first factor comes from a unit
`ψ_a` of `R_a[X]` and the second from a unit `ψ_b` of `R_b[X]` (3.2), so `u_a ψ_a` and `u_b ψ_b`
agree over `A_(ab)` and glue to an isomorphism `A[X] ⊗[A] N ≅ M`.
*Needs:* 3.1, 3.2; Mathlib `Localization.Away`, `Module.FinitePresentation`, `Module.End`.

**Checks.**

- `0 ∈ I` always, since `Localization.Away 0` is the zero ring (3.1, Checks); and `I = ⊤` exactly
  when `M` itself is extended, `1` being a unit.
- For `A = ℤ` and `M = ℤ[X] ⧸ (2, X)`, `I = 2ℤ`: inverting an even `a` kills `M`, and after
  inverting an odd `a` the module is `𝔽₂` with `X` acting by `0`, not extended.
- For a nilpotent `a`, `Localization.Away a` is the zero ring, so the nilradical of `A` lies in
  `I`.

### 3.4 Quillen's patching theorem

Prove `isExtendedFrom_of_forall_isMaximal`: a finitely presented `A[X]`-module `M` such that
`IsExtendedAfter A (Localization.AtPrime m) M` holds for every maximal ideal `m` of `A` is extended
from `A` (Quillen 1976, Theorem 1, p. 168; Lombardi–Quitté, local-global principle XVI.3.7,
p. 909, with comaximal monoids). Route: by finite presentation, an isomorphism over `A_m` comes
from some `A_f`, `f ∉ m`, so the ideal of 3.3 is in no maximal ideal and is `⊤`.
*Needs:* 3.1, 3.3; Mathlib `Localization.AtPrime`, `Ideal.IsMaximal`.

**Checks.**

- For a local ring `A` with maximal ideal `m`, `Localization.AtPrime m` is isomorphic to `A`, and
  the statement is the identity.
- `M = ℤ[X] ⧸ (2, X)` is not extended at `(2)`, and indeed not extended; at the other maximal
  ideals `(p)` it becomes `0`.
- For the zero ring there is no maximal ideal and every module is extended.

### 3.5 Patching in several variables

Prove `isExtendedFrom_mvPolynomial_of_forall_isMaximal`: a finitely presented
`A[X₁, …, Xₙ]`-module that satisfies `IsExtendedAfterMv A (Localization.AtPrime m) n M` at every
maximal ideal `m` of `A` is extended from `A` (Quillen 1976, Theorem 1′, p. 169). Route: induction
on `n` through `A[X₁, …, Xₙ] ≅ A[X₁, …, Xₙ₋₁][Xₙ]`, applying 3.4 over `A[X₁, …, Xₙ₋₁]`.
*Needs:* 3.1, 3.4; Mathlib `MvPolynomial`.

**Checks.**

- `n = 0`: `MvPolynomial (Fin 0) A ≅ A`, and every module is extended from `A` with `N` itself.
- `n = 1` is 3.4, through `MvPolynomial (Fin 1) A ≅ A[X]`.
- The maximal ideals are those of `A`, not of `A[X₁, …, Xₙ]`: localising at a maximal ideal of
  the polynomial ring would not produce a polynomial ring over a local ring.

### Examples

- Over a field `k`, every finitely presented `k[X]`-module that is extended at the unique maximal
  ideal `0` of `k` is extended; the hypothesis is the conclusion, `k` being local.

### Dependencies

Mathlib only. Within the layer, 3.2 uses no other target; 3.3 uses 3.1 and 3.2; 3.4 uses 3.1 and
3.3; and 3.5 uses 3.1 and 3.4.

## Layer 4: monic inversion and Horrocks' theorem

### 4.1 The monic polynomials and `A⟨X⟩`

Define `monicSubmonoid A`, the submonoid of `A[X]` of monic polynomials (closed under products by
`Polynomial.Monic.mul`, containing `1`), and write `A⟨X⟩` for
`Localization (monicSubmonoid A)` (Quillen 1976, p. 169; Lombardi–Quitté, Notation XVI.4.2,
p. 912). Prove `isPrincipalIdealRing_monicLocalization`: if `k` is a principal ideal domain, so
is `k⟨X⟩`; and `isField_monicLocalization`: if `k` is a field, `k⟨X⟩` is a field (Quillen 1976,
Lemma 2, p. 169). Route: `k⟨X⟩` is a domain, the monic polynomials being nonzero
(`IsLocalization.isDomain_localization`). Its primes are the extensions of the primes of `k[X]`
containing no monic polynomial (`IsLocalization.orderIsoOfPrime`), so by
`IsPrincipalIdealRing.of_prime` it suffices that every such prime `Q` of `k[X]` is principal. If
`Q ∩ k = (p) ≠ 0`, then `Q = p k[X]`: otherwise `Q ⧸ p k[X]` is a nonzero prime of `(k ⧸ p)[X]`
over the field `k ⧸ p` and contains the image of a monic polynomial, whose monic lift lies in `Q`.
If `Q ≠ 0` and `Q ∩ k = 0`, then `Q · Frac(k)[X]` is generated by a primitive `f ∈ k[X]`
(`Polynomial.primPart`), and `Q = f k[X]` by Gauss's lemma
(`Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`). For a field, every nonzero
polynomial is a unit times a monic one.

The API:

- `A⟨X⟩` is a faithfully flat `A`-algebra (`Module.FaithfullyFlat`): `A[X]` is free over `A` and
  `A⟨X⟩` is a localisation of it, so `A⟨X⟩` is flat; and for a maximal ideal `m` of `A` the
  ideal `m[X]` contains no monic polynomial, its leading coefficient `1` not lying in `m`, so
  `m · A⟨X⟩ ≠ A⟨X⟩` (Lombardi–Quitté, Theorem VIII.6.1, items 1 and 3a, pp. 468–469).

*Needs:* Mathlib `Polynomial.Monic`, `Submonoid`, `Localization`, `IsPrincipalIdealRing`,
`IsPrincipalIdealRing.of_prime`, `IsLocalization.isDomain_localization`,
`IsLocalization.orderIsoOfPrime`, `Polynomial.primPart`,
`Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`, `IsField`, `Module.Flat`,
`Module.FaithfullyFlat`.

**Checks.**

- `X² + 2 ∈ monicSubmonoid ℤ` and `2X + 1 ∉ monicSubmonoid ℤ`; for a nonzero ring `0` is not
  monic, so `A⟨X⟩` is not the zero ring when `A` is not, as faithful flatness requires.
- In `ℤ⟨X⟩` the element `X` is a unit and `2` is not (Convention 4): `ℤ⟨X⟩` is a principal ideal
  domain strictly between `ℤ[X]` and `ℚ(X)`. Inverting all nonzero polynomials would give `ℚ(X)`,
  in which `2 · ℚ(X) = ℚ(X)` although `2ℤ ≠ ℤ`: that ring is flat over `ℤ` and not faithfully
  flat, and 4.2 with a field of fractions in place of `A⟨X⟩` would be false (4.2, Checks, second
  item).
- For a field `k`, `k⟨X⟩ = k(X)`, as `isField_monicLocalization` says; for `k[Y]`, `k[Y]⟨X⟩` is
  not a field (`Y` is not a unit: `Y · p = s` with `s` monic in `X` would make the leading
  coefficient of `s` divisible by `Y`).

### 4.2 Horrocks' theorem over a local ring

Prove `free_of_free_monicLocalization_of_isLocalRing`: for a local ring `A`, a finitely generated
projective `A[X]`-module `P` such that `A⟨X⟩ ⊗[A[X]] P` is free over `A⟨X⟩` is free
(Lombardi–Quitté, Theorem XVI.4.3, p. 912; for a local Noetherian `A`, in the form of a vector
bundle on the projective line, Horrocks 1964, Theorem 1, as cited by Quillen 1976, p. 169).
Route: `P` has constant rank `n`, `Spec A[X]` being connected. The monoid of monic polynomials and
`1 + m[X]` are comaximal, `m` the maximal ideal (Lombardi–Quitté, Lemma XVI.4.4, p. 912). Choose
`z ∈ P` that is part of a basis over `A⟨X⟩` and, modulo `m`, part of a basis over the principal
ideal domain `(A ⧸ m)[X]`; then `P ⧸ A[X] z` is projective, being free after both comaximal
localisations, and `P ≅ (P ⧸ A[X] z) ⊕ A[X]`, which by induction splits off free summands down to
rank one. A rank-one `P₁` with `A⟨X⟩ ⊗ P₁` free is stably isomorphic to `A[X]`, hence isomorphic
to it (Lombardi–Quitté, Lemma XVI.4.6, p. 913).
*Needs:* 4.1; Mathlib `IsLocalRing`, `Module.Projective`, `Module.Free`, `TensorProduct`.

**Checks.**

- For a field `A`, `A⟨X⟩` is a field and the hypothesis always holds; the conclusion is the
  freeness of finitely generated projective modules over the principal ideal domain `A[X]`.
- The monic localisation cannot be replaced by the field of fractions: for the local domain
  `A = k[t², t³]` localised at `(t², t³)`, which is not seminormal (`b = t³`, `c = t²` satisfy
  `b² = c³` and `t ∉ A`), there is a finitely generated projective `A[X]`-module of rank one that
  is not free (Lombardi–Quitté, Section XVI.2, p. 900, Traverso–Swan theorem), while every such
  module becomes free over the field `Frac(A)(X)`.
- Projectivity cannot be dropped: over the local ring `ℤ₍₂₎`, `P = ℤ₍₂₎[X] ⧸ (2, X)` is finitely
  generated with `ℤ₍₂₎⟨X⟩ ⊗ P = 0` (`X` is a unit there), free of rank `0`, while `P ≅ 𝔽₂` is a
  nonzero torsion module, not free.

### 4.3 The affine Horrocks theorem

Prove `isExtendedFrom_of_isExtendedFrom_monicLocalization`: a finitely generated projective
`A[X]`-module `P` such that `A⟨X⟩ ⊗[A[X]] P` is extended from `A` is extended from `A`
(Lombardi–Quitté, Theorem XVI.4.7, p. 914). Route: write `A⟨X⟩ ⊗[A[X]] P ≅ A⟨X⟩ ⊗[A] N`. This
module is finitely generated projective over `A⟨X⟩`, so `N` is finitely generated and flat over
`A` by descent along the faithfully flat `A → A⟨X⟩` (4.1;
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `Module.Flat.of_flat_tensorProduct`).
At a maximal ideal `m`, `N_m` is finitely generated and flat over the local ring `A_m`, hence free
(`Module.free_of_flat_of_isLocalRing`), so the base change of `P` to `A_m[X]` becomes free over
`A_m⟨X⟩`, a localisation of `A_m ⊗[A] A⟨X⟩`; by 4.2 it is free, hence extended. `P` is finitely
presented (`Module.finitePresentation_of_projective`), and 3.4 concludes.
*Needs:* 3.1, 3.4, 4.1, 4.2; Mathlib `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`,
`Module.Flat.of_flat_tensorProduct`, `Module.free_of_flat_of_isLocalRing`,
`Module.finitePresentation_of_projective`.

**Checks.**

- Over the sphere ring `R` of 1.1, `P = R[X] ⊗[R] K` is extended and not free: the conclusion is
  extension, not freeness.
- For a local `A`, extended finitely generated projective modules are free, and 4.3 recovers 4.2.
- For `A` a field, every finitely generated projective `A[X]`-module is free, hence extended, and
  both hypothesis and conclusion hold.

### 4.4 Isomorphism over `A⟨X⟩`

Prove `nonempty_linearEquiv_of_monicLocalization`: finitely generated projective `A`-modules `P`
and `Q` with `A⟨X⟩ ⊗[A] P ≅ A⟨X⟩ ⊗[A] Q` over `A⟨X⟩` are isomorphic (Lombardi–Quitté, Theorem
XVI.4.8, p. 915). Route (Lombardi–Quitté, proof of Theorem XVI.4.8, p. 915): write `P ≅ Im F` and
`Q ≅ Im G` for idempotent matrices `F, G ∈ Mₙ(A)`, enlarged by zero blocks so that the
isomorphism over `A⟨X⟩` is a conjugation by an elementary matrix (Lombardi–Quitté, enlargement
lemma V.2.10, p. 253); clearing a monic common denominator `s` gives `H ∈ Mₙ(A[X])` with
`HF = GH` and monic determinant `sⁿ`. With `Y = 1/X` and `d` the largest degree of an entry of
`H`, `H′ = Yᵈ H(1/Y)` lies in `Mₙ(A[Y])`, satisfies `H′F = GH′` and has determinant `Yʳ h` with
`h(0) = 1`; so `H′` is invertible over `A[Y]_(Yh)` and identifies `A[Y]_(Yh) ⊗[A] P` with
`A[Y]_(Yh) ⊗[A] Q`. Since `h` is a unit modulo every `Yᵐ` and `Y` is a nonzerodivisor of `A[Y]`
and of `A[Y]_h`, `(A[Y] → A[Y]_h, Y)` is a glueing pair (RelativeFarguesFontaine §6.4), and
RelativeFarguesFontaine §6.5 glues `A[Y]_Y ⊗[A] P` and `A[Y]_h ⊗[A] Q` along this identification
to a finitely generated projective `A[Y]`-module `M`; both pieces are finitely generated, hence
small in the universe of `A` (`Module.Finite.small`), and §6.5 is applied to their `Shrink`
copies. The monic `Y` is a unit of `A[Y]_Y`, so `A⟨Y⟩` is a localisation of `A[Y]_Y` and
`A⟨Y⟩ ⊗[A[Y]] M ≅ A⟨Y⟩ ⊗[A] P` is extended from `A`; by 4.3 over `A[Y]`, `M ≅ A[Y] ⊗[A] N` for
an `A`-module `N`, so `M(1) ≅ N ≅ M(0)`. Evaluation at `Y = 1` factors through `A[Y]_Y`, and
evaluation at `Y = 0` through `A[Y]_h` since `h(0) = 1`; hence `P ≅ M(1) ≅ M(0) ≅ Q`.
*Needs:* 4.1, 4.3; RelativeFarguesFontaine §6.4, §6.5; Mathlib `Module.Projective`,
`TensorProduct`, `Localization.Away`, `Module.Finite.small`, `Shrink.linearEquiv`.

**Checks.**

- `P = Q` is trivial; for `A` a field, both sides compare dimensions.
- Over `A = ℤ[√−5]`, the ideal `𝔞 = (2, 1 + √−5)` is projective of rank one and not free; by 4.4
  it stays non-isomorphic to `A` over `A⟨X⟩`: the map `Pic A → Pic A⟨X⟩` is injective.
- With `A[X]` in place of `A⟨X⟩` the statement is immediate, by the retraction `X ↦ 0`; the ring
  `A⟨X⟩` has no ring map back to `A` over `A` when `A ≠ 0` (it would send the unit `X` to a unit
  `c` and the unit `X − c` to `0`), and 4.4 is the statement that the base change still reflects
  isomorphism.
- The route needs a monic determinant. For `A = ℤ`, `P = Q = ℤ`, `F = G = (1)` and `H = (X + 2)`,
  `H′ = 1 + 2Y = h` is comaximal with `Y` (`h − 2Y = 1`), and the glued module is
  `{(a, h a) : a ∈ ℤ[Y]_Y ∩ ℤ[Y]_h = ℤ[Y]}`, free of rank one with `M(1) = M(0) = ℤ`. For
  `H = (2X + 1)`, which is not a unit of `ℤ⟨X⟩` (Convention 4), `Y H(1/Y) = 2 + Y` and
  `(Y, 2 + Y) = (Y, 2)` is not the unit ideal, so the two localisations do not cover
  `Spec ℤ[Y]` and no gluing is available.

### 4.5 Horrocks' theorem in Quillen's form

Prove `free_of_free_monicLocalization`: for any commutative ring `A`, a finitely generated
projective `A[X]`-module `P` such that `A⟨X⟩ ⊗[A[X]] P` is free over `A⟨X⟩` is free (Quillen 1976,
Theorem 3, p. 169). Route: `A⟨X⟩ ⊗[A[X]] P ≅ A⟨X⟩ ⊗[A] Aʳ` is extended, so by 4.3
`P ≅ A[X] ⊗[A] P(0)`; then `A⟨X⟩ ⊗[A] P(0) ≅ A⟨X⟩ ⊗[A] Aʳ`, and 4.4 gives `P(0) ≅ Aʳ`, so
`P ≅ A[X]ʳ`. Quillen's own route glues `P` with a trivial bundle on the projective line; the
route here needs no projective line.
*Needs:* 4.3, 4.4; Mathlib `Module.Projective`, `Module.Free`, `TensorProduct`.

**Checks.**

- For a field `A`, `A⟨X⟩` is a field and the hypothesis always holds; the conclusion is the
  freeness of finitely generated projective modules over the principal ideal domain `A[X]`.
- Over the sphere ring `R` of 1.1, the extended module `R[X] ⊗[R] K` is not free (its value at
  `X = 0` is `K`), so by 4.5 it is not free over `R⟨X⟩` either: the hypothesis of 4.5 is not
  automatic for extended modules.
- Over the zero ring every module is zero, hence free, and both sides hold; the statement needs no
  locality, which 4.2 assumes.

### Examples

- `ℤ⟨X⟩` is a principal ideal domain (4.1) over which every finitely generated projective module
  is free; by 4.5 every finitely generated projective `ℤ[X]`-module is free.

### Dependencies

Layer 3; RelativeFarguesFontaine §6.4 and §6.5 (in 4.4); Mathlib. Within the layer, 4.2 uses
4.1; 4.3 uses 4.1, 4.2 and 3.4; 4.4 uses 4.1 and 4.3; and 4.5 uses 4.3 and 4.4.

## Layer 5: unimodular polynomial vectors and the Quillen–Suslin theorem

### 5.1 Unimodular polynomial vectors

Prove `exists_mulVec_eq_eval_zero`: let `f : Fin n → A[X]` be unimodular (its entries generate the
unit ideal) and let `d : Fin n → ℕ` be formal degrees, `natDegree (f i) ≤ d i`, such that the
coefficients `coeff (f i) (d i)` generate the unit ideal of `A`; then some `g : GL (Fin n) A[X]`
has `g.mulVec f = i ↦ C (eval 0 (f i))` (Lombardi–Quitté, Little Horrocks' global theorem
XVI.5.15, p. 924, stated there for `n ≥ 2`; Lang, Algebra, Section XXI.3, whose Theorem 3.4 is the
form cited by Kedlaya, proof of Proposition 6.4, p. 14). Route: for `n = 2` an explicit matrix;
for `n ≥ 3`, the local case by elementary operations lowering the degree of a monic entry
(Lombardi–Quitté, Theorem XVI.5.14, p. 923; over `A_m` an entry whose formal leading coefficient
is a unit is made monic by a diagonal matrix), then a patching derived from 3.4: the local
equivalences make `M = A[X]ⁿ ⧸ A[X] f` extended at every maximal ideal, `M` is finitely generated
projective since `A[X] f` is a free direct summand of rank one, so by 3.4 and 3.1
`M ≅ A[X] ⊗[A] (Aⁿ ⧸ A f(0)) ≅ A[X]ⁿ ⧸ A[X] f(0)`; both are quotients of `A[X]ⁿ` by a free
direct summand of rank one, so this isomorphism and `f ↦ f(0)` combine to some
`g : GL (Fin n) A[X]` with `g.mulVec f = f(0)`.
*Needs:* 3.1, 3.4; Mathlib `Polynomial.coeff`, `Polynomial.natDegree`, `Polynomial.eval`,
`Polynomial.C`, `Matrix.mulVec`, `Matrix.GeneralLinearGroup`.

**Checks.**

- `n = 1`: `f 0` is a unit of `A[X]`, so `eval 0 (f 0)` is a unit of `A` and `g` is
  `C (eval 0 (f 0)) · (f 0)⁻¹`; the case `n = 0` is empty. The statement therefore needs no
  `n ≥ 2`.
- `n = 2`, `A = ℤ`, `f = (X², 1 + X)`, `d = (2, 1)`: `(1 − X)(1 + X) + X² = 1`, so
  `!![1, 1 − X; −(1 + X), X²]`, of determinant `1`, sends `f` to `(1, 0)`, and `!![0, −1; 1, 0]`
  sends `(1, 0)` to `f(0) = (0, 1)`.
- The conclusion is `f(0)`, not `(1, 0, …, 0)`: over the sphere ring `R` of 1.1, the constant
  vector `(x, y, z)` with `d = 0` satisfies the hypotheses and equals its value at `0`, but is not
  completable.

### 5.2 The Quillen–Suslin theorem

Prove `free_mvPolynomial`: over a principal ideal domain `k`, every finitely generated projective
`k[X₁, …, Xₙ]`-module is free (Quillen 1976, Theorem 4, p. 169; Suslin 1976; for a field,
Lombardi–Quitté, Corollary XVI.5.3, p. 918). Route (Quillen): induction on `n`, for all
principal ideal domains in the universe of `k` at once and for modules in that universe, which
suffices because a finitely generated module is isomorphic to a quotient of some
`Fin r → k[X₁, …, Xₙ]` and freeness is invariant under linear isomorphism. With
`A = k[X₁, …, Xₙ₋₁]` and `T = Xₙ`, put `B = k⟨T⟩[X₁, …, Xₙ₋₁] ≅ k⟨T⟩ ⊗[k[T]] A[T]`, a polynomial
ring in `n − 1` variables over the principal ideal domain `k⟨T⟩` (4.1). By induction
`B ⊗[A[T]] P` is free over `B`. The ring `B` is the localisation of `A[T]` at the monic
polynomials of `k[T]`, which are monic in `A[T]`, so `A⟨T⟩` is a localisation of `B`, and
`A⟨T⟩ ⊗[A[T]] P ≅ A⟨T⟩ ⊗[B] (B ⊗[A[T]] P)` is free; 4.5 concludes. Quillen's proof (p. 169)
writes `A ⊗[k[T]] k(T)` for `B`, `k(T)` being his notation for `k⟨T⟩`; the left factor must be
`A[T]`.
*Needs:* 4.1, 4.5; Mathlib `MvPolynomial`, `IsPrincipalIdealRing`,
`Module.free_of_finite_type_torsion_free'` for `n = 0`.

**Checks.**

- `n = 0`: finitely generated projective modules over a principal ideal domain are free.
- `n = 1`, `k = 𝔽₂`: `A = 𝔽₂` and `B = 𝔽₂⟨T⟩ = 𝔽₂(T)`, a field, over which `B ⊗[𝔽₂[T]] P` is
  free. The ring `A ⊗[k[T]] k⟨T⟩`, for `A = 𝔽₂` made a `k[T]`-algebra by `T ↦ 0`, is `0`, since
  `T` is a unit of `k⟨T⟩`: the left factor of `B` must be `A[T]`.
- The coefficient ring cannot be a Dedekind domain that is not principal: over `ℤ[√−5]` the ideal
  `𝔞` of 4.4 gives the non-free projective module `𝔞[X₁, …, Xₙ]` (extended, 5.3).
- The ring must be a polynomial ring: the sphere ring `R` of 1.1, a quotient of `ℝ[x, y, z]`,
  carries the non-free projective module `K`.

### 5.3 Dedekind domains

Prove `isExtendedFrom_mvPolynomial`: over a Dedekind domain `B`, every finitely generated
projective `B[X₁, …, Xₙ]`-module is extended from `B` (Quillen 1976, Theorem 4′, p. 170). Route:
at each maximal ideal `m`, `B_m` is a principal ideal domain: a field when `m = 0`, which happens
exactly when `B` is a field, and a discrete valuation ring otherwise
(`IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`). By 5.2 the base change of
`P` to `B_m[X₁, …, Xₙ]` is free, hence extended, and 3.5 concludes, `P` being finitely presented
(`Module.finitePresentation_of_projective`).
*Needs:* 3.5, 5.2; Mathlib `IsDedekindDomain`, `IsDiscreteValuationRing`,
`IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`,
`Module.finitePresentation_of_projective`.

**Checks.**

- For a principal ideal domain, extended from `B` means free (finitely generated projective
  `B`-modules being free), and 5.3 recovers 5.2.
- Over `ℤ[√−5]`, `𝔞[X₁, …, Xₙ]` is extended and not free.
- Fields are admitted: `B = 𝔽₂` satisfies `IsDedekindDomain`, its only maximal ideal is `m = 0`,
  and `B_m = 𝔽₂` is a field, a principal ideal domain that is not a discrete valuation ring; the
  route goes through 5.2 over `𝔽₂`, and every finitely generated projective
  `𝔽₂[X₁, …, Xₙ]`-module is free, hence extended.
- Normality cannot be dropped: over `k[t², t³]`, which is a one-dimensional Noetherian domain and
  not seminormal, some rank-one projective module over the ring with one variable is not extended
  (Lombardi–Quitté, Section XVI.2, p. 900).

### 5.4 Suslin's completion theorem

Prove `exists_generalLinearGroup_col_eq_of_isUnimodular`: over a principal ideal domain `k`, every
`v : Fin (m + 1) → k[X₁, …, Xₙ]` with `Module.IsUnimodular` is the first column of some
`g : GL (Fin (m + 1)) k[X₁, …, Xₙ]` (Lombardi–Quitté, Theorem XVI.5.5, p. 920, for a field;
Suslin 1976). Route: by 5.2 every finitely generated stably free `k[X₁, …, Xₙ]`-module, being
projective, is free, so PadicDifferentialEquationsAndRigidCohomology §RD.0.56 (b) gives some
`h : GL` with `h.mulVec v = Pi.single 0 1`, and `g = h⁻¹` has first column `v`.
*Needs:* 5.2; PadicDifferentialEquationsAndRigidCohomology §RD.0.56; Mathlib
`Module.IsUnimodular`, `Matrix.GeneralLinearGroup`.

**Checks.**

- `n = 0`: over a principal ideal domain every finitely generated stably free module is free
  (`Module.free_of_finite_type_torsion_free'`); over `ℤ`, `(2, 3)` is the first column of
  `!![2, 1; 3, 2]`, of determinant `4 − 3 = 1`, while `(2, 4)` is not unimodular.
- `m = 0`: `(a)` is unimodular exactly when `a` is a unit, and is then the `1 × 1` matrix `(a)`;
  requiring `g` in `SL` instead of `GL` would fail at `a = −1` over `ℤ`, since `SL₁(ℤ) = {1}`.
- `(1 + X, X)` over `ℤ[X]` is the first column of `!![1 + X, 1; X, 1]`, of determinant
  `(1 + X) − X = 1`; `(x, y, z)` over the sphere ring of 1.1 is not the first column of an
  invertible matrix: the polynomial ring cannot be replaced by a quotient.

### Examples

- Every finitely generated projective module over `ℤ[X₁, …, Xₙ]` and over `k[X₁, …, Xₙ]` for a
  field `k` is free (5.2).
- Over `k[X, Y]` for a field `k`, the vector `(1 + XY, X², Y²)` is unimodular, since
  `(1 − XY)(1 + XY) + Y² · X² = 1`, and is the first column of an invertible matrix by 5.4; a
  vector with an entry equal to `1` is one by a permutation followed by elementary matrices, the
  simplest instance.

### Dependencies

Layers 3 and 4; PadicDifferentialEquationsAndRigidCohomology §RD.0.56; Mathlib. Within the layer,
5.3 uses 5.2 and 3.5, 5.4 uses 5.2, and 5.1 uses 3.1 and 3.4.

## Downstream consumers

The results supply freeness and extension criteria for algebraic vector bundles on affine spaces.

## Research context

Serre asked whether finitely generated projective modules over `k[X₁, …, Xₙ]` are free (Serre 1955,
p. 243, as located by Quillen 1976, p. 167). Quillen (1976, Theorem 4, p. 169) and Suslin (1976)
answered the question independently (Quillen 1976, note added in proof, p. 171; Lombardi–Quitté,
Bibliographic comments to Chapter XVI, p. 941), and Lam (2006, Chapter III) recounts the history
(Lombardi–Quitté, *loc. cit.*). Beyond polynomial rings stable freeness is weaker than freeness: the
tangent bundle of the real 2-sphere gives a stably free module that is not free (1.1, Checks;
Fasel–Rao–Swan, Introduction, p. 1). Over an affine algebra of dimension `d` over an algebraically
closed field, projective modules of rank `d` are cancellative, so stably free modules of rank at
least `d` are free (Suslin 1977, as recalled by Fasel–Rao–Swan, Introduction, p. 1); Mohan Kumar
(1985) constructed smooth affine varieties of dimension `d` over an algebraically closed field with
stably free non-free modules of rank `d − 2` (Fasel–Rao–Swan, Introduction, p. 2); and over a normal
affine algebra of dimension `d` over an algebraically closed field `k` with
`gcd((d − 1)!, char k) = 1`, smooth if `d = 3`, stably free modules of rank `d − 1` are free
(Fasel–Rao–Swan, Theorem 7.5, p. 14).

The Bass–Quillen conjecture (Bass 1973, §4.1, problem IX; Quillen 1976, Comments (1), p. 170) asks
whether, for a regular Noetherian ring `A`, every finitely generated projective `A[T]`-module is
extended from `A`; by 3.4 this is equivalent to the freeness of every finitely generated projective
`A[T]`-module for a regular local ring `A` (Quillen 1976, Comments (1′), p. 170). It holds when
`dim A ≤ 2` (Quillen 1976, p. 170, citing Horrocks 1964 and Murthy 1966), for regular rings
essentially of finite type over a field (Lindel 1981, Theorem, p. 319), and, through Popescu's
desingularization theorem (Popescu 1986, 1990; exposition in Swan 1998), whenever every local ring
of `A` at a maximal ideal is unramified, in particular when `A` contains a field (Česnavičius 2022,
Theorem 5.2.2, p. 36, with Definition 1.4.1, p. 10, and Theorem 1.4.5, p. 11). It is open for
ramified regular local rings (Česnavičius 2022, §2.1.2, p. 13). Over an arithmetic ring, a valuation
ring for instance, every finitely generated projective module over the polynomial ring in `n`
variables is extended (Lequain–Simis 1980; Lombardi–Quitté, Corollary XVI.6.15 and Theorem XVI.6.16,
p. 936). For Zariski locally trivial torsors under a totally isotropic reductive group defined over
an infinite field `k`, over a smooth `k`-algebra, the analogue is proved with A¹-homotopy theory
(Asok–Hoyois–Wendt 2018, Theorem 3.3.7, as cited by Česnavičius 2022, §3.6.4 (2), p. 27). Quillen's
local question asks whether, for a regular local ring `R` with maximal ideal `m` and `f ∈ m ∖ m²`,
every finitely generated projective `R_f`-module is free (Quillen 1976, Comments (2), p. 170); it
implies the conjecture (Česnavičius 2022, §2.2, p. 13), it is known in equal characteristic and in
dimension at most 3, and it is open in mixed characteristic (Česnavičius 2022, §2.2.2, p. 14).
Quillen's global form of it (Comments (3), p. 170) is false (Swan 1978, §2, as cited by Česnavičius
2022, §2.2.3 (3), p. 14; Quillen 1976, note added in proof, p. 171).

A ring is Hermite when its finitely generated stably free modules are free, equivalently when every
unimodular vector over it is the first column of an invertible matrix (Lombardi–Quitté, Chapter XVI,
Conclusion: a few conjectures, p. 936). The Hermite ring conjecture, that `A[X]` is Hermite whenever
`A` is (*ibid.*), is equivalent to asking that, for every commutative ring `A`, every stably free
`A[X]`-module be extended from `A`, and a preprint claims a commutative ring `A` with a stably free
`A[X]`-module that is not extended (Schäppi 2023, arXiv:2311.04104v1, Theorem 1.1 and the paragraph
before it, p. 1).

## References

- D. Quillen, « Projective modules over polynomial rings », *Invent. Math.* 36 (1976), 167–171.
  doi:10.1007/BF01390008. GDZ: PPN356556735_0036.
- A. A. Suslin, « Projective modules over polynomial rings are free », *Dokl. Akad. Nauk SSSR* 229
  (1976), no. 5, 1063–1066; *Soviet Math. Dokl.* 17 (1976), 1160–1164.
- A. A. Suslin, « On stably free modules », *Mat. Sb.* 102(144) (1977), no. 4, 537–550;
  *Math. USSR Sb.* 31 (1977), no. 4, 479–491. doi:10.1070/SM1977v031n04ABEH003717.
- G. Horrocks, « Projective modules over an extension of a local ring », *Proc. London Math.
  Soc.* (3) 14 (1964), 714–718. doi:10.1112/plms/s3-14.4.714.
- H. Lombardi, C. Quitté, *Commutative Algebra: Constructive Methods. Finite Projective Modules*,
  Algebra and Applications 20, Springer, 2015. doi:10.1007/978-94-017-9944-7. arXiv:1605.04832
  (page numbers of the arXiv version).
- S. Lang, *Algebra*, third edition, Addison-Wesley, 1993; revised third edition, Graduate Texts
  in Mathematics 211, Springer, 2002. doi:10.1007/978-1-4613-0041-0.
- K. S. Kedlaya, « Full faithfulness for overconvergent F-isocrystals », in *Geometric Aspects of
  Dwork Theory*, de Gruyter, 2004, 819–835. arXiv:math/0110125 (page numbers of the arXiv
  version).
- R. G. Swan, « Vector bundles and projective modules », *Trans. Amer. Math. Soc.* 105 (1962),
  264–277. doi:10.1090/S0002-9947-1962-0143225-6.
- R. G. Swan, J. Towber, « A class of projective modules which are nearly free », *J. Algebra* 36
  (1975), 427–434. doi:10.1016/0021-8693(75)90143-X.
- H. Lindel, « On the Bass–Quillen conjecture concerning projective modules over polynomial
  rings », *Invent. Math.* 65 (1981), 319–323. doi:10.1007/BF01389017.
- T. Y. Lam, *Serre's Problem on Projective Modules*, Springer Monographs in Mathematics, Springer,
  2006. doi:10.1007/978-3-540-34575-6.
- J.-P. Serre, « Faisceaux algébriques cohérents », *Ann. of Math.* (2) 61 (1955), 197–278.
  doi:10.2307/1969915.
- M. P. Murthy, « Projective A[x]-modules », *J. London Math. Soc.* 41 (1966), 453–456.
  doi:10.1112/jlms/s1-41.1.453.
- H. Bass, « Some problems in "classical" algebraic K-theory », in *"Classical" Algebraic
  K-Theory, and Connections with Arithmetic*, Lecture Notes in Mathematics 342, Springer, 1973,
  1–73. doi:10.1007/BFb0073718.
- N. Mohan Kumar, « Stably free modules », *Amer. J. Math.* 107 (1985), no. 6, 1439–1444.
  doi:10.2307/2374411.
- J. Fasel, R. A. Rao, R. G. Swan, « On stably free modules over affine algebras », *Publ. Math.
  IHÉS* 116 (2012), 223–243. doi:10.1007/s10240-012-0041-y. arXiv:1107.1051v2 (page numbers of
  this arXiv version).
- D. Popescu, « General Néron desingularization and approximation », *Nagoya Math. J.* 104
  (1986), 85–115. doi:10.1017/S0027763000022698. Letter to the editor, *ibid.* 118 (1990),
  45–53. doi:10.1017/S0027763000002981.
- R. G. Swan, « Néron–Popescu desingularization », in *Lectures in Algebra and Geometry*
  (Taipei, 1995), International Press, Cambridge, MA, 1998, 135–192. Zbl 0954.13003.
- Y. Lequain, A. Simis, « Projective modules over R[X₁, …, Xₙ], R a Prüfer domain », *J. Pure
  Appl. Algebra* 18 (1980), 165–171. doi:10.1016/0022-4049(80)90127-9.
- R. G. Swan, « Projective modules over Laurent polynomial rings », *Trans. Amer. Math. Soc.* 237
  (1978), 111–120. doi:10.1090/S0002-9947-1978-0469906-4.
- K. Česnavičius, « Problems about torsors over regular rings », *Acta Math. Vietnam.* 47 (2022),
  39–107. doi:10.1007/s40306-022-00477-y. arXiv:2201.06424v4 (page numbers of this arXiv
  version).
- A. Asok, M. Hoyois, M. Wendt, « Affine representability results in A¹-homotopy theory, II:
  principal bundles and homogeneous spaces », *Geom. Topol.* 22 (2018), 1181–1225.
  doi:10.2140/gt.2018.22.1181.
- D. Schäppi, « A counterexample to the Hermite ring conjecture », preprint, 2023.
  arXiv:2311.04104v1.
