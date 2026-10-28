# Roadmap: McKay correspondence, skew-group algebras and algebraic Weyl functors

**Summary.** The finite subgroups of `SU(2)` are a meeting point of finite-group representations,
affine ADE diagrams, quadratic algebras and curved homological algebra. Starting from Mathlib's
matrix groups, representations, symmetric, exterior and tensor algebras and skew monoid algebras,
and from Tau Ceti's affine Dynkin data, representation ring, path algebras, preprojective and
zigzag algebras and idempotent corners, this roadmap builds: the classification and conjugacy of
the finite subgroups of `SU(2)` and `SL₂(ℂ)` with concrete models (Layer 0); the McKay matrix of a
faithful two-dimensional determinant-one representation and its identification with a marked
affine simply-laced Cartan matrix, with the converse (Layer 1); the integral comparison of the
representation ring with the affine root lattice and of its quotient by the regular class with the
finite root lattice (Layer 2); the skew-group algebras `Sym(V) ⋊ Γ`, `Λ(V) ⋊ Γ`, `T(V) ⋊ Γ` with
their equivariant-module description and relative quadratic Koszul duality (Layer 3); the
identification of their basic corners with preprojective and zigzag algebras of the McKay quiver
(Layer 4); the Crawley-Boevey–Holland theorem for the deformed algebras with the trace
normalization of the parameter (Layer 5); the curved complexes, duplexes, stable categories and
reflection functors of Frenkel–Khovanov–Schiffmann (FKS) and their transport to the skew-group side
(Layer 6); and the finite geometric McKay correspondence: invariant presentations, the minimal
resolution, the `Γ`-Hilbert scheme, the tautological bundles and the comparison of the exceptional
lattice with the root lattice (Layer 7). The end theorems are Klein's classification, the McKay
correspondence and its converse, the representation-ring/root-lattice comparison, the
preprojective and zigzag corner theorems, the Crawley-Boevey–Holland theorem, the FKS Weyl-group
action on the skew-group side, and the geometric McKay correspondence.

`Suggested.lean` states the headline theorems against the pinned Mathlib and Tau Ceti: Klein's
classification and conjugacy (`finite_subgroup_SL2_classification`,
`finite_subgroup_SL2_conjugate_of_mulEquiv`, `card_eq_48_conjugate`), the McKay correspondence and
its converse (`exists_isMcKayLabelling`, `exists_isMcKayLabelling_of_valid`), the representation
ring comparison (`exists_repRing_addEquiv_of_isMcKayLabelling`), the preprojective and zigzag
corners (`exists_full_corner_equiv_preprojectiveAlgebra`, `exists_full_corner_equiv_zigzag`) and
the Crawley-Boevey–Holland theorem (`exists_full_corner_equiv_deformedPreprojectiveAlgebra`). Its
module docstring names the headline theorems that are not statable at the pins (the relative Koszul
duality of Layer 3, the FKS theorems of Layer 6 and the geometric correspondence of Layer 7) and the
carrier each lacks.

## Scope and ownership

This roadmap owns: the concrete finite subgroups of `SU(2)` and `SL₂(ℂ)`, their classification and
conjugacy, and the pole-set argument for finite rotation groups; the McKay matrix of a finite group
with a faithful two-dimensional determinant-one representation, its marked affine identification
and converse; the specialization of the representation ring to McKay multiplication and its
comparison with the affine and finite root lattices; the actions of `Γ` on `Sym(V)`, `Λ(V)`,
`T(V)`, the equivariant-module description of the skew-group algebras and the instantiation of
relative quadratic duality at the base `k[Γ]`; the corner presentations by preprojective, zigzag
and skew-zigzag algebras; the deformed preprojective algebra `Π^λ(Q)`, the CBH algebra and the
trace normalization; the FKS curved categories in their left, parity-graded, algebra-valued form,
the reflection kernels on bipartite zigzag algebras and their transport to `Λ(V) ⋊ Γ`; and the
geometric McKay comparison maps of Layer 7 (invariant presentations of `ℂ²/Γ`, the transported
resolution, the `Γ`-cluster scheme on the resolution, tautological bundles, the
exceptional-lattice comparison and the fundamental cycle).

Already in the libraries at the pins, and consumed rather than rebuilt: Mathlib's skew monoid
algebra `SkewMonoidAlgebra` with its multiplication, ring and algebra structure and universal
properties; Tau Ceti's representation ring `TauCeti.repRing`, affine Dynkin data
`TauCeti.AffineDynkinType`, path, preprojective and zigzag algebras, idempotent corners and their
Morita equivalence. The exact declarations are listed under the supplier contracts.

Left to other roadmaps, by section:

- character completeness, primitive central idempotents, the sum-of-squares formula and the
  complete finite family of irreducibles: [`CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md);
- compact, unitary and `SL₂` representation infrastructure: [`CompactGroups`](../RepresentationTheory/CompactGroups/README.md)
  and [`ClassicalGroups`](../RepresentationTheory/ClassicalGroups/README.md); the double cover
  `SU(2) → SO(3)` with kernel `{±I}`: [LieGroups' `SU(2)`, `SO(3)` example](../RepresentationTheory/LieGroups/README.md);
- finite ADE Cartan, Weyl and chamber theory: [`RootSystems`](../RepresentationTheory/RootSystems/README.md);
  the integral ADE norm-shell/root-coordinate comparison: [`ReductiveGroups` 9A.1a](../ReductiveGroups/README.md);
- doubled simple graphs, ordinary zigzag algebras, affine `E₈`, graded pieces, projectives,
  Frobenius maps, additive preprojective algebras and parameterized skew-zigzag relations:
  [`ZigzagPreprojective`](../ZigzagPreprojective/README.md);
- quiver representations, bound path algebras, primitive idempotents, projectives and Morita
  theory: [`QuiverRepresentations`](../RepresentationTheory/QuiverRepresentations/README.md);
- internal gradings, DG and `A∞` modules, bar/cobar transport and homotopy transfer, and the
  generic relative quadratic theory over a separable semisimple base: [`DGAInfinity`](../DGAInfinity/README.md),
  Layer 11; linear graded projective resolutions: [`GrothendieckEulerForms`](../GrothendieckEulerForms/README.md),
  Layer 3;
- morphism ideals, their quotients, the factor-through-projectives ideal and right curved DG
  modules with their triangulated homotopy category: [`StablePeriodicCurved`](../StablePeriodicCurved/README.md);
- the ADE hypersurfaces, their explicit resolutions, the completed subregular-slice comparison,
  exceptional curves and their normal-bundle and intersection data: [`NilpotentOrbits`](../NilpotentOrbits/README.md),
  N6–N8;
- the invariant algebra of a finite group (finite generation, Reynolds operator, Molien series,
  Noether bound): [`ReflectionInvariantTheory`](../ReflectionInvariantTheory/README.md), §1;
  ideals, normal forms and elimination: [`GroebnerGeometry`](../GroebnerGeometry/README.md), G1;
- quotients, projective Hilbert and Quot representability, cycles, degrees of line bundles on
  proper curves, Chern and coherent classes: [`SchemeAndStackFoundations`](../SchemeAndStackFoundations/README.md),
  §§1.17, 4.14, 5.1–5.3, 5.7; finite locally free sheaves, tensor, Hom, determinants and pullback:
  [`AlgebraicVectorBundles`](../AlgebraicVectorBundles/README.md), L0;
- the full affine realization of a singular Cartan matrix with its central and degree directions
  and loop comparison: `KacMoody`, KM0–KM1.

Not in this roadmap: arbitrary GIT quotients, Nakajima quiver varieties, moduli of preprojective
representations beyond the `Γ`-cluster scheme of Layer 7, a derived McKay equivalence, the
geometric (variety and sheaf) realizations in FKS, homological finiteness or higher-gluing
assertions for exceptional categorifications, and any categorical quotient by `δ`. The regular
dimension vector `δ` is constructed and the ordinary affine root lattice is quotiented by `ℤδ`; no
category is quotiented by `δ`. No Fourier–Mukai equivalence is inferred from the classical
component bijection of Layer 7.

## Conventions

These choices are part of the statements, not implementation details.


- The primary field is `ℂ`.  General skew-group and relative-Koszul declarations may use a field
  `k`, a finite group `Γ`, and `[Invertible (Nat.card Γ : k)]`; irreducible indexing and primitive
  matrix idempotents additionally require a splitting field, stated as `[IsAlgClosed k]`.  A
  relative quadratic theorem uses a finite-dimensional separable semisimple base `S` and a finite
  projective `S`-bimodule `W`.  Here separability means that `S` is projective over its enveloping
  algebra `S ⊗[k] Sᵐᵖᵖ`, not field-extension separability.  Maschke semisimplicity is never
  inferred merely from finiteness.
- `SU(2)` means `Matrix.specialUnitaryGroup (Fin 2) ℂ`; `SL₂(ℂ)` means
  `Matrix.SpecialLinearGroup (Fin 2) ℂ`.  The defining representation is on `Fin 2 → ℂ` by
  left matrix multiplication.  Restriction along a subgroup inclusion is used rather than a second
  private definition of the representation.
- A left action of `Γ` on an algebra `A` gives the **left skew/smash product**
  `A ⋊ Γ = A ⊗ k[Γ]` with
  `(a # g) (b # h) = a * (g • b) # (g*h)`.  Thus `A` is written on the left and the group element
  on the right.  Left modules are equivalently `Γ`-equivariant left `A`-modules.  Every opposite or
  right-module comparison must be an explicit equivalence; the notation `A # Γ` alone is not a
  license to reverse this formula.
- Tau Ceti path multiplication is "later factor first": if `a : i ⟶ j`, then
  `e_j * a * e_i = a`, and left path-algebra modules carry maps from the `i`-piece to the `j`-piece.
  McKay arrows therefore satisfy
  `e_j B₁ e_i ≃ Hom_Γ(ρ_j, V ⊗ ρ_i)`.  All preprojective signs below are translated to
  this convention.
- `Λ(V)` means Mathlib's exterior algebra; the quadratic dual of `Sym(V)` is naturally built from
  `V∗`.  Only for the determinant-one two-dimensional representation do we use the invariant
  alternating form to identify `V ≃ V∗` equivariantly.  This self-duality is a theorem, not an
  implicit coercion.
- FKS use graded **left** modules and `d(a m) = (-1)^|a| a d(m)`.  The DGA and stable roadmaps'
  primary module convention is right-handed, so the comparison is a named equivalence through the
  Koszul-signed graded opposite, `m · op a = (-1)^(|a||m|) a m`.  Curvature is a degree-two central
  element and `d²` is its left action.  A curved bimodule has `d² = l(c') - r(c)`, supercommutes
  with the left action and commutes with the right action [FKS05, §2.4]; tensoring with it sends
  curvature `c` to `c'`.
- FKS objects come in two gradings, stated once: `ℤ` for `(A,c)`-complexes and its parity `ℤ/2`
  for duplexes, with signs `(-1)^p` read through the parity.  A duplex is one `ℤ/2`-graded module
  on which odd elements of `A` exchange the two components, not a pair of `A`-modules.  Shifting
  twists the left action by the parity involution, `a ∘ m = (-1)^|a| a m` [FKS05, §2.1].

## Exact supplier contracts

### From Mathlib

- Matrix groups: `Matrix.specialUnitaryGroup`, `Matrix.SpecialLinearGroup`,
  `Matrix.specialOrthogonalGroup`, `Quaternion`. Assumed: the unitary and special linear groups as
  submonoids and groups of matrices, with determinant and conjugate transpose.
- Representations: `Representation`, `FDRep`, `FDRep.of`, `Representation.leftRegular`,
  `FDRep.char_orthonormal`, `FDRep.char_tensor`, `Representation.asAlgebraHom`. Assumed:
  orthonormality of irreducible characters of a finite group over an algebraically closed field of
  characteristic zero, and multiplicativity of characters under tensor products.
- Algebras: `SymmetricAlgebra` (with `SymmetricAlgebra.lift`, `SymmetricAlgebra.ι`),
  `ExteriorAlgebra` (with `ExteriorAlgebra.map`), `TensorAlgebra` (with `TensorAlgebra.lift`,
  `TensorAlgebra.ι`), `MonoidAlgebra`, `Subalgebra.center`, `TwoSidedIdeal.span`,
  `IsIdempotentElem.Corner`.
- Skew monoid algebras (`Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean`,
  `Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean`): the carrier `SkewMonoidAlgebra`, its ring
  structure `SkewMonoidAlgebra.instRing`, the multiplication rule `SkewMonoidAlgebra.single_mul_single`
  (`single g a * single h b = single (g * h) (a * (g • b))`, the left skew product of the
  Conventions), the universal properties `SkewMonoidAlgebra.liftNCRingHom` and
  `SkewMonoidAlgebra.liftNCAlgHom`, and its `k`-algebra structure for an action commuting with
  scalars. These replace any construction of the skew product here.
- Cyclicity of finite subgroups of the units of a domain: `isCyclic_of_injective_ringHom`.
- Invariants and polynomial rings: `FixedPoints.subalgebra`, `FixedPoints.subring`, `MvPolynomial`.
- Lie algebras of root systems: `RootPairing.GeckConstruction.lieAlgebra`,
  `RootPairing.GeckConstruction.equivRootSystem`, `RootPairing.GeckConstruction.equivLieAlgebra`,
  with their hypotheses (a crystallographic reduced irreducible root pairing with a base, over a
  field of characteristic zero).

### From Tau Ceti

- `TauCeti.SimpleFDRepClasses` and `TauCeti.SimpleFDRepClasses.mk`, the isomorphism classes of
  simple objects of `FDRep k G` (`TauCeti/RepresentationTheory/Simple/Basic.lean`).
- `TauCeti.repRing k G`, an abbreviation of `TauCeti.SplitK0 (FDRep k G)`, with class map
  `TauCeti.SplitK0.of`, product rule `TauCeti.SplitK0.of_mul_of` and character homomorphism
  `TauCeti.repRingCharacter` (`TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`,
  `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`).
- `TauCeti.irreducibleRepresentation`, the complete family of irreducibles indexed by
  `Fin (Nat.card (ConjClasses G))` over an algebraically closed field
  (`TauCeti/RepresentationTheory/CharacterTable/Table.lean`), and
  `TauCeti.Representation.finrank_dvd_card` (`TauCeti/RepresentationTheory/CharacterTable/Degree.lean`).
- `TauCeti.stdRep` and `TauCeti.SU2.toGL` for the defining representation.
- `TauCeti.AffineDynkinType` with `Valid`, `IsGraphical`, `graph`, `cartanMatrix`, `marks`,
  `affineNode`, `finiteType`, `bourbakiNode`, `TauCeti.AffineDynkinType.cartanMatrix_mulVec_marks_eq_zero`
  and `TauCeti.AffineDynkinType.cartanMatrix_submatrix_bourbakiNode`
  (`TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean`, `Deletion.lean`). Assumed: the
  marks are positive with mark `1` at the affine node, they span the kernel of the real Cartan
  matrix of a valid type, and the principal submatrix away from the affine node, in the Bourbaki
  numbering, is the finite Cartan matrix.
- Corners and Morita theory: the corner algebra instance `IsIdempotentElem.Corner.instAlgebra`
  (`TauCeti/RingTheory/Idempotents/Corner.lean`), `IsIdempotentElem.cornerEquivalence`
  (`TauCeti/RingTheory/Morita/Corner.lean`), `TauCeti.IsBasic`
  (`TauCeti/RingTheory/Semisimple/BasicAlgebra.lean`).
- Quivers: `TauCeti.pathAlgebra`, `TauCeti.preprojectiveRelator`, `TauCeti.doubledVertexIdempotent`,
  `TauCeti.preprojectiveAlgebra` (`TauCeti/RepresentationTheory/Quiver/Preprojective/Basic.lean`);
  `TauCeti.DoubledQuiver.Orientation`, `TauCeti.DoubledQuiver.OrientedQuiver`
  (`TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean`); `TauCeti.nonisolatedZigzagQuotient`,
  the zigzag algebra of a graph without isolated vertices
  (`TauCeti/RepresentationTheory/Quiver/Zigzag/Relations.lean`), which is the zigzag algebra of
  every valid graphical affine type since those graphs are connected with at least three nodes.
  Path multiplication is later factor first.
- `TauCeti.AffineInvariantQuotient` (`TauCeti/AlgebraicGeometry/Quotient/Affine.lean`) for the
  affine quotient `ℂ²/Γ`.

### From TauCetiRoadmap.CharacterTheory, CompactGroups, ClassicalGroups, LieGroups

- CharacterTheory, Layer 3: the regrouping and Hom-dimension API for finite direct sums and the
  character-recognition theorem in characteristic zero.
- LieGroups, the `SU(2)`, `SO(3)` example: a surjective homomorphism `SU(2) → SO(3)` with kernel
  `{I, −I}`.

### From TauCetiRoadmap.RootSystems, ReductiveGroups, ZigzagPreprojective, QuiverRepresentations

- RootSystems: finite ADE classification of positive definite simply-laced generalized Cartan
  matrices, Weyl orbits, chambers and dominant cone.
- ReductiveGroups 9A.1a: the bijection between norm-two vectors of the integral ADE lattice and the
  roots.
- ZigzagPreprojective: the ordinary zigzag algebra of a graph, its grading, projectives and
  Frobenius form; orientation independence of the preprojective algebra; the parameterized
  skew-zigzag algebra with a backtrack ratio at each vertex.
- QuiverRepresentations: primitive idempotents and Morita invariance of module categories.

### From TauCetiRoadmap.DGAInfinity, GrothendieckEulerForms, StablePeriodicCurved

- DGAInfinity, Layer 11: relative tensor algebra `T_S(W)`, quadratic algebras `T_S(W)/(R)`, the
  right dual `Wᵛ = Hom_{Sᵐᵒᵖ}(W, S)` and its evaluation, `R⊥`, the quadratic dual and Koszulity, over
  a finite-dimensional separable semisimple base, for right modules; internal gradings and graded
  opposites.
- GrothendieckEulerForms, Layer 3: linear graded projective resolutions.
- StablePeriodicCurved: `MorphismIdeal` with quotients and universal lifts, the
  factor-through-projectives ideal, balanced tensor products, and the triangulated homotopy
  category of right curved DG modules.

### From TauCetiRoadmap.NilpotentOrbits, ReflectionInvariantTheory, GroebnerGeometry, SchemeAndStackFoundations, AlgebraicVectorBundles, KacMoody

- NilpotentOrbits N6–N8: for each ADE hypersurface its explicit resolution (smooth source, proper
  birational, exceptional `P¹`s with normal-bundle degree `−2`, intersection matrix the negative
  finite Cartan matrix) and the completed comparison with a subregular slice.
- ReflectionInvariantTheory §1: finite generation of invariants, the Reynolds operator, Molien's
  formula and Noether's bound, in the nonmodular case.
- GroebnerGeometry G1: ideals, standard monomials and normal forms in polynomial rings.
- SchemeAndStackFoundations §§1.17, 4.14, 5.1–5.3, 5.7: finite quotients, representability of
  projective Hilbert and Quot functors, cycles and degrees on proper curves, coherent classes.
- AlgebraicVectorBundles L0: finite locally free sheaves with rank, tensor, Hom, determinant,
  pullback and averaging images.
- KacMoody KM0–KM1: the full affine realization of a singular Cartan matrix.

## How to read the build

Layer 0 constructs the finite subgroups and classifies them; Layer 1 attaches to each the McKay
matrix and proves it is a marked affine Cartan matrix; Layer 2 passes to the representation ring
and the root lattices. Layer 3 builds the three skew-group algebras and their quadratic duality,
Layer 4 identifies their basic corners with preprojective and zigzag algebras of the McKay quiver,
and Layer 5 deforms the polynomial case to the Crawley-Boevey–Holland algebras. Layer 6 builds the
FKS curved categories over a zigzag algebra and transports them to the exterior skew-group algebra
through the corner of Layer 4. Layer 7 returns to geometry: it presents `ℂ²/Γ`, transports the ADE
resolution, identifies it with the `Γ`-cluster scheme and compares the exceptional lattice with
the root lattice of Layer 2. Layers 3–6 do not depend on Layer 7, and Layer 7 depends only on
Layers 0–2 and its geometric suppliers.

## Layer 0: finite subgroups of `SU(2)` and `SL₂(ℂ)`

### 0.1 Concrete models

Identify the unit quaternions with `SU(2)` by

```text
a + b i + c j + d k  ↦  !![a + b·I, c + d·I; -c + d·I, a - b·I].
```

Prove this is a group equivalence, prove the composite inclusion into `SL₂(ℂ)`, and build
the following concrete subgroups.  Do not replace their carriers by abstract groups of the right
order.

1. The cyclic subgroup of order `n`, `n ≥ 2`, generated by
   `diag(exp(2πI/n), exp(-2πI/n))`; prove its exact order `n` and identify it with `Multiplicative
   (ZMod n)`.
2. The binary dihedral subgroup of order `4n`, `n ≥ 2`, generated by
   `r = diag(exp(πI/n), exp(-πI/n))` and `s = !![0,1;-1,0]`.  Prove the normal forms
   `r^j` and `s*r^j`, exact order `4n`, and
   `r^(2n)=1`, `s²=r^n=-1`, `s*r*s⁻¹=r⁻¹`.
3. In unit-quaternion coordinates construct the binary tetrahedral subgroup, the 24 points
   `(±1,0,0,0)` and their coordinate permutations together with
   `(±1±i±j±k)/2`; prove closure, distinctness and order 24.
4. Construct the binary octahedral subgroup by adjoining the 24 points with exactly two nonzero
   coordinates, both `±1/√2`; prove closure and order 48.
5. With `φ=(1+√5)/2`, construct the binary icosahedral subgroup as the 120 vertices of the unit
   600-cell: the 24 tetrahedral points and the 96 points obtained by even coordinate permutations
   of `(0,±1,±φ,±φ⁻¹)/2`; prove closure and order 120.

For each subgroup expose the inclusion, faithful defining representation, determinant-one
alternating form, and an `SL₂(ℂ)` copy.  Relate the coordinate and standard presentation
generators so later computations can use either.  These are the explicit constructions in
Conway--Smith [CS03, §6.5] and Choi--Lee [CL18, §§2--4, especially §2.1 and Thms. 1--2].  These named-model constructions supply the coordinate side of the complete classification
and conjugacy target below; neither orders alone nor abstract presentation isomorphisms discharge it.

**Checks.**

- The quaternion `i` maps to `!![I, 0; 0, −I]` and `j` to `!![0, 1; −1, 0]`; their product in the
  displayed order is `!![0, I; I, 0]`, the image of `k = ij`, while the reverse product is the
  image of `−k`; so the map is a homomorphism, and a formula giving an anti-homomorphism (sending
  `ij` to the image of `ji`) is excluded.
- The binary dihedral group with `n = 2` has the eight elements `±1, ±r, ±s, ±sr` and is
  isomorphic to `QuaternionGroup 2`; with `n = 1` the generators give a cyclic group of order four,
  so the family starts at `n = 2`.
- The binary icosahedral model has `120` elements, `24` of them in the binary tetrahedral subgroup;
  a list built from all (not only even) permutations of `(0, ±1, ±φ, ±φ⁻¹)/2` would have `192 + 24`
  points and not be closed.

### 0.2 Classification and conjugacy

Up to isomorphism a finite subgroup `H` of `SL₂(ℂ)` is cyclic, or isomorphic to Mathlib's dicyclic
`QuaternionGroup n` for some `n ≥ 2` (the binary dihedral group of order `4n`), or to `SL(2, 𝔽₃)`
(binary tetrahedral), or to `SL(2, 𝔽₅)` (binary icosahedral), or has order `48` (binary
octahedral) (`finite_subgroup_SL2_classification`; Springer, *Invariant theory*, LNM 585, §4.4).
Isomorphic finite subgroups of `SL₂(ℂ)` are conjugate in `SL₂(ℂ)`
(`finite_subgroup_SL2_conjugate_of_mulEquiv`), and any two of order `48` that are neither cyclic
nor isomorphic to `QuaternionGroup 12` are conjugate (`card_eq_48_conjugate`); conjugacy in
`GL₂(ℂ)` becomes conjugacy in `SL₂(ℂ)` after scaling the conjugating matrix by a square root of
its determinant. *Needs:* 0.1, LieGroups' `SU(2)`, `SO(3)` example, CharacterTheory Layer 3
(character recognition), Mathlib `isCyclic_of_injective_ringHom`.


Classify **every** finite subgroup of the native `SU(2)` carrier up to
conjugacy inside `SU(2)`, and every finite subgroup of `SL₂(ℂ)` up to
`GL₂(ℂ)` conjugacy, by the concrete models above, together with the trivial
subgroup `cyclicSU2 1 := ⊥`. Give the conjugating element, subgroup equality,
induced group equivalence and transport of the defining representation. The
cyclic parameter is `n≥1`; binary dihedral parameters start at `n≥2`, so their
order-four degenerate presentation is treated as cyclic rather than counted
twice. Keep the coordinate predicates, displayed generators, orders and
presentation comparisons of all five families.

Consume the actual native `Matrix.specialOrthogonalGroup (Fin 3) ℝ` and
[LieGroups' `SU(2)`, `SO(3)` double-cover example](../RepresentationTheory/LieGroups/README.md),
which owns the construction of a surjective homomorphism `p : SU(2) → SO(3)` with central
kernel `{I,-I}`. Build the comparison of this map with quaternion conjugation
on the imaginary coordinates, fixing the ordered real basis and all signs.
Prove the order-two adapter `g²=I → g=I ∨ g=-I` on the actual native matrices.
No second generic rotation or quaternion-group foundation is required.

For a finite subgroup `K≤SO(3)`, construct its action on the unit sphere and
its finite **pole set**: the points fixed by some nonidentity element. Prove
that a nonidentity rotation fixes exactly its two axis poles, and that a pole
stabilizer embeds into the rotations of its oriented orthogonal plane, hence
is cyclic. Consume native `isCyclic_of_injective_ringHom` for a finite subgroup of the circle,
using its actual injective monoid homomorphism into ℂ. This layer owns the pole-stabilizer
embedding into that circle; no separate cyclicity engine is needed. Partition the pole set into actual
orbits. If their stabilizer orders are `m₁,…,m_s`, prove by double-counting
nonidentity-element/fixed-pole pairs

`Σ_j (1-1/m_j) = 2-2/|K|`.

Treat `K=1` first. For nontrivial `K`, prove `s=2` or `3`. The two-orbit case
has `m₁=m₂=|K|` and is conjugate to the cyclic axis model. In the three-orbit
case order the `m_j` and derive exactly

`(2,2,n), n≥2; (2,3,3); (2,3,4); (2,3,5)`,

with orders `2n,12,24,60`. Construct **conjugacies**, not just this numerical
list. For `(2,2,n)` use the invariant pair of poles of an order-n axis and a
perpendicular half-turn; handle `n=2` by the three orthogonal half-turn axes.
For `(2,3,3)`, the four-point pole orbit and its order-three stabilizers give
a regular tetrahedron. For `(2,3,4)`, the unique pole orbit with stabilizer order four has
six points. The antipodal map commutes with `K` and preserves stabilizer orders,
so it preserves that orbit. For a pole `p` it contains `p,-p`, and a generator
of its order-four stabilizer cycles the other four points. Their common
latitude is zero because the orbit centroid is `K`-fixed and `K` has no common
axis. Hence these four points form an equatorial square, giving the octahedral
rotation model. Prove these Gram/orthonormal-frame comparisons and equality with the full rotation
model using the actual group orders.

For `(2,3,5)`, construct the isomorphism with `A₅` and its actual real
three-dimensional rotation representation. The required finite-group and
matrix computations are part of this layer: pole stabilizers and centralizers
give conjugacy-class sizes `1,15,20,12,12`; the normal-subgroup class-size
argument proves simplicity; the five Sylow-two Klein groups give the faithful
permutation action on five letters and its identification with `A₅`. Match
the two order-five classes, allowing the explicit outer relabelling. Prove
that the rotation character is `3,-1,0,φ,1-φ`, and verify the same character
for the projected 120-coordinate binary model, including its actual group
and class identifications. Consume CharacterTheory's finite characteristic-zero
character recognition to construct the complex intertwiner. Construct a real
intertwiner using a nonzero real or imaginary part and real irreducibility,
then its orthogonal polar normalization; adjust its orientation to obtain an
`SO(3)` conjugacy. Thus the coordinate model, its rotation image and the
abstract `A₅` identification are proved to agree. None is inferred from an
E₈ graph, a dimension multiset or an unverified drawing.

Lift the resulting rotation conjugacy through `p`. If a finite `H≤SU(2)`
contains `-I`, prove `H=p⁻¹(p(H))` and identify the full preimages of the
cyclic, dihedral, tetrahedral, octahedral and icosahedral models with the
concrete coordinate subgroups. Include `p(H)=1`, whose full preimage is `C₂`.
If `-I∉H`, Cauchy's theorem and the unique-involution adapter force `|H|` odd;
its rotation image is therefore cyclic by the proved rotation classification,
so it fixes an axis. Take the full circle of rotations about that axis: its
inverse image under `p` is a maximal torus of `SU(2)`, a circle containing `H`,
and `H` is the unique finite subgroup of that circle of its order, giving the
odd-cyclic case. (The inverse image of the finite group `p(H)` itself is only
cyclic of order `2|H|`: for `H = C₃` in the diagonal torus, `p⁻¹(p(H)) ≅ C₆`.) Include the trivial
subgroup explicitly. Prove the parameter and exceptional-family uniqueness
statements, including the low-rank cyclic/dihedral overlap just excluded.

For finite `H≤SL₂(ℂ)`, construct the positive-definite averaged Hermitian
form `A=|H|⁻¹ Σ_h h* h`, verify `h*Ah=A`, and use its actual positive square
root to conjugate `H` into `SU(2)`. Give all representation/subgroup transport
maps. A polar-decomposition comparison converts a `GL₂(ℂ)` conjugacy between
two unitary models into a unitary conjugacy, then into an `SU(2)` conjugacy by
scalar determinant normalization. This proves the claimed conjugacy strength;
abstract group isomorphism alone is insufficient.

As an independent group-theoretic application, prove the binary icosahedral
model is perfect and has only the trivial one-dimensional complex simple.
Let `D=[H,H]`; its image is `[A₅,A₅]=A₅`. Lift an actual nonidentity involution
of `A₅` to `d∈D`. Its square lies in `{I,-I}` and cannot be `I`, by uniqueness
of the `SU(2)` involution and its nonidentity image. Hence `-I∈D`; containing
the kernel and surjecting onto the quotient forces `D=H`. Every one-dimensional
representation kills commutators. This uses the actual cover/model comparison
and nonabelian simplicity of `A₅`, and precedes all McKay/E₈ conclusions.


**Checks.**

- The trivial subgroup and `{±I}` are cyclic; `Q₈` is `QuaternionGroup 2`; `QuaternionGroup 1` is
  cyclic of order four, which is why the dicyclic case starts at `n = 2`.
- The order alone does not pick out the binary octahedral group: the cyclic group of order `48` and
  `QuaternionGroup 12` also embed in `SL₂(ℂ)` and are not conjugate to it, so the conjugacy
  statement for order `48` carries both exclusions.
- Orders `24` and `120` are shared with `QuaternionGroup 6`, `QuaternionGroup 30` and the cyclic
  groups, which is why the tetrahedral and icosahedral cases are stated as isomorphisms with
  `SL(2, 𝔽₃)` and `SL(2, 𝔽₅)` rather than by order.
- The pole-orbit equation `Σ_j (1 − 1/m_j) = 2 − 2/|K|` holds at the octahedral rotation group
  (`|K| = 24`, `(m_j) = (2, 3, 4)`: `1/2 + 2/3 + 3/4 = 23/12 = 2 − 2/24`) and at the dihedral
  group of order `2n` (`(2, 2, n)`: `2 − 1/n`); the triple `(2, 3, 6)` gives `2`, which equals
  `2 − 2/|K|` for no finite `K`, so it is excluded, as are four or more orbits.
- For `H = C₃` in the diagonal torus, `p⁻¹(p(H)) ≅ C₆`, not `C₃`: the full preimage is the right
  object only when `−I ∈ H`.

### Examples

The diagonal subgroup generated by `diag(ω, ω⁻¹)`, `ω = exp(2πI/3)`, is the cyclic model of order
three; it does not contain `−I`, its image in `SO(3)` is cyclic of order three, and it is the unique
subgroup of order three of the diagonal torus. `Q₈` is the binary dihedral model with `n = 2`.

### Dependencies

Mathlib matrix groups and quaternions; LieGroups' `SU(2)`, `SO(3)` example; CharacterTheory
Layer 3; Mathlib `isCyclic_of_injective_ringHom`.

## Layer 1: irreducibles, the McKay matrix and named affine ADE

### 1.1 The McKay matrix


For every finite subgroup `Γ≤SU(2)`, use the actual restricted representation
`(TauCeti.stdRep ℂ 2).comp (TauCeti.SU2.toGL.comp Γ.subtype)` and bundle it
with `FDRep.of`. Its faithfulness comes from the native injective maps;
construct its determinant-form self-duality explicitly. Use CharacterTheory's
complete finite family on `I=Fin (Nat.card (ConjClasses Γ))`, namely
`FDRep.of (TauCeti.irreducibleRepresentation ℂ i)`, with its actual finite
coordinate carrier and unique trivial-class index. Named polynomial/quaternion
models are compared with this family by explicit representation equivalences
and index bijections, rather than a second irreducible-class engine.

Pin both matrix conventions. Write

```text
M_ij = dimℂ Hom_Γ(ρ_j, V ⊗ ρ_i),    a_ji = M_ij,
δ_i = dimℂ ρ_i,                     C = 2I-M.
```

Thus `M` has source vertex first and target vertex second; the corner/path
notation `a_ji` retains target first. Prove the natural multiplicities and
actual finite direct-sum decompositions using CharacterTheory Layer 3's
regrouping and Hom-dimension API. Tensor-Hom adjunction with the constructed
self-duality gives `M_ij=M_ji`; consequently the two transposed matrices agree.
Prove `Mδ=2δ`, all `δ_i>0`, and `δ_trivial=1`. Give invariance under relabelling
and under conjugation of the actual subgroup/defining representation.

Prove the Burnside–Brauer faithful tensor-generation theorem for a finite group
over `ℂ` (Isaacs, *Character Theory of Finite Groups*, Theorem 4.3): if `V` is
faithful and its character takes exactly `r` distinct values, then every simple
occurs in `V^⊗n` for some `n<r≤#ConjClasses Γ`.  The route is the Vandermonde
argument on the character values, using the native character orthogonality of
`FDRep`.  *Needs:* Mathlib `FDRep.char_orthonormal`, `FDRep.char_tensor`. Prove by tensor associativity,
finite regrouping and multiplicity additivity that `(M^n)_ij` is the actual
multiplicity of `ρ_j` in `V^⊗n ⊗ ρ_i`, including `n=0`. Positive natural matrix
products supply actual walks from the trivial vertex. Removing loop steps
shows the off-diagonal support is connected when there is more than one
vertex. This consumes the generic finite-complex theorem; it does not reprove
another character-interpolation or irreducible-indexing engine here.

For any finite symmetric nonnegative `M` and positive real `δ` with `Mδ=2δ`,
prove directly

`xᵀ(2I-M)x = Σ_(i<j) M_ij δ_i δ_j (x_i/δ_i-x_j/δ_j)²`.

Retain diagonal entries in the coefficient calculation. Connected off-diagonal
support makes the kernel exactly `ℝδ`; the singleton case follows directly
from `Mδ=2δ`. This weighted identity needs no Perron-Frobenius engine.
It does **not** prove that the diagonal entries of `M` vanish.

Separate the actual `SU(2)` branches. If `V` is reducible, construct the unitary
basis that puts `Γ` in a circle, hence makes it cyclic. For order `n`, give
the exact multiplicity count of the two congruences `j=i+1` and `j=i-1` in
`ZMod n`: `n=1` has `M=[2], C=[0]`; `n=2` has off-diagonal multiplicity two
and the native affine `A₁` matrix; `n≥3` has the simple n-cycle. The singleton
has no invented native affine `A₀` tag. If `V` is irreducible, consume native
`Representation.finrank_dvd_card` to obtain even group order. Cauchy and the
unique-involution lemma give `-I∈Γ`. Its scalar ± action on each simple,
reversed by tensoring with `V`, gives a bipartition and `M_ii=0`. Keep the
ordinary determinant-minus-one dihedral negative example: self-duality and
an affine graph alone do not imply the determinant-one input needed by the
skew/corner/CBH targets.

For the loop-free connected case with at least two vertices, delete the
trivial vertex. Extension by zero in the weighted identity proves the
principal matrix `C′` positive definite. Its two-by-two principal minors force
undeleted off-diagonal multiplicities to be zero or one, so it is a finite
simply-laced GCM. Use native finite-type classification componentwise. With
`x=δ_rest` and `m_i=M_i,trivial`, prove `C′x=m` and `mᵀx=2`. The vector
`θ=Σ_i x_i α_i` in the integral finite ADE lattice has norm two. Positivity
and evenness show that it has only one connected component: every nonzero
component would contribute at least two to that norm. Consume RG9A.1a's
explicit norm-shell/root correspondence, native Weyl orbit/chamber and
dominant-cone APIs, and the adjacent-simple-root orbit adapter to identify
this dominant root as the highest root. Construct the marked extension
`α₀=-θ` with Gram matrix `C`, then its exact index equivalence to the native
`TauCeti.AffineDynkinType` matrix, affine node and marks. Do not apply an
unprovided arbitrary-matrix affine converse or treat a dependent `-θ` as a
full affine realization `δ_aff-θ` without its separate realization map.

For each named subgroup retain the complete concrete tensor decompositions
and label comparisons, and prove the following identifications using the
native affine carrier with its actual `Valid` and `IsGraphical` hypotheses.
The generic theorem and the named computations are separate obligations:
the former is valid for every finite subgroup, while the latter supplies
explicit coordinate and irreducible labels. No finite-subgroup exhaustiveness
proof is a premise of the generic tensor/Laplacian argument.

| subgroup | order | affine type | multiset of entries of `δ` |
|---|---:|---|---|
| cyclic | `n` | `Ã_(n-1)` | `n` copies of `1` |
| binary dihedral | `4n` | `D̃_(n+2)` | four `1`s and `n-1` copies of `2` |
| binary tetrahedral | 24 | `Ẽ₆` | `1,1,1,2,2,2,3` |
| binary octahedral | 48 | `Ẽ₇` | `1,1,2,2,2,3,3,4` |
| binary icosahedral | 120 | `Ẽ₈` | `1,2,2,3,3,4,4,5,6` |

Handle cyclic `n=2` as the multiplicity-two affine `Ã₁` matrix rather than forcing it into a
simple graph.  It participates in the matrix/root and actual skew/relative-quadratic layers and in Layer 7’s
finite geometric `A₁` comparison. All simple-graph zigzag corners below require cyclic `n ≥ 3`,
and the FKS graph functors further
require a bipartite graph, so even cyclic `n ≥ 4`.  Under ZigzagPreprojective's
`affineE8Graph` numbering (central vertex `0`, arms of edge lengths
`1,2,5`), the required vector is `(6,3,4,2,5,4,3,2,1)` and vertex `8` is the trivial/affine node.
Check `Cδ=0` and `∑δ_i²=|Γ|` in every family (see the Checks).  McKay [McK80, Props. 1--2] defines the graph; Steinberg [Ste85, §1(1)--(5),(8)] proves the
character-eigenvector, positive-semidefinite, null-vector, and named affine-Cartan assertions.


**Checks.**

- For `Ẽ₈` with `δ = (6,3,4,2,5,4,3,2,1)` in the Tau Ceti numbering (edges `0–1, 0–2, 2–3, 0–4,
  4–5, 5–6, 6–7, 7–8`), `(Cδ)_0 = 12 − (3 + 4 + 5) = 0`, `(Cδ)_8 = 2 − 2 = 0`, and
  `Σ δ_i² = 36 + 9 + 16 + 4 + 25 + 16 + 9 + 4 + 1 = 120 = |Γ|`; interchanging the entries at nodes
  `1` and `3` gives `(Cδ)_0 = 12 − (2 + 4 + 5) = 1 ≠ 0`, so the numbering is pinned.
- For the binary dihedral group of order `4n`, four `1`s and `n − 1` `2`s give
  `Σ δ_i² = 4 + 4(n − 1) = 4n`; at `n = 2` this is `8 = |Q₈|`, and the centre `c` of `D̃₄`
  satisfies `(Cδ)_c = 4 − 4 = 0`.
- For the cyclic group of order `n = 1` the matrix is `M = [2]`, `C = [0]`, and for `n = 2` the
  off-diagonal multiplicity is `2`: in neither case is `M` the adjacency matrix of a simple graph,
  so no `Ã₀` and no simple-graph `Ã₁` is used.

### 1.2 The McKay labelling

The headline form of the correspondence is stated on the native carriers. Define
`IsMcKayLabelling V t e` (`IsMcKayLabelling`), for `V` in `FDRep ℂ Γ`, an affine type `t` and a bijection `e` from
`TauCeti.SimpleFDRepClasses ℂ Γ` to the nodes of `t`: the multiplicity `dim Hom(X, V ⊗ Y)` equals
`2δ − C` at the nodes of `X` and `Y`, for `C` the native `TauCeti.AffineDynkinType.cartanMatrix`;
the dimension of each simple is its native mark; and the trivial representation sits at the native
`affineNode`.

- Prove that every finite group with a faithful two-dimensional representation of determinant
  one, other than the trivial group, has a McKay labelling by a valid affine type
  (`exists_isMcKayLabelling`; McKay [McK80, Props. 1–2], Steinberg [Ste85, §1(1)–(5), (8)]).
  *Needs:* 1.1, RootSystems (finite ADE classification), ReductiveGroups 9A.1a.
- Prove that every valid affine type has a McKay labelling for some such group, the cyclic,
  binary dihedral, tetrahedral, octahedral and icosahedral models of Layer 0 realizing `Ãₙ`,
  `D̃ₙ`, `Ẽ₆`, `Ẽ₇`, `Ẽ₈` (`exists_isMcKayLabelling_of_valid`). *Needs:* 0.1, 1.1.

**Checks.**

- For `Γ = C₂ = {±I}`, `V` is twice the sign, the multiplicity matrix is `[[0,2],[2,0]]` and
  `2δ − C` reproduces it with the native `Ã₁` matrix `!![2,-2;-2,2]`; a definition through the
  simple graph `graph` would read the double edge as a single edge.
- For the trivial group, `V` is twice the trivial representation and the `1 × 1` multiplicity
  matrix is `(2)`, which is `2δ − C` for no valid affine type; the nontriviality hypothesis is
  needed.
- For `Q₈`, the four characters and the two-dimensional simple give `D̃₄` with marks
  `1,1,1,1,2`; the ordinary dihedral group of order eight has a faithful self-dual representation
  with the same labelling but determinant `−1` on a reflection, so the determinant hypothesis of
  the corner theorems of Layer 4 is not implied by the labelling.

### Examples

For `Q₈ = QuaternionGroup 2` acting through the binary dihedral model with `n = 2`, `V` is the
two-dimensional simple, `V ⊗ χ ≅ V` for each of the four characters `χ`, and
`V ⊗ V ≅ χ₀ ⊕ χ₁ ⊕ χ₂ ⊕ χ₃`; the McKay matrix is that of the star `D̃₄`, the marks are
`(1,1,1,1,2)` and the trivial character sits at the affine node.

### Dependencies

Layer 0; CharacterTheory Layer 3; Mathlib `FDRep.char_orthonormal`, `FDRep.char_tensor`; Tau Ceti
`TauCeti.irreducibleRepresentation`, `TauCeti.Representation.finrank_dvd_card`,
`TauCeti.AffineDynkinType`; RootSystems; ReductiveGroups 9A.1a.

## Layer 2: representation ring and root lattice

### 2.1 McKay multiplication on the representation ring

Expose the canonical class `[W] : R_ℂ(Γ)` in `TauCeti.repRing ℂ Γ` and prove

```text
[V] [ρ_i] = ∑_j a_ji [ρ_j],
[V] [ℂ[Γ]] = 2 [ℂ[Γ]],
[ℂ[Γ]] = ∑_i δ_i [ρ_i].
```

The second identity makes the regular-representation vector `δ` a null vector of `C`; the
sum-of-squares identity identifies its dimension with `|Γ|`. The real radical of `C` is `ℝδ`, and
the trivial coordinate `δ_trivial = 1` makes its integral radical exactly `ℤδ`. This also holds for
the singleton matrix `[0]`, giving the zero quotient without an invented affine type. It is not a
radical statement for an arbitrary `FDRep`. *Needs:* 1.1, Tau Ceti `TauCeti.repRing`,
`TauCeti.SplitK0.of_mul_of`, CharacterTheory (sum of squares).

### 2.2 The quotient by the regular class

Define `rootLatticeQuotientMap t`, the additive map `ℤ^(nodes of t) → ℤ^(nodes of the finite type)`
sending `x` to `x − x₀ δ` read at the nodes other than the affine node, in the Bourbaki numbering
`TauCeti.AffineDynkinType.bourbakiNode`, where `x₀` is the affine coordinate and `δ = t.marks`.

- It is additive, and onto: the basis vector at a finite node is the image of the basis vector at
  the corresponding affine-diagram node.
- Its kernel is `ℤδ`, because the mark of the affine node is `1`.
- For `x, y` in `ℤ^(nodes of t)`, `x · C y` equals the finite Cartan form of the images, since
  `Cδ = 0`, `C` is symmetric and its principal submatrix away from the affine node is
  `t.finiteType.cartanMatrix`.

Prove that for a McKay labelling `e` of a finite group by a valid affine type `t` there is an
additive isomorphism `Φ : R_ℂ(Γ) ≅ ℤ^(nodes of t)` sending each simple class to the basis vector of
its node, intertwining multiplication by `[V]` with `2 − C` and sending `[ℂ[Γ]]` to `δ`; that the
McKay form `(r, s) ↦ Φ r · C Φ s` has radical exactly `ℤ · [ℂ[Γ]]`; and that the composite of `Φ`
with `rootLatticeQuotientMap t` is onto the finite root lattice, has kernel `ℤ · [ℂ[Γ]]` and carries
the McKay form to the finite Cartan form (`exists_repRing_addEquiv_of_isMcKayLabelling`; Steinberg
[Ste85, §1(3)–(5)]). *Needs:* 1.2, 2.1, Tau Ceti `TauCeti.AffineDynkinType.cartanMatrix_mulVec_marks_eq_zero`,
`TauCeti.AffineDynkinType.cartanMatrix_submatrix_bourbakiNode`. For the singleton matrix the
quotient is the zero form on the empty lattice. Do not state only a rational quotient, and do not
conflate this ordinary algebraic quotient with a categorical quotient.

**Checks.**

- For `Γ = C₂` (`t = Ã₁`, `δ = (1, 1)`, affine node `0`) the composite sends the trivial class
  `(1, 0)` to `−1`, the sign class `(0, 1)` to `1` and `[ℂ[Γ]] = (1, 1)` to `0`; the McKay form on
  the sign class is `(0,1) · C (0,1) = 2`, matching the finite Cartan form `1 · 2 · 1`. Reading the
  quotient by restriction to the non-affine nodes, without subtracting `x₀ δ`, would send `[ℂ[Γ]]`
  to `1`, not `0`.
- For `Q₈` (`D̃₄`, `δ = (1,1,1,1,2)` with the centre last) the class of the two-dimensional simple
  maps to the finite basis vector of the centre and the trivial class to minus the highest root
  `(1,1,1,2)`; its finite Cartan norm is `2`, as for every root.
- `Φ([V] · [trivial]) = Φ[V]` is the column of `2 − C` at the affine node; for `Ẽ₈` in the Tau Ceti
  numbering (affine node `8`, marks `(6,3,4,2,5,4,3,2,1)`) this is the basis vector of node `7`, the
  unique neighbour of the affine node, so `V` is the simple of dimension `2`.

### Examples

For cyclic `Γ` of order `n ≥ 3`, `Φ` identifies `R_ℂ(Γ)` with `ℤ^(ℤ/n)`, `[V]` acts by the sum of
the two shifts, and the composite with `rootLatticeQuotientMap` is the classical identification of
`ℤ^n/ℤ(1, …, 1)` with the `A_(n−1)` root lattice.

### Dependencies

Layers 1–2 of this roadmap; Tau Ceti `TauCeti.repRing`, `TauCeti.SplitK0.of`,
`TauCeti.AffineDynkinType` (`marks`, `affineNode`, `finiteType`, `bourbakiNode`); CharacterTheory.


## Layer 3: skew-group algebras and quadratic Koszul duality

### 3.1 Skew-group algebras and equivariant modules

The skew product is Mathlib's `SkewMonoidAlgebra A Γ` for a `MulSemiringAction Γ A`; its
multiplication `SkewMonoidAlgebra.single_mul_single` is the left skew product of the Conventions,
and its ring and algebra structure and universal properties (`SkewMonoidAlgebra.liftNCRingHom`,
`SkewMonoidAlgebra.liftNCAlgHom`) are consumed as they are. What is built here is the equivalence
between left modules over `A ⋊ Γ` and `Γ`-equivariant left `A`-modules, whose morphisms are linear
maps intertwining both actions: construct the two functors on objects and morphisms, their inverse
natural isomorphisms and the action formulas, and separately the equivalence with the
right-module convention through the opposite algebra. *Needs:* Mathlib `SkewMonoidAlgebra`,
`SkewMonoidAlgebra.single_mul_single`.

- A left `A ⋊ Γ`-module `M` restricts to an `A`-module through `a ↦ single 1 a` and to a
  `Γ`-representation through `g ↦ single g 1`, with `g (a m) = (g • a)(g m)`.
- Conversely an equivariant `A`-module becomes an `A ⋊ Γ`-module by `(single g a) m = a (g m)`,
  and the two constructions are mutually inverse on objects and morphisms.

**Checks.**

- For `A = k` with trivial action, `A ⋊ Γ = k[Γ]` and the equivalence is the identity of
  `Γ`-representations; a convention placing `g` on the left of `a` in `single g a` gives the same
  answer here, so the next Check is needed to pin it.
- For `Γ = C₂` acting on `A = k[x]` by `x ↦ −x`, the equivariant module `k[x]` itself corresponds to
  the `A ⋊ Γ`-module with `(single g 1)(x) = −x`; then `(single g 1)(single 1 x) = single g (−x)`,
  and on `1 ∈ k[x]` both sides give `−x`, while the opposite convention would give `+x`.
- For `A = k` and `Γ = C₂` the simple `A ⋊ Γ`-modules are the trivial and the sign
  representation, two of them, while `A` has one simple module; the regular module `k[C₂]`
  corresponds to the equivariant module `trivial ⊕ sign`, of dimension `|Γ| = 2`. An equivalence
  with plain `A`-modules, forgetting the action, would have one simple and is excluded.

### 3.2 Actions on the symmetric, exterior and tensor algebras

Lift a linear representation on a finite-dimensional `V` to actions on `SymmetricAlgebra k V`
and `ExteriorAlgebra k V`, then form

```text
Sym(V) ⋊ Γ,            Λ(V) ⋊ Γ.
```

Define `symmetricAlgebraAut`, `exteriorAlgebraAut` and `tensorAlgebraAut`: the monoid
homomorphisms from `Γ` to the algebra automorphisms of `Sym(V)`, `Λ(V)` and `T(V)` sending `g` to
the automorphism that extends `ρ(g)` on `V`, with inverse the extension of `ρ(g⁻¹)`.  For `V` an
object of `FDRep k Γ` they give the actions `symmetricAlgebraAction`, `exteriorAlgebraAction` and
`tensorAlgebraAction`, each commuting with scalars (`symmetricAlgebraAction_smulCommClass`,
`exteriorAlgebraAction_smulCommClass`, `tensorAlgebraAction_smulCommClass`), so that Mathlib's
`SkewMonoidAlgebra` over each of them is a `k`-algebra with the displayed multiplication.

- The extension restricted to `V` (degree one) is `ρ(g)`, and the extension of `ρ(1)` is the
  identity.
- The extension of `ρ(gh)` is the composite of the extensions of `ρ(g)` and `ρ(h)`, in that order.
- Each extension is `k`-linear.

**Checks.**

- For `Γ = C₂` acting on `V = k` by the sign, the generator sends `x` to `−x` and `x²` to `x²`; an
  action defined on generators but not multiplicative would not fix `x²`.
- For the trivial representation every extension is the identity, so `Sym(V) ⋊ Γ` is the tensor
  product `Sym(V) ⊗ k[Γ]`; a convention with a hidden twist would make it noncommutative already
  for `Γ` abelian and `V` trivial.
- For `Γ = C₂` and `V = k` with the sign, `(1 # g)(x # 1) = (g • x) # g = −x # g`, while
  `(x # 1)(1 # g) = x # g`; the two orders differ, which pins the left skew product of the
  Conventions.


*Needs:* Mathlib `SymmetricAlgebra.lift`, `ExteriorAlgebra.map`, `TensorAlgebra.lift`,
`MulSemiringAction.compHom`.

### 3.3 Relative quadratic duality at the base `k[Γ]`

The generic relative quadratic theory is [DGAInfinity Layer 11](../DGAInfinity/README.md#layer-11-relative-quadratic-and-derived-koszul-duality):
over a finite-dimensional separable semisimple base `S` and a finitely generated projective
`S`-bimodule `W`, it owns the relative tensor algebra `T_S(W)`, the quadratic algebra `T_S(W)/(R)`,
the right dual `Wᵛ=Hom_{Sᵐᵖᵖ}(W,S)` with its evaluation, the annihilator `R⊥`, the quadratic dual
`T_S(Wᵛ)/(R⊥)`, and Koszulity, the latter defined through the **linear graded projective
resolution** of [GrothendieckEulerForms Layer 3](../GrothendieckEulerForms/README.md#layer-3-finite-resolutions-and-the-resolution-theorem) (the `n`th
term generated in internal degree `n`, all differentials of internal degree zero, augmentation onto
`S`).  That owner works with graded **right** modules; this roadmap uses left modules, so every
Koszulity statement here is transported through the explicit bridge "left `B`-modules = right
`Bᵒᵖ`-modules" together with the opposite comparison `(T_S(W)/(R))ᵒᵖ ≅ T_{Sᵒᵖ}(W)/(Rᵒᵖ)`.  This
layer does not redevelop the generic theory: it instantiates it at `S=k[Γ]`, `W=V⊗k[Γ]`, and the
relative quadratic algebra, right bimodule dual, relative quadratic dual and Koszul terms it uses
are the owner's objects, specialised to the skew-group base.  ⚠ Every
theorem about the right dual carries the separable-semisimple base hypothesis
(finite dimension, semisimplicity and separability of `S`); it is not a convenience that can be dropped for an arbitrary
`k`-algebra `S`.  With `k=ℚ`, `S=ℚ[t]` and `W=S⊗_ℚS` under its outer actions, `W` is free of rank
one over `S⊗Sᵐᵖᵖ`, hence a finite projective bimodule, but as a right `S`-module it is free on the
countably many `tⁿ⊗1`, so `Hom_{Sᵐᵖᵖ}(W,S)` is uncountable while `S⊗Sᵐᵖᵖ ≅ ℚ[x,y]` is countable
and every finitely generated module over it is countable; so the claim that the right dual is a
finite projective bimodule would be false without that hypothesis.

Koszulity of `T_S(W)/(R)` is the exactness of the **canonical** Koszul complex
`⋯ → B⊗_S K₁ → B⊗_S K₀ → S → 0`, with `K₀=S`, `K₁=W`, `K_n` the intersection of the
`W^{⊗(i−1)}⊗R⊗W^{⊗(n−i−1)}` in `W^{⊗_S n}`, the fixed differential
`b⊗(w₁⊗⋯⊗w_(n+1)) ↦ bw₁⊗(w₂⊗⋯⊗w_(n+1))` and the fixed augmentation (through `B⊗_S S ≅ B`,
followed by the canonical augmentation `B → S` onto `S` with `B` acting through that augmentation):
the complex is exact, has surjective augmentation, and has projective terms.  Neither the maps nor the augmentation are chosen.  Prove that this agrees with the owner's
linear-graded-resolution definition under the left/right bridge.

**Checks.**

- For `S=W=k` and `R=0` (`B=k[x]`) the canonical complex is `0 → B --x--> B → k → 0`: exact with
  surjective augmentation, so `k[x]` is Koszul.  The complex `B --id--> B` with zero augmentation
  has the same terms, is exact at both terms and has projective terms, but `H₀=0` and the
  augmentation is not onto `k`; a definition that let the augmentation and differentials be chosen
  freely would accept it.
- For `S=W=k` and `R=W⊗W` (`B=k[x]/(x²)`) every `K_n` is one-dimensional and the canonical complex
  is the infinite periodic resolution with differential `x`; truncating it after finitely many terms
  breaks exactness, so a bounded-length definition would wrongly exclude this Koszul algebra.
- For `S=k`, `W=k²` with basis `x,y` and `R=k·(x⊗y)`: `K₃ = (R⊗W) ∩ (W⊗R) = 0`, so the canonical
  complex is `0 → B⊗R → B⊗W → B → k`.  For `R=x⊗W`: `K₃ = x⊗x⊗W`, two-dimensional, whereas the
  single term `R⊗W` is four-dimensional; a definition taking `K_n = R⊗W^{⊗(n−2)}` instead of the
  intersection gets the wrong terms.

Then prove:

- `Sym(V) ⋊ Γ` is relative quadratic Koszul;
- `T_S(Wᵛ)/(R⊥)` is graded-algebra isomorphic to `Λ(V∗) ⋊ Γ` itself, with no opposite, by an
  isomorphism which in degree one is the explicit bimodule isomorphism
  `Wᵛ ≃ V∗ ⊗ k[Γ]`, `f ↦ Σ_h (h·φ_h) # h` where `f(v ⊗ 1) = Σ_h φ_h(v) h`.  Here `Wᵛ` carries
  `(s·f)(w) = s f(w)` and `(f·t)(w) = f(t w)`, and `Γ` acts on `V∗` by the dual representation;
  this degree-one formula is what fixes the handedness;
- the gradings are fixed, not chosen: on `Sym(V)⋊Γ` and `Λ(V)⋊Γ` the degree-`n` piece
  is the
  set of elements all of whose coefficients lie in `Symⁿ(V)`, resp. `Λⁿ(V)`, so group elements have
  degree zero; on `T_S(Wᵛ)/(R⊥)` it is `D₀·D₁ⁿ` with `D₀` the image of `S` and `D₁` the image of
  `Wᵛ`, and these pieces form an internal direct sum.
  The algebra isomorphism above carries `D₀·D₁ⁿ` onto `Λⁿ(V∗)⋊Γ` for every `n`.  Check: for `Γ`
  trivial and `V=k` the dual is `k[ε]/(ε²)` with pieces `k, kε, 0, …`; a grading pinned only in
  degrees `0` and `1` would allow any family in degrees `≥2`, for instance the whole algebra, and
  "preserves the grading" would then hold for every isomorphism that is correct in degrees `0` and `1`;
- the nondegenerate determinant pairing gives an explicit equivariant linear equivalence
  `V ≃ V∗` in dimension two; and
- the canonical Koszul complex of `Sym(V)⋊Γ` above is exact with surjective augmentation, and its
  left-module form is identified with the owner's right-module Koszulity of the opposite algebra.

Do not state an algebra equivalence between a quadratic algebra and its dual.  Consume the
DGA/`A∞` bar, module and transfer APIs for derived Koszul functors.  Huerfano--Khovanov [HK01,
§6.2, (38)--(41), Prop. 13 and Cor. 3] gives the multiplication, resolution and duality; its
left/right quadratic-dual warning is binding.

*Needs:* DGAInfinity Layer 11, GrothendieckEulerForms Layer 3, 3.1, 3.2.

### Examples

For `Γ` trivial and `V = k`, `Sym(V) ⋊ Γ = k[x]` and its quadratic dual is `k[ε]/(ε²) = Λ(V∗)`,
with the canonical Koszul complex `0 → k[x] → k[x] → k → 0`. For `Γ = C₂` acting by `−1` on
`V = k²`, the degree-one piece of `Sym(V) ⋊ Γ` is `V ⊗ k[C₂]`, of dimension four.

### Dependencies

Mathlib `SkewMonoidAlgebra`, `SymmetricAlgebra`, `ExteriorAlgebra`, `TensorAlgebra`; DGAInfinity
Layer 11; GrothendieckEulerForms Layer 3; CharacterTheory (primitive idempotents).

## Layer 4: idempotent corners and McKay-quiver presentations

### 4.1 Full idempotents and the McKay quiver

Choose one primitive **matrix** idempotent `e_i` in every Wedderburn block of `ℂ[Γ]`; prove the
`e_i` are idempotent, primitive and mutually orthogonal, and do not sum primitive central
idempotents and call the result basic.  Embed `e=∑_i e_i` in both skew algebras and prove it is
full.  Define `eBe` and `e_j B₁ e_i` as literal subtypes of `B` cut out by multiplication and the
actual degree-one piece.  Derive the module-category equivalence from the full-idempotent theorem,
and prove the resulting corner is basic in the sense of `TauCeti.IsBasic` when finite
dimensional; do not
store an unrelated algebra and arbitrary equivalences in a presentation record.  Identify the
vertex idempotents and prove the arrow-corner formula

```text
e_j B₁ e_i ≃ Hom_Γ(ρ_j, V ⊗ ρ_i).
```

Then prove relation-level algebra equivalences:

- for binary groups with graphical McKay type, `e (Λ(V) ⋊ Γ) e` is the ordinary affine-ADE zigzag algebra;
- for those binary groups, `e (Sym(V) ⋊ Γ) e` is the additive preprojective algebra of an orientation
  of the affine McKay graph, with orientation independence supplied by the sibling API.


Define `IsMcKayQuiver V Q e` (`IsMcKayQuiver`), for a finite quiver `Q` and a bijection `e` from the simple classes
of `FDRep ℂ Γ` to the vertices of `Q`: for all simples `X`, `Y` the arrows of `Q` from `e Y` to
`e X` and from `e X` to `e Y` together number `dim Hom(X, V ⊗ Y)`. Its double then has exactly
`dim Hom(X, V ⊗ Y)` arrows from `e Y` to `e X`, matching the arrow-corner formula, and a loop counts
in both directions.

- For a McKay labelling by a graphical affine type `t` and an orientation `o` of `t.graph`, the
  oriented quiver `TauCeti.DoubledQuiver.OrientedQuiver t.graph o` is a McKay quiver.
- Any two McKay quivers of `V` have the same double up to a vertex-preserving isomorphism, so their
  preprojective algebras agree by orientation independence.

Prove that for every finite group with a faithful two-dimensional representation `V` of
determinant one and every McKay quiver `Q` of `V`, `Sym(V) ⋊ Γ` has a full idempotent whose corner
is Tau Ceti's `TauCeti.preprojectiveAlgebra` of `Q` (`exists_full_corner_equiv_preprojectiveAlgebra`;
CBH98, Theorem 0.1 at `λ = 0`). This includes the cyclic families of 4.2, the double edge of
`Ã₁` for `Γ = C₂` through the Kronecker quiver, and the trivial group through the one-loop quiver.
*Needs:* 3.1, 3.2, the arrow-corner formula above, ZigzagPreprojective (orientation
independence), Tau Ceti `TauCeti.preprojectiveAlgebra`, `IsIdempotentElem.Corner.instAlgebra`.

Prove that when moreover `−I ∈ Γ` and the McKay type is graphical, `Λ(V) ⋊ Γ` has a full idempotent
whose corner is `TauCeti.nonisolatedZigzagQuotient` of the McKay graph
(`exists_full_corner_equiv_zigzag`; [HK01, §6.3, Props. 16–17 and relation (42)], in the arXiv v2
form). The exterior corner of `C₂` has two degree-one arrows in each direction and is not the zigzag
algebra of a simple graph, so the zigzag statement stays with graphical types. *Needs:* 3.1, 3.2,
ZigzagPreprojective (ordinary zigzag algebra), Tau Ceti `TauCeti.nonisolatedZigzagQuotient`.

**Checks.**

- For `Γ = C₂` acting by `−1` on `V = ℂ²`, both simples are one-dimensional, the full idempotent is
  `1`, and `dim Hom(sign, V ⊗ trivial) = 2`: the Kronecker quiver with two arrows from the trivial
  to the sign vertex is a McKay quiver, and so is the quiver with one arrow in each direction; a
  definition through the simple graph `graph (A 1)` would give one arrow and a corner of the wrong
  size in degree one.
- For the trivial group, `V = ℂ²` is twice the trivial representation, the one-loop quiver is a
  McKay quiver (`1 + 1 = 2`), and both `Sym(V) ⋊ Γ` and the preprojective algebra
  `ℂ⟨a, a*⟩/(aa* − a*a)` are the polynomial ring in two variables.
- For `Q₈`, a McKay quiver orients the four edges of `D̃₄`; the corner of `Sym(V) ⋊ Q₈` is cut by the
  idempotent with one primitive idempotent in the two-dimensional block, not the central idempotent
  of that block, whose corner would have a `2 × 2` matrix algebra in degree zero and so not be
  basic.

### 4.2 Cyclic groups

The cyclic relation-level comparisons are separate direct calculations here,
not an attribution of odd-cycle ordinary zigzag to those propositions.
For `Γ=C_n`, `n≥3`, choose the determinant-normalized eigenbasis `x,y` of
weights `+1,-1` and the actual primitive character idempotents `e_i`, `i∈ZMod n`.
All simple dimensions are one, so their sum is the full identity. In the
exterior skew algebra define arrows

`X_i=e_(i+1) x e_i : i→i+1`, `Y_i=e_(i-1) y e_i : i→i-1`.

Prove the literal later-factor-first relations

`X_(i+1)X_i=0`, `Y_(i-1)Y_i=0`,
`Y_(i+1)X_i = -X_(i-1)Y_i`,

and that paths of length at least three vanish. Construct the inverse map
from the resulting path quotient, and prove its basis is the `4n` elements
`e_i,X_i,Y_i,(xy)e_i`. This is the sibling's parameterized skew-zigzag algebra
with opposite-backtrack ratio `-1` at every vertex. For odd `n≥3` retain this
skew parameter and its relation-level corner/Morita comparison. Do not identify
it with ordinary zigzag in characteristic zero: the cyclic product of the
rescaling equations would give `1=(-1)^n=-1`.
For even `n≥4`, a specified two-colouring gives the arrow rescaling to ordinary
zigzag and transports the grading and Frobenius data. Here the actual binary
condition is `-I∈Γ`; it includes even cyclic groups and is not equivalent to
being a noncyclic named tag. Characteristic two collapses the sign distinction
as a separately stated specialization with the field/group-order hypotheses
needed for the corner construction.

For the symmetric skew algebra the same arrows instead obey
`Y_(i+1)X_i=X_(i-1)Y_i`; prove the corresponding preprojective presentation
with the pinned cycle orientation by a direct relation/basis or PBW comparison.
The singleton and `C₂` cases retain their actual skew and relative-quadratic
algebras but are not passed through a simple-graph zigzag API: at the singleton
`Λ(ℂ²)` has dimension four, not the sibling's exceptional two-dimensional
ordinary `A₁` zigzag algebra; `C₂` has two degree-one arrows in each direction.
The FKS reflection layer keeps its connected bipartite graph scope
and does not extend to odd-cycle skew parameters by an unproved analogy.


**Checks.**

- For `n = 3` the exterior corner has basis `e_i, X_i, Y_i, (xy) e_i`, twelve elements, and the
  relation at vertex `i` compares the backtrack through `i + 1` with the backtrack through `i − 1`
  with ratio `−1`. Rescaling `X_i ↦ s_i X_i`, `Y_i ↦ t_i Y_i` multiplies the ratio at `i` by
  `(s_(i−1) t_i)/(s_i t_(i+1))`, and the product of these factors around the cycle is `1`; so the
  product of the ratios, `(−1)³ = −1`, cannot become `1`, and the odd cycle keeps the skew parameter.
- For `n = 4` the two-colouring `i mod 2` and the rescaling of `X_i` by `(−1)^i` turn every ratio
  `−1` into `+1`, giving the ordinary zigzag algebra of the four-cycle.
- For the symmetric skew algebra the relation is `Y_(i+1) X_i = X_(i−1) Y_i`, the preprojective
  relation of the cycle with the pinned orientation; in characteristic two it coincides with the
  exterior relation, which is why that specialization is stated separately.

### Examples

The zigzag algebra of a graph with `v` vertices and `e` edges has dimension `2v + 2e` (vertex
idempotents, arrows in both directions, one degree-two class per vertex). For the binary dihedral
group of order `4n` the exterior corner is the zigzag algebra of `D̃_(n+2)`, of dimension
`2(n + 3) + 2(n + 2) = 4n + 10`; for the binary icosahedral group it is the zigzag algebra of
`Ẽ₈`, of dimension `2 · 9 + 2 · 8 = 34`.

### Dependencies

Layers 1, 3; ZigzagPreprojective; QuiverRepresentations; Tau Ceti `TauCeti.preprojectiveAlgebra`,
`TauCeti.DoubledQuiver.OrientedQuiver`, `TauCeti.nonisolatedZigzagQuotient`, `TauCeti.IsBasic`,
`IsIdempotentElem.cornerEquivalence`; [HK01]; [CBH98].

## Layer 5: deformed preprojective algebras

### 5.1 The deformed preprojective algebra and the trace normalization

For a finite oriented quiver `Q` and `λ : Q₀ → k`, define

```text
Π^λ(Q) = k Q̅ / ⟨ ∑_(a∈Q₁) (a*a⁺ - a⁺*a) - ∑_i λ_i e_i ⟩,
```

after translating each product to Tau Ceti's later-factor-first convention.  Pin the CBH source
algebra as the quotient with relation `[x,y]-z=0` for a central `z∈Z(ℂ[Γ])`, with this sign, and
pin the vertex weight with no hidden normalization.  Write `f_i` for the scalar by which a central
`z` acts on the simple `ρ_i`, and `δ_i = dim_ℂ ρ_i`.  The CBH parameter of the **standard**
deformed preprojective relation is the trace,

```text
λ_i = Tr_{ρ_i}(z) = δ_i · f_i.
```

⚠ The scalar `f_i` is **not** the parameter.  The primitive-corner identity `e_i z e_i = f_i e_i` is
true, but it does not say that the corner of `∑_a [a, a*]` is the already-normalized preprojective
relation: the relation comparison contributes the missing factor `δ_i`.  This is explicit in
Crawley-Boevey, *Preprojective algebras, differential operators and a Conze embedding*, printed
p. 3, immediately before Theorem 0.9, and in Tikaradze, [arXiv:2204.13647](https://arxiv.org/abs/2204.13647),
§2, printed p. 4.  The two normalizations agree exactly when every irreducible is one-dimensional,
so the cyclic families cannot distinguish them and the binary dihedral and `Ẽ₆`, `Ẽ₇`, `Ẽ₈` cases
can.


### 5.2 The `Q₈` test of the normalization

The test that separates them uses `Γ = Q₈`, whose affine `D₄` graph has four dimension-one leaves
and a dimension-two centre.  Give the corresponding blocks of `z` the scalar eigenvalues `1` at one
leaf and `−1` at the centre.  The standard preprojective algebra with those **scalar** vertex
weights has a representation of dimension one at each of those two vertices, taking the two
opposite-arrow maps to be nonzero scalars whose product realizes the two signed vertex relations.
If a vertex-compatible corner equivalence existed with the scalar weights, its inverse would produce
a CBH module whose underlying `Γ`-representation is one copy of each irreducible; but then
`Tr([x,y]) = 0` while `Tr(z) = 1·1 + 2·(−1) = −1`, a contradiction.

For the stronger statement ruling out **all** complex algebra isomorphisms, use the following
module invariant, without requiring an isomorphism to preserve vertices. On a separated explicit
four-leaf star orient every arrow from the centre to a leaf. Use scalar weights `−1` at the
centre, `+1` at a chosen leaf, and zero at the other three leaves. On `ℂ²` the centre and chosen
leaf idempotents are `E₀₀,E₁₁`, and the two arrows are `E₁₀,E₀₁`; their commutator is
`E₁₁−E₀₀`. They generate all matrix units, so this is a simple module of complex dimension two.

For every finite-dimensional module over a finite deformed preprojective quiver, prove by summing
the actual vertex relations and taking trace that `∑ᵢ λᵢ dim(eᵢM)=0`; the vertex dimensions sum
to `dim M`. With the **trace** weights `−2` at the centre and `+1` at the chosen leaf, a module
of total dimension two would have `d_leaf=2d_centre`, hence both dimensions zero. Its support
lies on the other three isolated leaves, so its action factors through `ℂ³`; every simple there
has dimension one. Thus this trace-weight algebra has no two-dimensional simple. Restriction
along any complex algebra isomorphism preserves simplicity and the underlying complex dimension,
so the scalar-weight and trace-weight algebras are not isomorphic even abstractly.


Identify the actual `Q₈=binaryDihedral 2` named affine-`D₄` frame with this separated star: named
centre2 is native node1, the four leaves have dimension one, and the centre has dimension two.
Pin the relabel and the signs when reversing only the two incoming named arrows:
`a↦a*`, `a*↦−a`; the other two edges are unchanged. Construct the actual central block element
by the inverse of the block-scalar equivalence `Z(ℂ[Γ]) ≃ ℂ^(Irr Γ)` on the specified scalar
vector, first proving that this equivalence evaluates to the scalar by which a central element acts
on each simple. The trace-parameter CBH theorem identifies its full corner with the trace-weight
star; combining it with the simple-dimension invariant rules out every corner equivalence to the
scalar-weight algebra. The vertex-compatible argument above is the weaker statement that no
vertex-preserving equivalence exists. *Needs:* 5.3 (the CBH theorem), the dimension identity
`∑ᵢ λᵢ dim(eᵢM) = 0`.

### 5.3 The centre and the Crawley-Boevey–Holland theorem

Construct `Z(ℂ[Γ]) ≃ ℂ^(Irr Γ)` as the **block-scalar** map, which is the algebra equivalence; the
trace-coordinate map `z ↦ (Tr_{ρ_i}(z))_i` is only linear once some `δ_i > 1`, so the centre's
algebra equivalence keeps the scalars while the preprojective comparison uses the trace.  State the
normalized relation calculation and the images of the vertex idempotents explicitly, so the factor
`δ_i` is visible rather than absorbed.

Here `x,y` are the displayed defining representation's standard ordered coordinate basis, fixed
so that its determinant pairing is exactly `1`.  A general change of basis is not silently
absorbed into the symbol `z`.

Expose the equivalent vertexwise relations, prove `Π⁰(Q) ≃ Π(Q)`, and prove orientation
independence by the explicit arrow/reverse-arrow sign transport while keeping the same vertex
weight `λ`.  Then prove the path-length filtration and the full-corner equivalence between the
`[x,y]-z` quotient and `Π^λ(Q)`.  The normalization and comparison are
Crawley-Boevey--Holland [CBH98, §§3--4]; the exact path convention can be cross-checked against
Crawley-Boevey--Kimura [CBK22, Introduction].  This layer proves algebraic presentations only.


On the native carriers, define `deformedPreprojectiveAlgebra k Q λ` as Tau Ceti's doubled path
algebra modulo the two-sided ideal generated by `TauCeti.preprojectiveRelator k Q − ∑_i λ_i e_i`,
with `e_i = TauCeti.doubledVertexIdempotent k i`; define `cbhRelator V b z = [x, y] − z` (`cbhRelator`) in
`T(V) ⋊ Γ`, for the ordered basis `x = b 0`, `y = b 1` and `z` embedded as `∑_g z_g (1 # g)`; and
define `CBHAlgebra V b z` as the quotient of `T(V) ⋊ Γ` by the two-sided ideal it generates.

- At `λ = 0`, `deformedPreprojectiveAlgebra k Q 0` is `TauCeti.preprojectiveAlgebra k Q`.
- Sending every arrow `a` of `Q` to `c a` and its reverse `a*` to `c a*`, for `c ∈ kˣ`, defines an
  isomorphism `Π^(c²λ)(Q) → Π^λ(Q)`, because the relator is quadratic in the doubled arrows; sending
  only the arrows of `Q` to `c a` and fixing the reverse arrows defines an isomorphism
  `Π^(cλ)(Q) → Π^λ(Q)`. Over `ℂ` either shows that a uniform nonzero rescaling of all weights does
  not change the algebra up to isomorphism; the factor `δ_i` of 5.1 is not uniform.
- Reversing an arrow `a` by `a ↦ a*`, `a* ↦ −a` keeps `λ`.

Prove that for a finite group with a faithful two-dimensional representation of determinant one, a
McKay quiver `Q`, a central `z` and the trace weights `λ` read through the bijection `e`,
`CBHAlgebra` has a full idempotent whose corner is `deformedPreprojectiveAlgebra` of `Q`
(`exists_full_corner_equiv_deformedPreprojectiveAlgebra`; CBH98, Theorem 0.1 and §§3–4). The
statement covers `Γ = C₂` through the Kronecker quiver and the trivial group through the one-loop
quiver, where both sides are the first Weyl algebra for `z ≠ 0`. *Needs:* 4.1, 5.1, the block-scalar
equivalence above, Tau Ceti `TauCeti.preprojectiveRelator`, `TauCeti.doubledVertexIdempotent`.

**Checks.**

- At `λ = 0` the ideal is the preprojective ideal, so `deformedPreprojectiveAlgebra k Q 0` is
  `TauCeti.preprojectiveAlgebra k Q`; at `z = 0`, `CBHAlgebra` is isomorphic to `Sym(V) ⋊ Γ`.
- Uniform scaling is quadratic: on the star representation with `a = E₁₀`, `a* = E₀₁` the commutator
  `aa* − a*a` is `diag(−1, 1)`; scaling both arrows by `2` gives `diag(−4, 4)`, which is the relation
  at `4λ = 2²λ`, not at `2λ` (`diag(−2, 2)`).
- Over a field of characteristic zero, for the one-vertex quiver with one loop `a` and `λ = 1`, the
  relation is `aa* − a*a = 1`, the first Weyl algebra, which has no nonzero finite-dimensional module:
  the trace of a commutator is `0` while the trace of the identity is `dim M`, which is nonzero in
  `k` unless `M = 0`. In characteristic `p > 0` this fails: on `k[t]/(tᵖ)`, differentiation `D` and
  multiplication `T` by `t` satisfy `[D, T] = 1` and give a module of dimension `p`; over `𝔽₂` the
  matrices `D = E₀₁`, `T = E₁₀` already satisfy `DT − TD = I` on `𝔽₂²`. With `λ = 0` the algebra
  is `k[a, a*]`.
- Summing the vertex relations of a finite-dimensional module `M` and taking traces gives
  `∑_i λ_i dim(e_i M) = 0` in `k`, hence in `ℤ` in characteristic zero; for `Q₈` with trace weights
  `(1, −2)` at a leaf and the centre this excludes the two-dimensional simple that the scalar
  weights `(1, −1)` admit, as computed above.

### Examples

For `Γ = C₂` with `z = c · (1 − g)/2`, `c ∈ ℂ` (the central element acting by `0` on the trivial
and by `c` on the sign representation), the trace weights are `(0, c)` on the Kronecker quiver; for
cyclic groups the trace and scalar weights agree because every simple is one-dimensional.

### Dependencies

Layers 1, 3, 4; Tau Ceti `TauCeti.pathAlgebra`, `TauCeti.preprojectiveRelator`,
`TauCeti.doubledVertexIdempotent`, `TauCeti.preprojectiveAlgebra`; Mathlib `TensorAlgebra`,
`MonoidAlgebra`, `Subalgebra.center`; [CBH98]; [CBK22].


## Layer 6: FKS curved complexes, duplexes, stable categories and Weyl functors

### 6.1 Curved objects, homotopy categories and stable categories

Use DGAInfinity's actual internal-grading and graded-opposite APIs and StablePeriodicCurved's actual morphism-ideal/quotient and compatible balanced-tensor APIs. The left/parity,
algebra-valued-curvature data below are FKS-specific adapters: provide comparison functors,
inverse natural isomorphisms and tensor/homotopy compatibility wherever the generic owner
applies. Retain an explicit FKS construction when that owner's scalar/commutative duplex
hypotheses do not apply, rather than asserting a nonexistent generic equivalence. Scope
all typeclass workarounds to those declarations; do not globally remove imported instances.

Let `A` be a graded ring, graded by `ℤ` or by its parity `ℤ/2`, and `c` a central element of
degree two.  Build, in [FKS05, §§2--4]:

- **Curved objects.**  An `(A,c)`-complex (for `ℤ`) or duplex (for `ℤ/2`) is a graded left
  `A`-module with a degree-one additive `d`, `d² = c`, and `d(a m) = (-1)^|a| a d(m)`.  Morphisms
  are degree-zero `A`-linear maps commuting with `d`; this is the concrete abelian category
  `Com(A,c)` or `Com₂(A,c)`.  Construct the shift `X[1]` (grading shifted by one, `d` negated, action
  twisted by the parity involution), the shift functor, `[2] ≅ Id` for duplexes, and the mapping
  cone `Y ⊕ X[1]` with `d(y, x) = (dy + f x, -dx)`.
- **Homotopy categories.**  `f` is null-homotopic when `f = h d + d h` for an additive `h`
  lowering degree by one with `h(a m) = (-1)^|a| a h(m)` (an `A`-map to the shifted object).
  These maps form an ideal, and `K(A,c)`, `K₂(A,c)` are the prerequisite's `MorphismIdeal`
  quotients.  For `ℤ`, prove `K(A,c)` equivalent to the prerequisite's curved homotopy category of
  `(A, 0, -c)` over its graded opposite, which supplies the triangulation.
- **The curved extension algebra** `Ã_c = A ⊗ ℤ[d]/(d² - c)` with `d a = (-1)^|a| a d` and
  `deg d = 1`, on the carrier of pairs `a + b d`, with the multiplication
  `(a + b d)(a' + b' d) = (a a' + b σ(b') c) + (a b' + b σ(a')) d` for the parity involution `σ`.
  Prove it is free of rank two over `A` and that graded `Ã_c`-modules are equivalent to
  `Com(A,c)`, with `d` acting as the element `d`.
- **Stable categories.**  `Mod(Ã_c)` and `Mod₂(Ã_c)` are the graded module categories (abelian,
  so projectivity is the usual notion) modulo maps factoring through projective graded modules.
  FKS Lemma 4.1 (projectives are contractible) gives the canonical functor
  `Φ₂ : Mod(Ã_c) → K(A,c)` of [FKS05, (4.1)].  The stable category is a quotient of the module
  category, not of the homotopy category, and `Φ₂` is not an equivalence in general.
- **Folding.**  Collapsing the `ℤ`-grading to its parity is a functor `Com(A,c) → Com₂(A,c)`; the
  Weyl functors act on the duplex side, as in [FKS05, §6].
- **Tensoring.**  For a curved bimodule `N` with `d² = l(c') - r(c)`, the balanced tensor `N ⊗_A M`
  with total grading and `d(n ⊗ m) = dn ⊗ m + (-1)^|n| n ⊗ dm` gives `Com(A,c) → Com(A,c')`, on
  morphisms `id ⊗ f`, descending to `K(A,c) → K(A,c')` [FKS05, §§2.3--2.4, 3.3].


**Checks.**


- over `A = ℚ[t]/(t²)` in degree zero with `c = 0`, the disk `Ã_0 ⊗_A (A/(t))` is nonzero in
  `Mod(Ã_0)` (its restriction to `A` is not projective) but zero in `K(A,0)`, so `Φ₂` kills a
  nonzero object and is not an equivalence;
- over `ℚ[u,u⁻¹]` with `deg u = 2` and `c = u`, every object of `K(A,c)` is contractible by
  `h = u⁻¹ d / 2`, so `K(A,c)` is the zero category [FKS05, §3.2, Remark];
- for the zigzag algebra of a connected bipartite graph at `c = 0`, a simple module with zero
  differential is nonzero in `K₂(A,0)`, hence its preimage is a nonzero object of `Mod₂(Ã_0)`.


*Needs:* DGAInfinity (internal gradings, graded opposite), StablePeriodicCurved (`MorphismIdeal`,
factor-through ideal, curved homotopy category), [FKS05, §§2–4].

### 6.2 Reflection functors on bipartite zigzag algebras

**Weyl functors.**  FKS §5.1 use an orientation-signed algebra `A(Q)`; it is the ordinary zigzag
algebra when `Q` is bipartite [FKS05, §5.1] (over any field; for a connected graph and
characteristic other than two, only then), which covers every binary-group McKay graph
(FKS §8.1 assume `-1 ∈ Γ`).  So this part is stated for a connected **bipartite** graph with a
chosen two-colouring, and the colouring transports FKS's data explicitly.  With `ε_a = ±1` by
colour and `Y_a` the ordinary backtrack class at `a` (trace one), FKS's degree-two basis element is
`X_a = ε_a Y_a`, and FKS's comultiplication is `Δ_a = ε_a` times the ordinary Frobenius
coevaluation, whose value on `1` is
`Y_a ⊗ e_a + e_a ⊗ Y_a + Σ_(a--b) (a⟶b) ⊗ (b⟶a)` in `P_a ⊗ {}_aP`, where `P_a = A e_a` and
`{}_aP = e_a A` are the literal corner modules and `m_a : P_a ⊗ {}_aP → A` is multiplication.  For
a center parameter `c = Σ_i x_i X_i` define

```text
s_a(c) = c + x_a (∑_(a--b) X_b - 2 X_a).
```

The reflection kernel `C_{a,-x_a}` is the parity-graded bimodule `A ⊕ (P_a ⊗ {}_aP)[1]`, with the
left action on the shifted summand twisted by the parity involution and the right action untwisted,
and `d(u, t) = (-x_a m_a(t), Δ_a(u))`.  Its square is `l(s_a(c)) - r(c)` [FKS05, (6.3)--(6.4)], so
tensoring gives `Com₂(A,c) → Com₂(A,s_a(c))`.  Prove that it sends projective `Ã_c`-modules to
stably zero objects [FKS05, Lemma 6.1], so it induces `R_a : Mod₂(Ã_c) → Mod₂(Ã_(s_a c))`
compatible with `Φ₂` and the homotopy-level functor; that `R_a` is an equivalence when `x_a ≠ 0`
[FKS05, Prop. 6.1], with `s_a` an involution; and the commuting and braid relations.  For a base parameter `c`, the orbit
category is the disjoint union of the fibres `Mod₂(Ã_c')` over the reflection orbit of `c`, and the
orbit functor `R_a` is defined fibrewise, so its restriction to each fibre is the tensor functor
above by construction.  Impose the precise FKS genericity condition `x_a(c') ≠ 0` for every vertex
`a` and every `c'` in the orbit; under it prove `R_a ∘ R_a ≅ Id` on the orbit category, so that
together with the commuting and braid relations the `R_a` give the Weyl action [FKS05, Thm. 1].  These are [FKS05, §6, (6.3)--(6.4), Props. 6.1--6.3, Thms. 1--2].  The skew-group
transport is [FKS05, §§8.1--8.3 and §9.3].


*Needs:* 6.1, ZigzagPreprojective (ordinary zigzag algebra, Frobenius coevaluation), [FKS05, §6].

**Checks.**

- `s_a` is an involution: `s_a(c)` has coordinate `−x_a` at `a` and `x_b + x_a` at each neighbour
  `b`, and applying `s_a` again returns `x_a` and `x_b`.
- On two adjacent vertices `a – b` both braid words act by `(x_a, x_b) ↦ (−x_b, −x_a)`:
  `s_a s_b s_a` passes through `(−x_a, x_a + x_b)` and `(x_b, −x_a − x_b)`, and `s_b s_a s_b`
  through `(x_a + x_b, −x_b)` and `(−x_a − x_b, x_a)`.
- In the ordinary zigzag algebra every backtrack at `b` equals `Y_b`, so
  `m_a(Δ_a(1)) = ε_a (2 Y_a + Σ_(a–b) Y_b) = 2 X_a − Σ_(a–b) X_b` (the neighbours carry the other
  colour). Hence the `A`-component of `d²` at `1` is `−x_a m_a Δ_a(1) = x_a (Σ_(a–b) X_b − 2 X_a)
  = s_a(c) − c`, which is `l(s_a(c)) − r(c)` at `1`. The unsigned coevaluation would give
  `2 Y_a + Σ Y_b`, which is not `s_a(c) − c` in the `X` coordinates.

### 6.3 The Γ-side curved Morita comparison

Construct the endpoint-weighted algebraic Γ-realization of the reflection,
curvature and Weyl-functor outputs of FKS §§8.1–8.3 and 9.3, with the explicit actual-corner,
graph-kernel and coordinate comparisons of 6.5. This is a definite construction theorem,
not a deduction from ungraded Morita equivalence. The ordered-composite scalars, their
trace weights and the chosen bilinear adjoint are part of its definition. No equality to the raw scalar equations of the source display or to an adjoint with unspecified pairings is a premise or conclusion. Retain the binary/simple-graph
scope of the reflection theorem. Fix the determinant-normalized ordered basis of the actual
two-dimensional defining representation V and write Ω=x∧y. Set A=Λ(V)⋊Γ with the
single-term product `(α#g)(β#h)=(α∧gβ)#gh`. Group elements have degree 0, vectors degree 1, and Ω
degree 2. Work with the actual exterior internal grading and its parity collapse, not merely an
arbitrary function of submodules satisfying degree 0/1 range equations. The latter prototype
equations alone do not certify multiplication or higher pieces. The general curved-Morita
construction below also works in ℤ grading; the reflection application uses parity.
Concretely define A_d as the span of `α#g` with α in the degree-d exterior piece, and zero
for integer d<0 or d>2. Prove the internal direct sum and multiplication laws from the actual
exterior/skew PBW decomposition; parity has even piece A_0⊕A_2 and odd piece A_1. Construct
the actual graded restriction of φ below, not a new unconstrained grading function.

Use Layer 4's primitive matrix idempotents in S=ℂ[Γ]. Choose bases of the actual irreducibles
adapted to these idempotents and construct their matrix units E^i_rs under the actual Wedderburn
map. Thus e_i=E^i_(1,1), e=Σ_i e_i and Σ_(i,r)E^i_(r,1) E^i_(1,r)=1. Write p_(i,r)=E^i_(r,1) and
q_(i,r)=E^i_(1,r). These elements have degree 0. Their products q_j p_l lie in B=eAe. Set
P=Ae and Q=eA with their literal outer actions. Multiplication gives the graded bimodule
isomorphisms

```text
P⊗_B Q ≃ A,  p⊗q ↦ pq,       a ↦ Σ_j a p_j⊗q_j;
Q⊗_A P ≃ B,  q⊗p ↦ qp,       b ↦ e⊗b.
```

These are the balanced tensor quotients already specified above, with their degreewise
grading and associator; no second noncommutative tensor carrier is introduced. Prove both
inverse equations by the matrix-unit identity and balancing. In particular P is finitely
generated projective as a right B-module, with degree-zero dual basis `(p_j,p↦q_jp)`, and Q is
finitely generated projective as a left B-module, with dual basis `(q_j,q↦qp_j)`. They are
projective over their outer A sides as idempotent summands. These assertions are proved from
the actual matrix units, not assumed as extra hypotheses or confused with finite-dimensional
projectivity over ℂ. The two multiplication isomorphisms satisfy the Morita triangle/coherence
identities on tensors.

Let φ:B≃Z be the actual Layer 4 graded algebra identification with the pinned ordinary zigzag
algebra Z, including its vertex/arrow/volume and colouring comparison. For a central homogeneous
z∈B define its unique central lift and inverse by

```text
θ(z)=Σ_j p_j z q_j ∈ Z(A),       θ⁻¹(w)=ewe ∈ Z(B).
```

Prove centrality, independence of the matrix-unit expansion, both inverse identities and
`θ(z)p=pz`, `qθ(z)=zq`. For instance multiply the centrality equation on each side by the full
matrix-unit expansion of 1; its coefficients lie in B and commute with z. This is a graded
algebra isomorphism of centers, not a freely chosen correspondence between parameter labels.
For graph coordinates t set `c_B(t)=φ⁻¹(Σ_i t_i X_i)` and `c_A(t)=θ(c_B(t))`. Then the reflected
Γ-side parameter is exactly `c_A(s_a t)`, in the `X_i=ε_iY_i` convention of 6.2.

Pin the scalar and group-coefficient dictionaries as actual computations. Since
`φ⁻¹(X_i)=κ_i Ωe_i`, define κ_i as the coefficient of Ω in that literal one-dimensional
corner; prove κ_i≠0. Equivalently it is `(|Γ|/δ_i)` times the Ω#1 coefficient of φ⁻¹(X_i).
It is determined by the fixed determinant, matrix-unit and arrow map, not an independently
chosen weight or an implicit assertion κ_i=1. With z_i=Σ_r E^i_rr the primitive central
idempotent, the comparison is

```text
c_A(t)=Ω Σ_i κ_i t_i z_i
      = Ω · (1/|Γ|) Σ_(g∈Γ) (Σ_i δ_i κ_i t_i χ_i(g⁻¹)) g.
```

Conversely, for a central group-algebra element z with scalar action f_i on ρ_i,
`Ωz=c_A(t)` means `t_i=f_i/κ_i`. This is the actual parameter comparison; any alternate FKS
volume/arrow normalization must be transported through this equation and its inverse. Keep
Layer 5's separate CBH trace coordinates `λ_i=δ_i f_i`; never silently substitute block scalars,
trace coordinates or graph-curvature coordinates for one another.
The source's Section 6 convention is `c_B=-Σ_i ζ^Q_(ℂ,i) X_i`, whereas Section 8's Γ deformation
is `d²=+ΩΣ_i ζ^Γ_(ℂ,i)z_i`. In the present dictionary `t_i=-ζ^Q_(ℂ,i)` and
`ζ^Γ_(ℂ,i)=κ_i t_i`; the graph duplex with multiplication coefficient `x=-t_a` is the
source's `C_(a,x)`. Record these signs and the induced coordinate conjugation of s_a. The
source's displayed unweighted ε relation is not substituted for the determinant/matrix/trace
computation. Construct the endpoint-weighted scalar normalization and its explicit arrow,
volume, curvature and kernel comparison of 6.5; the actual κ_i are retained throughout.

For the left curved categories define F_t(M)=eM, with restricted grading and differential, and
E_t(N)=P⊗_B N, with its total grading and

```text
d_E(p⊗n)=(-1)^|p| p⊗d_N n.
```

On morphisms they are restriction and id⊗f. Prove balancing using the left superlinearity of
d_N and `d_E²=c_A(t)` using `c_A(t)p=pc_B(t)`. The counit is multiplication
`P⊗_B eM→M, p⊗m↦pm`, with inverse `m↦Σ_j p_j⊗q_jm`; the other comparison
`e(P⊗_B N)≃N` sends `ep⊗n↦(ep)n`, with inverse `n↦e⊗n`. Prove that these are graded,
commute with the differentials, are natural in actual morphisms, and satisfy the triangles.
For odd homotopies E uses `H(p⊗n)=(-1)^|p|p⊗h(n)`; F restricts h. Thus both equivalences
carry the actual nullhomotopy ideals to one another and induce inverse homotopy equivalences,
compatible with shifts, cones and folding. No stable-to-homotopy equivalence is inferred.

Relate E to Tau Ceti's full-idempotent equivalence. Native
`IsIdempotentElem.cornerEquivalence` uses the inverse `Hom_B(Q,N)`, not P⊗_B N. Construct the
comparison on actual elements

```text
Ψ(p⊗n)(q)=(qp)n,       Ψ⁻¹(f)=Σ_j p_j⊗f(q_j).
```

Its grading is the homogeneous-map grading; finite-dimensional Q has finitely many degrees.
The curved differential on this native inverse is `(Df)(q)=(-1)^|q|d_N(f(q))` for homogeneous q,
extended additively. Verify B-linearity, its A-superlinearity and square, then verify Ψ commutes
with d using the two signs in `d_N((qp)n)`. Match the actual native evaluation-at-e counit and
action-map unit, rather than asserting definitional equality of two inverse functors.

For the stable categories, e is still full and degree 0 in the actual curved extension algebra
Ã_(c_A(t)); its corner is the extension algebra of `(B,c_B(t))`, with d commuting with e.
The same p_j,q_j prove fullness there. The induced graded-module equivalence therefore
preserves and reflects the honest projective objects, their factor-through ideals and the
stable quotients. Give the object/morphism equations and inverse natural isomorphisms on those
quotients. The square comparing these stable equivalences with the functors Φ₂ of 6.1 to
curved homotopy categories must commute naturally. It does not identify their different ideals.


*Needs:* 4.1 (the corner identification `φ`), 6.1, CharacterTheory (matrix units in the Wedderburn
decomposition), Tau Ceti `IsIdempotentElem.cornerEquivalence`.

**Checks.**

- For `Q₈` the two-dimensional block has matrix units with `E_(11) E_(11) + E_(21) E_(12) =
  E_(11) + E_(22)`, its primitive central idempotent; together with the four one-dimensional blocks
  this is `Σ_(i,r) p_(i,r) q_(i,r) = 1`. Summing only `p_(i,1) q_(i,1)` would give the basic
  idempotent `e`, not `1`.
- The centre lift sends the vertex idempotent `e_c` of the centre of `D̃₄` to
  `θ(e_c) = E^c_(11) + E^c_(22)`, the central idempotent of the two-dimensional block; for the
  two-block central element `e_c + e_l` (centre and a leaf) it gives the sum of the two block
  idempotents, and `θ(e) = 1`.
- The inverse `w ↦ e w e` is only inverse on the centre: for the noncentral `w = E^c_(12)`,
  `e w e = E^c_(11) E^c_(12) E^c_(11) = 0`, so `θ(e w e) = 0 ≠ w`.

### 6.4 Γ-side reflection kernel, crossed actions and functor comparison

Transport the **constructed** graph kernel, not an assumed Γ-side reflection equivalence. Let
K^B_(a,t) be the reflection duplex of 6.2, pulled back along φ. Define

```text
K^A_(a,t)=P⊗_B K^B_(a,t)⊗_B Q,
D(p⊗k⊗q)=(-1)^|p|p⊗d_K(k)⊗q.
```

The left A action is on P and the right A action on Q. Prove D balanced at both B interfaces,
left superlinear and right linear, and prove
`D²=l(c_A(s_a t))−r(c_A(t))` by the two center-lift identities. There is no differential term
on P or Q. Associativity comparisons have no factor permutations and hence no extra braiding
sign; the sign above and the shift comparison below must not be discarded.

The underlying Γ-side carrier is the literal

```text
A ⊕ (Ae_a⊗_ℂ e_aA)[1] ≃ A ⊕ (Λ(V)⊗_ℂ End(ρ_a)⊗_ℂ Λ(V))[1].
```

On the first summand the comparison is multiplication. On the second, the homogeneous
comparison from `p⊗u[1]⊗q` to the shifted ordinary tensor is `(-1)^|p|(puq)[1]`.
Construct it and its inverse from the same multiplication/dual-basis maps. This sign makes
the left action on the entire shifted tensor twisted by parity, and cancels the sign in D.
Hence the differential on the displayed pair is exactly

```text
D(v,w)=(-t_a μ_a(w), Δ^A_a(v)).
```

Here μ_a:Ae_a⊗e_aA→A is actual multiplication, and Δ^A_a is a computed A-bimodule map. To
construct it, embed the known graph coevaluation `d_K(e)∈(Be_a⊗e_aB)[1]`, remove the displayed
shift using the pinned comparison, and put
`η_a=Σ_j p_j · (φ-pullback of Δ_a(1_Z)) · q_j` in Ae_a⊗e_aA. The actions in this formula
are the ordinary unshifted outer actions. Set `Δ^A_a(v)=vη_a=η_av`; prove the equality from
the B-bimodule property and the full-idempotent identities. The graph Δ_a of 6.2 already
contains ε_a, so do not insert an additional arbitrary sign or use unsigned ordinary
coevaluation in its place. Recover this formula by applying D to
`Σ_j v p_j⊗e⊗q_j`; the two `(-1)^|vp_j|` factors cancel. Prove both components of the
curvature identity, including on the shifted summand, rather than checking only its value on1.

Make the exterior-skew action explicit. With bases adapted to e_a, use
`Ae_a≃Λ(V)⊗ρ_a`, `(α#s)e_a↦α⊗ρ_a(s)v_1`, and
`e_aA≃ρ_a*⊗Λ(V)` using group-first normal order on the latter. Then
`v⊗f↦(w↦f(w)v)` identifies the middle tensor with End(ρ_a). On
`α⊗T⊗β` the unshifted actions are

```text
γ·(α⊗T⊗β)=(γα)⊗(ρ_a(γ)T)⊗β,
(α⊗T⊗β)·γ=α⊗(Tρ_a(γ))⊗(γ⁻¹β),
u·(α⊗T⊗β)=(u∧α)⊗T⊗β,
(α⊗T⊗β)·u=α⊗T⊗(β∧u)             (u∈Λ(V)).
```

The shifted summand twists the last two **left** formulas by `(-1)^|u|`; group actions
remain unchanged and the right actions remain unsigned. The matrix/group Fourier formula
also pins multiplication without choosing an unrelated endomorphism carrier:

```text
μ_a(α⊗T⊗β)
  =(δ_a/|Γ|) Σ_γ Tr(ρ_a(γ⁻¹)T) · ((α∧γβ)#γ).
```

This follows by inserting the actual inverse Wedderburn matrix block between α and β. Compute
η_a in these same coordinates from its finite matrix-unit/graph-coevaluation expression.
These are equalities inside the fixed corner/Wedderburn normalization. Prove their explicit
comparison with the endpoint-normalized presentation in 6.5, including dimension,
volume and parameter factors. The algebraic reflection/Weyl application has the full
§9.3 functorial outputs through these constructed comparisons. Equality to a literal
source adjoint with no specified pairings is not one of these mathematical identities. Geometric variety/sheaf claims keep their separate scope.

Give the adjoint convention explicitly rather than importing the word “adjoint” without a
pairing. Let τ_B be the ordinary zigzag Frobenius trace pulled back through φ and put
`τ_A(v)=τ_B(Σ_j q_j v p_j)`. Prove that this is a nondegenerate symmetric degree-minus-two
Frobenius trace, restricting to τ_B on B. On `U_a=Ae_a⊗e_aA` choose the nondegenerate pairing

```text
⟨p⊗q,p'⊗q'⟩_a=ε_a τ_A(qp')τ_A(q'p),
⟨v,w⟩_A=τ_A(vw).
```

Prove `⟨μ_a(u),v⟩_A=⟨u,Δ^A_a(v)⟩_a` by the finite dual bases. In the direct sum of the
U_a, make the distinct a blocks orthogonal. Under the actual inverse-Wedderburn identification
with `ΛV⊗ℂ[Γ]⊗ΛV`, this defines a concrete Δ^Γ adjoint to multiplication and proves
`(1⊗π_a⊗1)Δ^Γ=Δ^A_a`, with `d_1=m(1⊗ι_a⊗1)=μ_a`. This constructs the normalized Γ-side adjoint and identifies it with the independently
transported graph kernel. Prove the pairing-matrix and coefficient-rescaling comparison
of 6.5, not equality to an unspecified source adjoint. The §9.3 display of the source specifies no pairings for Δ.
Their Section 6 Δ_a is separately specified on1. Keep that graph map, the chosen Γ adjoint
and the proved normalized comparison distinct.

For every curved M construct the actual natural isomorphism

```text
e(K^A_(a,t)⊗_A M) ≃ K^B_(a,t)⊗_B eM,
e(p⊗k⊗q)⊗m ↦ ((ep)k)⊗(qm),
k⊗n ↦ (e⊗k⊗e)⊗n.
```

Also construct `K^A_(a,t)⊗_A E_t(N)≃E_(s_a t)(K^B_(a,t)⊗_B N)` by associating the tensors
and multiplying Q⊗_A P→B; write its homogeneous tensor formula and check both differential
terms. Prove naturality on degree-zero morphisms, compatibility with the signed homotopies,
the extension-module descriptions and Φ₂. As the graph tensor functor sends extension
projectives to extension projectives, this conjugate does too; hence both comparisons descend
to the honest stable quotients as well as the homotopy quotients. Transport the constructed
graph inverse, commuting, braid and orbit-wide generic square isomorphisms through these
specific comparisons, with their units/associators coherent. At t_a=0 the kernel still has the
displayed differential and curvature identity; do not claim that its reflection functor is an
equivalence there. Only the nonzero and orbit-wide generic hypotheses give those
conclusions.

Retain Section 9.3's algebraic restriction comparison as well. Restriction along
`A↪Ã_(c_A(t))` descends to `R_t:Mod₂(Ã_(c_A(t)))→Mod₂(A)` because the actual extension is
free of rank2 over A. On morphisms it is the same underlying A-linear map. The canonical
natural transformation `R_(s_a t) R_a→R_t` has component the stable class of
`K^A_(a,t)⊗_A M→M, (v,w)⊗m↦vm`. It is an A-linear map after forgetting d; no false chain-map
claim is made. Its kernel is the parity-twisted `Ae_a⊗_ℂ e_aM`, hence projective as an A-module
(also for arbitrary dimension, by a vector-space basis). The split inclusion of the A summand
therefore makes this comparison an isomorphism in the actual stable A-module category.
Prove naturality and compatibility with the above Morita/Φ₂ comparisons. For a fixed
degree-zero Γ-module W on which positive exterior degree acts by0, define the algebraic
framed stable pairs `(M,u:W≃R_t(M))`, with pair morphisms satisfying `u₂=R(j)u₁`.
Transport u by the inverse of this natural stable isomorphism to obtain the framed reflection
action. Check that the chosen inverse/commuting/braid intertwiners commute with these projection
classes (using their actual unshifted components), so the relations hold on framed pairs;
unframed natural isomorphisms alone do not prove that extra compatibility.
This is the algebraic restriction/framing output; identifying its classes with a
Nakajima variety or with the geometric κ_a under the source's Theorem 5/Proposition 9.1 is a
separate source boundary, not a premise or a newly claimed geometric theorem here. Any
separately used torsion-free representative subcategory must keep its actual predicate and
preservation proof; a stable isomorphism alone is not asserted to prove that property.

Acceptance must recover both directions under e(-)/E, the native-coind comparison, the
crossed action/μ_a formulas and **both** curvature components on named binary examples,
including the binary-icosahedral input. Changing adapted matrix bases must give the explicit
conjugating kernel isomorphisms and parameter maps, not new unrelated reflection data. Odd
cyclic groups keep their actual skew-corner/Koszul/geometric targets; no bipartite graph
reflection is inferred. The singleton exterior algebra and C₂ double-edge boundary also
retain their actual algebras and targets assigned to them in Layers 3–5 without being coerced into a
simple-graph kernel. No new geometric McKay, subgroup-classification or late derived-Morita
result is a premise of this finite full-idempotent construction.

*Needs:* 6.2, 6.3.

**Checks.**

- The Fourier formula gives `μ_a(1 ⊗ id_(ρ_a) ⊗ 1) = (δ_a/|Γ|) Σ_γ χ_a(γ⁻¹) γ`, the primitive
  central idempotent of `ρ_a`, which is idempotent; without the factor `δ_a` it would be that
  idempotent divided by `δ_a`, not idempotent for `δ_a > 1`.
- Dimensions agree on the displayed carrier: `Ae_a ≅ Λ(V) ⊗ ρ_a` and `e_aA ≅ ρ_a∗ ⊗ Λ(V)` have
  dimension `4δ_a` each, so `Ae_a ⊗_ℂ e_aA` has dimension `16 δ_a²`, as does
  `Λ(V) ⊗ End(ρ_a) ⊗ Λ(V)`.
- At `t_a = 0` the kernel has differential `(0, Δ^A_a)` and `D² = 0`, which equals
  `l(c_A(s_a t)) − r(c_A(t))` because `s_a t = t` and `c_A(t)` is central; the functor is defined
  there but is not claimed to be an equivalence.

### 6.5 The endpoint-weighted Γ-realization, coordinate dictionary and comparison theorem

Construct the endpoint-weighted Γ-realization and prove its equivalence to the actual
Layer 4 corner and the transported graph reflection kernels. Its reflection, Weyl,
curvature, stable/homotopy, restriction and framing outputs are all required. The theorem
uses explicitly constructed intertwiners and bilinear forms; its comparison is between
these defined mathematical objects. Separately prove the unequal-endpoint obstruction
to the literal raw-scalar antisymmetry, as specified below. No equality with undefined or incompatible choices in the source is claimed.

For adjacent irreducibles write δ_i=dim ρ_i. Given nonzero equivariant maps
`φ_ab:ρ_b→V⊗ρ_a` and `φ_ba:ρ_a→V⊗ρ_b`, define c_ab and c_ba by the actual ordered-volume
composites

```text
π(1⊗φ_ba)φ_ab = c_ab Ω⊗id_(ρ_b),
π(1⊗φ_ab)φ_ba = c_ba Ω⊗id_(ρ_a).
```

Here π is the exterior quotient on the two V factors, with the same Ω and tensor order in
both formulas. Prove by expanding x/y coefficients and cyclicity of the two rectangular
matrix traces that `δ_b c_ab = −δ_a c_ba`. The scalars act on different endpoint spaces;
Schur's lemma does not identify their ordinary traces. Define the trace-weighted coefficients
`ε̂_ab=δ_b c_ab`, `ε̂_ba=δ_a c_ba`; these, rather than the unweighted scalar composites,
are antisymmetric. Prove that the wedge pairing between the two one-dimensional edge Hom
spaces is perfect, using determinant self-duality and semisimplicity. For each unoriented
edge choose one of its nonzero maps and rescale the other by an explicitly computed nonzero
scalar so that `ε̂_ab=σ_ab=ε_b∈{1,−1}`, where ε_b is the bipartite colour of 6.2 of
the domain vertex b, and `σ_ba=ε_a=−ε_b`. Then the endpoint-weighted scalar version of
the endpoint formulas is `c_ab=σ_ab/δ_b`, `c_ba=σ_ba/δ_a`. Construct the maps and their
inverse rescalings, not a field asserting these equations. This target uses the
binary/simple-graph scope; multiplicity-two and odd-cycle cases retain their separate targets.

As an explicit unequal-endpoint test use the trivial and defining two-dimensional irreducible
of Q₈. Take `φ_ab(v)=v⊗1` and `φ_ba(1)=y⊗x−x⊗y`. With the stated order the two composites
are `Ω⊗id_V` and `−2Ω⊗id_ℂ`; their ordinary scalars are1 and−2, while their trace-weighted
coefficients are2 and−2. Scaling φ_ba by1/2 gives the normalized coefficients1 and−1. Recover
this test from the actual representations, not just an abstract dimension counterexample.
Prove also that no nonzero rescalings of this pair satisfy both the raw ordered-composite
definitions and unweighted antisymmetry: rescaling multiplies1 and−2 by the same nonzero
product. This is a counterexample to that literal ordinary-scalar interpretation. The
endpoint-weighted construction retains the weighted equation and all reflection outputs.

Give the coordinate change on actual module intertwiners with its carrier and sign.
Let `W=⊕_i ρ_i⊗E_i`, where E_i are graded complex multiplicity spaces, and let the odd
Γ-equivariant map `D:W→V⊗W` be the finite edge sum `φ_ab⊗x_ab`, with degree-zero maps
`x_ab:E_b→E_a` (the V factor has degree 1). On `M=Λ(V)⊗W` extend it by
`d(α⊗w)=(-1)^|α| α∧D(w)`. Prove superlinearity and all Γ/module/grading identities.
This is the explicit exterior-free linear-generator presentation; the arbitrary curved
modules and equivalences of 6.3 retain their full scope and are not assumed exterior-free.
No new finite-dimensionality assumption is imposed on E_i. Put `φ̂_ab=s_ab φ_ab`, with nonzero s_ab and
the normalized reverse choices above. Define the raw source-style auxiliary coordinate
`y_ab=c_ab x_ab` and the normalized coordinates by

```text
ĉ_ab=s_ab s_ba c_ab,             ε̂_ab=δ_b ĉ_ab,
x̂_ab=s_ab⁻¹ x_ab,               ŷ_ab=ε̂_ab x̂_ab=δ_b s_ba y_ab;
x_ab=s_ab x̂_ab,                 y_ab=(δ_b s_ba)⁻¹ ŷ_ab.
```

These are linear coordinate isomorphisms on the finite family of edge-coordinate spaces,
with the displayed inverses; no finite-dimensionality of the multiplicity spaces is needed. They
preserve the total odd map `Σ φ_ab⊗x_ab`. The dimension factor is δ_b because the
ordered composite acts on ρ_b, not on ρ_a. Compute the square of the displayed
superlinear extension, including its Koszul sign:
`d²|_W=−π(1⊗D)D`. Therefore the curvature equation `d²=ΩΣ_b f_b z_b` and its
transformed moment equation are precisely

```text
Σ_(a adjacent b) c_ab x_ba x_ab = −f_b id_(E_b)
    ⇔ Σ_(a adjacent b) x̂_ba ŷ_ab = λ_mom,b id_(E_b),
λ_mom,b=−δ_b f_b=−δ_b κ_b t_b,
f_b=−λ_mom,b/δ_b,                t_b=−λ_mom,b/(δ_b κ_b).
```

Here function products mean composition with the rightmost map first. The transformed
left side equals δ_b times the original left side term by term, because the reverse
s_ba cancels. Prove the off-diagonal square components vanish by the actual determinant
intertwiner calculation, and prove the simultaneous moment equations and their inverse
transport. Conversely the moment equations give this displayed curvature for the
constructed exterior-free module. The separately named CBH trace coordinate remains
`λ_CBH,b=δ_b f_b=−λ_mom,b`; these sign conventions are not identified by notation.
With `t_b=−ζ^Q_b` and `ζ^Γ_b=f_b`, this gives
`λ_mom,b=δ_b κ_b ζ^Q_b=−δ_b ζ^Γ_b`.
This proves the weighted `y=ε̂x` relation and the actual block/trace/graph parameter
conversion, without attributing these weighted coefficients to the raw source display.

Keep the module and arrow conventions separate in the comparison. The maps x_ab are
coefficients of D on W, and point b→a; they are not the action of a_ab on W. The actual
left corner module is `e(Λ(V)⊗W)`, with corner arrows acting through the exterior/skew
module action and differential induced by d. Construct its maps and inverse presentation
using the actual matrix units and determinant currying; compute every arrow action and
D coefficient there. If the coefficient presentation is expressed by right/opposite-quiver
modules, construct its reversal/opposite-algebra and grading adapter to this left module,
with both inverse equations and all relations. Do not identify W with eM or reverse the
support of a_ab by renaming. The full 6.3 Morita comparison applies to M, and its restriction
to these exterior-free presented objects must agree with the constructed coordinate maps.

Compare this normalized presentation with the **actual** Layer 4 corner map φ. Compute each
degree-one change-of-basis scalar from the finite intertwiner matrices, and each degree-two
volume scalar from `φ⁻¹(X_i)=κ_i Ωe_i`. Prove the arrow-product and vertex-volume equations
on the actual path generators, and extend to the presented graded algebras. Give the inverse
map and its equations, including the colouring `X_i=ε_iY_i`; ε_i is the vertex colour and
must not be confused with the endpoint symbol ε̂_ab. In the matrix-unit extraction of
normalized intertwiners compute the actual arrow factor r_ab relative to the fixed
corner arrow `a_ab∈e_b A_1 e_a`, pointing a→b: the pinned corner formula is
`e_j A_1 e_i≃Hom_Γ(ρ_j,V⊗ρ_i)`, so φ_ab has this support, not e_a A_1 e_b.
Prove on generators that
`â_ab â_ba=r_ab r_ba a_ab a_ba`; this backtrack is at b. Every incident backtrack there must give
the same vertex volume before using the ordinary zigzag presentation. Thus its new
volume coefficient is `κ̂_b=r_ba r_ab κ_b`, independent of the incident edge by those
proved relations. Give the actual finite matrix coefficient formula for each r_ab,
with a nonzero entry fixing the one-dimensional Hom comparison, and its inverse.
The same central curvature has new graph coordinates
`t̂_b=(κ_b/κ̂_b)t_b`, with inverse `t_b=(κ̂_b/κ_b)t̂_b`. Prove this diagonal coordinate
change conjugates the old reflection to the new one. Do not identify a Hom scalar,
a primitive-corner arrow factor and a volume coefficient without these extraction laws.
In curvature coordinates retain
`f_i=κ_i t_i`, `t_i=−ζ^Q_i` and `λ_i=δ_i f_i`. Thus the actual scalar reflection is

```text
f_i' = f_i + (κ_i/κ_a) f_a (Adj(a,i)−2[i=a]).
```

Prove the corresponding formula after any normalized arrow/volume change, rather than calling
it the unweighted reflection without computing the diagonal coordinate conjugation. The
finite group-sum multiplication and center formulas of 6.3–6.4 remain the formulas to match.

Make the comparison of adjoints equally explicit. All pairings in this normalized realization
are the complex-bilinear Frobenius pairings specified in 6.4. In homogeneous adapted bases let
M be the matrix of μ_a, and G_A,G_U the matrices of those pairings. Prove the adjoint formula
`D=G_U⁻¹ MᵀG_A`. Given another explicit presentation with multiplication M', pairings H_A,H_U
and invertible homogeneous coordinate maps C_A,C_U, prove

```text
M'C_U=C_AM,
G_A=C_AᵀH_AC_A,  G_U=C_UᵀH_UC_U
    ⇒ D'C_A=C_UD,  where D'=H_U⁻¹(M')ᵀH_A.
```

Construct the normalized source-shaped pairings by transporting the actual 6.4 forms through
the computed exterior/Wedderburn maps; compute their block matrices and trace/dimension
weights. This supplies explicit nondegenerate H_A,H_U satisfying these equations and an
actual comparison, not a hypothesis that an unnamed source adjoint has them. For pairings
scaled by α on A and β_a on the a tensor block, compute the resulting adjoint factor
`r_a=α/β_a` (these scalars are nonzero). The diagonal kernel map `(v,w)↦(v,r_a w)` intertwines
`(−t_a μ_a,Δ_a)` with `(−(t_a/r_a)μ_a,r_aΔ_a)`. Carry this coefficient change together with
the calculated volume/curvature coordinates; never change an adjoint alone and claim the same
unadjusted reflection parameters. A sesquilinear convention requires its explicit conjugation
adapter and is not identified with the bilinear transpose by terminology alone.

Use these generator, pairing and coefficient equations to construct a graded curved kernel
isomorphism between the normalized exterior-skew duplex and `P⊗_B K^B⊗_B Q`, with its actual
inverse, both curvature components and left/right actions. Prove the induced tensor-functor
natural isomorphisms on modules and morphisms, their stable/homotopy/Φ₂ compatibilities, and
the unit/associator/braid/commuting/inverse comparisons at the stated nonzero and orbit-generic
parameters. Their unshifted component is the identity after C_A transport, so check explicitly
that the restriction projections and framed relation intertwiners agree. The zero-parameter
kernel and odd-cycle/singleton/double-edge boundaries retain exactly their meanings in Layers 3–5.

The comparison theorem is between the endpoint-weighted Γ-realization,
the actual graded corner and the graph kernel with the explicit parameter conversions
above. Prove both left and right curvature components after every arrow, volume and
adjoint coefficient change; the two bimodule actions are not interchangeable. The
unnormalized module coordinates remain available through the exact inverse dictionary.
Together with 6.3–6.4 this constructs the complete algebraic §§8–9 reflection outputs,
including their natural, stable, homotopy, restriction and framed comparisons.

The source display in [FKS05, §8.3] (arXiv preprint p. 30) asserts the antisymmetry
`ε(h) + ε(h̄) = 0` for the raw ordered composites; the `Q₈` test above shows that it holds for
the trace-weighted coefficients and fails for the raw scalars, which is why the realization here
is endpoint-weighted. The adjoint in this theorem is the Frobenius adjoint of 6.4 with the
Gram/coefficient comparison above.

Only the algebraic material in FKS §§2--4, 6, 8.1--8.3 and 9.3 is in scope.  Their variety and
sheaf interpretations are not.

*Needs:* 6.3, 6.4, 4.1.

**Checks.**

- For `Q₈` with `φ_ab(v) = v ⊗ 1` and `φ_ba(1) = y ⊗ x − x ⊗ y`, the ordered composites are
  `Ω ⊗ id_V` and `−2 Ω ⊗ id_ℂ`, so `c_ab = 1`, `c_ba = −2`; the trace-weighted coefficients are
  `δ_b c_ab = 2 · 1 = 2` and `δ_a c_ba = 1 · (−2) = −2`, antisymmetric, while the raw scalars `1`
  and `−2` are not, and no common rescaling makes them so.
- The diagonal kernel map `(v, w) ↦ (v, r w)` intertwines `(−t_a μ_a, Δ_a)` with
  `(−(t_a/r) μ_a, r Δ_a)`: on `(v, w)` the second differential gives `(−(t_a/r) μ_a(r w), r Δ_a(v))
  = (−t_a μ_a(w), r Δ_a(v))`, the image of `D(v, w)`; changing `Δ_a` alone without `t_a` would not
  commute.
- With all `κ_i` equal the scalar reflection `f_i' = f_i + (κ_i/κ_a) f_a (Adj(a,i) − 2[i=a])` is the
  graph reflection `s_a` in the `f` coordinates; with `κ_c = 2κ_l` at the centre `c` and a leaf `l`
  of `D̃₄`, reflecting at `l` changes `f_c` by `2 f_l`, not `f_l`.

### Examples

Over the zigzag algebra of the four-cycle (the McKay graph of `C₄`) with colouring `i mod 2` and
`c = Σ_i x_i X_i` with every `x_i ≠ 0` along the orbit, the four reflection functors generate an
action of the affine Weyl group of `Ã₃` on the orbit category; transported through 6.3–6.5 this is
an action on the stable categories of the exterior skew-group algebra of `C₄`.

### Dependencies

Layers 3–4; DGAInfinity; StablePeriodicCurved; ZigzagPreprojective; CharacterTheory; Tau Ceti
`IsIdempotentElem.cornerEquivalence`; [FKS05, §§2–4, 6, 8.1–8.3, 9.3].


## Layer 7: finite geometric McKay correspondence

This layer treats every finite subgroup `Γ` of `SU(2)` and, through the conjugacy of Layer 0, every
finite subgroup of `SL₂(ℂ)`. It uses Layers 0–2 and its geometric suppliers; Layers 3–6 do not use
it. All schemes are over `ℂ`. Write `V = ℂ²` with the restricted defining representation and
`S = Sym_ℂ(V∗) ≅ ℂ[x, y]` with the contragredient action `(g · f)(v) = f(g⁻¹ v)`.

### 7.1 The quotient and its conjugation maps

Identify `S` with `MvPolynomial (Fin 2) ℂ`, preserving the two coordinate functions, and take
`X_Γ = Spec S^Γ` with `S^Γ = FixedPoints.subalgebra` and the quotient map `q : V → X_Γ` of
`TauCeti.AffineInvariantQuotient`. The comparison with the `Sym(V)` of Layers 3–5 is the
equivariant isomorphism `V ≅ V∗` given by the determinant pairing, extended to symmetric algebras
and, with the identity on `Γ`, to the skew-group algebras; it is an isomorphism, not an equality.

- `S^Γ` is a finitely generated normal domain and `S` is finite over it (ReflectionInvariantTheory
  §1); `q` is finite and surjective, and its fibres over closed points are the `Γ`-orbits.
- `Γ` acts freely on `V ∖ {0}`: a finite-order matrix in `SL₂(ℂ)` is diagonalizable, and an
  eigenvalue `1` forces both eigenvalues to be `1`. On `V° = V ∖ {0}` the map `Γ × V° → V° ×_(X°) V°`
  is an isomorphism, so `V° → X°` is a finite étale `Γ`-torsor and `X_Γ` is smooth away from `q(0)`.
- An element `g ∈ GL₂(ℂ)` conjugating `Γ` to `Γ'` induces a graded isomorphism `S^Γ ≅ S^(Γ')` and an
  isomorphism `X_Γ ≅ X_(Γ')` compatible with `q`, functorially in `g`.

*Needs:* Layer 0, ReflectionInvariantTheory §1, SchemeAndStackFoundations §1.17, Tau Ceti
`TauCeti.AffineInvariantQuotient`, Mathlib `FixedPoints.subalgebra`, `MvPolynomial`.

**Checks.**

- For `Γ = 1`, `S^Γ = S`, `X_Γ = V` and `q` is the identity.
- For `Γ = C₂ = {±I}`, `S^Γ = ℂ[x², xy, y²]`, and the fibre of `q` over `q(0)` is the nonreduced
  point `Spec S/(x², xy, y²)` of length `3` (basis `1, x, y`), not `|Γ| = 2`: `q` is not flat at
  `0`, which is why flatness is claimed only on `V°`.
- The scalar matrix `−I ∈ GL₂(ℂ)` has eigenvalue `−1` twice and fixes no nonzero vector, while
  `diag(1, −1)` (determinant `−1`) fixes the first axis: the determinant-one hypothesis is what makes
  the action free on `V°`.

### 7.2 Invariant presentations

Give homogeneous invariants and mutually inverse `ℂ`-algebra isomorphisms between `S^Γ` and the
coordinate ring of the following hypersurfaces, matched to the finite type obtained from the McKay
matrix by deleting the trivial vertex.

| Γ model | quotient hypersurface | finite type |
| --- | --- | --- |
| cyclic of order `n ≥ 1` | `XY − Zⁿ` | `A_(n−1)` (smooth for `n = 1`) |
| binary dihedral of order `4m`, `m ≥ 2` | `X² + Y²Z + Z^(m+1)` | `D_(m+2)` |
| binary tetrahedral | `X² + Y³ + Z⁴` | `E₆` |
| binary octahedral | `X² + Y³ + YZ³` | `E₇` |
| binary icosahedral | `X² + Y³ + Z⁵` | `E₈` |

For cyclic `Γ` take `X = xⁿ`, `Y = yⁿ`, `Z = xy`: a monomial `xᵃyᵇ` is invariant exactly when
`a ≡ b mod n`, and its normal form in `X, Z` or `Y, Z` gives generation and the standard-monomial
basis of `ℂ[X, Y, Z]/(XY − Zⁿ)`. For `n = 1`, `Z` is eliminated and the quotient is `ℂ[x, y]`.

For the binary dihedral model with `r = diag(exp(πI/m), exp(−πI/m))` and `s = !![0,1;−1,0]`, the
contragredient action of `s` on coordinate functions is `(x, y) ↦ (−y, x)`. With `A = x^(2m)`,
`B = y^(2m)`, `w = xy`, the generator `s` swaps `A, B` and sends `w ↦ −w`; hence `Y = A + B`,
`Z = w²`, `X = w(A − B)` are invariant and satisfy `X² = Z(Y² − 4Z^m)`. The decomposition into parts
symmetric and antisymmetric in `A, B` gives generation, a standard-monomial argument gives the
kernel, and an explicit rescaling of `X, Y, Z` by nonzero constants gives the displayed normal form.
The degenerate `m = 1` presentation is that of `C₄` and belongs to `A₃`.

For the three exceptional groups, prove that there are homogeneous invariants of degrees
`(6, 8, 12)`, `(8, 12, 18)` and `(12, 20, 30)` respectively that generate `S^Γ` and satisfy, after a
linear change of coordinates, exactly the displayed relation, and that the induced map from the
hypersurface ring is an isomorphism (Springer, *Invariant theory*, LNM 585, §4.5). A route: the two
lowest-degree invariants are algebraically independent, `S^Γ` is free over the polynomial ring they
generate with basis `1` and the third invariant, and the Hilbert series of the hypersurface ring
equals Molien's series degree by degree. *Needs:* 7.1, Layer 0 (the coordinate models),
ReflectionInvariantTheory §1 (Molien's formula), GroebnerGeometry G1 (standard monomials).

**Checks.**

- For `Γ = C₂`, Molien's series `½(1/(1 − t)² + 1/(1 + t)²) = (1 + t²)/(1 − t²)²` equals the Hilbert
  series of `ℂ[X, Y, Z]/(XY − Z²)` with all generators in degree `2`; a presentation missing `Z`
  would have series `1/(1 − t²)²`.
- For `Q₈` (`m = 2`) at `x = 1`, `y = 2`: `A = 1`, `B = 16`, `w = 2`, so `Y = 17`, `Z = 4`,
  `X = −30`, and `X² = 900 = 4 · (289 − 64) = Z(Y² − 4Z²)`.
- The exceptional relations are homogeneous of degree twice the top invariant degree:
  `24 = 2 · 12 = 3 · 8 = 4 · 6` for `E₆`, `36 = 2 · 18 = 3 · 12 = 12 + 3 · 8` for `E₇`,
  `60 = 2 · 30 = 3 · 20 = 5 · 12` for `E₈`. Freeness over the two lowest invariants forces their
  degrees to multiply to `2|Γ|` (compare the pole of order two of Molien's series at `t = 1`):
  `6 · 8 = 48`, `8 · 12 = 96`, `12 · 20 = 240`.

### 7.3 The minimal resolution

Pull back NilpotentOrbits N8's explicit resolution of the hypersurface of 7.2 along the isomorphism
of 7.2 to obtain `π_Γ : Y_Γ → X_Γ`: `Y_Γ` is smooth, `π_Γ` is proper and birational, an isomorphism
over `X_Γ ∖ {q(0)}`, and its exceptional curves are copies of `P¹` with self-intersection `−2`
whose intersection matrix is the negative of the finite Cartan matrix. It is the minimal
resolution, since no exceptional curve has self-intersection `−1`. For `Γ = 1`, `Y = X = ℂ²` and
`π = id`, with empty exceptional set. The completed-local comparison with a subregular slice is
NilpotentOrbits N8's and is not replaced by a global isomorphism. *Needs:* 7.2, NilpotentOrbits
N6–N8.

**Checks.**

- For `Γ = C₂`, `Y` is the total space of `O(−2)` over `P¹`, the blowup of `XY = Z²` at the origin,
  with one exceptional curve of self-intersection `−2`.
- For `C₃`, two exceptional curves meet in one point and the intersection matrix is
  `!![-2,1;1,-2]`, the negative of the `A₂` Cartan matrix; the number of curves is the number of
  nontrivial irreducibles, `2`.
- For `Γ = 1` the exceptional set is empty and the intersection lattice is zero, matching the empty
  finite type of the `1 × 1` McKay matrix `(2)`.

### 7.4 `Γ`-clusters and the resolution

A `Γ`-cluster is a `Γ`-invariant subscheme `Z ⊂ V` of length `|Γ|` whose coordinate ring is the
regular representation. Define the scheme of `Γ`-clusters `Γ-Hilb(V)` inside the Hilbert scheme of
`|Γ|` points of `V`, as the locus of `Γ`-fixed points whose universal quotient has the isotypic
ranks `δ_i`, with its universal finite flat family `Z → Γ-Hilb(V)`; the invariant summand is
generated by `1` and gives the morphism `Γ-Hilb(V) → X_Γ`.

- `Γ-Hilb(V)` is irreducible and the morphism to `X_Γ` is a crepant resolution, hence the minimal
  resolution (Bridgeland–King–Reid [BKR01, Theorem 1.2, p. 4], which covers dimension two; the case
  of `SL₂(ℂ)` is due to Ito and Nakamura, cited there).
- On the charts of `Y_Γ` from 7.3, construct `Γ`-stable ideals of `O_Y ⊗ S` whose quotient is locally
  free of rank `|Γ|` with the regular isotypic ranks, glue them, and obtain `Y_Γ → Γ-Hilb(V)` over
  `X_Γ`; prove it is an isomorphism.

*Needs:* 7.3, SchemeAndStackFoundations §4.14 (Hilbert schemes), AlgebraicVectorBundles L0. The
first bullet is the source theorem; the second is the explicit comparison built here, whose inverse
is supplied by the first bullet together with the separatedness of both sides over `X_Γ`.

**Checks.**

- For `Γ = 1`, a `Γ`-cluster is a point, `Γ-Hilb(V) = V = Y` and the universal family is the
  diagonal.
- For `Γ = C₂`, on the chart with coordinates `(a, b)` the ideal `(y − a x, x² − b)` has quotient
  with basis `1` (trivial) and `x` (sign); it maps to `(x², xy, y²) = (b, ab, a²b)` in `X_Γ`. For
  `b ≠ 0` it is the free orbit of `(√b, a√b)`, and `b = 0` is the exceptional curve with coordinate
  `a`. The ideal `(x², xy, y²)` is not a `Γ`-cluster: its quotient has length `3`.
- Over `ℂ[ε]/(ε²)` the families `(y − εx, x²)` and `(y, x² − ε)` are `Γ`-clusters deforming
  `(y, x²)` along the exceptional curve and transversally; the tangent space at `(y, x²)` is
  two-dimensional, the dimension of `Y`.

### 7.5 Tautological bundles and the exceptional lattice

Let `R = p_* O_Z` be the universal algebra on `Y = Γ-Hilb(V)`, a locally free sheaf of rank `|Γ|`.
Finite-group averaging gives `R ≅ ⊕_i ρ_i ⊗ T_i` with `T_i = Hom_Γ(ρ_i, R)` locally free of rank
`δ_i` and `T_trivial = O_Y`.

- There is a bijection `b` from the nontrivial irreducibles to the exceptional curves such that
  `deg det(T_i)|_(E_(b(j))) = δ_ij` for nontrivial `i, j`; moreover `T_i` restricted to `E_(b(i))`
  is `O(1) ⊕ O^(δ_i − 1)` and is trivial on the other exceptional curves (Kapranov–Vasserot
  [KV00, §2.1, Lemma, p. 5], attributing the degree computation to Gonzalez-Sprinberg–Verdier
  [GSV83]). The sign is positive for this convention `Hom_Γ(ρ_i, R)`; the dual bundles have degree
  `−δ_ij`.
- Under `b`, the curves satisfy `E_(b(i)) · E_(b(j)) = −(2δ_ij − M_ij)` for nontrivial `i, j`
  (Kapranov–Vasserot [KV00, §2.1, Proposition, p. 5] for the incidence; NilpotentOrbits N8 for the
  self-intersections).
- The map from the quotient of Layer 2, `R_ℂ(Γ)/ℤ[ℂ[Γ]]`, to the free lattice on the exceptional
  curves sending `[ρ_i]` to `E_(b(i))` for nontrivial `i` and the trivial class to
  `−Σ_(i≠0) δ_i E_(b(i))` is an isomorphism carrying the McKay form to minus the intersection form.
- For `Γ ≠ 1`, the cycle `Z_Γ = Σ_(i≠0) δ_i E_(b(i))` is the numerical fundamental cycle: the unique
  nonzero effective exceptional cycle with `Z · E ≤ 0` for every exceptional curve `E` that is
  coefficientwise minimal with this property (existence and uniqueness: Reid [Rei97, §4.5,
  Proposition, p. 84]). Route: `Z_Γ · E_(b(j)) = −M_(j,0) ≤ 0` because `Cδ = 0` and `δ_0 = 1`, so `Z_Γ` is anti-nef. For
  minimality, if `Z` is anti-nef, `Y ≤ Z` and `Y · E > 0` for an exceptional curve `E`, then `E`
  occurs in `Z − Y` (otherwise `Z · E ≥ Y · E > 0`), so `Y + E ≤ Z`. Starting from one curve and
  adding curves with positive intersection, every step stays below every anti-nef cycle; in root
  coordinates each step adds a simple root `α` to a root `β` with `⟨β, α⟩ = −1`, so all steps are
  positive roots, and the process stops exactly at a dominant root, which is the highest root
  (RootSystems: in an irreducible simply-laced root system the highest root is the only dominant
  root). Its coefficients are the marks `δ_i` (Layer 1), so `Z_Γ` is below every nonzero effective
  anti-nef cycle. For `Γ = 1`
  the exceptional set is empty and no cycle is asserted.

*Needs:* 7.4, Layer 2 (`rootLatticeQuotientMap` and the McKay form), AlgebraicVectorBundles L0
(determinants), SchemeAndStackFoundations §5.1–5.3 (degrees on proper curves).

The root-lattice quotient is not a quotient of `K₀(Y)` by the class of `R`, which has rank `|Γ|`
and is nonzero in `K₀(Y)`, and the assignment `[ρ_i] ↦ [T_i]` is additive, not asserted to be
multiplicative.

**Checks.**

- For `Γ = C₂` on the chart of 7.4, the sign summand of `R` along the exceptional curve is the
  quotient of the trivial bundle `V∗ ⊗ O` by the tautological line of linear forms vanishing on the
  cluster, which is `O(1)` on `P¹`: degree `+1`. The convention `Hom_Γ(R, ρ_i)` would give `−1`.
- For `Q₈`, `Z = 2E_c + E_1 + E_2 + E_3` has `Z · E_c = −4 + 3 = −1` and `Z · E_k = 2 − 2 = 0`, so it
  is anti-nef; the smaller `E_c + E_1 + E_2 + E_3` has `(·) · E_c = −2 + 3 = 1 > 0` and is not.
- For `C₂`, the single curve `E` with `E² = −2` is the fundamental cycle (`δ_sign = 1`), the trivial
  class maps to `−E` and the sign class to `E`; `(−E)² = −2` is minus the McKay norm `2` of the
  trivial class, matching the Layer 2 Check.

### 7.6 The Lie comparison

For the finite ADE root system obtained from Layers 1–2, extended to `ℂ`, consume
`RootPairing.GeckConstruction.lieAlgebra`, `RootPairing.GeckConstruction.equivRootSystem` and
`RootPairing.GeckConstruction.equivLieAlgebra` with their hypotheses; the trivial group gives the
zero Lie algebra. Prove that the index maps of 7.5 (irreducibles to exceptional curves) and of
Layer 2 (irreducibles to simple roots) commute with the root-system equivalences, and compare the
marked affine matrix separately with KacMoody KM0–KM1's full affine realization, without feeding the
singular affine matrix to the finite construction. *Needs:* 7.5, Layer 2, KacMoody KM0–KM1, Mathlib
`RootPairing.GeckConstruction.lieAlgebra`.

**Checks.**

- For `C₂` the finite type is `A₁`, the Lie algebra is `sl₂` of dimension `3`, and the single
  exceptional curve corresponds to its simple root.
- For the binary icosahedral group the Lie algebra is `E₈` of dimension `248 = 8 + 240`, with `240`
  the number of norm-two vectors of the `E₈` lattice of Layer 2.
- For `Γ = 1` the root system is empty and the Lie algebra is zero, not a rank-zero simple algebra.

### Examples

For `C₃`: `X_Γ = Spec ℂ[X, Y, Z]/(XY − Z³)`, `Y_Γ` has two exceptional curves `E_1, E_2` meeting in a
point, `T_(χ_1)` and `T_(χ_2)` are line bundles of degrees `(1, 0)` and `(0, 1)` on `(E_1, E_2)`, the
fundamental cycle is `E_1 + E_2`, and the finite Lie algebra is `sl₃`.

### Dependencies

Layers 0–2; NilpotentOrbits N6–N8; ReflectionInvariantTheory §1; GroebnerGeometry G1;
SchemeAndStackFoundations §§1.17, 4.14, 5.1–5.3, 5.7; AlgebraicVectorBundles L0; KacMoody KM0–KM1;
Tau Ceti `TauCeti.AffineInvariantQuotient`; Mathlib `RootPairing.GeckConstruction.lieAlgebra`;
[BKR01]; [KV00]; [GSV83]; [Rei97].

## Downstream consumers

The McKay labelling, the representation-ring comparison and the corner theorems are inputs for
roadmaps on Kleinian singularities and their deformations, quiver varieties of affine type, and
categorical actions of affine Weyl groups; Layer 6 supplies the algebraic Weyl functors on the
skew-group side, and Layer 7 the comparison of the exceptional lattice with the root lattice.

## Worked examples

The examples are theorem-level integration tests, not prose illustrations.

### Cyclic `Ã`

For `n ≥ 3`, index irreducibles by `ZMod n`, prove
`V⊗χ_j ≃ χ_(j+1) ⊕ χ_(j-1)`, obtain the cycle matrix, `δ=(1,…,1)`, the quotient by
the diagonal vector, the two skew-group algebras, and their relative quadratic/Koszul duality.
The required `n=3` example includes the explicit skew-zigzag corner and its minus
backtrack relation. Even `n≥4` includes the specified ordinary-zigzag rescaling. Handle `n=2`
at the multiplicity-two matrix and through the Kronecker quiver in the polynomial and deformed
corner theorems, without a simple-graph zigzag identification. Handle `n=1` with `M=[2]`, zero
Cartan quotient and the one-loop quiver, where the polynomial corner is `Sym(ℂ²)` itself and the
deformed corner is the first Weyl algebra; no affine `A₀` or exceptional ordinary-zigzag
identification is imposed.

### Binary dihedral `D̃`

For general `n ≥ 2`, compute the four one-dimensional and `n-1` two-dimensional irreducibles,
the tensor rules, affine `D̃_(n+2)`, and the regular vector.  Instantiate the ordinary zigzag and
preprojective Morita equivalences and at least one nonzero deformed parameter.

### Binary icosahedral `Ẽ₈`

Give all nine irreducibles and tensor decompositions, the explicit isomorphism with the sibling
`affineE8Graph`, and the regular vector `(6,3,4,2,5,4,3,2,1)` in its numbering.  Compute
`Cδ=0`, `∑δ_i²=120`, the affine-to-finite `E₈` lattice quotient, the 34-dimensional affine
zigzag target, the polynomial/preprojective target, and, for a two-colouring of the tree, a
vertex FKS reflection functor with its curvature equation.  This is prerequisite validation only; do not attach the downstream
finiteness, higher-gluing, or categorified-`δ` claims to it.


## References


- **[McK80]** John McKay, *Graphs, singularities, and finite groups*, Proc. Sympos. Pure Math. 37
  (1980), 183--186, Props. 1--2. DOI: `10.1090/pspum/037/604577`.
- **[Ste85]** Robert Steinberg, *Finite subgroups of SU₂, Dynkin diagrams and affine Coxeter
  elements*, Pacific J. Math. 118 (1985), 587--598, §1(1)--(8).
- **[CS03]** John H. Conway and Derek A. Smith, *On Quaternions and Octonions: Their Geometry,
  Arithmetic, and Symmetry*, A K Peters, 2003, §6.5.
- **[CL18]** Jihyun Choi and Jae-Hyouk Lee, *Binary Icosahedral Group and 600-Cell*, Symmetry 10
  (2018), 326, §§2--4, especially §2.1 and Thms. 1--2. DOI: `10.3390/sym10080326`.
- **[HK01]** Ruth Stella Huerfano and Mikhail Khovanov, *A category for the adjoint
  representation*, J. Algebra 246 (2001), 514--542, §6.2--6.3, Props. 13--17, Cor. 3 and
  relation (42). DOI: `10.1006/jabr.2001.8962`; the arXiv v2 version is the one used.
- **[CBH98]** William Crawley-Boevey and Martin P. Holland, *Noncommutative deformations of
  Kleinian singularities*, Duke Math. J. 92 (1998), 605--635, §§3--4. DOI:
  `10.1215/S0012-7094-98-09218-3`.
- **[CBK22]** William Crawley-Boevey and Yuta Kimura, *On deformed preprojective algebras*, J.
  Pure Appl. Algebra 226 (2022), 107130, Introduction and §§2--3. DOI:
  `10.1016/j.jpaa.2022.107130`.
- **[FKS05]** Igor Frenkel, Mikhail Khovanov and Olivier Schiffmann, *Homological realization of
  Nakajima varieties and Weyl group actions*, Compos. Math. 141 (2005), 1479--1503,
  §§2--4, 6, 8.1--8.3, 9.3. DOI: `10.1112/S0010437X05001727`.
  The separate preprint is arXiv `math/0311485v1`. For the normalization comparison distinguish
  journal pp.1489,1491–1492,1498–1499,1502 from preprint pp.20–21,26,30–32,36–37.
  The endpoint display used in 6.5 is §8.3, arXiv v1 p. 30.
- **[BKR01]** Tom Bridgeland, Alastair King and Miles Reid, *The McKay correspondence as an
  equivalence of derived categories*, J. Amer. Math. Soc. 14 (2001), 535–554, Theorem 1.2 (p. 4)
  and §8. arXiv `math/9908027` (v2 read; numbering agrees with the journal version).
- **[KV00]** Mikhail Kapranov and Eric Vasserot, *Kleinian singularities, derived categories and
  Hall algebras*, Math. Ann. 316 (2000), 565–576, §2.1, Proposition and Lemma (p. 5). arXiv
  `math/9812016` (v2 read).
- **[GSV83]** Gerardo Gonzalez-Sprinberg and Jean-Louis Verdier, *Construction géométrique de la
  correspondance de McKay*, Ann. Sci. École Norm. Sup. (4) 16 (1983), 409–449.
- **[Rei97]** Miles Reid, *Chapters on algebraic surfaces*, in *Complex algebraic geometry*, IAS/Park
  City Math. Ser. 3 (1997), 3–159, §4.5, Proposition (p. 84). arXiv `alg-geom/9602006`.
- **[Spr77]** Tonny A. Springer, *Invariant theory*, Lecture Notes in Math. 585, Springer, 1977,
  §§4.4–4.5.
