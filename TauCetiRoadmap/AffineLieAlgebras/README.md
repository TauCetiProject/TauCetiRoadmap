# Affine Lie algebras, smooth modules and completed centers

Develop polynomial and formal currents, continuous central extensions, smooth
representations, congruence integration and completed enveloping algebras.
Construct vacuum vertex algebras and prove the scalar center theorem away from
critical level and the Feigin–Frenkel isomorphism at critical level, with exact
coordinate and Poisson compatibility. Build usable maps, transport,
extensionality, quotients and examples with each object, not just a path to
these headline theorems.

Also construct the positive even-lattice vertex algebra and its ADE degree-one
Lie comparison as the independent C7 branch below. Its early formal vertex
and abelian Heisenberg/Fock foundations are generic and do not assume the
affine vacuum, the critical-center theorem, or the signed-ADE Jacobi proof.
The later ADE specialization consumes the existing integral-lattice and
signed-ADE carriers, compares raw brackets, and derives raw Jacobi from the
vertex zero-product theorem. Neither this branch nor the elementary
signed-Jacobi/folding route is a premise of the other.

Basic current/vertex theory is over a characteristic-zero field 𝕜. Continuous
classification, integration and center theorems concern a finite-dimensional
complex simple Lie algebra g; simple includes nonabelian. Coefficients have
**discrete** topology, using a type synonym to avoid changing Mathlib's usual
complex topology. In the basic theory F=𝕜((t)) and O=𝕜[[t]]; specialize to
𝕜=ℂ for classification, integration and centers. F has the t-adic linear topology. Orders are integers;
positive orders are cofinal for neighborhoods and completions. For group
actions fix the simply connected pinned group G with Lie algebra g, so its
Langlands dual G∨ is adjoint. The positive K_N are unchanged under central
isogeny; other global loop-group forms are not substituted without handling
their components.

## Conventions and existing foundations

Write x_m=x⊗t^m. For an invariant symmetric form κ use

    [x_m,y_n]=[x,y]_(m+n)+mκ(x,y)δ_(m+n,0)K,
    cκ(x⊗f,y⊗g)=−κ(x,y)Res(f dg).

Mathlib `LoopAlgebra.residuePairing Φ` uses **+Res(f dg)**, so Φ=−κ.
Set κc=−½ `killingForm ℂ g`. For κ0 normalized so its inverse Cartan form on h* gives long roots
squared length2, prove Killing=2h∨κ0, hence κc=−h∨κ0. A scalar level k means κ=kκ0.
K is the distinguished central generator and acts as 1 in the level category.
Include κ=0, the split extension. No degree derivation is silently added.

Consume rather than duplicate:

- Mathlib `LieAlgebra.loopAlgebra`, `LoopAlgebra.toFinsupp`, invariant forms,
  `LieModule.Cohomology.twoCocycle`, `d₁₂`, `d₂₃`, trace/Killing theory,
  Lie modules and `UniversalEnvelopingAlgebra`. Mathlib `Lie/Extension` already
  provides `LieAlgebra.ofTwoCocycle`, `Extension.ofTwoCocycle`,
  `Extension.twoCocycleOf`, `oneCochainOfTwoSplitting` and
  `d₁₂_oneCochainOfTwoSplitting`; consume these directly. Its `d₁₂` has
  trivial-coefficient formula −f([x,y]); use this sign for section changes.
- TauCeti `Algebra/Lie/UniversalEnveloping/Basic` (generator induction,
  representation and center criterion), PBW `pbwAssociatedGradedEquiv` and
  `ι_injective` in `PBW/Injective` and `PBW/Embedding`. Ordinary UEA/PBW,
  finite Casimir and general induction retain their existing owners.
- [FormalLaurentPuiseux L1–L3](../FormalLaurentPuiseux/README.md): Laurent
  topology, substitution and continuous differential/residue calculus.
- [LieHighestWeight Layers1,3,7](../RepresentationTheory/LieHighestWeight/README.md),
  [RootSystems](../RepresentationTheory/RootSystems/README.md) and
  [ReductiveGroups](../ReductiveGroups/README.md): finite Chevalley/root data,
  pinned simple groups and finite-dimensional highest-weight/Harish–Chandra
  theory. FormalConnectionsOpers F4.3 owns finite Chevalley polynomial
  invariants, their degrees/exponents and Kostant regular/slice prerequisites;
  A7 builds the jet/arc invariant theorem from those exact exports. No second finite-dimensional
  representation or root-system development is requested here.
- [IntegralLattices](../IntegralLattices/README.md): the existing `IntegralLattice` carrier,
  integral bilinear form, evenness and positive-definiteness. C7 consumes these actual
  predicates and does not require unimodularity. [RootSystems](../RepresentationTheory/RootSystems/README.md)
  supplies finite ADE root data; the degree-one target is the signed carrier in
  [`ReductiveGroups/SignedADETargets.lean`](../ReductiveGroups/SignedADETargets.lean).
- [FormalConnectionsOpers F1–F8](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1056): pinned
  original G(R((t))), positive congruence groups K_N, dual G∨, regular and
  punctured DS opers, coordinate action, function algebras, Miura transforms
  and classical W/screening comparison. These oper constructions are
  independent of Feigin–Frenkel. Affine lifts and module integration belong
  here. GeometricRepresentationCategories R5.3 owns the finite-Artinian
scalar-extension adapters for its critical-character category family, using
these completion/lift/category exports; it does not rebuild their general
foundations. Generic categorical actions use existing monoidal action/functor
  carriers; geometric representation-category infrastructure has its own owner.

Follow the actual prospective CE/extension and vertex shapes in Mathlib
[#25822](https://github.com/leanprover-community/mathlib4/pull/25822):
`Extension.IsCentral` and the remaining central-extension interfaces,
`VertexAlgebra`, vacuum, translation and Borcherds identity. Cocycle extension
and splitting/coboundary declarations already present at the pin are consumed
from Mathlib, not recreated as prospective objects.
Follow [#29764](https://github.com/leanprover-community/mathlib4/pull/29764)'s
Hahn-series residue-product design. Build missing laws and proofs in Tau Ceti
now and replace them by imports when Mathlib supplies them. Experimental
structures and filenames do not establish center or completion theorems.

## A1. Currents and continuous cohomology

Construct F⊗_𝕜 L, positive O⊗L and order subspaces a_N=t^N O⊗L as base
change of a Lie 𝕜-algebra L. For finite-dimensional L identify currents with
L-coefficient Laurent series; arbitrary tensor products with an infinite-
dimensional L do not represent all coefficient series. Build coefficient
extensionality, bracket convolution, [a_M,a_N]⊆a_(M+N), polynomial inclusion
from `loopAlgebra 𝕜 ℤ L`, injectivity and density by truncation. Prove
Hausdorffness, completeness, continuity of bracket and basis independence.
Formal currents have a finite lower order but may have infinitely many
positive coefficients.

Build continuous alternating cochains with discrete trivial coefficients as
subspaces of the existing CE/multilinear carriers, differential, kernels,
images and quotient cohomology. Prove d²=0 and functoriality. Joint continuity of a bilinear cochain means
separate continuity together with some N for which c(a_N,a_N)=0; prove this
criterion and its topology equivalence. Extend the
residue pairing by its finite coefficient formula for each pair of series;
prove joint continuity, alternation, cocycle and coordinate invariance.
Restriction is Mathlib's polynomial cocycle for Φ=−κ.

For finite-dimensional complex simple g prove the linear equivalence

    invariant symmetric forms on g ≃ H²_cont(g((t)),ℂ), κ ↦ [cκ].

Prove surjectivity and uniqueness. Normalize a continuous cocycle against the
constant semisimple subalgebra using degree-one/two Whitehead lemmas.
Build these vanishing theorems here: construct the CE contraction/Cartan
homotopy, consume existing finite-dimensional complete reducibility and prove
H¹(g,M)=H²(g,M)=0 for finite-dimensional modules M, then build the necessary
mode-block/coefficient-module adapters without assuming Whitehead for an
arbitrary infinite-dimensional module. Use invariance/perfectness and the mode recurrence to reduce
polynomial values to the residue class. Construct and prove continuity of
the normalizing coboundary on formal currents before extending the identity.
Density alone does not supply that coboundary. Prove nonzero class detection,
one-dimensionality for simple g and the finite-product semisimple version.
Extend the classification to every discrete coefficient vector space Z with
trivial action: H²_cont(g((t)),Z)≃Z via a fixed nonzero residue cocycle;
construct the normalizing continuous coboundary without a finite-dimensional
hypothesis on Z. This supplies A2 universality for arbitrary discrete kernels.
This is continuous, not unrestricted algebraic cohomology of F.

## A2. Central extensions, levels and loop lifts

Construct ĝκ=g((t))⊕ℂK with Lie laws, continuous inclusion/projection,
kernel/image exactness and a continuous linear section. Build its polynomial
counterpart and dense embedding. Follow the prospective cocycle extension
API: changing section changes the cocycle by the pinned CE coboundary and
equivalent extensions give the same class. Classify continuously linearly
split central extensions with discrete one-dimensional kernel; prove splitting
for strict exact extensions of the formal-current linear topology with this
kernel: exhibit an open subspace meeting the kernel trivially and extend its
linear splitting. No undefined Tate-space hypothesis is used. Prove
that g((t)) is perfect and ĝκ is perfect exactly when κ≠0. Prove the
nonzero residue extension's universal property among continuously linearly
split central extensions with arbitrary discrete vector-space kernels, using
the coefficient-valued A1 classification. Give the universal-kernel comparison. Positive
currents and a_N for N≥0 split canonically because their cocycle is zero.

Prove invariant forms are multiples of Killing and the root-normalized
κ0/h∨ identity. Define h∨ intrinsically by the highest-coroot/root-data
formula (equivalently one half the adjoint Casimir scalar for κ0), prove the
equivalence of these descriptions and Killing=2h∨κ0, including positivity
and integer type values. The symbol h∨ is built here, not assumed native. If κ'=λκ and λ≠0, prove identity on currents and K↦λK'
is a Lie equivalence. Pulling back a K'=1 module gives K=λ, so this alone
is not an equivalence between the two K=1 categories. Prove scalar-central-
character transport, including K=a versus form aκ with K=1. For a≠0
use the affine Lie equivalence; for a=0 construct the equivalence directly
through the split current representation. Do not infer a Lie equivalence
from a map killing the central generator.

Using the oper supplier's adjoint action and Maurer–Cartan differential, pin
and prove the affine lift

    g·(A+cK)=Ad_g A +(c+Res κ(g⁻¹dg,A))K.

Check bracket, composition, inverse, K, continuity and congruence order
estimates. The displayed Ad_g convention requires g⁻¹dg in that pairing.
The supplier uses dlog(g)=(dg)g⁻¹; prove
Resκ(g⁻¹dg,A)=Resκ(dlog(g),Ad_gA). Formal-coordinate substitution fixes K, preserves the cocycle by residue
invariance and conjugates loop actions correctly. Extend both Lie lifts
using native UEA lift to Uκ algebra automorphisms, checking preservation
of ι(K)−1. For each loop element g and N prove a_g(I_M)⊆I_N for
some M, and the inverse estimate for g⁻¹; derive these from current
order bounds and vanishing of the central Maurer–Cartan residue on high
positive currents. Formal coordinates preserve every I_N. Extend these
maps uniquely to continuous algebra automorphisms of Ûκ, with
continuous inverse, generator compatibility, group product/inverse laws
and the semidirect conjugacy a_σ a_g a_σ⁻¹=a_(σ(g)).

Pin Aut(O) as the actual group of continuous coefficient-linear algebra
automorphisms preserving O and its maximal ideal, with multiplication
σ τ=σ∘τ. If φ_σ=σ(t), then φ_(στ)=φ_τ∘φ_σ; substitution
parameters compose in the reverse written order. The lifts on currents,
Uκ and Ûκ compose as a_(στ)=a_σ∘a_τ. Prove these equations
instead of identifying Aut(O) with series under an unpinned product. Prove parameter-independent
extension and splitting comparisons.

## A3. Smooth modules and congruence integration

Smoothness is ∀v∃N>0, a_N·v=0, with N depending on v. Build the category
with Lie-linear morphisms, K=1 full subcategory, kernels, cokernels, sums,
restriction and induction/adjunctions using existing Lie/UEA APIs. Establish
smoothness and PBW descriptions of congruence-induced modules
Uκ⊗_(U(a_N))ℂ. Subquotients and finite sums are smooth; products in this
category take smooth vectors of the ordinary product.

Prove polynomial restriction is an equivalence with polynomial modules
satisfying ∀v∃N∀x∈g∀n≥N, x_n·v=0. Define formal action by finite
truncation on each vector; prove cutoff independence, common estimates for
the Lie law, uniqueness, morphism transport, inverse functors and central
character compatibility. Finite monomials describe the dense polynomial
subalgebra, not the whole formal current algebra.

For N>0 use K_N=ker(G(O)→G(O/t^N)) and its pro-unipotent jet quotients.
Consume the oper supplier's F3.1 exponential/logarithm and BCH comparisons
with a_N and nilpotent jet Lie algebras, functorial over complex algebras.
The exact export is exp:a_N≃K_N with inverse log and finite-jet
compatibility. Prove the identification of A1's current-order Lie algebra
with the supplier's native congruence Lie carrier and the compatible
jet projections here. Build the action on affine modules here; the
underlying group/BCH construction retains the oper owner. A rational K_N-module is
a comodule over its coordinate Hopf algebra: each vector lies in a finite-
dimensional rational submodule factoring through a finite jet quotient.
Prove differentiation, unique integration, finite-jet exponential formulas
and morphism compatibility. Such an integrating action implies smoothness.

Prove the finite-generation theorem: every finitely generated smooth
Uκ-module admits a rational integrating K_N-action for some N>0. Choose a
common annihilating order M>0 for finitely many generators; the integrating
N may be taken to be M. Present V as a
quotient of a finite sum of congruence-induced modules and prove iterated
commutator/PBW estimates giving those modules rational K_N-actions. Descend
the action, prove uniqueness and intertwining with the full affine A2 lift.
On each induced Q_M, show a_M does not increase PBW length while raising the loop
degree of its finite orbit, yielding finite-jet rationality. Prove the
non-finite-generated counterexample ⊕_(M>0)Q_M is smooth but has no common
integrating K_N: choose M>N and a nonnilpotent PBW action of a_N on Q_M.

Pin the local-nilpotence dictionary. When the cyclic a_N-submodule of a vector factors
through a finite nilpotent jet Lie algebra, pointwise local nilpotence gives
finite-dimensional nilpotent rational orbits by Engel/PBW. Prove joint
nilpotence and jet factorization before exponentiation. The notes' shorthand
'locally nilpotent action' is used with this continuous rational-orbit
interpretation, not as a claim about arbitrary discontinuous pronilpotent
representations. Retain finite generation in the uniform-N forward theorem;
objectwise isomorphisms under K_N alone give no coherent rational action.

## A4. Central-level UEA and left-ideal completion

Form Uκ from the existing UEA of ĝκ by the **two-sided central relation**
ι(K)−1. Prove the K=1 universal property, PBW/current injection and level
transport. With a fixed κ0 also prove the quotient-level comparison
Uκ≃U(ĝκ0)/(K_standard−k) for κ=kκ0, including k=0.
The comparison is the identity on currents and sends each I_N to the
corresponding standard-level I_N. Prove it is equivariant for the mode-degree
derivations. It therefore extends after explicitly adjoining d, and gives
the continuous completed comparison with U(ℂd⋉ĝκ0)/(K_standard−k),
matching the extended Verma modules and their highest-weight/Cartan actions
used in A8. Prove every statement for all k, including zero. This is an
algebra/category comparison, not a Lie equivalence when k=0.
For N>0 define I_N=Uκ·ι(a_N) as a submodule of the left regular
Uκ-module. Prove antitonicity and transitions Q_M→Q_N for M≥N, where
Q_N=Uκ/I_N is a left **module quotient**, not a quotient ring.

Define Ûκ as the compatible-family inverse limit of these discrete modules.
Prove its linear complete/Hausdorff structure, coordinate topology, canonical
dense Uκ map and PBW separation ⋂I_N=0. For every b∈Uκ and N prove
∃M, I_M b⊆I_N by commuting positive currents through finite PBW words,
tracking all lower orders and central terms. Thus each Q_N is smooth.

Construct multiplication: extend the Uκ action on every smooth Q_N uniquely
to Ûκ using vectorwise cutoffs; set (ab)_N=a·b_N. Prove projection
compatibility, well-definedness, agreement on Uκ, distributivity, unit and
associativity using module-action uniqueness. Prove ker π_N are closed left
ideals and ∀b∈Ûκ∀N∃M, (ker π_M)b⊆ker π_N, by selecting a
representative of b_N. These estimates establish right-multiplication and
joint multiplication continuity at each pair. An inverse limit of rings is
not a proof and left ideals cannot be replaced by two-sided ideals.

Prove polynomial/formal completed-algebra equivalence with inverse maps,
topology and generator compatibility. For arbitrary P_N∈Uκ and A_N∈g,
prove the source example P₀+Σ_(N≥1)P_Nι((A_N)_N) converges in Ûκ,
because its N-th term lies in I_N. No norms or bounds on P_N are needed.
Its action on any smooth vector is the finite sum at its annihilating cutoff.

## A5. Completed modules and field calculus

Own the reusable module-category adapters used below. For an associative
algebra A with a specified decreasing left-ideal neighborhood basis J_N,
define the native `ModuleCat A` object property
∀v∃N, J_N·v=0, and the property of pointwise-continuous action on a
discrete module. Prove their equivalence when the J_N form the topology's
actual zero-neighborhood basis; express that hypothesis by equality of
neighborhood filters or `HasBasis`, not an arbitrary named Prop. Use native
`ObjectProperty.FullSubcategory` and restriction of scalars. Prove invariance
under module isomorphisms, closure under kernels, cokernels, images, arbitrary
direct sums and finite products, and the resulting abelian category structure.
Construct the smooth-vector submodule functor on ordinary A-modules and
prove it is right adjoint to inclusion of the smooth full subcategory.
Its A-stability uses ∀b,N∃M, J_M b⊆J_N, derived from right-multiplication
continuity. Products use this smooth part of the ordinary product. Do not assert
closure under arbitrary algebraic extensions or ordinary infinite products
without the needed continuity hypotheses. For a continuous algebra homomorphism
prove restriction preserves these properties when the pullback neighborhood
bounds hold, with the actual carrier/action/morphism formulas.

For a coefficient-linear topological algebra A over the discrete field ℂ,
construct continuous coinduction of a discrete vector space V as the vector
space Hom_cont,ℂ(A,V). Define it as the continuous/smooth A-submodule of
native `ModuleCat.coextendScalars (algebraMap ℂ A)`, whose action is already
(b·f)(a)=f(ab). Obtain the adjunction by composing native
`restrictCoextendScalarsAdj` with the smooth-part coreflection, not by
recreating algebraic coextension. Prove this action is smooth:
the kernel of f contains some J_N and a b∈J_N for b∈J_N, since J_N is
a left ideal. Conversely, if J_N annihilates f, then
f(b)=(b·f)(1)=0 for b∈J_N; its kernel is open, so f is continuous.
Prove equality of the continuous submodule and the smooth part under the
actual A5 HasBasis hypothesis. Give the composite adjunction's unit, counit
and morphism formulas, and prove coinduction is right adjoint to the exact underlying-vector-space functor.
Prove this functor preserves and reflects monomorphisms, using the inherited
kernels and faithfulness, so native `EnoughInjectives.of_adjunction` applies.
The unit M→Hom_cont,ℂ(A,M), m↦(a↦am), is an injective module map by
evaluation at 1; its orbit maps are continuous by the defining object
property. Every vector space is injective, so the right adjoint sends these
injectives to injectives. Use this construction to provide native
`EnoughInjectives` and `HasExt.{max u w}` for the ambient smooth/discrete
continuous category over `ModuleCat.{max u w} A`, for A : Type u. Use native
`EnoughInjectives.of_adjunction` and explicit
`hasExt_of_enoughInjectives.{max u w}` with inherited
`LocallySmall.{max u w}`. Hom(A,V) then stays in that category; use these
universe parameters in the coinduction functor and adjunction. Ext must live
in the module Hom universe, rather than the larger default universe supplied
by `HasExt.standard`. This Ext is ambient smooth
module Ext. Do not replace it by fixed-central-character Ext when an
infinitesimal anchor moves that character. GeometricRepresentationCategories
owns the subsequent outer-derivation/self-extension comparison.

For a complete Hausdorff topological algebra A and a closed ideal L in its
commutative center, form the closed two-sided ideal J generated by A·L,
using native `TwoSidedIdeal`/ring congruence and the quotient topology.
Prove that pointwise-continuous discrete A-modules killed by L are precisely
the restrictions of pointwise-continuous discrete A/J-modules. Build the
natural inverse functors with the same carriers and prove their action
identities and quotient-map continuity; action kernels are closed, so killing
L also kills the closure of A·L. For a continuous central character χ,
apply this to L=ker χ. Prove the equivalent scalar-action equation
z·v=χ(z)v, full-subcategory closure and the closed-central-ideal quotient
comparison. These are base module/central-character constructions here;
GeometricRepresentationCategories consumes them and owns coherent
categorical transport.

A continuous algebra automorphism a sends L to a(L) and J to the associated
closed ideal. Prove that module pullback along a⁻¹ carries the character χ
to χ∘a⁻¹, preserves pointwise continuity and all the specified module
properties, and fixes the χ object property when χ∘a⁻¹=χ. Use native
change-of-rings functors for these single-automorphism formulas; the
coherent group/groupoid actions are the downstream category owner's work.

Prove an equivalence between smooth K=1 affine modules and Ûκ-modules on
discrete vector spaces with pointwise-continuous orbit maps a↦a·v. Construct
extension/uniqueness and inverse functors; an open annihilator restricts to
smoothness. Prove compatibility with subquotients, induction, polynomial/
formal comparison and central characters. Use `Subalgebra.center` for the
completed center, prove closedness, its topology and generator-detected
centrality by density and continuity. It acts on every smooth module.

Develop J^x(z)=Σ_n x_n z^(−n−1), derivatives, residues, delta/expansion
identities and normal ordering (negative modes left of nonnegative modes).
Consume HVertexOperator/VertexOperator and Hahn summable families. Prove
coefficients of required products are well-defined in Ûκ by I_N estimates,
with reindexing and action identities. Formal locality is coefficientwise
annihilation by a power of z−w, not analytic convergence.

## A6. Vacuum vertex algebras and deformation

Construct Vκ=Ind_(g[[t]]⊕ℂK)^(ĝκ)ℂ, g[[t]] acting trivially and K by 1.
Give its PBW identification with U(t⁻¹g[t⁻¹]), vacuum, grading, translation,
current fields and reconstruction. Prove full vertex laws: truncation,
vacuum/creation, translation, locality, Borcherds identity, skew symmetry,
residue products and reconstruction uniqueness; build morphisms and modules.
Define its center by all nonnegative products vanishing, prove it is a
commutative differential algebra with product u_(−1)v, and identify it with
g[[t]]-invariants in Vκ.

For noncritical k build the κ0-dual-basis Sugawara conformal vector, basis
independence, current/Virasoro commutators and central charge
k·dim(g)/(k+h∨). At critical level use S=½Σ_a:J^aJ_a: without division
by k+h∨, prove its coefficients central and nonscalar by PBW. Construct
Aut(O) action from current reconstruction at every level.

Construct κ_ℏ=κc+ℏκ0 over ℂ[ℏ] and its flat PBW lattice. Pin the full
formal completed-UEA family as lim_(N,r) Q_(N,ℏ)/ℏ^r, equivalently
lim_N Q̂_(N,ℏ), where Q̂_(N,ℏ)=lim_r Q_(N,ℏ)/ℏ^r and
Q_(N,ℏ)=U_ℏ/I_(N,ℏ) over ℂ[[ℏ]]. An infinite-rank free stage over
ℂ[[ℏ]] is not itself ℏ-adically complete. Pin the full vacuum family as
its ℏ-adic completion lim_r V_ℏ/ℏ^r; distinguish this from the graded free
family, whose completeness is only gradewise. Prove ℏ-torsion-freeness,
flatness over the DVR ℂ[[ℏ]], ℏ-adic completeness and specialization.
For every r≥1 construct the reductions over ℂ[ℏ]/(ℏ^r), and prove
that reduction of this bi-indexed family gives lim_N Q_(N,ℏ)/ℏ^r.
Supply the PBW stage descriptions, surjective transition maps and
Mittag-Leffler lifting argument needed to interchange reduction and current
completion; do not assume tensor products commute with arbitrary inverse
limits. Export the order-ℏ² data over ℂ[ℏ]/(ℏ³) and compatibility with
the full family: divided commutators and their bracket are computed in a
family lifting beyond first order.

Construct the completed ring multiplication by A4's quotient-module action
argument over each ℂ[ℏ]/ℏ^r and then the compatible (N,r) limit. Export its
continuous multiplication, the closed left-ideal kernels of the actual stage
projections, and the right-shift estimate: for every b, N and r, there is M
such that `(ker π_(M,r))·b ⊆ ker π_(N,r)`. M may depend on r; an arbitrary
formal b can have unbounded negative current orders in its successive
ℏ-coefficients, so no uniform-in-r current bound is assumed. Prove
ℏ-torsion-freeness of every completed current stage Q̂_(N,ℏ), and its reduction
comparison to the finite-r stages. These are the actual ring/stage suppliers
used for downstream divided-commutator convergence.

Extend A2's original-loop affine lift to this full level-dependent family,
using κ_ℏ in its Maurer–Cartan central term. Construct the continuous
ℂ[[ℏ]]-algebra automorphism action on A_ℏ, its compatible `(N,r)` quotient
bounds, products/inverses, and all truncated reductions. Its critical reduction
is A2's action. Construct the continuous coefficient-linear ordered-PBW
specialization section s:A→A_ℏ, with s(1)=1, compatible with every (N,r)
transition and preserving the stage kernels. Export division-by-ℏ estimates
on its zero-specialization differences and the continuous product defect
c(z,w)=(s(zw)−s(z)s(w))/ℏ mod ℏ. For every admissible lift z_ℏ of a
critical central element z, export the divided original-loop change
(a_(ℏ,γ)(z_ℏ)−z_ℏ)/ℏ mod ℏ with its stage bounds. This is quantified over
lifts; no downstream choice of central generators or presentation is used.
GRC consumes this section and these estimates, constructs its ordered-central-
monomial lift, and extends the divided changes to continuous differentials.

Define the critical center bracket {z,w}=([z̃,w̃]/ℏ) mod ℏ. Prove
divisibility, lift independence, centrality, antisymmetry, Jacobi, Leibniz and
continuity by the full flat family and its compatible reductions. Export
continuous divided-commutator operators on central lifts, explicitly exporting
independence of the auxiliary lift of a, the associative Leibniz identity,
and the change-of-central-lift formula
`δ_(z_ℏ+ℏb_ℏ)=δ_(z_ℏ)+ad_(b_ℏ mod ℏ)`, together with their reduction
identities and order-ℏ² commutator formula, for the downstream continuous
outer-derivation to Ext¹ comparison. That comparison and its category-level
coherence belong to GeometricRepresentationCategories; full groupoid integration
remains conjectural there. Construct the vacuum vertex Poisson structure
from ℏ-linear polar products. Division is justified by this flat family.

## C7. Positive even-lattice vertex algebras and ADE degree one

Its phases are ordered as follows: (i) a generic formal vertex-algebra
foundation on native Hahn fields, including residue products, vacuum,
translation, locality closure and reconstruction; (ii) an abelian Heisenberg
central extension and symmetric Fock representation built from a complex
vector space with a symmetric bilinear form; (iii) the positive even-lattice charge
algebra, full Fock space and fields; (iv) conformal grading and transport;
(v) the generic weight-one zero-product Lie theorem; (vi) the ADE comparison
with the raw signed bracket; and (vii) the separate pinned-generator
normalization. The generic phases precede and do not consume A6's affine
vacuum or A7's critical-level theorem. Their operator covariance,
coefficient reconstruction, internal grading and zero-mode laws are explicit
construction targets, not an assumed vertex facade. The ADE phase does not install the
SignedADE LieRing/LieAlgebra structures: it proves raw integral Jacobi by
scalar-extension injectivity.

This is a separate construction branch in this owner. It consumes the current
`TauCeti.IntegralLattice` carrier and its evenness/positive-definiteness
contracts from [IntegralLattices](../IntegralLattices/README.md), the finite
root-system realizations/classification from [Root Systems](../RepresentationTheory/RootSystems/README.md),
and the ADE root-lattice/norm-two-shell bridge owned by
[ReductiveGroups, Layer 9 §9A.1a](../ReductiveGroups/README.md),
together with the actual signed Lie carrier and bracket in
[`ReductiveGroups/SignedADETargets.lean`](../ReductiveGroups/SignedADETargets.lean).
It reuses the actual `HVertexOperator`/Hahn-series coefficient carrier and the
field conventions recorded in A5–A6. A6's affine vacuum `Vκ` is not the lattice
state space, and no assertion about `Vκ` proves a lattice-VOA law. C7 builds
the lattice state space and fields separately, and proves its own vacuum,
translation, truncation, locality and Borcherds identities. No signed-Jacobi,
folding, compact-normalizer or Feigin–Frenkel theorem is a premise of this
branch.

**Inputs and normalization.** Work over `ℂ`. An input is a finite-rank,
nondegenerate positive-definite even integral lattice `(L,B)` in the existing
`TauCeti.IntegralLattice` carrier. Even means `B(α,α)∈2ℤ`; write
`q(α)=B(α,α)/2∈ℤ`. Neither unimodularity nor self-duality is assumed. Choose a
`ℤ`-basis with a total order. One normalized sign cocycle is

    ε(α,β) = (−1)^( Σ_{i>j} B(b_i,b_j) α_i β_j ).

Prove its unit, normalized 2-cocycle law and
`ε(α,β) ε(β,α)⁻¹=(−1)^(B(α,β))`. The lattice central extension is the actual
group `L̂=L×{±1}` with
`(α,s)(β,t)=(α+β, st ε(α,β))`; its central involution acts by `−1` on the
state space. Define the twisted group algebra `ℂ_ε[L]` on `L→₀ℂ` with
`e^α e^β=ε(α,β)e^(α+β)`. Its associativity and unit are consequences of the
cocycle equations, not extra assumptions. The displayed basis construction is
an explicit choice, not an assertion that a lattice has a preferred ordered
basis. If `ε'/ε` is the coboundary of `c:L→{±1}`, prove the induced map on
basis vectors and its inverse; homomorphic changes of lift differ by a
character of `L`. Lattice isometries act on the oscillator space and extend to
the twisted group algebra only after the corresponding cocycle cochain is
specified and checked.

**Oscillators and state space.** Put `H=ℂ⊗ℚ(L⊗ℤℚ)` and extend `B` complex
bilinearly; it remains symmetric. The loop-mode space is the finitely supported
family `ℤ →₀ H`, with a one-dimensional central coordinate, so the Heisenberg
carrier is `(ℤ →₀ H) × ℂ`. Its bracket has zero loop coordinate and central
coordinate

    c(x,y) = Σ_(m∈ℤ) m B(x_m,y_(−m)).

The sum is finite because `x` and `y` have finite support. Symmetry of `B`
makes `c(y,x)=−c(x,y)`; centrality then makes Jacobi immediate from the
vanishing loop coordinate. The mode number is an index of a family, not an
additive coordinate of a single mode. The oscillator generators are the
finite-support direct sum `⊕_(n>0) H t^(−n)`. Define the Fock space, including
every lattice charge, by

    V_L = Sym_ℂ( ⊕_(n>0) H t^(−n) ) ⊗_ℂ ℂ_ε[L].

For `h∈H` and `n>0`, `h(−n)` is multiplication by the corresponding
symmetric-algebra generator and `h(n)` is its contraction derivation, with
`h(n)` acting on a generator `k(−m)` by
`n B(h,k) δ_(n,m)`. Define `h(0)e^α=B(h,α)e^α`. The generic oscillator action
is a family in the actual symmetric bilinear form `B`, its symmetry input,
every `n∈ℤ` and `h∈H`; its defining creation, contraction, zero-mode and
commutator equations retain all these operands. Degenerate symmetric forms
remain allowed in this generic phase. An admitted constructor, when used as
a prototype, retains its determining data inside one complete dependent-Pi
family; an unchanged result carrier alone cannot encode dependence on `B`. Prove on all
Fock monomials
that

    [h(m),k(n)] = m B(h,k) δ_(m+n,0) · id.

Assemble these operators and `c ↦ c·id` into a linear representation of the
full finitely supported loop plus center, and state its bracket-intertwining
law. The vacuum is `1⊗e^0`, and the charge vector is `e^α=1⊗e^α`. Give the
actual Heisenberg representation, not only a formal collection of modes.
Identify the charge-zero oscillator sector with the generic symmetric Fock
representation by an explicit linear embedding and prove that every integer
mode intertwines; its zero mode vanishes on the generic oscillator vacuum.
On a charged vector retain the distinct formula
`h(0)e^α=B(h,α)e^α`, and prove it is the charged specialization of the same
Heisenberg representation.

**Translation from the oscillator algebra.** Before any reconstruction or
bundled vertex axioms, construct the unique complex-linear derivation `δ` of
the symmetric oscillator algebra satisfying

    δ(1)=0,  δ(uv)=δ(u)v+uδ(v),
    δ(h(−m))=m h(−(m+1))  (m>0).

A concrete construction sends each generator `g` to `ι(g)+ε ι(shift(g))`
in the square-zero extension of the symmetric algebra by itself and uses the
symmetric-algebra universal map; its constant component is the identity and
its ε component is `δ`. Prove the linear, unit, product and generator equations
for that actual map. Define the Fock translation by bilinear extension of

    T(u⊗e^α)=(δ(u)+u α(−1))⊗e^α.

Prove `T1=0`, `Te^α=α(−1)e^α` and independently prove the operator equation
`[T,h(n)]=−n h(n−1)` for every integer `n`. Negative modes use the derivation
law; for `n≥2` use the contraction derivations; at `n=1` the charge multiplication
term supplies `−h(0)`; at `n=0` the operators commute. Derive charge-field
covariance `[T,Y(e^α,z)]=∂_zY(e^α,z)` from the actual finite charge coefficient
formula on every oscillator word and charge, then extend by the independent
spanning theorem for Fock monomials. These proofs precede the generic vertex
bundle and do not use its covariance projection.

**Fields and finiteness.** Use the convention
`Y(a,z)=Σ_(r∈ℤ) a_(r) z^(−r−1)`. For a charge vector set

    E⁻_α(z)=exp( Σ_(n>0) α(−n) z^n/n ),
    E⁺_α(z)=exp(−Σ_(n>0) α(n) z^(−n)/n ),
    Y(e^α,z)=E⁻_α(z) E⁺_α(z) e_α z^(α(0)),

where `e_α` is left multiplication by the basis vector in the twisted group
algebra and `z^(α(0))e^β=z^(B(α,β))e^β`. Extend to a general Fock monomial by
normal ordering: the field of
`h₁(−m₁)…h_s(−m_s)e^α` is the normally ordered product of
`(m_i−1)!⁻¹ ∂^(m_i−1)h_i(z)` with `Y(e^α,z)`, with negative modes to the
left of nonnegative modes. For actual fields `A,B`, pin the binary normal
product by

    (:A B:)_(n) v = Σ_(i<0) A_(i) B_(n−1−i) v
                    + Σ_(i≥0) B_(n−1−i) A_(i) v.

For each fixed `n,v`, prove both tails vanish, evaluate this as a finite
symmetric-cutoff sum and prove stability under enlarging the cutoff. Define
the normal product of a list by recursion on the actual ordered list and
final charge field. Divided derivatives retain their actual input field and
positive derivative index. Prove each coefficient is a finite sum on every
fixed Fock monomial; the resulting series has the required Hahn support. Prove
reindexing and multiplication identities coefficientwise. This is a formal
construction: no analytic convergence is asserted.

In particular, on `u=h₁(−m₁)…h_s(−m_s)e^β`, the charge field has the
normal-ordered action

    Y(e^α,z)u = ε(α,β) z^B(α,β)
      exp(Σ_(n>0) α(−n)z^n/n)
      ∏_j (h_j(−m_j) − B(α,h_j)z^(−m_j)) e^(α+β).

For normalized mode `r`, choose the subset `J` of oscillator factors that
contract with `α`; its exponential degree is
`q_J=−r−1−B(α,β)+Σ_(j∈J)m_j`. The term is zero when `q_J<0`. Otherwise its
coefficient is the product of the contractions `∏_(j∈J)(−B(α,h_j))`, the
uncontracted creation operators, and the finite partition sum for
`exp(Σ_(n>0)α(−n)z^n/n)` at degree `q_J`. That sum ranges over the finitely many
multiplicities `k_1,…,k_(q_J)≥0` with `Σ n k_n=q_J` and has coefficient
`∏_n α(−n)^(k_n)/(n^(k_n) k_n!)`. State the coefficient equation for every
word, both charges and every integer mode; this is the actual finite formula,
not an alias of the state-field coefficient.

Prove truncation for sufficiently large positive normalized indices
(``a_(n)b=0`` for all ``n≥N``), the vacuum-field identity, absence of negative
powers in ``Y(a,z)1``, and the full creation identity
``Y(a,z)1=e^(zT)a`` coefficient by coefficient (not only its constant term). Require ``T1=0`` and the derivative identity ``Y(Ta,z)=∂_zY(a,z)``
with the normalized mode shift. The early generic creative/local interface additionally requires the
independent operator-covariance axiom ``[T,Y(a,z)]=∂_zY(a,z)`` on every state;
in normalized modes this is ``T a_(n)−a_(n) T=−n a_(n−1)``. The generic
covariance theorem projects this axiom. State derivative and full creation are
retained, but are not used to infer this missing operator law. For the lattice
construction, establish covariance of the actual Heisenberg and charge fields
independently from the concrete translation above. Prove coefficient-level
closure under each divided derivative and binary normal product using the
existing finite-tail witnesses with a common cutoff for `v`, `Tv` and the
shifted coefficients. Reindex the split negative/nonnegative sums; the only
boundary at index zero has factor zero. Induct on the ordered list of factors,
use the actual all-word normal-order equations and Fock spanning to obtain
covariance for every state. Supply this pre-bundle theorem to the generic axiom
field when constructing the graded formal vertex-algebra structure on V_L. Reconstruction must consume
covariant generating fields and cannot create its own missing hypothesis. Prove skew symmetry and the Borcherds/Jacobi
identity for every three states. Prove locality in the actual
coefficient convention: for each `a,b∈V_L` some `N≥0` satisfies
`(z−w)^N[Y(a,z),Y(b,w)]=0` after the two iterated Hahn expansions are mapped
to their common coefficient identities. For charge fields the exponent comes
from `B(α,β)` and the commutator of `ε`; evenness is what gives an ordinary
vertex algebra, rather than an odd-lattice vertex superalgebra. Reconstruct the
state-field map from the Heisenberg and charge fields and prove uniqueness;
prove all state-field, product and translation equations, not only locality of
the generators. The resulting structure is a vertex operator algebra in the
standard characteristic-zero sense specified by the A6 conventions. In this
normalization ``Y(a,z)=Σ_n a_(n)z^(−n−1)``, define conformal operators by
``L_m=ω_(m+1)``. The Virasoro relation is

    [L_m,L_n]=(m−n)L_(m+n) + rank(L)/12 · (m^3−m)δ_(m+n,0) id.

In normalized state modes this is

    [ω_(m),ω_(n)]=(m−n)ω_(m+n−1)
      + rank(L)/12 · ((m−1)^3−(m−1))δ_(m+n,2) id.

The translation operator is ``L_(−1)=ω_(0)``. These shifts are part of the
chosen coefficient convention.

**Conformal grading.** Choose a complex-orthonormal basis `{h_i}` of the
nondegenerate complex bilinear space `H`; the finite index type is stored as
basis data, so install its `Fintype` witness locally when forming the finite
sum (with local classical decidable equality). Prove basis independence of
`ω=½Σ_i h_i(−1)^2 1`. Prove its Virasoro relations with central charge
`rank(L)`, and prove the exact weight formula

    wt(h₁(−m₁)…h_s(−m_s)e^α)=Σ_i m_i + B(α,α)/2.

Thus the grading is by `ℕ`, `V_L[0]=ℂ·1`, and each homogeneous space is
finite-dimensional. The actual monomial-span submodules form an internal
algebraic direct sum: use native `DirectSum.IsInternal` and the canonical
sum-of-inclusions `DirectSum.coeLinearMap`. Define the decomposition as its
inverse, prove the inverse on each actual component is its inclusion, and
export component evaluation, spanning and independence. The generic graded
vertex interface has the same actual-submodule internality requirement; an
unrelated external direct-sum isomorphism is insufficient. Use native
`TauCeti.IntegralLattice.IsPosDef.finite_setOf_norm_le` for bounded charge sets,
together with the finite-rank oscillator partitions; do not duplicate the
positive-definite shell finiteness theorem in this owner. The broader evenness,
shell classification and positive-lattice constructions remain in the written
IntegralLattices prerequisite. Construct and prove direct-sum and isometry APIs: with the
product cocycle,
`V_(L⊕M) ≃ V_L ⊗ V_M` as graded vertex operator algebras and
`ω_(L⊕M)=ω_L⊗1+1⊗ω_M`; construct each tensor-mode coefficient as the finite
convolution with index `i+j=n−1`, prove both tails vanish for each fixed pair
of states, and prove the result is independent of enlarging the symmetric
cutoff. A lattice isometry plus its specified cocycle lift induces an
isomorphism commuting with every field and conformal mode. Do not
infer modularity, character transformation laws, rationality, `C₂`-cofiniteness,
or holomorphicity from this construction.

**ADE degree-one comparison.** For a finite simply-laced ADE Gram datum `D`
from `SignedADETargets`, use its actual `IntegralLattice` with the explicit
ordered-basis cocycle above, identical to `SignedADE.epsilon`. Prove that its
norm-two shell is precisely the finite root system and that

    V_(Q_D)[1] = H(−1)1 ⊕ ⨁_(α∈Q_D, B(α,α)=2) ℂ e^α.

The grading contract is for every integer mode index: if `p+q−n−1≥0`, then
`a_(n)b` lies in weight `p+q−n−1`; if that integer is negative, the mode is
zero. Keep the coefficient evaluation `a_(n)b = coeff(Y(a),−n−1)b` explicit.
This gives closure of the zero product from the actual field coefficient,
rather than merely postulating a linear map on the weight-one subspace. The
zero product `a_(0)b` makes this weight-one subspace a Lie algebra from
the VOA axioms. Prove closure, skew symmetry and Jacobi for the zero product
from truncation, full creation, Borcherds, translation and `V[0]=ℂ·1`; this generic theorem
precedes the ADE specialization. Prove alternation and the Leibniz/Jacobi
identity in the existing submodule addition. Build the literal `LieRing` by
extending that captured additive group and the compatible complex
`LieAlgebra` by extending the captured scalar module; expose both parent
identities and the actual bracket evaluation. Carry these same parents
through the lattice specialization and the raw complex-linear comparison.
An existential unrelated additive parent cannot be transported by that
comparison. Also prove the weight spaces form an exhaustive internal
algebraic direct sum. Define the generic operation by the field's
`−1` coefficient, record that evaluation equation, and prove the lattice
specialization is exactly the separately defined lattice zero product before
transferring the Lie laws. Define the scalar extension of the
already-defined **raw bilinear map** `SignedADE.bracket` without installing
the target `LieRing` or `LieAlgebra`. Construct the raw complex-linear
comparison from weight one: send `h(−1)1` to the raw signed Cartan vector and
each charge vector to the raw root coordinate through the chosen
central-cover section. Verify on all pairs the four cases: Cartan–Cartan is
zero; Cartan–root is the lattice pairing; root vectors with root-sum a root
have coefficient `ε(α,β)`; opposite roots give `ε(α,−α) α(−1)1`; all other
root pairs are zero. This proves the scalar-extended raw bracket satisfies
Jacobi. Use the displayed free integral basis of the signed carrier to prove
that its unit map into the complexification is injective, then descend this
Jacobi identity to the raw integral bracket. For the injection use the
actual map `x ↦ 1 ⊗ x`: `SignedADE.integralBasis D` makes the carrier free,
so it is flat over `ℤ`; `Module.Flat.tensorProduct_mk_injective` applies with
`R := ℤ`, `S := ℂ`, `M := Carrier D`, using the faithful `ℤ`-action on `ℂ`.
This does not assert that `ℂ` is faithfully flat over `ℤ`. Only after this
alternative proof may the LieRing/LieAlgebra instances be installed or used as
comparison endpoints. Then prove the raw opposite-root and Serre-generator formulas.
Consume Root Systems' ADE classification and the existing signed carrier and
raw bracket; do not introduce a second root basis or Lie model. Use the
root-lattice `Carrier` for the Lie algebra. The separate `FullCarrier D Y`
remains the group-form-aware toral construction; it is not silently identified
with `Q_D` for every global form.

The pinned `SignedADE.normalizationSign` is a separate diagonal change of
generators, not a lattice character. First prove the raw charge-to-raw-root
comparison, with explicit evaluation on each Cartan oscillator and each
norm-two charge. Extend the integral diagonal map by the native tensor-product
`LinearEquiv.baseChange` to the complexification; prove its pure-tensor and
inverse pure-tensor equations, then compose the raw VOA comparison with that
same map. The transported bracket is
explicitly ``[x,y]ₛ = S([S⁻¹x,S⁻¹y]raw)``; it is not asserted to be the
unchanged raw epsilon bracket. Equivalently, the structure constants acquire
``s(α)s(β)/s(α+β)``. Do not rescale just the charge side while leaving the raw
epsilon bracket fixed. Pin the ordered basis and prove Cartan/root, root-sum,
opposite-root, and Serre formulas for the resulting transported generators.

The normalized Construction11 page-4 transcription records an attributed
proposal: Richard suggests a vertex operator algebra containing the Lie algebra
in degree 1 and says it uses all of `L̂`, not only `Δ̂`; the author says this
seemed more trouble than worthwhile for their purposes. This is motivation for
a separate construction target, not a theorem or a completed construction in
the notes. The normalized semester-two pages 111–113 and 124 separately record
the Borcherds central-extension Lie construction, norm-two lifts, and
bracket/Jacobi checks. They do not establish the full lattice VOA construction
specified in C7. Keep the attributed wording and the source records'
transcription uncertainties; do not recast them as proof or as the author's
chosen method. C7 does not change the independent order of ReductiveGroups §9A signed Jacobi
and subsequent folding work.

## A7. Vacuum center and proof prerequisites

Prove Z(Vκ)=ℂ·vacuum at every noncritical κ, including zero. At critical
level prove it is freely generated as a commutative differential algebra by
ℓ homogeneous Segal–Sugawara states of weights d_i+1 (ℓ=rank g; d_i Weyl
exponents), and identify it with Fun Op_G∨(D). Construct generators,
freeness and surjectivity, not just the quadratic state or an injection.

Build the free-field proof prerequisites here: the finite g-action on
polynomial vector fields on the big cell N_+, its Cartan-valued correction,
and the local Lie-algebra cohomology/anomaly computation which lifts that
action to the oscillator vertex algebra; oscillator Weyl/Heisenberg
Lie algebras, Fock modules and vertex algebras, beta-gamma fields and their
normal-order identities/graded characters; Wakimoto homomorphisms at all
levels, critical specialization, Heisenberg/Miura factor, simple-root
screening operators S_i and the containment
wκc(z(Vκc))⊆π0∩⋂_i ker S_i. Prove their restrictions to π0 are
the dual classical screenings as in Frenkel Proposition7.3.6; no equality
between the whole Wakimoto image and quantum-screening kernels is required. Any consumed resolution or
filtration spectral sequence has its actual differential, exactness,
boundedness and convergence proved here using existing cochain vocabulary.
Consume FormalConnectionsOpers F4.3's finite Chevalley restriction
S(g)^g≃S(h)^W, generators P_i of degrees d_i+1, Kostant regular/slice
theorem and codimension of the nonregular locus. Prove the Lie/group-invariant adapter for connected groups, and the
κ0-induced identification S(g)≃S(g*), with the precise Cartan-dual
comparison to the supplier's S(g*)^G theorem. Build the jet-scheme/arc
comparison here rather than inferring it from finite Harish–Chandra theory.
Prove the affine invariant-jet theorem for g[[t]] acting on the PBW-graded
vacuum space. Export the explicit free polynomial algebra
Fun(g*[[t]])^(g[[t]])=ℂ[P_i,n | 1≤i≤ℓ, n≥0], where P_i,n is
the t^n coefficient of P_i(A(t)); prove
P_i(t^N A(t))=t^(w_iN)P_i(A(t)), and provide the polynomial
differential generators and character
∏_(i=1)^ℓ∏_(n≥0)(1−q^(d_i+1+n))⁻¹. Ordinary finite Chevalley invariants
alone do not supply it. Use jet Chevalley restriction for injectivity into the Heisenberg algebra
and its invariant character for freeness/upper bounds. Supply the
lower bound independently via the filtered critical Verma/Wakimoto
comparison of Frenkel §8.1.1. Construct the critical Verma M0, its opposite
Wakimoto realization W0⁺ and prove M0≃W0⁺. For
b̃_+=b_+⊕t g[[t]], prove (W0⁺)^(b̃_+)=π0 and that its graded
invariant character equals the invariant character of gr M0. Prove the
quotient-induced graded map (gr M0)^(b̃_+)→(gr Vκc)^(g[[t]]) is surjective by the
regular-arc invariant calculation on t⁻¹(n_−)*⊕g*[[t]]. Prove
that Vκc^(b̃_+)=Vκc^(g[[t]]) and the analogous equality
for gr Vκc, by local finiteness under the constant g and finite-dimensional
highest-weight theory; thus M0→Vκc sends b̃_+ invariants into the
center. Prove filtration/weight strictness so gr(M0^(b̃_+))=(gr M0)^(b̃_+) and hence
gr z(Vκc)=(gr Vκc)^(g[[t]]). This supplies the lower bound and exact
center character, not just an invariant upper bound. Identify restricted
quantum screenings with dual classical screenings; the injective center
map into their intersection then becomes surjective by equal finite
weight-piece dimensions. Do not deduce surjectivity from two upper bounds.

Construct the vacuum center embedding into the classical W-algebra, prove
its image equals the intersection of all dual screenings and use the oper
supplier's independent Miura/DS/classical-W comparison to obtain the
isomorphism. Prove translation, Aut(O) and vertex Poisson compatibility.
Under flipped pinned root data h_dual=h*, define κ0^∨ by the **inverse
form** of κ0|h, extended invariantly to g∨. It is not independently
long-root-normalized on the dual side. Prove matrix-inversion/root-length
factors, including nonsimply-laced types. Match Heisenberg and screening
brackets for precisely this form.

## A8. Completed center and exact compatibilities

Construct the continuous mode/enveloping functor for general nonnegatively
graded vertex algebras, and its commutative differential vertex-algebra
specialization, with relation T⊗1+1⊗∂_t and normally ordered
relations. Prove coefficient finiteness, bracket and completion claims, and
identify the affine vacuum's completed enveloping algebra with Ûκ. At
critical level prove its central mode image is the entire center and identify
the completed modes of Z(Vκc) with Fun Op_G∨(D×). At every noncritical
κ prove Z(Ûκ)=ℂ, including reducible vacuum levels: a generic open-set or
transcendental-level result is insufficient. Construct the stagewise PBW-symbol comparison following Frenkel
Proposition4.3.4. The full completion can have unbounded PBW degree:
closed bounded-degree pieces have dense union but are not exhaustive.
Write Z=lim_N Z/(Z∩ker π_N). Prove the intersection is an ideal
in the commutative center, so these are center-algebra quotients even
though Q_N itself is only a module quotient. Construct the **adjoint**
g[[t]] action on Q_N by preservation of I_N, and inject each center
quotient into (Q_N)^(g[[t]],ad), whose PBW filtration is exhaustive.
This adjoint action is distinct from Q_N's left Uκ-module action. Prove
gr Q_N=Fun(g*⊗t^(−N)ℂ[[t]]) and inject the invariant symbols into
its adjoint g[[t]]-invariant functions. Multiplication by t^N compares that
invariant ring with the independent A7 disc invariant theorem.

Pin mode indexing: for a state S_i of weight w_i=d_i+1 write
Y(S_i,z)=Σ_(r∈ℤ)S_i[r]z^(−r−1), and write the homogeneous invariant
field P_i(J(z))=Σ_r P̄_i[r]z^(−r−1). Prove P̄_i[r] is
g((t))-invariant, its restriction vanishes for r≥w_iN, and the
remaining r<w_iN generate the pole-bound invariant algebra freely.
Prove S_i[r] has this symbol and is central, so all intermediate
stagewise invariant-symbol maps are isomorphisms and
Z/(Z∩ker π_N)=ℂ[S_i[r] | r<w_iN]. Derive the endpoint directly
from the displayed indexing: a degree-w product of current fields with
current indices <N has largest state index wN−1. Prove lower-degree
normal-order/derivative corrections obey the same cutoff. The strict
cutoff avoids including a zero boundary generator. Show these
weight-dependent cutoffs give the same cofinal topology as a common
mode cutoff. Taking compatible inverse limits proves the entire
completed critical center theorem, including unbounded PBW degree.
This also establishes the punctured invariant theorem level by level;
no global finite-degree symbol induction is assumed.

For every noncritical level prove Sugawara implements the degree
derivation, and define Dκ=−L0,conf so [Dκ,x_n]=n x_n. Use the
extended-affine center theorem of Frenkel §4.3.9
(and the Kac theorem it cites). Explicitly build ĝκ′=ℂd⋉ĝκ with
[d,x_n]=n x_n; its level quotient and the same left-ideal completion;
choose the sign so d−Dκ is central. Prove the original completion embeds
in this extended completion and preserves its center. Let D′=d−Dκ; prove the full extended
completion is the restricted-series algebra Ûκ⟨D′⟩: sums
Σ_j z_j(D′)^j with z_j→0 in the original completion. Prove its
center has exactly such restricted series with all z_j central. Do not
assert polynomial dependence before proving the noncritical center theorem. Use A4's fixed-extension quotient comparison, including k=0,
before constructing the extended Cartan
h̃=h⊕ℂK_standard⊕ℂd and its hyperplane K_standard=k, untwisted affine roots, Weyl
reflections/translations and the ρ-shifted action (finite root/Weyl input
is consumed). Build the topological Harish–Chandra map and prove the
noncritical extended-center theorem identifying its image with polynomial
affine-Weyl invariants on that hyperplane. Construct the Harish–Chandra map on this actual restricted-series
completion and **prove its injectivity on the center**: if a central
element acts by zero on every level-k extended Verma module M(λ,δ),
then it is zero in Ûκ′. Build the smooth extended Verma modules,
the contravariant anti-involution/Shapovalov form and its finite-height
PBW matrices, the real/imaginary affine-root determinant factors and
generic nondegeneracy at k+h∨≠0 as proof prerequisites here. Use
central commutation and these forms to detect every nonzero finite
quotient coordinate of a central element on some Verma module; prove
the necessary stabilization under the high-current cutoff so this
faithfulness applies to unrestricted completed elements. Kac's
injectivity for a different completion does not transfer automatically;
prove this comparison or the completion-specific detection argument.

Prove polynomiality of the HC image by the N=1 cutoff: in a restricted
series Σ_j z_j(D′)^j all sufficiently large z_j lie in ker π_1 and
kill every highest-weight vector. The finitely many remaining
coordinates have polynomial Cartan action, and D′ has the displayed
Q_k/(2(k+h∨)) eigenvalue. Construct the Weyl-invariance/surjectivity
argument for these polynomials, together with the above faithful
detection, before identifying the extended center.
Prove those invariants are
freely generated by the quadratic form and identify its inverse image
with 2(k+h∨)(d−Dκ): for Cartan coordinates (λ,δ) pin
Q_k(λ,δ)=κ0⁻¹(λ+ρ,λ+ρ)−κ0⁻¹(ρ,ρ)+2(k+h∨)δ.
Prove HC(d−Dκ)=Q_k/(2(k+h∨)), and fix the affine shift so
these formulas and the reflection/translation invariance agree. Thus the extended center is ℂ[D′]. Prove that
Ûκ∩ℂ[D′]=ℂ inside the restricted-series algebra and conclude
Z(Ûκ)=ℂ. Only after this conclusion may its restricted central
series be identified with polynomials in D′. This extended derivation is
an explicit auxiliary proof construction, not an unmentioned change to
ĝκ. Vacuum-center triviality alone is not the completed theorem.

The oper supplier defines Fun Op(D) as the polynomial algebra of nonnegative
DS coefficients, and Fun Op(D×) as the inverse limit of polynomial
coordinate algebras at closed pole-bound stages with restriction maps and
inverse-limit topology. These are regular functions of oper functors, not
all functions of their point sets. Identify exact central modes, relations
and topology with these coefficients. Distinguish vacuum/disc from completed/
punctured centers. Evaluation at a Laurent oper factors through its pole-bound
stage and is a continuous algebra character.

The final isomorphism and its inverse are continuous, Aut(O)-equivariant and
Poisson for affine κc+ℏκ0 and dual DS κ0^∨. Use A2's pinned algebra-automorphism group Aut(O); σ↦φ_σ identifies
it with invertible-linear-coefficient series with reversed composition.
Arbitrary field automorphisms of F are not coordinates. Prove intertwining on generators and completed
coefficients, and the exact residue Kirillov–Kostant/DS normalization adapter,
not compatibility 'up to scalar'. Pin canonical Lie–Poisson
{H_x,H_y}=H_[x,y]+cκ0∨(x,y) for H_x(A)=+Resκ0∨(A,x)dt. Its anchor
is δA=[A,x]+x′, the negative of the source gauge tangent [x,A]−x′;
thus the cotangent-to-source-gauge identification sends dH_x to −x.
Prove this sign adapter agrees with the displayed rank-one KdV operator. Prove the original G((t)) affine action
fixes the critical center pointwise, hence each oper-central-character
smooth-module full subcategory is G((t))-stable. This is the specialized
A5 central-character stability theorem for the completed a_g maps; include
its morphism/carrier formulas and the corresponding closed-central-ideal
quotient-category identification. The coordinate lift generally permutes
characters: on the oper point p use σ·p with q^φ as below, on functions
use σ·f=f∘σ⁻¹, and prove eval_(σp)=eval_p∘a_σ⁻¹ through
Feigin–Frenkel. Thus module pullback along a_σ⁻¹ carries fibre p to
fibre σp. As a normalization test φ(t)=at sends S_n to a^n S_n
but sends the oper coefficient L_n to a^(−n)L_n. Dual G∨((t)) gauge arrows
between opers are different and do not follow from this action.

For the typed rank-one consumer export a selected
`RankOne.feiginFrenkel` with its fixed generator laws. Its continuous
inverse and forward maps use A4's center subspace topology and F5's explicit
inverse-limit function topology. Define S_n by the convergent normally ordered
sum `½Σ_m(:e_m f_(n−m):+:f_m e_(n−m):)+¼Σ_m:h_m h_(n−m):`, where
κ0(h,h)=2, and prove stabilization in every quotient Q_N. Require
`feiginFrenkel(S_n)=q_(-n−2)=Res(t^(n+1)q dt)` for every n and prove
uniqueness among continuous algebra equivalences with these generator laws.
Export the original-loop Hopf/matrix dictionary relating F3's points of `TauCeti.SpecialLinear.coordinateHopfAlgebra ℂ 2` in
ℂ((t)) with native `Matrix.SpecialLinearGroup (Fin 2) (LaurentSeries ℂ)`.
Use native `SpecialLinear.pointsMulEquiv`, comparing the coefficient-algebra
scalar-tower instances. Pin each matrix entry as evaluation of the point on
the image of `GeneralLinear.genericMatrix` under the native special-linear
coordinate quotient map. GRC R3 consumes this dictionary; F3 remains an
upstream supplier. Prove forward/inverse naturality and compatibility
with F3's coefficient inclusion and jet kernels; the dictionary is not an
arbitrary group equivalence.

Export the actual original SL₂ loop automorphism homomorphism: on a current A
it is `Ad_g A−2 Res tr(g⁻¹g' A)` after K=1, with the scalar term added to
the enveloping generator. Pin its matrix/formal-current comparison,
continuity/inverse, and pointwise fixation of the center. GRC consumes this
selected isomorphism and action, whose functors are restriction through the
inverse automorphism. The existing A8 coordinate/Poisson comparison applies
to this normalized export.

Acceptance examples: polynomial/formal sl₂ cocycle, κc=−2κ0, finite-cutoff
action of an infinite positive current, a non-two-sided I_N, the source
high-order series and the rank-one Segal–Sugawara/projective-connection
normalization. If κ0(h,h)=2 and S(z)=Σ_n S_n z^(−n−2), prove

    {S_m,S_n}=(m−n)S_(m+n)−½(m³−m)δ_(m+n,0).

For the canonical dual DS matrix A=[[0,q],[1,0]], L=∂²−q, prove
S_n↦Res(t^(n+1)q dt), q^φ=(φ')²q(φ)−½{φ,t}, where
{φ,t}=φ'''/φ'−3/2(φ''/φ')², and check the bracket through the KdV
anchor δq=2qε'+q'ε−½ε'''. Include an sl₃ weight-three generator with PBW symbol tr(X³), whose
critical modes have associated-graded image **−tr(X³)** under the
canonical invariant-algebra identification. Pin the Heisenberg/Miura
map b_i↦−u_i; prove the full Feigin–Frenkel associated-graded map is
(−1)^PBWdegree. The cubic test concerns the PBW symbol: S_3 is
allowed to change by a multiple of T(S_2), and the DS cubic coordinate
by the matching derivative of the quadratic one. Fix representatives
by the supplier's pinned DS/Miura chart and prove this compatibility. Define κ0,dual as the invariant form on g∨ whose inverse Cartan form
on (h∨)*=h gives long dual roots squared length2. For a
nonsimply-laced example prove κ0,dual=r∨κ0^∨
(r∨=2 for B/C/F₄ and 3 for G₂), so dual long roots have squared length 2r∨ under the inverse form
induced by κ0^∨. Verify this in B₂/C₂ by the coroot vectors
e₁±e₂ and 2e_i (squared lengths2 and4), and verify the corresponding Heisenberg
mode bracket nκ0(h_i,h_j)δ_(n+m,0) and transposed-Cartan screening factors. These constrain all-simple-g results;
they do not replace them.

## Order, boundaries and references

A1→A2→A3→A4→A5 constructs completion/category comparison independently
of centers. A5→A6→A7→A8 supplies center proofs. C7 is a separate branch from
finite positive even lattices, consuming the A6 field/coefficient interface and
IntegralLattices, RootSystems and SignedADE; it does not feed A1–A8, ReductiveGroups §9A
Jacobi, or folding. Independent formal loop/DS suppliers feed A2/A3/A7/A8 and
do not consume Feigin–Frenkel. Every listed
Whitehead, free-field, invariant-jet and completion prerequisite is a target.
Formal oper/gauge-groupoid theory retains its supplier owner.
[GeometricRepresentationCategories](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/geometric-representation-categories-20261018/TauCetiRoadmap/GeometricRepresentationCategories/README.md)
is a consumer of A3/A5/A8, owning coherent action/fibres and descent; it is
not a foundation dependency of affine completion or centers. Compatible equivalences along dual gauge arrows remain the
separately owned precise **conjecture statement**, not an unconditional
categorical-lift or global Langlands theorem requested here.

- [Bakalov–Kac, *Twisted Modules over Lattice Vertex Algebras*](https://arxiv.org/html/math/0402315),
  §2.2 Definition 2.1, equation (2.14), for operator translation covariance as
  an axiom, and equation (2.17) for the state-derivative identity as its
  consequence; §4.1 Theorem 4.1 for the lattice generators and equation (4.15)
  for the translation identities `[T,h(m)]=−m h(m−1)` and `Te^α=α(−1)e^α`. C7 retains its positive even-lattice restriction;
  it does not introduce the odd-lattice super case.
- [Kac, *Introduction to vertex algebras, Poisson vertex algebras, and integrable Hamiltonian PDE*](https://arxiv.org/abs/1512.00821),
  §1.1 Theorem 1.1 (extension theorem), whose hypothesis (ii) is translation
  covariance of the generating fields: prove generator covariance before
  applying reconstruction. The lattice coefficient and finite-tail contracts
  above specify the construction required here.
- [Frenkel, *Langlands Correspondence for Loop Groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  §1.3 continuous cohomology/integration, §2.1 and §3.2 left-ideal completion,
  Chapters6–8 free fields/screenings/center, §8.1.4 and §8.3 inverse dual form
  and deformation/Poisson normalization.
- [Frenkel, *Wakimoto modules, opers and the center at the critical level*](https://arxiv.org/abs/math/0210029),
  free-field cohomology, opposite Wakimoto comparison and completed-center proofs.
- [Kac, *Laplace operators of infinite-dimensional Lie algebras and theta functions*](https://pmc.ncbi.nlm.nih.gov/articles/PMC344739/),
  Corollary1 as used by Frenkel §4.3.9, with the stated completion/polynomial
  comparison required here.
- [Frenkel's Langlands/conformal-field lectures](https://math.berkeley.edu/~frenkel/houches.pdf)
  for critical centers and classical DS reduction.
- [Virasoro/central-extension discussion](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Virasoro.20algebra.20.28and.20cohomology.20of.20the.20Witt.20algebra.29/near/491524778)
  and [VirasoroProject](https://github.com/kkytola/VirasoroProject/): design/port
  evidence, not an implemented affine-center supplier.
