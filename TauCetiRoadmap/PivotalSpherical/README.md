# Roadmap: pivotal and spherical categories

**Summary.** This roadmap owns the theory of pivotal and spherical categories and the fusion-category
infrastructure under it. That covers the double dual and its trivializations, the left and right
traces and dimensions, finite semisimple categories, the Grothendieck based ring, Frobenius–Perron
dimensions, global dimension and pseudo-unitarity, the standard example `FDRep k G`, the pointed
categories `Vec^ω_G`, gradings and the universal grading group, balanced and ribbon categories, and
the Drinfeld centre of a fusion category. Most of it is implemented in Tau Ceti and is listed under
[Exact supplier contracts](#exact-supplier-contracts). The targets that remain are:

- traces and dual bases for objects whose endomorphisms are the scalars of a commutative ring
  (Layers 2 and 3);
- strict dominance of the Perron root for primitive matrices (Layer 5);
- squared norms, global dimension and pseudo-unitarity without a chosen pivotal structure, the
  Radford isomorphism `𝟭 ≅ (-)ᘁᘁᘁᘁ`, the pivotalization, and nonvanishing of the global dimension
  of every fusion category in characteristic zero (Layer 6);
- the comparison of Frobenius–Schur indicators on `FDRep` (Layer 7);
- `Vec^ω_G` over a commutative ring, with its pivotal structures and indicators (Layers 8 and 9);
- the spherical-to-ribbon converse (Layer 10);
- the induction functor of the centre, its semisimplicity and dimension, and the ribbon centre
  (Layer 11).

Suggested home: `TauCeti/CategoryTheory/Monoidal/Pivotal/`, `TauCeti/CategoryTheory/Semisimple/`,
`TauCeti/CategoryTheory/Monoidal/Center/`, as for the implemented material.

## Scope and ownership

- **Generality.** The definitions (double dual, pivotal structure, traces, dimensions, spherical,
  balanced, ribbon) are for a general rigid monoidal category, with no finiteness or
  semisimplicity. Results that need only the endomorphisms of particular objects to be scalars
  (traces on such objects, dual bases, `Vec^ω_G` and its pivotal structures) are over a
  **commutative ring** `R`, with the hypothesis `Function.Bijective (algebraMap R (End X))` on each
  such object (Mathlib's `Algebra R (End X)` for `[Linear R C]`). Over an algebraically closed field
  a simple object with finite-dimensional endomorphisms satisfies it by Schur's lemma, so the field
  statements are corollaries. Fusion-level results (based ring, Frobenius–Perron, global
  dimension, universal grading, the centre) are over a field, with the hypotheses carried as
  instance arguments on each statement. There is no bundled fusion-category class.
- **Owned here.** Everything in the Summary, including the dual-basis API for split simple
  families over a commutative ring and the pivot-free fusion foundations of Layer 6 (bidual traces,
  squared norms, `normGlobalDim`, the Radford isomorphism, the pivotalization and nonvanishing).
  OcneanuRigidity cites 6.1, 6.2, 6.9, 11.1 and 11.2, and keeps only its
  relative-centre and deformation extensions.
- **Not owned here.** Presentations of monoidal categories by F- and R-matrices
  (PresentationsOfMonoidalCategories, a consumer of Layers 2, 3 and 8). The character-theoretic Frobenius–Schur indicator of a finite group
  ([RepresentationTheory/CharacterTheory](../RepresentationTheory/CharacterTheory/README.md); Layer 7
  here proves agreement). Unitary and C*-categorical refinements
  ([CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md),
  [Subfactors](../Subfactors/README.md)). Quantum-group examples
  ([QuantumGroups](../QuantumGroups/README.md)). Diagram categories
  ([TemperleyLieb](../TemperleyLieb/README.md)).
- **Excluded.** Non-split simple objects in the fusion-level results (fusion coefficients over `ℝ`
  with complex simples are a negative control, not a target); multifusion categories (`𝟙_ C` not
  simple); unitary structures.

## Conventions

- **Right duals are primary.** `Xᘁ` is the right dual, with `η_ X Xᘁ : 𝟙_ C ⟶ X ⊗ Xᘁ` and
  `ε_ X Xᘁ : Xᘁ ⊗ X ⟶ 𝟙_ C`; left-handed statements are mirrors.
- **Pivotal structures** are `TauCeti.PivotalCategory`: a natural isomorphism
  `𝟭 C ≅ doubleRightDualFunctor C` that is monoidal (`NatTrans.IsMonoidal`), with components
  `pivotalIsoApp X : X ≅ Xᘁᘁ`.
- **Traces** `leftTrace f`, `rightTrace f` of `f : X ⟶ X` are morphisms `𝟙_ C ⟶ 𝟙_ C`, through
  `pivotalExactPairing X : ExactPairing Xᘁ X`. `End X` bundles a morphism `X ⟶ X`; use `End.of` and
  `.asHom` to cross this boundary.
- **Scalars.** "`X` has scalar endomorphisms over `R`" means
  `Function.Bijective (algebraMap R (End X))`, and `r_f` denotes the scalar of `f : End X`.
- **Fusion matrices.** `fusionCoeff k S T U = finrank k (S ⊗ T ⟶ U)`, and `fusionMatrix k S` has
  entry `N_{ST}^U` in row `T` and column `U`.
- **`Vec^ω_G`.** The associator acts on `(δ_g ⊗ δ_h) ⊗ δ_l` by `ω(g,h,l)`. The right dual of
  `δ_g` is `δ_{g⁻¹}` with evaluation `1` and coevaluation `ω(g, g⁻¹, g)⁻¹`. The canonical pivotal
  structure has component `ω(g, g⁻¹, g)` on `δ_g`, and a character `χ : G →* Rˣ` twists it to
  `χ(g) ω(g, g⁻¹, g)`.
- **Frobenius–Schur rotation** is `TauCeti.pivotalRotate`, and `ν_n` is
  `TauCeti.frobeniusSchurIndicator` ([NS] Definition 3.1, p. 8).

**Checks.**

- In `Vecℤ` over `ℚ` with the untwisted associator and the character `χ(n) = 2ⁿ`, the pivotal
  component on `δ_1` is `2`, `leftDim δ_1 = 1/2` and `rightDim δ_1 = 2`, so the structure is not
  spherical; with `χ = 1` both dimensions are `1`.
- On `C₃` over `ℚ`, let `ω` be the normalized coboundary of `b` with `b(1,2) = 2` and `b = 1`
  otherwise, so `ω(1,2,1) = 1/2`. The coevaluation of `δ_1` is `2`, its canonical pivotal component
  `1/2`, and both dimensions are `1`; the inverse component `2` gives right dimension `4` and left
  dimension `1/4`.
- In the pivotal category of `2 × 2` matrices of `ℚ`-vector spaces, `f = 𝟙 E₁₂` and
  `g = 𝟙 E₂₁` have `leftTrace (f ⊗ₘ g) = (1, 0)` while `leftTrace f ≫ leftTrace g = (0, 0)`: traces
  are multiplicative only under the hypothesis of `TauCeti.leftTrace_tensorHom_eq_comp`.

## Exact supplier contracts

### From Mathlib

- Rigid categories: `ExactPairing`, `HasRightDual`, `rightAdjointMate`, `RigidCategory`,
  `rightDualFunctor`, `ExactPairing.tensor`.
- Braided and symmetric categories: `BraidedCategory`, `SymmetricCategory`; the centre `Center C`
  with `braidedCategoryCenter` and `Center.forget`.
- Linear structure: `Preadditive`, `Linear`, `MonoidalPreadditive`, `MonoidalLinear`,
  `HomOrthogonal`, `HasFiniteBiproducts`; `Simple`, `Matrix.IsIrreducible`, `Matrix.IsPrimitive`,
  `spectralRadius`; `FDRep k G` with its symmetric structure.

### From Tau Ceti

Each item is implemented at the pin and is consumed, not rebuilt.

- **Duals and double duals** (Layer 0): `TauCeti.rightDualFunctorMonoidal`,
  `TauCeti.doubleRightDualFunctor` with `TauCeti.doubleRightDualFunctor_ε` and
  `TauCeti.doubleRightDualFunctor_μ`, `TauCeti.doubleLeftDualFunctor`,
  `TauCeti.rightDualEquivalence`, `TauCeti.doubleRightDualEquivalence`, the monoidal mixed
  trivializations `TauCeti.leftDualRightDualIso` and `TauCeti.rightDualLeftDualIso`;
  `TauCeti.ExactPairing.biproduct`.
- **Pivotal structures** (Layer 1): `TauCeti.PivotalCategory`, `TauCeti.pivotalIsoApp`,
  `TauCeti.rightAdjointMate_rightAdjointMate`, the Freyd–Yetter identity
  `TauCeti.pivotalIsoApp_rightDual`, `TauCeti.pivotalExactPairing`,
  `TauCeti.pivotalCategoryOfRightRigid`, `TauCeti.leftDualIsoRightDual`, `TauCeti.dualFunctorIso`;
  pivotal functors `CategoryTheory.Functor.IsPivotal`; the torsor
  `TauCeti.PivotalCategory.instTorsor` over `Aut (LaxMonoidalFunctor.of (𝟭 C))`.
- **Traces and spherical structures** (Layer 2): `TauCeti.leftTrace`, `TauCeti.rightTrace`,
  `TauCeti.leftDim`, `TauCeti.rightDim`, cyclicity, `TauCeti.leftTrace_rightAdjointMate`,
  `TauCeti.leftTrace_unit`, the nested-loop formulas `TauCeti.leftTrace_tensorHom` and
  `TauCeti.rightTrace_tensorHom` with multiplicativity `TauCeti.leftTrace_tensorHom_eq_comp`
  (and its braided form), additivity `TauCeti.leftTrace_biproduct`; `TauCeti.SphericalCategory`,
  `TauCeti.trace`, `TauCeti.quantumDim`; the field forms on simple objects
  `TauCeti.leftTrace_eq_smul_leftDim`, `TauCeti.leftDim_comp_rightDim_eq`; nondegeneracy
  `TauCeti.leftDim_ne_zero_of_simple`.
- **Finite semisimple categories** (Layer 3): `TauCeti.IsFiniteSemisimpleCategory`,
  `TauCeti.SimpleClasses` with `classOf`, `repr`, `homOrthogonal_repr`;
  `TauCeti.simpleMultiplicities` and `TauCeti.finrank_hom_simple_eq_simpleMultiplicities`;
  `TauCeti.endAlgEquivOfSimple`.
- **The Grothendieck based ring** (Layer 4): `TauCeti.SplitK0` with `simpleBasis`,
  `TauCeti.fusionCoeff`, `TauCeti.fusionMatrix`, `TauCeti.fusionMatrix_dual`, transitivity
  `TauCeti.exists_fusionCoeff_pos_right`, and the ⋆-character identity
  `TauCeti.SplitK0.ringHom_apply_dual`, which needs rigidity but no pivotal structure.
- **Perron–Frobenius** (Layer 5): `Matrix.exists_mulVec_eq_smul_of_nonneg` (nonempty index type,
  nonzero eigenvector), the theorem exists_mulVec_eq_smul_of_pos of
  `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Positive.lean` (strictly positive matrices),
  `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
  `Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one`, `Module.Basis.existsUnique_ringHom_nonneg`.
- **Dimensions** (Layer 6): `TauCeti.frobeniusPerronDim` with its API,
  `TauCeti.SplitK0.spectralRadius_fusionMatrix`, `TauCeti.globalDim`,
  `TauCeti.globalDim_pivotalCategory_eq`, `TauCeti.globalDim_ne_zero`,
  `TauCeti.norm_leftDim_le_frobeniusPerronDim`, `TauCeti.IsPseudoUnitary`,
  `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory`.
- **`FDRep k G`** (Layer 7): `TauCeti.symmetricPivotalCategory`, `TauCeti.symmetricSphericalCategory`,
  `FDRep.drinfeldIso_hom_hom_hom_hom`, `FDRep.trace_eq_smul`
  (`trace f = LinearMap.trace k V f.hom.hom.hom • 𝟙 _`), `FDRep.quantumDim_eq_smul`; the general
  indicators `TauCeti.frobeniusSchurIndicator`.
- **Gradings** (Layer 9): `TauCeti.universalGradingGroup`, `TauCeti.universalGradingGroup.degree`,
  `TauCeti.SimpleClasses.IsAdjoint`, `TauCeti.monoidalAutCharacterEquiv`
  (`Aut_⊗(𝟭) ≃* (U(C) →* kˣ)`), `TauCeti.PivotalCategory.characterEquiv`.
- **Balanced, ribbon and the centre** (Layer 10): `TauCeti.BalancedCategory`,
  `TauCeti.RibbonCategory`, `TauCeti.balancedOfBraidedPivotal`, `TauCeti.pivotalOfBalanced`,
  `TauCeti.pivotalBalancedEquiv`, `TauCeti.sphericalCategory_of_ribbonCategory`;
  `CategoryTheory.Center.instPreadditive`, `Center.instLinear`, `Center.instAbelian`,
  `Center.rigidCategory`, `Center.pivotalCategory`, `Center.isPivotal_forget`,
  `Center.sphericalCategory`; Hom-finiteness `CategoryTheory.Center.instFiniteDimensionalHom`
  (`Monoidal/Center/Preadditive.lean`, for Hom-finite `C` over a division ring) and the simple unit
  `CategoryTheory.Center.instSimpleUnit` (`Monoidal/Center/Simple.lean`, when `𝟙_ C` is simple and
  the forgetful functor preserves monomorphisms).

## How to read the build

The layer numbers are those cited by other roadmaps. Layers 0, 1 and 4 are entirely supplied, and
their contracts are listed above under those numbers. Each remaining layer has numbered `### k.n`
subsections, one per target group, each with its *Needs:* clause beyond the supplier contracts and
the Lean names of its headlines in `Suggested.lean`, followed by the layer's Examples and
Dependencies. The comparison of indicators on `FDRep`, formerly in Layer 8, is 7.1.

## Layer 2: traces on objects with scalar endomorphisms

### 2.1 Scalar traces over a commutative ring

([EGNO] §4.7, pp. 73–76, over a field; the ring statement is a deduction: the field proofs use
Schur's lemma only to produce the scalar.) With `[Preadditive C] [Linear R C] [MonoidalPreadditive C] [MonoidalLinear R C]` and `X` with scalar
endomorphisms over `R`: `leftTrace f.asHom = r_f • leftDim X`, `rightTrace f.asHom = r_f • rightDim X`,
`trace f.asHom = r_f • quantumDim X` when spherical, and `leftDim X ≫ rightDim X` is the same for any
two pivotal structures. When `𝟙_ C` also has scalar endomorphisms, the hypothesis of
`TauCeti.leftTrace_tensorHom_eq_comp` holds, so traces and dimensions are multiplicative. This is
the ring form of the pinned field results; the two trace formulas follow from surjectivity of
`algebraMap` and the pinned `TauCeti.leftTrace_smul`, `TauCeti.rightTrace_smul`. Lean:
`leftDim_comp_rightDim_eq_of_bijective`. *Needs:* Tau Ceti `TauCeti.leftTrace_smul`,
`TauCeti.rightTrace_smul`, `TauCeti.leftTrace_tensorHom_eq_comp`.

### Examples

- `R = ℤ/4`, `Vecℤ` over `R`, `X = δ_0`, `f = 2`: `leftTrace f = 2 = 2 • leftDim δ_0`.
- `Vecℤ` over `ℚ` with pivotal structures `2ⁿ` and `3ⁿ`: `leftDim δ_1 ≫ rightDim δ_1` is
  `(1/2)·2 = 1` and `(1/3)·3 = 1`.
- `X = ℚ²` in `Vecℚ` fails the hypothesis (`End X = M₂(ℚ)`), and `leftTrace (E₁₁)` is `1`, not a
  multiple of `leftDim X = 2` by any scalar of `f`.

### Dependencies

Supplier contracts of Layers 1 and 2 only.

## Layer 3: dual bases of morphisms

### 3.1 The composition pairing

For `C` preadditive and `R`-linear and `S` with scalar
endomorphisms, `f ≫ g = ⟨f, g⟩ • 𝟙 S` defines an `R`-bilinear pairing
`(S ⟶ X) × (X ⟶ S) → R`, compatible with composition on the `X` side. No abelian structure is
needed ([EGNO] §1.8 for the field case; the ring statement is a deduction from the definition).
*Needs:* the convention on scalar endomorphisms.

### 3.2 Dual bases

When the pairing is perfect, a basis `b` of `S ⟶ X` indexed by a finite type has
a dual basis `c` of `X ⟶ S` with `b i ≫ c j = if i = j then 𝟙 S else 0`, with coordinate
formulas. The canonical element `∑ i, c i ⊗ b i` is natural in `X` and
independent of `b`, stated through an arbitrary bilinear map. A deduction from 3.1 and the dual
basis of a perfect pairing. *Needs:* 3.1; Mathlib
`Module.Basis.dualBasis`.

### 3.3 Split simple families

`IsSplitSimpleFamily R S` for `S : ι → C`, `ι` arbitrary and `C` with
finite biproducts: every `S i` has scalar endomorphisms, `HomOrthogonal S`, and every object is
isomorphic to `⨁ (S ∘ f)` for some `f : κ → ι` with `κ` finite. Then `S i ⟶ X` and `X ⟶ S i` are
free of finite rank, the pairing is perfect (under `X ≅ ⨁ (S ∘ f)` it is the dot product on
`R^{f⁻¹(i)}`), and the **completeness relation** `∑ i ∈ s, ∑ j, c i j ≫ b i j = 𝟙 X`, with `c i` dual to `b i`,
holds for any finite `s` outside of which `X` receives no nonzero morphisms. For an additive
`R`-linear `F : C ⥤ D`, any `T : D` and `s` as in the completeness relation for `B`, the map
`⨁ i ∈ s, (S i ⟶ B) ⊗[R] (T ⟶ F.obj (S i)) → (T ⟶ F.obj B)`, `g ⊗ h ↦ h ≫ F.map g`, is an
`R`-linear isomorphism, with inverse `t ↦ ∑ i j, b i j ⊗ (t ≫ F.map (c i j))`. Lean: `IsSplitSimpleFamily`, `IsSplitSimpleFamily.free_finite_hom`,
`IsSplitSimpleFamily.exists_homDual`, `IsSplitSimpleFamily.sum_sum_comp_eq_id`. The proof is a
deduction: `HomOrthogonal.matrixDecomposition` turns every Hom module into a matrix module over
`R`. *Needs:* 3.1, 3.2; Mathlib `HomOrthogonal.matrixDecomposition`.

### 3.4 The field case

In a finite semisimple abelian category over an algebraically closed field,
the representatives of `SimpleClasses C` with finite-dimensional endomorphisms form a split simple
family, with no finiteness of `SimpleClasses C`; and a simple `S` has a perfect pairing with every
`X` ([EGNO] Proposition 1.8.4, p. 9). Lean: `isSplitSimpleFamily_simpleClasses`. *Needs:* 3.3; Tau Ceti
`TauCeti.endAlgEquivOfSimple`, `TauCeti.isSplitMono_of_nonzero_from_simple`.

### Examples

- `R = ℤ`, `S = R`, `X = R²`: `(1, 2)` followed by `(3, 4)` pairs to `11`, the dot product; the
  standard basis is its own dual and the completeness sum is `I₂`.
- `X = 0`: the pairing is `0`, the empty completeness sum is `𝟙 0 = 0`.
- `S = ℚ²` in `Vecℚ` fails scalar surjectivity, and the pairing is not defined.
- Finitely supported `ℤ`-graded complex vector spaces form a split simple family indexed by `ℤ`.

### Dependencies

Supplier contracts of Layer 3; Mathlib `HomOrthogonal`, `Module.Basis.dualBasis`.

## Layer 5: Perron–Frobenius

### 5.1 Primitive matrices

For a nonempty finite index type and a primitive real matrix, the Perron
root `r > 0` is the spectral radius and every other complex eigenvalue has modulus strictly less
than `r` ([EGNO] §3.2, pp. 51–53). Lean: `Matrix.IsPrimitive.norm_lt_of_hasEigenvalue`. *Needs:*
Tau Ceti `Matrix.IsIrreducible.exists_mulVec_eq_smul` and the positive-matrix theorem of the supplier
contracts.

### Examples

- The `0 × 0` matrix is excluded: it has no eigenvalue.
- `[[1,1],[1,1]]` is primitive with roots `2, 0`, and `0 < 2`.
- `[[0,1],[1,0]]` is irreducible but not primitive: its roots `1, −1` have equal modulus.

### Dependencies

Supplier contracts of Layer 5.

## Layer 6: dimensions at the fusion bar

### 6.1 Squared norms without a pivotal structure

([ENO] Proposition 2.1 and Definition 2.2,
preprint p. 4). For `b : Y ⟶ Yᘁᘁ`, `doubleDualTrace b := η_ Y Yᘁ ≫ (b ▷ Yᘁ) ≫ ε_ Yᘁ Yᘁᘁ`. For
`a : X ≅ Xᘁᘁ`, `squaredNorm a := doubleDualTrace a.hom ≫ doubleDualTrace (a.inv)ᘁ`. For `X` with
scalar endomorphisms it does not depend on `a`, `doubleDualTrace a.hom` is a unit when `X` is simple,
and it equals `leftDim X ≫ rightDim X` for the component of any pivotal structure. For other `X`
it depends on `a`. Lean: `doubleDualTrace`, `squaredNorm`, `squaredNorm_congr`,
`squaredNorm_pivotalIsoApp`. *Needs:* Layer 2.

### 6.2 Global dimension without a pivotal structure

For a fusion category over `k` (the
hypotheses of `TauCeti.globalDim_ne_zero` without `[PivotalCategory C]` and without `[CharZero k]`),
`dim C` is the sum of the squared norms of the simple representatives, for any isomorphisms
`a_S : S ≅ Sᘁᘁ`, which exist by `TauCeti.nonempty_iso_rightDual_rightDual`, named
`normGlobalDim C a`; by 6.1 it does not depend on `a`. `normGlobalDim_eq_globalDim`: it equals `TauCeti.globalDim C` for
every pivotal structure, so it is nonzero in characteristic zero when `C` admits a pivotal
structure, by `TauCeti.globalDim_ne_zero`. The general case is 6.9. *Needs:* 6.1.

### 6.3 Pseudo-unitarity without a pivotal structure

([ENO] Proposition 8.23). Over `ℂ`, `C` is
pseudo-unitary when `dim C = FPdim C`; this agrees with `TauCeti.IsPseudoUnitary` whenever a pivotal
structure is given, and a pseudo-unitary fusion category has a unique pivotal structure with
`leftDim X = FPdim X` for every `X`, which is spherical ([ENO] §3.1, pp. 10–11, and Proposition
8.23, pp. 34–35). The pivotal structure is constructed, not assumed: on each simple `S` take the
lift `a_S : S ≅ Sᘁᘁ` of 6.8 with `doubleDualTrace a_S.hom = FPdim S`, which exists by 6.9 and the
squared-norm equality `|S|² = FPdim S ²` of pseudo-unitarity; the pinned
`TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory` then gives uniqueness and sphericity. Lean:
`existsUnique_pivotalCategory_of_normGlobalDim`. *Needs:* 6.2, 6.7, 6.8, 6.9.

### 6.4 The Deligne product

([EGNO] Definition 1.11.1 and Proposition 1.11.2, p. 15; §4.6, p. 73). For abelian finite semisimple `k`-linear
categories `C`, `D` with split simples, `C ⊠ D := Mat_ (C ⊗ₖ D)`, where `C ⊗ₖ D` has pairs as
objects and `Hom((X, Y), (X', Y')) = (X ⟶ X') ⊗[k] (Y ⟶ Y')`. It is abelian and finite semisimple,
with `SimpleClasses (C ⊠ D) ≃ SimpleClasses C × SimpleClasses D`. Universal property: `k`-linear
functors out of `C ⊠ D` correspond to functors out of `C × D` that are `k`-linear in each variable,
into additive `k`-linear idempotent-complete categories. For monoidal `k`-linear `C` and `D`,
`(X ⊠ Y) ⊗ (X' ⊠ Y') = (X ⊗ X') ⊠ (Y ⊗ Y')`; for fusion `C` and `D`, `C ⊠ D` is fusion. *Needs:*
Layer 3; Mathlib `Mat_`.

### 6.5 The canonical algebra and Hopf bimodules

([EGNO] Definition 7.9.12 and Example 7.9.14,
p. 150; Proposition 7.18.5, p. 173). For `C` fusion, `MonoidalLeftAction (C ⊠ Cᴹᵒᵖ) C` with
`(X ⊠ Y) ⊙ Z = X ⊗ Z ⊗ Y`, and the canonical algebra `A := ⨁ S, S.repr ⊠ ᘁS.repr`, which represents
`X ⊠ Y ↦ Hom (X ⊗ Y, 𝟙_ C)` and is a `MonObj` with the internal-endomorphism multiplication of
`𝟙_ C` (Tau Ceti `Monoidal/Mod/InternalHom.lean`). `V ↦ (V ⊠ 𝟙) ⊗ A` is an equivalence from `C` to
right `A`-modules in `C ⊠ Cᴹᵒᵖ`, and `ρ_V : (V ⊠ 𝟙) ⊗ A ≅ (𝟙 ⊠ V) ⊗ A` is an isomorphism of right
`A`-modules, monoidal in `V` ([EGNO] (7.55), (7.57)). *Needs:* 6.4.

### 6.6 Unimodularity

([EGNO] Remark 6.5.9, p. 128, and (7.66)). For `C` fusion there is an
isomorphism of right `A`-modules `A ≅ Aᘁ`, unique up to `Aut (𝟙_ C)`: the distinguished invertible
object is `𝟙`. *Needs:* 6.5.

### 6.7 The Radford isomorphism

([EGNO] Theorem 7.19.1 and Corollary 7.19.3, p. 177; [ENO04]
Theorem 3.3). For `C` fusion, a monoidal natural isomorphism
`radfordIso C : 𝟭 C ≅ doubleRightDualFunctor C ⋙ doubleRightDualFunctor C` (Lean:
`exists_radfordIso`). It is a theorem about
fusion categories, not structure on rigid categories: in a general rigid category the double
right and double left duals are inverse to each other, and need not be isomorphic.
- Relation to EGNO: for EGNO's `δ_X : Xᘁᘁ ≅ ᘁᘁX`, `(radfordIso C).hom.app X = (δ_X⁻¹)ᘁᘁ`, read
  through `(ᘁᘁX)ᘁᘁ = X`.
- Characterization on simples ([EGNO] Theorem 7.21.7, p. 180; [ENO04] Theorem 7.3): for simple `L`
  and any `a : L ≅ Lᘁᘁ`, `doubleDualTrace a.hom • (radfordIso C).hom.app L =
  doubleDualTrace (a.inv)ᘁ • (a.hom ≫ (a.hom)ᘁᘁ)`.
- For any pivotal structure with components `j`, `j ≫ jᘁᘁ` composed with `(radfordIso C).inv` lies
  in `Aut (LaxMonoidalFunctor.of (𝟭 C))` ([EGNO] Remark 7.19.4, p. 177).

*Needs:* 6.1, 6.6; Layer 0.

### 6.8 The pivotalization

([EGNO] Definition 7.21.9 and Corollary 7.21.10, p. 181; [ENO04]
Corollary 7.6). `Pivotalization C` has objects `(X, f)` with `f : X ≅ Xᘁᘁ` and
`f.hom ≫ (f.hom)ᘁᘁ = (radfordIso C).hom.app X`, morphisms commuting with the `f`, tensor product
through the tensorator of `doubleRightDualFunctor`, right duals `(Xᘁ, (f.inv)ᘁ)`, and the
tautological pivotal structure. The forgetful functor to `C` is monoidal and preserves
`squaredNorm`. When `char k ≠ 2`: every simple `S` has exactly two lifts `(S, ±f_S)`, and
`Pivotalization C` is fusion and spherical. *Needs:* 6.7.

### 6.9 Nonvanishing in characteristic zero

([ENO] Theorem 2.3 and Remark 3.1, preprint pp. 4, 10–11).
Let `char k = 0` and `C` be fusion. For every simple `S` and every ring homomorphism `σ` from the
algebraic closure of `ℚ` in `k` to `ℂ`, `σ (squaredNorm S)` is a nonnegative real number, and
`σ (normGlobalDim C) ≥ 1`; so `normGlobalDim_ne_zero`. The proof applies
`TauCeti.SplitK0.ringHom_apply_dual` and the argument of `TauCeti.globalDim_ne_zero` to
`Pivotalization C`, and transports along its forgetful functor with 6.2. *Needs:* 6.2, 6.8.

### Examples

- `Vec(C₂)` over `ℂ`: `dim C = 2` by squared norms and by both pivotal structures; only the
  pivotal structure `+1` has both simple dimensions `+1`.
- `Vec(C₂)` over a field of characteristic `2`: `dim C = 0`.
- Fibonacci over `ℂ`: `dim C = 1 + φ²` for the unitary structure; Yang–Lee has
  `dim C = 1 + φ⁻²`, which differs from `FPdim C = 1 + φ²`, so it is not pseudo-unitary.

- 6.1: in `Vec` over `ℂ`, `X = ℂ²`: `a = 𝟙` gives `2 · 2 = 4` and `a = diag(1, 2)` gives
  `3 · 3/2 = 9/2`, so the squared norm is defined only for objects with scalar endomorphisms.
- 6.4: `Vec(C₂) ⊠ Vec(C₂)` has four simple classes and no morphisms between distinct ones.
  `Vec ⊠ (Vec × Vec)` with componentwise tensor product is monoidal but not fusion: its unit has
  two simple summands. In `Vec(C₂) ⊠ Vec(C₂)`, `δ_e ⊠ δ_e ⊕ δ_g ⊠ δ_g` has multiplicities
  `(1, 0, 0, 1)`; a pair has multiplicities `(ac, ad, bc, bd)` with `ad · bc = ac · bd`, so
  `C ⊗ₖ D` without `Mat_` lacks it.
- 6.5: for `Vec(C₃)`, `(g ⊠ h) ⊙ 𝟙 = gh` and `Hom (gh, 𝟙) = [gh = 1]`, matching `A = ⨁ g ⊠ g⁻¹`;
  for `Vec(C₂)` the multiplication is `e_g e_h = e_{gh}`. For `C = Vec`, `A = 𝟙 ⊠ 𝟙` and
  `V ↦ (V ⊠ 𝟙) ⊗ A` is the identity on ranks.
- 6.7: on `Vec(C₃)` over `ℂ` with pivotal character `ζ₃`, `e = j ≫ jᘁᘁ` is monoidal with
  component `ζ₃²` but fails the characterization on simples, which forces `e = 1`; so
  `exists_radfordIso` must carry the characterization. For a spherical structure `j`, `(radfordIso C).hom = j ≫ jᘁᘁ`, since then the two traces
  agree. For simple `L = k` and `a = 3 • 𝟙`, both sides of the characterization are `3`. For
  `Vec(C₃)` with the pivotal character `ζ₃`, the discrepancy is `ζ₃²` on the generator, a
  character.
- 6.8: `Pivotalization (Vec(C₂))` with `char k ≠ 2` has four simple classes and
  `normGlobalDim = 4`. In characteristic `2`, `(S ⊕ S, f_S · [[1,1],[0,1]])` is indecomposable but
  not simple, so the fusion statement needs `char k ≠ 2`. For `C = Vec` over `ℂ`: two classes
  `(𝟙, ±1)` of dimensions `±1`, and `normGlobalDim = 2 = 2 · dim C` ([EGNO] Remark 7.21.11,
  p. 181); fixing `f` on the unit would give one.
- 6.9: Fibonacci and Yang–Lee over `ℂ`: squared norms `φ² ≈ 2.618` and `φ⁻² ≈ 0.382`, both
  positive, and global dimensions `(5 ± √5)/2 > 1`.

### Dependencies

Layers 2 and 3; supplier contracts of Layers 0, 2, 4, 5 and 6; Mathlib `Mat_`.

## Layer 7: `FDRep G` is pivotal and spherical

### 7.1 Indicators agree

For a finite group `G` and an algebraically closed field of
characteristic zero, `TauCeti.frobeniusSchurIndicator 2 V` for the standard spherical structure on
`FDRep k G` equals the character-theoretic `ν₂(V) = |G|⁻¹ ∑_g χ_V(g²)` of
[RepresentationTheory/CharacterTheory](../RepresentationTheory/CharacterTheory/README.md).
A deduction from `FDRep.trace_eq_smul` and the character formula for the trace of the rotation on
`(V ⊗ V)^G`, which is the swap of the two factors. Lean:
`frobeniusSchurIndicator_two_fdRep`, against Mathlib's `FDRep.character`. *Needs:* Tau Ceti
`TauCeti.frobeniusSchurIndicator`, `FDRep.trace_eq_smul`.

### Examples

- `C₂` sign representation: `ν₂ = 1`.
- `Q₈`, two-dimensional irreducible: `ν₂ = −1`.
- `C₃`, a nontrivial character: `ν₂ = 0`.

### Dependencies

Supplier contracts of Layer 7; Mathlib `FDRep.character`.

## Layer 8: the pointed categories `Vec^ω_G`

### 8.1 The category

For a group `G`, a commutative ring `R` and a normalized 3-cocycle
`ω : G → G → G → Rˣ` (cocycle identity and normalization written out), `VecTwisted R G ω` is the
category of finitely supported `G`-graded `R`-modules with finitely generated projective
components, with the associator twisted by `ω` ([EGNO] Example 2.3.8, p. 28). Projective components
make it rigid, with duals as in the conventions. Each `δ_g` has `End δ_g = R`. Cohomologous cocycles
give `R`-linearly monoidally equivalent categories ([EGNO] Proposition 2.6.1, p. 33).

### 8.2 Pivotal structures

`Aut_⊗(𝟭) ≃* (G →* Rˣ)`: a natural endomorphism of the identity of
finitely generated projective `R`-modules is multiplication by its value on `R`, morphisms preserve
degree, and monoidality makes the family a character. The canonical pivotal structure of the
conventions is monoidal by an identity in `Rˣ` that follows from the cocycle condition alone. It is
not a consequence of the field case applied factorwise: the values of `ω` may generate `(ℤ/2)²`,
which embeds in the units of no field. So pivotal structures form a torsor over `G →* Rˣ`. Over a
field it follows from [DGNO] Proposition 2.3; over a ring it is a deduction from
the three facts just listed. *Needs:* 8.1; Tau Ceti `TauCeti.PivotalCategory.instTorsor`.

### 8.3 Spherical structures

At the canonical structure both dimensions of `δ_g` are `1`, so the
twist by `χ` is spherical iff `χ(g)² = 1` for every `g`. A deduction: the twist multiplies the left
dimension of `δ_g` by `χ(g)⁻¹` and the right one by `χ(g)`. *Needs:* 8.2, Layer 2.

### 8.4 Indicators

For `n > 0`, `ν_n(δ_g) = 0` if `gⁿ ≠ 1`, and otherwise
`ν_n(δ_g) = χ(g)⁻¹ ∏_{r=1}^{n-1} ω(g, gʳ, g)` for the twist by `χ`. For torsion `G` the indicators
determine `χ`; for `G = ℤ` they do not. A deduction from [NS] Definition 3.1: `Hom(𝟙, δ_g^{⊗n})`
is `R` or `0`, and the rotation acts on it by the displayed scalar. *Needs:* 8.2; Tau Ceti `TauCeti.frobeniusSchurIndicator`,
`TauCeti.pivotalRotate`.

### Examples

- `R = ℤ`, `G = C₂`: two characters and two pivotal structures; over the zero ring, one of each.
- `G = C₂` with the sign pivotal structure: `ν₂(δ_g) = −1`; with the trivial one, `ν₂(δ_g) = 1`.
- `G = ℤ`, untwisted, over `ℚ`: `χ(n) = 2ⁿ` gives dimensions `2⁻ⁿ` and `2ⁿ`, not spherical, and
  all positive indicators of `δ_1` vanish, as for `χ = 1`.
- `G = S₃`, `g = (12)`, `h = (23)`: `δ_g ⊗ δ_h = δ_{(123)}` and `δ_h ⊗ δ_g = δ_{(132)}`.

### Dependencies

Layer 2; supplier contracts of Layers 1 and 7.

## Layer 9: gradings and the universal grading group

### 9.1 The pointed example

Over a field, `U(Vec^ω_G) = G` for finite `G`, with adjoint
subcategory `Vec`, and `TauCeti.PivotalCategory.characterEquiv` recovers the torsor of 8.2
([DGNO] Proposition 2.3(iii), preprint p. 7). *Needs:* Layer 8.

### Examples

- `Vec(C₂)`: `U = C₂`, adjoint subcategory `Vec`.
- `Rep(S₃)`: `U = 1`.
- `Vec(C₂)` with `X = 𝟙 ⊕ g` instead of a simple object generates all of `Vec(C₂)`, which is why
  `TauCeti.SimpleClasses.IsAdjoint` quantifies over simples.

### Dependencies

Layer 8; supplier contracts of Layer 9.

## Layer 10: balanced, ribbon and the centre

### 10.1 The spherical-to-ribbon converse

Let `C` be braided, rigid, pivotal and spherical,
abelian and `k`-linear over a field `k`, finite semisimple with finite-dimensional Hom spaces and
every simple object with scalar endomorphisms. Then the twist of `TauCeti.balancedOfBraidedPivotal`
is ribbon ([HPT] Proposition A.4, pp. 45–46). No finiteness of simple classes and no
characteristic hypothesis is needed. Lean: `ribbonCategory_balancedOfBraidedPivotal_of_spherical`.
*Needs:* Layer 2.

### Examples

- `FDRep k C₃` in characteristic three, standard pivotal structure twisted by the generator `g`:
  spherical, since `Tr((I+N)f) = Tr(f)` for nilpotent `N`, but not ribbon: on `[[1,1],[0,1]]` the
  dual twist differs. This is the negative control for semisimplicity.
- `Vecℤ` over `ℂ` with the standard structure: spherical and ribbon, with infinitely many simples.
- `ℝ`-linear `FDRep ℝ C₃` with the rotation representation fails the scalar hypothesis, which is
  what HPT's Lemma A.5 needs.

### Dependencies

Layer 2; supplier contracts of Layer 10.

## Layer 11: the centre of a fusion category is a fusion category

### 11.1 The induction functor

`I : C ⥤ Center C`, `I X = ⨁_S S ⊗ X ⊗ Sᘁ` over
`SimpleClasses C`, with its half-braiding defined and the hexagon proved, two-sided adjoint to
`Center.forget C`, exact and faithful. It is canonically the right adjoint (an end). The left
adjoint is canonically the coend `⨁_S S ⊗ X ⊗ ᘁS`, identified with `I` through
`(doubleDualTrace a_S)⁻¹ •` the mate of a chosen `a_S : S ≅ Sᘁᘁ`, which does not depend on the choice. The underlying-object formula is [ENO] §5.8, Proposition 5.4,
preprint p. 21; the half-braiding and both adjunctions are a deduction from 3.3–3.4, with the unit
and counit of 11.2, and do not use the semisimplicity of the centre. *Needs:* Layer 3 (3.3, 3.4); Tau Ceti
`CategoryTheory.Center.instAbelian`, `CategoryTheory.Center.rigidCategory`.

### 11.2 The averaging identity

With the counit of `forget ⊣ I` the projection onto the
`𝟙`-summand and the unit of `I ⊣ forget` its inclusion, the composite `Z ⟶ I (forget Z) ⟶ Z` is
`dim C · 𝟙 Z`, with `dim C` the squared-norm global dimension of 6.2. A deduction: each summand `S`
of `I (forget Z)` contributes the squared norm of `S`. *Needs:*
11.1, 6.2.

### 11.3 Semisimplicity and finiteness

`IsFiniteSemisimpleCategory (Center C)` for the canonical abelian structure, and finitely many
simple classes, over an algebraically closed field of characteristic zero and with no pivotal
structure assumed ([ENO] Theorem 2.15); Hom-finiteness and the simple unit are supplied. Lean:
`isFiniteSemisimpleCategory_center`, `finite_simpleClasses_center`. *Needs:* 11.2, 6.9.

### 11.4 The dimension of the centre

`dim (Center C) = (dim C)²`, for the canonical structures, and
for the pivotal structure inherited from `C` when there is one ([ENO] Theorem 2.15, preprint p. 6).
Lean: `normGlobalDim_center`,
`globalDim_center`. *Needs:* 11.3.

### 11.5 The ribbon centre

For a spherical fusion category over an algebraically closed field of
characteristic zero, `Center C` with its canonical braiding and pivotal structure is ribbon. A
deduction from 10.1 applied to `Center C`, whose hypotheses 11.3 supplies. Lean:
`ribbonCategory_center`. *Needs:* 10.1, 11.3; Tau Ceti `CategoryTheory.Center.pivotalCategory`,
`CategoryTheory.Center.sphericalCategory`.


### Examples

- `Vec(C₂)` over `ℂ`: `I δ_e = 2 δ_e` underlying, decomposing as `(e, +) ⊕ (e, −)`; the averaging
  composite on `𝟙` is `2 · 𝟙`, and rescaling the unit by `3` gives `6 · 𝟙`.
- `Vec(C₂)` over `ℂ`: four simple classes in the centre and `dim Z = 4 = 2²`; transporting the
  tensor structure of `Rep(D₁₀)` instead gives `10`, which is why the canonical structure is pinned.
- `Vec(C₂)` in characteristic `2`: `dim C = 0` and the centre is not semisimple.
- `Vecℝ(C₃)`: the centre's dimension computed over `ℝ` is `15`, not `3² = 9`, which is why 11.4
  carries algebraic closedness.
- `Z(Vec(C₂))` over `ℂ`: the central twists are `±1`, equal to their duals (11.5).

### Dependencies

Layers 3, 6 and 10; supplier contracts of Layer 10.

## Downstream consumers

- Presentations of monoidal categories by F- and R-matrices: Layers 2, 3 (`IsSplitSimpleFamily`)
  and 8.
- Ocneanu rigidity: 6.1, 6.2, 6.9, 11.1, 11.2.
- [RepresentationTheory/CharacterTheory](../RepresentationTheory/CharacterTheory/README.md): Layer 7.

## References

- [EGNO] P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS (2015): §2.10,
  pp. 40–43 (duals); §§3.2–3.3, pp. 51–56 (Perron–Frobenius, based rings); §4.7, pp. 73–76
  (pivotal and spherical structures, traces); §7.21, pp. 179–183 (global dimension); §1.11, §4.6
  (Deligne product); §§7.9, 7.18, 7.19 (canonical algebra, Hopf bimodules, the Radford
  isomorphism).
- [ENO] P. Etingof, D. Nikshych, V. Ostrik, *On fusion categories*, Ann. of Math. 162 (2005),
  arXiv:math/0203060: Proposition 2.1, Definition 2.2, Theorem 2.3, §2.4, Theorem 2.15,
  Remark 3.1, Proposition 8.23.
- [ENO04] P. Etingof, D. Nikshych, V. Ostrik, *An analogue of Radford's S⁴ formula for finite
  tensor categories*, Int. Math. Res. Not. 2004, no. 54, arXiv:math/0404504v1: Theorem 3.3,
  Theorem 7.3 and Corollary 7.6 (p. 11).
- [DGNO] V. Drinfeld, S. Gelaki, D. Nikshych, V. Ostrik, *On braided fusion categories I*, Selecta
  Math. 16 (2010), arXiv:0906.0620: Proposition 2.3.
- [HPT] A. Henriques, D. Penneys, J. Tener, *Categorified trace for module tensor categories over
  braided tensor categories*, arXiv:1509.02937: Proposition A.4.
- [NS] S.-H. Ng, P. Schauenburg, *Higher Frobenius–Schur indicators for pivotal categories*, in
  *Hopf algebras and generalizations*, Contemp. Math. 441 (2007): Definition 3.1.
