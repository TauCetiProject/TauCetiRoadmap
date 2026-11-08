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
kernel description; and the worked examples `⟨1, 1, -3⟩`, `⟨1, 1⟩`, `⟨1, 1, -1⟩ ≅ ⟨1, 2, -2⟩` and
the `ℚ(√5)` record.

Section and name map, for citations of this roadmap that resolve to Tau Ceti declarations:

- 4.4, the localized product formula: `TauCeti.hilbertSymbol_productFormula`.
- 4.4, the real symbol: `TauCeti.hilbertSymbol_real` and
  `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff`.
- 4.4, sign prescription with a prescribed second argument:
  `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`.
- 4.4, sign prescription for a pair, cited under the name exists_hilbertSymbol_eq_neg_one_iff_pair:
  `TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`.
- 4.4, the Hasse product of one form: `QuadraticForm.globalInvariants_hasseProduct_eq_one`.

This roadmap does not own, and cites:

- diagonalization, Witt cancellation and extension, the Hilbert symbol over one field, and the
  classification over one nonarchimedean local field: Quadratic Form Invariants, whose results
  used here are Tau Ceti declarations;
- weak approximation, adeles and ideles: Global Number Fields;
- completions and their towers: Number Field Arithmetic;
- the Hasse norm theorem, reciprocity and the idele-class norm index: Class Field Theory;
- nonabelian cohomology, `H¹(K, SO(Q))`, torsors and Tate–Shafarevich sets: Orthogonal and Spin
  Groups, which translates 8.4 into a statement about `SO`;
- integral lattices, genera, spinor genera and mass formulae: Integral Lattices;
- quadratic forms in characteristic two and over global function fields.

## Conventions

- `K` is a number field (`[Field K] [NumberField K]`, in any universe). A form is a
  `QuadraticForm K V` on a finite-dimensional `V`; regular means `QuadraticForm.Nondegenerate`.
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

There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the
pins.

### From Mathlib

- `QuadraticForm`, `QuadraticForm.baseChange` (`LinearAlgebra/QuadraticForm/TensorProduct.lean`),
  `QuadraticMap.Anisotropic` (`LinearAlgebra/QuadraticForm/Basic.lean`) and
  `QuadraticMap.Equivalent` (`LinearAlgebra/QuadraticForm/IsometryEquiv.lean`): forms, scalar
  extension along an algebra map, anisotropy (`Q x = 0` only for `x = 0`; the zero-dimensional
  form is anisotropic), and the existence of an isometry.
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

### From Tau Ceti

All paths are under `TauCeti/`.

- Localization (`NumberTheory/QuadraticForm/Global/Localization.lean`, `Operations.lean`,
  `Discriminant.lean`, `CompletionTower.lean`): `QuadraticForm.atFinitePlace`,
  `QuadraticForm.atRealPlace`, `QuadraticForm.atComplexEmbedding`,
  `HeightOneSpectrum.unitAtFinitePlace` and `TauCeti.unitAtRealPlace`; the transport of
  isometry, representation and regularity (`QuadraticMap.Equivalent.atFinitePlace`,
  `QuadraticForm.Nondegenerate.atFinitePlace` and their real versions); compatibility with
  orthogonal sums, negation and scaling; the localized discriminant; and
  `QuadraticForm.IsLocallyIsotropic.baseChange` for a finite extension of number fields.
- Local predicates (`NumberTheory/QuadraticForm/Global/Predicates.lean`):
  `QuadraticForm.IsLocallyIsotropic`, `QuadraticForm.LocallyRepresentsScalar`,
  `QuadraticForm.LocallyRepresents`, `QuadraticForm.LocallyEquivalent`, each a conjunction over
  every finite and every real place; `QuadraticForm.isLocallyIsotropic_of_not_anisotropic`,
  `QuadraticForm.LocallyEquivalent.of_equivalent`, `QuadraticForm.LocallyRepresents.of_isRepresentedBy`,
  `QuadraticForm.LocallyEquivalent.finrank_eq`, `QuadraticForm.LocallyRepresents.finrank_le` and
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
  `NumberTheory/QuadraticForm/Global/Continuity.lean`, `Nonsquare.lean`):
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (the diagonal image of `K` is dense in
  any finite product of finite and infinite completions),
  `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` (the same for vectors),
  `QuadraticForm.exists_isOpen_isSquare_div_atFinitePlace` and
  `QuadraticForm.exists_isOpen_isSquare_div_atRealPlace` (near a vector of nonzero value the
  value stays in its square class), and
  `TauCeti.NumberField.QuadraticForm.exists_fieldUnit_not_isSquare_at_places`.
- Ideles and class field theory (`NumberTheory/NumberField/Global/Ideles/Norm/Relative.lean`,
  `Range.lean`, `NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean`,
  `NumberTheory/ClassFieldTheory/Global/HasseNorm/Quadratic.lean`):
  `TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap`,
  `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff` (an idele is a norm exactly when each
  coordinate is a norm from the local algebra), `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`
  (for a Galois extension `L/K` of number fields, `[L : K] ≤ [C_K : N(C_L)]`) and
  `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion` (for a nonsquare `d` and
  `a ∈ Kˣ`, `a = x² - d y²` is solvable in `K` exactly when it is solvable in every finite and every
  infinite completion).
- Local form theory (`LinearAlgebra/QuadraticForm/Representation.lean`, `Witt/Cancellation.lean`,
  `Witt/Extension.lean`, `RegularFormClass/Discriminant.lean`,
  `NumberTheory/LocalField/QuadraticForm/Classification.lean`, `Realization.lean`):
  `QuadraticMap.Represents`, `QuadraticMap.IsRepresentedBy`,
  `QuadraticMap.not_anisotropic_prod_of_represents_neg`,
  `QuadraticMap.represents_of_nondegenerate_of_not_anisotropic` (a regular isotropic form is
  universal), `TauCeti.equivalent_of_equivalent_prod` (Witt cancellation),
  `QuadraticMap.IsometryEquiv.exists_extension` (Witt extension),
  `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`,
  `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` and
  `TauCeti.RegularFormClass.exists_of_realization`.
- Hasse–Minkowski steps (`LinearAlgebra/QuadraticForm/QuaternaryDescent.lean`,
  `NumberTheory/QuadraticForm/Global/Quaternary.lean`, `HigherRank.lean`, `ApproximateValue.lean`,
  `LocalValues.lean`): `QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`
  (O'Meara 58:7), `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary` (a locally
  isotropic regular quaternary form is isotropic, given the ternary case over every number field),
  `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (the same in rank
  `n ≥ 5`, given rank `n - 1`), `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`
  (for `U ≠ 0` and regular `W` anisotropic at finitely many finite places, with matching local
  values where `W` is anisotropic, a global `x` with `U x ≠ 0` and `-U x` locally represented by
  `W`), and `QuadraticForm.exists_atFinitePlace_ne_zero_eq_neg`.
- Existence (`NumberTheory/QuadraticForm/Global/LocalRealization.lean`, `PrescribedLocalForms.lean`,
  `Existence.lean`, `Classification.lean`): `GlobalFormInvariants.IsLocalRealization`,
  `GlobalFormInvariants.IsAdmissible.exists_isLocalRealization`,
  `GlobalFormInvariants.isAdmissible_ofLocalForms`, `GlobalFormInvariants.isLocalRealization_ofLocalForms`,
  `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod` (for an admissible
  record with a local realization: a regular `W` on `Kⁿ` and `a, b ∈ Kˣ` such that `⟨a, -ab⟩` is
  locally represented by `⟨1, -b⟩ ⊥ W`, and a global representation yields a form with the record),
  `QuadraticForm.exists_discr_eq_equivalent_of_isRepresentedBy_prod`,
  `GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
  `GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace` (a form with record `I` is
  isometric at each place to any family realizing `I`).
- Hyperbolicity and Witt rings (`NumberTheory/QuadraticForm/Global/Hyperbolicity.lean`,
  `WittLocalization.lean`, `LinearAlgebra/QuadraticForm/Witt/Ring.lean`, `Witt/BaseChange.lean`):
  `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`, `TauCeti.WittRing`,
  `TauCeti.WittRing.baseChange`, `TauCeti.WittRing.globalToLocal` (the ring homomorphism
  `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)` whose components are scalar extension along `K → K_v` and along
  the real embedding of `w`) and `TauCeti.WittRing.globalToLocal_eq_zero_iff`.
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

The numbering of layers and sections is the one other roadmaps cite; it starts at Layer 4 because
the foundations it numbered 0–3 (localization, local predicates, archimedean and finite
invariants, the invariant record) are Tau Ceti declarations. Layer 4 proves the two arithmetic
inputs of Hasse–Minkowski that are not in Tau Ceti: the global square theorem and the quadratic
Hasse norm theorem in the language of forms. Layer 5 proves the binary and ternary cases and
assembles Hasse–Minkowski for isotropy in every rank from them and Tau Ceti's conditional
quaternary and higher-rank steps. Layer 6 derives Hasse–Minkowski for representation and
isometry. Layer 7 produces a global form from admissible local data, using Layer 6 for the single
global representation that Tau Ceti's reduction leaves open. Layer 8 draws the classification and
the Witt-ring consequences. The worked examples test the end theorems on `ℚ` and on `ℚ(√5)`.

## Layer 4: global square, norm, and approximation lemmas

### 4.2 The global square theorem

Prove that a unit `a ∈ Kˣ` which is a square in `K_v` for every finite place `v` outside a finite
set `S` is a square in `K` (`isSquare_of_isSquare_unitAtFinitePlace_of_notMem`; O'Meara 65:15). No
condition is imposed at the archimedean places. The case `S = ∅` is the form consumed by the binary
case of 5.1.

A route through the idele-class norm index:

1. Suppose `a` is not a square in `K` and let `E = K(√a)`, a quadratic, hence Galois, extension.
   Enlarge `S` by every archimedean place.
2. At a finite place `v ∉ S`, `a` is a square in `K_v`, so `K_v ⊗_K E ≅ K_v × K_v` and every
   element of `K_vˣ` is a norm from it.
3. Let `i` be an idele. By weak approximation at the places of `S` and the openness of square
   classes, some `α ∈ Kˣ` has `i_v / α` a square in `K_vˣ` for each `v ∈ S`. A square `c²` is the
   norm of `c ∈ K_v ⊆ K_v ⊗_K E`.
4. So every coordinate of `α⁻¹ i` is a local norm, and `mem_range_ideleNormMap_iff` puts `α⁻¹ i` in
   the image of the idele norm map. As `i` was arbitrary, the norm map on idele classes is onto.
5. This contradicts `finrank_le_index_range_ideleClassNormMap`, which gives
   `2 = [E : K] ≤ [C_K : N(C_E)]`.

⚠ Steps 2 and 3 need no statement about the distribution of primes: the finitely many places where
`a` is not a local square are absorbed by weak approximation in step 3. The argument "a nontrivial
quadratic extension cannot split at almost every place" is this theorem in other words and cannot
replace step 5. The identity `I_K = Kˣ · I_K^S` is false already for `K = ℚ` and `S` the
archimedean place, so step 4 cannot pass through it; step 3 approximates one idele by one global
element instead.

*Needs:* Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`,
`QuadraticForm.exists_isOpen_isSquare_div_atFinitePlace`,
`QuadraticForm.exists_isOpen_isSquare_div_atRealPlace`,
`TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap`,
`TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`,
`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`; Mathlib `IdeleGroup`,
`IdeleClassGroup`.

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
  `x² + 2`) and in `ℝ`, but not in `ℚ`. So the eighth-power analogue of 4.2 is false, with exceptional
  set `{2}`.

### 4.3 The quadratic Hasse norm theorem as a representation statement

Prove that for a nonsquare `d ∈ K` and `a ∈ Kˣ`, the binary form `⟨1, -d⟩` represents `a` over
`K` exactly when it does so at every finite and every real place (`LocallyRepresentsScalar`).
The arithmetic content is `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`;
the work here is to identify, at each finite place and each real place, solvability of
`a = x² - d y²` in the completion with representation of `a` by the localization of `⟨1, -d⟩`,
the real completion being identified with `ℝ` through
`InfinitePlace.Completion.ringEquivRealOfIsReal`, and to discharge the complex places, where
`⟨1, -d⟩` represents every nonzero scalar.

*Needs:* Tau Ceti `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`,
`QuadraticForm.LocallyRepresentsScalar`, `QuadraticForm.atFinitePlace`,
`QuadraticForm.atRealPlace`; Mathlib `InfinitePlace.Completion.ringEquivRealOfIsReal`.

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

Layer 4 uses only Mathlib and Tau Ceti: weak approximation, the openness of square classes, the
idele norm map with its placewise description, the first inequality of global class field theory,
and the quadratic Hasse norm theorem in coordinates.

## Layer 5: Hasse–Minkowski isotropy

### 5.1 Binary and ternary cases

Prove that a regular binary form which is isotropic at every finite and every real place is
isotropic over `K`. Route: a regular binary form is isotropic exactly when its discriminant is
`[-1]`, so `-det Q` is a square at every finite place; the global square theorem (4.2, `S = ∅`)
makes it a square in `K`, and
`TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one` makes `Q` a
hyperbolic plane.

Prove that a regular ternary form which is isotropic at every finite and every real place is
isotropic over `K`. Route: diagonalize and scale to `⟨1, -d, -a⟩`. If `d` is a square in `K`, the
summand `⟨1, -d⟩` is isotropic. Otherwise an isotropic vector has nonzero last coordinate, so `Q`
is isotropic over a field `F ⊇ K` exactly when `⟨1, -d⟩` represents `a` over `F`, and where `d` is
a local square both conditions hold; local isotropy therefore gives local representation of `a`,
and 4.3 gives global representation.

With the ternary case, `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary` becomes
unconditional: a locally isotropic regular quaternary form over a number field is isotropic.

*Needs:* 4.2, 4.3; Tau Ceti `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`,
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`,
`QuadraticForm.IsLocallyIsotropic`.

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
of 5.1; rank `n ≥ 5` follows by strong induction from
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank`.

The higher-rank step splits `Q = U ⊥ W` with `U` binary and `W` of rank at least three, so that
`W` is anisotropic at only finitely many places (`QuadraticForm.finite_setOfPred_anisotropic_atFinitePlace`).
It then needs one global vector `x` of `U` with `b = U(x) ≠ 0` and `-b` locally represented by `W`;
this is `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`, whose conclusion
includes `U(x) ≠ 0`. When `W` is isotropic at every place there is nothing to approximate, but `x`
must still satisfy `U(x) ≠ 0`: for `U = ⟨1, 1⟩` and `W = ⟨1, -1, 1⟩` over `ℚ`, the vector `x = 0`
gives `b = 0` and the singular form `⟨0⟩ ⊥ W`, while `x = (1, 0)` gives `b = 1` and `y = (0, 1, 0)`
with `W(y) = -1`. Approximating the scalar `b` directly in prescribed local square classes, instead
of the vector `x`, shows only that `-b` is represented by `W`, not that `b` is represented by `U`.

*Needs:* 5.1; Tau Ceti `QuadraticForm.isLocallyIsotropic_of_not_anisotropic`,
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`,
`QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank`,
`QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`,
`QuadraticForm.finite_setOfPred_anisotropic_atFinitePlace`.

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
`⟨a⟩`). Route: apply 5.5 to `⟨-a⟩ ⊥ Q`, which is regular because `a ≠ 0`. Local representation
gives local isotropy by `QuadraticForm.LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod`;
a global isotropic vector `(t, x)` gives `Q(x) = a t²`, so `Q(x/t) = a` when `t ≠ 0`, and when
`t = 0` the form `Q` is isotropic, hence universal by
`QuadraticMap.represents_of_nondegenerate_of_not_anisotropic`. For `a = 0` both sides hold at the
zero vector, so the theorem carries `a ≠ 0` only because the route needs a regular `⟨-a⟩ ⊥ Q`.

*Needs:* 5.5; Tau Ceti `QuadraticForm.LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod`,
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
Route: induction on the rank of `Q`. Choose a nonzero value `c` of `Q`, represent it by `R` with
6.1, split `⟨c⟩` from both forms, use Witt extension and Witt cancellation at each place to see
that the orthogonal complement of `c` in `Q` is locally represented by the complement in `R`, and
apply the induction hypothesis.

*Needs:* 6.1; Tau Ceti `QuadraticMap.IsometryEquiv.exists_extension`,
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
(`QuadraticForm.LocallyEquivalent.finrank_eq`), 6.2 gives an injective isometry, and an injective
linear map between spaces of the same finite dimension is bijective.

*Needs:* 6.2; Tau Ceti `QuadraticForm.LocallyEquivalent.of_equivalent`,
`QuadraticForm.LocallyEquivalent.finrank_eq`.

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
`P' → P ⊥ W` yields a regular form on `Kⁿ` with record `I`. That representation is 6.2. The
form with record `I` is isometric to `U_v` and `R_w` by
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`.

The correction planes work because `d(P) = [-b] = [-a²b] = d(P')` and
`s_v(P') = (a, -ab)_v = (a, -a)_v (a, b)_v = (a, b)_v` while `s_v(P) = (1, -b)_v = 1`: replacing
`P` by `P'` flips the Hasse sign exactly where `(a, b)_v = -1`, a set chosen by Hilbert sign
prescription, and keeps rank and discriminant. A dimension and a discriminant leave at most two
local classes, separated by the Hasse sign, except in rank one and in rank two with discriminant
`[-1]`, where there is one class; the admissibility clauses for these two cases are what make the
local data realizable there.

*Needs:* 6.2; Tau Ceti `GlobalFormInvariants.isAdmissible_ofLocalForms`,
`GlobalFormInvariants.isLocalRealization_ofLocalForms`,
`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`,
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
regular form of positive rank. The forward direction is `exists_globalForm_of_isAdmissible`: from
`GlobalFormInvariants.IsAdmissible.exists_isLocalRealization` and 7.2, an admissible record is the
record of a regular form on `K^(I.rank)`. The reverse direction is
`QuadraticForm.isAdmissible_globalInvariants`, which needs `1 ≤ rank`. Together with
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and
`GlobalFormInvariants.IsLocalRealization.equivalent_atRealPlace`, the forward direction yields the
form-level statement: for any family `U, R` realizing `I`, the form `Q` it returns satisfies
`Q_v ≅ U_v` and `Q_w ≅ R_w` at every place.

*Needs:* 7.2; Tau Ceti `GlobalFormInvariants.IsAdmissible.exists_isLocalRealization`,
`QuadraticForm.isAdmissible_globalInvariants`.

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

Two regular forms with the same record are isometric. This is the reverse direction of 8.1: equal
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
realization and reduction of 72:1.

## Layer 8: global classification and Witt consequences

### 8.1 Complete invariant theorem

Prove that two regular forms are isometric exactly when their records coincide: the same rank,
global discriminant, finite Hasse signs and real positive indices
(`equivalent_iff_globalInvariants_eq`; O'Meara 66:5). The forward direction is
`QuadraticMap.Equivalent.globalInvariants_eq` and the reverse is 7.4. The statement holds in rank
zero. With 7.3 it gives a bijection from the isometry classes of regular forms of positive rank to
the admissible records, and the zero form is the only regular form of rank zero up to isometry.

*Needs:* 7.3, 7.4; Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq`.

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
over `K`: by `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff` the rank is even,
`2m`, and the form is locally isometric to `m · H`, so 6.3 makes it isometric to `m · H`. Prove the
corresponding statement for Witt classes: two regular forms whose localizations have the same Witt
class at every finite and every real place have the same Witt class over `K`, by applying the first
statement to `Q ⊥ (-R)`, which is hyperbolic exactly when `Q` and `R` have the same Witt class.

*Needs:* 6.3; Tau Ceti `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`,
`TauCeti.equivalent_of_equivalent_prod`, `TauCeti.WittRing`.

**Checks.**

- `⟨1, -1, 2, -2⟩` is hyperbolic over `ℚ` and everywhere.
- `⟨1, 1⟩` over `ℚ` is not hyperbolic: its discriminant `[1]` is not `[-1]`, and it is anisotropic
  at `ℝ`.
- A form of odd rank is hyperbolic nowhere.

### 8.3 Injectivity of the global-to-local Witt map

Prove that the global-to-local map of Witt rings, whose component at a finite place `v` is
`TauCeti.WittRing.baseChange` along `K → K_v` and whose component at a real place `w` is the same
map along the real embedding of `w`, is injective (`injective_wittRing_baseChange_places`). This
map is `TauCeti.WittRing.globalToLocal`; the Lean statement writes its components out. Its kernel
is 8.2: a class in the kernel is the class of an anisotropic form whose localizations are
hyperbolic, which 8.2 makes hyperbolic, so the class is zero. Complex places add nothing: a class
that vanishes at one finite place has even dimension, which is its whole image in `W(ℂ) = ℤ/2`.
The image of the map is described through the admissible records of Layer 7, not by an exact
sequence of Witt rings.

*Needs:* 8.2; Tau Ceti `TauCeti.WittRing`, `TauCeti.WittRing.baseChange`,
`TauCeti.WittRing.globalToLocal`, `TauCeti.WittRing.globalToLocal_eq_zero_iff`.

**Checks.**

- The class of `⟨1, 1⟩` over `ℚ` is nonzero, and its real component has signature `2`.
- The class of `H` is zero and so is each of its components.
- The class of `⟨1⟩` has odd dimension and is nonzero at every finite place.

### 8.4 The isometry corollary for orthogonal groups

Export the statement consumed by the orthogonal-group roadmaps: regular forms that are isometric
at every finite and every real place are isometric (`equivalent_of_locallyEquivalent`, the reverse
direction of 6.3). Orthogonal and Spin Groups identifies its `H¹(K, SO(Q))` classes with twists of
`Q` and deduces that the localization kernel is trivial; this roadmap defines no `H¹`.

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

- Orthogonal and Spin Groups consumes `hasseMinkowski_equivalent` (6.3), 4.3 and 6.1, and owns the
  translation to `SO` torsors.
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
