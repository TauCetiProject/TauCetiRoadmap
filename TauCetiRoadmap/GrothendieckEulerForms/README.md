# Roadmap: Grothendieck groups, Cartan maps, and Euler forms

**Summary.** A Grothendieck group turns decompositions into additive relations: in `K₀`, the class
of the middle term of a short exact sequence, of a biproduct or of a distinguished triangle is the
sum of the classes of the outer terms. An Euler form turns homological information into an integer
pairing, `χ(X, Y) = ∑ₙ (−1)ⁿ dim_k Extⁿ(X, Y)`, but only when every Ext group is
finite-dimensional and all but finitely many vanish. This roadmap builds both constructions in
reusable generality. Its objects are Quillen exact structures on additive categories, treated as
data rather than as a property of the category; the split, exact, abelian and triangulated
Grothendieck groups of essentially small categories, with their universal properties; finite
resolutions; the Cartan map `K₀(proj A) → G₀(mod A)` of a finite-dimensional algebra `A` over a
field `k`, acting on left modules; finite-support Euler characteristics and the Ext-Euler pairing;
and the left and right numerical quotients of a pairing that need not be symmetric. Every
construction is made twice, for ungraded categories and for categories with an internal grading
shift `M ↦ M{1}`, whose Grothendieck groups are modules over `ℤ[q, q⁻¹]` with `[M{1}] = q[M]`.

The first main theorem is the resolution theorem. Let `P` be a full subcategory of an exact
category `E`, closed under extensions and under kernels of admissible epimorphisms, such that
every object of `E` has a finite resolution by objects of `P`. Then inclusion induces an
isomorphism `K₀(P) ≅ K₀(E)`, whose inverse sends `[X]` to the alternating sum of the terms of any
finite `P`-resolution of `X`. If every finitely generated `A`-module has a finite resolution by
finitely generated projectives, the Cartan map is therefore an isomorphism, and the Cartan matrix
`C`, whose `(i, j)` entry is the multiplicity of the simple module `S_i` in the indecomposable
projective `P_j`, has determinant `±1`. The dual numbers `k[ε]/(ε²)` have `C = [2]`, so the
hypothesis cannot be dropped.

The second is the Euler identity over an arbitrary field. Let `E` be the matrix of Euler values
`χ(S_i, S_j)` of the simple modules and `D_i = End_A(S_i)`. If every Ext group between finitely
generated modules is finite-dimensional and vanishes in large degrees, then
`Cᵀ E = diag(dim_k D_i)`; if moreover finitely generated modules have finite projective
resolutions, `E = C⁻ᵀ diag(dim_k D_i)`. The familiar `E = C⁻ᵀ` needs every simple module to be
absolutely simple: for `k = ℝ` and `A = ℂ`, `C = [1]` but `E = [2]`.

The third is the graded theory. For a graded algebra all of whose finitely generated graded
modules have finite resolutions by finitely generated graded modules with projective underlying
module, the graded Cartan map is an isomorphism of `ℤ[q, q⁻¹]`-modules. For objects `M`, `N` of a
`k`-linear abelian category with a shift, the `q`-Euler form
`χ_q(M, N) = ∑ₙ (−1)ⁿ ∑ⱼ q⁻ʲ dim_k Extⁿ(M, N{j})`, defined when these groups are
finite-dimensional and only finitely many are nonzero, is antilinear in `M` and linear in `N` for
the involution `q ↦ q⁻¹`. When, in every degree, the sum over `j` of the graded Ext groups of
`(M, N)` is isomorphic to the Ext group of a pair `(M′, N′)` of an ungraded category, its value at
`q = 1` is `χ(M′, N′)`; forgetting the grading supplies such isomorphisms for finitely generated
graded modules over the path algebra of a finite acyclic quiver, graded by path length.

The fourth is the Betti form of the graded Cartan identity. If the graded simple modules `S_j` of a
graded finite-dimensional algebra have finite minimal graded projective resolutions by finitely
generated terms, and `B(q, t)` records with `q^d tⁿ` the number of copies of the shifted
projective `P_i{d}` in the `n`th term of the resolution of `S_j`, then the graded Cartan matrix
satisfies `C(q) · B(q, −1) = I`; for linear resolutions this reads `C(q) · B(−q, 1) = I`.

[QuiverRepresentations](../RepresentationTheory/QuiverRepresentations/README.md) supplies the
finite-dimensional-algebra objects (simple modules, projective covers, composition multiplicities,
path algebras and the Ringel form); this roadmap proves that its categorical `K₀` and Euler
pairings agree with them. [AlgebraicKTheory](../AlgebraicKTheory/README.md) and
[KTheoryLowDegrees](../KTheoryLowDegrees/README.md) own the ring-theoretic description of
projective modules and build on the split and exact `K₀` here.
[StablePeriodicCurved](../StablePeriodicCurved/README.md) builds Frobenius and stable categories
on the exact structures of Layer 0. [ZigzagPreprojective](../ZigzagPreprojective/README.md),
[DGAInfinity](../DGAInfinity/README.md) and [McKaySkewGroup](../McKaySkewGroup/README.md) use the
graded `K₀`, the `q`-Euler forms and the notion of linear resolution fixed here.

Layer 0 below builds exact structures and conflation-exact functors; Layer 1 a presentation of
Grothendieck groups of essentially small categories; Layer 2 the split, exact, abelian and
triangulated groups and their graded forms; Layer 3 finite resolutions, the resolution theorem and
linear graded resolutions; Layer 4 the Cartan map of a finite-dimensional algebra; Layer 5
finite-support Euler characteristics and the Ext-Euler pairing; Layer 6 the Laurent coefficients,
the `q`-Euler form and its specializations; Layer 7 the numerical quotients. The worked examples
fix signs, handedness, support hypotheses and matrix orientation.

## How to read the build

Layer 0 is foundational. Layer 1 supplies the small quotient engine, and Layer 2 instantiates it
for the four categorical Grothendieck groups. Layer 3 supplies finite resolutions and the
resolution theorem. Layer 4 uses Layers 0–3 and the finite-dimensional-algebra objects of
QuiverRepresentations. Layer 5 first builds finite-support Euler–Poincaré and then uses Layers 2–4
to descend Ext pairings. Each of Layers 2–5 is built in the graded setting as well as the ungraded
one (Convention 11); Layer 6 adds only the Laurent coefficient ring, the sesquilinearity and the
specializations. Layer 7 uses the pairings of Layers 5–6.

The graded work is not a second pass over a finished ungraded roadmap: a graded section is
completed with its ungraded counterpart, because the downstream roadmaps use the graded
constructions. The bounded-complex parts of Layers 2 and 5 need only the exact and `K₀`
interfaces, and so do the module-specific Layer 4 and the triangulated part of Layer 2. Each
worked example belongs to the first layer in which it can be stated; the rejection of the dual
numbers by Euler admissibility belongs to Layer 5, with the Ext-Euler descent. Each *Needs:* line
lists what its statement and its route use, so that a target proved by another route is not
blocked behind an unrelated section.

## Conventions

1. **Smallness.** A categorical Grothendieck group is formed only for an essentially small
   category. Given `[CategoryTheory.EssentiallySmall.{w} C]`, the generators are indexed by the
   small type `TauCeti.ObjectCode C`, which is `Shrink.{w} (Skeleton C)`, and an object of `C` is
   sent through the skeleton and shrink equivalences. Relations may be indexed by actual
   conflations or triangles in `C`; their generators lie in the chosen small universe. The
   construction lives in universe `w`, and its universal property proves independence of the
   skeleton and shrink choices and invariance under equivalence. A model through `SmallModel C` is
   equivalent, but no theorem stated for users depends on a choice of model.
2. **Exact structures are data.** A Quillen exact structure on an additive category is an
   isomorphism-closed distinguished class of kernel-cokernel pairs satisfying E0/E0op, E1/E1op and
   E2/E2op. In Bühler's numbering E0, E1, E2 are stated for inflations (identities, composition and
   pushout) and their dual axioms for deflations. It is not Mathlib's predicate
   `ShortComplex.Exact`. The split exact structure on an additive category and the canonical exact
   structure on an abelian category are different data even though both use the same underlying
   category.
3. **Functor terminology.** A functor preserving distinguished conflations is a
   *conflation-exact functor* (`TauCeti.ExactStructure.IsConflationExact`). The name
   `ExactFunctor` is not reused: Mathlib's `CategoryTheory.exactFunctor` and bundled `C ⥤ₑ D`
   concern preservation of finite limits and colimits. §0.4 compares the two notions for additive
   functors between abelian categories with their canonical exact structures.
4. **`K₀` relations.** Exact `K₀` is generated by object classes with `[Y] = [X] + [Z]` for each
   conflation `X ↪ Y ↠ Z`. Split `K₀` uses the biproduct relations `[X ⊞ Y] = [X] + [Y]`.
   Triangulated `K₀` uses `[Y] = [X] + [Z]` for every distinguished triangle `X ⟶ Y ⟶ Z ⟶ X[1]`.
5. **K-theory notation.** For a finite-dimensional algebra `A`, `K₀(proj A)` is the split `K₀` of
   finitely generated projective modules: the exact `K₀` of
   `TauCeti.finiteProjectiveModulesExactStructure A`, whose conflations are the split ones.
   `G₀(mod A)` is the abelian `K₀` of finitely generated modules: the exact `K₀` of
   `TauCeti.finiteModulesExactStructure A`, which is the canonical structure for `A` Noetherian.
   Dancso and Licata use the reverse letters in part of their exposition; their notation is
   translated, not adopted.
6. **Modules are left modules.** This matches QuiverRepresentations. A source written for right
   modules has its matrix formulas transposed explicitly. With simple modules `S_i`, projective
   covers `P_i` and Cartan entries `C_{ij} = [P_j : S_i]`, the columns of `C` record the
   projectives in the simple basis. QuiverRepresentations §3.3 uses the transposed row convention.
7. **General-field multiplicities.** Write `D_i = End_A(S_i)`. Exactness of `Hom_A(P_i, −)` gives
   `dim_k Hom_A(P_i, M) = dim_k D_i · [M : S_i]`, so `dim_k Hom_A(P_i, S_j) = δ_{ij} dim_k D_i`,
   not `δ_{ij}` in general. The integral projective/simple pairing uses the multiplicity coordinate
   `[M : S_i]`. Raw `k`-dimension gives the perfect Kronecker pairing only when the simple modules
   are absolutely simple, for example over an algebraically closed field. No canonical
   `D_i`-vector-space structure on every `Hom_A(P_i, M)` is asserted without separately
   constructing the correct sided action.
8. **Cartan comparison.** The Cartan map is `K₀(proj A) ⟶ G₀(mod A)`. When the modules under
   consideration have finite projective resolutions, the resolution theorem makes it an
   isomorphism and sends a module back to the alternating class of any finite projective
   resolution. In finite bases its matrix then has determinant `±1`; determinant `+1` is not a
   target.
9. **Euler finiteness.** An Ext-Euler value `χ(X, Y) = ∑ₙ (−1)ⁿ dim_k Extⁿ(X, Y)` exists only
   after proving separately that every term is finite-dimensional and that all sufficiently high
   terms vanish. Mathlib's `finsum`-based Euler characteristic returns a value even without finite
   support; that value is never used to hide divergence here.
10. **Nonsymmetry.** The Euler form is in general not symmetric. Its left radical consists of the
    classes pairing to zero against every second argument; its right radical of the classes
    annihilated by every first argument. They and their quotients remain distinct unless an
    explicit duality proves otherwise.
11. **Graded throughout.** The internal grading is not added in Layer 6. A graded exact category
    is an exact category with a chosen additive grading-shift autoequivalence `{1}` whose functor
    and inverse both preserve conflations, equivalently whose functor preserves and reflects them:
    Tau Ceti's `TauCeti.GradedExactStructure`, with the fields
    `TauCeti.GradedExactStructure.shift_exact` and
    `TauCeti.GradedExactStructure.shift_inverse_exact`. Forward preservation alone does not make
    the induced `K₀` map invertible. Every construction in Layers 1–5 has a graded counterpart over
    that datum, and the graded counterpart is a target of this roadmap built alongside the
    ungraded one: graded exact and abelian `K₀` with their shift action, graded finite and linear
    resolutions, the graded Cartan map and matrix, graded Ext with its internal degree, and the
    graded quiver comparison. Layer 6 adds only the Laurent coefficient ring, the
    sesquilinearity that goes with it, and the specializations. Where a statement has no graded
    analogue, the section says so and why. The downstream roadmaps (ZigzagPreprojective,
    HopfologicalAlgebra, DGAInfinity) use the graded versions almost exclusively, so an
    ungraded-only layer is not a usable dependency.
12. **Grading conventions.** For graded modules the internal shift has pieces
    `(M{j})_p = M_{p−j}`, so that `M{1}` moves the generators of `M` up by one degree, and it is
    normalized by `[M{1}] = q[M]`. With `qdim Hom(M, N) = ∑ⱼ q⁻ʲ dim_k Hom(M, N{j})`, equivalently
    `∑ⱼ qʲ dim_k Hom(M{j}, N)`, the `q`-Euler form is `q`-antilinear in its first argument and
    `q`-linear in its second. The coefficient involution is Mathlib's `LaurentPolynomial.invert`,
    sending `q` to `q⁻¹`; no private bar operation is introduced. Evaluation at `q = 1` and at
    `q = −1` always defines an algebraic specialization. Agreement at `q = 1` with an ungraded
    `K`-group or Euler form is a separate comparison theorem requiring an explicit forgetful
    functor and graded/ungraded Ext hypotheses; it is not a consequence of an internal shift
    alone. Either specialization may destroy nondegeneracy.
13. **Names.** A backticked `TauCeti.…` name is a declaration of the pinned Tau Ceti, used under
    that name. The roadmap's own Lean file declares, in the namespace
    `TauCetiRoadmap.GrothendieckEulerForms`, the abbreviation `ExactStructure` with the predicate
    `ExactStructure.Conflation` on composable pairs, used by StablePeriodicCurved, and the target
    `gradedCartanMap_bijective` of §4.5. Every other target is described in prose.

## Layer 0: intrinsic exact structures and conflation-exact functors

Build exact-category data without assuming that the ambient additive category has arbitrary
kernels or cokernels. Throughout, `C` is a preadditive category with a zero object and binary
biproducts, the standing hypotheses of `TauCeti.ExactStructure C`. The sources are Bühler,
Definition 2.1, Remarks 2.2–2.8, Propositions 2.9 and 2.12, Section 5, Definition 8.1 with Lemma
8.4, and Sections 13.1–13.3, which also serve as tests of the precise axiom packaging.

### 0.1 Kernel-cokernel pairs

A kernel-cokernel pair is a short complex `X ⟶ Y ⟶ Z` whose first map is a kernel of the second
and whose second map is a cokernel of the first. The two universal properties are Mathlib's
`IsLimit (KernelFork.ofι i w)` and `IsColimit (CokernelCofork.ofπ p w)` for the zero composite
`w`, which is how `TauCeti.IsKernelCokernelPair` records them (Bühler, Definition 2.1).
Isomorphisms of pairs are isomorphisms of short complexes: compatible isomorphisms at all three
objects.

- A short complex isomorphic to a kernel-cokernel pair is one
  (`TauCeti.IsKernelCokernelPair.of_iso`, `TauCeti.isKernelCokernelPair_iff_of_iso`).
- A short complex is a kernel-cokernel pair in `C` exactly when its opposite is one in `Cᵒᵖ`
  (`TauCeti.isKernelCokernelPair_op_iff`), and the direct sum of two pairs is a pair
  (`TauCeti.IsKernelCokernelPair.biprod`).
- In a balanced category with homology, a short complex is a kernel-cokernel pair exactly when it
  is short exact (`TauCeti.isKernelCokernelPair_iff_shortExact`).

*Needs:* Mathlib `Preadditive`, `ShortComplex`, `KernelFork.ofι`, `CokernelCofork.ofπ`, `IsLimit`,
`IsColimit`; Tau Ceti `TauCeti.IsKernelCokernelPair`.

### 0.2 Exact structures

An exact structure on `C` is `TauCeti.ExactStructure C`: a class of kernel-cokernel pairs, the
conflations, given as a `TauCeti.ConflationClass C` (a predicate on `ShortComplex C` closed under
isomorphism), satisfying the self-dual axioms E0/E0op, E1/E1op and E2/E2op (Bühler, Definition
2.1). E2 asks that every inflation have a pushout along an arbitrary map and that the resulting
map be an inflation; E2op asks the dual for deflations. These are genuine universal squares,
Mathlib's `MorphismProperty.HasPushouts` and `MorphismProperty.IsStableUnderCobaseChange` and
their duals, not named `Prop` fields. Two exact structures with the same conflations are equal
(`TauCeti.ExactStructure.ext`). The standard consequences (Bühler, Propositions 2.9 and 2.12):

- Split short complexes are conflations (`TauCeti.ExactStructure.conflation_of_splitting`).
- The direct sum of two conflations is a conflation (`TauCeti.ExactStructure.conflation_biprod`).
  Prove the same for every finite family of conflations, by induction on the family from the
  binary case and the conflation `0 ⟶ 0 ⟶ 0`.
- Isomorphisms are both inflations and deflations. Prove it from Mathlib's
  `CategoryTheory.MorphismProperty.of_isIso`, applied to the classes of inflations and of
  deflations, which contain the identities and respect isomorphisms.
- Let a commutative square have an inflation `f` as its top map. It is a pushout exactly when it
  is bicartesian, exactly when its associated short complex is a conflation
  (`TauCeti.ExactStructure.tfae_isPushout_of_isInflation`). Dually for a square with a deflation
  and pullbacks (`TauCeti.ExactStructure.tfae_isPullback_of_isDeflation`). The pushout of a
  conflation along a map of its first term is a conflation with the same cokernel
  (`TauCeti.ExactStructure.conflation_cobaseChange`), and dually
  (`TauCeti.ExactStructure.conflation_baseChange`).

*Needs:* §0.1; Mathlib `Limits.IsPushout`, `Limits.IsPullback`, `MorphismProperty.HasPushouts`,
`CategoryTheory.MorphismProperty.of_isIso`, finite biproducts; Tau Ceti `TauCeti.ConflationClass`,
`TauCeti.ExactStructure` and the declarations named above.

### 0.3 Calculus and duality

Inflations and deflations are the classes `TauCeti.ConflationClass.inflations` and
`TauCeti.ConflationClass.deflations` of first and second maps of conflations; inflations are
monomorphisms and deflations epimorphisms. Maps and isomorphisms of conflations are the morphisms
of `TauCeti.ConflationClass.ConflationCategory`, the full subcategory of short complexes on the
conflations; a map of conflations is an isomorphism exactly when its three components are. The
opposite exact structure is `TauCeti.ExactStructure.op`: its conflations are the opposites of the
conflations of `E` (`TauCeti.ExactStructure.op_conflation`), and its inflations are the opposites
of the deflations of `E` (`TauCeti.ExactStructure.op_inflations`) (Bühler, Remarks 2.2–2.8).

Define *admissible morphisms*: a morphism is admissible when it factors as a deflation followed
by an inflation (Bühler, Definition 8.1). Prove that the factorization is unique up to unique
isomorphism (Bühler, Lemma 8.4), that a morphism is admissible for `E` exactly when its opposite
is admissible for `E.op`, and that inflations and deflations are admissible.

Complete the transport of every theorem with an E/op partner: prove that `E.op.op` corresponds to
`E` under the equivalence `Cᵒᵖᵒᵖ ≌ C`, that the opposite of the split structure on `C` is the
split structure on `Cᵒᵖ` and the opposite of the canonical structure of an abelian `C` is the
canonical structure on `Cᵒᵖ`, and that reflection of conflations passes to opposite functors, as
conflation-exactness does (`TauCeti.ExactStructure.IsConflationExact.op`).

*Needs:* §0.2; Mathlib opposite categories and `opOpEquivalence`; Tau Ceti
`TauCeti.ExactStructure.op`, `TauCeti.ExactStructure.transport` (§0.4).

### 0.4 Conflation-exact functors

For exact structures `E` on `C` and `E′` on `D` and an additive functor `F : C ⥤ D`,
`TauCeti.ExactStructure.IsConflationExact E E′ F` says that `F` carries conflations to
conflations, and `TauCeti.ExactStructure.ReflectsConflations E E′ F` that a short complex is a
conflation whenever its image is (Bühler, Section 5).

- Identities and composites of conflation-exact functors are conflation-exact, and a functor
  isomorphic to a conflation-exact one is conflation-exact; the same for reflection.
- Conflation-exact functors preserve pushouts along inflations and pullbacks along deflations
  (`TauCeti.ExactStructure.IsConflationExact.map_isPushout`,
  `TauCeti.ExactStructure.IsConflationExact.map_isPullback`).
- An exact structure transfers along an equivalence `C ≌ D` with additive functor
  (`TauCeti.ExactStructure.transport`), making both the functor and its inverse conflation-exact
  and reflecting.
- For an equivalence `e` with additive functor, the inverse is conflation-exact exactly when
  `e.functor` reflects conflations
  (`TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations`).
- For abelian categories with their canonical exact structures, an additive functor is
  conflation-exact exactly when it preserves finite limits and finite colimits
  (`TauCeti.ExactStructure.isConflationExact_abelian_iff`); additivity is the only further
  hypothesis.

Define *exact equivalences*: an equivalence of categories whose functor and inverse are additive
and conflation-exact. Prove that identities, composites and inverses of exact equivalences are
exact equivalences, and that an equivalence is exact as soon as its functor is conflation-exact
and reflects conflations. The graded form is Tau Ceti's `TauCeti.GradedExactEquiv` (§2.6).

*Needs:* §§0.2–0.3; Mathlib additive functors, `CategoryTheory.exactFunctor`, `Equivalence`;
Tau Ceti `TauCeti.ExactStructure.IsConflationExact`, `TauCeti.ExactStructure.ReflectsConflations`
and the declarations named above.

### 0.5 The three fundamental constructions

The split exact structure on an additive category is `TauCeti.ExactStructure.split C`, whose
conflations are the split short complexes; the canonical exact structure of all short exact
sequences on an abelian category is `TauCeti.ExactStructure.abelian C`; and for a full
subcategory `P` that contains a zero object, is closed under binary biproducts and is
extension-closed for `E` (`TauCeti.ExactStructure.IsExtensionClosed`), the induced structure is
`TauCeti.ExactStructure.fullSubcategory` (Bühler, Sections 13.1–13.3). The closure under a zero
object and binary biproducts is explicit. The inclusion of `P` is conflation-exact and reflects
conflations (`TauCeti.ExactStructure.isConflationExact_ι`,
`TauCeti.ExactStructure.reflectsConflations_ι`). The split and canonical structures on an abelian
category are kept apart.

**Checks.**
- Over the dual numbers `A = k[ε]/(ε²)`, the sequence `0 → (ε) → A → A/(ε) → 0` of finitely
  generated modules is short exact, so a conflation of the canonical structure, but not split:
  a splitting would make `A ≅ k ⊕ k` as `A`-modules, on which `ε` acts by zero, while `ε ≠ 0`
  in `A`. A definition that identified the split and the canonical structures of an abelian
  category would accept it.

*Needs:* §§0.2, 0.4; Mathlib abelian categories, `ShortComplex.ShortExact`,
`ShortComplex.Splitting`; Tau Ceti `TauCeti.ExactStructure.split`,
`TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.IsExtensionClosed`,
`TauCeti.ExactStructure.fullSubcategory`.

### Examples

On finite-dimensional `k`-vector spaces every short exact sequence splits, so the split structure
and the canonical abelian structure have the same conflations. Prove that over the dual numbers
`A = k[ε]/(ε²)` the sequence `0 → (ε) → A → A/(ε) → 0` of finite-dimensional modules is a
conflation of the canonical structure and not of the split one, since `A` is indecomposable: this
is the instance behind Convention 2. By the same sequence, the identity functor from the split
structure to the canonical one is conflation-exact and does not reflect conflations.

### Dependencies

Mathlib's preadditive and abelian categories, `ShortComplex`, kernels and cokernels, listed under
the Mathlib supplier contracts; Tau Ceti's exact-structure carriers; nothing else of this
roadmap.

## Layer 1: the small presentation and universal additive invariants

Build the common engine for split, exact and triangulated `K₀`. The model is Weibel, *The K-book*,
Chapter II, Section 1 for group completion, Section 5 for symmetric-monoidal and split `K₀`, and
6.1.1–6.1.3 for presentations, the universal property and set-theoretic care.

### 1.1 Small generators

For an essentially small category `C`, the generators are the free abelian group on
`TauCeti.ObjectCode C = Shrink (Skeleton C)`. The class of an object `X` of `C` is
`TauCeti.freeOf X`, through the code `TauCeti.objectCode X` (Weibel, *The K-book*, Section II.6.1).

- Isomorphic objects have the same code and the same class, and conversely equal codes come from
  isomorphic objects (`TauCeti.objectCode_eq_objectCode_iff`, `TauCeti.freeOf_eq_freeOf_iff`).
- An isomorphism-invariant function on objects lifts to a unique additive map on the free group
  with the prescribed values on classes (`TauCeti.freeLift`, `TauCeti.freeLift_unique`).
- Induction over the presented group of §1.2 quantifies over objects of `C`, not skeleton
  representatives (`TauCeti.PresentedK0.induction_on`).

*Needs:* Mathlib `CategoryTheory.EssentiallySmall`, `Skeleton`, `Shrink`, `FreeAbelianGroup`; Tau
Ceti `TauCeti.ObjectCode`, `TauCeti.objectCode`, `TauCeti.freeOf`.

### 1.2 Relations as generated subgroups

For a family `rels` of elements of the free group, the presented group is
`TauCeti.PresentedK0 rels`, the quotient by the additive subgroup that `rels` generates (Weibel,
*The K-book*, II.6.1.1–6.1.3).

- Universal property: a function on objects that is invariant under isomorphism and satisfies the
  relations factors through a unique additive homomorphism
  (`TauCeti.PresentedK0.AdditiveInvariant`, `TauCeti.PresentedK0.liftEquiv`).
- Extensionality: two additive maps out of the presented group agreeing on object classes are
  equal (`TauCeti.PresentedK0.hom_ext`).

*Needs:* §1.1; Mathlib `AddSubgroup.closure` and quotients of additive groups.

### 1.3 Choice independence

A choice of small model for the isomorphism classes of `C` is a `TauCeti.IsoClassModel` (the
skeleton/shrink model, a `SmallModel`, or one transported along an equivalence). Two models carry
a canonical isomorphism of presented groups characterized by the class maps
(`TauCeti.IsoClassModel.K0.equiv`, `TauCeti.IsoClassModel.K0.equiv_of`,
`TauCeti.IsoClassModel.K0.equiv_unique`), with the cocycle laws
(`TauCeti.IsoClassModel.K0.equiv_refl`, `TauCeti.IsoClassModel.K0.equiv_symm`,
`TauCeti.IsoClassModel.K0.equiv_trans`) and naturality (`TauCeti.IsoClassModel.K0.equiv_map`). An
equivalence of categories induces an isomorphism of presented groups
(`TauCeti.PresentedK0.mapEquiv`). No theorem stated for users depends on definitional equality
between choices.

*Needs:* §§1.1–1.2; Mathlib `SmallModel` and `Skeleton` equivalences.

### 1.4 Products and biadditivity

For the groups of Layer 2, `K₀` of a product category is the product of the `K₀` groups
(`TauCeti.SplitK0.prodEquiv`, `TauCeti.ExactK0.prodEquiv`, `TauCeti.TriangulatedK0.prodEquiv`),
the class of a finite biproduct is the sum of the classes (`TauCeti.SplitK0.of_biproduct`), and a
functor of two variables satisfying the relations in each variable yields a biadditive map on
`K₀` (`TauCeti.SplitK0.BiadditiveInvariant.bilift`, `TauCeti.ExactK0.BiadditiveInvariant.bilift`,
`TauCeti.SplitK0.map₂`, `TauCeti.ExactK0.map₂`, `TauCeti.TriangulatedK0.map₂`).

Prove the same for the presented group of §1.2, from which the instances follow:

- a function `f` on pairs of objects of `C` and `D`, invariant under isomorphism in each variable,
  such that `f(−, Y)` satisfies the relations of `C` for every `Y` and `f(X, −)` those of `D` for
  every `X`, lifts to a unique biadditive map on the two presented groups;
- for relation families that contain the biproduct relations `[X ⊞ Y] − [X] − [Y]`, the presented
  group of `C × D`, presented by the images of the two families under `X ↦ (X, 0)` and
  `Y ↦ (0, Y)` together with the biproduct relations of `C × D`, is the product of the two
  presented groups, by `[(X, Y)] ↦ ([X], [Y])`.

*Needs:* §§1.1–1.2; Mathlib product categories and finite biproducts.

### Examples

For finite-dimensional vector spaces over a field `k`, prove that the free abelian group on the
small skeleton is free on one generator per dimension `0, 1, 2, …`: the code of a space is
determined by its dimension. Dimension is an isomorphism-invariant function on objects, so the
lift principle produces the additive map to `ℤ` sending the class of a space to its dimension.
Two choices of skeleton give two presentations, and the canonical isomorphism between them
matches the two class maps (`TauCeti.SplitK0.isoClassModelFinrankEquiv`,
`TauCeti.SplitK0.equiv_trans_isoClassModelFinrankEquiv`).

### Dependencies

Layer 0 for the conflations that index relations; Mathlib's `FreeAbelianGroup`, `Skeleton` and
`Shrink`.

## Layer 2: split, exact, abelian, and triangulated Grothendieck groups

Specialize Layer 1 with a uniform API. Weibel, *The K-book*, Chapter II, Sections 5–7 supplies
split and exact `K₀`, Section 6.1.2 the abelian universal property, and Exercise II.9.15 the
triangulated presentation and the bounded comparisons. Every group below is formed for an
essentially small category (Convention 1).

### 2.1 Split K₀

Split `K₀` is `TauCeti.SplitK0 C`, the quotient by `[X ⊞ Y] − [X] − [Y]`, for `C` with zero
morphisms and binary biproducts (Weibel, *The K-book*, Section II.5).

- Class map and relations: `TauCeti.SplitK0.of`, with `[X ⊞ Y] = [X] + [Y]`
  (`TauCeti.SplitK0.of_biprod`), `[0] = 0` and the class of a finite biproduct the sum of the
  classes (`TauCeti.SplitK0.of_biproduct`); induction over object classes
  (`TauCeti.SplitK0.induction_on`).
- Universal property for additive invariants, isomorphism-invariant functions to an abelian group
  that are additive on biproducts (`TauCeti.SplitK0.liftEquiv`).
- Functoriality for functors preserving zero morphisms and binary biproducts, in particular
  additive functors (`TauCeti.SplitK0.map`), with `TauCeti.SplitK0.map_id`,
  `TauCeti.SplitK0.map_comp`, invariance under natural isomorphism (`TauCeti.SplitK0.map_congr`),
  and an additive equivalence for an equivalence of categories (`TauCeti.SplitK0.mapEquiv`).
- Comparison with Mathlib's group completion `Algebra.GrothendieckAddGroup` of the commutative
  monoid of isomorphism codes under biproduct (`TauCeti.SplitK0.grothendieckAddGroupEquiv`, for
  `C` with a zero object).

**Checks.**
- On finite-dimensional vector spaces split `K₀` is `ℤ` through dimension, so `[k²] = 2[k]`.
  The free abelian group on isomorphism classes, without the biproduct relations, would keep
  `[k²]` and `2[k]` distinct.

*Needs:* §§0.5, 1.1–1.4; Mathlib `Algebra.GrothendieckAddGroup`; Tau Ceti `TauCeti.SplitK0` and
the declarations named above.

### 2.2 Exact K₀

For an exact structure `E`, exact `K₀` is `TauCeti.ExactK0 E`, the quotient by `[Y] − [X] − [Z]`
for every conflation `X ↪ Y ↠ Z` of `E` (Weibel, *The K-book*, Section II.7).

- Class map and relations: `TauCeti.ExactK0.of`, `TauCeti.ExactK0.of_conflation`,
  `TauCeti.ExactK0.of_biprod`, `TauCeti.ExactK0.of_zero`.
- Universal property for conflation-additive invariants (`TauCeti.ExactK0.liftEquiv`);
  isomorphism invariance is a consequence of additivity on the conflations given by isomorphisms.
- Functoriality for additive conflation-exact functors (`TauCeti.ExactK0.map`), with identity,
  composition, uniqueness and invariance under natural isomorphism; an exact equivalence (§0.4)
  induces an additive equivalence (`TauCeti.ExactK0.mapEquiv`, from the conflation-exactness of
  the functor and its inverse).
- The canonical comparison from split `K₀`, `TauCeti.ExactK0.fromSplit E`, sends `[X]` to `[X]`;
  it is the unique such additive map (`TauCeti.ExactK0.fromSplit_unique`), it is surjective, and
  it is natural for conflation-exact functors (`TauCeti.ExactK0.map_comp_fromSplit`). For two
  exact structures `E ≤ E′` on the same category the identity induces
  `TauCeti.ExactK0.ofLE`.

Prove that `TauCeti.ExactK0.fromSplit E` is the map induced by the identity functor from the
split structure to `E`: it is the composite of the identification of split `K₀` with the exact
`K₀` of `TauCeti.ExactStructure.split C` (every conflation of which splits) and the comparison
`TauCeti.ExactK0.ofLE` from the split structure to `E`.

*Needs:* §§0.2, 0.4, 1.1–1.4, 2.1; Tau Ceti `TauCeti.ExactK0`, `TauCeti.ExactK0.fromSplitEquiv`
and the declarations named above.

### 2.3 Abelian K₀

Abelian `K₀` is exact `K₀` for the canonical abelian exact structure, not a second presentation:
`TauCeti.AbelianK0 C` is defined as `TauCeti.ExactK0 (TauCeti.ExactStructure.abelian C)` (Weibel,
*The K-book*, Section II.6.1.2).

- Relations in terms of `ShortComplex.ShortExact` (`TauCeti.AbelianK0.of_shortExact`) and the
  universal property for invariants additive on short exact sequences
  (`TauCeti.AbelianK0.liftEquiv`).
- Functoriality for additive functors preserving finite limits and finite colimits
  (`TauCeti.AbelianK0.map`), invariance under natural isomorphism, and equivalence invariance
  (`TauCeti.AbelianK0.mapEquiv`).

*Needs:* §§0.5, 2.2; Mathlib `ShortComplex.ShortExact`; Tau Ceti `TauCeti.AbelianK0`.

### 2.4 Triangulated K₀

For an essentially small pretriangulated category, triangulated `K₀` is
`TauCeti.TriangulatedK0 C`, the quotient by `[Y] − [X] − [Z]` for each triangle `T` with
`T ∈ distTriang C` (`TauCeti.TriangulatedK0.of_distTriang`) (Weibel, *The K-book*, Exercise
II.9.15).

- Universal property for triangle-additive invariants (`TauCeti.TriangulatedK0.liftEquiv`); maps
  induced by triangulated functors commuting with the shift (`TauCeti.TriangulatedK0.map`), with
  naturality (`TauCeti.TriangulatedK0.map_congr`), equivalence invariance
  (`TauCeti.TriangulatedK0.mapEquiv`) and products (`TauCeti.TriangulatedK0.prodEquiv`).
- Compatibility with split triangles: the biproduct triangles give `[X ⊞ Z] = [X] + [Z]`
  (`TauCeti.TriangulatedK0.of_biprod`), and split `K₀` maps to triangulated `K₀` by
  `TauCeti.TriangulatedK0.fromSplit`.
- `[0] = 0` (`TauCeti.TriangulatedK0.of_zero`), `[X[1]] = −[X]`
  (`TauCeti.TriangulatedK0.of_shift_one`), and more generally `[X[n]] = (−1)ⁿ[X]` for every
  integer `n` (`TauCeti.TriangulatedK0.of_shift`).

**Checks.**
- In the bounded derived category of finite-dimensional vector spaces, whose triangulated `K₀` is
  `ℤ` through the Euler characteristic, `[k[1]] = −1` and `[k[2]] = 1`. A convention negating the
  class on every nonzero shift would give `[k[2]] = −1`.

*Needs:* §§1.1–1.4; Mathlib pretriangulated categories, `Triangle`, `distTriang` and shift
functors; Tau Ceti `TauCeti.TriangulatedK0` and the declarations named above.

### 2.5 Bounded-complex comparisons

For an additive category `C`, split `K₀` is triangulated `K₀` of the bounded homotopy category, the
inverse sending a bounded complex to the alternating sum of its terms
(`TauCeti.SplitK0.boundedHomotopyEquiv`,
`TauCeti.SplitK0.boundedHomotopyEquiv_symm_of_quotient_obj`). For an abelian category `A` with
Mathlib's derived category, the class of a bounded object is the alternating sum of the classes of
its homology (`TauCeti.TriangulatedK0.of_eq_sum_homology`), and abelian `K₀` is triangulated `K₀` of
the bounded derived category (`TauCeti.AbelianK0.boundedDerivedK0Equiv`, assuming the bounded
derived category essentially small). For a full subcategory `P` of an abelian category,
extension-closed and containing zero and binary biproducts, the Euler-class comparison stays at the
level of complexes and carries every closure hypothesis it needs: if the boundaries and the homology
objects of a bounded complex lie in `P` (whence its cycles and terms do), the alternating sum of the
classes of its terms in the exact `K₀` of `P` is the alternating sum of the classes of its homology
(`TauCeti.ExactK0.sum_negOnePow_of_X_eq_sum_negOnePow_of_homology`) (the argument of Weibel, *The
K-book*, Proposition II.7.5). A derived category of a general Quillen exact category would require
exact-acyclic localization and is outside this roadmap.

*Needs:* §§2.1, 2.3–2.4; Mathlib `HomologicalComplex`, `HomotopyCategory`, `DerivedCategory`; Tau
Ceti the declarations named above.

### 2.6 Graded exact categories and graded K₀

A graded exact category is a `TauCeti.GradedExactStructure`: an exact structure with a chosen
additive autoequivalence `{1}` whose functor and inverse are both conflation-exact
(`TauCeti.GradedExactStructure.shift_exact`, `TauCeti.GradedExactStructure.shift_inverse_exact`);
equivalently, by `TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations`, the
functor preserves and reflects conflations. Graded conflation-exact functors carry a chosen
shift-commutation isomorphism (`TauCeti.GradedConflationExact`), and so do graded exact
equivalences (`TauCeti.GradedExactEquiv`).

- The graded split, exact, abelian and triangulated groups are the groups of §§2.1–2.4 of the
  underlying categories, each with the induced `ℤ`-action `[M] ↦ [M{n}]` of the shift
  (`TauCeti.SplitK0.shiftZPow`, `TauCeti.GradedExactStructure.shiftEquiv`,
  `TauCeti.GradedExactStructure.shiftZPow`, `TauCeti.AbelianK0.shiftZPow`,
  `TauCeti.TriangulatedK0.shiftZPow`), and the universal property for invariants equipped with a
  compatible invertible shift action (`TauCeti.SplitK0.ShiftInvariant.liftEquiv`,
  `TauCeti.GradedExactStructure.ShiftInvariant.liftEquiv`,
  `TauCeti.AbelianK0.ShiftInvariant.liftEquiv`, `TauCeti.TriangulatedK0.ShiftInvariant.liftEquiv`).
- Forgetting the grading along a conflation-exact functor `U` to an ungraded exact category with
  `{1} ⋙ U ≅ U` induces a map from graded to ungraded `K₀` invariant under the shift action
  (`TauCeti.GradedExactStructure.map_shiftEquiv_of_commShift`).

This map is not an isomorphism in general; the hypotheses that make it one are §6.6. The
Laurent-module packaging of the `ℤ`-action is §6.1; the action itself is here.

**Checks.**
- For finite-dimensional graded vector spaces and the functor forgetting the grading, the graded
  group is free on the classes `[k{n}]`, `n ∈ ℤ`, and the forgetful map sends `[k{1}] − [k]` to
  `0`. So it is not injective; a statement that shift compatibility alone makes it an isomorphism
  fails here.

*Needs:* §§0.4, 2.1–2.4; Tau Ceti `TauCeti.GradedExactStructure`,
`TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations`, and the declarations
named above.

### Examples

Finite-dimensional vector spaces, the first worked example: split, exact and abelian `K₀` are all
`ℤ` through dimension (`TauCeti.SplitK0.finrankEquiv`, `TauCeti.AbelianK0.finrankEquiv`), and the
comparison from split `K₀` to abelian `K₀` is the identity of `ℤ`; prove this last statement. The
triangulated sign law at `n = 2` reads `[X[2]] = [X]`, so a convention negating on every shift is
wrong already there. Over the dual numbers, prove that split `K₀` of finitely generated modules is
free on `[S]` and `[A]` (Krull–Schmidt, `A` and `S` being the indecomposables), while the
conflation `0 → S → A → S → 0` gives `[A] = 2[S]` in abelian `K₀`; the comparison from split to
abelian `K₀` is therefore not injective.

### Dependencies

Layers 0–1; Mathlib's triangulated, homotopy and derived categories with `distTriang`; Tau Ceti's
`TauCeti.GradedExactStructure` for the graded groups.

## Layer 3: finite resolutions and the resolution theorem

Develop finite resolutions as reusable categorical data before applying them to projectives. The
resolution theorem in an exact category, under the hypotheses of §3.2, is the `K₀` case of Weibel,
*The K-book*, Theorem V.3.1; the common-refinement argument is that of Theorem II.7.6 and Lemma
II.7.6.1, stated there inside an abelian category. Bühler, Sections 11–12 supplies the stronger
comparison and horseshoe results specifically for projective resolutions in exact categories. The
statements record the extension-closed induced exact structures as well as the kernel and
finite-resolution hypotheses, rather than hiding them in ambient notation.

### 3.1 Objects with finite resolutions

For an object property `P` of an exact category, a finite `P`-resolution of `X` is
`TauCeti.ExactStructure.FiniteResolution E P X`: either `X` itself satisfies `P`, or a conflation
`K ↪ Q ↠ X` with `P Q` together with a finite `P`-resolution of `K`. So it is a finite chain of
conflations whose resolving terms satisfy `P`, and its last syzygy satisfies `P`.

- The complex presentation: a finite resolution gives a bounded augmented chain complex
  (`TauCeti.ExactStructure.FiniteResolution.toChainComplex`), and for the canonical structure of an
  abelian category a bounded exact augmented complex with terms in `P` gives back a finite
  resolution with the same complex (`TauCeti.ExactStructure.FiniteResolution.ofChainComplex`).
- The object-property presentation: `TauCeti.ExactStructure.admitsFiniteResolution E P`, with its
  induction principle; for the canonical structure of an abelian category it is Mathlib's
  `ObjectProperty.hasFiniteResolution` (`TauCeti.ExactStructure.abelian_admitsFiniteResolution`).
- Length, truncation, transport under isomorphism, zero padding and direct sums
  (`TauCeti.ExactStructure.FiniteResolution.length`,
  `TauCeti.ExactStructure.FiniteResolution.truncate`,
  `TauCeti.ExactStructure.FiniteResolution.ofIso`,
  `TauCeti.ExactStructure.FiniteResolution.zeroPad`,
  `TauCeti.ExactStructure.FiniteResolution.biprod`), padding and sums under closure of `P` under
  isomorphisms, zero and binary biproducts.

Prove the complex presentation for every exact structure: a bounded augmented complex with terms
in `P` that is spliced from conflations of `E` is a finite `P`-resolution, inverse to
`toChainComplex`. No map between two arbitrary preselected `P`-resolutions is asserted without a
lifting hypothesis; §3.5 supplies lifts for projective resolutions.

*Needs:* §§0.2–0.3, 0.5; Mathlib `ObjectProperty.hasFiniteResolution`, `ChainComplex`; Tau Ceti
`TauCeti.ExactStructure.FiniteResolution`, `TauCeti.ExactStructure.admitsFiniteResolution` and the
declarations named above.

### 3.2 Resolving subcategories

`TauCeti.ExactStructure.IsResolving E P` packages: `P` contains zero and is closed under binary
biproducts, is extension-closed, contains the kernel of every conflation whose middle and last
terms satisfy `P`, and every object of the ambient category has a finite `P`-resolution
(Weibel, *The K-book*, Theorem V.3.1). Repleteness follows from closure under extensions and
zero. The induced exact structure on `P` is explicit:
`TauCeti.ExactStructure.resolvingSubcategory E P`, whose inclusion is conflation-exact and
reflects conflations.

*Needs:* §§0.5, 3.1; Tau Ceti `TauCeti.ExactStructure.IsResolving`,
`TauCeti.ExactStructure.resolvingSubcategory`.

### 3.3 Euler class of a resolution

The alternating `K₀` class of a finite resolution, in the `K₀` of the ambient category and in the
`K₀` of the resolving subcategory, is independent of its length, of zero padding and of the choice
of resolution (`TauCeti.ExactStructure.eulerClassOf`,
`TauCeti.ExactStructure.IsResolving.eulerClassOf_eq`), and it is additive on conflations
(`TauCeti.ExactStructure.IsResolving.eulerClassOf_eq_add_of_conflation`), by Weibel's
common-refinement and mapping-cone argument under the packaged resolving hypotheses rather than by
the projective horseshoe lemma (Weibel, *The K-book*, proof of Theorem II.7.6 and Lemma II.7.6.1).
It descends to `TauCeti.ExactStructure.IsResolving.eulerHom`.

*Needs:* §§2.2, 3.1–3.2; Tau Ceti `TauCeti.ExactStructure.eulerClassOf`,
`TauCeti.ExactStructure.IsResolving.eulerHom`.

### 3.4 Resolution theorem

Under the resolving hypotheses, the inclusion induces an isomorphism on exact `K₀`,
`TauCeti.ExactStructure.IsResolving.resolutionEquiv`, whose inverse sends `[X]` to the alternating
sum of any finite `P`-resolution (`TauCeti.ExactStructure.IsResolving.resolutionEquiv_symm_of`)
(Weibel, *The K-book*, Theorem V.3.1). Both inverse identities hold, and the isomorphism is
natural under additive conflation-exact functors carrying `P` into the resolving subcategory of
the target (`TauCeti.ExactStructure.IsResolving.map_comp_resolutionEquiv`) and invariant under
exact equivalences matching the two resolving subcategories
(`TauCeti.ExactStructure.IsResolving.mapEquiv_comp_resolutionEquiv`).

*Needs:* §§2.2, 3.2–3.3; Tau Ceti `TauCeti.ExactStructure.IsResolving.resolutionEquiv` and the
declarations named above.

### 3.5 Projective-resolution calculus

Separately, when `P` consists of projective objects of `E`, a map `X ⟶ Y` lifts to a map from a
finite `P`-resolution of `X` to any finite resolution of `Y`
(`TauCeti.ExactStructure.FiniteResolution.lift`), uniquely up to chain homotopy
(`TauCeti.ExactStructure.FiniteResolution.liftHomotopy`), and two finite projective resolutions of
the same object are chain homotopy equivalent; the horseshoe lemma builds, from a conflation and
projective resolutions of its outer terms, a degreewise split resolution of the middle term
(`TauCeti.ExactStructure.FiniteResolution.horseshoe`) (Bühler, Sections 11–12). These stronger
statements serve the projective-module application of Layer 4 and are not attributed to
arbitrary resolving subcategories.

*Needs:* §§0.2, 3.1; Mathlib `Projective`, `Homotopy`; Tau Ceti the declarations named above.

### 3.6 Graded resolutions

For a graded exact category with its shift `{1}`, a graded finite `P`-resolution is a finite
resolution in the underlying exact category for a shift-stable property `P`
(`P.inverseImage {1} = P`), its internal degrees recorded by the shift; finite resolutions are
stable under the shift (`TauCeti.GradedExactStructure.admitsFiniteResolution_inverseImage_shift`).
Graded resolving subcategories are resolving subcategories with shift-stable `P`. The graded
resolution theorem is an isomorphism of the graded `K₀` groups of §2.6 commuting with the shift
action, stated as a `ℤ[q, q⁻¹]`-linear equivalence on `TauCeti.LaurentK0`, which as a group is
the graded exact `K₀` of §2.6 (`TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv`);
its inverse is the graded Euler class, the alternating class of any resolution, and it is natural
and invariant under graded exact equivalences. Graded comparison and horseshoe: lifts and the
horseshoe commute with the shift
(`TauCeti.ExactStructure.FiniteResolution.liftShiftHomotopy`,
`TauCeti.ExactStructure.FiniteResolution.Horseshoe.shift`). A conflation-exact functor `U` to an
ungraded exact category carrying `P` into an object property `P′` sends a graded finite
`P`-resolution of `X` termwise to a finite `P′`-resolution of `U X`
(`TauCeti.ExactStructure.FiniteResolution.map`). The agreement of the graded and ungraded Euler
classes after forgetting the grading is stated in §6.6, where the `q = 1` base change it needs
exists.

*Needs:* §§2.6, 3.1–3.5; Tau Ceti `TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv`,
`TauCeti.ExactStructure.FiniteResolution.map` and the declarations named above.

### 3.7 Linear resolutions and the Koszul boundary

Let `A` be a `k`-algebra with grading `𝒜 : ℤ → Submodule k A`, and `A₊` its positive part. A
graded projective resolution of a graded module `M` is a `TauCeti.GradedProjectiveResolution`. It
is **linear** (`TauCeti.GradedProjectiveResolution.IsLinear`) when its `i`th term is generated in
internal degree `i`, and **minimal** (`TauCeti.GradedProjectiveResolution.IsMinimal`) when every
differential lands in `A₊` times its target.

- Forward diagonal criterion: if `𝒜` is a direct-sum decomposition of `A`, with no nonnegativity
  hypothesis on the grading, a linear resolution of `M` forces `Extⁱ(M, N) = 0` for `i ≠ j`
  whenever `N` is concentrated in internal degree `j`
  (`TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne`), and
  `Extⁱ(M, N{j}) = 0` for `i ≠ j` whenever `N` is concentrated in degree `0`
  (`TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_shiftObj_of_ne`).
- Over a nonnegatively graded algebra a linear resolution is minimal
  (`TauCeti.GradedProjectiveResolution.IsLinear.isMinimal`).
- Converse against all concentrated targets: for `A` nonnegatively graded and a minimal resolution
  whose terms are bounded below, the resolution is linear exactly when `Extⁱ(M, N) = 0` for every
  `N` concentrated in a degree `j ≠ i`
  (`TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext`, with no
  semisimplicity and no field); with `k` a field and finite-dimensional terms, testing against
  the finite simple graded modules concentrated in one degree suffices
  (`TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext_simple`).
- Graded Nakayama for bounded-below modules: a bounded-below graded module is generated in degree
  `d` exactly when each of its pieces of degree other than `d` lies in `A₊M`
  (`TauCeti.InternalGrading.isGeneratedInDegree_iff_piece_le_positive_smul_top`).

Prove the converse tested against the degree-zero quotient alone: for `A` nonnegatively graded with
semisimple degree-zero part `A₀ = A/A₊`, a minimal graded projective resolution `P` of `M` whose
terms are bounded below (finitely generated terms suffice) is linear as soon as `Extⁱ(M, A₀{j}) = 0`
for `i ≠ j` (Beilinson–Ginzburg–Soergel, Proposition 2.14.2). Route: minimality makes both
differentials of `Hom_gr(P, A₀{j})` vanish, so `Extⁱ(M, A₀{j}) = Hom_{A₀}((Pᵢ/A₊Pᵢ)_j, A₀)`; a
semisimple `A₀` cogenerates its modules, so the vanishing says that `Pᵢ/A₊Pᵢ` is concentrated in
degree `i`, and graded Nakayama then says that `Pᵢ` is generated in degree `i`. Equivalently, the
vanishing against `A₀{j}` gives the vanishing against every target concentrated in degree `j`, and
the converse above applies.

Define the matrix-valued **Betti Poincaré series** of a graded module `M` with a minimal graded
projective resolution `P` by finitely generated terms. Writing `Pₙ ≅ ⊕_{i,d} P_i{d}^{β^n_{i,d}(M)}`
over the indecomposable graded projectives `P_i`, the entry of `M` at `P_i` is
`∑_{n,d} β^n_{i,d}(M) q^d tⁿ`, which retains both the homological degree `t` and the internal degree
`q`; for the family of graded simple modules `S_j` the entries form the matrix `B(q, t)` with rows
`P_i` and columns `S_j`. Prove that the series does not depend on the minimal resolution, that the
resolution is linear exactly when every entry is supported on the diagonal `d = n` (linearity is
Beilinson–Ginzburg–Soergel, Definition 2.14.1), and that the series of `M{1}` is `q` times the
series of `M`. A route compares `β^n_{i,d}(M) · dim_k End(S_i)` with `dim_k Extⁿ(M, S_i{d})`, which
minimality identifies with `Hom_gr(Pₙ, S_i{d})` as in the proof of Beilinson–Ginzburg–Soergel,
Theorem 2.11.1, and so compares the Betti series with Tau Ceti's bigraded Ext Poincaré series
(`TauCeti.bigradedExtPoincarePowerSeries`). Its Euler identity with the graded Cartan matrix is
§4.5.

This is the vocabulary in which Koszulity is stated: this layer supplies the definition and its
elementary equivalences, and the duality theorems that use them belong to DGAInfinity, Layer 11
(relative quadratic Koszul duality), and to ZigzagPreprojective. Fixing it here keeps one notion
of linearity for both.

**Checks.**
- For `Q = 1 ⟶ 2` with the path-length grading, the linear resolution `0 → P₂{1} → P₁ → S₁ → 0`
  and the resolution `P₂ → S₂` give the matrix `[[1, 0], [q t, 1]]` with rows `(P₁, P₂)` and
  columns `(S₁, S₂)`. A convention transposing rows and columns gives `[[1, q t], [0, 1]]`, and
  the convention `(M{j})_p = M_{p+j}`, under which the kernel `k·a`, with the arrow `a` in degree
  `1`, is `P₂{−1}`, gives the entry `q⁻¹ t`; the convention `(M{j})_p = M_{p−j}` of this roadmap
  gives `q t`.
- Over `A = k[x]` with `x` in degree `1`, the module `M = k[x]/(x²)` has the minimal resolution
  `0 → A{2} → A → M → 0` and the series `1 + q² t`. The term `q² t` lies off the diagonal, so the
  resolution is minimal and not linear; a series recording only the homological degree reads
  `1 + t` and cannot see this.
- Over the dual numbers with `ε` in degree `1`, the simple module `k` has the minimal resolution
  `⋯ → A{2} → A{1} → A → k` and the series `∑ₙ qⁿ tⁿ`: diagonal support with infinitely many
  terms. Each coefficient is a finite sum, which is all the definition asks; the simple module
  has no finite projective resolution, so a definition that reads the series off a finite
  resolution has no value here.

*Needs:* §§3.5–3.6; Mathlib `CategoryTheory.Abelian.Ext`, `HasExt`, semisimple rings and modules,
`PowerSeries`, `LaurentPolynomial`; Tau Ceti `TauCeti.GradedProjectiveResolution` and the
declarations named above.

### Examples

For the quiver `1 ⟶ 2` the sequence `0 → P₂ → P₁ → S₁ → 0` is a finite projective resolution, so
the inverse of the resolution theorem sends `[S₁]` to `[P₁] − [P₂]`; prove this. Over the dual
numbers the simple module `S` has the periodic minimal resolution of the dual-number worked
example and no finite projective resolution
(`TauCeti.not_admitsFiniteResolution_dualNumberResidue`); the resolving hypothesis fails, and
indeed `[S]` is not in the image of `K₀(proj A) = ℤ[A]`, which is `2ℤ[S]`
(`TauCeti.not_surjective_cartanMap_dualNumber`).

### Dependencies

Layers 0–2; Weibel, *The K-book*, Chapter II, Section 7 and Bühler, Sections 11–12, for the
routes named above.

## Layer 4: finite-dimensional algebras and the Cartan map

Let `k` be a field and `A` a finite-dimensional `k`-algebra, acting on left modules. The module
subcategories are replete full subcategories: finitely generated modules (equivalently
finite-dimensional or finite-length modules in this regime) with the canonical abelian exact
structure, and finitely generated projectives with the induced split structure. Several
statements below need less, an Artinian ring in place of `A` and no field, and are stated so.

Assem–Simson–Skowroński, Volume 1, Chapter I, Sections 4–5 covers indecomposable projectives and
projective covers; Chapter III, Section 3, especially Definitions 3.4 and 3.7 and Propositions
3.8, 3.10 and 3.13, covers `K₀`, Cartan matrices, unimodularity and Euler forms in its
algebraically closed, right-module convention. Webb, *A Course in Finite Group Representation
Theory*, Chapter 7, Sections 7.3–7.4, especially Proposition 7.4.1 and Corollary 7.4.2, supplies
the correction by the division algebras `D_i` over an arbitrary field. Dancso–Licata, Sections 1.1
and 2.2, motivates the projective/module comparison; its reversed `G₀`/`K₀` notation is
translated to the notation of Convention 5.

### 4.1 The two groups

`K₀(proj A)` is the exact `K₀` of `TauCeti.finiteProjectiveModulesExactStructure A` on the
finitely generated projective modules `TauCeti.finiteProjectiveModules A`, whose conflations are
the split ones (`TauCeti.finiteProjectiveModulesExactStructure_eq_split`); `G₀(mod A)` is the
exact `K₀` of `TauCeti.finiteModulesExactStructure A` on finitely generated modules, the canonical
structure for `A` Noetherian (`TauCeti.finiteModulesExactStructure_eq_abelian`); both come from
Layers 2–3.

- Morita invariance: an equivalence of module categories `ModuleCat A ≌ ModuleCat B` induces
  isomorphisms of both groups (`CategoryTheory.Equivalence.finiteModulesK0Equiv`,
  `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv`) compatible with the Cartan maps
  of §4.3, so one Cartan map is bijective exactly when the other is
  (`CategoryTheory.Equivalence.cartanMap_bijective_iff`, and
  `IsMoritaEquivalent.cartanMap_bijective_iff` for Morita-equivalent `R`-algebras).
- Bases over an arbitrary field, under the finite and Krull–Schmidt hypotheses supplied by
  QuiverRepresentations: for an Artinian ring, the classes of an exhaustive family of pairwise
  nonisomorphic indecomposable finitely generated projectives form a basis of `K₀(proj A)`
  (`TauCeti.indecomposableProjectiveClassBasis`), and the classes of an exhaustive family of
  pairwise nonisomorphic simple modules form a basis of `G₀(mod A)`
  (`TauCeti.simpleClassBasis`). No splitting hypothesis enters before the Hom-dimension
  identification of §4.2.

Prove algebra-equivalence invariance: an isomorphism `A ≃ₐ[k] B` of `k`-algebras induces
isomorphisms of both groups compatible with the Cartan maps. A route is Mathlib's
`IsMoritaEquivalent.of_algEquiv` with the Morita invariance above.

*Needs:* §§0.5, 2.1, 2.3; QuiverRepresentations §2.1 (Krull–Schmidt) and §3.1 (projective covers,
simple modules, finite-dimensional algebras); Mathlib `IsMoritaEquivalent.of_algEquiv`; Tau Ceti
`TauCeti.finiteProjectiveModules` and the declarations named above.

### 4.2 The projective/simple pairing

For an Artinian ring with families `P_i` and `S_i` as in §4.1 indexed by one type, the integral
pairing `⟨[P_i], [M]⟩ = [M : S_i]`, extended bilinearly, is `TauCeti.projectiveSimplePairing`,
with `[M : S_i]` the Jordan–Hölder multiplicity
(`TauCeti.projectiveSimplePairing_of_of`); for a finite index type it is a perfect pairing in the
two bases (`TauCeti.projectiveSimplePairing_isPerfPair`).

- For a projective cover `P_i → S_i` and `M` finite-dimensional of finite length,
  `dim_k Hom_A(P_i, M) = dim_k D_i · [M : S_i]` with `D_i = End_A(S_i)`
  (`TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity_mul_finrank_end`;
  Webb, Proposition 7.4.1).
- Its diagonal specialization: `dim_k Hom_A(P_i, S_i) = dim_k D_i`
  (`TauCeti.IsProjectiveCover.finrank_linearMap_eq_finrank_end`), and `Hom_A(P_i, S_j) = 0` for
  `S_j` simple and not isomorphic to `S_i`
  (`TauCeti.IsProjectiveCover.finrank_linearMap_eq_zero`).
- Under the hypothesis that `S_i` is absolutely simple, `dim_k D_i = 1`, the multiplicity pairing
  is raw Hom dimension (`TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`),
  and the Hom-dimension pairing equals the multiplicity pairing exactly when every simple module
  is absolutely simple (`TauCeti.projectiveExtEuler_eq_projectiveSimplePairing_iff`).

**Checks.**
- For `k = ℝ` and `A = ℂ`, `S = P = ℂ` and `D = ℂ`, so `dim_ℝ Hom_ℂ(ℂ, ℂ) = 2 = dim_ℝ D · [ℂ : ℂ]`,
  while the multiplicity pairing is `⟨[P], [S]⟩ = 1`. A pairing by raw `k`-dimension would be the
  `1 × 1` matrix `[2]`, which is not perfect over `ℤ`.

*Needs:* §4.1; QuiverRepresentations §3.1 (projective covers, simple modules, composition
multiplicities); Tau Ceti the declarations named above.

### 4.3 The Cartan map and matrix

The inclusion of projectives into modules is conflation-exact from the split induced structure
and gives the Cartan map `c_A : K₀(proj A) ⟶ G₀(mod A)`, `TauCeti.cartanMap A`. In the
projective-domain and simple-codomain bases its `j`th column is the composition-factor vector of
`P_j`, so its `(i, j)` entry is `[P_j : S_i]`: this is `TauCeti.cartanMatrix`, with
`TauCeti.cartanMap_of_eq_sum` expanding `c_A [P_j]` in the simple basis. For the path algebra of a
finite acyclic quiver the entry is the number of paths from `j` to `i`
(`TauCeti.PathAlgebra.cartanMatrix_vertexProjective_apply`).

Prove the transpose statements forced by the left-module convention rather than relying on prose:
QuiverRepresentations §3.3 indexes its Cartan matrix by rows `[P_i : S_j]`, the transpose of
`TauCeti.cartanMatrix`; and, from §4.2 with `M = P_j`, the corrected Hom formula
`dim_k Hom_A(P_i, P_j) = dim_k D_i · C_{ij}`, which reads `C_{ij} = dim_k Hom_A(P_i, P_j)` only
when `S_i` is absolutely simple.

**Checks.**
- For the quiver `1 ⟶ 2` with rows `(S₁, S₂)` and columns `(P₁, P₂)`, `C = [[1, 0], [1, 1]]`:
  `P₁` has composition factors `S₁` and `S₂`, and `P₂ = S₂`. The transposed convention gives
  `[[1, 1], [0, 1]]`, and reversing the arrow gives that matrix as well, so each slip changes the
  off-diagonal entry.

*Needs:* §§0.5, 2.2–2.3, 4.1–4.2; QuiverRepresentations §3.3 (Cartan and Euler matrices); Tau Ceti
`TauCeti.cartanMap`, `TauCeti.cartanMatrix`, `TauCeti.cartanMap_of_eq_sum`.

### 4.4 Finite projective resolutions

On the full subcategory of modules admitting finite resolutions by finitely generated
projectives, §3.4 makes `c_A` an isomorphism. If all finitely generated modules have such
resolutions, in particular for a finite-dimensional algebra of finite global dimension, this is
the full comparison `K₀(proj A) ≃ G₀(mod A)` (`TauCeti.cartanEquiv`, `TauCeti.cartanMap_bijective`,
for any ring; `TauCeti.cartanMap_bijective_of_finite_projectiveDimension` for a Noetherian ring
whose finitely generated modules have finite projective dimension). Its inverse is the
alternating projective-resolution class, independent of the resolution
(`TauCeti.cartanInverse_of`, `TauCeti.moduleEulerClassOf_eq`) (Weibel, *The K-book*, Theorem
II.7.6; Assem–Simson–Skowroński, III.3.8 and III.3.10).

*Needs:* §§3.1–3.4, 4.3; Tau Ceti the declarations named above.

### 4.5 The graded Cartan map

The first statements of this section hold over any commutative ring `k`. For a `k`-algebra `A`
with grading data `𝒜 : ℤ → Submodule k A`, the inclusion of finitely generated graded modules
with projective underlying module into finitely generated graded modules induces `K₀^gr(proj A) ⟶ G₀^gr(mod A)` as a map of `ℤ[q, q⁻¹]`-modules over the shift action,
`TauCeti.gradedCartanMap 𝒜` (from `TauCeti.gradedFiniteProjectiveModules 𝒜` into
`TauCeti.gradedFiniteModules 𝒜`), for arbitrary grading data. When `𝒜` is a decomposition of `A`
and every finitely generated graded module has a finite resolution by finitely generated graded
modules with projective underlying module, the graded Cartan map is an isomorphism
(`TauCeti.gradedCartanMap_bijective`, `TauCeti.gradedCartanEquiv`), whose inverse sends a class to
the alternating class of any such resolution
(`TauCeti.gradedCartanInverse_of_eq_foldAlternating`), and the graded Cartan determinant is `qⁿ`
or `−qⁿ` in any two bases indexed by the same finite type
(`TauCeti.exists_gradedCartanMatrix_det_eq_T_or_neg_T_of_le_admitsFiniteResolution`).

Prove `gradedCartanMap_bijective`: under the same resolution hypothesis, in the canonical exact
structure of all graded modules, the graded Cartan map is an isomorphism of `ℤ[q, q⁻¹]`-modules,
with no finiteness hypothesis on `A` and no decomposition hypothesis on `𝒜`, by the graded
resolution theorem of §3.6 (Weibel, *The K-book*, Theorem V.3.1). The finitely generated graded
modules with projective underlying module form a resolving subcategory of the finitely generated
graded modules: they are closed under extensions, and under kernels of epimorphisms because a short
exact sequence whose third term has projective underlying module splits on underlying modules.

The instance this layer uses is a graded finite-dimensional algebra with graded simple modules
and graded projective covers, where `𝒜` is a decomposition, the source is `K₀^gr(proj A)` with its
split structure, and the graded Cartan matrix `TauCeti.gradedCartanMatrix` is taken in the
graded projective and graded simple bases.

- Forgetting the grading recovers the ungraded Cartan map
  (`TauCeti.gradedFiniteModulesForgetK0_comp_gradedCartanMapSpecialized`), and setting `q = 1`
  recovers the ungraded matrix (`TauCeti.toMatrix_cartanMap_eq_map_gradedCartanMatrix`).
- The coefficients of the graded Cartan matrix in the bases of graded projectives `A e_j` are
  graded dimensions (`TauCeti.coeff_gradedCartanMatrix_gradedIdempotentProjectiveBasis`).

Prove that the `(i, j)` entry of the graded Cartan matrix is the graded multiplicity
`∑_d q^d [P_j : S_i{d}]`, where `[M : S_i{d}]` is the number of graded composition factors of
`M` isomorphic to `S_i{d}`.

When the graded simple modules have minimal graded projective resolutions by finitely generated
terms, prove the alternating Euler identity `C(q) · B(q, −1) = I` between the graded Cartan matrix
`C(q)`, with rows `S_i` and columns `P_j`, and the Betti Poincaré matrix `B(q, t)` of §3.7, with
rows `P_i` and columns `S_j`, evaluated at `t = −1`. It holds coefficientwise in `q` when, for each
`i` and `d`, only finitely many `n` have `β^n_{i,d} ≠ 0`, so that every internal-degree strand of
the resolutions is a finite exact sequence and each coefficient is a finite sum. When the
resolutions are finite it is an identity of Laurent-polynomial matrices, the matrix form of the
inverse of the graded Cartan isomorphism, which writes `[S_j]` as the alternating sum of the classes
of the terms of its resolution. When the resolutions are linear in the sense of §3.7, so that the
support is diagonal, it is the one-variable identity `C(q) · P(−q) = I` for the Poincaré matrix
`P(q) = B(q, 1)`; for a nonnegatively graded algebra whose degree-zero part is a product of copies
of `k`, this is Beilinson–Ginzburg–Soergel, Lemma 2.11.1 and Theorem 2.11.1, and the general
identity is the same Euler–Poincaré count made in each internal degree. A converse stated using
Betti series must retain that support data; Koszulity is not inferred merely from a numerical
Hilbert-series identity for a separately named quadratic dual. The Ext-side forms of these
identities, in the transposed convention, are Tau Ceti's
`TauCeti.gradedCartanMatrix_transpose_mul_gradedExtEulerMatrix_map_invert_eq_diagonal` and
`TauCeti.gradedCartanMatrix_transpose_mul_diagonalExtPoincareMatrix_map_eq_diagonal`, with the
converse keeping the support data `TauCeti.forall_isLinear_iff_cartan_poincare_maslovEuler`; they
give a route.

**Checks.**
- For `Q = 1 ⟶ 2` with the path-length grading, `P₁` has the composition factors `S₁` and `S₂{1}`,
  so `C(q) = [[1, 0], [q, 1]]`; with `B(q, −1) = [[1, 0], [−q, 1]]` from the Checks of §3.7,
  `C(q) · B(q, −1) = I`. A Betti convention recording `P_i{d}` by `q⁻ᵈ` gives the off-diagonal
  entry `q − q⁻¹` instead of `0`.
- For the dual numbers with `ε` in degree `1`, `C(q) = [1 + q]` and `B(q, −1) = ∑ₙ (−q)ⁿ`, whose
  product is `1` coefficientwise, although the simple module has no finite resolution; at `q = 1`
  the ungraded matrix `[2]` has no inverse over `ℤ`, and `B(1, −1)` does not converge.

*Needs:* §§2.6, 3.6–3.7, 4.3–4.4; Mathlib `LaurentPolynomial`, `PowerSeries`; Tau Ceti
`TauCeti.gradedFiniteModules`, `TauCeti.gradedFiniteProjectiveModules`, `TauCeti.gradedCartanMap`,
`TauCeti.gradedCartanMatrix`, `TauCeti.ExactStructure.admitsFiniteResolution` and the
declarations named above.

### 4.6 Unimodularity and its boundary

Under the hypotheses of §4.4, so that `c_A` is an isomorphism, and with finite projective and
simple bases, the Cartan matrix is invertible over `ℤ` and has determinant `±1`
(`TauCeti.cartanMatrix_det_eq_one_or_neg_one`, `TauCeti.isUnit_cartanMatrix`, for an Artinian
ring) (Assem–Simson–Skowroński, III.3.10). No statement asserts that the sign is positive. The
finite-resolution hypothesis is exactly the boundary: `k[ε]/(ε²)` has Cartan matrix `[2]`
(`TauCeti.cartanMatrix_dualNumber`, `TauCeti.not_isUnit_cartanMatrix_dualNumber`), so
unimodularity for every finite-dimensional algebra is false.

**Checks.**
- For `k[ε]/(ε²)` the determinant is `2`, not `±1`; for the quiver `1 ⟶ 2` it is `1`.

*Needs:* §§4.3–4.4; Mathlib `Matrix.det` and `IsUnit`; Tau Ceti the declarations named above.

### Examples

The quiver `1 ⟶ 2`, the second worked example: Cartan matrix `[[1, 0], [1, 1]]` with rows
`(S₁, S₂)` and columns `(P₁, P₂)`, `[P₁] ↦ [S₁] + [S₂]`, `[P₂] ↦ [S₂]`
(`TauCeti.Quiver.Kronecker.cartanMatrixA2`, `TauCeti.Quiver.Kronecker.cartanMap_vertexProjective_src`,
`TauCeti.Quiver.Kronecker.cartanMap_vertexProjective_tgt`), determinant `1`. The dual numbers:
Cartan matrix `[2]`, invertible over `ℚ` and not over `ℤ`. Over `k = ℝ` and `A = ℂ`,
`dim_ℝ Hom_ℂ(ℂ, ℂ) = 2 = dim_ℝ D · [ℂ : ℂ]` with `D = ℂ`, the instance separating raw Hom
dimension from the multiplicity pairing. Prove the determinant of the first, the invertibility
over `ℚ` of the second and the computation of the third.

### Dependencies

Layers 0–3; the finite-dimensional-algebra objects of QuiverRepresentations listed in the
supplier contracts.

## Layer 5: finite-support Euler characteristics and Ext-Euler descent

The reusable finite-support theorem comes before the Ext specialization. Weibel, *An Introduction
to Homological Algebra*, Sections 1.3 and 1.6 supplies long exact homology sequences in abelian
categories and Sections 2.4–2.7 derived-functor and Ext long exact sequences; the finite
Euler–Poincaré argument is the two bounded exact sequences through cycles and boundaries. Weibel,
*The K-book*, Propositions II.6.6 and II.7.5 give the corresponding `K₀` Euler formulas and their
closure hypotheses. Assem–Simson–Skowroński, III.3.13 gives the finite-global-dimension module
formula.

### 5.1 Finite graded families

For a value `a` in an abelian group attached to the terms of a `ℤ`-graded family, the signed sum
over an explicit finite support `s` is `TauCeti.finiteEulerSum`, `∑_{n ∈ s} (−1)ⁿ aₙ`; the support
is part of the input and is not inferred from the value of `finsum`. For an additive invariant of
an exact category and a family of objects it is
`TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum`.

- The sum does not depend on the declared support among those outside which the family vanishes
  (`TauCeti.finiteEulerSum_eq_of_eq_zero`).
- Reindexing by `m` multiplies by `(−1)ᵐ` (`TauCeti.finiteEulerSum_reindex_add`).
- It is additive on direct sums and on degreewise conflations
  (`TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum_biprod`,
  `TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum_conflation`).

Prove the finite-exact-sequence formula: for an additive invariant of an exact category and a
finite sequence `0 → X_m → ⋯ → X_0 → 0` spliced from conflations, the signed sum of the values
vanishes. For abelian categories it is the case of exact complexes in §5.2.

**Checks.**
- A family supported in degrees `0` and `1` with values `a` and `b` has signed sum `a − b`, and
  the same family shifted to degrees `1` and `2` has signed sum `b − a`; a definition that ignores
  the sign attached to the degree returns `a + b` for both.
- The empty family has signed sum `0`, and a family that vanishes outside a declared support has
  the same signed sum for every larger declared support; a definition whose value depends on the
  declared bounds rather than on the family fails the second test.
- The constant family with value `a ≠ 0` in every degree of `ℤ` has no finite support and is
  refused: Mathlib's `finsum` of it is `0`, and a definition that read that value would assign an
  Euler characteristic to a family that has none.

*Needs:* §§2.1–2.2; Mathlib `finsum`, `ComplexShape.EulerCharSigns` and `GradedObject.eulerChar`;
Tau Ceti `TauCeti.finiteEulerSum` and the declarations named above.

### 5.2 Bounded complexes and Euler–Poincaré

The Euler characteristic of a bounded complex in an essentially small abelian category, by its
terms, is `TauCeti.AbelianK0.eulerChar`, and by its homology `TauCeti.AbelianK0.homologyEulerChar`,
both over an explicit finite support. For a cochain complex strictly between degrees `a` and `b`
and a support containing `[a, b]`, the two agree (`TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`;
Weibel, *The K-book*, Proposition II.6.6). For a full exact subcategory `P` the theorem carries
its closure hypotheses: when the boundaries and the homology objects lie in `P`, so do the cycles
and the terms, and the identity holds in the exact `K₀` of `P`
(`TauCeti.ExactK0.sum_negOnePow_of_X_eq_sum_negOnePow_of_homology`). For vector spaces, and finite
modules over a Noetherian ring with rank-nullity, finite dimension of every term and boundedness
are explicit hypotheses, and Mathlib's `HomologicalComplex.eulerChar` and
`HomologicalComplex.homologyEulerChar` agree with the finite sums without using their value for
infinite support (`CochainComplex.eulerChar_eq_homologyEulerChar`,
`HomologicalComplex.eulerChar_forgetFG_eq_sum_finrank`).

*Needs:* §§0.5, 2.3, 5.1; Mathlib `HomologicalComplex.eulerChar` and
`HomologicalComplex.homologyEulerChar`; Tau Ceti the declarations named above.

### 5.3 Ext-finite pairs

For a `k`-linear abelian category with Mathlib's `HasExt`, a pair `(X, Y)` is Euler-admissible,
`TauCeti.IsEulerAdmissible k X Y`, when (i) every `Extⁿ(X, Y)` is finite-dimensional over `k`
(`TauCeti.IsExtFinite`) and (ii) there is a bound beyond which they vanish
(`TauCeti.IsExtBounded`). For object properties `P` and `Q`, `TauCeti.IsEulerAdmissibleOn k P Q`
asks it of every pair with `P X` and `Q Y`, with a bound depending on the pair.

- Closure under isomorphism (`TauCeti.IsEulerAdmissible.of_iso`), under extensions in either
  variable (`TauCeti.IsEulerAdmissible.of_shortExact₂`,
  `TauCeti.IsEulerAdmissible.of_shortExact₂'`), under finite sums
  (`TauCeti.IsEulerAdmissible.biprod`), and passage to smaller object properties
  (`TauCeti.IsEulerAdmissibleOn.mono`).
- Hom-finiteness, eventual Ext-vanishing and a uniform bound are separate conditions:
  Hom-finiteness is Mathlib's `FiniteDimensional k (X ⟶ Y)`, implied by Ext-finiteness
  (`TauCeti.IsExtFinite.finiteDimensional_hom`); the uniform bound is `TauCeti.IsExtBoundedOn`,
  which gives admissibility with Ext-finiteness; and global dimension of a ring at most `n` gives the
  uniform bound `n + 1` for all pairs of modules (`TauCeti.isExtBoundedOn_of_globalDimension_le`).

*Needs:* Mathlib `CategoryTheory.Abelian.Ext`, `HasExt` and `FiniteDimensional`; Tau Ceti
`TauCeti.IsEulerAdmissible` and the declarations named above.

### 5.4 The Ext-Euler value

Under an Euler-admissibility witness the finite sum `χ(X, Y) = ∑ₙ (−1)ⁿ dim_k Extⁿ(X, Y)` is
`TauCeti.extEuler`; it does not depend on the chosen bound (`TauCeti.extEuler_eq`), it is
invariant under isomorphism (`TauCeti.extEuler_of_iso`), and the long exact Ext sequences in
both variables, cut off by the eventual vanishing, give additivity in both variables
(`TauCeti.extEuler_shortExact₁`, `TauCeti.extEuler_shortExact₂`) (Weibel, *An Introduction to
Homological Algebra*, Sections 2.4–2.7).

*Needs:* §§5.1–5.3; Mathlib's long exact `Ext` sequences
(`Mathlib/Algebra/Homology/DerivedCategory/Ext/ExactSequences.lean`); Tau Ceti `TauCeti.extEuler`
and the declarations named above.

### 5.5 Descent

For extension-closed, essentially small object properties `P` and `Q` containing zero and closed
under binary biproducts, with `TauCeti.IsEulerAdmissibleOn k P Q`, the object-level value descends
to a biadditive pairing on the exact `K₀` groups of the two subcategories,
`TauCeti.extEulerPairing`, through `TauCeti.ExactK0.BiadditiveInvariant.bilift`, with
`TauCeti.extEulerPairing_of_of` on classes and the universal characterization
`TauCeti.extEulerPairing_unique` (Weibel, *The K-book*, Proposition II.7.5). It is natural under
exact `k`-linear functors bijective on Ext (`TauCeti.extEuler_map`,
`TauCeti.extEulerPairing_map_map`). A pairing pulled back along other source categories requires
additive conflation-exact functors into the canonical abelian exact structure; landing in
Euler-admissible objects alone is insufficient.

*Needs:* §§2.2–2.3, 5.4; Tau Ceti the declarations named above.

### 5.6 Projectives and resolutions

Projective evaluation: `χ(P, N) = dim_k Hom(P, N)` for `P` projective
(`TauCeti.extEuler_projective`). For a finite-dimensional algebra, or an Artinian `k`-algebra,
with finite exhaustive pairwise nonisomorphic families of simple modules `S_i` and
indecomposable projectives `P_i`, and projective covers `P_i → S_i`, put `C_{ij} = [P_j : S_i]`,
`E_{ij} = χ(S_i, S_j)` and `D = diag(dim_k End_A(S_i))`.

- Under the Euler admissibility of all pairs of finitely generated modules,
  `χ(P_i, S_j) = δ_{ij} D_{ii}` (`TauCeti.IsProjectiveCover.extEuler_eq_finrank_end`,
  `TauCeti.IsProjectiveCover.extEuler_eq_zero`) and **`Cᵀ E = D`**
  (`TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_diagonal`).
- When finitely generated modules have finite resolutions by finitely generated projectives, the
  Euler form is computed by the alternating Hom complex
  (`TauCeti.ExactStructure.FiniteResolution.extEuler_eq_homEuler`), and the invertible Cartan
  comparison gives **`E = C⁻ᵀ D`**
  (`TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose_mul_diagonal`). The diagonal is on the
  right, so `E_{ij} = (C⁻¹)_{ji} dim_k End_A(S_j)`.
- The unweighted `Cᵀ E = I` and `E = C⁻ᵀ` are the separate corollaries requiring
  `dim_k End_A(S_i) = 1` for every `i`, for example when every simple module is absolutely simple
  (`TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_one`,
  `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose`).
- The integral multiplicity pairing of §4.2 is kept separate from raw `k`-dimension.
- Over the dual numbers the residue field `S` has `Extⁿ(S, S) = k` for every `n`, so `(S, S)` is
  Ext-finite and not Euler-admissible (`TauCeti.not_isEulerAdmissible_dualNumberResidue`).

Prove the nonsplit check, as a required instance: for `k = ℝ` and `A = ℂ`, with `S = P = ℂ`, every
higher Ext vanishes, `C = [1]`, `D = [2]` and the raw Euler matrix is `E = [2]`, while the
multiplicity pairing is `[1]`.

**Checks.**
- For `k = ℝ` and `A = ℂ`, `Cᵀ E = [1] · [2] = [2] = D`; the unweighted identity `Cᵀ E = I` would
  read `[2] = [1]`.
- For the quiver `1 ⟶ 2`, `C = [[1, 0], [1, 1]]` and `E = [[1, −1], [0, 1]]`, so
  `Cᵀ E = [[1, 1], [0, 1]] · [[1, −1], [0, 1]] = I = D`: the vertex simple modules are absolutely
  simple. With `C` in place of `Cᵀ` the product is `[[1, −1], [1, 0]]`.

*Needs:* §§3.5, 4.2–4.4, 5.4–5.5; QuiverRepresentations §3.1 (simple modules, projective covers);
Tau Ceti the declarations named above; Webb, Corollary 7.4.2; Assem–Simson–Skowroński, III.3.13.

### 5.7 Graded Ext and graded descent

For an abelian category with an autoequivalence `e`, the graded Ext groups are
`TauCeti.GradedExt e X Y n j = Extⁿ(X, eʲ Y)`, the bigraded `Ext^{n,j}`. Graded Euler
admissibility, `TauCeti.IsGradedEulerAdmissible`, keeps the two finiteness conditions separate,
exactly as in the ungraded case: finite Laurent support in every cohomological degree, and a
cohomological bound uniform in the internal degree. The graded Euler characteristic is
`TauCeti.gradedExtEuler`, additive in both variables through the long exact Ext sequences
(`TauCeti.gradedExtEuler_shortExact₁`, `TauCeti.gradedExtEuler_shortExact₂`), and it descends to
graded `K₀` (`TauCeti.gradedExtEulerPairing`). The Laurent-polynomial packaging of the bigraded
numbers is §§6.2–6.3; the bigraded groups and their additivity are here.

The graded/ungraded Ext comparison for a pair `(X, Y)` of the graded category and a pair
`(X′, Y′)` of an ungraded `k`-linear abelian category is `TauCeti.IsGradedExtComparison`: for every
cohomological degree `n`, a `k`-linear isomorphism `⊕ⱼ Extⁿ_gr(X, Y{j}) ≅ Extⁿ(X′, Y′)`. The
intended pairs are `(U X, U Y)` for a functor `U` forgetting the grading, but the predicate
mentions no functor and no coefficient ring, and a functor with `{1} ⋙ U ≅ U` does not by itself
supply the isomorphisms. A comparison carries graded Euler admissibility of `(X, Y)` to Euler
admissibility of `(X′, Y′)` (`TauCeti.IsGradedExtComparison.isEulerAdmissible`), and a pair whose
bigraded Ext vanishes outside one internal degree `d` is compared with `(X, Y{d})` inside the graded
category itself (`TauCeti.isGradedExtComparison_of_subsingleton_ne`). The identity of Euler
characteristics at `q = 1` that a comparison yields is §6.6.

**Checks.**
- For the path-length-graded `kQ` with `Q = 1 ⟶ 2`, the pair `(S₁, S₂)` and its underlying
  ungraded pair: `Ext¹_gr(S₁, S₂{j})` is `k` for `j = 1` and `0` otherwise, and `Ext¹(S₁, S₂) = k`,
  so the comparison holds in degree `1` with the sum concentrated in `j = 1`; in degree `0` both
  sides are `0`.
- For one vertex with two loops `x`, `y`, the module `X = kQ/(x yⁿ : n ≥ 0)` against the simple
  module `S`: the forgetful functor is shift-compatible and the comparison holds in degree `0`,
  where both sides are `k`, but fails in degree `1`, where `⊕ⱼ Ext¹_gr(X, S{j}) ≅ ⊕_ℕ k` and
  `Ext¹(X, S) ≅ ∏_ℕ k`. A predicate asking only for a shift-compatible functor, or only for the
  degree-`0` isomorphism, accepts this pair.
- A one-dimensional graded vector space `M` concentrated in internal degree `0`, with its
  underlying ungraded space: `Ext⁰_gr(M, M{j})` is `k` for `j = 0` and `0` otherwise,
  `Ext⁰(U M, U M) = k`, and every higher term is `0` on both sides, so the comparison holds and
  the single-degree criterion applies with `d = 0`.

*Needs:* §§2.6, 5.3–5.5; Tau Ceti `TauCeti.GradedExt`, `TauCeti.IsGradedEulerAdmissible`,
`TauCeti.gradedExtEuler`, `TauCeti.gradedExtEulerPairing`, `TauCeti.IsGradedExtComparison` and the
declarations named above.

### 5.8 Quiver comparison

For a finite acyclic quiver, the categorical Ext-Euler form agrees with Tau Ceti's Ringel form
`TauCeti.eulerForm` on dimension vectors (`TauCeti.extEuler_eq_eulerForm_dimVector`) and with the
projective evaluation (`TauCeti.extEuler_indecProjModule_eq_eulerForm`); its symmetrization agrees
with `TauCeti.titsPolarForm` (`TauCeti.extEulerPairing_add_flip_eq_titsPolarForm`), while the raw
form remains nonsymmetric. Here a finite acyclic quiver is a finite quiver whose path algebra is
finite-dimensional, which by `TauCeti.module_finite_pathAlgebra_iff` holds exactly when `Q` has
finitely many paths.

The graded version, with the path-length grading on `kQ`: the bigraded Ext-Euler form of the
graded vertex simple modules is `δ_{ij} − q⁻¹ · #(arrows i → j)`
(`TauCeti.PathAlgebra.gradedExtEuler_gradedVertexSimple_gradedVertexSimple`). The graded Ext
comparison of §5.7 holds for the forgetful functor: for finitely generated graded modules `X`, `Y`
over the path-length-graded `kQ` of a finite acyclic quiver,
`⊕ⱼ Extⁿ_gr(X, Y{j}) ≅ Extⁿ(U X, U Y)` in every degree. This is the instance of the comparison
for a finitely generated graded module over a Noetherian graded algebra
(`TauCeti.GradedModuleCat.isGradedExtComparison_toModuleCat`), applied to the grading
`TauCeti.PathAlgebra.gradeBy` with every arrow of weight `1`, and in the integer-indexed
path-length grading `TauCeti.PathAlgebra.integerGrade` it is
`TauCeti.PathAlgebra.isGradedExtComparison_forget`. Its route: a finitely generated graded module
over a finite-dimensional nonnegatively graded algebra has a graded projective resolution by
finitely generated graded free modules, forgetting the grading sends it to a projective
resolution, and `Hom(U P, U Y) = ⊕ⱼ Hom_gr(P, Y{j})` termwise for finitely generated `P`. Its
specialization at `q = 1` to the ungraded form is the general theorem of §6.6 applied to this
comparison.

Prove that the comparison can fail when `kQ` is not Noetherian. For one vertex with two loops `x`,
`y`, the left ideal `Ω` generated by the words `x yⁿ` is free on them, no such word being a proper
suffix of another, so `X = kQ/Ω` is cyclic with the resolution `0 → Ω → kQ → X → 0`. Against the
simple module `S` the restriction `Hom(kQ, S) → Hom(Ω, S)` is zero, so `Ext¹(X, S) ≅ ∏_ℕ k`, of
uncountable dimension, while `Ext¹_gr(X, S{j})` is `k` for `j ≥ 1` and `0` otherwise, so
`⊕ⱼ Ext¹_gr(X, S{j}) ≅ ⊕_ℕ k`, of countable dimension: no comparison isomorphism exists in degree
one. The graded statement, not the ungraded one, is what the graded Cartan matrix `(1 + q²)I + qA`
of ZigzagPreprojective is compared against.

*Needs:* §§3.6, 4.5, 5.4–5.7; QuiverRepresentations §0.1 (path algebras) and §4.1 (Ext and the
Ringel form); Tau Ceti `TauCeti.eulerForm`, `TauCeti.titsPolarForm`, `TauCeti.PathAlgebra.gradeBy`,
`TauCeti.GradedModuleCat.toModuleCat`, `TauCeti.IsGradedExtComparison` and the declarations named
above.

### Examples

The quiver `1 ⟶ 2`: `E = [[1, −1], [0, 1]]`, `Cᵀ E = [[1, 1], [0, 1]] · [[1, −1], [0, 1]] = I = D`,
and `E + Eᵀ` is the `A₂` Gram matrix (`TauCeti.Quiver.Kronecker.extEulerMatrix_A2_eq`,
`TauCeti.Quiver.Kronecker.eulerMatrixA2_add_transpose`). The oriented `E₈` quiver, the third worked
example (`TauCeti.Quiver.E8.extEulerMatrix_add_transpose`,
`TauCeti.Quiver.E8.posDef_map_intCast_extEulerMatrix_add_transpose`). The dual numbers:
`Extⁿ(S, S) = k` for every `n`, so Euler admissibility is refused and no value is assigned. The
nonsplit check `k = ℝ`, `A = ℂ`: `C = [1]`, `E = [2]`, `Cᵀ E = [2] = D`. The two-loop quiver
above: the graded comparison fails in degree one.

### Dependencies

Layers 2–4; Mathlib's `Ext` with its `HasExt` instances; the Ext-Euler declarations of Tau Ceti
named above; the Ringel form of QuiverRepresentations.

## Layer 6: Laurent coefficients, q-Euler forms, and specialization

The graded categories, graded `K₀`, graded resolutions, the graded Cartan matrix and bigraded Ext
are built in Layers 2–5. This layer adds only the coefficient ring and what depends on it. Let
`R = ℤ[q, q⁻¹]`, Mathlib's `LaurentPolynomial ℤ`, with bar involution `LaurentPolynomial.invert`.

Dancso–Licata, Section 2.2, especially Definition 2.3 and Proposition 2.7, is the model for graded
`K₀` and the `q`-Euler form; Sections 1.2 and 3.1–3.2 fix `q`-antilinearity, Gram matrices,
left and right duals, and specialization warnings. This roadmap adopts its sesquilinearity
convention but not its reversed ungraded `K`-group letters. Definition 2.3 takes the coefficient
of `qᵏ` to be the dimension of the degree-`k` piece of `Ext(M, N)`, the maps raising degree by
`k`; with the shift `(M{j})_p = M_{p−j}` of their Proposition 2.4, this piece is `Ext(M, N{−k})`,
so their form is the `q⁻ʲ` convention of Convention 12, as the Gram matrix of their Example 3.3
confirms.

### 6.1 Shift-module structure

For the two-sided exact grading datum of §2.6, the shift induces an additive automorphism of
graded exact `K₀`, `TauCeti.GradedExactStructure.shiftEquiv`, whose inverse is induced by the
inverse shift, using that the inverse is conflation-exact. With it, graded `K₀` is the
`R`-module `TauCeti.LaurentK0 E`, and `[M{n}] = qⁿ[M]` for every `n : ℤ`
(`TauCeti.LaurentK0.T_smul`), in particular `[M{1}] = q[M]`
(Dancso–Licata, Section 2.2). Universal property: `R`-linear maps out of `TauCeti.LaurentK0 E`
are the additive invariants equipped with a compatible invertible shift action
(`TauCeti.LaurentK0.liftEquiv`).

*Needs:* §2.6; Mathlib `LaurentPolynomial`; Tau Ceti `TauCeti.GradedExactStructure.shiftEquiv`,
`TauCeti.LaurentK0`, `TauCeti.LaurentK0.T_smul`, `TauCeti.LaurentK0.liftEquiv`.

### 6.2 Finite Laurent support

Graded dimension is defined only for a graded vector space whose pieces are finite-dimensional
and zero outside a finite set of internal degrees (`TauCeti.HasFiniteLaurentSupport`), as
`TauCeti.gradedDimension`, with coefficient `dim_k V_j` at `qʲ`; the target-shift form
`TauCeti.targetShiftGradedDimension` is its image under the bar involution. Graded Ext
admissibility (§5.7) asks for cohomological finite support and finite Laurent support in every
surviving degree. For the target-shift pieces,
`qdim Extⁿ(M, N) = ∑ⱼ q⁻ʲ dim_k Extⁿ_gr(M, N{j})` (`TauCeti.gradedExtDimension`).

- Finite Laurent support passes to the middle term of a degreewise exact sequence
  (`TauCeti.HasFiniteLaurentSupport.of_exact`), and graded dimension is additive on short exact
  sequences (`TauCeti.gradedDimension_shortExact`).
- A source shift multiplies the graded Ext dimension by `q⁻¹`
  (`TauCeti.gradedExtDimension_shiftSource`).

Prove the reindexed source-shift form `qdim Extⁿ(M, N) = ∑ⱼ qʲ dim_k Extⁿ_gr(M{j}, N)`.

*Needs:* §§5.3, 5.7; Mathlib `LaurentPolynomial` and `FiniteDimensional`; Tau Ceti
`TauCeti.IsGradedEulerAdmissible` and the declarations named above.

### 6.3 q-Euler form

The `q`-Euler form `χ_q(M, N) = ∑ₙ (−1)ⁿ qdim Extⁿ(M, N)` is `TauCeti.gradedExtEuler`. Packaged with
Mathlib's sesquilinear maps, it is `TauCeti.gradedExtEulerSesquilinear`, an
`invert`-semilinear map in the first argument to `R`-linear maps in the second, on the
`TauCeti.LaurentK0` groups of two extension-closed shift-stable object properties: so
`χ_q(rM, N) = bar(r) χ_q(M, N)` and `χ_q(M, rN) = r χ_q(M, N)`, with the generating identities
for shifts `χ_q(qⁿM, N) = q⁻ⁿ χ_q(M, N)` and `χ_q(M, qⁿN) = qⁿ χ_q(M, N)`
(`TauCeti.gradedExtEulerSesquilinear_T_smul_left`,
`TauCeti.gradedExtEulerSesquilinear_T_smul_right`) (Dancso–Licata, Definition 2.3 and the
footnote to Definition 3.1). It is additive and descends to graded `K₀` (§5.7).

**Checks.**
- For a one-dimensional graded vector space `M` in degree `0`, `χ_q(M, M) = 1`,
  `χ_q(M, M{1}) = q` and `χ_q(M{1}, M) = q⁻¹`. Reading the coefficient of `qᵏ` as
  `dim Hom(M, N{k})` would give `χ_q(M, M{1}) = q⁻¹`, contradicting linearity in the second slot.

*Needs:* §§5.7, 6.1–6.2; Mathlib `LaurentPolynomial.invert`, `LaurentPolynomial.invert_T`,
`LaurentPolynomial.involutive_invert` and the sesquilinear maps of
`Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`; Tau Ceti the declarations named above.

### 6.4 Matrices and duality

The graded Gram matrix of the `q`-Euler form in two bases is `TauCeti.gradedExtEulerMatrix`, with
the conjugate-transpose change of basis `M′ = P̄ᵀ M Q`, where `P̄` is the entrywise bar of the
change-of-basis matrix in the first argument (`TauCeti.gradedExtEulerMatrix_basis_change`)
(Dancso–Licata, Section 3.1); the graded Cartan matrix is `TauCeti.gradedCartanMatrix`, with its
change of basis (`TauCeti.gradedCartanMatrix_basis_change`). Projective, simple and dual bases are
related only under explicitly constructed graded dualities, and no Serre or DG-perfect duality is
invoked. For a finite-dimensional graded algebra with degree-zero idempotents `e_i` such that
`e_i S_j = 0` for `i ≠ j` and `e_i S_i` has graded dimension `1`, the graded analogue of absolute
simplicity, the `q`-Euler pairing of the graded projectives `A e_i` against the graded simple
modules is the identity matrix, so the graded projectives are the dual basis of the graded simple
modules (`TauCeti.gradedExtEulerMatrix_gradedSimpleClassBasis_eq_one`,
`TauCeti.gradedProjectiveExtEuler_basis_eq_dualBasis`; Dancso–Licata, Section 3.2); and, for the
Euler matrix `E` of the graded simple modules and `C̄` the entrywise bar of the graded Cartan
matrix, `C̄ᵀ E = I` and `E = (C̄ᵀ)⁻¹`
(`TauCeti.gradedCartanMatrix_map_invert_transpose_mul_gradedExtEulerMatrix_eq_one`,
`TauCeti.gradedExtEulerMatrix_eq_inv_gradedCartanMatrix_map_invert_transpose`).

*Needs:* §§4.5, 6.3; Tau Ceti `TauCeti.gradedCartanMatrix` and the declarations named above.

### 6.5 Algebraic specialization

Evaluation at a unit `u` is the algebra map `TauCeti.laurentEval u`. Base change of the graded
`K`-group along evaluation at `q = 1` and at `q = −1` is `TauCeti.LaurentSpecialization`, and of
the `q`-Euler form is `TauCeti.gradedExtEulerSpecialized`. At `q = −1` a shift changes the sign:
the specialized class of `M{n}` is `(−1)ⁿ` times that of `M`
(`TauCeti.LaurentK0.mk_ofExactK0_shiftZPow`). Either evaluation can turn a nondegenerate
Laurent-polynomial matrix into a degenerate integer matrix
(`TauCeti.exists_nondegenerate_and_not_nondegenerate_map_laurentEval`). These constructions mention
no ungraded category.

**Checks.**
- The matrix `[[1, q], [q, 1]]` has determinant `1 − q²`, nonzero in `ℤ[q, q⁻¹]` and zero at both
  `q = 1` and `q = −1`.

*Needs:* §§6.1, 6.3; Tau Ceti `TauCeti.laurentEval`, `TauCeti.LaurentSpecialization`,
`TauCeti.gradedExtEulerSpecialized`.

### 6.6 Comparison after forgetting grading

The comparison is stated only from explicit data: an ungraded exact category, a conflation-exact
functor `U` from the graded category, and a natural isomorphism `{1} ⋙ U ≅ U`. The induced `K₀`
map factors through the `q = 1` base change (`TauCeti.LaurentK0.forgetGrading`, and in the form
`TauCeti.LaurentK0.forgetGradingMap`), and the factored map is injective exactly when the kernel of
the induced map is generated by the kernel of evaluation at `q = 1`
(`TauCeti.LaurentK0.forgetGradingMap_injective_iff`). Shift compatibility by
itself is not sufficient for an isomorphism; sufficient hypotheses are that ungraded conflations
lift up to isomorphism and that objects with isomorphic images have equal classes at `q = 1`
(`TauCeti.LaurentK0.forgetGradingEquiv`), verified for finite-dimensional graded vector spaces
(`TauCeti.GradedVectorSpace.forgetGradingK0Equiv`), and, for finitely generated graded modules
whose graded simple families forget to the ungraded simple families, that the two simple bases
match (`TauCeti.gradedFiniteModulesForgetK0EquivOfSimpleFamilies`), as for path algebras
(`TauCeti.PathAlgebra.gradedFiniteModulesForgetK0Equiv`).

When `U` carries a graded resolving property of §3.6 into an ungraded resolving property of §3.2,
forgetting the grading intertwines the graded resolution theorem with the ungraded one of §3.4:
the `q = 1` base change of the graded Euler class of an object is the Euler class of its image,
so the two inverse resolution comparisons agree after forgetting the grading
(`TauCeti.GradedExactStructure.IsResolving.forgetGrading_laurentResolutionEquiv`).

To identify Euler forms, the graded/ungraded Ext comparison of §5.7,
`⊕ⱼ Extⁿ_gr(M, N{j}) ≅ Extⁿ(U M, U N)` for every surviving `n`, is required separately; comparing
the two long exact Ext sequences would further need compatibility with the connecting maps, which
the numerical identity does not use. Under these hypotheses the evaluation at `q = 1` of the
`q`-Euler characteristic of `(M, N)` is the ordinary Ext-Euler characteristic of `(U M, U N)`
(`TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler`). The module-category instance is
the path-algebra comparison of §5.8, and the vector-space instance is the minimal graded check
(`TauCeti.GradedVectorSpace.isGradedExtComparison_unit`).

*Needs:* §§2.6, 3.2, 3.4, 3.6, 5.4, 5.7–5.8, 6.1, 6.5; Tau Ceti the declarations named above.

### Examples

The minimal graded check, the fifth worked example: `[M{1}] = q[M]`, `χ_q(M{1}, M) = q⁻¹χ_q(M, M)`
and `χ_q(M, M{1}) = qχ_q(M, M)`. For the path-length-graded `kQ` with `Q = 1 ⟶ 2`, prove that the
graded resolution `0 → P₂{1} → P₁ → S₁ → 0` gives `Ext¹_gr(S₁, S₂{j}) = k` for `j = 1` and `0`
otherwise, whose sum over `j` is `Ext¹(S₁, S₂) = k`: the instance of the graded Ext comparison,
the two-loop quiver of §5.8 being the non-instance. The matrix `[[1, q], [q, 1]]` has determinant
`1 − q²`, nonzero in `ℤ[q, q⁻¹]` and zero at both `q = 1` and `q = −1`.

### Dependencies

Layers 2–5; Mathlib's `LaurentPolynomial` with `invert` and its sesquilinear maps; Tau Ceti's
`TauCeti.LaurentK0` and graded Ext-Euler declarations.

## Layer 7: left and right numerical Grothendieck groups

Dancso–Licata, Definition 3.2 and the discussion following Definition 3.1 give the left/right
warning for nonsymmetric `q`-pairings. The quotient construction is elementary group and module
theory and is stated through its universal property.

### 7.1 Radicals

For a pairing `b : L × R ⟶ ℤ`, biadditive, or more generally `σ`-sesquilinear over a commutative
ring, the left radical `rad_left(b) = {x | ∀ y, b(x, y) = 0}` and the right radical
`rad_right(b) = {y | ∀ x, b(x, y) = 0}` are `TauCeti.leftRadical b` and `TauCeti.rightRadical b`
(`TauCeti.mem_leftRadical_iff`, `TauCeti.mem_rightRadical_iff`). A biadditive pairing is read as a
`ℤ`-bilinear one. For the sesquilinear `q`-Euler form, with `σ` the bar involution, the radicals
are `ℤ[q, q⁻¹]`-submodules. For the Euler pairings they are described by
`TauCeti.mem_extEulerLeftRadical_iff` and `TauCeti.mem_gradedExtEulerLeftRadical_iff`.

**Checks.**
- On `L = R = ℤ²` the pairing `b(x, y) = x₁y₂` has left radical `{x : x₁ = 0}` and right radical
  `{y : y₂ = 0}`, two different subgroups; a definition that takes one radical for both sides, or
  the radicals of the symmetrization `x₁y₂ + x₂y₁`, which are both `0`, gets this wrong.
- On `L = R = ℤ` the zero pairing has both radicals `ℤ` and `b(x, y) = xy` has both radicals `0`;
  so does `b(x, y) = 2xy`, which is not perfect, so zero radicals do not make a pairing perfect,
  and a definition that reads nondegeneracy as perfectness is excluded.
- For the sesquilinear pairing `b(x, y) = bar(x)(1 − q)y` on `L = R = ℤ[q, q⁻¹]` both radicals are
  `0`, because `ℤ[q, q⁻¹]` is a domain, and both are `ℤ[q, q⁻¹]`-submodules although `b` is
  antilinear in `x`; after evaluation at `q = 1` the pairing is zero and both radicals are the
  whole group, so the radicals of a specialization are not the specializations of the radicals.

*Needs:* §6.3 for the sesquilinear analogues; Mathlib `Submodule`, `LinearMap.ker`; Tau Ceti the
declarations named above.

### 7.2 Numerical quotients

The left numerical group is `L/rad_left(b)` and the right numerical group `R/rad_right(b)`
(`TauCeti.LeftNumericalQuotient`, `TauCeti.RightNumericalQuotient`). The pairing descends to these
two quotients (`TauCeti.numericalPairing`) and has zero left and right radicals
(`TauCeti.numericalPairing_nondegenerate`). When one quotient is paired against an unquotiented
side, only the corresponding one-sided nondegeneracy holds
(`TauCeti.leftNumericalPairing_separatingLeft`, `TauCeti.rightNumericalPairing_separatingRight`).

*Needs:* §7.1; Mathlib quotients of modules by submodules and `LinearMap.liftQ₂`; Tau Ceti the
declarations named above.

### 7.3 Functoriality

A map on the left descends only after proving that it sends the left radical into the target
left radical, and dually on the right (`TauCeti.leftNumericalMap`, `TauCeti.rightNumericalMap`).
For `f : L → L′`, `g : R → R′` and `b′(f x, g y) = b(x, y)`, a pair of maps of both numerical
quotients requires `f(rad_left(b)) ⊆ rad_left(b′)` and `g(rad_right(b)) ⊆ rad_right(b′)`;
pairing preservation alone does not imply these inclusions. Surjectivity of `g` suffices for the
left inclusion and surjectivity of `f` for the right
(`TauCeti.leftRadical_le_comap_of_surjective_of_pairing`,
`TauCeti.rightRadical_le_comap_of_surjective_of_pairing`). Pairing-preserving equivalences induce
equivalences of the two respective quotients, with their inverse maps
(`TauCeti.leftNumericalEquiv`, `TauCeti.rightNumericalEquiv`).

*Needs:* §§7.1–7.2; Mathlib `QuotientAddGroup.lift` and `Submodule.liftQ`.

### 7.4 Euler specialization

The construction applies to the ordinary and to the `q`-Euler pairings, and the left and right
quotients stay distinct definitions: `TauCeti.ExtEulerLeftNumericalQuotient` and
`TauCeti.ExtEulerRightNumericalQuotient`, with the nondegenerate descended pairing
(`TauCeti.extEulerNumericalPairing_nondegenerate`), and their graded forms
`TauCeti.GradedExtEulerLeftNumericalQuotient` and `TauCeti.GradedExtEulerRightNumericalQuotient`
(Dancso–Licata, Definition 3.2). An identification of the two is proved only when an explicit
duality constructed in this roadmap supplies it.

*Needs:* §§5.5, 6.3, 7.2–7.3; Tau Ceti the declarations named above.

### Examples

On `L = R = ℤ` the zero pairing has both radicals equal to `ℤ` and both quotients zero, while
`b(x, y) = xy` has both radicals zero. The pair `f = id`, `g = 0` from `b = 0` to `b′(x, y) = xy`
satisfies `b′(f x, g y) = 0 = b(x, y)` and sends `rad_left(b) = ℤ` onto `ℤ`, which is not inside
`rad_left(b′) = 0`; `g` is not surjective, and surjectivity of `g` is the hypothesis §7.3 asks
for. For the quiver `1 ⟶ 2` the Euler matrix is unimodular, so both radicals vanish and both
numerical quotients are the whole Grothendieck group. Prove these three statements.

### Dependencies

Layers 5–6 for the pairings; Mathlib's submodules and quotients; Tau Ceti's radical and
numerical-quotient declarations.

## Worked examples

These computations are part of the roadmap. They fix signs, handedness, support hypotheses and
matrix orientation, and each belongs to the first layer in which it can be stated.

### Finite-dimensional vector spaces

For the essentially small category of finite-dimensional `k`-vector spaces, every short exact
sequence splits, and split `K₀` and canonical exact and abelian `K₀` are all `ℤ`
(`TauCeti.SplitK0.finrankEquiv`, `TauCeti.AbelianK0.finrankEquiv`). The class of a space maps to
its dimension, the one-dimensional space maps to `1`, and dimension satisfies the universal
property of additive invariants. The calculation is independent of the chosen skeleton of
finite-dimensional spaces (`TauCeti.SplitK0.equiv_trans_isoClassModelFinrankEquiv`).

### The quiver `1 ⟶ 2`

Use left modules and the Ringel convention

```text
⟨x, y⟩ = x₁y₁ + x₂y₂ − x₁y₂.
```

The simple modules have dimension vectors `S₁ = (1, 0)` and `S₂ = (0, 1)`. The indecomposable
projectives are `P₁ = (1, 1)` and `P₂ = (0, 1)`. With rows `(S₁, S₂)` and columns `(P₁, P₂)`, the
Cartan matrix is

```text
C = [1 0]
    [1 1].
```

Thus the Cartan map sends `[P₁]` to `[S₁] + [S₂]` and `[P₂]` to `[S₂]`. In the simple basis the
Euler matrix is

```text
E = [ 1 -1]
    [ 0  1],
```

so that `E = C⁻ᵀ` with these row and column conventions. Its symmetrization is

```text
E + Eᵀ = [ 2 -1]
         [-1  2],
```

the type `A₂` Gram matrix. These identities are verified both from the finite projective
resolutions and from the quiver Euler formula (`TauCeti.Quiver.Kronecker.cartanMatrixA2`,
`TauCeti.Quiver.Kronecker.extEulerMatrix_A2_eq`,
`TauCeti.Quiver.Kronecker.cartanMatrixA2_transpose_mul_eulerMatrixA2`,
`TauCeti.Quiver.Kronecker.eulerMatrixA2_add_transpose`). Any transpose or arrow reversal changes a
displayed off-diagonal entry and fails this test.

### An oriented `E₈` quiver

Fix the acyclic orientation of the `E₈` Dynkin graph that directs every edge from the smaller to
the larger node, in Bourbaki's numbering shifted down by one: the arrows are `0 ⟶ 2`, `1 ⟶ 3`,
`2 ⟶ 3`, `3 ⟶ 4`, `4 ⟶ 5`, `5 ⟶ 6` and `6 ⟶ 7` (the quiver `TauCeti.Quiver.E8`). Its
nonsymmetric Euler matrix is `I − A`, where `A_{ij}` counts arrows `i ⟶ j`, and its
symmetrization is the positive-definite `E₈` Gram matrix `2I − (A + Aᵀ)`
(`TauCeti.Quiver.E8.extEulerMatrix_add_transpose`,
`TauCeti.Quiver.E8.posDef_map_intCast_extEulerMatrix_add_transpose`). The example asserts no `E₈`
categorification: it is a compatibility check between the categorical pairing, Tau Ceti's quiver
formula and the root-system Gram convention.

### The dual numbers

Let `A = k[ε]/(ε²)` and `S = A/(ε)`. Its Cartan matrix is the one-by-one matrix `[2]`, because the
regular indecomposable projective has two copies of `S` as composition factors. The periodic
minimal projective resolution

```text
⋯ ⟶ A --ε--> A --ε--> A ⟶ S ⟶ 0
```

gives `Extⁿ_A(S, S) ≅ k` for every `n ≥ 0`. Each Ext group is finite-dimensional, but eventual
vanishing fails, so `χ(S, S)` is not defined: the Euler-admissibility predicate rejects this pair
(`TauCeti.not_isEulerAdmissible_dualNumberResidue`), and no `finsum` value is exposed as its Euler
pairing, since the Ext-Euler value takes the admissibility witness as an argument. This is the
test separating Hom-finiteness from convergence.

### A minimal graded check

Take a graded category with one simple object `M` and its internal shifts, with a one-dimensional
degree-zero endomorphism space and no higher Ext: one-dimensional graded vector spaces. Then
`[M{1}] = q[M]`, `χ_q(M{1}, M) = q⁻¹χ_q(M, M)` and `χ_q(M, M{1}) = qχ_q(M, M)`. At `q = 1` both
shifts have the same algebraically specialized class; at `q = −1` a single shift changes sign. The
example comes with its explicit ungraded category and forgetful functor, the comparison
hypotheses of §6.6 verified directly, and only then the identification of the `q = 1` class and
pairing with the ordinary ones (`TauCeti.GradedVectorSpace.isGradedExtComparison_unit`,
`TauCeti.GradedVectorSpace.forgetGradingK0Equiv`). The two-by-two Laurent matrix
`[[1, q], [q, 1]]`, of determinant `1 − q²`, is nonzero before evaluation and zero at both values,
so specialization need not preserve nondegeneracy.

## Downstream consumers

DGAInfinity, StablePeriodicCurved, HopfologicalAlgebra, ZigzagPreprojective and McKaySkewGroup
are separate roadmaps that use this one; no declaration from them is a prerequisite here.

- [StablePeriodicCurved](../StablePeriodicCurved/README.md) builds Frobenius, stable, periodic and
  curved categories on the exact structures of Layer 0. Its Lean file imports this roadmap's Lean
  file and spells conflations through `ExactStructure.Conflation`, which is why that predicate on
  composable pairs is kept.
- [ZigzagPreprojective](../ZigzagPreprojective/README.md) uses graded `K₀`, the shift action, the
  `q`-Euler forms and the linear resolutions of §3.7, and compares its graded Cartan matrix
  `(1 + q²)I + qA` against the graded quiver comparison of §5.8.
- [DGAInfinity](../DGAInfinity/README.md) uses exact and triangulated `K₀`, finite-support Euler
  sums, graded Euler forms and the numerical quotients for perfect DG and `A∞` categories, and
  its relative quadratic Koszul duality (Layer 11) uses the notion of linear resolution fixed in
  §3.7.
- [McKaySkewGroup](../McKaySkewGroup/README.md) uses the linear graded projective resolutions of
  Layer 3.
- [HopfologicalAlgebra](../HopfologicalAlgebra/README.md) uses the graded dimensions of Layer 6.
- [AlgebraicKTheory](../AlgebraicKTheory/README.md), [KTheoryLowDegrees](../KTheoryLowDegrees/README.md)
  and [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md) use the split and exact `K₀`,
  the additive functor maps and the resolution comparisons of Layers 2–3.

## Scope and ownership

**This roadmap owns** Quillen exact structures and conflation-exact functors; the presentation of
Grothendieck groups of essentially small categories; the split, exact, abelian and triangulated
Grothendieck groups with their universal properties, their bounded-complex comparisons and their
graded forms; finite resolutions, resolving subcategories and the resolution theorem; linear and
minimal graded resolutions with the diagonal criterion and the Betti Poincaré series; the Cartan
map of a finite-dimensional algebra and its graded form, with unimodularity and the Betti form of
the graded Cartan identity; finite-support Euler characteristics, the Ext-Euler pairing and the
graded/ungraded Ext comparison; the Laurent coefficients, the `q`-Euler form and its
specializations; and the left and right numerical quotients. Everything is built in both the
ungraded and the internally graded setting (Convention 11). The roadmap ends with exact, abelian
and triangulated categories, finite resolutions, Ext, and algebraic specializations of
Laurent-polynomial-valued forms.

**Already in the library.** The pinned Tau Ceti states and proves most of this plan, in the
declarations used by name in the layers above and listed under the supplier contracts; the layers
do not plan them again. What the pins do not prove is stated in the layers as targets of this
roadmap:

- §0.2, sums of finite families of conflations and the fact that isomorphisms are inflations and
  deflations; §0.3, admissible morphisms and the remaining duality statements; §0.4, exact
  equivalences; the examples of Layer 0 (the dual-number sequence and the identity functor from
  the split to the canonical structure);
- §1.4, products and biadditive lifts for the general presented group; the free generators by
  dimension in the examples of Layer 1;
- §2.2, the identification of the comparison from split `K₀` with the map induced by the identity
  functor; in the examples of Layer 2, the comparison of split and abelian `K₀` of vector spaces,
  and split `K₀` of the dual numbers with the non-injective comparison;
- §3.1, the complex presentation of finite resolutions for a general exact structure; §3.7, the
  diagonal criterion tested against `A₀{j}` alone, and the Betti Poincaré series with its
  independence, diagonal-support and shift statements; the class of `S₁` in the examples of
  Layer 3;
- §4.1, algebra-equivalence invariance; §4.3, the transpose and Hom statements; §4.5,
  `gradedCartanMap_bijective` for arbitrary grading data, the graded-multiplicity entries of the
  graded Cartan matrix, and the Betti identity `C(q) · B(q, −1) = I` in all three forms; the
  examples of Layer 4 (the determinant for `1 ⟶ 2`, invertibility of `[2]` over `ℚ`, and
  `ℝ ⊂ ℂ`);
- §5.1, the finite-exact-sequence formula in an exact category; §5.6, the nonsplit check
  `ℝ ⊂ ℂ`; §5.8, the two-loop counterexample;
- §6.2, the reindexed source-shift form of graded Ext dimension; the graded Ext computation for
  `1 ⟶ 2` in the examples of Layer 6;
- the examples of Layer 7.

**Left to other roadmaps.**

- [QuiverRepresentations](../RepresentationTheory/QuiverRepresentations/README.md) owns
  finite-dimensional algebras, projective covers, simple modules, Krull–Schmidt decompositions,
  composition-factor Cartan matrices, path algebras and the Ringel form. This roadmap uses those
  objects and proves that they agree with the general categorical `K₀` and Ext-Euler
  constructions; it does not reconstruct the path-algebra or finite-dimensional-algebra layers.
- The ring-theoretic description of finitely generated projective modules over an arbitrary
  ring: balanced extension of scalars over a noncommutative base belongs to
  [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) §7.8; idempotent
  matrices with their rectangular equivalence and the idempotent monoid `V(R)` with its group
  completion to [AlgebraicKTheory](../AlgebraicKTheory/README.md), Layer 0 (§§0.1–0.4); and their
  row-coordinate and left-module transports to [KTheoryLowDegrees](../KTheoryLowDegrees/README.md)
  §1.1. This roadmap uses only the category `TauCeti.finiteProjectiveModules R` with its split
  exact structure.

**Not constructed or used here:** DG or `A∞` algebras, categories or modules; perfect derived
categories, smoothness, properness, compact generation, Serre functors or Calabi–Yau structures;
Verdier quotients, derived localization or singularity categories; Frobenius, stable, periodic or
curved categories; hopfological algebra or a categorical interpretation of specialization at a
root of unity; zigzag or preprojective algebras, or the McKay correspondence, as subjects; a
categorification of an ADE or rank-24 lattice; the Cartan determinant conjecture; the derived
category of a general Quillen exact category. Bounded homotopy and derived categories appear only
in the standard `K₀` comparisons of §2.5, which follow from the exact and triangulated
infrastructure built here; no perfect-category or localization machinery is introduced to obtain
them.

## Exact supplier contracts

### From Mathlib

- `Preadditive`, additive functors, biproducts and zero objects; abelian and linear categories;
  `ShortComplex`, kernels and cokernels (`KernelFork.ofι`, `CokernelCofork.ofπ`, `IsLimit`,
  `IsColimit`), `ShortComplex.Exact`, `ShortComplex.ShortExact`, `ShortComplex.Splitting`,
  homology and long exact sequences; `Limits.IsPushout`, `Limits.IsPullback`,
  `MorphismProperty.HasPushouts`, `MorphismProperty.IsStableUnderCobaseChange` and
  `CategoryTheory.MorphismProperty.of_isIso` (a morphism property containing identities and
  respecting isomorphisms contains every isomorphism); opposite categories and `opOpEquivalence`;
  `CategoryTheory.exactFunctor` and `Equivalence`.
- Triangulated and pretriangulated categories, `Triangle`, `distTriang`, shift functors,
  triangulated functors, `HomologicalComplex`, `ChainComplex`, `HomotopyCategory`, `Homotopy`,
  and `DerivedCategory`.
- `CategoryTheory.Abelian.Ext X Y n`, `HasExt`, the linear Ext API and the long exact Ext
  sequences of `Mathlib/Algebra/Homology/DerivedCategory/Ext/ExactSequences.lean`; `Projective`;
  `ObjectProperty.hasFiniteResolution`.
- `CategoryTheory.EssentiallySmall`, `SmallModel`, `Skeleton`, `Shrink`, and locally small tools.
- `FreeAbelianGroup`, quotient additive groups and `QuotientAddGroup.lift`, `AddSubgroup.closure`,
  and the commutative-monoid group completion `Algebra.GrothendieckAddGroup` of
  `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`, the additive form of
  `Algebra.GrothendieckGroup`. It is not categorical `K₀`, but its universal property supports the
  split construction.
- `ComplexShape.EulerCharSigns`, `GradedObject.eulerChar`, `HomologicalComplex.eulerChar` and
  `HomologicalComplex.homologyEulerChar` of `Mathlib/Algebra/Homology/EulerCharacteristic.lean`.
  They use `finsum`, so the finite-support Euler characteristics of Layer 5 add the genuine
  boundedness and finite-dimensionality hypotheses; Mathlib's value for infinite support is never
  used.
- `IsMoritaEquivalent.of_algEquiv` (isomorphic algebras are Morita equivalent), `Matrix.det`,
  `IsUnit`, `FiniteDimensional`.
- The semilinear and sesquilinear maps of `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`,
  `Submodule`, `LinearMap.ker`, `LinearMap.liftQ₂` and `Submodule.liftQ`; `LaurentPolynomial`,
  with `LaurentPolynomial.invert`, `LaurentPolynomial.invert_T` and
  `LaurentPolynomial.involutive_invert` (`Mathlib/Algebra/Polynomial/Laurent.lean`); and
  `PowerSeries`.

### From Tau Ceti

Paths are under `TauCeti/`. Each declaration is assumed as stated at the pin, with the
hypotheses recorded in the layers above; none of them removes the finiteness and comparison
hypotheses of Conventions 9 and 12.

- **Exact structures** (`CategoryTheory/Exact/`, files `KernelCokernelPair`, `ExactStructure`,
  `Conflation`, `Opposite`, `Split`, `Abelian`, `Biproduct`, `Bicartesian`, `BaseChange`,
  `ExtensionClosed`, `Functor`, `Equivalence`, `AdmissibleBaseChange`, `Graded/Basic`):
  `TauCeti.IsKernelCokernelPair` (both universal properties, as in §0.1) with
  `TauCeti.IsKernelCokernelPair.of_iso`, `TauCeti.isKernelCokernelPair_iff_of_iso`,
  `TauCeti.isKernelCokernelPair_op_iff`, `TauCeti.IsKernelCokernelPair.biprod`,
  `TauCeti.isKernelCokernelPair_iff_shortExact`; `TauCeti.ConflationClass`,
  `TauCeti.ConflationClass.inflations`, `TauCeti.ConflationClass.deflations`,
  `TauCeti.ConflationClass.ConflationCategory`; `TauCeti.ExactStructure` (E0–E2 and duals as
  fields, E2 by Mathlib's `MorphismProperty.HasPushouts` and
  `MorphismProperty.IsStableUnderCobaseChange`), `TauCeti.ExactStructure.ext`,
  `TauCeti.ExactStructure.conflation_of_splitting`, `TauCeti.ExactStructure.conflation_biprod`,
  `TauCeti.ExactStructure.tfae_isPushout_of_isInflation`,
  `TauCeti.ExactStructure.tfae_isPullback_of_isDeflation`,
  `TauCeti.ExactStructure.conflation_cobaseChange`, `TauCeti.ExactStructure.conflation_baseChange`;
  `TauCeti.ExactStructure.op`, `TauCeti.ExactStructure.op_conflation`,
  `TauCeti.ExactStructure.op_inflations`, `TauCeti.ExactStructure.IsConflationExact.op`;
  `TauCeti.ExactStructure.IsConflationExact`, `TauCeti.ExactStructure.ReflectsConflations`,
  `TauCeti.ExactStructure.IsConflationExact.map_isPushout`,
  `TauCeti.ExactStructure.IsConflationExact.map_isPullback`, `TauCeti.ExactStructure.transport`,
  `TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations` (for an equivalence
  with additive functor, the inverse is conflation-exact iff the functor reflects conflations),
  `TauCeti.ExactStructure.isConflationExact_abelian_iff` (for additive functors between abelian
  categories, conflation-exact iff preserving finite limits and finite colimits);
  `TauCeti.ExactStructure.split`, `TauCeti.ExactStructure.abelian`,
  `TauCeti.ExactStructure.IsExtensionClosed`, `TauCeti.ExactStructure.fullSubcategory` (requiring
  `P` to contain zero and be closed under binary biproducts),
  `TauCeti.ExactStructure.isConflationExact_ι`, `TauCeti.ExactStructure.reflectsConflations_ι`;
  `TauCeti.GradedExactStructure` with `TauCeti.GradedExactStructure.shift_exact` and
  `TauCeti.GradedExactStructure.shift_inverse_exact`, `TauCeti.GradedConflationExact`,
  `TauCeti.GradedExactEquiv`.
- **Presentation** (`CategoryTheory/GrothendieckGroup/Presentation.lean`, `IsoClassModel.lean`):
  `TauCeti.ObjectCode` (`Shrink (Skeleton C)` for `C` essentially small), `TauCeti.objectCode`,
  `TauCeti.freeOf`, `TauCeti.objectCode_eq_objectCode_iff`, `TauCeti.freeOf_eq_freeOf_iff`,
  `TauCeti.freeLift`, `TauCeti.freeLift_unique`, `TauCeti.PresentedK0` (the quotient of the free
  group by the subgroup generated by the relations), `TauCeti.PresentedK0.AdditiveInvariant`,
  `TauCeti.PresentedK0.liftEquiv`, `TauCeti.PresentedK0.hom_ext`,
  `TauCeti.PresentedK0.induction_on`, `TauCeti.PresentedK0.mapEquiv`; `TauCeti.IsoClassModel`,
  `TauCeti.IsoClassModel.K0.equiv` with `TauCeti.IsoClassModel.K0.equiv_of`,
  `TauCeti.IsoClassModel.K0.equiv_unique`, `TauCeti.IsoClassModel.K0.equiv_refl`,
  `TauCeti.IsoClassModel.K0.equiv_symm`, `TauCeti.IsoClassModel.K0.equiv_trans`,
  `TauCeti.IsoClassModel.K0.equiv_map`.
- **Grothendieck groups** (`CategoryTheory/GrothendieckGroup/`, files `Split`, `Exact`,
  `Abelian`, `Triangulated`, `Product`, `BoundedHomotopy/Basic`, `Derived/Basic`,
  `EulerCharacteristic`, `Graded`, `FiniteDimensionalVectorSpace`): `TauCeti.SplitK0` with
  `TauCeti.SplitK0.of`, `TauCeti.SplitK0.of_biprod`, `TauCeti.SplitK0.of_biproduct`,
  `TauCeti.SplitK0.induction_on`, `TauCeti.SplitK0.liftEquiv`, `TauCeti.SplitK0.map`,
  `TauCeti.SplitK0.map_id`, `TauCeti.SplitK0.map_comp`, `TauCeti.SplitK0.map_congr`,
  `TauCeti.SplitK0.mapEquiv`, `TauCeti.SplitK0.grothendieckAddGroupEquiv`,
  `TauCeti.SplitK0.prodEquiv`, `TauCeti.SplitK0.BiadditiveInvariant.bilift`,
  `TauCeti.SplitK0.map₂`; `TauCeti.ExactK0` with `TauCeti.ExactK0.of`,
  `TauCeti.ExactK0.of_conflation`, `TauCeti.ExactK0.of_biprod`, `TauCeti.ExactK0.of_zero`,
  `TauCeti.ExactK0.liftEquiv`, `TauCeti.ExactK0.map` (for additive conflation-exact functors),
  `TauCeti.ExactK0.mapEquiv`, `TauCeti.ExactK0.fromSplit`, `TauCeti.ExactK0.fromSplit_unique`,
  `TauCeti.ExactK0.fromSplitEquiv` (when every conflation splits),
  `TauCeti.ExactK0.map_comp_fromSplit`, `TauCeti.ExactK0.ofLE`, `TauCeti.ExactK0.prodEquiv`,
  `TauCeti.ExactK0.BiadditiveInvariant.bilift`, `TauCeti.ExactK0.map₂`; `TauCeti.AbelianK0`
  (defined as the exact `K₀` of the canonical structure) with `TauCeti.AbelianK0.of_shortExact`,
  `TauCeti.AbelianK0.liftEquiv`, `TauCeti.AbelianK0.map`, `TauCeti.AbelianK0.mapEquiv`;
  `TauCeti.TriangulatedK0` with `TauCeti.TriangulatedK0.of_distTriang`,
  `TauCeti.TriangulatedK0.liftEquiv`, `TauCeti.TriangulatedK0.map`,
  `TauCeti.TriangulatedK0.map_congr`, `TauCeti.TriangulatedK0.mapEquiv`,
  `TauCeti.TriangulatedK0.prodEquiv`, `TauCeti.TriangulatedK0.map₂`,
  `TauCeti.TriangulatedK0.of_biprod`, `TauCeti.TriangulatedK0.fromSplit`,
  `TauCeti.TriangulatedK0.of_zero`, `TauCeti.TriangulatedK0.of_shift_one`,
  `TauCeti.TriangulatedK0.of_shift` (`[X⟦n⟧] = (−1)ⁿ[X]`); `TauCeti.SplitK0.boundedHomotopyEquiv`
  with `TauCeti.SplitK0.boundedHomotopyEquiv_symm_of_quotient_obj`,
  `TauCeti.TriangulatedK0.of_eq_sum_homology`, `TauCeti.AbelianK0.boundedDerivedK0Equiv` (assuming
  Mathlib's derived category and an essentially small bounded derived category),
  `TauCeti.ExactK0.sum_negOnePow_of_X_eq_sum_negOnePow_of_homology` (boundaries and homology in an
  extension-closed `P` containing zero and binary biproducts), `TauCeti.AbelianK0.eulerChar`,
  `TauCeti.AbelianK0.homologyEulerChar`, `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`;
  the shift actions `TauCeti.SplitK0.shiftZPow`, `TauCeti.GradedExactStructure.shiftEquiv`,
  `TauCeti.GradedExactStructure.shiftZPow`, `TauCeti.AbelianK0.shiftZPow`,
  `TauCeti.TriangulatedK0.shiftZPow` and their universal properties
  `TauCeti.SplitK0.ShiftInvariant.liftEquiv`,
  `TauCeti.GradedExactStructure.ShiftInvariant.liftEquiv`,
  `TauCeti.AbelianK0.ShiftInvariant.liftEquiv`, `TauCeti.TriangulatedK0.ShiftInvariant.liftEquiv`,
  and `TauCeti.GradedExactStructure.map_shiftEquiv_of_commShift`; for vector spaces over a division
  ring, `TauCeti.SplitK0.finrankEquiv`, `TauCeti.AbelianK0.finrankEquiv`,
  `TauCeti.SplitK0.isoClassModelFinrankEquiv`,
  `TauCeti.SplitK0.equiv_trans_isoClassModelFinrankEquiv`.
- **Resolutions** (`CategoryTheory/Exact/Resolution/`, `CategoryTheory/Exact/Resolving.lean`,
  `CategoryTheory/Exact/Graded/`, `CategoryTheory/GrothendieckGroup/Resolving.lean`,
  `CategoryTheory/GrothendieckGroup/Laurent/Resolving/`):
  `TauCeti.ExactStructure.FiniteResolution` (inductive, as in §3.1) with
  `TauCeti.ExactStructure.FiniteResolution.toChainComplex`,
  `TauCeti.ExactStructure.FiniteResolution.ofChainComplex` (canonical abelian structure),
  `TauCeti.ExactStructure.FiniteResolution.length`,
  `TauCeti.ExactStructure.FiniteResolution.truncate`,
  `TauCeti.ExactStructure.FiniteResolution.ofIso`,
  `TauCeti.ExactStructure.FiniteResolution.zeroPad`,
  `TauCeti.ExactStructure.FiniteResolution.biprod`,
  `TauCeti.ExactStructure.FiniteResolution.map` (along an additive conflation-exact functor
  carrying `P` into `P′`); `TauCeti.ExactStructure.admitsFiniteResolution`,
  `TauCeti.ExactStructure.abelian_admitsFiniteResolution`;
  `TauCeti.ExactStructure.IsResolving` (zero, binary biproducts, extension closure, kernels of
  conflations with middle and last terms in `P`, finite `P`-resolutions of every object),
  `TauCeti.ExactStructure.resolvingSubcategory`, `TauCeti.ExactStructure.eulerClassOf`,
  `TauCeti.ExactStructure.IsResolving.eulerClassOf_eq`,
  `TauCeti.ExactStructure.IsResolving.eulerClassOf_eq_add_of_conflation`,
  `TauCeti.ExactStructure.IsResolving.eulerHom`,
  `TauCeti.ExactStructure.IsResolving.resolutionEquiv` (for `C` essentially small),
  `TauCeti.ExactStructure.IsResolving.resolutionEquiv_symm_of`,
  `TauCeti.ExactStructure.IsResolving.map_comp_resolutionEquiv`,
  `TauCeti.ExactStructure.IsResolving.mapEquiv_comp_resolutionEquiv`;
  `TauCeti.ExactStructure.FiniteResolution.lift` (for `P` contained in the projectives of `E`),
  `TauCeti.ExactStructure.FiniteResolution.liftHomotopy`,
  `TauCeti.ExactStructure.FiniteResolution.horseshoe`;
  `TauCeti.GradedExactStructure.admitsFiniteResolution_inverseImage_shift`,
  `TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv` (for shift-stable `P`),
  `TauCeti.ExactStructure.FiniteResolution.liftShiftHomotopy`,
  `TauCeti.ExactStructure.FiniteResolution.Horseshoe.shift`.
- **Graded linear resolutions** (`Algebra/Module/GradedModule/Resolution.lean`,
  `Algebra/Module/GradedModule/Nakayama.lean`, `Algebra/Category/GradedModuleCat/LinearResolution/`,
  `Algebra/Homology/EulerCharacteristic/ExtEuler/Graded/Poincare/`):
  `TauCeti.GradedProjectiveResolution`, `TauCeti.GradedProjectiveResolution.IsLinear`,
  `TauCeti.GradedProjectiveResolution.IsMinimal`,
  `TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne`,
  `TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_shiftObj_of_ne` (both for `𝒜` a
  decomposition), `TauCeti.GradedProjectiveResolution.IsLinear.isMinimal` (nonnegative grading),
  `TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext` (nonnegative
  grading, a graded algebra, termwise lower bounds),
  `TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext_simple` (a field
  and finite-dimensional terms),
  `TauCeti.InternalGrading.isGeneratedInDegree_iff_piece_le_positive_smul_top` (nonnegative
  grading, bounded-below module), `TauCeti.bigradedExtPoincarePowerSeries`.
- **Cartan maps** (`Algebra/Category/ModuleCat/CartanMap/`, `Algebra/Category/GradedModuleCat/CartanMap/`,
  `RepresentationTheory/GrothendieckGroup/`, `RepresentationTheory/Quiver/Kronecker/A2.lean`):
  `TauCeti.finiteProjectiveModules`, `TauCeti.finiteProjectiveModulesExactStructure`,
  `TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `TauCeti.finiteModulesExactStructure`,
  `TauCeti.finiteModulesExactStructure_eq_abelian` (`A` Noetherian), `TauCeti.cartanMap`,
  `TauCeti.cartanEquiv`, `TauCeti.cartanMap_bijective` (every finitely generated module with a
  finite resolution by finitely generated projectives), `TauCeti.cartanInverse_of`,
  `TauCeti.moduleEulerClassOf_eq`, `TauCeti.cartanMap_bijective_of_finite_projectiveDimension`;
  `CategoryTheory.Equivalence.finiteModulesK0Equiv`,
  `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv`,
  `CategoryTheory.Equivalence.cartanMap_bijective_iff`,
  `IsMoritaEquivalent.cartanMap_bijective_iff`; for an Artinian ring,
  `TauCeti.indecomposableProjectiveClassBasis`, `TauCeti.simpleClassBasis`,
  `TauCeti.projectiveSimplePairing`, `TauCeti.projectiveSimplePairing_of_of`,
  `TauCeti.projectiveSimplePairing_isPerfPair` (finite index), `TauCeti.cartanMatrix`,
  `TauCeti.cartanMap_of_eq_sum`, `TauCeti.cartanMatrix_det_eq_one_or_neg_one`,
  `TauCeti.isUnit_cartanMatrix`, `TauCeti.cartanMatrix_dualNumber`,
  `TauCeti.not_isUnit_cartanMatrix_dualNumber`, `TauCeti.not_surjective_cartanMap_dualNumber`,
  `TauCeti.not_admitsFiniteResolution_dualNumberResidue`,
  `TauCeti.PathAlgebra.cartanMatrix_vertexProjective_apply`; over a field,
  `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity_mul_finrank_end`,
  `TauCeti.IsProjectiveCover.finrank_linearMap_eq_finrank_end`,
  `TauCeti.IsProjectiveCover.finrank_linearMap_eq_zero`,
  `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`,
  `TauCeti.projectiveExtEuler_eq_projectiveSimplePairing_iff`; the graded Cartan map
  `TauCeti.gradedFiniteModules`, `TauCeti.gradedFiniteProjectiveModules`,
  `TauCeti.gradedCartanMap` (arbitrary grading data), `TauCeti.gradedCartanMap_bijective` and
  `TauCeti.gradedCartanEquiv` (`𝒜` a decomposition),
  `TauCeti.gradedCartanInverse_of_eq_foldAlternating`,
  `TauCeti.exists_gradedCartanMatrix_det_eq_T_or_neg_T_of_le_admitsFiniteResolution`,
  `TauCeti.gradedCartanMatrix`, `TauCeti.gradedCartanMatrix_basis_change`,
  `TauCeti.gradedFiniteModulesForgetK0_comp_gradedCartanMapSpecialized`,
  `TauCeti.toMatrix_cartanMap_eq_map_gradedCartanMatrix`,
  `TauCeti.coeff_gradedCartanMatrix_gradedIdempotentProjectiveBasis`,
  `TauCeti.gradedCartanMatrix_transpose_mul_gradedExtEulerMatrix_map_invert_eq_diagonal`,
  `TauCeti.gradedCartanMatrix_transpose_mul_diagonalExtPoincareMatrix_map_eq_diagonal`,
  `TauCeti.forall_isLinear_iff_cartan_poincare_maslovEuler`; for `1 ⟶ 2`,
  `TauCeti.Quiver.Kronecker.cartanMatrixA2`,
  `TauCeti.Quiver.Kronecker.cartanMap_vertexProjective_src`,
  `TauCeti.Quiver.Kronecker.cartanMap_vertexProjective_tgt`.
- **Euler characteristics and Ext-Euler forms** (`Algebra/BigOperators/AlternatingSum.lean`,
  `CategoryTheory/GrothendieckGroup/Exact.lean`, `Algebra/Homology/EulerCharacteristic/`):
  `TauCeti.finiteEulerSum`, `TauCeti.finiteEulerSum_eq_of_eq_zero`,
  `TauCeti.finiteEulerSum_reindex_add`, `TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum`,
  `TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum_biprod`,
  `TauCeti.ExactK0.AdditiveInvariant.finiteEulerSum_conflation`; in the root namespace,
  `CochainComplex.eulerChar_eq_homologyEulerChar` (finite modules over a Noetherian ring with
  rank-nullity, strictly bounded complex) and
  `HomologicalComplex.eulerChar_forgetFG_eq_sum_finrank`; `TauCeti.IsExtFinite`,
  `TauCeti.IsExtBounded`, `TauCeti.IsExtBoundedOn`, `TauCeti.IsEulerAdmissible`,
  `TauCeti.IsEulerAdmissibleOn`, `TauCeti.IsEulerAdmissible.of_iso`,
  `TauCeti.IsEulerAdmissible.of_shortExact₂`, `TauCeti.IsEulerAdmissible.of_shortExact₂'`,
  `TauCeti.IsEulerAdmissible.biprod`, `TauCeti.IsEulerAdmissibleOn.mono`,
  `TauCeti.IsExtFinite.finiteDimensional_hom`, `TauCeti.isExtBoundedOn_of_globalDimension_le`;
  `TauCeti.extEuler` (taking the admissibility witness), `TauCeti.extEuler_eq`,
  `TauCeti.extEuler_of_iso`, `TauCeti.extEuler_shortExact₁`, `TauCeti.extEuler_shortExact₂`,
  `TauCeti.extEulerPairing`, `TauCeti.extEulerPairing_of_of`, `TauCeti.extEulerPairing_unique`,
  `TauCeti.extEuler_map`, `TauCeti.extEulerPairing_map_map`, `TauCeti.extEuler_projective`,
  `TauCeti.IsProjectiveCover.extEuler_eq_finrank_end`, `TauCeti.IsProjectiveCover.extEuler_eq_zero`,
  `TauCeti.ExactStructure.FiniteResolution.extEuler_eq_homEuler`,
  `TauCeti.not_isEulerAdmissible_dualNumberResidue`; the matrix identities, for an Artinian
  `k`-algebra with families as in §5.6, `TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_diagonal`
  (Euler admissibility of finitely generated modules),
  `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose_mul_diagonal` (finite-dimensional, with
  finite projective resolutions), `TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_one` and
  `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose` (every `dim_k End_A(S_i) = 1`).
- **Graded Ext and comparison** (`Algebra/Homology/EulerCharacteristic/ExtEuler/Graded/`,
  `Algebra/Homology/EulerCharacteristic/GradedDimension.lean`): `TauCeti.GradedExt`,
  `TauCeti.IsGradedEulerAdmissible`, `TauCeti.gradedExtEuler`, `TauCeti.gradedExtEuler_shortExact₁`,
  `TauCeti.gradedExtEuler_shortExact₂`, `TauCeti.gradedExtEulerPairing`,
  `TauCeti.IsGradedExtComparison` (degreewise isomorphisms, no connecting-map compatibility),
  `TauCeti.IsGradedExtComparison.isEulerAdmissible`,
  `TauCeti.isGradedExtComparison_of_subsingleton_ne`,
  `TauCeti.GradedModuleCat.isGradedExtComparison_toModuleCat` (a graded algebra that is
  Noetherian, `X` finitely generated), `TauCeti.GradedModuleCat.toModuleCat`;
  `TauCeti.HasFiniteLaurentSupport`, `TauCeti.HasFiniteLaurentSupport.of_exact`,
  `TauCeti.gradedDimension`, `TauCeti.gradedDimension_shortExact`,
  `TauCeti.targetShiftGradedDimension`, `TauCeti.gradedExtDimension`,
  `TauCeti.gradedExtDimension_shiftSource`.
- **Quivers** (`RepresentationTheory/Quiver/`, `RepresentationTheory/GrothendieckGroup/Quiver/`):
  `TauCeti.eulerForm`, `TauCeti.titsPolarForm`, `TauCeti.extEuler_eq_eulerForm_dimVector`,
  `TauCeti.extEuler_indecProjModule_eq_eulerForm`,
  `TauCeti.extEulerPairing_add_flip_eq_titsPolarForm`, `TauCeti.module_finite_pathAlgebra_iff`,
  `TauCeti.PathAlgebra.gradeBy` (a graded algebra by a global instance),
  `TauCeti.PathAlgebra.integerGrade`, `TauCeti.PathAlgebra.isGradedExtComparison_forget`,
  `TauCeti.PathAlgebra.gradedExtEuler_gradedVertexSimple_gradedVertexSimple`;
  `TauCeti.Quiver.E8`, `TauCeti.Quiver.E8.extEulerMatrix_add_transpose`,
  `TauCeti.Quiver.E8.posDef_map_intCast_extEulerMatrix_add_transpose`;
  `TauCeti.Quiver.Kronecker.extEulerMatrix_A2_eq`,
  `TauCeti.Quiver.Kronecker.cartanMatrixA2_transpose_mul_eulerMatrixA2`,
  `TauCeti.Quiver.Kronecker.eulerMatrixA2_add_transpose`.
- **Laurent coefficients** (`CategoryTheory/GrothendieckGroup/Laurent/`,
  `CategoryTheory/GrothendieckGroup/ForgetGrading.lean`, `Algebra/Polynomial/Laurent/`,
  `Algebra/Category/GradedVectorSpace/`, `Algebra/Category/GradedModuleCat/CartanMap/`):
  `TauCeti.LaurentK0` (the exact `K₀` of the underlying structure, as an `ℤ[q, q⁻¹]`-module),
  `TauCeti.LaurentK0.T_smul`, `TauCeti.LaurentK0.liftEquiv`, `TauCeti.gradedExtEulerSesquilinear`
  (extension-closed shift-stable object properties),
  `TauCeti.gradedExtEulerSesquilinear_T_smul_left`, `TauCeti.gradedExtEulerSesquilinear_T_smul_right`,
  `TauCeti.gradedExtEulerMatrix`, `TauCeti.gradedExtEulerMatrix_basis_change`,
  `TauCeti.gradedExtEulerMatrix_gradedSimpleClassBasis_eq_one`,
  `TauCeti.gradedProjectiveExtEuler_basis_eq_dualBasis`,
  `TauCeti.gradedCartanMatrix_map_invert_transpose_mul_gradedExtEulerMatrix_eq_one`,
  `TauCeti.gradedExtEulerMatrix_eq_inv_gradedCartanMatrix_map_invert_transpose`;
  `TauCeti.laurentEval`, `TauCeti.LaurentSpecialization`, `TauCeti.gradedExtEulerSpecialized`,
  `TauCeti.LaurentK0.mk_ofExactK0_shiftZPow`,
  `TauCeti.exists_nondegenerate_and_not_nondegenerate_map_laurentEval`;
  `TauCeti.LaurentK0.forgetGrading`, `TauCeti.LaurentK0.forgetGradingMap`,
  `TauCeti.LaurentK0.forgetGradingMap_injective_iff`,
  `TauCeti.LaurentK0.forgetGradingEquiv`, `TauCeti.GradedVectorSpace.forgetGradingK0Equiv`,
  `TauCeti.gradedFiniteModulesForgetK0EquivOfSimpleFamilies`,
  `TauCeti.PathAlgebra.gradedFiniteModulesForgetK0Equiv`,
  `TauCeti.GradedExactStructure.IsResolving.forgetGrading_laurentResolutionEquiv`,
  `TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler`,
  `TauCeti.GradedVectorSpace.isGradedExtComparison_unit`.
- **Numerical quotients** (`LinearAlgebra/SesquilinearForm/NumericalQuotient/`,
  `Algebra/Homology/EulerCharacteristic/ExtEuler/Numerical.lean`,
  `Algebra/Homology/EulerCharacteristic/ExtEuler/Graded/Numerical.lean`): `TauCeti.leftRadical`,
  `TauCeti.rightRadical`, `TauCeti.mem_leftRadical_iff`, `TauCeti.mem_rightRadical_iff`,
  `TauCeti.LeftNumericalQuotient`, `TauCeti.RightNumericalQuotient`, `TauCeti.numericalPairing`,
  `TauCeti.numericalPairing_nondegenerate`, `TauCeti.leftNumericalPairing_separatingLeft`,
  `TauCeti.rightNumericalPairing_separatingRight`, `TauCeti.leftNumericalMap`,
  `TauCeti.rightNumericalMap`, `TauCeti.leftRadical_le_comap_of_surjective_of_pairing`,
  `TauCeti.rightRadical_le_comap_of_surjective_of_pairing`, `TauCeti.leftNumericalEquiv`,
  `TauCeti.rightNumericalEquiv`; `TauCeti.mem_extEulerLeftRadical_iff`,
  `TauCeti.mem_gradedExtEulerLeftRadical_iff`, `TauCeti.ExtEulerLeftNumericalQuotient`,
  `TauCeti.ExtEulerRightNumericalQuotient`, `TauCeti.extEulerNumericalPairing_nondegenerate`,
  `TauCeti.GradedExtEulerLeftNumericalQuotient`, `TauCeti.GradedExtEulerRightNumericalQuotient`.

### From TauCetiRoadmap.QuiverRepresentations

[QuiverRepresentations](../RepresentationTheory/QuiverRepresentations/README.md) owns
finite-dimensional algebras, projective covers, simple modules, Krull–Schmidt decompositions,
composition-factor Cartan matrices, path algebras and the Ringel form. This roadmap uses §0.1
(path algebras), §2.1 (finite-length Krull–Schmidt), §3.1 (projective covers, simple modules and
composition multiplicities), §3.3 (Cartan and Euler matrices, in the row convention transposed to
Convention 6) and §4.1 (projective resolutions, Ext and the Euler form), assumed as stated there,
and proves that they agree with the general categorical `K₀` and Ext-Euler constructions.

## References

- Charles A. Weibel, [*The K-book: An Introduction to Algebraic
  K-theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Chapter II: Section 1
  (group completion), Section 5 (symmetric-monoidal and split `K₀`), Section 6 (abelian `K₀`,
  smallness and universal properties), Section 7 (exact `K₀` and the Resolution Theorem II.7.6),
  Proposition II.7.5 (Euler characteristic in an exact subcategory), and Exercise II.9.15
  (triangulated `K₀` and bounded-complex comparisons); Chapter V, Theorem V.3.1 (the Resolution
  Theorem in an exact category).
- Theo Bühler, [“Exact Categories,”](https://arxiv.org/abs/0811.1480) *Expositiones Mathematicae* 28
  (2010), 1–69: Definition 2.1 and Remarks 2.2–2.8 (axioms and duality), Propositions 2.9 and 2.12
  (direct sums and bicartesian squares), Section 5 (exact functors), Definition 8.1 and Lemma 8.4
  (admissible morphisms and their factorization), Sections 11–12 (projectives, resolutions,
  comparison and horseshoe), and Sections 13.1–13.3 (split, abelian and quasi-abelian, and fully
  exact subcategories).
- Zsuzsanna Dancso and Anthony Licata, [“Koszul algebras and flow
  lattices,”](https://doi.org/10.1016/j.jcta.2021.105534) *Journal of Combinatorial Theory,
  Series A* 185 (2022), 105534; [arXiv version](https://arxiv.org/abs/1905.03067): Sections 1.1
  and 2.2 (projective/module Grothendieck groups and Euler pairing), Definition 2.3 and
  Proposition 2.7 (graded `K₀` and Euler form), and Sections 3.1–3.2 (`q`-lattices, bar,
  sesquilinearity, Gram matrices, and left and right duals). Their `G₀`/`K₀` letters are
  translated as in Convention 5.
- Alexander Beilinson, Victor Ginzburg, and Wolfgang Soergel, [“Koszul duality patterns in
  representation theory,”](https://doi.org/10.1090/S0894-0347-96-00192-0) *Journal of the
  American Mathematical Society* 9 (1996), 473–527: Definition 2.14.1 and Proposition 2.14.2
  (linear resolutions of modules and the Ext criterion for them), and Lemma 2.11.1 and Theorem
  2.11.1 (the Hilbert-series identity of a Koszul algebra; the proof of the theorem reads Ext off
  the generators of a minimal resolution).
- Ibrahim Assem, Daniel Simson, and Andrzej Skowroński, *Elements of the Representation Theory of
  Associative Algebras, Volume 1: Techniques of Representation Theory*, LMS Student Texts 65,
  Cambridge University Press (2006): Chapter I, Sections 4–5 (indecomposable projectives and
  projective covers), and Chapter III, Section 3, especially Definitions 3.4, 3.7, 3.11 and
  Propositions 3.8, 3.10, 3.13 (Grothendieck group, Cartan matrix, unimodularity, and the Euler
  form). This source uses algebraically closed fields and right modules at those points; the
  roadmap translates both restrictions explicitly.
- Peter Webb, *A Course in Finite Group Representation Theory*, Cambridge Studies in Advanced
  Mathematics 161, Cambridge University Press (2016), Chapter 7, Sections 7.3–7.4, especially
  Proposition 7.4.1 and Corollary 7.4.2: projective covers, composition multiplicities, and the
  formula dividing Hom dimensions by `dim_k End_A(S)` over an arbitrary field.
- Charles A. Weibel, *An Introduction to Homological Algebra*, Cambridge Studies in Advanced
  Mathematics 38, Cambridge University Press (1994): Sections 1.3 and 1.6 (long exact homology
  sequences in abelian categories), Sections 2.4–2.7 (derived functors, Ext, long exact
  sequences, and balancing), and Chapter 4 (projective and global dimension). These supply the
  exact boundedness and finite-dimensional hypotheses used in Layer 5.
