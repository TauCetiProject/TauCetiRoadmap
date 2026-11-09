# Roadmap: global quadratic forms over number fields

**Summary.** This roadmap completes the local-to-global theory of regular quadratic forms over an
arbitrary number field `K`. It starts from Tau Ceti's localizations of a form at the finite and
real places, the four local predicates built on them, real signatures, finite Hasse signs, the
invariant record `GlobalFormInvariants` with its admissibility predicate, Hilbert reciprocity and
Hilbert sign prescription for the norm-equation symbol, the conditional quaternary and
rank-at-least-five steps of Hasse–Minkowski, the local realization of admissible records, and the
global-to-local map of Witt rings. On these it proves the global square theorem, the binary and
ternary cases of Hasse–Minkowski, and then Hasse–Minkowski for isotropy, for the representation
of scalars and of forms, and for isometry. It ends with the existence of a global form with
prescribed admissible local invariants (O'Meara 72:1), the classification of regular forms by rank,
global discriminant, finite Hasse signs and real positive indices, global hyperbolicity, and the
injectivity of the global-to-local map of Witt rings. The end theorems are
`hasseMinkowski_equivalent`, `exists_globalForm_of_isAdmissible`,
`equivalent_iff_globalInvariants_eq` and `injective_wittRing_baseChange_places`.

## Scope and ownership

This roadmap owns:

- transport along isomorphisms of number fields (4.1), through which seven of the eight Tau Ceti
  inputs stated for number fields in `Type` serve number fields in every universe; the remaining
  one, the first inequality, is applied only to a model in `Type` inside 4.2;
- the global square theorem (4.2) and the quadratic Hasse norm theorem read as representation by
  the binary form `⟨1, -d⟩` (4.3);
- the binary and ternary cases of Hasse–Minkowski isotropy (5.1) and the theorem in every rank
  (5.5);
- Hasse–Minkowski for nonzero scalars, for forms and for isometry (6.1–6.3);
- existence of a global form with prescribed local behaviour, realization of admissible records
  and uniqueness (7.2–7.4);
- classification by invariants, global hyperbolicity, injectivity of the global-to-local Witt map,
  and the isometry corollary for the orthogonal-group roadmaps (8.1–8.4);
- the worked examples that test these theorems.

Already in Tau Ceti, and consumed through the supplier contracts below rather than planned here:
the localizations of a form and of a unit at finite, real and complex places, with their
compatibility with sums, scaling, negation, isometry, representation, regularity, discriminants
and towers of completions; the predicates `IsLocallyIsotropic`, `LocallyRepresentsScalar`,
`LocallyRepresents` and `LocallyEquivalent` and their API; the automaticity of complex places;
real signatures and the real classification; finite Hasse signs, their finite support, and the
classification at one finite place in global notation; the invariant record, admissibility and
the record of a form; vector weak approximation and the openness of square classes; the value of
the norm-equation symbol at a real place, the localized product formula and Hilbert sign
prescription with and without a prescribed second argument; quaternary descent, the quaternary
case of Hasse–Minkowski assuming the ternary case, the rank-at-least-five step assuming the rank
below, the finiteness of anisotropic places in rank at least three, and the local values used by
that step; the local realization of an admissible record and the reduction of 72:1 to one global
representation; the local hyperbolicity criteria; the global-to-local map of Witt rings and its
value on the Witt class of a form; and the worked examples `⟨1, 1, -3⟩`, `⟨1, 1⟩`,
`⟨1, 1, -1⟩ ≅ ⟨1, 2, -2⟩` and the `ℚ(√5)` record.

Section and name map. A citation of one of the ids below resolves to the Tau Ceti declarations
named on its line. They hold for number fields in every universe except where a line says "in
`Type`"; for those, the statement for a number field in any universe is its transport through
4.1 (a model in `Type` by the first fact, the declaration there, and the conclusion back by the
second):

- Layer 0, localizations and local predicates, resolves to `QuadraticForm.atFinitePlace`,
  `QuadraticForm.atRealPlace`, `QuadraticForm.atComplexEmbedding`,
  `QuadraticForm.IsLocallyIsotropic`, `QuadraticForm.LocallyRepresentsScalar`,
  `QuadraticForm.LocallyRepresents` and `QuadraticForm.LocallyEquivalent`, with
  `QuadraticForm.equivalent_atComplexEmbedding_iff_finrank_eq` for the complex places.
- Layer 1, real places, resolves to `QuadraticForm.realPositiveIndex`,
  `QuadraticForm.realNegativeIndex` and `QuadraticForm.equivalent_atRealPlace_iff_realSignature_eq`.
- Layer 2, finite places, resolves to `QuadraticForm.finiteHasse`,
  `QuadraticForm.hasFiniteMulSupport_finiteHasse` and
  `QuadraticForm.equivalent_atFinitePlace_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq`.
- Layer 3, admissible systems of local invariants, resolves to the record
  `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` (3.1), `GlobalFormInvariants.IsAdmissible`
  (3.2), and the record of a form `QuadraticForm.globalInvariants` with
  `QuadraticForm.isAdmissible_globalInvariants_iff` (3.3); the admissibility of the record of a
  regular form of positive rank is `QuadraticForm.isAdmissible_globalInvariants`, in `Type`.
- 4.4, the localized product formula, resolves to `TauCeti.hilbertSymbol_productFormula`, in
  `Type`.
- 4.4, the real symbol, resolves to `TauCeti.hilbertSymbol_real` and
  `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff`.
- 4.4, sign prescription with a prescribed second argument, resolves to
  `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`, in `Type`.
- 4.4, sign prescription for a pair, cited under the name exists_hilbertSymbol_eq_neg_one_iff_pair,
  resolves to `TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`, in `Type`.
- 4.4, the Hasse product of one form, resolves to
  `QuadraticForm.globalInvariants_hasseProduct_eq_one`, in `Type`.

This roadmap does not own, and cites:

- diagonalization, Witt cancellation and extension, the Hilbert symbol over one field, and the
  classification over one nonarchimedean local field: Quadratic Form Invariants, whose results
  used here are Tau Ceti declarations;
- weak approximation, adeles and ideles: Global Number Fields;
- completions and their towers: Number Field Arithmetic;
- the Hasse norm theorem, reciprocity and the idele-class norm index: Class Field Theory;
- nonabelian cohomology and the localization kernel of `H¹(K, SO(Q))`: this roadmap defines no
  `H¹`. The pointed set `H¹(G, A)` of continuous cocycles is Tau Ceti's `TauCeti.NonabelianH1`
  (`RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean`). Orthogonal and Spin
  Groups, in its consumer contract for Orthogonal Tamagawa and Lattice Mass, assigns to that
  roadmap the translation of 6.3, and so of its corollary 8.4, into the triviality of the kernel
  of `H¹(K, SO(Q)) → ∏_v H¹(K_v, SO(Q))`;
- integral lattices, genera, spinor genera and mass formulae: Integral Lattices;
- quadratic forms in characteristic two and over global function fields.

## Conventions

- `K` is a number field (`[Field K] [NumberField K]`, in any universe); seven of the eight Tau Ceti
  inputs stated for number fields in `Type` reach every universe through 4.1, and the remaining
  one, the first inequality, is applied only to `K` in `Type` inside 4.2. A form is a
  `QuadraticForm K V` on a finite-dimensional `V`; regular means `QuadraticMap.Nondegenerate`
  (written `Q.Nondegenerate`, a `QuadraticForm` being a `QuadraticMap` with values in its ring).
  Two forms on `V` and on `W` may live in different universes. Where a Tau Ceti carrier takes
  `[Invertible (2 : K)]` (the Witt ring), any instance serves: they are all equal.
- "Locally" means at every finite place `v : HeightOneSpectrum (𝓞 K)`, through
  `v.adicCompletion K`, and at every real place `w`, through `InfinitePlace.embedding_of_isReal`.
  Complex places are omitted because Tau Ceti proves that they add no condition.
- A localization is the actual `QuadraticForm.baseChange` along the map into the completion
  (`QuadraticForm.atFinitePlace`, `QuadraticForm.atRealPlace`), never a free family of local forms.
- The discriminant is the plain one, `d(⟨a₁, …, aₙ⟩) = [a₁ ⋯ aₙ]` in `Kˣ/(Kˣ)²`, written additively
  in `SquareClassGroup K`, so its zero is the class `[1]`. The signed discriminant is
  `(-1)^(n(n-1)/2) · d`.
- The Hasse sign at a finite place is `s_v(⟨a₁, …, aₙ⟩) = ∏_{i<j} (aᵢ, aⱼ)_v` (Serre, Ch. IV,
  §2.1), the convention of `RegularFormClass.localHasse`; the empty product makes it `1` in rank
  at most one. O'Meara's symbol is the product over `i ≤ j` and is not used.
- The symbol `(a, b)_F` is `TauCeti.hilbertSymbol`: it is `1` exactly when `b = x² - a y²` has a
  solution in `F`, and `-1` otherwise.
- At a real place `w`, `p_w` is the positive index and `q_w = n - p_w` the negative index. The real
  Hasse sign of `p⟨1⟩ ⊥ q⟨-1⟩` is `(-1)^(q(q-1)/2)` and the sign of its determinant is `(-1)^q`.
- The invariant record `GlobalFormInvariants K` has an unrestricted rank `n : ℕ`, a global
  discriminant, a finite Hasse sign `s_v ∈ {±1}` at every finite place and a positive index `p_w`
  at every real place. Positivity of the rank and finite support of the Hasse signs are clauses of
  `GlobalFormInvariants.IsAdmissible`, not of the record. The zero form on the zero space is
  regular; its record has rank `0`, discriminant `[1]` (the empty determinant is `1`), every
  `s_v = 1` and every `p_w = 0`; it is realized and it is not admissible.
- `QuadraticMap.Represents Q a` means `Q x = a` for some `x`; `Q.IsRepresentedBy R` means an
  injective isometry from `Q` into `R`.

**Checks.**

- The hyperbolic plane `H = ⟨1, -1⟩` has plain discriminant `[-1]` and signed discriminant `[1]`;
  `⟨1, 1⟩` has plain `[1]` and signed `[-1]`. Reading the signed discriminant where the plain one
  is meant exchanges these two.
- Over `ℝ`, `s(H) = (1, -1)_ℝ = 1` with the product over `i < j`, while the product over `i ≤ j` is
  `(1, 1)(1, -1)(-1, -1) = -1`: the two conventions differ on a two-term form.
- `(-1, -1)_ℝ = -1` because `-1 = x² + y²` has no real solution, and `(-1, 1)_ℝ = 1`; the real
  Hasse sign of `⟨-1, -1⟩` is `(-1)^(2·1/2) = -1`, the same value.
- `(-1, 3)_{ℚ₃} = -1` and `(-1, 3)_{ℚ₂} = -1`, while `(-1, 3)_ℝ = 1`: the symbol of this pair is
  `-1` at exactly two places, as the product formula requires.
- The record of the zero form fails `1 ≤ n` and so is not admissible, although it is the record of a
  regular form.

## Exact supplier contracts

There is no roadmap supplier. Every input below, and every declaration the section map names, is
a declaration of Mathlib or Tau Ceti, read at the revisions the content repository's manifest
records: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Eight of the Tau Ceti inputs are stated for number
fields in `Type`:
`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`,
`TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`,
`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`,
`TauCeti.hilbertSymbol_productFormula`, `QuadraticForm.globalInvariants_hasseProduct_eq_one`,
`QuadraticForm.isAdmissible_globalInvariants`,
`TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` and
`TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`. Section 4.1 carries the last
seven of these to number fields in every universe. The first, the first inequality of class field
theory, is not transported: it concerns a second field `L`, idele classes and the index of a norm
group, which 4.1 does not carry, and 4.2 applies it only after transporting its own hypothesis and
conclusion to a model of `K` in `Type`.

### From Mathlib

- `QuadraticForm`, `QuadraticForm.baseChange` (`LinearAlgebra/QuadraticForm/TensorProduct.lean`),
  `QuadraticMap.Anisotropic` (`LinearAlgebra/QuadraticForm/Basic.lean`) and
  `QuadraticMap.Equivalent` (`LinearAlgebra/QuadraticForm/IsometryEquiv.lean`): forms, scalar
  extension along an algebra map, anisotropy (`Q x = 0` only for `x = 0`; the zero-dimensional
  form is anisotropic), and the existence of an isometry.
- `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean`): the radical is `⊥`
  and the kernel of the polar form has rank at most one. When `2` is invertible the radical is the
  kernel of the polar form (`QuadraticMap.radical_eq_ker_polarBilin`), so this is regularity in the
  usual sense: `⟨1, -1⟩` satisfies it, `⟨1, 0⟩` does not, and the zero form on the zero space does.
- `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'`
  (`LinearAlgebra/QuadraticForm/IsometryEquiv.lean`): a form whose associated bilinear form is
  separating is isometric to a diagonal form `⟨a₁, …, aₙ⟩` with unit weights.
- `IsDedekindDomain.HeightOneSpectrum` and `HeightOneSpectrum.adicCompletion`
  (`RingTheory/DedekindDomain/AdicValuation/Completion.lean`): the finite places and their
  completions.
- `NumberField.InfinitePlace`, `InfinitePlace.IsReal`, `InfinitePlace.embedding_of_isReal`
  (`NumberTheory/NumberField/InfinitePlace/Basic.lean`), `InfinitePlace.Completion` and
  `InfinitePlace.Completion.ringEquivRealOfIsReal`
  (`NumberTheory/NumberField/Completion/InfinitePlace.lean`): the infinite places, the real
  embedding of a real place, and the identification of its completion with `ℝ`.
- `IdeleGroup` and `IdeleClassGroup` (`NumberTheory/NumberField/AdeleRing.lean`): the ideles and
  the idele classes.
- `IsSquare`, `Function.HasFiniteMulSupport` and `finprod`.
- Transport of number fields: `Field.exists_primitive_element`
  (`FieldTheory/PrimitiveElement.lean`), `IntermediateField.adjoinRootEquivAdjoin`
  (`FieldTheory/IntermediateField/Adjoin/Basic.lean`; `AdjoinRoot (minpoly F α) ≃ₐ[F] F⟮α⟯` for
  integral `α`), `NumberField.RingOfIntegers.mapRingEquiv` (`NumberTheory/NumberField/Basic.lean`;
  a field isomorphism restricted to the rings of integers),
  `IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv`
  (`RingTheory/DedekindDomain/Ideal/Lemmas.lean`; the induced bijection of height-one primes),
  `NumberField.InfinitePlace.comap`, `NumberField.InfinitePlace.isReal_comap_iff` (pulling back
  along a ring isomorphism preserves reality) and `NumberField.InfinitePlace.comap_embedding_of_isReal`
  (when the pulled-back place is real, its complex embedding is the composite of the complex
  embedding with the ring map) (`NumberTheory/NumberField/InfinitePlace/Ramification.lean`), with
  `NumberField.InfinitePlace.embedding_of_isReal_apply`
  (`NumberTheory/NumberField/InfinitePlace/Basic.lean`; the real embedding of a real place, read
  in `ℂ`, is its complex embedding), which together give the same statement for the real
  embeddings `embedding_of_isReal`.
- `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`
  (`LinearAlgebra/FiniteDimensional/Lemmas.lean`): a linear map between finite-dimensional spaces of
  the same dimension is injective exactly when it is surjective.
- `injective_iff_map_eq_zero` (`Algebra/Group/Hom/Basic.lean`): a homomorphism of additive groups is
  injective exactly when its kernel is zero.
- `Module.finrank_baseChange` (`LinearAlgebra/Dimension/Constructions.lean`): scalar extension
  `A ⊗[K] V` of a free module keeps its rank, so a localization of a form on `V` lives on a space of
  dimension `finrank K V`.

### From Tau Ceti

All paths are under `TauCeti/`.

- Localization (`NumberTheory/QuadraticForm/Global/Localization.lean`, `Operations.lean`,
  `Discriminant.lean`, `CompletionTower.lean`, `Classification.lean`): `QuadraticForm.atFinitePlace`,
  `QuadraticForm.atRealPlace`, `QuadraticForm.atComplexEmbedding`,
  `HeightOneSpectrum.unitAtFinitePlace` and `TauCeti.unitAtRealPlace`; the transport of
  isometry, representation and regularity (`QuadraticMap.Equivalent.atFinitePlace`,
  `QuadraticMap.Equivalent.atRealPlace`, `QuadraticForm.Nondegenerate.atFinitePlace`,
  `QuadraticForm.Nondegenerate.atRealPlace`); compatibility with orthogonal sums (the isometries
  `QuadraticForm.atFinitePlaceProd` and `QuadraticForm.atRealPlaceProd` from the localization of
  `Q ⊥ R` to `Q_v ⊥ R_v`), negation
  (`QuadraticForm.atFinitePlace_neg`, `QuadraticForm.atRealPlace_neg`) and scaling
  (`QuadraticForm.atFinitePlace_smul`, `QuadraticForm.atRealPlace_smul`: the localization of
  `c • Q` is the image of `c` times the localization of `Q`); diagonal forms (the isometries
  `QuadraticForm.atFinitePlaceWeightedSumSquares` and `QuadraticForm.atRealPlaceWeightedSumSquares`
  from the localization of `⟨a₁, …, aₙ⟩` to the diagonal form of the images of the `aᵢ`); the
  localized discriminant
  (`QuadraticForm.discr_atFinitePlace`: the discriminant of `Q_v` is the image of that of `Q`); and
  `QuadraticForm.IsLocallyIsotropic.baseChange` for a finite extension of number fields.
- Local predicates (`NumberTheory/QuadraticForm/Global/Predicates.lean`):
  `QuadraticForm.IsLocallyIsotropic`, `QuadraticForm.LocallyRepresentsScalar`,
  `QuadraticForm.LocallyRepresents`, `QuadraticForm.LocallyEquivalent`, each a conjunction over
  every finite and every real place; `QuadraticForm.isLocallyIsotropic_of_not_anisotropic`,
  `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff` (isometric forms are locally
  isotropic together),
  `QuadraticForm.LocallyEquivalent.of_equivalent`, `QuadraticForm.LocallyRepresents.of_isRepresentedBy`,
  `QuadraticForm.LocallyEquivalent.finrank_eq`, `QuadraticForm.LocallyRepresents.finrank_le`,
  `QuadraticForm.LocallyEquivalent.locallyRepresents` (local isometry gives local representation),
  `QuadraticForm.LocallyRepresents.locallyRepresentsScalar` (if `Q` is locally represented by `R`,
  every scalar locally represented by `Q` is locally represented by `R`),
  `QuadraticForm.LocallyRepresentsScalar.of_represents` (a scalar represented by `Q` over `K` is
  represented by its localization at every finite and every real place) and
  `QuadraticForm.LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod` (local representation of
  `a` makes `⟨-a⟩ ⊥ W` locally isotropic).
- Complex places (`NumberTheory/QuadraticForm/Global/ComplexPlaces.lean`):
  `QuadraticForm.equivalent_atComplexEmbedding_iff_finrank_eq` and the four lemmas showing that
  each local predicate implies its complex clause.
- Real places (`NumberTheory/QuadraticForm/Global/Signature.lean`, `RealHasse.lean`):
  `QuadraticForm.realSignature`, `QuadraticForm.realPositiveIndex`,
  `QuadraticForm.realNegativeIndex`, `QuadraticForm.equivalent_atRealPlace_iff_realSignature_eq`
  and the anisotropy criterion at a real place (definiteness).
- Finite places (`NumberTheory/QuadraticForm/Global/FiniteHasse.lean`, `HasseSupport.lean`,
  `AnisotropicPlaces.lean`, `Classification.lean`): `QuadraticForm.finiteHasse` with its
  diagonal formula and orthogonal-sum formula; `QuadraticForm.hasFiniteMulSupport_finiteHasse`;
  `QuadraticForm.finite_setOfPred_anisotropic_atFinitePlace` (rank at least three);
  `QuadraticForm.equivalent_atFinitePlace_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq` and
  `QuadraticForm.locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq`.
- Invariant records (`NumberTheory/QuadraticForm/Global/Invariants.lean`, `FormInvariants.lean`,
  `ProductFormula.lean`, `Classification.lean`): `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants`
  and `GlobalFormInvariants.IsAdmissible` (positive rank; `p_w ≤ n` and real discriminant
  `q_w • [-1]`; finite support of `s_v`; `s_v = 1` in rank one, and in rank two where the local
  discriminant is `[-1]`; Hasse product one), `QuadraticForm.globalInvariants` (defined in every
  rank), `QuadraticMap.Equivalent.globalInvariants_eq`,
  `QuadraticForm.isAdmissible_globalInvariants_iff` (admissible exactly when the rank is positive
  and the Hasse product is one), `QuadraticForm.globalInvariants_hasseProduct_eq_one`,
  `QuadraticForm.isAdmissible_globalInvariants` (positive rank), and
  `QuadraticForm.LocallyEquivalent.of_globalInvariants_eq`.
- Symbols (`NumberTheory/HilbertSymbol/Basic.lean`, `Archimedean.lean`,
  `NumberTheory/QuadraticForm/Global/ArchimedeanSymbol.lean`, `HilbertSymbol.lean`,
  `ProductFormula.lean`, `SignPrescription.lean`): `TauCeti.hilbertSymbol`,
  `TauCeti.hilbertSymbol_real`, `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff`,
  `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (the finite symbols of
  `a, b ∈ Kˣ` are `1` at almost every finite place), `TauCeti.hilbertSymbol_productFormula` (their
  product `∏ᶠ` over the finite places times the product over the real places is `1`),
  `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` and
  `TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`.
- Approximation (`NumberTheory/NumberField/Global/Approximation/Weak.lean`, `Vector.lean`,
  `SquareClass.lean`, `NumberTheory/QuadraticForm/Global/Nonsquare.lean`):
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (the diagonal image of `K` is dense in
  any finite product of finite and infinite completions),
  `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` (the same for vectors),
  `TauCeti.GlobalNumberFields.exists_fieldUnit_isSquare_div_at_places` (for finite sets of finite
  places and of real places, prescribed units `a_v` of the finite completions and nonzero reals
  `b_w`, one `x ∈ Kˣ` with `x / a_v` a square in `K_v` and `x / b_w` a square in `ℝ` through the
  real embedding; it combines weak approximation with the openness of the squares, which at a
  finite place is `TauCeti.isOpen_range_powMonoidHom` with exponent `2` and at a real place is the
  openness of the positive reals), and
  `TauCeti.NumberField.QuadraticForm.exists_fieldUnit_not_isSquare_at_places`.
- Transport (`RingTheory/DedekindDomain/AdicValuation/Transport.lean`,
  `RingTheory/DedekindDomain/Ideal/Basic.lean`):
  `IsDedekindDomain.HeightOneSpectrum.valuation_ringEquivOfRingEquiv` (an isomorphism of Dedekind
  domains carries the `v`-adic valuation of the fraction field to the valuation at the image prime),
  `IsDedekindDomain.HeightOneSpectrum.asIdeal_equivOfRingEquiv` (the image prime of
  `equivOfRingEquiv` is the image ideal) and `IsDedekindDomain.HeightOneSpectrum.adicCompletionCongr`
  (a field isomorphism `σ : K ≃+* K'` compatible with the valuations at `v` and `w` extends to
  `K_v ≃+* K'_w`, continuous and agreeing with `σ` on `K`).
- Ideles and class field theory (`NumberTheory/NumberField/Global/Ideles/Norm/Relative.lean`,
  `Range.lean`, `Surjective.lean`, `NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean`,
  `NumberTheory/ClassFieldTheory/Global/HasseNorm/Quadratic.lean`):
  `TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap`,
  `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff` (an idele is a norm exactly when each
  coordinate is a norm from the local algebra),
  `TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` (for
  an extension `L/K` of number fields, if every unit of `K_v` is a norm from `K_v ⊗_K L` at every
  finite place `v` outside a finite set, the norm map on idele classes is onto),
  `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`
  (for a cyclic extension `L/K` of number fields in `Type`, that is `[IsGalois K L]` and
  `[IsCyclic Gal(L/K)]`, `[L : K] ≤ [C_K : N(C_L)]`; without the cyclic hypothesis it fails, for
  `L = ℚ(∛2, ζ₃)` has degree `6` over `ℚ` and norm index `2`) and
  `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion` (for a nonsquare `d` and
  `a ∈ Kˣ`, `a = x² - d y²` is solvable in `K` exactly when it is solvable in every finite and every
  infinite completion).
- Local form theory (`LinearAlgebra/QuadraticForm/Representation.lean`, `Radical.lean`,
  `Witt/Cancellation.lean`, `Witt/Extension.lean`, `RegularFormClass/Discriminant.lean`,
  `RegularFormClass/LowRank.lean`, `NumberTheory/LocalField/QuadraticForm/Hasse.lean`,
  `Classification.lean`, `Realization.lean`):
  `QuadraticMap.Represents`, `QuadraticMap.IsRepresentedBy`,
  `QuadraticMap.Equivalent.anisotropic_iff` (isometric forms are anisotropic together),
  `QuadraticMap.IsometryEquiv.represents_iff` (isometric forms represent the same values),
  `QuadraticMap.not_anisotropic_prod_of_represents_neg` (if `Q₁` represents `a ≠ 0` and `Q₂`
  represents `-a`, then `Q₁ ⊥ Q₂` is isotropic),
  `QuadraticMap.represents_of_nondegenerate_of_not_anisotropic` (a regular isotropic form is
  universal), `QuadraticMap.IsRepresentedBy.exists_equivalent_prod` (when `2` is invertible, a
  finite-dimensional regular form `Q₁` represented by a regular form `Q` splits off:
  `Q ≅ Q₁ ⊥ Q|_P` with `Q|_P` regular), the regularity of auxiliary forms when `2` is invertible
  (`QuadraticMap.Nondegenerate.prod`: an orthogonal sum of regular forms is regular;
  `QuadraticMap.nondegenerate_smul_iff`: scaling by a unit preserves regularity;
  `QuadraticMap.nondegenerate_smul_sq`: the line `⟨a⟩` is regular for `a ≠ 0`;
  `QuadraticMap.Nondegenerate.exists_isUnit`: a regular form on a nonzero space takes a unit
  value), `TauCeti.equivalent_of_equivalent_prod` (Witt cancellation),
  `QuadraticMap.IsometryEquiv.exists_extension` (Witt extension),
  `TauCeti.RegularFormClass.discr` (over a field in which `2` is invertible, the class in
  `SquareClassGroup K` of the product of the weights of any diagonalization, independent of the
  diagonalization), `TauCeti.RegularFormClass.localHasse` (over a nonarchimedean local field in
  which `2` is invertible, the product over `i < j` of the Hilbert symbols `(aᵢ, aⱼ)` of the
  weights of any diagonalization `⟨a₁, …, aₙ⟩`, independent of the diagonalization, in `ℤˣ`),
  `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (over any field in which
  `2` is invertible, a regular binary form is isotropic exactly when its discriminant is `[-1]`),
  `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` and
  `TauCeti.RegularFormClass.exists_of_realization`.
- Hasse–Minkowski steps (`LinearAlgebra/QuadraticForm/QuaternaryDescent.lean`,
  `NumberTheory/QuadraticForm/Global/Quaternary.lean`, `HigherRank.lean`, `ApproximateValue.lean`,
  `LocalValues.lean`): `QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`
  (O'Meara 58:7), `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary` (a locally
  isotropic regular quaternary form is isotropic, given the ternary case over every number field
  in the universe of `K`),
  `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (the same in rank
  `n ≥ 5`, given rank `n - 1` over `K`; both state the lower-rank case only for the diagonal forms
  `TauCeti.presentedForm p` on `Fin p.1 → L`, which are regular by
  `TauCeti.nondegenerate_presentedForm` and to which every regular form is isometric by
  `TauCeti.exists_presentedForm_equivalent`, all three in
  `LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`),
  `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`
  (for `U ≠ 0` and regular `W` anisotropic at finitely many finite places, with matching local
  values where `W` is anisotropic, a global `x` with `U x ≠ 0` and `-U x` locally represented by
  `W`), and `QuadraticForm.exists_atFinitePlace_ne_zero_eq_neg`.
- Existence (`NumberTheory/QuadraticForm/Global/LocalRealization.lean`, `PrescribedLocalForms.lean`,
  `Existence.lean`, `CorrectionPlanes.lean`, `Classification.lean`):
  `GlobalFormInvariants.IsLocalRealization`,
  `GlobalFormInvariants.IsAdmissible.exists_isLocalRealization`,
  `GlobalFormInvariants.isAdmissible_ofLocalForms`, `GlobalFormInvariants.isLocalRealization_ofLocalForms`,
  `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod` (for an admissible
  record with a local realization: a regular `W` on `Kⁿ` and `a, b ∈ Kˣ` such that `⟨a, -ab⟩` is
  locally represented by `⟨1, -b⟩ ⊥ W`, and a global representation yields a form with the record),
  `QuadraticForm.nondegenerate_weightedSumSquares_one_neg` and
  `QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul` (the correction planes `⟨1, -b⟩`
  and `⟨a, -ab⟩` are regular for `a, b ∈ Kˣ`),
  `QuadraticForm.exists_discr_eq_equivalent_of_isRepresentedBy_prod`,
  `GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
  `GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace` (a form with record `I` is
  isometric at each place to any family realizing `I`).
- Form classes, hyperbolicity and Witt rings
  (`LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`,
  `NumberTheory/QuadraticForm/Global/Hyperbolicity.lean`, `WittLocalization.lean`,
  `LinearAlgebra/QuadraticForm/Witt/Ring.lean`, `Witt/Decomposition.lean`, `Witt/BaseChange.lean`):
  `TauCeti.formClass_eq_iff` (two regular forms have the same class exactly when they are
  isometric), `TauCeti.formClass_prod` (the class of `Q ⊥ R` is the sum of the classes),
  `TauCeti.formClass_smul` (`RegularFormClass/TensorProduct.lean`; for a unit `a`, the class of
  `a • Q` is `⟨a⟩` times the class of `Q`),
  `TauCeti.formClass_presentedForm` (every class of regular forms is the class of the diagonal form
  `TauCeti.presentedForm p` of one of its presentations),
  `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`,
  `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` and
  `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass` (a regular form whose class over
  `K` is `m` times the hyperbolic class has that class at every finite and every real place),
  `TauCeti.WittRing`, `TauCeti.wittClass_surjective` (every element of `W(K)` is the Witt class of
  a class of regular forms), `TauCeti.wittClass_eq_zero_iff` (a class has Witt class zero exactly when its anisotropic
  part is zero), `TauCeti.RegularFormClass.wittDecomposition` (a class is a multiple of the
  hyperbolic class plus its anisotropic part), `TauCeti.RegularFormClass.add_neg_one_mul` (`q ⊥ -q`
  is `dim q` hyperbolic planes), `TauCeti.WittRing.baseChange`, `TauCeti.WittRing.globalToLocal`
  (the ring homomorphism `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)` whose components are scalar extension along
  `K → K_v` and along the real embedding of `w`) and
  `TauCeti.WittRing.globalToLocal_wittClass_formClass` (on the Witt class of a regular form `Q`, the
  components are the Witt classes of the localizations `Q_v` and `Q_w`).
- Examples (`NumberTheory/QuadraticForm/Global/TernaryObstruction.lean`, `BinaryObstruction.lean`,
  `DefiniteObstruction.lean`, `HyperbolicIsometry.lean`, `WorkedExamples/Sqrt5.lean`,
  `Invariants.lean`): `TauCeti.NumberField.QuadraticForm.anisotropic_sumTwoSquaresSubThreeSq`,
  `TauCeti.NumberField.QuadraticForm.not_equivalent_sumTwoSquaresSubThreeSq_sumTwoSquaresSubSq`,
  `TauCeti.NumberField.QuadraticForm.infinite_anisotropic_sumTwoSquares_atFinitePlace`,
  `TauCeti.NumberField.QuadraticForm.exists_anisotropic_and_not_anisotropic_away_from_realPlace`,
  `TauCeti.NumberField.QuadraticForm.equivalent_sumTwoSquaresSubSq_sqAddTwoSqSubTwoSq`,
  `TauCeti.NumberField.QuadraticForm.Sqrt5.exists_admissible_rank_three`,
  `GlobalFormInvariants.isAdmissible_rankOne_iff_eq_empty` and
  `GlobalFormInvariants.isAdmissible_rankTwo_iff_eq_empty`.

## How to read the build

The build starts at Layer 4. The foundations (localization, local predicates, archimedean and
finite invariants, the invariant record) are Tau Ceti declarations, and the section map in Scope
and ownership resolves citations of Layers 0–3 to them. Layer 4 first carries seven of the eight
Tau Ceti inputs stated for number fields in `Type` to every universe (the first inequality is used
only in `Type`, inside 4.2), and then proves the two arithmetic inputs of
Hasse–Minkowski that are not in Tau Ceti: the global square theorem and the quadratic Hasse norm
theorem in the language of forms. Layer 5 proves the binary and ternary cases and
assembles Hasse–Minkowski for isotropy in every rank from them and Tau Ceti's conditional
quaternary and higher-rank steps. Layer 6 derives Hasse–Minkowski for representation and
isometry. Layer 7 produces a global form from admissible local data, using Layer 6 for the single
global representation that Tau Ceti's reduction leaves open. Layer 8 draws the classification and
the Witt-ring consequences. The worked examples test the end theorems on `ℚ` and on `ℚ(√5)`.

## Layer 4: global square, norm, and approximation lemmas

### 4.1 Transport along isomorphisms of number fields

The headline theorems are stated for number fields `K : Type u`, while the eight Tau Ceti inputs
listed at the head of the supplier contracts are stated for number fields in `Type`. Prove the two
facts that carry seven of them to every universe. The remaining one, the first inequality
`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`, is a statement about a cyclic
extension `L/K`, idele classes and the index of the image of `ideleClassNormMap K L`, none of which
the second fact transports; it is consumed only by 4.2, which reduces to `K` in `Type` first.

1. Every number field `K : Type u` is isomorphic to a number field in `Type`. Route:
   `Field.exists_primitive_element` gives `α ∈ K` with `ℚ⟮α⟯ = K`, and
   `IntermediateField.adjoinRootEquivAdjoin` identifies `AdjoinRoot (minpoly ℚ α)`, a number field
   in `Type`, with `ℚ⟮α⟯`.
2. A ring isomorphism `σ : K ≃+* K'` of number fields, in any two universes, transports every
   object of this roadmap. On places: the finite places correspond through
   `IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv (NumberField.RingOfIntegers.mapRingEquiv σ)`,
   written `v ↦ σ v`, and `σ` extends to `IsDedekindDomain.HeightOneSpectrum.adicCompletionCongr`,
   an isomorphism `K_v ≃+* K'_(σ v)` agreeing with `σ` on `K`, whose valuation hypothesis comes from
   `IsDedekindDomain.HeightOneSpectrum.valuation_ringEquivOfRingEquiv` and
   `IsDedekindDomain.HeightOneSpectrum.asIdeal_equivOfRingEquiv`; the infinite places correspond
   through `w' ↦ w'.comap σ`, which preserves reality (`NumberField.InfinitePlace.isReal_comap_iff`)
   and real embeddings: when `w'.comap σ` is real, its complex embedding is that of `w'` composed
   with `σ` (`NumberField.InfinitePlace.comap_embedding_of_isReal`), and
   `NumberField.InfinitePlace.embedding_of_isReal_apply` reads both real embeddings inside `ℂ`, so
   the real embedding of `w'.comap σ` is that of `w'` composed with `σ`. On forms: a form
   `Q` over `K` on `V` gives the form `σQ = σ ∘ Q` over `K'` on the same group `V`, with `K'`
   acting through `σ⁻¹`. Prove that `σQ` is regular, is anisotropic, represents `σ a`, is
   isometric to `σR`, or is injectively represented by `σR`, exactly when `Q` has the
   corresponding property over `K`; that each of the four local predicates holds for `σQ` exactly
   when it holds for `Q`, because the localization of `σQ` at `σ v` is isometric to the scalar
   extension of the localization of `Q` at `v` along `adicCompletionCongr`, and at corresponding
   real places the two localizations are scalar extensions along the same real embedding; that
   `IsSquare (v.unitAtFinitePlace a)` holds exactly when `IsSquare ((σ v).unitAtFinitePlace (σ a))`
   does; that Hilbert symbols, and solvability of `a = x² - d y²`, agree at corresponding places;
   and that the record of `σQ` is the record of `Q` reindexed along the two correspondences of
   places, with its discriminant mapped by `σ`, a reindexing that preserves
   `GlobalFormInvariants.IsAdmissible`. On local forms: write `τ_v : K_v ≃+* K'_(σ v)` for the
   isomorphism `adicCompletionCongr`. A form `U_v` over `K_v` on `Fin n → K_v` gives the form
   `τ_v U_v`, `x ↦ τ_v(U_v(τ_v⁻¹ ∘ x))`, over `K'_(σ v)` on `Fin n → K'_(σ v)`. Prove that
   `τ_v U_v` is regular exactly when `U_v` is, that its discriminant is the image under `τ_v` of
   the discriminant of `U_v`, and that the two have the same local Hasse invariant
   `TauCeti.RegularFormClass.localHasse`, because the Hilbert symbols of `K_v` and `K'_(σ v)` agree
   along `τ_v`. A form `R_w` over `ℝ` at a real place `w` of `K` is kept, at the real place of `K'`
   that corresponds to `w`. Hence a family `(U, R)` realizing a record `I`
   (`GlobalFormInvariants.IsLocalRealization`) transports to a family realizing the reindexed
   record: the discriminants match because `τ_v` agrees with `σ` on `K`, and the Hasse signs and
   positive indices are reindexed along the same correspondences of places.

Together these give the other seven inputs for number fields in every universe: transport the
data to a model in `Type` by the first fact, apply the input there, and transport the conclusion
back by the second. The first inequality is not transported: 4.2 transports its own hypothesis
(local squares at the places outside `S`) and conclusion (a global square), and applies the first
inequality to the model of `K` in `Type` and a quadratic extension of it, also in `Type`. This is
how 4.2, 4.3, 7.2 and 7.3 reach the generality of their statements.

*Needs:* Mathlib `Field.exists_primitive_element`, `IntermediateField.adjoinRootEquivAdjoin`,
`NumberField.RingOfIntegers.mapRingEquiv`, `IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv`,
`NumberField.InfinitePlace.comap`, `NumberField.InfinitePlace.isReal_comap_iff`,
`NumberField.InfinitePlace.comap_embedding_of_isReal`,
`NumberField.InfinitePlace.embedding_of_isReal_apply`; Tau Ceti
`IsDedekindDomain.HeightOneSpectrum.adicCompletionCongr`,
`IsDedekindDomain.HeightOneSpectrum.valuation_ringEquivOfRingEquiv`,
`IsDedekindDomain.HeightOneSpectrum.asIdeal_equivOfRingEquiv`, `QuadraticForm.atFinitePlace`,
`QuadraticForm.atRealPlace`, `HeightOneSpectrum.unitAtFinitePlace`, `TauCeti.hilbertSymbol`,
`TauCeti.RegularFormClass.discr`, `TauCeti.RegularFormClass.localHasse`,
`QuadraticForm.globalInvariants`, `GlobalFormInvariants.IsAdmissible`,
`GlobalFormInvariants.IsLocalRealization`.

**Checks.**

- Complex conjugation `σ` on `ℚ(i)` exchanges `𝔭 = (2 + i)` and `𝔭̄ = (2 - i)`. Modulo `𝔭̄` one has
  `i ≡ 2` and `2 + i ≡ 4 = 2²`, a nonzero square modulo `5`, so `2 + i` is a square in `K_𝔭̄`; it is
  not a square in `K_𝔭`, where its valuation is `1`. Its image `σ(2 + i) = 2 - i` is a square in
  `K_(σ 𝔭̄) = K_𝔭` and not in `K_𝔭̄`. A transport that kept each place fixed would assert that
  `2 - i` is a square in `K_𝔭̄`, which is false: the correspondence of places must follow `σ`.
- With the same `σ`, the local form `⟨1, -(2 + i)⟩` over `K_𝔭̄` is isotropic, since `2 + i` is a
  square there. Its transport along `τ_𝔭̄ : K_𝔭̄ ≃+* K_𝔭` is `⟨1, -(2 - i)⟩` over `K_𝔭`, again
  isotropic, as `i ≡ -2` and `2 - i ≡ 4 = 2²` modulo `𝔭`. The same coefficients read over `K_𝔭̄`
  give an anisotropic form, since `2 - i` has valuation `1` there: a local realization transports
  to the place `σ v`, not to `v`.
- `K = ℚ(√5)` with `θ² = θ + 1` and its model `ℚ[X]/(X² - X - 1)`, `θ ↦ X̄`: the real place
  `θ ↦ (1 + √5)/2` corresponds to `X̄ ↦ (1 + √5)/2` and likewise for the conjugate, and the record
  of `⟨1, θ, θ⟩`, with positive indices `3` and `1` at these two places, goes to the record of
  `⟨1, X̄, X̄⟩` with the same indices at the corresponding places.
- On `K = ℚ(√5)`, `θ² = θ + 1`, take the automorphism `σθ = 1 - θ` and the real place `w'` with
  `θ ↦ (1 + √5)/2`. The real embedding of `w'.comap σ` sends `θ` to `(1 - √5)/2`, the value of `w'`
  at `σθ`, so `w'.comap σ` is the other real place. For `Q = ⟨1, θ, θ⟩` the form `σQ` is
  `⟨1, 1 - θ, 1 - θ⟩`, whose positive index at `w'` is `1`, the index of `Q` at `w'.comap σ`; a
  transport that kept the real place fixed would give `3`, the index of `Q` at `w'`.
- For `σ` the identity both correspondences of places are the identity and `σQ = Q`; the zero form
  transports to the zero form, whose record has rank `0` and is admissible on neither side.

### 4.2 The global square theorem

Prove that a unit `a ∈ Kˣ` which is a square in `K_v` for every finite place `v` outside a finite
set `S` is a square in `K` (`isSquare_of_isSquare_unitAtFinitePlace_of_notMem`; O'Meara 65:15;
Milne, VIII, Theorem 1.1 with `n = 2`, p. 229). No condition is imposed at the archimedean places.
The case `S = ∅` is the form consumed by the binary case of 5.1.

A route through the idele-class norm index. By 4.1 the hypothesis and the conclusion transport
along an isomorphism of number fields, so it suffices to treat `K` in `Type`, where the class field
theory input is stated.

1. Suppose `a` is not a square in `K` and let `E = K(√a)`, a quadratic extension, hence Galois with
   cyclic Galois group of order `2`. Enlarge `S` by every archimedean place.
2. At a finite place `v ∉ S`, `a` is a square in `K_v`, so `K_v ⊗_K E ≅ K_v × K_v` and every
   element of `K_vˣ` is a norm from it.
3. Let `i` be an idele. By `TauCeti.GlobalNumberFields.exists_fieldUnit_isSquare_div_at_places`,
   applied to the finite places of `S` and to the real places (whose completions are read in `ℝ`
   through `InfinitePlace.Completion.ringEquivRealOfIsReal`), some `α ∈ Kˣ` has `i_v / α` a square
   in `K_vˣ` for each `v ∈ S`; at a complex place every element is a square. A square `c²` is the
   norm of `c ∈ K_v ⊆ K_v ⊗_K E`.
4. So every coordinate of `α⁻¹ i` is a local norm, and `mem_range_ideleNormMap_iff` puts `α⁻¹ i` in
   the image of the idele norm map. As `i` was arbitrary, the norm map on idele classes is onto.
5. This contradicts `finrank_le_index_range_ideleClassNormMap` for the cyclic extension `E/K`,
   which gives `2 = [E : K] ≤ [C_K : N(C_E)]`.

Steps 3 and 4 together are Tau Ceti's
`TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top`: for an
extension `L/K` of number fields and a finite set `S` of finite places such that every unit of
`K_v` is a norm from `K_v ⊗_K L` at every finite `v ∉ S`, the norm map on idele classes is onto.
Applied to `L = E` after step 2, it gives the surjectivity used in step 5 directly.

⚠ Steps 2 and 3 need no statement about the distribution of primes: the finitely many places where
`a` is not a local square are absorbed by weak approximation in step 3. The argument "a nontrivial
quadratic extension cannot split at almost every place" is this theorem in other words and cannot
replace step 5. Step 3 cannot ask for `α` equal to `i_v` at every `v ∈ S`, that is, for `i` to be
a global element times an idele whose components at the places of `S` are `1`: over `ℚ` with `S`
the real place, the idele with component `√2` at the real place and `1` at every prime is not of
that form, since the global element would have to be `√2`, which is not rational. Step 3 asks only
that `i_v / α` be a square at each place of `S`, which `α = 1` already achieves for this idele.

*Needs:* 4.1; Tau Ceti `TauCeti.GlobalNumberFields.exists_fieldUnit_isSquare_div_at_places`,
`TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap`,
`TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`,
`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`; Mathlib `IdeleGroup`,
`IdeleClassGroup`, `InfinitePlace.Completion.ringEquivRealOfIsReal`. Steps 3 and 4 can instead
be taken together from Tau Ceti
`TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top`.

**Checks.**

- Over `ℚ`, `a = 4` satisfies the hypothesis with `S = ∅` and the conclusion holds with `2² = 4`.
- Over `ℚ`, `a = -1` is a nonsquare in `ℚ_p` for every `p ≡ 3 (mod 4)`, infinitely many places,
  so no finite `S` meets the hypothesis; this is consistent with `-1` being a nonsquare in `ℚ`.
  Likewise `a = 2` is a nonsquare in `ℚ_p` for every `p ≡ ±3 (mod 8)`.
- The theorem has no archimedean hypothesis and so forces one: an element that is a square at all
  but finitely many finite places is positive at every real place. Over `ℚ`, `a = -4` is a square
  in `ℚ_p` exactly when `-1` is, which fails for every `p ≡ 3 (mod 4)`, so the hypothesis fails as
  it must.
- The exponent cannot be raised: `16` is an eighth power in `ℚ_p` for every odd prime `p` (one of
  `-1`, `2`, `-2` is a square modulo `p`, and `x⁸ - 16` has the factors `x² + 2x + 2`, `x² - 2`,
  `x² + 2`) and in `ℝ`, but not in `ℚ` (Milne, VIII, Exercise 1.3, p. 229). So the eighth-power
  analogue of 4.2 is false, with exceptional set `{2}`.

### 4.3 The quadratic Hasse norm adapter

This section adapts the quadratic Hasse norm theorem to the language of forms. Prove that for a
nonsquare `d ∈ K` and `a ∈ Kˣ`, the binary form `⟨1, -d⟩` represents `a` over `K` exactly when it
does so at every finite and every real place (`LocallyRepresentsScalar`; the case of the quadratic
extension `K(√d)/K` in Milne, VIII, Theorem 3.1, p. 234). The arithmetic content is
`TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`, stated for `K` in `Type` and
carried to every universe by 4.1; the work here is to identify, at each finite place and each real
place, solvability of `a = x² - d y²` in the completion with representation of `a` by the
localization of `⟨1, -d⟩`, the real completion being identified with `ℝ` through
`InfinitePlace.Completion.ringEquivRealOfIsReal`, and to discharge the complex places, where
`⟨1, -d⟩` represents every nonzero scalar. The localization of `⟨1, -d⟩` is isometric to the plane
`⟨1, -d⟩` over the completion (`QuadraticForm.atFinitePlaceWeightedSumSquares`,
`QuadraticForm.atRealPlaceWeightedSumSquares`), and isometric forms represent the same values
(`QuadraticMap.IsometryEquiv.represents_iff`).

*Needs:* 4.1; Tau Ceti `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`,
`QuadraticForm.LocallyRepresentsScalar`, `QuadraticForm.atFinitePlace`,
`QuadraticForm.atRealPlace`, `QuadraticForm.atFinitePlaceWeightedSumSquares`,
`QuadraticForm.atRealPlaceWeightedSumSquares`, `QuadraticMap.IsometryEquiv.represents_iff`;
Mathlib `InfinitePlace.Completion.ringEquivRealOfIsReal`.

**Checks.**

- `d = -1`, `a = 5` over `ℚ`: `5 = 1² + 2²`, and both sides hold.
- `d = -1`, `a = 3` over `ℚ`: `3` is not a sum of two rational squares, and locally
  `(-1, 3)_{ℚ₃} = -1` says that `3` is not a sum of two squares in `ℚ₃`; both sides fail, at the
  place `3` on the local side.
- `d = 2`, `a = -1` over `ℚ`: `x² - 2y² = -1` at `x = y = 1`, and at the real place
  `1 - 2 = -1`; both sides hold, and the real clause is a genuine condition (for `d = -1`, `a = -1`
  it fails at the real place).
- `d = 1` is excluded: `⟨1, -1⟩` is hyperbolic and represents every scalar, and the supplier
  theorem assumes `d` nonsquare.

### Examples

- `⟨1, 1⟩` over `ℚ` represents `5` and not `3`; the obstruction for `3` is local at `3`.
- `a = 4` is a square everywhere and globally; `a = 2` is a square in `ℚ₇` (`3² = 9 ≡ 2 mod 7`) but
  not in `ℚ₃` or `ℚ₅`.

### Dependencies

Layer 4 uses only Mathlib and Tau Ceti: the primitive element theorem and the transport of places
and completions along ring isomorphisms (4.1), weak approximation in local square classes, the idele
norm map with its placewise description, the first inequality of global class field theory for
cyclic extensions, and the quadratic Hasse norm theorem in coordinates.

## Layer 5: Hasse–Minkowski isotropy

### 5.1 Binary and ternary cases

These are the binary and ternary steps of the proof of Hasse–Minkowski in Milne, VIII, Theorem
3.5(b), p. 237, whose reductions to squares and to norms are Proposition 3.7(b) and (c), p. 236.

Prove that a regular binary form which is isotropic at every finite and every real place is
isotropic over `K` (Milne, VIII, proof of Theorem 3.5(b), case `n = 2`, through Proposition 3.7(b)
and Theorem 1.1). Route: over any field in which `2` is invertible, a regular binary form is
isotropic exactly when its discriminant is `[-1]`
(`QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two`). At a finite place `v`
the localization `Q_v` is regular (`QuadraticForm.Nondegenerate.atFinitePlace`), binary
(`Module.finrank_baseChange`) and isotropic, and its discriminant is the image of that of `Q`
(`QuadraticForm.discr_atFinitePlace`), so `-det Q` is a square in every `K_v`. The global square
theorem (4.2, `S = ∅`) makes it a square in `K`, so the discriminant of `Q` is `[-1]`, and the same
criterion over `K` makes `Q` isotropic.

Prove that a regular ternary form which is isotropic at every finite and every real place is
isotropic over `K` (the same proof, case `n = 3`, through Proposition 3.7(c) and the Hasse norm
theorem for the quadratic extension `K(√d)/K`, Theorem 3.1). Route: diagonalize, `Q ≅ ⟨a₁, a₂, a₃⟩`,
and scale by `a₁⁻¹` to the orthogonal sum `⟨1, -d⟩ ⊥ ⟨-a⟩` with `d = -a₂/a₁` and `a = -a₃/a₁`.
Anisotropy over `K` and local isotropy are unchanged along the diagonalizing isometry
(`QuadraticMap.Equivalent.anisotropic_iff`,
`QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`) and under scaling by the unit
`a₁⁻¹`, whose localizations are scalings by its images (`QuadraticForm.atFinitePlace_smul`,
`QuadraticForm.atRealPlace_smul`). If `d` is a square in `K`, the summand `⟨1, -d⟩` is isotropic.
Otherwise, over a field `F ⊇ K` in which `d` is not a square, an isotropic vector has nonzero last
coordinate, so the form is isotropic over `F` exactly when `⟨1, -d⟩` represents `a` over `F`; where
`d` is a square in `F`, the plane `⟨1, -d⟩` is regular and isotropic, hence represents `a`
(`QuadraticMap.represents_of_nondegenerate_of_not_anisotropic`). At the places, the localization of
`⟨1, -d⟩ ⊥ ⟨-a⟩` is read as `⟨1, -d⟩ ⊥ ⟨-a⟩` over the completion (`QuadraticForm.atFinitePlaceProd`,
`QuadraticForm.atRealPlaceProd`, `QuadraticForm.atFinitePlaceWeightedSumSquares`,
`QuadraticForm.atRealPlaceWeightedSumSquares`). Local isotropy therefore gives local representation
of `a` by `⟨1, -d⟩`, 4.3 gives global representation, and a representation of `a` by `⟨1, -d⟩`
together with the value `-a` of `⟨-a⟩` makes the sum isotropic over `K`
(`QuadraticMap.not_anisotropic_prod_of_represents_neg`, as `a ≠ 0`).

With the ternary case, `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary` becomes
unconditional: a locally isotropic regular quaternary form over a number field is isotropic. Its
hypothesis asks for the ternary case over every number field `L` in the universe of `K`, for the
diagonal forms `TauCeti.presentedForm p` with `p.1 = 3`; the ternary case applies to them because
they are regular (`TauCeti.nondegenerate_presentedForm`, `2` being invertible in `L`).

*Needs:*

- all three results: Tau Ceti `QuadraticForm.IsLocallyIsotropic`;
- the binary case: 4.2 (with `S = ∅`); Mathlib `Module.finrank_baseChange`; Tau Ceti
  `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (over each `K_v` and over
  `K`), `QuadraticForm.Nondegenerate.atFinitePlace` and `QuadraticForm.discr_atFinitePlace`;
- the ternary case: 4.3; Mathlib
  `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (diagonalization); Tau Ceti
  `QuadraticMap.Equivalent.anisotropic_iff`,
  `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`,
  `QuadraticForm.atFinitePlace_smul`, `QuadraticForm.atRealPlace_smul`,
  `QuadraticForm.atFinitePlaceProd`, `QuadraticForm.atRealPlaceProd`,
  `QuadraticForm.atFinitePlaceWeightedSumSquares`,
  `QuadraticForm.atRealPlaceWeightedSumSquares`, `QuadraticForm.Nondegenerate.atFinitePlace`,
  `QuadraticForm.Nondegenerate.atRealPlace`,
  `QuadraticMap.represents_of_nondegenerate_of_not_anisotropic` and
  `QuadraticMap.not_anisotropic_prod_of_represents_neg`;
- the unconditional quaternary consequence: the ternary case, over every number field in the
  universe of `K`, and Tau Ceti `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`,
  `TauCeti.presentedForm` and `TauCeti.nondegenerate_presentedForm`.

**Checks.**

- `⟨1, 1⟩` over `ℚ(i)` has discriminant `[1] = [-1]` and is isotropic (`1² + i² = 0`); over `ℚ` it
  is anisotropic at `ℝ` and at every `p ≡ 3 (mod 4)`.
- The binary case uses no real place: `⟨1, 1⟩` over `ℚ` already fails at `ℚ₃`.
- `⟨1, 1, -2⟩` over `ℚ` is isotropic (`1 + 1 - 2 = 0`), and here `d = -1`, `a = 2 = 1² + 1²`.
- `⟨1, 1, -3⟩` over `ℚ` is isotropic at `ℝ` and anisotropic at `ℚ₃`; the ternary statement has
  both sides false, matching `TauCeti.NumberField.QuadraticForm.anisotropic_sumTwoSquaresSubThreeSq`.
- `⟨1, 1, 1⟩` over `ℚ` is anisotropic exactly at `ℝ` and `ℚ₂`, since `(-1, -1)` is `-1` exactly
  there: an even number of places, as the product formula requires of a ternary form.

### 5.5 Hasse–Minkowski isotropy

Prove that a regular form over `K` is isotropic exactly when it is isotropic at every finite and
every real place (`hasseMinkowski_isotropic`; O'Meara 66:1). The forward direction is
`QuadraticForm.isLocallyIsotropic_of_not_anisotropic`. For the reverse, ranks zero and one are
anisotropic globally and locally; ranks two and three are 5.1; rank four is the quaternary theorem
of 5.1; rank `n ≥ 5` follows by strong induction on `n` from
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank`. That step asks for rank
`n - 1` only on the diagonal forms `TauCeti.presentedForm p` over `K`, which live on `Fin p.1 → K`
in the universe of `K` rather than that of `V`. So run the induction on these forms, which are
regular (`TauCeti.nondegenerate_presentedForm`), and carry the result to a form on any `V`
through `TauCeti.exists_presentedForm_equivalent`: isometry preserves anisotropy
(`QuadraticMap.Equivalent.anisotropic_iff`) and local isotropy
(`QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`).

The higher-rank step splits `Q = U ⊥ W` with `U` binary and `W` of rank at least three, so that
`W` is anisotropic at only finitely many places (`QuadraticForm.finite_setOfPred_anisotropic_atFinitePlace`).
It then needs one global vector `x` of `U` with `b = U(x) ≠ 0` and `-b` locally represented by `W`;
this is `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`, whose conclusion
includes `U(x) ≠ 0`. When `W` is isotropic at every place there is nothing to approximate, but `x`
must still satisfy `U(x) ≠ 0`: for `U = ⟨1, 1⟩` and `W = ⟨1, -1, 1⟩` over `ℚ`, the vector `x = 0`
gives `b = 0` and the singular form `⟨0⟩ ⊥ W`, while `x = (1, 0)` gives `b = 1` and `y = (0, 1, 0)`
with `W(y) = -1`. Approximating the scalar `b` directly in prescribed local square classes, instead
of the vector `x`, shows only that `-b` is represented by `W`, not that `b` is represented by `U`.

*Needs:* 5.1 (the binary, ternary and quaternary cases); Tau Ceti
`QuadraticForm.isLocallyIsotropic_of_not_anisotropic`,
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank`,
`TauCeti.presentedForm`, `TauCeti.nondegenerate_presentedForm`,
`TauCeti.exists_presentedForm_equivalent`, `QuadraticMap.Equivalent.anisotropic_iff` and
`QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`. The lemmas of the
higher-rank step discussed above, `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`
and `QuadraticForm.finite_setOfPred_anisotropic_atFinitePlace`, are inputs of the Tau Ceti proof of
that step, not of this target.

**Checks.**

- Rank zero: the zero-dimensional form is anisotropic and is not locally isotropic; both sides of
  `hasseMinkowski_isotropic` are false.
- Rank one: `⟨a⟩` is anisotropic over `K` and over every completion; both sides are false.
- `H` is isotropic over `K` and everywhere; both sides are true.
- Isotropy at every real place is not enough: `⟨1, 1, -3⟩` over `ℚ`.
- Isotropy at every place but one real place is not enough:
  `TauCeti.NumberField.QuadraticForm.exists_anisotropic_and_not_anisotropic_away_from_realPlace`
  gives, for each real place `w₀` and rank at least five, a regular form anisotropic over `K` and at
  `w₀` and isotropic at every other place; for example `⟨1, 1, 1, 1, 1⟩` over `ℚ`.
- Regularity costs nothing here: a degenerate form has a nonzero radical vector, isotropic over `K`
  and after every scalar extension, so both sides are true.
- `⟨1, 1⟩` over `ℚ` is anisotropic at infinitely many places
  (`TauCeti.NumberField.QuadraticForm.infinite_anisotropic_sumTwoSquares_atFinitePlace`), which is
  why a binary complement `W` cannot drive the higher-rank step and rank four has its own proof.

### Examples

- `⟨1, 1, -3⟩` over `ℚ` is anisotropic exactly at `ℚ₂` and `ℚ₃`, the places where
  `(-1, 3)_v = -1`; `⟨1, 1, -2⟩` is isotropic.
- `⟨1, 1, 1, 1, 1⟩` over `ℚ` is isotropic at every finite place (rank at least five) and anisotropic
  at `ℝ`.

### Dependencies

Layer 5 uses Layer 4 (4.2 for the binary case, 4.3 for the ternary case) and Tau Ceti's
conditional quaternary and higher-rank theorems.

## Layer 6: representation and isometry

### 6.1 Scalar representation

Prove that a regular form `Q` represents a nonzero `a ∈ K` exactly when it represents `a` at every
finite and every real place (`represents_iff_locallyRepresents`; O'Meara 66:3 applied to the line
`⟨a⟩`). Route: apply 5.5 to `⟨-a⟩ ⊥ Q`, which is regular because `a ≠ 0`
(`QuadraticMap.nondegenerate_smul_sq`, `QuadraticMap.Nondegenerate.prod`). Local representation
gives local isotropy by `QuadraticForm.LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod`;
a global isotropic vector `(t, x)` gives `Q(x) = a t²`, so `Q(x/t) = a` when `t ≠ 0`, and when
`t = 0` the form `Q` is isotropic, hence universal by
`QuadraticMap.represents_of_nondegenerate_of_not_anisotropic`. For `a = 0` both sides hold at the
zero vector, so the theorem carries `a ≠ 0` only because the route needs a regular `⟨-a⟩ ⊥ Q`.

*Needs:* 5.5; Tau Ceti `QuadraticForm.LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod`,
`QuadraticMap.nondegenerate_smul_sq`, `QuadraticMap.Nondegenerate.prod`,
`QuadraticMap.represents_of_nondegenerate_of_not_anisotropic`,
`QuadraticForm.LocallyRepresentsScalar.of_represents`.

**Checks.**

- `⟨1, 1⟩` over `ℚ` with `a = 3`: not represented, and not represented at `ℚ₃`.
- `⟨1, 1⟩` with `a = -1`: not represented, and not represented at `ℝ` or at `ℚ₂`, the two places
  where `(-1, -1)_v = -1`.
- `H` represents every nonzero `a`, globally and locally.
- The zero-dimensional form represents no nonzero `a`; both sides are false.

### 6.2 Representation of forms

Prove that a regular form `Q` admits an injective isometry into a regular form `R` exactly when it
does so at every finite and every real place (`represented_iff_locallyRepresented`; O'Meara 66:3).
Route: induction on the rank of `Q`, rank zero being immediate. Choose a nonzero value `c` of `Q`
(`QuadraticMap.Nondegenerate.exists_isUnit`). It is represented by `Q` at every place
(`QuadraticForm.LocallyRepresentsScalar.of_represents`), hence by `R` at every place
(`QuadraticForm.LocallyRepresents.locallyRepresentsScalar`), so 6.1 makes `R` represent `c` over
`K`. Split the regular line `⟨c⟩` (`QuadraticMap.nondegenerate_smul_sq`) from both forms, with
regular complements (`QuadraticMap.IsRepresentedBy.exists_equivalent_prod`); at each place the
localizations of the two splittings are orthogonal sums (`QuadraticMap.Equivalent.atFinitePlace`,
`QuadraticMap.Equivalent.atRealPlace`, `QuadraticForm.atFinitePlaceProd`,
`QuadraticForm.atRealPlaceProd`), and Witt extension and Witt cancellation there show that the
orthogonal complement of `c` in `Q` is locally represented by the complement in `R`. Apply the
induction hypothesis. The forward direction is `QuadraticForm.LocallyRepresents.of_isRepresentedBy`.

*Needs:* 6.1; Tau Ceti `QuadraticMap.Nondegenerate.exists_isUnit`,
`QuadraticForm.LocallyRepresentsScalar.of_represents`,
`QuadraticForm.LocallyRepresents.locallyRepresentsScalar`, `QuadraticMap.nondegenerate_smul_sq`,
`QuadraticMap.IsRepresentedBy.exists_equivalent_prod`, `QuadraticMap.Equivalent.atFinitePlace`,
`QuadraticMap.Equivalent.atRealPlace`, `QuadraticForm.atFinitePlaceProd`,
`QuadraticForm.atRealPlaceProd`, `QuadraticMap.IsometryEquiv.exists_extension`,
`TauCeti.equivalent_of_equivalent_prod`, `QuadraticForm.LocallyRepresents.of_isRepresentedBy`,
`QuadraticForm.LocallyRepresents.finrank_le`.

**Checks.**

- If `rank Q > rank R` both sides are false, by `QuadraticForm.LocallyRepresents.finrank_le`.
- `⟨3⟩` is not represented by `⟨1, 1⟩` over `ℚ`, and not at `ℚ₃`: the rank-one case is 6.1.
- `⟨1, 1⟩` is represented by `⟨1, 1, 1, 1⟩` over `ℚ`, by the inclusion of the first two
  coordinates.
- `⟨c⟩` is represented by `H` for every `c ≠ 0`, through `1 ↦ ((1 + c)/2, (1 - c)/2)`, whose value is
  `((1 + c)² - (1 - c)²)/4 = c`; globally and locally both sides hold.

### 6.3 Hasse–Minkowski isometry

Prove that two regular forms are isometric exactly when they are isometric at every finite and
every real place (`hasseMinkowski_equivalent`; O'Meara 66:4). The forward direction is
`QuadraticForm.LocallyEquivalent.of_equivalent`. For the reverse, local isometry gives equal rank
(`QuadraticForm.LocallyEquivalent.finrank_eq`) and local representation
(`QuadraticForm.LocallyEquivalent.locallyRepresents`), 6.2 then gives an injective isometry, and an
injective linear map between spaces of the same finite dimension is bijective
(`LinearMap.injective_iff_surjective_of_finrank_eq_finrank`).

*Needs:* 6.2; Tau Ceti `QuadraticForm.LocallyEquivalent.of_equivalent`,
`QuadraticForm.LocallyEquivalent.finrank_eq`, `QuadraticForm.LocallyEquivalent.locallyRepresents`;
Mathlib `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

**Checks.**

- `H` and `⟨2, -2⟩` are isometric over `ℚ` and everywhere.
- `⟨1⟩` and `⟨-1⟩` are not isometric, and not at `ℝ`.
- `⟨1, 1, -3⟩` and `⟨1, 1, -1⟩` have the same real signature `(2, 1)` and are not isometric
  (`TauCeti.NumberField.QuadraticForm.not_equivalent_sumTwoSquaresSubThreeSq_sumTwoSquaresSubSq`);
  they are not isometric at `ℚ₃`, where the first is anisotropic and the second is not.
- Forms of different rank are neither isometric nor locally isometric.

### Examples

- `⟨1, 1, -1⟩ ≅ ⟨1, 2, -2⟩` over `ℚ`: both are `⟨1⟩ ⊥ H`; the isometry is
  `TauCeti.NumberField.QuadraticForm.equivalent_sumTwoSquaresSubSq_sqAddTwoSqSubTwoSq`.
- `⟨1, 1⟩` represents `2` and `5` over `ℚ` and not `3`, `6` or `-1`.

### Dependencies

Layer 6 uses 5.5 and Tau Ceti's Witt cancellation and Witt extension.

## Layer 7: existence from compatible local invariants

### 7.2 Existence with prescribed local behaviour

Prove O'Meara 72:1 for a number field: let `n ≥ 1`, `d ∈ Kˣ/(Kˣ)²`, regular forms `U_v` of rank `n`
over `K_v` at every finite place and `R_w` of rank `n` over `ℝ` at every real place, such that every
discriminant is the image of `d`, the Hasse signs `s_v(U_v)` are `1` at almost every finite place,
and their product with the real Hasse signs `(-1)^(q(q-1)/2)` of the `R_w` is `1`. Then there is a
regular form `V` on `Kⁿ` with `V_v ≅ U_v` at every finite place and `V_w ≅ R_w` at every real place.
The converse is Tau Ceti's `QuadraticForm.isAdmissible_globalInvariants` with the product formula.

Route: `GlobalFormInvariants.isAdmissible_ofLocalForms` and
`GlobalFormInvariants.isLocalRealization_ofLocalForms` make the family a local realization of an
admissible record `I`; `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`
produces a regular `W` on `Kⁿ` and `a, b ∈ Kˣ` such that the correction plane `P' = ⟨a, -ab⟩` is
locally represented by `P ⊥ W`, `P = ⟨1, -b⟩`, and such that a global representation
`P' → P ⊥ W` yields a regular form on `Kⁿ` with record `I`. That representation is 6.2, applied to
the regular plane `P'` and the regular sum `P ⊥ W`
(`QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul`,
`QuadraticForm.nondegenerate_weightedSumSquares_one_neg`, `QuadraticMap.Nondegenerate.prod`). The
form with record `I` is isometric to `U_v` and `R_w` by
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`.

The correction planes work because `d(P) = [-b] = [-a²b] = d(P')` and
`s_v(P') = (a, -ab)_v = (a, -a)_v (a, b)_v = (a, b)_v` while `s_v(P) = (1, -b)_v = 1`: replacing
`P` by `P'` flips the Hasse sign exactly where `(a, b)_v = -1`, a set chosen by Hilbert sign
prescription, and keeps rank and discriminant. At a finite place, a dimension and a discriminant
leave at most two classes, separated by the Hasse sign, except in rank one and in rank two with
discriminant `[-1]`, where there is one class (Milne, VIII, Theorem 6.10 and Proposition 6.11,
p. 255); the admissibility clauses for these two cases are what make the local data realizable
there. At a real place the class is fixed by the positive index `p_w`, which the record carries.
There the discriminant and the real Hasse sign determine `p_w` only in rank at most three (Milne,
VIII, p. 256): in rank four with discriminant `[1]`, the signatures `(4, 0)`, `(2, 2)` and
`(0, 4)` give three classes, and `(4, 0)` and `(0, 4)` both have real Hasse sign `1`.

*Needs:* 4.1 (`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod` is stated
for `K` in `Type`; its hypothesis, a family of local forms realizing `I`, reaches the model in
`Type` through the transport of local forms in 4.1), 6.2; Tau Ceti
`GlobalFormInvariants.isAdmissible_ofLocalForms`,
`GlobalFormInvariants.isLocalRealization_ofLocalForms`,
`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`,
`QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul`,
`QuadraticForm.nondegenerate_weightedSumSquares_one_neg`, `QuadraticMap.Nondegenerate.prod`,
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace`,
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`.

**Checks.**

- Over `ℚ`, `U_v = ⟨1⟩` at every finite place and `R = ⟨1⟩` meet the hypotheses (`d = [1]`, every
  sign `1`), and `V = ⟨1⟩` works.
- Over `ℚ`, rank three, `d = [1]`, `R = ⟨1, 1, 1⟩` and `U_v` of Hasse sign `-1` exactly at `v = 2`
  (a rank-three local form of any discriminant and sign exists): the product is
  `(-1) · 1 = -1`, so the hypotheses fail. Indeed a global form with `d = [1]`, positive definite
  and `s_p = 1` at every odd `p` has `s_2 = 1` by the product formula, as `⟨1, 1, 1⟩` does. The
  family is excluded by the product hypothesis alone, not by a local obstruction.
- `⟨-1, -1, -1⟩` over `ℚ`: `s_2 = (-1, -1)_2³ = -1`, `s_p = 1` for odd `p`, negative index `3` and
  real Hasse sign `(-1)^(3·2/2) = -1`; the product is `1`, and the form itself realizes its
  localizations.
- Rank one with `U_v` of Hasse sign `-1`: impossible, as every rank-one local form has Hasse sign
  `1`; the hypotheses of 72:1 already exclude it.

### 7.3 Realization of admissible records

Prove that a record `I : GlobalFormInvariants K` is admissible exactly when it is the record of a
regular form of positive rank (O'Meara 72:1). The forward direction is
`exists_globalForm_of_isAdmissible`. Route:
`GlobalFormInvariants.IsAdmissible.exists_isLocalRealization` gives a family `(U, R)` realizing `I`;
the reduction of 72:1 (`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`,
carried to every universe by 4.1) gives a regular `W` on `K^(I.rank)` and `a, b ∈ Kˣ` such that
`⟨a, -ab⟩` is locally represented by `⟨1, -b⟩ ⊥ W`; 6.2, applied to these regular forms
(`QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul`,
`QuadraticForm.nondegenerate_weightedSumSquares_one_neg`, `QuadraticMap.Nondegenerate.prod`), makes
the representation global, and the reduction then returns a regular form on `K^(I.rank)` whose
record is `I`. This is the construction of 7.2 run on the record itself. The reverse direction is
`QuadraticForm.isAdmissible_globalInvariants`, which needs `1 ≤ rank`. Together with
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`, the forward direction yields the
form-level statement: for any family `U, R` realizing `I`, the form `Q` it returns satisfies
`Q_v ≅ U_v` and `Q_w ≅ R_w` at every place.

⚠ The statement of 7.2 alone does not give a form with record `I`. A form `V` with `V_v ≅ U_v` and
`V_w ≅ R_w` has the rank, the finite Hasse signs and the positive indices of `I`, but local isometry
sees the global discriminant only through its images in the completions
(`QuadraticForm.locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq`).
Going through 7.2 therefore needs one more step: the class `d(V) - d(I)` is represented by a unit
that is a square in every `K_v`, so it is zero by 4.2 with `S = ∅`. On the `ℚ(√5)` record of the
worked examples, every local discriminant of such a `V` is `[1]`, and 4.2 gives `d(V) = [1]`. The
route above needs no such step, because the reduction returns the record `I` itself.

*Needs:* 4.1 (`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod` and
`QuadraticForm.isAdmissible_globalInvariants` are stated for `K` in `Type`; the realizing family
reaches the model in `Type` through the transport of local forms in 4.1), 6.2; Tau Ceti
`GlobalFormInvariants.IsAdmissible.exists_isLocalRealization`,
`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`,
`QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul`,
`QuadraticForm.nondegenerate_weightedSumSquares_one_neg`, `QuadraticMap.Nondegenerate.prod`,
`QuadraticForm.isAdmissible_globalInvariants`; for the form-level statement,
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`.

**Checks.**

- The record of `⟨1⟩` over `ℚ` (rank `1`, `d = [1]`, every `s_v = 1`, `p = 1`) is admissible and is
  realized by `⟨1⟩`.
- The zero form's record (rank `0`) is realized and is not admissible: the positive-rank clause of
  the reverse direction cannot be dropped.
- A rank-one record over `ℚ` with `s_v = -1` at two finite places has Hasse product `1` and is not
  admissible (`GlobalFormInvariants.isAdmissible_rankOne_iff_eq_empty`); no rank-one form has a
  nontrivial Hasse sign.
- A rank-two record with `d = [-1]` and `s_v = -1` at two places has product `1` and is not
  admissible (`GlobalFormInvariants.isAdmissible_rankTwo_iff_eq_empty`): the local form of
  discriminant `[-1]` is hyperbolic.

### 7.4 Uniqueness

Two regular forms with the same record are isometric (Milne, VIII, Theorem 6.3, p. 252, with the
local classification of Theorem 6.10, p. 255; there the Hasse invariant is the product over
`i ≤ j`, which for forms of equal rank and discriminant `d` differs from ours by the same factor
`(-1, d)_v` on both sides). This is the reverse direction of 8.1: equal
records give local isometry (`QuadraticForm.LocallyEquivalent.of_globalInvariants_eq`, through
local classification by rank, discriminant and Hasse sign at the finite places and by signature at
the real places), and 6.3 gives a global isometry.

*Needs:* 6.3; Tau Ceti `QuadraticForm.LocallyEquivalent.of_globalInvariants_eq`.

### Examples

- The `ℚ(√5)` record of the worked examples is admissible, and 7.3 realizes it.
- The record of `⟨1, 1, 1⟩` over `ℚ` is `(3, [1], s_v = 1 everywhere, p = 3)`: every symbol in the
  product over `i < j` is `(1, 1)_v = 1`. The record of `⟨-1, -1, -1⟩` is
  `(3, [-1], s_2 = -1 and s_p = 1 for odd p, p = 0)`. Both are admissible, and they differ, as the
  two forms are not isometric.

### Dependencies

Layer 7 uses 6.2 for the global representation and 6.3 for uniqueness, with Tau Ceti's local
realization and reduction of 72:1, and 4.1 for the Tau Ceti inputs stated for number fields in
`Type`.

## Layer 8: global classification and Witt consequences

### 8.1 Complete invariant theorem

Prove that two regular forms are isometric exactly when their records coincide: the same rank,
global discriminant, finite Hasse signs and real positive indices
(`equivalent_iff_globalInvariants_eq`; O'Meara 66:5). The forward direction is
`QuadraticMap.Equivalent.globalInvariants_eq` and the reverse is 7.4. The statement holds in rank
zero. With 7.3 it gives a bijection from the isometry classes of regular forms of positive rank to
the admissible records, and the zero form is the only regular form of rank zero up to isometry.

*Needs:* 7.4; Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq`. The bijection with
admissible records additionally needs 7.3.

**Checks.**

- `⟨1, 1, -1⟩` and `⟨1, 2, -2⟩` over `ℚ`: rank `3`, discriminant `[-1]` (from `-1` and `-4`),
  Hasse signs `(1,1)(1,-1)(1,-1) = 1` and `(1,2)(1,-2)(2,-2) = 1` at every place, positive index
  `2`; equal records and isometric forms.
- `⟨1, 1, -3⟩` and `⟨1, 1, -1⟩`: discriminants `[-3] ≠ [-1]`; different records and not isometric.
- Two zero forms on zero spaces: equal records and isometric. A zero form and `⟨1⟩`: neither.
- `⟨1, 1⟩` and `⟨2, 2⟩` over `ℚ` have the same record: rank `2`, `d = [1] = [4]`, positive index
  `2`, and `s_v(⟨2, 2⟩) = (2, 2)_v = 1` at every place because `2 = x² - 2y²` at `x = 2`, `y = 1`.
  They are isometric through `(x, y) ↦ (x + y, x - y)`, since `(x + y)² + (x - y)² = 2x² + 2y²`.

### 8.2 Hyperbolicity and the global Witt kernel

Prove that a regular form which is hyperbolic at every finite and every real place is hyperbolic
over `K` (Milne, VIII, Theorem 6.3, p. 252, applied to the form and to `m · H`; the Witt-class
statement below follows from the same theorem by Witt cancellation, Proposition 6.2, p. 251).
Route: by `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff` the rank is even, `2m`,
and every localization has the class `m • H`. Take for the global sum `m · H` of hyperbolic planes
the diagonal form of a presentation of the class `m • H` over `K`, which is regular and has that
class (`TauCeti.formClass_presentedForm`, `TauCeti.nondegenerate_presentedForm`). A regular form
of class `m • H` over `K` has class `m • H` at every finite and every real place
(`QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass`,
`QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass`), and forms with the same class are
isometric (`TauCeti.formClass_eq_iff`), so the form is locally isometric to `m · H`, and 6.3 makes
it isometric to `m · H`.

Prove the corresponding statement for Witt classes: two regular forms `Q` and `R` whose
localizations have the same Witt class at every finite and every real place have the same Witt
class over `K`. Route: apply the first statement to `Q ⊥ (-R)`, where `-R = (-1) • R`, which is
regular (`QuadraticMap.nondegenerate_smul_iff`, `QuadraticMap.Nondegenerate.prod`). Its class
is the class of `Q` plus `⟨-1⟩` times the class of `R` (`TauCeti.formClass_prod`,
`TauCeti.formClass_smul`), so its Witt class is that of `Q` minus that of `R`
(`TauCeti.RegularFormClass.add_neg_one_mul`). Its localizations are `Q_v ⊥ (-R_v)` and
`Q_w ⊥ (-R_w)` (`QuadraticForm.atFinitePlaceProd`, `QuadraticForm.atRealPlaceProd`,
`QuadraticForm.atFinitePlace_neg`, `QuadraticForm.atRealPlace_neg`), whose Witt classes are
therefore zero. A class has Witt class zero exactly when it is a sum of hyperbolic planes
(`TauCeti.wittClass_eq_zero_iff`, with the Witt decomposition
`TauCeti.RegularFormClass.wittDecomposition`). Witt cancellation, which the source's route uses,
is part of the proofs of these Tau Ceti lemmas.

*Needs:* 6.3; Tau Ceti `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`,
`TauCeti.formClass_presentedForm`, `TauCeti.nondegenerate_presentedForm`,
`QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass`,
`QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass`,
`TauCeti.formClass_eq_iff`, `TauCeti.WittRing`, `QuadraticMap.nondegenerate_smul_iff`,
`QuadraticMap.Nondegenerate.prod`, `TauCeti.formClass_prod`, `TauCeti.formClass_smul`,
`TauCeti.RegularFormClass.add_neg_one_mul`, `QuadraticForm.atFinitePlaceProd`,
`QuadraticForm.atRealPlaceProd`, `QuadraticForm.atFinitePlace_neg`, `QuadraticForm.atRealPlace_neg`,
`TauCeti.wittClass_eq_zero_iff`, `TauCeti.RegularFormClass.wittDecomposition`.

**Checks.**

- `⟨1, -1, 2, -2⟩` is hyperbolic over `ℚ` and everywhere.
- `⟨1, 1⟩` over `ℚ` is not hyperbolic: its discriminant `[1]` is not `[-1]`, and it is anisotropic
  at `ℝ`.
- A form of odd rank is hyperbolic nowhere.

### 8.3 Injectivity of the global-to-local Witt map

Prove that the global-to-local map of Witt rings, whose component at a finite place `v` is
`TauCeti.WittRing.baseChange` along `K → K_v` and whose component at a real place `w` is the same
map along the real embedding of `w`, is injective (`injective_wittRing_baseChange_places`; the
local–global principle it rests on is Milne, VIII, Theorem 6.3, p. 252, through 8.2). This
map is `TauCeti.WittRing.globalToLocal`, a ring homomorphism; the Lean statement writes its
components out. So it is enough that its kernel is zero (`injective_iff_map_eq_zero`), and the
kernel is 8.2. Every Witt class is the Witt class of a class of regular forms
(`TauCeti.wittClass_surjective`), and every such class is the class of a regular diagonal form
`TauCeti.presentedForm p` (`TauCeti.formClass_presentedForm`, `TauCeti.nondegenerate_presentedForm`).
On the Witt class of a regular form the components of the map are the Witt classes of its
localizations (`TauCeti.WittRing.globalToLocal_wittClass_formClass`). So a class in the kernel is
the Witt class of a regular form whose localizations have Witt class zero, that is, are sums of
hyperbolic planes (`TauCeti.wittClass_eq_zero_iff`, with
`TauCeti.RegularFormClass.wittDecomposition`); 8.2 makes the form a sum of hyperbolic planes, so
the class is zero. Complex places add nothing: a class
that vanishes at one finite place has even dimension, which is its whole image in `W(ℂ) = ℤ/2`.
The image of the map is described through the admissible records of Layer 7, not by an exact
sequence of Witt rings.

*Needs:* 8.2; Mathlib `injective_iff_map_eq_zero`; Tau Ceti `TauCeti.WittRing`,
`TauCeti.WittRing.baseChange`, `TauCeti.WittRing.globalToLocal`,
`TauCeti.WittRing.globalToLocal_wittClass_formClass`, `TauCeti.wittClass_surjective`,
`TauCeti.formClass_presentedForm`, `TauCeti.presentedForm`, `TauCeti.nondegenerate_presentedForm`,
`TauCeti.wittClass_eq_zero_iff`, `TauCeti.RegularFormClass.wittDecomposition`.

**Checks.**

- The class of `⟨1, 1⟩` over `ℚ` is nonzero, and its real component has signature `2`.
- The class of `H` is zero and so is each of its components.
- The class of `⟨1⟩` has odd dimension and is nonzero at every finite place.

### 8.4 The form-theoretic `SO` kernel consequence

Export the statement consumed by the orthogonal-group roadmaps: regular forms that are isometric
at every finite and every real place are isometric (`equivalent_of_locallyEquivalent`, the reverse
direction of 6.3; Milne, VIII, Theorem 6.3, p. 252). Identifying the classes of
`H¹(K, SO(Q))` with the twists of `Q` of the same discriminant and deducing from 8.4 that the
localization kernel is trivial is the translation that Orthogonal and Spin Groups, in its consumer
contract, assigns to Orthogonal Tamagawa and Lattice Mass; this roadmap defines no `H¹`.

*Needs:* 6.3.

### Examples

- Over `ℚ`, the Witt class of `⟨1, 1, -3⟩ ⊥ ⟨-1, -1, 1⟩` is nonzero: the two forms differ at `ℚ₃`.

### Dependencies

Layer 8 uses 6.3 and Layer 7, and Tau Ceti's Witt ring and hyperbolicity criteria.

## Worked examples

- **A finite obstruction invisible over `ℝ`.** `⟨1, 1, -3⟩` over `ℚ` is isotropic at `ℝ` and
  anisotropic at `ℚ₃`, hence over `ℚ`
  (`TauCeti.NumberField.QuadraticForm.anisotropic_sumTwoSquaresSubThreeSq`). It tests 5.5 and 6.3:
  real signatures alone do not classify.
- **An isometry two ways.** `⟨1, 1, -1⟩ ≅ ⟨1, 2, -2⟩` over `ℚ`, explicitly in Tau Ceti
  (`TauCeti.NumberField.QuadraticForm.equivalent_sumTwoSquaresSubSq_sqAddTwoSqSubTwoSq`) and through
  8.1 from the equality of the two records computed in the Checks of 8.1.
- **Existence over `ℚ(√5)`.** Over `K = ℚ(√5)`, with two real places, the record of rank `3`,
  discriminant `[1]`, positive indices `3` and `1`, Hasse sign `-1` at the prime above `2` and `1`
  elsewhere is admissible: the real Hasse signs are `1` and `(-1)^(2·1/2) = -1`, and the product is
  `(-1) · 1 · (-1) = 1`. Tau Ceti exhibits `⟨1, θ, θ⟩`, `θ² = θ + 1`, with this record
  (`TauCeti.NumberField.QuadraticForm.Sqrt5.exists_admissible_rank_three`). 7.3 must produce a
  form with the record and 8.1 must identify it with `⟨1, θ, θ⟩`; a theorem that encoded one real
  place would fail here, where the two real signatures differ.
- **Small-rank records.** Rank-one and rank-two records with finite support and product one that
  are not admissible (`GlobalFormInvariants.isAdmissible_rankOne_iff_eq_empty`,
  `GlobalFormInvariants.isAdmissible_rankTwo_iff_eq_empty`) test the small-rank clauses of 7.3.
- **The quaternary trap.** `⟨1, 1⟩` over `ℚ` is anisotropic at every `p ≡ 3 (mod 4)`
  (`TauCeti.NumberField.QuadraticForm.infinite_anisotropic_sumTwoSquares_atFinitePlace`), so the
  set of exceptional places of the higher-rank step is infinite when the complement is binary.

## Downstream consumers

- Orthogonal Tamagawa and Lattice Mass: the consumer contract of Orthogonal and Spin Groups for
  that roadmap lists `hasseMinkowski_equivalent` (6.3) among its imports and assigns to it the
  translation of 6.3, and so of its corollary 8.4, into the triviality of the localization kernel
  of `H¹(K, SO(Q))`.
- Orthogonal and Spin Groups consumes 4.3 and 6.1.
- Integral Lattices consumes `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent` and
  owns integral localizations, genera and spinor genera.
- Classical Arithmetic Completion consumes Layer 4's real symbol and localized product formula,
  which the section map above resolves to Tau Ceti.

## References

- O. T. O'Meara, *Introduction to Quadratic Forms*, Springer (1963; Classics in Mathematics reprint
  2000). Cited by its numbered paragraphs: 58:7 (quaternary descent), 65:15 (global square
  theorem), 66:1 (Hasse–Minkowski for isotropy), 66:3 (representation), 66:4 (isometry), 66:5
  (complete invariants), 71:19 and 71:19a (sign prescription) and 72:1 (existence with
  prescribed local behaviour).
- J.-P. Serre, *A Course in Arithmetic*, Graduate Texts in Mathematics 7, Springer (1973): Ch. III,
  §1.2, Theorem 1 (the Hilbert symbol over `ℝ` and over `ℚ_p`); Ch. III, §2.2, Theorem 3 (the
  product formula over `ℚ`); Ch. IV, §2.1 (the Hasse invariant as a product over `i < j`); Ch. IV,
  §3.2, Theorem 8 (Hasse–Minkowski over `ℚ`). It is a companion for the examples over `ℚ` and for
  the convention, not a source for arbitrary number fields.
- J. S. Milne, *Class Field Theory*, course notes, version 4.03 (2020), on the author's page.
  Chapter VIII, cited by printed page: Theorem 1.1 and Exercise 1.3, p. 229 (local and global
  squares, and the eighth-power counterexample); Theorem 3.1, p. 234 (the Hasse norm theorem for
  cyclic extensions); Theorem 3.5, p. 235, with Proposition 3.7, p. 236, and the proof of 3.5(b),
  p. 237 (Hasse–Minkowski for isotropy over a number field and its binary and ternary steps);
  Proposition 6.2, p. 251 (Witt cancellation); Theorem 6.3, p. 252 (the local–global principle for
  isometry); Theorem 6.10 and Proposition 6.11, p. 255 (classification over a nonarchimedean local
  field, and the invariants that occur); the remarks on real forms before Theorem 6.12, p. 256
  (over `ℝ`, discriminant and Hasse invariant determine the negative index only in rank at most
  three). Its Hasse invariant is the product over `i ≤ j`.
