# McKay correspondence, skew-group algebras, and algebraic Weyl functors

The finite subgroups of `SU(2)` give an unusually concrete meeting point of finite-group
representations, affine ADE diagrams, quadratic algebras, and curved homological algebra.  This
roadmap formalizes that **algebraic prerequisite package**.  It constructs named subgroups, computes
their McKay data, identifies the associated basic skew-group algebras, and reaches the curved
complex and duplex functors of Frenkel--Khovanov--Schiffmann (FKS).

This is not a roadmap for the downstream research project.  In particular, the regular dimension
vector `δ` is constructed and the ordinary affine root lattice is quotiented by `ℤδ`, but no
category is quotiented by `δ` and no categorified analogue of that quotient is asserted.

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
- FKS use graded **left** modules and `d(a m) = (-1)^|a| a d(m)`.  The DGA roadmap's primary
  module convention is right-handed, so comparison passes through a named opposite-algebra
  equivalence.  Curvature is a degree-two central element and `d²` is its left action.

## Existing foundations to consume

The following APIs are dependencies and must not be redeveloped here.

### Mathlib and Tau Ceti

- Mathlib has `Quaternion`, matrices, `specialUnitaryGroup`, `SpecialLinearGroup`, finite groups,
  `Representation`, `FDRep`, characters, tensor products, symmetric and exterior algebras,
  `MonoidAlgebra`, `SkewMonoidAlgebra`, ideals, quotients, simple graphs, and category-theoretic
  Morita infrastructure.  Specialize `SkewMonoidAlgebra` and prove the group/equivariant-module API;
  do not introduce a second finitely-supported convolution carrier.
- Tau Ceti has the path algebra, vertex idempotents, arrows, the later-factor-first product, and
  Dynkin graph data.  Inspect the pinned versions before choosing names: this roadmap is not a
  request for parallel path-algebra or matrix-group foundations.

### Sibling roadmaps

- [`CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md) owns `repRing`, its
  character homomorphism and injectivity, character completeness, primitive central idempotents,
  and the sum-of-squares formula.  This roadmap adds the canonical class map only if that small
  interface is still missing, then specializes tensor multiplication to McKay.
- [`CompactGroups`](../RepresentationTheory/CompactGroups/README.md) and
  [`ClassicalGroups`](../RepresentationTheory/ClassicalGroups/README.md) own compact/unitary and
  `SL₂` representation infrastructure.  We supply only explicit finite subgroups and their
  restricted defining representation.
- [`RootSystems`](../RepresentationTheory/RootSystems/README.md) owns finite ADE Cartan and Dynkin
  data, and [`ZigzagPreprojective`](../ZigzagPreprojective/README.md) owns the affine
  simply-laced diagrams and their generalized Cartan matrices, including the multiplicity-two
  `Ã₁`.  Both are consumed here.  What is new here is the representation-theoretic side: the
  McKay matrix of an actual finite subgroup, its identification with one of those affine Cartan
  matrices, the radical statement `ker C = ℤδ`, and the algebraic quotient by `δ`.
- [`QuiverRepresentations`](../RepresentationTheory/QuiverRepresentations/README.md) owns quiver
  representations, bound path algebras, primitive idempotents, projectives and Morita theory.
- [`DGAInfinity`](../DGAInfinity/README.md) supplies internal grading, DG/`A∞` modules, bar/cobar
  transport, and homotopy transfer.  It is needed to state relative quadratic Koszul duality and
  to transport strict skew-group presentations without pretending a transferred `A∞` model is
  definitionally the strict algebra.
- [`StablePeriodicCurved`](../StablePeriodicCurved/README.md) supplies morphism-ideal quotients,
  stable categories, periodic complexes/duplexes, curved differentials, cones, and tensor-functor
  descent.  FKS complexes are an algebra-valued, graded-left specialization of that public layer.
- [`ZigzagPreprojective`](../ZigzagPreprojective/README.md) supplies doubled simple graphs, ordinary
  zigzag algebras, affine `E₈`, graded pieces, projectives, Frobenius maps, and additive
  preprojective algebras.  Its present public prototype has no skew-zigzag carrier, so this roadmap
  does not promise an odd-cycle skew-zigzag corner under an unavailable name.

The last three dependencies are mathematical prerequisites.  `A∞`/DG machinery controls Koszul
dual and Morita transfer; stable and periodic machinery is required because FKS identify maps only
after quotienting morphisms through projectives and use differentials with `d²=c`; the zigzag API
provides the strict algebra and the multiplication/comultiplication maps used in the functors.
None of these dependencies imports the research assertions in `GOAL.md`.

## Layer 0: explicit finite subgroups of `SU(2)` and `SL₂(ℂ)`

Identify the unit quaternions with `SU(2)` by

```text
a + b i + c j + d k  ↦  !![a + b·I, c + d·I; -c + d·I, a - b·I].
```

Prove this is a group equivalence, prove the composite inclusion into `SL₂(ℂ)`, and build
the following concrete subgroups.  Do not replace their carriers by abstract groups of the right
order.

1. `cyclicSU2 n`, `n ≥ 2`, generated by
   `diag(exp(2πI/n), exp(-2πI/n))`; prove its exact order `n` and identify it with `Multiplicative
   (ZMod n)`.
2. `binaryDihedralSU2 n`, `n ≥ 2`, generated by
   `r = diag(exp(πI/n), exp(-πI/n))` and `s = !![0,1;-1,0]`.  Prove the normal forms
   `r^j` and `s*r^j`, exact order `4n`, and
   `r^(2n)=1`, `s²=r^n=-1`, `s*r*s⁻¹=r⁻¹`.
3. In unit-quaternion coordinates construct `binaryTetrahedralSU2`, the 24 points
   `(±1,0,0,0)` and their coordinate permutations together with
   `(±1±i±j±k)/2`; prove closure, distinctness and order 24.
4. Construct `binaryOctahedralSU2` by adjoining the 24 points with exactly two nonzero
   coordinates, both `±1/√2`; prove closure and order 48.
5. With `φ=(1+√5)/2`, construct `binaryIcosahedralSU2` as the 120 vertices of the unit
   600-cell: the 24 tetrahedral points and the 96 points obtained by even coordinate permutations
   of `(0,±1,±φ,±φ⁻¹)/2`; prove closure and order 120.

For each subgroup expose the inclusion, faithful defining representation, determinant-one
alternating form, and an `SL₂(ℂ)` copy.  Relate the coordinate and standard presentation
generators so later computations can use either.  These are the explicit constructions in
Conway--Smith [CS03, §6.5] and Choi--Lee [CL18, §§2--4, especially §2.1 and Thms. 1--2].  The target is **not** the theorem that
these exhaust, up to conjugacy, all finite subgroups of `SU(2)` or `SL₂(ℂ)`.

## Layer 1: irreducibles, the McKay matrix, and named affine ADE

For each named subgroup give a finite, duplicate-free, exhaustive family `(ρ_i)` of irreducible
complex representations, with the trivial representation distinguished.  Define

```text
a_ji = dimℂ Hom_Γ(ρ_j, V ⊗ ρ_i),       C = 2 I - A,
δ_i = dimℂ ρ_i.
```

Prove tensor decompositions, not merely equality of dimensions.  The defining representation is
two-dimensional, faithful, and equivariantly self-dual through its nondegenerate determinant
pairing; these facts make `A` symmetric and its McKay graph connected.  Package each result as an
identification with the **affine simply-laced diagram and Cartan matrix of the indicated tag and
parameter, taken from the zigzag/preprojective roadmap's Layer 0 family**, not as an arbitrary
matrix carrying a name.  Prove the following named identifications, without deriving or claiming
an exhaustive classification:

| subgroup | order | affine type | multiset of entries of `δ` |
|---|---:|---|---|
| `cyclicSU2 n` | `n` | `Ã_(n-1)` | `n` copies of `1` |
| `binaryDihedralSU2 n` | `4n` | `D̃_(n+2)` | four `1`s and `n-1` copies of `2` |
| `binaryTetrahedralSU2` | 24 | `Ẽ₆` | `1,1,1,2,2,2,3` |
| `binaryOctahedralSU2` | 48 | `Ẽ₇` | `1,1,2,2,2,3,3,4` |
| `binaryIcosahedralSU2` | 120 | `Ẽ₈` | `1,2,2,3,3,4,4,5,6` |

Handle cyclic `n=2` as the multiplicity-two affine `Ã₁` matrix rather than forcing it into a
simple graph.  It participates only in the McKay-matrix and representation-ring layers: all
simple-graph zigzag corners and FKS graph functors below require cyclic `n ≥ 3`.  Under the existing
`affineE8Graph` numbering (central vertex `0`, arms of edge lengths
`1,2,5`), the required vector is `(6,3,4,2,5,4,3,2,1)` and vertex `8` is the trivial/affine node.
Check `Cδ=0` and `∑δ_i²=|Γ|` in every family, with executable checks for the small exceptional
tables.  McKay [McK80, Props. 1--2] defines the graph; Steinberg [Ste85, §1(1)--(5),(8)] proves the
character-eigenvector, positive-semidefinite, null-vector, and named affine-Cartan assertions.

## Layer 2: representation-ring and root-lattice passage

Expose the canonical class `[W] : R_ℂ(Γ)` and prove

```text
[V] [ρ_i] = ∑_j a_ji [ρ_j],
[V] [ℂ[Γ]] = 2 [ℂ[Γ]],
[ℂ[Γ]] = ∑_i δ_i [ρ_i].
```

The second identity makes the regular-representation vector `δ` a null vector of `C`; the
sum-of-squares identity identifies its dimension with `|Γ|`.  The equation `Cδ=0` follows from the
two-dimensional tensor rule alone, but the stronger assertion `ker C=ℤδ` is made **only after** a
complete irreducible family with faithful self-dual defining representation has been identified
with one of the exact connected standard affine ADE Cartan matrices in Layer 1.  There is no
generic radical theorem for an arbitrary `FDRep`.  For each named identification prove integrally
that the symmetric form is positive semidefinite with radical exactly `ℤδ`.  Since the
trivial-representation coordinate of `δ` is `1`, construct an explicit integral equivalence

```text
ℤ^(Irr Γ) / ℤδ  ≃+  ℤ^(Irr Γ \ {trivial})
```

and identify the descended form with the finite ADE Cartan/root-lattice form obtained by deleting
the affine node.  Do not state only a rational quotient, and do not conflate this ordinary
algebraic quotient with a categorical quotient.  The dimension-vector and highest-root statements
are Steinberg [Ste85, §1(3)--(5)].

## Layer 3: skew/smash products and quadratic Koszul duality

Define the skew product on the finitely supported carrier `Γ →₀ A`, prove the displayed
single-term multiplication formula, its universal property, associativity, algebra structure,
and equivalence between left modules and equivariant left `A`-modules.  Separately name the bridge
to the opposite/right convention.

Lift a linear representation on a finite-dimensional `V` to actions on `SymmetricAlgebra k V`
and `ExteriorAlgebra k V`, then form

```text
Sym(V) ⋊ Γ,            Λ(V) ⋊ Γ.
```

Develop quadratic algebras relative to the separable semisimple base `S=k[Γ]` using actual
carriers, not a package containing an unrelated algebra.  Construct the balanced powers of the
finite projective `S`-bimodule `W`, the relative tensor algebra `T_S(W)`, and the quotient
`T_S(W)/(R)`.  Construct the right dual `Wᵛ=Hom_{Sᵐᵖᵖ}(W,S)`, its evaluation pairing, and the
annihilator `R⊥`.  The Koszul target is an explicit linear projective resolution of the
augmentation module `S`, with terms determined by the Koszul syzygies, rather than freely chosen
types and maps.  Then prove:

- `Sym(V) ⋊ Γ` is relative quadratic Koszul;
- with the pinned side convention, `T_S(Wᵛ)/(R⊥)` is graded-algebra isomorphic to
  `Λ(V∗) ⋊ Γ` (or the precisely stated opposite algebra required by the chosen dual-module
  functor);
- the nondegenerate determinant pairing gives an explicit equivariant linear equivalence
  `V ≃ V∗` in dimension two; and
- the Koszul complexes have explicit differentials, augmentation, exactness, and handedness.

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

- for binary groups, `e (Λ(V) ⋊ Γ) e` is the ordinary affine-ADE zigzag algebra;
- for binary groups, `e (Sym(V) ⋊ Γ) e` is the additive preprojective algebra of an orientation
  of the affine McKay graph, with orientation independence supplied by the sibling API.

These are [HK01, §6.3, Props. 16--17 and relation (42)].  Use the corrected arXiv v2 hypotheses:
the ordinary-zigzag and preprojective propositions are for binary subgroups.  No odd-cyclic corner
claim is attributed to those propositions.  A future cyclic relation-level target must first state
its exact doubled-cycle signs as a separate direct calculation (or a proved consequence of the
corrected relative quadratic-duality convention) and cite that calculation precisely; it is not a
completion condition here.

## Layer 5: deformed preprojective algebras

For a finite oriented quiver `Q` and `λ : Q₀ → k`, define

```text
Π^λ(Q) = k Q̅ / ⟨ ∑_(a∈Q₁) (a*a⁺ - a⁺*a) - ∑_i λ_i e_i ⟩,
```

after translating each product to Tau Ceti's later-factor-first convention.  Pin the CBH source
algebra as the quotient with relation `[x,y]-z=0` for a central `z∈Z(ℂ[Γ])`, with this sign, and
pin the vertex weight with no hidden normalization: a central `z` acts on the simple `ρ_i` by a
scalar, and that scalar is the weight,

```text
λ_i = the scalar by which z acts on ρ_i = Tr_{ρ_i}(z) / dim_ℂ ρ_i.
```

The trace is **not** the weight.  Cutting the relation down to a primitive matrix idempotent `e_i`
gives `e_i z e_i = λ_i e_i` because `z` is central, so the corner relation carries the scalar; the
trace differs from it by `dim ρ_i`.  The two agree only when every irreducible is
one-dimensional, that is only in the cyclic families, and disagree for binary dihedral and for
`Ẽ₆`, `Ẽ₇`, `Ẽ₈`.  Construct the weight as `Z(ℂ[Γ]) ≃ ℂ^(Irr Γ)` sending `z` to its block
scalars, and prove that this map is an additive equivalence.

Here `x,y` are the displayed defining representation's standard ordered coordinate basis, fixed
so that its determinant pairing is exactly `1`.  A general change of basis is not silently
absorbed into the symbol `z`.

Expose the equivalent vertexwise relations, prove `Π⁰(Q) ≃ Π(Q)`, and prove orientation
independence by the explicit arrow/reverse-arrow sign transport while keeping the same vertex
weight `λ`.  Then prove the path-length filtration and the full-corner equivalence between the
`[x,y]-z` quotient and `Π^λ(Q)`.  The normalization and comparison are
Crawley-Boevey--Holland [CBH98, §§3--4]; the exact path convention can be cross-checked against
Crawley-Boevey--Kimura [CBK22, Introduction].  This layer proves algebraic presentations only.

## Layer 6: FKS curved complexes, duplexes, and Weyl functors

Generalize the stable/periodic prerequisite, without defining a disconnected parallel theory, to
a genuinely internally graded possibly noncommutative algebra `A`, a central homogeneous
`c ∈ A₂`, and graded left modules.  Record scalar-tower compatibility, degree of the action and
differential, and the homogeneous supercommutation equations.  Implement the FKS structures with
their equations:

- an `(A,c)`-complex has degree-one `d`, `d²(m)=c*m`, and
  `d(a*m)=(-1)^|a| a*d(m)`; define shifts, null-homotopies and `K(A,c)`;
- an `(A,c)`-duplex is the parity version; define cones, the homotopy quotient, and the stable
  quotient by maps factoring through projectives;
- tensoring a curved `(A,A)`-bimodule of square `l(c₀)+r(c₁)` gives the correctly handed functor
  from curvature `-c₁` to curvature `c₀`.

These are [FKS05, §§2.1--2.4, §§3, §4].  Reuse the prerequisite's `MorphismIdeal`, quotient,
duplex, cone and stable-factorization machinery.  If its bounded commutative `CurvedDuplex`
prototype is still the only concrete public declaration, generalizing it to central
algebra-valued curvature belongs in that prerequisite and must not be silently duplicated here.

For the affine zigzag algebra `A=A(G)`, build the literal corner modules `P_a=Ae_a` and
`{}_aP=e_aA`, the multiplication `m_a:P_a⊗{}_aP→A`, and the Frobenius comultiplication
`Δ_a:A→P_a⊗{}_aP`.  For a center parameter `c=∑_i x_i X_i`, define

```text
s_a(c) = c + x_a (∑_(a--b) X_b - 2 X_a).
```

The reflection kernel is precisely `C_{a,-x_a}`: its two maps alternate `Δ_a` and
`-x_a m_a`, and its square is

```text
l(s_a(c)) - r(c).
```

Tensoring this concrete bimodule duplex gives the curvature-changing functor from `c` to
`s_a(c)` and descends through the factor-through-projectives ideal.  Prove its stable inverse when
`x_a ≠ 0`, commuting relations for nonadjacent vertices, and braid relations for adjacent
vertices.  For a base parameter `c`, define its reflection orbit and impose the precise FKS
genericity condition `x_a(c') ≠ 0` for every vertex `a` and every `c'` in that orbit (equivalently,
no orbit point is fixed by a simple reflection).  Only under this condition package the kernels as
autoequivalences giving the Weyl action; without it retain the individual curvature-changing
functors and whichever braid isomorphisms are proved.
These constructions and equations are [FKS05, §6, (6.3)--(6.4), Props. 6.1--6.3, Thms. 1--2].
The skew-group transport is [FKS05, §§8.1--8.2 and §9.3].

Only the algebraic material in FKS §§2--4, 6, 8.1--8.2 and 9.3 is in scope.  Their variety and
sheaf interpretations are not.

## Worked targets

The examples are theorem-level integration tests, not prose illustrations.

### Cyclic `Ã`

For `n ≥ 3`, index irreducibles by `ZMod n`, prove
`V⊗χ_j ≃ χ_(j+1) ⊕ χ_(j-1)`, obtain the cycle matrix, `δ=(1,…,1)`, the quotient by
the diagonal vector, the two skew-group algebras, and their relative quadratic/Koszul duality.
The required `n=3` example computes these data but makes no relation-level zigzag-corner claim.
Handle `n=2` separately only at the multiplicity-two McKay-matrix layer.

### Binary dihedral `D̃`

For general `n ≥ 2`, compute the four one-dimensional and `n-1` two-dimensional irreducibles,
the tensor rules, affine `D̃_(n+2)`, and the regular vector.  Instantiate the ordinary zigzag and
preprojective Morita equivalences and at least one nonzero deformed parameter.

### Binary icosahedral `Ẽ₈`

Give all nine irreducibles and tensor decompositions, the explicit isomorphism with the sibling
`affineE8Graph`, and the regular vector `(6,3,4,2,5,4,3,2,1)` in its numbering.  Machine-check
`Cδ=0`, `∑δ_i²=120`, the affine-to-finite `E₈` lattice quotient, the 34-dimensional affine
zigzag target, the polynomial/preprojective target, and a vertex FKS reflection functor with its
curvature equation.  This is prerequisite validation only; do not attach the downstream
finiteness, higher-gluing, or categorified-`δ` claims to it.

## Explicit exclusions

This roadmap does not formalize classification/exhaustiveness of finite `SU(2)` subgroups, invariant
theory of Kleinian surface singularities, GIT quotients, minimal resolutions, exceptional curves,
McKay or preprojective moduli spaces, Nakajima quiver varieties, sheaves on resolutions,
geometric/derived McKay correspondence, or FKS's geometric realization.  It also does not prove
the research statements in `GOAL.md`, construct the proposed exceptional categorification, or
assert a categorical quotient by `δ`.

## Completion criteria

The roadmap is complete when:

1. all five named subgroup families are concrete subgroups of both `SU(2)` and `SL₂(ℂ)`, with
   orders and defining representations proved;
2. their exhaustive irreducible families, tensor decompositions, affine ADE matrices and regular
   dimension vectors are formalized, including `Ã₁` multiplicity and the pinned `Ẽ₈` numbering;
3. the representation-ring identities and integral quotient by `ℤδ` identify the finite ADE
   root lattice without a categorical overclaim;
4. the left skew-product multiplication, equivariant-module equivalence, actual relative tensor
   quotients, finite-projective hypotheses, right dual and orthogonal relations, graded quadratic
   duality, and linear projective Koszul resolution are proved;
5. literal full-idempotent corners for the binary groups give the ordinary zigzag and
   preprojective presentations, with Morita equivalence derived from fullness; cyclic `n=2` is
   excluded from this simple-graph criterion;
6. the `[x,y]-z` normalization, `λ_i=Tr_{ρ_i}(z)`, deformed preprojective relations, orientation
   transport and full-corner comparison are proved in the Tau Ceti path convention;
7. FKS curved complexes/duplexes and their projective-stable quotients instantiate the sibling
   stable API, and the algebraic Weyl/braid functors satisfy the cited square, inverse and braid
   equations; and
8. the cyclic, binary-dihedral and binary-icosahedral integration tests elaborate and compute.

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
