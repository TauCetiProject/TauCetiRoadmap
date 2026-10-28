# Quantum groups: compact reconstruction and generic ribbon representations

Build compact quantum groups from their C*-algebras and from their unitary
representation categories. Develop Haar integration, arbitrary-Hilbert-space
corepresentations, the dense Hopf *-algebra, weighted Peter–Weyl theory and
universal/reduced completions before reconstruction. Work out the deformation
SUq(2) and free orthogonal quantum groups, including their tensor categories,
dimensions, Haar laws and the full/reduced distinction.
Develop the generic quantized enveloping algebra U_q(sl₂), its signed
simple modules, complete reducibility, locally finite and type-1 module
categories, and their precise comparison with the compact SUq(2) example.
Construct the ribbon category of finite-dimensional type-1 representations of
a generic finite-type Drinfeld–Jimbo quantum group, including its braiding,
standard twist, pivotal traces and quantum dimensions.

## Scope, conventions and suppliers

Q1–Q8 use complex algebras and Hilbert spaces; Q9 uses the formal
coefficient fields specified there. Compact quantum groups have a nonzero
unital C*-algebra A and a unital star homomorphism
`Δ:A→A⊗_min A`. Neither A nor the representation Hilbert space is assumed
separable. Finite-dimensional coefficient matrices use orthonormal bases and
column vectors: `δ(e_j)=Σ_i e_i⊗u_ij` and
`Δ(u_ij)=Σ_k u_ik⊗u_kj`. Matrix star is conjugate transpose;
`bar u=(u_ij*)` is entrywise star, and is a different operation.
Pin tensor corepresentations to `U_13 V_23`, with entries
`(u⊠v)_((i,k),(j,l))=u_ij v_kl`, as in Tau Ceti's native
`Comodule.TensorProduct`; thus `χ_(u⊠v)=χ_u χ_v`.
Algebraic tensors use Mathlib `TensorProduct` over ℂ; analytic tensors use the
minimal C*-tensor product. Insert associators and unit identifications in leg
notation. Scalar products are conjugate-linear in the first variable.

A morphism `(A,Δ_A)→(B,Δ_B)` is a unital star homomorphism f with
`Δ_B f=(f⊗f)Δ_A`. This is the direction of the function-algebra map; the
corresponding compact-group arrow has the reverse direction. Fiber functors
are faithful complex-linear dagger strong monoidal functors to finite Hilbert
spaces, with unitary tensor and unit constraints. Quantum dimension means the
intrinsic C*-tensor-category dimension, and Hilbert dimension means the rank of
the underlying vector space. These can differ.

| Supplier | Interface consumed here |
| --- | --- |
| [CStarAlgebras C1–C5,C8](../CStarAlgebras/README.md) | C2 state extension, matrix norms, minimal tensors, nondegenerate multiplier-map extension, slice maps and CP positivity; C8's Toeplitz extension for Q7. Q5 owns the bounded universal presentations used here. |
| [VonNeumannAlgebras V0–V4](../VonNeumannAlgebras/README.md) | State-space weak-* compactness, Hilbert GNS representations, V1 finite bicommutants, operator closures and preduals; V10–V11 full left Hilbert algebra/Tomita comparison for the Haar modular group. |
| [HilbertModules H1–H3](../HilbertModules/README.md) | Free modules H⊗A, adjointable/compact operators, multiplier realization and interior tensor identifications. |
| [CategoricalOperatorAlgebras CA1a,CA2a](../CategoricalOperatorAlgebras/README.md) | Finite Hilbert dagger category, unitary rigid tensor categories, chosen conjugates, signed self-duality, standard solutions and intrinsic dimension. Reconstruction here supplies the quantum-group realization. |
| [TemperleyLiebOperatorAlgebras A1–A6](../TemperleyLiebOperatorAlgebras/README.md) | Hermitian TL forms, positive C*-quotients, finite C*-norms and the unitary TL category, native diagram trace comparison. TemperleyLieb Layers 0–7 ([PR #58](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58)) supplies the algebraic diagram/Jones–Wenzl targets for Q7. |
| [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) | Classical Peter–Weyl, compact Haar integration and the SU(2) representation calculation used for comparisons. |
| [RepresentationTheory/LieHighestWeight, sl₂ worked example](../RepresentationTheory/LieHighestWeight/README.md) | The classical highest-weight m module and native `sl (Fin 2) ℂ`/`IsSl2Triple` action conventions for Q8.7's matrix specialization. |
| [OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md) | Full/reduced discrete-group C*-algebras, canonical quotient/expectation and the invariant-mean/Reiter P₁/P₂ comparison. |
| [FreeProbability F1,F3,F6](../FreeProbability/README.md) | Scalar moments, the free-group adjacency norm/full–reduced counterexample and the standard semicircular law; Q7 supplies the quantum-group character realization. |
| [AmenableGroups, Layers 1,7 (PR #821)](https://github.com/TauCetiProject/TauCetiRoadmap/pull/821) | Invariant means, Følner criteria and group amenability; Q4 constructs the reduced-counit comparison using D2's Reiter comparison. Adopt its interfaces and build missing prerequisites without waiting for a merge. |
| [PivotalSpherical Layers 0–2 and 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c84f711be9c5c10b3b88104b000519df920f6acf/TauCetiRoadmap/PivotalSpherical/README.md) | Algebraic double-right-dual, pivotal, trace and spherical conventions consumed by Q3 and Q8.5, compared with CA2a’s unitary duality. Layer7’s FDRep is the group-algebra comparison target for Q8.5. |

Use native `Coalgebra`, `Bialgebra`, `HopfAlgebra`, `Coalgebra.counit` and
`HopfAlgebra.antipode`. Tau Ceti's `Algebra.Coalgebra.Comodule` already provides
comodules, comodule homomorphisms, categories, corestriction, duals and finite
matrix coefficients. Consume its `Subcomodule`, `IsCompletelyReducible`,
`fixedSubcomodule`, `Finite/Monoidal`, `Finite/RightRigid` and
`Comodule.convolutionAction` interfaces for subobjects, duality and convolution.
`Finite/RightRigid` supplies antipode-twisted right duals for arbitrary
Hopf algebras. `Finite/Rigid` uses commutativity and supplies both duals
for the classical function-algebra case. For noncommutative Pol(G),
construct left duals using its bijective antipode and S⁻¹, and compare
them with CA2a's chosen conjugates and pivotal structure.
Use Mathlib `WithConv` for convolution notation.
In particular consume `coefficientMatrix`, its counit,
comultiplication and inverse-antipode equations, and `matrixComodule` with its
coefficient reconstruction. Add Hilbert/star/unitary structure to these APIs;
do not replace the algebraic coaction with a private matrix-corepresentation
carrier. The analytic free-module coaction is compared with that algebraic API
on the coefficient core.

Q1–Q7 concern compact symmetry. Q8 is the algebraic generic-rank-one lane,
with no C*-completion or Hilbert-space assumption in its classification.
General locally compact quantum
groups, unbounded Haar weights on those groups and general multiplicative-unitary
reconstruction are outside its scope. Q4 constructs the particular regular
multiplicative unitary needed for compact reduced completion. Quantum-group
actions on general C*-algebras and their crossed products are not targets here.

## Q1. C*-bialgebras, cancellation and Haar integration

Construct coassociative unital C*-bialgebras and their morphisms using the
native star homomorphisms and the C5 minimal tensor functor. Develop tensor
leg maps, their associativity/naturality, positive slice maps and compatibility
with Δ. A compact quantum group satisfies both cancellation conditions:

- The linear span of `Δ(A)(1⊗A)` is norm dense in A⊗_min A.
- The linear span of `Δ(A)(A⊗1)` is norm dense in A⊗_min A.

Develop equivalent cancellation-span formulations and transport by isomorphism,
opposite/co-opposite structures and tensor products. Cancellation is a density
condition on linear spans, not a pointwise surjectivity assertion. Give a
coassociative unital bialgebra failing cancellation, functions on
a finite monoid with an absorbing element that is not a group.

Define convolution of bounded functionals by `φ*ψ=(φ⊗ψ)Δ`. Prove boundedness,
associativity, positivity, preservation of states and separate weak-*
continuity. Define left invariance by `(id⊗h)Δ(a)=h(a)1` and right
invariance by `(h⊗id)Δ(a)=h(a)1`. Prove existence of a state h satisfying
both and uniqueness among even one-sided invariant states, without a
separability assumption. Build the proof's reusable pieces: Cesàro means of
convolution powers of a state, weak-* cluster points fixed by that state, and
the domination lemma saying `ω≤ρ` and `h*ρ=ρ*h=h` imply
`h*ω=ω*h=ω(1)h`. Prove the finite-intersection argument for all positive
functionals using both cancellation conditions. Supply the slice testing and
positive-functional separation that turn these equations into invariance.

Call h the Haar state. Construct its GNS Hilbert space, representation,
coefficient maps and null ideal. A compact quantum group is reduced when its
Haar state is faithful. Prove the tensor-product Haar formula and the
isomorphism transport law; do not assert Haar pullback along every morphism.
For C(G) recover ordinary compact-group Haar integration. Pin the
coefficient crosswalk to CompactGroups: its π_ij(g)=⟪π(g)e_j,e_i⟫
is conjugate to u_ij(g)=⟪e_i,π(g)e_j⟫ in this roadmap.
Transport coproduct, star and the defining SU(2) representation with
this conjugation explicitly. For a discrete
group Γ construct `Δ(u_g)=u_g⊗u_g` on its full group C*-algebra by
the universal unitary-representation property. On the reduced algebra
construct the Fell-absorption unitary
`W(δ_g⊗δ_h)=δ_g⊗δ_(gh)` and prove
`W(λ_s⊗1)W*=λ_s⊗λ_s`; this supplies the reduced-norm extension
of Δ. Prove coassociativity and both cancellation conditions using
the dense span of group unitaries. Identify both Haar states with
coefficient at the identity. Q4 proves the concrete nonfaithful full-group-algebra example
after the reduced-counit comparison has been established.

## Q2. Unitary corepresentations and Peter–Weyl theory

For arbitrary Hilbert H define a unitary corepresentation as a coaction
`δ:H→H⊗A` on the free right Hilbert A-module satisfying
`⟨δξ,δη⟩=⟨ξ,η⟩1`, `[δ(H)A]=H⊗A`, and coassociativity.
Construct the equivalent unitary operator `U∈L_A(H⊗A)` with
`δξ=U(ξ⊗1)` and `(id⊗Δ)U=U_12 U_13`. Build the multiplier and
leg extensions on `H⊗A⊗A` needed to state this equation even when H is
infinite-dimensional. A general corepresentation operator is *invertible*
and satisfies the same equation; arbitrary noninvertible solutions are not
included in its unitarization theorem.
Construct the strictly continuous extension of positive slice maps from
`K(H)⊗_min A` to `M(K(H)⊗_min A)=L_A(H⊗A)` and its tensor-leg
and order laws; these are the slice maps used by Haar averaging below.

Intertwiners are bounded linear T with `(T⊗1)U=V(T⊗1)`.
Develop identities, composition, dagger for unitary objects, norm-closed
intertwiner spaces, invariant closed subspaces and projections, kernels,
closures of ranges, polar intertwiners and orthogonal complements. Construct
finite sums, arbitrary Hilbert sums, tensor products and their associators;
prove unitary change-of-basis formulas. For finite Hilbert H express analytic unitarity by its
coefficient matrix in an orthonormal basis, and prove independence of
that basis by unitary conjugation. Construct the coefficient-matrix description and the
finite Hilbert forgetful functor, proving it faithful, complex-linear and
dagger strong monoidal. Q3 compares it with native comodules after the
Hopf core has been constructed.

Prove every invertible corepresentation operator similar to a unitary one by
Haar averaging `T=(id⊗h)(U*U)` and its positive invertibility; derive the
identity `U*(T⊗1)U=T⊗1` and unitarize by
`(T^(1/2)⊗1)U(T^(-1/2)⊗1)`. Prove every nonzero
unitary corepresentation has a nonzero finite-dimensional invariant subspace.
Construct Haar averages of compact-operator compressions, their invariant
compact C*-algebra and a nonzero finite-rank spectral projection. Deduce
irreducibles finite-dimensional and, using a maximal orthogonal family,
every unitary corepresentation an arbitrary Hilbert direct sum of finite
irreducibles. State and prove Schur's lemma, uniqueness of multiplicities
and the unitary comparison of decompositions. No countable-sum restriction
is introduced.

Construct the regular corepresentation by
`δ_h(Λ_h(a))=(Λ_h⊗id)Δ(a)`, proving its isometry by right Haar
invariance and its dense module range by cancellation. Prove the
closed linear span of its slices is A and every finite irreducible occurs
in it. Give explicit coefficient projections and finite coefficient
approximants. This is density of the span of coefficients; it does not say
every element of A is one coefficient of one finite irreducible.

## Q3. The Hopf *-core, orthogonality and modular data

For each finite irreducible unitary u construct the conjugate matrix
bar u and prove its algebraic coaction irreducible by conjugating
invariant subspaces. For each row i construct the coefficient intertwiner
`e_j↦Λ_h(u_ij*)` into the regular corepresentation. It is nonzero
because `Σ_j h(u_ij u_ij*)=1`; invariance of its kernel and
irreducibility make it injective. Its finite-dimensional invariant image
gives the unitary regular restriction, and thereby invertibility of
bar u. Using Haar invariance and Schur's lemma,
construct the positive invertible unitarizing matrix F̃, normalized by
`Tr F̃=Tr F̃⁻¹`, with `bar u* F̃ bar u=F̃`. Prove this determines
F̃ uniquely. This construction precedes the antipode. Derive both
orthogonality formulas directly from these finite Haar forms:

`h(u_ij* u_kl)=δ_jl (F̃⁻¹)_ik/Tr(F̃⁻¹)`,

`h(u_ij u_kl*)=δ_ik F̃_jl/Tr(F̃)`.

Coefficients of inequivalent irreducibles are orthogonal in both forms.
Prove coefficient linear independence and the algebraic Peter–Weyl direct
sum. Now let Pol(G) be their linear span; prove it a dense unital
*-subalgebra, with Δ in its algebraic tensor square. Construct the native
coalgebra/bialgebra/Hopf structure with `ε(u_ij)=δ_ij` and
`S(u_ij)=u_ji*`, using the just-proved independence for well-definedness.
A Hopf *-algebra means a native complex Hopf algebra with compatible
star algebra structure and star-preserving Δ. Prove ε star-preserving,
S bijective and `S⁻¹(a)=S(a*)*` from these axioms; consume Mathlib's
`HopfAlgebra.antipode_mul_antidistrib` for `S(ab)=S(b)S(a)`.
Prove products, sums and basis-change compatibility, morphisms preserving
cores and the unitary finite-comodule comparison with Q2. The native
algebraic dual has coefficient matrix bar u in the dual basis; construct
its Hilbert structure using F̃.
Only now construct `F∈Hom(u,S²u)`, normalized positive with
`Tr F=Tr F⁻¹`, and prove `F̃=Fᵗ` as a theorem.
Complete the weighted coefficient spaces in L²(h), with norm squared
`Σ_(α,i,j,k) conjugate(c_ij^α)(F̃_α⁻¹)_ik c_kj^α/Tr(F̃_α⁻¹)`
for a coefficient sum Σ c_ij^α u_ij^α. Identify the regular
representation multiplicities and this Plancherel formula.
Build algebraic convolution with functionals, pinning
`φ*a=(id⊗φ)Δ(a)` and `a*φ=(φ⊗id)Δ(a)`, and construct Woronowicz
characters `f_z(u_ij)=(F^z)_ij`, with complex powers of the positive F.
First prove these are well-defined linear functionals, basis independent,
with `f_0=ε`, `f_z*f_w=f_(z+w)`, `f_z∘S=f_(-z)` and
`f_z(a*)=conjugate(f_(-conjugate z)(a))`, without assuming
multiplicativity. From the preceding coefficient orthogonality derive
`h(ab)=h(bθ(a))` for θ(a)=f_1*a*f_1; on a coefficient matrix
θ(u)=FuF. Derive the identity on a in the irreducible coefficient
basis and b in the starred-coefficient basis, then extend bilinearly.
Use the identity three times to prove
`h(cθ(ab))=h(cθ(a)θ(b))` for every c, and use Plancherel
faithfulness to deduce θ(ab)=θ(a)θ(b), with θ(1)=1.
Then ε∘θ=f_2 is a character. Convolution and antipode give
multiplicativity of f_(2m) for all integral m. Own the finite
Vandermonde step: for fixed a,b, the defect
f_z(ab)−f_z(a)f_z(b) is a finite sum Σ_j c_j λ_j^z
with distinct positive λ_j. Its values at z=2m, m≥0, vanish;
the first finitely many equations have invertible Vandermonde matrix
on the distinct λ_j², so every c_j=0. Thus all f_z are
multiplicative before they are used in a pivotal monoidality argument.
For every finite unitary corepresentation w, define F_w by
`(F_w)_ij=f_1(w_ij)`. Prove it is positive invertible, agrees with the
normalized F on irreducibles, and is block diagonal on direct sums. This
defines F on reducible objects independently of the trace normalization.
Derive F_(u⊠v)=F_u⊗F_v from the character law.

Construct duals and fusion multiplicities with their finite decomposition
and Frobenius reciprocity laws. On the native finite-comodule monoidal
category construct left duals via the inverse of the explicitly supplied
`Function.Bijective (HopfAlgebra.antipode)` and their evaluation/coevaluation
triangle identities. Package the resulting `RigidCategory` as a named
definition, installed locally in every statement using its left duals,
pivot, pivotal traces or dimensions. In the commutative case consume native
`TauCeti.HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv`
for S⁻¹=S, identify the pairings with native Finite/Rigid’s existing
global instance, and use that native instance in the classical cases. For Pol(G), pin the pivotal comodule map
`j_V(v)=can_V((id⊗f_1)δ(v))` into V**, where can_V is the ordinary
double-dual identification. Its matrix is F; prove colinearity using
S²u=FuF⁻¹ and monoidal naturality using the character law for f_1.
Identify the right and left pivotal traces with tr(Ff) and tr(F⁻¹f),
respectively. Use CA2a’s balanced unitary dual functor with the stated
algebraic evaluation/coevaluation. Compare its dagger-dual equations
with these evaluations/coevaluations; their squared norms are both
Tr F=Tr F⁻¹. Transport its Hilbert metrics and prove j is unitary,
`j†j=id` and `jj†=id`; evaluations and coevaluations are not
asserted unitary maps. In orthonormal coefficient bases the metric is
F̃ on the native right dual, F̃⁻¹ on the S⁻¹ left dual and F⁻²
on the double dual. Compare this pivotal structure with CA2a's balanced
conjugates and standard solutions. Prove the intrinsic dimension
`d(u)=Tr F=Tr F⁻¹`, its additivity/multiplicativity, `d(u)≥dim_H(u)`
and equality precisely when the normalized F is the identity. Prove the
corresponding Kac equivalences: Haar traciality, S²=id on Pol(G), and
all these F matrices equal to one. In that case recover ordinary
dimension-normalized orthogonality and an involutive antipode on
the Hopf core. Q4 constructs its bounded extensions to A_u
and A_r.

Derive `S²(a)=f_(-1)*a*f_1` and
compare the already proved modular identity with this S² formula,
using the same explicitly defined convolution actions.
Construct `σ_t(a)=f_(it)*a*f_(it)` and
`τ_t(a)=f_(-it)*a*f_(it)`, their group laws and norm-continuous
actions on the core. Prove `S²=τ_(-i)` and the KMS crosswalk
`h(ab)=h(b σ_(-i)(a))` for analytic core elements.
Prove the core is a dense Tomita algebra in Haar GNS, construct its
commuting right action, and prove the GNS vector separating for the
left von Neumann closure. Thus the vector Haar state is faithful normal
there. Identify the full closure of this concrete Tomita algebra with
V11's full left Hilbert algebra, including its left representation,
closable involution and polar operators. Consume V11's Tomita theorem
and canonical-weight comparison, and prove its recovered weight is this
Haar vector state. First implement σ_t by the Haar-preserving unitaries
U_tΛ(a)=Λ(σ_t(a)) and obtain normal automorphisms of the von Neumann
closure. Prove the KMS identity on the analytic core, extend it by
density, and use V10/V11's KMS uniqueness to identify this group with
Δ_h^(it)(·)Δ_h^(−it).
Derive its action from the KMS boundary equation rather
than treating all f_z as bounded states on a completion.

## Q4. Algebraic compact type and the two completions

Develop Hopf *-algebras of compact type over ℂ on the native Hopf API.
Prove the equivalence between a normalized positive Haar integral, all
finite comodules unitarizable, spanning by finite unitary coefficients,
and a basis of coefficients of pairwise inequivalent unitary irreducibles.
An algebraic finite unitary comodule is a native finite-dimensional
comodule with a Hilbert inner product whose coefficient matrix in an
orthonormal basis is unitary; prove independence of that basis.
In the positive-integral direction first prove algebraic faithfulness of
a nonzero invariant integral on the Hopf *-algebra: neither h(a·) nor
h(·a) vanishes identically for nonzero a. Under positivity use
Cauchy–Schwarz to deduce `h(a*a)>0`. For an initial finite Hilbert product
use the averaged form `⟨v,w⟩_h=h(⟨δv,δw⟩_A)`.
The counit makes δ injective, so its orthonormal coefficient expansion
gives a sum `Σ_i h(a_i*a_i)>0` for v≠0. Prove Haar invariance of
this form and algebraic unitarization; no C*-order lower bound
is assumed before completion. Develop Q3's conjugate/orthogonality API
algebraically. In the coefficient direction first prove independence of
simple coefficient coalgebras and the spanning-to-direct-sum decomposition.
Then define the invariant functional which is one on the trivial
coefficient and zero on the other irreducible blocks, and prove that
the conjugate of each finite unitary comodule is equivalent to a member
of the unitary family. Construct positive F̃ from that unitary comparison,
then derive orthogonality from invariance/Schur theory algebraically;
these steps do not assume an analytic positive Haar state. Use these matrices
and the displayed orthogonality forms to prove `h(a*a)>0` for a≠0.
This positivity is a theorem needed for completion and reconstruction;
coefficient spanning alone is not defined to mean existence of a positive
state. Prove the algebraic cancellation maps and their antipode inverses.

Construct the universal C*-norm as the supremum over star representations.
Prove finiteness on every coefficient sum using unitary entries, and
nondegeneracy using the faithful algebraic Haar GNS representation.
Construct A_u and its universal extension property, extended Δ and ε,
and prove both cancellation conditions. For Kac cores construct the bounded involutive antipode on A_u.
Construct A_r by the Haar GNS
representation, prove the core embeds faithfully and h_r is faithful,
and extend Δ with its cancellation conditions, and in the Kac case
extend its bounded involutive antipode. Compare the GNS
regular corepresentation with Q2's regular object on the original
completion. Build the regular unitary
on `L²(h)⊗L²(h)` from

`U(Λ(a)⊗Λ(b))=(Λ⊗Λ)(Δ(a)(1⊗b))`.

Prove this formula preserves inner products by right Haar invariance,
is onto by algebraic cancellation, satisfies the pentagon
`U_12 U_13 U_23=U_23 U_12`, and implements
`Δ_r(λ(a))=U(λ(a)⊗1)U*`. Prove the resulting tensor-norm estimates
and extension to A_r. These are statements for this regular construction.

Construct the canonical quotient A_u→A_r and, for every C*-completion
of this compact-type core with its quantum-group structure, the compatible
maps from the universal completion and to the reduced completion. Compare
all their finite unitary representation categories and dense cores.
A_u has bounded counit; A_r need not. The algebraic antipode need not
be bounded even on A_u. Prove extension/transport with the stated norm
bounds `‖f(a)‖_target≤C‖a‖_source` on the core, including
the contractive star-map case; an arbitrary Hopf *-map need not extend
between reduced norms.

Define coamenability as the universal-to-reduced quotient being an
isomorphism. Prove its isomorphism invariance and the equivalences with
a bounded reduced counit, existence of a nonzero character on A_r,
and faithfulness of the universal Haar state. For an intermediate
completion A the corresponding criterion is faithfulness of h_A
together with boundedness of ε_A, not faithfulness alone.
Build the proof's slice-invariant Haar null ideal and the counit
testing identity: a bounded reduced counit forces this ideal in A_u
to vanish. Construct Haar-preserving translation maps from a reduced
character, their inverse on each coefficient block, and their unitary
GNS implementation; use their reduced-norm extensions to recover the
counit. Compare all canonical completion maps.
For group algebras prove coamenability equivalent to
amenability of Γ, including the reduced-counit criterion and the
nonamenable free-group counterexample. Identify `A_u(ℂΓ)=C*(Γ)` and
`A_r(ℂΓ)=C*_r(Γ)` compatibly with Q1's coproducts and canonical
quotient. Consume F3's Cayley-tree norm
calculation `‖λ(s)+λ(s)⁻¹+λ(t)+λ(t)⁻¹‖=2sqrt(3)<4`. The full counit
takes this sum to four, so it cannot extend to the reduced algebra.
Consume F3's noninjectivity theorem under those identifications and
deduce nonamenability and the nonfaithful full Haar state. Build the reduced-counit/amenability
comparison via positive regular coefficients, almost invariant ℓ²
vectors, D2's Reiter P₂ equivalence and the invariant-mean/Følner
interfaces of AmenableGroups. Do not confuse this compact-side
terminology with Haar traciality or with amenability of a compact group.
For classical compact groups identify Pol(G), A_r=C(G), and the
ordinary reduced counit and inversion using Haar's full support. Q6
recovers the group from any commutative compact quantum group. Apply
the bounded-reduced-counit criterion here to prove A_u=A_r=C(G).
Reconstruction below determines the Hopf
*-core; Q4 specifies its chosen completions separately.

## Q5. Compact matrix presentations

A compact matrix quantum group has a finite unitary matrix u whose entries
generate A as a C*-algebra and whose entrywise conjugate matrix is invertible and `Δ(u_ij)=Σ_k u_ik⊗u_kj`.
Prove the coefficient criterion: a unital coassociative C*-bialgebra whose
finite unitary coefficients with invertible conjugates span a dense
subalgebra satisfies both cancellation conditions. Develop bounded
universal presentations, core generation and their matrix-coordinate
universal properties before using them in Q6.

For real q with `0<|q|≤1`, construct SUq(2), generated by a,c and

`u=[[a,−q c*],[c,a*]]`,

with u unitary. Equivalently impose `a*a+c*c=1`, `aa*+q²c*c=1`,
`c*c=cc*`, `ac=q ca` and `ac*=q c*a`. Prove equivalence of these
presentations, existence and nonzero representations. Construct
`Δ(a)=a⊗a−q c*⊗c` and `Δ(c)=c⊗a+a*⊗c`, prove coassociativity,
invertibility of the conjugate matrix and cancellation. On the core
prove `ε(a)=1`, `ε(c)=0`, `S(a)=a*`, `S(c)=−q c` and
`S(c*)=−q⁻¹c*`. Construct its ordered monomial basis, coefficient
core and concrete star representations. Prove `SU_1(2)≃C(SU(2))`
as compact matrix quantum groups; q=0 is not in this quantum-group family.

For a nonempty finite index set of cardinality n, take invertible complex
F with `F bar F=cI`, c real and nonzero. Construct the free orthogonal
quantum group O_F^+, with universal A_o(F) generated by a unitary matrix
u and relation `u=F bar u F⁻¹`. Prove the universal norm is finite,
the algebra nonzero, and Δ(u_ij)=Σ_k u_ik⊗u_kj defines a compact
matrix quantum group. Build its Hopf core and generator maps. Prove
presentation comparisons under nonzero scalar rescaling of F and unitary
basis changes, with the induced transformation of the fundamental matrix.
Construct the cup `E(1)=Σ_ij F_ji e_i⊗e_j` and verify
`(E*⊗1)(1⊗E)=cI`. Retain the sign of c. Normalize the two conjugate
solutions and identify their self-duality map r with CA2a's signed
variant: the normalized cup E/√|c| has zigzag sign ε=sign(c),
corresponding to r̄r=εφ and to J²=ε in the finite-Hilbert realization.
Here `J(v)=F conjugate(v)/sqrt(|c|)` is an antilinear map. Prove it
is antiunitary precisely when F is proportional to a unitary; compare
the general map through Rep(O_F^+)'s chosen unitary dual functor and its
fibre Hilbert metrics.
Derive `d(u)≤‖E(1)‖²/|c|`, with
`‖E(1)‖²/|c|≥n` by AM–GM. Prove equality in this latter inequality
iff F is proportional to a unitary. Q7 proves irreducibility and then
standardness of this solution and the intrinsic-dimension equality.
Symmetric self-duality
and negative Frobenius–Schur sign are distinct; positive symmetric TL
cups cannot silently replace the signed conjugate data.

## Q6. Tannaka–Krein reconstruction

Let C be an essentially small rigid C*-tensor category, closed under
finite sums and subobjects, with simple unit, and a unitary fiber functor
τ:C→Hilb_f. Use a skeleton in `Type u` and form the coefficient algebra
in the same controlled universe; prove independence of the skeleton.
Define its coefficient algebra by generators and relations imposed by all
intertwiners, multiplication, star, Δ, ε and S. Prove the Hopf *-laws
and that its coefficients are unitary. Apply Q4's *proved* compact-type
positivity and completion theorems. Construct a unitary monoidal
equivalence C≃Rep_f(G) and the natural unitary monoidal comparison of τ
with the forgetful functor. Prove full faithfulness by recovering exactly
the prescribed intertwiner spaces, and essential surjectivity through
finite sums, conjugates and subobjects.

Give the concrete finite-generator construction: spaces
`C(k,l)⊆B(H^⊗k,H^⊗l)` contain identities and are closed under
tensor product, composition and dagger; there is a cup
`R:ℂ→H⊗H` with `(R*⊗1)(1⊗R)=±1`. Construct the tensor algebra
of coefficient functionals, with
A=T(B(H)*), A_(≤n)=⊕_(k=0)^n B(H^⊗k)* and finite intertwiner
commutant B_n. Construct the bialgebra on A with
Δ(u_ij)=Σ_k u_ik⊗u_kj and ε(u_ij)=δ_ij. Identify the degree-k
part with the dual coalgebra of B(H^⊗k), preserving the
U_13 V_23 tensor coefficient convention. Construct its annihilator subspace/coideal
I_n=B_n^⊥ inside A_(≤n). Prove the compatibility
I_(n+1)∩A_(≤n)=I_n using VonNeumannAlgebras V1's
finite-dimensional bicommutant theorem, and prove
A_(≤m)I_n+I_n A_(≤m)⊆I_(m+n). Prove counit vanishes on I_n
and its coproduct lies in I_n⊗A_(≤n)+A_(≤n)⊗I_n. The finite
truncation is a coalgebra, with no assertion that it is a subalgebra.
Prove the increasing union I=⋃_n I_n is a bi-ideal of the full A, and
construct the induced finite-stage injections A_(≤n)/I_n→A/I.
For H=0 construct the quotient ℂ and trivial compact quantum group
directly, including its degree-zero coefficient comparison. For dim H>0 pass through
Q5's free orthogonal Hopf core: write
R=Σ_(i,j) F_ji e_i⊗e_j with F bar F=±1, and construct the
bi-ideal I_F generated by its cup relations. Prove I_F⊆I and
A/I_F≅Pol(O_F^+) (Malacarne Lemma 2.1), preserving coefficient
generators. Transport the star and antipode through this comparison;
prove the remaining ideal a Hopf *-ideal. Use finite-dimensional
bicommutants to show no extra intertwiners have been imposed. Construct
the generator reduction by adjoining conjugates and finite sums.

For an arbitrary generating set, use its finite subsets, their full rigid
C*-subcategories, the compatible coefficient embeddings and filtered
union of Hopf *-cores. Prove every object and intertwiner appears in
such a finite subcategory. Construct the canonical isomorphism from
this filtered union to the generators-and-relations algebra defined
above, preserving every coefficient, Hopf structure and the
fiber-compatible representation equivalence. The resulting equivalence
has the stated generality. Do not assert a single finite-dimensional
fundamental matrix for an infinitely generated C.

Prove uniqueness up to Hopf *-isomorphism with its fiber-compatible
representation data, and naturality under unitary equivalences of
fiber-functor pairs. Compare universal and reduced reconstructed compact
quantum groups using Q4; do not turn algebraic uniqueness into a claim
of a unique C*-norm. For symmetric fiber data preserving the usual Hilbert flip, prove
the reconstructed coefficient algebra commutative. Prove every
commutative compact quantum group is C(G): recover a compact Hausdorff
space by Gelfand duality and associative multiplication from Δ.
Cancellation spans separate pairs and imply both topological cancellation
laws. Prove a compact Hausdorff cancellative semigroup is a group:
construct an idempotent in each closed cyclic subsemigroup using a
minimal compact subsemigroup; cancellation makes it the global identity,
and compactness of powers supplies inverses. Construct the identity
and inverse without assuming boundedness of the core ε and S.
Prove the resulting counit/inversion agree with the core maps, and
that the representation equivalence recovers its original fiber data.
Ordinary compact-group Haar has full support, so every commutative
compact quantum group has faithful Haar. Compare this reconstruction
with Q4's single classical-group completion theorem A_u=A_r=C(G),
including its counit, inversion and original fibre functor.

## Q7. SUq(2), free orthogonal fusion and Haar calculations

For SUq(2) construct exactly one irreducible r_k of Hilbert dimension
k+1 for every k≥0, the conjugate solutions, matrix coefficients and
Clebsch–Gordan intertwiners. Prove the SU(2) fusion rules and completeness,
including the classical endpoint and the negative-q signed duality.
For `0<|q|<1`, compute the Haar functional on the ordered monomial basis
and prove its functional-calculus consequence
`h(f(c*c))=(1−q²)Σ_(j≥0)q^(2j) f(q^(2j))` for continuous f.
Derive the normalized F matrices, quantum dimensions, modular character
values and modular group on generators. At q=1 identify r_1 with the
defining matrix action on ℂ², and hence with CompactGroups' su2Irrep 1
by an actual unitary intertwiner. Derive Haar integration of all ordered
monomials from the SU(2) unit-sphere coordinates
a=√(1−t)z, c=√t w, 0≤t≤1 and z,w∈𝕋: prove normalized invariant
measure has pushforward dt dz dw, using the sphere-volume Jacobian
and invariance. Phase integration gives the monomial values and
`h(f(c*c))=∫_0^1 f(t)dt`, including non-class functions.
For q=−1 construct the
reduced matrix-function model `a=sqrt(1−t) z σ₃`,
`c=sqrt(t) w σ₁`, (t,z,w)∈[0,1]×𝕋², and prove the Haar
state is the integral of the normalized 2×2 trace with dt and Haar
dz,dw. Prove the core representation faithful and the invariant
monomial identities; in particular `h(f(c*c))=∫_0^1 f(t)dt`.
Neither endpoint is obtained by substituting into a divergent series.
Prove SUq(2) coamenable throughout `0<|q|≤1`. In the interior
use the weighted shift model on ℓ²(ℕ×ℤ) and identify its kernel with
the Haar null ideal. Write a=a₀⊗1 with a₀=S*D on ℓ²(ℕ), where
D−1 is compact. Thus a₀ belongs to C8's Toeplitz algebra and its
symbol is the symbol of S*. Compose that symbol map with evaluation
at z=1 to obtain a character χ with χ(a₀)=1. Transport χ along
the concrete isomorphism 𝒯≃𝒯⊗1⊆B(ℓ²(ℕ×ℤ)), extend this state
by C2, and restrict it to the reduced image. Apply Q4's character
criterion. Compactness of D−1 is used on ℓ²(ℕ).
Use C4's multiplicative-domain theorem and the generator relations to
prove this state is a character: its value a=1 forces both a-defects
and c*c=cc* to have value zero, so a,c lie in its multiplicative domain.
At q=1 use the classical comparison; at q=−1 identify the above
faithful-Haar matrix-function model with the reduced completion and
take its character at t=0, z=1 on the σ₃ eigenvalue-one component.

For O_F^+ and n≥2 prove Banica's representation theorem. Construct the
concrete tensor category generated by its signed cup/cap maps and identify
it with the entire intertwiner category by Q6 and the universal
presentation. Prove End(u)=ℂ, hence the normalized conjugate solution
from Q5 is standard and `d(u)=‖E(1)‖²/|c|`. For cup-cap projections on adjacent tensor factors prove
`p_i²=p_i*=p_i`, distant commutation and
`β p_i p_(i±1) p_i=p_i`, with
`β=c⁻²‖E(1)‖⁴=d(u)²`. Compare with the TL positive quotient while
retaining the signed conjugate structure. Construct the Catalan dimension
upper bound. Choose real q with `0<|q|≤1` by `|q|+|q|⁻¹=d(u)` and
`sign(q)=−sign(c)`, and use the SUq(2) signed cup, Haar moment
crosswalk. The signed algebraic loop is δ=−(q+q⁻¹)=sign(c)d(u),
whereas A1–A6's positive-loop parameter is d(u). Identify normalized
projections p_i in both presentations; the signed generator is δ p_i
and the positive generator is d(u)p_i. Prove the generator rescaling,
normalized Markov trace and quotient comparison, keeping the signed
cup/duality data separate from that algebra isomorphism. Use the Haar moment
calculation and faithful TL trace form to transfer the matching lower
bound. Prove the positive quotient comparison and the intertwiner
dimension equality, then build
the irreducibles/Jones–Wenzl ranges. Prove all irreducibles are r_k,
k≥0, r_0=1,r_1=u, with

`r_k⊗r_l ≃ r_|k−l| ⊕ r_|k−l|+2 ⊕ … ⊕ r_(k+l)`.

Separate the dimension recurrences: Hilbert dimensions have
`a_0=1,a_1=n,a_(k+1)=n a_k−a_(k−1)`; intrinsic dimensions
replace n by d(u). Prove equality of the two scales exactly when F
is proportional to a unitary, and work out a non-Kac admissible F.
Prove the Haar distribution of the self-adjoint fundamental character
χ=Σ_i u_ii is the centered variance-one semicircular law on [−2,2],
using its Catalan moments and compactly supported moment uniqueness.
For n>2 deduce failure of coamenability: ε(χ)=n whereas the reduced
Haar spectral support is [−2,2]. Supply the faithful-Haar spectral
support argument and the invertibility contradiction. For n=2 prove
that nonzero scalar rescaling and unitary congruence `F↦VFVᵗ`
reduce every admissible F to `[[0,1],[−q⁻¹,0]]` for a real
`0<|q|≤1`, and construct the induced compact-quantum-group
isomorphism `O_F^+≃SUq(2)`. At n=1 prove instead
`A_o(F)=C*(ℤ/2)`, with two irreducibles and two-point character law;
the infinite fusion and semicircular assertions do not hold there.

## Q8. Generic U_q(sl₂), signed modules and integrability

Work over ℂ with q≠0 and q^r≠1 for every positive integer r. In particular
q≠±1. Modules in this lane are algebraic modules, with no topology or
finite-dimensional assumption unless stated. Pin
[r]_q=(q^r−q^(−r))/(q−q⁻¹) for r∈ℤ; prove its Laurent-polynomial
formula, recurrence, sign law and nonvanishing for r≠0.

1. **Presentation, PBW and Hopf API.** Construct U_q as the native
   `RingQuot` of `FreeAlgebra ℂ` on E,F,K,K⁻¹, with
   KK⁻¹=K⁻¹K=1, KE=q²EK, KF=q⁻²FK and
   EF−FE=(K−K⁻¹)/(q−q⁻¹). Prove the universal property for actual
   generator tuples in an arbitrary complex algebra, extensionality on
   generators and the inverse-K commutation formulas. Construct the basis
   F^a K^b E^c, (a,b,c)∈ℕ×ℤ×ℕ, including unique coefficient expansion,
   subalgebra inclusions, triangular decomposition and the domain theorem.
   Own a reusable σ-derivation Ore extension over a k-algebra R on finitely supported
   nonnegative coefficient sequences: T r=σ(r)T+δ(r),
   with an explicit k-algebra endomorphism σ and k-linear δ satisfying
   δ(rs)=σ(r)δ(s)+δ(r)s. Require σ injective for leading-term/domain
   results. The left-coefficient monomial basis holds for every σ;
   require σ bijective for the right-coefficient monomial basis.
   Prove associative multiplication, coefficient
   recursion, leading term, the monomial basis and its universal property;
   identify δ=0 with Mathlib's `SkewPolynomial` and its
   `MulSemiringAction (Multiplicative ℕ)` convention under a local instance
   induced by the explicit σ parameter; use no global q-dependent instance.
   For PBW start with ℂ[K,K⁻¹], adjoin F with σ_F(K)=q²K, then E
   with σ_E(K)=q⁻²K, σ_E(F)=F, δ_E(K)=0 and
   δ_E(F)=(K−K⁻¹)/(q−q⁻¹). Prove these maps respect the first
   extension's relations and extend them by the Ore universal property:
   the triangular-matrix algebra map r↦[[σ_E(r),δ_E(r)],[0,r]]
   supplies the σ_E-derivation extension. Identify the tower presentation
   with the quotient. Its left-coefficient basis K^b F^a E^c equals
   q^(−2ab) F^a K^b E^c, hence yields the specified PBW basis.
   Under `[Fact (q≠0)]`, construct the native `HopfAlgebra` instance
   on this quotient; all coproduct/counit/antipode definitions and instance
   synthesis use that same hypothesis. Its formulas are
   ΔK=K⊗K, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F,
   εK=1, εE=εF=0, S(K)=K⁻¹, S(E)=−K⁻¹E and S(F)=−FK.
   Verify relations and all Hopf identities through the universal property.
   Give the antipode inverse and its square, automorphisms E↦tE,F↦t⁻¹F
   for t≠0, and the algebra isomorphism from the q⁻¹ presentation
   sending K to K⁻¹ and E,F to E,F. This map is not a Hopf isomorphism
   for the pinned coproduct; state and prove its transported coproduct.

2. **Modules, weights and highest-weight construction.** Use actual native
   complex modules and U_q actions, equivalently complex algebra maps to
   `Module.End ℂ V`; construct intertwiners, kernels, quotients, sums,
   arbitrary algebraic direct sums. Tensor and dual actions consume item 5’s
   single generic Hopf-module construction after item 1’s Hopf structure;
   this item’s weight and highest-weight arguments require no tensor/dual input.
   Develop K eigenspaces and finite-dimensional generalized eigenspaces,
   with E and F shifting λ to q²λ and q⁻²λ. Define locally nilpotent
   E and F by eventual annihilation of each vector, and local finiteness
   by finite dimension of each cyclic U_q submodule.
   Construct the Verma module for every λ≠0 as the quotient by the left
   ideal UE+U(K−λ), with basis F^jv, j≥0; give its action, singular
   vectors, submodules and simple quotient. For m≥0 and ε∈{1,−1}
   construct L_m^ε with basis v₀,…,v_m and
   K v_j=εq^(m−2j)v_j, F v_j=[j+1]_q v_(j+1),
   E v_j=ε[m−j+1]_q v_(j−1), with out-of-range vectors zero.
   Prove the relations, simplicity, pairwise nonisomorphism and Schur
   endomorphism algebra ℂ. Classify every finite-dimensional simple as
   exactly one L_m^ε, deriving existence of a highest vector from the
   finite K spectrum without assuming K is diagonalizable beforehand.

3. **Casimir and finite-dimensional complete reducibility.** Construct
   Ω=FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)², prove centrality and prove the whole
   center is ℂ[Ω] by PBW/leading-coefficient reduction. Its scalar on
   L_m^ε is ε(q^(m+1)+q^(−m−1))/(q−q⁻¹)². Prove these scalars
   distinct for all (m,ε) under the stated generic hypothesis.
   Prove every finite-dimensional U_q module is semisimple, including
   ones initially given with generalized K weights. Split into Casimir
   primary blocks; in a block with composition factors L_m^ε, the top
   generalized K-weight space W has dimension equal to their multiplicity
   by a composition series and exactness of generalized eigenspaces.
   Prove E W=0 and F^m injective on W. For the latter use
   W_r=ker(F^r)∩W: the commutator sends X_r W_r into W_(r−1),
   where X_r=(q^(1−r)K−q^(r−1)K⁻¹)/(q−q⁻¹) is invertible on
   W for 1≤r≤m. Induction gives W_r=0. Prove the commutator formula
   E F^r=F^r E+[r]_q F^(r−1)
   (q^(1−r)K−q^(r−1)K⁻¹)/(q−q⁻¹).
   Apply it at r=m+1 and F^(m+1)W=0 to force K²=q^(2m) on W.
   The two roots are distinct and the block has chosen sign ε, so
   K=εq^m on W. The strings F^jW then give the actual direct sum
   of L_m^ε. Derive diagonalizability of K, splitting of short exact
   sequences, uniqueness of multiplicities and Hom/endomorphism formulas.

4. **Arbitrary local finiteness and the type-1 distinction.** Prove an
   arbitrary locally finite module is an algebraic direct sum of the signed
   finite simples. In the Zorn argument a finite cyclic submodule intersects
   the maximal semisimple sum in a finite submodule, splits by item 3, and
   supplies a new simple complement if the sum is not all V. Prove the
   converse and the evaluation isomorphism
   ⊕_(m,ε) (L_m^ε⊗Hom_U(L_m^ε,V))≃V, with actual commuting actions.
   Define type 1 by K diagonalizable with eigenvalues in {q^k:k∈ℤ},
   using an algebraic eigenspace direct sum even for infinite V. Prove:
   type 1 plus locally nilpotent E,F is equivalent to a direct sum of
   L_m^+ and to local finiteness plus type 1. For the forward implication
   PBW bounds the E powers on each vector, the F powers on each resulting
   E^cv, and the K powers on their finite weight spans. Separately prove
   the signed-weight version, with eigenvalues in {±q^k}, characterizes
   unrestricted local finiteness when combined with E,F local nilpotence.
   Exhibit the one-dimensional L_0^- (K=−1,E=F=0): it is locally finite
   and locally nilpotent but not type 1. Thus the unsigned integral-weight
   condition is not equivalent to unrestricted local finiteness.

5. **Tensor, dual and explicit Clebsch–Gordan theory.** For any Hopf algebra
   H over a field k, define `FiniteHopfModuleCat k H` on a type synonym
   of native `CategoryTheory.ObjectProperty.FullSubcategory` on
   `ModuleCat.{u} H` for k:Type u and H:Type v, whose restriction
   along `algebraMap k H` is finite-dimensional over k. The carrier
   universe is u, so the unit k, k-duals and tensor-over-k stay in the
   category and match native FDRep. Construct the finite-basis shrink
   equivalence from higher-universe finite modules to these small models,
   with linear comparison maps and transported H-actions, following native
   `FDRep.ofShrink` and `FDRep.ofShrinkEquiv`. Prove compatibility with
   the tensor, dual and forgetful structures constructed here. Use native
   `ModuleCat.restrictScalars` and its morphisms; the forgetful functor
   lands in native `FGModuleCat.{u} k`. Supply the explicit category
   instance on the synonym, the faithful forgetful functors to
   `ModuleCat.{u} k` and `FGModuleCat.{u} k`, and their compatibility.
   Construct its
   `MonoidalCategory` structure with tensor over k through the coproduct,
   and the counit unit action; do not inherit tensor over H from a
   commutative-H ModuleCat instance. Build tensor intertwiners,
   associator/unitors and the monoidal forgetful comparison. For H=k[G],
   restrict native `Rep.equivalenceModuleMonoidAlgebra` to finite objects
   and identify this monoidal category, duals and trivial-pivot structure
   with PivotalSpherical Layer7’s `FDRep k G`. Consume Layer7’s
   `RigidCategory (FDRep k G)`, constructed from its canonical
   `LeftRigidCategory (FGModuleCat k)` and native `Action` rigid instances,
   together with Mathlib’s existing right duals. For H=k[G], prove the
   generic S⁻¹ left dual and its evaluation/coevaluation agree with these
   canonical duals, using S⁻¹=S. Prove the monoidal
   equivalence comparison rather than treating the native unbundled
   categorical equivalence as already monoidal. Construct
   right duals via S with native `ExactPairing` triangle identities.
   Given `Function.Bijective (HopfAlgebra.antipode)`, construct its
   inverse left dual and named `RigidCategory` data, installed locally
   in every statement using its left duals, pivot, pivotal traces,
   dimensions or dual-compatible Clebsch–Gordan and 6j maps. For g:H with native
   [`IsGroupLikeElem k g`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Coalgebra/GroupLike.lean)
   and S²=Ad(g), consume
   `GroupLike.toUnits k ⟨g,hg⟩` and native antipode/inverse laws.
   Prove Ad(g) bijective and deduce S bijective from bijectivity of S∘S.
   Supply that proof to the named rigid data, then construct `PivotalCategory` by
   j_V(v)(φ)=φ(gv), proving H-linearity and monoidal naturality.
   Instantiate this generic category at U_q and g=K⁻¹.
   Construct normalized
   highest vectors and the actual intertwiners giving
   L_m^ε⊗L_n^δ≃⊕_(j=0)^min(m,n) L_(m+n−2j)^(εδ).
   Pin the highest vector as Σ_(i=0)^j α_i v_i⊗v_(j−i), with
   α₀=1 and α_(i+1)=−δ q^(m−2i)
   [n−j+i+1]_q/[m−i]_q α_i for 0≤i<j. Prove this recurrence
   directly from the specified ΔE and ladder actions; denominators
   are nonzero in this range. Extend its highest-vector map along the
   normalized F ladder to each summand.
   For r≥0 pin the symmetric quantum binomial formulas
   Δ(E^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q
   E^s K^(r−s)⊗E^(r−s) and
   Δ(F^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q
   F^(r−s)⊗F^s K^(−(r−s)), deriving them from q²-commutation.
   Prove inverse Clebsch–Gordan maps, naturality and the 6j
   change-of-decomposition matrices on triple products in the α₀=1
   and normalized F-ladder bases. Prove their Biedenharn–Elliott
   pentagon identity on L_a^ε⊗L_b^δ⊗L_c^ζ⊗L_d^θ under the actual associator,
   and compatibility with dual evaluation and coevaluation.
   Compare both tensor orders of the sign representation,
   retaining their basis rescalings. Prove finite duals are the corresponding
   signed simples by explicit antipode intertwiners, comparing the
   U_q right/left duals and pivot with the generic construction above. Identify PivotalSpherical's rightTrace(f)=tr_V(gf) and
   leftTrace(f)=tr_V(g⁻¹f), with its right-dual convention.
   Prove they coincide for all module endomorphisms by the finite
   semisimple decomposition, giving the spherical structure. Give
   ordinary weight characters and the representation ring.
   The common pivotal dimension is ε[m+1]_q on L_m^ε;
   it is [m+1]_q on the positive family. These statements
   use algebraic tensors and the constructed Hopf module actions, independent
   of Q1–Q7's C*-tensor-category construction.

6. **Compact real form and the SUq(2) comparison.** For real 0<q<1
   construct K*=K, E*=KF, F*=EK⁻¹ and prove Hopf/star compatibility.
   On each L_m^+ construct the positive invariant inner product with
   h₀=1 and h_j/h_(j−1)=[m−j+1]_q/([j]_q q^(m−2j)). Prove its
   star relations and K positivity. Build the coefficient Hopf pairing
   and monoidal equivalence between finite positive-K modules
   (finite direct sums of the L_m^+) and
   Q5/Q7's SUq(2) finite unitary corepresentations, comparing the actual
   fundamental matrix [[a,−q c*],[c,a*]], cup, antipode and conjugate
   conventions in the orthonormal basis v_j/√h_j. The matching cup,
   written in the original ladder basis, is proportional to
   v₀⊗v₁−q v₁⊗v₀. Compare the pivotal and positive intrinsic dimensions.
   On the orthonormal fundamental basis pin the pairing by
   (⟨K,u_ij⟩)=diag(q,q⁻¹),
   (⟨E,u_ij⟩)=[[0,q^(−1/2)],[0,0]], and
   (⟨F,u_ij⟩)=[[0,0],[q^(1/2),0]]. These fix its values on
   a,c,a*,c* through the stated fundamental matrix. Prove both Hopf
   pairing equations and the star/antipode comparison from these values,
   then extend to all finite coefficients and intertwiners.
   Negative-K signed modules remain in the algebraic classification; they
   are not identified with this positive-K compact representation category.

7. **Classical finite-module comparison.** For the positive family write
   its matrices over native ℤ[v,v⁻¹], with the Laurent-polynomial quantum
   integers. Evaluate v=1 on E,F and the diagonal operator with entries
   [m−2j]_v. Prove these become the classical sl₂ highest-weight m module
   and construct the matrices-to-`LieModule` adapter on native
   `sl (Fin 2) ℂ`, pinning E,F,H through `IsSl2Triple`. Give an actual
   module isomorphism to RepresentationTheory/LieHighestWeight's
   highest-weight m action, retaining the basis normalization rather
   than identifying two separately chosen ladder or symmetric-power bases.
   This is an explicit representation-family specialization; substitution
   into U_q's denominator presentation does not define U(sl₂).

The order within Q8 is presentation/PBW/Hopf → weights/Verma/simple modules
→ Casimir/finite splitting → local finiteness and tensor theory → the
compact/classical comparisons. Item 6 additionally consumes Q5/Q7's compact
coefficient core; Q1–Q7 have no dependency on Q8. Generic higher-rank and
root-of-unity quantized enveloping algebras are separate from the rank-one
classification specified here. Q9 consumes the general finite-type algebra
and highest-weight modules from their named owners; Q1–Q8 do not depend on Q9.

## Q9. Finite-type quantum representation categories are ribbon

Construct `RepUqg` and its `RibbonCategory` structure. This is the algebraic
input to quantum knot invariants: the output is a ribbon category with the
simple object `V_q(λ)` for every dominant integral weight in the chosen
lattice. The free-ribbon/tangle coherence theorem, the tangle evaluation
functor and its isotopy invariance are outside this section's scope.

**Suppliers and order.** Consume Q8.5's generic `FiniteHopfModuleCat` and its
named monoidal, rigid and pivotal constructions over a field; consume
[PivotalSpherical Layers 0–2 and 10](../PivotalSpherical/README.md#layer-10-the-synoptic-chart-of-tensor-categories-hpt-figure-2)
for `PivotalCategory`, traces, `BalancedCategory` and `RibbonCategory` and
their compatibility. The algebra and modules are supplied by
[QuantumEnvelopingAlgebras QEA0–QEA1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d001c02ae7dc3226e33aa27ffccdae13913984d1/TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md#qea1-generic-drinfeldjimbo-algebra-and-hopf-structure)
(root datum, actual quotient/Hopf maps, root grading and nondegenerate
positive/negative pairing) and
[KacMoody KM5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d42952ae2f0e66d251ff3660c84416727432323e/TauCetiRoadmap/KacMoody/README.md#km5-quantum-integrable-modules-and-actual-crystal-bases)
(type-1 highest modules, classical character comparison and complete
reducibility), restricted to finite type. Their proposed roadmaps are
[#1125](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1125) and
[#1124](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1124).
Q9 owns the remaining R-matrix construction and its categorical assembly;
reuse KM5's quasi-R coefficients and pairing identities, with explicit
transport to the coproduct below. QEA's algebra and Q8's generic Hopf-module
category are built independently of this ribbon construction. Crystal/path
comparison and root-of-unity specialization are not premises of Q9.

1. **Datum, scalars and category.** Take a finite-type semisimple root datum
   `(A,X,Y)` in QEA0's conventions, retaining its actual character and
   cocharacter lattices, with rank X=rank Y=|I|, and allowing products
   and the empty root datum.
   On `X ⊗ ℚ` use the Weyl-invariant form with
   `(αᵢ,λ)=dᵢ⟨λ,hᵢ⟩`; construct it from the nonsingular finite Cartan matrix.
   Put `ρ=½Σ_(β>0)β`, in the rational weight space, not necessarily in X.
   Choose N>0 clearing the denominators of this form on `X+ℤρ` and work
   over `k(t)`, for any characteristic-zero field k, with `q=t^N` and
   `qᵢ=q^{dᵢ}`. Define `q^r=t^(Nr)` for the rational exponents used here
   and prove its multiplicative laws. This is a formal generic parameter.
   Use the fixed Hopf convention
   `ΔEᵢ=Eᵢ⊗1+Kᵢ⊗Eᵢ`, `ΔFᵢ=Fᵢ⊗Kᵢ⁻¹+1⊗Fᵢ`, with
   `Kᵢ=K_(dᵢhᵢ)`. Define `RepUqg` as the full subcategory of
   `FiniteHopfModuleCat k(t) U_q(A,X,Y)` with an X-weight decomposition
   on which `K_y` acts at weight λ by `q^⟨λ,y⟩`. Prove closure under
   tensor, unit and both antipode duals, with finite weight support and
   locally nilpotent simple root operators. Restrict the actual monoidal
   and rigid data and construct the monoidal forgetful functor to finite
   base-field modules. Compare this finite category with KM5's integrable
   category; prove its simples are the absolutely simple `V_q(λ)`, λ∈X⁺,
   every object is a finite direct sum of them, and `End(𝟙)≃ₐ[k(t)]k(t)`.

2. **The R operators and braiding.** Construct the root-graded canonical
   tensors from QEA1's nondegenerate pairing, prove independence of dual
   bases, and derive their intertwining and coproduct identities. Combine
   them with the weight factor `q^(μ,ν)` to construct invertible linear
   operators `R_(V,W)` on the underlying `V⊗W`. Pin the triangular
   convention: on `V_μ⊗W_ν` the diagonal term is `q^(μ,ν)·id` and every
   remaining term lands in `V_(μ−β)⊗W_(ν+β)` for β∈Q₊, β≠0. Derive the
   coefficients for this coproduct rather than copying the opposite
   convention. Prove each vector has only finitely many nonzero terms,
   with finite-support bounds, naturality for intertwiners, and an actual
   inverse. Thus no claim that R lies in the ordinary algebraic `U⊗U`
   is needed. If completed algebra notation is used, construct its action
   on these modules and its tensor/duality operations first.
   Prove `R Δ(a)=Δᵒᵖ(a) R` for every a, both quasitriangular identities
   on triple tensor products (with associators), and the unit identities.
   Construct the intertwining isomorphisms `c_(V,W)=flip ∘ R_(V,W)` and
   prove naturality and both hexagons, yielding `BraidedCategory RepUqg`.
   Record the highest-vector normalization
   `c(v_λ⊗v_μ)=q^(λ,μ)(v_μ⊗v_λ)` and the inverse braiding explicitly.

3. **Standard pivot and ribbon twist.** Construct the toral element
   `y_(2ρ)∈Y` determined by `⟨λ,y_(2ρ)⟩=(λ,2ρ)`; prove integrality by
   writing it as the sum of the positive coroots weighted by
   `d_β=(β,β)/2`. Prove `g=K_(−y_(2ρ))` is grouplike and
   `S²=Ad(g)`, and use Q8.5 to construct the pivotal structure
   `j_V(v)(φ)=φ(gv)` on the chosen rigid data. Construct a natural
   U-linear automorphism θ of the identity with
   `θ_(V_q(λ))=q^(λ,λ+2ρ)·id`. Give it as an operator on arbitrary
   objects, prove independence of semisimple decomposition, and prove
   `θ_𝟙=id`,
   `θ_(V⊗W)=c_(W,V) ∘ c_(V,W) ∘ (θ_V⊗θ_W)` and
   `θ_(V*)=(θ_V)*`. These identities construct the named
   `RibbonCategory RepUqg` structure, against PivotalSpherical's API.
   Identify its induced pivotal structure with j, not just an unrelated
   spherical structure. For the standard ribbon-element convention write
   `v=θ⁻¹`: recover its centrality, counit, antipode invariance and
   `Δv=(v⊗v)(R₂₁R)⁻¹` as identities of the constructed operators.
   Use the finite-duality formula for the Drinfeld isomorphism to compare
   the balancing twist with θ. In particular retain the choice of
   ribbon element: changing it by a central grouplike of order two can
   change the pivot, dimensions and signs.

4. **Traces, dimensions and scalar extension.** Identify the right and
   left pivotal traces of an intertwiner f with `Tr(gf)` and `Tr(g⁻¹f)`
   in Q8.5/PivotalSpherical's right-dual convention. Prove they agree,
   that the dimension of `V_q(λ)` is the specialized Weyl character
   `Σ_μ mult_λ(μ) q^(2ρ,μ)`, and the quantum Weyl product
   `∏_(β>0) [⟨λ+ρ,β∨⟩]_(q_β)/[⟨ρ,β∨⟩]_(q_β)`, where
   `q_β=q^{d_β}` and the brackets are symmetric quantum integers.
   Derive its nonvanishing at the formal generic parameter, tensor
   multiplicativity and dual invariance using the native trace API.
   Construct compatibility of R, θ, pivot and traces with extensions
   of k and with compatible enlargements of N, using explicit monoidal
   base-change functors and comparisons of the transported duals and twists.
   Evaluation at a complex
   algebraic parameter is not a field map from `ℚ(t)`; do not assert
   such a specialization or a root-of-unity ribbon category from this
   formal-field result.

5. **Convention checks.** In type A₁ compare to Q8's positive family,
   with `(ω,ω)=½`. For `s=q^(1/2)`, on the fundamental basis `+,-`
   require
   `c(+⊗+)=s(+⊗+)`, `c(−⊗−)=s(−⊗−)`,
   `c(+⊗−)=(s−s⁻³)(+⊗−)+s⁻¹(−⊗+)`, `c(−⊗+)=s⁻¹(+⊗−)`.
   Prove these matrices intertwine Q8's coproduct, give the positive
   highest-vector eigenvalue s and singlet eigenvalue `−s⁻³`, and
   compute `θ_V=s³·id`, `dim_q(V)=q+q⁻¹`, and
   `θ_(V_q(mω))=q^(m(m+2)/2)·id`. Verify the trivial and empty-datum
   cases, and a nonsimply-laced rank-two case retaining its two qᵢ's.
   Q8's pivot is `K⁻¹`, matching g here. The standard ribbon choice
   has quantum dimension `[m+1]_q`; comparison with the signed
   Kauffman/Temperley–Lieb convention must exhibit the parameter,
   duality and ribbon-element changes rather than identify them silently.

## Sources and API evidence

- Q9: Chari–Pressley, *A Guide to Quantum Groups*, §§4.2,5.3,8.3
  (especially Corollary 8.3.16), and Kassel, *Quantum Groups*,
  Chapters VIII and XIV: R-matrices, ribbon Hopf algebras and their
  module categories. Match the stated coproduct and dual conventions.
- Q9: Snyder–Tingley, [*The half-twist for U_q(g) representations*](https://arxiv.org/abs/0810.0084),
  §§2,3.1,3.4 and Theorem 3.16, for completions, the standard ribbon
  element and its alternatives. Their displayed coproduct is opposite
  to Q8/QEA's: use `R_source,21` and transport the antipode/duality data;
  our categorical twist is the inverse of the standard ribbon element.
  These comparisons do not require constructing half-twists.

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS,2008),
  Proposition 2.2.4 and Remark 2.2.2(iv)(c), pp.50–51, for algebraic
  integral faithfulness and its strict-positivity consequence;
  Chapters 3 and 5: Definitions 5.1.1,5.1.4, Theorem 5.1.6;
  Theorem 5.3.3, Propositions 5.3.7–5.3.8; Theorems 5.4.1,5.4.3,5.4.5.
  Theorem 3.2.12 proves coefficient-based compact-type positivity;
  Propositions 3.2.9,3.2.17 and Theorem 3.2.19 give the two F conventions
  and modular characters. Chapter 6 §§2,4 supplies matrix examples.
- Bédos–Murphy–Tuset, [*Co-Amenability of compact quantum groups*](https://arxiv.org/abs/math/0010248),
  Theorems 2.2,2.8,3.6 and Corollary 2.9, pp.6,10–11,18–19,
  for the general completion/counit/character criteria; Theorem 2.12
  and Corollary 2.13, pp.13–14, for the signed interior SUq(2) result.
  Timmermann Proposition 2.2.4, pp.49–51, supplies algebraic integral
  faithfulness; strict positivity here also uses the explicit positive
  Haar-functional hypothesis. It is not analytic Haar faithfulness on
  an arbitrary completion.
- The q=−1 matrix-function model, its monomial invariance calculation
  and endpoint character are direct constructions specified here.
  The interior geometric-series Haar formula is not applied at q=±1.
- Malacarne, [*Woronowicz Tannaka–Krein duality and free orthogonal quantum
  groups*](https://doi.org/10.7146/math.scand.a-97320), Theorems 1.1,4.1,
  Lemmas 1.2,2.1,3.1–3.2, pp.152–159: reconstruction, intertwiner
  recovery and the filtered finite-generator argument.
- Banica, [*The representation theory of free orthogonal quantum
  groups*](https://arxiv.org/abs/math/9806063), Proposition 1, Lemma 1,
  Proposition 2 and Theorem 1, pp.1–4. The valid infinite-fusion range
  is n≥2, as in its abstract; the one-dimensional presentation gives
  the separate ℤ/2 boundary case.
- Mathlib `RingTheory/HopfAlgebra`, `RingTheory/Bialgebra`,
  `Algebra/Star/Unitary` and matrix star/tensor APIs fix the algebraic
  vocabulary. Tau Ceti's `Comodule/MatrixCoefficient/{Matrix,FromMatrix}`
  fixes the matrix orientation and inverse-antipode identities.
  Use these existing algebraic interfaces and CA1's analytic dagger
  structure for all required additions.
- Virelizier, [*Quantum groups*](https://www.math.virelizier.com/sources/cours/QuantumGroupM2.pdf),
  §§2.3–4.1, for the fixed rank-one Hopf convention, type-1 finite modules
  and fusion. The Verma/center, signed generalized-weight splitting,
  locally finite/Zorn theorem, explicit Clebsch–Gordan maps, compact
  pairing and classical specialization in Q8 are direct mathematical
  developments specified here, not claims that those source sections
  prove every extension. The reusable σ-derivation construction is also
  specified intrinsically.
- Etingof–Gelaki–Nikshych–Ostrik,
  [*Tensor Categories*](https://math.mit.edu/~etingof/egnobookfinal.pdf),
  as a supplementary reading pointer. Q8 specifies its own module
  classification, quantum function-algebra comparison and conventions.
- Mathlib `Algebra/SkewPolynomial/Basic.lean` constructs the zero-derivation
  skew extension on `SkewMonoidAlgebra`. Q8's σ-derivation construction
  uses its finitely supported coefficient design with an explicit σ and
  proves the comparison for δ=0 under the induced local action instance.
- [AlgebraicAnalysis's derivation-Ore construction](https://github.com/itpplasma/algebraic-analysis/blob/fbb7bb423146c1300807ec971e8a9eb5ac86303b/AlgebraicAnalysis/Ore/Associativity.lean)
  proves faithful normal forms, associativity and the universal property
  for σ=id over a noncommutative coefficient ring. Its LeftPBW and
  IteratedTower files give the coefficient-field basis and commuting-
  derivation tower comparisons. Q8 requires general σ-derivations; it
  extends this mathematical scope and compares the σ=id specialization.
  Integration of that external code requires author coordination; the
  definitions and theorem specifications here do not assume such integration.
