# Roadmap: algebraic vector bundles

**Summary.** This roadmap develops algebraic vector bundles over an arbitrary scheme `X` and
reaches the equivalence between their sheaf-theoretic and geometric presentations. It starts
from what Tau Ceti already has at the pin: the symmetric monoidal closed category `X.Modules`,
quasi-coherent sheaves, finite locally free sheaves with their bundled locally constant rank,
duals, rigidity and affine comparison, sheaf symmetric and exterior powers, quasi-coherent
commutative algebras and the relative Spec functor. On this base it proves the dualizability
criterion for finite local freeness, the rank formulas and pullback comparisons for symmetric and
exterior powers, constructs the determinant, proves that relative Spec is an anti-equivalence
compatible with base change, and then builds graded quasi-coherent algebras, linear schemes and
geometric vector bundles. The end theorems are

```text
QCoh(X)ᵒᵖ ≌ LinearSch(X),        FinLocFree(X) ≌ GeomVB(X),
Hom_X(T, V(E)) ≃ Γ(T, f^* E)      naturally in f : T → X and in E.
```

Here `LinearSch(X)` consists of schemes affine over `X` whose quasi-coherent coordinate algebra is
nonnegatively graded and freely generated in degree one, with grading-preserving morphisms, and
`GeomVB(X)` is its full subcategory whose degree-one piece is finite locally free. The first
equivalence factors as `QCoh(X)ᵒᵖ ≌ FreeGrQCAlg(X)ᵒᵖ ≌ LinearSch(X)`: the graded symmetric
algebra, followed by relative Spec with the grading retained. Dualizing a finite locally free
sheaf gives the covariant geometric total space `V(E) = Spec_X Sym(E^∨)`.

## Scope and ownership

The roadmap owns:

- the dualizability criterion: a quasi-coherent sheaf is finite locally free if and only if it
  has a dual in `QCoh(X)` (Layer 2);
- quasi-coherence of the internal Hom from a finitely presented source, and the base-change
  comparison `f^* Hom(E, F) → Hom(f^* E, f^* F)` with its two isomorphism criteria (Layer 2);
- the strong symmetric monoidal structure on `Scheme.Modules.pullback` with its identity and
  composition coherences (Layer 1);
- the rank formulas, finite local freeness and pullback comparisons of symmetric and exterior
  powers, and the determinant of a finite locally free sheaf, at locally constant rank and as a
  functor on each fixed-rank subcategory (Layer 3);
- relative Spec as an anti-equivalence, the pushforward algebra `p_* 𝒪_V` of an affine
  `X`-scheme, the functor-of-points universal property, and base change (Layers 4 and 5);
- the sheaf symmetric algebra, graded quasi-coherent algebras and their affine graded-ring charts,
  linear schemes and the linear-scheme equivalence (Layer 6);
- geometric vector bundles, the total space, its universal property and the sheaf/geometric
  dictionary (Layer 7).

Already at the pins, and consumed rather than restated (exact names in the supplier contracts):
the monoidal, symmetric and closed structures on `X.Modules`; `QuasicoherentSheaf X` with its
symmetric monoidal structure; `FiniteLocallyFreeSheaf X`, closure under isomorphism, finite
biproducts and arbitrary pullback with identity and composition isomorphisms; the bundled rank,
its rank loci and its formulas on free sheaves, pullbacks, biproducts and tensor products; the
fixed-rank subcategories and the equivalence of rank one with `InvertibleSheaf X`; the dual, the
rigid structure and the double-dual isomorphism; the affine comparison with finite projective
modules; the sheaf symmetric and exterior power functors; quasi-coherent commutative algebras,
schemes affine over `X`, the relative Spec functor and its computation over an affine base.
Consumers that cite this roadmap's layers for these objects use the Tau Ceti declarations: the
fixed-rank predicate is `FiniteLocallyFreeSheaf.isConstantRank`, the rank is
`FiniteLocallyFreeSheaf.rank`, the dual is `FiniteLocallyFreeSheaf.dual`, the power functors are
`SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower`, and relative Spec is
`TauCeti.AlgebraicGeometry.relativeSpec` on `QuasicoherentAlgebra X` and `AffineSchemeOver X`.

The ring-level determinant of a finite projective module (invertible modules, the determinant by
the clopen rank decomposition, equal-rank determinant maps, base change) is
PadicMeasuresIwasawaAlgebras §5.1; Layer 3 glues it. The rank-one theory, Picard group and
Jacobian are JacobianChallenge's. Curve-specific degree theory is AlgebraicCurves'. Relative Proj
is StableReduction's and SchemeAndStackFoundations', consuming the graded algebras of Layer 6.

## Conventions

- `X` is an arbitrary scheme in universe `u`; no separatedness, Noetherian or finiteness
  hypothesis is standing. `X.Modules` carries Tau Ceti's canonical instances
  `Scheme.Modules.instMonoidalCategory`, `Scheme.Modules.instSymmetricCategory` and
  `Scheme.Modules.instMonoidalClosed`; no second monoidal structure is introduced, so
  commutative monoid objects of `X.Modules` here and in Tau Ceti are the same type.
- Finite locally free means Tau Ceti's `Scheme.Modules.isFiniteLocallyFree X`, that is
  `SheafOfModules.isFiniteLocallyFree X.ringCatSheaf`: locally free and of finite presentation.
- Rank is the bundled locally constant function `X → ℕ`; constant rank is assumed only where a
  statement says so. On the empty scheme every sheaf is zero and every rank statement is vacuous.
- Relative Spec is contravariant: `relativeSpec X : (QuasicoherentAlgebra X)ᵒᵖ ⥤ AffineSchemeOver X`,
  where `AffineSchemeOver X` is `MorphismProperty.Over IsAffineHom ⊤ X`: affine structure
  morphism, arbitrary morphisms over `X`.
- Two total spaces with opposite variance. For quasi-coherent `F`, `V_lin(F) = Spec_X Sym(F)` is
  contravariant in `F` and represents linear functionals: `Hom_X(T, V_lin(F)) ≃ Hom_{𝒪_T}(f^* F, 𝒪_T)`
  (Stacks Project, Tag 01M1). For finite locally free `E`, `V(E) = V_lin(E^∨)` is covariant in
  `E` and represents sections: `Hom_X(T, V(E)) ≃ Γ(T, f^* E)`. Witness: for `E = 𝒪_X`,
  `V(𝒪_X) = 𝔸¹_X` and a point `T → 𝔸¹_X` is a function in `Γ(T, 𝒪_T)`; the map `E → E` given by
  multiplication by `a ∈ Γ(X, 𝒪_X)` acts on `T`-points by multiplication by `f^* a`, while on
  `V_lin` it would be pulled back the other way.
- Gradings are by `ℕ`, and a linear scheme's coordinate algebra is generated in degree one; the
  degree-one piece of `Sym(F)` is `F`.

## Exact supplier contracts

### From Mathlib

At Mathlib `6b7abb3`:
`Scheme.Modules`, `Scheme.Modules.pullback`, `Scheme.Modules.pullbackPushforwardAdjunction`,
`Scheme.Modules.pullbackId`, `Scheme.Modules.pullbackComp` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean);
`SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFinitePresentation`,
`SheafOfModules.IsLocallyFree`; `SheafOfModules.pullbackObjUnitToUnit`;
`AlgebraicGeometry.tilde` and `AlgebraicGeometry.tildeEquiv`; `IsAffineHom`, `Scheme.Spec`,
`AffineSpace`, `AffineSpace.homOfVector`, `AffineSpace.homOverEquiv`, `AffineSpace.SpecIso`;
`CommMon`, `Functor.mapCommMon`, `GradedObject`, `ObjectProperty.IsMonoidal`,
`ObjectProperty.fullMonoidalSubcategory`, `HasLeftDual`, `ExactPairing`;
`SymmetricAlgebra`, `exteriorPower`, `Module.Basis.exteriorPower`, `Nat.multichoose`.
`IsLocallyFree` alone allows infinite and chart-dependent index types; finite presentation is
what makes it finite.

### From Tau Ceti

At Tau Ceti `a91d3aa`:

- monoidal structure: `Scheme.Modules.instMonoidalCategory`, `Scheme.Modules.instSymmetricCategory`,
  `Scheme.Modules.instMonoidalClosed`, `Scheme.Modules.isMonoidal_isQuasicoherent`
  (TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean); `TauCeti.SheafOfModules.monoidalClosed`,
  `SheafOfModules.dual` (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean);
  `SheafOfModules.ihomStalkEquiv` for a finitely presented source
  (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/FinitePresentation.lean);
- quasi-coherent sheaves: `QuasicoherentSheaf X` with its monoidal structure
  (TauCeti/AlgebraicGeometry/Modules/Quasicoherent/Basic.lean);
- finite locally free sheaves (TauCeti/AlgebraicGeometry/VectorBundle/): `Scheme.Modules.isFiniteLocallyFree`,
  `FiniteLocallyFreeSheaf`, `FiniteLocallyFreeSheaf.free`, `FiniteLocallyFreeSheaf.pullback`,
  `FiniteLocallyFreeSheaf.pullbackId`, `FiniteLocallyFreeSheaf.pullbackComp`,
  `FiniteLocallyFreeSheaf.toQuasicoherent`, `FiniteLocallyFreeSheaf.toFinitelyPresented`,
  `Scheme.Modules.isFiniteLocallyFree_iff_exists_openCover`; `FiniteLocallyFreeSheaf.rank`, `FiniteLocallyFreeSheaf.rankLocus`,
  `FiniteLocallyFreeSheaf.rank_pullback_apply`, `FiniteLocallyFreeSheaf.rank_biprod_apply`,
  `FiniteLocallyFreeSheaf.rank_tensor_apply`,
  `FiniteLocallyFreeSheaf.isInvertible_iff_forall_rank_eq_one` (Rank.lean);
  `FiniteLocallyFreeSheaf.isConstantRank`, `FiniteLocallyFreeSheaf.FixedRank`, `InvertibleSheaf.fixedRankOneEquiv`
  (FixedRank.lean); `FiniteLocallyFreeSheaf.dual`, `FiniteLocallyFreeSheaf.rigidCategory`,
  `FiniteLocallyFreeSheaf.evalIso`, `QuasicoherentSheaf.nonempty_hasLeftDual_of_isFiniteLocallyFree`
  (Dual/); `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` and its monoidal and dual comparisons
  (Affine/);
- `InvertibleSheaf X` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean) and
  `FinitelyPresentedSheaf X`;
- powers: `SheafOfModules.symmetricPower`, `SheafOfModules.exteriorPower`, the sheafification of
  the sectionwise powers, with their degree-zero and degree-one isomorphisms
  (TauCeti/Algebra/Category/ModuleCat/Sheaf/SymmetricPower.lean, ExteriorPower.lean);
- relative Spec (TauCeti/AlgebraicGeometry/RelativeSpec/): `CommMon.relativeSpec`,
  `CommMon.relativeSpecToBase`, `CommMon.isPullback_relativeSpecCover`, `QuasicoherentAlgebra`,
  `AffineSchemeOver`, `relativeSpec`, `TauCeti.AlgebraicGeometry.relativeSpecAffineIso`.

Assumed: these carry the canonical instances above; in particular `QuasicoherentAlgebra X` is
built on `Scheme.Modules.instMonoidalCategory`.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§5.1: the determinant of a finite projective module by its clopen rank decomposition, the
determinant maps between finite projectives of equal rank function, and their base change.
Layer 3 glues these on affine opens; on `Spec A` the determinant sheaf is the associated sheaf
of the ring-level determinant.

## How to read the build

Other roadmaps cite Layers 1–7 by the labels L0A, L0B, L0C, L1A, L1B, L2A and L2B respectively,
and Layers 1–3 together as L0.

Layer 1 finishes the monoidal theory of `X.Modules` by making pullback strong symmetric monoidal.
Layer 2 proves the dualizability criterion and the internal-Hom comparisons. Layer 3 adds the
rank formulas and pullback comparisons of symmetric and exterior powers and constructs the
determinant. Layer 4 completes relative Spec by the pushforward algebra and the functor of
points, and Layer 5 proves the anti-equivalence and base change. Layer 6 introduces graded
quasi-coherent algebras and linear schemes and proves `QCoh(X)ᵒᵖ ≌ LinearSch(X)`; Layer 7
restricts to finite locally free sheaves, dualizes, and proves the geometric-bundle equivalence
and dictionary.

## Layer 1: sheaves of modules

### 1.1 Strong monoidal pullback

Make `Scheme.Modules.pullback f`, for `f : Y ⟶ X`, a strong symmetric monoidal functor for the
canonical structures on `X.Modules` and `Y.Modules`: the comparison
`f^* E ⊗ f^* F → f^* (E ⊗ F)` and `f^* 𝒪_X → 𝒪_Y` are isomorphisms, the latter being Mathlib's
`SheafOfModules.pullbackObjUnitToUnit`, and they are compatible with the braiding. Prove that
`Scheme.Modules.pullbackId` and `Scheme.Modules.pullbackComp` are monoidal natural isomorphisms
(Stacks Project, Tag 01CI for the tensor algebra; the tensor case is the sheafification of the
sectionwise base change). *Needs:* Mathlib `Scheme.Modules.pullback`, `Scheme.Modules.pullbackComp`;
Tau Ceti `Scheme.Modules.instMonoidalCategory`.

- On free sheaves the tensor comparison is the identity of `𝒪_Y^(I × J)` under the free
  presentations.
- The identity morphism of `X` gives the identity comparisons up to `Scheme.Modules.pullbackId`.

**Checks.**
- Pull back `𝒪_X ⊗ 𝒪_X` along an open immersion and compute both sides as `𝒪_U`; a lax structure
  whose comparison is not invertible would already fail on `𝒪_X`.
- For `X = Spec ℤ`, `Y = Spec 𝔽_p` and `E = F = ℤ/p²` (as quasi-coherent modules), both sides are
  `𝔽_p`: the comparison is an isomorphism even though `E` is not flat, which rules out a
  definition that only works for flat modules.
- The braiding on `f^*(E ⊗ E)` for `E = 𝒪_X²` swaps the basis vectors `e_i ⊗ e_j` and
  `e_j ⊗ e_i`; a structure compatible only with the associator would not pin this.

### Examples

- For `R → S` and modules over `Spec R`, the comparison is `(M ⊗_R N) ⊗_R S ≅ (M ⊗_R S) ⊗_S (N ⊗_R S)`.

### Dependencies

Mathlib `Scheme.Modules`; Tau Ceti monoidal structure on `X.Modules`.

## Layer 2: quasi-coherent and finite locally free sheaves

### 2.1 The dualizability criterion

Prove `isFiniteLocallyFree_iff_nonempty_hasLeftDual`: for `E : QuasicoherentSheaf X`, the sheaf
`E` is finite locally free if and only if `E` has a left dual in the symmetric monoidal category
`QuasicoherentSheaf X`. One direction is Tau Ceti's
`QuasicoherentSheaf.nonempty_hasLeftDual_of_isFiniteLocallyFree`. For the other, a dual in the full
monoidal subcategory is a dual in `X.Modules`, so the sheaf is finitely presented and flat
(Stacks Project, Tag 0FNU), and on an affine open a finitely presented flat module is finite
locally free (Stacks Project, Tag 00NX). Alternatively, restriction to an affine open is strong
monoidal (Layer 1) and preserves duals, and Tau Ceti's affine criterion
`QuasicoherentSheaf.nonempty_hasLeftDual_iff_finite_projective` applies there. *Needs:* Tau Ceti
`QuasicoherentSheaf`, `Scheme.Modules.isFiniteLocallyFree_iff_exists_openCover`,
`QuasicoherentSheaf.nonempty_hasLeftDual_iff_finite_projective`; Layer 1 on the second route.

- The categorical dual agrees with `FiniteLocallyFreeSheaf.dual`, and the double-dual map is
  `FiniteLocallyFreeSheaf.evalIso`; these are at the pin and are not restated.

**Checks.**
- `𝒪_X^(ℕ)` on `X = Spec k` is quasi-coherent and locally free but not finite locally free; it has
  no dual, because a coevaluation `k → V^∨ ⊗ V` hits a finite sum of tensors. A criterion stated
  with `IsLocallyFree` alone would wrongly accept it.
- `k[t]/(t)` over `Spec k[t]` is finitely presented but not flat, hence not dualizable; it is not
  finite locally free, matching both sides.
- On the empty scheme both sides hold for the zero sheaf.

### 2.2 Internal Hom comparisons

Prove that the internal Hom `Hom(E, F)` of `Scheme.Modules.instMonoidalClosed` is quasi-coherent
when `E` is finitely presented and `F` is quasi-coherent (Stacks Project, Tag 01CM). Construct the
canonical comparison `f^* Hom(E, F) → Hom(f^* E, f^* F)` from Layer 1 and the adjunction, and prove
that it is an isomorphism when `E` is finitely presented and `f` is flat, or when `E` is finite
locally free and `f` is arbitrary (Stacks Project, Tag 0C6I). For finite locally free `E`, give the
isomorphism `Hom(E, F) ≅ E^∨ ⊗ F`. *Needs:* Layer 1; Tau Ceti `SheafOfModules.ihomStalkEquiv`,
`SheafOfModules.dual`.

- The comparison is natural in `E`, `F` and compatible with `Scheme.Modules.pullbackComp`.
- For a non-flat `f` and finitely presented `E`, the comparison is only a map.

**Checks.**
- `E = 𝒪_X/(t)` on `X = 𝔸¹_k` and `f` the inclusion of the origin: `Hom(E, 𝒪_X) = 0`, so
  `f^* Hom(E, 𝒪_X) = 0`, but `Hom(f^* E, 𝒪_pt) = k`. The comparison is not surjective, so the
  flatness hypothesis cannot be dropped.
- For `E = 𝒪_X^r`, both sides are `(f^* F)^r` and the comparison is the identity.
- For `E = 𝒪_X^(ℕ)` (free of countable rank, not finitely presented) on `Spec ℤ` and `f` the flat
  inclusion of the generic point, the comparison
  `(∏ ℤ) ⊗ ℚ → ∏ ℚ` is not surjective, which is why finite presentation is assumed.

### Examples

- On `Spec R`, the criterion reads: an `R`-module is finite projective if and only if it is
  dualizable in `R`-modules.

### Dependencies

Layer 1; Tau Ceti quasi-coherent and finite locally free sheaves.

## Layer 3: symmetric and exterior powers, determinant

### 3.1 Rank formulas

Prove `symmetricPower_isFiniteLocallyFree_rank`: for a finite locally free `E` and `n : ℕ`, the
sheaf `SheafOfModules.symmetricPower X.sheaf n` applied to `E` is finite locally free, and at
every point its rank is `Nat.multichoose r n`, where `r` is the rank of `E` there. Prove
`exteriorPower_isFiniteLocallyFree_rank`: likewise for `SheafOfModules.exteriorPower`, with rank
`Nat.choose r n`. Local freeness is Stacks Project, Tag 01CK (6); on a free sheaf of rank `r`
the degree-`n` monomials, respectively Mathlib's `Module.Basis.exteriorPower`, give a basis of the
right size. *Needs:* Tau Ceti power functors, `FiniteLocallyFreeSheaf.rank`,
`Scheme.Modules.isFiniteLocallyFree_iff_exists_openCover`.

**Checks.**
- `r = 0`: `Sym⁰(0) = ∧⁰(0) = 𝒪_X` has rank `multichoose 0 0 = choose 0 0 = 1`, and
  `Sym¹(0) = 0` has rank `multichoose 0 1 = 0`; a definition that forgot the degree-zero unit
  would give rank 0 in degree zero.
- `r = 2`, `n = 2`: `Sym²` has rank 3 (`x², xy, y²`), not the tensor-power rank 4, and `∧²` has
  rank 1; `n = 3`: `∧³ = 0`.
- Over `𝔽₂`, the quotient of `𝒪² ⊗ 𝒪²` by the antisymmetric relations `v ⊗ w + w ⊗ v` alone has
  rank 3, since `e₁ ⊗ e₁` survives; the exterior power, which kills `v ⊗ v`, has rank 1, so the
  alternating relation is the one meant.

### 3.2 Pullback comparisons

Construct natural isomorphisms `f^* Sym^n(E) ≅ Sym^n(f^* E)` and `f^* ∧^n(E) ≅ ∧^n(f^* E)` for
every `f : Y ⟶ X` and every `𝒪_X`-module `E` (Stacks Project, Tag 01CI), compatible with
`Scheme.Modules.pullbackComp`, with the degree-zero and degree-one isomorphisms of Tau Ceti, and
with Layer 1. *Needs:* Layer 1; Tau Ceti power functors.

**Checks.**
- `n = 1`: the comparison is the identity under the degree-one isomorphisms.
- `n = 0`: it is `SheafOfModules.pullbackObjUnitToUnit`.
- `E = 𝒪_X²`, `n = 2`, `f` a point: both sides are the 1-dimensional `∧²` of the fibre; the
  comparison sends `e₁ ∧ e₂` to `e₁ ∧ e₂`, not to its negative.

### 3.3 The determinant

Construct the determinant of a finite locally free sheaf as an invertible sheaf: on the clopen
rank locus where the rank is `r` it is `∧^r E`, glued from PadicMeasuresIwasawaAlgebras §5.1 on
affine opens. Construct, for each `r`, the determinant functor from
`FiniteLocallyFreeSheaf.FixedRank X r` to `InvertibleSheaf X`, identify it with
`SheafOfModules.exteriorPower X.sheaf r` on underlying sheaves, and with the locally constant rank
determinant on objects; on the core of all finite locally free sheaves it is functorial for
isomorphisms. Construct its pullback comparison. *Needs:* the rank formulas of Layer 3, the pullback comparisons of Layer 3,
PadicMeasuresIwasawaAlgebras §5.1, Tau Ceti `InvertibleSheaf.fixedRankOneEquiv`.

**Checks.**
- `det(𝒪_X^r) ≅ 𝒪_X`, and the automorphism given by an invertible matrix `A` acts by `det A`;
  the dual convention would give `det A⁻¹`.
- On `X = Spec k ⊔ Spec k` with `E` of rank 1 on one component and rank 2 on the other, the
  determinant is invertible of rank 1 everywhere, while `∧¹ E` and `∧² E` are not invertible.
- `r = 0`: `det(0) = 𝒪_X`.

### Examples

- For a finite projective module `P` over a ring `R` of constant rank `r`, the determinant sheaf on
  `Spec R` is the associated sheaf of `∧^r P`.

### Dependencies

Layers 1 and 2; Tau Ceti power functors and rank; PadicMeasuresIwasawaAlgebras §5.1.

## Layer 4: relative Spec

### 4.1 Pushforward algebra and pullback of algebras

Construct the pushforward algebra `p_* 𝒪_V` of `V : AffineSchemeOver X`: the carrier is the
actual pushforward of the structure sheaf, the unit and multiplication are those of regular
functions, and a morphism `g : V ⟶ W` over `X` acts by pulling back regular functions. This gives
a functor `AffineSchemeOver X ⥤ (QuasicoherentAlgebra X)ᵒᵖ`. Using Layer 1, pull back quasi-coherent
commutative algebras along `f : Y ⟶ X` via `Functor.mapCommMon`, and identify the pullback of the
structure algebra with the structure algebra. *Needs:* Layer 1; Tau Ceti `QuasicoherentAlgebra`,
`AffineSchemeOver`; quasi-coherence of the pushforward along an affine morphism, proved in this layer.

**Checks.**
- For `V = Spec R ⟶ Spec A`, the pushforward algebra is `R` as an `A`-algebra.
- For `V = X ⊔ X`, it is `𝒪_X × 𝒪_X`, not `𝒪_X ⊗ 𝒪_X`.
- For the identity of `X` it is `𝒪_X` with its own multiplication.

### 4.2 Functor of points

Prove that `X`-morphisms `T → Spec_X(A)` correspond to algebra maps `f^* A → 𝒪_T`, naturally in
the test scheme `f : T → X` (by pullback along `T' → T`, via the pullback-composition comparison
and the structure-algebra comparison) and in `A` (by precomposition) (Stacks Project, Tag 01LQ).
*Needs:* the pushforward algebra of Layer 4; Tau Ceti `relativeSpec`, `CommMon.isPullback_relativeSpecCover`.

**Checks.**
- For `A = 𝒪_X`, there is exactly one map, matching `Spec_X 𝒪_X = X`.
- For `A = 𝒪_X[t]`, maps are global functions on `T`.
- For `A = 𝒪_X × 𝒪_X`, maps are clopen decompositions of `T` into two pieces.

### Examples

- Over an affine base the universal property is Mathlib's `Spec` adjunction through
  `relativeSpecAffineIso`.

### Dependencies

Layer 1; Tau Ceti relative Spec.

## Layer 5: the relative-Spec anti-equivalence

### 5.1 Anti-equivalence

Prove `relativeSpec_isEquivalence`: `relativeSpec X` is an equivalence, with quasi-inverse the
pushforward algebra of Layer 4, explicit unit and counit, and the triangle identities (Stacks
Project, Tag 01SA). *Needs:* the pushforward algebra of Layer 4, the functor of points of Layer 4; Tau Ceti `relativeSpec`.

**Checks.**
- On the empty scheme both categories have a single object up to isomorphism.
- Over `Spec k`, the equivalence is `k`-algebras versus affine `k`-schemes; a non-affine morphism
  such as `𝔸² ∖ {0} → Spec k` is not an object, and its algebra of functions `k[x, y]` gives back
  `𝔸²`, so the restriction to affine morphisms is needed.
- `X = 𝔸¹_k` (coordinate `x`) and `A = 𝒪_X[t]/(t² − x)`: `Spec_X(A)` is the double cover
  `t² = x`, ramified at the origin, and its pushforward algebra is `A` again, free of rank 2 with
  basis `1, t`; unit and counit are tested on a non-split example.

### 5.2 Base change

Construct the isomorphism `Y ×_X Spec_X(A) ≅ Spec_Y(f^* A)` over `Y`, natural in `A` and
pseudofunctorial in `f`, compatible with `Scheme.Modules.pullbackComp` (Stacks Project, Tag 01LQ).
*Needs:* the pushforward algebra of Layer 4, the functor of points of Layer 4.

**Checks.**
- `A = 𝒪_X[t]`: both sides are `𝔸¹_Y`.
- `f` the identity: the isomorphism is the identity up to the pullback-identity comparison.
- `f` a closed point `Spec κ(x) → X` and `A = 𝒪_X × 𝒪_X`: both sides are two points.

### Examples

- Relative spectra of symmetric algebras, products and fibre products of affine `X`-schemes are
  computed affine-locally through `tildeEquiv`.

### Dependencies

Layer 4.

## Layer 6: graded algebras and linear schemes

### 6.1 Sheaf symmetric algebra and graded algebras

Define nonnegatively graded quasi-coherent commutative algebras as commutative monoid objects of
`GradedObject ℕ (QuasicoherentSheaf X)` with the graded tensor product, with graded algebra maps.
Construct the graded symmetric algebra of a quasi-coherent sheaf, whose degree-`n` piece is
`SheafOfModules.symmetricPower X.sheaf n`, its underlying quasi-coherent algebra `Sym(F)`, and the
degree-one functor, and prove that the graded symmetric algebra is left adjoint to the degree-one
functor on graded algebras; an algebra is free in degree one when the canonical map
`Sym^gr(A_1) → A` is an isomorphism. Export the affine graded-ring interface: degree-by-degree
sections on affine opens, the graded multiplication and unit, the direct-sum underlying algebra,
the localization, affine-restriction and arbitrary-base-change comparisons, preservation of finite
generation and of generation in degree one, and the symmetric-algebra comparison on affine
modules (Stacks Project, Tag 01CI). *Needs:* the pullback comparisons of Layer 3, the base change of Layer 5; Mathlib `GradedObject`, `SymmetricAlgebra`.

**Checks.**
- The degree-one piece of `Sym(𝒪_X²)` is `𝒪_X²`, and the degree-two piece has rank 3.
- `𝒪_X[t]/(t²)` with `t` in degree one is graded and generated in degree one but not free: the
  canonical map from `Sym(𝒪_X)` is not injective.
- On `Spec R`, `Sym(M~)` has sections `Sym_R(M)` over the whole scheme.

### 6.2 Linear schemes

Define a linear scheme over `X` as `V : AffineSchemeOver X` together with a grading of its
pushforward algebra that makes it free in degree one, with morphisms the `X`-morphisms whose
pullback preserves the grading. Construct `V_lin(F) = Spec_X Sym(F)` with its zero, addition and
scalar multiplication, and prove that linear schemes are equivalent to affine module schemes over
`X` whose canonical map `Sym^gr(A_1) → A` is an isomorphism, with grading-preserving morphisms
corresponding to module-structure-preserving ones. Prove the equivalence `QCoh(X)ᵒᵖ ≌ LinearSch(X)`
given by `V_lin` and the degree-one functor, with objectwise unit and counit isomorphisms (Stacks
Project, Tag 062N, where these objects are called vector bundles). *Needs:* the anti-equivalence of Layer 5, the graded algebras of Layer 6.

**Checks.**
- Over `𝔽_p`, `Spec 𝔽_p[t]/(t^p)` with `t` primitive is a module scheme whose coordinate algebra
  is not free in degree one; it is not a linear scheme, so the free-generation condition is
  needed.
- `V_lin(𝒪_X^r) = 𝔸^r_X`, with `T`-points the `r`-tuples of functions on `T`.
- The morphism `t ↦ t²` of `𝔸¹_X` is a morphism over `X` but not grading-preserving; it is not a
  morphism of linear schemes.

### Examples

- For `F = 𝒪_X`, the equivalence identifies the scaling maps `t ↦ a t` with `Γ(X, 𝒪_X)`.

### Dependencies

Layers 3, 4 and 5.

## Layer 7: geometric vector bundles

### 7.1 Total space and the bundle equivalence

Define geometric vector bundles as the full subcategory of linear schemes whose degree-one piece is
finite locally free. Define the total space `V(E) = V_lin(E^∨)` of a finite locally free sheaf
using `FiniteLocallyFreeSheaf.dual`, and prove that it is the forward functor of an equivalence
`FinLocFree(X) ≌ GeomVB(X)`, natural under base change (Stacks Project, Tag 01M1). Prove the
universal property `Hom_X(T, V(E)) ≃ Γ(T, f^* E)` as a natural isomorphism in the test scheme and
in `E`. *Needs:* the linear schemes of Layer 6, the base change of Layer 5; Tau Ceti `FiniteLocallyFreeSheaf.dual`, `FiniteLocallyFreeSheaf.evalIso`.

**Checks.**
- `E = 𝒪_X^r`: `V(E) = 𝔸^r_X`, and the universal property is Mathlib's `AffineSpace.homOverEquiv`;
  a definition through `V_lin(E)` instead of `V_lin(E^∨)` gives the same scheme here but the wrong
  action of a matrix `A`, which on `T`-points must be `v ↦ f^*(A) v`.
- `E = 0`: `V(E) = X`, one section.
- A map `E → E'` that is zero gives the zero-section map `V(E) → V(E')`, not the identity.

### 7.2 The sheaf/geometric dictionary

Prove as natural isomorphisms: pullback `f^* E` corresponds to the base change `Y ×_X V(E)`; global
sections to sections of `V(E) → X`; the fibre `E_x ⊗ κ(x)` to `Spec_{κ(x)} Sym((E_x ⊗ κ(x))^∨)`,
whose `κ(x)`-points are the vectors of the fibre; direct sum to fibre product over `X`; zero and
addition to the zero section and fibrewise addition; dual, tensor and internal Hom, symmetric and
exterior powers and the determinant to the corresponding geometric bundles. *Needs:* the total space of Layer 7, Layer 3.

**Checks.**
- The fibre of `V(𝒪_X²)` at `x` is `𝔸²_{κ(x)}`.
- `V(E ⊕ E') = V(E) ×_X V(E')`, not the product over `Spec ℤ`.
- The tautological case `InvertibleSheaf.trivial`: `V(𝒪_X) = 𝔸¹_X` is the trivial line bundle.

### Examples

- For a finite projective `R`-module `M`, `V(M~) = Spec Sym_R(M^∨) → Spec R`.
- A free-bundle map with matrix `A` over `Γ(X, 𝒪_X)` acts on section vectors over `T` by the matrix
  obtained by pulling back each entry of `A` along `T → X`.

### Dependencies

Layers 2, 3, 5 and 6.

## Downstream consumers

SchemeAndStackFoundations (all layers; relative Proj and Chern classes are its own),
StableReduction (Layer 6 for relative Proj), GroebnerGeometry (Layers 1–3 and 6), AdicSpacesPartIII
(Layers 1 and 2), NilpotentOrbits (total spaces), ReductiveGroups, SchubertGeometry, and
PadicMeasuresIwasawaAlgebras §5.1, which shares the determinant with Layer 3.

## References

- The Stacks Project, Sheaves of Modules (Tags 01CI, 01CK, 01CM, 0C6I, 0FNU), Algebra (Tag 00NX),
  Constructions of Schemes (Tags 01LQ, 01M1, 062N), Morphisms of Schemes (Tag 01SA).
- A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique* II, §1.
- R. Hartshorne, *Algebraic Geometry*, II.5.
