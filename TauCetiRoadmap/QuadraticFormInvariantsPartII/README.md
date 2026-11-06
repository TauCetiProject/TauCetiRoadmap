# Roadmap: quadratic forms and cohomological invariants, Part II

**Summary.** This roadmap continues `QuadraticFormInvariants` past the point where it stops: the
characteristic-two theory of nonsingular quadratic forms, the deep theory of Pfister forms, and the
cohomological invariants of quadratic forms in every degree. Starting from Tau Ceti's Witt ring and
Pfister classes (for `2` invertible) and Mathlib's quadratic maps, it builds, in every
characteristic, the module structure of the quadratic Witt group over the bilinear Witt ring and its
filtration
`I_qⁿ = I_bⁿ⁻¹ · I_q`, the quadratic Pfister forms `quadraticPfister`, their roundness and the
equivalence of isotropy with hyperbolicity, polynomial representation (Cassels–Pfister), Springer's
odd-degree theorem, transfer and the similarity theorems, the function field of a quadric and the
subform theorem, and the Arason–Pfister Hauptsatz. It then builds the graded invariants: the Milnor
conjecture for the Witt ring in characteristic different from two (Morel), Kato's comparison with
the groups of logarithmic differential forms in characteristic two, the invariant `eₙ` of a
nonsingular Pfister form and the criterion that `eₙ(ρ) = 0` exactly when `ρ` is isotropic. The last part applies this to
henselian valued fields of finite Kronecker dimension: unit reduction and the independent-value
criterion, `C_i` fields and the Tsen–Lang theorem, Jannsen's Hasse principle in the degree needed,
and Dittmann–Pop's theorem that a unit Pfister form of fold `dim(K) + 1` over a henselian field is
isotropic as soon as it is isotropic at the real closures of the constant field; it ends with the
patch openness of henselian isotropy loci in the valuation spectrum. The end theorems are the
Hauptsatz, the invariant-zero criterion, the three parts of Dittmann–Pop's Proposition 3.2 (the
principal-unit criterion, the independent-value criterion with unit reduction as its case without
values, and the dimension theorem) and the openness theorem.

## Scope and ownership

`QuadraticFormInvariants` works throughout with `2` invertible and excludes three things that this
roadmap owns: the characteristic-two theory of quadratic and bilinear forms; the deep theory of
Pfister forms (roundness in every fold, function-field methods, the Arason–Pfister Hauptsatz, the
Milnor conjecture and the classification statements resting on them); and graded mod-two Galois
cohomology in every degree (its Layers 7–9 work in degrees `1` and `2`). Its Layer 4 is where it
stops: the Witt ring, the fundamental ideal, Pfister forms in every fold with additive generation of
`Iⁿ` for `n ≥ 1`, roundness for `n ≤ 2` and the two-fold isotropy criterion, all from Tau Ceti.

This roadmap owns:

- in characteristic two: binary nonsingular blocks, the coordinate scalar extension of quadratic
  forms, Witt decomposition and cancellation for nonsingular forms, the product on the bilinear Witt
  ring `W_b(F)`, the `W_b(F)`-module structure on the quadratic Witt group `I_q(F)` and the
  filtration `I_qⁿ(F)` (Layer 0);
- quadratic Pfister forms in every characteristic, their roundness in every fold and the
  equivalence of isotropy, hyperbolicity and vanishing of the Witt class (Layer 1);
- pure-transcendental anisotropy, the Cassels–Pfister and representation theorems, the
  characteristic-two extension of Scharlau transfer to Witt groups, Springer's theorem, the
  similarity norm principle, odd-divisor specialization, the quadratic similarity theorem, the
  function field of a quadric, the subform theorem and the Arason–Pfister Hauptsatz, in every
  characteristic (Layer 2);
- the coefficient groups `H_qⁿ(F)` of the quadratic invariants, including Kato's group in
  characteristic two; the Milnor homomorphism, its bijectivity in degrees at most two and over the
  prime fields, and Morel's proof that it is injective in every degree; Kato's bilinear and
  quadratic comparisons in characteristic two; the invariant `eₙ` of nonsingular Pfister forms, its
  naturality and the invariant-zero criterion (Layer 3);
- unit reduction, the principal-unit criterion and the independent-value criterion over henselian
  valued fields of arbitrary rank (Layer 4);
- `C_i` fields, the projective dimension theorem in the form used for systems of forms, finite
  fields as `C₁` fields, the Lang–Nagata theorem on systems, algebraic extensions, the Tsen–Lang
  theorem, the Kronecker dimension with its strict drop under nontrivial valuations, and
  isotropy of long unit Pfister forms in positive residue characteristic (Layer 5);
- the extension of order-preserving embeddings to a real closure and the uniqueness of real closures,
  coefficient fields of equicharacteristic-zero henselian fields, the cohomological-dimension bound
  after a nonreal local base change, Jannsen's Hasse principle for `ℤ/2` coefficients, the finite
  descent of the real-place condition and Dittmann–Pop's dimension theorem (Layer 6);
- patch openness of henselian embedding and isotropy loci in the valuation spectrum (Layer 7).

It leaves to named owners, and imports:

- `QuadraticFormInvariants` Layer 1 (hyperbolic planes, Witt decomposition, cancellation and
  extension with `2` invertible), Layer 4 (the Witt ring, the fundamental ideal, Pfister forms,
  the generation of `Iⁿ` and the signature `W(ℝ) ≅ ℤ`), Layer 7A (the `μ₂` adapters and Kummer
  classes), Layer 7B (the comparison of quaternion classes with `H²`) and Layer 9 (Scharlau transfer);
- `ProfiniteCohomology` Layer 10 (continuous cohomology in all degrees, with restriction and
  conjugation), Layer 11 (cohomological dimension) and Layer 12 (the graded cup product);
- `ClassFieldTheory` Layer 6 (`cd_ℓ G_K = 2` for a finite extension `K` of `ℚ_p`);
- `AdicSpaces` Layer 1 (the valuation spectrum and its patch topology);
- `RealAlgebraicGeometry` Layer 1 (existence of a real closure of an ordered field, realized by Tau
  Ceti's `TauCeti.RealClosure.exists_realClosure`); the uniqueness of real closures, which that
  roadmap does not state, is 6.0 here;
- `SchemeAndStackFoundations` §§0.12–0.14 (henselization of pairs, henselian pairs and Elkik's
  smooth lifting), §2.11 (the Artin–Schreier sequence), §2.15 (étale and Galois cohomology of a
  field, limits, Hochschild–Serre) and §2.16 (Tsen's theorem in transcendence degree one over an
  algebraically closed field, with `Br = 0`; Layer 5 here proves the general Tsen–Lang bound
  `C_i ⇒ C_{i+t}` by another route, and agrees with it at `i = 0, t = 1`);
- `LocalFieldsRamificationPartII` §GF.1 (the henselization of a valued field), §GF.4 (rank-one
  Krasner approximation and decompletion) and §GF.5 (the Abhyankar inequality);
- `GeometryOfNumbersAndQuadraticArithmetic` §6.4 (the Witt group `ExactW0` of symmetric spaces in an
  exact category with duality, which over a field of characteristic two is the additive group of
  `W_b(F)`; Layer 0 adds the product and the fundamental ideal);
- `HermitianKTheoryOfPoincareCategories` §3.4 (the Witt group of projectives `W(Proj(R); Q)`,
  nonsingular forms modulo strictly metabolic ones), §4.5 (for the quadratic Poincaré structure it is
  the classical Witt group of quadratic forms) and §7.9 (over a field of characteristic two this is
  the Witt group `W^q(F)` of nonsingular quadratic forms): Layer 0 takes `I_q(F)` to be this group in
  characteristic two and adds the module structure and the filtration. The comparison of `Wq(R)`
  and `Ws(R)` over commutative and Dedekind rings, through the full polar form, belongs to
  `GeometryOfNumbersAndQuadraticArithmeticPartII` §0.1 (Integral Witt comparison); it does not enter
  the diagonal comparison of 0.5;
- `K2SymbolsBrauer` §§5.4–5.8 (Milnor K-theory of a field and its functoriality), §5.12 (Milnor
  K-theory of finite fields), Layer 9 (residues) and Layer 10 (the Bass–Tate sequence, Milnor norms
  and, §10.32, Milnor K-theory of number fields in degrees at least three);
- `KTheoryFiniteLocalFields` §3.0 (the inverse Cartier operator on the Kähler forms of a field of
  characteristic `p`, the logarithmic forms `ν_F(n)` and the Bloch–Gabber–Kato isomorphism
  `blochGabberKato`) and §3.0a (the norm-residue isomorphism and the motivic–étale comparison
  `ℤ/m(i) ≃ τ_{≤i} Rε_* μ_m^{⊗i}`);
- `MotivesAndAlgebraicCycles` §0.5b (Gersten residues and the coniveau spectral sequence), §§4.1–4.6
  (presheaves with transfers, Nisnevich descent, the Suslin–Voevodsky motivic complexes, strict
  homotopy invariance and the effective derived category) and §4.14 (equidimensional cycles);
- `ClassicalAdicEtaleCohomology` §11.2 (`field_cohomological_dimension_transcendence`:
  `cd_ℓ(L) ≤ cd_ℓ(K) + trdeg_K L`);
- `AdicCoefficientsAndComparisonsPartII` §PA.6.9 (Gabber's prime-to-`ℓ` alterations with
  strict normal crossings boundary), `DeligneWeightsAndPurity` §§7.12 and 7.15 (weights over finite
  fields and purity), `ClassFieldTheory` Layer 10 (the Brauer group of a global field and the sum of
  local invariants) and `ArithmeticGaloisDuality` §§R02.4.2, R02.4.3, R02.4.5 and R02.4.6 (local Tate
  duality, Poitou–Tate duality for number fields and function fields, and all-place kernels), inputs to Jannsen's theorem.

The applications to function fields of real varieties (the Elman–Lam invariant, Pfister's
index-two criterion, Benoist's period-index theorems for real surfaces, the level and the
quadric-level computations of Benoist–Wittenberg) belong to `RealSurfacePeriodIndex` Layer PI.0, which takes the Tsen–Lang theorem of 5.6 from this roadmap.

## Conventions

- **Fields and spaces.** `F` and `K` are arbitrary fields unless a target states a characteristic,
  a finiteness or a valuation hypothesis. Quadratic spaces are finite dimensional. A quadratic form
  is Mathlib's `QuadraticForm F V`. *Isotropic* means `¬ QuadraticMap.Anisotropic`, that is a
  nonzero vector of value zero. The value set `D(q)` and the similarity factors `G(q)` are subsets
  of `Fˣ`; Tau Ceti's `QuadraticMap.Represents` allows the value `0`, which every form represents.
- **Nonsingular and nondegenerate.** The polar form of `q` is
  `b_q(v, w) = q(v + w) − q(v) − q(w)` (Mathlib's `QuadraticMap.polar`), with no division by `2`.
  `q` is *nonsingular* when `b_q` has zero kernel. Mathlib's `QuadraticMap.Nondegenerate` is EKM's
  *nondegenerate*: the quadratic radical is zero and the polar kernel has rank at most one. In
  characteristic two `b_q` is alternating, so on an even-dimensional space the two notions agree; in
  odd dimension a nondegenerate form may be singular. In characteristic different from two the two
  notions agree in every dimension.
- **Binary blocks and the hyperbolic plane.** `[a, b]` is the form `a x² + x y + b y²` on `F²`; its
  polar matrix is `[[2a, 1], [1, 2b]]`, of determinant `4ab − 1`, so `[a, b]` is nonsingular exactly
  when `1 − 4ab ≠ 0`. The hyperbolic plane is `x y = [0, 0]`, Mathlib's `QuadraticForm.dualProd F F`;
  a form is *hyperbolic* when it is isometric to `QuadraticForm.dualProd F W` for some `W`.
- **Bilinear forms.** A symmetric bilinear form carries the subscript `b` when it could be confused
  with a quadratic form: `⟨a₁, …, aₙ⟩_b` is the diagonal bilinear form and `⟨⟨a⟩⟩_b = ⟨1, −a⟩_b`.
  For a bilinear `β` and a quadratic `q`, `β ⊗ q` is the quadratic form with
  `(β ⊗ q)(w ⊗ v) = β(w, w) q(v)` and polar form `β ⊗ b_q`; `⟨c⟩_b ⊗ q = c q`.
- **Pfister forms.** The bilinear Pfister form is `⟨⟨a₁, …, aₘ⟩⟩_b = ⟨1, −a₁⟩_b ⊗ ⋯ ⊗ ⟨1, −aₘ⟩_b`,
  `aᵢ ∈ Fˣ`, with diagonal weights `∏_{i ∈ S} (−aᵢ)` over the subsets `S` of the slots (Tau Ceti's
  `TauCeti.pfisterForm`). The quadratic Pfister form of fold `m + 1` is
  `⟨⟨a₁, …, aₘ; a₀]] = ⟨⟨a₁, …, aₘ⟩⟩_b ⊗ [1, a₀]` with `a₀ ∈ F`, the Lean `quadraticPfister a a₀`;
  `[1, a₀]` is the norm form of the quadratic algebra `F[t]/(t² + t + a₀)`, nonsingular exactly when
  `1 − 4a₀ ≠ 0`. In characteristic two this is EKM's `⟨⟨a₁, …, aₘ, a₀]]` (EKM, Example 9.4(2) and
  §9.B, p. 53), with `a₀ = 0` allowed. In characteristic different from two, completing the square
  gives `[1, (1 − b)/4] ≅ ⟨1, −b⟩`, so the parent's minus-sign Pfister form
  `⟨⟨a₁, …, aₙ⟩⟩ = ⟨1, −a₁⟩ ⊗ ⋯ ⊗ ⟨1, −aₙ⟩` (Tau Ceti's `TauCeti.presentedForm` of
  `TauCeti.pfisterForm a`) is isometric to `quadraticPfister (a₁, …, aₙ₋₁) ((1 − aₙ)/4)`. For `n ≥ 1`
  the Witt class of a nonsingular `n`-fold quadratic Pfister form lies in `I_qⁿ = I_bⁿ⁻¹ · I_q`.
- **Coefficient groups.** For `n ≥ 1`, `H_qⁿ(F)` denotes `Hⁿ(F, ℤ/2(n − 1))`. When `char F ≠ 2` it is
  `Hⁿ(G_F, μ₂^{⊗(n−1)})`, identified with `Hⁿ(G_F, 𝔽₂)` through the canonical `μ₂ ≅ ℤ/2`; the
  Kummer class of `a ∈ Fˣ` is `(a) ∈ H¹(G_F, 𝔽₂)` (Tau Ceti's `TauCeti.kummerClass`). When
  `char F = 2` it is Kato's group `H₂ⁿ(F) = Ω^{n−1}_F / (d Ω^{n−2}_F + ℘ Ω^{n−1}_F)`, where
  `℘(a · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}) = (a² − a) · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}` is the inverse
  Cartier operator minus one; it is `H¹(F, ν(n − 1))`, the first cohomology of logarithmic forms,
  and in degree one it is the Artin–Schreier group `F/℘F`. It is neither étale cohomology with
  `μ₂` coefficients (which vanishes in characteristic two) nor the group of logarithmic forms itself.
- **Valuations.** A valued field is a field `K` with a valuation subring `O` (Mathlib's
  `ValuationSubring K`) of arbitrary rank, residue field `κ = IsLocalRing.ResidueField O`, value
  group `Γ = O.ValueGroup` with valuation `O.valuation`, and *henselian* means
  `HenselianLocalRing O`. Outside Layer 7 valuations are written multiplicatively, as Mathlib's
  `O.valuation` is: `O = {x : v(x) ≤ 1}`, and a vector is normalized by its coordinate of greatest
  value. *Non-dyadic* means `(char K, char κ) ≠ (0, 2)`; equal characteristic two
  is non-dyadic. Algebraic henselizations and analytic completions are different fields.
- **Kronecker dimension.** For a field `F`, `dim(F) = trdeg(F/P) + 1` if `char F = 0` and
  `dim(F) = trdeg(F/P)` otherwise, `P` the prime subfield (Dittmann–Pop, §1, p. 1); the Lean
  `kroneckerDimension F` is valued in cardinals. The *constant field* `k` of `F` is the relative
  algebraic closure of `P` in `F` (`constantField F`). Finite Kronecker dimension does not imply
  finite generation.
- **`C_i` fields.** A *d-form* is a homogeneous polynomial of degree `d`. `F` is `C_i` (`IsCi i F`) when
  every `d`-form with `d ≥ 1` in `N > dⁱ` variables has a nonzero zero; the threshold is strict and
  the degree positive.
- **Universes.** Fields and spaces are in arbitrary universes; statements quantifying over
  auxiliary fields (real closures, composita) quantify over the universe of the base field, which is
  enough because every field needed is algebraic over a subfield of the base.

## Exact supplier contracts

### From Mathlib

At the pinned commit. Quadratic forms: `QuadraticMap`, `QuadraticForm`, `QuadraticMap.polar`,
`QuadraticMap.polarBilin`, `QuadraticMap.proj` (the monomial `x_i x_j`,
`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`), `QuadraticMap.Anisotropic`,
`QuadraticMap.Nondegenerate` (`Radical.lean`, the EKM-style predicate recalled above),
`QuadraticMap.Equivalent` and `QuadraticMap.IsometryEquiv`, `QuadraticMap.prod`,
`QuadraticForm.dualProd` (`Dual.lean`, the form `(f, x) ↦ f x` on `V* × V`, hyperbolic in every
characteristic) and `QuadraticForm.baseChange` (`TensorProduct.lean`, which assumes `Invertible 2`;
Layer 0 compares the coordinate extension with it where that hypothesis holds). Bilinear forms:
`LinearMap.BilinForm`. Polynomials and fields: `Polynomial`, `RatFunc`, `MvPolynomial`,
`MvPolynomial.IsHomogeneous`, `MvPolynomial.eval`, `HomogeneousLocalization`, `KaehlerDifferential`,
`Algebra.trdeg` (`RingTheory/AlgebraicIndependent/Basic.lean`), `algebraicClosure`
(`FieldTheory/AlgebraicClosure.lean`, the relative algebraic closure), `IsRealClosed`
(`FieldTheory/IsRealClosed/Basic.lean`). Chevalley–Warning: `char_dvd_card_solutions`
(`FieldTheory/ChevalleyWarning.lean`: over a finite field the characteristic divides the number of
zeros of a polynomial of total degree less than the number of variables). Dimension theory:
`Ideal.height_le_spanRank_toENat` (Krull's height theorem, `RingTheory/Ideal/KrullsHeightTheorem.lean`)
and the Nullstellensatz `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` (`RingTheory/Nullstellensatz.lean`,
for finitely many variables over a field, with zeros in an algebraically closed extension).
Separable closures: `IsSepClosed.lift` (an embedding over `K` of a separable algebraic extension of
`K` into a separably closed field). Valuations: `ValuationSubring`,
`ValuationSubring.valuation`, `ValuationSubring.ValueGroup`, `ValuationSubring.subtype`,
`HenselianLocalRing` and `HenselianLocalRing.TFAE` (monic simple-root lifting,
`RingTheory/Henselian.lean`), `IsLocalRing.ResidueField`, and `ValuativeRel.ofValuation` (the
valuative relation `x ≤ y ↔ v(x) ≤ v(y)` of a valuation, `RingTheory/Valuation/ValuativeRel/Basic.lean`). Cohomology: `continuousCohomology`.
Inverse limits: `nonempty_sections_of_finite_inverse_system` (`CategoryTheory/CofilteredSystem.lean`:
an inverse system of nonempty finite sets over a directed preorder has a compatible section; the
transition maps need not be surjective).

### From Tau Ceti

At the pinned commit; these are the declarations the parent's Layers 1, 4 and 7 use, consumed here
with the same scope. All Witt-ring declarations assume `Invertible (2 : K)`.

- `TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/Basic.lean`: `TauCeti.pfisterForm` (the
  diagonal weights, defined over every field, with `TauCeti.pfisterForm_two`), `TauCeti.pfisterFormClass`,
  `TauCeti.pfisterClass`,
  `TauCeti.pfisterClass_mem_fundamentalIdeal_pow` and `TauCeti.fundamentalIdeal_pow_eq_addClosure`
  (additive generation of `Iⁿ` by `n`-fold Pfister classes for `n ≥ 1`).
- `Witt/Ring.lean`, `Witt/FundamentalIdeal.lean`, `Witt/Discriminant.lean`: `TauCeti.WittRing`,
  `TauCeti.wittClass`, `TauCeti.WittRing.dimMod2`, `TauCeti.fundamentalIdeal`,
  `TauCeti.oneFoldPfisterClass`, `TauCeti.fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass`
  (additive generation of `I` by one-fold Pfister classes) and `TauCeti.signedDiscrHom` (the signed
  discriminant on `I`, with kernel `I²`).
- `RegularFormClass/Basic.lean`: `TauCeti.RegularFormClass`, `TauCeti.presentedForm` (the diagonal
  form of a tuple of units), `TauCeti.formClass` (the class of a regular form on a finite-dimensional
  space).
- `Witt/BaseChange.lean`: `TauCeti.WittRing.baseChange` (the ring map `W(K) → W(L)` of a field extension)
  and `TauCeti.WittRing.baseChange_mem_fundamentalIdeal_pow` (it maps `I(K)ⁿ` into `I(L)ⁿ`).
- `Witt/Round.lean`, `Witt/Pfister/Hyperbolic.lean`, `Witt/Pfister/BaseChange.lean`:
  `TauCeti.oneFoldPfister_smul_equivalent_iff` and `TauCeti.twoFoldPfister_smul_equivalent_iff`
  (over any commutative ring `R`, a unit `c` is a similarity factor of the diagonal form `⟨1, −a⟩`,
  respectively `⟨1, −a, −b, ab⟩`, exactly when it lies in `QuadraticMap.unitValueSet` of that form;
  roundness is the implication from membership to similarity), `TauCeti.pfisterFormClass_two_tfae`,
  `TauCeti.pfisterClass_two_eq_zero_iff`, `TauCeti.WittRing.baseChange_pfisterClass`.
- `Witt/Decomposition.lean`, `Witt/Cancellation.lean`, `Witt/Extension.lean`: the anisotropic part,
  `TauCeti.equivalent_of_equivalent_prod` and `QuadraticMap.IsometryEquiv.exists_extension`, all with
  `2` invertible.
- `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean`: `QuadraticMap.Represents`,
  `QuadraticMap.unitValueSet`, `QuadraticMap.IsRepresentedBy` (an injective isometry into another
  form).
- `TauCeti/LinearAlgebra/QuadraticForm/Transfer/Basic.lean` and `Transfer/Witt.lean`:
  `QuadraticMap.scharlauTransfer` (the form `s ∘ q` over the smaller ring, defined in every
  characteristic and for every functional), `QuadraticMap.polar_scharlauTransfer`, and, with `2`
  invertible and `s ≠ 0`, `TauCeti.WittRing.scharlauTransfer` and the projection formula
  `TauCeti.WittRing.scharlauTransfer_baseChange_mul`.
- Galois cohomology: `TauCeti.AbsoluteGaloisGroup`, `TauCeti.trivialF2` (trivial `𝔽₂` coefficients),
  `TauCeti.kummerClass` (`FieldTheory/GaloisCohomology/MuTwo/Basic.lean`, with `2` invertible),
  `TauCeti.trivialF2TopPairing` (multiplication on `𝔽₂`) and its all-degree cup product
  `TauCeti.TopPairing.cup` (`RepresentationTheory/Homological/ContCohomology/Cup/`),
  `TauCeti.trivialF2Map` and `TauCeti.trivialF2Map_cup` (pullback along a continuous homomorphism of
  topological groups, and its compatibility with cups), `TauCeti.ContinuousCohomology.map_eq_id_of_inner`
  (an inner automorphism with the matching action on smooth discrete coefficients induces the
  identity in every degree, `ContCohomology/InnerConjugation.lean`), `TauCeti.galoisRes`,
  `TauCeti.galoisRes_cup` and `TauCeti.galoisRes_kummerClass` (restriction along a finite extension
  `L/K` with a chosen `K`-embedding `L → Kˢ`, and its compatibility with cups and with Kummer
  classes, `FieldTheory/GaloisCohomology/Restriction.lean` and `MuTwo/Transfer.lean`; infinite
  extensions are not covered), `TauCeti.cohomologicalDimensionAt`.
- Real closures: `TauCeti.RealClosure.exists_realClosure` (`FieldTheory/RealClosure/Basic.lean`: an
  ordered field `K` has a real closed field `R` in the universe of `K`, algebraic over `K`, with an
  order-preserving embedding `K → R`) and Sturm's theorem `TauCeti.Sturm.card_roots_toFinset_univ`
  (`Algebra/Polynomial/Sturm/Infinity.lean`: over a real closed ordered field the number of distinct
  roots of a polynomial is the difference of the sign variations of its Sturm sequence at `−∞` and
  at `+∞`).
- Valuation spectrum: `TauCeti.ValuationSpectrum` (`Spv A`, the valuative relations on `A`; for a field
  these are the valuations up to equivalence, the trivial one included), `TauCeti.ValuationSpectrum.comap`
  (pullback of a valuative relation along a ring map) and
  `TauCeti.ValuationSpectrum.patchTopology` with `TauCeti.ValuationSpectrum.isClopen_patchTopology_basicOpen`
  (`AlgebraicGeometry/AdicSpace/PatchPresentation.lean`); for a field the patch topology is the
  coarsest in which every `{v : v(a) ≤ 1}` is clopen.

### From TauCetiRoadmap.QuadraticFormInvariants

Layer 1, Layer 4, Layer 7A, Layer 7B and Layer 9, through the Tau Ceti declarations listed above, and Layer
4's signature isomorphism `W(ℝ) ≅ ℤ` (sending `⟨1⟩` to `1`), which 3.2a uses. Assumed: everything
there holds with `2` invertible and the minus-sign Pfister convention; nothing is assumed in
characteristic two. Layer 7B supplies the identification of the quaternion class `[(a, b)]`
with `(a) ∪ (b)` used to pin `e₂`.

### From TauCetiRoadmap.ProfiniteCohomology

Layer 10 (continuous cohomology `Hⁿ(G, M)` in all degrees on the canonical carrier, restriction,
inflation, corestriction, conjugation, long exact sequences and the finite-quotient colimit), Layer 11
(`cd_p`, `scd_p`, closed-subgroup monotonicity and the finite-module criterion) and Layer 12 (the
graded cup product with its unit, associativity, graded commutativity and restriction
compatibility). Assumed: these are realized by Mathlib's `continuousCohomology` and Tau Ceti's
`TauCeti.cohomologicalDimensionAt`, `TauCeti.trivialF2Map`,
`TauCeti.ContinuousCohomology.map_eq_id_of_inner` and `TauCeti.TopPairing.cup` named above.

### From TauCetiRoadmap.ClassFieldTheory

Layer 6, `cd_p_absoluteGaloisGroup_eq_two`: `cd_ℓ G_K = 2` for every finite extension `K` of `ℚ_p`
and every prime `ℓ`, including `ℓ = p = 2`. Layer 10, `eq_zero_of_localInv_eq_zero`: a Brauer class
of a global field whose local invariants all vanish is zero, which is the case `d = 0` of 6.3.

### From TauCetiRoadmap.AdicSpaces

Layer 1 (§§1.1–1.3): the valuation spectrum `Spv(A)` with its basic opens, spectrality and
pro-constructible subsets, realized by Tau Ceti's `TauCeti.ValuationSpectrum`; Layer 7 here uses
`A = F` and the patch topology, and builds no second valuation space.

### From TauCetiRoadmap.RealAlgebraicGeometry

Layer 1, *ordered real-closure existence* (`exists_realClosure`), realized at the pinned commit by
Tau Ceti's `TauCeti.RealClosure.exists_realClosure`: every ordered field `K` has a real closed field
`R` algebraic over `K` with an order-preserving embedding `K → R`, in the universe of `K`. 6.0 and
6.4 use it to attach a real closure of the constant field to each of its orderings. Nothing else is
assumed: the uniqueness of real closures and the extension of order-preserving embeddings to them
are 6.0.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.12 (the henselization of a pair as a filtered colimit of étale neighbourhoods, with
`Henselization.henselian` and the universal property), §0.13 (the henselization is ind-étale and
commutes with filtered colimits), §0.14 (characterizations of henselian pairs and Elkik's
`henselian_smooth_lifting`), §2.11 (Artin–Schreier sequence), §2.15 (`etale_galois_comparison`,
`etale_cohomology_limits` along cofiltered limits, `hochschildSerre_galois_covering`) and §2.16
(`tsen_theorem`). Assumed as stated there.

### From TauCetiRoadmap.LocalFieldsRamificationPartII

§GF.5, `abhyankar-and-rank`: for a valued field extension `L/K` of finite transcendence degree,
`rr(Γ_L/Γ_K) + trdeg(κ_L/κ_K) ≤ trdeg(L/K)`, with no finite-generation hypothesis; 5.7 uses it.

§GF.1, *henselization as a valued field*: for a valuation ring `V` of `K`, `K^h = Frac(V^h)` is a
separable algebraic immediate extension (same residue field and value group) with the universal
property for embeddings into henselian valued fields, and `K` is henselian exactly when `K → K^h` is
an isomorphism. §GF.4, *rank-one Krasner approximation* and *rank-one decompletion*: for a
height-one valued field, `K^h` is dense in the completion, and finite separable extensions of the
henselization descend to finite separable extensions of `K`. Layer 6 deduces from these that the
completion and the henselization of a number field at a finite place have the same absolute Galois
group.

### From TauCetiRoadmap.HermitianKTheoryOfPoincareCategories

§3.4, the Witt group `W(Proj(R); Q)` of a Poincaré structure, the quotient of the isometry classes of
nonsingular forms on finitely generated projective modules by the strictly metabolic ones (a direct
summand `L` with `q|_L = 0` and `0 → L → P → DL → 0` exact); §4.5 (iii), for the quadratic Poincaré
structure this is the classical Witt group of quadratic forms; §7.9 (c), over a field `F` of
characteristic two it is the Witt group `W^q(F)` of nonsingular quadratic forms; §3.5, a strictly
metabolic `1`-quadratic form on a finitely generated projective module with strict Lagrangian `L` is
the hyperbolic form on `L`, in particular every strictly metabolic quadratic form over a field is
hyperbolic. Assumed: nothing beyond these; 0.5 identifies the hyperbolic form on `L` with a sum of
coordinate hyperbolic planes and, with cancellation, the monoid quotient with the Grothendieck group
of nonsingular quadratic forms modulo the hyperbolic plane; no product structure is supplied.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§6.4, `ExactW0` and `ExactGW0`: the Witt and Grothendieck–Witt groups of nondegenerate symmetric
spaces in a small exact category with strong duality, metabolic spaces with an admissible Lagrangian
having zero Witt class. Specialized to finite-dimensional vector spaces over `F` with the ordinary
duality, these are the additive Witt and Grothendieck–Witt groups of nondegenerate symmetric bilinear
forms, in every characteristic. Assumed: no product structure; Layer 0 adds the tensor product.

### From TauCetiRoadmap.K2SymbolsBrauer

§5.4 (Milnor K-theory `K_*ᴹ(F)` as the tensor algebra on `Fˣ` modulo the Steinberg relations), §§5.6–5.8
(grading, symbol API and maps induced by field homomorphisms), §5.12 (`Kₙᴹ(𝔽_q) = 0` for `n ≥ 2`),
Layer 9 (tame symbols and last-slot Milnor residues) and Layer 10 (§10.5 the Bass–Tate sequence for
`F(t)`, §§10.6–10.9 Milnor transfers and the projection formula, and §10.32: for a number field with
`r₁` real places and `n ≥ 3`, `Kₙᴹ ≅ (ℤ/2)^{r₁}` through the signs at the real places). Assumed as
stated there; §§5.4–5.8 and Layers 9–10 for every field, inseparable extensions included.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

§3.0, *differential norm residue* (`blochGabberKato`): for a field `F` of characteristic `p` and
`n ≥ 0`, the inverse Cartier operator `C⁻¹ : Ωⁿ_F → Ωⁿ_F / dΩⁿ⁻¹_F`, the subgroup `ν_F(n)` of
logarithmic forms (the kernel of `1 − C⁻¹`, generated by `dlog` symbols), and
`dlog : Kₙᴹ(F)/p ≃ ν_F(n)`, natural in field maps. §3.0a, *motivic comparison foundations*
(`motivicToK` and the norm-residue comparison): for `m` invertible in `F`, the comparison
`ℤ/m(i) ≃ τ_{≤i} Rε_* μ_m^{⊗i}`, whose field diagonal is the norm-residue isomorphism
`Kₙᴹ(F)/m ≃ Hⁿ(F, μ_m^{⊗n})`, sending `{a₁, …, aₙ}` to the cup product of Kummer classes. Layer 3 uses
`m = 2`, all `n`, and the surjectivity of cup product with `τ = −1` that the comparison gives.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§0.5b (Gersten residues and the coniveau spectral sequence for cohomology theories with supports on
smooth schemes over a perfect field), §§4.1–4.6 (finite correspondences, presheaves with transfers,
Nisnevich descent, the Suslin complexes and effective Tate complexes `ℤ(n)`, excision, contraction
`F₋₁` and strict homotopy invariance, the effective derived category) and §4.14 (equidimensional
cycles and transfers). Layer 3 uses them in characteristic different from two over a perfect base.

What MotivesAndAlgebraicCycles must provide (gap:rost-cycle-modules): Rost's cycle modules over a
perfect field: the cycle complexes with coefficients and their Zariski sheaves on smooth schemes, with
Rost's Gersten resolution, homotopy invariance and contraction `M ↦ M₋₁`, and the identification of the
unramified mod-two Milnor K-theory sheaf as the sheaf of the cycle module `K_*ᴹ/2`.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§11.2, `field_cohomological_dimension_transcendence`: for a field extension `L/K` and a prime `ℓ`,
`cd_ℓ(L) ≤ cd_ℓ(K) + trdeg_K L`, infinite values allowed.

### From TauCetiRoadmap.DeligneWeightsAndPurity

§7.12 (weight bounds for `H^i_c` and `H^i` of varieties over a finite field, and purity of the image
of `H^i_c → H^i`) and §7.15 (purity for proper smooth varieties over a finite field): the weight
inputs of Jannsen's argument in 6.3.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.4.2 (local Tate duality for finite modules), §R02.4.3 (Poitou–Tate duality for a number field:
the nine-term sequence and, for `r ≥ 3`, `H^r(G_S, M) ≅ ⊕_{v real} H^r(K_v, M)`), §R02.4.5 (the
function-field form) and §R02.4.6 (perfect pairing of the all-place kernels `Ш¹(F, M^D)` and
`Ш²(F, M)` for a global field and a finite module of order prime to the characteristic). 6.3 uses them,
passing to the limit over `A[ℓⁿ]`, for Jannsen's Hasse principle in degree two.

### From TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII

§PA.6.9, prime-to-`ℓ` alterations of varieties with snc boundary: for `X` separated, integral, of
finite type over a field `L`, `ℓ` invertible in `L` and `Y ⊊ X` closed, there are a finite extension
`L′/L` and a smooth connected quasi-projective `X′/L′` with a proper surjective `π : X′ → X`, both of
degree prime to `ℓ`, and `π⁻¹(Y)_red` a strict normal crossings divisor.

## How to read the build

Layer 0 builds the characteristic-two carriers that Tau Ceti's Witt ring does not cover: binary
nonsingular blocks, coordinate scalar extension, Witt decomposition, the bilinear Witt ring, and the
module structure and filtration of the imported quadratic Witt group; in characteristic different from two each object is
identified with the parent's. Layer 1 defines quadratic Pfister forms uniformly and proves
roundness and the isotropy criterion in every fold and characteristic. Layer 2 develops polynomial
representation, transfer and the similarity theorems, the function field of a quadric and the
subform theorem, and proves the Arason–Pfister Hauptsatz. Layer 3 builds the coefficient groups,
the odd-characteristic Milnor map, its bijectivity in low degrees and over the prime fields, Morel's
injectivity proof, Kato's characteristic-two comparison, the Pfister invariant and the
invariant-zero criterion. Layer 4 turns to henselian
valued fields; Layer 5 to `C_i` fields and the Kronecker dimension; Layer 6 proves the uniqueness of real closures
and combines Layers 3–5 with Jannsen's Hasse principle into Dittmann–Pop's dimension theorem; Layer 7 proves the openness of
henselian loci and uses only Layer 0 and the valuation suppliers. The chain is
Layer 0 → 1 → 2 → 3, with Layer 4 depending on Layers 0–1, Layer 5 on Layers 1 and 4, Layer 6 on
Layers 3–5, and Layer 7 on Layer 0. Each *Needs:* line lists what the statement and its route use, item by item, so that a
different proof is not blocked by an unrelated layer.

## Layer 0: nonsingular forms and quadratic Witt modules in characteristic two

In characteristic two the polar form of a quadratic form is alternating, diagonal forms are
degenerate, and Witt cancellation fails for degenerate summands (EKM, (8.7), p. 49:
`[a, b] ⊥ ⟨a⟩ ≅ ℍ ⊥ ⟨a⟩` for `a ≠ 0`). This layer builds the carriers on which the rest of the
roadmap works in every characteristic: nonsingular forms, their Witt group, and its module
structure over the bilinear Witt ring. None of these objects multiplies two quadratic forms.

### 0.1 Binary blocks

Define the binary block `[a, b]` on `F²` as `a x² + x y + b y²`, the sum of Mathlib's coordinate
monomials `QuadraticMap.proj` with coefficients `a, 1, b`. Prove that its polar form has matrix
`[[2a, 1], [1, 2b]]` and determinant `4ab − 1`, so that `[a, b]` is nonsingular exactly when
`1 − 4ab ≠ 0`, always in characteristic two; that a nonsingular binary form is isotropic exactly
when it is isometric to the hyperbolic plane `x y = [0, 0]`; that `[0, 0] ≅ [0, a]` for every `a`;
that in characteristic two `[1, a]` is isotropic exactly when `a ∈ ℘(F) = {x² + x}`; and that every
nonzero binary form with nonzero polar form is isometric to some `[a, b]` (EKM, Notation 7.3,
Remark 7.4, Examples 7.5–7.6, pp. 40–41; Proposition 7.19, pp. 43–44). On even-dimensional spaces
prove that nonsingularity agrees with Mathlib's `QuadraticMap.Nondegenerate`, and that the
hyperbolic plane is isometric to `QuadraticForm.dualProd F F` in every characteristic.
*Needs:* Mathlib `QuadraticMap.proj`, `QuadraticMap.polarBilin`, `QuadraticMap.Nondegenerate`,
`QuadraticForm.dualProd`.

- evaluation: `[a, b](x, y) = a x² + x y + b y²`, and the polar form is `2a x x′ + x y′ + y x′ + 2b y y′`;
- nonsingularity: `[a, b]` has zero polar kernel if and only if `1 − 4ab ≠ 0`;
- hyperbolicity: `[0, 0]` is isometric to `QuadraticForm.dualProd F F`, and a nonsingular isotropic
  binary form is isometric to `[0, 0]`;
- normal form: in characteristic two, a nonsingular binary form representing `a ≠ 0` is isometric
  to `[a, b]` for some `b`, and `[a, b] ≅ a [1, ab]`;
- comparison: on an even-dimensional space, zero polar kernel is equivalent to
  `QuadraticMap.Nondegenerate`.

**Checks.**

- `[a, b](1, 0) = a`, `[a, b](0, 1) = b`, and `[0, 0](1, 1) = 1`; a definition dropping the mixed
  term gives `0` at `(1, 1)`.
- Over `𝔽₂`, `[1, 1]` takes the value `1` at `(1, 0)`, `(0, 1)` and `(1, 1)`, so it is anisotropic,
  and its polar matrix `[[0, 1], [1, 0]]` has determinant `1`; `[1, 0]` vanishes at `(0, 1)` and is
  hyperbolic. A quadratic form `(x + y)²` with the same diagonal values vanishes at `(1, 1)` and has
  zero polar form, so it is neither.
- In characteristic different from two with `a ≠ 0`, completing the square gives
  `[a, b] ≅ ⟨a, b − 1/(4a)⟩`; at `a = 1, b = 1/4` this is `⟨1, 0⟩`, singular, matching
  `1 − 4ab = 0`.
- Mathlib's `QuadraticMap.Nondegenerate` holds for `⟨1⟩` on `𝔽₂` (dimension one, polar kernel of rank
  one, quadratic radical zero), which is singular: the comparison needs the even-dimension
  hypothesis.

### 0.2 Coordinate scalar extension

For a field `K`, a quadratic form `Q` on `Fin n → K` and a commutative `K`-algebra `L`, define
`extendScalars Q L` on `Fin n → L` by the coordinate polynomial
`x ↦ ∑ᵢ Q(eᵢ) xᵢ² + ∑_{i<j} b_Q(eᵢ, eⱼ) xᵢ xⱼ`, with coefficients mapped into `L` (EKM, §7, scalar
extension before Lemma 7.15, p. 42). For a finite-dimensional space `V`, transport along a basis
and prove independence of the basis up to canonical isometry. Prove that
`(extendScalars Q L)(c ⊗ v) = c² Q(v)`, that the polar form of the extension is the extension of
the polar form, that extension preserves orthogonal sums, isometries, nonsingularity and the
hyperbolic plane, and that `extendScalars Q K = Q`; for a tower `K ⊆ L ⊆ M`, extending to `L` and
then to `M` is isometric to extending to `M`. Where `2` is invertible, identify the extension with
Mathlib's `QuadraticForm.baseChange` through `Fin n → L ≅ L ⊗ (Fin n → K)`. Anisotropy is not
preserved in general. *Needs:* Mathlib `QuadraticMap.proj`, `QuadraticMap.polar`,
`QuadraticForm.baseChange` (for the comparison only); 0.1.

- values: `extendScalars Q L` agrees with `Q` on vectors with coordinates in `K`, and scales by
  `c²` along scalars;
- polar form: the polar form of `extendScalars Q L` has Gram matrix the image of the Gram matrix of
  `b_Q`;
- functoriality: an isometry `Q ≅ Q′` induces an isometry of extensions, the identity extension is
  `Q`, and towers compose up to the canonical identification;
- sums: the extension of `Q ⊥ Q′` is the orthogonal sum of the extensions;
- comparison: with `2` invertible in `K`, the extension is isometric to `QuadraticForm.baseChange`.

**Checks.**

- The extension of `[1, a]` is `x² + x y + a y²` over `L`, not `x² + a y²`: the sanity computation on
  `x₀ x₁` returns `x₀ x₁` and would return `0` if the off-diagonal sum were omitted.
- The extension of `x y` is `x y` over `L`, hyperbolic.
- `[1, 1]` over `𝔽₂` is anisotropic, and its extension to `𝔽₄` is isotropic at `(ω, 1)` with
  `ω² + ω + 1 = 0`: nonsingularity is preserved, anisotropy is not.
- With `L = K` the extension is `Q` itself, including when `Q` is degenerate.

### 0.3 Witt decomposition and cancellation in characteristic two

Prove, for quadratic forms over a field of characteristic two, the extension, cancellation and
decomposition theorems in the forms EKM proves in every characteristic: an isometry between
subspaces meeting the polar radicals trivially extends to the whole space; `φ ⊥ ψ ≅ φ′ ⊥ ψ′` with
`ψ ≅ ψ′` and `ψ` nonsingular implies `φ ≅ φ′`; every form is `φ|rad ⊥ φ_an ⊥ m ℍ` with `φ_an`
anisotropic and unique up to isometry, `m` the Witt index (EKM, Theorems 8.3–8.5, pp. 47–49). For a
nonsingular even-dimensional form of dimension `2m`, being hyperbolic is equivalent to Witt index
`m`. The route splits off `ℍ` from an isotropic vector `v` by choosing `w` with `b(v, w) = 1` and
replacing `w` by `w − q(w)v`; the extension theorem treats `F = 𝔽₂` separately, as EKM does, with
the explicit isometry `x ↦ x + b(v̄, x) w + b(w, x) v̄`. With `2` invertible these theorems are
Tau Ceti's (parent Layer 1). *Needs:* 0.1, 0.2; Tau Ceti `TauCeti.equivalent_of_equivalent_prod` and
`QuadraticMap.IsometryEquiv.exists_extension` for the comparison with characteristic different
from two; Tau Ceti `QuadraticMap.IsRepresentedBy`.

- splitting: a nonsingular isotropic form is isometric to `ℍ ⊥ φ′` with `φ′` nonsingular;
- cancellation: a nonsingular common summand cancels;
- decomposition: anisotropic part and Witt index are invariants of isometry;
- hyperbolicity: a nonsingular `2m`-dimensional form is hyperbolic exactly when its Witt index
  is `m`.

**Checks.**

- `[1, 0] ≅ ℍ` over `𝔽₂` (Witt index one), while `[1, 1]` has Witt index zero.
- Cancellation fails with a degenerate summand: over `𝔽₂`, `[1, 1] ⊥ ⟨1⟩ ≅ ℍ ⊥ ⟨1⟩` but
  `[1, 1] ≇ ℍ`.
- Over `𝔽₂`, `⟨1⟩` on `𝔽₂` has zero polar form and value `1` at `1`: it is regular and anisotropic,
  so the decomposition must allow an anisotropic part with nonzero polar kernel (EKM, Remark 8.9(3),
  p. 50); requiring `φ_an` nonsingular would leave `⟨1⟩` without a decomposition.

### 0.4 The bilinear Witt ring in characteristic two

For a field of characteristic two, define the bilinear Witt ring `W_b(F)`: the additive group is
`GeometryOfNumbersAndQuadraticArithmetic` §6.4's `ExactW0` for finite-dimensional `F`-vector spaces
with the ordinary duality, that is nondegenerate symmetric bilinear forms modulo metabolic forms,
and the product is induced by the tensor product of bilinear forms (EKM, §2, Lemma 2.1,
Proposition 2.4 and Corollary 2.5, pp. 19–20). Define the fundamental ideal `I_b(F)` as the kernel
of the dimension map to `ℤ/2`, and its powers. Prove that the tensor product descends (a Lagrangian
of a metabolic form tensored with any nondegenerate form is a Lagrangian), that `W_b(F)` is generated
by the classes of one-dimensional forms with the relations of EKM, Theorem 4.8, p. 23, that every
Witt class contains a unique anisotropic form up to isometry, and that `I_bⁿ(F)` is additively
generated by bilinear `n`-fold Pfister forms. With `2` invertible, polarization identifies `W_b(F)`
and `I_b(F)` with Tau Ceti's `TauCeti.WittRing` and `TauCeti.fundamentalIdeal`. *Needs:*
`GeometryOfNumbersAndQuadraticArithmetic` §6.4; Mathlib `LinearMap.BilinForm`; Tau Ceti
`TauCeti.WittRing`, `TauCeti.fundamentalIdeal` (comparison only).

- classes: every nondegenerate symmetric bilinear form has a class; orthogonal sum and tensor
  product become sum and product, with unit `⟨1⟩_b`;
- vanishing: a class is zero exactly when the form is metabolic;
- anisotropic representatives: two anisotropic forms with equal classes are isometric;
- fundamental ideal: `I_b(F)` is the kernel of dimension modulo two, and `I_bⁿ(F)` is additively
  generated by `⟨⟨a₁, …, aₙ⟩⟩_b`, `aᵢ ∈ Fˣ`, for `n ≥ 1`;
- comparison: with `2` invertible, the ring and ideal are Tau Ceti's.

**Checks.**

- `⟨1⟩_b` is the multiplicative unit and has odd dimension, so its class is nonzero and not in
  `I_b(F)`.
- The alternating hyperbolic plane `b((x, y), (x′, y′)) = x y′ + y x′` has class zero.
- Over `𝔽₂`, `⟨1, 1⟩_b` is isotropic at `(1, 1)` and nondegenerate, hence metabolic and zero, while
  `⟨1⟩_b ≠ 0`; so `W_b(𝔽₂) = ℤ/2`. A quotient that also killed `⟨1⟩_b` would make `W_b(𝔽₂) = 0`.
- Over `𝔽₂(t)`, `⟨1, t⟩_b` is anisotropic (a nonzero `x² + t y²` has a polynomial representative
  with leading term of even or odd degree that cannot cancel), so it is a nonzero element of
  `I_b(𝔽₂(t))`.

### 0.5 The quadratic Witt module

The quadratic Witt group `I_q(F)` is the Grothendieck group of isometry classes of even-dimensional
nonsingular quadratic forms under orthogonal sum, modulo the subgroup generated by the hyperbolic
plane (EKM, §8, after Lemma 8.16, p. 51). It is not constructed here: in characteristic two every
nonsingular form is even-dimensional and every strictly metabolic quadratic form is hyperbolic, so
`I_q(F)` is the Witt group `W^q(F)` of `HermitianKTheoryOfPoincareCategories` §§3.4, 4.5 and 7.9;
with `2` invertible it is Tau Ceti's `TauCeti.fundamentalIdeal`, the even-dimensional part of
`W^q(F) = W(F)`. Import the identification of strictly metabolic quadratic forms with hyperbolic
forms from `HermitianKTheoryOfPoincareCategories` §3.5 (a strictly metabolic `1`-quadratic form on a
finitely generated projective module with strict Lagrangian `L` is the hyperbolic form on `L`),
specialized to finite-dimensional vector spaces, and identify its hyperbolic object on `L` with the
orthogonal sum of `dim L` coordinate hyperbolic planes of 0.1; with cancellation (0.3) the monoid
quotient of §3.4 is then the Grothendieck group modulo `ℍ`. For a symmetric bilinear form `β` on `W`
and a quadratic form `q` on `V`, define `β ⊗ q` on `W ⊗ V` by `(β ⊗ q)(w ⊗ v) = β(w, w) q(v)` with
polar form `β ⊗ b_q`; in coordinates it is the quadratic polynomial whose diagonal coefficients are
`β(wᵢ, wᵢ) q(vⱼ)` and whose mixed coefficients are fixed by the polar form. Prove that `β ⊗ q` is
nonsingular when `β` is nondegenerate and `q` nonsingular even-dimensional, hyperbolic when `β` is
metabolic or `q` hyperbolic (EKM, Lemma 8.16, p. 51), so that `I_q(F)` is a `W_b(F)`-module; that two
nonsingular even-dimensional forms are isometric exactly when they have equal classes and equal
dimension (EKM, Remark 8.17, p. 51); and that a field extension induces a restriction homomorphism
`I_q(F) → I_q(L)`, injective for purely transcendental `L` (Remark 8.18, p. 51). With `2` invertible,
`q ↦ q` (bilinear forms identified with quadratic forms by `β ↦ (v ↦ β(v, v))`) identifies `I_q(F)`
with Tau Ceti's `TauCeti.fundamentalIdeal`, the module action becoming multiplication.
*Needs:* 0.1–0.4; `HermitianKTheoryOfPoincareCategories` §§3.4, 4.5 and 7.9 (the carrier `W^q(F)`)
and §3.5 (strictly metabolic forms are hyperbolic); Tau Ceti `TauCeti.wittClass`,
`TauCeti.fundamentalIdeal` (comparison only).

- classes: every even-dimensional nonsingular form has a class in `I_q(F)`, additive in orthogonal
  sums, and `ℍ` has class zero;
- action: `[β] · [q] = [β ⊗ q]`, and `⟨c⟩_b · [q] = [c q]`;
- detection: equal class and equal dimension imply isometry;
- restriction: classes extend along field homomorphisms, through 0.2;
- comparison: with `2` invertible, `I_q(F)` is the parent's `I(F)` and the action is multiplication.

**Checks.**

- `⟨c⟩_b ⊗ [1, a] = c [1, a]`, and the substitution `y ↦ y/c` shows `c [1, a] ≅ [c, a/c]`; it is
  two-dimensional with class `⟨c⟩_b · [1, a]`. Rescaling only the diagonal, `[c, ac]`, has Arf class
  `c² a` and differs from it in general.
- `x y` has class zero, while over `𝔽₂` the class of `[1, 1]` is nonzero (it is anisotropic of
  dimension two and so not hyperbolic); `I_q(𝔽₂) ≅ ℤ/2`.
- In characteristic different from two, `⟨1, −a⟩_b ⊗ ⟨1, −b⟩` is `⟨1, −a, −b, ab⟩`, the parent's
  `TauCeti.pfisterForm ![a, b]` (`TauCeti.pfisterForm_two`).
- A definition of `β ⊗ q` by the diagonal formula alone loses the mixed term: for `β = ⟨1⟩_b` it
  would send `[1, 1]` to `x² + y²`, which is `(x + y)²` in characteristic two and singular.

### 0.6 The quadratic filtration

For `n ≥ 1` define `I_qⁿ(F) = I_bⁿ⁻¹(F) · I_q(F)`, the subgroup generated by the products, so
`I_q¹ = I_q` and `I_qⁿ⁺¹ ⊆ I_qⁿ` (EKM, §9, after Example 9.4, p. 53). Prove that restriction to a
field extension maps `I_qⁿ(F)` into `I_qⁿ(L)` and that, with `2` invertible, `I_qⁿ(F)` corresponds to
the parent's `I(F)ⁿ`. *Needs:* 0.4, 0.5; Tau Ceti `TauCeti.fundamentalIdeal` (comparison only).

- indexing: defined for `n ≥ 1`, with `I_q¹ = I_q`;
- monotonicity: `I_qⁿ⁺¹ ⊆ I_qⁿ`;
- restriction: field extensions preserve each `I_qⁿ`;
- comparison: with `2` invertible, `I_qⁿ` is `I(F)ⁿ`, not `I(F)ⁿ⁺¹`.

**Checks.**

- Over `𝔽₂`, `[1, 1] ∈ I_q¹` although its polar form, an alternating plane, is zero in `W_b`; the
  quadratic filtration is not the polarization of the bilinear one.
- With `2` invertible, `I_q²` corresponds to `I²`: the two-fold form `⟨1, −a, −b, ab⟩` lies in it,
  and the one-fold `⟨1, −a⟩` lies in `I_q¹` and lies in `I_q²` only when `a` is a square.
- With `2` invertible over `ℝ`, `4⟨1⟩ = ⟨⟨−1, −1⟩⟩` lies in `I_q²` but not in `I_q³`: its signature `4`
  is not divisible by `8`, while every element of `I(ℝ)³` has signature in `8ℤ`. The zero filtration,
  or the filtration shifted by one, would give a different answer.

### Examples

Over `𝔽₂`, `[1, 1]` is the norm form of `𝔽₄/𝔽₂`; it is anisotropic and nonsingular, its class
generates `I_q(𝔽₂) ≅ ℤ/2`, and it splits over `𝔽₄`. Replacing it by `(x + y)²`, which has the same
values on the coordinate vectors, changes all three answers: the form becomes isotropic, singular
and outside `I_q`. In characteristic three, `[1, 1] ≅ ⟨1, 1 − 1/4⟩ = ⟨1, 0⟩` since `4 = 1`, so
`1 − 4·1 = 0` and it is singular, as the determinant criterion predicts.

### Dependencies

Mathlib quadratic maps, polar forms, `QuadraticForm.dualProd` and bilinear forms;
`GeometryOfNumbersAndQuadraticArithmetic` §6.4 for the additive bilinear Witt group;
`HermitianKTheoryOfPoincareCategories` §§3.4, 4.5 and 7.9 for the quadratic Witt group and §3.5 for
strictly metabolic forms being hyperbolic; Tau Ceti's Witt ring, fundamental ideal and Witt theorems
(parent Layers 1 and 4) for the comparisons with `2` invertible.

## Layer 1: quadratic Pfister forms in every characteristic

### 1.1 Quadratic Pfister forms

Define `quadraticPfister a a₀ = ⟨⟨a₁, …, aₘ⟩⟩_b ⊗ [1, a₀]` for `a : Fin m → Fˣ` and `a₀ ∈ F`: the
orthogonal sum over the `2ᵐ` weights `∏_{i ∈ S}(−aᵢ)` of Tau Ceti's `TauCeti.pfisterForm a` of the
weighted block `[1, a₀]`, on `Fin (2ᵐ) × Fin 2 → F`, the direct sum of `2ᵐ` copies of `F²` (EKM, Examples 9.3–9.4 and §9.B, pp. 52–53;
Dittmann–Pop, §3, p. 6). It has dimension `2^{m+1}`, represents `1`, is nonsingular exactly when
`1 − 4a₀ ≠ 0`, and then its class lies in `I_q^{m+1}(F)`. In characteristic two it is EKM's
`⟨⟨a₁, …, aₘ, a₀]]`; with `2` invertible and `1 − 4a₀ ≠ 0`,
`quadraticPfister a a₀ ≅ ⟨⟨a₁, …, aₘ, 1 − 4a₀⟩⟩` in the
parent's minus-sign convention, so the family of nonsingular quadratic Pfister forms is the parent's
`TauCeti.pfisterForm` family. Prove that scaled `n`-fold forms generate `I_qⁿ(F)` additively for
`n ≥ 1` and that unscaled forms already do for `n ≥ 2`, through
`a ⟨⟨b; c]] = ⟨⟨ab; c]] − ⟨⟨a; c]]` (EKM, (9.5), p. 53); with `2` invertible this is
`TauCeti.fundamentalIdeal_pow_eq_addClosure`. *Needs:* Mathlib `QuadraticMap.proj`; Tau Ceti
`TauCeti.pfisterForm`, `TauCeti.fundamentalIdeal_pow_eq_addClosure` (comparison); 0.1, 0.5, 0.6.

- `quadraticPfister` evaluates to `∑_k w_k (x_{k,0}² + x_{k,0} x_{k,1} + a₀ x_{k,1}²)` with
  `w = TauCeti.pfisterForm a`, on a space of dimension `2^{m+1}`;
- representation: it represents `1` at the first basis vector;
- nonsingularity: it is nonsingular exactly when `1 − 4a₀ ≠ 0`;
- scalar extension: its coordinate extension along `K → L` is `quadraticPfister` of the mapped slots;
- comparison: with `2` invertible and `1 − 4a₀ ≠ 0` it is isometric to the parent's
  `⟨⟨a₁, …, aₘ, 1 − 4a₀⟩⟩`; with `1 − 4a₀ = 0` it is singular and has no parent counterpart;
- generation: scaled `n`-fold forms generate `I_qⁿ(F)` for `n ≥ 1`; unscaled ones generate it for
  `n ≥ 2`, and for `n = 1` when `2` is invertible; in characteristic two the unscaled one-fold forms
  span exactly the classes `[1, d]`, which need not be all of `I_q(F)`.

**Checks.**

- `m = 0`: `quadraticPfister` of the empty tuple is `[1, a₀]`, two-dimensional; it is never the
  one-dimensional `⟨1⟩`.
- Over `𝔽₂` with `a₀ = 1` the one-fold form `[1, 1]` is anisotropic; with `a₀ = 0` it is `[1, 0]`,
  hyperbolic, and every outer tensor of it is hyperbolic.
- With `2` invertible, the two-fold form with outer slot `a` and `a₀ = (1 − b)/4` is isometric to
  `⟨1, −a, −b, ab⟩`, matching the parent and Tau Ceti's `TauCeti.pfisterForm_two`; the plus-sign
  convention `⟨1, a, b, ab⟩` would differ already for `a = b = −1` over `ℚ`, where the minus-sign form
  `⟨1, 1, 1, 1⟩` is anisotropic and `⟨1, −1, −1, 1⟩` is hyperbolic.
- In characteristic two, unscaled one-fold forms need not generate `I_q(F)`: by
  `[1, d] ⊥ [1, e] ≅ [1, d + e] ⊥ ℍ` (EKM, Example 7.23, p. 44) they span only the classes `[1, d]`,
  and over `𝔽₂(t)` the class of `t [1, 1]` is not one of them, since `t [1, 1]` does not represent
  `1` (a value `t (f² + f g + g²)` has odd degree in `t`). Over `𝔽₂` they do generate: `I_q(𝔽₂) ≅ ℤ/2`
  is generated by the unscaled `[1, 1]`, although `2 = 0`; so invertibility of `2` is sufficient, not
  necessary. With `2` invertible they do generate:
  `⟨a, b⟩ = ⟨⟨−b⟩⟩ − ⟨⟨a⟩⟩` in `W(F)`, which is Tau Ceti's
  `TauCeti.fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass`.

### 1.2 Roundness of binary norm forms

Prove that the norm form of a quadratic `F`-algebra, `[1, a₀]` for `F[t]/(t² + t + a₀)`, is round:
its nonzero values equal its similarity factors (EKM, Example 9.3, pp. 52–53). Multiplication by an
element of nonzero norm is an invertible linear similarity with factor its norm, and the norm form
represents `1`. The argument covers the split and the nonreduced algebras. *Needs:* 0.1;
Tau Ceti `QuadraticMap.Represents`.

### 1.3 The roundness step

Prove that for a round form `ρ` and `a ∈ Fˣ`, `⟨⟨a⟩⟩_b ⊗ ρ = ρ ⊥ −aρ` is round, and that when `ρ` is
moreover nonsingular, `⟨⟨a⟩⟩_b ⊗ ρ` is isotropic, exactly when it is hyperbolic, exactly when
`a ∈ D(ρ)` (EKM, Proposition 9.8, p. 54). Write a nonzero value as `x − a y` with `x, y` values of
`ρ`; when both are nonzero, roundness gives `ρ ⊥ −aρ ≅ ⟨⟨a y x⁻¹⟩⟩_b ⊗ ρ`, and `1 − a y x⁻¹` is a
similarity factor of the binary bilinear Pfister form. An isotropic nonsingular round `ρ` is
universal, so every `a` lies in `D(ρ) = G(ρ)` and the tensor is hyperbolic without `ρ` itself being
hyperbolic. *Needs:* 0.3, 0.5, 1.2.

### 1.4 Roundness in every fold

State `quadraticPfister_smul_equivalent_of_represents`: for every `m`, `a : Fin m → Fˣ`, `a₀ ∈ F` and
`c ∈ Fˣ` represented by `quadraticPfister a a₀`, the form `c · quadraticPfister a a₀` is isometric to
`quadraticPfister a a₀`, in every characteristic and without a nonsingularity hypothesis (EKM,
Corollary 9.9, p. 54). Conversely every similarity factor is represented, because the form
represents `1`. The proof applies 1.3 `m` times to 1.2. With `2` invertible and `m ≤ 1`, completing
the square identifies `quadraticPfister a a₀` with the diagonal form `⟨1, −(1 − 4a₀)⟩`, respectively
`⟨1, −a₁, −(1 − 4a₀), a₁(1 − 4a₀)⟩`, and the statement is the implication from membership in the unit
value set to similarity in Tau Ceti's `TauCeti.oneFoldPfister_smul_equivalent_iff` and
`TauCeti.twoFoldPfister_smul_equivalent_iff`, which are stated as equivalences over every
commutative ring; only the comparison with the diagonal presentation uses the invertibility of `2`.
*Needs:* 1.1–1.3; Tau Ceti `QuadraticMap.Represents`, `QuadraticMap.unitValueSet`.

### 1.5 Isotropy, hyperbolicity and the Witt class

State `not_anisotropic_quadraticPfister_iff_equivalent_dualProd`: if `1 − 4a₀ ≠ 0`, then
`quadraticPfister a a₀` is isotropic exactly when it is isometric to
`QuadraticForm.dualProd F (Fin (2ᵐ) → F)` (EKM, Corollary 9.10, p. 54). Prove further that these are
equivalent to Witt index `2ᵐ` and to vanishing of the class in `I_q(F)`, and, in characteristic two,
that for an anisotropic bilinear Pfister form `β` the form `β ⊗ [1, d]` is hyperbolic exactly when
`d ∈ ℘(F) + D̃(β′)`, `β′` the pure part (EKM, Lemma 9.11, p. 54). The proof inducts on the outer
factors with 1.3: an anisotropic inner form uses the value criterion, a hyperbolic inner form stays
hyperbolic. With `2` invertible and `m + 1 = 2` this is Tau Ceti's `TauCeti.pfisterFormClass_two_tfae`.
*Needs:* 0.3, 0.5, 1.1, 1.3, 1.4; Mathlib `QuadraticForm.dualProd`.

**Checks.**

- In characteristic two, `[1, 0](0, 1) = 0` and `[1, 0]` is nonsingular, hence hyperbolic; so is every
  outer tensor `⟨⟨a⟩⟩_b ⊗ [1, 0]`.
- The nonsingularity hypothesis is needed: with `2 ≠ 0` and `a₀ = 1/4`, `[1, 1/4] = (x + y/2)²` is
  isotropic at `(1, −2)` but singular, hence not hyperbolic.
- The equivalence is false for general nonsingular forms: `ℍ ⊥ [1, 1]` over `𝔽₂` is isotropic of
  dimension four and not hyperbolic, since its anisotropic part `[1, 1]` is nonzero.
- Roundness is not a property of all forms: over `ℚ`, `⟨1, 1, 1⟩` represents `3`, but
  `3 ⟨1, 1, 1⟩ = ⟨3, 3, 3⟩` has discriminant `27`, which is `3` modulo squares, so it is not isometric
  to `⟨1, 1, 1⟩`. (The binary `⟨1, 2⟩` is no counterexample: it is the Pfister form `⟨⟨−2⟩⟩`, and
  indeed `3 x² + 6 y² = 1` at `x = y = 1/3`.)

### Examples

In characteristic two, `⟨⟨a⟩⟩_b ⊗ [1, a₀] = [1, a₀] ⊥ a[1, a₀]` (the sign is invisible); over `𝔽₂(t)`
with `a = t` and `a₀ = 1` it is anisotropic, since `[1, 1]` takes values of even `t`-degree on
polynomial vectors and `t [1, 1]` of odd degree. In characteristic different from two, the two-fold
form with outer slot `a` and `a₀ = (1 − b)/4` expands to `⟨1, −a, −b, ab⟩`; this fixes the minus-sign
convention used by the parent and by the valuation-block expansion of Layer 4.

### Dependencies

Layer 0; Tau Ceti `TauCeti.pfisterForm`, `QuadraticMap.Represents` and the low-fold roundness and
isotropy theorems of parent Layer 4 for the comparison with `2` invertible; Mathlib
`QuadraticForm.dualProd`.

## Layer 2: polynomial representation and the Arason–Pfister Hauptsatz

Everything in this layer holds in every characteristic and for quadratic forms on finite-dimensional
spaces; the coordinate scalar extension `extendScalars` of 0.2 replaces Mathlib's base change. A
statement about a form on `V` is transported to `Fin n → F` through a basis.

### 2.1 Purely transcendental extensions

Prove that an anisotropic quadratic form over `F`, nondegenerate or not, stays anisotropic over a
purely transcendental extension `F(T)`, `T` a finite tuple of variables, with no hypothesis on the
size of `F`; hence restriction `I_q(F) → I_q(F(T))` is injective (EKM, Lemma 7.15, p. 43;
Remark 8.18, p. 51). After clearing denominators, a nonzero polynomial vector `v(t)` with highest
coefficient `v_d ≠ 0` has `q(v(t))` of degree `2d` with leading coefficient `q(v_d) ≠ 0`; iterate over
the variables, and use 0.5 for the Witt statement. *Needs:* 0.2, 0.3, 0.5; Mathlib `RatFunc`,
`MvPolynomial`.

**Checks.**

- Over `𝔽₂`, `[1, 1]` stays anisotropic over `𝔽₂(t)`: on polynomial vectors it takes values of even
  degree with leading coefficient `1`.
- Over `ℚ`, `⟨1, 1⟩` stays anisotropic over `ℚ(t)`, while `⟨1, −t⟩` over `ℚ(t)` is a form that is not
  defined over `ℚ` and is not covered; it becomes isotropic over `ℚ(√t)`.
- An algebraic extension does not preserve anisotropy: `[1, 1]` splits over `𝔽₄`.

### 2.2 The Cassels–Pfister theorem

State `exists_extendScalars_polynomial_eq`: for an arbitrary quadratic form `Q` on `Fin n → F` and a
polynomial `h ∈ F[t]`, if `h` is a value of `extendScalars Q F(t)` then it is a value of
`extendScalars Q F[t]` on a polynomial vector (EKM, Theorem 17.3, p. 71). Prove also the
constrained form: if `q` is anisotropic, `s ∈ V` and `v ∈ V(t)` have `q(v)` and `b_q(s, v)` in
`F[t]`, there is `w ∈ V[t]` with `q(w) = q(v)` and `b_q(s, w) = b_q(s, v)` (Proposition 17.9,
pp. 72–73). For anisotropic `q`, choose `v` with denominator `f` of least degree, divide `f v = f u + r`
with `deg r < deg f`, and reflect in `r`, which is anisotropic; the reflected vector has smaller
denominator. For the constrained form, `b_q(s, r)` is divisible by `f` and of smaller degree, hence
zero, so the reflection fixes `s`. For isotropic `q`, first pass to the quotient by the quadratic
radical (the vectors of value zero in the polar kernel, EKM, Lemma 7.12), which has the same values
over `F(t)` and over `F[t]`; if the quotient is anisotropic, the denominator descent above applies to
it, and otherwise it splits off a hyperbolic plane (EKM, Proposition 7.13, p. 42) with hyperbolic pair `e, e′`,
and `h` is the value of `h e + e′`. *Needs:* 0.2, 0.3, 2.1; Mathlib `Polynomial`, `RatFunc`.

**Checks.**

- `h = 0` is the value of `w = 0`; the statement needs no anisotropy and no nonvanishing hypothesis.
- An isotropic form need not be universal over `F[t]`: `q(x, y) = x²` on `ℚ²` vanishes at `(0, 1)`
  but never takes the value `−1`; its quotient by the quadratic radical is the anisotropic line `⟨1⟩`,
  where the denominator descent applies. Likewise `⟨1, 1⟩ = (x + y)²` over `𝔽₂` is isotropic, does
  not take the value `t` over `𝔽₂(t)`, and reduces to `⟨1⟩`.
- For `q = ⟨1, 1⟩` over `ℚ`, `h = t² + 1` is the value of `(t, 1)`, and Cassels–Pfister forbids `h = 3`
  from being a sum of two squares in `ℚ(t)` since it is not one in `ℚ` (`3` is not a sum of two
  rational squares, by reduction modulo `3`).
- The theorem is about vectors over `F[t]`, not `F[T]` in several variables: over `ℝ`, the Motzkin
  polynomial `x⁴y² + x²y⁴ − 3x²y² + 1` is a sum of four squares in `ℝ(x, y)` but of no number of
  squares in `ℝ[x, y]`.

### 2.3 The substitution principle and the representation theorem

Prove the substitution principle: if `h ∈ D(q_{F(T)})` is defined and nonzero at `x ∈ Fⁿ`, then
`h(x) ∈ D(q)` (EKM, Corollary 17.7, p. 72). State the representation theorem
`isRepresentedBy_iff_forall_represents_extendScalars`: for anisotropic `q, ψ` over `F`, the
conditions `D(ψ_E) ⊆ D(q_E)` for every extension `E/F` (nonzero values, through `extendScalars`) and
`ψ` being isometric to a subform of `q` (Tau Ceti's `QuadraticMap.IsRepresentedBy`) are equivalent,
including for the zero-dimensional `ψ`; when `dim ψ = n ≥ 1` they are also equivalent to
`ψ(T) ∈ D(q_{F(T)})`, `T = (t₁, …, tₙ)`; in particular `dim ψ ≤ dim q` (EKM, Theorem 17.12,
pp. 73–74, whose generic-value clause needs `n ≥ 1`). Write `ψ` as an orthogonal sum of nonsingular binary blocks and a diagonal part (EKM,
Propositions 7.29 and 7.31, pp. 45–46), remove binary blocks with the constrained Cassels–Pfister
theorem, and treat the diagonal part one variable at a time with the substitution principle and
reflections in differences `x − y`, anisotropic since `q` is. No Witt extension theorem for a
possibly singular complement is used. *Needs:* 0.1, 0.3, 2.1, 2.2; Tau Ceti
`QuadraticMap.IsRepresentedBy`.

**Checks.**

- Over `𝔽₂(t)`, `ψ = [1, 1]` and `q = [1, 1] ⊥ t[1, 1]`: `ψ` is a subform, so `D(ψ_E) ⊆ D(q_E)` for every
  `E` and `ψ(T)` is a value of `q` over `F(T)`.
- The anisotropy of `q` is needed: `q = ℍ` represents every `ψ(T)` but contains no anisotropic
  subform of dimension two.
- Dimension bound: an anisotropic `q` of dimension `2` cannot contain `ψ = ⟨1, 1, 1⟩` over `ℚ`.
- The zero-dimensional `ψ` and `q = ⟨1⟩` over `ℚ`: the value-set inclusion `∅ ⊆ D(q_E)` and the subform
  condition both hold, while `ψ(T) = 0` is not in `D(q_{F(T)}) ⊆ F(T)ˣ`; the generic-value clause
  needs `dim ψ ≥ 1`.

### 2.4 Transfer in characteristic two

For a finite field extension `E/F` and a nonzero `F`-linear `s : E → F`, use Tau Ceti's
`QuadraticMap.scharlauTransfer` (the form `s ∘ q` on `V` viewed over `F`, defined in every
characteristic) and its polar identity `QuadraticMap.polar_scharlauTransfer`; define the bilinear
transfer `β ↦ s ∘ β` likewise. Prove that transfers preserve orthogonal sums and isometries (EKM,
Lemma 20.1, p. 83), Frobenius reciprocity `s_*(β_E ⊗ ψ) ≅ β ⊗ s_*(ψ)` and `s_*(γ ⊗ φ_E) ≅ s_*(γ) ⊗ φ`
(Proposition 20.2, p. 83), nondegeneracy of transfers of nondegenerate bilinear forms and of
nonsingular even-dimensional quadratic forms (Lemma 20.4, p. 83), and hyperbolicity of transfers of
hyperbolic forms (Corollary 20.5, pp. 83–84). Hence `s_*` descends to `W_b(E) → W_b(F)` and
`I_q(E) → I_q(F)`, `W_b`-linearly; a different nonzero functional is `s(c ·)` for a unique `c ∈ Eˣ`
(Corollary 20.7, p. 84). For `E = F(x)` of degree `n` and the functional `s(1) = 1`, `s(xⁱ) = 0` for
`1 ≤ i < n` (EKM, (20.8), p. 84), compute `s_*⟨1⟩_b`, `s_*⟨x⟩_b` and
`s_*⟨⟨x⟩⟩_b = ⟨⟨N_{E/F} x⟩⟩_b` in `W_b(F)` (Lemmas 20.9 and 20.12, Corollary 20.13, pp. 84–85). With
`2` invertible these descents are Tau Ceti's `TauCeti.WittRing.scharlauTransfer` and
`TauCeti.WittRing.scharlauTransfer_baseChange_mul`. *Needs:* Tau Ceti
`QuadraticMap.scharlauTransfer`, `QuadraticMap.polar_scharlauTransfer`; 0.2–0.5.

- descent: a nonzero functional induces `W_b(F)`-linear maps `W_b(E) → W_b(F)` and
  `I_q(E) → I_q(F)`;
- reciprocity: `s_*(β_E · q) = β · s_*(q)` and `s_*(γ · φ_E) = s_*(γ) · φ`;
- change of functional: `(s(c ·))_*(q) = s_*(c q)`;
- norm formula: for the power-basis functional, `s_*⟨⟨x⟩⟩_b = ⟨⟨N x⟩⟩_b`.

**Checks.**

- For `E = F` and `s = id`, the transfer is the identity on classes.
- For a purely inseparable quadratic extension `E = F(√c)` in characteristic two the trace is zero;
  `QuadraticMap.scharlauTransfer` along the zero functional is the zero form, which is singular. A
  nonzero functional such as `s(1) = 1, s(√c) = 0` gives a nonsingular transfer of `ℍ_E`.
- The transfer of `x y` over `E` is a sum of `[E : F]` hyperbolic planes over `F`.
- For `E = F(x)` of degree `2` with `N x = a`, `s_*⟨1⟩_b = ⟨1, −a⟩_b` and `s_*⟨x⟩_b = 0` in `W_b(F)`,
  so `s_*⟨⟨x⟩⟩_b = ⟨1, −a⟩_b = ⟨⟨a⟩⟩_b`.

### 2.5 Springer's theorem

State `anisotropic_extendScalars_of_odd_finrank`: an anisotropic quadratic form `Q` on `Fin n → F`
stays anisotropic over every finite extension `L/F` of odd degree, in every characteristic and for
inseparable `L` (EKM, Corollary 18.5, p. 77). Hence restriction `I_q(F) → I_q(L)` is injective for odd
`[L : F]` (Corollary 18.6). The route reduces to a simple extension `F(θ)` of odd degree `n` with
monic minimal polynomial `p`; lift an isotropic vector to a primitive polynomial vector `v` of
coordinate degrees `< n`, write `q(v) = p g` with `deg g = 2d − n` odd and `< n`, and pass to an
odd-degree irreducible factor of `g`, contradicting minimality; EKM's route goes through the
quadratic value theorem (Theorem 18.3, p. 76). *Needs:* 0.2, 0.3, 0.5, 2.1; Mathlib `Polynomial`.

**Checks.**

- `[1, 1]` over `𝔽₂` stays anisotropic over `𝔽₈` (degree three), and splits over `𝔽₄` (degree two).
- Over `ℚ`, `⟨1, 1⟩` stays anisotropic over `ℚ(∛2)` and splits over `ℚ(i)`.
- Inseparable extensions are covered: in characteristic three, `⟨1, t⟩` is anisotropic over `𝔽₃(t)`
  and stays anisotropic over the purely inseparable cubic `𝔽₃(s)`, `s³ = t`, since `−t = s² · (−s)` is
  not a square there. In characteristic two an extension of odd degree is separable, its inseparable
  degree being a power of two.

### 2.6 The similarity norm principle

State `smul_equivalent_of_smul_equivalent_extendScalars`: for a nondegenerate even-dimensional `q`
and a finite extension `E/F`, separable or not, `N_{E/F}(G(q_E)) ⊆ G(q)` (EKM, Theorem 20.14, p. 86). For `E = F(x)` with `x ∈ G(q_E)`, transfer the
zero class `⟨⟨x⟩⟩_b · q_E` with the power-basis functional and use 2.4; equal dimension turns the
Witt equality into a similarity. For general `E`, reduce to `F(x)` by parity of `[E : F(x)]` and 2.5.
*Needs:* 2.4, 2.5, 0.3, 0.5; Mathlib `Algebra.norm`.

**Checks.**

- `E = F`: the statement is `G(q) ⊆ G(q)`.
- For `q = [1, 1]` over `𝔽₂(t)` and `E = 𝔽₄(t)`, `q_E` is hyperbolic, `G(q_E) = Eˣ`, and the norm
  group `N(𝔽₄(t)ˣ)` is the group of values of `[1, 1]`, which equals `G([1, 1])` by roundness.
- With `2` invertible, `q = ⟨1, −a⟩` and `E = F(√a)`: `q_E` is hyperbolic, `G(q_E) = Eˣ`, and
  `N(Eˣ)` is the set of nonzero values of `x² − a y²`, which is `D(q) = G(q)` by roundness.
- Inseparable `E` is included: for `E = 𝔽₂(s)`, `s² = t`, over `F = 𝔽₂(t)` and `q = [1, 1]`, the norm of
  `c ∈ Eˣ` is `c²`; if `c = [1, 1](x, y)` with `x, y ∈ E` (by roundness these are the similarity
  factors of `q_E`), then `c² = [1, 1](x², y²)` with `x², y² ∈ F`, so the inclusion holds although the
  field trace of `E/F` is zero. The element `s` itself is not a similarity factor of `q_E`: values of
  `[1, 1]` over `𝔽₂(s)` have even degree in `s`.

### 2.7 Odd-divisor specialization

Prove: for a nondegenerate even-dimensional `q` over `F`, a nonzero `f ∈ F[T]` and an irreducible `p`
dividing `f` to an odd power, `q_{F(T)} ≅ f q_{F(T)}` implies that `q` is hyperbolic over the residue
field `F(p)` of `p` (EKM, Proposition 19.8, p. 80). Pass to the completion of the discrete valuation
ring `F[T]_{(p)}` (any henselian DVR with the same residue field works), write `f = u p` up to a
square with `u` a unit, split off hyperbolic planes of the residue form by Hensel lifting along a
nonzero polar derivative (Lemmas 19.2 and 19.4, pp. 79–80), and use that `ψ ⊥ −uπψ` is anisotropic
for anisotropic residue form (Lemma 19.5 and Proposition 19.7, p. 80). The unit `u` is absorbed into
the uniformizer, not discarded. *Needs:* 0.2, 0.3, 0.5, 2.1; Mathlib `HenselianLocalRing`,
`AdicCompletion`.

**Checks.**

- `q = [1, 1]`, `F = 𝔽₂`, `f = t² + t + 1`: `q` becomes hyperbolic over `F(f) = 𝔽₄`, and `f` is the
  value `[1, 1](t, 1)`, a similarity factor of `q_{F(t)}` by roundness.
- `f = t²` has no divisor of odd multiplicity and is always a similarity factor; no conclusion.
- Residue characteristic two is included: the polar form of `q` over the DVR stays nonsingular.

### 2.8 The quadratic similarity theorem

State `quadraticSimilarity_tfae`: for a nondegenerate even-dimensional `q` and a nonzero
`f ∈ F[T] = F[t₁, …, tₙ]`, the conditions `f* f ∈ G(q_{F(T)})` (with `f*` the leading coefficient of
`f` in the lexicographic order of EKM, p. 77, in which `t₁` is the most significant variable; this is
Mathlib's `MonomialOrder.lex` on `Fin n`, index `0` being `t₁`), `a f ∈ G(q_{F(T)})` for some `a ∈ Fˣ`,
and hyperbolicity of `q_{F(p)}` for every irreducible `p` dividing `f` to an odd power (Mathlib's
`multiplicity p f` odd), are equivalent (EKM, Lemma 20.15 and Theorem 20.16, pp. 86–87). The last
condition is stated through every field receiving `F[T]` with kernel exactly `(p)`, each of which
contains `F(p)`. Necessity
is 2.7. For sufficiency in one variable, a monic irreducible `p` is the norm of `t − θ` from
`F(θ)(t)`, hyperbolicity makes `t − θ` a similarity factor there, and 2.6 brings `p` down; in several
variables induct with Gauss's lemma and 2.1, as in EKM. *Needs:* 2.1, 2.6, 2.7, 0.2; Mathlib
`MonomialOrder.lex`, `MonomialOrder.leadingCoeff`, `multiplicity`, `FractionRing`.

**Checks.**

- `n = 1`, `q = [1, 1]` over `𝔽₂`, `f = t`: `F(t)` at `p = t` has residue field `𝔽₂`, where `q` is not
  hyperbolic, so no `a t` is a similarity factor; indeed `t ∉ D(q_{𝔽₂(t)})` by degree parity.
- Constant `f = c`: the condition on divisors is empty, `c⁻¹ f = 1` is a similarity factor, and
  `f* f = c²` is one too.
- The leading coefficient is lexicographic, not graded: for `f = 2 t₁ + t₂²` the exponent `(1, 0)`
  exceeds `(0, 2)`, so `f* = 2`, whereas a degree-first order would pick `t₂²` and the coefficient `1`.

### 2.9 The function field of a quadric

For an irreducible quadratic form `ψ` on `V` (for instance anisotropic of dimension at least two),
define `F(ψ)` as the field of degree-zero elements in the fraction field of the graded domain
`Sym(V*)/(ψ)`, the function field of the projective quadric `X_ψ` (EKM, §22, pp. 93–94), with Mathlib's
`HomogeneousLocalization`. Prove that `ψ` is isotropic over `F(ψ)`; that `F(ψ)` is the fraction field
of the affine chart `x_i = 1` for every coordinate with `x_i ≠ 0` on `X_ψ`, the identifications being
compatible; that `trdeg F(ψ)/F = dim V − 2`; that the fraction field of `Sym(V*)/(ψ)` is purely
transcendental of degree one over `F(ψ)`; that `X_ψ` is smooth exactly when `ψ` is nondegenerate
(Proposition 22.1, p. 93); and that for an anisotropic binary `ψ`, `F(ψ)` is the quadratic algebra
attached to `ψ` (Example 22.2, p. 94). A form `ψ` of dimension two is irreducible exactly when it is
anisotropic; a regular form of dimension at least three is irreducible. *Needs:* Mathlib
`HomogeneousLocalization`, `MvPolynomial`, `Algebra.trdeg`; 0.1, 0.2, 2.1.

- isotropy: `ψ` extended to `F(ψ)` has a nonzero zero, the generic point;
- charts: the degree-zero fraction field is the fraction field of every nonempty affine chart;
- dimension: `trdeg F(ψ)/F = dim V − 2`;
- binary case: for anisotropic binary `ψ`, `F(ψ)` is the quadratic extension it defines.

**Checks.**

- For `[1, 1]` over `𝔽₂`, the chart `y = 1` gives `t² + t + 1 = 0` and `F(ψ) = 𝔽₄`, not `𝔽₂(t)`; the
  fraction field of the affine cone would carry an extra transcendental coordinate.
- For `ψ = ⟨1, 1, 1⟩` over `ℚ`, `F(ψ)` is the function field of the conic `x² + y² + z² = 0`, of
  transcendence degree one, and `ψ` is isotropic there.
- `ℍ = x y` is reducible (`X_ℍ` is two points) and has no function field: irreducibility is a
  hypothesis.

### 2.10 The subform theorem

State `isRepresentedBy_smul_of_forall_equivalent_dualProd`: let `q` be an anisotropic quadratic form
on `Fⁿ` and `ψ` an anisotropic quadratic form on `Fᵐ` whose coordinate polynomial `ψ(T) ∈ F[T₁, …, Tₘ]`
is irreducible, such that `q_{F(ψ)}` is hyperbolic; then for every nonzero `a ∈ D(q)` and `b ∈ D(ψ)`,
`a b ψ` is isometric to a subform of `q`, and `dim ψ ≤ dim q` (EKM, Proposition 22.4 and Theorem 22.5,
p. 94). Hyperbolicity over `F(ψ)` is stated through every field `L` receiving `F[T]` with kernel
exactly `(ψ(T))`: every such `L` contains the fraction field of `F[T]/(ψ(T))`, which is purely
transcendental of degree one over `F(ψ)` (2.9), so hyperbolicity over `F(ψ)` ascends to every `L`,
and conversely hyperbolicity over that fraction field descends to `F(ψ)` because the anisotropic
part of the nonsingular form `q_{F(ψ)}` (0.3) stays anisotropic over `F(ψ)(x)` (2.1). The source's
nonzero `q` is forced by `a ≠ 0`. Hyperbolicity forces `q` nondegenerate of even dimension; 2.8 makes
`b ψ(T)` a similarity factor of `q_{F(T)}`, so `a b ψ(T) ∈ D(q_{F(T)})`, and 2.3 gives the subform.
*Needs:* 0.3, 2.1, 2.3, 2.8, 2.9, 1.4; Mathlib `Irreducible`, `MvPolynomial.X`, `RingHom.ker`,
`Ideal.span`; Tau Ceti `QuadraticMap.IsRepresentedBy`, `QuadraticMap.Represents`.

**Checks.**

- `q = [1, 1] ⊥ t[1, 1]` over `𝔽₂(t)` and `ψ = [1, 1]`: `F(ψ) = 𝔽₄(t)`, `q` is hyperbolic there, and
  `ψ ⊆ q` with `a = b = 1`.
- Anisotropy of `q` is needed: `q = ℍ` is hyperbolic over every field but has no anisotropic subform
  of dimension two.
- The bound can be strict: `q = ⟨⟨t, s⟩⟩_b ⊗ [1, 1]` over `𝔽₂(s, t)` is hyperbolic over `F([1, 1])` and
  has dimension eight while `dim ψ = 2`.
- Irreducibility of the coordinate polynomial excludes small `ψ`: the line `⟨c⟩` has `ψ(T) = c T₁²`,
  a product of two linear forms, and the zero-dimensional form has `ψ(T) = 0`; neither is
  irreducible, so no field `L` with kernel `(ψ(T))` is asked for. The zero form `q` on `F⁰` is
  hyperbolic over every field with `k = 0`, but represents no nonzero `a`, so the conclusion is
  never asserted for it.

### 2.11 The Arason–Pfister Hauptsatz

Prove, in every characteristic: for `n ≥ 1` and a nonzero anisotropic quadratic form `q` whose class
lies in `I_qⁿ(F)`, `dim q ≥ 2ⁿ`; equivalently a nonsingular form of dimension less than `2ⁿ` with
class in `I_qⁿ(F)` is hyperbolic (EKM, Theorem 23.7(1), p. 100). The statement
`two_pow_le_finrank_of_wittClass_mem_fundamentalIdeal_pow` records it for `2` invertible, on Tau Ceti's
`TauCeti.formClass`, `TauCeti.wittClass` and `TauCeti.fundamentalIdeal`, with a nondegenerate
anisotropic form on a nonzero finite-dimensional space; `n = 0` is included and says `dim q ≥ 1`.
The route writes `[q]` as a sum of `r` scaled anisotropic `n`-fold Pfister classes (1.1) and inducts
on `r`: over the function field of the last Pfister form that form is hyperbolic (1.5); if `q` stays
non-hyperbolic there, its anisotropic part has dimension at least `2ⁿ` by induction; if it becomes
hyperbolic, the subform theorem embeds a multiple of the Pfister form in `q`. *Needs:* 0.3, 0.5, 0.6,
1.1, 1.5, 2.9, 2.10; Tau Ceti `TauCeti.formClass`, `TauCeti.wittClass`, `TauCeti.fundamentalIdeal`
(for the recorded statement).

**Checks.**

- `n = 1`: a nonzero anisotropic form in `I_q` has even dimension, so at least `2`; over `𝔽₂`,
  `[1, 1]` attains it.
- `n = 2` over `ℚ`: `⟨1, 1, 1, 1⟩ = ⟨⟨−1, −1⟩⟩` is anisotropic of dimension four in `I²`; the form
  `⟨1, 1⟩` has class in `I` but not in `I²` (its signed discriminant is `−1`, not a square), consistent
  with the bound.
- The equivalent formulation allows isotropic forms: `ℍ ⊥ ℍ ⊥ ℍ` has class `0 ∈ Iⁿ` for every `n` and
  dimension six, and it is hyperbolic.
- Over `ℝ`, `⟨1, 1⟩` is anisotropic with class in `I(ℝ)` but not in `I(ℝ)²` (its signature `2` is not
  divisible by `4`); its dimension two is consistent with `n = 1` and would contradict the bound for
  `n = 2`, so a construction of `I²` containing it is wrong.

### Examples

Over `𝔽₂`, the binary form `[1, 1]` with function field `𝔽₄` shows that the projective, not the affine,
quadric is required: the chart `y = 1` gives `t² + t + 1 = 0`. Over `𝔽₂(t)`, `q = [1, 1] ⊥ t[1, 1]` is
the two-fold Pfister form `⟨⟨t⟩⟩_b ⊗ [1, 1]`, anisotropic by degree parity, in `I_q²`, of dimension
`4 = 2²`, which the Hauptsatz allows; it is hyperbolic over `𝔽₄(t)` and contains `[1, 1]`, as the subform
theorem predicts.

### Dependencies

Layers 0 and 1; Tau Ceti `QuadraticMap.scharlauTransfer`, `QuadraticMap.polar_scharlauTransfer`,
`QuadraticMap.IsRepresentedBy`, and for `2` invertible the Witt-ring transfer and the Witt classes;
Mathlib `Polynomial`, `RatFunc`, `MvPolynomial`, `HomogeneousLocalization`, `HenselianLocalRing`,
`AdicCompletion`, `Algebra.trdeg`.

## Layer 3: higher cohomological invariants

### 3.1 Coefficient groups

For `n ≥ 1` define the coefficient group `H_qⁿ(F) = Hⁿ(F, ℤ/2(n − 1))` of the quadratic invariants
(Dittmann–Pop, §2, pp. 3–4, and footnote 2; EKM, §101, pp. 402–404), in two branches.

When `char F ≠ 2`, `H_qⁿ(F)` is the continuous cohomology `Hⁿ(G_F, 𝔽₂)` of the absolute Galois group
with trivial `𝔽₂` coefficients, Mathlib's `continuousCohomology n` of Tau Ceti's
`TauCeti.trivialF2 (TauCeti.AbsoluteGaloisGroup F)`, identified with `Hⁿ(G_F, μ₂^{⊗(n−1)})` through `μ₂ ≅ ℤ/2`.
Products are `TauCeti.trivialF2TopPairing`'s cup. Define restriction along a field homomorphism
`F → E`, finite or not, as the pullback `TauCeti.trivialF2Map` along the continuous homomorphism
`G_E → G_F` obtained by extending `F → E` to an embedding `Fˢ → Eˢ` (Mathlib's `IsSepClosed.lift`)
and restricting automorphisms to the image of `Fˢ`, which is normal over `F`. Prove that it does not
depend on the extension: two extensions differ by an element of `G_F`, so the two homomorphisms
differ by an inner automorphism of `G_F`, which acts trivially on cohomology
(`TauCeti.ContinuousCohomology.map_eq_id_of_inner`); prove that for a finite extension with a chosen
embedding into `Fˢ` it is Tau Ceti's `TauCeti.galoisRes`, and that it sends the Kummer class of `a`
to the Kummer class of the image of `a` (Tau Ceti's `TauCeti.galoisRes_kummerClass` in the finite
case). Define `kummerSymbol n a = (a₁) ∪ ⋯ ∪ (aₙ₊₁)` for
`a : Fin (n + 1) → Fˣ`, from left to right, with `TauCeti.kummerClass` in degree one.

When `char F = 2`, define Kato's group `H₂ⁿ(F) = Ω^{n−1}_F / (dΩ^{n−2}_F + ℘ Ω^{n−1}_F)`, where
`Ω^j_F` is the `j`-th exterior power of Mathlib's `KaehlerDifferential` of `F` over its prime field
and `℘ = C⁻¹ − 1 : Ω^{n−1}_F → Ω^{n−1}_F/dΩ^{n−2}_F` is the inverse Cartier operator of
`KTheoryFiniteLocalFields` §3.0 minus the identity, so that
`℘(a · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}) = (a² − a) · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}`. Prove that
`H₂ⁿ(F) ≅ H¹(G_F, ν(n − 1))`, the first Galois cohomology of the logarithmic forms `ν_{Fˢ}(n − 1)` of
`KTheoryFiniteLocalFields` §3.0, through the exact sequence
`0 → ν(n − 1) → Ω^{n−1}_{Fˢ} → Ω^{n−1}_{Fˢ}/dΩ^{n−2}_{Fˢ} → 0` (surjectivity of `1 − C⁻¹` over the
separable closure) and the vanishing of `H¹(G_F, Ω^{n−1}_{Fˢ})` (additive Hilbert 90, `Ω^{n−1}_{Fˢ}` being
induced); in degree one this is the Artin–Schreier group `F/℘F = H¹(G_F, ℤ/2)` (`SchemeAndStackFoundations`
§2.11). For `a₀ ∈ F` and `b₁, …, b_{n−1} ∈ Fˣ` define the symbol
`[a₀ · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}] ∈ H₂ⁿ(F)`, and restriction along every field homomorphism through
the induced map on Kähler forms, inseparable extensions included. *Needs:* Mathlib
`continuousCohomology`, `IsSepClosed.lift`; Tau Ceti `TauCeti.trivialF2`, `TauCeti.kummerClass`,
`TauCeti.trivialF2TopPairing`, `TauCeti.trivialF2Map`, `TauCeti.ContinuousCohomology.map_eq_id_of_inner`,
`TauCeti.galoisRes`, `TauCeti.galoisRes_kummerClass`; `ProfiniteCohomology` Layers 10 and 12; `KTheoryFiniteLocalFields` §3.0;
`SchemeAndStackFoundations` §§2.11, 2.15; Mathlib `KaehlerDifferential`.

- `kummerSymbol` is multilinear in its slots (each slot through `TauCeti.kummerClass`, a homomorphism
  from `Fˣ`), and its restriction along a field homomorphism `F → E` is `kummerSymbol` of the image
  slots, by `TauCeti.trivialF2Map_cup` and the restriction of Kummer classes;
- in characteristic two, the symbol is additive in `a₀`, vanishes for `a₀ ∈ ℘F`, and vanishes when
  some `bᵢ` is a square;
- comparison: `H₂ⁿ(F) ≅ H¹(G_F, ν(n − 1))`, and `H₂¹(F) = F/℘F`;
- restriction: identity and composition laws for both branches, independence of the chosen embedding
  of separable closures, and agreement with `TauCeti.galoisRes` on finite extensions.

**Checks.**

- `H_q¹(𝔽₂) = 𝔽₂/℘(𝔽₂) = 𝔽₂ ≅ ℤ/2`, since `℘(0) = ℘(1) = 0`; étale cohomology with `μ₂` coefficients
  would give `0`, as `μ₂(𝔽₂^s)` is trivial.
- For a perfect field of characteristic two, `Ω¹_F = 0`, so `H₂ⁿ(F) = 0` for `n ≥ 2`; for finite fields
  this matches `I_q²(𝔽_q) = 0`, every form of dimension at least three over a finite field being
  isotropic. For `𝔽₂(t)`, `Ω¹ = 𝔽₂(t) dt` and `[1 · dt/t] ≠ 0` in `H₂²(𝔽₂(t))`.
- With `2` invertible, `H_q¹(F) = Hom(G_F, ℤ/2) ≅ Fˣ/(Fˣ)²` by Kummer theory, and
  `kummerSymbol 0 ![a] = 0` exactly when `a` is a square; for separably closed `F` every `H_qⁿ(F)`,
  `n ≥ 1`, vanishes in both branches.

### 3.2 The Milnor homomorphism

For `char F ≠ 2`, construct the graded ring homomorphism
`s : K_*ᴹ(F)/2 → ⊕ₙ I(F)ⁿ/I(F)ⁿ⁺¹` sending `{a₁, …, aₙ}` to the class of `⟨⟨a₁, …, aₙ⟩⟩`, using the
relations `⟨⟨u⟩⟩ ⟨⟨1 − u⟩⟩ = 0` and `⟨⟨u⟩⟩ + ⟨⟨v⟩⟩ − ⟨⟨uv⟩⟩ = ⟨⟨u⟩⟩⟨⟨v⟩⟩ ∈ I²` (Morel, §1, (1)–(2),
p. 64; EKM, (5.1), p. 28); prove that it is surjective in every degree by
`TauCeti.fundamentalIdeal_pow_eq_addClosure` and natural for field extensions. Prove that `s₀`, `s₁`
and `s₂` are isomorphisms for every field of characteristic different from two (EKM, (4.11) and
Proposition 4.13, p. 25, and Proposition 5.3, p. 29). In degrees zero and one the inverses are the
dimension index `TauCeti.WittRing.dimMod2` and the signed discriminant `TauCeti.signedDiscrHom`, whose
kernel is `I²`. In degree two, prove the presentation of `I(F)²` as the abelian group on the two-fold
classes `⟨⟨a, b⟩⟩`, `a, b ∈ Fˣ`, subject to `⟨⟨1, 1⟩⟩ = 0` and
`⟨⟨ab, c⟩⟩ + ⟨⟨a, b⟩⟩ = ⟨⟨a, bc⟩⟩ + ⟨⟨b, c⟩⟩` (EKM, Theorem 4.22, p. 27); show that isometric two-fold
Pfister forms have equal symbols in `K₂ᴹ(F)/2`, by Witt cancellation and the relation
`{a, x² − a y²} = 0` that the Steinberg relation gives modulo two (EKM, Lemma 5.2, p. 29). Then
`⟨⟨a, b⟩⟩ ↦ {a, b}` is a homomorphism `I(F)² → K₂ᴹ(F)/2`; it kills every three-fold generator, since
`⟨⟨a, b, c⟩⟩ = ⟨⟨a, c⟩⟩ + ⟨⟨b, c⟩⟩ − ⟨⟨ab, c⟩⟩` and the symbol is bilinear, hence kills `I(F)³`, and it
is inverse to `s₂`. *Needs:* `K2SymbolsBrauer` §§5.4–5.8; Tau Ceti `TauCeti.pfisterClass`,
`TauCeti.fundamentalIdeal`, `TauCeti.fundamentalIdeal_pow_eq_addClosure`, `TauCeti.WittRing.dimMod2`,
`TauCeti.signedDiscrHom`, `TauCeti.equivalent_of_equivalent_prod`; 1.1.

- symbols: `s{a₁, …, aₙ} = ⟨⟨a₁, …, aₙ⟩⟩ mod Iⁿ⁺¹`;
- surjectivity in every degree; naturality for field homomorphisms;
- low degrees: `s₀`, `s₁` and `s₂` are isomorphisms for every field of characteristic different from
  two, and the inverse of `s₂` sends the class of `⟨⟨a, b⟩⟩` to `{a, b}`.

**Checks.**

- Degree zero: `1 ↦ ⟨1⟩`, the generator of `W/I ≅ ℤ/2`.
- `{u, 1 − u} ↦ ⟨⟨u, 1 − u⟩⟩ = 0` for `u ≠ 0, 1`: `⟨1, −u, −(1 − u), u(1 − u)⟩` is isotropic at
  `(1, 1, 1, 0)` and therefore hyperbolic.
- Degree one: `{a} ↦ ⟨1, −a⟩ mod I²`; `{a²} = 2{a} = 0` maps to `⟨1, −a²⟩ ≅ ℍ`, zero.
- Degree two over `ℝ`: `s₂{−1, −1} = ⟨1, 1, 1, 1⟩` has signature `4`, while every element of `I(ℝ)³`
  has signature in `8ℤ`; so `s₂{−1, −1} ≠ 0`, as injectivity requires of the nonzero symbol
  `{−1, −1}`. A candidate inverse `⟨⟨a, b⟩⟩ ↦ {a, −b}` (the plus-sign convention) would send the
  hyperbolic `⟨⟨2, −1⟩⟩ = ⟨1, −2, 1, −2⟩` (zero at `(1, 1, 1, 0)`) to `{2, 1} = 0` but the hyperbolic
  `⟨⟨−1, 2⟩⟩` to `{−1, −2} = {−1, −1} ≠ 0`, so it is not well defined.

### 3.2a The Milnor conjecture for the prime fields

Prove: for `k = 𝔽_p` with `p` an odd prime and for `k = ℚ`, the Milnor homomorphism
`sₙ(k) : Kₙᴹ(k)/2 → I(k)ⁿ/I(k)ⁿ⁺¹` of 3.2 is an isomorphism for every `n ≥ 0` (Morel, proof of
Theorem 1.1 from Theorem 1.3, p. 66, where it is attributed to Milnor). This is hypothesis `H1(N)` of
Morel's Theorem 1.3 (p. 65) at the prime field, for every `N`, the base of the induction of 3.5. In
degrees `n ≤ 2` it is the low-degree statement of 3.2, which holds over every field of characteristic
different from two. For `k = 𝔽_p` and `n ≥ 2`, `Kₙᴹ(𝔽_p) = 0` (`K2SymbolsBrauer` §5.12), so the
surjection `sₙ` has zero source, hence zero target, and is an isomorphism. For `k = ℚ` and `n ≥ 3`,
`Kₙᴹ(ℚ) ≅ ℤ/2` through the sign at the real place (`K2SymbolsBrauer` §10.32 with `r₁ = 1`), so
`Kₙᴹ(ℚ)/2` has order two and the surjection `sₙ` is bijective once its target is nonzero. The target
is nonzero because `⟨⟨−1, …, −1⟩⟩ = 2ⁿ⟨1⟩` does not lie in `I(ℚ)ⁿ⁺¹`: base change
`TauCeti.WittRing.baseChange` to `ℝ` maps `I(ℚ)ⁿ⁺¹` into `I(ℝ)ⁿ⁺¹`
(`TauCeti.WittRing.baseChange_mem_fundamentalIdeal_pow`), and the signature `W(ℝ) ≅ ℤ` maps `I(ℝ)ⁿ⁺¹`
into `2ⁿ⁺¹ℤ`, because its additive generators, the `(n + 1)`-fold Pfister classes
(`TauCeti.fundamentalIdeal_pow_eq_addClosure`), have signature `2ⁿ⁺¹` when every slot is negative and
`0` otherwise, while `2ⁿ⟨1⟩` has signature `2ⁿ`. *Needs:* 3.2; `K2SymbolsBrauer` §§5.4, 5.12 and
10.32; `QuadraticFormInvariants` Layer 4 (the signature isomorphism `W(ℝ) ≅ ℤ`); Tau Ceti
`TauCeti.WittRing.baseChange`, `TauCeti.WittRing.baseChange_mem_fundamentalIdeal_pow`,
`TauCeti.fundamentalIdeal_pow_eq_addClosure`.

**Checks.**

- `𝔽₃`, degrees one and two: `⟨⟨−1⟩⟩ = ⟨1, 1⟩` is anisotropic over `𝔽₃` (`x² + y² = 0` forces
  `x = y = 0`, `−1` not being a square mod `3`), so `s₁{−1} ≠ 0`, matching `𝔽₃ˣ/𝔽₃ˣ² = {±1}`; and
  `⟨⟨−1, −1⟩⟩ = ⟨1, 1, 1, 1⟩` vanishes at `(1, 1, 1, 0)`, so it is hyperbolic, matching
  `K₂ᴹ(𝔽₃) = 0`. A model treating `𝔽₃` like `ℝ`, where `⟨1, 1, 1, 1⟩` is anisotropic, would keep a
  nonzero class in degree two.
- `ℚ`, degree three: `K₃ᴹ(ℚ)/2 = ℤ/2` is generated by `{−1, −1, −1}`, whose image
  `⟨⟨−1, −1, −1⟩⟩ = 8⟨1⟩` has signature `8 ∉ 16ℤ` and so is nonzero in `I³/I⁴`. The tempting claim
  `I(ℚ)³ = 0`, true over every `ℚ_p`, fails at the real place.
- `ℚ`, degree two: `{−1, 2} = 0` because `2 = 1² + 1²` is a norm from `ℚ(√−1)`, and correspondingly
  `⟨⟨−1, 2⟩⟩ = ⟨1, 1, −2, −2⟩` vanishes at `(1, 1, 1, 0)` and is hyperbolic; while `{−1, −1}` maps to
  `⟨1, 1, 1, 1⟩` of signature `4 ∉ 8ℤ`, nonzero in `I²/I³`.

### 3.3 Unramified Witt sheaves

Fix a perfect field `k` with `char k ≠ 2`. On smooth `k`-schemes let `W` be the Zariski sheaf associated
to the Witt group, and for integral `X` with function field `K` put `Iⁿ(X) = W(X) ∩ I(K)ⁿ`, with
products over components in general; let `iₙ = Iⁿ/Iⁿ⁺¹`, `kₙ` the unramified mod-two Milnor sheaf, and
`jₙ = ker(kₙ → iₙ)` (Morel, §2.1, Definition 2.1, p. 70). Prove 0-purity of `W`: for a regular local
ring `A` containing a field of characteristic different from two, `W(A) → W(Frac A)` is injective with
image the intersection of the images of `W(A_𝔭)` over height-one primes (Ojanguren–Panin, Theorem A,
p. 72; Morel, Theorem 2.2, p. 70); deduce the purity of `Iⁿ` (Theorem 2.3, p. 71). Equip
`i_* = ⊕ iₙ` with the structure of a Rost cycle module, with residues for discrete valuations and
transfers for finite extensions, compatible with `s` (Theorem 2.11, p. 76); this uses Arason's theorem
that transfer along a finite extension maps `Iⁿ` into `Iⁿ` and induces on `Iⁿ/Iⁿ⁺¹` a map independent of
the chosen nonzero functional (Arason, Satz 3.3, cited by Morel in the proof of Lemma 2.14, p. 81), the
injectivity of `iₙ` along odd-degree extensions (proved after Arason's Satz 3.3, cited by Morel, p. 78),
and the generation of Milnor K-groups by norms that Morel cites in the same proof. Prove that the
quotient `Iⁿ/Iⁿ⁺¹` is the sheaf `iₙ` of this cycle module (Theorem 2.12, pp. 78–80). Prove that when
`j_{N−1} = 0` the sheaf `j_N` is birational and flasque: its sections are the elements of `j_N` of the
function field with vanishing residues in `j_{N−1}`, so open immersions induce isomorphisms (Morel,
Lemma 3.11 and its proof, p. 90, announced p. 69), with the Gersten resolution of the cycle module
(gap:rost-cycle-modules). *Needs:* `MotivesAndAlgebraicCycles` §0.5b
(gap:rost-cycle-modules for the cycle-module sheaves and their Gersten resolution) and §§4.1–4.6;
`K2SymbolsBrauer` Layers 9 and 10 (residues, the Bass–Tate sequence and Milnor transfers); 2.4 and
2.5 for transfers and odd-degree descent; 3.2; Tau Ceti `TauCeti.WittRing`, `TauCeti.fundamentalIdeal`.

- sections over a field `K` are `W(K)` and `I(K)ⁿ`; over a smooth integral curve they are the
  intersection of the unramified local Witt groups;
- the cycle-module residues and transfers on `i_*` and the morphism `k_* → i_*`;
- `jₙ` is the kernel sheaf, with field value `ker sₙ`.

**Checks.**

- At `Spec K`, `Iⁿ` has value `I(K)ⁿ` and `jₙ` has value `ker(sₙ)`.
- For `X = 𝔸¹_k`, `W(𝔸¹_k) = W(k)` (homotopy invariance of the unramified Witt group, a consequence of
  purity and the residue sequence for `k(t)`).
- `Iⁿ(X)` is defined by intersecting `W(X)` with `I(K)ⁿ` inside `W(K)`; over a field it is the ideal
  power, and no equality with the `n`-th power of the ideal `W(X) ∩ I(K)` on general schemes is assumed
  or used (Morel, Remark 2.5, p. 72, leaves it open for regular local rings). On `X = 𝔸¹_ℚ`, the class
  `⟨1, −t⟩` of `W(ℚ(t))` has second residue `⟨−1⟩ ≠ 0` at `t = 0`, so it lies in `I(ℚ(t))` but not in `I(𝔸¹_ℚ)`:
  the intersection is genuinely smaller than `I` of the function field.
- If every `sₙ` is injective on all fields, `jₙ = 0` by purity; taking `jₙ = kₙ` fails this test.

### 3.4 Ext vanishing for the kernel of the Milnor map

In Morel's induction fix `N > 0` and a perfect `k` with `char k ≠ 2`. Assume that `sₙ` is an
isomorphism for all field extensions of `k` in weights `n < N`, that `sₙ(k)` is an isomorphism for
`n ≤ N`, and that cup product with `τ = −1 ∈ μ₂ = H⁰(k, ℤ/2(1))` maps
`H^{n−1}(F, ℤ/2(n − 1)) → H^{n−1}(F, ℤ/2(n))` onto for every finite-type `F/k` and `1 ≤ n ≤ N − 1`. Prove
`Ext^a(kₙ, j_N) = 0` in Zariski sheaves of abelian groups on smooth `k`-schemes for `0 ≤ n < N` and
`a = 0, 1, 2` (Morel, Theorem 3.4 and Lemmas 3.5–3.9, pp. 84–87; Theorem 3.10, pp. 87–88). Model the
motivic complexes `ℤ/2(n)` by equidimensional cycles, use the `𝔸¹`-translation homotopy to show that
`Hom(ℤ/2(n), j_N[∗])` vanishes in the needed range, and conclude with the universal-coefficient spectral
sequence; the `τ`-surjectivity gives `Ext²`. *Needs:* 3.3; `MotivesAndAlgebraicCycles` §§4.1–4.6 and
§4.14; `KTheoryFiniteLocalFields` §3.0a for the identification of motivic and étale cohomology in
cohomological degrees at most the weight.

**Checks.**

- `τ` has motivic bidegree `(0, 1)`; replacing it by the Kummer class of `−1` in `H¹(G_k, 𝔽₂)` changes
  the degree and breaks the induction.
- For `n = 0`, `k₀ = ℤ/2` and `Hom(ℤ/2, j_N) = j_N(k) = 0` by the hypothesis on `sₙ(k)`.
- The range is degrees at most the weight: in weight `0` over `ℚ`, motivic `H¹(ℚ, ℤ/2(0)) = 0` while
  `H¹(G_ℚ, 𝔽₂) ≠ 0`, so the comparison fails in degree `1 > 0`; the `τ`-surjectivity uses degree
  `n − 1` in weights `n − 1` and `n`, inside the range.

### 3.5 The Milnor conjecture for the Witt ring

Prove: for every field `F` of characteristic different from two and every `n ≥ 0`, the Milnor
homomorphism `sₙ : Kₙᴹ(F)/2 → I(F)ⁿ/I(F)ⁿ⁺¹` is an isomorphism, naturally in `F` (Morel, Theorem 1.1,
p. 65; Orlov–Vishik–Voevodsky, Theorem 4.1, p. 11, in characteristic zero; EKM, Fact 5.15, p. 31).
Compose `sₙ⁻¹` with the norm-residue isomorphism `Kₙᴹ(F)/2 ≅ Hⁿ(G_F, 𝔽₂)` of
`KTheoryFiniteLocalFields` §3.0a to obtain `exists_addEquiv_quotient_fundamentalIdeal_pow`: for
`n ≥ 0` there is an additive isomorphism `I(F)ⁿ⁺¹/I(F)ⁿ⁺² ≅ Hⁿ⁺¹(G_F, 𝔽₂)` sending the class of
`⟨⟨a₁, …, aₙ₊₁⟩⟩` to `kummerSymbol n a` (EKM, Fact 16.2, p. 68); it is unique, Pfister classes
generating `Iⁿ⁺¹` additively. The route chooses `k` the prime field, where `sₙ` is an isomorphism in
every weight by 3.2a, which is Morel's hypothesis `H1(N)` (Theorem 1.3, p. 65); deduces the
`τ`-surjectivity from the motivic–étale comparison (Morel, p. 66); lifts the extension
`0 → i_N → W/I^{N+1} → W/I^N → 0` to an extension by `k_N` with 3.4; and builds a left inverse of `s_N`
from the presentation of `W` by units on opens of tori (Morel, §3.4, Lemmas 3.11–3.16 and Corollary
3.17, pp. 89–93), passing to arbitrary fields by filtered colimits. The supplied norm-residue
comparison provides the `τ`-surjectivity used in Morel's induction; after the Witt-ring isomorphism is
proved, the same comparison gives its Galois-cohomological form. The characteristic-zero route of
Orlov–Vishik–Voevodsky is not extended to positive characteristic. *Needs:* 3.2, 3.2a, 3.3, 3.4; `KTheoryFiniteLocalFields` §3.0a;
Tau Ceti `TauCeti.pfisterClass`, `TauCeti.pfisterClass_mem_fundamentalIdeal_pow`, `TauCeti.kummerClass`,
`TauCeti.trivialF2TopPairing`.

**Checks.**

- `n = 1`: `I/I² ≅ H¹(G_F, 𝔽₂) ≅ Fˣ/(Fˣ)²`, `⟨⟨a⟩⟩ ↦ (a)`; Tau Ceti's `TauCeti.signedDiscrHom` gives the
  same map, since the signed discriminant of `⟨1, −a⟩` is `(−1)·(−a) = a`.
- `n = 2`: `⟨⟨a, b⟩⟩ ↦ (a) ∪ (b)`, which under the parent's Layer 7B is the quaternion class `[(a, b)]` in
  `Br(F)[2]`; over `ℝ`, `⟨⟨−1, −1⟩⟩ = ⟨1, 1, 1, 1⟩` maps to the nonzero class of Hamilton's quaternions.
- Degree zero also holds, `W/I ≅ ℤ/2 = H⁰(G_F, 𝔽₂)` through `TauCeti.WittRing.dimMod2`, but there
  Pfister classes do not generate (`⟨2⟩` over `ℚ` is not a multiple of `⟨1⟩` in `W(ℚ)`), which is why the
  recorded statement starts in degree `n + 1 ≥ 1`, where uniqueness follows from generation.

### 3.6 Kato's comparison in characteristic two

Prove: for `char F = 2` and `n ≥ 1` there is a natural additive isomorphism
`ēₙ : I_qⁿ(F)/I_qⁿ⁺¹(F) → H₂ⁿ(F)` sending the class of `⟨⟨b₁, …, b_{n−1}⟩⟩_b ⊗ [1, a₀]` to
`[a₀ · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}]` (EKM, Proposition 16.1 and Fact 16.2, pp. 67–68, citing Kato).
The symbol formula defines a map on `n`-fold quadratic Pfister forms; Pfister identities make it
additive modulo `I_qⁿ⁺¹`; the content of Kato's theorem is that its kernel is exactly `I_qⁿ⁺¹` and that
it is onto (Kato 1982, cited by its statement through EKM, Fact 16.2).

Prove also Kato's bilinear comparison: for `char F = 2` and `n ≥ 0`, the map sending the symbol
`{a₁, …, aₙ}` to the class of `⟨⟨a₁, …, aₙ⟩⟩_b` is a well-defined isomorphism
`Kₙᴹ(F)/2 ≅ I_bⁿ(F)/I_bⁿ⁺¹(F)` (EKM, Fact 5.15, p. 31, with (4.11), Proposition 4.13 and Proposition 5.3
for `n ≤ 2`; Kato 1982). Well-definedness uses the bilinear Pfister relations `⟨⟨u, 1 − u⟩⟩_b = 0` and
`⟨⟨uv⟩⟩_b ≡ ⟨⟨u⟩⟩_b + ⟨⟨v⟩⟩_b mod I_b²`, and surjectivity the additive generation of `I_bⁿ` (0.4);
injectivity is Kato's theorem. Composing its inverse with `blochGabberKato` of `KTheoryFiniteLocalFields`
§3.0 gives `I_bⁿ(F)/I_bⁿ⁺¹(F) ≅ ν_F(n)`, `⟨⟨a₁, …, aₙ⟩⟩_b ↦ da₁/a₁ ∧ ⋯ ∧ daₙ/aₙ`; the supplier gives only
the second isomorphism. *Needs:* 0.4, 0.6, 1.1, 3.1; `K2SymbolsBrauer` §§5.4–5.8;
`KTheoryFiniteLocalFields` §3.0.

**Checks.**

- `n = 1`: `ē₁([1, a₀]) = a₀ mod ℘F`, the Arf invariant; over `𝔽₂`, `ē₁([1, 1]) = 1 ≠ 0` and
  `ē₁([1, 0]) = 0`.
- A square outer slot gives a hyperbolic form and a zero symbol: `d(c²)/c² = 0`.
- `ē₂(⟨⟨t⟩⟩_b ⊗ [1, 1]) = [dt/t] ≠ 0` in `H₂²(𝔽₂(t))`, matching the anisotropy of `[1, 1] ⊥ t[1, 1]`.
- Bilinear comparison, `n = 0`: `W_b(F)/I_b(F) = ℤ/2 = K₀ᴹ(F)/2`. For `F = 𝔽₂(t)` and `n = 1`,
  `⟨⟨t⟩⟩_b = ⟨1, t⟩_b` is anisotropic, nonzero in `I_b/I_b²`, and goes to `dt/t ≠ 0` in `ν_F(1)`.
- For a perfect field of characteristic two every unit is a square, so `Kₙᴹ(F)/2 = 0` and `I_b(F) = 0`
  for `n ≥ 1`. The polarization of `[1, 1]` over `𝔽₂` is an alternating, hence metabolic, plane: the
  bilinear filtration does not see the quadratic class `ē₁([1, 1]) ≠ 0`.

### 3.7 The Pfister invariant

For a nonsingular quadratic `n`-fold Pfister form `ρ`, `n ≥ 1` (in the family of 1.1 this means
`1 − 4a₀ ≠ 0`, automatic in characteristic two), define `eₙ(ρ) ∈ H_qⁿ(F)` as the image of
`[ρ] mod I_qⁿ⁺¹` under the comparison of 3.5 (characteristic different from two) or 3.6
(characteristic two). Prove that it depends only on the isometry class of `ρ` (EKM, Proposition 16.1,
p. 67) and evaluate it on slots: `eₙ(⟨⟨a₁, …, aₙ⟩⟩) = kummerSymbol (n − 1) a` with `2` invertible, and
`eₙ(⟨⟨b₁, …, b_{n−1}⟩⟩_b ⊗ [1, a₀]) = [a₀ · db₁/b₁ ∧ ⋯ ∧ db_{n−1}/b_{n−1}]` in characteristic two. For
`n = 2` and `2` invertible, `e₂` is the quaternion class through the parent's Layer 7B. *Needs:* 1.1, 3.1,
3.5, 3.6, 0.6; `QuadraticFormInvariants` Layer 7B.

- isometry invariance: isometric Pfister forms have equal invariant;
- symbols: the two slot formulas above;
- degree two: comparison with the quaternion class of Layer 7B.

**Checks.**

- Over `𝔽₂`, `e₁([1, 1])` is the nonzero Artin–Schreier class, and `e₁([1, 0]) = 0`.
- With `2` invertible, `e₂(⟨⟨a, b⟩⟩) = (a) ∪ (b)`, which is `[(a, b)]` under Layer 7B; over `ℚ`,
  `e₂(⟨⟨−1, −1⟩⟩) ≠ 0` and `e₂(⟨⟨−1, 2⟩⟩) = 0`, as `2 = 1 + 1` is a sum of two squares.
- A singular member of the family has no invariant: with `2` invertible, `[1, 1/4] = (x + y/2)²` has
  zero polar determinant and no class in `I_q`, while the nonsingular `[1, 0] ≅ ℍ` has invariant `0`.
- The twist is `n − 1`: in characteristic two the invariant of an `n`-fold form uses `(n − 1)`-forms, and
  the last slot `a₀` enters through Artin–Schreier, not through a Kummer class (`μ₂` being trivial).

### 3.8 Naturality

Prove: for every field homomorphism `F → E` and every nonsingular quadratic `n`-fold Pfister form `ρ`,
restriction of
`eₙ(ρ)` is `eₙ(ρ_E)` (EKM, §16, pp. 67–68; Dittmann–Pop, Fact 3.1(2), p. 6). The class map, the filtration
quotient and both comparisons commute with restriction; in characteristic two use the induced map on
Kähler forms, which covers inseparable extensions, and with `2` invertible the restriction of 3.1,
which commutes with cups by `TauCeti.trivialF2Map_cup` and sends Kummer classes to Kummer classes.
*Needs:* 0.2, 3.1, 3.5, 3.6, 3.7; Tau Ceti `TauCeti.trivialF2Map`, `TauCeti.trivialF2Map_cup`.

**Checks.**

- `𝔽₂ → 𝔽₄`: `e₁([1, 1])` restricts to `0`, matching the splitting of `[1, 1]` over `𝔽₄`.
- `𝔽₂(t) → 𝔽₂(t^{1/2})` (inseparable): `[dt/t]` restricts to `[2 ds/s] = 0`, matching the hyperbolicity of
  `⟨⟨t⟩⟩_b ⊗ [1, 1]` over `𝔽₂(s)`, `s² = t`, where `t` is a square.

### 3.9 The invariant-zero criterion

Prove: for a nonsingular quadratic `n`-fold Pfister form `ρ`, `n ≥ 1`, over any field, `eₙ(ρ) = 0` if and
only if `ρ`
is isotropic, if and only if `ρ` is hyperbolic (EKM, Fact 16.2 with Theorem 23.7, pp. 68 and 100;
Dittmann–Pop, Fact 3.1(1), p. 6). The statement
`not_anisotropic_pfisterForm_iff_kummerSymbol_eq_zero` records it for `2` invertible: Tau Ceti's
`TauCeti.presentedForm` of `TauCeti.pfisterForm a` is isotropic exactly when `kummerSymbol n a = 0`.
Zero invariant puts `[ρ]` in `I_qⁿ⁺¹`; an anisotropic `ρ` would then have dimension at least `2ⁿ⁺¹` by 2.11,
contradicting `dim ρ = 2ⁿ`; conversely an isotropic `ρ` is hyperbolic by 1.5 and has zero class.
*Needs:* 1.5, 2.11, 3.5–3.7; Tau Ceti `TauCeti.presentedForm`, `TauCeti.pfisterForm`.

**Checks.**

- `n = 1`, `2` invertible: `⟨1, −a⟩` is isotropic exactly when `a` is a square, exactly when
  `(a) = 0`.
- `n = 2` over `ℚ`: `⟨1, 1, 1, 1⟩` is anisotropic and `(−1) ∪ (−1) ≠ 0`; over `ℚ(i)` both change.
- The criterion is about Pfister forms: the invariant of the class of `ℍ ⊥ [1, 1]` (characteristic two,
  `n = 1`) is `e₁([1, 1]) ≠ 0` over `𝔽₂` although the form is isotropic.

### Examples

For a one-fold characteristic-two form `[1, a]`, `e₁` is the class of `a` in `F/℘F`: over `𝔽₂`, `a = 1`
gives the nonzero class, and over `𝔽₄` it becomes `0` (`ω² + ω = 1`) and the form splits. For two folds
over `𝔽₂(t)`, `e₂(⟨⟨t⟩⟩_b ⊗ [1, 1]) = [dt/t]`, nonzero, and the form is anisotropic. With `2` invertible
over `ℚ`, `e₃(⟨⟨−1, −1, −1⟩⟩) = (−1)³ ≠ 0` and `⟨⟨−1, −1, −1⟩⟩ = 8⟨1⟩` is anisotropic, while over `ℚ₂` the
same form is isotropic, every form of dimension at least five over a `p`-adic field being isotropic,
and indeed `(−1)³` vanishes in `H³(G_{ℚ₂}, 𝔽₂) = 0`.

### Dependencies

Layers 0–2; Tau Ceti's Witt ring, its base change, continuous cohomology, Kummer classes, cup
products and restriction; `ProfiniteCohomology` Layers 10 and 12; `QuadraticFormInvariants` Layer 4
and Layers 7A–7B; `K2SymbolsBrauer` §§5.4–5.8, §5.12, Layers 9–10 and §10.32; `KTheoryFiniteLocalFields`
§§3.0–3.0a; `MotivesAndAlgebraicCycles` §0.5b, §§4.1–4.6 and §4.14; `SchemeAndStackFoundations`
§§2.11, 2.15; Mathlib `KaehlerDifferential`.

## Layer 4: henselian unit and value criteria

Throughout, `O` is a henselian valuation ring of `K` of arbitrary rank, with residue field `κ`, value
group `Γ` and maximal ideal `𝔪`. A *unit Pfister form* is `quadraticPfister ε a₀` with `ε : Fin m → Oˣ`
and `a₀ ∈ O` such that `1 − 4a₀ ∈ Oˣ`; its reduction `quadraticPfister ε̄ ā₀` over `κ` is then
nonsingular. When the valuation is non-dyadic, Dittmann–Pop's unit forms `⟨⟨ε_r, …, ε₀⟩⟩` with
`εᵢ ∈ Oˣ` are exactly these up to isometry: with `2 ∈ Oˣ` take `a₀ = (1 − ε₀)/4`, and in equal
characteristic two the terminal block is `[1, ε₀]` itself (Dittmann–Pop, §3, p. 6, read with the
bilinear outer factors of EKM §9.B). In the dyadic mixed case `(0, 2)` a form `⟨1, −ε₀⟩` need not have
an integral presentation `[1, a₀]`, which is why Dittmann–Pop exclude it; the statements below,
phrased with `[1, a₀]`, hold for every henselian valuation.

### 4.1 Unit reduction

Prove: a unit Pfister form is isotropic over `K` if and only if its reduction is isotropic over `κ`
(Dittmann–Pop, Proposition 3.2, proof, assertion (∗), p. 7). If `x̄ ≠ 0` is a residual zero, the
residual polar form is nonsingular, so `b(x̄, ȳ) ≠ 0` for some `ȳ`; lift `x̄` to `x` (so `q(x) ∈ 𝔪`)
and `ȳ` to `y`, and if `q(y) ∈ 𝔪` replace `y` by `y + x`, which keeps `b(x, y)` modulo `𝔪` and makes
`q(y) ≡ b(x, y)` a unit. Then `q(x + s y) = q(y) s² + b(x, y) s + q(x)`, divided by `q(y)`, is monic with
the simple residual root `s̄ = 0`, and `HenselianLocalRing.TFAE` lifts it. Conversely, divide an
isotropic vector by a coordinate of greatest value (multiplicative convention); the reduction of the
resulting primitive vector is a nonzero residual zero. The empty-`π` case of `quadraticPfister_isotropic_tfae_of_independent_values` records
the statement. *Needs:* 0.1, 0.2, 1.1; Mathlib `ValuationSubring`, `HenselianLocalRing.TFAE`,
`IsLocalRing.ResidueField`.

**Checks.**

- `K = 𝔽₂((t))`, `[1, 1]`: the reduction over `𝔽₂` is anisotropic, so `[1, 1]` is anisotropic over
  `𝔽₂((t))`, which does not contain `𝔽₄`.
- Dyadic mixed characteristic is covered with the integral presentation: over `ℚ₂`, `[1, 1]` (with
  `1 − 4 = −3 ∈ ℤ₂ˣ`) reduces to the anisotropic `[1, 1]` over `𝔽₂` and is anisotropic, being the norm
  form of the unramified quadratic extension. The unit form `⟨1, 1⟩ = ⟨⟨−1⟩⟩` reduces to `(x + y)²`,
  isotropic over `𝔽₂`, yet is anisotropic over `ℚ₂`; it is `[1, 1/2]` with `1/2 ∉ ℤ₂`, outside the
  hypothesis.
- The lifting direction is chosen so that the quadratic is monic: over `𝔽₂((t))`, the form
  `[1, t] ⊥ (1 + t)[1, t]` has the lifted residual zero `x = (1, 0, 1, 0)` with `q(x) = t`; the direction
  `e₂ = (0, 1, 0, 0)` has `q(e₂) = t ∈ 𝔪`, and neither `t s² + s + t` nor its reciprocal `t u² + u + t`
  is monic, while `y = e₂ + x` has `q(y) = 1` and `q(x + s y) = s² + s + t`, with simple residual root
  `0`.
- Henselianity is needed: over `ℚ` with the `7`-adic valuation ring `ℤ_{(7)}`, `⟨1, −2⟩ ≅ [1, −1/4]`
  reduces to an isotropic form (`2 = 3²` in `𝔽₇`) but is anisotropic over `ℚ`.

### 4.2 The principal-unit criterion

State `not_anisotropic_quadraticPfister_of_residue_eq_one`: let `ε : Fin m → Oˣ` and `a₀ ∈ O`, with
no condition on `1 − 4a₀`; if some outer slot is a principal unit, `εᵢ ≡ 1 mod 𝔪` (so `m ≥ 1`), then
`quadraticPfister ε a₀` is isotropic over `K` (Dittmann–Pop, Proposition 3.2(1), pp. 6–7, stated there
for unit forms and for the outer slot next to the terminal one; the outer slots play symmetric
roles). Pair each set `S` of outer slots not containing `i` with `S ∪ {i}`, of weights `w_S` and
`−εᵢ w_S`. If the residue characteristic is not two, `X² − εᵢ` has the simple residual root `1`, so
`εᵢ = c²` with `c ∈ Oˣ` by `HenselianLocalRing`, and the vector equal to `c v` in block `S`, to `v ≠ 0`
in block `S ∪ {i}` and zero elsewhere has value `w_S c² q(v) − c² w_S q(v) = 0`, whatever `a₀`. If the
residue characteristic is two, `4a₀ ∈ 𝔪` and `1 − 4a₀` is a unit, so the form is a unit Pfister form;
the same vector with `c = 1` is a residual zero of the nonsingular reduction, and 4.1 lifts it.
*Needs:* 1.1, 4.1; Mathlib `HenselianLocalRing`.

**Checks.**

- In characteristic two the residual factor is `⟨1, 1⟩_b`, metabolic: `⟨⟨1 + t⟩⟩_b ⊗ [1, 1]` over
  `𝔽₂((t))` reduces to `[1, 1] ⊥ [1, 1]`, isotropic at `(v, v)`.
- No claim for a terminal principal unit alone: over `𝔽₂((t))`, `[1, 1 + t]` reduces to `[1, 1]` and is
  anisotropic.
- No discriminant hypothesis is needed: over `ℚ₃`, `ε = 4` and `a₀ = 1/4` give `1 − 4a₀ = 0`, and
  `(x + y/2)² − 4(z + w/2)²` vanishes at `(2, 0, 1, 0)`.
- Henselianity is needed: over `ℚ` with `O = ℤ_{(3)}`, take `ε = 7 ≡ 1 mod 3` and `a₀ = 1/2`, so
  `1 − 4a₀ = −1` is a unit and `quadraticPfister (7) (1/2) ≅ ⟨⟨7, −1⟩⟩ = ⟨1, 1, −7, −7⟩`. Its reduction
  is isotropic over `𝔽₃`, but the form is anisotropic over `ℚ`: a nonzero zero would make `7` a
  quotient of two sums of two squares, that is a norm from `ℚ(√−1)`, while `7 ≡ 3 mod 4` is inert in
  `ℤ[√−1]` and has odd valuation.

### 4.3 The independent-value criterion

State `quadraticPfister_isotropic_tfae_of_independent_values`: let `π : Fin s → Kˣ` have values whose
classes in `Γ/Γ²` are `𝔽₂`-independent, that is no nonempty product `∏_{i ∈ S} v(πᵢ)` is a square in `Γ`.
Then the reduction of the unit Pfister form is isotropic over `κ`, the form is isotropic over `K`, and
`⟨⟨π⟩⟩_b ⊗ quadraticPfister ε a₀ = quadraticPfister (Fin.append π ε) a₀` is isotropic over `K`, all
together or not at all (Dittmann–Pop, Proposition 3.2(2) and proof, pp. 6–7). In the multiplicative
convention of `O.valuation`: if the residual form is anisotropic, the value of every nonzero block
vector is the square of the greatest value of its coordinates, so it lies in `Γ²`; the subset-indexed
blocks of `⟨⟨π⟩⟩_b ⊗ q` carry coefficients `∏_{i ∈ S}(−πᵢ)` whose values lie in pairwise distinct cosets of
`Γ²`, so the nonzero block values have a unique maximum and cannot cancel. The signs `(−1)^{|S|}` are units and do not affect the argument
(they are missing from the printed expansion, Dittmann–Pop, p. 7). *Needs:* 4.1, 1.1; Mathlib
`ValuationSubring.valuation`, `ValuationSubring.ValueGroup`.

**Checks.**

- `K = 𝔽₂((t))`, `π = (t)`: `[1, 1] ⊥ t [1, 1]` is anisotropic, its block values having even and odd
  `t`-adic order respectively.
- The order convention: with `v(t) = c < 1`, `[1, 1]` at `(1, t)` has value `v(1 + t + t²) = 1 = (max(1, c))²`,
  not `(min(1, c))² = c²`; normalizing by the coordinate of least value would divide by `t` and leave `O`.
- Independence is in `Γ/Γ²`, not in `Γ ⊗ ℚ`: `π = (t²)` has nonzero value, but `⟨⟨t²⟩⟩_b ⊗ [1, 1] ≅
  [1, 1] ⊥ [1, 1]` is isotropic over `𝔽₂((t))`.
- The trivial valuation has trivial value group, so only `s = 0` is allowed and the statement reduces
  to `κ = K`.

### Examples

Over `𝔽₂((t))`, every nonzero vector `x` of `[1, 1]` has value of order `2 min(ord x₀, ord x₁)`,
because the reduction of a primitive vector is a nonzero value of the anisotropic `[1, 1]` over `𝔽₂`.
Hence in `[1, 1] ⊥ t[1, 1]` the two blocks have values of opposite parity and the form is anisotropic;
it is the two-fold form `⟨⟨t⟩⟩_b ⊗ [1, 1]`. Adding `π₂ = t + t²` would not help: its value has the same
parity as `t`.

### Dependencies

Layers 0 and 1; Mathlib `ValuationSubring`, `HenselianLocalRing`, `IsLocalRing.ResidueField`.

## Layer 5: `C_i` fields and Kronecker dimension

### 5.1 `C_i` fields

Define `IsCi i F`: every homogeneous polynomial of degree `d ≥ 1` in `N > dⁱ` variables over `F` has a
nonzero zero, with Mathlib's `MvPolynomial.IsHomogeneous` and `MvPolynomial.eval` (EKM, §97, p. 385).
Prove monotonicity in `i`, that `C₀` is equivalent to algebraic closedness, and that a quadratic form in
more than `2ⁱ` variables over a `C_i` field is isotropic. *Needs:* Mathlib `MvPolynomial`,
`MvPolynomial.IsHomogeneous`, `MvPolynomial.eval`, `IsAlgClosed`.

- monotonicity: `C_i` implies `C_j` for `i ≤ j`, since `dⁱ ≤ dʲ` for `d ≥ 1`;
- `C₀` holds exactly for algebraically closed fields;
- quadratic forms: over a `C_i` field every quadratic form in more than `2ⁱ` variables is isotropic.

**Checks.**

- `𝔽₂` is not `C₀`: `x² + xy + y²` in two variables has no nonzero zero.
- The threshold is strict: `X^d` in `N = 1 = d⁰` variables has no nonzero zero over any field, and `C₀`
  imposes nothing on it.
- `ℝ` is not `C_i` for any `i`: `x₁² + ⋯ + x_N²` has no nonzero zero for any `N`.
- The zero polynomial is homogeneous of every degree and has every nonzero vector as a zero; it never
  contradicts the definition, since `N > dⁱ ≥ 1`.

### 5.2 The projective dimension theorem

Prove: over an algebraically closed field, `r` homogeneous polynomials of positive degree in `N > r`
variables have a common nonzero zero (the input to EKM, Theorem 97.2, p. 385, where it is cited from
Shafarevich). The ideal they generate has height at most `r < N` by Krull's height theorem
(`Ideal.height_le_spanRank_toENat`; it is proper, its generators lying in the irrelevant ideal). If
the origin were the only common zero, the Nullstellensatz `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`
would make the radical of the ideal the irrelevant ideal `(x₁, …, x_N)`, of height `N > r`, a
contradiction. For linear forms over any field, `N > r` gives a nonzero common zero by rank–nullity.
*Needs:* Mathlib `Ideal.height_le_spanRank_toENat`, `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`,
`MvPolynomial.IsHomogeneous`.

**Checks.**

- `N = r` is excluded: `x, y` in two variables have only the zero common zero.
- Algebraic closedness is needed: `x² + y²` over `ℝ`, `r = 1 < N = 2`, has no nonzero zero.

### 5.3 Finite fields are `C₁`

Prove: every finite field is `C₁` (EKM, §97, p. 385). For a homogeneous `f` of degree `1 ≤ d < N`,
Mathlib's `char_dvd_card_solutions` makes the number of zeros divisible by the characteristic; the
origin is a zero, so there is another. *Needs:* 5.1; Mathlib `char_dvd_card_solutions`.

**Checks.**

- Over `𝔽₂`, `x² + xy + y² + z²` vanishes at `(0, 0, 0)`, `(1, 0, 1)`, `(0, 1, 1)` and `(1, 1, 1)`, four
  zeros, divisible by `2`.
- `x² + xy + y²` (`N = d = 2`) is outside the hypothesis and has only the trivial zero.

### 5.4 The Lang–Nagata theorem for systems

State `IsCi.exists_common_zero`: if `F` is `C_i` and `f₁, …, f_r` are homogeneous of the same degree
`d ≥ 1` in `N > r dⁱ` variables, they have a common nonzero zero (EKM, Lemma 97.1 and Theorem 97.2,
p. 385). If `F` is algebraically closed, whatever `i`, use 5.2, since `N > r dⁱ ≥ r`; if `d = 1`, use
linear algebra. Otherwise `F` is not algebraically closed and has normic forms of arbitrarily large
degree (norm forms of finite extensions, composed, Lemma 97.1); substitute copies of the system into a
normic form, and at each stage, with a form of degree `D` in `M` variables, apply `C_i` once
`M > Dⁱ`, then descend a zero. *Needs:* 5.1, 5.2.

**Checks.**

- `r = 1` is the definition of `C_i`; `r = 0` asks only for a nonzero vector, which exists as `N ≥ 1`.
- Being `C_i` with `i ≥ 1` does not exclude algebraic closedness: `ℂ` is `C₁`, has no normic form of
  degree greater than one, and is handled by 5.2.
- The norm form `x² + xy + y²` of `𝔽₄/𝔽₂` is normic of degree two in two variables.
- Two quadratic forms in `N = 5 > 2 · 2` variables over `𝔽_q` have a common nonzero zero.

### 5.5 Algebraic extensions

Prove: every algebraic extension `E` of a `C_i` field is `C_i`, finite or not (EKM, Corollary 97.5,
p. 386). The coefficients of a form lie in a finite subextension `E₀` of degree `r`; expanding the
variables in a basis turns one form in `N` variables into `r` forms in `r N > r dⁱ` variables over `F`,
and 5.4 applies. *Needs:* 5.1, 5.4.

**Checks.**

- The algebraic closure of `𝔽_p` is `C₁` and in fact `C₀`; `C_i` is an upper bound, not an exact index.
- `ℚ̄ ∩ ℝ` (real algebraic numbers) is not `C_i` for any `i`, consistent with `ℚ` not being `C_i`.

### 5.6 The Tsen–Lang theorem

State `IsCi.of_trdeg`: if `F` is `C_i` and `E/F` has transcendence degree `t`, then `E` is `C_{i+t}`
(EKM, Corollaries 97.5–97.6 and Theorem 97.7, p. 386). In particular a field of characteristic `p > 0`
and finite absolute transcendence degree `t` is `C_{t+1}`, and an extension of transcendence degree `t`
of an algebraically closed field is `C_t`; `SchemeAndStackFoundations` §2.16 states the case `t = 1`
over an algebraically closed field together with `Br = 0`. For `F(x)`, clear denominators and
substitute polynomial vectors of degree `m`; the coefficient equations form a system of
`d m + c + 1` forms of degree `d` in `N(m + 1)` variables, and `N > d^{i+1}` makes `N(m + 1)` exceed
`(d m + c + 1) dⁱ` for large `m`; then iterate along a transcendence basis and finish with 5.5.
*Needs:* 5.1, 5.3–5.5; Mathlib `Algebra.trdeg`.

**Checks.**

- `𝔽_p(t)` is `C₂`, `ℂ(t)` is `C₁` and `ℂ(x, y)` is `C₂`.
- `ℝ(t)` is not `C_i`: its subfield `ℝ` is not, and sums of squares stay anisotropic over `ℝ(t)`; the
  theorem needs a `C_i` base.
- Transcendence degree zero recovers 5.5.

### 5.7 Kronecker dimension

Define `kroneckerDimension F = trdeg(F/P) + (1 if char F = 0)`, `P` the prime subfield, and the constant
field `constantField F`, the relative algebraic closure of `P` in `F` (Dittmann–Pop, §1, p. 1, and
Proposition 3.2, p. 6). Prove that algebraic extensions preserve the Kronecker dimension, that the
constant field has Kronecker dimension `0` or `1`, and that for a field of finite Kronecker dimension and
a nontrivial valuation the residue field has strictly smaller Kronecker dimension (Dittmann–Pop,
proof of Proposition 3.2(3), p. 7, through the Abhyankar inequality
`trdeg F − trdeg κ ≥ dim_ℚ(Γ/Γ_k ⊗ ℚ)`). If the valuation is nontrivial on `k`, then `char F = 0`, the
residue field of `k` is algebraic over a finite field, and the extra `+1` gives the drop; if it is
trivial on `k`, the rational rank of `Γ` is positive. *Needs:* Mathlib `Algebra.trdeg`,
`algebraicClosure`, `ValuationSubring`; `LocalFieldsRamificationPartII` §GF.5 (composed valuations and
the Abhyankar inequality).

- `kroneckerDimension` is invariant under algebraic extensions;
- `constantField F` is relatively algebraically closed in `F` and algebraic over the prime field;
- strict drop: `dim κ < dim F` for every nontrivial valuation when `dim F` is finite.

**Checks.**

- `dim 𝔽_p = 0`, `dim ℚ = 1`, `dim 𝔽_p(t) = 1`, `dim ℚ(t) = 2`.
- Constant fields: `constantField 𝔽₄(t) = 𝔽₄`, `constantField ℚ(√2)(t) = ℚ(√2)` and
  `constantField ℚ̄ = ℚ̄`; the prime subfield, a plausible wrong definition, gives `𝔽₂`, `ℚ` and `ℚ`
  instead, and agrees with the constant field only for `𝔽_p(t)` and `ℚ(t)`.
- The `p`-adic valuation on `ℚ` has residue field `𝔽_p`, and `0 < 1`.
- The trivial valuation has residue field `F`, with no drop: nontriviality is a hypothesis.
- Finite Kronecker dimension does not imply finite generation: `ℚ̄` has Kronecker dimension one.

### 5.8 Isotropy in positive residue characteristic

Prove: if `dim K = r` is finite and `O` is a nontrivial henselian valuation ring with residue
characteristic `p > 0`, every unit Pfister form of fold `r + 1` is isotropic over `K` (Dittmann–Pop,
Proposition 3.2(3), Case 1, p. 7). With `e = dim κ < r` (5.7), `κ` is `C_{e+1}` (5.6 over `𝔽_p`), the
reduced form has `2^{r+1} > 2^{e+1}` variables and a nonzero zero, and 4.1 lifts it. Dyadic mixed
characteristic is included for unit forms in the sense of Layer 4. *Needs:* 4.1, 5.1, 5.6, 5.7.

**Checks.**

- For the henselization of `𝔽_p(t)` at `t`, `r = 1` and every unit two-fold form is isotropic: the
  residue field `𝔽_p` is `C₁` and `4 > 2`.
- `r = 0` is vacuous: a field algebraic over `𝔽_p` has only the trivial valuation.

### Examples

`𝔽_p(t)` is `C₂` with `dim = 1`; its `t`-adic residue field `𝔽_p` is `C₁`. A unit two-fold form over the
henselization reduces to a four-variable quadratic form over `𝔽_p`, isotropic because `4 > 2¹`, and 4.1
lifts the zero. The polynomial `X^d` in one variable has no nonzero zero and sits exactly at the
excluded equality `N = d⁰ = 1`.

### Dependencies

Layer 4 and Layer 1; Mathlib `MvPolynomial`, `char_dvd_card_solutions`, `Ideal.height_le_spanRank_toENat`,
the Nullstellensatz, `Algebra.trdeg`, `algebraicClosure`; `LocalFieldsRamificationPartII` §GF.5;
`SchemeAndStackFoundations` §2.16 for the comparison with Tsen's theorem.

## Layer 6: coefficient fields, real places and the dimension theorem

### 6.0 Real closures

An ordered field `(k, ≤)` is a field with a linear order making it a strictly ordered ring; a *real
closure* of it is a real closed field `R` (Mathlib's `IsRealClosed`), algebraic over `k`, whose
ordering (`x ≥ 0` exactly when `x` is a square) restricts to `≤`. Prove: if `R` is a real closure of
`(k, ≤)` and `φ : k → S` is an order-preserving embedding into a real closed field `S`, then `φ`
extends to exactly one order-preserving embedding `R → S` (Kuhlmann, Theorem 2.2, pp. 2–3). Deduce
that any two real closures of `(k, ≤)` are `k`-isomorphic by exactly one isomorphism (Corollary 2.3,
p. 3); that for a real closed `S` containing `k`, the elements of `S` algebraic over `k` form a real
closure of `k` with the induced ordering (Corollary 2.5, p. 3); and that for an algebraic extension
`L/k` and an order-preserving `φ : k → S`, pulling back the ordering of `S` is a bijection from the
extensions of `φ` to `L` onto the orderings of `L` extending `≤` (Corollary 2.6, pp. 3–4). Existence of
a real closure is Tau Ceti's `TauCeti.RealClosure.exists_realClosure`. The route: a polynomial over
`k` has the same number of roots in any two real closed fields containing `k` with the same induced
ordering, because Sturm's theorem (`TauCeti.Sturm.card_roots_toFinset_univ`) computes that number
from the signs of the leading coefficients of the Sturm sequence, which lie in `k` (Kuhlmann,
Proposition 1.3, p. 1); with it, an order-preserving embedding extends order-preservingly across
every finite subextension of `R` (Proposition 2.1, pp. 2–3), so a maximal partial extension of `φ`
(Zorn's lemma) is defined on all of `R`; and an order-preserving extension must send the `j`-th root in `R` of a minimal polynomial over `k`
to its `j`-th root in `S`, which gives uniqueness. *Needs:* Mathlib `IsRealClosed`,
`Algebra.IsAlgebraic`; Tau Ceti `TauCeti.RealClosure.exists_realClosure`,
`TauCeti.Sturm.card_roots_toFinset_univ`.

**Checks.**

- `k = ℚ(√2)` has two orderings, and the real algebraic numbers with `√2 ↦ +√2`, respectively
  `√2 ↦ −√2`, are real closures of them. These two real closures are not `k`-isomorphic: a field
  isomorphism preserves squares, and the image of `√2` is a square in the first and not in the
  second. So Corollary 2.3 needs the same ordering on both, and Theorem 2.2 needs `φ` order
  preserving: of the two embeddings `k → ℝ`, only `√2 ↦ +√2` extends to the first real closure.
- Corollary 2.6 counts orderings by real roots: `x³ − 2` has one real root, so `ℚ(∛2)` has exactly one
  ordering, while `x² − 2` has two and `ℚ(√2)` has two orderings; `x² + 1` has none and `ℚ(√−1)` has
  no ordering, hence no real closure.
- Algebraicity is part of the definition: `ℝ` is real closed and contains `ℚ`, but it is not a real
  closure of `ℚ`. The real algebraic numbers are (Corollary 2.5 with `S = ℝ`), and they embed into
  `ℝ` while `ℝ` does not embed into them, being uncountable.
- The automorphism group of a real closure over `k` is trivial: for `R` the real algebraic numbers and
  `k = ℚ`, every field automorphism of `R` preserves squares, hence the order, hence is the identity by
  the uniqueness in Theorem 2.2; the automorphisms of `ℚ̄` sending `∛2` to a non-real cube root of `2`
  do not map `R` into itself.

### 6.1 Coefficient fields

State `exists_residueSection_of_charZero`: if `O` is a henselian valuation ring of `K` of arbitrary
rank with residue characteristic zero, the residue map `O → κ` has a ring-homomorphic section
`σ : κ → O`; its image `E = σ(κ)` is a subfield of `O` mapping isomorphically onto `κ`, a coefficient
field. Prove that every such `E` is relatively algebraically closed in `K` and contains the constant
field `k`. State `quadraticPfister_equivalent_residueSection`: for a henselian `O` of arbitrary rank,
any section `σ` of the residue map (whose existence forces `char K = char κ`), units `ε₁, …, ε_m` and
`a₀ ∈ O` with `1 − 4a₀ ∈ Oˣ`, the form `quadraticPfister ε a₀` is isometric over `K` to
`quadraticPfister η b₀` with `ηᵢ = σ(ε̄ᵢ) ∈ Eˣ` and `b₀ = σ(ā₀) ∈ E` (Dittmann–Pop, Proposition
3.2(3), Case 2, p. 7, in residue characteristic zero). For the section, lift a transcendence basis of
`κ` over `ℚ`; the rational function field it generates consists of units and reduces injectively,
and Hensel's lemma extends a maximal partial section over the separable algebraic residue extension:
a residue class outside the image has an irreducible separable minimal polynomial over the image,
whose monic lift has a simple residual root and hence a root in `O`. Every nonzero `x ∈ K`
algebraic over `E` has value `1`: `x` and `x⁻¹` are integral over `E ⊆ O`, and `O` is integrally
closed in `K`, so both lie in `O`. Its minimal polynomial over `E` reduces to an irreducible
polynomial over `Ē = κ` having the root `x̄`, hence has degree one, so `x ∈ E`; the zero element lies
in `E` already. For the transport when `2 ≠ 0` in `κ`: each `εᵢ/ηᵢ` reduces to `1` and is a square
by Hensel's lemma for `X² − εᵢ/ηᵢ`, whose derivative at the residual root `1` is `2 ≠ 0` in `κ`, so
`⟨⟨ε⟩⟩_b ≅ ⟨⟨η⟩⟩_b`; for the terminal block, `2` is a unit of `O` and completing the square gives
`[1, a₀] ≅ ⟨1, −(1 − 4a₀)⟩` and `[1, b₀] ≅ ⟨1, −(1 − 4b₀)⟩`; the ratio `(1 − 4a₀)/(1 − 4b₀)` is a
principal unit, hence a square, so rescaling the second coordinate gives `[1, a₀] ≅ [1, b₀]`; tensor
with the outer isometry. In characteristic two (`1 − 4a₀ = 1`): `a₀ − b₀` lies in the maximal ideal,
so Hensel's lemma for `X² + X − (a₀ − b₀)`, whose derivative at the residual root `0` is `1`, gives
`a₀ − b₀ ∈ ℘(O)` and `[1, a₀] ≅ [1, b₀]` by `x ↦ x + z y`; and for a principal unit `u` and a unit
Pfister form `ρ` with slots in `O`, the form `⟨⟨u⟩⟩_b ⊗ ρ = ρ ⊥ uρ` is hyperbolic by the
principal-unit criterion (4.2) and 1.5, while `ρ ⊥ ρ = ⟨1, 1⟩_b ⊗ ρ` is hyperbolic as `⟨1, 1⟩_b` is
metabolic, so `[uρ] = [ρ]` in `I_q(K)` and `uρ ≅ ρ` by 0.5; induct on the slots with `εᵢ = ηᵢ uᵢ`.
*Needs:* 4.1, 4.2, 5.7, 0.2, 0.5, 1.1, 1.5; Mathlib `HenselianLocalRing`, `IsLocalRing.ResidueField`,
`IsLocalRing.residue`, `Algebra.trdeg`.

- existence of a coefficient field: a section `σ : κ → O` of the residue map, with image `E ≅ κ`,
  when the residue characteristic is zero;
- relative algebraic closedness of every coefficient field `E` in `K`, and `k ⊆ E`;
- unit Pfister forms over `K` are isometric to the forms with slots and terminal coefficient
  transported along any section `σ` of the residue map, in every characteristic.

**Checks.**

- `K = ℚ((t))`: `E = ℚ` is a coefficient field.
- Residue characteristic two is excluded: `ℚ₂` has residue field `𝔽₂` and no subfield maps onto it, the
  characteristics differing.
- `ε = 1 + t` in `ℚ((t))` lifts to `η = 1`, and `1 + t` is a square (binomial series); a general unit
  such as `2 + t` is not a square, but `(2 + t)/2` is.
- The terminal block moves too: for `m = 0` over `ℚ((t))`, `a₀ = t` lifts to `b₀ = 0`, there are no
  outer slots, and `[1, t] ≅ [1, 0]` holds because `1 − 4t` is a square in `ℚ((t))`.
- The unit hypothesis on `1 − 4a₀` is needed for the transport: over `ℚ((t))` with `a₀ = (1 − t)/4`,
  `1 − 4a₀ = t` is a nonunit, `[1, a₀] ≅ ⟨1, −t⟩` is nonsingular, while `b₀ = σ(1/4) = 1/4` gives the
  singular `[1, 1/4] = (x + y/2)²`; the two are not isometric.
- Elements algebraic over the coefficient field are units, in the multiplicative convention: for
  `E = ℚ` in `ℚ((t))`, `2` is algebraic over `E` and `v(2) = 1`, whereas `v(0) = 0`; `t` has `v(t) < 1`
  and is transcendental over `ℚ`.
- The transport holds for any section in every characteristic, not only in characteristic zero: in
  `𝔽₃((t))` with `σ` the constant inclusion, `ε = 1 + t` lifts to `η = 1` and `1 + t` is a square (its
  binomial series has denominators that are powers of `2`). In `𝔽₂((t))` the squares are the series
  in `t²`, so `1 + t` is not a square and `⟨1, 1 + t⟩_b` is not isometric to `⟨1, 1⟩_b`; nevertheless
  `⟨⟨1 + t⟩⟩_b ⊗ [1, 1] = [1, 1] ⊥ (1 + t)[1, 1]` is hyperbolic, since `1 + t` is a norm from `𝔽₄((t))`
  (even valuation), as is `⟨⟨1⟩⟩_b ⊗ [1, 1]`, and the two are isometric. For the terminal block,
  `[1, t] ≅ [1, 0]` over `𝔽₂((t))` because `z = t + t² + t⁴ + t⁸ + ⋯` satisfies `z² + z = t`.
- The section hypothesis is needed: in `ℚ(s)((t))` the ring map `σ′ : ℚ(s) → O` with `σ′(s) = 2s` is
  not a section, and for `m = 0`, `a₀ = s` it would compare `[1, s] ≅ ⟨1, −(1 − 4s)⟩` with
  `[1, 2s] ≅ ⟨1, −(1 − 8s)⟩`, which are not isometric since `(1 − 4s)/(1 − 8s)` is not a square in
  `ℚ(s)`, hence not in `ℚ(s)((t))`.
- Coefficient fields are not canonical: in `ℚ(s)((t))` both `ℚ(s)` and `ℚ(s + t)` map isomorphically onto
  the residue field `ℚ(s)`.

### 6.2 The cohomological bound after a nonreal local base change

Prove: let `k′` be a number field, `E′/k′` finitely generated of transcendence degree `t` with `k′`
relatively algebraically closed in `E′`; at a finite place `v` let `k′_v` be the henselization, at a
complex place an algebraic closure. Then `E′ ⊗_{k′} k′_v` is a field, its compositum `E′k′_v`, and
`cd₂(E′k′_v) ≤ t + 2` at finite places and `≤ t` at complex places; hence `H_q^m(E′k′_v) = 0` for
`m > t + 2` (Dittmann–Pop, Proposition 3.2(3), Claim, p. 7, with the corrected bound below). The
tensor product is a domain because `k′` is relatively algebraically closed in `E′` and `k′_v/k′` is
separable algebraic, and integral over the field `E′`, hence a field (Dittmann–Pop, §2, p. 4). The
henselization of `k′` at a finite place has the same absolute Galois group as the completion
(`LocalFieldsRamificationPartII` §GF.4, Krasner approximation and decompletion), so `cd₂(k′_v) = 2`
(`ClassFieldTheory` Layer 6, `cd_p_absoluteGaloisGroup_eq_two`, including dyadic places), and
`ClassicalAdicEtaleCohomology` §11.2 gives `cd₂(E′k′_v) ≤ cd₂(k′_v) + t`. The printed argument bounds
`cd₂(E′)` first, which is infinite when `E′` is formally real; the local compositum is bounded directly.
*Needs:* `ClassFieldTheory` Layer 6; `ClassicalAdicEtaleCohomology` §11.2; `LocalFieldsRamificationPartII`
§§GF.1, GF.4; `ProfiniteCohomology` Layer 11; 3.1; 5.7.

**Checks.**

- `t = 0`, `E′ = k′ = ℚ`, `v = 2`: `cd₂(ℚ₂^h) = 2`, and `H³(ℚ₂^h, 𝔽₂) = 0`.
- Real places are excluded: `H^m(G_ℝ, 𝔽₂) = 𝔽₂` for every `m`, so `cd₂(ℝ) = ∞`.
- `E′ = ℚ(x)` is formally real with `cd₂(E′) = ∞`, while `cd₂(ℚ(x) ℚ₃^h) ≤ 3`.

### 6.3 Jannsen's Hasse principle for `ℤ/2` coefficients

Prove: let `k₁` be a global field of characteristic different from two and `F/k₁` a function field in
`d` variables in which `k₁` is separably closed; for each place `v` of `k₁` let `F_v` be the function field
of `V ×_{k₁} k̂₁,v` for a model `V`, `k̂₁,v` the completion. Then restriction
`H^{d+2}(F, ℤ/2) → ⊕_v H^{d+2}(F_v, ℤ/2)` is injective (Jannsen, Corollary 0.8, p. 4, an instance of
Theorem 0.4, p. 2, which proves Kato's conjecture for coefficients invertible in `k₁`). Deduce the form
used by Dittmann–Pop (Fact 2.1, p. 4): for `K` finitely generated of characteristic zero and Kronecker
dimension `r ≥ 1`, with constant field `k₁`, a class `α ∈ H^{r+1}(K, ℤ/2)` vanishes as soon as its
restrictions to the algebraic composita `K k₁,v` vanish for every place `v`, `k₁,v` being the
henselization at finite places, the real closure at real places and an algebraic closure at complex
places; restriction to the completion factors through `K k₁,v`, so no comparison between the two is
needed. Jannsen's route proves injectivity with `ℚ_ℓ/ℤ_ℓ(d + 1)` coefficients (Theorem 2.10, p. 24) by
Kato complexes, weights and Gabber's prime-to-`ℓ` alterations (Theorem 2.11, p. 24), and descends to
finite coefficients through the divisibility of `H^{d+1}(F, ℚ_ℓ/ℤ_ℓ(d + 1))` given by the norm-residue
theorem (pp. 3–4). Its open-variety step (proof of Theorem 2.4, pp. 20–24) uses Jannsen's Hasse
principle in degree two, which is proved here as a step: for a global field `k₁`, a prime `ℓ ≠ char k₁`
and a discrete `G_{k₁}`-module `A ≅ (ℚ_ℓ/ℤ_ℓ)^m` mixed of weights different from `−2`, restriction
`H²(k₁, A) → ⊕_v H²(k_{1,v}, A)` is an isomorphism, the sum running over the finitely many bad places and
the places above `ℓ` (Jannsen, Theorem 1.5(a), p. 13). It follows from the injectivity of
`H¹(k₁, T) → ∏_{v ∉ S′} H¹(k_{1,v}, T)` for the Kummer dual lattice `T = Hom(A, μ)`, mixed of weights
different from `0` (Theorem 1.5(b), proved from the weight results by induction on a weight
filtration), by Poitou–Tate duality and local Tate duality applied to the finite modules `A[ℓⁿ]` and a
limit over `n` (Jannsen, proof of Theorem 1.5, p. 16); the same step uses Tate's isomorphism
`H³(k₁, A) ≅ ⊕_{v real} H³(k_{1,v}, A)` for torsion `A` (p. 21). *Needs:*
`AdicCoefficientsAndComparisonsPartII` §PA.6.9; `ArithmeticGaloisDuality` §§R02.4.2, R02.4.3, R02.4.5 and
R02.4.6 (local Tate duality, Poitou–Tate for number fields and function fields, all-place kernels); `DeligneWeightsAndPurity`
§§7.12 and 7.15 (weights of `H^i` over finite fields and purity for proper smooth varieties);
`MotivesAndAlgebraicCycles` §0.5b (Gersten and coniveau complexes, through which the Kato complexes are
defined); `ClassFieldTheory` Layer 10 (the Hasse principle for the Brauer group of a global field, the
case `d = 0`); `KTheoryFiniteLocalFields` §3.0a; `SchemeAndStackFoundations` §2.15; 3.1.

**Checks.**

- `d = 0`: `H²(k₁, ℤ/2) = Br(k₁)[2]` injects into the sum of local Brauer groups, the classical
  Albert–Brauer–Hasse–Noether theorem.
- The degree is `d + 2`, not `2`: for `d = 1` the map on `Br(F)[2] = H²(F, ℤ/2)` is not injective in
  general, its kernel containing the `2`-torsion of the Tate–Shafarevich group of the Jacobian (Jannsen,
  p. 2).
- Real places are included in the family: for `F = ℚ(x)` and `α = (−1) ∪ (−1) ∪ (−1)`, `α ≠ 0` is detected
  at the real place, where `ℝ(x)` keeps it nonzero.
- The weight condition of the degree-two step is needed: `A = ℚ₂/ℤ₂(1)` has weight `−2`, and
  `H²(ℚ, A)` contains the `2`-primary Brauer classes, whose local invariants sum to zero, so restriction
  to `⊕_v H²(ℚ_v, A)` is not onto. For `A = 0` both sides vanish.

### 6.4 Finite descent of the real-place condition

Prove: let `K` be equicharacteristic zero with a nontrivial henselian valuation ring `O`, `dim K = r`
finite, constant field `k` and coefficient field `E` (6.1); let `q_η` be a unit Pfister form of fold `r + 1`
with slots in `E`. If `q_η` is isotropic over the compositum `K k_v` for every real closure `k_v` of `k`,
then there is a finitely generated `E′ ⊆ E` containing the slots such that, with `k′ = E′ ∩ k`, the
invariant `e_{r+1}(q_η)` vanishes over `E′ k′_v` for every place `v` of the number field `k′`
(Dittmann–Pop, Proposition 3.2(3), Claim and proof, pp. 7–8). Nonreal places contribute zero by 6.2,
since `dim E′ ≤ dim E < r`. For each `E′` the set `Σ_{E′}` of real places of `k′` with nonzero invariant is
finite, and enlarging `E′` maps the sets to each other by restriction; if all were nonempty,
`nonempty_sections_of_finite_inverse_system` would give a compatible real place of `k`, at which the
real-place hypothesis, unit reduction for the prolonged valuation on `K k_v` (residue field `κ k_v`,
coefficient field `E k_v`) and continuity of Galois cohomology along the directed union of the
`E′ k′_v` (`SchemeAndStackFoundations` §2.15, `etale_cohomology_limits`) give a contradiction.
The sets `Σ_{E′}` are well defined and the transition maps exist because every real closure of
`(k′, v′)` is `k′`-isomorphic to every other and receives an order-preserving `k′`-embedding of each
ordered algebraic extension (6.0); the limit argument identifies the real closures `k′_{v′}` with
subfields of the real closure `k_v` (6.0, Corollary 2.5 of Kuhlmann).
*Needs:* 6.0, 6.1, 6.2, 3.7–3.9, 4.1, 5.7; Mathlib `nonempty_sections_of_finite_inverse_system`; Tau Ceti
`TauCeti.RealClosure.exists_realClosure`; `SchemeAndStackFoundations` §2.15.

**Checks.**

- The inverse system is of finite sets of bad real places, not of the spaces of all orderings; the
  transition maps need not be surjective, which the Mathlib theorem allows.
- If `k` has no ordering (for instance `k ⊇ ℚ(i)`), every `Σ_{E′}` is eventually empty and the
  hypothesis is vacuous.
- The identification needs uniqueness: `ℚ(√2)` has two orderings, and over each the real closure is
  the field of real algebraic numbers with `√2` sent to `+√2` or to `−√2`; the invariant at an ordering
  is computed in any real closure inducing it, and two such are isomorphic over `ℚ(√2)` by a unique
  isomorphism (6.0).

### 6.5 The dimension theorem for unit Pfister forms

State `not_anisotropic_quadraticPfister_of_kroneckerDimension`: let `K` have Kronecker dimension `r` and a
nontrivial henselian valuation ring `O`, with no finite-generation hypothesis; let `ε : Fin r → Oˣ` and
`a₀ ∈ O` with `1 − 4a₀ ∈ Oˣ`. If `quadraticPfister ε a₀` is isotropic over the compositum of `K` with every
real closure of the constant field `k`, it is isotropic over `K` (Dittmann–Pop, Proposition 3.2(3),
pp. 6–8). The compositum condition is stated through every field `L` receiving `K` and a real closed field
`R` algebraic over `k`, compatibly on `k`; since `K ⊗_k R` is a field (6.2), this is the same as isotropy
over `K k_v`. Positive residue characteristic is 5.8. In residue characteristic zero, replace the form by
one with slots in a coefficient field `E` (6.1), choose `E′` by 6.4, put `F′ = E′(T)` for a transcendence
basis `T` of `K/E′`, so that `F′` is finitely generated of Kronecker dimension `r` with constant field the
number field `k′`; the invariant vanishes over every `F′ k′_v`, hence over `F′` by 6.3, and the form is
isotropic over `F′` by 3.9 and so over `K`. *Needs:* 5.8, 6.1–6.4, 3.7–3.9, 5.7, 0.2; Mathlib
`IsRealClosed`, `Algebra.IsAlgebraic`.

**Checks.**

- If `char κ = p > 0` (for instance the henselization of `𝔽_p(t)` at `t`, or of `ℚ` at `2`), 5.8 already
  concludes. The real-place hypothesis is then vacuous anyway: the constant field of a field of
  characteristic `p` has no ordering, and the constant field of the henselization of `ℚ` at `2` contains
  `√−7` (as `−7 ≡ 1 mod 8`), so it has none either.
- The real-place hypothesis cannot be dropped: for `K` the henselization of `ℚ(x)` at `x`, `dim K = 2`,
  the constant field is `ℚ`, and with `ε = (−1, −1)`, `a₀ = 1/2` (so `1 − 4a₀ = −1` and
  `[1, 1/2] ≅ ⟨1, 1⟩`) the form is `⟨⟨−1, −1, −1⟩⟩ = 8⟨1⟩`. It is anisotropic over `K ⊆ ℚ((x))`, which is
  formally real, and also over the compositum with the real algebraic numbers, so the hypothesis fails
  together with the conclusion.
- `r = 0` is vacuous: a nontrivial valuation forces `dim K ≥ 1`.

### Examples

If `dim K = r` and the residue characteristic is zero, the coefficient field `E` has `dim E ≤ r − 1`. For
finitely generated `E′/k′` inside `E`, `t = trdeg_{k′} E′ ≤ r − 2`, and at a finite place
`cd₂(E′k′_v) ≤ t + 2 ≤ r`, so degree `r + 1` cohomology vanishes there. A formally real `E′` has infinite
`cd₂`; the argument bounds the local compositum and uses the real-place hypothesis only at real closures.

### Dependencies

Layers 1, 3, 4 and 5; `ClassFieldTheory` Layers 6 and 10; `ClassicalAdicEtaleCohomology` §11.2;
`LocalFieldsRamificationPartII` §§GF.1, GF.4; `AdicCoefficientsAndComparisonsPartII` §PA.6.9;
`DeligneWeightsAndPurity` §§7.12, 7.15; `MotivesAndAlgebraicCycles` §0.5b; `KTheoryFiniteLocalFields`
§3.0a; `ArithmeticGaloisDuality` §§R02.4.2, R02.4.3, R02.4.5, R02.4.6; `SchemeAndStackFoundations` §2.15;
`RealAlgebraicGeometry` Layer 1 through Tau Ceti's `TauCeti.RealClosure.exists_realClosure`; Tau Ceti's
Sturm theorem `TauCeti.Sturm.card_roots_toFinset_univ`; `ProfiniteCohomology` Layer 11; Mathlib
`nonempty_sections_of_finite_inverse_system`, `IsRealClosed`.

## Layer 7: patch-open henselization loci

Let `Val_F` be the valuation spectrum of the field `F`, Tau Ceti's `TauCeti.ValuationSpectrum F` (the
trivial valuation included), with the patch topology `TauCeti.ValuationSpectrum.patchTopology F`.
Valuations in this layer are written additively, as in Dittmann–Pop; in this notation every set
`{w : w(a) ≥ 0}`, `{w : w(b) > 0}` and `{w : w(c) = 0}` is patch clopen (Dittmann–Pop, §3.C, p. 11); these
are finite Boolean combinations of Tau Ceti's basic opens, which are clopen for the patch topology.
For `w ∈ Val_F` let `F_w^h` be the henselization (`LocalFieldsRamificationPartII` §GF.1).

### 7.1 Embedding loci

Prove: for every finite extension `E/F`, the set of `w` such that `E` admits an `F`-embedding into `F_w^h`
is patch open; it does not depend on the choice of henselization, and it is empty unless `E/F` is
separable (Dittmann–Pop, Lemma 3.9(1), p. 11). A finite subextension of `F_w^h` lies in an étale
neighbourhood (`SchemeAndStackFoundations` §0.12), so `E = F(η)` with `η` integral, monic minimal polynomial
`p` with `w`-integral coefficients and `w(p′(η)) = 0`; since `F_w^h/F` is immediate there is `x ∈ F` with
`w(x − η) > 0`, hence `w(p(x)) > 0` and `w(p′(x)) = 0`. The finitely many
clopen conditions `ŵ(aᵢ) ≥ 0`, `ŵ(p(x)) > 0`, `ŵ(p′(x)) = 0` define a neighbourhood of `w` on which `p` has
a simple Hensel root in `F_ŵ^h`. *Needs:* Tau Ceti `TauCeti.ValuationSpectrum`,
`TauCeti.ValuationSpectrum.patchTopology`, `TauCeti.ValuationSpectrum.isClopen_patchTopology_basicOpen`;
`AdicSpaces` Layer 1; `LocalFieldsRamificationPartII` §GF.1; `SchemeAndStackFoundations` §0.12.

**Checks.**

- `F = ℚ`, `w` the `7`-adic valuation, `p = T² − 2`, `x = 3`: `p(3) = 7`, `p′(3) = 6`, so the clopen
  neighbourhood `{ŵ(7) > 0, ŵ(6) = 0}` consists of valuations in whose henselization `√2` exists.
- At the trivial valuation of `ℚ`, `ℚ^h = ℚ` and `ℚ(√2)` does not embed, so the locus is not all of
  `Val_ℚ`.
- An inseparable `E`, such as `𝔽₂(√t)` over `𝔽₂(t)`, has empty locus.

### 7.2 Isotropy loci

State `isOpen_setOf_forall_henselian_not_anisotropic`: for every quadratic form `q` over `F`, the set of
`w` such that `q` is isotropic over `F_w^h` is patch open, with no hypothesis of nonsingularity, Pfister
shape, characteristic or rank (Dittmann–Pop, Lemma 3.9(2), p. 11). Isotropy over `F_w^h` is stated as
isotropy of `extendScalars q L` over every field `L` in the universe of `F` that receives `F` and carries a
henselian valuation ring `O` whose valuative relation (`ValuativeRel.ofValuation`) pulls back to `w`
along `F → L` (`TauCeti.ValuationSpectrum.comap`): `F_w^h` is one such field, and by its universal
property (`LocalFieldsRamificationPartII` §GF.1) it embeds over `F` into every other, so the two
conditions agree. An isotropic vector over `F_w^h` has coordinates in a finite subextension `E/F`, and
the embedding locus of `E` (7.1) is a neighbourhood of `w` on which the vector transports. The printed
sentence calls this a neighbourhood of the quadratic form; it is a neighbourhood of the valuation `w` in
`Val_F` (Dittmann–Pop, p. 11). *Needs:* 7.1, 0.2; Mathlib `QuadraticMap.Anisotropic`, `HenselianLocalRing`,
`ValuativeRel.ofValuation`; Tau Ceti `TauCeti.ValuationSpectrum.comap`,
`TauCeti.ValuationSpectrum.patchTopology`; `LocalFieldsRamificationPartII` §GF.1.

**Checks.**

- An isotropic `q` has locus `Val_F`.
- `⟨1⟩` is anisotropic over every field and has empty locus.
- `⟨1, 1⟩` over `ℚ`: the locus contains the `p`-adic valuations with `p ≡ 1 mod 4` (where `−1` is a square
  in `ℚ_p^h`) and omits the trivial valuation and the `3`-adic one.

### Examples

For `F = ℚ` at the `7`-adic valuation, `p(T) = T² − 2` and `x = 3` give `w(p(x)) > 0` and `w(p′(x)) = 0`
with `p` monic and integral; the finite intersection of the three kinds of conditions is a clopen
neighbourhood on which `ℚ(√2)` embeds in the henselization. The trivial valuation lies outside it.

### Dependencies

Layer 0 for scalar extension; Tau Ceti's valuation spectrum and patch topology; `AdicSpaces` Layer 1;
`LocalFieldsRamificationPartII` §GF.1; `SchemeAndStackFoundations` §0.12.

## Downstream consumers

- `LogicAndDefinabilityInNumberTheoryPartII` builds its nice Pfister presentations on 1.1
  (`quadraticPfister`) and uses the invariant-zero criterion and naturality (3.8–3.9), the unit,
  principal-unit and independent-value criteria (Layer 4), the Kronecker dimension and `C_i` bounds
  (Layer 5), the dimension theorem (6.5) and the openness of henselian isotropy loci (7.2) for the
  definability of prime divisors.
- `RealSurfacePeriodIndex` uses the Tsen–Lang theorem (5.6) for function fields of real surfaces and
  their complexifications; its Layer PI.0 owns the real-function-field applications listed in Scope.

## Worked examples

**A characteristic-two Pfister form across the layers.** Over `F = 𝔽₂(t)`, let
`ρ = quadraticPfister (t) 1 = ⟨⟨t⟩⟩_b ⊗ [1, 1] = [1, 1] ⊥ t[1, 1]`. Its values on polynomial vectors have
`t`-degree of both parities in different blocks, so it is anisotropic (4.3 with the `t`-adic valuation on
`𝔽₂((t))`, residue form `[1, 1]` anisotropic over `𝔽₂`); by 1.5 it is not hyperbolic and its class in
`I_q²(F)` is nonzero; by 3.6 and 3.9 its invariant `e₂(ρ) = [dt/t] ∈ H₂²(F)` is nonzero; by 2.11 any
anisotropic form in `I_q²(F)` has dimension at least `4 = dim ρ`. Over `𝔽₄(t)` the block `[1, 1]` splits,
`ρ` becomes hyperbolic, and `e₂` restricts to zero (3.8); over `𝔽₂(t^{1/2})` the slot `t` becomes a square,
`ρ` is again hyperbolic, and `dt/t` restricts to `0` because `dt = 2 t^{1/2} d(t^{1/2}) = 0`.

**The minus-sign convention in odd characteristic.** Over `ℚ`, `quadraticPfister (−1, −1) (1/2)` is
`⟨⟨−1, −1⟩⟩_b ⊗ ⟨1, 1⟩ = 8⟨1⟩`, since `[1, 1/2] ≅ ⟨1, −(1 − 2)⟩ = ⟨1, 1⟩`. It is anisotropic, and
`kummerSymbol 2 (−1, −1, −1) = (−1)³ ≠ 0` in `H³(G_ℚ, 𝔽₂)`, as `not_anisotropic_pfisterForm_iff_kummerSymbol_eq_zero`
requires. Over `ℚ(√−1)` both sides vanish; over `ℚ₂` the form is isotropic (dimension eight over a
`p`-adic field) and `H³(G_{ℚ₂}, 𝔽₂) = 0`.

**Dimension count at a nonreal place.** Let `K` be the henselization of `ℚ(x, y)` at the `y`-adic valuation:
`dim K = 3`, residue field `ℚ(x)` of characteristic zero, coefficient field `E = ℚ(x)`, constant field `ℚ`.
A unit four-fold form has slots in `E` after 6.1. For a finitely generated `E′ ⊆ E`, `trdeg_ℚ E′ ≤ 1`, and at
a finite place `cd₂(E′ℚ_p^h) ≤ 1 + 2 = 3 < 4`, so its invariant vanishes there by 6.2; only the real place
of `ℚ` remains, which is exactly the hypothesis of 6.5.

**A patch-clopen witness.** In `Val_ℚ`, the conditions `w(−2) ≥ 0`, `w(7) > 0`, `w(6) = 0` cut out a clopen
set containing the `7`-adic valuation, on which `T² − 2` has the simple residual root `3`, so `ℚ(√2)` embeds
in every henselization; the trivial valuation lies outside, and so does every `p`-adic valuation with
`p ≠ 7`.

## References

- **ekm** — Richard Elman, Nikita Karpenko and Alexander Merkurjev, *The Algebraic and Geometric Theory of
  Quadratic Forms*, AMS Colloquium Publications 56 (2008), [author copy](https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf);
  printed page numbers. §§1–2 (bilinear Witt ring, Lemma 2.1, Proposition 2.4, Corollary 2.5, pp. 19–20),
  §4 (Theorem 4.8, p. 23; (4.11) and Proposition 4.13, p. 25; Theorem 4.22, p. 27), §5 ((5.1), p. 28;
  Lemma 5.2 and Proposition 5.3, p. 29; Fact 5.15, p. 31), §7 (Notation 7.3, Examples 7.5–7.6, Lemmas 7.12 and 7.15, Proposition 7.13,
  Proposition 7.19, Example 7.23, Propositions 7.29 and 7.31, pp. 40–46), §8 (Theorems 8.3–8.5, (8.7),
  Lemma 8.16, Remarks 8.17–8.18, pp. 47–51), §9 (Examples 9.3–9.4, (9.5), Proposition 9.8, Corollaries 9.9–9.10,
  Lemma 9.11, pp. 52–54), §16 (Proposition 16.1, Fact 16.2, pp. 67–68), §17 (Theorem 17.3, Corollary 17.7,
  Proposition 17.9, Theorem 17.12, pp. 71–74), §18 (Theorem 18.3, Corollary 18.5, pp. 76–77), §19
  (Lemmas 19.2–19.5, Propositions 19.7–19.8, pp. 79–80), §20 (Lemma 20.1 to Corollary 20.13, Theorems 20.14
  and 20.16, pp. 83–87), §22 (Propositions 22.1 and 22.4, Example 22.2, Theorem 22.5, pp. 93–94), §23
  (Theorem 23.7, p. 100), §97 (Lemma 97.1 and Theorem 97.2, p. 385; Corollaries 97.5–97.6 and Theorem 97.7, p. 386), §101 (pp. 402–404).
- **dp** — Philip Dittmann and Florian Pop, *Characterizing finitely generated fields by a single field
  axiom*, Annals of Mathematics 198 (2023), 1203–1227; read as [arXiv:2012.01307v2](https://arxiv.org/abs/2012.01307v2).
  §1 (p. 1), §2 and Fact 2.1 (pp. 3–4), §3, Fact 3.1 and Proposition 3.2 with its proof (pp. 6–8), §3.C and
  Lemma 3.9 (p. 11). Three printed slips are corrected in place: the outer factors in characteristic two
  are bilinear (p. 6), the subset coefficients carry the signs `(−1)^{|S|}` (p. 7), and the open set in
  Lemma 3.9(2) is a neighbourhood of the valuation (p. 11); the cohomological-dimension step of the Claim
  (p. 7) is replaced by the bound of 6.2.
- **morel** — Fabien Morel, *Milnor's conjecture on quadratic forms and mod 2 motivic complexes*, Rendiconti
  del Seminario Matematico della Università di Padova 114 (2005), 63–101, [Numdam](https://www.numdam.org/item/RSMUP_2005__114__63_0/).
  §1 (Theorems 1.1 and 1.3, pp. 64–66), §2 (Definition 2.1, Theorems 2.2 and 2.3, Remark 2.5, Theorems
  2.11 and 2.12, Lemma 2.14, pp. 70–81), §3 (Theorem 3.4, Lemmas 3.5–3.9, Theorem 3.10, Lemma 3.11 and its
  proof, Lemmas 3.12–3.16, Corollary 3.17, pp. 84–93).
- **ovv** — Dmitri Orlov, Alexander Vishik and Vladimir Voevodsky, *An exact sequence for K_*^M/2 with
  applications to quadratic forms*, Annals of Mathematics 165 (2007), 1–13,
  [publisher copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v165-n1-p01.pdf). Theorem 4.1, p. 11
  (characteristic zero).
- **kato82** — Kazuya Kato, *Symmetric bilinear forms, quadratic forms and Milnor K-theory in characteristic
  two*, Inventiones Mathematicae 66 (1982), 493–510, DOI 10.1007/BF01389226; cited by its main theorem as
  stated in EKM, Facts 5.15 and 16.2 (the bilinear and quadratic comparisons of 3.6).
- **jannsen16** — Uwe Jannsen, *Hasse principles for higher-dimensional fields*, Annals of Mathematics 183
  (2016), 1–71, [publisher copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf).
  Theorem 0.4 (p. 2), Corollary 0.8 (p. 4), Theorem 1.5 and its proof (pp. 13–16), Theorem 2.4 and its
  proof (pp. 20–24), Theorems 2.10 and 2.11 (p. 24).
- **ojanguren-panin** — Manuel Ojanguren and Ivan Panin, *A purity theorem for the Witt group*, Annales
  scientifiques de l'École normale supérieure 32 (1999), 71–86, [Numdam](http://www.numdam.org/item/ASENS_1999_4_32_1_71_0/).
  Theorem A, p. 72.
- **arason75** — Jón Kristinn Arason, *Cohomologische Invarianten quadratischer Formen*, Journal of
  Algebra 36 (1975), 448–491, DOI 10.1016/0021-8693(75)90145-3; Satz 3.3 and the odd-degree injectivity proved after it, as used in
  Morel, proofs of Theorem 2.11 (p. 78) and Lemma 2.14 (p. 81).
- **kuhlmann** — Salma Kuhlmann, *Real algebraic geometry, lecture notes 08* (12 November 2009),
  University of Konstanz, [course page copy](https://www.math.uni-konstanz.de/algebra/WS0910/Notes08.pdf).
  Proposition 1.3 (p. 1), Proposition 2.1 and Theorem 2.2 (pp. 2–3), Corollaries 2.3–2.6 (pp. 3–4).
- **milnor70** — John Milnor, *Algebraic K-theory and quadratic forms*, Inventiones Mathematicae 9 (1970),
  318–344, DOI 10.1007/BF01425486; §4, Question 4.3, p. 332, and the prime-field computations, as quoted by
  Morel, pp. 64–66.
