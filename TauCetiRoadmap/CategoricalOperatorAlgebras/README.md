# Categorical operator algebras and planar constructions

Build C*- and W*-categories, their tensor and module categories, and their
operator-algebra realizations. The library includes unitary duality,
Q-systems and their completion, internal operator algebras, anchored
planar algebras, and fusion-category commutants. It also constructs the
canonical C*-algebras of planar algebras, with their Morita, K-theory and
finite-index tower comparisons.

## Scope, conventions and dependencies

Use Mathlib `Category`, `Preadditive`, `Linear ℂ`, `MonoidalCategory`,
`MonObj`, `Mon`, `MonoidalFunctor`, `HalfBraiding`, `Center`, rigid
categories, `Iso`, `Equivalence`, biproducts and `Karoubi`. Analytic
structure is added to these carriers. In categorical notation `f≫g`
means first f, then g; formulas below use ordinary operator composition,
with the rightmost map applied first. Tensor formulas carry the native
associators and unitors, including where they are suppressed in print.

A dagger is chosen conjugate-linear arrow-reversing involutive data.
Unitary arrows satisfy f†f=1 and ff†=1; a dagger functor preserves this
operation. Dagger tensor functors have unitary structural isomorphisms.
The bi-involution from conjugation/duality and the dagger on morphisms
are distinct operations. Hom spaces are complete complex normed spaces;
weak-* continuity is separately specified in the W* theory. Zero objects
are allowed. Units of nonzero endomorphism algebras have norm one.

A unitary multitensor category is a semisimple idempotent-complete rigid
C*-tensor category with finite-dimensional Hom spaces and finitely many
simple summands of the tensor unit; each object is a finite sum of
simple objects. A unitary fusion category also has
simple unit and finitely many simple isomorphism classes. General
internal-algebra theory below uses an essentially small such category
with simple unit, allowing an infinite set of simples. Take Hom spaces and index sets in `Type u`, objects in `Type (u+1)`,
and generator families indexed in `Type u`. Presheaves take values in
complex vector/Hilbert spaces in `Type u`; their categories and all
completions live in `Type (u+1)`. For separable bimodules use countable
Hilbert sums. Choose a small skeleton for the essentially small input; equivalences transport
all constructions, so a particular skeleton is not mathematical data.

Q-systems use the separable convention `mm†=1_Q`. The unit is not
also required isometric. For a simple-unit category, the unit-isometric
convention in the compact-algebra-object correspondence is transported
by explicit positive scalar rescaling in CA3. Left/right dimension and
sphericality refer to the chosen dual functor, not just a dagger.

No conjectural classifier for arbitrary bicommutant categories is a
target. The finite-depth classifier in CA10 has a specified fusion
subcategory and real generator. General fusion-category actions on
continuous-trace spaces, cocycle-action classification outside the
centrally free amenable separable-predual factor setting of CA9, and
spectral triples of the planar C*-models
are outside scope. Compact quantum groups and their Tannaka realization
are in QuantumGroups; CA1–CA6 supplies their tensor-category inputs.
The positive Temperley–Lieb quotients, their C*-towers and the unitary
TL category are owned by TemperleyLiebOperatorAlgebras, which consumes
CA1a and CA2a; this roadmap builds the unshaded positive TL factor
planar algebra it needs in CA8 directly from Subfactors Layer 6.
Hilbert C*-modules, their adjointable and module compact operators,
interior tensor products, imprimitivity bimodules, linking algebras and
the Rieffel correspondence are HilbertModules H1–H3; CA1a and CA1b
assemble them into a C*-category and a correspondence bicategory. The
Cuntz algebras `O_n` are OperatorAlgebraDynamics D6; CA7's general
Pimsner construction does not rebuild them.

## Exact supplier contracts

- From Mathlib: `Category`, `Preadditive`, `Linear ℂ`, `MonoidalCategory`,
  `MonoidalPreadditive`, `MonoidalLinear`, `MonObj`, `Mon`,
  `MonoidalFunctor`, `Bicategory`, `EndMonoidal`, `HalfBraiding`, `Center`,
  `ExactPairing`, `exactPairingCongrLeft`, `HasRightDual`, `Iso`,
  `Equivalence`, biproducts, `Karoubi`, Day convolution
  (`Mathlib/CategoryTheory/Monoidal/DayConvolution.lean`), `CStarModule`
  and `VonNeumannAlgebra`. They are used as stated at the pin; the analytic
  structure of this roadmap is added to these carriers, never a second copy
  of them.
- From Tau Ceti: `TauCeti.CategoryTheory.Monoidal.Rigid.Basic` (evaluation
  and coevaluation lemmas for `exactPairingCongrLeft`, including
  `TauCeti.exactPairingCongrLeft_evaluation`),
  `TauCeti.CategoryTheory.Monoidal.Rigid.Functor` (strong-monoidal images of
  duals) and `TauCeti.CategoryTheory.Monoidal.Rigid.DoubleDual` (closed
  braided double duals). The chosen-dual pivotal comparison for general
  unbraided multitensor categories is a CA2a target.
- [PivotalSpherical](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PivotalSpherical/README.md)
  Layers 0–4 and 9 supply general pivotal/spherical, rigidity, finite
  semisimple and grading theory. CA2a adds analytic unitary choices and
  their classification and does not duplicate that categorical API.
- [CStarAlgebras C1–C5](../CStarAlgebras/README.md) supplies C* order,
  representations and CP/CB maps.
- [HilbertModules H1–H3](../HilbertModules/README.md) supplies right
  Hilbert B-modules as Mathlib `CStarModule` over `Bᵐᵒᵖ` (H1, with
  Mathlib's finite products on `WithCStarModule` for finite sums), the
  adjointable operators `L_B(E,F)`, the rank-one operators
  `θ_(x,y)z=x⟨y,z⟩`, the module compact operators `K_B(E,F)` and
  `K_B(B)≅B` (H2), and the interior tensor product with its associator
  and unitor unitaries, imprimitivity bimodules with
  `_A⟨x,y⟩z=x⟨y,z⟩_B`, conjugate modules and evaluation unitaries, the
  linking algebra `K_B(E⊕B)`, full corners, the Rieffel correspondence
  and Morita invariance of simplicity (H3). CA1a and CA1b consume them
  as stated there and add only the categorical and bicategorical
  structure.
- [VonNeumannAlgebras V4–V6,V11–V13](../VonNeumannAlgebras/README.md)
  supplies normality and normal representations (V4), projection
  comparison and countable absorption (V5), tracial standard form (V6),
  general standard form, tensor commutation and the continuous core (V11),
  the tracial ultrapower (V12) and the hyperfinite II₁, II∞ and III₁
  models (V13).
- [Subfactors Layers 1–3, 5–9](../Subfactors/README.md) supplies normal
  correspondences, the opposite weight and Connes fusion with its unitors
  (1.1–1.2), the basic construction, Pimsner–Popa bases and the Jones
  tower (2.1–2.3), bifinite bimodules with their conjugate equations and
  statistical dimension and the minimal expectation with
  `Ind(E_0)=d(X)²≤[M:N]` (2.4–2.5), Jones's Temperley–Lieb positivity at
  the permitted moduli (3.2), the extremality criterion
  `d(X)²=[M:N]` (5.1), ordinary shaded planar algebras with the TL planar
  algebra example, rigid planar algebras with angle-power insertion, the
  rigid-to-spherical weight correction and the planar algebra of a
  subfactor (6.1–6.4), graph planar algebras and right planar modules with
  their tower graphs (7.1–7.2), the orthogonal and graded/Fock (GJS)
  models (8.1–8.2) and Popa's finite-depth hyperfinite standard model
  (9.1–9.2). CA2b's planar correspondence consumes those abstract
  box/tangle objects, and CA5 owns discrete internal-algebra realizations.
  CA6's anchored theory is different from the scalar shaded operad.
- [FreeProbability F2–F4](../FreeProbability/README.md) supplies the
  noncrossing pair partitions indexing CA8's Wick-contraction trace (F2),
  Fock models (F3) and reduced/amalgamated products (F4); CA7 adds module Pimsner
  presentations and free-graph C* norm/K-theory results. CA8 compares
  their von Neumann closures with Subfactors 8.1–8.2's models.
- [OperatorKTheory K1–K6](../OperatorKTheory/README.md) supplies
  projection/unitary K-groups and full-corner transport (K1–K2), the
  boundary maps closing six-term sequences (K3), extensions (K4), KK and
  the Kasparov product (K5–K6).
  CA7–CA8 own these particular K computations and ordered/trace comparisons.
  General AF/C* classification remains in CStarClassification.

## How to read the build

CA1 builds C*- and W*-categories and bicategories on native carriers.
CA2 adds unitary tensor duality and the shaded planar correspondence. CA3
builds Q-systems and their completion, CA4 internal C*/W* algebra objects,
and CA5 their realization as discrete inclusions. CA6 builds anchored
planar algebras. CA7 builds Pimsner and free-graph C*-algebras, which CA8
uses for the canonical planar C*-towers. CA9 builds complete W*-categories,
the normal correspondence models and fusion commutants, and CA10 classifies
finite-depth real objects in those commutants by CA6.

The definitive specification is this README. [Suggested.lean](Suggested.lean)
records which headline theorems are statable at the pins.

## CA1. Analytic categories, completions and linking algebras

### CA1a. Elementary analytic category interfaces

The C*-category layer consumes CStarAlgebras and builds its Hilbert
C*-module examples from HilbertModules H1–H2.
The W*-category portion also consumes VonNeumannAlgebras V4 for preduals,
normality and Sakai's theorem. These interfaces are independent of normal
correspondences and subfactor theory; TemperleyLiebOperatorAlgebras A6
consumes the C* portion.

Construct a dagger on a native complex linear category, with identity,
composition, involution, additivity and conjugate-scalar laws. Define
C*-categories by Banach Hom spaces, bilinear contractive composition,
isometric dagger, `‖f†f‖=‖f‖²`, and positivity of f†f in End(X).
Construct the compatible C*-algebra structure on each End(X), using
operator-order composition. Prove identities, zero-object formulas,
Cauchy–Schwarz and polarization, norm bounds, closed kernels of
continuous linear maps on Hom spaces and automatic contractivity of linear dagger functors;
faithful such functors are isometric.

Build finite linking algebras for lists of objects, their corner
identifications and matrix positivity. Recover the Hom norm and
positivity from two-object corners. Call a C*-category finitely unitarily
Cauchy complete when it admits finite orthogonal sums and unitary
splittings of all self-adjoint idempotents. Construct finite orthogonal sums,
unitary splittings of self-adjoint idempotents, and additive/Karoubi
completion. Compare with native biproducts and `Karoubi`, proving an
idempotent is similar through an invertible morphism to a self-adjoint
projection before using the C* splitting. Compare its algebraic retract
with that projection's range; unitary conjugacy is asserted only for
self-adjoint projections. Prove the completion's universal property for
linear dagger functors, with unitary natural transformations and
independence of chosen splittings. Build examples from finite Hilbert
spaces and Hilbert C*-modules with adjointable maps.

Hilbert C*-modules are HilbertModules' right Hilbert B-modules, a
`CStarModule` over `Bᵐᵒᵖ` read through `MulOpposite.unop`, so that
`⟨x,yb⟩=⟨x,y⟩b`. Prove that right Hilbert B-modules with HilbertModules
H2's spaces `L_B(E,F)`, their composition, adjoint and operator norm form
a C*-category in the sense above, with the zero module as zero object,
the Hilbert-module direct sums as its finite orthogonal sums, and the
module compact operators `K_B(E,F)` as a closed two-sided ideal of it.
For the pair (E,B) its finite linking algebra is `L_B(E⊕B)`, which
contains HilbertModules H3's linking algebra `K_B(E⊕B)` as a closed
ideal.

A W*-category has dual Banach Hom spaces with separately weak-* continuous
composition and weak-* continuous dagger. Prove equivalence with the
finite-linking-algebra W* criterion, construct its preduals and normal
functors, and prove normality is detectable on finite sums' endomorphism
algebras. Develop weak-* closed subcategories, their corners, commutants,
normal representations and pointwise weak-* limits of uniformly
bounded natural transformations between fixed normal functors. Prove
naturality and the component norm bound; pointwise limits of arbitrary
normal functors are not asserted to preserve normality.

Construct orthogonal direct sums indexed by sets in `Type u`, with bounded column/row morphism criteria and convergence of
finite partial sums. Define W*-Cauchy completeness here to require these
sums and projection splittings, in the W* sense used in CA9. Construct
this completion and its normal-functor universal property. A finite
additive Karoubi completion alone does not supply infinite W* sums.

**Checks.**

- In finite-dimensional Hilbert spaces with the operator norm,
  `f=diag(2,1)` has `‖f†f‖=4=‖f‖²`. With the Hilbert–Schmidt norm
  instead, `‖f‖₂²=5` while `‖f†f‖₂=√17`, so a Hom norm other than the
  operator norm fails the C*-identity.
- The idempotent `e(x,y)=(x+y,0)` on ℂ² has `‖e‖=√2` and `e†≠e`. Its
  algebraic retract `ℂ²→ℂ`, `(x,y)↦x+y`, has norm √2 and is not the
  adjoint of the inclusion `t↦(t,0)`; the self-adjoint projection with the
  same range is `diag(1,0)`, and only it gives a unitary splitting.
- The zero object has `End(0)=0`, whose unit has norm 0: the norm-one
  condition on units applies to nonzero endomorphism algebras only.
- In the W*-category of Hilbert spaces the orthogonal sum of countably
  many copies of ℂ is ℓ². The column ℂ→ℓ² with components `1/n` is a
  morphism (`Σ1/n²=π²/6`), while components `1/√n` give none (`Σ1/n`
  diverges); finite partial sums of the first converge in norm.
- For unital `B=C([0,1])` the right self-module has `L_B(B)≅B`, T↦T(1)
  acting by left multiplication, so End of that object is `C([0,1])`. Its
  only projections are 0 and 1, while a W*-algebra is the norm-closed span
  of its projections; so the C*-category of Hilbert `C([0,1])`-modules
  fails the finite-linking-algebra W* criterion, whereas for `B=ℂ` it is
  the W*-category of Hilbert spaces with `End(ℂ²)=M₂(ℂ)`.
- Starting from the one-object W*-category with `End=ℂ`, the finite
  additive Karoubi completion is `Hilb_fd`, whose objects all have finite
  dimension, while the W*-Cauchy completion contains `ℓ²(ℕ)` as the sum of
  countably many copies of ℂ: the two completions differ.

*Needs:* Mathlib `Category`, `Preadditive`, `Linear`, biproducts,
`Karoubi`, `CStarModule`, `MulOpposite`; CStarAlgebras C1–C5;
HilbertModules H1–H3; VonNeumannAlgebras V4.

### CA1b. Analytic bicategories and correspondences

Add analytic structure to a native `Bicategory`: each Hom category is
C* (respectively W*), horizontal composition is bilinear, contractive
and dagger compatible on 2-cells (separately normal in the W* case),
and associator/unitor 2-isomorphisms are unitary. Define dagger
pseudofunctors, bounded unitary pseudonatural comparisons and
modifications; prove whiskering/interchange and the normal composition
laws. Use `EndMonoidal b` for the monoidal endomorphism category at b.

A B–C correspondence is a right Hilbert C-module F with a
*-homomorphism `φ:B→L_C(F)`. Its interior tensor product `E⊗_B F` with a
right Hilbert B-module E, the associator unitaries, the unitor
`E⊗_B B≅E`, the unitor `B⊗_B F≅F` for nondegenerate φ and their pentagon
and triangle identities, imprimitivity bimodules, conjugate bimodules Ē
with the evaluation unitaries `E⊗_B Ē≅A` and `Ē⊗_A E≅B`, strong Morita
equivalence and the Rieffel correspondence are HilbertModules H3, and
this layer consumes them.

Construct C*- and W*-bicategories from right C*-correspondences and
normal Hilbert correspondences respectively, with nondegenerate left
actions and adjointable/bounded bimodule intertwiners. The nondegeneracy
hypothesis supplies the left unitors; include it in the carriers rather
than silently using it for arbitrary adjointable actions. Prove linear/dagger hom-category structure,
unitors, associators, interchange and pentagon/triangle identities from
HilbertModules H3's interior tensor product and Subfactors Layer 1's
tensor constructions. Use M–N correspondences and compose
H:M–N, K:N–P by H⊗_N K. On normal scalar-Hilbert correspondences,
construct conjugate bimodules as the bi-involution, including its
reversed tensor coherence. The general right C*-correspondence
bicategory carries the dagger on 2-cells. Construct reversed
C*-correspondences on the subbicategory of HilbertModules H3's
imprimitivity bimodules using both inner products, with conjugation and
reversed tensor coherence.

**Checks.**

- Over `M=N=P=ℂ` correspondences are Hilbert spaces and composition is the
  Hilbert tensor product: ℂ² composed with ℂ³ has dimension 6.
- Let `A=ℂ²` act on `X=ℂ` (a right ℂ-module) by `(a,b)·x=ax`; this is
  nondegenerate and the left unitor `A⊗_A X→X` is unitary. With the zero
  left action every inner product `⟨a⊗x,a′⊗x′⟩=⟨x,φ(a*a′)x′⟩` vanishes,
  so `A⊗_A X=0` while `X=ℂ`: no unitary left unitor exists without
  nondegeneracy.
- For `M=M₂(ℂ)` with its normalized trace, `L²(M)=M₂(ℂ)` and `J(ξ)=ξ*`
  intertwines the conjugate bimodule with the original:
  `J(b*ξa*)=aξ*b`.
- The `M_n(ℂ)`–ℂ imprimitivity bimodule ℂⁿ and its reversed ℂ–`M_n(ℂ)`
  correspondence `(ℂⁿ)‾` compose to `ℂⁿ⊗_ℂ(ℂⁿ)‾≅M_n(ℂ)`, of dimension n²,
  and `(ℂⁿ)‾⊗_(M_n(ℂ))ℂⁿ≅ℂ`, of dimension 1: the identity 1-cells at the
  two objects, so the reversal is an inverse up to unitary 2-cells. A
  reversal taken to be ℂⁿ itself would not even compose for n≥2.

*Needs:* CA1a; Mathlib `Bicategory`, `CStarModule`; HilbertModules H3;
Subfactors Layer 1 (1.1–1.2).

## CA2. Unitary tensor duality and shaded planar algebras

### CA2a. Tensor and unitary-duality interfaces

This layer consumes CA1a's C*-category interfaces and native tensor/rigid
categories only. Its definitions and duality theorems do not require
subfactor correspondences, planar reconstruction or module correspondences.
TemperleyLiebOperatorAlgebras A6 instantiates this layer directly.

Add dagger compatibility and unitary associators/unitors to the native
tensor structure; prove tensor norm and dagger laws. Build tensor-functor
categories and unitary monoidal natural isomorphisms.
For a rigid object construct solutions of the conjugate equations,
standard/balanced solutions, dual morphisms and dimension,
using native right duals `Xᘁ` as primary and transporting left duals
through the chosen pivotal comparison, with direct
sum, subobject and tensor compatibilities. Prove positivity, invertibility
and uniqueness of balanced solutions up to unitary equivalence in the
simple-unit setting. Separate that statement from arbitrary choices of
a dual functor on a multitensor category.

Define a unitary dual functor by chosen evaluations/coevaluations with
unitary tensorator and `(f∨)†=(f†)∨`. Construct its pivotal comparison
and left/right traces, positive dimensions and bi-involution. For a
unitary `r:x→x∨`, pin evaluation as ev_x:x∨⊗x→1 and the
symmetric-evaluation equation as
ev_x∘(r⊗id_x)=ev_(x∨)∘(φ_x⊗r), with unitors understood.
Prove this equivalent to `r̄ r=φ_x`, where `x̄=x∨`, `f̄=(f†)∨` and
`φ_x:x→x̄̄` is the chosen unitary pivotal comparison. Thus
`r=r̄†φ_x`; use these typed formulas for real objects and transport. Define
the signed self-duality variants by `r̄ r=ε φ_x`, ε∈{+1,−1},
equivalently `r=ε r̄†φ_x`. Their evaluation equation is
ev_x∘(r⊗id_x)=ε ev_(x∨)∘(φ_x⊗r).
Construct their cup equations
and unitary transport, retaining the negative
Frobenius–Schur sign as distinct data. On a simple self-dual object prove
the sign is independent of the normalized unitary identification; in the
finite-Hilbert realization the negative sign gives an antiunitary J with
J²=−1 and forces even Hilbert dimension. Compare both signs with standard
conjugate solutions and their positive intrinsic dimension; positivity
does not change a negative sign into symmetric self-duality. Define
the tensor-product sign law `ε(r_x⊗_β r_y)=ε(r_x)ε(r_y)` for
the constructed braided self-duality map under an explicit unitary
symmetric braiding with its dual/pivotal compatibility and trivial
induced twist on the generated tensor category. Construct the tensor
self-duality map using the braiding to reverse the dual factors and
prove the law.
In a general rigid category the dual
of X⊗Y has the reversed order Y∨⊗X∨; individual self-duality maps
alone do not supply a self-duality of X⊗Y. Define
pseudounitary pivotal structures by strictly positive left and right
simple-object dimensions.
Construct the universal grading groupoid from the simple unit summands,
nonzero simple objects, and tensor-product decomposition relations;
prove its universal property, transport and skeleton independence.

Prove the canonical bijections between pseudounitary pivotal structures
modulo monoidal natural isomorphism, unitary dual functors modulo unitary
monoidal natural isomorphism, and groupoid homomorphisms to the positive reals `ℝ>0`.
For a homogeneous simple X pin the character to `dim_L(X)/dim_R(X)`.
For equivalence of chosen dual functors require the canonical monoidal
natural comparison determined by their evaluations/coevaluations to be
unitary and to intertwine those data. Construct the inverse
positive-character rescaling, check conjugate equations and tensor
coherence, and prove the two composites and uniqueness of this
duality-compatible comparison. Do not assert uniqueness among arbitrary
unitary monoidal automorphisms of the underlying dual functor. Identify the balanced
simple-unit choice with the spherical structure and prove, for simple
unit, sphericality equivalent to the trivial grading character.
For a nonsimple unit, a trivial character means equality of the scalar
left/right dimension coefficients after `End(1_i)=ℂ`; it does not mean
equality of the two different unit projections as End(1)-valued traces.
Define a spherical faithful state ψ on End(1) by `ψ(tr_L(f))=ψ(tr_R(f))`
for all endomorphisms f. Develop its positive unit-summand weights and
the resulting trace-compatibility equations; the equal-weight state
is spherical for the balanced choice. Keep this state condition
distinct from a native spherical-category structure with simple unit.

**Checks.**

- In finite-dimensional Hilbert spaces, `J(a,b)=(−b̄,ā)` on ℂ² is
  antiunitary with `J²(a,b)=(−a,−b)`, so the corresponding self-duality has
  sign ε=−1; `J′(a,b)=(b̄,ā)` has `J′²=1` and ε=+1. On ℂ every antiunitary
  is `J(a)=cā` with `|c|=1` and `J²(a)=|c|²a=a`, so ε=−1 does not occur in
  dimension 1.
- Under the flip braiding of Hilbert spaces, the tensor square of the ε=−1
  structure on ℂ² is `J⊗J` with `(J⊗J)²=J²⊗J²=+1`, matching
  `ε(r⊗_β r)=(−1)(−1)=+1`.
- For the pointed category `Hilb(ℤ/2)` the universal grading group is ℤ/2.
  A homomorphism `χ:ℤ/2→ℝ>0` has `χ(g)²=1`, hence `χ=1`, so the unitary
  dual functor is unique up to equivalence; homomorphisms to ℂ× would give
  two (χ(g)=±1), which is why the target group is ℝ>0.
- For `End†(Hilb_fd ⊕ Hilb_fd)`, with two simple unit summands, the
  grading groupoid is the pair groupoid on two objects and its
  homomorphisms to ℝ>0 form a one-parameter family `t>0`; the balanced
  choice is `t=1`.

*Needs:* CA1a; Mathlib `MonoidalCategory`, `ExactPairing`, `HasRightDual`,
`MonoidalFunctor`; Tau Ceti `TauCeti.CategoryTheory.Monoidal.Rigid.Basic`,
`TauCeti.CategoryTheory.Monoidal.Rigid.Functor`; PivotalSpherical
Layers 0–4, 9.

### CA2b. Planar and module correspondences

This layer consumes CA2a, CA1b and Subfactors Layers 5–7 for the comparisons
below. Its reconstruction/equivalence targets are separate from CA2a's
elementary tensor and duality interfaces.

Prove the shaded correspondence at object and morphism level (Penneys,
Theorem C, p. 4): shaded ordinary-operad planar C*-algebras with
finite-dimensional boxes correspond to triples
(C,∨,X), with C a unitary multitensor category, chosen unitary dual
functor, an orthogonal decomposition `1=1_+⊕1_-` of the unit, and
`X=1_+⊗X⊗1_-`. The summands 1_± need not be simple: the zero boxes
are the finite-dimensional commutative C*-algebras `P_(0,±)≅End(1_±)`,
and the left and right closures are faithful positive maps into them.
The connected case `P_(0,±)=ℂ` corresponds exactly to simple 1_±
(Penneys, §4, dictionary on p. 23); subfactor planar algebras are
connected. Every object is a summand of a finite direct sum
of alternating tensor words in X,X∨, including the empty words.
Build the category of rectangular boxes, projections and finite sums
from the planar algebra, and recover boxes/tangle operations from the
category. Morphisms of triples are dagger tensor functors with unitary
duality comparison and a specified unitary image of the generator,
preserving the two unit summands; transformations preserve these data.
Match them with planar *-algebra morphisms commuting with all tangles.
Preserve two shadings, marked intervals, positive box inner
products and left/right closures. Prove functoriality, unitary comparison
and inverse equivalences. Compare Subfactors 5.1 and 6.4's bimodule/planar construction. For general finite-index
inclusions first use Subfactors 6.3's weight correction from the rigid operad to
the ordinary planar operad, and then identify the resulting
balanced unitary duality on the sphericalized category and the two
original closure functionals recovered from its retained positive
weight w and Subfactors 6.2's angle-power insertion. The invariant compared here
is the pair (spherical category,w), not the spherical category alone.
Keep the E_N-induced weighted rigid evaluation distinct from the
ordinary spherical closure. Sphericality remains an additional
condition on the general planar correspondence.

Construct pivotal right module C*-categories over a unitary multitensor
category: dagger action functors with unitary module associators/unitors
and a module trace compatible with its chosen pivotal traces. Develop
module functors, unitary natural transformations, finite sums, subobjects
and generation by a chosen object. For the generated 2-by-2 category of a subfactor planar algebra,
prove the correspondence between connected right planar modules of
Subfactors 7.2 and indecomposable pivotal right module C*-categories with a
simple basepoint m=m⊗1₊ with Tr_m(id_m)=1, generating under the
alternating strand action.
Use the prescribed positive Markov tower dimensions: rectangular module
boxes give the Hom spaces, concatenation gives the action, closure gives
the module trace, and range projections give the C* completion. Recover
the planar module from Hom spaces of alternating words acting on the
generator, with the prescribed trace and Markov normalization; prove
functoriality and the two inverse comparisons. Identify the level-zero
identity with the simple basepoint in the rectangular-box projection
category and prove its strand-action fusion graph is Subfactors 7.2's
tower graph. Subfactors 7.2 owns the tower and
graph embedding; this milestone owns the abstract module-category
equivalence.

**Checks.**

- For the connected finite bipartite graph `u₁ — w — u₂` with `V₊={u₁,u₂}`
  and `V₋={w}`, Penneys's bipartite-graph example (Example 4.7) gives a
  triple with `1₊` a sum of two simples, so `P_(0,+)=ℂ²` and `P_(0,−)=ℂ`.
  A definition requiring `P_(0,±)=ℂ` excludes this example; the connected
  case is a graph with one even and one odd vertex.
- In the shaded TL planar algebra with modulus δ, the Gram matrix of
  `P_(2,+)` in the basis `{1,e}` is `[[δ²,δ],[δ,δ²]]`, with determinant
  `δ²(δ²−1)>0` for δ>1.
- For a subfactor planar algebra regarded as a right planar module over
  itself, the basepoint is `1₊` with `Tr(id)=1` and the fusion graph of the
  strand action is the principal graph.

*Needs:* CA2a, CA1b; Subfactors 5.1, 6.1–6.4, 7.1–7.2.

## CA3. Q-systems and their bicategorical completion

Throughout CA3 require the C*/W*-bicategory B to be locally unitarily
Cauchy complete in CA1a's finite sense: every Hom category has finite
orthogonal sums and unitary splittings of self-adjoint idempotents.
This is separate from the W*-Cauchy completeness with arbitrary sums
used in CA9. Verify this hypothesis for CA1b's intended correspondence
bicategories: finite direct sums and adjointable projection ranges
are right Hilbert C*-correspondences with nondegenerate inherited left
actions, and bounded projection ranges are normal Hilbert
correspondences. Prove the inclusions and orthogonal projections are
bimodule intertwiners and the splittings have the required analytic
structure.

A Q-system at b is a monoid object
Q in `EndMonoidal b`, with multiplication m:Q≫Q→Q and unit
i:1_b→Q. The 2-cell equations below use native bicategory associators
and unitors; a C*-tensor category is the one-object specialization.
Require
Frobenius `m†m=(m⊗1)(1⊗m†)=(1⊗m)(m†⊗1)` and specialness
`mm†=1_Q`. Build unit/associativity/Frobenius consequences, separability
projection, dagger/opposite and scalar-rescaling laws. Define morphisms
and equivalences of Q-systems by their actual algebra and dagger
compatibilities. Distinguish algebra homomorphisms from Morita
bimodules and from arbitrary intertwiners of underlying objects.

For Q-systems P at a and Q at b, construct unital Frobenius
P–Q bimodules with underlying 1-cell X:a→b and 2-cell actions
`λ:P≫X→X`, `ρ:X≫Q→X`.
Require associativity, commuting actions, both unit laws, action
Frobenius identities and `λλ†=ρρ†=1`. Explicitly use
`λ†λ=(m_P⊗1)(1⊗λ†)=(1⊗λ)(m_P†⊗1)` and
`ρ†ρ=(1⊗m_Q)(ρ†⊗1)=(ρ⊗1)(1⊗m_Q†)`.
Construct adjoints and spaces of bimodule intertwiners.

Compose X:P–Q and Y:Q–R by the range of the self-adjoint idempotent
`p=(ρ_X⊗λ_Y)(1_X⊗m_Q†i_Q⊗1_Y)` on X⊗Y. Prove self-adjointness,
idempotence and balancedness, then split it unitarily inside the original
Hom category using the standing local unitary Cauchy-completeness
hypothesis. Show the
range is the balanced coequalizer, independent of the splitting.
Construct its left/right actions, regular-Q units and unitors,
associators from the splittings, and prove all bicategory coherences.
Build QSys(C) and its canonical fully faithful hom-wise inclusion.
Prove QSys(C) is again locally unitarily Cauchy complete in the finite
sense: finite orthogonal sums carry the componentwise bimodule actions,
and a self-adjoint bimodule-intertwiner idempotent splits using the
ambient Hom category's splitting. Transport both actions through its
isometry, and prove all unital Frobenius and specialness equations for
the range. Prove normality of these constructions in the W* case.
This supplies the carrier for iterating QSys and its completion
universal property.

Define splitting by a dual pair of 1-morphisms X,X̄ and a unitary
algebra identification `Q≃X⊗X̄`, with multiplication
`1_X⊗ev⊗1_X̄`, unit coev, and `ev ev†=1` in the separable
normalization, and prove Q-system
completeness iff every Q-system splits. Prove QSys(QSys(C))≃QSys(C),
its completion universal property and normal W* version. Construct
realization in the C*-bicategory of unital C*-algebras and right
correspondences: the realized algebra, norm/completion, correspondence
actions and intertwiner maps; check tensor/splitting comparisons.
Prove this bicategory Q-system complete and the realization/inclusion
biequivalence. Construct the corresponding normal W* realization.

For the simple-unit connected compact-object comparison in CA4, translate
the unit-isometric convention `i†i=1`, `mm†=d_Q·1`, where d_Q is the
standard statistical dimension of Q, to the separable
one by `m'=d_Q^(-1/2)m`, `i'=d_Q^(1/2)i`. Prove both unit laws and
Frobenius preserved, `m'm'†=1`, and `i'†i'=d_Q·1`. The target of this
conversion is the connected standard separable Q-system; retain the
standard evaluation `i†m`, which the rescaling leaves unchanged. Connectedness
means dim Hom(1,Q)=1. On involutive algebra morphisms f:Q₁→Q₂
use `f'=sqrt(d_(Q₂)/d_(Q₁)) f`, not f itself. Prove both algebra
and unit equations for f', preservation of the involution, identities
and composition; the reciprocal rescaling gives the inverse functor. Keep the standard conjugate-equation condition
in the unit-isometric Q-system notion; unit normalization alone does
not supply that condition. Construct the finite-index Q-system on `_N L²(M)_N` from Subfactors 2.4's
dualizable bimodule `X=_N L²(M)_M` and its standard solution, identifying
it with `X⊗_M X̄`. Derive multiplication and unit from evaluation/
coevaluation and compare the separable and unit-isometric normalizations
with the inclusion trace. For the standard solution prove `d_Q=d(X)²`;
then Subfactors 2.5 gives `d(X)²=Ind(E₀)≤[M:N]` and Subfactors 5.1 gives
equality exactly in the extremal case. Compare separately the
trace-preserving E_N-induced nonstandard
solution and its Jones-index scalar; no equality of these two
normalizations is imposed on a nonextremal inclusion. Subfactors 2.4
supplies the dual pair; constructing its Q-system is owned here.

**Checks.**

- Take `Q=M_n(ℂ)` in finite-dimensional Hilbert spaces with
  `⟨x,y⟩=n⁻¹Tr(x*y)`. Then `i†i=1` and `mm†=n²=d_Q`, the unit-isometric
  convention. After `m′=n⁻¹m`, `i′=n i` one gets `m′m′†=1`, `i′†i′=n²` and
  `i′†m′=i†m`; for n=2 the values are 1, 4 and the unchanged evaluation.
  The wrong rescaling `m′=d_Q⁻¹m` would give `m′m′†=n⁻²`.
- The unital map `f:ℂ→M_n(ℂ)`, `a↦a·1`, goes from `d₁=1` to `d₂=n²`, and
  `f′=√(d₂/d₁)f=n f`. Then `f′(i₁′(1))=n·1=i₂′(1)`, while the unscaled f
  gives `1≠n·1` for n≥2.
- With the trivial Q-system `Q=1` and unitor actions the balanced projector
  is the identity of X⊗Y. For `Q=M_n(ℂ)` with X the row vectors and Y the
  column vectors, its range `X⊗_Q Y` is one-dimensional inside the
  `n²`-dimensional `X⊗Y`.
- `M_n(ℂ)` splits as `ℂⁿ⊗(ℂⁿ)‾` with multiplication `1⊗ev⊗1` and unit coev.

*Needs:* CA1a, CA1b, CA2a; Mathlib `MonObj`, `Mon`, `EndMonoidal`;
HilbertModules H2; Subfactors 2.4–2.5, 5.1.

## CA4. Internal C*/W* algebra objects

For essentially small semisimple rigid C*-tensor C with simple unit and
finite-dimensional Hom spaces, require CA1a's finite unitary Cauchy
completeness, so the one-object bicategory meets CA3's local hypothesis.
Construct complex linear presheaves Vec(C), and Hilbert-space objects Hilb(C),
using simple-object coefficient spaces, their direct sums, bounded
natural transformations and dagger. Build linear Day convolution,
monoidal Yoneda and the tensor of Hilbert objects, including completion
and Fubini/unit/coherence isomorphisms. Use native Day convolution and
linear Yoneda, adding the linear/Hilbert specialization and needed
coends as targets. Compare representable/compact objects with C.

Construct monoid/algebra objects, left module categories and free modules
c⊗A. Reuse CA2's right-module API through the tensor-reversing
opposite, with explicit action/associator comparisons. Prove algebra objects correspond to cyclic C-module categories
with a chosen basepoint, on both functors and morphisms. Define a star
algebra object by the corresponding cyclic dagger structure and prove
the equivalence with the explicit involutive natural-transformation
form. C*/W* algebra objects are those whose free-module categories
carry the CA1 analytic structure; construct their finite linking
algebras, norm/order/predual API and normal star transformations.

Construct internal B(H), positive transformations and categorical CP:
positivity of the induced maps on End(c⊗A) for every c, with finite
sums giving matrix positivity. Build the faithful internal GNS/
Gelfand–Naimark representation. Prove Stinespring for unital CP
`θ:A→B(H)`: construct K, a star representation π and an isometry
v:H→K with θ(a)=v†π(a)v; prove minimality/uniqueness and transport.
Build internal linking algebras and commutants of cyclic left/right
module dagger subcategories: maps commute with every opposite-sided
module morphism. Prove their weak-* closure equals the bicommutant,
and the faithful-normal W* representation identifies A with A''.
This is a module-category commutant, distinct from CA9's tensor
half-braiding commutant.

An internal W* object is compact when its L² Hilbert object lies in
C, and connected when A(1)=ℂ. Prove compact connected W* algebra
objects with unital star natural transformations equivalent to
unit-isometric irreducible Q-systems with involutive algebra morphisms.
Construct the GNS projection in H⊗H̄ as
`p=Σ_(a,f) α_(a,f) α_(a,f)†`, where a ranges over simple classes,
f over an orthonormal basis of A(a), and
`α_(a,f)=d_a^(1/2)d_H^(-1/2)λ̃_a(f)`. Use the GNS inner product
on A(a) transported by its canonical coefficient inclusion
`Λ_a:A(a)→H(a)`. Pin the coefficient inner product on the
representable Hilbert object to the categorical trace:
`⟨h,k⟩=Tr_a(h†k)`. The GNS pairing closes its star/multiplication
diagram with the standard coevaluation of a; for a unit-isometric
standard Q-system and simple a it is `d_a c` when `f†g=c id_a`.
Prove that Λ transports this GNS pairing to the trace pairing, rather
than to the unweighted scalar c.
Here λ_a(f):a⊗H→H is the GNS action and
`λ̃_a(f)=(λ_a(f)⊗1_H̄)(1_a⊗coev_H)` is its Frobenius-reciprocity
mate using H's standard duality, with `coev_H†coev_H=d_H`.
Prove `λ̃_a(f)†λ̃_a(g)=(d_H/d_a)⟨f,g⟩ id_a`, hence
`α_(a,f)†α_(a,g)=⟨f,g⟩ id_a`; the GNS-orthonormal bases give
isometric simple summand maps. For a representable Q this also gives
`α(f)†α(g)=d_a(d_Q/d_H) f†g`. Reciprocity itself is not asserted
isometric.
Compactness makes this sum
finite. Scale the projected trivalent multiplication by d_H^(1/2)
and the projected cup by d_H^(-1/2); prove d_H=d_Q for its image Q.
From these orthonormal coefficient bases, prove basis independence, self-adjointness and idempotence,
and equip its image with multiplication/unit and standard duality.
Prove the two functors are fully faithful and essentially surjective;
transport to CA3's separable convention by its explicit rescaling.
Compactness here is categorical finite representability, not compactness
of all Hilbert-space operators in an analytic representation.

**Checks.**

- The trivial algebra object `A(a)=Hom(a,1)` is compact and connected and
  corresponds to the trivial Q-system with `d_Q=1`.
- The transpose map on `M₂(ℂ)` is positive but not CP: amplified by `c=ℂ²`
  it sends `Σ e_ij⊗e_ij` to the flip, which has eigenvalue −1. The
  categorical CP condition tests every `End(c⊗A)` and excludes it.
- For `Q=H=1` and `a=1` the GNS normalization `α(f)†α(g)=d_a(d_Q/d_H)f†g`
  reduces to `α(f)†α(g)=f†g`.

*Needs:* CA1a, CA2a, CA3; Mathlib Day convolution, `MonObj`;
CStarAlgebras C4; VonNeumannAlgebras V4.

## CA5. Discrete inclusions and internal-algebra realization

Fix a II₁ factor N and a fully faithful bi-involutive representation
`H:C→Bim_bf^sp(N)` compatible with standard forms and bifinite
bimodules. Here the target consists of bifinite spherical N–N bimodules:
their canonical left and right traces on the endomorphism algebra agree.
Equip it with standard duality and its bi-involution. Define its Hilbert
completion from direct sums of represented
simples. A discrete expected inclusion `(N⊆M,E)` has a faithful normal
E, M a factor, and standard L²(M,τ_N∘E) a sum of bifinite N–N
bimodules. Define extremality for that discrete inclusion by equality
of the left/right canonical traces/dimensions on its finite bimodule
summands, using Subfactors 1.1's standard-form comparison; retain irreducibility
`N′∩M=ℂ`. Supported means its L² object is in Hilb(H(C)).

Realize a connected internal W* object algebraically by its represented
simple coefficients. Construct multiplication, involution, bounded
vectors, Hilbert completion, the represented von Neumann algebra and
expectation onto N. Prove normality, faithfulness, factoriality,
irreducibility, discreteness, extremality and the support condition.
Do not assume M is finite: the canonical faithful state is τ_N∘E,
and the realization can be type III. In reverse extract the internal
object by represented bimodule Hom spaces and Frobenius reciprocity,
with its CP/order/predual structures.

Prove the relative-to-H equivalence: connected internal W* objects
with categorical ucp maps correspond to extremal irreducible discrete
inclusions supported on H(C), with normal N–N-bilinear ucp maps
ψ:M→P satisfying `(τ_N∘E_P)∘ψ=τ_N∘E_M`. Construct maps by
internal Stinespring and Hilbert realization, check composition, and
prove both natural inverse comparisons. Restrict to unital *-algebra natural transformations
and normal state-preserving N–N-bilinear star homomorphisms.
Construct intermediate-object/inclusion correspondence, conjugation,
and the standard invariant pair (C,A). Compare compact objects with
finite-index Q-systems and Subfactors 5.1's standard invariant, retaining
finite-index, extremality and the fixed representation hypotheses.

**Checks.**

- The trivial inclusion `N⊆N` with `E=id` has `L²(M)=L²(N)`, the trivial
  bimodule, and corresponds to the trivial internal object.
- For an outer action of `ℤ/2` on a II₁ factor N, `N⊆N⋊ℤ/2` is
  irreducible and extremal, `L²(M)` is the sum of the two invertible
  bimodules, and the internal object is compact with `d_Q=2`.
- For an outer action of ℤ, `N⊆N⋊ℤ` is discrete and irreducible but of
  infinite index: its internal object is connected and not compact, so
  discreteness does not imply compactness.

*Needs:* CA3, CA4; VonNeumannAlgebras V4, V6, V11; Subfactors 1.1–1.2,
2.4–2.5, 5.1.

## CA6. Unitary anchored planar algebras

For essentially small semisimple braided unitary pivotal V, with
finite-dimensional Hom spaces and chosen unitary dual functor,
construct anchored tangles: planar disks/strings and disjoint anchor
lines from internal anchor points to the exterior anchor, transparent
to strings. Build isotopy, substitution and the ordering of inputs.
An anchored algebra has box objects P[n] in V and morphisms Z(T)
from their ordered tensor product to the output. Require identity,
substitution, anchor-braiding and twist laws, with the ambient pivotal
twist. Build generating moves and prove they present the tangle
operations, so every isotopy/substitution has a specified action.

A unitary anchored planar algebra is `(P,r,ψ)`, with real structures
r_n:P[n]→P[n]̄ satisfying `r̄_n r_n=ν_(P[n])`, where
ν is the chosen bi-involution comparison `P[n]→P[n]̄̄`, and
faithful unital state ψ:P[0]→1. Require reflection
compatibility through the dual functor's tensorator, and the cap pairing
obtained from ψ and the reflected real-structured mate to equal the
canonical `coev†_(P[n])` pairing. Prove positivity, adjoint and inner
product laws, transport and category structure. For ribbon V define
sphericality by equality of the two annular closures against ψ;
it is an additional axiom.

Construct pointed unitary pivotal V-module multitensor categories: C with
unitary dual functor, braided pivotal dagger functor
`Φ:V→Z†(C)`, faithful state on End(1_C), and symmetrically self-dual
generator x, with unitary `r_x:x→x∨` satisfying
`ev_x(r_x⊗1_x)=ev_(x∨)(φ_x⊗r_x)` for the chosen pivotal
comparison φ_x:x→x∨∨. Identify this condition with the real-bimodule
condition under CA2's chosen dual/conjugate comparison. Require
the composite `V→Z†(C)→C` to
admit a unitary right adjoint Tr_V, with its unit/counit and actual
natural adjunction isomorphisms. Develop the representability criterion:
for each c∈C the functor `v↦Hom_C(Φ(v),c)` is represented in V
exactly when its simple-object coefficient spaces have finite support;
their dimensions are finite by the standing Hom hypotheses. Construct
Tr_V as that finite direct sum when the criterion holds. In particular
it holds for fusion V. No infinite sum is assumed to be an object of V.
The pointing and Φ(V) generate by tensors, finite sums
and subobjects. Morphisms are pivotal dagger tensor functors, unitary
module-action coherence compatible with half-braidings, state transport, a specified unitary `G(x₁)≃x₂`,
and real-structure transport through that unitary and the canonical
duality comparison.
Define the unitary relative center Z_C(E) for a dagger tensor functor
α:C→E: objects are X∈E with unitary natural half-braidings
`X⊗α(c)≃α(c)⊗X`, with the tensor hexagon and unit equation;
morphisms intertwine them. Use Mathlib's `HalfBraiding` orientation,
construct dagger/tensor and duality by mates, and identify
`Z†(C)=Z_C(C)` for α=id as the full subcategory of the native
`Center` whose half-braiding components are unitary. Native
`HalfBraiding` supplies invertible components; the unitary condition is
an additional property. Prove dagger, tensor and duality by mates
preserve that condition before installing the analytic center structure.

Prove the equivalence between these pointed state-bearing categories
and unitary anchored planar algebras. In one direction recover boxes by
the specified right adjoint/trace of Φ applied to tensor powers of x;
construct its unitary/lax-monoidal and trace coherence, and prove
independence of adjoint choices. In reverse build the box
category, positive linking algebras and C*-completion, split projections,
and recover Φ,x,r,ψ. Construct the actual right adjoint first on the
generators by `Tr_V(Φ(v)⊗x^n)=v⊗P[n]`, then on finite sums and
projection summands, and prove its adjunction on all objects. Prove
naturality and both inverse comparisons,
including uniqueness of compatible unitary natural transformations.
When V is ribbon, prove spherical objects correspond exactly to
spherical chosen states. Write F=Forget∘Φ:V→C for the underlying
action functor, distinct from its central lift Φ:V→Z†(C).
Define connectedness by the connected zero-box condition and prove
its characterization by full faithfulness of F; for the CA10 fusion
setting it says P[0]≅1_V. Full faithfulness of the central lift alone
is not this condition. Define finite depth by
finitely many simple summand classes in the associated generated
category, and prove the tensor-power criterion for the real generator.

**Checks.**

- For `V=Hilb(ℤ)`, which has infinitely many simple objects, and Φ the
  forgetful functor to `C=Hilb_fd`, the functor `v↦Hom_C(Φ(v),ℂ)` has a
  one-dimensional coefficient at every simple object, so its support is
  infinite and `Tr_V(1_C)` is not an object of V.
- For fusion V, for example `V=Hilb(ℤ/2)` acting on `C=Hilb_fd`, the
  support is finite and `Tr_V(ℂ)` is the sum of the two simples.
- On ℂ² with its ε=−1 structure `J(a,b)=(−b̄,ā)`, the condition
  `r̄r=ν` fails (`r̄r=−ν`), so this object carries no real structure
  in the sense of CA6.
- For `V=Hilb_fd`, where the pairing `coev†_(P[n])` is the inner product
  of the Hilbert space P[n], the pairing axiom says that inner product is
  `⟨a,b⟩=ψ(r⁻¹(a)·b)` computed by the planar operations. For a
  nonconnected zero box `P[0]=ℂ²` with `ψ(a)=(a₁+a₂)/2`, it forces
  `‖(1,0)‖²=1/2`; giving P[0] the standard inner product of ℂ², with
  `‖(1,0)‖²=1`, violates the axiom, so ψ determines the box inner products.
- For `V=C=Hilb_fd` with Φ the identity and generator `x=ℂ^k`, `Tr_V` is
  the identity functor and `P[n]=Tr_V(x^⊗n)=(ℂ^k)^⊗n` has dimension `k^n`;
  boxes taken as `End(x^⊗n)` would have dimension `k^(2n)`.

*Needs:* CA1a, CA2a; Mathlib `HalfBraiding`, `Center`, `MonoidalFunctor`.

## CA7. Pimsner and free-graph C*-constructions

For a C*-correspondence X over B construct the module Fock space
`F(X)=B⊕X⊕X⊗_B X⊕⋯`, adjointable creation/annihilation maps,
norm and inner-product identities, and the Toeplitz algebra.
Define Toeplitz representations (π,t) by the bimodule and inner-product
relations, construct the universal algebra and prove its faithful
Fock representation, gauge action and fixed-point filtration.
Define `J_X=φ⁻¹(K(X))∩(kerφ)^⊥` and Cuntz–Pimsner covariance
`π(a)=t^(1)(φ(a))` for a∈J_X. Construct O_X, its universal and
gauge-invariant uniqueness theorems, and the Fock compact-ideal model
with the correct J_X-corner ideal. Compare the faithful compact-left-
action case with quotient by K(F(X)). Prove functoriality under
correspondence maps with the covariance-ideal hypotheses, and Morita
transport. For separable B and countably generated X build the Toeplitz
KK-equivalence with B and the cyclic six-term K sequence using K4–K6:
`K_i(J_X)→K_i(B)→K_i(O_X)→K_(i−1)(J_X)`. Its first map is
the action of `[ι:J_X→B]−[X|_(J_X)]` in KK(J_X,B), where the
restricted left action is compact. Prove the Fock ideal is Morita
equivalent to J_X and compute that inclusion class. If J_X=B,
identify the first map as `1−[X]`; no general compact-left-action
class for X over all of B is assumed. General Cuntz generators retain
Dynamics D6/OperatorKTheory K7 ownership.

For a countable undirected graph Λ with positive finite real vertex
weights μ, construct the oriented-edge correspondence over B=C₀(V),
its Fock module, Toeplitz–Cuntz–Krieger algebra and weighted free-graph
algebra S(Λ,μ). On the finitely supported edge vectors fix
`p_s(e) e=e=e p_t(e)` and `⟨e,f⟩=0` for distinct edges,
`⟨e,e⟩=p_t(e)`. Complete in this B-valued inner product and retain
the nondegenerate left B-action. Creation is left tensoring:
`L(e)ξ=e⊗_B ξ`; prove its adjoint formula on every tensor length,
including the vacuum B, and `L(e)†L(f)=⟨e,f⟩` acting on the left.
Replace each non-loop edge ε by opposite edges ε',ε'', with
ε':v→w, ε'':w→v, and each loop by one fixed directed edge;
retain multiple-edge multiplicity. Set
`a=(μ(s(ε'))/μ(t(ε')))^(1/4)>0`, so `a⁴=μ(v)/μ(w)`, and retain
`T_ε=aL(ε')+a⁻¹L(ε'')†+a⁻¹L(ε'')+aL(ε')†`;
for a loop retain `T_ε=L(ε)+L(ε)†`. Define S(Λ,μ) as the
C*-subalgebra generated by B and these self-adjoint T_ε.
For nonunital B construct the reduced-word/expectation comparison from
the directed finite-vertex/finite-edge corners with their compatible
vacuum maps and isometric inclusions, before applying the unital
reduced-product interfaces of F4. No trace on the entire creation or
Toeplitz algebra is inferred from the Gaussian/free-graph trace.
Construct the faithful vacuum vertex expectation E:S(Λ,μ)→B and
the faithful lower-semicontinuous semifinite trace on positive elements
`τ_μ(y)=Σ_(v∈V) μ(v) E(y)(v)`, with its extended-positive-value
convention and dense finite-trace ideal. In particular
`τ_μ(p_v)=μ(v)`; this functional is not made a normalized state
when the total vertex mass is infinite. Prove traciality on the dense
finite-edge/finite-vertex word algebra by the weighted creation and
reduced free-product moment identities, then extend to that trace.
For x=p_v T_ε p_w pin
`E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`, so
`τ_μ(x†x)=a²μ(w)=a⁻²μ(v)=τ_μ(xx†)`.
Require the one-edge regression μ(v)=16, μ(w)=1: a=2 gives both
moments equal 4; the reciprocal a=1/2 instead gives 1/4 and 64 and must fail.
Under reversal of the distinguished orientation interchange ε',ε''
and a,a⁻¹; identify the same self-adjoint T_ε on the same doubled-edge
correspondence, with E and τ_μ preserved. Prove the Fock intertwining
and trace transport for weighted graph isomorphisms, and the identity
comparison for μ↦cμ, c>0: ratios and T_ε are unchanged, while
τ_(cμ)=cτ_μ. Keep loop generators and all multiplicities in these
comparisons.
For an edge-subgraph on the same vertex set with restricted weights,
prove the canonical generator map is injective and construct its
vertex-preserving conditional expectation using the reduced edge
free-product model. Prove the inclusion C₀(V)→S(Λ,μ) induces isomorphisms
on K₀ and K₁; thus K₀ is the free abelian group on vertices and
K₁=0. Construct the module deformation/Toeplitz comparison and compact
ideal exact sequences proving this, including the vertex projection map.
Define `a_μ(v)=Σ_w n(v,w)μ(w)` and `A(Λ,μ)={v:μ(v)>a_μ(v)}`.
For a connected graph prove `A(Λ,μ)=∅` implies
`S(Λ,μ)∩K(F(X))=0`, hence injection into the graph Cuntz–Pimsner
quotient. For locally finite graphs prove the nonempty-set converse.
Prove the principal-graph dimension weighting has empty A when δ>1,
so the planar quotient comparison in CA8 is faithful.

**Checks.**

- One edge with `μ(v)=16`, `μ(w)=1`: `a=2` gives `a²μ(w)=4=a⁻²μ(v)`; the
  reciprocal `a=1/2` gives `1/4` and `64`.
- For that weighting `a_μ(v)=μ(w)=1<16`, so `v∈A(Λ,μ)`, and
  `a_μ(w)=16>1`, so `w∉A(Λ,μ)`; the graph is locally finite and
  `S(Λ,μ)` meets the compacts.
- One vertex with one loop and `μ=1`: `a_μ=1`, not less than μ, so
  `A(Λ,μ)=∅`; `S(Λ,μ)` is generated by one semicircular element, so it is
  `C([−2,2])` with `K₀=ℤ`, `K₁=0`.
- Rescaling the one-edge weighting by `c=3` leaves `a=2` and `T_ε`
  unchanged and gives `τ_(3μ)(p_v)=48`.

*Needs:* CA1a, CA1b; HilbertModules H2–H3; FreeProbability F3–F4;
CStarAlgebras C1; OperatorKTheory K1–K6.

## CA8. Canonical planar C*-algebras and their towers

Construct the unshaded planar operad of disks with marked intervals
and uncolored strings, all endpoint counts, isotopy and substitution.
An unshaded factor planar algebra has finite-dimensional box spaces,
one-dimensional zero box, conjugate-linear reflection, positive
definite closure pairing, spherical closure, and circle value δ>1.
Build the box *-algebras, inclusions, expectations and rectangular
calculus. Adding checkerboard shading to even-endpoint operations
gives a shaded algebra identifying `P_(n,+)=P_(n,−)=P[2n]`
for every n, compatibly with all even-endpoint operations;
an unshaded extension of a shaded algebra requires a chosen
symmetrically self-dual strand, odd-endpoint box data and a compatible
shading-switch isomorphism on all operations. Construct restriction
and comparison only with these specified data. Do not identify every shaded
input with an unshaded one.

Build its rectangular C*-tensor category by finite sums and projection
ranges, with the distinguished symmetrically self-dual strand x.
Define the rooted undirected principal graph Γ by simple objects and
edge multiplicity `dim Hom(v⊗x,w)`, allowing loops; prove reciprocity,
local finiteness and the eigenvector relation for weights μ(v)=d_v.
Construct the unshaded graph planar algebra from these path spaces,
with an extremum from region v to region w weighted by
`sqrt(μ(w)/μ(v))`. On loop spaces `Hom(v⊗x,v)` choose orthonormal
bases fixed by the antiunitary reciprocity involution; prove its square
is one from x's symmetric self-duality and prove existence of such bases.
These choices identify CA7's loop generator with `L(ξ)+L(ξ)†`.
Using the regular module category and orthonormal intertwiner bases,
construct the faithful trace-preserving planar embedding, prove basis
independence up to unitary comparison, and identify the rectangular
module/Fock corners. These targets extend Subfactors 7.1's shaded path construction;
they do not assume Γ bipartite or a finite-depth graph.

Construct the unshaded graded algebra `Gr_k=⊕_(n≥0)P[2k+n]`,
its Wick-contraction trace and free-Fock representation. Prove positivity,
faithfulness, generator boundedness and that each weak closure is a
II₁ factor, with consecutive Jones index δ² and standard invariant
its even shaded restriction. Give the filtered/orthogonal unitary
comparison by contraction sums. Apply the Subfactors 8.1–8.2 proof constructions with
the self-dual single strand, retaining odd boxes, rather than importing
a nonexistent unshaded version of those theorems.

For each permitted modulus `δ∈{2cos(π/n):n≥4}∪[2,∞)` construct the
unshaded positive Temperley–Lieb factor planar algebra TL(δ): P[n] is the
span of planar matchings of n boundary points (so P[n]=0 for odd n),
unshaded tangles act by gluing with closed loops evaluated to δ, the
one-click rotation acts on matchings, and the negligible ideal of the
closure pairing is divided out. Identify its even restriction with
Subfactors 6.1's shaded TL planar algebra example, `P_(n,±)=P[2n]`, the
shading-switch isomorphism being the identity on matchings; positivity
and the restriction to permitted moduli come from Subfactors 3.2
and 6.1. Prove the strand is
symmetrically self-dual, so TL(δ) is an unshaded factor planar algebra
in the sense above with `P[n]=Hom(1,x^⊗n)` in its rectangular category.

For an unshaded factor planar algebra of modulus δ>1 construct
its ground algebra B(P), Hilbert correspondence X(P), Fock, Toeplitz,
Cuntz–Pimsner and free semicircular C*-algebras. Define the ground
finite matrix blocks and inclusions from rectangular box composition,
complete their compatible norms, and prove the correspondence inner
product positive with dense bounded planar generators. Define its
conjugate-linear reflection on rectangular planar vectors, with
`J(bξc)=c*J(ξ)b*`, and the reflection-fixed real span. Generate
the free semicircular algebra by B(P) and `L(ξ)+L(ξ)†` on that real
span; prove the reflection, corner and adjoint relations and boundedness.
Prove tangle/
planar-map functoriality on all these objects, respecting the gauge,
trace and covariance structures.

Construct both the unshaded graded/filtered GJS C*-tower A_k and
the shaded towers A_(k,±), for the spherical subfactor planar algebras
of Subfactors 6.4, by retaining the region color on every
rectangle, tensor action and corner. Use Subfactors 8.2's shaded multiplication/
trace and perform the same module/Fock norm completion with the two
ground vertex families. In each setting construct the planar bounded
representations and corner projections. Compare the two product
conventions explicitly, and identify the shaded weak closures with
Subfactors 8.1–8.2's orthogonal and GJS realizations and the unshaded closures with the
corresponding construction above. Identify the weighted principal-
graph free algebra and its root/through-string corners with the planar
constructions, using quantum-dimension vertex weights and CA7's Fock
comparison. Keep the trace on the semifinite algebra distinct from
the normalized corner trace.

Prove all unshaded A_k strongly Morita equivalent via the full corner
bimodules; in the shaded theory prove
`A_(n,±)∼_M A_(n+1,∓)` and retain the two possible Morita classes.
For shaded input use the principal or dual graph belonging to the
base color of its Morita class, with the transported vertex projections.
Use CA7's vertex K computation and the actual full-corner maps to prove
`K₀(A_k)≃⊕_(v∈VΓ)ℤ` and `K₁(A_k)=0`, with transported vertex classes.
Prove A₀ simple, uniquely tracial and stable rank one, and prove
these properties separately for both shaded roots A_(0,+),A_(0,−); build the
free-product norm estimates, unique-trace averaging, approximation of
elements by invertibles and comparison of projections that yield
these results. General reduced/amalgamated products come from F4,
while these particular C* norm and rank arguments are targets here.

Pin its ordered K₀ and scale on A₀ itself:
`K₀(A₀)^+={0}∪{x:τ_*(x)>0}` and
`Σ(A₀)={0,[1]}∪{x:0<τ_*(x)<1}`.
Prove τ_* and [1] match the normalized root trace and projection;
transport other A_k groups by the specified Morita bimodules before
comparing their trace pairings. No unnamed identification of K₀(A_k)
with K₀(A₀) is used in the cone formula.

Construct the C*-basic construction, dual expectations, Watatani index
and tower comparison with Subfactors 2.1–2.3. For E:B→A define a finite quasi-basis
(u_i,v_i) by `x=Σ_i u_i E(v_i x)=Σ_i E(x u_i)v_i` for every x∈B;
a Pimsner–Popa basis has v_i=u_i*. Prove basis independence,
positivity/centrality of index, composition and corner transport.
For every planar tower inclusion above, without a finite-depth hypothesis,
derive simplicity at every level from the proved corner Morita
equivalences and HilbertModules H3's Morita invariance of simplicity,
and construct a finite quasi-basis from simplicity, fullness of the Jones
projection and the pull-down identity. Prove its Watatani index is δ².
Construct a Pimsner–Popa basis with
`N(δ²)=min{n∈ℕ:n>δ²}` elements at every level. Prove the K₀
constraints on basis sizes and existential sharpness: for each permitted
modulus `δ∈{2cos(π/n):n≥4}∪[2,∞)` there is a factor planar
algebra whose first inclusion admits no
smaller basis. Use the positive Temperley–Lieb factor planar algebra
at that modulus: for nonintegral δ² the trace inequality excludes
smaller sizes, while at integer δ²≥2 its depth≥2 and the vertex
K₀ obstruction `[1₂]≠δ²[1₀]` exclude the endpoint size δ².
Here 1_k is the through-string projection in the common semifinite
planar algebra whose corner is A_k; compare these classes in that
algebra's K₀ through the full-corner maps, before using the obstruction.
Also work out the outer finite-group crossed-product witnesses and
the distinct shaded Morita classes for nonabelian groups. This is
existential sharpness, not a lower bound for every input planar algebra.
Keep finite-dimensional planar levels, finite von Neumann index and
existence of a finite C* quasi-basis distinct. Include the Temperley–Lieb
examples TL(δ) constructed above, group-subfactor and shaded
examples with their corner/K-theory data.

**Checks.**

- `N(δ²)=min{n∈ℕ:n>δ²}` gives 3 for `δ²=2` and for `δ²=(3+√5)/2`, 4 for
  `δ²=3`, and 5 for `δ²=4`, not 4: the endpoint is excluded at integer δ².
- In TL(δ), `P[1]=P[3]=0`, `P[2]` is one-dimensional, and the Gram matrix
  of `P[4]` in the basis of its two matchings is `[[δ²,δ],[δ,δ²]]`.
- For δ=√2 the principal graph of TL(δ) is `A₃` with dimensions
  `(1,√2,1)`; the eigenvector relation holds (`√2=δ·1`, `1+1=δ·√2`), and
  `K₀(A_k)=ℤ³`.

*Needs:* CA1b, CA2a, CA2b, CA7; HilbertModules H3; Subfactors 2.1–2.5,
3.2, 6.1–6.4, 7.1–7.2, 8.1–8.2;
FreeProbability F2, F4; OperatorKTheory K1–K2.

## CA9. Complete W*-categories and fusion commutants

For a complete W*-category with a set of generators, take their
orthogonal sum G and linking algebra A=End(G), with operator-order
multiplication. Identify the category with normal Hilbert-space right
A-modules, equivalently normal left representations of A^op, using the
right A-action on `p_X L²(End(G⊕X)) p_G`. Construct the representation
and bounded intertwiner functors, prove full faithfulness and essential
surjectivity, independence of G and Morita transport. These modules use
scalar Hilbert-space inner products; any comparison with self-dual
Hilbert C*-modules requires a separate construction.
For every W*-category construct the canonical Hilb-valued inner product
`⟨a,b⟩=p_b L²(End(a⊕b)) p_a`, with sesquilinear, dagger, sum and
naturality laws. For complete W*-categories construct the transpose
F^t of a normal dagger functor,
characterized by natural unitary identifications
`⟨c,F^t(d)⟩_Hilb≃⟨F(c),d⟩_Hilb`.
This is the Hilb-valued transpose, not an assertion that every normal
functor has an ordinary categorical adjoint. Prove its tensor,
composition and bi-involution coherences.

Prove the biequivalence between von Neumann algebras/normal
correspondences/intertwiners and complete W*-categories admitting a
set of generators/normal functors/bounded natural transformations.
On objects use normal Hilbert-space right modules. A correspondence
`_A H_B` induces `K_A↦K⊗_A H` on these module categories; bounded
intertwiners induce natural transformations. Use this handedness
throughout the biequivalence and its comparison with left modules;
construct the inverse from the generator linking algebra and prove
full faithfulness on hom-categories and essential surjectivity.
Use the fixed `Type u` generator sets and Hilbert sums and
`Type (u+1)` module categories from the scope conventions. Natural
transformations have uniformly bounded components. Prove the existence
of a generator family is an additional property; category size alone
does not provide it.

For a unitary tensor functor α:C→Bim(R) define
`C′=Z_C(Bim(R))` by CA6's relative-center construction, with separable
normal R–R bimodules. Construct its dagger/tensor/bi-involution,
positive cones and the double-commutant comparison. Define a positive
representation by compatible cones on morphisms
`a⊗ā→b⊗b̄`; prove every fully faithful representation of a
semisimple rigid C*-tensor category extends uniquely to one, and every
representation isomorphism preserves it.

For a unitary fusion category C construct its 2-by-2 matrix multifusion
category, choose the sum of simple generators in the off-diagonal sector,
and use CA2 to form its finite-depth spherical planar algebra. Apply
Subfactors 9.1–9.2's hyperfinite standard-model realization, then recover the
fully faithful multifusion representation in Bim(A⊕B) and its C corner.
This constructs the fully faithful realization in Bim(R), R hyperfinite
II₁. Tensor the realized bimodules with the identity bimodule of B(ℓ²)
or the hyperfinite III₁ factor and identify the resulting factors with
R_II∞ and R_III₁. Prove full faithfulness by the factor relative-commutant
calculation, fusion compatibility and the V13 absorption identifications.
For unitary fusion C and fully faithful representations
`α:C→Bim(R)`, `β:C→Bim(S)`, with R,S hyperfinite of separable
predual and either both type II (II₁ or II∞) or both III₁, prove
representation uniqueness: construct an invertible R–S correspondence
U and unitary natural identifications `U⊗_S β(c)≃α(c)⊗_R U`,
with tensor and unit coherence. Prove the induced positive structures
agree; do not assert uniqueness between the type-II and III₁ classes.

Construct the normal correspondence models with their size and
standardization domains explicit. Keep the arbitrary-universe W*-category,
generator and module-category targets above. Use VNA V4.Normality's
normal representation amplification, V5's projection comparison and
countable absorption, V11's general standard form and tensor commutation,
and Subfactors 1.1–1.2's normal correspondences and Connes fusion. CA9 owns
the following coordinate models and comparison functors, not a second
standard-form, normal-representation or fusion construction.

For any von Neumann factor M, write H₀=L²(M), with
`aξb=aJb*Jξ`. Define End_rev(M) to have the normal unital endomorphisms
ρ:M→M and a zero object; morphisms t:ρ→σ are t∈M with
`tρ(a)=σ(a)t` for every a, with the usual zero-object Hom spaces.
Build its complex-linear dagger, norms and reversed tensor composition
`ρ⊗_rev σ=σ∘ρ`; for t:ρ→ρ′ and s:σ→σ′ the tensor
intertwiner is `s σ(t)=σ′(t)s`. Define the full subcategory
Bim_std(M) of normal M–M correspondences whose nonzero underlying right
M-module admits a right-M-linear unitary to H₀, together with zero.
Construct the complex-linear dagger tensor equivalence
End_rev(M)≃Bim_std(M) by `_ρH₀`, with left action `a·ξ=ρ(a)ξ`
and ordinary right action. Map t to left multiplication by t. From a
chosen right standardization recover ρ using the commutant of the right
action, and compare different choices by the corresponding unitary
intertwiner. Construct
`U_(ρ,σ):_ρH₀⊗_M _σH₀≃_(σ∘ρ)H₀` and prove its naturality,
unitarity and associator/unit coherence. Do not infer closure of this
right-standardizable subcategory under arbitrary sums or subobjects
without proving standardizability of those particular ranges.

For all normal M–M correspondences, construct instead the amplified
corner category. In a common universe u choose an index type I:Type u,
put `H_I=H₀⊗̂ℓ²(I)` and `A_I=M⊗̄B(ℓ²(I))`, identified with the
commutant of the diagonal right M-action on H_I. An object consists of
a projection p∈A_I and a normal unital star homomorphism
`λ:M→pA_Ip`, where the corner unit is p. Its realization is pH_I,
with left action λ and the restricted diagonal right action. Include
I=∅ and p=0 as zero presentations. All Hilbert carriers and index sets
lie in the common Type u, and the presentation category in Type(u+1);
use universe lifts when comparing data initially given at different levels.
There is no fixed countable bound on I. Consume V4/V11 to present every
normal right M-module as such a reducing corner: decompose into cyclic
normal subrepresentations, realize their positive functionals in the
standard form, take their orthogonal sum and the commutant range
projection, and transport the commuting left action to λ. Retain all
normal correspondences, including nonseparable carriers.

For objects (I,p,λ),(J,q,μ), the Hom space consists of rectangular
operators `T∈q(M⊗̄B(ℓ²(I),ℓ²(J)))p` satisfying
`Tλ(a)=μ(a)T` for every a∈M. Define the rectangular space as the
appropriate off-diagonal corner in A_(I⊔J), not an algebra of
rectangular matrices. Use operator norm, multiplication for composition
and adjoint for dagger. Prove the intertwiner equations define a weak-*
closed space; identify its actual quotient predual, separately normal
composition and the C*-norm/dagger laws. Construct all Type-u-indexed
orthogonal sums and all projection ranges by block sums and corners,
including the zero case. Prove realization fully faithful using the
right-action commutant and essentially surjective by the preceding
presentation. Construct its inverse equivalence, unitary changes of
presentation and common-amplification comparisons, with their coherence;
do not declare the choices literally equal.

For H=(I,p,λ), K=(J,q,μ), use the normal spatial matrix amplification
`μ^[I]:A_I→(q⊗1_I)A_(J×I)(q⊗1_I)`, with
`μ^[I](a⊗E_(i′,i))=μ(a)⊗E_(i′,i)`, under the fixed unitary
`H₀⊗̂ℓ²(J×I)≃(H₀⊗̂ℓ²(J))⊗̂ℓ²(I)`.
Set `P=μ^[I](p)` and `ν(a)=μ^[I](λ(a))`, a normal map with
ν(1)=P. Define their composite presentation to be (J×I,P,ν).
Construct the unitary
`pH_I⊗_M qH_J≃P(H₀⊗̂ℓ²(J×I))` from Subfactors 1.2's standard-form
left unitor on each coordinate. Verify it first on the dense bounded-
vector tensor domain, with Subfactors 1.2's opposite-weight convention, and then
complete and restrict by the range projection. Show a rectangular
right-module operator T acts after this comparison by its amplified
matrix μ(T); extend the finite-coordinate formulas normally, rather
than assuming an infinite matrix sum converges in norm.

For T:H→H′ with coordinate types I,I′ and S:K→K′ with
coordinate types J,J′ and target left action μ′, the fusion morphism is
`(S⊗1_(I′)) μ^[I′,I](T)
 = μ′^[I′,I](T)(S⊗1_I)`, restricted to the composite corners.
Construct the rectangular amplification from the same off-diagonal
corner; prove this equality, the corner supports, intertwining,
contractive tensor norm, dagger/interchange and separate normality.
Construct the unit presentation (one coordinate,1,id_M), both unitors
and, for a third coordinate type L, the associator from the canonical
coordinate bijection between L×(J×I) and (L×J)×I. Check their projection/left-action equations,
pentagon/triangle and compatibility with Subfactors 1.2's fusion comparisons.
Transport Subfactors 1.1's conjugation and double-conjugation data by the presentation
equivalence, with natural unitary comparisons. In the one-coordinate
p=q=1 specialization the formulas give ν=σ∘ρ and
`T⊗S=sσ(t)=σ′(t)s`, exactly End_rev(M), and give U_(ρ,σ).

For a properly infinite factor M with separable predual, prove that
H₀ is separable and every nonzero separable normal M–M correspondence
is right standardizable. Use a countable amplification, V5's countable
absorption and projection comparison: the represented left M makes
its nonzero support corner properly infinite, so that support is
equivalent to the unit in the sigma-finite amplified factor. Construct
the resulting right-module unitary, and identify the model with all
separable normal Bim(M). Prove finite and countable sums and every
bimodule projection range stay in this separable model; arbitrary
cardinal sums remain in the full amplified model. For any finite-
statistical-dimension endomorphism pair, transport both standard
conjugate cups and their adjoints through U and the unit comparison,
preserving their equations and squared norm d. In End_rev,
ρ⊗_rev ρ̄=ρ̄∘ρ, so a usual-composition
`R_std:id→ρ̄∘ρ` becomes `U_(ρ,ρ̄)⁻¹ L_(R_std)`;
the other cup uses the reversed pair. Keep these comparisons compatible
with the tensor-reversal/cocycle bridge and normalized left inverses below.

Include the size tests: for uncountable I, B(ℓ²(I)) has no nonzero
normal representation on a separable Hilbert space, although its identity
endomorphism has its standard right-module realization. For B(ℓ²),
construct normal correspondences with uncountable right multiplicity
and prove they cannot be `_ρL²(M)` on its fixed standard right carrier;
the amplified model must realize them. Check zero presentations,
arbitrary reindexing and common-universe lifts, finite matrix corners,
and the above one-coordinate tensor and cup specializations.

Construct the convention bridge to Tomatsu's usual-composition
endomorphism category, whose tensor on objects is `ρ⊗σ=ρ∘σ` and
on intertwiners is `t ρ(s)=ρ′(s)t`. End_rev(M) is exactly this
category with its tensor reversed. Tensor reversal keeps objects,
morphisms, dagger and complex scalars, sets `X⊗_rev Y=Y⊗X`, and
uses `a^rev_(X,Y,Z)=a_(Z,Y,X)⁻¹`, `λ^rev=ρ`, `ρ^rev=λ`. For a representation
F:C→End_rev(M) obtained above, construct the unitary tensor functor
G:C^rev→End(M) with the same object and morphism maps. If
`u_(X,Y):F_Y∘F_X→F_(X⊗Y)` is F's tensor constraint, G's constraint
is `u_(Y,X)` and Tomatsu's cocycle is `c_(X,Y)=u_(Y,X)†`.
Prove the tensor-intertwiner and cocycle equations under this translation,
including nonstrict associators. Swap the two standard conjugate cups
when reversing the tensor category, retaining their dimension and
standardness. Prove preservation of amenability, central freeness,
approximate unitary equivalence and strong cocycle conjugacy, and
construct the inverse translation. Apply the action theorem below to
C^rev and translate its result back to the original correspondence
representations; no identification of C with C^rev is required.
For the back-translation take the invertible correspondence
`U=_γL²(M)`. Construct the natural unitaries
`U⊗_M β(X)≃α(X)⊗_M U` from the action intertwiners w_X† and the
fusion tensorators, proving their tensor coherence.

In the usual-composition endomorphism category, for
finite-statistical-dimension objects choose CA2's standard conjugate
solution `R_std:id→ρ̄∘ρ` with R_std†R_std=d_ρ, and use the isometry
`r_ρ=d_ρ^(-1/2)R_std`. Pin the source's normalized conjugate equations
`r_ρ* ρ̄(r̄_ρ)=d_ρ⁻¹1`, `r̄_ρ*ρ(r_ρ)=d_ρ⁻¹1` and the canonical
normal ucp left inverse `φ_ρ(x)=r_ρ*ρ̄(x)r_ρ`.
Prove φ_ρρ=id, faithfulness, normality, `E_ρ=ρφ_ρ` a conditional
expectation, standard/minimal index d_ρ² and the tensor/composition
and corner laws; retain the factor hypothesis in the scalar-index claim.

For separable-predual M and a free ultrafilter ω, build the general
Ocneanu ultrapower. Let T^ω be the bounded sequences tending strongly-*
to zero along ω; let N^ω be their two-sided multiplier algebra inside
ℓ∞(M), and let C^ω be the bounded sequences with
`lim_ω‖x_nψ−ψx_n‖_(M_*)=0` for every ψ∈M_*.
Prove C^ω⊆N^ω and T^ω a closed ideal of both. Construct
`M^ω=N^ω/T^ω` as a von Neumann algebra, its constant normal embedding,
bounded representatives, canonical weak-* ultralimit expectation and
normal state lifts. Construct `M_ω=C^ω/T^ω`, prove it is weak-* closed
in M^ω and hence a von Neumann subalgebra, and prove
`M_ω⊆M′∩M^ω`; no equality is assumed for general M.
For factors derive its canonical trace from the state lifts and central
weak-* limits, with faithful normality and independence of the chosen
faithful state: for bounded centralizing x_n and bounded y_n use
`|φ(x_ny_n−y_nx_n)|≤‖x_nφ−φx_n‖‖y_n‖`, and prove the ultralimit
expectation of a centralizing sequence is scalar. This is a trace on
M_ω; the expectation on M^ω is M-valued. Relate the finite-tracial
case to V12. Prove the extension
of finite-index ρ and φ_ρ to M^ω, and
`ψ^ω∘φ_ρ^ω=(ψ∘φ_ρ)^ω`. Define central sequence containment and
countably generated subalgebras with their strong closures and corners.

For a cocycle action α, central freeness means: for each nontrivial
simple X, no nonzero a∈M satisfies `ax=α_X^ω(x)a` for every
x∈M_ω, with a viewed in M^ω by the constant embedding. Strong
freeness instead quantifies a∈M^ω and tests x∈Q′∩M_ω for every
countably generated Q⊆M^ω. Prove the required implication from
central to strong freeness (Masuda–Tomatsu, Lemma 8.2, as cited by
Tomatsu Remark 2.17(1)) and the relative commutant/corner forms
used by the Rohlin construction; keep their different ambient
intertwiner spaces. Define `ρ(ψ)=ψ∘φ_ρ∈M_*` and
`(uρ(ψ)u*)(x)=ρ(ψ)(u*xu)`. Approximate unitary equivalence of
ρ₁,ρ₂ means a sequence of unitaries u_n∈M with
`‖u_nρ₁(ψ)u_n*−ρ₂(ψ)‖_(M_*)→0` for every ψ∈M_*.
Define the induced lifted functional
`ρ_i(ψ^ω)=ψ^ω∘φ_(ρ_i)^ω`. Prove equivalence with the existence of
one unitary u∈M^ω satisfying
`u ρ₁(ψ^ω) u*=ρ₂(ψ^ω)` for every ψ∈M_*; the conjugation action
on functionals is `(u f u*)(x)=f(u*xu)`. Construct the necessary
unitary representatives and use separability of the predual to pass
between sequences and this simultaneous exact comparison. Prove
invariance, sums and standard left-inverse transport. This is a predual criterion, not pointwise
convergence of ρ₁(x) and ρ₂(x).

Define approximate innerness of rank r>0 by partial isometries v_i^n,
`1≤i≤⌊r⌋+1`, with `(v_i^n)*v_i^n=1` for i≤⌊r⌋,
`v_(⌊r⌋+1)^n=0` for integral r, `Σ_i v_i^n(v_i^n)*=1`, and
`‖r⁻¹ v_i^n ψ−(ψ∘φ_ρ)v_i^n‖_(M_*)→0` for every ψ∈M_*.
Develop integer-rank Hilbert-space implementations, predual topology,
rescaling, tensor and conjugacy laws. Prove Tomatsu Proposition2.7:
endomorphisms approximately inner of the same rank are approximately
unitarily equivalent. Construct the finite von Neumann algebra in
`M^ω⊗M₂`, compare its two diagonal projections using the rank families,
and descend its unitary to the preceding predual criterion.

For hyperfinite II∞ prove the Masuda–Tomatsu characterization
`ρ approximately inner of rank r ↔ τ∘φ_ρ=r⁻¹τ` for finite-index
endomorphisms. For hyperfinite III₁ prove every finite-index
endomorphism approximately inner of each rank r>0. These are targets
here, not consequences of V13's automorphism-only theorem. Construct
Izumi's canonical extension on V11's core, with the positive dual
action fixed by `θ_s(x)=x` for x∈M, `θ_s(u_t)=exp(i s t)u_t`
and `Tr∘θ_s=exp(s)Tr`. For a faithful normal semifinite weight φ
and the designated standard left inverse φ_ρ, construct the normalized
version `ρ̌(x)=ρ(x)`, `ρ̌(u_t)=(D(φ∘φ_ρ):Dφ)_t u_t` and
pin the canonical extension by
`ρ̃(x)=ρ(x)`, `ρ̃(u_t)=d_ρ^(it)(D(φ∘φ_ρ):Dφ)_t u_t`.
Prove `ρ̃=θ_(+log d_ρ)∘ρ̌`, independence of weight via V11's
specified cocycle comparison, and equivariance with the same dual action.
Define having a Connes–Takesaki module by ρ̃ taking the core center
into itself with automorphism restriction. For an approximately inner
finite-index endomorphism of rank r>0, prove
`mod(ρ)=θ_(log(d_ρ/r))|_(Z(core))` with this positive convention.
When consuming negative-action formulas put `θ⁻_s=θ_(-s)` explicitly:
`θ⁻_(-log d_ρ)∘ρ̌=θ_(+log d_ρ)∘ρ̌` and
`θ⁻_(log(r/d_ρ))=θ_(log(d_ρ/r))`. Transport the source cocycle,
module and rank statements together, keeping Tr and the weight normalization
unchanged rather than renaming only one sign.
Require the II∞ inner-amplification normalization for every integer n≥2:
with `v_i†v_j=δ_ij1`, `Σ_i v_i v_i†=1`, put
`ρ(x)=Σ_i v_i x v_i†`, `φ_ρ(x)=n⁻¹Σ_i v_i†xv_i`.
Prove d_ρ=r=n, `τ∘φ_ρ=n⁻¹τ` and the scalar cocycle
`(D(τ/n):Dτ)_t=n^(-it)`. In this trace core u_t is central;
hence `ρ̌(u_t)=n^(-it)u_t`, `ρ̃(u_t)=u_t`, and its module is
`θ_0=id`. The formula with a second negative phase would instead
give n^(-2it)u_t and does not satisfy this regression.
For II∞ build trace-scaled partial-isometry approximants. For III₁
construct the locally trivial inclusion `diag(x,ρ(x))⊂M₂(M)`,
its weighted conditional expectations and modular/finite-index API;
prove the weighted approximation theorem used by Masuda–Tomatsu's
III₁ argument with expectation-weight ratio μ₁/μ₀=r, and extract
the displayed rank families. The normalizations and estimates needed
for this application are part of this target.

Define fusion amenability by the weighted Følner criterion: for every
nonempty finite F⊆Irr(C) and ε>0 there is a nonempty finite K with
`|(F·K)△K|_σ≤ε|K|_σ`, where `σ(X)=d(X)²` and F·K consists
of simple summands of X⊗Y for X∈F,Y∈K. Build the fusion
transition matrices, dimension eigenvector and finite-set estimates;
prove every unitary fusion category amenable by taking K=Irr(C).

Construct cocycle actions with source convention
`α_Xα_Y=Ad(c_(X,Y))α_(X⊗Y)`, normalized α_1=id and
`c_(1,X)=c_(X,1)=1`. The cocycle equation is
`c_(X,Y)c_(X⊗Y,Z)=α_X(c_(Y,Z))c_(X,Y⊗Z)`, with the
category associators inserted in the nonstrict form. Their morphism
maps preserve norms, composition and dagger, with the tensorator
compatibility `c_(X,Y)[S⊗T]^α=S^α α_U(T^α)c_(U,V)`
for S:U→X,T:V→Y; c is the inverse of the usual tensor-functor constraint.
The standard left inverse is
`φ_X^α(x)=r_X^(α)* c_(X̄,X)* α_X̄(x) c_(X̄,X) r_X^α`,
using the normalized CA2 cup. For dimension-preserving actions prove
its agreement with the minimal endomorphism-model left inverse above;
prove fully faithful actions preserve intrinsic dimensions. On a factor
prove central freeness excludes intertwiners from the identity to each
nontrivial simple image, and use rigidity and Frobenius reciprocity to
deduce full faithfulness. General actions need not send a standard
conjugate solution to a standard one. Cocycle conjugacy consists of
γ∈Aut(M) and natural unitaries w_X:γα_Xγ⁻¹→β_X with
`w_X (γα_Xγ⁻¹)(w_Y) γ(c_(X,Y)^α)=c_(X,Y)^β w_(X⊗Y)`.
Strong cocycle conjugacy requires γ in the closure of inner
automorphisms for pointwise predual-norm convergence. Build these
relations, coherence, invariance and transport APIs.

Prove the factor specialization of Tomatsu Theorem D: for an
amenable semisimple rigid C*-tensor category with simple unit and
countably many simple classes (the generality chosen here), centrally free cocycle actions α,β
on a properly infinite factor M with separable predual, and
`α_X≈β_X` for every X in the preceding canonical-predual sense,
construct a strong cocycle conjugacy. The source's invariant faithful
normal state on Z(M) is automatic for a factor; no injectivity is
assumed. Build the Rohlin and approximate-intertwining constructions
that prove this theorem, then apply it to representation uniqueness.
Use the preceding ultrapower, central-freeness and canonical-left-
inverse APIs throughout. Prove fully faithful representations
centrally free, and prove the induced-predual-map comparison for
dualizable finite-depth endomorphisms: on II∞ retain irreducibility
and equality of intrinsic statistical dimensions d_ρ=d_σ, and on III₁ retain its
finite-depth hypothesis. Derive those hypotheses for each simple
image of α and β. Define the Connes–Takesaki module through
V11's core, prove finite depth forces the module trivial, and prove
the approximate-inner rank comparison giving rank d_ρ in the II∞
case. Apply the just-proved cocycle-action theorem and transport it back
to the invertible correspondence U. For type II₁ first pass to II∞
by the explicit Morita equivalence and return through it; V13 supplies
the hyperfinite factor identifications. These are construction targets,
not extra assumed rigidity hypotheses on the input representations.

Build absorbing bimodules,
their factor endomorphism algebras and half-braiding extensions, and
prove the double commutant is the Hilbert-multiplicity completion
`C⊗_Vec Hilb_sep`. Prove this completion is bicommutant; do not identify
it with C, whose sums are only finite. Construct Morita transport of
commutants: Morita-equivalent unitary fusion categories represented
fully faithfully in hyperfinite factors have equivalent commutant
bicommutant categories when the factor types are both type II or both
III₁. Build the linking/multifusion and bimodule equivalences with the
positive structures; no equivalence across those factor-type classes
is asserted.

**Checks.**

- II∞ inner amplification with n=2: `d_ρ=r=2`, `τ∘φ_ρ=τ/2`, cocycle
  `2^(−it)`, `ρ̌(u_t)=2^(−it)u_t`, `ρ̃(u_t)=u_t` and module `θ₀=id`; a second
  negative phase would give `2^(−2it)u_t`.
- For `M=M₂(ℂ)`, `u=diag(1,i)` and `v=[[0,1],[1,0]]`, `uv=[[0,1],[i,0]]`
  and `vu=[[0,i],[1,0]]` are not proportional, so `Ad(v)∘Ad(u)≠Ad(u)∘Ad(v)`:
  End_rev's `ρ⊗_rev σ=σ∘ρ` differs from the usual composition tensor.
- For `M=M_n(ℂ)` the ultrapower is `M^ω=M` and `M_ω=ℂ=M′∩M^ω`.
- For the free group factor `M=L(F₂)`, which does not have property Γ,
  `M_ω=ℂ`; for the hyperfinite II₁ factor R, which has property Γ,
  `R_ω≠ℂ`. A definition of `M_ω` as the scalar sequences alone would give
  ℂ in both cases.
- For a factor M, `Hom_(End_rev)(id,id)={t∈M: ta=at}=Z(M)=ℂ`. For
  `M=M₂(ℂ)` and `ρ=Ad(u)` with u unitary, `Hom(id,ρ)={t: ta=uau*t}=ℂu`
  is one-dimensional and contains the unitary u, so `ρ≅id` and `_ρH₀≅H₀`.
- In the amplified corner model the one-coordinate presentation
  `(pt,1,ρ)` realizes `_ρH₀`; the two-coordinate presentation
  `({1,2},1⊗e₁₁,ρ⊗e₁₁)` realizes `H₀⊗e₁` with the same actions, and the
  rectangular operator `T=1⊗e_(1,pt)` satisfies `Tρ(a)=(ρ(a)⊗e₁₁)T`,
  `T*T=1` and `TT*=1⊗e₁₁`, so it is a unitary change of presentation, not
  an equality of data. The presentation `(∅,0,0)` realizes the zero
  correspondence.
- For `M=ℂ` the model is Hilbert spaces: `(I,p,id)` realizes `pℓ²(I)` and
  the Hom space to `(J,q,id)` is `qB(ℓ²(I),ℓ²(J))p`, of dimension
  `rk(p)·rk(q)`; for `I=pt`, `J={1,2}` and `p=q=1` it is the 2×1 block
  of `A_(I⊔J)=M₃(ℂ)`, of dimension 2, while each diagonal corner
  `End` has dimension 1 or 4.
- For the W*-category Hilb and `F=−⊗ℂ^k`, the Hilb-valued transpose is
  `F^t=−⊗(ℂ^k)‾`: for `c=ℂ^m`, `d=ℂ^n` both `⟨c,F^t(d)⟩` and
  `⟨F(c),d⟩` are Hilbert–Schmidt spaces of dimension `mnk`.
- With `K=Irr(C)` every product `F·K` equals `Irr(C)`, so
  `|(F·K)△K|_σ=0`, which is the Følner condition for every unitary fusion
  category.

*Needs:* CA1a, CA1b, CA2a, CA2b, CA6; VonNeumannAlgebras V4, V5, V11, V12, V13;
Subfactors 1.1–1.2, 9.1–9.2.

## CA10. Finite-depth real objects and anchored classification

Let R be the hyperfinite II₁, II∞ or III₁ factor with separable
predual, and fix a fully
faithful unitary fusion subcategory C⊆Bim(R). A real object of C′
has chosen symmetric self-duality r:X→X̄, a unitary fixed by
`r↦r̄†φ_X`, equivalently `r̄r=φ_X`. Here CA9's bi-involution uses
the conjugate bimodule, conjugated half-braiding and canonical unitary
double-conjugate identification φ_X:X→X̄̄. On each generated unitary
fusion subcategory prove its canonical unitary comparison with the
bi-involution induced by CA2's spherical dual functor, and transport r
through that comparison before applying CA6. Require X dualizable and define finite depth by finitely many simple
classes in the full finite-sum, subobject-closed tensor category of C′
generated by X. Construct the mate half-braiding on any Bim(R)-dual
of X, prove its conjugate equations in C′, and prove dualizability in
C′ equivalent to finite statistical dimension of the underlying bimodule.
Define conjugacy of these
structured objects by invertible U∈C′ and unitary Y≃U⊗X⊗U⁻¹
transporting the real structure through the tensor/duality coherence.
Develop its equivalence relation, tensor-power and depth invariance.

Construct the tube algebra once, on
`⊕_(i,j,k∈Irr(C)) Hom_C(i⊗k,k⊗j)`. For f in the (i,j;k)
space and g in (j,h;l), define g*f by stacking f first, g second,
then summing `(v†⊗1_h)(1_k⊗g)(f⊗1_l)(1_i⊗v)` over orthonormal
isometric simple summands v:s→k⊗l; mismatched middle labels give
zero. Include all associators. The unit is the sum of identity tubes;
reflection with CA2's standard cups/caps defines the involution.
Prove basis independence, associativity, the * laws and positivity of
the weighted closure trace and its finite-dimensional regular norm.
Pin the module convention to `H_z=Hom_C(Fz,⊕_c c)` with the annular
left action. On t:i⊗k→k⊗j and h:Fz→i, insert the standard cup
`1→k̄⊗k` to the left of Fz, move k past Fz by the inverse
half-braiding, apply `1_k̄⊗h⊗1_k` then `1_k̄⊗t`, and close
`k̄⊗k→1` with the standard cap, including the pivotal comparison.
Prove this respects the displayed tube multiplication and *. This
action is contravariant in z, so its module category is identified
with Z(C)^op; right/dual module conventions are compared explicitly.
Recover the unitary half-braiding from these simple modules and prove
Z(C) is unitary fusion, with its canonical spherical dual functor.
Develop the relative tube version for a fully faithful fusion inclusion
C⊆E, proving Z_C(E) finite semisimple. The reversed braiding retains
these dagger/duality structures.

Prove the finite-depth criterion equivalent to finiteness of the
irreducible underlying Bim(R) classes among X^⊗n: one direction uses
finite multiplicities of dualizable bimodules; for the converse form
the finite fusion category E⊆Bim(R) generated by these underlying
objects and α(C), reorder words by X's half-braiding, and use the
finite relative-center/tube theory to bound the lifts to C′. Infinite
Hilbert multiplicities of a single simple do not meet dualizability.

Use `Z(C)=Z†(C)=Z_C(C)` with its proved native Center comparison.
Pin balanced-product conventions once: `A⊠_V B` takes braided
central functors `Ψ:V^rev→Z†(A)` and `Φ:V→Z†(B)`. Its balancing
isomorphism is
`((a⊗Forget Ψ(v))⊠b)≃(a⊠(Forget Φ(v)⊗b))`,
natural in a,v,b and compatible with units and tensor products.
For the classifier take `V=Z(C)^rev`, A=C, B=M: Ψ is the
canonical identity lift `Z(C)→Z†(C)`, and Φ is the central
action `Z(C)^rev→Z†(M)`. Thus write
`E=C⊠_(Z(C)^rev)M`; construct the reversal equivalence
`E≃M⊠_(Z(C))C` with its tensor and dagger comparisons. For the relative-center
comparison take A=Z_C(E), B=C, V=Z(C): the first central lift
uses the inverse relative half-braiding against the underlying z,
and the second is the canonical lift into Z†(C). Prove these
lifts braided with the stated reversal.
Construct these balanced products with ladder-category morphisms, contraction composition, positive
linking forms and finite additive/projection completion. Construct the
tensor product, unit, dagger, unitary associators and standard dual
functor on the balanced product. When both inputs are fusion and, for the central lift
Φ:Z(C)^rev→Z†(M), its underlying action F=Forget∘Φ:Z(C)^rev→M
is fully faithful on the connected input M, prove finite semisimplicity
and `End(1_(C⊠M))=ℂ`. Retain the corresponding central lift and
its braided compatibility; full faithfulness of that lift alone does
not replace this hypothesis.
Construct its canonical centralizing structure and prove the
functor `M→Z_C(C⊠_(Z(C)^rev)M)` fully faithful (Henriques–Penneys–Tener,
Lemma 3.7). Use CA6's relative center. For spherical fusion C fully faithfully embedded in E with
simple unit, using the algebraic central structure (unitary in the
C* specialization), prove the multiplication functor
`Z_C(E)⊠_(Z(C)) C→E`, `(e,c)↦e⊗c`, fully faithful.
Use the tube algebra and left-module convention above to prove the Hom decomposition
`⊕_z Hom_(Z_C(E))(e₁,e₂⊗z)⊗Hom_C(z⊗c₁,c₂)`
`≃Hom_E(e₁⊗c₁,e₂⊗c₂)` by its tube-action multiplicities and Yoneda.
For E=Bim(R), prove dominance separately: the averaging object
`⊕_(c∈Irr(C)) c⊗Y⊗c̄` has a canonical C half-braiding and contains
Y as a summand. Thus the multiplication functor is an equivalence.
Give the finite ladder Hom spaces their W* corner topology, prove
composition separately normal and that the resulting equivalence is
normal. Since C′ already has separable Hilbert multiplicities and
every Y occurs in the finite averaging sum, its additive/projection
completion already has all Bim(R) objects. Compare with CA1's W*
Cauchy completion without imposing an additional existence step.

Prove the natural bijection between the stated conjugacy classes and
isomorphism classes of connected finite-depth unitary anchored planar
algebras in `Z(C)^rev`. From X build the finite fusion subcategory M
of C′ generated jointly by X and the canonical central image of Z(C),
whose half-braiding defines the action `Z(C)^rev→Z†(M)`.
Prove finiteness using dualizability, finite depth and finite fusion of
Z(C), construct its spherical unitary duality and pointed state, and
apply CA6.
In reverse use the reversed-braiding forgetful functor from Z(C), the
balanced product E=C⊠_(Z(C)^rev)M and its proved unitary fusion
structure, then CA9's fully faithful factor realization. The canonical
centralizing functor embeds M fully faithfully into C′ after restriction
of the realized E to the fixed C. Align
the restricted representation of C with the fixed embedding. Apply
CA9's representation uniqueness for finite fusion categories over
the same specified factor type, with its invertible bimodule, unitary
monoidal natural isomorphism and trace/positive compatibility. Its restriction
to C puts that bimodule in C′; naturality at r transports the chosen
real structure. Prove the two constructions inverse on the stated
classes. This is a bijection on structured-object classes, with the
CA6 category equivalence supplying the required morphism comparisons.

**Checks.**

- The tube algebra of `Hilb_fd` is ℂ and `Z(Hilb_fd)=Hilb_fd`.
- For `Hilb(ℤ/2)` the tube algebra has dimension
  `Σ_(i,j,k) dim Hom(i⊗k,k⊗j)=2·2=4` (nonzero only for i=j) and is
  commutative, so `Z(Hilb(ℤ/2))` has four simple objects.
- The unit object of C′ with `r=id` satisfies `r̄r=φ` and corresponds to
  the trivial anchored planar algebra.
- For `Hilb(ℤ/3)` the tube algebra has dimension `3·3=9`, nonzero only
  for i=j, and is commutative, so `Z(Hilb(ℤ/3))` has nine simple objects.
- For the non-abelian `Hilb(S₃)` the (i,j;k) space is nonzero exactly
  when `j=k⁻¹ik`, so the tube algebra has dimension `6·6=36`. Its simple
  modules are labelled by a conjugacy class and an irreducible
  representation of a centralizer, of dimensions 1,1,2 (identity class),
  3,3 (transpositions) and 2,2,2 (three-cycles): eight simple objects of
  `Z(Hilb(S₃))`, with `1+1+4+9+9+4+4+4=36`. The algebra is not
  commutative, unlike the abelian cases.
- On the unit object both `r=id` and `r=−id` satisfy `r̄r=φ`. The unitary
  `u=i·id` has `ū=−i·id` and transports r to `ū r u⁻¹=(−i)r(−i)=−r`, so
  the two real structures are conjugate and give the same anchored planar
  algebra; equality of real structures is finer than the conjugacy
  relation the bijection uses.
- For `C=Hilb_fd`, `Z(C)=Hilb_fd` and the balancing isomorphisms are the
  unit coherences, so `E=Hilb_fd⊠_(Hilb_fd)M≃M`; every object of E
  half-braids uniquely with `Hilb_fd`, so `Z_C(E)=E` and the centralizing
  functor `M→Z_C(E)` is an equivalence, not only fully faithful.

*Needs:* CA2a, CA6, CA9.

## Downstream consumers

QuantumGroups and TemperleyLiebOperatorAlgebras A6 consume CA1a and CA2a.

## Sources and API evidence

- Jones–Penneys, [*Operator algebras in rigid C*-tensor categories*](https://arxiv.org/abs/1611.04620),
  §§2–4, Theorems 3.8,3.20 and 4.28, for internal algebra/module
  comparisons, representations, CP and bicommutants.
- Jones–Penneys, [*Q-systems and compact W*-algebra objects*](https://arxiv.org/abs/1707.02155),
  §§2–5, especially Proposition 4.11 and Theorem 5.3, for the
  unit-isometric compact-object correspondence.
- Chen–Hernández Palomares–Jones–Penneys,
  [*Q-system completion for C*-2-categories*](https://arxiv.org/abs/2105.12010),
  Definitions 3.1,3.14,3.17–3.20, Theorem 3.36 and §4, for
  separable Q-systems, balanced composition and C*-realization.
- Jones–Penneys, [*Realizations of algebra objects and discrete subfactors*](https://arxiv.org/abs/1704.02035),
  Theorem 5.35 and Corollary 7.14, for the representation-relative
  equivalence, its canonical states and morphisms.
- Penneys, [*Unitary dual functors for unitary multitensor categories*](https://arxiv.org/abs/1808.00323),
  Theorems A,C and §§2–4, for positive grading characters and the
  shaded planar correspondence.
- Henriques–Penneys–Tener, [*Unitary anchored planar algebras*](https://arxiv.org/abs/2301.11114),
  Definitions 3.1–3.6,4.3–4.5 and Theorem A, for states,
  pointings, reflected pairings and category equivalence.
- Hartglass–Penneys, *C*-algebras from planar algebras*,
  [Part I](https://arxiv.org/abs/1401.2485), §§2–5,
  [Part II](https://arxiv.org/abs/1401.2486), §§3–6, for
  Fock/graph models, Morita and trace/K-theory and Watatani towers.
- Henriques–Nivedita–Penneys, [*Complete W*-categories*](https://arxiv.org/abs/2411.01678),
  §§2–7, Theorem 7.4, for generator sets, Hilb-valued transpose
  and the bi-involutive biequivalence.
- Henriques–Penneys, [*Bicommutant categories from fusion categories*](https://arxiv.org/abs/1511.05226),
  and [*Representations of fusion categories and their commutants*](https://arxiv.org/abs/2004.08271),
  §§3.1–3.3, Theorems 3.10,3.15 and Corollary 3.16, for
  representation existence/uniqueness, absorbing objects, positive
  representations and Morita transport.
- Masuda–Tomatsu, [*Approximate innerness and central triviality of
  endomorphisms*](https://arxiv.org/abs/0802.0344), Definitions2.1,2.4,3.1,
  Theorem3.15 and Corollary3.16(3)–(4), for real-rank partial-isometry
  approximation and its II∞/III₁ characterizations.
- Tomatsu, [*Centrally free actions of amenable C*-tensor categories on
  von Neumann algebras*](https://arxiv.org/abs/1812.04222),
  Theorem D and its Rohlin/approximate-intertwining constructions,
  for the properly infinite uniqueness theorem in CA9.
- Henriques–Penneys–Tener, [*Classification of finite-depth objects in
  bicommutant categories via anchored planar algebras*](https://arxiv.org/abs/2307.13822),
  §§3–4, especially the main-body factor setup on p.16, for CA10.
- Tau Ceti's `Monoidal.Rigid.Basic` and `Monoidal.Rigid.Functor`
  supply evaluation/coevaluation lemmas for Mathlib's exact-pairing
  transport and construct strong-monoidal images. Consume those APIs
  for dual comparisons. Its `Rigid.DoubleDual` uses closed
  braided internal Homs; construct the chosen-dual pivotal comparison
  for general unbraided multitensor categories here. The [dagger-category discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/dagger%20categories)
  distinguishes chosen dagger data from categorical properties and
  describes functors as the corresponding full subcategory.
