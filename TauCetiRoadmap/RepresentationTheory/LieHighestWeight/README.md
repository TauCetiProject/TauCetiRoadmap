# Roadmap: representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas

**Summary.** Develop normalized polynomial tensor comparisons, tensor-product rules,
Lie–Chevalley and filtered Harish-Chandra isomorphisms, split Serre presentations,
exceptional algebra models, reductive center comparisons and affine Weyl geometry.
The inputs are native highest-weight modules, PBW, complete reducibility and Weyl
formulas; the new comparisons retain the actual generators, products, actions and
integral lattices. The split characteristic-zero and compact real forms are separate.

## Scope and ownership

This roadmap owns the comparisons and extensions in Layers 0–10 below. The
rank-one classification, integer spectrum, weight strings, PBW basis and filtration,
Verma modules, dominant-integral classification, complete reducibility, Weyl formulas,
and general-linear highest-weight carrier and the integral-weight lattice are already in Tau Ceti and are consumed
through the exact contracts below. The native split octonion and Albert carriers,
their dimensions and the dimension of split-octonion derivations are inputs, not
new construction targets. The exceptional-model identifications remain targets.

[RootSystems, Layers 1–6](../RootSystems/README.md) owns finite root geometry,
chambers, Weyl groups and finite-type classification. This roadmap owns the
representation-theoretic comparison of opposition and integral weight lattices with
those root systems. [ClassicalGroups, Layers 2–4](../ClassicalGroups/README.md)
owns Schur modules, the group classification, group characters and branching;
its Layer 3 uses Lie highest-weight theory. The Haar character argument below uses
that classification and is independent only of the character formula, not of
Lie highest-weight classification. [SchurWeyl, Layer 7](../SchurWeyl/README.md)
owns Schur polynomials, Jacobi–Trudi and RSK. The Lie differentiation and
intertwiner comparisons belong here.

[CharacteristicClasses, C5.1](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings)
owns compact infinitesimal invariance, geometric Cartan transport and real descent.
[TangentialBordism, B3](../../TangentialBordism/README.md#b3-low-groups-and-specified-geometric-examples)
owns the compact Albert idempotent geometry and automorphism transitivity.
Layer 3 owns the positive smooth bracket on the dual of a finite-dimensional
real Lie algebra and its polynomial/PBW comparison.
[LieGroupoidsPoisson, G4.6A–G4.6B](../../LieGroupoidsPoisson/README.md)
owns its packaging in Poisson geometry, the algebroid-dual comparison and
coadjoint leaves, as downstream applications of this linear bracket.
Layer 6.2 owns the lattice cone expansions, Fourier boundary maps and directional
endpoint comparisons needed for the Weyl-character application, together with
the smooth periodic Fourier-decay estimates used in their construction.
[PseudodifferentialOperators, §3.1](../../PseudodifferentialOperators/README.md)
uses these estimates in its local kernel comparisons.
[TensorProductCombinatorics, §§1.5–1.6 and 2.6](../../TensorProductCombinatorics/README.md)
owns cone valuations, chamber-counting and hive comparisons; its cone and
Fourier applications use the constructions of Layer 6.2. No hive or geometric
orbit theorem is an input to these constructions.

Four inputs of the compact and type-A applications in Layers 5, 9 and 10 are
not supplied by the cited sections of the roadmaps on which they depend. They
are registered as supplier gaps, with exact contracts, under Exact supplier
contracts: `gap:unitary-regular-complexification` and
`gap:torus-period-lattice` (LieGroups), `gap:compact-frobenius-schur`
(CompactGroups) and `gap:skew-lr-tableaux` (SchurWeyl). The generic
complexification, maximal-torus theory, compact character theory and tableau
combinatorics remain the suppliers'; no holomorphic extension, unnamed
structure constant or full simply connected weight lattice stands in for a gap.

## Conventions

- **The base field.** Work over a field `K` that is **algebraically closed and of characteristic
  zero** for the representation theory proper (so the characteristic polynomials of `H`-actions split
  and all weights take values in `K`), matching Mathlib's `[Field K] [CharZero K] [IsAlgClosed K]`.
  Algebraic closure and finite-dimensionality give only the **generalized** weight-space decomposition
  (`iSup_genWeightSpace_eq_top`, once `IsTriangularizable K H M` is in place); that the generalized
  weight spaces are honest simultaneous eigenspaces is a **separate theorem** (the native diagonalizability theorem), coming from the
  semisimplicity of the `H`-action, not from algebraic closure alone. State each result at the
  generality it actually needs, in the Zulip house style: the `sl₂` weight-string arguments need only
  `CharZero` and finite-dimensionality; the generalized decomposition needs `IsTriangularizable`; the
  diagonalizability and the classification need algebraic closure. **Do not** bundle "algebraically
  closed, characteristic zero, semisimple, split" into one mega-class; spell the hypotheses each theorem
  uses.
  The named split-field Serre sublane in Layer 7 and the split models in Layer 8 instead
  use an arbitrary `[Field K] [CharZero K]`, a finite-dimensional Killing-semisimple `L`,
  a Cartan subalgebra `H` and `[IsTriangularizable K H L]`. The indecomposable presentation
  additionally assumes `[LieAlgebra.IsSimple K L]`; reducible systems are assembled
  componentwise. The HC/Chevalley representation-theoretic results retain their separately
  stated algebraic-closure hypotheses.
- **The Lie algebra, and what "semisimple" means here.** `L` is a finite-dimensional Lie algebra over
  `K` (`[LieRing L] [LieAlgebra K L] [Module.Finite K L]`). The default semisimplicity hypothesis is
  **`LieAlgebra.IsKilling K L`** (non-degenerate Killing form), which over a characteristic-zero field
  is equivalent to `LieAlgebra.IsSemisimple K L` and, crucially, is the hypothesis under which Mathlib
  already produces `LieAlgebra.IsKilling.rootSystem`. Over an algebraically closed `K` every Cartan
  subalgebra is **split** (all root and weight values land in `K`); this splitness is itself a **named
  milestone** (feeding Mathlib's `IsTriangularizable K H L`), consumed thereafter rather than treated as
  ambient, so we do not carry a separate "split" hypothesis. Where the general theory over a non-closed
  field needs a split semisimple Lie algebra, that is a named generalization stated as such, not the
  default. The abelian, nilpotent, and solvable notions are Mathlib's (`LieAlgebra.IsNilpotent`,
  `LieAlgebra.IsSolvable`, `HasTrivialRadical`).
- **Cartan subalgebras, roots, and weights are Mathlib's.** Fix a Cartan subalgebra `H` via
  `[H.IsCartanSubalgebra]` (`LieSubalgebra.IsCartanSubalgebra`); it exists by
  `LieAlgebra.exists_isCartanSubalgebra`. A **root** is a nonzero `LieModule.Weight K H L` (element of
  the `Finset` `LieSubalgebra.root H`); a **weight of a module** `M` is a `LieModule.Weight K H M`; the
  **root space** and **weight space** are `LieAlgebra.rootSpace H α = LieModule.genWeightSpace L α` and
  `LieModule.genWeightSpace M χ`. The **root system** is `LieAlgebra.IsKilling.rootSystem H`, a
  `RootPairing H.root K (Module.Dual K H) H`; its **coroots** are `LieAlgebra.IsKilling.coroot`, and
  `finrank_rootSpace_eq_one` says root spaces are lines. Never introduce a private `Root`, `Weight`, or
  `Coroot` synonym.
- **Positive systems and dominance, via a base.** Fix a base
  `base : (LieAlgebra.IsKilling.rootSystem H).Base` (`RootPairing.Base`, which exists by
  `RootPairing.nonempty_base`); its `IsPos` predicate and `base.support` of **simple roots** are the
  positive system and simple system. We reserve the name `base` for the root-system base and never reuse
  it for the Borel subalgebra it determines. Integrality is an **arithmetic** condition, not a linear
  one: a weight `λ : Module.Dual K H` is **integral** when `λ (α^∨) ∈ ℤ` (the image of `ℤ` in `K`) for
  every root `α`, and **dominant integral** when `λ (αᵢ^∨) ∈ ℕ` for every simple root `αᵢ`. The
  **integral weight lattice** `X` is therefore a `ℤ`-submodule of `Module.Dual K H`, **not** a
  `K`-subspace. Use the native integral-weight lattice and integer coroot pairings.
  Its comparison with a based root datum retains the actual root-system carrier;
  the character lattice of a non-simply-connected group need not be the full weight lattice.
- **Modules are `LieModule`s; the categorical `FDRep` is a mirror.** Develop the theory on the
  Mathlib-native module core: `M` with `[LieRingModule L M] [LieModule K L M]`, irreducibility as
  `LieModule.IsIrreducible K L M` (`= IsSimpleOrder (LieSubmodule K L M)`), and the enveloping algebra
  `UniversalEnvelopingAlgebra K L` with its universal property `UniversalEnvelopingAlgebra.lift`.
  Finite-dimensional representations of `L` are the same data as finite-dimensional
  `UniversalEnvelopingAlgebra K L`-modules; keep that dictionary explicit where the associative-algebra
  presentation (PBW, Verma modules as cyclic `U(L)`-modules) is the natural home. Use Mathlib's
  vocabulary throughout: `LieSubmodule`, `LieModuleHom`, `LieModuleEquiv` (`M ≃ₗ⁅K,L⁆ N`),
  `Module.finrank`, `Module.Dual`.
- **Highest weight is defined against the base, not against a total order.** A **highest weight
  vector** of weight `λ` in `M` is a nonzero `v` with `⁅x, v⁆ = λ x • v` for `x ∈ H` and `⁅e, v⁆ = 0`
  for every `e` in a positive root space. `L(λ)` is the unique irreducible module generated by such a
  vector. The `sl₂` case is this definition with the single positive root, and
  `IsSl2Triple.HasPrimitiveVectorWith` is exactly a highest weight vector for that `sl₂`; keep the
  general definition and the `sl₂` structure literally the same notion so the reductions typecheck.
- **Characters live in the group algebra of the weight lattice.** The **formal character** of a
  finite-dimensional module is the multiplicity function `μ ↦ dim Mμ` (honest weight multiplicities,
  legitimate once the native diagonalizability theorem is in place), an element of the integral
  group algebra `ℤ[X]` of the weight lattice (a `Module.Dual K H →₀ ℤ` supported on integral weights).
  The Weyl group `(rootSystem H).weylGroup` acts on it. The Weyl character formula is an identity in
  this group algebra, stated with the **integral denominator** `∏_{α>0}(1 - e^{-α})` (all exponents in
  `X`) rather than the symmetric `∏(e^{α/2} - e^{-α/2})` (whose half-weights `α/2` need not lie in `X`);
  the dimension formula is its specialization at the trivial character, taken in `ℚ`, and Kostant's
  formula is its expansion against the Kostant partition function. Keep the three as one development,
  not three.
- **Reductive Lie algebras and the `gl_n` conventions (Layer 9).** Layer 9 drops the blanket
  `IsKilling`: reductivity is Mathlib's `LieAlgebra.HasCentralRadical` (`radical = center`), carried as
  an unbundled hypothesis, and semisimplicity is imposed on the derived ideal
  `LieAlgebra.derivedSeries K L 1`, never on `L`; `IsAlgClosed` appears per-theorem exactly where a
  Schur-type argument needs it. The concrete `gl_n` is `Matrix (Fin n) (Fin n) K` with its
  `LieRing.ofAssociativeRing` bracket (Mathlib names no separate carrier), its Cartan is the diagonal
  diagonalCartan, and its positive system is the matrix-unit order (`Matrix.single i j 1` raising for
  `i < j`), since `LieAlgebra.IsKilling.rootSystem` is unavailable for it. On `gl_n` the **Killing form
  is degenerate**, so the pinned invariant form is the **trace form of the standard representation**
  (`⟨X, Y⟩ = tr (X * Y)`, `LieModule.traceForm`); the trace-form Casimir scalar
  `Σᵢ μᵢ (μᵢ + n - 1 - 2i)` is meaningless without that convention, so it is stated only for this
  form. Dominance for `gl_n` is a condition on **differences** (`μᵢ - μᵢ₊₁ ∈ ℕ`) with the entries
  free in `K`: the non-integral central direction that the group-level `DominantWeight n` of
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) (weakly decreasing **integer** tuples)
  does not see. The dictionary to the abstract semisimple theory is the restriction to
  `LieAlgebra.SpecialLinear.sl (Fin n) K`, pinned by the Layer 9 transfer targets, not left as prose.

## Exact supplier contracts

### From Mathlib

Use the following native carriers and their stated hypotheses. In particular,
generalized weight spaces alone do not assert diagonalizability, and a
nondegenerate Killing form is not a hypothesis on the reductive matrix algebra.

- **`sl₂` triples and the primitive-vector argument:** `Mathlib/Algebra/Lie/Sl2.lean`,
  `IsSl2Triple h e f` (with `lie_e_f`, `lie_h_e_nsmul`, `lie_h_f_nsmul`), `IsSl2Triple.toLieSubalgebra`,
  `IsSl2Triple.HasPrimitiveVectorWith t m μ` (fields `ne_zero`, `lie_h`, `lie_e`), the ladder lemmas
  `lie_f_pow_toEnd_f`, `lie_h_pow_toEnd_f`, `lie_e_pow_succ_toEnd_f`, and the integrality theorem
  `IsSl2Triple.HasPrimitiveVectorWith.exists_nat` (the highest weight of a primitive vector in a
  finite-dimensional module is a natural number), plus `exists_hasPrimitiveVectorWith`.
- **The `sl₂` Lie algebra concretely:** `Mathlib/Algebra/Lie/Classical.lean`,
  `LieAlgebra.SpecialLinear.sl n R` (trace-zero matrices), `SpecialLinear.single`,
  `SpecialLinear.singleSubSingle`, and `sl_non_abelian`; `sl (Fin 2) K` is our worked `sl₂`.
- **Cartan subalgebras:** `Mathlib/Algebra/Lie/CartanSubalgebra.lean`
  (`LieSubalgebra.IsCartanSubalgebra`, self-normalizing and nilpotent) and
  `Mathlib/Algebra/Lie/CartanExists.lean` (`LieAlgebra.exists_isCartanSubalgebra`,
  `exists_isCartanSubalgebra_engel`).
- **Weights and the weight-space decomposition:** `Mathlib/Algebra/Lie/Weights/Basic.lean`,
  `LieModule.genWeightSpace M χ`, `genWeightSpaceOf`, `LieModule.Weight R L M` (a bundled nonzero
  weight, `FunLike` to `L → R`), `LieModule.IsTriangularizable`, `iSupIndep_genWeightSpace`,
  `iSup_genWeightSpace_eq_top` (the decomposition when triangularizable); `Weights/Linear.lean`
  (`LinearWeights`, `Weight.toLinear`, so a weight is a genuine linear functional in characteristic
  zero); `Weights/Cartan.lean` (`LieAlgebra.rootSpace`, `rootSpaceWeightSpaceProduct` so root spaces
  move weight spaces by `⁅rootSpace H α, Mχ⁆ ⊆ M(α+χ)`); `Weights/Chain.lean`
  (`genWeightSpaceChain`, the root-string bounds).
- **The root system of a semisimple Lie algebra:** `Mathlib/Algebra/Lie/Weights/Killing.lean` and
  `Weights/RootSystem.lean`, `LieAlgebra.IsKilling` (non-degenerate Killing form),
  `IsKilling.instSemisimple`, `finrank_rootSpace_eq_one` (root spaces are one-dimensional),
  `IsKilling.coroot`, `cartanEquivDual`, `exists_isSl2Triple_of_weight_isNonZero` (the `sl₂` triple of
  a root), `sl2SubmoduleOfRoot`, and `LieAlgebra.IsKilling.rootSystem H : RootPairing H.root K
  (Module.Dual K H) H` with its instances `IsRootSystem`, `IsCrystallographic`, `IsReduced`, and
  `rootSystem_pairing_apply`, `rootSystem_coroot_apply`.
- **Abstract root systems, bases, Weyl groups:** `Mathlib/LinearAlgebra/RootSystem/*`,
  `RootPairing`, `RootSystem`, `RootPairing.Base` with `RootPairing.nonempty_base` and `Base.IsPos`,
  `Base.height`, `RootPairing.Base.cartanMatrix`, and `RootPairing.weylGroup`,
  `RootPairing.Equiv.reflection`. The corresponding Lie integral lattice is
  `TauCeti.integralWeightLattice`; the based-lattice comparisons retain these actual carriers.
- **The universal enveloping algebra:** `Mathlib/Algebra/Lie/UniversalEnveloping.lean`,
  `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι` (the Lie map `L →ₗ⁅K⁆ U(L)`),
  `UniversalEnvelopingAlgebra.lift` (the universal property, an equiv `(L →ₗ⁅K⁆ A) ≃ (U(L) →ₐ[K] A)`),
  `ι_comp_lift`, `lift_unique`, `hom_ext`.
- **Semisimplicity and irreducibility infrastructure:** `Mathlib/Algebra/Lie/Semisimple/Defs.lean`
  (`LieModule.IsIrreducible R L M := IsSimpleOrder (LieSubmodule R L M)`, `HasTrivialRadical`,
  `LieAlgebra.IsSemisimple`, `LieAlgebra.IsSimple`), `Semisimple/Basic.lean` (under `[LieAlgebra.IsSimple R L]`, the adjoint module `L` is
  irreducible; semisimple algebras are not generally irreducible as modules over themselves), `Weights/IsSimple.lean` (the ideal/root-set dictionary).
- **Trace and invariant forms:** `Mathlib/Algebra/Lie/TraceForm.lean`, `InvariantForm.lean`,
  `Killing.lean` (`killingForm`, `traceForm`, `traceForm_cartan_nondegenerate`), the raw material for
  the Casimir element.
- **The Serre presentation and the exceptional algebras, as defined objects:**
  `Mathlib/Algebra/Lie/SerreConstruction.lean`, `Matrix.ToLieAlgebra R CM` (the quotient of
  `FreeLieAlgebra R (CartanMatrix.Generators B)` by the Serre relations `CartanMatrix.Relations.toIdeal`,
  built from `CartanMatrix.Relations.HH/EF/HE/HF/adE/adF`, carrying `LieRing` and `LieAlgebra R`
  instances), and the named split algebras `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂`; the standard
  integer Cartan matrices `CartanMatrix.E₆`, `E₇`, `E₈`, `F₄`, `G₂`, `A n`, `B n`, `C n`, `D n`
  (`Mathlib/Data/Matrix/Cartan.lean`), and `RootPairing.Base.cartanMatrix` of the
  [../RootSystems/README.md](../RootSystems/README.md) roadmap. Mathlib defines these algebras as
  quotients but establishes none of their structural theorems (finite-dimensionality, dimensions,
  Killing-semisimplicity and type, concrete models, representations); those are built here.
- **The symmetric algebra and the center of an algebra:** `Mathlib/LinearAlgebra/SymmetricAlgebra/`
  (`SymmetricAlgebra R M`, `SymmetricAlgebra.equivMvPolynomial`, `Basis.symmetricAlgebra`), the target
  of the Harish-Chandra isomorphism; `Subalgebra.center R A` (`Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`),
  so `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`; and the Weyl group
  `(rootSystem H).weylGroup` that acts on `S(H)` by the dot action.
- **Non-associative algebras, derivations, and exterior powers (for the exceptional models):**
  `Mathlib/Algebra/Jordan/Basic.lean` (`IsJordan`, `IsCommJordan`, the Jordan-identity classes);
  `Mathlib/Algebra/Lie/Derivation/Basic.lean` (`LieDerivation`, and `LieDerivation.instLieAlgebra`,
  the derivations of a Lie algebra as a Lie algebra) and `Mathlib/RingTheory/Derivation/Basic.lean`
  (`Derivation R A M`, for the commutative case); `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`
  (`exteriorPower`, `⋀[R]^n M`, `exteriorPower.map`, `exteriorPower.ιMulti`) for the magic-square
  summands; and `LieAlgebra.SpecialLinear.sl n R` (`Algebra/Lie/Classical.lean`). Mathlib has **no
  octonion / Cayley algebra** and **no exceptional Jordan (Albert) algebra**.
- **Reductive vocabulary and matrix Lie algebras (for Layer 9):** `LieAlgebra.center`,
  `LieAlgebra.radical`, `LieAlgebra.derivedSeries`, and `LieAlgebra.HasCentralRadical`
  (`Mathlib/Algebra/Lie/Semisimple/Defs.lean`, `radical = center`, the characteristic-zero
  reductivity criterion - the predicate exists, its structure theory does not); the matrix Lie
  algebra `Matrix n n K` via `LieRing.ofAssociativeRing` with `lieEquivMatrix'`, the trace-zero
  subalgebra `LieAlgebra.SpecialLinear.sl`, the standard-module instance
  `LieRingModule (Matrix n n R) (n → R)` (`Mathlib/Algebra/Lie/Matrix.lean`), matrix units
  `Matrix.single`, and the trace form `LieModule.traceForm`.
- **Module constructions and the ring-level isotypic machinery (for the Layer 6 toolkit):** tensor
  products of Lie modules (`Mathlib/Algebra/Lie/TensorProduct.lean`), Hom and dual Lie modules
  (`Module.Dual.instLieRingModule`, `Mathlib/Algebra/Lie/Basic.lean`), direct sums
  (`Mathlib/Algebra/Lie/DirectSum.lean`). The Lie-level isotypic theory is native Tau Ceti
  (below), built on the ring-level `IsIsotypicOfType` and `isotypicComponent` of
  `Mathlib/RingTheory/SimpleModule/Isotypic.lean`.

The torus coefficient definition is Mathlib `mFourierCoeff`, in
`Mathlib/Analysis/Fourier/AddCircleMulti.lean`: it integrates f against the
negative-frequency character. `UnitAddTorus.mFourierBasis` supplies the L²
basis, and `UnitAddTorus.hasSum_mFourier_series_of_summable` supplies the
continuous-function Fourier expansion under summability. Their smooth-test
estimates and distributional cone comparisons are the targets of §6.2.

### From Tau Ceti

- `TauCeti.isIrreducible_restrict_derivedSeries` and
  `TauCeti.sup_center_derivedSeries_eq_top`, in `TauCeti/Algebra/Lie/Reductive.lean`,
  supply restriction to the semisimple part and the spanning statement for reductive L.
  `TauCeti.exists_centralWeight_of_isIrreducible`, in
  `TauCeti/Algebra/Lie/Weights/Central.lean`, gives scalar central action over an
  algebraically closed field on a finite-dimensional irreducible module.
- `TauCeti.isGlHighestWeightVector_glIrreducibleGenerator`,
  `TauCeti.nonempty_lieModuleEquiv_glIrreducible`, `TauCeti.finrank_glIrreducible_le`
  and `TauCeti.isIrreducible_glIrreducible_restrict_sl`, in
  `TauCeti/Algebra/Lie/GeneralLinear/Carrier.lean`, supply the normalized carrier,
  uniqueness, minimum cyclic dimension and restriction. These are not new targets.

- `TauCeti.integralWeightLattice`, `TauCeti.mem_integralWeightLattice_iff` and
  `TauCeti.root_mem_integralWeightLattice`, in
  `TauCeti/Algebra/Lie/Weights/WeightLattice.lean`, supply the actual integral
  weights as a ℤ-submodule and the inclusion of the roots; they do not identify
  an arbitrary compact group's character lattice with the full weight lattice.

- `TauCeti.exists_int_of_hasEigenvalue`, in `TauCeti/Algebra/Lie/Sl2/Spectrum.lean`,
  gives integer eigenvalues for a finite-dimensional module over a characteristic-zero
  field, without irreducibility or algebraic closure.
- `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`, in
  `TauCeti/Algebra/Lie/Sl2/WeightString.lean`, gives dimension n+1 under irreducibility
  over the triple's own subalgebra. `TauCeti.isSemisimple_toEnd_cartan` and
  `TauCeti.exists_int_apply_coroot` supply the Cartan weight theory.
- `Module.Basis.pbwBasis` and its ordered-product equation, together with
  `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, its associated-graded comparison,
  and its injectivity, finite-spanning and Noetherian theorems, are consumed over
  their native coefficient rings. In particular the ordered PBW input to
  Ado–Iwasawa has no characteristic-zero restriction.
- `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`, their generators and
  universal properties, and
  `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`
  supply the highest-weight classification. `TauCeti.IsMinuscule` and
  `TauCeti.tensorMultiplicity` are the carriers used by `minuscule_pieri`.
- `TauCeti.invForm` and `TauCeti.invForm_coroot`, in
  `TauCeti/Algebra/Lie/Weights/InvariantForm.lean`, and `TauCeti.casimirElement`
  and `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`, in
  `TauCeti/Algebra/Lie/HighestWeight/Casimir.lean`, supply the Killing normalization.
  `TauCeti.exists_isCompl_of_isKilling`, in
  `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`, supplies invariant
  complements over every characteristic-zero field; it has no algebraic-closure binder.
- `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`,
  `TauCeti.finrank_eq_prod_coweightPairing_div` and
  `TauCeti.formalCharacter_coeff_eq_kostantMultiplicity` supply the three Weyl/Kostant
  formulas in `HighestWeight/Weyl/Character.lean`, `Weyl/Dimension.lean` and
  `KostantMultiplicity.lean`. Freudenthal's formula is supplied by
  `TauCeti.freudenthal_multiplicity_formula` in `HighestWeight/Freudenthal.lean`.
- `TauCeti.hcProjection`, `TauCeti.vermaCentralCharacter`, `TauCeti.dotInvariants`
  and `TauCeti.hcProjection_mem_dotInvariants` supply the raw projection and its
  inclusion in dot invariants, in `HighestWeight/CentralCharacter/HarishChandra.lean`
  and `DotOrbit.lean`. Bijectivity and the filtered comparison remain Layer 7 targets.
- `TauCeti.opposition`, `TauCeti.root_opposition`, `TauCeti.coroot'_opposition`,
  `TauCeti.opposition_involutive` and `TauCeti.oppositionPerm`, in
  `TauCeti/LinearAlgebra/RootSystem/Opposition.lean`, supply the actual root involution
  and base permutation. They do not identify a compact group's integral character lattice.
- `TauCeti.Octonion K`, its norm and trace, and
  `TauCeti.Octonion.finrank_derivationLieAlgebra`, in
  `TauCeti/Algebra/Octonion/Basic.lean` and `Derivation.lean`, supply the split
  octonions and the dimension 14 of their derivations. The native nonassociative
  derivation carrier is `TauCeti.derivationLieAlgebra`.
- `TauCeti.AlbertAlgebra K`, `TauCeti.AlbertAlgebra.finrank_eq_twentySeven` and
  `TauCeti.AlbertAlgebra.finrank_traceZero`, in
  `TauCeti/Algebra/AlbertAlgebra/Basic.lean`, supply the split product and dimensions
  27 and 26. The Jordan and exceptional-type identifications are distinct targets.
- `TauCeti.glIrreducible`, in `TauCeti/Algebra/Lie/GeneralLinear/Carrier.lean`,
  supplies the highest-weight carrier with its native module instances.
  `TauCeti.glCasimir` and
  `TauCeti.glCasimir_smul_of_isGlHighestWeightVector_of_lieSpan_eq_top`, in
  `TauCeti/Algebra/Lie/GeneralLinear/Casimir.lean`, supply the trace-form Casimir
  and its scalar on every cyclic highest-weight module.
- `TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor` and
  `TauCeti.UniversalEnvelopingAlgebra.symmetricAlgebraEquiv`, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Prod.lean` and `Abelian.lean`, supply
  the maps composing `productEnveloping`; the center comparison is
  `exists_productCenterEquiv`.
- `LieModule.isotypicMultiplicity` (the finrank of `S →ₗ⁅R,L⁆ M`, in
  `TauCeti/Algebra/Lie/Multiplicity.lean`), `LieModule.isotypicComponent` (the
  supremum of the Lie submodules equivalent to S, in `TauCeti/Algebra/Lie/Isotypic.lean`),
  `TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIsoAsModule` (the order
  isomorphism between Lie submodules and `U(L)`-submodules for the canonical
  module structure, over any commutative ring, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Module.lean`), and
  `LieModule.nonempty_lieModuleEquiv_isotypicComponent` and
  `LieModule.finrank_isotypicComponent` (in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Multiplicity.lean`) supply the Lie
  isotypic theory. The last two assume a field K with `[IsAlgClosed K]`, a
  finite-dimensional M with a `U(L)`-module structure in a scalar tower, and a
  finite-dimensional irreducible S; they give `isotypicComponent ≃ S^(⊕m)` and
  `dim = m · dim S` without complete reducibility of M. Uniqueness of the count
  over finite irreducible decompositions is
  `LieModule.isotypicMultiplicity_eq_ncard_of_isInternal`. Under the standing Killing, Cartan,
  base and algebraically closed characteristic-zero hypotheses,
  `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient` and
  `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul`, in
  `TauCeti/Algebra/Lie/HighestWeight/Decomposition.lean`, supply
  `M ≅ ⊕_λ L(λ)^(⊕ m_λ)` over dominant integral λ and `ch M = Σ_λ m_λ ch L(λ)`.

### From other roadmaps

Use RootSystems Layers 1–6 for the finite root data, ClassicalGroups Layers 2–4
for rational group representations, SchurWeyl Layer 7 for finite Schur polynomials,
CompactGroups Layers 0–6 for compact characters, and LieGroups Layers 2–4, 6–7
for Lie integration, maximal tori, Haar Weyl integration and holomorphic
complexification. The supplier gaps below are not part of these imports.
ComplexKahlerGeometry K5a supplies the smooth test-density spaces and their
continuous duals used for torus distributions in Layer 6.2. The needed Fourier
decay estimates and lattice/cone comparisons are targets of that layer.
ReductiveGroups Layers 2 and 5P supply the tangent and
characteristic-zero closed-subgroup smoothness cut used by Layer 9.

### Supplier gaps

What LieGroups must provide (gap:unitary-regular-complexification): for every
n≥0, finite-dimensional complex V and continuous homomorphism ρ from the unitary
group U(n) to GL(V), a unique homomorphism GLₙ(ℂ)→GL(V) whose matrix
coefficients are polynomials in the matrix entries and the inverse determinant
and which restricts to ρ; restriction from such regular representations to
continuous U(n)-representations is fully faithful, commutes with direct sums,
tensor products and duals, and preserves irreducibility. Uniqueness comes from
Zariski density of U(n) in GLₙ(ℂ). LieGroups Layer 7 supplies holomorphic
extension; regularity of the matrix coefficients is the additional content.
Witnesses: the U(1) character z↦z⁻¹ extends to the regular Gₘ character
t↦t⁻¹, with value 1/2 at t=2; for n=0 both groups are trivial and the
extension of the trivial representation is the identity of V. Consumed by §5.2.

What LieGroups must provide (gap:torus-period-lattice): for a compact connected
Lie group G with maximal torus T and Lie algebra 𝔱 (LieGroups Layer 6), the
kernel Λ of the exponential map 𝔱→T is a lattice of full rank; with the circle
parametrized by θ↦exp(iθ), the cocharacter lattice Y=Hom(S¹,T) is identified
with (2π)⁻¹Λ by φ↦dφ(∂_θ); the character lattice X=Hom(T,S¹) is identified
with the α∈𝔱* satisfying α(Λ)⊆2πℤ by dχ=iα; the pairing X×Y→ℤ is
χ∘φ=(z↦z^⟨χ,φ⟩); and the roots of the complexified adjoint action are elements
of X. Witnesses: in SU(2), T={diag(z,z⁻¹)}, Λ=2πℤ·diag(i,−i), the cocharacter
z↦diag(z,z⁻¹) has differential diag(i,−i), the root character is z↦z² with
differential 2i at diag(i,−i), and the root pairs with this cocharacter to 2;
in SO(3) the rotation cocharacter pairs with the root to 1. Consumed by §§5.1
and 10.2.

What CompactGroups must provide (gap:compact-frobenius-schur): for a compact
group G with normalized Haar measure and an irreducible continuous
finite-dimensional complex representation V with character χ, the indicator
`∫_G χ(g²) dg` lies in {1,0,−1}; it is 1 exactly when V has a nonzero
G-invariant symmetric bilinear form, −1 exactly when it has a nonzero invariant
alternating form, and 0 exactly when V is not isomorphic to its dual; a nonzero
invariant bilinear form is unique up to scalar. Witnesses: the standard SU(2)
representation has indicator −1 and invariant form [[0,1],[−1,0]]; the
character z↦z of S¹ has indicator 0 since z² has Haar integral 0; the trivial
representation has indicator 1. CompactGroups Layer 6 supplies character
orthogonality, not this criterion. Consumed by §5.1.

What SchurWeyl must provide (gap:skew-lr-tableaux, the contract that
TensorProductCombinatorics also consumes under this name): for diagrams λ≤ν,
semistandard skew tableaux of shape ν/λ with weakly increasing rows and
strictly increasing columns and their content; Littlewood–Richardson tableaux,
those whose reading word (rows top to bottom, each right to left) has in every
prefix at least as many letters k as letters k+1; finiteness of the set of
Littlewood–Richardson tableaux of shape ν/λ and content μ, its cardinality
c^ν_(λμ), and the rule `s_λ s_μ = Σ_ν c^ν_(λμ) s_ν` in every finite alphabet,
through the weight-preserving tableau-product bijection, with c^ν_(λμ)=0 unless
λ≤ν and |ν|=|λ|+|μ|. Witnesses: `s_(1)² = s_(2) + s_(1,1)`, both coefficients
1; for empty λ the count is 1 exactly when ν=μ. SchurWeyl Layer 7 supplies
finite Schur polynomials and RSK, not this contract. Consumed by Layer 9.

## How to read the build

Layer 0 fixes normalized rank-one comparisons and Layer 3 constructs the
PBW deformation. The native highest-weight inputs are listed in the supplier contracts;
Layer 5 develops their duality and compact-character applications. Layer 6 builds tensor and character comparisons; Layer 7 constructs
Chevalley restriction before filtered Harish-Chandra, and proves the split Serre
presentation. Layer 8 gives the exceptional models, Layer 9 the reductive comparisons,
and Layer 10 the affine lattice geometry. Each proof route names its inputs;
other proofs can establish the same mathematical targets. `Suggested.lean` states
only the headline theorems on available carriers, and its docstring identifies
headlines whose construction carriers are unavailable.

## Layer 0: normalized rank-one tensor comparisons

### 0.1 concrete polynomial tensor strings and their Hermitian orthogonality

Every statement of this subsection is a derived finite computation with the
inputs named here; no source theorem is claimed for it. Construct the concrete
rank-one tensor comparison here, alongside Layer 0. It consumes
native symmetric powers and their standard `GL₂(ℂ)`/`SU(2)` actions, the native
single-module ladder, and finite-dimensional tensor linear algebra. It does not
consume Layer 6's character formula, general compact Haar theory, either existence or
orthogonality of an abstract Clebsch–Gordan decomposition, or the later reductive `gl_n`
classification. The resulting
concrete decomposition is a comparison with the native abstract Clebsch–Gordan theorem.
The monomial normalization is stated by `exists_polynomialSymmetric`;
the coefficient formulas and Checks below specify the rest of the tensor comparison.

1. **Polynomial, symmetric-tensor and action dictionaries.** Let
   `P_d = MvPolynomial.homogeneousSubmodule (Fin 2) ℂ d`, and put
   `e_i^d = x^(d-i)y^i` for `0≤i≤d`, zero outside this range. Construct its monomial
   basis and a linear equivalence to the existing `Sym[ℂ]^d (Fin 2 → ℂ)` that sends
   `e_i^d` to the pure symmetric tensor with `d-i` copies of the first standard vector
   and `i` copies of the second. Supply both inverse formulas, coordinates, zero-degree
   unit, addition/scalars, multiplication between degrees, and the tensor-product
   comparison with the bihomogeneous polynomials in two pairs of variables. Prove
   naturality for the actual native `TauCeti.symPowerRep ℂ 2 d` and its restriction
   `TauCeti.SU2.symPower d`. Here `x,y` denote standard *vectors*: a matrix
   `[[a,b],[c,d]]` substitutes `x↦a x+c y`, `y↦b x+d y`.
   These are not the contragredient polynomial functions of ReductiveGroups10C;
   provide the dual/action dictionary when comparing with that model rather than
   identifying their Borel and sign conventions silently. On diagonal matrices the
   weight of `e_i^d` is `(d-i,i)`.

   **Checks.**

   - For d=0 the dictionary sends the constant polynomial 1 to the unit of the
     zeroth symmetric power; the zero map fails this.
   - For d=2 the monomial xy maps to the pure symmetric tensor of one first and one
     second standard vector with coefficient 1, whose averaged symmetrization is
     `(x⊗y+y⊗x)/2`, of squared norm 1/2 in the product Hermitian form.
   - The rescaled map `2·e` satisfies every linear-map law but sends xy to twice
     that tensor, whose averaged symmetrization `x⊗y+y⊗x` has squared norm 2;
     `exists_polynomialSymmetric` excludes it at i=1.

   *Needs:* Mathlib homogeneous polynomials; native `SymmetricPower` and
   `SymmetricPower.tprod`; native `TauCeti.symPowerRep` for naturality.

2. **Actual operators and vectors.** Define on these polynomials
   `E=x∂_y`, `F=y∂_x`, `H=EF-FE`, prove preservation of degree and all linear-map
   laws, and identify them with differentiation of the actual upper/lower unipotent
   and diagonal actions. Prove the group exponential formulas (finite sums for E,F),
   their tensor Leibniz laws and `H=[E,F]`, `[H,E]=2E`, `[H,F]=-2F`.
   In particular `E e_i=i e_(i-1)`, `F e_i=(d-i)e_(i+1)` and
   `H e_i=(d-2i)e_i`, with zero endpoints. On `P_m⊗P_n` use the actual
   `E_tot=E⊗1+1⊗E`, `F_tot=F⊗1+1⊗F`, and `H_tot`. For d=2: `E(xy)=x²`,
   `F(xy)=y²`, `H(xy)=0` and `H(x²)=2x²`; replacing E by `y∂_x` would give
   `E(x²)=2xy`, raising the wrong end of the string.
   For every `0≤r≤min(m,n)` define the nonzero vector

   `v_r=(x₁y₂-y₁x₂)^r x₁^(m-r)x₂^(n-r)
       =Σ_(j=0)^r (-1)^j binom(r,j) e_j^m⊗e_(r-j)^n`.

   Prove equality of these two actual constructions under the bihomogeneous
   comparison, annihilation by E, invariance under the upper unipotent subgroup,
   GL₂ highest weight `(m+n-r,r)`, and SL₂ highest weight `N_r=m+n-2r`.
   Prove that the simultaneous E-kernel and fixed weight line is spanned by this
   vector; the completed string basis in item4 then proves that the whole
   E-kernel is the direct sum of these lines.
   Construct every `F_tot^k v_r`, its finite binomial/Leibniz coefficient formula,
   weight `(m+n-r-k,r+k)`, and the ladder identities
   `E_tot F_tot^k v_r=k(N_r-k+1)F_tot^(k-1)v_r`,
   `F_tot^(N_r+1)v_r=0`, with nonvanishing for `0≤k≤N_r`.
   Exponents and bounds must be stated before using natural-number subtraction.

3. **The invariant Hermitian form and normalization.** Use the form conjugate-linear
   in the first variable with `⟨e_i^d,e_j^d⟩=δ_ij/binom(d,i)` and tensor-product
   form on `P_m⊗P_n`. Construct its sesquilinearity, conjugate symmetry, strict
   positivity, and compatible norm/inner-product structure retaining the existing
   additive and complex scalar parents; give the pure-tensor product and coordinate
   formulas. Prove invariance under the actual `U(2)` action and hence SU₂ restriction,
   with `E†=F` and `H†=H`. Build this using the explicit averaged symmetrization
   `(1/d!)·SymmetricPower.toTensorPower` into the tensor power with its product
   Hermitian form. The native `toTensorPower` sums **all permutations**, including
   repeated words. Its value on `e_i` is `i!(d-i)!` times the sum `u_i` of the
   `binom(d,i)` distinct words; the averaged image is `u_i/binom(d,i)`.
   Prove injectivity, naturality, isometry and each counting identity, including d=0.
   Thus `‖u_i‖²=binom(d,i)` and `‖e_i‖²=1/binom(d,i)`.
   The orthonormal polynomial basis is `sqrt(binom(d,i)) e_i`, whereas
   `u_i/sqrt(binom(d,i))` is the same orthonormal tensor basis. Neither formula
   licenses silently replacing one dictionary with the other.

   **Checks.**

   - For d=0, the unit monomial has squared norm 1/choose(0,0)=1.
   - For d=2, xy has squared norm 1/choose(2,1)=1/2, and its averaged tensor is
     (x⊗y+y⊗x)/2; the unweighted coefficient form would give 1.
   - For d=2, x² and xy have inner product 0, since their coefficient supports differ.

4. **Orthogonality before decomposition.** Prove directly from the adjoint identities
   that `⟨F_tot^k v_r,F_tot^l v_s⟩=0` whenever r≠s (all k,l), and that different
   H-weights are orthogonal. For equal weights and r<s, `k-l=s-r>0`; move the
   lowering operators across the form to a positive power of E on `v_s`, which is
   zero. Compute

   `‖v_r‖²=Σ_j binom(r,j)^2/[binom(m,j)binom(n,r-j)]
     =r!(m-r)!(n-r)!(m+n-r+1)!/[m!n!(m+n-2r+1)!]`,

   `‖F_tot^k v_r‖²=k! N_r!/(N_r-k)! · ‖v_r‖²` for `0≤k≤N_r`.
   Prove the finite-sum/factorial identity and all denominator positivity claims.
   This gives explicit normalized strings. Prove their linear independence and
   spanning by the dimension identity `Σ_r(N_r+1)=(m+1)(n+1)`; construct the actual
   basis, inverse coordinate/projection maps and mutually orthogonal invariant
   summands. Construct the GL₂ intertwiners
   `det^r⊗Sym^(N_r)(ℂ²) → Sym^m(ℂ²)⊗Sym^n(ℂ²)` sending the highest monomial
   to `v_r`; on its i-th monomial use `(N_r-i)!/N_r! · F_tot^i v_r`.
   Check intertwining on the actual torus and both unipotent subgroups by the
   polynomial formulas; use elementary matrix generation of GL₂, rather than
   infer group equivariance from an unspecified differentiation comparison.
   Supply injectivity, image, the direct-sum intertwining equivalence and its inverse,
   SU₂ restriction and the comparison with Layer 0's abstract decomposition.
   On each common SU₂ weight of two strings prove the corresponding orthogonality;
   one uniform choice is `ε=(m+n) mod 2`, reached at `k=(N_r-ε)/2`.
   Lowering preserves the invariant **summands**, and moves between weight spaces.

5. **Symmetric-square calculation and all boundaries.** For n≥2 set
   `A=y²⊗x^n`, `B=xy⊗x^(n-1)y`, `C=x²⊗x^(n-2)y²`.
   With `w₁=v_0`, `w₂=-v_1`, `w₃=v_2`, prove

   `F²w₁=2A+4nB+n(n-1)C`,
   `Fw₂=A+(n-2)B-(n-1)C`, `w₃=A-2B+C`.

   The A,B,C Gram matrix is diagonal with entries `1,1/(2n),2/[n(n-1)]`.
   Prove the three cross-inner-products are zero by these actual vectors and this
   form, and give their positive norms and unit normalizations. The three highest
   weights are `(n+2,0),(n+1,1),(n,2)`; retain the determinant twists in the GL₂/U₂
   decomposition. For n=0 there is only r=0; for n=1 only r=0,1. Treat m=0,
   n=0, r=0, the trivial representation, empty lowering ranges and every zero
   endpoint explicitly, without assigning meaning to a negative symmetric power.

### Examples

V(2) has weights 2,0,−2 and dimension 3; the d=2 monomial xy has norm squared 1/2.

### Dependencies

*Needs:* native rank-one modules and symmetric powers; Mathlib homogeneous polynomials and tensor products.

## Layer 3: enveloping algebra, Verma modules, and `L(λ)`

### 3.1 PBW, its Rees algebra and the linear Poisson bracket

- **Concrete PBW normalization and its extensions.** Consume
  `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `pbwFiltrationPrevious`,
  `PBWGradedPiece`, the ring-filtration/exhaustiveness API, ι_injective,
  `pbwAssociatedGradedEquiv` and the domain theorem. Consume `Module.Basis.pbwBasis`, `pbwBasis_eq_prod_pow`,
  `pbwBasis_zero` and `pbwBasis_single`: the vector at a multi-exponent is exactly
  the increasing product of `ι(bᵢ)^{mᵢ}`. Derive the graded-basis value equation
  from `pbwAssociatedGradedEquiv` and `pbwHomogeneousComponentMap` on these same
  ordered monomials. Consume map_pbwFiltration_le for native induced maps;
  expose its subalgebra, quotient and direct-sum ordered-span specializations.
  Consume native `PBW.Noetherian.Basic` and `.Opposite` for left/right
  Noetherianity of finite-dimensional L, including the explicit opposite-ring instance. These interfaces are over an arbitrary field, including F₂, for
  [Ado–Iwasawa](../AdoIwasawa/README.md); only triangular decomposition uses
  the root-space/semisimple characteristic-zero setting. Consume the native
  triangular multiplication equivalence on the actual nilradicals below.

  Consume native `span_range_bounded_orderedPowerProducts_eq_top` and
  `moduleFinite_of_isIntegral_of_span_eq_top` from `PBW.Finite`. The
  central-subalgebra adapter `module_finite_of_central_monic_relations` packages
  a subalgebra R≤Z(U(L)) through the commutative scalar view
  S:=R.comap(center.val), a subalgebra of the center, supplies the S→R algebra/tower
  comparisons, reindexes a finite basis by Fin n, and converts its explicit
  monic relations to `IsIntegral` before applying those native theorems. It
  preserves the original R-module structure and the bounded ordered products;
  it does not rebuild native finite-spanning or module-finiteness machinery.
- **PBW Rees deformation and its first-order Poisson bracket.** For this
  construction let `R` be a commutative ring and `L` a Lie `R`-algebra with a
  chosen ordered `R`-basis. No semisimplicity or characteristic-zero hypothesis
  is imposed. Write `F_n` for the native increasing PBW filtration, with
  `F_(-1)=0`. Construct the noncommutative Rees algebra as the actual subalgebra
  of the central-variable polynomial ring `U_R(L)[t]`:
  `Rees_PBW(L)={Σ a_n t^n | a_n∈F_n}`.
  Build its coefficient, finite-support, grading, inclusion and multiplication
  API. The degree-`n` part is `F_n t^n`, not the associated-graded quotient.
  Construct the central element `ħ=t`, the `R[t]`-algebra structure, and the
  `R`-linear generators `j(x)=ι(x)t`. Prove
  `j(x)j(y)-j(y)j(x)=ħ j([x,y])`.
  The coefficient ring is central; multiplication in `U_R(L)` need not commute.

  Prove the presentation by the tensor algebra over `R[t]` on
  `R[t]⊗_R L`, modulo the two-sided relations
  `xy-yx-t[x,y]`. Its universal property identifies `R[t]`-algebra maps
  into any associative `R[t]`-algebra `A` with `R`-linear maps `f:L→A`
  satisfying `[f(x),f(y)]=t f([x,y])`. Construct both inverse maps on the
  actual quotient and generators. Consume the native ordered PBW basis over
  a commutative ring to prove that the increasing products of `j(b_i)` form
  an `R[t]`-basis. Thus the family is free and flat over `R[t]`, and
  multiplication by `ħ` is injective. Do not rebuild a second PBW theorem.
  Prove naturality under Lie homomorphisms, including the generator equation,
  and independence of the chosen basis for the Rees subalgebra and fibre maps.

  Construct the following algebra comparisons by their actual base-change
  maps and inverse generator formulas. The fibre at `t=0` is `Sym_R(L)`;
  the fibre at `t=1` is `U_R(L)`; the fibre at a unit `a∈Rˣ` is
  `U_R(L)` by `j(x)↦a ι(x)`, with inverse generator scaled by `a⁻¹`.
  A nonzero nonunit in a general ring is not covered by this last assertion.
  After scalar extension to `R[t,t⁻¹]`, identify the family with
  `R[t,t⁻¹]⊗_R U_R(L)` by `j(x)↦t ι(x)`. Use scalar extension along
  the commutative parameter ring, without assuming a general noncommutative
  localization theorem. Identify the zero-fibre kernel as the central
  two-sided ideal `ħ Rees_PBW(L)` and its degree-`n` coefficient as
  `F_(n-1)`. Ordinary ambient evaluation `U_R(L)[t]→U_R(L)` at zero
  is not this fibre map: it kills every `j(x)`, while the zero-fibre class
  of `j(x)` is the symmetric-algebra generator `x`.

  For `a,b` in the Rees algebra prove that `[a,b]` is uniquely `ħ c`.
  Reducing `c` modulo `ħ` defines a bracket on the zero fibre independent
  of both chosen lifts. Prove bilinearity, alternation, Jacobi and the two
  Leibniz identities, its degree `-1` property, naturality, and
  `{x,y}=[x,y]` on the symmetric generators. It is the unique biderivation
  with this generator equation. Use associativity, the commutator identities
  and injective multiplication by `ħ` for these proofs. For the dual-number
  base change `R[ε]/(ε²)`, use an ordered PBW module splitting to write
  `p⋆q=pq+ε B₁(p,q)`. Track the change of `B₁` under a change of the splitting and prove
  `B₁(p,q)-B₁(q,p)={p,q}`. The full first-order product coefficient
  is not asserted to be the Poisson bracket or to be alternating.

  For a finite-dimensional real Lie algebra L, use the canonical bidual
  identification to regard the derivative of a smooth function on L* at ξ as
  an element Df(ξ) of L. Define the bilinear operation on C∞(L*,ℝ) by
  `{f,g}(ξ)=ξ([Df(ξ),Dg(ξ)])`. Prove smoothness, alternation, Jacobi and
  the Leibniz rule. The Jacobi proof uses symmetry of second derivatives
  and Jacobi in L; it has no orbit or symplectic-leaf input. Define the
  algebra map Sym_ℝ(L)→C∞(L*,ℝ) by x↦ℓ_x, where ℓ_x(ξ)=ξ(x), and prove
  injectivity and preservation of the algebraic zero-fibre bracket
  (Gutt, *Deformation Quantization and Symmetries*, Lecture 1, slide 14).

  - The generator equation is {ℓ_x,ℓ_y}=ℓ_[x,y], and constants bracket to zero.
  - For any real Lie homomorphism u:L→M, pullback along u*:M*→L* preserves
    this bracket; identity and composition agree with function pullback.
  - Among smooth bivectors linear in ξ, the generator equations determine
    the bracket; the polynomial map preserves units, products and brackets.

  **Checks.**

  - For L=0 and for an abelian real line all brackets are zero; the polynomial
    map sends 1 to the constant function 1, excluding the zero map.
  - For [x,y]=y, at ξ(x)=2, ξ(y)=3, {ℓ_x,ℓ_y}(ξ)=3 and the reversed
    bracket is −3; the negative Poisson convention gives the wrong sign.
  - For sl₂, {h,e}=2e and {e,f}=h, so {e,h²+4ef}=−4eh+4eh=0.
    The polynomial e is not central since {h,e}=2e is nonzero.

  *Needs:* the algebraic bracket above; Mathlib derivatives and finite-dimensional
  biduality; symmetric-algebra evaluation and polynomial identity over ℝ.
  The noncommutative Rees carrier is distinct from the commutative
  weight-Rees families of GroebnerGeometry G4.

  Acceptance cases include abelian `L` (the constant commutative family),
  the two-dimensional algebra `[x,y]=y`, and `sl₂` with
  `[h,e]=2e`, `[h,f]=-2f`, `[e,f]=h`. Compute the parameter-dependent
  generator relations. In `sl₂` prove that
  `j(h)²+2ħ j(h)+4j(f)j(e)` is central and that its zero-fibre symbol
  is the Poisson-central polynomial `h²+4ef`. These examples check the
  parameter, sign and order conventions against the same concrete algebra.
  The Rees family, its fibres and its bracket over an arbitrary commutative ring
  are derived statements: their inputs are the native ordered PBW basis over a
  commutative ring, the tensor-algebra presentation above and injectivity of
  multiplication by ħ. Gutt, *Deformation Quantization and Symmetries*, Lecture 1,
  slide 14 (2019) is cited only for the real characteristic-zero convention
  `{ℓ_x,ℓ_y}=ℓ_[x,y]`, not as a source for the arbitrary-ring statements.

### 3.2 Ordered and symmetrized first-order products

 Let L be
  the Lie R-algebra on the free module Rx⊕Ry with `[x,y]=y`. Realize it as
  the matrix Lie subalgebra spanned by `H=E₀₀`, `N=E₀₁` in
  `Matrix (Fin 2) (Fin 2) R`; prove the span/bracket/basis dictionary.
  This is the affine Lie algebra. For every
  commutative coefficient ring R, use Rees generators X=j(H), Y=j(N), so
  `XY−YX=ħY`, with ordered PBW basis `Y^aX^b` over R[ħ]. Compare Sym(L)
  with the native polynomial ring R[x,y] through this same basis.

  Construct the ordered linear comparison S_ord(x^b y^a)=Y^a X^b and its
  inverse. Inductively prove `X^bY^c=Y^c(X+cħ)^b`, and transport multiplication:

  `(y^a x^b)⋆(y^c x^d)=Σ_(n=0)^b binom(b,n)c^n ħ^n y^(a+c)x^(b+d−n)`.

  Prove this finite formula over R, its scalar/bilinear extension, unit,
  associativity, parameter specialization and the literal comparison with
  the Rees multiplication; no factorial division is used. At ħ²=0 its
  first-order coefficient is `B_ord(p,q)=(∂_x p)y(∂_y q)`. Hence
  `B_ord(x,y)=y`, `B_ord(y,x)=0` and
  `B_ord(p,q)−B_ord(q,p)=y((∂_x p)(∂_y q)−(∂_y p)(∂_x q))`.
  Identify this last expression with the positive Lie–Poisson bracket by
  the preceding symmetric-generator comparison. Ordered first-order
  multiplication is not alternating, including on the two generators.

  When R is a ℚ-algebra, also construct the symmetrized PBW comparison by
  averaging all permutations of each homogeneous tensor, with its degree
  factorial inverse. Compare it with S_ord, retaining the identity at ħ=0.
  Modulo ħ² the change is `S_sym=S_ord∘T`, where
  `T=Id+ħD`, `D(p)=(1/2)y∂_x∂_y p`, and `T⁻¹=Id−ħD`.
  Prove the monomial formula for this first-order change by counting the
  mean number of XY interchanges. Transport the product by
  `p⋆_sym q=T⁻¹(Tp⋆Tq)` and prove

  `B_sym(p,q)=B_ord(p,q)+D(p)q+pD(q)−D(pq)=(1/2){p,q}`.

  Thus even the symmetric splitting gives half the bracket as its product
  coefficient; the full first-order commutator gives the bracket. Retain this distinction with the fixed parameter. The
  ordered integral construction remains valid in characteristic2; the
  averaging/half-bracket comparison has its stated ℚ-algebra hypothesis.
  This example uses only the preceding arbitrary-ring PBW/Rees construction
  and native polynomial derivatives. General formal deformation quantization
  and convergence are not prerequisites. These formulas are derived here from
  the commutation rule `X^bY^c=Y^c(X+cħ)^b`; for the real characteristic-zero
  symmetrization framework see
  [Gutt, Deformation Quantization and Symmetries, Lecture1](https://simone.gutt.web.ulb.be/DQWurzOct2019Lect1%262.pdf).

  **Checks.**

  - `B_ord(x,y)=y` and `B_ord(y,x)=0`, so ordered first-order multiplication is
    not alternating; their difference is the bracket value y.
  - At p=xy, `D(p)=(1/2)y`, and `B_sym(x,y)=y+0+0−(1/2)y=(1/2)y`, half the
    bracket, while `B_sym(y,x)=−(1/2)y` and their difference is y; reporting y
    as the symmetric coefficient confuses the two splittings.
  - With a=0, b=1, c=1, d=0 the product formula gives `x⋆y=yx+ħy`, matching
    `XY=YX+ħY`; at ħ=0 it is the commutative product of R[x,y].

Prove the induced-tensor presentation of the native Verma module:
U(L) ⊗ over U(𝔟) with the one-dimensional highest-weight character is isomorphic
to the native quotient, taking 1⊗1 to its generator and intertwining the left
U(L)-action. The source uses the actual Borel and its inclusion, and the
comparison includes zero among possible images of the universal generator
(Humphreys, *Introduction to Lie Algebras and Representation Theory*, §20.3).

*Needs:* native Borel and Verma universal properties; balanced tensor products;
the triangular PBW equivalence.

### Examples

For [x,y]=y, the ordered first-order coefficients are B(x,y)=y and B(y,x)=0; their difference is y.

### Dependencies

*Needs:* native ordered PBW, filtration, associated grading and Verma modules; Mathlib real differential calculus for the smooth bracket constructed in §3.1.

## Layer 5: opposition, invariant forms and compact characters

### 5.1 Opposition, ordinary duality and self-duality

Use the split characteristic-zero semisimple scope and chosen Cartan/base of
Layers1–5, with the standing algebraically closed coefficient field. Consume
native `TauCeti.Algebra.Lie.HighestWeight.LowestWeight` and `.Dual`, in
particular `exists_isHighestWeightVector_dual`,
`nonempty_lieModuleEquiv_dual_iff` and the invariant-bilinear-form criterion.
For dominant integral λ, the ordinary dual of the finite-dimensional `L(λ)`
has highest weight `−w₀λ` and is equivalent
to `L(−w₀λ)`; these are supplied theorems, not a second dual-module construction.
Record the actual weight-space evaluation and highest/lowest-line equations
under the native action `(x·f)(v)=−f(x·v)`. This ordinary dual differs from
a contravariant dual defined using a Chevalley anti-involution.

Consume `TauCeti.opposition`, `oppositionPerm`, `root_opposition`,
`coroot'_opposition` and `opposition_mem_support` from native
`TauCeti.LinearAlgebra.RootSystem.Opposition`. Identify this actual involution
with the based root automorphism `δ=−w₀` on the rational/real root realization constructed by the integral-lattice comparison
here, using [RootSystems, Layer 4](../RootSystems/README.md) for its chamber and longest-element data: give its root, coroot, fundamental-weight
and oriented Cartan-matrix equations, preserving the native contravariant
coweight convention. Construct its based-automorphism witness and change-of-base
comparison; reuse the existing involution and base permutation.

Prove that `L(λ)` is self-dual exactly when `δλ=λ`, equivalently its
fundamental-weight coefficients are constant on δ-orbits. Complete reducibility
then identifies the dual multiplicities of an arbitrary finite-dimensional
module by `m_(M*)(λ)=m_M(δλ)` and gives its self-duality criterion. Prove that
EVERY finite-dimensional module is self-dual iff δ is the identity on the
weight space, equivalently `w₀=−Id`; for the reverse implication from all
modules use the fundamental highest-weight modules, whose weights span.
The trivial semisimple algebra satisfies this statement, and reducible systems
use opposition separately on each component, without permuting equal components.

Compute opposition in the valid finite types, with the actual numbered simple
roots and fundamental weights: it is trivial in A1, B, C, even D, E7, E8, F4
and G2, and nontrivial in A_n for n≥2, odd D_n for n≥5, and E6. Use
RootSystems' valid rank bounds and low-rank identifications. Trivial based
diagram automorphism group therefore implies every module is self-dual.
The converse fails already for D4: `−Id` is the even four-sign-change Weyl
element, hence is w₀, whereas its based diagram automorphism group is S3.
This root-level example asserts no triality automorphism of every isogeny form.

For compact connected SEMISIMPLE groups, compare this criterion through
the actual character lattice X and LieGroups' differentiation/integration maps.
The character-lattice comparison is LieGroups gap:torus-period-lattice (Supplier gaps);
[CompactGroups, Layer 6](../CompactGroups/README.md) supplies the character theory. An irreducible of actual highest
character λ∈X is dual to the one labeled `−w₀λ`; retain the actual group form.
All such representations are self-dual iff δ fixes X, equivalently the real
weight space since X has finite index in the semisimple weight lattice. A
central torus is a separate obstruction: the character z↦z of S1 is not
self-dual although there are no roots or diagram automorphisms. Self-duality
does not assert real type: the standard complex SU2 representation is
quaternionic, with Frobenius–Schur sign −1. The required compact sign criterion is
CompactGroups gap:compact-frobenius-schur (Supplier gaps); root opposition does not decide it.
The Lie invariant-form headline is `invariantForm_isSymm_iff_tits_sign`: for a nonzero
invariant bilinear form on L(λ), symmetry is equivalent to
(−1) raised to the sum of λ evaluated on the positive coroots being +1, and
skew-symmetry to the same sign being −1. The sum uses the integral pairings.
This is a derived statement with the following route and inputs: a nonzero
invariant form on the irreducible `L(λ)` is nondegenerate and unique up to
scalar; the element `2ρ∨`, the sum of the positive coroots, is the semisimple
element of a principal `sl₂`-triple; its eigenvalue `m = λ(2ρ∨)` on the
highest-weight line is strictly larger than on every other weight space,
since `ρ∨` pairs to 1 with each simple root; hence the `sl₂`-module `V(m)`
occurs in `L(λ)` exactly once, the form restricts nondegenerately to it, and
the invariant form on `V(m)` has sign `(−1)^m` by the native rank-one weight
strings. The principal triple is constructed from the Chevalley generators of
the simple roots with coefficients fixed by `2ρ∨ = Σ_i c_i α_i∨`.

**Checks.**

- In type A₁, opposition is the identity, while SU(2) permits highest weight 1
  and SO(3) permits only even weights. Replacing the actual lattice by P fails here.
- On SU(2), weight 1 has alternating matrix [[0,1],[−1,0]] and sign −1;
  weight 2 has sign +1. Both weights are fixed by opposition.
- For the circle, characters z and z⁻¹ are different: at z=i their values are i
  and −i. A root-free group need not have all representations self-dual.

*Needs:* native opposition and dual-module theorems; RootSystems Layer 4;
native integral-weight lattice; for the compact comparisons only, LieGroups
gap:torus-period-lattice and CompactGroups gap:compact-frobenius-schur.

### 5.2 Integral type-A characters from Haar measure

Construct the following type-A character route over ℂ, independent of the character formula. Its inputs are
ClassicalGroups Layer 3's group-level classification of rational GLₙ-representations,
highest-weight cone, one-dimensional highest-weight line and torus weights;
CompactGroups' invariant Hermitian forms, complete reducibility and character
orthogonality; LieGroups Layer 6's normalized Haar Weyl integration formula and
Layer 7's compact-complexification equivalence for finite-dimensional continuous
U(n)-representations; and SchurWeyl Layer 7's combinatorial Schur polynomials and
division-free bialternant identity. The GLₙ classification consumes the Lie highest-weight theorem. The regular
compact-complexification comparison is LieGroups gap:unitary-regular-complexification. Retain these phase boundaries: neither input
uses ClassicalGroups Layer 4's character–Schur identification, this layer's Weyl
formula, its Fourier-boundary comparison, or a formula for tensor multiplicities.
These inputs commission the following construction, separately from the native
Freudenthal–Casimir proof used in Layer 6. The identification it reaches,
that the torus character of the rational irreducible of highest weight λ is
the determinant-shifted Schur polynomial, is the statement owned by
ClassicalGroups Layer 4; this layer is an independent Haar-measure proof of
it and owns the integral virtual-character, finite-induction, tensor and
branching applications below.

Apply gap:unitary-regular-complexification as follows: average a positive
Hermitian form on a continuous U(n)-module, choose a Gram change of basis
carrying its image into U(V), and extend this homomorphism into the unitary
group to a regular GLₙ→GL(V) morphism. Conjugate back by the constant Gram
matrix to obtain a rational representation on the original vector space; the
compatibilities with intertwiners, direct sums, tensor products and
irreducibility are part of the gap contract. Holomorphic extension alone is
not the rationality statement required by ClassicalGroups Layer 3.

**Checks.**

- The U(1) character z↦z⁻¹ must extend to the regular Gₘ character t↦t⁻¹,
  whose value at t=2 is 1/2; a holomorphic extension alone does not specify regularity.
- The trivial character extends to the constant 1; tensoring the characters of
  weights 1 and −1 gives weight 0 on both sides.
- A nonintegral Lie weight 1/2 gives differential 1/2, but does not define a
  single-valued circle character, so it is outside this group extension contract.

**Integral weights, finite induction and virtual characters.** Use the native
`TauCeti.DominantWeight n`, its determinant shift and bounded Young diagram, and
the integral group algebra ℤ[ℤⁿ]. Fix the action `(w·β)ᵢ=β_(w⁻¹(i))`; let m_λ
sum each *distinct* weight in the orbit of λ once. For dominant λ, prove the
group-level analogue of formalCharacter_eq_orbitSum_add_lower from the highest-weight
cone, top-line dimension and Weyl invariance. Use the actual GLₙ torus weight-space
dimensions to construct its integral Laurent character and prove the trace-evaluation
dictionary. Do not instantiate a Killing-semisimple Lie-algebra theorem at glₙ:
retain the central degree and determinant character in ℤⁿ. All coefficients below λ are
nonnegative integers. Here μ≤λ means equal coordinate sums and λ−μ in the
nonnegative integral span of εᵢ−ε_(i+1), equivalently the prefix-sum inequalities.

Supply an explicit finite-induction API. For fixed S and strictly decreasing
real x₁>⋯>xₙ, the set of dominant integer λ with Σλᵢ=S and x·λ≤B is finite.
For n>1, put dⱼ=λⱼ−λ_(j+1)≥0 and prove

`x·λ = (S/n)Σᵢxᵢ + Σ_(1≤j<n) [Σ_(i≤j)xᵢ − (j/n)Σᵢxᵢ] dⱼ`.

Every coefficient in brackets is positive. A bound on x·λ therefore bounds each
integer gap; the gaps and S determine λ, subject to the integral congruence for
λₙ. Treat n=0 and n=1 directly. Deduce finite dominance ideals, well-founded
strict decrease of the score, and a well-order on each fixed-sum dominant lattice
when the coordinates of x are ℚ-linearly independent. For x=(n,…,1), retain
well-foundedness but do not assert injectivity: for n=3 the different weights
(1,1,−2) and (2,−1,−1) have equal score. No assertion concerns the unrestricted
integer lattice or a cone whose defining inequalities have not been supplied.

Invert the unitriangular character/orbit-sum matrix on each finite dominance
ideal over ℤ. Prove that restriction identifies the Grothendieck group of
finite-dimensional continuous U(n)-representations with the symmetric integral
Laurent polynomials. A Laurent polynomial has only finitely many central degrees;
apply finite triangular elimination separately in each one. Negative coefficients
give actual *virtual* representations. For an actual representation, realize the
highest-weight summands through its Hom spaces and complete reducibility before
subtracting their nonnegative multiplicities; formal integer subtraction alone
does not prove a subrepresentation exists. This supplies both the virtual
character expansion and the virtual-character decomposition.

**Polynomiality before character identification.** For dominant λ set
ρ=(n−1,…,0), D=∏_(i>j)(1−tᵢ/tⱼ),
A_β=Σ_w sgn(w)t^(w·β), and N_λ=t^(−ρ)A_(λ+ρ).
All these expressions initially live in ℤ[ℤⁿ]. In its fraction field define

`C_λ = Σ_w t^(w·λ) / ∏_(i>j)(1−t_(w(i))/t_(w(j)))`.

Prove the inversion-set denominator rewrite, with the pinned action, and the
identity D C_λ=N_λ. For n>0, put m=λₙ and let p be the bounded diagram of
λ−m(1,…,1). Construct the integral Laurent polynomial
`P_λ=(t₁⋯tₙ)^m s_p(t)` from the combinatorial tableau polynomial. Consume native
`TauCeti.diagramSchurPoly_mul_alternant` with the actual row bound to prove
D P_λ=N_λ and hence C_λ=P_λ in the fraction field. For n=0 all products and
alternants equal 1 and there is just the trivial weight.

Retain the paired-pole argument as its own algebraic construction. After clearing
the determinant shift, pair numerator terms by the transposition of two variables.
Their difference vanishes when the variables agree and is divisible by their
difference over ℤ; polynomial division by this monic linear factor preserves
integer coefficients. Prove that the distinct linear factors of the Vandermonde
are nonassociate primes in ℤ[t₁,…,tₙ], so their product divides the alternating
numerator. Compare this quotient with the independent tableau bialternant above.
Analytic removal of an apparent pole, by itself, is not a proof of an integral
Laurent quotient. On the unit torus use evaluation of P_λ at *every* point,
including repeated eigenvalues; do not define a value by a pointwise 0/0 quotient.

Construct the negative-simple-root completion in which D⁻¹ is the product of the
specified geometric series. A fixed exponent receives finitely many contributions
because positive-root height bounds every summation index. Prove that the map
from finite Laurent polynomials is injective, multiplication by D cancels this
inverse, and N_λ/D has support ≤λ with coefficient 1 at λ. Pin the fact that
λ+ρ is strictly decreasing: for w≠1 its permuted exponent is strictly below
λ+ρ in dominance order. This supplies the leading coefficient and support
without an analytic expansion at a wall or a character-formula assumption.

**Haar norm and identification.** Expand P_λ using the preceding integral virtual
character isomorphism, `P_λ=Σ_ν a_ν χ_ν|_T`, with finitely many a_ν∈ℤ. The actual
continuous central function `F_λ=Σ_ν a_ν χ_ν` on U(n) is constructed by this finite
sum; its restriction is P_λ, and conjugacy into T determines it. This explicitly
supplies the class function needed by the Haar integral, rather than presupposing
that a rational torus expression extends continuously to U(n).

Use probability Haar measures on U(n) and T. Compare the right-trivialized
Jacobian X−Ad_t X with LieGroups Layer 6's left-trivialized Ad_(t⁻¹)X−X by the
actual translation on the target tangent space; root-plane absolute determinants
agree. Consume its regular conjugation covering, null singular locus and measure
formula to obtain

`∫_(U(n)) |F_λ|² = (1/n!)∫_T |P_λ D|²
 = (1/n!) Σ_(w,v) sgn(w)sgn(v) δ_(w·(λ+ρ),v·(λ+ρ)) = 1`.

The middle identity uses the native torus characters, their normalized Fourier
orthogonality, |t^ρ|=1, and freeness of the permutations of the strictly decreasing
λ+ρ. It remains valid at the singular torus points through the denominator-cleared
polynomial identity. Character orthogonality makes the left side Σ_ν a_ν²;
integrality implies exactly one coefficient is ±1. Its highest weight ν satisfies
ν≤λ by support, while the nonzero coefficient at λ implies λ≤ν. Antisymmetry
gives ν=λ, and the coefficient 1 fixes the positive sign. Conclude P_λ=χ_λ|_T
and hence the denominator-cleared Weyl character formula by this independent
polynomial/Haar route. Compare its result with the native formula after both
constructions; the comparison is not a premise of either proof.

**Type-A coefficient and branching applications.** In the same directed completion,
derive Kostant's weight coefficient formula and the alternating tensor coefficient
formula by multiplying D and extracting a dominant coefficient. For n>0, λ, μ
dominant and `λᵢ−λ_(i+1)>μ₁−μₙ` for every adjacent pair, prove

`V_λ ⊗ V_μ ≅ ⊕_(γ weight of V_μ) V_(λ+γ)^(⊕ mult_γ V_μ)`.

Every weight γ has μₙ≤γᵢ≤μ₁, since the highest-weight cone and Weyl invariance
put it in the permutahedron of μ; therefore λ+γ is dominant. In the alternating
coefficient formula a nonidentity permutation of λ+ρ has an inversion. If a
dominant ν and `ν+ρ=w·(λ+ρ)+γ` occurred for that permutation, the inverted gap
would exceed μ₁−μₙ, whereas the correction γ cannot remove it. Thus only the
identity contributes. Keep the precise total spread μ₁−μₙ and the strict
inequality, rather than replacing it by a bound on adjacent gaps of μ. For n=0
and n=1 the empty adjacent conditions give the direct character identities.

For n≥1 and the restriction GLₙ→GL_(n−1)×GL₁, consume ClassicalGroups' interlacing
branching contract and retain the finite-alternant proof: after tₙ=1, the
coefficient determinant has entries `[λⱼ+n−j ≥ μᵢ+n−i]` for i<n and final row
all 1. Prove its value is 1 precisely when
`λᵢ+n−i ≥ μᵢ+n−i > λ_(i+1)+n−i−1`, equivalently
λᵢ≥μᵢ≥λ_(i+1), and 0 otherwise. The extra GL₁ exponent is |λ|−|μ|. Iterating
this multiplicity-one decomposition gives the Gel'fand–Cetlin lines, canonical
up to separate nonzero scalings, their row-sum-difference weights and the
weight-multiplicity count. SchurWeyl owns the combinatorial interlacing identity,
ClassicalGroups owns the group restriction and line decomposition, and this
precursor owns their comparison with the independent character proof.

For n=0 the restriction boundary is the trivial group; there is no GL_(−1) target.
For λ=(2,1,0), the GL₂ middle rows are (1,0), (1,1), (2,0), (2,1),
with dimensions 2,1,3,2, whose sum is 8.

### Examples

The real module ℝ²⊕ℝ² splits into its two 2-dimensional summands; SU(2) weights 1 and 2 have signs −1 and +1.

### Dependencies

*Needs:* native arbitrary-field complete reducibility and duality; RootSystems Layer 4; for the compact applications, LieGroups Layers 6–7 with gap:unitary-regular-complexification and gap:torus-period-lattice, CompactGroups Layer 6 with gap:compact-frobenius-schur, ClassicalGroups Layer 3 and SchurWeyl Layer 7.

## Layer 6: the Weyl character, dimension, and Kostant formulas

Consume native `TauCeti.formalCharacter K H M`,
`formalCharacter_coeff_eq_finrank_weightSpace`, formalCharacter_tensor,
weylDenominator/weylNumerator, coweightPairing, and the Kostant partition/
multiplicity functions. formalCharacter_coeff pins the local alias to the
actual Cartan weight-space dimension. Consume `finrank_weightSpace_vermaModule`
for the Verma partition bound. The native freudenthal_multiplicity_formula
and `casimirScalar_eq_of_coeff_formalCharacter_mul_weylDenominator_ne_zero`
precede native `formalCharacter_mul_weylDenominator_eq_weylNumerator`;
this proof uses no HC or category-O linkage. Consume
`finrank_eq_prod_coweightPairing_div` and `formalCharacter_coeff_eq_kostantMultiplicity`
for the resulting dimension/multiplicity formulas. Consume native `casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector`
for the nonzero recursion denominator at actual weights μ≠λ; no claim is made
for arbitrary absent weights below λ. The orbit-sum, trace,
graded-restriction and decomposition adapters below use these actual characters.

Before Lie–Chevalley restriction, construct the finite set of **distinct** Weyl
translates `weylWeightOrbit λ` with its membership equation, and its integral group-
algebra orbit sum `weightOrbitSum λ` (each distinct weight occurs once). Define
`dominantWeightBelow base λ μ` by dominant integrality of μ and λ−μ in the nonnegative
integral span of the simple roots. Prove finite_dominantWeightBelow and
formalCharacter_eq_orbitSum_add_lower: ch L(λ)=m_λ+Σ_(μ<λ)c_μ m_μ with finite support,
c_μ∈ℕ and leading coefficient 1. This triangular expansion follows the highest-weight
cone, one-dimensional top line and Weyl invariance, independently of HC. Prove
polynomial_eq_zero_of_dominantIntegral on Mathlib's S(H): evaluation zero at every
dominant integral weight forces zero, using the fundamental-weight coordinates and
successive one-variable polynomial vanishing on ℕ in characteristic zero. These are
the explicit orbit/density precursors used by Layer 7's trace/polarization argument.

- **The representation ring and the character algebra.** `TauCeti.formalCharacter` is meant to be a ring
  homomorphism, which presupposes its domain and codomain. Consume Mathlib's
  **tensor product of Lie modules** and build the Grothendieck ring (or semiring) of finite-dimensional
  `L`-modules, and the group algebra `ℤ[X]` of the integral weight lattice with the Weyl action. These
  are the objects the three formulas are stated in.
The Layer 6 comparisons form the decomposition toolkit: complete reducibility makes
"decompose `M` into irreducibles" well-posed, and these targets package it as the callable interface a
downstream application actually invokes.

- **Highest-weight indexing of the native isotypic decomposition.** The multiplicity,
  isotypic component, their dimension identity and the Lie/`U(L)` submodule dictionary are
  native (`LieModule.isotypicMultiplicity`, `LieModule.isotypicComponent`,
  `LieModule.finrank_isotypicComponent`,
  `TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIsoAsModule`; see the supplier
  contracts) and are consumed, not rebuilt; so are the packaged highest-weight decomposition
  `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient` and the character identity
  `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul`, in
  `TauCeti/Algebra/Lie/HighestWeight/Decomposition.lean`. What is added here is the inverse
  reading: for a finite-dimensional M over the standing algebraically closed
  characteristic-zero field, the multiplicity of `L(λ)` in M is determined by
  `TauCeti.formalCharacter K H M` through triangular inversion against the orbit-sum
  expansion of this layer, so two finite-dimensional modules are equivalent exactly when
  their formal characters agree. *Needs:* the native decomposition and character identity
  above; the orbit-sum expansion and finiteness of dominant weights below λ in this layer.

  **Checks.**

  - For sl₂ and `M = V(2) ⊕ V(0) ⊕ V(0)` the multiplicities of V(2) and V(0) are 1 and 2
    and the isotypic components have dimensions 3 and 2; the formal character
    `e^2 + 3 + e^(−2)` has orbit-sum coefficients 1 and 2.
  - For M = 0 every multiplicity is 0 and the decomposition is the empty sum.
  - `V(1) ⊗ V(1)` and `V(2) ⊕ V(0)` have the same character `e^2 + 2 + e^(−2)` and are
    equivalent, while `V(1) ⊕ V(1)` has character `2e^1 + 2e^(−1)` and is not: equal
    dimension alone does not decide equivalence.
- **Tensor multiplicities and the minuscule Pieri rule.** The multiplicity `c^ν_{λμ}` of `L(ν)` in
  `L(λ) ⊗ L(μ)` (tensor products of Lie modules are Mathlib's), with the character identity
  `ch L(λ) · ch L(μ) = Σ_ν c^ν_{λμ} ch L(ν)` through formalCharacter_tensor. A dominant integral
  `μ` is **minuscule** when all weights of `L(μ)` form one Weyl orbit; the **minuscule Pieri rule**
  `minuscule_pieri` gives `L(λ) ⊗ L(μ) ≅ ⊕_τ L(λ+τ)` over the weights `τ` of `L(μ)` with `λ+τ` dominant, each with
  multiplicity one. The dominance of the target weight is essential (for `sl₂` with `λ = 0`, `μ = ω`,
  the weight `-ω` of `L(ω)` satisfies the weight condition while `L(0) ⊗ L(ω) = L(ω)`). For `gl_n`
  this specializes to the classical Pieri rules for the standard module and its dual (Layer 9).
  The type-A polynomial Littlewood–Richardson application requires the additional
  SchurWeyl gap:skew-lr-tableaux (Supplier gaps), beyond [SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk); ClassicalGroups Layer 4 identifies polynomial character coefficients
  with group tensor multiplicities. Layer 9 below compares them with gl_n Lie modules.

### 6.2 Fourier boundary values of the Weyl formula

Consume the native integral weight group algebra, denominator-cleared Weyl
formula and Kostant coefficient theorem, and ClassicalGroups Layers 3–4's
group-character comparison. First construct the following general lattice
and Fourier interfaces, independently of representations. The character
comparison then uses these interfaces; it supplies no premise for them.

For a finite-rank free lattice Λ with chosen basis, put V=Λ⊗ℝ and
T=Hom(Λ,ℝ/ℤ), identified by that basis with the native unit additive torus.
Use covolume-one measure on V and probability Haar measure on T. Define
z^b(θ)=exp(2πi⟨b,θ⟩). For a finite list A=(a_j) of nonzero lattice vectors
and a real linear functional h with h(a_j)≠0, let B index the negative
pairings, a_j^h=sign(h(a_j))a_j, and s_h=−Σ_(j∈B)a_j. Define

`P_A^h(b)=(-1)^|B| * #{n in N^m : sum_j n_j a_j^h = b-s_h}`.

This construction allows dependent, repeated and nonprimitive vectors.
Prove fibre finiteness and polynomial growth by bounding each n_j by the
positive height of b−s_h. Define the ring of coefficient functions supported
in a translate of a finitely generated h-positive lattice cone, with finite
coefficient convolutions. Map the localization of ℂ[Λ] at factors 1−z^a
with h(a)≠0 into this ring by their geometric expansions. Every rational
identity uses one h for all factors (De Concini–Procesi–Vergne,
arXiv:1012.1049v3, §3.1, pp. 19–20).

- The product of the inverse factors has coefficient function P_A^h;
  a flipped factor is −Σ_(n≥1)z^(−na), so its endpoint is open.
- Prove the unit, associativity and geometric inverse laws, compatibility
  with list permutation, repeated columns, monomial shifts and lattice
  isomorphisms, and invariance when h stays in its chamber.
- Finite Laurent polynomials embed with their actual coefficients. Equality
  in the localization implies equality of these chosen expansions.

**Checks.**

- The empty list has coefficient 1 at 0 and 0 elsewhere and product 1;
  in rank zero this is the only allowed list.
- For Λ=ℤ and A=(1), positive h gives [b≥0], negative h gives −[b<0];
  the coefficients at b=0 are 1 and 0, excluding a closed negative ray.
- A=(1,1) gives b+1 for b≥0, while A=(2) gives 1 exactly for even b≥0.
  At b=2 these are 3 and 1; deleting repeated columns or saturating the
  column lattice would change the object.

*Needs:* native group algebras, localization, finite lattice bases and finite
sums; the height bound and convolution construction in this paragraph.

Construct the Fourier map from polynomial-growth functions c:Λ→ℂ to
distributions on T, using the smooth test-density dual of
ComplexKahlerGeometry K5a, by Θ(c)(φ)=Σ_b c(b) φ̂(−b). Prove rapid decay
of smooth torus Fourier coefficients by repeated integration by parts,
with the explicit bound
`(1+4*pi^2*norm(b)^2)^N * abs(hat(phi)(b)) <= norm((1-Delta)^N phi, L1)`
for every natural N, using Euclidean coordinates from the lattice basis.
These bounds give absolute
convergence and continuity of Θ and its uniqueness from Fourier coefficients.
Construct also the tempered lattice distribution Σ_b c(b)δ_b on V;
identify its inverse Fourier transform with the periodic lift of Θ(c),
using periodization of Schwartz tests and the native negative-2π Fourier
phase (De Concini–Procesi–Vergne, v3, §1, pp. 6–7).

- Finite-support coefficients give the ordinary torus polynomial; its
  b-th native `mFourierCoeff` is c(b). Prove compatibility with lattice
  isomorphisms, monomial shifts, and multiplication by Laurent polynomials.
- For c=P_A^h and ε>0, prove absolute convergence of the Abel series
  Σ_b c(b)exp(−εh(b))z^b and identify it with the product of
  (1−exp(−εh(a_j))z^(a_j))⁻¹. Each denominator is nonzero because h(a_j)≠0.
  Prove convergence as ε decreases to zero in test duality, uniformly on
  compact sets of smooth tests, retaining the different native topology
  on tempered distributions.
- Construct wall-crossing comparisons by differences of these coefficient
  functions and their Fourier distributions. For one nonzero column a,
  the two opposite expansions differ by Σ_(n∈ℤ)z^(na), the distribution
  of probability Haar measure on the closed subgroup z^a=1. For several columns establish
  support and properness before every convolution; define the comparison
  as a difference of the separately constructed distributions even when
  their products would be undefined.

**Checks.**

- c=δ_b gives Θ(c)=z^b, so testing against z^(−b) gives 1; on the circle
  with b=1, testing against z instead gives 0, fixing the Fourier sign.
- For A=(1), at z=1 and ε=log 2 the positive Abel sum is 2 and the negative
  Abel sum (with h=−1) is −1. Their limits are distributions, not values
  obtained by substituting ε=0 into either pole.
- The difference [b≥0]−(−[b<0]) is 1 for every integer b. Its Fourier
  distribution tests to φ(0); multiplying it by 1−z gives zero. Thus a
  cleared denominator cannot determine a distribution uniquely.

*Needs:* the lattice expansions above; Mathlib `SchwartzMap`,
`TemperedDistribution`, `UnitAddTorus.mFourier`, `mFourierCoeff` and
`UnitAddTorus.mFourierBasis`; ComplexKahlerGeometry K5a test densities;
compact torus integration and integration by parts.

For any finite nonzero list A define B_A by pushing Lebesgue measure on
[0,1]^m forward under (t_j)↦Σ_j t_j a_j. When A admits a strictly positive
height, define T_A by the same pushforward from ℝ_≥0^m. Prove compact support for B_A, local finiteness and
tempered growth for T_A, and the measure identity
`T_A = sum_b P_A(b) translate_b B_A` by the half-open cube decomposition.
Construct their convolution, deletion/differentiation and lattice-difference
laws and lattice-normalized piecewise polynomial densities on their actual
span. For a regular h and an arbitrary nonzero list, prove
`B_A *_d P_A^h = (-1)^|B| T_(A^h)`; the continuous cone has no discrete
shift s_h (De Concini–Procesi–Vergne, v3, Propositions 3.2 and 3.4,
pp. 19–20).

- Scalar Fourier transforms use the negative-2π phase. The box factor is
  (1−exp(−2πi⟨a,ξ⟩))/(2πi⟨a,ξ⟩), with value 1 at zero pairing.
  The damped cone factor is (εh(a)+2πi⟨a,ξ⟩)⁻¹ for a positive list.
- Rank-deficient lists are treated on their saturated span and pushed
  forward; they are not assigned a density in the larger ambient space.
- Prove the translation cancellation between B_A and P_A^h and agreement
  with the coefficient and Abel constructions above.

**Checks.**

- A empty gives B_A=T_A=δ₀ and P_A=δ₀. A=(1) gives the unit interval
  measure and the positive-ray measure; the box transform at ξ=0 is 1.
- For A=(e₁,e₂,e₁+e₂), at (2,3) the partition count is 3 and the cone
  density is 2; at (0,0) these are 1 and 0. Counts and volumes differ.
- For A=(−1) and positive h on ℝ, P_A^h(b)=−[b>0] while T_A^h is minus
  positive-ray measure. Translating the negative unit interval by positive
  integers gives precisely that signed ray, with no continuous shift.

*Needs:* the lattice constructions above; Mathlib measures, pushforwards,
products, sums and Schwartz distributions; finite linear algebra.

Build the affine arrangement of lattice translates of hyperplanes spanned
by sublists of a spanning A, its alcoves and the polynomial pieces of these
splines. For an alcove c whose closure contains 0, define the directional
restriction at b∈Λ by evaluating the polynomial on b+c at b. Define
Todd(A)=∏_a ∂_a/(1−exp(−∂_a)) on each polynomial piece by its finite jet.
Prove translation and refinement compatibility, and distinguish piecewise
from distributional differentiation. For unimodular spanning A and c
contained in its zonotope, prove directional restriction of
Todd(A)(B_A *_d K) equals K for every K:Λ→ℂ
(De Concini–Procesi–Vergne, v3, Definitions 2.5–2.9, pp. 8–10,
Theorem 2.15 and its proof, pp. 11–14).

For that inversion construct the following solution spaces on a spanning
list A. A cocircuit is a minimal sublist Y for which A\Y does not span V.
Define D(A) as the complex polynomials killed by ∏_(a∈Y)∂_a for every
cocircuit, and DM(A) as the complex lattice functions killed by
∏_(a∈Y)(1−τ_a), where τ_a K(b)=K(b−a).

- Prove finite dimension, stability of D(A) under differentiation and of
  DM(A) under lattice translation, and the deletion maps when the remaining
  list spans. Prove that polynomial restriction maps D(A) into DM(A),
  and is an isomorphism when A is unimodular.
- For ε in an alcove c, prove the finite set (ε−Z(A))∩Λ is independent
  of ε and restriction to this set is an isomorphism from DM(A) to all
  complex-valued functions on it. Construct its delta-interpolation basis.
- For p∈D(A) prove B_A *_d (p restricted to Λ) is obtained by applying
  ∏_a(1−exp(−∂_a))/∂_a to p, with constant term 1 and finite-jet
  interpretation. The inverse is Todd(A) on D(A). These are inputs to
  inversion, not consequences assumed from it (v3, Definition 2.19,
  Lemma 2.22 and Theorems 2.23 and 2.25, pp. 12–13).

**Checks.**

- A=(1) gives constants in both spaces: ∂1=0 and (1−τ₁)1=0, but
  ∂x=1 and (1−τ₁)(b↦b)=1 exclude the linear function.
- A=(1,1) permits degree-one polynomials: ∂²x=0 and (1−τ₁)²b=0;
  x² is excluded because both second operations give 2.
- A=(2) gives constants in D(A) and two-periodic sequences in DM(A).
  The sequence (−1)^b has difference 0 under τ₂ and values −1,1
  on the interpolation window {−1,0} for ε=1/2; it is not a restricted
  constant polynomial. This excludes a restriction isomorphism without
  unimodularity.

*Needs:* the spline measures and arrangement above; native complex polynomials,
finite differences and finite lattice linear algebra.

- For arbitrary spanning positive-height A, construct the finite set of
  torus points g for which A^g={a:g^a=1} spans V. On polynomial pieces,
  define the inverse of 1−g^(−a)exp(−∂_a) when g^a≠1 by its finite jet;
  its constant term is nonzero. Prove the general reconstruction
  `P_A(b)=sum_g g^b lim_c [Todd(A^g) prod_(a notin A^g) (1-g^(-a)exp(-d_a))^(-1) T_(A^g)](b)`
  for c contained in Cone(A) with 0 in its closure (v3, Theorem 3.3,
  p. 19, using Theorem 2.29, p. 15).
- Prove compatibility with translation, lattice isomorphisms and restriction
  to the saturated span; the empty-list statement is δ₀=δ₀.
- Compare the reconstructed coefficients with the defining finite fibres,
  including boundary lattice points. Unimodularity leaves only g=1;
  nonunimodular lists retain every toric contribution.

**Checks.**

- For A=(1), c=(0,1) gives endpoint value 1 at 0, while c=(−1,0) gives
  0 and is excluded by the zonotope condition.
- For the unit-interval box, piecewise differentiation gives 0; the
  distributional derivative evaluates a test as φ(0)−φ(1), which is −1
  on a test equal to x near [0,1].
- For A=(2), toric points are 1 and −1. At b≥0 their contributions are
  1/2 and (−1)^b/2, giving 1 at b=0,2 and 0 at b=1; keeping only 1
  gives the erroneous constant 1/2.

*Needs:* the box/cone and coefficient constructions above; native polynomial,
finite-dimensional differential and difference operators, and finite lattice
linear algebra. No character formula is used in these constructions.

For each actual finite crystallographic root datum and group character
lattice X, place all monomials in ℤ[X] before localization. Prove
`wρ−ρ=−Σ_(α>0,w⁻¹α<0) α`, with the inversion convention pinned by the
specified Weyl action and base. Only wρ−ρ and w(λ+ρ)−ρ need belong to X;
ρ itself need not be a character. The normalized formula is

`ch L(λ) = [Σ_w sgn(w)e^(w(λ+ρ)−ρ)] / ∏_(α>0)(1−e^(−α))`.

Prove equality with the fixed-point rational sum
`Σ_w e^(wλ)/∏_(α>0)(1−e^(−wα))` and retain the signs and the shift produced
by every inverted denominator factor. For GL_n, compare the half-sum ρ
with the integral staircase δ=(n−1,…,0); their difference is W-fixed,
so shifted exponents agree without adjoining fractional characters. Do not
substitute an unshifted positive-root denominator into this identity.

For every covector regular on all roots apply ONE common cone expansion
to the whole rational equality. Define every polarized summand's actual
coefficient function and its Fourier boundary value and prove their finite
alternating sum equals the finite weight multiplicity function/ordinary
torus character. For a covector negative on the positive roots this is the
existing Kostant partition formula, with argument
`w(λ+ρ)−(μ+ρ)`; for another covector construct the explicit change-of-base/
wall-crossing comparison. Individual summands depend on the covector; the
sum does not. No product or cancellation of arbitrary singular distributions
is inferred from the fraction-field identity alone.

Transport to the actual compact maximal torus through its character-lattice
and normalized Haar dictionary. Prove the coefficient sign with native
`mFourierCoeff` and the Cartan angular/2π normalization. The character's
Fourier coefficients are its integral weight multiplicities. Singular torus
elements are covered by the finite polynomial equality and continuity, not
by evaluating an individual pole. Differentiate neither chamber series nor
distributional boundary values without their specified topology/support
hypotheses. The Weyl-invariant integral finite character lattice and the
triangular irreducible-character basis then give the virtual-character
expansion; [CompactGroups Layer6](../CompactGroups/README.md#layer-6-characters-of-compact-groups)'s
actual compact-group character orthogonality gives its squared group-Haar
norm. State that norm on the group, and consume
[LieGroups Layer6](../LieGroups/README.md#layer-6-maximal-tori-the-weyl-group-and-weyl-integration)'s
normalized Weyl integration theorem if rewriting it as a weighted torus norm. These inputs
are distinct from polynomiality or an unweighted torus norm.

In type A identify the positive roots ε_i−ε_j (i<j) with interval columns
in the simple-root basis: a coordinate vector (n_ij) of nonnegative integers
maps to Σ_(i<j)n_ij(ε_i−ε_j). Prove that its fibre at β is the defining
Kostant partition fibre, retaining the root lattice rather than a saturated
ambient weight lattice. Compose this equality with the directional
reconstruction above, including boundary weights and empty-root cases. Supply GL2's standard character
`t1+t2`, SU2's weights n,n−2,…,−n, and a nontrivial A2 chamber/wall example.
Compare the integer staircase, inversion-set polarization offsets and the
direction chosen to restrict piecewise polynomials as distinct operations.
This complete convention API does not identify an ambiguous source symbol
with any of those independently defined operations.

### Examples

For sl₂, V(1)⊗V(1)=V(2)⊕V(0), with dimensions 4=3+1 and multiplicities one.

### Dependencies

*Needs:* native characters, Weyl and Kostant formulas; Layers 0–5; the lattice, cone, Fourier and endpoint constructions of §6.2; ComplexKahlerGeometry K5a.

## Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The structural layer behind the character formula: the center that the Casimir of Layer 5 sits inside,
the recursion that computes multiplicities in practice, and the presentation that recovers `L` from
its root system.

- **The center `Z(U(L))` and central characters.** `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`,
  the commutative algebra in which the Casimir element of Layer 5 lives. The **central character**
  `χ_(base,λ) : Z(U(L)) →ₐ[K] K` (`centralCharacter base λ`) is read from the Verma top line.
  Consume native `TauCeti.vermaCentralCharacter base λ`, defined through the action of the
  center on the **one-dimensional top weight line** of the Verma module
  `M(λ)` (which the center preserves), so its construction depends on the Layer 3 Verma / highest-weight
  machinery. Consume native `representation_eq_vermaCentralCharacter_smul` for the action
  on any generating highest-weight line and `vermaCentralCharacter_casimirElement` for
  the Layer 5 eigenvalue `⟨λ+ρ,λ+ρ⟩−⟨ρ,ρ⟩`, retaining the chosen base.
- **The Harish-Chandra isomorphisms and their conventions.** Write `ev_λ : S(H) →ₐ[K] K`
  for `SymmetricAlgebra.lift λ`, viewing `S(H)` as polynomial functions on `H*`. The dot action is
  `w·λ = w(λ+ρ)−ρ`. Consume native `TauCeti.dotInvariants`, with its exact evaluation
  characterization `ev_(w·λ)(p)=ev_λ(p)`. Define the ordinary linear Weyl-invariant
  subalgebra `linearInvariants` by `ev_(wλ)(p)=ev_λ(p)`, with the corresponding
  membership equation and subalgebra API.

  The **raw** map `HC_dot = hcProjection : Z(U(L)) →ₐ[K] S(H)` is the restriction to the
  center of `(ε₋ ⊗ id ⊗ ε₊) ∘ PBW⁻¹`, using the ordered multiplication isomorphism
  `U(n₋) ⊗ U(H) ⊗ U(n₊) ≃ₗ[K] U(L)` of Layer 3 and `U(H) ≃ₐ[K] S(H)`.
  Consume native `TauCeti.cartanProjection`, `TauCeti.hcProjection`,
  `TauCeti.dotAction`, `TauCeti.vermaCentralCharacter`,
  `TauCeti.hcProjection_mem_dotInvariants`, `TauCeti.vermaCentralCharacter_dotAction`,
  and `TauCeti.lift_hcProjection` from
  `TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit`, with the native Weyl
  vector and action-law API; there is no translation in the raw map. Augmentations and
  triangular multiplication are supplied by its imported native enveloping-algebra modules.
  `TauCeti.hcProjection` packages its center restriction as an algebra homomorphism. Its range is exactly `S(H)^{W·}`, giving
  the normalized existence theorem `exists_harishChandraIso`, including both
  directions of PBW/degree-filtration preservation.

  Define the polynomial translation `τ_μ` by `ev_λ(τ_μ p)=ev_(λ+μ)(p)`, including its
  generator formula, composition, inverse, and degree-filtration preservation. The **linear**
  map is `HC_lin = hcProjectionLinear := τ_(−ρ) ∘ HC_dot`, so
  `HC_lin(z)(λ)=HC_dot(z)(λ−ρ)`. Translation restricts to an isomorphism from dot invariants
  to ordinary invariants; construct `harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W`.
  Use native `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n` and
  `TauCeti.SymmetricAlgebra.homogeneousSubmodule K H k`; degree≤n is their sum over k≤n.
  Export hcProjection_mem_degreeLE, hcProjectionLinear_mem_degreeLE, and
  weightTranslation_mem_degreeLE for forward filtration preservation. Prove the
  central-character equations
  `χ_λ(z)=ev_λ(HC_dot(z))=ev_(λ+ρ)(HC_lin(z))`, including compatibility with the
  independently constructed action on the Verma top line. These equations fix the shift signs.
  All central characters in this layer retain the chosen base; changing to the opposite
  Borel changes the weight labeling and the raw polynomial.
- **Lie-algebra Chevalley restriction and the filtered proof.** Construct
  `lieInvariantSymmetricAlgebra`, the subalgebra of Mathlib's `SymmetricAlgebra K L`
  killed by native `TauCeti.SymmetricAlgebra.adjointDerivation`. Consume the canonical
  Mathlib `Module.Dual` action `⁅x,φ⁆(y)=−φ(⁅x,y⁆)`, with
  `coadjointRepresentation := LieModule.toEnd K L (Module.Dual K L)`, and its
  coadjointDerivation through native `derivationOfEnd`, with the generator equation.
  Export killingSymmetricEquiv_lie for infinitesimal transport; C5.1 consumes this
  in addition to the restriction square. Under the Killing
  identifications L≃L* and H≃H*, restriction of polynomial functions is the symmetric-
  algebra map of the Killing-orthogonal projection L→H (`lieCartanRestriction`).
  Define killingDuality by Mathlib's `(killingForm K L).toDual` and
  `IsKilling.killingForm_nondegenerate`, with κ(x,y) evaluation; use native
  `SymmetricAlgebra.mapEquiv` for killingSymmetricEquiv and its actual-map equation.
  Construct `lieCartanRestriction` as the symmetric map of κ-duality followed by
  H-subtype dual restriction and `cartanEquivDual.symm`; compare its generator evaluations
  with native `TauCeti.killingExtend` (identity on H, zero on nonzero root spaces). Export
  killingSymmetricEquiv_cartan_restriction: restriction S(L*)→S(H*) along H→L
  commutes with this equivalence, `lieCartanRestriction` and Mathlib's `cartanEquivDual`.
  Pin this map on generators: identity on H and zero on every nonzero root space,
  and prove its homogeneous-degree compatibility. Own the Lie-algebraic inner-automorphism
  precursor over every algebraically closed characteristic-zero K. Consume native
  `TauCeti.expAd`, `expAd_apply_eq_sum`, `ratLieAlgebra` and `TauCeti.weylAut`
  from `TauCeti.Algebra.Lie.InnerAutomorphism` / `Sl2.Weyl.Automorphism`, including
  their finite truncation and Weyl coreflection formulas. Construct
  nilpotentInnerLieAutomorphism_symm equation exp(ad x)⁻¹=exp(ad(−x)), consuming
  Mathlib's `IsNilpotent.neg`. Define Int(L) as the subgroup
  of Mathlib's `LinearMap.GeneralLinearGroup K L` generated by the underlying linear equivalences; prove
  bracket preservation and expose its native Lie-equivalence adapter. Export
  killingSymmetricEquiv_intLieAlgebra with inverse-transpose transport and
  polynomial_evaluation_intLieAlgebra with transpose evaluation, joining the
  S(L) invariant and S(L*) density arguments. Construct
  its action on symmetric polynomials and prove infinitesimal invariants are fixed by it.
  Prove polynomial_eq_zero_of_intCartan directly by polynomial dominance. Export
  polynomialDifferential on coordinate tuples and
  polynomial_eq_zero_of_surjective_polynomialDifferential: over any characteristic-zero
  field, a polynomial vanishing on a polynomial map's image is zero if the map has a
  surjective differential at one point. Prove it by induction on derivative order at that
  image point: the chain rule and previously zero lower derivatives identify the next
  derivative with its pullback along the surjective differential; Taylor coefficients
  then determine the polynomial. Polynomial-function vanishing equals polynomial zero
  over the infinite field. Export symmetricPolynomialCoordinates_evaluation, joining
  Mathlib's `SymmetricAlgebra.equivMvPolynomial b.dualBasis` with evaluation at
  `b.equivFun x`; this is the coordinate adapter for the symmetric-algebra density
  statement. This uses no constructibility theorem.
  Construct exists_rootExponentialPolynomialParametrization: choose one generator of
  each one-dimensional root space and a basis of H, and form
  φ(t,h)=∏_α exp(t_α ad e_α)(h). Native `expAd_apply_eq_sum` gives its polynomial
  coordinates. At (0,h₀), choose all α(h₀) nonzero by avoiding finitely many hyperplanes;
  dφ has image H plus all root spaces, since its α-component is −α(h₀)t_αe_α.
  The root-space direct sum makes this differential surjective. Every image point lies
  in Int(L)·H, so the named vanishing lemma proves the needed density and injectivity.
  For the separate Cartan-conjugacy theorem, export
  polynomialMap_image_contains_principalOpen_of_jacobian_surjective for square polynomial
  maps over algebraically closed K. Use the preceding injection of coordinate rings,
  equal transcendence degrees and a finite extension of fraction fields; localize one
  nonzero target polynomial to make each source coordinate integral. Finite integral
  lying-over and the weak Nullstellensatz give a K-point over every point of that
  principal open (the finite-localization step is also the affine case of
  [Stacks, Lemma 10.122.11](https://stacks.math.columbia.edu/tag/02ML)).
  Apply this to the root-exponential maps for two Cartans, intersect
  their nonempty opens and the regular locus, and identify the centralizer of the common
  regular element with both transported Cartans. For that last step consume Mathlib's
  `LieAlgebra.IsRegular`, `isRegular_iff_coeff_polyCharpoly_rank_ne_zero`,
  `polyCharpoly_coeff_rank_ne_zero`, `isRegular_iff_finrank_engel_eq_rank` and
  `exists_isCartanSubalgebra_engel`, with the split root-space centralizer calculation.
  Cartan conjugacy is not used by the preceding Chevalley injectivity proof.
  Export weylAut_cartan_apply from native `weylAut_apply_of_lie_eq_smul`: in a root
  triple the finite product exp(ad e_α)exp(−ad f_α)exp(ad e_α) sends h to
  h−α(h)α∨. Its simple-root products give the native Weyl action and restriction
  invariance, independently of algebraic groups and compact-group C5.1.
  For surjectivity use native highest-weight classification and Layer 6: the polynomials
  `x↦tr(ρ_λ(x)^m)` of finite-dimensional highest-weight modules are invariant. Their
  restrictions are the mth power sums of weights. Construct tracePowerPolynomial
  on S(L*) with trace-of-ρ(x)^m evaluation, its Killing-transported Lie invariance and
  tracePowerPolynomial_cartan coefficient-sum formula using actual `TauCeti.formalCharacter`.
  Transport it to S(L) by `killingSymmetricEquiv.symm`, using the restriction square.
  Character/orbit-sum unitriangularity,
  finite downward dominance recursion and polarization show these span every homogeneous
  Weyl-invariant polynomial; prove the dominant-integral cone in the weight lattice is Zariski dense.
  Export span_pow_eq_homogeneous_of_polynomial_vanishing: for a polynomially dense
  subset of a finite-dimensional space over a characteristic-zero field, its nth powers
  span S^n, by degreewise perfect duality and polarization. Apply it to the dominant integral
  weights using polynomial_eq_zero_of_dominantIntegral, identifying H with H** by
  Mathlib's evaluation equivalence and transporting by `cartanEquivDual`; then Weyl-average. Export the
  actual highestWeightTracePowerRestriction and
  span_tracePowerRestriction_eq_linearInvariants_homogeneous on S(H).
  Prove `exists_lieChevalleyRestrictionIso`, identifying the forward map with
  `lieCartanRestriction` and preserving every homogeneous degree in both directions.

  The Lie-invariant subalgebra and coadjoint action are generic Lie constructions.
  PBW symmetrization and the center-symbol comparison hold for every Lie algebra over
  a characteristic-zero field, without finite-dimensionality, Killing or algebraic-closure
  assumptions; state their APIs at this generality. The HC and Lie–Chevalley isomorphisms
  for the HC comparison use algebraically closed characteristic-zero K and finite-dimensional
  Killing-semisimple L. The theorem `exists_pbwSymmetrization` itself applies to every
  Lie algebra over every characteristic-zero field: average ordered monomials
  over permutations with coefficient 1/m!, with its product formula, commutator equivariance,
  inverse and filtration API, including pbwSymmetrization_symm_mem_degreeLE. Consume native `pbwHomogeneousComponentMap`,
  `pbwAssociatedGradedEquiv` and `TauCeti.SymmetricAlgebra.gradedAlgebra` for the
  direct homogeneous grading and leading symbols. Export pbwSymmetrization_symbol
  and pbwSymmetrization_mem_center_iff. Filter the actual center by the comaps of native
  PBW steps; its associated graded is the direct sum of successive submodule quotients
  (degree 0 predecessor is⊥). The symbol and center-membership theorems identify this
  graded algebra with S(L)^L; export `centerPBWGradedInvariantIso n` on the actual
  center successive quotient and homogeneous Lie-invariant submodule, with
  its native PBW-symbol equation. Export the normalized representative multiplication
  centerPBWGradedMul and its compatibility under these isomorphisms; direct-sum
  assembly gives the graded algebra identification; centerPBWGradedMul is bilinear
  in the two native quotient modules. Symmetrization itself is linear, not multiplicative.

  After the PBW Rees construction of Layer 3, compare its first-order
  product with this characteristic-zero PBW symmetrization. Pin the lift
  of a quadratic symmetric product as
  `sym(xy)=(j(x)j(y)+j(y)j(x))/2`. In the dual-number fibre its
  transported product on linear generators is
  `x⋆y=xy+(ε/2)[x,y]`. Prove this equation and the equality of the
  antisymmetrized first-order coefficient with Layer 3's canonical
  Poisson bracket. No factor `1/2` is used in the arbitrary-ring Layer 3
  construction. This comparison follows the general symmetrization
  construction here and is not an input to it or to the earlier PBW theorem.

  Export hcProjection_pbwSymmetrization_sub_mem_degreeLE: for homogeneous invariant p of
  positive degree n, HC_dot(sym p)−lieCartanRestriction(p) lies in degree≤n−1;
  for n=0 the two are equal. Export weightTranslation_lower_degree, with the same
  degree 0 equality and positive-degree lower discrepancy for τ_μp−p, and
  weightTranslationDotLinearIso with its actual translated-map equation.
  Thus the linear projection has the same leading restriction map as the raw one.
  Prove linearInvariants_homogeneous_component using the native symmetric grading;
  ordinary invariants form a graded subalgebra, whereas dot invariants need not.
  Likewise export lieInvariantSymmetricAlgebra_homogeneous_component from native
  `adjointDerivation_mem_homogeneousSubmodule`, and cartanEquivDual_weylGroup
  from native `rootInvariantForm.isOrthogonal_reflection` and simple-coreflection
  generation, to transport polynomial restrictions between S(H*) and S(H).
  Degree induction on the linear side using graded Chevalley and these exhaustive nonnegative filtrations
  proves HC injectivity/surjectivity and exports
  harishChandraIso_symm_mem_pbwFiltration /
  harishChandraLinearIso_symm_mem_pbwFiltration for inverse filtration.
  The dependency order is native root, weight, classification and Weyl formulas, together with Layer 6 → the
  independent inner-automorphism/trace-polynomial Lie Chevalley precursor → equivariant
  PBW center symbols → HC bijectivity/inverse filtration. Compact-group C5.1 branches from the
  earlier Lie–Chevalley restriction/infinitesimal transport step and does not consume HC.
  [CharacteristicClasses C5.1](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings)
  consumes these generic Lie-algebra results, and owns compact-group invariance, its
  geometric root-data comparison, reductive central factors and real descent. The trace
  route and normalized HC agree with Etingof, Theorem 10.1 and Remark 10.2, pp. 51–52,
  Theorem 13.5 and proof, p. 69, and Theorem 14.1, pp. 70–71; see [Etingof, arXiv:2401.01446v2](https://arxiv.org/html/2401.01446v2#S10.SS1).
- **Central characters and the dot orbit.** `χ_λ = χ_μ ⟺ μ ∈ W·λ` (dot action)
  (`centralCharacter_eq_iff_dotOrbit`): two central characters coincide iff the weights lie in one dot
  orbit. Prove it from harishChandraIso (a central character is a `W·`-orbit of points of `S(H)`).
  This is the central-character / orbit theorem behind Verma-module homomorphisms. The full **linkage
  principle** of category `O` (the precise statement about composition factors of `M(λ)`, the integral
  Weyl group, and the order constraints of the block decomposition) is strictly stronger and is a
  separate development, not identified with this orbit statement.
First export linearInvariants_separate_orbits: finite distinct Weyl orbits are
separated by invariant polynomials, by interpolation on their union followed by averaging
over W. Translation gives dot-orbit separation. For dominant-integral uniqueness use the
Mathlib `RootPairing.restrictScalarsRat` and the native ordered rational chamber theorem.
Construct dominantIntegral_eq_of_dotAction_eq: the inverse rational Cartan matrix
puts dominant-integral weights in the rational root span; transport the base, ρ and Weyl
action, apply `eq_of_dotAction_eq_of_mem_dominantChamber` over ℚ, then extend scalars to K;
no ordered-field structure on algebraically closed K is used.

- **Central characters separate the dominant weights.** On dominant integral weights `λ ↦ χ_λ` is
  injective (distinct dominant weights lie in distinct dot orbits, by the orbit theorem above), and
  the center acts on the `λ`-isotypic component of any finite-dimensional module by `χ_λ`: the
  eigenspace-of-the-center refinement of the Layer 6 decomposition toolkit. A single Casimir
  eigenvalue does not separate distinct dominant weights in general; the full center does, which is
  why the separation is stated here and not in Layer 5.
- **Freudenthal's multiplicity formula.** The recursion is **anchored at the base case** `mult_λ = 1`
  (the top weight has multiplicity one); for `μ` a weight of `L(λ)`,
  `(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} · ⟨μ+jα, α⟩`
  (freudenthal_multiplicity_formula). The inner sum over `j ≥ 1` is **finite**: `μ + jα` leaves the
  (finite) weight set for large `j`, so `j` ranges over a finite set. For an actual weight `μ ≠ λ` of `L(λ)` the
  Casimir denominator `⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩` is nonzero, so the identity **solves for** `mult_μ`
  downward from `λ`, complementing the closed form of Kostant. Consume native
  freudenthal_multiplicity_formula and
  `casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector`.
  Export coeff_formalCharacter_eq_freudenthalRHS_div with the actual-weight and
  non-top hypotheses; the recursion has no nonzero-denominator claim for absent weights.
  It is a check on Kostant's formula and the route for the worked examples below.
- **Serre's relations and the split-field presentation of `L`.** Work over any
  `[Field K] [CharZero K]` with `[FiniteDimensional K L] [LieAlgebra.IsKilling K L]`,
  a Cartan `H` and `[IsTriangularizable K H L]`; the simple presentation below additionally
  assumes `[LieAlgebra.IsSimple K L]`. Mathlib's `Matrix.ToLieAlgebra K CM` is the
  quotient by the Serre relators. Consume the native
  `TauCeti/Algebra/Lie/Presentation/Serre/Killing.lean`: its
  `exists_isSerreSystem_of_base` supplies `e,f : ↥base.support → L`, the fixed simple
  coroot family `h_i=((rootSystem H).coroot i : L)`,
  `TauCeti.IsSerreSystem K base.cartanMatrix.transpose h e f`, and
  `LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f)=⊤`, without algebraic closure.
  Its root-string construction uses normalized simple-root sl₂ triples; retain the
  raising/lowering root-space and coroot normalization when exposing these data.
  `TauCeti.serreLift` sends the actual H/E/F generators to those families, and
  `serreLift_surjective` (or `exists_surjective_serreLift_of_base`) gives surjectivity.
  Own the remaining `serreLift_injective_of_base` for this actual normalized lift:
  for every such generating system in simple `L`, prove its kernel is zero. Construct
  the finite-type root-graded straightening/spanning theorem from the Serre relations:
  the simple Cartan generators together with one chosen bracket word for each root span
  the presented algebra. Show their images are the normalized coroot/root-space basis of
  `L`, using root strings, Jacobi and characteristic-zero coefficients. Their independent
  images then prove injectivity. Combine it with the supplied surjection to construct
  the presentation equivalence from that same lift, with its H/E/F value equations.
  The all-root normalization exists_chevalleySystem and serre_presentation_equiv
  are split-field contracts, independent of the HC isomorphism. Writing
  `A = base.cartanMatrix`, the native root convention is `A i j = αᵢ(hⱼ)`, whereas
  `CartanMatrix.Relations.HE` imposes `⁅Hᵢ, Eⱼ⁆ = CM i j • Eⱼ`. Hence
  `⁅hᵢ, eⱼ⁆ = αⱼ(hᵢ) • eⱼ = A j i • eⱼ`, and for distinct simple roots the higher
  relations are `ad(eᵢ)^(1 - A j i) eⱼ = 0` and `ad(fᵢ)^(1 - A j i) fⱼ = 0`.
  Check both Cartan eigenvalues and higher exponents on a nonsymmetric rank-three matrix
  (types `B₃`/`C₃`), using `base.cartanMatrix` of the concrete root system as
  the comparison, rather than the `CartanMatrix.bₙ`/`cₙ` labels. Simply-laced
  matrices do not detect the transpose.
  Simplicity keeps `base.cartanMatrix`
  indecomposable; the reducible Killing-semisimple case is the **direct sum** of the simple-ideal
  presentations, indexed and assembled componentwise. This identifies Mathlib's `Matrix.ToLieAlgebra`
  with the concrete Killing algebra; it is the Lie-algebra companion to the root-datum existence
  (`GeckConstruction`) of [../RootSystems/README.md](../RootSystems/README.md), and the input to Layer
  8's identification of the exceptional models.

### 7.1 Polynomial carriers for the headline comparisons

Over any field K, define `symmetricDegreeLE` as the sum of the native homogeneous submodules in
degrees k≤n. This is the ordinary degree filtration, including constants at n=0
(Etingof, Theorem 14.1(iv), pp. 70–71).

- Prove monotonicity and exhaustiveness and that multiplying degrees ≤m and ≤n
  gives degree ≤m+n.
- Compare it with the symmetric grading and the associated PBW filtration through
  `exists_pbwSymmetrization` and `exists_harishChandraIso`.

**Checks.**

- For a one-dimensional Cartan, degree≤0 contains 1 and excludes h.
- Degree≤1 contains 1+h and excludes h²; a homogeneous-only definition loses 1+h.
- For H=0 every degree filtration step is K, including step 0.

*Needs:* native `TauCeti.SymmetricAlgebra.homogeneousSubmodule`; the comparisons
use `exists_pbwSymmetrization` and `exists_harishChandraIso`.

For a split finite-dimensional Killing-semisimple Lie algebra over a
characteristic-zero field, define `linearInvariants` by equality of polynomial evaluations at λ and wλ.
Its carrier is a subalgebra of S(H), not a set of weights (Etingof, Theorem 10.1,
p. 51, and Remark 10.2(1), p. 52).

- Give the membership equation and closure under scalar, additive and multiplicative operations.
- Prove compatibility with each homogeneous component and transport under the Killing duality.

**Checks.**

- In A₁, 1 and h² are invariant because evaluating at t and −t gives 1 and t².
- The polynomial h is not invariant: its evaluations at 1 and −1 differ.
- The dot-invariant h²+2h is not linearly invariant: its values at 1 and −1 are 3 and −1.

*Needs:* Mathlib `SymmetricAlgebra.lift` and the Weyl group of
`LieAlgebra.IsKilling.rootSystem`; the Killing duality only for the transport.

Define `lieInvariantSymmetricAlgebra` as the subalgebra killed by every native
adjoint derivation. This definition applies to every Lie algebra over a
characteristic-zero field (Etingof, proof of Theorem 13.5, p. 69).

- Give the exact annihilation membership equation, closure under products by Leibniz,
  and compatibility with the homogeneous grading.
- Identify its underlying submodule with the native maximal trivial Lie submodule.

**Checks.**

- For abelian L every polynomial is invariant, including the degree-one generators.
- In sl₂, h is not invariant because e·h=−2e≠0.
- In sl₂, h²+4ef is invariant: e acts by −4eh+4eh=0 and f by 4fh−4hf=0.

*Needs:* native `TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation` and the
symmetric grading.

Define `lieCartanRestriction` by the symmetric-algebra map of the
Killing-orthogonal projection L→H. The Killing form is nondegenerate on both
L and H; this map needs a field, a finite-dimensional Killing-semisimple L
and a Cartan H, without algebraic closure or characteristic zero, by the native
Killing/Cartan dualities. Etingof, Remark 10.2(1), p. 52 describes the complex specialization.

- Prove that it fixes Cartan generators, kills all nonzero-root generators and
  preserves homogeneous degree.
- Prove the square with polynomial restriction on the dual spaces, then
  `exists_lieChevalleyRestrictionIso` with the same forward map.

**Checks.**

- In sl₂, h maps to h, and each of e and f maps to 0.
- The invariant h²+4ef maps to h²; a zero restriction map fails this test.
- For L=0 the map is the identity of K and sends 1 to 1.

*Needs:* Mathlib `killingForm`, `LieAlgebra.IsKilling.cartanEquivDual` and
`SymmetricAlgebra.map` for the definition; Layer 6 characters and the Layer 7
density and polarization route for `exists_lieChevalleyRestrictionIso`.

### Examples

For sl₂, the dot reflection sends t to −t−2; the raw Casimir polynomial h²+2h has equal values 3 at t=1 and t=−3.

### Dependencies

*Needs:* native root/weight theory and classification; Layer 6; native triangular PBW, symmetric grading, Killing duality and Serre lift.

## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as Serre-construction quotients.
This layer identifies concrete **split** models over every characteristic-zero field `K`,
using Layer 7's split-field presentation. For each concrete derivation or graded model,
first prove finite dimensionality, Killing-simplicity, construct its split Cartan `H`
and `[IsTriangularizable K H L]`, and compute its concrete root system/base and fixed
coroots. Give the explicit index equivalence taking `base.cartanMatrix.transpose` to
that named Serre algebra's Cartan matrix, checking the generator scalings; apply the
normalized presentation only after these model-specific inputs. The resulting map is
defined over `K`, including nonclosed fields. The formally real / compact division forms
are a **separate `K=ℝ` real-form track** and are compared with split models only after
the stated scalar extension; “formally real” is never asserted over algebraically closed `K`.

- **The split octonions `𝕆`.** Consume the actual native `TauCeti.Octonion K`
  Zorn-vector-matrix carrier, product, conjugation, norm and trace from
  `TauCeti/Algebra/Octonion/Basic.lean`. Construct the split Cayley–Dickson doubling
  comparison by an explicit `K`-linear equivalence preserving unit, product, conjugation,
  norm and trace; it is a comparison of nonassociative algebras, not an associative
  `AlgEquiv`. Preserve its native dimension and composition laws and prove the
  alternative/Moufang comparison laws on the doubling presentation. The doubling interface is transported through this comparison. The compact
  division octonions are the separate real form and are not `Der`-matched with split
  `LieAlgebra.g₂ ℝ`.
- **`G₂ = Der(𝕆)`.** The derivation algebra of the split `𝕆` is a `14`-dimensional simple Lie algebra of
  type `G₂`, with its `7`-dimensional **fundamental representation** the imaginary octonions `Im 𝕆`
  (imaginaryOctonion). Use `TauCeti.derivationLieAlgebra K (TauCeti.Octonion K)` with its native
  commutator bracket and dimension theorem; prove that it is Killing-simple of type
  `G₂`, and use the native imaginary-module irreducibility theorem; identify it with the **split**
  `LieAlgebra.g₂ K` via `derivationOctonion_equiv_g2` and the Serre presentation of Layer 7.
- **The split Albert algebra `H₃(𝕆)` and `F₄ = Der(H₃(𝕆))`.** Consume the native
  `TauCeti.AlbertAlgebra K` coordinate carrier and symmetrized product from
  `TauCeti/Algebra/AlbertAlgebra/Basic.lean`, with its actual cyclic off-diagonal layout,
  trace and trace-zero submodule. Transport the Hermitian-matrix/doubling presentation
  by an explicit product-preserving linear equivalence, using the octonion comparison;
  preserve trace and hence its kernel. Prove the Jordan and representation targets on those native interfaces;
  the dimensions 27 and 26 are the supplier theorems. Its derivation
  algebra is a 52-dimensional Killing-simple split algebra with fundamental 26-dimensional
  trace-zero representation. Construct its split Cartan and concrete root-matrix
  comparison before the identification `derivationAlbert_equiv_f4` with `LieAlgebra.f₄ K`.
  On this native split carrier build `TauCeti.AlbertAlgebra.det`, using its
  existing cyclic off-diagonal layout: for a_i=diag(i), x_i=offDiag(i),
  `det A=a0*a1*a2−a0*N(x0)−a1*N(x1)−a2*N(x2)+tr_O((x0*x1)*x2)`,
  with native `TauCeti.Octonion.norm` and `TauCeti.Octonion.trace`, following
  [Baez, *The Octonions*, §3.4, p. 32](https://arxiv.org/abs/math/0105155),
  with the cyclic coordinate formula verified against the native layout.
  Give its homogeneous cubic/polarization and scalar-extension APIs,
  and prove `A³−trace(A)*A²+s(A)*A−det(A)*1=0`,
  where `s(A)=((trace A)²−trace(A²))/2` and powers use the Jordan product.
  Pin s(A) and the characteristic identity on the native
  `[CommRing R] [Invertible (2 : R)]` carrier. For the /6 trace-power
  identity additionally assume `[Invertible (3 : R)]`.
  Prove the characteristic identity and determinant's trace/power formula
  `det(A)=((trace A)³−3*trace(A)*trace(A²)+2*trace(A³))/6`.
  This supplies the split determinant compared by the compact
  complexification below, rather than an undeclared target invariant.
  Over ℝ this native carrier remains split. The separate division-octonion
  construction below supplies the formally real compact Albert carrier.
- **The compact real algebra suppliers.** This algebraic sublane of Layer 8 is
  independent of Layers 0–7's representation/classification results and of projective
  geometry. Follow the proposed global `CayleyDickson A` and
  `_root_.Octonion R := CayleyDickson (Quaternion R)` ordered-pair convention, compared with Baez, *The Octonions*, §2.2,
  equations (2)–(3) and Propositions 4–5, pp. 8–10, by the map (a,b)↦(a,conj(b)).
  Build the unavailable doubling APIs in Tau Ceti as a distinct ordered-pair structure
  `TauCeti.CayleyDickson A` with fields `(fst,snd) : A×A`, and name the real division carrier
  `TauCeti.DivisionOctonionReal := TauCeti.CayleyDickson (Quaternion ℝ)`.
  Transport its normed additive group through the explicit equivalence to
  `WithLp 2 (A×A)`, and its module and normed-space structures through the induced additive
  equivalence. Do not abbreviate the type to a pair carrier or inherit a pointwise pair `Star`.
  Give its ordered pair-coordinate comparison and retain the proposed global
  `_root_.Octonion ℝ` naming/coordinate convention as an interoperability target. Preserve the distinct split `TauCeti.Octonion` name. For the
  division real form use pairs `(a,b) : ℍ × ℍ`, multiplication
  `(a,b)(c,d)=(ac−Star.star(d)b, da+b Star.star(c))`, positive conjugation
  `Star.star(a,b)=(Star.star(a),−b)` and `N(a,b)=‖a‖²+‖b‖²`. Define its scalar trace T(a,b)=2*re(a),
  and prove `x+Star.star x=T(x)•1`, with linearity and T(1)=2.
  Give component/extensionality and linear-coordinate APIs,
  conjugation and real scalars, the alternative laws
  `(x*x)*y=x*(x*y)` and `(y*x)*x=y*(x*x)`, the flexible/Moufang identities, multiplicative
  positive-definite quadratic norm, its polarization and `‖x‖²=N(x)`, nonzero inverse `Star.star(x)/N(x)`
  and both inverse/cancellation laws. Prove that each two-generated subalgebra is
  associative, including its closure under conjugation, and give the smooth real
  multiplication/conjugation/inverse-on-nonzero maps under the ordered eight-coordinate
  Euclidean model. Give one explicit `NonAssocRing` record: reuse exactly the
  transferred `AddCommGroup` parent and fix its unit, multiplication and casts to the
  displayed coordinate operations; prove all algebra laws for these operations.
  Install this positive conjugation as the actual `Star` operation on the distinct pair-record
  carrier; do not use an independently inferred pointwise `Star` on `ℍ × ℍ`. Prove the real
  scalar `SMulCommClass` and `IsScalarTower` laws for this multiplication, together
  with the normed real vector-space structure. Associativity, `DivisionRing` and
  `NormedRing` instances are not asserted.
  The existing `TauCeti.Octonion ℝ` Zorn algebra is **split** and is not this carrier.

**The positive division-octonion algebra and its invariant tensors.** This is a concrete
real-form construction, independent of the split `TauCeti.Octonion ℝ` carrier and of the
split Serre comparison above. On the ordered carrier `ℍ × ℍ`, use
`(a,b)(c,d)=(ac−Star.star(d)b, da+b Star.star(c))`,
`Star.star (a,b)=(Star.star(a),−b)` for the installed positive real `Star` (not a default
pointwise pair `Star`),
`N(a,b)=‖a‖²+‖b‖²`, and `T(a,b)=2 Re(a)`. Pin this exact coordinate order by a
real-linear product-preserving comparison with the chosen Cayley–Dickson convention.
The cross terms in the norm expansion cancel by cyclicity of the quaternion real trace;
the four-square norm on each quaternion factor proves positivity. Prove the alternative,
flexible and Moufang laws, two-generated associativity, conjugation closure, inverse and
cancellation laws on this particular double. No associative `Ring`, `DivisionRing`,
`NormedRing`, or associative `AlgEquiv` instance is asserted. Export the real bilinear
unit/product, trace, norm, polarization, smooth coordinate maps, and the actual
`TauCeti.derivationLieAlgebra ℝ A` carrier; do not replace it with a private derivation type.

Put `Im(A)=ker T` and `g(v,w)=−Re(vw)` there. Define
`v×w=(vw−wv)/2`, `φ(v,w,z)=g(v×w,z)`, and prove
`vw=−g(v,w)1+v×w`, positive definiteness, the norm identities, and
`u×(u×v)=g(u,v)u−g(u,u)v`, with `dim Im(A)=7`. In dimension seven, do not assert the
three-dimensional vector triple-product formula for three unrelated vectors. Define
`associator(u,v,w)=(uv)w−u(vw)` and prove the full trilinear identity with this exact
sign convention
`(u×v)×w−u×(v×w)=associator(u,v,w)+g(u,v)w−g(v,w)u`. The finite Cayley-frame table is an explicit comparison input, not a
claim deduced from dimension. For a derivation D, use the actual positive `Star.star` operation in the conjugation and involution API. First prove D(1)=0 and prove
`exp(tD)` preserves multiplication by uniqueness for the linear ODE in the associative
endomorphism algebra. Only after this integration may norm preservation be differentiated. This order supplies
both inclusions between the native derivation Lie algebra and the infinitesimal automorphisms
without presupposing norm preservation for an arbitrary Leibniz map. A trace shortcut would
need an additional trace-to-norm argument: taking traces in `[D,L_x]=L_(Dx)` gives
`tr(L_(Dx))=0`, not `tr(D L_x)=0`.

**Checks.**

- In the split Zorn algebra the idempotent with diagonal entries (1,0) and zero
  vectors is nonzero and has norm 0. In the division double the unit (1,0) has norm 1.
- For x=(i,0), y=(j,0), both (yx)x and y(xx) equal (−j,0); this tests right alternativity.
- With i=(i,0), j=(j,0) and ℓ=(0,1), (ij)ℓ=(0,k) while i(jℓ)=(0,−k).
  Thus their sum is 0, and the algebra is not associative.

**Complex scalar-extension boundary.** Compare this real algebra with the split
Zorn carrier only after explicit scalar extension to ℂ, through a complex-linear,
unital, product-preserving equivalence on the same multiplication convention. Transport
conjugation complex-linearly (it is not complex conjugation) and transport derivations by
the actual `TauCeti.derivationLieAlgebraCongr` interface. Prove the finite-dimensional
Leibniz-kernel base-change statement needed for the derivation comparison. The existing
split Serre map is only known as a surjection in its stated source; prove the required
isomorphism independently. Complexification does not identify the two real forms.

This algebra sublane is a prerequisite of the late compact `G₂` application in
LieGroups Layer 7, not a conclusion of it. In particular, the positive norm and cross
product are constructed before any compact group, root system, or representation
classification is used.
- **The formally real Albert supplier.** On the division octonions just specified,
  construct `compactAlbertAlgebra` with scalar diagonal `Fin 3 → ℝ` and cyclic
  off-diagonal `Fin 3 → TauCeti.DivisionOctonionReal` in the same Hermitian positions as native
  `TauCeti.AlbertAlgebra`. Define the Jordan product by the entrywise symmetrization
  `½(AB+BA)`, with each binary octonion product parenthesized; no associative matrix
  ring structure is used. Give `NonAssocCommRing`, `Module ℝ`,
  `SMulCommClass ℝ J J` and `IsScalarTower ℝ J J` on this carrier J.
  Give projection/extensionality, real bilinearity, unit,
  conjugation, `IsCommJordan`, power associativity and trace/trace-zero.
  Define its determinant cubic in the same cyclic layout by
  `det A=a0*a1*a2−a0*N(x0)−a1*N(x1)−a2*N(x2)+T((x0*x1)*x2)`.
  Prove its characteristic and trace-power identities as for the split
  carrier, and give the trace/determinant polarization APIs.
  Prove dimensions 27/26, the positive-definite
  trace form `trace(A∘B)`, formal reality `Σ A_i²=0 → ∀i,A_i=0`, the diagonal
  orthogonal idempotent frame, Peirce decomposition and products, the cubic
  characteristic identity, associativity of the trace form
  `trace((A∘B)∘C)=trace(A∘(B∘C))`, and intrinsic real spectral
  decomposition into orthogonal primitive Jordan idempotents. Prove
  primitive idempotents are exactly the trace-one idempotents, and any
  complete orthogonal primitive frame summing to1 has exactly three
  elements. Prove that
  commutators `[L_A,L_B]` are derivations skew-adjoint for the trace form.
  This algebraic decomposition does not assert automorphism transitivity
  on frames: that geometric theorem belongs to TangentialBordism B3. Supply the fixed 27-coordinate Euclidean topology and smooth
  product/trace/determinant maps, automorphism preservation of trace and the trace
  form, and its native derivation Lie algebra with bracket and trace-zero
  representation. These generic algebra APIs precede classification. The
  complexification/type identification follows this algebraic sublane and
  Layer7's split-F4 theorem. Construct the real tensor products
  `ℂ ⊗[ℝ] TauCeti.DivisionOctonionReal` and
  `ℂ ⊗[ℝ] compactAlbertAlgebra`. The complex-linear extension of positive real
  conjugation sends `z⊗x` to `z⊗Star.star x`, fixing the complex coefficient;
  this is distinct from tensor `Star.star`, which conjugates the coefficient.
  Consume native
  `Algebra.TensorProduct.instNonAssocRing` and
  `instNonUnitalNonAssocSemiring`, `tmul_mul_tmul`,
  `isScalarTower_right` and `sMulCommClass_right` for their existing
  nonassociative products, units and complex-bilinear interfaces:
  `(z⊗a)(w⊗b)=zw⊗(ab)`. No second multiplication instance is introduced.
  Construct the quadratic form via native `QuadraticForm.baseChange`,
  the trace by linear extension, and define the complexified cubic by
  `((trace A)³−3*trace(A)*trace(A²)+2*trace(A³))/6` on the native
  tensor-product Jordan algebra. Prove its scalar-extension and polarized
  comparisons; no undeclared cubic-form base-change API is presumed.
  Extend octonion conjugation complex-linearly on `ℂ ⊗[ℝ] A`: on a pure tensor the map is `z ⊗ x ↦ z ⊗ Star.star x`, so it fixes the complex coefficient. This is not the default tensor-product `Star.star`, which conjugates that coefficient, and it is not scalar complex conjugation. Construct
  `divisionOctonionComplexificationIso` and
  `compactAlbertComplexificationIso` as complex-linear, unital,
  product-preserving equivalences to native `TauCeti.Octonion ℂ` and
  `TauCeti.AlbertAlgebra ℂ`, preserving the norm/involution and
  trace/determinant respectively. No associative `Algebra`/`AlgEquiv`
  instance is presumed for these nonassociative products.
  Export `compactAlbertDerivationBaseChange`: the complexification of
  `TauCeti.derivationLieAlgebra ℝ compactAlbertAlgebra` is the actual
  derivation Lie algebra of the complexified product. Prove this using
  finite-dimensional Leibniz-equation kernels and flat scalar extension,
  including bracket preservation. Consume native
  `TauCeti.derivationLieAlgebraCongr` on the preceding multiplicative
  linear equivalence, then Layer7/8's split Albert identification, to
  export `compactAlbertDerivation_complexification` with the split
  type-F4 complex Lie algebra. Derive
  `compactAlbertDerivation_finrank = 52` and zero real centre by faithful
  complexification. Export `compactAlbertDerivation_skewAdjoint` for
  every derivation, not just inner commutators: prove
  `trace(L_A)=9 trace(A)` and `[D,L_A]=L_(D A)`; matrix commutator trace
  gives trace(D A)=0, and Leibniz plus the associative trace form gives
  skew-adjointness. Export `compactAlbertDerivation_killing_negDef`:
  restrict the positive Hilbert–Schmidt form from the orthogonal
  endomorphisms to the derivation algebra, prove ad(D) skew-adjoint,
  and use zero centre to get `Killing(D,D)=−‖ad(D)‖²<0` for D≠0.
  These named algebraic results give the compact real type-F4 Lie algebra
  without any projective transitivity or an undefined complex F4 group.
  Do not identify the split and division real forms.
  The fixed-carrier trace-one-idempotent geometry,
  its compact automorphism group and F4/Spin9 projective-plane comparison belong to
  [TangentialBordism B3](../../TangentialBordism/README.md#b3-low-groups-and-specified-geometric-examples).

  **Checks.**

  - The diagonal element diag(1,2,3) with zero off-diagonal entries has
    determinant 6 and trace 6, and its square has trace 14.
  - With diagonal (3,1,1), off-diagonal x₁=1 and x₀=x₂=0 in the cyclic layout,
    the determinant is 3·1·1 − 1·N(1) = 2; omitting the norm terms gives 3.
  - `trace(A∘A) = Σ a_i² + 2 Σ N(x_i)`. On the compact carrier this vanishes only
    at A=0. On the split carrier the element with zero diagonal and x₀ the
    nonzero Zorn idempotent of norm 0 gives trace(A∘A)=0 with A≠0, so positive
    definiteness and formal reality need the division octonions.
  - Under the complex-linear extension of conjugation, `i⊗1` is fixed, whereas
    the tensor-product `Star.star` sends it to `−i⊗1`.

  *Needs:* the division octonions above; native `TauCeti.AlbertAlgebra` layout,
  `TauCeti.derivationLieAlgebra` and `TauCeti.derivationLieAlgebraCongr`;
  Mathlib `Algebra.TensorProduct` and `QuadraticForm.baseChange`; Layer 7's
  split F4 identification for `compactAlbertDerivation_complexification`.
- **The `E`-series `E₆, E₇, E₈`, as explicit constructions.** Two different constructions produce these,
  and the roadmap keeps them apart rather than conflating them:
    - **The Vinberg `ℤ/3`-model of split `E₈`.** `𝔢₈ = 𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*` of dimension
      `248 = 80 + 84 + 84` (consume `LieAlgebra.SpecialLinear.sl (Fin 9) K`, `exteriorPower`,
      `⋀[K]^3 (Fin 9 → K)`), a `ℤ/3`-graded Lie algebra whose bracket pairs the exterior summands into
      `𝔰𝔩₉`. This is one concrete construction of split `E₈`; it is **not** the Freudenthal-Tits magic
      square built from a pair of composition algebras.
    - **`E₆` and `E₇` as their own carriers.** `E₆` (dimension `78`, with its `27`-dimensional
      representation `J`) and `E₇` (dimension `133`, with its `56`-dimensional representation from the
      Freudenthal triple system on `J`) each need an **explicit carrier and bracket**, not merely a
      dimension count, either from the magic square uniformly or from their own graded models; they are
      not "rows" of the `sl₉ ⊕ Λ³ ⊕ Λ³*` model.
      For the `E₇` 56-dimensional representation, consume the native integral `TauCeti.E7Minuscule` weight table,
      `cartanMatrix`, `raisingMatrix`, `loweringMatrix`, `isSerreSystem` and
      `serreRepresentation` in `TauCeti/Algebra/Lie/E7/Minuscule/Basic.lean`. After
      entrywise `ℤ→K` scalar extension and the explicit Cartan-index comparison, prove
      that the Freudenthal model's generator action is intertwined with this actual
      native 56-dimensional representation. The invariant symplectic/quartic-form
      comparisons and the 133-dimensional algebra/bracket identification remain
      concrete targets here; the native matrix representation alone does not supply them.
  Build each, prove its dimension and Killing-simplicity of the stated type, and identify it with the
  split `LieAlgebra.e₆`, `e₇`, `e₈ K` via Layer 7. The **fundamental representations** `27` for `E₆`,
  `56` for `E₇`, and the adjoint `248` for `E₈` are the smallest nontrivial ones.
  Their algebra-dimension headlines are `finrank_e6_e7` and `finrank_e8`.

### Examples

The native dimensions are 8, 8+3+3=14, 3+3·8=27 and 26; the E8 model has 80+84+84=248 dimensions.

### Dependencies

*Needs:* native split octonion and Albert products; Layer 7 for split-type identification; quaternion algebra for the independent compact real track.

## Layer 9: reductive Lie algebras and `gl_n`

The layers above fix a Killing-semisimple `L`. `gl_n` is **reductive, not semisimple**: its Killing
form is degenerate and its centre is the scalar matrices, so none of the `IsKilling` machinery
applies to it directly. This layer supplies the Lie-algebra-level `gl_n` theory.
For its polynomial comparison consume the concrete Schur modules of
[ClassicalGroups Layers 2–4](../ClassicalGroups/README.md), their group-level irreducibility,
highest weights and Schur characters, and the actual group actions on those modules.
The comparison here constructs differentiation, stable-subspace and intertwiner
dictionaries; it uses the native Lie classification and the specified concrete
ClassicalGroups modules, not an asserted independent transvection classification. This layer is that theory, under the
conventions of the reductive standing-conventions bullet (Mathlib's `HasCentralRadical` as the
unbundled reductivity hypothesis, the trace form as the invariant form, the matrix-unit positive
system). It is independent of Layer 8.

- **Reconstruction for reductive irreducibles.** Over an algebraically closed
  characteristic-zero field, reconstruct an irreducible module from an irreducible
  module of the semisimple derived ideal and a functional on the center, and prove
  uniqueness up to module equivalence. The functional has no integrality condition.
  Prove complete reducibility of a finite-dimensional reductive module when every
  central element acts semisimply. A nilpotent two-by-two Jordan block for the
  abelian Lie algebra K has an invariant kernel without an invariant complement,
  so the central semisimplicity hypothesis cannot be omitted.

  *Needs:* native reductive center/derived splitting and irreducible restriction;
  native arbitrary-field complete reducibility; the scalar-extension and central-weight APIs.

- **The diagonal Cartan and `gl_n` weights.** `diagonalCartan n`, a Cartan subalgebra of `gl_n`;
  weights are `n`-tuples via `μ ↦ (A ↦ Σᵢ μᵢ Aᵢᵢ)` (glWeightEquiv); **dominance is a condition on
  differences** (`TauCeti.IsGlDominantIntegral`: consecutive differences in `ℕ`, entries free in `K`), and a
  **highest weight vector** is a simultaneous eigenvector of the diagonal killed by the strict upper
  triangle (`TauCeti.IsGlHighestWeightVector`). The staircase `ν = (N - 1/2, …, 1/2)` is dominant with no
  integer entry.
- **The `gl_n` Pieri rule and the single-weight criterion.** The **dual-standard Pieri rule**
  `gl_dual_standard_pieri`, with formula `V* ⊗ L(μ) ≅ ⊕_t L(μ - ε_t)` over the `t` with `μ - ε_t` dominant, multiplicity one (the standard
  module is Mathlib's `Fin n → K` instance, `ε_t = Pi.single t 1`; the `V ⊗ L(μ)` mirror is not
  separately pinned), and the **single-weight isotypic criterion** at the `gl` level: a nontrivial
  finite-dimensional module, with `n > 0` and semisimple action of the identity matrix, all of whose
  highest weight vectors have weight `μ` is a direct sum of copies of one irreducible with highest
  weight `μ`. The identity spans the centre of `gl_n`, so its semisimplicity gives semisimple
  action of every central element. Apply this layer's reductive_complete_reducibility, then
  existence of a highest weight vector in each simple summand and uniqueness of the irreducible
  of highest weight `μ`. The central hypothesis is essential: for `gl₁`, a nonzero nilpotent
  two-by-two Jordan block has only highest weight `0` but has no invariant complement to its kernel.
- **The dictionary to the group level.** The `DominantWeight n` of
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) (weakly decreasing integer tuples)
  sits inside `TauCeti.IsGlDominantIntegral` as the integer-coordinate weights. Changing
  such a tuple by `m · (1, …, 1)`, `m∈ℤ`, is the visible determinant twist.
  The Lie condition also permits shifts by arbitrary `c∈K`; such weights need
  not integrate to rational group representations.
  Over ℂ, build the differentiation bridge for the concrete polynomial Schur GL_n modules
  supplied by ClassicalGroups Layers 2–4, using their irreducibility, highest weights and
  characters rather than the full abstract group classification. State the native `TauCeti.IsRationalRep` and `TauCeti.IsPolynomialRep`
  hypotheses explicitly. Differentiate those
  coefficients to a gl_n action and prove preservation of tensor products and
  intertwiners. Prove that every gl_n-stable subspace of a rational GL_n-module
  is GL_n-stable, using connectedness of GL_n and integration of its infinitesimal
  action; include the connectedness/integration lemmas as targets of this bridge.
  Prove that the group character `t ↦ ∏ t_i^λ_i` differentiates to the
  diagonalCartan functional `diag(a) ↦ Σ λ_i a_i`, and that group highest-weight
  vectors satisfy the corresponding Lie highest-weight conditions. Then identify the differentiated
  shape-λ Schur module with `glIrreducible n λ` by its highest weight and irreducibility.
  For λ, μ with at most n rows, identify the multiplicity of `glIrreducible n ν` in their
  tensor product with the actual finite tableau count
  `Nat.card (LRTableau λ ν μ)` for every ν with at most n rows, where `LRTableau λ ν μ`
  and the identity `s_λ s_μ = ∑_ν Nat.card (LRTableau λ ν μ) s_ν` are the content of
  SchurWeyl gap:skew-lr-tableaux (Supplier gaps), extending
  [SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk). This count is not defined to be a
  tensor multiplicity or an unspecified Schur structure constant. Use the Schur-character
  identity and basis independence to identify the group coefficients, then the owned
  differentiation/intertwiner comparison to identify the Lie coefficients. Prove zero
  count when λ is not contained in ν or sizes do not add; restrict the sum to
  |ν|=|λ|+|μ| and at most n rows, with taller Schur shapes vanishing in n variables.
  Retain the central identity-matrix weight |ν|=|λ|+|μ|. Verify the empty shapes and
  n=0 empty alphabet separately; for n=1 the `(1,1)` term of
  `s_(1)^2=s_(2)+s_(1,1)` vanishes. The generic tableau/count/product theorem has
  one owner, SchurWeyl; this layer owns its application to the actual Lie modules.

**Checks.**

- For λ=μ=(1), the LR counts of ν=(2) and ν=(1,1) are both 1; in two
  variables (x+y)²=(x²+xy+y²)+xy.
- In one variable the taller shape has Schur polynomial 0, so the same identity
  becomes x²=x²+0. Dropping taller shapes from the count rather than the evaluation is wrong.
- For empty λ the unique tableau has shape ν and content μ only when ν=μ;
  a failed containment or size sum has count 0.

*Needs:* SchurWeyl gap:skew-lr-tableaux;
ClassicalGroups Layers 2–4; the differentiation and intertwiner comparisons of Layer 9.

### 9.2 Reductive enveloping centers and the actual invariant maps

Work first over a characteristic-zero field K with a finite-dimensional reductive
Lie algebra L, using this layer's actual central/derived splitting
`e:L≃ₗ⁅K⁆z(L)×[L,L]`. The center factor is abelian. The map `productEnveloping` uses native
`TauCeti.UniversalEnvelopingAlgebra.mapEquiv`, `prodEquivTensor` and
`symmetricAlgebraEquiv`; do not reconstruct their generic engines. Compose them
to construct the actual algebra equivalence
`U(L)≃Sym(z(L))⊗U([L,L])`. On a generator, its value is
`ι_z(pr_z x)⊗1+1⊗ι_der(pr_der x)`, and the inverse multiplies the two
inclusions. Export these equations, factor inclusions, inverse equations,
naturality for splitting-preserving Lie maps, and forward/inverse PBW filtration
compatibility with the total tensor filtration. The construction of this algebra
equivalence uses universal properties and does not assume the HC theorem.

Restrict this actual map to the center. Consume Mathlib's
`Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct`, the
commutativity of the symmetric factor and tensor injectivity over K. Prove that
`id⊗center.val` is injective and that its range is exactly the tensor algebra's
center: commute with the right-factor generators to obtain central coefficients
in a basis of the left factor; the left factor already commutes with everything.
Prove `exists_productCenterEquiv` on an abelian direct-product factor; transport it
through the specified splitting to obtain `Z(U(L))≃Sym(z(L))⊗Z(U([L,L]))` with its inclusion square and pure-tensor formula,
not just an equality of dimensions or a linear bijection. This center-factor
argument also applies to an explicitly supplied product with any abelian factor;
it uses no classification or algebraic closure. The reductive decomposition
itself has the finite-dimensional characteristic-zero hypotheses of this layer.
For the zero Lie algebra both enveloping and symmetric algebras are K and these
maps are the scalar/unit identifications.

For the HC and Chevalley refinements now assume K algebraically closed, retain
a chosen Cartan H_s and positive base for the semisimple derived algebra, and
put `H=z(L)×H_s` through the specified splitting. The Weyl group fixes z(L).
Tensor the derived algebra's Layer7 **raw** HC map with the identity on
`Sym(z(L))`. Its PBW projection is zero on the two nilradicals and identity on
the whole H, including its center. Extend rho by zero on z(L); its translation
has no central shift. Export the full reductive raw/dot and translated/ordinary
algebra isomorphisms, both filtration directions, central-character evaluations
and their diagrams with the tensor center map. The derived HC theorem, not an
application of `IsKilling` to L, is the input. Keep the central weight functional
arbitrary at the Lie-algebra level. Tensor the independent Layer7 Lie–Chevalley
restriction with the central symmetric algebra and prove the actual restriction
square and degreewise compatibility; invariants of this fixed central factor are
all its polynomials. Finite bases degree by degree justify passage through the
invariant subspaces, not an unproved invariants/base-change assertion.

**Connected groups and the three different center comparisons.** For a smooth
connected affine reductive algebraic group G over algebraically closed
characteristic-zero K, construct its actual adjoint actions on L, its symmetric
algebra and U(L), using the induced enveloping maps and native PBW functoriality.
Each symmetric degree and each PBW step is a finite-dimensional rational
G-module. Own the finite-dimensional rational comparison at this cut: a vector
is G-fixed iff its differential is zero. Prove it from the closed stabilizer,
its tangent/kernel comparison and the characteristic-zero Cartier smoothness
comparison explicitly constructed in [ReductiveGroups Layer5P](../../ReductiveGroups/README.md#layer-5p-the-shared-polynomial-unipotent-exponential-and-logarithm), using its coordinate-Hopf/invariant-derivation argument
and Layer2 tangent smoothness criteria. Only that generic closed-subgroup
smoothness cut is consumed, not the unipotent functions or later Bruhat
application. Equality of Lie algebras plus connectedness gives the whole G.
State the corresponding complex analytic version using LieGroups Layers2–4's
closed-subgroup/automatic-smoothness and connected exponential generation.
These constructions include the actual action on each finite piece and its
compatibility with the inclusions. In characteristic p a weight-p character of
G_m has zero differential and is not trivial; for disconnected groups the
component action also remains. Neither case is covered by this equality.

Apply that comparison to obtain `U(L)^G=Z(U(L))` by commuting with every canonical
Lie generator, and `Sym(L)^G=Sym(L)^L`. Separate the following maps:

- Layer7 equivariant PBW symmetrization restricts to a **linear** equivalence
  between invariant symmetric tensors and the center, with all product words
  averaged by `1/m!`; it is not asserted multiplicative on invariant tensors.
- Its leading symbols give the canonical graded-algebra identification
  `gr Z(U(L))≃Sym(L)^G`, with the actual center filtration and symbol equations.
- The chosen reductive HC isomorphism followed by inverse actual Chevalley
  restriction gives an algebra isomorphism from the center to invariant
  polynomials. Its Cartan/positive-base and rho translation conventions are
  retained; it is not relabeled as ordinary symmetrization or as an unspecified
  canonical equality. No Duflo construction is required as a premise.

[CharacteristicClasses C5.1](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings) remains the owner of the compact real-group
infinitesimal-invariant comparison, geometric Cartan/root transport and real
coefficient descent. Use that contract when specializing this diagram to compact
real forms; do not add another compact Chevalley or Chern–Weil engine here.
The connected algebraic PBW-piece comparison above has no compact form, C5
cohomology, Borel–Weil, affine oper or invariant-evaluation theorem as a premise.

### 9.3 The normalized product map

Define `productEnveloping` by composing the native enveloping-product equivalence
with the inverse abelian enveloping comparison. Its coefficients form an arbitrary
field and the first Lie factor is abelian; neither finite dimensionality nor
algebraic closure is required. Prove `exists_productCenterEquiv` with its inclusion
square (Dixmier, *Enveloping Algebras*, §1.6, for the reductive specialization).

- Prove the generator equation (z,s)↦z⊗1+1⊗s and the inverse product formula.
- Preserve units and algebra operations, and prove naturality for maps of each factor.
- Identify the center through the actual tensor inclusion, retaining the order of factors.

**Checks.**

- For Z=S=0 the map is K≃K⊗K, and 1 maps to 1⊗1.
- For Z=K abelian and S=0, the degree-one generator maps to t⊗1, not 0.
- For Z=K and S=sl₂, a scalar-direction generator maps to t⊗1 and the quadratic
  Casimir from S maps to 1⊗C; the center is K[t]⊗K[C].

*Needs:* native product, abelian and functorial enveloping equivalences;
Mathlib tensor injectivity over a field and the include-right centralizer theorem.

**Matrices and trace duality.** Specialize to `gl_n(K)=Matrix (Fin n) (Fin n) K`.
Consume native center/derived theorems in `GeneralLinear.Basic` and
`TauCeti.traceBilinForm`, its nondegeneracy and Lie invariance in
`GeneralLinear.TraceForm`. The actual invariant pairing is
`B(A,B)=tr(AB)`, with dual matrix units E_ij and E_ji. Construct the
finite-dimensional equivalence `A↦(B↦tr(AB))` and its inverse, prove conjugation/
coadjoint equivariance, and transport the symmetric-algebra restriction square.
Polynomial functions on L* are `Sym(L)` through evaluation into the double dual;
polynomial functions on L are `Sym(L*)`. These are different carriers until the
specified trace equivalence relates them. Do not use the degenerate gl_n Killing
form for this identification.

For n>0 the scalar coordinate is `c(A)=tr(A)/n`, the scalar projection is
`c(A)I`, and the derived projection is `A−c(A)I`. Prove both composite identities,
bracket preservation and trace zero using invertibility of n. Thus
`Z(U(gl_n))≃K[t]⊗Z(U(sl_n))`, where the central variable maps to `ι(I)`.
Under trace duality the symbol of `ι(I)` is the function `A↦tr(A)=σ₁(A)`,
whereas the coefficient of I in the central projection is `tr(A)/n`. Export
this factor-n comparison instead of conflating the two coordinates.
For general characteristic the splitting requires n invertible; when p divides
n the identity is trace-zero and this decomposition cannot be imported. The
HC conclusions here continue to require characteristic zero. For n=0 the matrix
Lie algebra, center and derived algebra are zero, so its center is K with no
central polynomial variable. For n=1 the derived algebra is zero and the center
is K[t]. Prove these maps separately rather than dividing by zero or invoking
nonzero semisimple rank.

Over algebraically closed characteristic-zero K, construct restriction of the
actual conjugation-invariant polynomial functions to diagonal matrices. For
n≥2 the nonzero discriminant locus is a dense open of diagonalizable matrices,
so restriction is injective. Permutation conjugation makes its image symmetric;
the elementary characteristic coefficients supply the inverse by the fundamental
symmetric-polynomial theorem. Treat n=0 and1 directly. Export the full algebra
maps, their generator evaluations, both inverse identities and homogeneous
filtrations: gl_n has generators of degrees1,…,n, whereas sl_n has trace zero
and generators of degrees2,…,n. Compose these actual maps with the reductive HC
and trace squares. The three comparisons are respectively linear, graded algebraic and filtered
algebraic (Etingof, arXiv:2401.01446v2, Theorem 13.5 and its proof, p. 69;
Theorem 14.1(iv)–(v), pp. 70–71; Example 10.3, pp. 52–53).

`productEnveloping` fixes the native product map; `exists_productCenterEquiv`
states the center equivalence with its inclusion square.

---

### Examples

For gl₂ at μ=(3/2,1/2), the trace Casimir scalar is 15/4−1/4=7/2; at μ=0 only the dual-standard dominant summand survives.

### Dependencies

*Needs:* native reductive splitting and general-linear modules; Layers 6–7; ReductiveGroups Layers 2 and 5P; SchurWeyl gap:skew-lr-tableaux.

## Layer 10: affine Weyl geometry and the compact coweight quotient

This layer consumes the finite root geometry and classification of
[RootSystems](../RootSystems/README.md), and the integral weight lattice and Weyl action constructed
on the native integral-weight carrier. It builds the coweight and coroot lattice comparison from
those actual carriers. It does not consume a compact Lie group, a compact torus, or a period
theorem outside §10.2, whose compact-center application consumes
[LieGroups](../LieGroups/README.md) Layers 4 and 6 and gap:torus-period-lattice.

Write P for the native `TauCeti.integralWeightLattice H`, a ℤ-submodule
of `Module.Dual K H`, with the Weyl action; do not use the ambient `K`-dual as though every
element were integral. Construct the based root-datum comparison from this `P` to the actual
character lattice, preserving roots, coroot pairings, and the Weyl action. For the simply connected
finite-type datum this identifies `P` with its character lattice `X_sc`. For another semisimple
isogeny form retain its actual intermediate lattice `Q ⊆ X ⊆ P`; do not assert `X ≃ P` (for example,
adjoint type A₁ has `X=2ℤω`). This layer constructs the based-datum comparison, distinct from the native
lattice construction and from a compact character-lattice comparison; it cannot
be inferred from the type classification alone.

For the affine construction retain an actual integral root datum `D : RootDatum ι X Y` with
`Module.Finite ℤ X`, `Module.Free ℤ X`, and the corresponding properties on `Y`. Form its rational
scalar extension on `ℚ ⊗[ℤ] X` and `ℚ ⊗[ℤ] Y`, carrying each actual indexed root and coroot
by `x ↦ 1⊗x`. Native `TensorProduct.leftModule` supplies the extension-scalar actions.
The tensor flip compares this with the right-factor models `X ⊗[ℤ] ℚ` and `Y ⊗[ℤ] ℚ`;
transport the scalar actions along that flip when using those models. Prove the induced rational pairing is perfect, crystallographic, reduced, irreducible, and
spans both rational spaces. Root-system irreducibility and spanning are hypotheses on this rational
pairing: the integral `IsRootSystem`/`IsIrreducible` mixins are too strong for a non-unimodular root
datum and do not express the intended semisimple condition. Keep the integral root datum, its maps,
and its actual lattice data as the source of the construction. Carry finite-free hypotheses on both lattices and finite root indices
explicitly in every rationalization and affine-construction theorem.
Use the actual finite root index set of the datum (for the native `DynkinType` datum, `Fin t.numRoots`, not `Fin t.rank`).

For a finite irreducible reduced crystallographic rationalized root system with chosen base `Δ`,
take the root lattice `Q = ℤΦ` inside the actual integral character lattice `X` and define the
coweight lattice as `P∨ = Hom_ℤ(Q, ℤ)`. Use the original integral root–coroot pairing to embed the
actual coroot lattice `Q∨ = ℤΦ∨` in `P∨`; prove this embedding is injective and that `P∨/Q∨` is
finite from rational spanning and the finite-free lattice comparison. The real affine space is
`V = Hom_ℤ(Q, ℝ)`, with the explicit comparison from `ℝ ⊗[ℤ] Hom_ℤ(Q,ℤ)`
given by `a⊗f ↦ (q ↦ a*(f(q):ℝ))`. Construct its inverse from a finite integral basis
of the actual root lattice and compare the right-factor model by the tensor flip. The long-root convention is
the one determined by the rationalized root datum's Cartan integers and its finite-type
symmetrizer, transported from `DynkinType.IsLongSimpleRoot` along Weyl orbits; build the unique
highest long positive root `θ` from the chosen positive system, including its coefficients in `Δ`.

Set the open fundamental alcove to

`A = {x ∈ V | αᵢ(x) > 0 for every αᵢ ∈ Δ, and θ(x) < 1}`.

Its affine walls have functions `αᵢ` and `α₀ = 1 − θ`. Build the affine reflections and prove that
the affine Weyl group `W_aff = Q∨ ⋊ W` acts simply transitively on alcoves. Build the extended
affine Weyl group `W_ext = P∨ ⋊ W`, with its actual action on `V`, and define `Ω = Stab_{W_ext}(A)`.
Prove the quotient map gives an isomorphism `Ω ≃ P∨/Q∨`, construct a representative in `Ω` for each
coweight class, and prove the induced action on the affine simple walls preserves their Cartan
integers. This is the length-zero subgroup and its action, not an assertion that every element of
`W_ext` stabilizes `A`.

**Checks.**

- For A₁ in the coordinate α(x), the closed alcove is [0,1]. The affine reflection
  at 0 fixes 0, so that endpoint has stabilizer of order 2, while 1/3 has trivial stabilizer.
- The affine orbit of 2/3 has the single representative 2/3 in [0,1], whereas the
  extended translation lattice identifies 2/3 with 1/3 through x↦1−x.
- In rank 0 the space and its orbit quotient are a point, the Weyl group is trivial,
  and both lattice quotients are 0.

**Closed alcoves and point orbits.** On this same affine space and action,
construct the closed alcove
`Abar={x : αᵢ(x)≥0 for all i, θ(x)≤1}` and prove it is the topological
closure of A. Prove local finiteness of the affine root hyperplanes,
covering by the translates of Abar, and the boundary-face comparison of
adjacent alcoves. Use these actual wall reflections and finite galleries to
prove that every W_aff-orbit of points meets Abar in exactly one point.
Simple transitivity on open alcoves alone does not give this boundary
statement. For x∈Abar, prove its W_aff-stabilizer is exactly the finite
subgroup generated by the affine simple-wall reflections whose walls
contain x; construct its root/parabolic description and the conjugation
comparison for points in other closed alcoves. Give face intersections and
stabilizers, including vertices and intersections of several walls. Prove
properness of the lattice/finite-W action and Hausdorffness of its orbit
quotient, and construct the homeomorphism `Abar≃V/W_aff` induced by the
actual inclusion and quotient maps. For reducible semisimple data take the
product of these closed alcoves and wall systems; rank zero is a point.

For every specified W-stable intermediate lattice `Q∨⊆Y⊆P∨`, restrict the
same action to `W_Y=Y⋊W`. Construct
`Ω_Y=Stab_(W_Y)(A)`, its inclusion in Ω and its isomorphism with Y/Q∨,
and prove `W_Y=W_aff⋊Ω_Y` through actual multiplication and inverse maps.
The Ω_Y action preserves Abar. Prove that two points of Abar are
W_Y-related exactly when they are Ω_Y-related, and construct the
homeomorphism `Abar/Ω_Y≃V/W_Y`. At x∈Abar identify its full stabilizer
with `Stab_(W_aff)(x)⋊Stab_(Ω_Y)(x)` under those same maps. Thus the
closed alcove itself gives unique representatives for Q∨⋊W orbits;
other lattices retain the displayed finite identifications. These are
further theorems about this layer's affine engine, independent of compact
Lie groups and their period calculation.


Let `Γ_root` be the automorphism group of the finite based root system: it preserves `Δ`, the root
lengths, and every oriented Cartan integer, without imposing a choice of isogeny lattice. Extend each
element to the affine node by fixing `0`. Prove the conjugation action of `Γ_root` on `Ω`, and
construct the concrete isomorphism

`Ω ⋊ Γ_root ≃ Aut(affine Cartan matrix)`.

Here an affine Cartan automorphism is a permutation of the finite simple nodes together with node
`0` that preserves the full untwisted affine Cartan matrix, including multiple-edge orientation. A
special node is one with coefficient `1` in the affine null-root relation; node `0` is special.
Prove injectivity by the action on the alcove walls. For surjectivity, prove every affine-diagram
automorphism sends special nodes to special nodes, use the simply transitive `Ω`-action on special
nodes to move it back to `0`, then identify the stabilizer of `0` with `Γ_root`. Keep this proof
separate from the compact-group period calculation.

For a reducible finite root system, do the construction on each irreducible component and include
the permutations of isomorphic components in the resulting based/affine diagram automorphism group.
Treat rank zero directly: its affine diagram has no nodes and its Weyl and translation groups are
trivial. For a reductive compact group, the central torus belongs to the finite central covering product
with the simply connected derived group; it is not generally a direct factor of the group itself.
It contributes a vector summand to the Lie algebra, but the full integral period lattice may be
glued across the central and derived directions. Carry that lattice through the actual finite central
cover and its kernel; do not assert an integral direct-product decomposition. The central torus has
no root, coroot, or affine-Dynkin nodes.

The lattice quotients have different meanings and must remain distinct. For a semisimple group with
cocharacter lattice `Y`, the extended affine stabilizer built from translations by `Y` is `Y/Q∨`,
whereas its center is `P∨/Y`. Prove `Q∨ ⊆ Y` from the rank-one coroot-circle maps. For the
simply connected compact group, prove the reverse inclusion rather than assuming it: integrate the
finite-dimensional fundamental highest-weight modules supplied by this roadmap to `G_sc` using
LieGroups Layer 4's Lie-homomorphism integration, restrict them to `T`,
and compare the differentials of their torus characters through the period comparison of §10.2. Each fundamental weight therefore pairs integrally with every `y ∈ Y`; since the
fundamental weights are a basis of `P`, their integral dual lattice is `Q∨`, giving `Y ⊆ Q∨`.
Thus `Y = Q∨` in the simply connected case. For an intermediate isogeny form retain its actual
character lattice `Q ⊆ X ⊆ P` and cocharacter lattice `Q∨ ⊆ Y ⊆ P∨`; these are dual data, not
lattices to replace by the simply connected ones. Consequently the group-theoretic extended affine
stabilizer is trivial for `G_sc`, while its center is `P∨/Q∨`. Never identify these two quotients. Check the constructions and actions in types `A₁`, `A_r`, `D₄`, and `E₆`:
respectively `Ω ≅ C₂`; `Ω ≅ C_{r+1}` with the nontrivial finite diagram involution acting by
inversion for `r ≥ 2`; `Ω ≅ C₂ × C₂` and the `S₃` triality action permuting its three nonzero
elements; and `Ω ≅ C₃` with the diagram involution acting by inversion. These checks fix the affine
node, orientation, and semidirect-product convention. For an actual isogeny form, define
`Γ_Y ≤ Γ_root` to be the subgroup preserving its cocharacter lattice `Y`; its group-level center
quotient is equivariant under `Γ_Y`. Do not claim that an arbitrary isogeny lattice is preserved by
every root-system diagram automorphism.

### 10.2 Compact-center application

Let `G_sc` be a compact connected semisimple simply connected Lie group with maximal torus `T`
(LieGroups Layer 6). Consume LieGroups gap:torus-period-lattice for the exponential kernel
`Λ ⊆ 𝔱`, the cocharacter lattice `Y ≅ (2π)⁻¹Λ`, the character lattice `X` with `dχ = iα`, and their
integral pairing. Construct here, as a derived comparison, the map from this layer's dimensionless
root-datum coweight coordinates to `𝔱` and prove that its root characters satisfy

`dχ_α(X) = i α_comp(X)`, `α_comp(α∨_comp) = 2`, and the coroot circle has period `2π`.

In this comparison a dimensionless coroot `α∨` maps to `2π α∨_comp ∈ Λ`; it is the period lattice
`Q∨` that is killed by the compact exponential. Do not identify the symbol `2πi` in an algebraic
cocharacter differential with the real compact Lie algebra coordinate. Prove that the square relating
algebraic cocharacters, compact circle homomorphisms and root characters commutes, using the rank-one
calibration `dφ(∂_θ) = α∨_comp = diag(i,−i)` and `dχ_α = iα_comp` of SU(2).

**Checks.**

- In SU(2), `exp(t·diag(i,−i))` has period 2π, its root character is `z ↦ z²` with differential 2i
  at `diag(i,−i)`, and the dimensionless coroot maps to `2π·diag(i,−i)`; mapping it to
  `diag(i,−i)` alone would place `exp(diag(i,−i)) = diag(e^i, e^(−i)) ≠ 1` in the kernel.
- The center of SU(2) computed below has order 2 (the points `t` with `2t ∈ 2πℤ` modulo `2πℤ` on
  the coroot circle), and that of SO(3) has order 1.
- For the trivial group, rank 0, all lattices are 0 and the center is trivial.

For `t ∈ T`, centrality is equivalent to `α(t)=1` for every root. Lift through the actual universal
cover of `T`: this condition says its coordinate is in `P∨`, and two lifts represent the same point
exactly when they differ by `Y`. Thus prove, equivariantly for based root-datum automorphisms, `Z(G)
≃ P∨/Y`. The rank-one coroot maps give `Q∨ ⊆ Y`. In the simply connected case, integrate the
fundamental highest-weight modules to `G_sc` using LieGroups Layer 4 integration and restrict to `T`. Their character
differentials, compared through the period comparison above, show that every `y ∈ Y` pairs
integrally with every fundamental weight. Those weights form a basis of `P`, whose integral dual is
`Q∨`; hence `Y ⊆ Q∨` and `Y=Q∨`. For an intermediate semisimple isogeny form retain its actual
character lattice `Q ⊆ X ⊆ P` and cocharacter lattice `Q∨ ⊆ Y ⊆ P∨`, and give its center and
affine-stabilizer quotients separately. Do not assert the center is finite for a reductive group
with a positive-dimensional central torus; this finite quotient theorem is for the semisimple
factor, with the central torus carried separately.

### Examples

For SU(2), Y=Q∨ gives affine stabilizer quotient 0 and center P∨/Q∨ of order 2; for SO(3), Y=P∨ reverses these two sizes.

### Dependencies

*Needs:* RootSystems Layers 1–6; native integral-weight lattice; for §10.2 only, LieGroups Layers 4 and 6 and LieGroups gap:torus-period-lattice.

## Worked examples

- **`sl₂` irreducibles `V(n)`.** For `L = sl (Fin 2) K` with its standard triple: construct `V(n)`,
  prove `dim V(n) = n+1`, that `h` acts with spectrum `{n, n-2, …, -n}`, and that `V(0), V(1), V(2)`
  are the trivial, standard, and adjoint modules. Verify Clebsch-Gordan `V(1) ⊗ V(1) ≅ V(2) ⊕ V(0)`.
  Weyl dimension formula: `dim V(n) = (n+1)`, matching directly.
- **The adjoint representation.** For any `L` (e.g. `sl (Fin 3) K`), the adjoint module `L` itself is
  finite-dimensional irreducible (for simple `L`), its weights are the roots together with `0` (with
  multiplicity `rank L`), its highest weight is the **highest root** `θ`, and it is `L(θ)`. Check
  `dim L` against the Weyl dimension formula at `λ = θ`.
- **`sl₃` weight diagrams.** For `L = sl (Fin 3) K` (type `A₂`), with fundamental weights `ω₁, ω₂`:
  the standard `V(ω₁)` (dimension `3`) and its dual `V(ω₂)` (dimension `3`), the adjoint `V(ω₁+ω₂)`
  (dimension `8`) with its hexagonal weight diagram and the `0` weight of multiplicity `2` (Kostant's
  formula gives the `2`), and `V(2ω₁)` (dimension `6`). Reproduce the weight diagrams as the supports
  of `TauCeti.formalCharacter`.
- **The Weyl dimension formula on a few reps.** For type `A₂`: `dim V(aω₁+bω₂) = (a+1)(b+1)(a+b+2)/2`,
  checked against `3, 3, 8, 6, 10` for `ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁`. For type `B₂`/`G₂`, at least the
  adjoint and one fundamental representation, as a check that the positive-root product is computed with
  the right multiplicities.
- **Complete reducibility in action.** A chosen reducible-but-indecomposable-looking extension (e.g. a
  non-split-looking submodule of `V(1) ⊗ V(1)`) is split by Layer 5, decomposing as predicted by
  Clebsch-Gordan and the character ring.
- **The center and linkage for `sl₂`.** Consume native
  `TauCeti.SpecialLinear.instHasTrivialRadicalSl` from `GeneralLinear.Radical` and
  Mathlib `HasTrivialRadical.instIsKilling`; construct slTwoDiagonalCartan, with
  generator h=E₀₀−E₁₁, its Cartan instance, root decomposition and slTwoPositiveBase
  selecting e=E₀₁ as positive (with f=E₁₀). These concrete instance/base targets belong
  here before any application of Layer 7; triangularizability is the native
  `instIsTriangularizableOfIsAlgClosed` consequence. Consume the existing native standard
  `TauCeti.isSl2Triple_single` triple. For `L=sl (Fin 2) K`, this diagonal Cartan H
  and standard triple `[h,e]=2e`, `[h,f]=−2f`, `[e,f]=h`, choose the positive base {α} with e∈L_α and `ρ(h)=1`. Set
  `Ω=h²+2h+4fe`. Prove `Ω` is central and construct
  `Polynomial K ≃ₐ[K] Z(U(sl₂))` sending X to Ω, and
  prove `Ω=8·TauCeti.casimirElement K (sl (Fin 2) K)` for Layer 5's Killing-dual normalization
  (`κ(h,h)=8`, `κ(e,f)=4`). In the coordinate
  `t=λ(h)`, `ρ(h)=1`, the raw map sends `Ω` to `t²+2t`, invariant under `t↦−t−2`;
  the linear map sends it to `t²−1`, invariant under `t↦−t`. Hence the two image
  subalgebras are `K[t²+2t]` and `K[t²]`, respectively, and `χ_n(Ω)=n(n+2)`.
  Check `χ_λ=χ_μ` iff `μ=λ` or `μ=−λ−2`. Freudenthal on `V(n)` returns
  multiplicity `1` for each of `n,n−2,…,−n`, matching Layer 0.
- **`sl₃` multiplicities by Freudenthal.** For type `A₂`, recompute the `0`-weight multiplicity `2` of
  the adjoint `V(ω₁+ω₂)` by Freudenthal's recursion (a check on the Kostant computation in the `sl₃`
  worked example above) and the multiplicities of `V(2ω₁+2ω₂)`.
- **`G₂ = Der(𝕆)` and its `7`.** On the native split octonions verify the alternative identities and the
  multiplicative norm, build `Der(𝕆)`, and check `finrank K (Der 𝕆) = 14`, that it is Killing-simple of
  type `G₂` (Cartan matrix reindexes to `CartanMatrix.G₂`), that `Im 𝕆` is its `7`-dimensional
  irreducible `V(ω₁)`, and `Der(𝕆) ≃ₗ⁅K⁆ LieAlgebra.g₂ K`. The Weyl dimension formula on `G₂` returns
  `7` and `14` for the two fundamental weights.
- **`F₄ = Der(H₃(𝕆))` and `E₈`.** Build the Albert algebra `H₃(𝕆)`, check `finrank = 27` and the Jordan
  identity, build `Der(H₃(𝕆))` and check `finrank = 52`, type `F₄`, the `26`-dimensional representation
  `J₀`, and `≃ₗ⁅K⁆ LieAlgebra.f₄ K`. For `E₈`, check `finrank (𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*) = 248 =
  80 + 84 + 84`, Killing-simplicity of type `E₈`, and `≃ₗ⁅K⁆ LieAlgebra.e₈ K`; the Weyl dimension
  formula at the adjoint highest weight returns `248`.
- **Isotypic components against characters (the toolkit check).** For `L = sl (Fin 2) K` and
  `M = (V(1) ⊗ V(1)) ⊕ V(0)`: the isotypic multiplicities are `1, 0, 2` at the weights `2, 1, 0`,
  agreeing with the coefficients extracted from `formalCharacter M`, and the component finranks
  `3 + 0 + 2` sum to `dim M = 5`, checking finrank_isotypicComponent and the packaged
  decomposition against Clebsch-Gordan.
- **`gl_2`, the classification concretely.** The irreducibles of `gl_2` are the pairs `(μ₁, μ₂)` with
  `μ₁ - μ₂ ∈ ℕ`, of dimension `μ₁ - μ₂ + 1`; the restriction to `sl (Fin 2) K` is `V(μ₁ - μ₂)` and
  the centre acts by `μ₁ + μ₂`. The trace-form Casimir scalar is `μ₁(μ₁ + 1) + μ₂(μ₂ - 1)`, matching
  glCasimir_smul_of_isGlHighestWeightVector at `n = 2`. `gl_1` is the degenerate check: every
  `μ : K` is dominant, so the non-integral central direction is visible already in rank one, where
  the group-level `DominantWeight 1` sees only `ℤ`.
- **The staircase weight and Casimir separation on `gl_N`.** `ν = (N - 1/2, …, 1/2)`: no entry is an
  integer, every consecutive difference is `1`, so `IsGlDominantIntegral ν` holds, and every lowered
  weight `ν - ε_t` is still dominant. The Casimir scalars separate them:
  `C(ν - ε_t) - C(ν - ε_s) = 4 (t - s)` (zero-based), pairwise distinct, so on a module whose
  irreducible constituents all have highest weights among the `ν - ε_t` the single operator
  `TauCeti.glCasimir` already distinguishes the summands.
- **Minuscule Pieri for the standard module and its dual on `gl_N`.** The standard module (weights
  `ε_t`) and its dual (weights `-ε_t`) are minuscule; `gl_dual_standard_pieri` gives
  `V* ⊗ L(ν) ≅ ⨁_{t} L(ν - ε_t)` with all `N` summands surviving for the staircase `ν`, the uniform
  decomposition the motivating CAR application reads off
  ([../SpinRepresentations/README.md](../SpinRepresentations/README.md) Layer 9).
- **The single-weight criterion in action.** For the `gl_N` action by fermionic bilinears on the
  exterior algebra of an `N²`-dimensional space (the CAR module of
  [../SpinRepresentations/README.md](../SpinRepresentations/README.md) Layer 9), every highest
  weight vector has weight `ν`. First prove `N≥1`. With the actual supplier normalization
  `F_ij=½Σ_k d_ik d_kj` and `d_ab d_cd+d_cd d_ab=2δ_bcδ_ad`, prove
  `Σ_i F_ii=((N:K)^2/2) • (1 : Cliff(M_N))`: diagonal terms have `d_ii²=1`, and
  each unordered off-diagonal pair contributes `d_ik d_ki+d_ki d_ik=2`, so the
  unhalved sum is `N+N(N−1)=N²`. Thus the identity matrix acts by this scalar on
  the left-regular module and acts semisimply. The scalar equals `Σ_i ν_i=N²/2`.
  With these hypotheses, gl_isotypic_of_forall_isGlHighestWeightVector forces
  the module to be `L(ν)`-isotypic, necessarily with multiplicity `2^{N(N+1)/2}` by dimension count
  (`2^{N²} / 2^{N(N-1)/2}`). Fock spaces themselves are never named in this roadmap's general
  statements; the layer must make that external computation expressible with no new general lemmas.

## Downstream consumers

AdoIwasawa consumes the arbitrary-field ordered PBW and central-monic finiteness
interface in Layer 3. LieGroupoidsPoisson G4.6A packages §3.1's positive smooth
bracket and G4.6B supplies its geometric orbit theory. TensorProductCombinatorics
§§1.6 and 2.6 use §6.2's lattice expansions, Fourier boundary maps and endpoint
reconstruction in their cone and type-A counting comparisons. CharacteristicClasses C5.1 consumes Layer 7's actual
Lie–Chevalley restriction and its Killing-duality comparison. The split
exceptional identifications in Layer 8 use the split Serre presentation in
Layer 7; the compact Albert geometry in TangentialBordism B3 uses the separate
positive real algebra track. SpinRepresentations consumes the dual-standard
Pieri rule in Layer 9.

Layer9's reductive enveloping-product and center-factor constructions consume the native product/abelian/tensor-centralizer APIs and the existing early reductive splitting. Its HC and invariant-polynomial refinements consume Layer7; its connected algebraic fixed-vector comparison consumes only RG2/5P's tangent/Cartier cut, and its complex analytic comparison consumes LG2–4. None consumes Borel–Weil or characteristic-class cohomology.

Layer 10 consumes the native integral-weight predicates and constructs the lattice comparison, plus RootSystems Layers 1–6 finite root geometry, based classification, and actual Weyl group. It builds the affine action without a Lie-group or period input. Only §10.2's compact-center application uses Lie groups, through LieGroups Layers 4 and 6 and gap:torus-period-lattice; nothing in this roadmap is supplied back to RootSystems or LieGroups.

## References

- C. De Concini, C. Procesi, M. Vergne, *Box splines and the equivariant index
  theorem*, arXiv:1012.1049v3 (2012), §1, pp. 6–7; Definitions 2.5–2.9,
  pp. 8–10; Theorems 2.15 and 2.29, pp. 11 and 15; §3.1,
  Propositions 3.2 and 3.4 and Theorem 3.3, pp. 19–20. These locators
  refer to the arXiv version.

- P. Etingof, *Representations of Lie Groups*, arXiv:2401.01446v2 (2024),
  Theorem 10.1 and Remark 10.2, pp. 51–52; Theorem 13.5, p. 69;
  Theorem 14.1, pp. 70–71. The Chevalley/HC source is over ℂ; the algebraic
  characteristic-zero extension requires the polynomial arguments stated in Layer 7.
- S. Gutt, *Deformation Quantization and Symmetries*, Lectures 1–2 (2019),
  Lecture 1, slide 14: PBW symmetrization and the positive linear Poisson convention.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972),
  the primary reference: `sl₂` (Ch. II §7), root-space decomposition and root systems (Ch. III), the
  universal enveloping algebra and PBW (Ch. V §17), Verma modules, `L(λ)`, and the finite-dimensional
  classification (Ch. VI §20-21), Weyl's complete reducibility via the Casimir (Ch. II §6, Ch. VI),
  and the Weyl character, dimension and Kostant formulas (§22.3, §24.1 and §24.2).
- J.-P. Serre, *Complex Semisimple Lie Algebras*, Springer (1987), the concise development of `sl₂`,
  root systems, and the highest-weight classification.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991), `sl₂`,
  `sl₃` weight diagrams (Lectures 12-13), the classical-series representations, and the Weyl character
  and dimension formulas (Lecture 25) with many worked examples; the source for the `sl₃` acceptance
  criteria.
- J. E. Humphreys, *Representations of Semisimple Lie Algebras in the BGG Category O*, AMS GSM 94
  (2008), Verma modules, category `O`, the BGG resolution, and the character formula in modern form.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 7-8*, the structure theory, Cartan
  subalgebras, root systems, and the invariant-theoretic treatment of characters.
- J. C. Jantzen, *Lectures on Quantum Groups* / *Representations of Algebraic Groups*, the Kostant
  partition function, the Weyl and Kostant formulas, and the link to the algebraic-groups picture that
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) consumes.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapter 8*, the center of the enveloping algebra, the
  Harish-Chandra homomorphism and central characters, the linkage principle, and the Chevalley-Serre
  presentation of a split semisimple Lie algebra; the source for Layer 7.
- N. Jacobson, *Exceptional Lie Algebras*, Marcel Dekker (1971), and R. D. Schafer, *An Introduction
  to Nonassociative Algebras*, Academic Press (1966), the octonions, the Albert algebra `H₃(𝕆)`, and
  the derivation algebras `G₂ = Der(𝕆)` and `F₄ = Der(H₃(𝕆))`; the source for Layer 8.
- J. C. Baez, *The Octonions*, arXiv:math/0105155v4 (2002), §2.2, pp. 8–10
  for Cayley–Dickson conventions and §3.4, p. 32 for the Albert determinant.
- J. M. Landsberg and L. Manivel, *The projective geometry of Freudenthal’s magic square*,
  arXiv:math/9908039v1 (1999), §1.1, pp. 2–3, for the complex magic-square background.
  This background does not supply the arbitrary-field bracket comparisons of Layer 8.
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009),
  highest-weight theory for `gl_n` and the classical groups, the trace-form Casimir, isotypic
  decompositions, and the Pieri rules; the primary source for Layer 9 and the minuscule Pieri
  targets of Layer 6.
- J. Dixmier, *Enveloping Algebras*, AMS GSM 11 (1996), reductive Lie algebras (§1.6) and the center
  of the enveloping algebra; the source for the reductive structure theory and the central-character
  separation of Layer 7.
- A. Molev, *Yangians and Classical Lie Algebras*, AMS Mathematical Surveys and Monographs 143
  (2007), Ch. 1-2, `gl_n` highest weight modules with arbitrary entries and integral differences,
  and the Gelfand-Tsetlin bases; the source for the "entries in `K`, differences in `ℕ`"
  formulation of `gl_n` dominance.
