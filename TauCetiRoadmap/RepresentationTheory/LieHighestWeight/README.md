# Roadmap: representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas

**Summary.** This roadmap builds the representation theory of semisimple Lie algebras over a
field of characteristic zero on Mathlib's root-system carrier `LieAlgebra.IsKilling.rootSystem`:
the `sl₂` engine, weights and their integrality, the universal enveloping algebra with its PBW
Rees deformation, Verma modules and the irreducible quotients `L(λ)`, the classification of the
finite-dimensional irreducibles by dominant integral highest weights, Weyl's complete
reducibility, the Weyl character, dimension and Kostant formulas with a decomposition toolkit,
the centre of `U(L)` with the Harish-Chandra isomorphisms, Freudenthal's formula and Serre's
presentation, the exceptional Lie algebras from octonions and Albert algebras in their split and
compact real forms, reductive Lie algebras and `gl_n`, and the affine Weyl geometry of the
coweight quotient. Most of the classical theory is proved at the pinned Tau Ceti and is consumed
here by name. The end theorems are those the pins do not prove: Serre's theorem in split form
(`serreLift_injective_of_base`); the identifications of split `G₂` and `F₄` with derivation
algebras (`g₂ToDerivationLieAlgebra_injective`, `nonempty_derivationAlbert_lieEquiv_f₄`); compact
`G₂` on the division octonions (`finrank_derivationLieAlgebra_divisionOctonionReal`,
`killingForm_derivationLieAlgebra_divisionOctonionReal_lt_zero`); the dimensions of split `E₆`,
`E₇`, `E₈` (`finrank_e₆`, `finrank_e₇`, `finrank_e₈`); the Littlewood–Richardson rule for
`gl_N`-modules (`finrank_lieModuleHom_glIrreducible_tmul_eq_card_lrTableau`); and the
isomorphism `Ω ≃ P∨/Q∨` with the factorization of the affine diagram automorphisms
(`fundamentalAlcoveStabilizerToQuotient_bijective`,
`existsUnique_fundamentalAlcoveStabilizerToPerm_mul`). Suggested homes:
`TauCeti/Algebra/Lie/HighestWeight/` for the representation theory and `TauCeti/Algebra/Lie/Sl2/`
for the engine, mirroring Mathlib's `Algebra/Lie/`.

## Scope and ownership

**Owned here.** The highest-weight representation theory of a finite-dimensional
Killing-semisimple Lie algebra over a field of characteristic zero, at the generality stated in
each layer (Layers 0–7); the exceptional Lie algebras as explicit split models over every field of
characteristic zero and as compact real forms over `ℝ`, including the positive division-octonion
structures and the formally real Albert algebra (Layer 8); the structure and highest-weight theory
of reductive Lie algebras and of `gl_n`, and the Littlewood–Richardson rule for `gl_N`-modules
(Layer 9); the fundamental alcove stabilizer `Ω`, its isomorphism with `P∨/Q∨` and its action on
the affine diagram (Layer 10).

**Already in the libraries.** Mathlib supplies the root system of a Killing Lie algebra, Cartan
subalgebras, generalized weight spaces, the enveloping algebra, the Killing form and the Serre
construction (exact names under *From Mathlib*). Tau Ceti proves at the pin, and this roadmap
consumes by name (exact names under *From Tau Ceti*): the `sl₂` classification, complete
reducibility and Clebsch–Gordan rule; the integral weight lattice, diagonalizability and
integrality of weights; the PBW filtration, basis and Rees algebra, Verma modules and `L(λ)`; the
dominant-integral classification; Weyl's complete reducibility and the Casimir element; the Weyl
character, dimension and Kostant formulas, Freudenthal's formula and the isotypic toolkit; the
Harish-Chandra isomorphisms, Chevalley restriction and Cartan conjugacy; the split octonions and
Albert algebra with the dimensions of their derivation algebras and the surjection from split
`G₂`; the reductive and `gl_n` theory, including the carrier `TauCeti.glIrreducible`; the
fundamental alcove, the extended affine Weyl group and the surjection of `Ω` onto `P∨/Q∨`. Tau
Ceti also proves the group-level type-A theory at the pin: the characters of the Weyl modules of
`GL n ℂ` are Schur polynomials (`TauCeti.char_weylRepOfShape_diagonal_eq_eval_diagramSchurPoly`,
`TauCeti.char_rationalWeylRep_diagonal_eq_eval_diagramSchurPoly`), their tensor products obey the
Littlewood–Richardson rule (`TauCeti.nonempty_equiv_tprod_weylRepOfShape`,
`TauCeti.nonempty_equiv_tprod_rationalWeylRep`), and their restrictions to `GL (n−1) ℂ` decompose
by interlacing (`TauCeti.nonempty_equiv_weylRepOfShape_comp_glBlockSucc`,
`TauCeti.nonempty_equiv_rationalWeylRep_comp_glBlockSucc`).

**Stated by other roadmaps, not planned here.**

- The symmetrization form of the PBW theorem, `Sym(L) ≃ U(L)` for an arbitrary Lie algebra over
  a commutative `ℚ`-algebra, is
  [ScatteringDiagrams §0.4](../../ScatteringDiagrams/README.md#04-algebraic-exponential-groups)
  (`exists_pbwSymmetrizationEquiv`); no target here depends on it.
- The rational representation theory of `GLₙ` over `ℂ` (the highest-weight classification, the
  identification of characters with Schur polynomials, the Littlewood–Richardson multiplicities of
  group tensor products, the branching `GLₙ ↓ GLₙ₋₁` and the Gelfand–Tsetlin bases) is
  [ClassicalGroups](../ClassicalGroups/README.md) Layers 3–6; its characters, tensor products and
  branching are natively proved at the pin as listed above. ClassicalGroups Layer 3 is built on this roadmap, so no section here consumes
  ClassicalGroups; Layer 9 reaches `gl_n`-modules from the native group-level theorems.
- Compact Lie groups: maximal tori and Weyl integration, the transport of the Weyl character
  formula to the compact maximal torus with its Fourier-coefficient and Haar-norm forms, and the
  centre theorem `Z(G) ≃ P∨/Y` for a compact connected semisimple group with cocharacter lattice
  `Y` are compact-group statements over [LieGroups](../LieGroups/README.md) Layers 6–7. LieGroups
  consumes this roadmap (its Layers 0, 3 and 7), so these statements are not planned here; Layer
  10's `Ω ≃ P∨/Q∨` is the algebraic input this roadmap supplies to them.
- Rational cone series, vector-partition chamber polynomials and the Fourier boundary values of
  character formulas are
  [TensorProductCombinatorics §1.6 and §2.6](../../TensorProductCombinatorics/README.md#16-rational-cone-series-fourier-boundary-values-and-lattice-endpoints);
  that roadmap consumes ClassicalGroups and LieGroups and is downstream of this one.
- The idempotent geometry of the formally real Albert algebra, its compact automorphism group and
  the `F₄`/`Spin(9)` Cayley-plane comparison are
  [TangentialBordism §§9.1–9.2](../../TangentialBordism/README.md#91-idempotent-cayley-plane-b36).
- Compact-group invariance of Chevalley restriction, its geometric root-data comparison,
  reductive central factors and real descent are
  [CharacteristicClasses C5](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings).
- The smooth linear Lie–Poisson structure on `L*` is
  [LieGroupoidsPoisson §G4.6A](../../LieGroupoidsPoisson/README.md), consumed in §3.2 for one
  comparison; coadjoint orbits and the Kirillov–Kostant–Souriau form (LieGroupoidsPoisson §G4.6B,
  HamiltonianReduction R2) are not used. The commutative weight-Rees families of GroebnerGeometry
  G4 are a different carrier from the noncommutative PBW Rees algebra of §3.2.
- The based automorphism group of a root system and its identification with the oriented diagram
  automorphisms are [RootSystems §§5.1–5.2](../RootSystems/README.md); Layer 10 consumes them.

The linkage principle of category `O` (composition factors of Verma modules, the integral Weyl
group and blocks) is strictly stronger than the central-character orbit theorem of §7.3 and is not
part of this roadmap.

**Names cited by other roadmaps.** Other roadmaps cite the following names of this roadmap; each
resolves as stated, one line per name.

- `lieCartanRestriction` → `TauCeti.lieCartanRestriction`;
- `lieInvariantSymmetricAlgebra` → `TauCeti.SymmetricAlgebra.lieInvariants`;
- `lieChevalleyRestrictionIso` and its `_coe` equation → `LieSubalgebra.lieChevalleyRestrictionIso`;
- `lieChevalleyRestrictionIso_mem_homogeneous_iff` →
  `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`;
- `killingSymmetricEquiv_cartan_restriction` → `TauCeti.map_dualMap_killingSymmetricEquiv`;
- `killingSymmetricEquiv_lie` → `TauCeti.killingSymmetricEquiv_lieModuleDerivation`;
- `irreducibleQuotient`, `vermaModule` → `TauCeti.irreducibleQuotient`, `TauCeti.VermaModule`;
- `ι_injective`, `pbwBasis` → `TauCeti.UniversalEnvelopingAlgebra.ι_injective`,
  `Module.Basis.pbwBasis`;
- `pbwSymmetrization` → the degreewise `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization`,
  and for the equivalence of all degrees ScatteringDiagrams §0.4's `exists_pbwSymmetrizationEquiv`;
- `pbwSymmetrization_symbol` → `TauCeti.UniversalEnvelopingAlgebra.mk_pbwSymmetrization`;
- `pbwSymmetrization_mem_center_iff` →
  `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_center_iff`;
- `module_finite_of_central_monic_relations` →
  `TauCeti.UniversalEnvelopingAlgebra.moduleFinite_of_isIntegral_of_span_eq_top` (the finiteness
  of `U(L)` over central scalars, §3.1);
- `compactAlbertAlgebra` → the formally real Albert algebra `J` of §8.4 (a README target, without
  a Lean name: Tau Ceti has no carrier for it, see the module docstring of `Suggested.lean`);
- `compactAlbertDerivation_complexification` → the identification of the complexified derivation
  algebra of `J` with split complex `F₄`, §8.4;
- `compactAlbertDerivation_killing_negDef` → the negative definiteness of the Killing form on the
  derivation algebra of `J`, §8.4;
- `compactAlbertComplexificationIso`, `compactAlbertDerivationBaseChange`,
  `compactAlbertDerivation_finrank`, `compactAlbertDerivation_skewAdjoint` → the complexification
  comparison, the derivation base change, the dimension `52` and the skew-adjointness of
  derivations of `J`, §8.4.

## Conventions

- **The base field.** The representation theory proper works over a field `K` that is
  algebraically closed and of characteristic zero (`[Field K] [CharZero K] [IsAlgClosed K]`), so
  that the characteristic polynomials of `H`-actions split. Algebraic closure and
  finite-dimensionality give only the generalized weight-space decomposition
  (`iSup_genWeightSpace_eq_top`, once `IsTriangularizable K H M` holds); that the generalized
  weight spaces are honest eigenspaces is the separate diagonalizability theorem of §2.1. Each
  result is stated at the generality it needs: the `sl₂` weight-string arguments need `CharZero`
  and finite-dimensionality, the generalized decomposition needs `IsTriangularizable`, the
  classification needs algebraic closure. No class bundles "algebraically closed, characteristic
  zero, semisimple, split". The split Serre theorem (§7.5) and the split models (Layer 8) use an
  arbitrary `[Field K] [CharZero K]`, a finite-dimensional Killing-semisimple `L`, a Cartan
  subalgebra `H` and `[IsTriangularizable K H L]`; the indecomposable presentation adds
  `[LieAlgebra.IsSimple K L]`, and reducible systems are assembled componentwise.
- **The Lie algebra.** `L` is finite-dimensional (`[LieRing L] [LieAlgebra K L] [Module.Finite K L]`).
  The default semisimplicity hypothesis is `LieAlgebra.IsKilling K L` (non-degenerate Killing
  form), equivalent over a characteristic-zero field to `LieAlgebra.IsSemisimple K L` and the
  hypothesis under which Mathlib builds `LieAlgebra.IsKilling.rootSystem`. Over an algebraically
  closed `K` every Cartan subalgebra splits; the nilpotent and solvable notions are Mathlib's
  (`LieRing.IsNilpotent L`, equivalently `LieModule.IsNilpotent K L L`, and `LieAlgebra.IsSolvable`),
  and so is `LieAlgebra.HasTrivialRadical`.
- **Cartan subalgebras, roots and weights are Mathlib's.** Fix `[H.IsCartanSubalgebra]`; for
  finite-dimensional `L` over an infinite field one exists by
  `LieAlgebra.exists_isCartanSubalgebra_engel`. A root is a nonzero `LieModule.Weight K H L`
  (an element of `LieSubalgebra.root H`), a weight of a module `M` is a `LieModule.Weight K H M`,
  the root and weight spaces are `LieAlgebra.rootSpace H α` and `LieModule.genWeightSpace M χ`,
  the root system is `LieAlgebra.IsKilling.rootSystem H`, a
  `RootPairing H.root K (Module.Dual K H) H`, with coroots `LieAlgebra.IsKilling.coroot`. No
  private `Root`, `Weight` or `Coroot` synonym is introduced.
- **Positive systems and dominance, via a base.** Fix
  `base : (LieAlgebra.IsKilling.rootSystem H).Base` (it exists by `RootPairing.nonempty_base`);
  `Base.IsPos` and `base.support` are the positive and simple roots. The name `base` is reserved
  for the root-system base and never reused for the Borel subalgebra. Integrality is arithmetic: a
  weight `λ : Module.Dual K H` is integral when `λ(α^∨) ∈ ℤ` for every root (native
  `TauCeti.IsIntegralWeight`) and dominant integral when `λ(αᵢ^∨) ∈ ℕ` for every simple root
  (native `TauCeti.IsDominantIntegral`). The integral weight lattice `P` is the `ℤ`-submodule
  `TauCeti.integralWeightLattice H` of `Module.Dual K H`, not a `K`-subspace; `ρ` is the half-sum
  of the positive roots.
- **Modules are `LieModule`s.** Develop the theory on `M` with
  `[LieRingModule L M] [LieModule K L M]`, irreducibility `LieModule.IsIrreducible K L M`, and the
  enveloping algebra `UniversalEnvelopingAlgebra K L` with its universal property
  `UniversalEnvelopingAlgebra.lift`; finite-dimensional `L`-modules are finite-dimensional
  `U(L)`-modules, and the dictionary is kept explicit where the associative presentation is the
  natural home. Vocabulary: `LieSubmodule`, `LieModuleHom`, `LieModuleEquiv` (`M ≃ₗ⁅K,L⁆ N`),
  `Module.finrank`, `Module.Dual`.
- **Highest weight is defined against the base.** A highest weight vector of weight `λ` is a
  nonzero `v` with `⁅x, v⁆ = λ x • v` for `x ∈ H` and `⁅e, v⁆ = 0` for every `e` in a positive
  root space (native `TauCeti.IsHighestWeightVector`). For `sl₂` this is Mathlib's
  `IsSl2Triple.HasPrimitiveVectorWith`, and the two are the same notion so that the reductions
  typecheck.
- **Characters live in the integral group algebra.** The formal character of a finite-dimensional
  module is `μ ↦ dim Mμ` (honest multiplicities, by §2.1), an element of `ℤ[P]` realized as
  `Module.Dual K H →₀ ℤ` supported on integral weights, with the action of
  `(rootSystem H).weylGroup`. The Weyl character formula is stated with the integral denominator
  `∏_{α>0}(1 − e^{−α})`, every exponent in `P`; the symmetric denominator `∏(e^{α/2} − e^{−α/2})`
  differs by `e^{ρ}` and involves `α/2 ∉ P`, so it is not used.
- **Reductive Lie algebras and `gl_n` (Layer 9).** Reductivity is Mathlib's
  `LieAlgebra.HasCentralRadical` (`radical = center`) as an unbundled hypothesis; semisimplicity is
  imposed on the derived ideal `LieAlgebra.derivedSeries K L 1`, never on `L`; `IsAlgClosed`
  appears exactly where a Schur-type argument needs it. The concrete `gl_n` is
  `Matrix (Fin n) (Fin n) K` with its `LieRing.ofAssociativeRing` bracket, its Cartan is the
  diagonal `TauCeti.diagonalCartan`, and its positive system is the matrix-unit order
  (`Matrix.single i j 1` raising for `i < j`). The Killing form of `gl_n` is degenerate, so the
  invariant form is the trace form of the standard representation (`⟨X, Y⟩ = tr (X * Y)`,
  `LieModule.traceForm`); the Casimir scalar `Σᵢ μᵢ (μᵢ + n − 1 − 2i)` (zero-based `i`) is stated
  only for it. Dominance for `gl_n` is a condition on differences (`μᵢ − μᵢ₊₁ ∈ ℕ`) with entries
  free in `K`; the integer dominant weights of `GL_n` are native `TauCeti.DominantWeight n`.

## Exact supplier contracts

### From Mathlib

- **`sl₂` triples and primitive vectors** (`Mathlib/Algebra/Lie/Sl2.lean`): `IsSl2Triple h e f`
  with `lie_e_f`, `lie_h_e_nsmul`, `lie_h_f_nsmul`; `IsSl2Triple.toLieSubalgebra`;
  `IsSl2Triple.HasPrimitiveVectorWith t m μ` (fields `ne_zero`, `lie_h`, `lie_e`); the ladder
  lemmas `lie_f_pow_toEnd_f`, `lie_h_pow_toEnd_f`, `lie_e_pow_succ_toEnd_f`; the integrality
  theorem `IsSl2Triple.HasPrimitiveVectorWith.exists_nat` (the highest weight of a primitive
  vector in a finite-dimensional module is a natural number); `exists_hasPrimitiveVectorWith`.
- **`sl₂` concretely** (`Mathlib/Algebra/Lie/Classical.lean`): `LieAlgebra.SpecialLinear.sl n R`,
  `SpecialLinear.single`, `SpecialLinear.singleSubSingle`, `sl_non_abelian`.
- **Cartan subalgebras** (`CartanSubalgebra.lean`, `CartanExists.lean`):
  `LieSubalgebra.IsCartanSubalgebra`, `LieAlgebra.exists_isCartanSubalgebra_engel` for
  `[Infinite K]`, `LieAlgebra.exists_isCartanSubalgebra_engel_of_finrank_le_card`.
- **Weights** (`Mathlib/Algebra/Lie/Weights/*`): `LieModule.genWeightSpace`, `genWeightSpaceOf`,
  `LieModule.Weight`, `LieModule.IsTriangularizable`, `iSupIndep_genWeightSpace`,
  `iSup_genWeightSpace_eq_top`; `LinearWeights`, `Weight.toLinear`; `LieAlgebra.rootSpace`,
  `rootSpaceWeightSpaceProduct`; `genWeightSpaceChain`.
- **The root system of a Killing Lie algebra** (`Weights/Killing.lean`, `Weights/RootSystem.lean`):
  `LieAlgebra.IsKilling`, `IsKilling.instSemisimple`, `finrank_rootSpace_eq_one`,
  `IsKilling.coroot`, `cartanEquivDual`, `exists_isSl2Triple_of_weight_isNonZero`,
  `sl2SubmoduleOfRoot`, `LieAlgebra.IsKilling.rootSystem` with `IsRootSystem`,
  `IsCrystallographic`, `IsReduced`, `rootSystem_pairing_apply`, `rootSystem_coroot_apply`.
  Assumed: `RootPairing.pairing P i j = P.root i (P.coroot j)`.
- **Abstract root systems** (`Mathlib/LinearAlgebra/RootSystem/*`): `RootPairing`, `RootSystem`,
  `RootPairing.Base` with `RootPairing.nonempty_base`, `Base.IsPos`, `Base.height`,
  `RootPairing.Base.cartanMatrix` (convention `A i j = αᵢ(αⱼ^∨)`), `RootPairing.weylGroup`,
  `RootPairing.Equiv.reflection`, `RootPairing.Base.equivOfCartanMatrixEq`.
- **The enveloping algebra** (`Mathlib/Algebra/Lie/UniversalEnveloping.lean`):
  `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι`, `UniversalEnvelopingAlgebra.lift`,
  `ι_comp_lift`, `lift_unique`, `hom_ext`; `Subalgebra.center`.
- **Semisimplicity and irreducibility** (`Mathlib/Algebra/Lie/Semisimple/*`):
  `LieModule.IsIrreducible`, `HasTrivialRadical`, `LieAlgebra.IsSemisimple`, `LieAlgebra.IsSimple`,
  `LieAlgebra.HasCentralRadical`, `LieAlgebra.center`, `LieAlgebra.radical`,
  `LieAlgebra.derivedSeries`; `LieAlgebra.HasTrivialRadical.instIsKilling`.
- **Invariant forms** (`TraceForm.lean`, `InvariantForm.lean`, `Killing.lean`): `killingForm`,
  `LieModule.traceForm`, `traceForm_cartan_nondegenerate`.
- **The Serre construction** (`Mathlib/Algebra/Lie/SerreConstruction.lean`):
  `Matrix.ToLieAlgebra R CM`, the relators `CartanMatrix.Relations.HH/EF/HE/HF/adE/adF` with
  `CartanMatrix.Relations.HE` imposing `⁅Hᵢ, Eⱼ⁆ = CM i j • Eⱼ`, and `LieAlgebra.e₆`, `e₇`, `e₈`,
  `f₄`, `g₂`; the Cartan matrices `CartanMatrix.E₆`, `E₇`, `E₈`, `F₄`, `G₂`
  (`Mathlib/Data/Matrix/Cartan.lean`). Mathlib proves none of their structural theorems.
- **Symmetric and exterior algebras, derivations, Jordan algebras**: `SymmetricAlgebra R M`,
  `SymmetricAlgebra.equivMvPolynomial`, `Basis.symmetricAlgebra`; `IsJordan`, `IsCommJordan`;
  `LieDerivation`, `Derivation`; `exteriorPower` (`⋀[R]^n M`), `exteriorPower.ιMulti`.
- **Matrix Lie algebras and modules**: `lieEquivMatrix'`, the standard module
  `LieRingModule (Matrix n n R) (n → R)` (`Mathlib/Algebra/Lie/Matrix.lean`), `Matrix.single`;
  tensor products, duals and direct sums of Lie modules (`Algebra/Lie/TensorProduct.lean`,
  `Module.Dual.instLieRingModule`, `Algebra/Lie/DirectSum.lean`); the ring-level isotypic theory
  `IsIsotypicOfType`, `IsIsotypic`, `isotypicComponent` (`RingTheory/SimpleModule/Isotypic.lean`).
- **Tensor products of nonassociative algebras**: `Algebra.TensorProduct.instNonAssocRing`,
  `instNonUnitalNonAssocSemiring`, `Algebra.TensorProduct.tmul_mul_tmul`,
  `isScalarTower_right`, `sMulCommClass_right`, `QuadraticForm.baseChange`.

### From Tau Ceti

Each item is a pinned declaration, consumed as stated in its file.

- **Layer 0** (`TauCeti/Algebra/Lie/Sl2/`): `TauCeti.Sl2Std K n` (the standard module `V(n)` on
  `Fin (n+1) → K`) with `TauCeti.Sl2Std.finrank_eq`, the irreducibility instance
  `TauCeti.Sl2Std.isIrreducible` and `TauCeti.exists_isIrreducible_hasPrimitiveVectorWith`
  (`Standard.lean`); `TauCeti.exists_hasPrimitiveVectorWith`,
  `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`,
  `TauCeti.nonempty_lieModuleEquiv_of_hasPrimitiveVectorWith`,
  `TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv` (`Classification.lean`);
  `TauCeti.exists_int_of_hasEigenvalue`, `TauCeti.iSup_eigenspace_toEnd_intCast_eq_top`
  (`Spectrum.lean`); `TauCeti.exists_isCompl_of_toLieSubalgebra_eq_top`,
  `TauCeti.exists_isCompl_sl_fin_two` (`CompleteReducibility.lean`);
  `TauCeti.Sl2Std.isInternal_cgSummand`, `TauCeti.Sl2Std.nonempty_lieModuleEquiv_cgSummand`
  (`ClebschGordan.lean`); `TauCeti.isSl2Triple_single`.
- **Layers 1–2** (`TauCeti/Algebra/Lie/Weights/`, `HighestWeight/Weight/`):
  `TauCeti.IsIntegralWeight`, `TauCeti.integralWeightLattice`, `TauCeti.coweightPairing`,
  `TauCeti.root_mem_integralWeightLattice` (`WeightLattice.lean`);
  `TauCeti.weylVector_mem_integralWeightLattice`, `TauCeti.isDominantIntegral_weylVector`
  (`Lattice.lean`); `TauCeti.isSemisimple_toEnd_cartan` (`Diagonalizable.lean`);
  `TauCeti.exists_int_apply_coroot`.
- **Layer 3** (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/`, `HighestWeight/`):
  `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `pbwFiltrationPrevious`, `PBWGradedPiece`,
  `pbwAssociatedGradedEquiv`, `pbwHomogeneousComponentMap`, `map_pbwFiltration_le`,
  `mul_sub_mul_mem_pbwFiltrationPrevious`, `TauCeti.UniversalEnvelopingAlgebra.ι_injective`;
  `Module.Basis.pbwBasis`, `pbwBasis_eq_prod_pow`, `pbwBasis_zero`, `pbwBasis_single`;
  `TauCeti.UniversalEnvelopingAlgebra.span_range_bounded_orderedPowerProducts_eq_top` and
  `TauCeti.UniversalEnvelopingAlgebra.moduleFinite_of_isIntegral_of_span_eq_top` (`Finite.lean`:
  a surjective image of `U(L)` is module-finite over commutative central scalars `S` when a finite
  spanning family of `L` maps to elements integral over `S`); the Noetherian instances of
  `PBW.Noetherian.Basic` and `.Opposite`; the Rees algebra
  `TauCeti.UniversalEnvelopingAlgebra.reesAlgebra` with `reesParameter`, `reesGenerator`,
  `reesGenerator_mul_sub_mul`, `reesOneFiberEquiv`, `reesZeroFiberEquiv`,
  `ker_reesSpecializationZero`; `TauCeti.positiveNilradical`, `TauCeti.negativeNilradical`,
  `TauCeti.borelSubalgebra`; `TauCeti.IsHighestWeightVector`, `TauCeti.VermaModule`,
  `vermaGenerator`, `isHighestWeightVector_vermaGenerator`,
  `existsUnique_lieModuleHom_apply_vermaGenerator`, `universalEnvelopingEquivVermaModule`,
  `TauCeti.kostantPartition`, `TauCeti.irreducibleQuotient`,
  `TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector`.
- **Layer 4**: `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector`,
  `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`.
- **Layer 5**: `TauCeti.exists_isCompl_of_isKilling` (characteristic zero, non-degenerate Killing
  form, no algebraic closure); `TauCeti.invForm`; `TauCeti.casimirElement`,
  `TauCeti.casimirElement_mem_center` (`UniversalEnveloping/Casimir.lean`);
  `TauCeti.vermaCentralCharacter_casimirElement`.
- **Layer 6** (`TauCeti/Algebra/Lie/Weights/FormalCharacter.lean`, `HighestWeight/Weyl/`):
  `TauCeti.formalCharacter K H M`, `formalCharacter_coeff_eq_finrank_weightSpace`,
  `formalCharacter_tensor`, `weylDenominator`, `weylNumerator`,
  `formalCharacter_mul_weylDenominator_eq_weylNumerator`, `finrank_eq_prod_coweightPairing_div`,
  `formalCharacter_coeff_eq_kostantMultiplicity`, `finrank_weightSpace_vermaModule`,
  `freudenthal_multiplicity_formula`,
  `casimirScalar_eq_of_coeff_formalCharacter_mul_weylDenominator_ne_zero`,
  `casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector`;
  `RootPairing.weylWeightOrbit`, `RootPairing.weightOrbitSum`,
  `TauCeti.formalCharacter_eq_orbitSum_add_lower`, `TauCeti.polynomial_eq_zero_of_dominantIntegral`;
  `asModule`, `asModule_ι_smul`, `lieSubmoduleOrderIso_isotypicComponent`,
  `lieSpan_equiv_irreducibleQuotient_of_isHighestWeightVector`,
  `isotypicComponent_eq_top_of_forall_isHighestWeightVector`, `LieModule.isotypicMultiplicity`,
  `LieModule.finrank_isotypicComponent`; `TauCeti.IsMinuscule`, `TauCeti.minuscule_pieri`;
  `Algebra.GrothendieckAddGroup.instCommRing` (`TauCeti/RingTheory/GrothendieckRing.lean`, the
  ring structure on the group completion of a semiring).
- **Layer 7** (`TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/`, `Chevalley/`,
  `Presentation/Serre/`): `TauCeti.vermaCentralCharacter`,
  `TauCeti.IsHighestWeightVector.representation_eq_vermaCentralCharacter_smul`,
  `TauCeti.dotAction`, `TauCeti.hcProjection`, `TauCeti.cartanProjection`,
  `TauCeti.hcProjectionLinear`, `TauCeti.dotInvariants`, `TauCeti.linearInvariants`,
  `TauCeti.harishChandraIso`, `TauCeti.harishChandraLinearIso`,
  `TauCeti.harishChandraIso_symm_mem_pbwFiltration`,
  `TauCeti.harishChandraLinearIso_symm_mem_pbwFiltration`, `TauCeti.lift_hcProjection`,
  `TauCeti.lift_hcProjectionLinear`, `TauCeti.vermaCentralCharacter_eq_iff`,
  `TauCeti.eq_of_dotAction_eq_of_mem_openDotDominantChamber`,
  `TauCeti.isotypicComponent_irreducibleQuotient_le_centerEigenspace`,
  `TauCeti.coeff_formalCharacter_eq_freudenthalRHS_div`; `TauCeti.SymmetricAlgebra.lieInvariants`,
  `TauCeti.SymmetricAlgebra.lieModuleDerivation`,
  `TauCeti.SymmetricAlgebra.lieModuleDerivation_mem_homogeneousSubmodule`,
  `TauCeti.lieCartanRestriction`, `TauCeti.killingSymmetricEquiv`,
  `TauCeti.killingSymmetricEquiv_lieModuleDerivation`, `TauCeti.map_dualMap_killingSymmetricEquiv`,
  `TauCeti.tracePowerPolynomial`, `LieSubalgebra.lieChevalleyRestrictionIso`,
  `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`, `TauCeti.expAd`,
  `TauCeti.intLieAlgebra`, `TauCeti.weylAut_apply_of_lie_eq_smul`,
  `LieSubalgebra.exists_map_intLieAlgebraLieEquiv_eq`,
  `LieSubalgebra.exists_ne_zero_forall_eval_ne_zero_mem_intCartan`;
  `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization`, `pbwSymmetrization_injective`,
  `iSup_range_pbwSymmetrization_eq_top`, `pbwSymmetrization_mem_center_iff`,
  `TauCeti.UniversalEnvelopingAlgebra.centerPBWGradedInvariantIso`, `mk_pbwSymmetrization`;
  `TauCeti.IsSerreSystem`, `TauCeti.serreLift`, `serreLift_surjective`,
  `exists_isSerreSystem_of_base`, `exists_surjective_serreLift_of_base`
  (`Presentation/Serre.lean`, `Serre/Killing.lean`).
- **Layer 8** (`TauCeti/Algebra/Octonion/`, `AlbertAlgebra/`, `CayleyDickson/`,
  `Lie/Derivation/`, `Lie/E7/`, `Lie/E8/`): `TauCeti.Octonion K` (Zorn vector matrices
  `⟨a, b, v, w⟩` with norm `a * b − v ⬝ᵥ w` and trace `a + b`), `TauCeti.Octonion.norm`,
  `TauCeti.Octonion.trace`, `TauCeti.Octonion.finrank_eq_eight`,
  `TauCeti.derivationLieAlgebra`, `TauCeti.derivationLieAlgebraCongr`,
  `TauCeti.Octonion.finrank_derivationLieAlgebra`, `TauCeti.Octonion.isSimple_derivationLieAlgebra`,
  `TauCeti.Octonion.g₂ToDerivationLieAlgebra`, `TauCeti.Octonion.g₂ToDerivationLieAlgebra_surjective`;
  `TauCeti.AlbertAlgebra K`, `TauCeti.AlbertAlgebra.det`, `TauCeti.AlbertAlgebra.mul_mul_self`,
  `TauCeti.AlbertAlgebra.six_mul_det`, `TauCeti.AlbertAlgebra.det_eq_invOf_two_mul_invOf_three_mul`,
  `TauCeti.AlbertAlgebra.finrank_derivationLieAlgebra`; `TauCeti.CayleyDickson A` (a structure with
  fields `fst`, `snd`, with `star ⟨a, b⟩ = ⟨star a, −b⟩`), `TauCeti.DivisionOctonionReal`,
  `TauCeti.DivisionOctonionReal.finrank_eq_eight`, `TauCeti.CayleyDickson.normSq`,
  `TauCeti.CayleyDickson.normSq_mul`, `TauCeti.CayleyDickson.normSq_eq_zero`,
  `TauCeti.CayleyDickson.trace`, `TauCeti.CayleyDickson.self_add_star`,
  `TauCeti.CayleyDickson.left_alternative`, `TauCeti.CayleyDickson.right_alternative`,
  `TauCeti.CayleyDickson.flexible`, `TauCeti.CayleyDickson.mul_inv_cancel₀`;
  `TauCeti.E7Minuscule` with `cartanMatrix`, `raisingMatrix`, `loweringMatrix`, `isSerreSystem`,
  `serreRepresentation` (`E7/Minuscule/Basic.lean`); `TauCeti.finrank_prod_sl_exteriorPower_dual`.
- **Layer 9** (`TauCeti/Algebra/Lie/GeneralLinear/`, `RepresentationTheory/ClassicalGroups/`,
  `Combinatorics/Young/LittlewoodRichardson/`, `RingTheory/MvPolynomial/Symmetric/Schur/`):
  `TauCeti.hasCentralRadical_iff_isCompl_center_derivedSeries`, `TauCeti.hasCentralRadical_matrix`,
  `TauCeti.exists_centralWeight_of_isIrreducible`, `TauCeti.isIrreducible_restrict_derivedSeries`,
  `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, `TauCeti.diagonalCartan`,
  `TauCeti.glWeightEquiv`, `TauCeti.IsGlDominantIntegral`, `TauCeti.IsGlHighestWeightVector`,
  `TauCeti.glIrreducible`, `TauCeti.exists_isGlHighestWeightVector_glIrreducible`,
  `TauCeti.exists_isGlHighestWeightVector_and_isGlDominantIntegral`,
  `TauCeti.nonempty_lieModuleEquiv_of_isGlHighestWeightVector`,
  `TauCeti.isIrreducible_glIrreducible_restrict_sl`, `TauCeti.gl_equiv_of_sl_equiv_of_central_scalar`,
  `TauCeti.gl_dual_standard_pieri`,
  `TauCeti.isIsotypicOfType_glIrreducible_of_forall_isGlHighestWeightVector`,
  `TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_of_forall_isGlHighestWeightVector`,
  `TauCeti.exists_isCompl_gl_of_forall_one_lie_eq_smul`, `TauCeti.glCasimir`,
  `TauCeti.glCasimir_mem_center`, `TauCeti.glCasimir_smul_of_isGlHighestWeightVector`;
  `TauCeti.DominantWeight`, `TauCeti.IsRationalRep`, `TauCeti.IsRationalRep.differential`,
  `TauCeti.IsRationalRep.mem_invtSubmodule_iff_forall_mem_invtSubmodule_differential`,
  `TauCeti.IsRationalRep.isIrreducible_differential`,
  `TauCeti.IsRationalRep.isIntertwiningMap_iff_forall_map_differential`,
  `TauCeti.IsRationalRep.differential_tprod`,
  `TauCeti.IsRationalRep.nonempty_lieModuleEquiv_glIrreducible`,
  `TauCeti.nonempty_equiv_tprod_weylRepOfShape`, `TauCeti.LRTableau`,
  `TauCeti.lrTableauEquivYamanouchi`,
  `TauCeti.diagramSchurPoly_mul_diagramSchurPoly_eq_sum_natCard_lrTableau`.
- **Layer 10** (`TauCeti/LinearAlgebra/RootSystem/Weyl/Affine/`, `Weyl/ExtendedAffine/`,
  `RootLength.lean`): `RootPairing.fundamentalAlcove`, `RootPairing.Base.highestRoot`,
  `RootPairing.coweightLattice`, `RootPairing.Base.affineCartanMatrix` (nodes `Option b.support`,
  the affine node `none`), `RootPairing.Base.specialNodes`, `RootPairing.affineWeylGroup`,
  `RootPairing.existsUnique_mem_affineWeylGroup_preimage_fundamentalAlcove_eq`,
  `RootPairing.eq_one_of_mem_affineWeylGroup_of_mapsTo`, `RootPairing.extendedAffineWeylGroup`,
  `RootPairing.fundamentalAlcoveStabilizer`, `RootPairing.fundamentalAlcoveStabilizerToQuotient`,
  `fundamentalAlcoveStabilizerToQuotient_surjective` (over an Archimedean field),
  `ker_fundamentalAlcoveStabilizerToQuotient`, `RootPairing.fundamentalAlcoveStabilizerToPerm`,
  `fundamentalAlcoveStabilizerToPerm_mem_matrixSymmetryGroup`, `TauCeti.matrixSymmetryGroup`;
  `TauCeti.DynkinType.IsLongSimpleRoot`, `TauCeti.DynkinType.simplyConnectedRootDatum`;
  `TensorProduct.leftModule`.

### From TauCetiRoadmap.RootSystems

[RootSystems](../RootSystems/README.md) §2.1 (the marked Coxeter presentation of the Weyl group),
§3.1 (classification independent of a base), §4.2 (the greatest root `RootPairing.Base.highestRoot`
and its characterization) and §§5.1–5.2 (the based automorphism group of a finite reduced
crystallographic pairing, complemented by the Weyl group, and its identification with the
permutations of `b.support` preserving every Cartan entry). Assumed: these hold for finite
reduced crystallographic pairings over a characteristic-zero domain, §5.2 with spanning.

### From TauCetiRoadmap.LieGroupoidsPoisson

[LieGroupoidsPoisson §G4.6A](../../LieGroupoidsPoisson/README.md): the positive linear Lie–Poisson
structure on the dual of a finite-dimensional real Lie algebra, `{ℓ_x, ℓ_y} = ℓ_[x,y]` on the
linear functions `ℓ_x(ξ) = ξ(x)`. Assumed: the sign is positive, as that roadmap's Checks pin it.

## How to read the build

Layer 0 is the `sl₂` engine, called by Layers 2, 4 and 5. Layer 1 assembles the Cartan and
root-space picture and the integral weight lattice from Mathlib and Tau Ceti. Layer 2 earns the
honest weight-space decomposition, integrality and Weyl invariance, in that order. Layer 3 builds
the enveloping algebra side: PBW, its Rees deformation and zero-fibre Poisson bracket, Verma
modules and `L(λ)`. Layer 4 is the dominant-integral classification and Layer 5 Weyl's complete
reducibility. Layer 6 delivers the character, dimension and Kostant formulas, the Grothendieck
ring and the decomposition toolkit. Layer 7 adds the centre of `U(L)`, the Harish-Chandra
isomorphisms, Chevalley restriction, Freudenthal's recursion and Serre's presentation, whose
injectivity is a headline. Layer 8 is independent of Layers 0–6 except through Layer 7's Serre
theorem: it builds the split octonion, Albert and `E`-series models and identifies them with
Mathlib's split algebras, and builds the compact real forms of `G₂` and `F₄` from the division
octonions. Layer 9 drops the Killing hypothesis for reductive algebras and `gl_n` and ends with the
Littlewood–Richardson rule for `gl_N`-modules. Layer 10 uses only the finite root geometry and the
native affine Weyl group API and ends with `Ω ≃ P∨/Q∨` and the affine diagram automorphisms.

## Layer 0: `sl₂` representation theory (the engine)

### 0.1 The standard irreducibles and the classification

The theory is native and consumed here. For an `sl₂` triple `t : IsSl2Triple h e f` in `L` and a
finite-dimensional module `M`, `e` and `f` move between consecutive `h`-eigenspaces and the
highest weight of a primitive vector is a natural number (`HasPrimitiveVectorWith.exists_nat`).
Consume native `TauCeti.Sl2Std K n`, the standard irreducible `V(n)` on `Kⁿ⁺¹` with `h` acting by
`n, n − 2, …, −n`, each with multiplicity one, its dimension `TauCeti.Sl2Std.finrank_eq`,
irreducibility `TauCeti.Sl2Std.isIrreducible`, and its transport to any triple generating `L`,
`TauCeti.exists_isIrreducible_hasPrimitiveVectorWith`. Consume the classification: every
finite-dimensional irreducible module over the subalgebra of a triple has a primitive vector
(`TauCeti.exists_hasPrimitiveVectorWith`), its dimension is its highest weight plus one
(`TauCeti.finrank_eq_of_hasPrimitiveVectorWith`), the highest weight determines it up to
`LieModuleEquiv` (`TauCeti.nonempty_lieModuleEquiv_of_hasPrimitiveVectorWith`), and it is
isomorphic to exactly one `V(n)` (`TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv`)
(EtingofLieGroupsLieAlgebras Theorem 11.16, p. 63, line 2516). *Needs:* Mathlib `Sl2.lean`;
Tau Ceti `TauCeti/Algebra/Lie/Sl2/Standard.lean`, `Classification.lean`.

### 0.2 Complete reducibility, the integer spectrum and Clebsch–Gordan

Consume native complete reducibility for a triple generating `L`,
`TauCeti.exists_isCompl_of_toLieSubalgebra_eq_top`, and its instance for `sl (Fin 2) K` over an
algebraically closed field of characteristic zero, `TauCeti.exists_isCompl_sl_fin_two`, proved by
the weight-string and primitive-vector argument and therefore independent of the Casimir argument
of Layer 5 (EtingofLieGroupsLieAlgebras Theorem 11.16(iv), p. 63). Consume the integer spectrum and
diagonalizability of `h` on a finite-dimensional module, `TauCeti.exists_int_of_hasEigenvalue` and
`TauCeti.iSup_eigenspace_toEnd_intCast_eq_top`; these are the corollaries Layer 2 calls. Consume
the Clebsch–Gordan rule `V(m) ⊗ V(n) ≅ ⨁_{0 ≤ k ≤ min m n} V(m + n − 2k)` as the internal direct
sum `TauCeti.Sl2Std.isInternal_cgSummand` with summands
`TauCeti.Sl2Std.nonempty_lieModuleEquiv_cgSummand` (EtingofLieGroupsLieAlgebras Theorem 11.18,
p. 65, line 2597). *Needs:* §0.1; Tau Ceti `Spectrum.lean`, `CompleteReducibility.lean`,
`ClebschGordan.lean`.

### Examples

`V(0)`, `V(1)`, `V(2)` are the trivial, standard and adjoint modules of `sl (Fin 2) K`, of
dimensions `1, 2, 3`; `V(1) ⊗ V(1) ≅ V(2) ⊕ V(0)` (dimensions `4 = 3 + 1`) and
`V(2) ⊗ V(1) ≅ V(3) ⊕ V(1)` (dimensions `6 = 4 + 2`). The `h`-spectrum of `V(3)` is `{3, 1, −1, −3}`.

### Dependencies

Mathlib `Sl2.lean` and `Classical.lean`; Tau Ceti `TauCeti/Algebra/Lie/Sl2/`. No earlier layer.

## Layer 1: Cartan subalgebras and the root-space decomposition

### 1.1 The root-space decomposition and the `sl₂` of a root

Fix `[H.IsCartanSubalgebra]`. Over an algebraically closed `K` of characteristic zero, `L` is
triangularizable over `H`, so `iSup_genWeightSpace_eq_top` gives `L = H ⊕ ⨁_{α} Lα` with each
`Lα` a line (`finrank_rootSpace_eq_one`) and `⁅Lα, Lβ⁆ ⊆ L(α+β)` (`rootSpaceWeightSpaceProduct`).
Package this as the root-space decomposition of `L`. Consume `LieAlgebra.IsKilling.rootSystem H`
with a base `base` (`RootPairing.nonempty_base`), its simple roots, positive roots, Weyl group and
Cartan matrix. For a root `α`, `exists_isSl2Triple_of_weight_isNonZero` gives the triple
`⟨eₐ, hₐ, fₐ⟩` with `hₐ = α^∨` (`IsKilling.coroot`); record that `sl2SubmoduleOfRoot` is a copy of
`sl₂`. *Needs:* Mathlib `Weights/Killing.lean`, `Weights/RootSystem.lean`; RootSystems §2.1 for
the Weyl group presentation.

### 1.2 The integral weight lattice and its Weyl action

Consume native `TauCeti.integralWeightLattice H`, the `ℤ`-submodule of `Module.Dual K H` of the
weights satisfying `TauCeti.IsIntegralWeight`, with the integer pairings `TauCeti.coweightPairing`,
the roots in it (`TauCeti.root_mem_integralWeightLattice`) and `ρ` in it
(`TauCeti.weylVector_mem_integralWeightLattice`, with `ρ(αᵢ^∨) = 1` for every simple root). Define
the fundamental weights `ϖᵢ` of `base` by `ϖᵢ(αⱼ^∨) = δᵢⱼ` for simple `i, j`, and prove that they
form a `ℤ`-basis of `TauCeti.integralWeightLattice H`, that a weight is dominant integral exactly
when its coordinates in this basis are natural numbers, and that the Weyl group preserves the
lattice, each reflection `s_α` changing `λ` by the integer multiple `λ(α^∨)` of `α`
(EtingofLieGroupsLieAlgebras §21.6, p. 109, lines 4325–4334, for `P = (Q∨)*` and the
fundamental weights as the basis dual to the simple coroots). *Needs:*
§1.1; Tau Ceti `WeightLattice.lean`, `HighestWeight/Weight/Lattice.lean`; Mathlib
`RootPairing.reflection`.

- Every weight of `TauCeti.integralWeightLattice H` is a unique `ℤ`-combination
  `Σᵢ λ(αᵢ^∨) ϖᵢ` of the fundamental weights.
- `ρ = Σᵢ ϖᵢ`.
- For `w` in the Weyl group and `λ` integral, `w λ` is integral and `(w λ)(w α^∨) = λ(α^∨)`.

**Checks.**

- For `sl (Fin 2) K` the lattice is `ℤϖ` with `ϖ = α/2`: `α = 2ϖ`, `ρ = ϖ`, and `ϖ/2` is not in
  it since `(ϖ/2)(α^∨) = 1/2`; the `K`-span of the roots would wrongly contain `ϖ/2`.
- For type `A₂` (Cartan matrix rows `(2, −1)`, `(−1, 2)`): `ρ = α₁ + α₂`, since
  `(α₁ + α₂)(α₁^∨) = 2 − 1 = 1`, and the index of the root lattice in the weight lattice is the
  determinant `4 − 1 = 3`.
- For type `G₂` the Cartan determinant is `4 − 3 = 1`, so the weight lattice equals the root
  lattice; for `B₂` the determinant `4 − 2 = 2` gives index `2`.

### Examples

For `sl (Fin 3) K` the adjoint module has weights the six roots and `0` with multiplicity `2`;
the highest root is `θ = α₁ + α₂ = ϖ₁ + ϖ₂`.

### Dependencies

Mathlib root-system and Cartan APIs; Tau Ceti `TauCeti/Algebra/Lie/Weights/WeightLattice.lean`;
RootSystems §2.1. Layer 0 is not needed for this layer.

## Layer 2: weights of a module and their integrality

### 2.1 The generalized and the honest weight-space decompositions

For a finite-dimensional `L`-module `M`, consume Mathlib's `instIsTriangularizableOfIsAlgClosed`,
so `iSup_genWeightSpace_eq_top` gives `M = ⨁_χ genWeightSpace M χ` over the finite set of weights,
with `⁅Lα, genWeightSpace M χ⁆ ⊆ genWeightSpace M (α+χ)`. These are generalized weight spaces.
Consume native `TauCeti.isSemisimple_toEnd_cartan`: for a Killing-semisimple `L` every element of
a splitting Cartan subalgebra acts semisimply on a finite-dimensional module (the abstract Jordan
decomposition), so the generalized weight spaces are honest simultaneous eigenspaces and
`μ ↦ dim Mμ` counts honest multiplicities. This stands before and independently of Layer 5.
*Needs:* Mathlib `Weights/Basic.lean`; Tau Ceti `Weights/Diagonalizable.lean`.

### 2.2 Integrality and Weyl invariance

Consume native `TauCeti.exists_int_apply_coroot`: for every weight `χ` of `M` and every root `α`,
`χ(α^∨) ∈ ℤ`, by restricting `M` to the triple of `α` (§1.1) and applying Layer 0's integer
spectrum. Prove that `μ ↦ dim Mμ` is invariant under the Weyl group directly, by restricting `M` to
the `sl₂` of each root and pairing the `μ`- and `s_α(μ)`-weight spaces along each string with
Layer 0's complete reducibility for `sl₂`, not through Weyl's theorem of Layer 5
(EtingofLieGroupsLieAlgebras Theorem 11.16, p. 63, line 2516, for the string symmetry). *Needs:*
§2.1, §0.2, §1.1; Tau Ceti `Weights/Integrality.lean`.

### Examples

For `M = L = sl (Fin 3) K` the weights are the six roots, each of multiplicity one, and `0` of
multiplicity `2`; the reflection `s₁` swaps `α₂` and `α₁ + α₂` and fixes the multiplicity `2` at
`0`.

### Dependencies

Layers 0–1; Mathlib weight spaces; Tau Ceti `Weights/Diagonalizable.lean`,
`Weights/Integrality.lean`.

## Layer 3: enveloping algebra, Verma modules, and `L(λ)`

### 3.1 PBW, finiteness over central scalars, and the triangular decomposition

Consume the native PBW development over an arbitrary field, including `F₂`, for
[Ado–Iwasawa](../AdoIwasawa/README.md): the filtration
`TauCeti.UniversalEnvelopingAlgebra.pbwFiltration` with `pbwFiltrationPrevious`, `PBWGradedPiece`
and its exhaustiveness, `TauCeti.UniversalEnvelopingAlgebra.ι_injective`,
`pbwAssociatedGradedEquiv` and the domain theorem; the ordered basis `Module.Basis.pbwBasis`, with
`pbwBasis_eq_prod_pow` (the vector at a multi-exponent is the increasing product of
`ι(bᵢ)^{mᵢ}`), `pbwBasis_zero` and `pbwBasis_single`; `map_pbwFiltration_le` for induced maps;
left and right Noetherianity from `PBW.Noetherian.Basic` and `.Opposite`
(EtingofLieGroupsLieAlgebras Theorem 13.1, p. 70, line 2787). Derive the graded-basis value
equation from `pbwAssociatedGradedEquiv` and `pbwHomogeneousComponentMap` on the same ordered
monomials, and expose the subalgebra, quotient and direct-sum specializations of the ordered span.
Consume the finiteness of `U(L)` over central scalars:
`TauCeti.UniversalEnvelopingAlgebra.span_range_bounded_orderedPowerProducts_eq_top` and
`TauCeti.UniversalEnvelopingAlgebra.moduleFinite_of_isIntegral_of_span_eq_top`, which give
`Module.Finite S A` for a surjective image `A` of `U(L)` and commutative central scalars `S` over
which a finite spanning family of `L` is integral; a subalgebra `R` of `Z(U(L))` with monic
relations for a basis enters through its commutative scalar view. Only the triangular
decomposition uses the root-space setting: consume the native triangular multiplication
equivalence `U(n⁻) ⊗ U(H) ⊗ U(n⁺) ≃ U(L)` on the nilradicals of §3.3. *Needs:* Tau Ceti
`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/`; Mathlib `UniversalEnveloping.lean`.

### 3.2 The PBW Rees deformation and its first-order Poisson bracket

Let `R` be a commutative ring and `L` a Lie `R`-algebra with a chosen ordered `R`-basis; no
semisimplicity or characteristic-zero hypothesis is imposed. Write `F_n` for the PBW filtration,
`F_{−1} = 0`. The Rees algebra `Rees_PBW(L) = {Σ aₙ tⁿ | aₙ ∈ F_n} ⊆ U_R(L)[t]` is native
`TauCeti.UniversalEnvelopingAlgebra.reesAlgebra R L`, with central parameter `reesParameter`
(`ħ = t`), generators `reesGenerator` (`j(x) = ι(x)t`) and `reesGenerator_mul_sub_mul`
(`j(x)j(y) − j(y)j(x) = ħ j([x,y])`); its fibre at `t = 1` is `reesOneFiberEquiv`, and for `L`
free its fibre at `t = 0` is `reesZeroFiberEquiv` onto `SymmetricAlgebra R L` with kernel the
two-sided ideal `ħ Rees_PBW(L)` (`ker_reesSpecializationZero`). Every commutator in the Rees
algebra is `ħ` times an element of it (native `mul_sub_mul_mem_pbwFiltrationPrevious` read
coefficientwise, with `ħ`-multiplication injective). The ambient evaluation
`U_R(L)[t] → U_R(L)` at `0` is not the zero-fibre map: it kills every `j(x)`, while the zero-fibre
class of `j(x)` is the generator `x`.

Prove the presentation of the Rees algebra as the tensor algebra over `R[t]` on `R[t] ⊗_R L`
modulo `xy − yx − t[x,y]`: algebra maps over `R[t]` into an associative `R[t]`-algebra `A`
correspond to `R`-linear `f : L → A` with `[f(x), f(y)] = t f([x,y])`. Construct both inverse maps
on the quotient and its generators; with the native ordered PBW basis prove that the increasing
products of the `j(bᵢ)` form an `R[t]`-basis, so the family is free and flat over `R[t]`. Prove
naturality under Lie homomorphisms and independence of the chosen basis. Identify the fibre at a
unit `a ∈ Rˣ` with `U_R(L)` by `j(x) ↦ a ι(x)`, and after extension to `R[t, t⁻¹]` the family with
`R[t, t⁻¹] ⊗_R U_R(L)` by `j(x) ↦ t ι(x)`; a nonzero nonunit is not covered. Prove that the
degree-`n` coefficient of the zero-fibre kernel is `F_{n−1}`. *Needs:* §3.1; Tau Ceti
`reesAlgebra` and its fibre maps.

Define the **zero-fibre bracket**: for `a, b` in the Rees algebra write `[a, b] = ħ c` with `c`
unique, and set `{ā, b̄}` to the zero-fibre class of `c`. It is independent of both lifts. Prove
bilinearity, alternation, Jacobi and the two Leibniz rules, degree `−1`, naturality, and
`{x, y} = [x, y]` on the symmetric generators; it is the unique biderivation with this generator
equation. For the dual-number base change `R[ε]/(ε²)`, write `p ⋆ q = pq + ε B₁(p, q)` through an
ordered PBW splitting, track the change of `B₁` under a change of splitting, and prove
`B₁(p, q) − B₁(q, p) = {p, q}`; the full coefficient `B₁` is not alternating. For a
finite-dimensional real `L`, the map `Sym_ℝ(L) → C∞(L*, ℝ)`, `x ↦ ℓ_x`, `ℓ_x(ξ) = ξ(x)`, is
injective and multiplicative and carries `{·,·}` to the positive Lie–Poisson bracket of
LieGroupoidsPoisson §G4.6A, `{ℓ_x, ℓ_y} = ℓ_[x,y]` (GuttDeformationQuantization, Lecture 1,
slide 14, lines 899–921, for the linear Poisson structure on `L*` and its star product through
`U(L)`). *Needs:* the Rees presentation above; LieGroupoidsPoisson §G4.6A for the smooth
comparison only.

- The bracket is `R`-bilinear and alternating, satisfies Jacobi and is a derivation in each
  argument.
- It lowers the polynomial degree by one: `{Symᵖ, Sym^q} ⊆ Sym^{p+q−1}`.
- On generators `{x, y} = [x, y]`; a Lie homomorphism `L → L'` induces a Poisson map.

**Checks.**

- For abelian `L` every commutator vanishes, the family is the constant commutative one and the
  bracket is zero.
- For the two-dimensional algebra `[x, y] = y`: `{x, y} = y` and, by Leibniz, `{x, y²} = 2y{x, y}
  = 2y²`; a bracket with the opposite sign would give `−2y²`.
- For `sl₂` with `[h, e] = 2e`, `[h, f] = −2f`, `[e, f] = h`: `j(h)² + 2ħ j(h) + 4j(f)j(e)` is
  central in the Rees algebra, and its zero-fibre symbol `h² + 4ef` is Poisson-central:
  `{h, h² + 4ef} = 4(2ef − 2ef) = 0`, `{e, h² + 4ef} = −4he + 4eh = 0`,
  `{f, h² + 4ef} = 4hf − 4hf = 0`.
- With the ordered splitting for `x < y`, `B₁(x, y) = 0` and `B₁(y, x) = −[x, y]`, so `B₁` is not
  alternating while `B₁(x, y) − B₁(y, x) = [x, y] = {x, y}`.

### 3.3 Borel subalgebras, Verma modules and `L(λ)`

The subalgebras of the base are native, keeping `base` for the root-system base:
`TauCeti.positiveNilradical H base` (`n⁺ = ⨁_{α>0} Lα`), `TauCeti.negativeNilradical H base` and
`TauCeti.borelSubalgebra H base` (`𝔟 = H ⊕ n⁺`). Consume `TauCeti.IsHighestWeightVector`; a highest
weight module of weight `λ` is generated by such a vector, its weights lie in `λ − ℕ`-span of the
simple roots, and its `λ`-weight space is a line. The Verma module `M(λ) = U(L) ⊗_{U(𝔟)} K_λ` is
native `TauCeti.VermaModule base λ` with `vermaGenerator`, `isHighestWeightVector_vermaGenerator`,
the universal property `existsUnique_lieModuleHom_apply_vermaGenerator` (evaluation at the
generator identifies `Hom_L(M(λ), N)` with the vectors satisfying the Cartan eigenvalue and
`n⁺`-annihilation equations, including zero), and freeness of rank one over `U(n⁻)`
(`universalEnvelopingEquivVermaModule`). Compare the induced-tensor presentation with this module.
The Kostant partition function `P(ν)`, the number of ways to write `ν` as a sum of positive roots,
is native `TauCeti.kostantPartition`; its generating series inverts the Weyl denominator,
`Σ_ν P(ν) e^{−ν} = 1/∏_{α>0}(1 − e^{−α})` (EtingofLieGroupsLieAlgebras Exercise 26.7(i), p. 133,
line 5289; it is the vector partition function of the positive roots,
DeConciniProcesiVergneBoxSplines §3.1, eq. (18), p. 19, lines 803–819), and the weight
multiplicities of `M(λ)` are `P(λ − μ)`. `M(λ)` has a unique maximal submodule, the sum of the
submodules meeting the `λ`-weight space trivially, and a unique irreducible quotient `L(λ)`,
native `TauCeti.irreducibleQuotient base λ`; `L(λ) ≅ L(μ)` iff `λ = μ`
(`TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector`). This classifies all
irreducible highest weight modules, finite-dimensional or not. The universe of `L(λ)` is the
maximum of the scalar and Lie-algebra universes, and its consumers allow it. *Needs:* §§3.1,
1.1; Tau Ceti `TauCeti/Algebra/Lie/HighestWeight/`.

### Examples

For `sl₂` and `λ = n` the Verma module has weights `n, n − 2, n − 4, …`, each of multiplicity
`P = 1`, and `f^{n+1} v` generates the maximal submodule, so `L(n) = V(n)`. For `A₂`,
`P(α₁ + α₂) = 2` (as `α₁ + α₂` itself or `α₁` plus `α₂`).

### Dependencies

Layers 1–2; Tau Ceti PBW, Rees, Verma and quotient modules; LieGroupoidsPoisson §G4.6A
(§3.2's smooth comparison only).

## Layer 4: the classification of finite-dimensional irreducibles

### 4.1 Dominance and finite-dimensionality

Consume native `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` and
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`. A
finite-dimensional irreducible module has a highest weight vector (a nonzero vector of the top
weight space for the height order, killed by `n⁺`), so it is `≅ L(λ)` for a unique `λ`, and `λ` is
dominant integral because each simple `sl₂` forces a natural highest weight (Layer 0). The hard
direction, that `L(λ)` is finite-dimensional for dominant integral `λ`, runs through the
integrability relation (`fᵢ^{λ(αᵢ^∨)+1} v` is a highest weight vector in `M(λ)`, hence zero in
`L(λ)`), local nilpotence of every root vector via the Serre relations, Weyl invariance of the
weight support inside the convex hull of `W·λ`, and finiteness of each weight space by the
Kostant bound of §3.3 (EtingofLieGroupsLieAlgebras Theorem 25.17, p. 128, line 5088). Hence
`λ ↦ L(λ)` is a bijection from dominant integral weights to isomorphism classes of
finite-dimensional irreducible `L`-modules, the interface consumed by
[ClassicalGroups](../ClassicalGroups/README.md) Layer 3. *Needs:* Layers 0, 2, 3.

### Examples

For `sl₂`, `L(n)` is `V(n)` and `L(λ)` is infinite-dimensional for `λ ∉ ℕ`; for `A₂`,
`L(ϖ₁)` is the standard module `K³` and `L(ϖ₁ + ϖ₂)` the adjoint module.

### Dependencies

Layers 0, 2 and 3; Tau Ceti `HighestWeight/`.

## Layer 5: complete reducibility (Weyl's theorem)

### 5.1 The invariant form on weights and the Casimir element

Consume native `TauCeti.invForm`, the form on `Module.Dual K H` transported from the Killing form
through `cartanEquivDual`, with `⟨λ, α^∨⟩⟨α, α⟩ = 2⟨λ, α⟩`, and native `TauCeti.casimirElement K L`,
built from a basis and its Killing-dual basis, central by `TauCeti.casimirElement_mem_center`, and
acting on the top line of `M(λ)`, hence on `L(λ)`, by `⟨λ+ρ, λ+ρ⟩ − ⟨ρ, ρ⟩`
(`TauCeti.vermaCentralCharacter_casimirElement`). The highest-weight predicates, Verma modules,
weight form and Casimir in Layers 3, 5 and 7 are the same objects. *Needs:* Layer 3; Tau Ceti
`UniversalEnveloping/Casimir.lean`, `Weights/InvariantForm.lean`.

### 5.2 Weyl's complete reducibility theorem

Consume native `TauCeti.exists_isCompl_of_isKilling`: over a field of characteristic zero, every
Lie submodule of a finite-dimensional module over a Killing-semisimple `L` has a complement
(EtingofLieGroupsLieAlgebras Theorem 18.8, p. 93, line 3704). Its proof treats the algebraically
closed case through the Casimir (the eigenvalue separates the trivial module from the nontrivial
irreducibles, and the Hom and dual Lie modules reduce a general extension to an extension by the
trivial module), and descends from an algebraic closure by solving finite linear equations. Hence
every finite-dimensional module is `⨁_λ L(λ)^{⊕ m_λ}`, and characters are additive. Ado–Iwasawa
consumes the arbitrary-field theorem. *Needs:* §5.1; Tau Ceti `HighestWeight/CompleteReducibility.lean`.

### Examples

For `sl₂` with the Killing form `κ(h, h) = 8`, `κ(e, f) = 4`, the Casimir acts on `V(n)` by
`n(n+2)/8`; the submodule `V(2)` of `V(1) ⊗ V(1)` has the complement `V(0)`, the Casimir
eigenspaces for `1` and `0`.

### Dependencies

Layer 3 (Verma top line); Mathlib Killing form; Tau Ceti `Casimir.lean`, `CompleteReducibility.lean`.

## Layer 6: the Weyl character, dimension, and Kostant formulas

### 6.1 Formal characters and the Grothendieck ring

Consume native `TauCeti.formalCharacter K H M`, `μ ↦ dim Mμ` in `Module.Dual K H →₀ ℤ`, with
`formalCharacter_coeff_eq_finrank_weightSpace` and multiplicativity `formalCharacter_tensor`. Define
the **Grothendieck ring** `R(L)` as the group completion, with the native ring structure
`Algebra.GrothendieckAddGroup.instCommRing`, of the commutative semiring of isomorphism classes of
finite-dimensional `L`-modules under `⊕` and `⊗` (unit the trivial module `K`), and prove that the
formal character extends to an injective ring homomorphism `R(L) → ℤ[P]` onto the Weyl-invariant
elements, with the classes `[L(λ)]`, `λ` dominant integral, a `ℤ`-basis. *Needs:* Layer 5 for
additivity on direct sums of irreducibles, Layer 4 for the basis; Tau Ceti
`TauCeti/RingTheory/GrothendieckRing.lean`, `Weights/FormalCharacter.lean`.

- `[M ⊕ N] = [M] + [N]` and `[M ⊗ N] = [M][N]`, with unit `[K]`.
- The character of `[M]` is the formal character of `M`; two finite-dimensional modules with equal
  characters are isomorphic.
- The image of the character is `ℤ[P]^W`, and the `[L(λ)]` form a basis of `R(L)`.

**Checks.**

- For `sl₂`, `[V(1)]² = [V(2)] + [V(0)]`: the characters satisfy
  `(e^{ϖ} + e^{−ϖ})² = (e^{2ϖ} + 1 + e^{−2ϖ}) + 1`.
- The unit is `[V(0)]`, of character `e⁰ = 1`, not the class of the zero module, of character `0`.
- `[V(2)]` and `3[V(0)]` have the same dimension `3` but characters `e^{2ϖ} + 1 + e^{−2ϖ}` and
  `3`; a dimension-valued homomorphism would identify them.

### 6.2 The Weyl character, dimension and Kostant formulas

Consume native `formalCharacter_mul_weylDenominator_eq_weylNumerator` on the native irreducible
quotient and its generator: for dominant integral `λ`,
`ch L(λ) · ∏_{α>0}(1 − e^{−α}) = Σ_{w ∈ W} sgn(w) e^{w(λ+ρ) − ρ}` in `ℤ[P]`
(EtingofLieGroupsLieAlgebras Theorem 26.4, p. 131, line 5190). Its route is native
`freudenthal_multiplicity_formula` and
`casimirScalar_eq_of_coeff_formalCharacter_mul_weylDenominator_ne_zero`, independent of the
Harish-Chandra isomorphism and of category-`O` linkage. Consume the dimension formula
`dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩` in `ℚ` (`finrank_eq_prod_coweightPairing_div`) and
Kostant's formula `mult_μ L(λ) = Σ_{w ∈ W} sgn(w) P(w(λ+ρ) − (μ+ρ))`
(`formalCharacter_coeff_eq_kostantMultiplicity`; EtingofLieGroupsLieAlgebras Exercise 26.7(ii),
p. 133, line 5294), proved by expanding the character formula against the geometric series of the
inverse denominator. Consume the orbit inputs `RootPairing.weylWeightOrbit`,
`RootPairing.weightOrbitSum` and the triangular expansion
`TauCeti.formalCharacter_eq_orbitSum_add_lower` (`ch L(λ) = m_λ + Σ_{μ<λ} c_μ m_μ`, `c_μ ∈ ℕ`), and
`TauCeti.polynomial_eq_zero_of_dominantIntegral`. Prove that for dominant integral `λ` the dominant
integral `μ` with `λ − μ` in the `ℕ`-span of the simple roots form a finite set.

Prove the **fixed-point form**: in the fraction field of `ℤ[P]`,
`ch L(λ) = Σ_{w ∈ W} e^{wλ} / ∏_{α>0}(1 − e^{−wα})`, using the inversion identity
`wρ − ρ = −Σ_{α>0, w⁻¹α<0} α` and `∏_{α>0}(1 − e^{−wα}) = sgn(w) e^{ρ − wρ} ∏_{α>0}(1 − e^{−α})`,
the sign `(−1)^{ℓ(w)}` coming from the `ℓ(w)` factors with `wα < 0`. *Needs:* §6.1; Tau Ceti
`HighestWeight/Weyl/`.

### 6.3 The decomposition toolkit

Consume native `asModule`, `asModule_ι_smul` and `lieSubmoduleOrderIso_isotypicComponent` for the
enveloping-algebra dictionary (Lie submodules of `M` are the `U(L)`-submodules), the multiplicity
`LieModule.isotypicMultiplicity` (`m_λ = dim Hom_L(L(λ), M)`), the finrank identity
`LieModule.finrank_isotypicComponent` (`dim` of the isotypic component is `m_λ · dim L(λ)`),
`lieSpan_equiv_irreducibleQuotient_of_isHighestWeightVector` (in a finite-dimensional module a
highest weight vector of weight `λ` generates a copy of `L(λ)`; in general only a Verma quotient)
and `isotypicComponent_eq_top_of_forall_isHighestWeightVector` (if every highest weight vector has
weight `λ`, the module is `L(λ)`-isotypic). The tensor multiplicity `c^ν_{λμ}` of `L(ν)` in
`L(λ) ⊗ L(μ)` satisfies `ch L(λ) · ch L(μ) = Σ_ν c^ν_{λμ} ch L(ν)` by `formalCharacter_tensor`.
A dominant integral `μ` is minuscule when the weights of `L(μ)` form one Weyl orbit; consume the
minuscule Pieri rule `L(λ) ⊗ L(μ) ≅ ⨁_τ L(λ+τ)` over the weights `τ` of `L(μ)` with `λ+τ`
dominant, each with multiplicity one (native `TauCeti.IsMinuscule`, `TauCeti.minuscule_pieri`).
*Needs:* §§6.1–6.2, Layer 5; Tau Ceti isotypic and minuscule files.

### Examples

- For `sl₂` and `λ = ϖ`: `ch L(ϖ)(1 − e^{−2ϖ}) = e^{ϖ} − e^{−3ϖ}`, the two Weyl terms
  `e^{ϖ}` and `−e^{s(2ϖ) − ϖ} = −e^{−3ϖ}`. The fixed-point form gives
  `e^{ϖ}/(1 − e^{−2ϖ}) + e^{−ϖ}/(1 − e^{2ϖ}) = (e^{ϖ} − e^{−3ϖ})/(1 − e^{−2ϖ}) = e^{ϖ} + e^{−ϖ}`;
  at `λ = 0` it gives `1/(1 − e^{−α}) + 1/(1 − e^{α}) = 1`; and `sρ − ρ = −α`.
- For `A₂`, `dim L(aϖ₁ + bϖ₂) = (a+1)(b+1)(a+b+2)/2` gives `3, 3, 8, 6, 10` at `ϖ₁, ϖ₂,
  ϖ₁+ϖ₂, 2ϖ₁, 3ϖ₁`, and Kostant's formula gives the multiplicity `2` of `0` in the adjoint module.
- The dominance condition of the minuscule Pieri rule is essential: for `sl₂`, `λ = 0`, `μ = ϖ`,
  the weight `−ϖ` of `L(ϖ)` is not dominant after adding `λ`, and `L(0) ⊗ L(ϖ) = L(ϖ)`.
- For `sl₂` and `M = (V(1) ⊗ V(1)) ⊕ V(0)`, the isotypic multiplicities at the weights `2, 1, 0`
  are `1, 0, 2`, the component dimensions `3 + 0 + 2` sum to `dim M = 5`.

### Dependencies

Layers 3–5; Tau Ceti `Weights/FormalCharacter.lean`, `HighestWeight/Weyl/`, isotypic and minuscule
files, `RingTheory/GrothendieckRing.lean`.

## Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

### 7.1 The centre, central characters and the Harish-Chandra isomorphisms

`Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)` contains the Casimir of Layer 5.
The central character `χ_(base,λ) : Z(U(L)) →ₐ[K] K` is native `TauCeti.vermaCentralCharacter base λ`,
read on the top line of `M(λ)`; consume
`TauCeti.IsHighestWeightVector.representation_eq_vermaCentralCharacter_smul` and
`TauCeti.vermaCentralCharacter_casimirElement`. Write `ev_λ : S(H) →ₐ[K] K` for
`SymmetricAlgebra.lift λ`. The dot action `w·λ = w(λ+ρ) − ρ` is native `TauCeti.dotAction`. The
raw projection `HC_dot` is native `TauCeti.hcProjection`, the restriction to the centre of
`(ε₋ ⊗ id ⊗ ε₊) ∘ PBW⁻¹` through `TauCeti.cartanProjection`, with no translation; the linear
projection `TauCeti.hcProjectionLinear` is `τ_(−ρ) ∘ HC_dot`, so `HC_lin(z)(λ) = HC_dot(z)(λ − ρ)`.
Their images are `TauCeti.dotInvariants` and `TauCeti.linearInvariants`, and the isomorphisms
`TauCeti.harishChandraIso : Z(U(L)) ≃ₐ[K] S(H)^{W·}` and
`TauCeti.harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W` are native, with filtration bounds
`TauCeti.harishChandraIso_symm_mem_pbwFiltration` and
`TauCeti.harishChandraLinearIso_symm_mem_pbwFiltration` (EtingofRepresentationsLieGroups
Theorem 14.1, pp. 70–71, line 3041). The equations `χ_λ(z) = ev_λ(HC_dot(z)) = ev_(λ+ρ)(HC_lin(z))`
are `TauCeti.lift_hcProjection` and `TauCeti.lift_hcProjectionLinear`. Changing to the opposite
Borel changes the weight labelling. *Needs:* Layers 3, 5; Tau Ceti `CentralCharacter/`.

### 7.2 Chevalley restriction and Cartan conjugacy

Consume the native restriction theory: the Lie invariants `TauCeti.SymmetricAlgebra.lieInvariants`
of `S(L)` (killed by `TauCeti.SymmetricAlgebra.lieModuleDerivation`, homogeneous by
`lieModuleDerivation_mem_homogeneousSubmodule`), the Killing-orthogonal restriction
`TauCeti.lieCartanRestriction` (identity on `H`, zero on each root space), the Killing
identification `TauCeti.killingSymmetricEquiv : S(L) ≃ S(L*)` with
`TauCeti.killingSymmetricEquiv_lieModuleDerivation` and `TauCeti.map_dualMap_killingSymmetricEquiv`,
the trace polynomials `TauCeti.tracePowerPolynomial`, and
`LieSubalgebra.lieChevalleyRestrictionIso : S(L)^L ≃ₐ[K] S(H)^W` with
`LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`
(EtingofRepresentationsLieGroups Theorem 10.1, p. 51, line 2153). Consume the inner automorphisms
`TauCeti.expAd`, `TauCeti.intLieAlgebra`, `TauCeti.weylAut_apply_of_lie_eq_smul`
(`exp(ad e) exp(−ad f) exp(ad e)` sends `h` to `h − α(h)α^∨`), and Cartan conjugacy
`LieSubalgebra.exists_map_intLieAlgebraLieEquiv_eq` through
`LieSubalgebra.exists_ne_zero_forall_eval_ne_zero_mem_intCartan` (EtingofLieGroupsLieAlgebras
Theorem 20.10, p. 103, line 4049). Cartan conjugacy is not used by the Chevalley injectivity proof.
CharacteristicClasses C5.1 consumes these results. *Needs:* Layers 1–6; Tau Ceti `Chevalley/`.

### 7.3 Symmetrization, centre symbols and the dot-orbit theorem

Over a field of characteristic zero the degree-`n` symmetrization
`TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization K L n`,
`x₁⋯xₙ ↦ (1/n!) Σ_σ ι(x_σ(1))⋯ι(x_σ(n))`, is linear and injective (`pbwSymmetrization_injective`),
its ranges span `U(L)` (`iSup_range_pbwSymmetrization_eq_top`), and a symmetrized tensor is central
iff it is `L`-invariant (`pbwSymmetrization_mem_center_iff`); the centre symbols are
`TauCeti.UniversalEnvelopingAlgebra.centerPBWGradedInvariantIso` and `mk_pbwSymmetrization`
(EtingofLieGroupsLieAlgebras Corollary 13.7, p. 71, line 2827). Compare the first-order product
of §3.2 with symmetrization: the lift of a quadratic symmetric product is
`sym(xy) = (j(x)j(y) + j(y)j(x))/2`, and the dual-number product on linear generators is
`x ⋆ y = xy + (ε/2)[x, y]`; prove this equation and that its antisymmetrization is §3.2's bracket
(GuttDeformationQuantization, Lecture 1, slide 14, eq. (3), lines 905–913: the degree-one part
of `σ(x)σ(y)` is `½σ([x, y])`). No factor `1/2` enters §3.2. Consume the dot-orbit theorem
`TauCeti.vermaCentralCharacter_eq_iff` (`χ_λ = χ_μ` iff `μ ∈ W·λ`), and the separation of dominant
weights by the centre: `TauCeti.eq_of_dotAction_eq_of_mem_openDotDominantChamber` (a dominant
integral `λ` is the only weight of the open dot chamber in its dot orbit) and
`TauCeti.isotypicComponent_irreducibleQuotient_le_centerEigenspace` (the centre acts on the
`L(λ)`-isotypic component by `χ_λ`). A single Casimir eigenvalue does not separate dominant
weights in general; the full centre does. *Needs:* §§3.2, 7.1.

### 7.4 Freudenthal's formula

Consume native `TauCeti.freudenthal_multiplicity_formula`: `mult_λ = 1`, and for a weight `μ` of
`L(λ)`, `(⟨λ+ρ, λ+ρ⟩ − ⟨μ+ρ, μ+ρ⟩) mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} ⟨μ+jα, α⟩`, the inner
sum finite. For an actual weight `μ ≠ λ` the left coefficient is nonzero
(`casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector`) and the
solved form is `TauCeti.coeff_formalCharacter_eq_freudenthalRHS_div`; no nonzero-denominator claim
is made at absent weights. *Needs:* Layers 2, 5, 6.

### 7.5 Serre's presentation

Work over any `[Field K] [CharZero K]` with `[FiniteDimensional K L] [LieAlgebra.IsKilling K L]`, a
Cartan subalgebra `H` with `[IsTriangularizable K H L]` and `[LieAlgebra.IsSimple K L]`. Consume the
native `exists_isSerreSystem_of_base`: it supplies `e, f : ↥base.support → L`, the simple coroots
`hᵢ = ((rootSystem H).coroot i : L)`, `TauCeti.IsSerreSystem K base.cartanMatrix.transpose h e f`
and `LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤`, without algebraic closure, from
normalized simple-root `sl₂` triples. `TauCeti.serreLift` sends the generators of
`Matrix.ToLieAlgebra K base.cartanMatrix.transpose` to these families and is surjective
(`serreLift_surjective`, `exists_surjective_serreLift_of_base`).

Prove `serreLift_injective_of_base`: for every family `e, f` that satisfies the Serre relations
for the transposed Cartan matrix of `base` together with the simple coroots and generates `L`, the
lift `TauCeti.serreLift hS` from Mathlib's Serre-presented algebra to `L` is injective
(EtingofLieGroupsLieAlgebras Theorem 24.2, p. 122, line 4818, over `ℂ`; HumphreysIntroLieAlgebras
§18.3). Route: show that the simple Cartan generators and one bracket word per root span the
presented algebra (a root-graded straightening from the Serre relations), that their images are
the normalized coroot and root-space basis of `L` (root strings, Jacobi and characteristic-zero
coefficients), and conclude by independence of the images. Combine with surjectivity into the
presentation equivalence with its `H/E/F` value equations; the reducible Killing-semisimple case
is the direct sum of the simple ideals. With `A = base.cartanMatrix`, the native convention is
`A i j = αᵢ(hⱼ)` while `CartanMatrix.Relations.HE` imposes `⁅Hᵢ, Eⱼ⁆ = CM i j • Eⱼ`; hence
`⁅hᵢ, eⱼ⁆ = αⱼ(hᵢ) • eⱼ = A j i • eⱼ`, and the higher relations are `ad(eᵢ)^(1 − A j i) eⱼ = 0` and
`ad(fᵢ)^(1 − A j i) fⱼ = 0`. *Needs:* §1.1; Mathlib `SerreConstruction.lean`,
`RootPairing.Base.equivOfCartanMatrixEq`; Tau Ceti `Presentation/Serre.lean`, `Serre/Killing.lean`.

### Examples

- `sl₂` with the diagonal Cartan spanned by `h = E₀₀ − E₁₁`, `e = E₀₁` positive and `ρ(h) = 1`:
  `Ω = h² + 2h + 4fe` is central, `Polynomial K ≃ₐ[K] Z(U(sl₂))` sends `X` to `Ω`, and
  `Ω = 8 · TauCeti.casimirElement K (sl (Fin 2) K)` for `κ(h, h) = 8`, `κ(e, f) = 4`. In the
  coordinate `t = λ(h)` the raw map sends `Ω` to `t² + 2t`, invariant under `t ↦ −t − 2`, and the
  linear map to `t² − 1`, invariant under `t ↦ −t`; `χ_n(Ω) = n(n+2)` and `χ_λ = χ_μ` iff `μ = λ`
  or `μ = −λ − 2`. Freudenthal on `V(n)` returns `1` at each of `n, n − 2, …, −n`.
- Serre transpose test in type `B₂`, `A = [[2, −2], [−1, 2]]`: `⁅h₁, e₂⁆ = α₂(h₁) e₂ = A 2 1 • e₂
  = −e₂`, while the untransposed matrix would give `−2e₂`; simply-laced matrices do not detect the
  transpose. For `A₁`, `dim Matrix.ToLieAlgebra K (CartanMatrix.A 1) = 3 = dim sl₂`.

### Dependencies

Layers 1–6; Mathlib `SerreConstruction.lean`; Tau Ceti `CentralCharacter/`, `Chevalley/`,
`Presentation/Serre/`; GuttDeformationQuantization for §7.3.

## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as Serre quotients. This layer identifies
concrete split models over every field of characteristic zero through §7.5: for each model, prove
finite-dimensionality and Killing-simplicity, construct a split Cartan `H` with
`[IsTriangularizable K H L]`, compute its root system, base and coroots, and give the index
equivalence taking `base.cartanMatrix.transpose` to the named Cartan matrix with the generator
scalings. The compact real forms are a separate `K = ℝ` track, compared with the split models only
after the stated scalar extension to `ℂ`; "formally real" is never asserted over an algebraically
closed field.

### 8.1 The split octonions and `G₂ = Der(𝕆)`

Consume the native Zorn carrier `TauCeti.Octonion K` (`⟨a, b, v, w⟩`, norm `a * b − v ⬝ᵥ w`,
trace `a + b`) with its conjugation, norm and trace. Define the **split Cayley–Dickson comparison**:
an explicit `K`-linear equivalence from `TauCeti.Octonion K` to the Cayley–Dickson double of the
split quaternions `Matrix (Fin 2) (Fin 2) K`, preserving unit, product, conjugation, norm and
trace (a comparison of nonassociative algebras, not an `AlgEquiv`). *Needs:* Tau Ceti
`TauCeti/Algebra/Octonion/Basic.lean`, `CayleyDickson/Basic.lean`.

- The comparison is unital and multiplicative, and intertwines the two conjugations.
- It carries the norm and the trace of `TauCeti.Octonion K` to those of the double.
- It is natural in ring homomorphisms `K → K'`.

**Checks.**

- The Zorn idempotent `e = ⟨1, 0, 0, 0⟩` has `e * e = e`, norm `1 · 0 − 0 = 0` and trace `1`; its
  image is a nonzero isotropic idempotent, which no comparison onto the division octonions over
  `ℝ` could produce, their norm being anisotropic.
- Both sides have dimension `8` (`TauCeti.Octonion.finrank_eq_eight`), and the unit has trace `2`.
- `⟨0, 0, v, 0⟩ * ⟨0, 0, v', 0⟩ = ⟨0, 0, 0, v ⨯₃ v'⟩`: products of the off-diagonal parts are not
  coordinatewise, so a pointwise pair product would fail the comparison.

The derivation algebra `TauCeti.derivationLieAlgebra K (TauCeti.Octonion K)` is native with
dimension `14` (`TauCeti.Octonion.finrank_derivationLieAlgebra`), simplicity
(`TauCeti.Octonion.isSimple_derivationLieAlgebra`) and the Serre lift
`TauCeti.Octonion.g₂ToDerivationLieAlgebra : LieAlgebra.g₂ K →ₗ⁅K⁆ Der(𝕆)`, surjective for `2` and
`3` invertible (`TauCeti.Octonion.g₂ToDerivationLieAlgebra_surjective`). Prove
`g₂ToDerivationLieAlgebra_injective`: over every field of characteristic zero this lift is
injective, so `Der(𝕆)` is the split `LieAlgebra.g₂ K` (SchaferNonassociative Ch. III, p. 28,
lines 1022–1025: the derivation algebra of a Cayley algebra in characteristic not `3` is central
simple of dimension `14`, of type `G₂`; BaezOctonions §4.1, p. 35, line 1601, takes `g₂ = der(𝕆)`
as its definition and computes the dimension on p. 36, line 1623). Route: `Matrix.ToLieAlgebra K
CartanMatrix.G₂` has dimension at most `14` by §7.5's spanning argument, and a surjection onto a
`14`-dimensional algebra from it is injective. Prove that `Im 𝕆` is the `7`-dimensional
irreducible of highest weight the short fundamental weight. *Needs:* §7.5; Tau Ceti
`TauCeti/Algebra/Octonion/`.

### 8.2 The split Albert algebra and `F₄ = Der(H₃(𝕆))`

Consume the native coordinate carrier `TauCeti.AlbertAlgebra K` with its symmetrized product,
cyclic off-diagonal layout (`a_i = diag(i)`, `x_i = offDiag(i)`), trace and trace-zero submodule,
and its cubic invariants: `TauCeti.AlbertAlgebra.det`,
`det A = a0 a1 a2 − a0 N(x0) − a1 N(x1) − a2 N(x2) + tr_𝕆((x0 x1) x2)`; the cubic equation
`TauCeti.AlbertAlgebra.mul_mul_self`, `A∘(A∘A) = tr(A)(A∘A) − s(A)A + det(A)1` with
`2s(A) = tr(A)² − tr(A∘A)`; and `TauCeti.AlbertAlgebra.six_mul_det`,
`6 det A = tr(A)³ − 3 tr(A) tr(A²) + 2 tr(A³)`, with
`TauCeti.AlbertAlgebra.det_eq_invOf_two_mul_invOf_three_mul` when `2` and `3` are invertible
(BaezOctonions §3.4, p. 32, lines 1479–1481). Define the **Hermitian-matrix presentation**: an
explicit product-preserving `K`-linear equivalence between `TauCeti.AlbertAlgebra K` and the
`3 × 3` Hermitian matrices over the split Cayley–Dickson octonions of §8.1 with product
`½(AB + BA)`, each octonion product parenthesized, preserving trace and determinant. Give the
homogeneous cubic, polarization and scalar-extension APIs of `det` on the native
`[CommRing R] [Invertible (2 : R)]` carrier. *Needs:* §8.1; Tau Ceti `AlbertAlgebra/`.

- The presentation preserves unit, product, trace and `det`.
- It restricts to an equivalence of the trace-zero parts, of dimension `26`.
- `det` is a homogeneous cubic form whose polarization is symmetric trilinear.

**Checks.**

- `tr 1 = 3` and `det 1 = 1`; `det(diag(a0, a1, a2)) = a0 a1 a2`.
- For `A = 1 + offDiag₀(x)`, `det A = 1 − N(x)`: with `x = 1` the classical matrix
  `[[1, 0, 0], [0, 1, 1], [0, 1, 1]]` has determinant `0 = 1 − 1`.
- For `x ≠ 0` with `N(x) = 0` (for instance the Zorn idempotent of §8.1), `offDiag₀(x)∘offDiag₀(x) = 0`:
  the split algebra is not formally real, which is what separates it from §8.4's `J`.

The derivation algebra is `52`-dimensional (native `TauCeti.AlbertAlgebra.finrank_derivationLieAlgebra`)
with the `26`-dimensional trace-zero representation. Construct its split Cartan and root-matrix
comparison, and prove `nonempty_derivationAlbert_lieEquiv_f₄`: over every field of characteristic
zero, `TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K)` is isomorphic to `LieAlgebra.f₄ K`
(SchaferNonassociative Ch. IV, p. 41, lines 1461–1465: the derivation algebra of an exceptional
central simple Jordan algebra is central simple of dimension `52`, of type `F₄`; BaezOctonions §4.2,
p. 39, lines 1779–1782, takes `f₄ = der(h₃(𝕆))` as its definition). *Needs:* §7.5, §8.1; Tau Ceti
`AlbertAlgebra/Derivation/Finrank.lean`.

### 8.3 The division octonions, the cross product and compact `G₂`

This sublane is independent of Layers 0–7 and of projective geometry. The doubling is native:
`TauCeti.CayleyDickson A` (a structure with fields `fst`, `snd`, not the pair type with its
pointwise operations), and `TauCeti.DivisionOctonionReal := TauCeti.CayleyDickson ℍ[ℝ]` with
product `(a, b)(c, d) = (ac − star(d) b, da + b star(c))`, positive conjugation
`star(a, b) = (star a, −b)`, norm `TauCeti.CayleyDickson.normSq` (`N(a, b) = ‖a‖² + ‖b‖²`,
multiplicative and definite), trace `T(a, b) = 2 re(a)`, and the alternative, flexible, inverse and
cancellation laws native. This product is not Baez's doubling `(ac − db*, a*d + cb)` (BaezOctonions
§2.2, eq. (2), p. 8, line 354); the explicit comparison between the two conventions is part of this
target. Transport the normed additive group through the equivalence with `WithLp 2 (A × A)`, give
the ordered eight-coordinate Euclidean model with smooth multiplication, conjugation and inverse on
nonzero elements, and prove the Moufang identities, the polarization of `N`, `‖x‖² = N(x)`, and
associativity and conjugation-closure of every two-generated subalgebra. No associative `Ring`,
`DivisionRing`, `NormedRing` or `AlgEquiv` is asserted. *Needs:* Tau Ceti
`TauCeti/Algebra/CayleyDickson/`.

Define on `A = TauCeti.DivisionOctonionReal` the **cross-product structure**: `Im(A) = ker T`,
`g(v, w) = −re(vw)`, `v × w = (vw − wv)/2`, the three-form `φ(u, v, w) = g(u × v, w)` and the
associator `[u, v, w] = (uv)w − u(vw)`. Prove `vw = −g(v, w)1 + v × w` on `Im(A)`, positive
definiteness of `g`, `dim Im(A) = 7`, `u × (u × v) = g(u, v)u − g(u, u)v`, and the trilinear identity
`(u × v) × w − u × (v × w) = [u, v, w] + g(u, v)w − g(v, w)u` (BaezOctonions §4.1, pp. 37–38,
lines 1701–1719, for the cross product `a × b = ½[a, b]` on `Im 𝕆` and its stabilizer `G₂`). For a derivation `D`, prove `D(1) = 0`, that `exp(tD)` preserves the
product by uniqueness for the linear ODE in the associative endomorphism algebra, and only then
that it preserves `N`; this gives both inclusions between the native derivation algebra and the
infinitesimal automorphisms. Taking traces in `[D, L_x] = L_{Dx}` gives `tr(L_{Dx}) = 0`, not
`tr(D L_x) = 0`, so a trace shortcut needs a separate argument. *Needs:* the division octonions
above.

- `g` is symmetric and positive definite on `Im(A)`, and `×` is alternating with
  `g(u × v, w)` alternating in `u, v, w`.
- `u × (u × v) = g(u, v)u − g(u, u)v` for all `u, v ∈ Im(A)`.
- The associator is alternating and vanishes on every quaternion subalgebra.

**Checks.**

- With `i = (i, 0)`, `j = (j, 0)`, `k = (k, 0)`: `g(i, i) = −re(i²) = 1` and `i × j = (ij − ji)/2 = k`;
  `i × (i × j) = i × k = −j = g(i, j)i − g(i, i)j`.
- With `ℓ = (0, 1)`: `jℓ = (0, j)`, `ℓj = (0, −j)`, so `j × ℓ = (0, j)` and `i × (j × ℓ) = (0, −k)`,
  whereas the three-dimensional formula `g(i, ℓ)j − g(i, j)ℓ` gives `0`: the vector triple product
  identity fails for unrelated vectors in dimension seven.
- `[i, j, ℓ] = kℓ − i(0, j) = (0, k) − (0, −k) = (0, 2k)`, and the trilinear identity holds:
  `(i × j) × ℓ − i × (j × ℓ) = (0, k) − (0, −k) = (0, 2k)`, the `g`-terms being `0`.

Compare this real algebra with the split carrier only after scalar extension to `ℂ`: construct a
complex-linear, unital, product-preserving equivalence from `ℂ ⊗[ℝ] A` to `TauCeti.Octonion ℂ` on
the native tensor-product nonassociative ring (`Algebra.TensorProduct.instNonAssocRing`,
`tmul_mul_tmul`), extending conjugation by `z ⊗ x ↦ z ⊗ star x` (fixing the complex coefficient,
unlike the tensor `star` and unlike complex conjugation), and transport derivations along it with
`TauCeti.derivationLieAlgebraCongr`. Prove the finite-dimensional Leibniz-kernel base change
`ℂ ⊗[ℝ] Der(A) ≅ Der(ℂ ⊗[ℝ] A)`. Complexification does not identify the two real forms.

Prove `finrank_derivationLieAlgebra_divisionOctonionReal`: the derivation Lie algebra
`TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal` has dimension `14`, from the base
change and `g₂ToDerivationLieAlgebra_injective` at `K = ℂ`. Prove
`killingForm_derivationLieAlgebra_divisionOctonionReal_lt_zero`: its Killing form is negative
definite, `κ(D, D) < 0` for `D ≠ 0`, because `exp(tD)` preserves `N`, so `Der(A)` lies in the
compact `so(7)` of `Im(A)`, `ad D` is skew for the restricted positive form, and the centre is
zero; it is the compact real form of `G₂`, not split `LieAlgebra.g₂ ℝ`, whose Killing form is
indefinite (signature `(8, 6)`); LieGroups Layer 7's compact `G₂` application consumes this
sublane. *Needs:* §8.1, the base change above.

### 8.4 The formally real Albert algebra and compact `F₄`

Define the **formally real Albert algebra** `J`: scalar diagonal `Fin 3 → ℝ` and cyclic
off-diagonal entries in `TauCeti.DivisionOctonionReal`, in the Hermitian positions of native
`TauCeti.AlbertAlgebra`, with Jordan product the entrywise symmetrization `½(AB + BA)`, each octonion
product parenthesized; give `NonAssocCommRing`, `Module ℝ`, `SMulCommClass ℝ J J`,
`IsScalarTower ℝ J J`, extensionality, bilinearity, unit, conjugation, `IsCommJordan`, power
associativity, trace and trace zero, and the determinant
`det A = a0 a1 a2 − a0 N(x0) − a1 N(x1) − a2 N(x2) + T((x0 x1) x2)` (LandsbergManivelMagicSquare
§1.3, p. 4, lines 140–153, for `J₃(A)` with product `½(AB + BA)` and its determinant). *Needs:* §8.3.

- `dim J = 27`, the trace-zero part has dimension `26`, and the trace form `tr(A∘B)` is positive
  definite and associative: `tr((A∘B)∘C) = tr(A∘(B∘C))`.
- Formal reality: `Σᵢ Aᵢ∘Aᵢ = 0` implies every `Aᵢ = 0`.
- The cubic characteristic identity and trace-power formula hold as on the split carrier; every
  element has a spectral decomposition into orthogonal primitive idempotents, the primitive
  idempotents are exactly the trace-one idempotents, and a complete orthogonal primitive frame has
  three elements.

**Checks.**

- For `A = offDiag₀(x)` with `x ≠ 0`, `A∘A = diag(0, N(x), N(x))` in the layout of `x0`, of trace
  `2‖x‖² > 0`; in the split algebra an isotropic `x` gives `A∘A = 0`, so the split model fails
  formal reality.
- `E = diag(1, 0, 0)` satisfies `E∘E = E`, `tr E = 1`, `det E = 0`; `1 = Σᵢ diag(eᵢ)` is a frame of
  three primitive idempotents.
- `P = ½(diag(0, 1, 1) + offDiag₀(1))` satisfies `P∘P = P` and `tr P = 1`, a primitive idempotent off
  the diagonal frame; `det(1 + offDiag₀(1)) = 1 − N(1) = 0`.

Prove that the commutators `[L_A, L_B]` are derivations and skew for the trace form; supply the
fixed `27`-coordinate Euclidean topology, smooth product, trace and determinant maps, and the native
derivation algebra `TauCeti.derivationLieAlgebra ℝ J` with its trace-zero representation. Construct
`ℂ ⊗[ℝ] J` on the native tensor-product Jordan algebra with the complexified quadratic form
(`QuadraticForm.baseChange`), trace by linear extension and cubic
`((tr A)³ − 3 tr(A) tr(A²) + 2 tr(A³))/6`, and a complex-linear, unital, product-preserving
equivalence to `TauCeti.AlbertAlgebra ℂ` preserving trace and determinant. Prove that
`ℂ ⊗[ℝ] Der(J)` is the derivation algebra of the complexified product (Leibniz kernels and flat
base change, with brackets), and with `TauCeti.derivationLieAlgebraCongr` and
`nonempty_derivationAlbert_lieEquiv_f₄` at `K = ℂ` identify it with split complex `F₄`; derive
`dim Der(J) = 52` and zero centre. Prove that every derivation is skew-adjoint for the trace form
(`tr(L_A) = 9 tr(A)` and `[D, L_A] = L_{DA}` give `tr(DA) = 0`, and Leibniz with the associative
trace form gives skewness) and that the Killing form is negative definite,
`κ(D, D) = −‖ad D‖² < 0` for `D ≠ 0`. These give the compact real form of `F₄` without projective
geometry; the split and division real forms are not identified; TangentialBordism §§9.1–9.2
consumes the result. *Needs:* §§8.2–8.3.

### 8.5 The `E`-series

Two constructions are kept apart. The **Vinberg `ℤ/3`-model of split `E₈`**: on
`𝔢₈ = 𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)*` (dimension `248 = 80 + 84 + 84`, native
`TauCeti.finrank_prod_sl_exteriorPower_dual`), define the `ℤ/3`-graded bracket: `𝔰𝔩₉` acting
naturally, `⋀³ × ⋀³ → ⋀⁶ ≅ (⋀³)*` through the volume form, and `⋀³ × (⋀³)* → 𝔰𝔩₉` by the trace-free
part of the contraction; prove Jacobi, Killing-simplicity and type `E₈`. The **models of `E₆` and
`E₇`**: `E₆` with its `27`-dimensional representation `J`, as the derivation algebra of the split
Albert algebra plus the multiplications by trace-zero elements (`78 = 52 + 26`), and `E₇` with its
`56`-dimensional representation on the Freudenthal triple system `K ⊕ J ⊕ J ⊕ K`, as
`J ⊕ (𝔢₆ ⊕ K) ⊕ J` (`133 = 27 + 79 + 27`) (LandsbergManivelMagicSquare §1.1, p. 2, lines 66–79, for
the magic square `Der A ⊕ (A₀ ⊗ J₃(B)₀) ⊕ Der J₃(B)`, and §1.3, p. 4, lines 154–169, for the groups
preserving the cubic form on `J₃(𝕆)` and the quartic on the Freudenthal algebra). For the `56`,
consume the native integral `TauCeti.E7Minuscule` tables and `serreRepresentation`, and prove after
entrywise `ℤ → K` extension and the Cartan-index comparison that the Freudenthal model's generator
action is intertwined with it; the invariant symplectic and quartic forms and the identification
of the `133`-dimensional algebra remain targets here. Identify each model with `LieAlgebra.e₆`,
`e₇`, `e₈ K` through §7.5. *Needs:* §§7.5, 8.2; Mathlib `exteriorPower`; Tau Ceti `Lie/E7/`,
`Lie/E8/`.

- The Vinberg bracket is `ℤ/3`-graded and restricts to the natural action of `𝔰𝔩₉` on each summand.
- The diagonal trace-zero matrices are a split Cartan subalgebra of rank `8`.
- The `E₆` and `E₇` models contain the split `F₄` of §8.2 and the `E₆` model, respectively.

**Checks.**

- Roots of the Vinberg model: the `72` roots of `𝔰𝔩₉` and the `84 + 84` weights `±(εᵢ + εⱼ + εₖ)`
  (restricted to trace zero) of `⋀³` and its dual, `72 + 168 = 240`, so `dim = 8 + 240 = 248`.
- `h = E₁₁ − E₂₂ ∈ 𝔰𝔩₉` acts on `e₁ ∧ e₂ ∧ e₃` by `1 − 1 = 0` and on `e₁ ∧ e₃ ∧ e₄` by `1`.
- `78 = 52 + 26` for `E₆` and `133 = 27 + (78 + 1) + 27` for `E₇`; the Freudenthal module has
  dimension `1 + 27 + 27 + 1 = 56`.

Independently of the models, prove `finrank_e₆`, `finrank_e₇` and `finrank_e₈`: over every field of
characteristic zero, Mathlib's Serre-presented algebras `LieAlgebra.e₆ K`, `LieAlgebra.e₇ K`,
`LieAlgebra.e₈ K` have dimensions `78 = 6 + 72`, `133 = 7 + 126` and `248 = 8 + 240` (rank plus
number of roots; EtingofLieGroupsLieAlgebras Theorem 24.2(iv), p. 122, line 4826, over `ℂ`;
BaezOctonions §4.6, p. 49, line 2175, for `248`). *Needs:* §7.5; Mathlib `CartanMatrix.E₆`,
`E₇`, `E₈`.

### Examples

`G₂ = Der(𝕆)` has its `7` on `Im 𝕆`; the Weyl dimension formula on `G₂` gives `7` and `14` at the
two fundamental weights. `F₄` has dimension `52` and its `26` on the trace-zero Albert algebra.
The adjoint representation of `E₈` has dimension `248`, the Weyl dimension formula at the highest
root.

### Dependencies

§7.5 (all split identifications); Layer 6 (dimension checks); Mathlib exterior powers and tensor
products of nonassociative algebras; Tau Ceti octonion, Cayley–Dickson, Albert, derivation, `E₇`
and `E₈` files. The compact sublanes §§8.3–8.4 need no earlier layer except through
`g₂ToDerivationLieAlgebra_injective` and `nonempty_derivationAlbert_lieEquiv_f₄` at `K = ℂ`.

## Layer 9: reductive Lie algebras and `gl_n`

### 9.1 Reductive Lie algebras and their irreducibles

`radical = center` iff `L` is the direct sum of its centre and its derived ideal with the derived
ideal semisimple; both conjuncts are needed (`sl₂ ⋉ K²` has trivial centre and derived ideal all of
`L`). For `gl_n` the centre is the scalars, the derived ideal `sl n`, and `gl_n` is reductive. Over
algebraically closed `K` the centre acts on a finite-dimensional irreducible by a central weight
with no integrality constraint, the restriction to the derived ideal is irreducible, and complete
reducibility holds when every central element acts semisimply. Native:
`TauCeti.hasCentralRadical_iff_isCompl_center_derivedSeries`, `TauCeti.hasCentralRadical_matrix`,
`TauCeti.exists_centralWeight_of_isIrreducible`, `TauCeti.isIrreducible_restrict_derivedSeries`,
`TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`. *Needs:* Layer 5; Tau Ceti
`GeneralLinear/Radical.lean`.

### 9.2 Highest weights for `gl_n`

Native: the diagonal Cartan `TauCeti.diagonalCartan`, the weight coordinates
`TauCeti.glWeightEquiv` (`μ ↦ (A ↦ Σᵢ μᵢ Aᵢᵢ)`), dominance on differences
`TauCeti.IsGlDominantIntegral`, highest weight vectors `TauCeti.IsGlHighestWeightVector`, the named
carrier `TauCeti.glIrreducible n μ` with `TauCeti.exists_isGlHighestWeightVector_glIrreducible`, the
classification `TauCeti.exists_isGlHighestWeightVector_and_isGlDominantIntegral` and
`TauCeti.nonempty_lieModuleEquiv_of_isGlHighestWeightVector`, the `sl ↔ gl` transfer
`TauCeti.isIrreducible_glIrreducible_restrict_sl` and `TauCeti.gl_equiv_of_sl_equiv_of_central_scalar`
(`gl_n` is spanned by `sl_n` and `1`), the dual-standard Pieri rule `TauCeti.gl_dual_standard_pieri`
(`V* ⊗ L(μ) ≅ ⨁_t L(μ − ε_t)` over the `t` with `μ − ε_t` dominant), the single-weight criterion
`TauCeti.isIsotypicOfType_glIrreducible_of_forall_isGlHighestWeightVector` and its direct-sum form
`TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_of_forall_isGlHighestWeightVector`, with
complete reducibility from the semisimple identity matrix
(`TauCeti.exists_isCompl_gl_of_forall_one_lie_eq_smul`), and the trace-form Casimir
`TauCeti.glCasimir = Σ_{i,j} E_ij E_ji`, central (`TauCeti.glCasimir_mem_center`) and acting on a
module generated by a highest weight vector of weight `μ` by `Σᵢ μᵢ(μᵢ + n − 1 − 2i)`
(`TauCeti.glCasimir_smul_of_isGlHighestWeightVector`). An irreducible with a highest weight vector
of weight `μ` has minimal dimension among modules with a cyclic highest weight vector of weight
`μ`. *Needs:* §9.1, Layers 0, 2, 4, 6; Tau Ceti `GeneralLinear/`.

### 9.3 Rational representations and the Littlewood–Richardson rule

Over `ℂ` the differentiation of rational `GL_n`-representations is native: the differential
`TauCeti.IsRationalRep.differential`, its stable subspaces
(`TauCeti.IsRationalRep.mem_invtSubmodule_iff_forall_mem_invtSubmodule_differential`),
irreducibility (`TauCeti.IsRationalRep.isIrreducible_differential`), intertwiners
(`TauCeti.IsRationalRep.isIntertwiningMap_iff_forall_map_differential`), tensor products
(`TauCeti.IsRationalRep.differential_tprod`), and the identification of an irreducible rational
representation with a highest weight vector of dominant weight `λ` with `TauCeti.glIrreducible n λ`
(`TauCeti.IsRationalRep.nonempty_lieModuleEquiv_glIrreducible`). The integer dominant weights
`TauCeti.DominantWeight n` sit inside `TauCeti.IsGlDominantIntegral` as the integer-coordinate
weights; shifting by `m · (1, …, 1)`, `m ∈ ℤ`, is the determinant twist, while the Lie condition
also allows shifts by any `c ∈ K`, which need not integrate.

Prove `finrank_lieModuleHom_glIrreducible_tmul_eq_card_lrTableau`: over every field `K` of
characteristic zero, for Young diagrams `λ`, `μ`, `ν` with at most `N` rows, the dimension of the
space of `gl_N`-module maps from `TauCeti.glIrreducible N ν` to
`TauCeti.glIrreducible N λ ⊗ TauCeti.glIrreducible N μ` (weights the row lengths) is the number
`Nat.card (TauCeti.LRTableau λ ν μ)` of Littlewood–Richardson tableaux of skew shape `ν/λ` and
content `μ` (Stembridge2002LR, Corollary on p. 3, line 109, at `ν = ∅`, line 121: `s_λ s_μ` is the
sum of `s_{λ+ω(T)}` over the `λ`-Yamanouchi tableaux `T` of straight shape `μ`; native
`TauCeti.lrTableauEquivYamanouchi` identifies those with `λ + ω(T) = ν` with `TauCeti.LRTableau λ ν μ`).
Route over `ℂ`: the native group-level rule `TauCeti.nonempty_equiv_tprod_weylRepOfShape` decomposes
the tensor product of Weyl modules over the same Yamanouchi tableaux; differentiate with the native
bridge above, identify each irreducible summand with `TauCeti.glIrreducible`, and read off the Hom
dimensions with the intertwiner comparison. Over a general field of characteristic zero, the Hom
spaces are defined over `ℚ` and their dimensions are unchanged by extension of scalars; equivalently
compare characters directly with the native polynomial identity
`TauCeti.diagramSchurPoly_mul_diagramSchurPoly_eq_sum_natCard_lrTableau`. The count is not defined
to be a tensor multiplicity. *Needs:* §9.2; Tau Ceti `RepresentationTheory/ClassicalGroups/`
(differential and Weyl-module tensor products), `Combinatorics/Young/LittlewoodRichardson/`,
`RingTheory/MvPolynomial/Symmetric/Schur/`.

### Examples

- `gl₂`: the irreducibles are the pairs `(μ₁, μ₂)` with `μ₁ − μ₂ ∈ ℕ`, of dimension `μ₁ − μ₂ + 1`,
  restricting to `V(μ₁ − μ₂)` on `sl (Fin 2) K` with the centre acting by `μ₁ + μ₂`; the trace-form
  Casimir scalar is `μ₁(μ₁ + 1) + μ₂(μ₂ − 1)`, which is `2` at `(1, 0)`, matching `Σ E_ij E_ji = 2·I`
  on `K²`. The standard character is `t₁ + t₂`. On `gl₁` every `μ : K` is dominant, while
  `TauCeti.DominantWeight 1` sees only `ℤ`.
- The staircase `ν = (N − 1/2, …, 1/2)` is dominant with no integer entry, every `ν − ε_t` stays
  dominant, and `C(ν − ε_t) − C(ν − ε_s) = 4(t − s)` (zero-based), so `TauCeti.glCasimir`
  separates the `N` summands of `V* ⊗ L(ν)` in `TauCeti.gl_dual_standard_pieri`.
- Littlewood–Richardson: for `N = 2`, `λ = μ = (1)`, the counts are `1` at `ν = (2)` and at
  `ν = (1, 1)` (`V ⊗ V = Sym² V ⊕ ⋀² V`); for `N = 1` the shape `(1, 1)` is excluded by the row bound
  and `s_(1)² = s_(2)` in one variable; for `N = 0` all three shapes are empty and both sides are
  `1`. Without the row bound on `ν` the count `1` at `ν = (1, 1)`, `N = 1` would contradict
  `Hom(L(1), L(2)) = 0`.

### Dependencies

Layers 0, 2, 4–6; Tau Ceti `GeneralLinear/`, `RepresentationTheory/ClassicalGroups/`,
`Combinatorics/Young/LittlewoodRichardson/`, `RingTheory/MvPolynomial/Symmetric/Schur/`. Layer 8
is not used.

## Layer 10: affine Weyl geometry and the coweight quotient `P∨/Q∨`

This layer uses the finite root geometry of RootSystems and the native affine and extended affine
Weyl group API; it uses no compact group, compact torus or period theorem.

### 10.1 The lattice comparison and the affine data

Define the **based root-datum comparison** from the integral weight lattice
`TauCeti.integralWeightLattice H` of §1.2 to the character lattice of the native simply connected
datum `TauCeti.DynkinType.simplyConnectedRootDatum` of the same type, preserving roots, coroot
pairings and the Weyl action; for another isogeny form keep its own lattice `Q ⊆ X ⊆ P`
(adjoint `A₁` has `X = 2ℤϖ`, not `P`). For an integral root datum `D` with `X`, `Y` finite free
over `ℤ`, form the rational extension on `ℚ ⊗[ℤ] X` and `ℚ ⊗[ℤ] Y` (`x ↦ 1 ⊗ x`, with
`TensorProduct.leftModule`, and the tensor flip to the right-factor models), and prove the induced
rational pairing perfect, crystallographic, reduced, irreducible and spanning when `D` is
semisimple and irreducible; the integral `IsRootSystem`/`IsIrreducible` mixins are too strong for a
non-unimodular datum. With `Q = ℤΦ`, define the coweight lattice `P∨ = Hom_ℤ(Q, ℤ)` and
`V = Hom_ℤ(Q, ℝ)` with the comparison `ℝ ⊗[ℤ] Hom_ℤ(Q, ℤ) ≃ V`, `a ⊗ f ↦ (q ↦ a f(q))`, and prove
that `Q∨ = ℤΦ∨` embeds in `P∨` with finite quotient (EtingofLieGroupsLieAlgebras §21.6, p. 109,
lines 4325–4334, for `P∨ = Q*` and the fundamental coweights). The long roots are those of
`TauCeti.DynkinType.IsLongSimpleRoot` transported along Weyl orbits, and `θ` is
`RootPairing.Base.highestRoot` (RootSystems §4.2). *Needs:* §1.2; RootSystems §§3.1, 4.2; Tau Ceti
`DynkinType`, `RootLength.lean`; Mathlib `TensorProduct`.

- `P∨/Q∨` is finite of order the determinant of the Cartan matrix.
- The comparison of `P` with the simply connected character lattice is Weyl-equivariant.
- The fundamental coweights `ϖᵢ∨` (`αⱼ(ϖᵢ∨) = δᵢⱼ`) form a `ℤ`-basis of `P∨`.

**Checks.**

- `A₁`: `Q = ℤα`, `P∨ = ℤϖ∨` with `ϖ∨ = α∨/2`, `Q∨ = ℤα∨`, so `P∨/Q∨ ≅ ℤ/2`.
- `G₂`: the Cartan determinant is `1`, so `P∨ = Q∨`; `B₂`: determinant `2`, `P∨/Q∨ ≅ ℤ/2`.
- `A₂`: determinant `3`, `P∨/Q∨ ≅ ℤ/3`; the adjoint form has `X = Q`, of index `3` in `P`.

### 10.2 `Ω ≃ P∨/Q∨`

The open fundamental alcove `A = {x ∈ V | αᵢ(x) > 0 for every simple αᵢ, θ(x) < 1}` is native
`RootPairing.fundamentalAlcove`, with the affine simple roots `αᵢ` and `α₀ = 1 − θ`, the coweight
lattice `RootPairing.coweightLattice`, the affine Cartan matrix `RootPairing.Base.affineCartanMatrix`
on the nodes `Option b.support` (`none` the affine node) and its special nodes
`RootPairing.Base.specialNodes`. The affine Weyl group `RootPairing.affineWeylGroup` (`Q∨ ⋊ W`)
acts simply transitively on alcoves
(`RootPairing.existsUnique_mem_affineWeylGroup_preimage_fundamentalAlcove_eq`,
`RootPairing.eq_one_of_mem_affineWeylGroup_of_mapsTo`); the extended affine Weyl group
`RootPairing.extendedAffineWeylGroup` (`P∨ ⋊ W`), the stabilizer
`RootPairing.fundamentalAlcoveStabilizer` (`Ω`), the translation-class map
`RootPairing.fundamentalAlcoveStabilizerToQuotient : Ω → P∨/Q∨` with its surjectivity
(`fundamentalAlcoveStabilizerToQuotient_surjective`) and kernel `Ω ∩ W_aff`
(`ker_fundamentalAlcoveStabilizerToQuotient`) are native.

Prove `fundamentalAlcoveStabilizerToQuotient_bijective`: for a finite reduced irreducible
crystallographic root pairing over an Archimedean ordered field, the map taking an element of `Ω` to
the class of its translation part is a bijection `Ω ≃ P∨/Q∨` (GarnierAlcoves §2.2, p. 7, line 362;
Proposition-Definition 2.2.1, p. 8, line 389, which parametrizes `Ω` by the minuscule coweights).
The kernel is trivial because `W_aff` acts freely on alcoves. This is the length-zero subgroup, not
an assertion that every element of `W_ext` stabilizes `A`. *Needs:* §10.1; Tau Ceti
`Weyl/Affine/Alcove.lean`, `Weyl/ExtendedAffine/Alcove.lean`.

### 10.3 Automorphisms of the affine diagram

Let `Γ_root` be the based automorphism group of RootSystems §5.1, identified by RootSystems §5.2
with the permutations of `b.support` preserving every oriented Cartan entry; it preserves the
simple roots, the root lengths and every Cartan integer, with no choice of isogeny lattice. Extend
each element to the affine node by fixing it. An affine Cartan automorphism is an element of
`TauCeti.matrixSymmetryGroup b.affineCartanMatrix`: a permutation of `Option b.support` preserving
the untwisted affine Cartan matrix, multiple-edge orientation included. Native
`RootPairing.fundamentalAlcoveStabilizerToPerm` records the action of `Ω` on the alcove walls,
preserving that matrix (`fundamentalAlcoveStabilizerToPerm_mem_matrixSymmetryGroup`). Prove the
conjugation action of `Γ_root` on `Ω` and the isomorphism `Ω ⋊ Γ_root ≃ Aut(affine Cartan matrix)`,
whose bijective core is `existsUnique_fundamentalAlcoveStabilizerToPerm_mul`: every affine Cartan
automorphism `σ` is, uniquely, a symmetry `τ` of the affine Cartan matrix fixing the affine node,
followed by the wall permutation of an element `ω` of `Ω`, that is `σ = π(ω) ∘ τ` (GarnierAlcoves
Corollary 2.2.7, p. 10, line 642). Uniqueness: an element of `Ω` fixing the wall `α₀ = 0` fixes the
opposite vertex `0`, so lies in `W ∩ Ω = 1`. Existence: every affine-diagram automorphism sends
special nodes to special nodes, and `Ω` acts simply transitively on them, so `π(ω)⁻¹ ∘ σ` fixes the
affine node for the `ω` with `π(ω)(0) = σ(0)`; the stabilizer of the affine node restricts to
`Γ_root`. For a reducible root system, work on each irreducible component and include the
permutations of isomorphic components; rank zero has no nodes and trivial groups. For an isogeny
form with cocharacter lattice `Y`, the subgroup `Γ_Y ≤ Γ_root` preserving `Y` is the one acting on
its quotients; an arbitrary isogeny lattice is not preserved by every diagram automorphism.
*Needs:* §10.2; RootSystems §§5.1–5.2; Tau Ceti `Weyl/ExtendedAffine/Wall.lean`,
`Matrix/Submatrix.lean`.

- `Γ_root` acts on `Ω` by conjugation, compatibly with its action on `P∨/Q∨`.
- The wall permutation `π : Ω → Aut(affine Cartan matrix)` is an injective homomorphism with normal
  image.
- The stabilizer of the affine node in `Aut(affine Cartan matrix)` is the image of `Γ_root`.

**Checks.**

- `A₂`, nodes `{0, 1, 2}`, `σ = (0 1)`: in the order `σ = π(ω) ∘ τ`, `π(ω)(0) = σ(0) = 1`, so
  `π(ω)` is the rotation `0 ↦ 1 ↦ 2 ↦ 0` and `τ = π(ω)⁻¹ ∘ σ = (1 2)`; the opposite order
  `σ = τ′ ∘ π(ω′)` forces `π(ω′)(1) = 0`, the inverse rotation, a different element of `Ω`.
- Orders: `A₁` has `|Ω| = 2`, `Γ_root = 1`, `|Aut| = 2`; `A_r` (`r ≥ 2`) has `Ω ≅ C_{r+1}`,
  `Γ_root ≅ C₂` acting by inversion, and the dihedral `Aut` of order `2(r+1)`; `D₄` has
  `Ω ≅ C₂ × C₂`, `Γ_root ≅ S₃` permuting its three nonzero elements, `|Aut| = 24 = 4 · 6`; `E₆`
  has `Ω ≅ C₃`, `Γ_root ≅ C₂` acting by inversion, `|Aut| = 6`; `E₈`, `F₄`, `G₂` have `Ω = 1`.
- `B₂` (affine `C₂`, `0 ⇒ 1 ⇐ 2`): `Ω ≅ C₂` swaps the end nodes `0` and `2`, and `Γ_root = 1`
  because swapping the two finite nodes reverses the double edge; a model ignoring orientation
  would give `Γ_root ≅ C₂` and `|Aut| = 4`.

### Examples

The checks above in types `A₁`, `A_r`, `B₂`, `D₄` and `E₆` fix the affine node, the orientation and
the semidirect-product convention.

### Dependencies

§1.2; RootSystems §§3.1, 4.2, 5.1–5.2; Tau Ceti affine and extended affine Weyl group files,
`DynkinType`, `matrixSymmetryGroup`. No Lie-group, compact-torus or period input.

## Worked examples

- **`sl₂`.** `V(n)` has dimension `n + 1` and spectrum `{n, n − 2, …, −n}`; Clebsch–Gordan
  `V(1) ⊗ V(1) ≅ V(2) ⊕ V(0)`; the Weyl dimension formula gives `n + 1`; the centre is `K[Ω]` with
  `χ_n(Ω) = n(n+2)` (§7 Examples).
- **The adjoint representation.** For simple `L` (for example `sl (Fin 3) K`) the adjoint module is
  `L(θ)`, with weights the roots and `0` of multiplicity `rank L`; the Weyl dimension formula at
  `θ` returns `dim L`.
- **`sl₃` weight diagrams.** `V(ϖ₁)`, `V(ϖ₂)` of dimension `3`, the adjoint `V(ϖ₁ + ϖ₂)` of
  dimension `8` with hexagonal weight diagram and `0` of multiplicity `2` (by Kostant and by
  Freudenthal), `V(2ϖ₁)` of dimension `6` and `V(3ϖ₁)` of dimension `10`; the multiplicities of
  `V(2ϖ₁ + 2ϖ₂)` by Freudenthal's recursion.
- **Exceptional algebras.** `finrank K (Der 𝕆) = 14` and `Der 𝕆 ≅ LieAlgebra.g₂ K` with `Im 𝕆`
  its `7`; `finrank K (Der H₃(𝕆)) = 52` with the `26`; `E₈` of dimension `248 = 80 + 84 + 84`.
- **`gl_N` and the single-weight criterion.** For the staircase `ν`, every `ν − ε_t` survives in
  `V* ⊗ L(ν)` and the Casimir separates the summands (§9 Examples); a module whose highest weight
  vectors all have weight `ν` and on which the identity matrix acts semisimply is `L(ν)`-isotypic.
  For a nonzero nilpotent `2 × 2` Jordan block over `gl₁` the only highest weight is `0` but the
  kernel has no invariant complement, so the semisimplicity hypothesis is essential.

## Downstream consumers

- [ClassicalGroups](../ClassicalGroups/README.md) Layer 3 consumes the classification of Layer 4.
- [LieGroups](../LieGroups/README.md) consumes Layer 0's `sl₂` strings and integrality, Layer 3's
  PBW theorem, Layer 7's Serre data and highest-weight lines, and §8.3's compact `G₂`.
- [Ado–Iwasawa](../AdoIwasawa/README.md) consumes §3.1's PBW and finiteness over central scalars and
  §5.2's complete reducibility over an arbitrary field of characteristic zero.
- [ChevalleyGroups](../../ChevalleyGroups/README.md) consumes Layers 3–4 and specializes §7.5's
  Serre theorem.
- [CharacteristicClasses C5.1](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings)
  consumes §7.2's Chevalley restriction.
- [SpinRepresentations](../SpinRepresentations/README.md) Layer 9 applies §9.2's dual-standard Pieri
  rule and single-weight criterion to its CAR module, where the identity matrix acts by `N²/2`.
- [TangentialBordism §§9.1–9.2](../../TangentialBordism/README.md#91-idempotent-cayley-plane-b36)
  consumes §8.4's formally real Albert algebra and compact `F₄`.
- [DGFloer](../../DGFloer/README.md) consumes §§8.3–8.4's division octonions and formally real
  Albert algebra.

## References

- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972)
  (key `HumphreysIntroLieAlgebras`, cited by its locator): Serre's theorem (§18.3), and the
  classical development of `sl₂`, root systems, PBW, `L(λ)`, Weyl's theorem and the Weyl and
  Kostant formulas (Ch. II–VI).
- P. Etingof, *Lie groups and Lie algebras* (lecture notes, arXiv:2201.09397v5) (key
  `EtingofLieGroupsLieAlgebras`): the `sl₂` classification (Theorem 11.16, p. 63) and Clebsch–Gordan
  rule (Theorem 11.18, p. 65), PBW (Theorem 13.1, p. 70) and symmetrization (Corollary 13.7, p. 71),
  Weyl's complete reducibility (Theorem 18.8, p. 93), Cartan conjugacy (Theorem 20.10, p. 103), the
  weight and coweight lattices with the fundamental weights (§21.6, p. 109),
  Serre's theorem (Theorem 24.2, p. 122), finite-dimensionality of `L(λ)` (Theorem 25.17, p. 128),
  the Weyl character formula (Theorem 26.4, p. 131) and the Kostant partition function and
  multiplicity formula (Exercise 26.7, p. 133).
- P. Etingof, *Representations of Lie groups* (lecture notes, arXiv:2401.01446v2) (key
  `EtingofRepresentationsLieGroups`): Chevalley restriction (Theorem 10.1, p. 51) and the
  Harish-Chandra isomorphism (Theorem 14.1, pp. 70–71).
- S. Gutt, *Deformation quantization and symmetries*, lectures 1–2 (Würzburg, 2019) (key
  `GuttDeformationQuantization`): the linear Poisson structure on `𝔤*` and its star product through
  `U(𝔤)` (Lecture 1, slide 14).
- C. De Concini, C. Procesi, M. Vergne, *Box splines and the equivariant index theorem*
  (arXiv:1012.1049v3) (key `DeConciniProcesiVergneBoxSplines`): vector partition functions as
  inverses of difference operators (§3.1, eq. (18), p. 19).
- R. D. Schafer, *An Introduction to Nonassociative Algebras*, lecture notes, Oklahoma State
  University (1961), Project Gutenberg EBook #25156 (key `SchaferNonassociative`): the derivation
  algebras of Cayley algebras (type `G₂`, Ch. III, p. 28) and of exceptional Jordan algebras (type
  `F₄`, Ch. IV, p. 41). The expanded 1966 Academic Press book has a different numbering.
- J. C. Baez, *The Octonions*, Bull. Amer. Math. Soc. 39 (2002), cited from arXiv:math/0105155v4
  (key `BaezOctonions`), whose page numbers are used: the Cayley–Dickson convention (§2.2, eq. (2),
  p. 8), the Albert determinant (§3.4, p. 32), `G₂` and `F₄` (§§4.1–4.2, pp. 35 and 39, where
  `g₂ = der(𝕆)` and `f₄ = der(h₃(𝕆))` are taken as definitions) and `dim 𝔢₈ = 248` (§4.6, p. 49).
- J. M. Landsberg, L. Manivel, *The projective geometry of Freudenthal's magic square*
  (arXiv:math/9908039v1) (key `LandsbergManivelMagicSquare`): the magic-square construction (§1.1,
  p. 2) and the Jordan algebra `J₃(A)`, its cubic form and the Freudenthal algebra (§1.3, p. 4).
- J. R. Stembridge, *A concise proof of the Littlewood–Richardson rule*, Electron. J. Combin. 9
  (2002), #N5 (key `Stembridge2002LR`): the Littlewood–Richardson rule (Corollary on p. 3).
- A. Garnier, *Fundamental domains for extended affine Weyl groups* (author's manuscript, 2020;
  key `GarnierAlcoves`, printed page numbers): `Ω ≃ P∨/Q∨` (§2.2, p. 7), the alcove stabilizer
  (Proposition-Definition 2.2.1, p. 8) and `Aut(affine diagram) ≃ Ω ⋊ Aut(diagram)`
  (Corollary 2.2.7, p. 10).
- J.-P. Serre, *Complex Semisimple Lie Algebras*, Springer (1987); W. Fulton, J. Harris,
  *Representation Theory: A First Course*, Springer GTM 129 (1991); J. E. Humphreys,
  *Representations of Semisimple Lie Algebras in the BGG Category O*, AMS GSM 94 (2008);
  N. Bourbaki, *Lie Groups and Lie Algebras*, Chapters 7–8; N. Jacobson, *Exceptional Lie Algebras*
  (1971); R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255
  (2009); J. Dixmier, *Enveloping Algebras*, AMS GSM 11 (1996); A. Molev, *Yangians and Classical
  Lie Algebras*, AMS (2007): background for the classical theory, cited by chapter only.
