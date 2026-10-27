# McKay correspondence, skew-group algebras, and algebraic Weyl functors

The finite subgroups of `SU(2)` give an unusually concrete meeting point of finite-group
representations, affine ADE diagrams, quadratic algebras, and curved homological algebra.  This
roadmap constructs the complete finite-subgroup classification and conjugacy, the generic McKay matrix,
its finite geometric correspondence, and the full algebraic skew-group prerequisite package. It
constructs named models and actual invariant-quotient/resolution/representation-component maps,
identifies basic skew-group algebras, and reaches the curved complex and duplex functors of
Frenkel--Khovanov--Schiffmann (FKS).

The regular dimension vector `δ` is constructed and the ordinary affine root lattice is quotiented by `ℤδ`, but no
category is quotiented by `δ` and no categorified analogue of that quotient is asserted.

`Suggested.lean` states the headline theorems against the pinned Mathlib and Tau Ceti: Klein's
classification and conjugacy (`finite_subgroup_SL2_classification`,
`finite_subgroup_SL2_conjugate_of_mulEquiv`, `card_eq_48_conjugate`), the McKay correspondence and
its converse (`exists_isMcKayLabelling`, `exists_isMcKayLabelling_of_valid`), the preprojective and
zigzag corners of the skew-group algebras (`exists_full_corner_equiv_preprojectiveAlgebra`,
`exists_full_corner_equiv_zigzag`) and the Crawley-Boevey–Holland theorem
(`exists_full_corner_equiv_deformedPreprojectiveAlgebra`).  Its module docstring names the headline
theorems that are not statable at the pins (the relative Koszul duality of Layer 3, the
representation-ring-to-root-lattice map of Layer 2, the FKS theorems of Layer 6 and the geometric
correspondence of Layer 7) and the carrier each lacks.
The README is definitive. Named irreducible models are coordinate presentations of the native
simple-object skeleton, and named affine labels transport the native `AffineDynkinType` data.

## Conventions and hypotheses

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

## Existing foundations to consume

The following APIs are dependencies and must not be redeveloped here.

### Mathlib and Tau Ceti

- Mathlib has `Quaternion`, matrices, `specialUnitaryGroup`, `SpecialLinearGroup`, finite groups,
  `Representation`, `FDRep`, characters, tensor products, symmetric and exterior algebras,
  `MonoidAlgebra`, `SkewMonoidAlgebra`, ideals, quotients, simple graphs, and category-theoretic
  Morita infrastructure.  Specialize `SkewMonoidAlgebra` and prove the group/equivariant-module API;
  do not introduce a second finitely-supported convolution carrier.
- Tau Ceti has the path algebra, vertex idempotents, arrows, the later-factor-first product, and
  Dynkin graph data, including `TauCeti.AffineDynkinType`, its `Valid`/`IsGraphical` conditions,
  `graph`, `cartanMatrix`, `marks` and `affineNode`. Use those actual affine carriers and their
  deletion/model maps; this roadmap builds the McKay comparison, not another affine data engine.
  It is not a request for parallel path-algebra or matrix-group foundations.
- The headline statements consume, at the pinned Tau Ceti: `TauCeti.SimpleFDRepClasses` and
  `TauCeti.SimpleFDRepClasses.mk` (the isomorphism classes of simple objects of `FDRep k G`,
  `TauCeti/RepresentationTheory/Simple/Basic.lean`); the corner algebra instance
  `IsIdempotentElem.Corner.instAlgebra` (declared in Tau Ceti) on Mathlib's `IsIdempotentElem.Corner`
  (`TauCeti/RingTheory/Idempotents/Corner.lean`); `TauCeti.preprojectiveRelator`,
  `TauCeti.doubledVertexIdempotent` and `TauCeti.preprojectiveAlgebra`
  (`TauCeti/RepresentationTheory/Quiver/Preprojective/Basic.lean`);
  `TauCeti.DoubledQuiver.Orientation` and `TauCeti.DoubledQuiver.OrientedQuiver`
  (`TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean`); and
  `TauCeti.nonisolatedZigzagQuotient`, the zigzag algebra of a graph without isolated vertices
  (`TauCeti/RepresentationTheory/Quiver/Zigzag/Relations.lean`), which is the zigzag algebra of
  every valid graphical affine type since those graphs are connected with at least three nodes.

### Sibling roadmaps

- [`CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md) owns character
  completeness, primitive central idempotents, and the sum-of-squares formula.  The representation
  ring it plans is built at the pinned Tau Ceti as `TauCeti.repRing k G`, an abbreviation of
  `TauCeti.SplitK0 (FDRep k G)` (`TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`), with
  class map `TauCeti.SplitK0.of`, product rule `TauCeti.SplitK0.of_mul_of` and character
  homomorphism `TauCeti.repRingCharacter`; this roadmap consumes that native carrier, not the
  roadmap's opaque placeholder, and specializes tensor multiplication to McKay.
- [`CompactGroups`](../RepresentationTheory/CompactGroups/README.md) and
  [`ClassicalGroups`](../RepresentationTheory/ClassicalGroups/README.md) own compact/unitary and
  `SL₂` representation infrastructure.  We supply only explicit finite subgroups and their
  restricted defining representation.
- [`RootSystems`](../RepresentationTheory/RootSystems/README.md) owns finite ADE Cartan, Weyl and
  chamber theory; [`ReductiveGroups`9A.1a](../ReductiveGroups/README.md) owns the integral ADE
  norm-shell/root-coordinate comparison. Consume the native `AffineDynkinType` data and
  [`ZigzagPreprojective`](../ZigzagPreprojective/README.md)'s affine matrix/deletion and strict
  algebra contracts, including the multiplicity-two `Ã₁`. These are lower inputs to the
  explicit finite-root-to-McKay comparison here.  What is new here is the representation-theoretic side: the
  McKay matrix of an actual finite subgroup, its identification with one of those affine Cartan
  matrices, the radical statement `ker C = ℤδ`, and the algebraic quotient by `δ`.
- [`QuiverRepresentations`](../RepresentationTheory/QuiverRepresentations/README.md) owns quiver
  representations, bound path algebras, primitive idempotents, projectives and Morita theory.
- [`DGAInfinity`](../DGAInfinity/README.md) supplies internal grading, DG/`A∞` modules, bar/cobar
  transport, and homotopy transfer, and its Layer 11 owns the generic relative quadratic theory
  over a separable semisimple base (relative tensor and quadratic algebras, right dual, `R⊥`,
  quadratic dual, Koszulity through GrothendieckEulerForms Layer 3's linear graded projective
  resolutions, in right modules).  Layer 3 below instantiates that theory at `S=k[Γ]` through an
  explicit left/right bridge and does not redevelop it.  DGAInfinity is also needed to transport
  strict skew-group presentations without pretending a transferred `A∞` model is definitionally
  the strict algebra.
- [`StablePeriodicCurved`](../StablePeriodicCurved/README.md) supplies `MorphismIdeal`, its
  quotients and universal lifts, the factor-through ideal, and right curved DG modules with their
  triangulated homotopy category.  Its curved duplexes are commutative with scalar curvature, so the
  left-handed, algebra-valued, parity-graded FKS categories are built here from the ideal machinery;
  the `ℤ`-graded FKS homotopy category is then proved equivalent to that roadmap's curved homotopy
  category of the zero-differential algebra `(A, 0, -c)` over its graded opposite.
- [`ZigzagPreprojective`](../ZigzagPreprojective/README.md) supplies doubled simple graphs, ordinary
  zigzag algebras, affine `E₈`, graded pieces, projectives, Frobenius maps, and additive
  preprojective algebras and parameterized skew-zigzag relations. This roadmap proves the direct
  odd-cyclic exterior corner calculation as well as the even-cyclic ordinary comparison. The FKS
  layer retains its bipartite scope, where FKS's orientation-signed algebra is ordinary zigzag;
  no odd-cycle reflection-functor theorem is inferred from the corner calculation.

The last three dependencies are mathematical prerequisites.  `A∞`/DG machinery controls Koszul
dual and Morita transfer; stable and periodic machinery is required because FKS identify maps only
after quotienting morphisms through projectives and use differentials with `d²=c`; the zigzag API
provides the strict algebra and the multiplication/comultiplication maps used in the functors.

## Layer 0: explicit finite subgroups of `SU(2)` and `SL₂(ℂ)`

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

### Complete finite-subgroup classification and conjugacy

Up to isomorphism the classification reads: a finite subgroup `H` of `SL₂(ℂ)` is cyclic, or
isomorphic to Mathlib's dicyclic `QuaternionGroup n` for some `n ≥ 2` (the binary dihedral group
of order `4n`), or to `SL(2, 𝔽₃)` (binary tetrahedral), or to `SL(2, 𝔽₅)` (binary icosahedral), or
has order `48` (binary octahedral) (`finite_subgroup_SL2_classification`).  Isomorphic finite
subgroups of `SL₂(ℂ)` are conjugate in `SL₂(ℂ)` (`finite_subgroup_SL2_conjugate_of_mulEquiv`), and
any two of order `48` that are neither cyclic nor isomorphic to `QuaternionGroup 12` are conjugate
(`card_eq_48_conjugate`); conjugacy in `GL₂(ℂ)` becomes
conjugacy in `SL₂(ℂ)` after scaling the conjugating matrix by a square root of its determinant.
Checks: the trivial subgroup and `{±I}` are cyclic; `Q₈` is `QuaternionGroup 2`; the group
`QuaternionGroup 1` is cyclic of order four, which is why the dicyclic case starts at `n = 2`.
The order alone does not pick out the binary octahedral group: the cyclic group of order `48` and
`QuaternionGroup 12` also embed in `SL₂(ℂ)` and are not conjugate to it, so the conjugacy statement
for order `48` carries both exclusions.  Likewise orders `24` and `120` are shared with
`QuaternionGroup 6`, `QuaternionGroup 30` and the cyclic groups, which is why the tetrahedral and
icosahedral cases are stated as isomorphisms with `SL(2, 𝔽₃)` and `SL(2, 𝔽₅)` rather than by order.

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
matrix certificates are part of this layer: pole stabilizers and centralizers
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

## Layer 1: irreducibles, the McKay matrix, and named affine ADE

For every finite subgroup `Γ≤SU(2)`, use the actual restricted representation
`(TauCeti.stdRep ℂ 2).comp (TauCeti.SU2.toGL.comp Γ.subtype)` and bundle it
with `FDRep.of`. Its faithfulness comes from the native injective maps;
construct its determinant-form self-duality explicitly. Use CharacterTheory's
existing complete finite family on `I=Fin (Nat.card (ConjClasses Γ))`, namely
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
actual finite direct-sum decompositions using CharacterTheory Layer3's
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
simple graph.  It participates in the matrix/root and actual skew/relative-quadratic layers and in Layer7’s
finite geometric `A₁` comparison. All simple-graph zigzag corners below require cyclic `n ≥ 3`,
and the FKS graph functors further
require a bipartite graph, so even cyclic `n ≥ 4`.  Under the existing
`affineE8Graph` numbering (central vertex `0`, arms of edge lengths
`1,2,5`), the required vector is `(6,3,4,2,5,4,3,2,1)` and vertex `8` is the trivial/affine node.
Check `Cδ=0` and `∑δ_i²=|Γ|` in every family, with executable checks for the small exceptional
tables.  McKay [McK80, Props. 1--2] defines the graph; Steinberg [Ste85, §1(1)--(5),(8)] proves the
character-eigenvector, positive-semidefinite, null-vector, and named affine-Cartan assertions.

The headline form of the correspondence is stated on the native carriers.  Define
`IsMcKayLabelling V t e`, for `V` in `FDRep ℂ Γ`, an affine type `t` and a bijection `e` from
`TauCeti.SimpleFDRepClasses ℂ Γ` to the nodes of `t`: the multiplicity
`dim Hom(X, V ⊗ Y)` equals `2δ − C` at the nodes of `X` and `Y`, for `C` the native
`TauCeti.AffineDynkinType.cartanMatrix`; the dimension of each simple is its native mark; and the
trivial representation sits at the native `affineNode`.  Prove that every nontrivial finite group
with a faithful two-dimensional representation of determinant one has a McKay labelling by a
valid affine type (`exists_isMcKayLabelling`), and that every valid affine type has one
(`exists_isMcKayLabelling_of_valid`).

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

## Layer 2: representation-ring and root-lattice passage

Expose the canonical class `[W] : R_ℂ(Γ)` and prove

```text
[V] [ρ_i] = ∑_j a_ji [ρ_j],
[V] [ℂ[Γ]] = 2 [ℂ[Γ]],
[ℂ[Γ]] = ∑_i δ_i [ρ_i].
```

The second identity makes the regular-representation vector `δ` a null vector of `C`; the
sum-of-squares identity identifies its dimension with `|Γ|`. Consume Layer1's actual complete
family, faithful self-dual dimension-two action and connected weighted-kernel theorem. Its real
radical is `ℝδ`, and the trivial coordinate `δ_trivial=1` makes its integral radical exactly
`ℤδ`. This also holds for the singleton matrix `[0]`; it gives the zero quotient without
an invented affine type. It is not a radical statement for an arbitrary `FDRep`. Retain the
native affine-model comparisons and named-family integral positive-semidefinite identifications.  Since the
trivial-representation coordinate of `δ` is `1`, construct an explicit integral equivalence

```text
ℤ^(Irr Γ) / ℤδ  ≃+  ℤ^(Irr Γ \ {trivial})
```

and, in the nontrivial native-affine cases, identify the descended form with the finite ADE
Cartan/root-lattice form obtained by deleting the affine node. For the singleton it is the zero
form on the empty lattice.  Do not state only a rational quotient, and do not conflate this ordinary
algebraic quotient with a categorical quotient.  The dimension-vector and highest-root statements
are Steinberg [Ste85, §1(3)--(5)].

## Layer 3: skew/smash products and quadratic Koszul duality

Define the skew product on the finitely supported carrier `Γ →₀ A`, prove the displayed
single-term multiplication formula, its universal property, associativity, algebra structure,
and equivalence between the categories of left modules and equivariant left `A`-modules.
Specify morphisms as actual linear maps intertwining both actions. Construct the two functors
on objects and morphisms, their inverse natural isomorphisms, and the action formulas; an
object-level type equivalence is only its underlying data comparison. Separately name the
equivalence with the opposite/right convention.

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

## Layer 4: idempotent corners and McKay-quiver presentations

Choose one primitive **matrix** idempotent `e_i` in every Wedderburn block of `ℂ[Γ]`; prove the
`e_i` are idempotent, primitive and mutually orthogonal, and do not sum primitive central
idempotents and call the result basic.  Embed `e=∑_i e_i` in both skew algebras and prove it is
full.  Define `eBe` and `e_j B₁ e_i` as literal subtypes of `B` cut out by multiplication and the
actual degree-one piece.  Derive the module-category equivalence from the full-idempotent theorem,
and prove the resulting corner is basic in the sense of landed `TauCeti.IsBasic` when finite
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

The binary-group results are [HK01, §6.3, Props.16–17 and relation(42)], under
the corrected arXiv v2 hypotheses.
Together with the cyclic calculations below they give the headline statements: for every finite
group with a faithful two-dimensional representation of determinant one whose McKay type is
graphical, and every orientation of the McKay graph, `Sym(V) ⋊ Γ` has a full idempotent whose
corner is Tau Ceti's `TauCeti.preprojectiveAlgebra` of the oriented graph
(`exists_full_corner_equiv_preprojectiveAlgebra`); when moreover `−I ∈ Γ`, `Λ(V) ⋊ Γ` has a full
idempotent whose corner is `TauCeti.nonisolatedZigzagQuotient` of the McKay graph
(`exists_full_corner_equiv_zigzag`).
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
The FKS reflection layer retains its existing connected bipartite graph scope
and does not extend to odd-cycle skew parameters by an unproved analogy.

## Layer 5: deformed preprojective algebras

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
on each simple. The positive **trace-parameter**
CBH theorem identifies its full corner with the trace-weight star. Combining it with the
simple-dimension invariant rules out every corner equivalence to the scalar-weight algebra.
This proves the existing strong negative target; the earlier vertex-compatible argument is
only a normalization check. `CBHTraceControls.lean` gives the actual ModuleCat/path-quotient,
matrix-unit, central-block and comparison targets. It imports Suggested; Suggested does not
import it, so the companion supplies the witness without an import cycle.

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
with `e_i = TauCeti.doubledVertexIdempotent k i`; define `cbhRelator V b z = [x, y] − z` in
`T(V) ⋊ Γ`, for the ordered basis `x = b 0`, `y = b 1` and `z` embedded as `∑_g z_g (1 # g)`; and
define `CBHAlgebra V b z` as the quotient of `T(V) ⋊ Γ` by the two-sided ideal it generates.
Prove that for central `z` and the trace weights `λ` read through a McKay labelling, `CBHAlgebra`
has a full idempotent whose corner is `deformedPreprojectiveAlgebra` of the oriented McKay graph
(`exists_full_corner_equiv_deformedPreprojectiveAlgebra`, CBH98 Theorem 0.1).  Neither the basis nor
the orientation matters: rescaling every arrow by `c ∈ ℂˣ` identifies `Π^λ` with `Π^(cλ)`, and
reversing an arrow `a` by `a ↦ a*`, `a* ↦ −a` keeps `λ`.

**Checks.**

- At `λ = 0` the ideal is the preprojective ideal, so `deformedPreprojectiveAlgebra k Q 0` is
  `TauCeti.preprojectiveAlgebra k Q`; at `z = 0`, `CBHAlgebra` is isomorphic to `Sym(V) ⋊ Γ`.
- For the one-vertex quiver with one loop `a` and `λ = 1`, the relation is `aa* − a*a = 1`, the
  first Weyl algebra, which has no nonzero finite-dimensional module (trace of a commutator is
  zero); with `λ = 0` the algebra is `k[a, a*]`.
- Summing the vertex relations of a finite-dimensional module `M` and taking traces gives
  `∑_i λ_i dim(e_i M) = 0`; for `Q₈` with trace weights `(1, −2)` at a leaf and the centre this
  excludes the two-dimensional simple that the scalar weights `(1, −1)` admit, as computed above.

## Layer 6: FKS curved complexes, duplexes, stable categories, and Weyl functors

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

Acceptance tests, each on a named algebra:

- over `A = ℚ[t]/(t²)` in degree zero with `c = 0`, the disk `Ã_0 ⊗_A (A/(t))` is nonzero in
  `Mod(Ã_0)` (its restriction to `A` is not projective) but zero in `K(A,0)`, so `Φ₂` kills a
  nonzero object and is not an equivalence;
- over `ℚ[u,u⁻¹]` with `deg u = 2` and `c = u`, every object of `K(A,c)` is contractible by
  `h = u⁻¹ d / 2`, so `K(A,c)` is the zero category [FKS05, §3.2, Remark];
- for the zigzag algebra of a connected bipartite graph at `c = 0`, a simple module with zero
  differential is nonzero in `K₂(A,0)`, hence its preimage is a nonzero object of `Mod₂(Ã_0)`.

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
transport is [FKS05, §§8.1--8.2 and §9.3].

### 6.1. The actual Γ-side curved Morita comparison

Construct the corrected endpoint-weighted algebraic Γ-realization of the reflection,
curvature and Weyl-functor outputs of FKS §§8.1–8.2 and9.3, with the explicit actual-corner,
graph-kernel and coordinate comparisons of6.3. This is a definite construction theorem,
not a deduction from ungraded Morita equivalence. The ordered-composite scalars, their
trace weights and the chosen bilinear adjoint are part of its definition. Keep the literal
journal/preprint formulas in secondary source records: no equality to inconsistent raw
scalar equations or to an adjoint with unspecified pairings is a premise or conclusion. Retain the existing binary/simple-graph
scope of the reflection theorem. Fix the determinant-normalized ordered basis of the actual
two-dimensional defining representation V and write Ω=x∧y. Set A=Λ(V)⋊Γ with the existing
single-term product `(α#g)(β#h)=(α∧gβ)#gh`. Group elements have degree0, vectors degree1, and Ω
degree2. Work with the actual exterior internal grading and its parity collapse, not merely an
arbitrary function of submodules satisfying degree0/1 range equations. The latter prototype
equations alone do not certify multiplication or higher pieces. The general curved-Morita
construction below also works in ℤ grading; the reflection application uses parity.
Concretely define A_d as the span of `α#g` with α in the degree-d exterior piece, and zero
for integer d<0 or d>2. Prove the internal direct sum and multiplication laws from the actual
exterior/skew PBW decomposition; parity has even piece A_0⊕A_2 and odd piece A_1. Construct
the actual graded restriction of φ below, not a new unconstrained grading function.

Use Layer4's primitive matrix idempotents in S=ℂ[Γ]. Choose bases of the actual irreducibles
adapted to these idempotents and construct their matrix units E^i_rs under the actual Wedderburn
map. Thus e_i=E^i_(1,1), e=Σ_i e_i and Σ_(i,r)E^i_(r,1) E^i_(1,r)=1. Write p_(i,r)=E^i_(r,1) and
q_(i,r)=E^i_(1,r). These elements have degree0. Their products q_j p_l lie in B=eAe. Set
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
the actual matrix units, not assumed as extra certificates or confused with finite-dimensional
projectivity over ℂ. The two multiplication isomorphisms satisfy the Morita triangle/coherence
identities on tensors.

Let φ:B≃Z be the actual Layer4 graded algebra identification with the pinned ordinary zigzag
algebra Z, including its vertex/arrow/volume and colouring comparison. For a central homogeneous
z∈B define its unique central lift and inverse by

```text
θ(z)=Σ_j p_j z q_j ∈ Z(A),       θ⁻¹(w)=ewe ∈ Z(B).
```

Prove centrality, independence of the matrix-unit expansion, both inverse identities and
`θ(z)p=pz`, `qθ(z)=zq`. For instance multiply the centrality equation on each side by the full
matrix-unit expansion of1; its coefficients lie in B and commute with z. This is a graded
algebra isomorphism of centers, not a freely chosen correspondence between parameter labels.
For graph coordinates t set `c_B(t)=φ⁻¹(Σ_i t_i X_i)` and `c_A(t)=θ(c_B(t))`. Then the reflected
Γ-side parameter is exactly `c_A(s_a t)`, in the existing `X_i=ε_iY_i` convention.

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
Layer5's separate CBH trace coordinates `λ_i=δ_i f_i`; never silently substitute block scalars,
trace coordinates or graph-curvature coordinates for one another.
The source's Section6 convention is `c_B=-Σ_i ζ^Q_(ℂ,i) X_i`, whereas Section8's Γ deformation
is `d²=+ΩΣ_i ζ^Γ_(ℂ,i)z_i`. In the present dictionary `t_i=-ζ^Q_(ℂ,i)` and
`ζ^Γ_(ℂ,i)=κ_i t_i`; the graph duplex with multiplication coefficient `x=-t_a` is the
source's `C_(a,x)`. Record these signs and the induced coordinate conjugation of s_a. The
source's displayed unweighted ε relation is not substituted for the determinant/matrix/trace
computation. Construct the endpoint-weighted scalar normalization and its explicit arrow,
volume, curvature and kernel comparison of6.3; the actual κ_i are retained throughout.

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

Relate E to the **landed native** full-idempotent equivalence. Native
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

For the stable categories, e is still full and degree0 in the actual curved extension algebra
Ã_(c_A(t)); its corner is the extension algebra of `(B,c_B(t))`, with d commuting with e.
The same p_j,q_j prove fullness there. The induced graded-module equivalence therefore
preserves and reflects the honest projective objects, their factor-through ideals and the
stable quotients. Give the object/morphism equations and inverse natural isomorphisms on those
quotients. The square comparing these stable equivalences with the existing functors Φ₂ to
curved homotopy categories must commute naturally. It does not identify their different ideals.

### 6.2. Γ-side reflection kernel, crossed actions and functor comparison

Transport the **constructed** graph kernel, not an assumed Γ-side reflection equivalence. Let
K^B_(a,t) be the previous literal reflection duplex, pulled back along φ. Define

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
the B-bimodule property and the full-idempotent identities. The previous graph Δ_a already
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
comparison with the corrected endpoint-normalized presentation in6.3, including dimension,
volume and parameter factors. The algebraic reflection/Weyl application has the full
§9.3 functorial outputs through these constructed comparisons. Equality to a literal
source adjoint with no specified pairings is not one of these mathematical identities. Geometric variety/sheaf claims keep their existing separate scope.

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
of6.3, not equality to an unspecified source adjoint. The inspected journal and arXiv-v1
§9.3 pages name no pairings for Δ; this observation does not claim none are present elsewhere.
Their Section6 Δ_a is separately specified on1. Keep that graph map, the chosen Γ adjoint
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
equivalence there. Only the existing nonzero and orbit-wide generic hypotheses give those
conclusions.

Retain Section9.3's algebraic restriction comparison as well. Restriction along
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
Nakajima variety or with the geometric κ_a under the source's Theorem5/Proposition9.1 is a
separate source boundary, not a premise or a newly claimed geometric theorem here. Any
separately used torsion-free representative subcategory must keep its actual predicate and
preservation proof; a stable isomorphism alone is not asserted to prove that property.

Acceptance must recover both directions under e(-)/E, the native-coind comparison, the
crossed action/μ_a formulas and **both** curvature components on named binary examples,
including the binary-icosahedral input. Changing adapted matrix bases must give the explicit
conjugating kernel isomorphisms and parameter maps, not new unrelated reflection data. Odd
cyclic groups keep their actual skew-corner/Koszul/geometric targets; no bipartite graph
reflection is inferred. The singleton exterior algebra and C₂ double-edge boundary also
retain their actual algebras and previously assigned targets without being coerced into a
simple-graph kernel. No new geometric McKay, subgroup-classification or late derived-Morita
result is a premise of this finite full-idempotent construction.

### 6.3. Corrected Γ-realization, coordinate dictionary and comparison theorem

Construct the endpoint-weighted Γ-realization and prove its equivalence to the actual
Layer4 corner and the transported graph reflection kernels. Its reflection, Weyl,
curvature, stable/homotopy, restriction and framing outputs are all required. The theorem
uses explicitly constructed intertwiners and bilinear forms; its comparison is between
these defined mathematical objects. Separately prove the unequal-endpoint obstruction
to the literal raw-scalar antisymmetry, as specified below. The source's literal formulas
and unnamed-pairing observation remain secondary provenance, not an additional claim of
equality between undefined or incompatible choices.

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
scalar so that `ε̂_ab=σ_ab=ε_b∈{1,−1}`, where ε_b is the existing bipartite colour of
the domain vertex b, and `σ_ba=ε_a=−ε_b`. Then the corrected scalar version of
the endpoint formulas is `c_ab=σ_ab/δ_b`, `c_ba=σ_ba/δ_a`. Construct the maps and their
inverse rescalings, not a field asserting these equations. This target uses the existing
binary/simple-graph scope; multiplicity-two and odd-cycle cases retain their separate targets.

As an explicit unequal-endpoint test use the trivial and defining two-dimensional irreducible
of Q₈. Take `φ_ab(v)=v⊗1` and `φ_ba(1)=y⊗x−x⊗y`. With the stated order the two composites
are `Ω⊗id_V` and `−2Ω⊗id_ℂ`; their ordinary scalars are1 and−2, while their trace-weighted
coefficients are2 and−2. Scaling φ_ba by1/2 gives the normalized coefficients1 and−1. Recover
this test from the actual representations, not just an abstract dimension counterexample.
Prove also that no nonzero rescalings of this pair satisfy both the raw ordered-composite
definitions and unweighted antisymmetry: rescaling multiplies1 and−2 by the same nonzero
product. This is a counterexample to that literal ordinary-scalar interpretation. The
corrected construction retains the weighted equation and all reflection outputs.

Give the coordinate change on actual module intertwiners with its carrier and sign.
Let `W=⊕_i ρ_i⊗E_i`, where E_i are graded complex multiplicity spaces, and let the odd
Γ-equivariant map `D:W→V⊗W` be the finite edge sum `φ_ab⊗x_ab`, with degree-zero maps
`x_ab:E_b→E_a` (the V factor has degree1). On `M=Λ(V)⊗W` extend it by
`d(α⊗w)=(-1)^|α| α∧D(w)`. Prove superlinearity and all Γ/module/grading identities.
This is the explicit exterior-free linear-generator presentation; the arbitrary curved
modules and equivalences of6.1 retain their full scope and are not assumed exterior-free.
No new finite-dimensionality assumption is imposed on E_i. Put `φ̂_ab=s_ab φ_ab`, with nonzero s_ab and
the normalized reverse choices above. Define the raw source-style auxiliary coordinate
`y_ab=c_ab x_ab` and the corrected coordinates by

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
This proves the corrected `y=ε̂x` relation and the actual block/trace/graph parameter
conversion, without attributing these corrected coefficients to the raw source display.

Keep the module and arrow conventions separate in the comparison. The maps x_ab are
coefficients of D on W, and point b→a; they are not the action of a_ab on W. The actual
left corner module is `e(Λ(V)⊗W)`, with corner arrows acting through the exterior/skew
module action and differential induced by d. Construct its maps and inverse presentation
using the actual matrix units and determinant currying; compute every arrow action and
D coefficient there. If the coefficient presentation is expressed by right/opposite-quiver
modules, construct its reversal/opposite-algebra and grading adapter to this left module,
with both inverse equations and all relations. Do not identify W with eM or reverse the
support of a_ab by renaming. The full6.1 Morita comparison applies to M, and its restriction
to these exterior-free presented objects must agree with the constructed coordinate maps.

Compare this normalized presentation with the **actual** Layer4 corner map φ. Compute each
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
finite group-sum multiplication and center formulas of6.1–6.2 remain the formulas to match.

Make the comparison of adjoints equally explicit. All pairings in this normalized realization
are the complex-bilinear Frobenius pairings specified in6.2. In homogeneous adapted bases let
M be the matrix of μ_a, and G_A,G_U the matrices of those pairings. Prove the adjoint formula
`D=G_U⁻¹ MᵀG_A`. Given another explicit presentation with multiplication M', pairings H_A,H_U
and invertible homogeneous coordinate maps C_A,C_U, prove

```text
M'C_U=C_AM,
G_A=C_AᵀH_AC_A,  G_U=C_UᵀH_UC_U
    ⇒ D'C_A=C_UD,  where D'=H_U⁻¹(M')ᵀH_A.
```

Construct the normalized source-shaped pairings by transporting the actual6.2 forms through
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
kernel and odd-cycle/singleton/double-edge boundaries retain exactly their earlier meanings.

The comparison theorem is between the corrected endpoint-weighted Γ-realization,
the actual graded corner and the graph kernel with the explicit parameter conversions
above. Prove both left and right curvature components after every arrow, volume and
adjoint coefficient change; the two bimodule actions are not interchangeable. The
unnormalized module coordinates remain available through the exact inverse dictionary.
Together with6.1–6.2 this constructs the complete algebraic §§8–9 reflection outputs,
including their natural, stable, homotopy, restriction and framed comparisons.

Keep the literal journal/preprint endpoint display and its unweighted antisymmetry in
secondary source records, alongside the Q₈ refutation of the ordinary-scalar reading.
Record likewise that the inspected §9.3 adjoint display does not specify its pairings;
the rigorous adjoint in this theorem is the definite6.2 Frobenius adjoint with the
Gram/coefficient comparison above. Equality to an unnamed choice is not asserted.
The source-version/page qualifications concern the reading evidence, and do not turn
any construction, inverse, curvature equation or functorial comparison into a conditional
or omitted target.

Only the algebraic material in FKS §§2--4, 6, 8.1--8.2 and 9.3 is in scope.  Their variety and
sheaf interpretations are not.

## Layer 7: finite geometric McKay and the actual comparison maps

This phase treats every finite subgroup of SU(2) and, through Layer0's specified conjugator, every finite subgroup of SL₂(ℂ). It follows Layers0–2 and the independently constructed finite ADE surface library in NilpotentOrbits N6–N8. Layers3–6 retain their complete algebraic and FKS scope; geometric McKay is not a premise of those layers or of NilpotentOrbits. All schemes, actions, morphisms, inverse maps and sheaves below are constructed on the stated carriers, including nonreduced base schemes in the cluster functor. Results about complex points are not substituted for identities of schemes or arbitrary-ring points.

Consume these precise lower contracts:

- [NilpotentOrbits N6–N8](../NilpotentOrbits/README.md#n8-ade-surfaces-and-exceptional-intersection-lattices): the particular ADE hypersurfaces, explicit resolutions, completed subregular-slice comparisons, exceptional curves and their normal-bundle/local intersection API. This remains the surface-resolution owner.
- [ReflectionInvariantTheory §1](../ReflectionInvariantTheory/README.md#1-finite-group-invariant-algebra-used-by-both-branches), [GroebnerGeometry G1](../GroebnerGeometry/README.md#g1-ideals-normal-forms-and-elimination): the actual contragredient polynomial action, nonmodular Reynolds/Molien/Noether bounds and exact generator/kernel/normal-form certificates.
- [SchemeAndStackFoundations §§1.17,4.14,5.1–5.3,5.7](../SchemeAndStackFoundations/README.md): generic quotients, projective Hilbert/Quot representability, cycles/proper-curve degree/Chern and coherent/perfect classes. The A²-open Γ-cluster locus, its universal ideals and concrete comparisons are consumer constructions here. No general nonaffine quotient or new Hilbert engine is commissioned.
- [AlgebraicVectorBundles L0](../AlgebraicVectorBundles/README.md#l0a--sheaves-of-modules): actual finite locally free sheaves, ranks, tensor/Hom, averaging images, pullback, determinants and affine finite-projective comparison. Consume native `TauCeti.AffineInvariantQuotient` and `RootPairing.GeckConstruction` directly.
- KacMoody KM0–KM1: the separate full affine realization and central/degree/loop comparison, rather than applying a finite nondegenerate root construction to a singular matrix.

### 7.0. Actual quotient and conjugation maps

Let Γ be any finite subgroup of the actual native SU₂, or a finite subgroup of SL₂(ℂ) with the specified unitarizing conjugacy. Let V=ℂ² with its restricted actual defining representation and S=Sym_ℂ(V*) with contragredient action `(g·f)(v)=f(g⁻¹v)`. Construct the coordinate equivalence with native `MvPolynomial (Fin2) ℂ`, preserving the actual two linear coordinate functions. Use native `FixedPoints.subalgebra` / `FixedPoints.subring` and `TauCeti.AffineInvariantQuotient.quotient S Γ` for X_Γ, with its actual projection q and Spec-map equations. Do not introduce a new quotient carrier. The existing algebraic owner uses Sym(V) in its skew/Koszul lane. Consume its actual determinant-form equivariant V≃V* and the induced symmetric-algebra equivalence to compare that carrier with these coordinate functions; extend it with the identity onΓ to a left skew-algebra equivalence. This is an explicit duality/action adapter, not an implicit equality of Sym(V) and O(V).

Consume native integrality, surjectivity, finiteness under finite-type-over-ℂ and prime-orbit fiber statements. Consume RIT1's finite-generation, nonmodular Reynolds, Molien and Noether bounds with these actual action maps. Construct the complex-point finite-orbit and affine quotient dictionary; native affine-target descent is not yet a universal property against arbitrary non-affine targets. The inverse-element equation for the native contravariant spectrum action is essential.

Prove that Γ acts freely away from0: a finite-order complex2×2 matrix is diagonalizable; determinant1 and an eigenvalue1 force both eigenvalues1 and hence the identity. Construct on that free locus the actual scheme torsor comparison Γ×V°→V°×_(X°)V° and prove it is an isomorphism. One elementary construction chooses a polynomial separating the finite orbit, inverts its orbit discriminant, and applies the Chinese remainder and finite étale descent calculations on those invariant principal opens. Prove all flatness/étale/degree statements only there. The projection at0 is not assumed flat or étale. Prove normality/finite type of the invariant ring and that X_Γ has no other singular points; the explicit presentation below separately establishes singularity at0 for nontrivial Γ.

Every actual GL₂ conjugator induces a specified graded algebra isomorphism on invariants, a quotient-scheme isomorphism and commuting square with q. Transport the defining representation, not merely Γ's abstract group type. Include identity/composition/inverse and the coordinate-change independence comparison. No compact normalizer splitting is used.

### 7.1. All-family invariant presentations with certificates

Produce actual invariant polynomials and mutually inverse ℂ-algebra maps between S^Γ and the following rings, matched to the finite type obtained by deleting the marked trivial vertex in the actual McKay matrix. Construct the maps with the following equations and type-index comparisons.

| Γ model | Quotient hypersurface | finite type |
| --- | --- | --- |
| cyclic order n≥1 | XY−Zⁿ | A_(n−1), with n1 smooth |
| binary dihedral order4m,m≥2 | X²+Y²Z+Z^(m+1) | D_(m+2) |
| binary tetrahedral | X²+Y³+Z⁴ | E₆ |
| binary octahedral | X²+Y³+YZ³ | E₇ |
| binary icosahedral | X²+Y³+Z⁵ | E₈ |

For cyclic Γ, take X=xⁿ,Y=yⁿ,Z=xy (the two characters may be interchanged by the contragredient dictionary). A monomial xᵃyᵇ is invariant exactly when a−b≡0 mod n. Its two normal forms in X,Z or Y,Z prove generation and independence of the standard monomial basis of the displayed quotient. Thus the exact algebra maps are justified, including n1, where Z eliminates and the quotient is ℂ[x,y], and n2, where the surface is A₁. No finite n0 or affineA0 is invented.

Pin exactly Layer0's r=diag(exp(πi/m),exp(−πi/m)) and s=[[0,1],[-1,0]]. On point columns s acts by(x,y)↦(y,−x); on our left contragredient coordinate functions it acts by(x,y)↦(−y,x). Let A=x^(2m), B=y^(2m), w=xy. The cyclic subgroup invariants satisfy AB=w^(2m); this actual second generator therefore swaps A,B and sends w↦−w. A symmetric i-swap matrix is a different coordinate model: its induced swap has factors(−1)^m on A,B. One must first transport by the explicit diagonal conjugator diag(exp(πi/4),exp(−πi/4)) and its polynomial pullback/phases before importing the displayed invariant formulas; no such alternate model is silently used here. Consequently Y=A+B, Z=w², X=w(A−B) are invariant, and

`X²=Z(Y²−4Z^m)`.

The even symmetric and odd antisymmetric decomposition in A,B gives generation; a standard-monomial/normal-form argument gives the kernel. Explicit nonzero complex scalar rescalings put the relation in the indicated NilN8 form. The m1 degenerate presentation is cyclic C₄ and must be transported to A₃, not counted again as a valid D₃ family. The ordinary Q₈ boundary m2 gives D₄.

For the three exceptional coordinate groups, construct the actual invariant triples of degrees (6,8,12), (8,12,18) and (12,20,30), respectively, from the named finite matrices/quaternion-coordinate models already owned in Layer0. Return exact finite polynomial relation and coefficient certificates, with all coordinate-field algebraicity/embedding data. RIT1's Reynolds images of monomials through the Noether bound supply a terminating finite search space; GG1 supplies exact elimination/standard-monomial verification. Prove algebraic independence of the chosen two parameters and the independence of1 and the remaining generator over their polynomial algebra, or supply equivalent explicit normal-form kernel certificates. Compare the resulting graded Hilbert series with the actual Molien expression degreewise to finish surjectivity only after those actual maps/kernel statements are proved. A rational series or a degree list alone does not establish an algebra isomorphism. Coefficient normalization to the ADE equation is an explicit invertible coordinate change. Construct all three concrete triples, relation checks, inverse maps and generation certificates; none is an input certificate assuming the desired isomorphism.

### 7.2. Resolution through the existing finite surface owner

For the actual global quotient algebra isomorphisms from 7.1, pull back NilN8's explicit resolution of the corresponding hypersurface to obtain π_Γ:Y_Γ→X_Γ. Provide the actual cartesian maps and inverse transport. Consume its smooth source, proper birational morphism, exceptional P¹s, incidence, normal-bundle degree−2 and intersection lattice; prove the transported morphism is an isomorphism off0 and minimal. For the trivial Γ set Y=X=ℂ² and π=id, with empty exceptional set and zero root lattice.

Keep global quotient presentations distinct from NilN8's separate completed-local comparison between a hypersurface and a subregular Slodowy slice. To compare with that slice, compose the actual completed-local algebra isomorphisms and their lifted completed resolved-neighborhood maps. Identify exceptional components and first infinitesimal neighborhoods before transporting their degree/intersection data. Do not infer a global polynomial Slodowy-slice isomorphism from a formal germ calculation.

The proof may use the already specified generic Rees/blowup maps, but it does not reconstruct a second general surface-resolution theorem. The nonproper total surface Y is not made projective to invoke a surface intersection theorem. Exceptional curves are proper; their normal-bundle degrees and supported local intersections are exactly the finite surface API already owned by NilN8.

### 7.3. Representation labels must be actual geometric maps

First construct a bijection from nontrivial actual irreducible indices to actual exceptional irreducible components, and prove under it

`E_i·E_j=−(2δ_ij−M_ij)` for i,j nontrivial.

It must commute with the chosen finite-root index/pinning maps and actual subgroup-conjugation transport. Repeated type names or equal cardinalities do not supply it. One complete constructive route is the following finite Γ-cluster comparison, consuming the existing generic Hilbert/Quot contract rather than asserting a new Hilbert engine.

Start with length|Γ| Hilbert subschemes of P² supported inside the chosen A², via the actual support-disjoint-from-infinity open subfunctor. Impose Γ-stability and require the finite flat algebra to have the regular Γ-representation: its isotypic ranks are the numbers d_i. Construct this representing locally closed/union-of-components locus with its universal finite flat family. Define the coherent component as the reduced closure of the free-orbit locus; do not assume every Γ-cluster is on it. The invariant rank-one summand is generated by1 and gives the actual map to X_Γ.

On the explicit Y_Γ charts from 7.2, construct and glue Γ-stable ideals in O_Y⊗S whose quotient is locally free of rank|Γ| with the regular isotypic ranks, and prove compatibility with π_Γ. Build the morphism Y_Γ→Γ-Hilb, construct its inverse on a covering by actual finite Hilbert charts, and prove both composites. Prove that these charts exhaust all regular Γ-clusters, so the full Γ-Hilb equals its coherent component in this dimension-two determinant-one scope. Construct both that equality and the reduced-closure comparison; do not silently replace either by the other. Neither a dimension count nor generic birationality is an inverse. Construct the finite-type chart equations, covering and inverse maps; generic representability alone does not supply them.

Let R=p_*O_Z be the actual universal-family algebra on Y; finite flat p gives its locally free underlying sheaf. Use the existing canonical irreducibles and exact finite-group averaging to construct

`R ≅ ⊕_i ρ_i ⊗ T_i`,  `T_i=Hom_Γ(ρ_i,R)`, `rank T_i=d_i`, `T_trivial=O_Y`.

Use AVB's actual tensor/Hom/LF and base-change APIs. For this universal quotient algebra R=(O_Y⊗S)/I and the stated HomΓ convention, prove that every T_i is globally generated. Since Y is quasi-compact and R is finite locally free, select finitely many polynomial sections generating R on a finite open cover, and take their finite Γ-orbits to obtain a finite-dimensional Γ-stable polynomial subspace W⊂S with W⊗O_Y→R surjective. Finite-group averaging over ℂ makes HomΓ exact, hence gives a surjection HomΓ(ρ_i,W)⊗O_Y→T_i. Exterior powers show det(T_i) is globally generated, so its degree on every proper exceptional P¹ is nonnegative. This establishes the positive degree direction for this actual convention; dualizing the bundle changes the convention and its degrees, rather than leaving an arbitrary sign in the target.

Compute det(T_i) on the explicit resolution charts, its transition functions and degrees on all exceptional curves. Construct an explicit bijection b from nontrivial canonical irreducible indices to exceptional components, and prove the positive equations `deg_(b(j)) det(T_i)=δ_ij`. These exact delta equations, including zero off-diagonal and degree one on the matched component, remain material chart calculations; global generation alone does not prove them. No degree-matrix or component-bijection conclusion is assumed as an input certificate. Pin the native ρ/ρ* and component-index dictionary by the actual universal-family calculations; do not guess it from an unlabeled picture. These equations construct and characterize the irrep/component map, and its adjacency compatibility is a further theorem, not an assignment of labels by dimension.

Then construct the integral pairing-preserving map from the EXISTING Layer2 quotient R_ℂ(Γ)/ℤ[regular] to the free exceptional-curve lattice. On nontrivial simple classes it sends[ρ_i] to E_i and sends the trivial class to−Σ_(i≠0)d_i E_i, since d_trivial=1. Its inverse uses the nontrivial basis. The McKay form2I−M becomes minus the intersection form. Prove the comparison with the native finite ADE simple roots/coroots, respecting the perfect ambient root-datum pairing; the integral root lattice with its Cartan form is not automatically its own unimodular dual.

Give the dimension labels a precise geometric interpretation: for Γ≠1 prove that the finite coefficients d_i form the minimal nonzero effective anti-nef exceptional cycle (coefficientwise minimal among nonzero effective anti-nef cycles). Construct it from the actual finite ADE intersection matrix, with the iterative curve-addition/termination and minimality proof; do not identify it merely by the words “highest root”. For Γ=1 the exceptional set is empty and the cycle is zero; no positive-cycle theorem is asserted there.

Do not turn this root-lattice quotient into a categorical quotient or quotient of K₀(Y) by the tautological regular bundle. The latter has rank|Γ|, hence is not zero in ordinary K₀. The tautological assignment is at most an additive K₀ map until a separately stated multiplication comparison is proved; it is not automatically a representation-ring isomorphism.

### 7.4. The Lie and source-diagram comparison

For the actual finite ADE root pairing and base produced by Layer1–2, extend the chosen integral/rational root data to ℂ and consume native `RootPairing.GeckConstruction.lieAlgebra`, `basis`, `equivRootSystem` and `equivLieAlgebra` with their actual hypotheses. The native Basis module already proves simplicity over algebraically closed characteristic0 for nonempty irreducible data. The trivial group uses the zero Lie algebra, not a simple rank0 object. TauCeti's rational pinned `rationalRootSystemEquiv` fixes simple-root and inverse-coweight maps. The common graph/divisor-root index maps above must commute with these actual root-system equivalences; no second generic Lie-existence or Serre theorem is commissioned.

Compare the marked affine matrix separately with the existing KacMoody KM0–1 full singular Cartan realization, including its central and degree directions and loop comparison. This is distinct from the finite Lie algebra obtained after deleting the trivial node. Do not feed the singular affine matrix into the finite Geck construction, identify dependent −θ with the independent affine root δ_aff−θ, or form a Lie/category quotient by the ordinary representation-lattice vector δ. The trivial singleton matrix is not a GCM or an affine A0; order two retains the genuine affine A1 double edge. Formal-current completions and level categories remain AffineLieAlgebras consumers.

Export the complete commuting diagram: the actual subgroup and its defining representation give the marked tensor matrix and finite ADE root/Lie model; its invariant quotient gives the specified hypersurface, resolution and exceptional root lattice; the actual index, degree and intersection maps intertwine these constructions. Preserve conjugation, coordinate-change, dual-index and chosen-root-base comparison equations.

## Worked targets

The examples are theorem-level integration tests, not prose illustrations.

### Cyclic `Ã`

For `n ≥ 3`, index irreducibles by `ZMod n`, prove
`V⊗χ_j ≃ χ_(j+1) ⊕ χ_(j-1)`, obtain the cycle matrix, `δ=(1,…,1)`, the quotient by
the diagonal vector, the two skew-group algebras, and their relative quadratic/Koszul duality.
The required `n=3` example includes the explicit skew-zigzag corner and its minus
backtrack relation. Even `n≥4` includes the specified ordinary-zigzag rescaling. Handle `n=2`
separately at the multiplicity-two matrix and actual skew-algebra layers, without a simple-graph
zigzag identification. Handle `n=1` with `M=[2]`, zero Cartan quotient and actual `Sym(ℂ²)`,
`Λ(ℂ²)`; no affine `A₀` or exceptional ordinary-zigzag identification is imposed.

### Binary dihedral `D̃`

For general `n ≥ 2`, compute the four one-dimensional and `n-1` two-dimensional irreducibles,
the tensor rules, affine `D̃_(n+2)`, and the regular vector.  Instantiate the ordinary zigzag and
preprojective Morita equivalences and at least one nonzero deformed parameter.

### Binary icosahedral `Ẽ₈`

Give all nine irreducibles and tensor decompositions, the explicit isomorphism with the sibling
`affineE8Graph`, and the regular vector `(6,3,4,2,5,4,3,2,1)` in its numbering.  Machine-check
`Cδ=0`, `∑δ_i²=120`, the affine-to-finite `E₈` lattice quotient, the 34-dimensional affine
zigzag target, the polynomial/preprojective target, and, for a two-colouring of the tree, a
vertex FKS reflection functor with its curvature equation.  This is prerequisite validation only; do not attach the downstream
finiteness, higher-gluing, or categorified-`δ` claims to it.

## Explicit exclusions

Finite-subgroup classification/conjugacy is in Layer0 and the finite geometric comparison is in
Layer7. The Γ-cluster Hilbert locus, its universal finite flat family, explicit chart exhaustion,
resolution, tautological bundles and irrep/component maps are included there. Generic Hilbert,
invariant-ring, ADE-resolution, vector-bundle, root and Lie foundations remain with their cited
owners. This roadmap does not include arbitrary GIT quotients, Nakajima quiver varieties,
preprojective moduli beyond that Γ-cluster construction, a derived McKay equivalence, or FKS’s
geometric realization. None of those is an unnamed premise of Layer7. In particular no
Fourier–Mukai equivalence is inferred from the classical component bijection.

It does not prove homological finiteness or higher-gluing assertions for exceptional
categorifications, construct an exceptional categorification of the affine-to-finite lattice
quotient, or assert a categorical quotient by δ. Existing algebraic FKS and ZigzagPreprojective
boundaries remain unchanged.
## Completion criteria

The roadmap is complete when:

1. all five named subgroup families and the trivial boundary are concrete subgroups of both
   `SU(2)` and `SL₂(ℂ)`, with orders and defining representations proved, and the finiteSO3 pole
   classification, actual conjugacy/exhaustiveness and binary-lift comparisons of Layer0 hold;
2. the generic faithful-tensor/walk/Laplacian/marked finite-root argument is constructed, and
   every finite subgroup has its actual native affine-index/mark comparison except the explicit
   singleton boundary; the named models retain their complete irreducible label and tensor
   decompositions, including `Ã₁` multiplicity and the pinned `Ẽ₈` numbering;
3. the representation-ring identities and integral quotient by `ℤδ` identify the finite ADE
   root lattice without a categorical overclaim;
4. the left skew-product multiplication, equivariant-module equivalence, actual relative tensor
   quotients, finite-projective hypotheses (including the separable-semisimple base carried into the
   right-dual theorems, without which they are false), right dual and orthogonal relations, graded
   quadratic duality, and linear projective Koszul resolution are proved;
5. literal full-idempotent corners for the binary groups give the ordinary zigzag and
   preprojective presentations, with Morita equivalence derived from fullness; the direct cyclic
   calculations give the odd skew-zigzag and even ordinary comparisons with their exact signs,
   while cyclic `n=1,2` remains excluded from this simple-graph criterion;
6. the `[x,y]-z` normalization, the trace parameter `λ_i = Tr_{ρ_i}(z) = δ_i · f_i` (and its
   distinction from the block scalar `f_i`, which is what the centre's algebra equivalence uses),
   deformed preprojective relations, orientation transport and full-corner comparison are proved in
   the Tau Ceti path convention;
7. the FKS curved complexes and duplexes, their homotopy categories, the curved extension algebra,
   the stable module categories `Mod(Ã_c)`, `Mod₂(Ã_c)` and the functor `Φ₂` to the homotopy
   category are constructed, the three acceptance tests of Layer 6 hold, and on bipartite zigzag
   duplexes the reflection functors built from the literal kernel satisfy the cited square, inverse
   and braid equations. The corrected Γ-realization of6.1–6.3 also has its actual corner,
   endpoint/trace/moment/parameter dictionaries, both curvature components, chosen-adjoint
   Gram comparison and kernel/functor isomorphisms, all stable/homotopy/Φ₂/R/framing
   compatibilities, and the unequal-endpoint raw-scalar counterexample; and
8. the cyclic, binary-dihedral and binary-icosahedral integration tests elaborate and compute; and
9. Layer7 constructs every actual finite geometric comparison: invariant generators and inverse
   algebra maps, quotient and conjugation maps, transported ADE resolutions and completed germ
   comparisons, the full Γ-cluster representing scheme and universal-family chart equivalence,
   positive tautological determinant degree/index equations, intersection/root-lattice maps and
   fundamental cycles with the trivial zero boundary. The native finite Lie and separate affine
   realization maps commute with the common indices.

## Published sources

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
  relation (42). DOI: `10.1006/jabr.2001.8962`; use corrected arXiv v2.
- **[CBH98]** William Crawley-Boevey and Martin P. Holland, *Noncommutative deformations of
  Kleinian singularities*, Duke Math. J. 92 (1998), 605--635, §§3--4. DOI:
  `10.1215/S0012-7094-98-09218-3`.
- **[CBK22]** William Crawley-Boevey and Yuta Kimura, *On deformed preprojective algebras*, J.
  Pure Appl. Algebra 226 (2022), 107130, Introduction and §§2--3. DOI:
  `10.1016/j.jpaa.2022.107130`.
- **[FKS05]** Igor Frenkel, Mikhail Khovanov and Olivier Schiffmann, *Homological realization of
  Nakajima varieties and Weyl group actions*, Compos. Math. 141 (2005), 1479--1503,
  §§2--4, 6, 8.1--8.2, 9.3. DOI: `10.1112/S0010437X05001727`.
  The separate preprint is arXiv `math/0311485v1`. For the normalization comparison distinguish
  journal pp.1489,1491–1492,1498–1499,1502 from preprint pp.20–21,26,30–32,36–37.
  The literal endpoint/adjoint displays are secondary source records;6.3 specifies the
  corrected endpoint-weighted Γ-realization, its raw-scalar counterexample and explicit
  coordinate/kernel comparisons, without claiming equality to an unnamed source adjoint.
